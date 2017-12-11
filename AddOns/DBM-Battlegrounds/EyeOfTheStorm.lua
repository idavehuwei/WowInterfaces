-- EyeOfTheStorm mod v3.0
-- rewrite by Nitram and Tandanu
--
-- thanks DiabloHu

local EyeOfTheStorm = DBM:NewMod("EyeOfTheStorm", "DBM-Battlegrounds")
local L = EyeOfTheStorm:GetLocalizedStrings()

EyeOfTheStorm:RemoveOption("HealthFrame")

EyeOfTheStorm:RegisterEvents(
	"ZONE_CHANGED_NEW_AREA",
	"CHAT_MSG_BG_SYSTEM_HORDE",
	"CHAT_MSG_BG_SYSTEM_ALLIANCE",
	"CHAT_MSG_BG_SYSTEM_NEUTRAL",
	"UPDATE_WORLD_STATES"
)

local bgzone = false
local ResPerSec = {
	[0] = 0,
	[1] = 0.5,
	[2] = 1,
	[3] = 2.5,
	[4] = 5,
}
local allyColor = {
	r = 0,
	g = 0,
	b = 1,
}
local hordeColor = {
	r = 1,
	g = 0,
	b = 0,
}

EyeOfTheStorm:AddBoolOption("ShowPointFrame", true, nil, function()
	if EyeOfTheStorm.Options.ShowPointFrame and bgzone then
		EyeOfTheStorm:ShowEstimatedPoints()
	else
		EyeOfTheStorm:HideEstimatedPoints()
	end
end)


local startTimer = EyeOfTheStorm:NewTimer(62, "TimerStart")
local winTimer = EyeOfTheStorm:NewTimer(30, "TimerWin")
local flagTimer = EyeOfTheStorm:NewTimer(9, "TimerFlag", "Interface\\Icons\\INV_Banner_02")

local objectives = {
	[1] = 6,	-- Blood Elf
	[2] = 6,	-- Draenai
	[3] = 6,	-- Fel Reaver
	[4] = 6,	-- Mage
	[5] = 45	-- Flag
}
local function is_flag(id)
	return id == 45 or id == 44 or id ==43
end
local function is_tower(id)
	return id == 6 or id == 10 or id == 11
end
local function get_basecount()
	local alliance = 0 
	local horde = 0
	for k,v in pairs(objectives) do
		if v == 11 then 
			alliance = alliance + 1
		elseif v == 10 then 
			horde = horde + 1
		end
	end
	return alliance, horde
end
local function get_score()
	if not bgzone then return 0,0 end
	local AllyScore		= tonumber(string.match((select(3, GetWorldStateUIInfo(2)) or ""), L.ScoreExpr)) or 0
	local HordeScore	= tonumber(string.match((select(3, GetWorldStateUIInfo(3)) or ""), L.ScoreExpr)) or 0
	return AllyScore, HordeScore
end


local get_gametime
local update_gametime
do
	local gametime = 0
	function update_gametime()
		gametime = time()
	end
	function get_gametime()
		local systime = GetBattlefieldInstanceRunTime()
		if systime > 0 then
			return systime / 1000
		else
			return time() - gametime
		end
	end
end

do
	local function AB_Initialize()
		if select(2, IsInInstance()) == "pvp" and GetRealZoneText() == L.ZoneName then
			bgzone = true
			update_gametime()
			for i=1, GetNumMapLandmarks(), 1 do
				local name, _, textureIndex = GetMapLandmarkInfo(i)
				if name and textureIndex then
					if is_tower(textureIndex) or is_flag(textureIndex) then
						objectives[i] = textureIndex
					end
				end
			end
			if EyeOfTheStorm.Options.ShowPointFrame then
				EyeOfTheStorm:ShowEstimatedPoints()
			end

		elseif bgzone then
			bgzone = false
			if EyeOfTheStorm.Options.ShowPointFrame then
				EyeOfTheStorm:HideEstimatedPoints()
			end
		end
	end
	EyeOfTheStorm.OnInitialize = AB_Initialize
	EyeOfTheStorm.ZONE_CHANGED_NEW_AREA = AB_Initialize
