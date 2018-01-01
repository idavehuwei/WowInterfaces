
--waypoint
local revision = tonumber(("$Revision: 2243 $"):match("%d+"));
local Mapster = LibStub("AceAddon-3.0"):GetAddon("Mapster");
local L = LibStub("AceLocale-3.0"):GetLocale("Mapster");
local MODNAME = "Waypoint"
local Mapster_Waypoint = Mapster:NewModule(MODNAME, "AceConsole-3.0", "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

local _G = getfenv(0);

local Dewdrop = AceLibrary("Dewdrop-2.0");
local Tablet = AceLibrary("Tablet-2.0");
local Tourist = LibStub("LibTourist-3.0");
local Crayon = LibStub("LibCrayon-3.0")
local BZ = LibStub("LibBabble-Zone-3.0");
local BZR = BZ:GetReverseLookupTable();
local Abacus = LibStub("LibAbacus-3.0");
local db;

local yardString = "%.0f yd"

local floor = math.floor

local playerModel

local Queue = {}
Mapster_Waypoint.Queue = Queque

Mapster_Waypoint.mapdb = {}

local function round(num, digits)
	local mantissa = 10^digits
	local norm = num * mantissa
	norm = norm + 0.5;
	local norm_f = floor(norm)
	if norm == norm_f and (norm_f % 2) ~= 0 then
		return (norm_f - 1)/mantissa
	end
	return norm_f/mantissa
end

local function getID(x, y)
	return round(x*10000, 0) + round(y*10000, 0)*10001
end
Mapster_Waypoint.getID = getID

local function getXY(id)
	return (id % 10001)/10000, floor(id/10001)/10000
end
Mapster_Waypoint.getXY = getXY

local delimiters = {[" "] = true, [","] = true, ["-"]=true}
local function explode(...)
	if select("#",...) == 2 and delimiters[select(1,...)] then
		return explode(string.split(select(1, ...), select(2, ...)))
	end
	local arr,quote = {},nil
	for i = 1,select("#",...) do -- for each divider found
		local word = select(i,...)
		local quotefound = string.find(word,"[\"\']")
		if (not quotefound and not quote) or (quotefound and quote) then
			if quotefound and quote then
				local clean = string.gsub(quote.." "..word, "[\"\']", "")
				table.insert(arr,clean)
			else
				table.insert(arr,word)
			end
			quote = nil
		else
			if quote then
				quote = quote.." "..word
			else
				quote = word
			end
		end
	end
	return arr
end

local function PushQueue(waypoint, append)
	if append then
		tinsert(Queue, waypoint)
	else
		tinsert(Queue, 1, waypoint)
	end
end

local function PopQueue()
	local corn = table.remove(Queue, 1)
	if corn.OnMap and corn.POIID and Waypoint.MapDB[corn.Zone] and Waypoint.MapDB[corn.Zone][corn.POIID] then
		Waypoint.MapDB[corn.Zone][corn.POIID].focus = nil

		if #Queue > 0 then
			local waypoint = Queue[1]
			if waypoint.POIID and Waypoint.MapDB[waypoint.Zone] and Waypoint.MapDB[waypoint.Zone][waypoint.POIID] then
				Waypoint.MapDB[waypoint.Zone][waypoint.POIID].focus = true
			end
		end
	end

	return corn
end

local db
local defaults = {
	profile = {
		alpha = 1,
		scale = 1,
		waypointX = 0,
		waypointY = 0,
	},
}

local options
local function getOptions()
	if not options then
		options = {
			handler = Mapster_Waypoint,
			type = "group",
			name = L["Waypoint"],
			args = {
				intro = {
					order = 1,
					type = "description",
					name = L["Module which shows an arrow to direct you to a specified note or location."],
				},
				enable = {
					order = 2,
					type = "toggle",
					name = L["Enable Waypoint"],
					width = "full",
					get = "IsActived",
					set = function(_, v) Mapster_Waypoint:ToggleActiveWaypoint(_, v) end,
				},
				minimap = {
					order = 3,
					type = "toggle",
					name = L["Show Waypoint icons"],
					desc = L["Show the next waypoint on the minimap and all waypoints on the main"],
					width = "full",
					get =function() return Mapster_Waypoint.db.profile.minimapShow end,
					set = function(_, v) Mapster_Waypoint.db.profile.minimapShow = v end,
				},
				scale = {
					order = 4,
					name = L["Size"],
					desc = L["Set the size of the waypoint arrow"],
					type = 'range',
					min = 0.25,
					max = 2,
					isPercent = true,
					step = 0.01,
					bigStep = 0.05,
					get = function() return Mapster_Waypoint.db.profile.scale end,
					set = function(_, value)
						Mapster_Waypoint.db.profile.scale = value
						if waypointFrame then
							waypointFrame:SetScale(value)
						end
					end
				},
				alpha = {
					order = 5,
					name = L["Opacity"],
					desc = L["Set how opaque or transparent the waypoint arrow is"],
					type = 'range',
					min = 0,
					max = 1,
					isPercent = true,
					step = 0.01,
					bigStep = 0.05,
					get = function() return Mapster_Waypoint.db.profile.alpha end,
					set = function(_, value)
						Mapster_Waypoint.db.profile.alpha = value
						if waypointFrame then
							waypointFrame:SetAlpha(value)
						end
					end
				}
			},
		}
	end
	return options
end

function Mapster_Waypoint:OnInitialize()
	self.db = Mapster.db:RegisterNamespace(MODNAME, defaults);
	db = self.db.profile
	if (Mapster:GetModuleEnabled("Notes")) then
		local Mapster_Notes = Mapster:GetModule("Notes")
		Mapster_Notes:RegisterNotesDatabase("Waypoints", Waypoint.MapDB, Waypoint)
	end
	Mapster:RegisterModuleOptions(MODNAME, getOptions, "Waypoint");
end

local waypointLocalZone
local function createWaypointFrame()
	waypointFrame = CreateFrame("Frame", "Mapster_Waypoint", UIParent)
	waypointFrame:SetWidth(56)
	waypointFrame:SetHeight(64)
	waypointFrame:SetScale(Mapster_Waypoint.db.profile.scale)
	waypointFrame:SetAlpha(Mapster_Waypoint.db.profile.alpha)
	local tex = waypointFrame:CreateTexture(nil, "OVERLAY")
	waypointFrame.tex = tex
	tex:SetWidth(56)
	tex:SetHeight(42)
	tex:SetTexture([[Interface\AddOns\Mapster\Arrow\Arrow]])
	waypointFrame.up = false
	tex:SetPoint("TOP")
	local dist = waypointFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	waypointFrame.dist = dist
	dist:SetPoint("BOTTOM")
	local title = waypointFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	waypointFrame.title = title
	title:SetPoint("TOP", dist, "BOTTOM")
	local tta = waypointFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	waypointFrame.tta = tta
	tta:SetPoint("TOP", title, "BOTTOM")
	waypointFrame:EnableMouse(true)
	waypointFrame:SetMovable(not Mapster_Waypoint.db.profile.locked)
	waypointFrame:RegisterForDrag(not Mapster_Waypoint.db.profile.locked and "LeftButton" or nil)
	waypointFrame:SetScript("OnDragStart", function(self)
		self:StartMoving()
	end)
	waypointFrame:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
		local p, _, rp, x, y = self:GetPoint()
		Mapster_Waypoint.db.profile.point = p
		Mapster_Waypoint.db.profile.relpoint = rp
		Mapster_Waypoint.db.profile.waypointX = x
		Mapster_Waypoint.db.profile.waypointY = y
		self:ClearAllPoints()
		
		self:SetPoint(Mapster_Waypoint.db.profile.point, UIParent, Mapster_Waypoint.db.profile.relpoint, Mapster_Waypoint.db.profile.waypointX, Mapster_Waypoint.db.profile.waypointY)
	end)
	waypointFrame:SetClampedToScreen(true)
	waypointFrame:SetPoint(Mapster_Waypoint.db.profile.point or "CENTER", UIParent, Mapster_Waypoint.db.profile.relpoint or "CENTER", Mapster_Waypoint.db.profile.waypointX, Mapster_Waypoint.db.profile.waypointY)
	Dewdrop:Register(waypointFrame,
		'children', function()
			Dewdrop:AddLine(
				'text', L["Clear waypoint"],
				'func', function()
					for i, v in ipairs(Queue) do
						v:Cancel()
					end
					Queue = {}
				end,
				'closeWhenClicked', true
			)
			if #Queue > 1 then
				Dewdrop:AddLine(
					'text', L["Move to end of queue"],
					'func', function() 
						PushQueue(PopQueue(), 1) 
					end,
					'closeWhenClicked', true
				)
			end
			Dewdrop:AddLine()
			Dewdrop:AddLine(
				'text', L["Open Config Window"],
				'func', function()
					LibStub("AceConfigDialog-3.0"):Open("Mapster", "Waypoint")
				end,
				'closeWhenClicked', true
			);
			Dewdrop:AddLine(
				'text', L["Lock waypoint arrow"],
				'desc', L["Lock the waypoint arrow in place"],
				'checked', Mapster_Waypoint.db.profile.locked,
				'func', function() local locked = Mapster_Waypoint.db.profile.locked
					if locked then
						waypointFrame:RegisterForDrag("LeftButton")
						waypointFrame:EnableMouse(true)
						waypointFrame:SetMovable(true)
						Mapster_Waypoint.db.profile.locked = false
					else
						waypointFrame:RegisterForDrag(nil)
						waypointFrame:SetMovable(false)
						Mapster_Waypoint.db.profile.locked = true
					end
				end,
				'closeWhenClicked', true
			)
			Dewdrop:AddLine(
				'text', CLOSE,
				'closeWhenClicked', true
			)
		end
	)
