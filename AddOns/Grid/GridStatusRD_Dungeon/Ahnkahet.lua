local zone = "Ahn'kahet: The Old Kingdom"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 59108, 1, 5, 5, true) --Glutinous Poison
	self:Debuff(zone, 56707, 2, 5, 5) --Contagion of Rot
	self:Debuff(zone, 61460, 3, 5, 5, false, true) --Aura of Lost Hope
	self:Debuff(zone, 56728, 4, 5, 5, true) --Eyes in the Dark
	self:Debuff(zone, 61462, 5, 5, 5) --Frost Nova
	self:Debuff(zone, 29544, 6, 5, 5, true) --Frightening Shout
	self:Debuff(zone, 56858, 7, 5, 5) --Flamestrike
	self:Debuff(zone, 13338, 8, 5, 5, true) --Curse of Tongues
	self:Debuff(zone, 61563, 9, 5, 5, true) --Corruption
	self:Debuff(zone, 57061, 10, 5, 5) --Poison Cloud(Poisonous Mushroom)
	self:Debuff(zone, 59116, 11, 5, 5) --Poison Cloud(Savage Cave Beast)
	self:Debuff(zone, 34322, 12, 5, 5) --Psychic Scream

	--Elder Nadox
	self:BossName(zone, 20, "Elder Nadox")
	self:Debuff(zone, 59467, 21, 5, 5, true) --Brood Plague

	--Prince Taldaram
	self:BossName(zone, 30, "Prince Taldaram")
	self:Debuff(zone, 55959, 31, 5, 5) --Embrace of the Vampyr

	--Jedoga Shadowseeker
	self:BossName(zone, 40, "Jedoga Shadowseeker")

	--Herald Volazj
	self:BossName(zone, 50, "Herald Volazj")
	self:Debuff(zone, 59974, 51, 5, 5) --Mind Flay
	self:Debuff(zone, 59978, 52, 5, 5, false, true) --Shiver

	--Amanitar
	self:BossName(zone, 60, "Amanitar")
	self:Debuff(zone, 57055, 61, 5, 5, true) --Mini
	self:Debuff(zone, 57095, 61, 5, 5) --Entangling Roots
end

GridStatusRaidDebuff:Import(import)
