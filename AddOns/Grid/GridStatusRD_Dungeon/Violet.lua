local zone = "The Violet Hold"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 32736, 1, 5, 5) --Mortal Strike
	self:Debuff(zone, 59253, 2, 5, 5) --Frost Nova
	self:Debuff(zone, 30849, 3, 5, 5) --Spell Lock
	self:Debuff(zone, 58537, 4, 5, 5) --Polymorph
	self:Debuff(zone, 60204, 5, 5, 5) --Arcane Stream
	self:Debuff(zone, 58464, 6, 5, 5) --Chains of Ice
	self:Debuff(zone, 58534, 7, 5, 5) --Deep Freeze
	self:Debuff(zone, 58504, 8, 5, 5) --Agonizing Strike
	self:Debuff(zone, 58526, 9, 5, 5) --Azure Bindings

	--Erekem
	self:BossName(zone, 10, "Erekem")
	self:Debuff(zone, 51876, 11, 5, 5) --Stormstrike
	self:Debuff(zone, 29544, 12, 5, 5) --dddd
	self:Debuff(zone, 29544, 13, 5, 5) --dddd
	self:Debuff(zone, 29544, 14, 5, 5) --dddd
	self:Debuff(zone, 29544, 15, 5, 5) --dddd
	self:Debuff(zone, 29544, 16, 5, 5) --dddd

	--Moragg
	self:BossName(zone, 20, "Moragg")
	self:Debuff(zone, 54527, 21, 5, 5, false, true) --Corrosive Saliva
	self:Debuff(zone, 54396, 22, 5, 5) --Optic Link

	--Ichoron
	self:BossName(zone, 30, "Ichoron")

	--Xevozz
	self:BossName(zone, 40, "Xevozz")
	self:Debuff(zone, 59485, 41, 5, 5, false, true) --Arcane Buffet

	--Lavanthor
	self:BossName(zone, 50, "Lavanthor")
	self:Debuff(zone, 59466, 51, 5, 5) --Cauterizing Flames

	--Zuramat the Obliterator
	self:BossName(zone, 60, "Zuramat the Obliterator")
	self:Debuff(zone, 59743, 61, 5, 5) --Void Shift
	self:Debuff(zone, 59746, 62, 5, 5, false, true) --Shroud of Darkness

	--Cyanigosa
	self:BossName(zone, 70, "Cyanigosa")
	self:Debuff(zone, 59369, 71, 5, 5) --Blizzard
	self:Debuff(zone, 59374, 72, 5, 5) --Mana Destruction
	self:Debuff(zone, 59281, 73, 5, 5) --Uncontrollable Energy
end

GridStatusRaidDebuff:Import(import)
