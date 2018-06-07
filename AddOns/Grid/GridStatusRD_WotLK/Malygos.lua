local zone = "The Eye of Eternity"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	self:BossName(zone, 10, "Malygos")
	self:Debuff(zone, 57407, 11, 5, 5) --Surge of Power
	self:Debuff(zone, 56272, 12, 5, 5) --Arcane Breath
end

GridStatusRaidDebuff:Import(import)


