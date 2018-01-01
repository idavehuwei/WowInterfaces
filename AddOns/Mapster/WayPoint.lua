
local Crayon = LibStub("LibCrayon-3.0")

Waypoint = {}

local mts = setmetatable({}, {
	__index = function(self, key) 
		self[key] = {__index = key}
		return self[key]
	end,
	__mode = 'kv'
});

function Waypoint:New(...)
	local t = setmetatable({}, mts[self])
	self:init(...)
	return t
end

local db = Mapster_Notes and Mapster_Notes.externalDBs or nil

local self = Waypoint

self.MapDB = {}

Waypoint.framePool = setmetatable({}, {
	__index = function(self, n)
		if n == 0 then
			return table.remove(self) or {}
		end
	end
})

local function getFrame()
	return Waypoint.framePool[0]
end

local function returnFrame()
	tinsert(Waypoint.framePool, frame)
end

Waypoint.WaypointID = -1
Waypoint.x = -1
Waypoint.y = -1
Waypoint.Zone = "Limbo"
Waypoint.EZone = "Void"
Waypoint.POIID = nil

Waypoint.InnerZone = 10
Waypoint.Icon = "Cross"
Waypoint.IconTitle = "WayPoint"
Waypoint.PointType = "Way"
Waypoint.OnMap = false
Waypoint.frame = getFrame();
Waypoint.Colour = Crayon.COLOR_HEX_GREEN
Waypoint.ShowOnMap = false

local floor = math.floor

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

function Waypoint:init(id)
	self.WaypointID = id
end

function Waypoint:Location()
	return self.x, self.y, self.Zone, self.EZone
end

function Waypoint:GetDistance()
	return Mapster_Notes:GetDistanceToPoint(self.x, self.y, self.Zone)
end

local inf = 1/0
local function GetThresholdParcent(quality, ...)
	local n = select("#", ...)
	if n <= 1 then
		return GetThresholdParcent(quality, 0, ... or 1)
	end

	local worst = ...
	local best = select(n, ...)
	
	if worst == best and quality == worst then
		return 0.5
	end
	if worst <= best then
		if quality <= worst then
			return 0
		elseif quality >= best then
			return 1
		end
		local last = worst
		for i = 2, n-1 do
			local value = select(i, ...)
			if quality <= value then
				return ((i-2) + (quality-last)/(value-last)/(n-1))
			end
			last = value
		end
		local value = select(n, ...)
		return ((n-2) + (quality - last) / (value - last)) / (n-1)
	else
		if quality >= worst then
			return 0
		elseif quality <= best then
			return 1
		end
		local last = worst
		for i = 2, n-1 do
			local value = select(i, ...)
			if quality >= value then
				return ((i-2) + (quality-last)/(value-last)/(n-1))
			end
			last = value
		end

		local value = select(n, ...)
		return ((n-2) + (quality - last) / (value - last)) / (n-1)
	end
end

--距离
function Waypoint:GetColour(dist)
	--1000 300 100 30 0
	return Crayon:GetThresholdColorTrivial(dist, 1000, 300, 100, 30, 0)
end

function Waypoint:Cancel()
	self:RemoveFromMap()
	self.WaypointID, self.x, self.y, self.Zone, self.EZone, self.POIID, self.Icon, self.IconTitle, self.PointType, self.db, self.OnMap, self.metadata = nil
	returnFrame(self.Frame)
end

function Waypoint:ToString()
	return self.WaypointID
end

function Waypoint:IsReady()
	return true
end

function Waypoint:IsValid()
	return true
end

function Waypoint:MatchNote()
	return false
end

function Waypoint:AddToMap()
	local db = Waypoint.MapDB

	if not db[self.Zone] then
		db[self.Zone] = {}
	end

	self.POIID = round(self.x*10000, 0) + round(self.y*10000, 0)*10001 + 1

	for i, v in pairs(db[self.Zone]) do
		v.focus = nil
	end

	db[self.Zone][self.POIID] = {
		icon = self.Icon, 
		title = self:ToString() or self.IconTitle, 
		point = self.PointType,
		focus = true;
	}

	self.OnMap = true

	if Mapster_Notes then
		Mapster_Notes:ShowNote(self.Zone, self.POIID, "WayPoints")
		Mapster_Notes:MINIMAP_UPDATE_ZOOM()
	end
end

function Waypoint:RemoveFromMap()

end

function Waypoint:ShowOnMap()
	return false
end

function Waypoint:GetNoteIcon(zone, id, data)
	return data.icon
end

function Waypoint:GetRadius()
	return inf
end

function Waypoint:IsTracking()
	return false
end

function Waypoint:IsMiniNoteHidden(zone, id, data)
	return not data.focus
end