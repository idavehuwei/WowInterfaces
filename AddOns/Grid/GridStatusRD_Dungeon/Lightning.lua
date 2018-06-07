local zone = "Halls of Lightning"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 58619, 1, 5, 5) --Charge
	self:Debuff(zone, 59178, 2, 5, 5) --Poison Tipped Spear
	self:Debuff(zone, 19134, 3, 5, 5) --Frightening Shout
	self:Debuff(zone, 23600, 4, 5, 5) --Piercing Howl
	self:Debuff(zone, 60236, 5, 5, 5) --Cyclone
	self:Debuff(zone, 59168, 6, 5, 5) --Electro Shock
	self:Debuff(zone, 59085, 7, 5, 5, true) --Arc Weld
	self:Debuff(zone, 59166, 8, 5, 5) --Welding Beam
	self:Debuff(zone, 59165, 9, 5, 5, true) --Sleep
	self:Debuff(zone, 32315, 10, 5, 5, true) --Soul Strike
	self:Debuff(zone, 61579, 11, 5, 5, true) --Runic Focus
	self:Debuff(zone, 59834, 12, 5, 5, false, true) --Arcing Burn
	self:Debuff(zone, 59530, 13, 5, 5) --Immolation Strike
	self:Debuff(zone, 61510, 14, 5, 5, false, true) --Melt Armor

	--General Bjarngrim
	self:BossName(zone, 20, "General Bjarngrim")
	self:Debuff(zone, 16856, 21, 5, 5) --Mortal Strike

	--Volkhan
	self:BossName(zone, 30, "Volkhan")

	--Ionar
	self:BossName(zone, 40, "Ionar")
	self:Debuff(zone, 59795, 41, 5, 5, true) --Static Overload

	--Loken
	self:BossName(zone, 50, "Loken")
	self:Debuff(zone, 52921, 51, 5, 5) --Arc Lightning
end

GridStatusRaidDebuff:Import(import)