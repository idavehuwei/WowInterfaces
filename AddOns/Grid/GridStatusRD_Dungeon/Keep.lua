local zone = "Utgarde Keep"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 43651, 1, 5, 5) --Charge
	self:Debuff(zone, 59605, 2, 5, 5) --Piercing Jab
	self:Debuff(zone, 59695, 3, 5, 5) --Debilitating Strike
	self:Debuff(zone, 6713, 4, 5, 5) --Disarm
	self:Debuff(zone, 22427, 5, 5, 5, true) --Concussion Blow
	self:Debuff(zone, 42972, 6, 5, 5) --Blind
	self:Debuff(zone, 51588, 7, 5, 5) --Flame Shock
	self:Debuff(zone, 59601, 8, 5, 5, true, true) --Burning Brand
	self:Debuff(zone, 59599, 9, 5, 5) --Head Crack

	--Prince Keleseth
	self:BossName(zone, 10, "Prince Keleseth")
	self:Debuff(zone, 48400, 11, 5, 5) --Frost Tomb

	--Skarvald the Constructor
	self:BossName(zone, 20, "Skarvald the Constructor")
	self:Debuff(zone, 43651, 21, 5, 5) --Charge

	--Dalronn the Controller
	self:BossName(zone, 22, "Dalronn the Controller")
	self:Debuff(zone, 43650, 23, 5, 5) --Debilitate

	--Ingvar the Plunderer
	self:BossName(zone, 30, "Ingvar the Plunderer")
	self:Debuff(zone, 59735, 31, 5, 5) --Woe Strike
end

GridStatusRaidDebuff:Import(import)