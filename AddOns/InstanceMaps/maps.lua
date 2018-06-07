local addon = LibStub("AceAddon-3.0"):NewAddon("InstanceMaps", "AceConsole-3.0", 
"AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")
_G["InstanceMaps"] = addon
local BB = LibStub("LibBabble-Boss-3.0")
local BBL = BB:GetLookupTable()
local BBR = BB:GetReverseLookupTable()
local BZ = LibStub("LibBabble-Zone-3.0")
local BZL = BZ:GetUnstrictLookupTable()
local BZR = BZ:GetReverseLookupTable()
local Tourist = LibStub("LibTourist-3.0");
--local pt = LibStub("LibPeriodicTable-3.1");

local MapData, Rotations, Floors, instanceMapFrame

function addon:OnInitialize()
	MapData, Rotations, Floors = self.MapData, self.Rotations, self.Floors
	
	instanceMapFrame = CreateFrame("Button", "instanceMapFrame", WorldMapFrame)
	addon.instanceMapFrame = instanceMapFrame
	instanceMapFrame:Hide()

	self.bosses = {};
end

function addon:OnEnable()
	self:SecureHook("SetMapZoom")
	self:SecureHook("SetMapToCurrentZone")
	self:SecureHook(WorldMapFrame, "Hide", "HideInstanceFrame")
	self:SecureHook(WorldMapFrame, "Show", "SetMapToCurrentZone")
end

function addon:OnDisable()
	self:HideInstanceFrame()
end

function addon:ShowInstanceFrame()
	if not instanceMapFrame.setup_done then
		instanceMapFrame.setup_done = true
		instanceMapFrame:SetAllPoints(WorldMapButton)
		instanceMapFrame:Hide()
		instanceMapFrame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		instanceMapFrame:SetScript("OnClick", function(this, button, down)
			if button == "RightButton" then
				-- zoom out, biotch.
				local zone = BZL[self.CurrentInstance]
				if Tourist:IsInKalimdor(zone) then
					SetMapZoom(1)
				elseif Tourist:IsInEasternKingdoms(zone) then
					SetMapZoom(2)
				elseif Tourist:IsInOutland(zone) then
					SetMapZoom(3)
				elseif Tourist:IsInNorthrend(zone) then
					SetMapZoom(4)
				else
					SetMapZoom(0)
				end
			end
		end)

		local bgf = CreateFrame("Frame", nil, WorldMapFrame)
		local bg = bgf:CreateTexture(nil, "BACKGROUND")
		instanceMapFrame.backgroundframe = bgf
		bgf:Hide()
		instanceMapFrame.background = bg
		bg:SetTexture(0,0,0)
		bg:SetPoint("CENTER", instanceMapFrame, "CENTER")
		bg:SetWidth(instanceMapFrame:GetWidth())
		bg:SetHeight(instanceMapFrame:GetHeight())
	end
	--[[
	local hid;
	for i=1,100 do
--	if WorldMapFrame then
		hid = dwGetglobal("WorldMapOverlay"..i);
		if hid then
			hid:Hide();
		end
		--CartographerLookNFeelNonOverlayHolder:Hide();
	end
	--instanceMapFrame:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 2);
	--]]
	if instanceMapFrame:IsShown() then
		return
	end
	instanceMapFrame:Show()
	instanceMapFrame.backgroundframe:Show()
	WorldMapDetailFrame:Hide()
	WorldMapButton:Hide()
	ShowWorldMapArrowFrame(nil)
end

function addon:HideInstanceFrame()
	if not instanceMapFrame or not instanceMapFrame:IsShown() then
		return
	end
	instanceMapFrame:Hide()
	instanceMapFrame.backgroundframe:Hide()
	
	WorldMapDetailFrame:Show()
	WorldMapButton:Show()
	ShowWorldMapArrowFrame(1)
	
	self:SendMessage("InstanceMap_Hide")
end
--[[
function addon:HasBosses(zone)
	if self.bosses[zone] ~= nil then return self.bosses[zone] ~= false end
	if pt("InstanceLoot"..zone) or pt("InstanceLootHeroic"..zone) then
		self:ExtractBossesFromPT("InstanceLoot", zone)
		self:ExtractBossesFromPT("InstanceLootHeroic", zone)
	else
		self.bosses[zone] = false
	end
	if self.bosses[zone] then return true end;
end

function addon:GetBossList(zone)
	local sets = pt("InstanceLoot".."."..zone)
	if not sets then return end
	local pattern = "^InstanceLoot%."..zone.."%.([^.]+)$"
	for _, set in pairs(sets) do
		local boss = set.set:match(pattern)
		if boss then
			if not self.bosses[zone] then self.bosses[zone] = {} end
			self.bosses[zone][boss] = true
		end
	end
end
]]
local cos, sin, abs = cos, sin, math.abs
local function smallRotate(angle, x, y)
	local A = cos(angle)
	local B = sin(angle)
	return x * A - y * B, x * B + y * A
