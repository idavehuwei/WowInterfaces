local zone = "The Oculus"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 50690, 1, 5, 5) --Immobilizing Field
	self:Debuff(zone, 38047, 2, 5, 5) --Mind Warp
	self:Debuff(zone, 50535, 3, 5, 5, false, true) --Power Sap
	self:Debuff(zone, 61402, 4, 5, 5) --Flamestrike
	self:Debuff(zone, 59278, 5, 5, 5) --Blizzard
	self:Debuff(zone, 59261, 6, 5, 5) --Water Tomb

	--Drakos the Interrogator
	self:BossName(zone, 10, "Drakos the Interrogator")

	--Varos Cloudstrider
	self:BossName(zone, 20, "Varos Cloudstrider")
	self:Debuff(zone, 59371, 21, 5, 5) --Amplify Magic

	--Mage-Lord Urom
	self:BossName(zone, 30, "Mage-Lord Urom")
	self:Debuff(zone, 59376, 31, 5, 5) --Time Bomb
	self:Debuff(zone, 47731, 32, 5, 5, false, true) --Frostbomb

	--Ley-Guardian Eregos
	self:BossName(zone, 40, "Ley-Guardian Eregos")
end

GridStatusRaidDebuff:Import(import)