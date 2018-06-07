local zone = "The Nexus"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon


local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 47700, 1, 5, 5, true) --Crystal Freeze
	self:Debuff(zone, 39171, 2, 5, 5) --Mortal Strike
	self:Debuff(zone, 6726, 3, 5, 5) --Silence
	self:Debuff(zone, 48053, 4, 5, 5) --Ensnare
	self:Debuff(zone, 57050, 5, 5, 5) --Crystal Chains
	self:Debuff(zone, 13323, 6, 5, 5) --Polymorph
	self:Debuff(zone, 30849, 7, 5, 5) --Spell Lock
	self:Debuff(zone, 47779, 8, 5, 5) --Arcane Torrent

	--Commander Stoutbeard / Kolurg
	self:BossName(zone, 10, "Commander Stoutbeard")
	self:BossName(zone, 11, "Commander Kolurg")
	self:Debuff(zone, 29544, 12, 5, 5) --Frightening Shout

	--Grand Magus Telestra
	self:BossName(zone, 20, "Grand Magus Telestra")
	self:Debuff(zone, 47731, 21, 5, 5) --Critter
	self:Debuff(zone, 47736, 22, 5, 5) --Time Stop

	--Anomalus
	self:BossName(zone, 30, "Anomalus")
	self:Debuff(zone, 57063, 31, 5, 5, true) --Arcane Attraction

	--Keristrasza
	self:BossName(zone, 40, "Keristrasza")
	self:Debuff(zone, 48094, 41, 5, 5, false, true) --Intense Cold
	self:Debuff(zone, 48179, 42, 5, 5, true) --Crystallize
	self:Debuff(zone, 57091, 43, 5, 5, true) --Crystalfire Breath
end

GridStatusRaidDebuff:Import(import)