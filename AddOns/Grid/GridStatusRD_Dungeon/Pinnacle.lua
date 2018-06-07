local zone = "Utgarde Pinnacle"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 59080, 1, 5, 5) --Grave Strike
	self:Debuff(zone, 49106, 2, 5, 5) --Terrify
	self:Debuff(zone, 59243, 3, 5, 5) --Aimed Shot
	self:Debuff(zone, 49092, 4, 5, 5) --Net
	self:Debuff(zone, 59237, 5, 5, 5) --Beast's Mark
	self:Debuff(zone, 59247, 6, 5, 5) --Shrink
	self:Debuff(zone, 56785, 7, 5, 5) --Volatile Infection

	--Svala Sorrowgrave
	self:BossName(zone, 10, "Svala Sorrowgrave")
	self:Debuff(zone, 59408, 11, 5, 5, false, true) --Shadows in the Dark
	self:Debuff(zone, 48278, 12, 5, 5) --Paralyze

	--Gortok Palehoof
	self:BossName(zone, 20, "Gortok Palehoof")
	self:Debuff(zone, 59268, 21, 5, 5) --Impale
	self:Debuff(zone, 59267, 22, 5, 5, false, true) --Withering Roar
	--Sub Bosses
	self:Debuff(zone, 59263, 21, 5, 5) --Grievous Wound
	self:Debuff(zone, 48132, 21, 5, 5, false, true) --Acid Spit
	self:Debuff(zone, 59271, 21, 5, 5, true, true) --Poison Breath
	self:Debuff(zone, 48144, 21, 5, 5) --Terrifying Roar


	--Skadi the Ruthless
	self:BossName(zone, 30, "Skadi the Ruthless")
	self:Debuff(zone, 59330, 31, 5, 5) --Crush
	self:Debuff(zone, 59331, 32, 5, 5) --Poisoned Spear

	--King Ymiron
	self:BossName(zone, 40, "King Ymiron")
	self:Debuff(zone, 59300, 41, 5, 5) --Fetid Rot
	self:Debuff(zone, 59304, 42, 5, 5, false, true) --Spirit Strike
	self:Debuff(zone, 51750, 43, 5, 5, true) --Screams of the Dead
end

GridStatusRaidDebuff:Import(import)