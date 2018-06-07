local zone = "Trial of the Champion"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 67237, 1, 5, 5) --Unbalancing Strike
	self:Debuff(zone, 67255, 2, 5, 5) --Final Meditation
	self:Debuff(zone, 67229, 3, 5, 5) --Mind Control
	self:Debuff(zone, 34942, 4, 5, 5) --Shadow Word: Pain

	--Grand Champions
	self:BossName(zone, 10, "Grand Champions")
	self:Debuff(zone, 68311, 11, 5, 5) --Polymorph
	self:Debuff(zone, 68784, 12, 5, 5) --Mortal Strike
	self:Debuff(zone, 67534, 13, 5, 5) --Hex of Mending
	self:Debuff(zone, 68315, 14, 5, 5) --Deadly Poison
	self:Debuff(zone, 68316, 15, 5, 5) --Poison Bottle

	--Eadric the Pure
	self:BossName(zone, 20, "Eadric the Pure")
	self:Debuff(zone, 66863, 21, 5, 5) --Hammer of Justice
	self:Debuff(zone, 67681, 22, 5, 5) --Radiance

	--Argent Confessor Paletress
	self:BossName(zone, 30, "Argent Confessor Paletress")
	self:Debuff(zone, 67676, 31, 5, 5) --Holy Fire
	self:Debuff(zone, 67677, 32, 5, 5) --Waking Nightmare
	self:Debuff(zone, 67678, 33, 5, 5) --Shadows of the Past
	self:Debuff(zone, 67679, 34, 5, 5) --Old Wounds
	self:Debuff(zone, 47731, 35, 5, 5) --dddd
	self:Debuff(zone, 47731, 36, 5, 5) --dddd

	--The Black Knight
	self:BossName(zone, 40, "The Black Knight")
	self:Debuff(zone, 67885, 41, 5, 5) --Blood Plague
	self:Debuff(zone, 68305, 42, 5, 5) --Death's Respite
	self:Debuff(zone, 67823, 43, 5, 5) --Marked For Death
	self:Debuff(zone, 67875, 44, 5, 5, false, true) --Death's Bite
	self:Debuff(zone, 67876, 45, 5, 5) --Desecration
end

GridStatusRaidDebuff:Import(import)