end

do
	local function check_for_updates()
		if not bgzone then return end
		for i=1, GetNumMapLandmarks(), 1 do
			local name, _, textureIndex = GetMapLandmarkInfo(i)
			if name and textureIndex then
				if is_tower(textureIndex) or is_flag(textureIndex) then
					objectives[i] = textureIndex
				end
			end
		end
		EyeOfTheStorm:UPDATE_WORLD_STATES()
	end
	
	local function schedule_check(self)
		self:Schedule(1, check_for_updates)
	end

	function EyeOfTheStorm:CHAT_MSG_BG_SYSTEM_ALLIANCE(arg1)
		if EyeOfTheStorm.Options.ShowPointFrame then
			if string.match(arg1, L.FlagTaken) then
				local name = string.match(arg1, L.FlagTaken)
				if name then
					self.AllyFlag = name
					self.HordeFlag = nil
					self:UpdateFlagDisplay()
				end
	
			elseif string.match(arg1, L.FlagDropped) then
				self.AllyFlag = nil
				self.HordeFlag = nil
				self:UpdateFlagDisplay()
	
			elseif string.match(arg1, L.FlagCaptured) then
				flagTimer:Start()
				self.AllyFlag = nil
				self.HordeFlag = nil
				self:UpdateFlagDisplay()
			end
		end
		schedule_check(self)
	end

	function EyeOfTheStorm:CHAT_MSG_BG_SYSTEM_HORDE(arg1)
		if EyeOfTheStorm.Options.ShowPointFrame then
			if string.match(arg1, L.FlagTaken) then
				local name = string.match(arg1, L.FlagTaken)
				if name then
					self.AllyFlag = nil
					self.HordeFlag = name
					self:UpdateFlagDisplay()
				end
	
			elseif string.match(arg1, L.FlagDropped) then
				self.AllyFlag = nil
				self.HordeFlag = nil
				self:UpdateFlagDisplay()
	
			elseif string.match(arg1, L.FlagCaptured) then
				flagTimer:Start()
				self.AllyFlag = nil
				self.HordeFlag = nil
				self:UpdateFlagDisplay()
			end
		end
		schedule_check(self)
	end

	function EyeOfTheStorm:CHAT_MSG_BG_SYSTEM_NEUTRAL(arg1)
		if not bgzone then return end

		if arg1 == L.BgStart60 then
			startTimer:Start()

		elseif arg1 == L.BgStart30  then		
			startTimer:Update(31, 62)

		elseif string.match(arg1, L.FlagReset) then
			EyeOfTheStorm.AllyFlag = nil
			EyeOfTheStorm.HordeFlag = nil
			EyeOfTheStorm:UpdateFlagDisplay()
		end
		schedule_check(self)
	end	
end


function EyeOfTheStorm:UPDATE_WORLD_STATES()
	if not bgzone then return end

	local last_alliance_bases, last_horde_bases = get_basecount()
	local last_alliance_score, last_horde_score = get_score()

	-- calculate new times
	local AllyTime = (2000 - last_alliance_score) / ResPerSec[last_alliance_bases]
	local HordeTime = (2000 - last_horde_score) / ResPerSec[last_horde_bases]
	
	if AllyTime > 5000 then		AllyTime = 5000 end
	if HordeTime > 5000 then	HordeTime = 5000 end

	if AllyTime == HordeTime then
		winner_is = 0 
		winTimer:Stop()
		if self.ScoreFrame1Text then
			self.ScoreFrame1Text:SetText("")
			self.ScoreFrame2Text:SetText("")
		end
		
	elseif AllyTime > HordeTime then -- Horde wins
		winner_is = 2
		winTimer:Update(get_gametime(), get_gametime()+HordeTime)
		winTimer:DisableEnlarge()
		winTimer:UpdateName(L.WinBarText:format(L.Horde))
		winTimer:SetColor(hordeColor)

		if self.ScoreFrame1Text and self.ScoreFrame2Text then
			local AllyPoints = math.floor((HordeTime * ResPerSec[last_alliance_bases]) + last_alliance_score)
			self.ScoreFrame1Text:SetText("("..AllyPoints..")")
			self.ScoreFrame2Text:SetText("(2000)")
			self:UpdateFlagDisplay()
		end

	elseif HordeTime > AllyTime then -- Alliance wins
		winner_is = 1
		winTimer:Update(get_gametime(), get_gametime()+AllyTime)
		winTimer:DisableEnlarge()
		winTimer:UpdateName(L.WinBarText:format(L.Alliance))
		winTimer:SetColor(allyColor)

		if self.ScoreFrame1Text and self.ScoreFrame2Text then
			local HordePoints = math.floor((HordeTime * ResPerSec[last_horde_bases]) + last_horde_score)
			self.ScoreFrame1Text:SetText("(2000)")
			self.ScoreFrame2Text:SetText("("..HordePoints..")")
			self:UpdateFlagDisplay()
		end		
	end