end

local initMeOnce
local noop = function() end
initMeOnce = function()
	local function getQueue()
		if #Queue == 0 then
			--self:Print(L["Waypoint Queue Empty."])
			return
		end
		--self:Print(L["Waypoint Queue:"])
		for i,v in ipairs(Queue) do
			self:Print("    "..v:ToString())
		end
	end
	if not playerModel then
		local t = { Minimap:GetChildren() }
		for i = #t, 1, -1 do
			local v = t[i]
			if v:GetObjectType() == "Model" and not v:GetName() then
				playerModel = v
				break
			end
		end
	end

	initMeOnce = noop
end

function Mapster_Waypoint:OnEnable()
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("CVAR_UPDATE")
	initMeOnce()

	self:ZONE_CHANGED_NEW_AREA()
end

function Mapster_Waypoint:OnDisable()
	self:UnregisterAllEvents()
	self:CancelAllTimers()
	if waypointFrame then
		waypointFrame:Hide()
	end
end

function Mapster_Waypoint:GetWaypoint()
	if #Queue and Queue[1] then
		local waypointNote= Queue[1]
		return waypointNote.Zone, waypointNote.x, waypointNote.y
	else
		return nil
	end
end

function Mapster_Waypoint:IsNoteWaypoint(id)
	if #Queue > 0 then
		for i,v in ipairs(Queue) do
			if v.MatchNote and v:MatchNote(id) then
				return true
			end
		end
	end
	return false
