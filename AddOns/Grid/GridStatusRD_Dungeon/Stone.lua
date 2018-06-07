local zone = "Halls of Stone"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 51503, 1, 5, 5, true) --Domination
	self:Debuff(zone, 59034, 2, 5, 5) --Chiseling Ray
	self:Debuff(zone, 59864, 3, 5, 5) --Shadow Word: Pain
	self:Debuff(zone, 59865, 4, 5, 5, true) --Ground Smash
	self:Debuff(zone, 59039, 5, 5, 5, true) --Unrelenting Strike
	self:Debuff(zone, 59851, 6, 5, 5, true) --Lightning Tether

	--Maiden of Grief
	self:BossName(zone, 10, "Maiden of Grief")
	self:Debuff(zone, 59727, 11, 5, 5) --Pillar of Woe
	self:Debuff(zone, 59726, 12, 5, 5) --Shock of Sorrow

	--Krystallus
	self:BossName(zone, 20, "Krystallus")
	self:Debuff(zone, 50812, 21, 5, 5, true) --Stoned

	--The Tribunal of Ages
	self:BossName(zone, 30, "The Tribunal of Ages")
	self:Debuff(zone, 59868, 31, 5, 5) --Dark Matter

	--Sjonnir The Ironshaper
	self:BossName(zone, 40, "Sjonnir The Ironshaper")
	self:Debuff(zone, 59849, 41, 5, 5, false, true) --Lightning Ring
	self:Debuff(zone, 59846, 42, 5, 5, true) --Static Charge
end

GridStatusRaidDebuff:Import(import)