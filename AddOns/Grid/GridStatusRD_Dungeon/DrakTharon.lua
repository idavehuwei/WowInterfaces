local zone = "Drak'Tharon Keep"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 50379, 1, 5, 5) --Cripple
	self:Debuff(zone, 59018, 2, 5, 5) --Bile Vomit
	self:Debuff(zone, 16856, 3, 5, 5, true) --Mortal Strike
	self:Debuff(zone, 49704, 4, 5, 5) --Encasing Webs
	self:Debuff(zone, 32330, 5, 5, 5) --Poison Spit
	self:Debuff(zone, 59009, 6, 5, 5) --Curse of Blood
	self:Debuff(zone, 49710, 7, 5, 5, false, true) --Gut Rip
	self:Debuff(zone, 59010, 8, 5, 5) --Deafening Roar
	self:Debuff(zone, 51240, 9, 5, 5) --Fear
	self:Debuff(zone, 59011, 10, 5, 5) --Icy Touch

	--Trollgore
	self:BossName(zone, 20, "Trollgore")
	self:Debuff(zone, 49637, 21, 5, 5) --Infected Wound

	--Novos the Summoner
	self:BossName(zone, 30, "Novos the Summoner")
	self:Debuff(zone, 59856, 31, 5, 5) --Wrath of Misery
	self:Debuff(zone, 59854, 32, 5, 5) --Blizzard

	--King Dred
	self:BossName(zone, 40, "King Dred")
	self:Debuff(zone, 22686, 41, 5, 5, true) --Bellowing Roar
	self:Debuff(zone, 48920, 42, 5, 5) --Grievous Bite
	self:Debuff(zone, 48873, 43, 5, 5, true) --Mangling Slash
	self:Debuff(zone, 48878, 44, 5, 5, true) --Piercing Slash

	--The Prophet Tharon'ja
	self:BossName(zone, 50, "The Prophet Tharon'ja")
	self:Debuff(zone, 59969, 51, 5, 5) --Poison Cloud
	self:Debuff(zone, 49356, 52, 5, 5) --Decay Flesh
	self:Debuff(zone, 53463, 53, 5, 5) --Return Flesh
	self:Debuff(zone, 59965, 54, 5, 5) --Eye Beam
	self:Debuff(zone, 59972, 55, 5, 5) --Curse of Life
end

GridStatusRaidDebuff:Import(import)