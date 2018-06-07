local zone = "The Culling of Stratholme"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 58810, 1, 5, 5) --Wretching Bile
	self:Debuff(zone, 58770, 2, 5, 5) --Drain Mana
	self:Debuff(zone, 20812, 3, 5, 5) --Cripple
	self:Debuff(zone, 58782, 4, 5, 5) --Hemotoxin
	self:Debuff(zone, 58816, 5, 5, 5) --Temporal Vortex
	self:Debuff(zone, 58811, 6, 5, 5) --Corruption
	self:Debuff(zone, 46190, 7, 5, 5) --Curse of Agony

	--Meathook
	self:BossName(zone, 10, "Meathook")
	self:Debuff(zone, 29544, 11, 5, 5, true) --Constricting Chains

	--Salramm the Fleshcrafter
	self:BossName(zone, 20, "Salramm the Fleshcrafter")
	self:Debuff(zone, 58823, 21, 5, 5) --Curse of Twisted Flesh

	--Chrono-Lord Epoch
	self:BossName(zone, 30, "Chrono-Lord Epoch")
	self:Debuff(zone, 52772, 31, 5, 5, true) --Curse of Exertion
	self:Debuff(zone, 58848, 31, 5, 5) --Time Stop
	self:Debuff(zone, 52766, 31, 5, 5, true) --Time Warp

	--Mal'Ganis
	self:BossName(zone, 40, "Mal'Ganis")
	self:Debuff(zone, 58852, 41, 5, 5) --Carrion Swarm
	self:Debuff(zone, 58849, 42, 5, 5, true) --Sleep

	--Infinite Corruptor
	self:BossName(zone, 50, "Infinite Corruptor")
	self:Debuff(zone, 60588, 51, 5, 5, false, true) --Corrupting Blight
end

GridStatusRaidDebuff:Import(import)