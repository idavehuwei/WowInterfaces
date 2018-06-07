local addon = LibStub("AceAddon-3.0"):GetAddon("InstanceMaps")
local mod = addon:NewModule("Notes", "AceEvent-3.0")

local NotesDB = InstanceMaps_NotesDB
InstanceMaps_NotesDB = nil

local math_floor = math.floor
local function getXY(id)
	return (id % 10001)/10000, math_floor(id / 10001)/10000
end

local icons = {}
do
	local keys = {"Star", "Circle", "Diamond", "Triangle", "Moon", "Square", "Cross", "Skull",}
	for i=1, 8 do
		local data = UnitPopupButtons["RAID_TARGET_"..i]
		icons[keys[i]] = {data.icon, data.tCoordLeft, data.tCoordRight, data.tCoordTop, data.tCoordBottom}
	end
end

local current_zone

local shownNotes = {}
local makeNote, recycleNote, recycleNotes
do
	local cache = {}

	local tooltip = WorldMapTooltip
	local OnEnter = function(frame)
		if frame.data and frame.data.title then
			if frame:GetCenter() > UIParent:GetCenter() then
				tooltip:SetOwner(frame, "ANCHOR_LEFT")
			else
				tooltip:SetOwner(frame, "ANCHOR_RIGHT")
			end
			tooltip:SetText(frame.data.title)
			tooltip:Show()
		end
	end
	local OnLeave = function(frame)
		tooltip:Hide()
	end
	local OnClick = function(frame)
		if frame.data and frame.data.title then
			mod:SendMessage("InstanceMaps_Notes_Click", frame.data.title, current_zone, frame.data)
		end
	end

	local noteCount = 0
	function makeNote()
		local f = next(cache)
		if f then
			cache[f] = nil
			f:Show()

			return f
		end
		noteCount = noteCount + 1

		local f = CreateFrame("Button", "InstanceMaps_Notes_Button"..noteCount, addon.instanceMapFrame)
		f:SetWidth(12)
		f:SetHeight(12)
		f:SetPoint("CENTER", addon.instanceMapFrame)
		local texture = f:CreateTexture(nil, "OVERLAY")
		f.texture = texture
		texture:SetAllPoints(f)
		
		f:SetScript("OnEnter", OnEnter)
		f:SetScript("OnLeave", OnLeave)
		f:SetScript("OnClick", OnClick)
		f:Show()
		
		return f
	end

	function recycleNote(f)
		f:Hide()
		cache[f] = true
		return nil
	end
	
	function recycleNotes(t)
		for coord, frame in pairs(t) do
			t[coord] = recycleNote(frame)
		end
	end
end

function mod:OnEnable()
	self:RegisterMessage("InstanceMap_Show")
	self:RegisterMessage("InstanceMap_Hide")
end

function mod:InstanceMap_Show(event, realZone)
	recycleNotes(shownNotes)
	if not NotesDB or not NotesDB[realZone] then return end
	if not addon.instanceMapFrame then return end

	current_zone = realZone

	local framelevel = addon.instanceMapFrame:GetFrameLevel() + 2
	local framestrata = addon.instanceMapFrame:GetFrameStrata()

	for id, data in pairs(NotesDB[realZone]) do
		local n = makeNote()
		if data.icon and icons[data.icon] then
			local path, l, r, t, b = unpack(icons[data.icon])
			n:SetFrameLevel(framelevel)
			n:SetFrameStrata(framestrata)
			n:EnableMouse(true)
			n:RegisterForClicks("LeftButtonUp")
			n.texture:SetTexture(path)
			n.texture:SetTexCoord(l, r, t, b)
			n.texture:SetVertexColor(1, 1, 1, 1)

			local x, y = getXY(id)
			n:ClearAllPoints()
			n:SetPoint("CENTER", WorldMapButton, "TOPLEFT", x * WorldMapButton:GetWidth(), -y * WorldMapButton:GetHeight())

			n.data = data

			shownNotes[id] = n
		end
	end
end

function mod:InstanceMap_Hide()
	current_zone = nil
	recycleNotes(shownNotes)
end