end

function Mapster_Waypoint:SetNoteAsWaypoint(id, zone)
	PushQueue(NotePoint:New(zone, id))
	if not waypointFrame then
		createWaypointFrame()
	end
	if (#Queue == 1) then
		self:MapClosed()
	end
end

function Mapster_Waypoint:SetPointAsWaypoint(x, y)
	local zone = select(GetCurrentMapZone(), GetMapZones(GetCurrentMapContinent()))
	self:AddWaypoint(NotePoint:New(zone, x, y, "Waypoint"))
end

--for quest
function Mapster_Waypoint:SetQuestPointAsWayPoint(zone, x, y, objname)
	--local zone = select(z or GetCurrentMapZone(), GetMapZones(c or GetCurrentMapContinent()))
	self:AddWaypoint(NotePoint:New(zone, x/100, y/100, objname))
end

function Mapster_Waypoint:AddLHWaypoint(c, z, x, y, desc)
    local zone = select(z or GetCurrentMapZone(), GetMapZones(c or GetCurrentMapContinent()))
    self:AddWaypoint(NotePoint:New(zone, x/100, y/100, desc))
end

function Mapster_Waypoint:AddRoutesWaypoint(z, id, desc)
	local x, y = getXY(id)
	self:AddWaypoint(NotePoint:New(z, x, y, desc))
end

function Mapster_Waypoint:AddWaypoint(waypoint)
	PushQueue(waypoint)

	local showOnMap = waypoint.ShowOnMap
	if type(showOnMap) == "function" then
		showOnMap = showOnMap(waypoint)
	end
	if showOnMap and self.db.profile.minimapShow then
		waypoint:AddToMap()
	end
	if not waypointFrame then
		createWaypointFrame()
	end
	if (#Queue == 1) then
		self:MapClosed()
	end
end

--not c
function _G.SetWaypoint(...)
	local first = (...)
	local zoneName, x, y, text, metadata
	if type(first) == "number" then
		local continentID, zoneID
		continentID, zoneID, x, y, text, metadata = ...
		zoneName = select(zoneID, GetMapZones(continentID))
	else
		local zone
		zone, x, y, text, metadata = ...
		zoneName = Tourist:GetZoneFromTexture(zone)
	end

	local wp = Waypoint:New(text or '')
	wp.x = x
	wp.y = y
	wp.Zone = zoneName
	wp.metadata = metadata
	Mapster_Waypoint:AddWaypoint(wp)
end

function _G.GetWaypoint()
	if #Queue >= 1 then
		return Queue[1].metadata
	end
end

function _G.ClearWaypoint()
	for i = #Queue, 1, -1 do
		Queue[i]:Cancel()
	end
end

function Mapster_Waypoint:CancelWaypoint(id)
	if #Queue > 0 then
		for i=1,#Queue do
			if Queue[i].WaypointID == id then
				Queue[i]:Cancel()
			end
		end
	end
	Mapster_Notes:RefreshMap()
end

function Mapster_Waypoint:MapOpened()
	if Queue[1] then
		self:CancelTimer("Mapster_WaypointUpdate", true)
		waypointFrame.dist:SetText("-")
	end
end
--
function Mapster_Waypoint:MapClosed()
	if Queue[1] then
		Mapster_WaypointUpdate = self:ScheduleRepeatingTimer("UpdateWaypoint", 0.05)
	end
end

local waypointHitDistance = 5
function Mapster_Waypoint:GetWaypointHitDistance()
	return waypointHitDistance
end

function Mapster_Waypoint:SetWaypointHitDistance(v)
	if v >= 5 then -- limit to a minimum of 5 yards
		waypointHitDistance = v
	end
end

local _54_div_math_pi = 54/math.pi
local math_rad_90 = math.rad(90)
local math_atan2 = math.atan2
local math_floor = math.floor
local math_cos = math.cos
local count = 53
local i = 0
local rotateMinimap = GetCVar("rotateMinimap") == "1"
function Mapster_Waypoint:UpdateWaypoint()
	local realZoneText = GetRealZoneText()
	local px, py = Mapster_Notes:GetCurrentPlayerPosition()
	if px==nil then return end		-- Sinus: GetCurrentPlayerPosition() sometimes erroneously returns nil several times upon login, killing valid waypoints set up immediately at login time. It's better to ignore waypoints if player position seems bogus.
	local waypoint = #Queue and Queue[1] or nil

	if BZR[realZoneText] then
		realZoneText = BZR[realZoneText]
	end
	if not waypoint then
		self:CancelTimer("Mapster_WaypointUpdate", true)
		waypointFrame:Hide()
		return
	end

	if BZR[waypoint.Zone] then
		waypoint.Zone = BZR[waypoint.Zone]
	end

	if not waypoint:IsValid() then
		self:Print(L["Clearing up queue"])
		PopQueue():Cancel()
		waypoint = Queue[1]
		return
	end

	if not waypointFrame then
		return
	end

	if not waypointFrame:IsShown() then
		waypointFrame:Show()
	end

	local dist = waypoint:GetDistance()

	if not dist then
		dist = 0
	end
	if dist <= waypointHitDistance and waypoint:IsReady() then
		PopQueue()
		waypoint:Cancel()
		return
	end

	if dist <=10 then
		if not waypointFrame.up then
            waypointFrame.tex:SetTexture(nil)
			waypointFrame.tex:SetTexture([[Interface\AddOns\Mapster\Arrow\Arrow]] .."-UP")
			waypointFrame.tex:SetWidth(53)
			waypointFrame.tex:SetHeight(70)
			waypointFrame.up = true
		end
	else
		if waypointFrame.up then
            waypointFrame.tex:SetTexture(nil)
			waypointFrame.tex:SetTexture([[Interface\AddOns\Mapster\Arrow\Arrow]])
			waypointFrame.tex:SetWidth(56)
			waypointFrame.tex:SetHeight(42)
			waypointFrame.up = false
		end
	end
	--self:Print(x, y)
	local x,y = Tourist:TransposeZoneCoordinate(waypoint.x, waypoint.y, waypoint.Zone, realZoneText)

	local rad
	if waypoint:IsReady() and x and y then
		if not waypointFrame.up then
			local diffX, diffY = x - (px or 0), y - (py or 0)
			rad = -math_atan2(diffY*2/3, diffX)
			
			local direction = GetPlayerFacing() + math_rad_90
			
			local val = ((rad - direction)*_54_div_math_pi + 108) % 108
			
			local col, row = math_floor(val % 9), math_floor(val / 9)
			
			waypointFrame.tex:SetTexCoord(col*56/512, (col+1)*56/512, row*42/512, (row+1)*42/512)
		else
			count = count + 1
			if count == 54 then
				count = 0
			end
			local col, row = math_floor(count % 9), math_floor(count / 9)
			waypointFrame.tex:SetTexCoord(col*53/512, (col+1)*53/512, row*70/512, (row+1)*70/512)
		end
		waypointFrame.tex:SetVertexColor(Crayon:GetThresholdColorTrivial(dist, 1000, 300, 100, 30, 0))
	else
		waypointFrame.tex:SetTexCoord(0, 0, 0, 0)
		waypointFrame.tex:SetVertexColor(Crayon.COLOR_HEX_SILVER)
	end
	waypointFrame.dist:SetText(yardString:format(dist))
	waypointFrame.title:SetText(waypoint:ToString())

	if i == 0 then
		if rad then
			if not CWUpdateVelocity then
				CWUpdateVelocity = self:ScheduleRepeatingTimer("OnUpdate", 0.1)
			end
			local speed, angle = self:GetCurrentVelocity()
			local disparity = math_cos(angle - rad)
			if disparity < 0 then
				disparity = 0
			end
			local time = dist / speed / disparity
			waypointFrame.tta:SetText(Abacus:FormatDurationShort(time, false, true))
		else
			self:CancelTimer("CWUpdateVelocity", true)
			waypointFrame.tta:SetText("")
		end
	end
	i = (i + 1) % 10
end

function Mapster_Waypoint:ZONE_CHANGED_NEW_AREA()
	if #Queue > 0 then
		Mapster_WaypointUpdate = self:ScheduleRepeatingTimer("UpdateWaypoint", 0.05)
	end
	self:MINIMAP_ZONE_CHANGED()
end


local currentYardWidth = 1000
function Mapster_Waypoint:MINIMAP_ZONE_CHANGED()
	if not WorldMapFrame:IsShown() then
		SetMapToCurrentZone()
	end
	currentYardWidth = Tourist:GetZoneYardSize(GetRealZoneText())
	if not currentYardWidth then
		currentYardWidth = 1000
	end
end

local speed, direction = 0, 0
do
	local last_x, last_y, last_zone, last_time
	local GetTime = GetTime
	local math_atan2 = math.atan2
	function Mapster_Waypoint:OnUpdate()
		local x, y, zone = Mapster_Notes:GetCurrentPlayerPosition()
		if not x then
			return
		end
		if not last_x then
			last_x, last_y, last_zone = x, y, zone
			last_time = GetTime()
		end
		local time = GetTime()
		if zone ~= last_zone then
			last_x, last_y, last_zone, last_time = x, y, zone, time
			return
		end
		local d_x = x - last_x
		local d_y = (last_y - y)*2/3
		local d_t = time - last_time
		local dist = (d_x*d_x + d_y*d_y)^0.5 * currentYardWidth
		speed = dist / d_t
		direction = math_atan2(d_y, d_x)
		last_x, last_y, last_zone, last_time = x, y, zone, time
	end
end

function Mapster_Waypoint:GetCurrentVelocity()
	return speed, direction
end

function Mapster_Waypoint:CVAR_UPDATE(caller, cvar, value)
	if cvar == "ROTATE_MINIMAP" then
		rotateMinimap = value == "1"
	end
end

function Mapster_Waypoint:IsActived()
	return Mapster:GetModuleEnabled(MODNAME)
end

function Mapster_Waypoint:ToggleActiveWaypoint(_, value)
	Mapster:SetModuleEnabled(MODNAME, value)
end