end

local function rotate(angle)
	local A = cos(angle)
	local B = sin(angle)
	local ULx, ULy = -0.5 * A - -0.5 * B, -0.5 * B + -0.5 * A
	local LLx, LLy = -0.5 * A - 0.5 * B, -0.5 * B + 0.5 * A
	local URx, URy = 0.5 * A - -0.5 * B, 0.5 * B + -0.5 * A
	local LRx, LRy = 0.5 * A - 0.5 * B, 0.5 * B + 0.5 * A
	return ULx+0.5, ULy+0.5, LLx+0.5, LLy+0.5, URx+0.5, URy+0.5, LRx+0.5, LRy+0.5
end


local initializeMapData
local num_tiles = 0
function addon:ShowInstance(realZone)
	if not MapData[realZone] then	
		return
	end
	local zone = BZL[realZone]
	if initializeMapData(realZone) then		
		return
	end
	self:ShowInstanceFrame()
	self.CurrentInstance = realZone
	
	local map = MapData[realZone]
	
	local angle = Rotations[realZone] or 0
	angle = angle - 90
	local ULx, ULy, LLx, LLy, URx, URy, LRx, LRy = rotate(angle)
	
	for i,v in ipairs(map) do
		local tex
		if i > num_tiles then
			num_tiles = num_tiles + 1
			tex = instanceMapFrame:CreateTexture("instanceMapFrameTexture" .. i, "ARTWORK")
			instanceMapFrame[i] = tex
		else
			tex = instanceMapFrame[i]
		end
		local file, x, y, w, h = unpack(v)
		tex:SetTexture("textures\\Minimap\\" .. file)
		local A, B = abs(cos(angle)), abs(sin(angle))
		w, h = w*A + h*B, w*B + h*A
		tex:SetWidth(w)
		tex:SetHeight(h)
		tex:SetPoint("CENTER", instanceMapFrame, "CENTER", smallRotate(angle, x, y))
		tex:SetTexCoord(ULx, ULy, LLx, LLy, URx, URy, LRx, LRy)
		tex:Show()
	end
	for i = #map+1, num_tiles do
		local tex = instanceMapFrame[i]
		tex:SetTexture(nil) -- get rid of memory
		tex:Hide()
	end
	self:SendMessage("InstanceMap_Show", realZone)
end

local math_floor = math.floor
local function unpackfloat(D, C, B, A)
	local negative = A >= 128 and -1 or 1
	local exponent = 2*(A%128) + math_floor(B/128) - 127
	local mantissa = 1 + (65536*(B%128) + 256*C + D) / 2^23
	return negative * 2^exponent * mantissa
end

local widthData, heightData
local initialized = {}
local intermediateInitializeMapData
local realInitializeMapData
local maxNum
local timer_handle
local outoffcout
function initializeMapData(zone)
	if initialized[zone] then
		return
	end
	if widthData or heightData then
		return true
	end
	widthData, heightData = {}, {}
	local s = MapData[zone]
	local compressed = type(s) == "string"
	for i = 1, num_tiles do
		instanceMapFrame[i]:SetWidth(0)
		instanceMapFrame[i]:SetHeight(0)
		instanceMapFrame[i]:Hide()
	end
	for i = 1, compressed and s:len()/28 or #s do
		local tex
		if not compressed then
			tex = s[i][1]
		else
			local offset = 28*(i-1)
			tex = 
			("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"):format(s:byte(offset + 1, offset + 16))
		end
		if num_tiles < i then
			num_tiles = i
			instanceMapFrame[i] = 
			instanceMapFrame:CreateTexture("instanceMapFrameTexture" .. i, "ARTWORK")
		end
		instanceMapFrame[i]:SetTexture("textures\\Minimap\\" .. tex)
	end
	maxNum = compressed and s:len()/28 or #s
	outoffcout = 0;
	timer_handle = addon:ScheduleRepeatingTimer(intermediateInitializeMapData, 0.01, zone)
	return intermediateInitializeMapData(zone)
end

function intermediateInitializeMapData(zone)
	local good = true
	for i = 1, maxNum do
		if instanceMapFrame[i]:GetWidth() == 0 then
			good = false
			break
		end
	end
	if good or outoffcout > 1000 then
		for i = 1, maxNum do
			widthData[i] = instanceMapFrame[i]:GetWidth()
			heightData[i] = instanceMapFrame[i]:GetHeight()
		end
		addon:CancelTimer(timer_handle)
		return realInitializeMapData(zone)
	end
	
	outoffcout = outoffcout + 1
	return true
end

