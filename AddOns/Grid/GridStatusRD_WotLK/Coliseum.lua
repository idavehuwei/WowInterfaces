zone = "Trial of the Crusader"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--<< Beast of Northrend >>
--Gormok the Impaler


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	self:BossName(zone, 10, "Gormok the Impaler")
	self:Debuff(zone, 66331, 11, 5, 5, true, true) --Impale
	self:Debuff(zone, 67475, 13, 5, 5, true) --Fire Bomb
	self:Debuff(zone, 66406, 14, 5, 5) --Snowbolled!

	--Acidmaw --Dreadscale
	self:BossName(zone, 20, "Jormungar Behemoth")
	self:Debuff(zone, 67618, 23, 5, 5, true) --Paralytic Toxin
	self:Debuff(zone, 66869, 24, 5, 5, true) --Burning Bile

	--Icehowl
	self:BossName(zone, 30, "Icehowl")
	self:Debuff(zone, 67654, 31, 5, 5, true) --Ferocious Butt
	self:Debuff(zone, 66689, 32, 5, 5) --Arctic Breathe
	self:Debuff(zone, 66683, 33, 5, 5) --Massive Crash

	--Lord Jaraxxus
	self:BossName(zone, 40, "Lord Jaraxxus")
	self:Debuff(zone, 66532, 41, 5, 5) --Fel Fireball
	self:Debuff(zone, 66237, 42, 8, 10, true, false, {r=1, g=0, b=0}) --Incinerate Flesh
	self:Debuff(zone, 66242, 43, 7, 5, true) --Burning Inferno
	self:Debuff(zone, 66197, 44, 5, 5) --Legion Flame
	self:Debuff(zone, 66283, 45, 9, 5, true) --Spinning Pain Spike
	self:Debuff(zone, 66209, 46, 5, 5, true) --Touch of Jaraxxus(hard)
	self:Debuff(zone, 66211, 47, 5, 5, true) --Curse of the Nether(hard)
	self:Debuff(zone, 67906, 48, 5, 5) --Mistress's Kiss 10H

	--Faction Champions
	self:BossName(zone, 50, "Faction Champions")
	self:Debuff(zone, 65812, 51, 10, 10, true, false, {r=1, g=0, b=0}) --Unstable Affliction
	self:Debuff(zone, 65960, 52, 5, 5, true) --Blind
	self:Debuff(zone, 65801, 53, 5, 7) --Polymorph
	self:Debuff(zone, 65543, 54, 5, 7) --Psychic Scream
	self:Debuff(zone, 66054, 55, 5, 7) --Hex
	self:Debuff(zone, 65809, 56, 5, 7) --Fear

	--The Twin Val'kyr
	self:BossName(zone, 60, "The Twin Val'kyr")
	self:Debuff(zone, 67176, 61, 5, 10, false, false, {r=1, g=0, b=0}, true) --Dark Essence
	self:Debuff(zone, 67222, 62, 5, 10, false, false, {r=0, g=0, b=1}, true) --Light Essence
	self:Debuff(zone, 67283, 63, 7, 5, true) --Dark Touch
	self:Debuff(zone, 67298, 64, 7, 5, true) --Ligth Touch
	self:Debuff(zone, 67309, 65, 5, 5, false, true) --Twin Spike

	--Anub'arak
	self:BossName(zone, 70, "Anub'arak")
	self:Debuff(zone, 67574, 71, 10, 10) --Pursued by Anub'arak
	self:Debuff(zone, 66013, 72, 7, 10, true, false, {r=1, g=0, b=0}) --Penetrating Cold (10?)
	self:Debuff(zone, 67847, 73, 5, 5, false, true) --Expose Weakness
	self:Debuff(zone, 66012, 74, 5, 5) --Freezing Slash
	self:Debuff(zone, 67863, 75, 8, 5, false, true) --Acid-Drenched Mandibles(25H)
end

GridStatusRaidDebuff:Import(import)

