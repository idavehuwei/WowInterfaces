local zone = "Gundrak"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 59019, 1, 5, 5) --Venom Spit
	self:Debuff(zone, 58994, 2, 5, 5) --Mojo Puddle
	self:Debuff(zone, 58993, 3, 5, 5) --Mojo Wave
	self:Debuff(zone, 58992, 4, 5, 5) --Deafening Roar
	self:Debuff(zone, 55582, 5, 5, 5) --Mana Link
	self:Debuff(zone, 58977, 6, 5, 5) --Shockwave
	self:Debuff(zone, 58975, 7, 5, 5) --Thunderclap
	self:Debuff(zone, 58971, 8, 5, 5) --Flame Shock
	self:Debuff(zone, 58967, 9, 5, 5) --Poisoned Spear

	--Slad'ran
	self:BossName(zone, 10, "Slad'ran")
	self:Debuff(zone, 59842, 11, 5, 5, true) --Poison Nova
	self:Debuff(zone, 59840, 12, 5, 5) --Powerful Bite

	--Drakkari Colossus
	self:BossName(zone, 20, "Drakkari Colossus")

	--Moorabi 
	self:BossName(zone, 30, "Moorabi")
	self:Debuff(zone, 55142, 31, 5, 5) --Ground Tremor
	self:Debuff(zone, 55100, 32, 5, 5) --Numbing Roar
	self:Debuff(zone, 55106, 33, 5, 5) --Numbing Shout
	self:Debuff(zone, 55101, 34, 5, 5) --Quake

	--Gal'darah
	self:BossName(zone, 40, "Gal'darah")
	self:Debuff(zone, 59827, 41, 5, 5) --Impaling Charge
	self:Debuff(zone, 59826, 42, 5, 5, false, true) --Puncture
	self:Debuff(zone, 59825, 43, 5, 5, true, true) --Whirling Slash

	--Eck the Ferocious
	self:BossName(zone, 50, "Eck the Ferocious")
	self:Debuff(zone, 55814, 51, 5, 5) --Eck Spit
end

GridStatusRaidDebuff:Import(import)