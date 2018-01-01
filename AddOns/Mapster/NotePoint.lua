
local BZ = LibStub("LibBabble-Zone-3.0")
local BZH = BZ:GetUnstrictLookupTable()
local BZR = BZ:GetReverseLookupTable()

NotePoint = Waypoint:New()

NotePoint.Db = nil
NotePoint.Data = nil
NotePoint.ShowOnMap = true

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

local function getID(x, y)
	return round(x*10000, 0) + round(y*10000, 0)*10001
end

local function getXY(id)
	return (id % 10001)/10000, floor(id/10001)/10000
end

function NotePoint:init(zone, x, y, title)
	if not BZH[zone] then
		if BZR[zone] then
			zone = BZR[zone]
		else
		end
	end
	local id
	if y then
		id = getID(x, y)
	else
		id = x
		x, y = getXY(id)
	end
	Waypoint.init(self, id..zone)
	if not title then
		--title = ""
	else
		self.Zone, self.x, self.y, self.Data = zone, x, y, {title = title}
	end
end

function NotePoint:MatchNote(id)
	return self.WaypointID == id
end

function NotePoint:ToString()
	if self.Data then
		if not self.Data.title then
			if self.Data.icon then
				return self.Data.icon
			end
		else
			return self.Data.title
		end
	else
		return "信息点"
	end
end

function NotePoint:GetDistance()
	return Mapster_Notes:GetDistanceToPoint(self.x, self.y, self.Zone)
end

function NotePoint:Cancel()
	Waypoint.Cancel(self)
	self.Db, self.Data = nil
end

function NotePoint:IsValid()
	if self.Zone == "Limbo" then return false end
	if self.Data.title or Mapster_Notes:GetNote(self.Zone, self.x, self.y) then
		return true
	else
		return false
	end
end

function NotePoint:ShowOnMap()
	return true
end