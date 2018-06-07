local zone = "Icecrown Citadel"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon



local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--The Lower Spire
	self:Debuff(zone, 70980, 1, 6, 5) --Web Wrap
	self:Debuff(zone, 69483, 1, 6, 5, true) --Dark Reckoning
	self:Debuff(zone, 69969, 1, 5, 5, true) --Curse of Doom

	--The Plagueworks
	self:Debuff(zone, 71089, 2, 5, 5, true) --Bubbling Pus
	self:Debuff(zone, 71127, 2, 7, 5, true, true) --Mortal Wound
	self:Debuff(zone, 71163, 2, 6, 5, true) --Devour Humanoid
	self:Debuff(zone, 71103, 2, 6, 5) --Combobulating Spray
	self:Debuff(zone, 71157, 2, 5, 5, false, true)--Infested Wound

	--The Crimson Hall
	self:Debuff(zone, 70645, 3, 9, 5, true, false, {r=1,g=0,b=0})  --Chains of Shadow
	self:Debuff(zone, 70671, 3, 5, 5)-- Leeching Rot
	self:Debuff(zone, 70432, 3, 6, 5, true) --Blood Sap
	self:Debuff(zone, 70435, 3, 7, 5, true, true) --Rend Flesh

	--Frostwing Hall
	self:Debuff(zone, 71257, 4, 6, 5, true, true) --Barbaric Strike
	self:Debuff(zone, 71252, 4, 5, 5, true) --Volley

	self:Debuff(zone, 71327, 4, 6, 5) -- Web
	self:Debuff(zone, 36922, 4, 5, 5, true) --Bellowing Roar

	--Lord Marrowgar
	self:BossName(zone, 10, "Lord Marrowgar")
	self:Debuff(zone, 70823, 11, 5, 5, true) --Coldflame
	self:Debuff(zone, 69065, 12, 8, 5) --Impaled
	self:Debuff(zone, 70835, 13, 5, 5) --Bone Storm

	--Lady Deathwhisper
	self:BossName(zone, 20, "Lady Deathwhisper")
	self:Debuff(zone, 72109, 21, 5, 5) --Death and Decay
	self:Debuff(zone, 71289, 22, 9, 9, true) --Dominate Mind
	self:Debuff(zone, 71204, 23, 4, 4, true, true) --Touch of Insignificance
	self:Debuff(zone, 67934, 24, 5, 5, true) --Frost Fever
	self:Debuff(zone, 71237, 25, 5, 5, true, false, nil, true) --Curse of Torpor
	self:Debuff(zone, 72491, 26, 5, 5, true) --Necrotic Strike

	--Gunship Battle
	self:BossName(zone, 30, "Icecrown Gunship Battle")
	self:Debuff(zone, 69651, 31, 5, 5, true) --Wounding Strike

	--Deathbringer Saurfang
	self:BossName(zone, 40, "Deathbringer Saurfang")
	self:Debuff(zone, 72293, 41, 6, 8, false, false, {r=1,g=0,b=0}) --Mark of the Fallen Champion
	self:Debuff(zone, 72442, 42, 8, 5, true) --Boiling Blood
	self:Debuff(zone, 72449, 43, 5, 5, true) --Rune of Blood
	self:Debuff(zone, 72769, 44, 5, 5, true) --Scent of Blood (heroic)

	--Rotface
	self:BossName(zone, 50, "Rotface")
	self:Debuff(zone, 71224, 51, 5, 7, true) --Mutated Infection
	self:Debuff(zone, 71215, 52, 5, 5) --Ooze Flood
	self:Debuff(zone, 69774, 53, 5, 5) --Sticky Ooze

	--Festergut
	self:BossName(zone, 60, "Festergut")
	self:Debuff(zone, 69279, 61, 5, 5, true) --Gas Spore
	self:Debuff(zone, 71218, 62, 5, 5, true) --Vile Gas
	self:Debuff(zone, 72219, 63, 5, 5, true, true) --Gastric Bloat

	--Proffessor
	self:BossName(zone, 70, "Professor Putricide")
	self:Debuff(zone, 70341, 71, 5, 5, true) --Slime Puddle
	self:Debuff(zone, 72549, 72, 5, 5, true) --Malleable Goo
	self:Debuff(zone, 71278, 73, 5, 5, true) --Choking Gas Bomb
	self:Debuff(zone, 70215, 74, 5, 5, true) --Gaseous Bloat
	self:Debuff(zone, 70447, 75, 5, 5, true) --Volatile Ooze Adhesive
	self:Debuff(zone, 72454, 76, 5, 5, true, true) --Mutated Plague
	self:Debuff(zone, 70405, 77, 5, 5, false, false, {r=1, g=0, b=0}) --Mutated Transformation
	self:Debuff(zone, 72856, 78, 6, 4, true) --Unbound Plague
	self:Debuff(zone, 70953, 79, 4, 6, true, true, {r=0, g=0, b=1}) --Plague Sickness
	--Blood Princes
	self:BossName(zone, 80, "Blood Princes")
	self:Debuff(zone, 72796, 81, 7, 5, true) --Glittering Sparks
	self:Debuff(zone, 71822, 82, 5, 7) --Shadow Resonance

	--Blood-Queen Lana'thel
	self:BossName(zone, 90, "Blood-Queen Lana'thel")
	self:Debuff(zone, 70838, 91, 5, 5) --Blood Mirror
	self:Debuff(zone, 72265, 92, 6, 5, true) --Delirious Slash
	self:Debuff(zone, 71473, 93, 5, 7, true) --Essence of the Blood Queen
	self:Debuff(zone, 71474, 94, 6, 5, true) --Frenzied Bloodthirst
	self:Debuff(zone, 73070, 95, 5, 5, true) --Incite Terror
	self:Debuff(zone, 71340, 96, 7, 5) --Pact of the Darkfallen
	self:Debuff(zone, 71265, 97, 6, 5) --Swarming Shadows
	self:Debuff(zone, 70923, 98, 10, 10) --Uncontrollable Frenzy

	--Valithria Dreamwalker
	self:BossName(zone, 100, "Valithria Dreamwalker")
	self:Debuff(zone, 70873, 101, 1, 5, true, true) --Emerald Vigor
	self:Debuff(zone, 71746, 102, 5, 5) --Column of Frost
	self:Debuff(zone, 71741, 103, 4, 5) --Mana Void
	self:Debuff(zone, 71738, 104, 7, 5, true, true) --Corrosion
	self:Debuff(zone, 71733, 105, 6, 5, true) --Acid Burst
	self:Debuff(zone, 71283, 106, 6, 5, true) --Gut Spray
	self:Debuff(zone, 71941, 107, 1, 5, true, true) --Twisted Nightmares

	--Sindragosa
	self:BossName(zone, 110, "Sindragosa")
	self:Debuff(zone, 69762, 111, 5, 5, true) --Unchained Magic
	self:Debuff(zone, 70106, 112, 6, 5, true, true) --Chlled to the Bone
	self:Debuff(zone, 69766, 113, 6, 5, true, true) --Instability
	self:Debuff(zone, 70126, 114, 9, 5, true) --Frost Beacon
	self:Debuff(zone, 70157, 115, 8, 5, true) --Ice Tomb
	self:Debuff(zone, 70127, 116, 7, 5, false, true) --Mystic Buffet

	--The Lich King
	self:BossName(zone, 120, "The Lich King")
	self:Debuff(zone, 70337, 121, 8, 5, true, true) --Necrotic plague
	self:Debuff(zone, 72149, 122, 5, 5, true) --Shockwave
	self:Debuff(zone, 70541, 123, 7, 5) --Infest
	self:Debuff(zone, 69242, 124, 5, 5, true) --Soul Shriek  -- 69200 Raging Spirit
	self:Debuff(zone, 69409, 125, 9, 5, true) --Soul Reaper
	self:Debuff(zone, 72762, 126, 5, 5) --Defile
	self:Debuff(zone, 68980, 127, 8, 5) --Harvest Soul
end

GridStatusRaidDebuff:Import(import)

