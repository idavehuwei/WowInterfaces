local zone = "The Forge of Souls"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 69130, 1, 5, 5, false, true) --Soul Siphon
	self:Debuff(zone, 69131, 2, 5, 5, true) --Soul Sickness
	self:Debuff(zone, 70213, 3, 5, 5) --Drain Life
	self:Debuff(zone, 69633, 4, 5, 5) --Veil of Shadow

	--Bronjahm
	self:BossName(zone, 10, "Bronjahm")
	self:Debuff(zone, 68839, 11, 5, 5) --Corrupt Soul
	self:Debuff(zone, 68950, 12, 5, 5) --Fear
	self:Debuff(zone, 68872, 13, 5, 5) --Soulstorm

	--Devourer of Souls
	self:BossName(zone, 20, "Devourer of Souls")
	self:Debuff(zone, 68820, 21, 5, 5) --Well of Souls
	self:Debuff(zone, 69051, 22, 5, 5) --Mirrored Soul
	self:Debuff(zone, 68912, 23, 5, 5) --Wailing Souls
end

GridStatusRaidDebuff:Import(import)