end

function EyeOfTheStorm:UpdateFlagDisplay()
	if self.ScoreFrame1Text and self.ScoreFrame2Text then
		
		local newText
		local oldText = self.ScoreFrame1Text:GetText()
		if self.AllyFlag then
			if not oldText or oldText == "" then
				newText = "Flag: "..self.AllyFlag
			else
				newText = string.gsub(oldText, "%((%d+)%).*", "%(%1%)  "..L.Flag..": "..self.AllyFlag)
			end
		elseif oldText and oldText ~= "" then
			newText = string.gsub(oldText, "%((%d+)%).*", "%(%1%)")
		end
		self.ScoreFrame1Text:SetText(newText)
		
		newText = nil
		oldText = self.ScoreFrame2Text:GetText()
		if self.HordeFlag then
			if not oldText or oldText == "" then
				newText = "Flag: "..self.HordeFlag
			else
				newText = string.gsub(oldText, "%((%d+)%).*", "%(%1%)  "..L.Flag..": "..self.HordeFlag)
			end
		elseif oldText and oldText ~= "" then
			newText = string.gsub(oldText, "%((%d+)%).*", "%(%1%)")
		end
		self.ScoreFrame2Text:SetText(newText)
		
	end
end

function EyeOfTheStorm:ShowEstimatedPoints()
	if AlwaysUpFrame1Text and AlwaysUpFrame2Text then
		if not self.ScoreFrame1 then
			self.ScoreFrame1 = CreateFrame("Frame", nil, AlwaysUpFrame1)
			self.ScoreFrame1:SetHeight(10)
			self.ScoreFrame1:SetWidth(200)
			self.ScoreFrame1:SetPoint("LEFT", "AlwaysUpFrame1Text", "RIGHT", 4, 0)
			self.ScoreFrame1Text = self.ScoreFrame1:CreateFontString(nil, nil, "GameFontNormalSmall")
			self.ScoreFrame1Text:SetAllPoints(self.ScoreFrame1)
			self.ScoreFrame1Text:SetJustifyH("LEFT")
		end
		if not self.ScoreFrame2 then
			self.ScoreFrame2 = CreateFrame("Frame", nil, AlwaysUpFrame2)
			self.ScoreFrame2:SetHeight(10)
			self.ScoreFrame2:SetWidth(200)
			self.ScoreFrame2:SetPoint("LEFT", "AlwaysUpFrame2Text", "RIGHT", 4, 0)
			self.ScoreFrame2Text= self.ScoreFrame2:CreateFontString(nil, nil, "GameFontNormalSmall")
			self.ScoreFrame2Text:SetAllPoints(self.ScoreFrame2)
			self.ScoreFrame2Text:SetJustifyH("LEFT")
		end
		self.ScoreFrame1Text:SetText("")
		self.ScoreFrame1:Show()
		self.ScoreFrame2Text:SetText("")
		self.ScoreFrame2:Show()
	end
end

function EyeOfTheStorm:HideEstimatedPoints()
	if self.ScoreFrame1 and self.ScoreFrame2 then
		self.ScoreFrame1:Hide()
		self.ScoreFrame1Text:SetText("")
		self.ScoreFrame2:Hide()
		self.ScoreFrame2Text:SetText("")
	end
end

