local zone = "Azjol-Nerub"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 52086, 1, 5, 5, true) --Web Wrap
	self:Debuff(zone, 59364, 2, 5, 5) --Infected Bite
	self:Debuff(zone, 59365, 3, 5, 5) --Blinding Webs
	self:Debuff(zone, 59366, 4, 5, 5) --Poison Spray
	self:Debuff(zone, 59348, 5, 5, 5) --Infected Wound
	self:Debuff(zone, 59354, 6, 5, 5, true, true) --Drain Power
	self:Debuff(zone, 59352, 7, 5, 5) --Mark of Darkness

	--Krik'thir the Gatewatcher

	self:BossName(zone, 10, "Krik'thir the Gatewatcher")
	self:Debuff(zone, 59368, 11, 5, 5) --Curse of Fatigue

	--Hadronox
	self:BossName(zone, 20, "Hadronox")
	self:Debuff(zone, 59419, 21, 5, 5) --Acid cloud
	self:Debuff(zone, 59417, 22, 5, 5) --Leech Poison
	self:Debuff(zone, 53418, 23, 5, 5) --Pierce Armor

	--Anub'arak
	self:BossName(zone, 30, "Anub'arak")
	self:Debuff(zone, 59433, 31, 5, 5, true) --Pound
end

GridStatusRaidDebuff:Import(import)