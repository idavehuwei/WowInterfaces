local zone = "Vault of Archavon"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Koralon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	self:BossName(zone, 10, "Koralon the Flame Watcher")
	self:Debuff(zone, 67332, 11, 5, 5) --Flaming Cinder

	--GridStatusRaidDebuff:BossName(zone, 20, "Toravon the Ice Watcher")
	self:Debuff(zone, 71993, 21, 5, 5, true, true) --Frozen Mallet
	self:Debuff(zone, 72098, 23, 5, 5, true, true) --Frostbite
	self:Debuff(zone, 72104, 23, 5, 5, true) --Freezing Ground
end

GridStatusRaidDebuff:Import(import)
