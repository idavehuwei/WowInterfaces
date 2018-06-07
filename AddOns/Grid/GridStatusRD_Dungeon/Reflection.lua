local zone = "Halls of Reflection"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 72215, 1, 5, 5) --Frost Trap
	self:Debuff(zone, 72269, 2, 5, 5) --Ice Shot
	self:Debuff(zone, 72222, 3, 5, 5) --Cursed Arrow
	self:Debuff(zone, 72330, 4, 5, 5) --Deadly Poison
	self:Debuff(zone, 72334, 5, 5, 5) --Envenomed Dagger Throw
	self:Debuff(zone, 72335, 6, 5, 5) --Kidney Shot
	self:Debuff(zone, 16856, 7, 5, 5) --Mortal Strike
	self:Debuff(zone, 72170, 8, 5, 5) --Flamestrike
	self:Debuff(zone, 72171, 9, 5, 5) --Chains of Ice
	self:Debuff(zone, 72321, 10, 5, 5) --Cower in Fear
	self:Debuff(zone, 72319, 11, 5, 5) --Shadow Word: Pain
	self:Debuff(zone, 73076, 12, 5, 5) --Throw Shield

	--Falric
	self:BossName(zone, 20, "Falric")
	self:Debuff(zone, 72452, 21, 5, 5) --Defiling Horror
	self:Debuff(zone, 72390, 22, 5, 5) --Hopelessness(25)
	self:Debuff(zone, 72391, 23, 5, 5) --Hopelessness(50)
	self:Debuff(zone, 72393, 24, 5, 5) --Hopelessness(75)
	self:Debuff(zone, 72426, 25, 5, 5) --Impending Despair

	--Marwyn
	self:BossName(zone, 30, "Marwyn")
	self:Debuff(zone, 72436, 31, 5, 5) --Corrupted Flesh
	self:Debuff(zone, 72369, 32, 5, 5) --Shared Suffering
	self:Debuff(zone, 72383, 33, 5, 5) --Corrupted Touch

	--The Lich King
	self:BossName(zone, 40, "The Lich King")
	self:Debuff(zone, 70183, 41, 5, 5) --Curse of Doom
	self:Debuff(zone, 59018, 42, 5, 5) --Bile Vomit
end

GridStatusRaidDebuff:Import(import)