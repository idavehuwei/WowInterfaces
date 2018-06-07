--------------------------------------------------------------------------------------------
-- GridCooldownText module setup
--------------------------------------------------------------------------------------------
local L = AceLibrary("AceLocale-2.2"):new("GridCooldownText")
local AceOO = AceLibrary("AceOO-2.0")
local media = LibStub("LibSharedMedia-3.0", true)

GridCooldownText = Grid:GetModule("GridStatus"):NewModule("GridCooldownText")
GridCooldownText.defaultDB = {
	FontSize = 10,
	Font = "Arial Narrow",
}

local GridFrame = Grid:GetModule("GridFrame")
function GridCooldownText:OnEnable()
	local opt = GridFrame.options.args.advanced.args
	opt["cooldowntext"] = {
		type = "group",
		name = L["Cooldown Text"],
		desc = L["Cooldown Text options."],
		--order = 110,
		args = {
			["fontsize"] = {
				type = "range",
				name = L["Cooldown Text Font Size"],
				desc = L["Adjust the font size for Cooldown Text."],
				--order = 111,
				min = 6,
				max = 24,
				step = 1,
				get = function ()
					return GridCooldownText.db.profile.FontSize
				end,
				set = function (v)
					GridCooldownText.db.profile.FontSize = v
					local font = media and media:Fetch('font', GridCooldownText.db.profile.Font) or STANDARD_TEXT_FONT
					GridFrame:WithAllFrames(function (f) f.frame.IconCDText:SetFont(font, v, "OUTLINE") end)
				end,
			}
		}
	}
	if media then
		opt["cooldowntext"].args["font"] = {
			type = "text",
			name = L["Cooldown Text Font"],
			desc = L["Adjust the font setting for Cooldown Text."],
			-- order = 112,
			validate = media:List("font"),
			get = function ()
				return GridCooldownText.db.profile.Font
			end,
			set = function (v)
				GridCooldownText.db.profile.Font = v
				local font = media:Fetch("font", v)
				local fontsize = GridCooldownText.db.profile.FontSize
				GridFrame:WithAllFrames(function (f) f.frame.IconCDText:SetFont(font, fontsize, "OUTLINE") end)
			end,
		}
	end
end

--------------------------------------------------------------------------------------------
-- utility functions
--------------------------------------------------------------------------------------------
local function getTimeText(time)
	local text
	local minutes = math.floor(time/60)
	local seconds = math.ceil(time % 60)
	if minutes > 89 then
		text = format("%dh", math.ceil(time/3600))
	elseif minutes > 0 then
		--Display: Xm
		text = format("%dm", minutes)
	else
		text = seconds
	end
	return text
end

--------------------------------------------------------------------------------------------
-- FontString Update code
--------------------------------------------------------------------------------------------
local updatePeriod = 0.1
local activeCooldowns = {}

-- Frame to run the OnUpdate script that will update the FontStrings
local onUpdateFrame = CreateFrame("Frame")
local lastUpdate = 0
onUpdateFrame:SetScript("OnUpdate", function() GridCooldownText_UpdateStrings(arg1) end)

-- variable to store the current time, updated each update Period
local currentTime = GetTime()

function GridCooldownText_UpdateStrings( elapsed )
	lastUpdate = lastUpdate + elapsed
	if lastUpdate > updatePeriod then --update needed
		lastUpdate = 0
		
		currentTime = GetTime()
		local activeString = false
		for modelFrame, text in pairs(activeCooldowns) do
			local hideText = true
			if modelFrame:IsShown() then
				if text.start < currentTime then
					local timeLeft = text.endTime - currentTime
					if timeLeft > updatePeriod then
						text:SetText(getTimeText(timeLeft))
						activeString = true
						hideText = false
					end
				else
					hideText = false
					--text:SetText("")
				end
			end
			if hideText then
				text:Hide()
				activeCooldowns[modelFrame] = nil
			end
		end
		if not activeString then
			this:Hide()
		end
	end
end

--------------------------------------------------------------------------------------------
-- f.IconCD.SetCooldown hook
--------------------------------------------------------------------------------------------

local GridCooldownTextFrameClass = AceOO.Class(GridFrame.frameClass)

local _frameClass = nil
if not _frameClass then
	_frameClass = GridFrame.frameClass
	GridFrame.frameClass = GridCooldownTextFrameClass
end

function GridCooldownTextFrameClass.prototype:CreateFrames()
	GridCooldownTextFrameClass.super.prototype.CreateFrames(self)
	local f = self.frame
	
	-- set media based on shared media
	local font = media and media:Fetch("font", GridCooldownText.db.profile.Font) or STANDARD_TEXT_FONT
	local size = GridCooldownText.db.profile.FontSize or 10
	
	-- create cooldown icon text
	f.IconCDText = f.IconCD:CreateFontString(nil, "OVERLAY")
	f.IconCDText:SetAllPoints(f)
	f.IconCDText:SetFontObject(NumberFontNormalYellow)
	f.IconCDText:SetFont(font, size, "OUTLINE")
	f.IconCDText:SetJustifyH("CENTER")
	f.IconCDText:SetJustifyV("CENTER")
	
	f.IconCD.SetCooldownOld = f.IconCD.SetCooldown
	f.IconCD.SetCooldown = function(self, start, duration)
		f.IconCD.SetCooldownOld(self, start, duration)
		local text = f.IconCDText
		if start > 0 and duration >= 2 then
			text.start = start
			text.endTime = start + duration
			if GetTime() > start then
				duration = text.endTime - GetTime()
			end
			text:SetText(getTimeText(duration))
			text:Show()
			activeCooldowns[self] = text
			onUpdateFrame:Show()
		end
	end
end
