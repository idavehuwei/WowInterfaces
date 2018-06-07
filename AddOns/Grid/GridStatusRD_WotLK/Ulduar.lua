local zone = "Ulduar"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
local GridStatusRaidDebuff = GridStatusRaidDebuff;

--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 63612, 2, 5, 5, true, true) --Lightning Brand
	self:Debuff(zone, 63615, 3, 10, 5, true, true) --Ravage Armor
	self:Debuff(zone, 63169, 6, 5, 5, true, true) --Petrify Joints

	--Razorscale
	self:BossName(zone, 10, "Razorscale")
	self:Debuff(zone, 64771, 11, 5, 5, true) --Fuse Armor

	--Ignis the Furnace Master
	self:BossName(zone, 15, "Ignis the Furnace Master")
	self:Debuff(zone, 62548, 16, 5, 5, true) --Scorch
	self:Debuff(zone, 62680, 17, 5, 5) --Flame Jet
	self:Debuff(zone, 62717, 18, 6, 5, true) --Slag Pot

	--XT-002
	self:BossName(zone, 20, "XT-002 Deconstructor")
	self:Debuff(zone, 63024, 21, 5, 5, true) --Gravity Bomb
	self:Debuff(zone, 63018, 22, 5, 5, true) --Light Bomb

	--The Assembly of Iron
	self:BossName(zone, 30, "The Iron Council")
	self:Debuff(zone, 61888, 31, 5, 5, true) --Overwhelming Power
	self:Debuff(zone, 62269, 32, 6, 5) --Rune of Death
	self:Debuff(zone, 61903, 33, 5, 5) --Fusion Punch
	self:Debuff(zone, 61912, 34, 5, 5, true) --Static Disruption

	--Kologarn
	self:BossName(zone, 40, "Kologarn")
	self:Debuff(zone, 64290, 41, 5, 5, true) --Stone Grip
	self:Debuff(zone, 63355, 42, 10, 5, true, true) --Crunch Armor
	self:Debuff(zone, 62055, 43, 5, 5, false, true) --Brittle Skin

	--Hodir
	self:BossName(zone, 50, "Hodir")
	self:Debuff(zone, 62469, 51, 5, 5) --Freeze
	self:Debuff(zone, 61969, 52, 10, 5) --Flash Freeze
	self:Debuff(zone, 62188, 53, 5, 5, false, true, nil, true) --Biting Cold

	--Thorim
	self:BossName(zone, 60, "Thorim")
	self:Debuff(zone, 62042, 61, 5, 5) --Stormhammer
	self:Debuff(zone, 62130, 62, 10, 5, true) --Unbalancing Strike
	self:Debuff(zone, 62526, 63, 5, 5, true) --Rune Detonation
	self:Debuff(zone, 62470, 64, 5, 5, false, false, nil, true) --Deafening Thunder
	self:Debuff(zone, 62331, 65, 5, 5) --Impale

	--Freya
	self:BossName(zone, 70, "Freya")
	self:Debuff(zone, 62589, 71, 5, 5, true) --Nature's Fury
	self:Debuff(zone, 62861, 73, 5, 5) --Iron Roots

	--Mimiron
	self:BossName(zone, 80, "Mimiron")
	self:Debuff(zone, 63666, 81, 5, 5, true) --Napalm Shell
	self:Debuff(zone, 62997, 82, 5, 5, true) --Plasma Blast
	self:Debuff(zone, 64668, 83, 5, 5) --Magnetic Field

	--General Vezax
	self:BossName(zone, 90, "General Vezax")
	self:Debuff(zone, 63276, 91, 10, 5, true) --Mark of the Faceless
	self:Debuff(zone, 63322, 92, 5, 5, false, true) --Saronite Vapors

	--Yogg-Saron
	self:BossName(zone, 100, "Yogg-Saron")
	self:Debuff(zone, 63134, 101, 10, 5, true) --Sara's Bless
	self:Debuff(zone, 63138, 102, 5, 10, true, false, {r=1,g=0,b=0}) --Sara's Fevor
	self:Debuff(zone, 63830, 103, 5, 5, true) --Malady of the Mind
	self:Debuff(zone, 63802, 104, 5, 5) --Brain Link(Heroic)
	self:Debuff(zone, 63042, 105, 5, 5, true) --Dominate Mind
	self:Debuff(zone, 64156, 106, 5, 7) --Apathy
	self:Debuff(zone, 64153, 107, 5, 7) --Black Plague
	self:Debuff(zone, 64157, 108, 5, 7) --Curse of Doom
	self:Debuff(zone, 64152, 109, 5, 7) --Draining Poison (Heroic)
	self:Debuff(zone, 64125, 110, 10, 5) --Squeeze
	self:Debuff(zone, 63050, 111, 5, 5, false, false, nil, true) --Sanity

	--Algalon
	self:BossName(zone, 120, "Algalon the Observer")
	self:Debuff(zone, 64412, 121, 5, 5, true, true) --Phase Punch
end

GridStatusRaidDebuff:Import(import)