function realInitializeMapData(zone)
	initialized[zone] = true
	if num_tiles == 0 then
		num_tiles = 1
		instanceMapFrame[1] = instanceMapFrame:CreateTexture("instanceMapFrameTexture1", "ARTWORK")
	end
	local left, right, top, bottom = nil
	local floors = Floors[zone]
	local z_axis = floors and {}
	local s = MapData[zone]
	local compressed = type(s) == "string"
	if compressed then
		MapData[zone] = {}
	end
	for i = 1, compressed and s:len()/28 or #s do
		local v
		local tex, x, y, z
		if not compressed then
			v = s[i]
			tex, x, y, z = v[1], v[2], v[3], v[4]
		else
			local offset = 28*(i-1)
			tex = 
			("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"):format( s:byte(offset + 1, offset + 16))
			x = unpackfloat(s:byte(offset + 17, offset + 20))
			y = unpackfloat(s:byte(offset + 21, offset + 24))
			z = unpackfloat(s:byte(offset + 25, offset + 28))
			v = {tex, 0, 0, 0, 0}
			MapData[zone][i] = v
		end
		if z_axis then
			z_axis[i] = z
		end
		local width = widthData[i]
		local height = heightData[i]
		v[4] = width
		v[5] = height
		local left_p = x
		local bottom_p = y
		local right_p = left_p + width
		local top_p = bottom_p + height
		v[2] = left_p + width/2
		v[3] = bottom_p + height/2
		if not left or left_p < left then
			left = left_p
		end
		if not bottom or bottom_p < bottom then
			bottom = bottom_p
		end
		if not right or right_p > right then
			right = right_p
		end
		if not top or top_p > top then
			top = top_p
		end
	end
	widthData = nil
	heightData = nil
	if compressed then
		MapData[zone] = { unpack(MapData[zone]) } -- fun hack to make it smaller.
	end
	local map_width = right - left
	local map_height = top - bottom
	
	local x_p = left + map_width/2
	local y_p = bottom + map_height/2
	local deg = Rotations[zone] or 0
	local A, B = abs(cos(deg)), abs(sin(deg))
	local scale_x = (A * map_width + B * map_height) / (980 * 2/3)
	local scale_y = (B * map_width + A * map_height) / 980
	local scale = math.max(scale_x, scale_y)
	
	for i,v in ipairs(MapData[zone]) do
		v[2] = v[2] - x_p
		v[3] = v[3] - y_p
		v[2] = v[2] / scale
		v[3] = v[3] / scale
		v[4] = v[4] / scale
		v[5] = v[5] / scale
	end
	
	if floors then
		if #floors+1 == 2 then
			for i,v in ipairs(MapData[zone]) do
				if z_axis[i] < floors[1] then
					v[3] = v[3] - 490
				else
					v[3] = v[3] + 490
				end
				v[2] = v[2] / 2
				v[3] = v[3] / 2
				v[4] = v[4] / 2
				v[5] = v[5] / 2
			end
		elseif #floors+1 == 3 then
			for i,v in ipairs(MapData[zone]) do
				if z_axis[i] < floors[1] then
					v[2] = v[2] - 490 * 2/3
					v[3] = v[3] - 490
				elseif z_axis[i] < floors[2] then
					v[2] = v[2] - 490 * 2/3
					v[3] = v[3] + 490
				else
					v[2] = v[2] + 490 * 2/3
				end
				v[2] = v[2] / 2
				v[3] = v[3] / 2
				v[4] = v[4] / 2
				v[5] = v[5] / 2
			end
		elseif #floors+1 == 4 then
			for i,v in ipairs(MapData[zone]) do
				if z_axis[i] < floors[1] then
					v[2] = v[2] - 490 * 2/3
					v[3] = v[3] - 490
				elseif z_axis[i] < floors[2] then
					v[2] = v[2] - 490 * 2/3
					v[3] = v[3] + 490
				elseif z_axis[i] < floors[3] then
					v[2] = v[2] + 490 * 2/3
					v[3] = v[3] - 490
				else
					v[2] = v[2] + 490 * 2/3
					v[3] = v[3] + 490
				end
				v[2] = v[2] / 2
				v[3] = v[3] / 2
				v[4] = v[4] / 2
				v[5] = v[5] / 2
			end
		end
		Floors[zone] = nil
	end
	addon:ShowInstance(zone)
end

function addon:SetMapZoom()
	self:HideInstanceFrame()
end

function addon:SetMapToCurrentZone()
	if not WorldMapFrame:IsVisible() then return end
	local zoneText = GetRealZoneText()
	if zoneText == BZL["Tempest Keep"] then
		zoneText = BZL["The Eye"]
	end
	if IsInInstance() and BZR[zoneText] and MapData[BZR[zoneText]] then
		self:ShowInstance(BZR[zoneText])
	else
		self:HideInstanceFrame()
	end
end

