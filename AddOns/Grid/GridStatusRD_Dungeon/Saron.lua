local zone = "Pit of Saron"

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

local GridStatusRaidDebuff = GridStatusRaidDebuff;
--Malygos
local function import(self)
	--Trash
	self:Debuff(zone, 50661, 1, 5, 5, false, true) --Weakened Resolve
	self:Debuff(zone, 70269, 2, 5, 5) --Conversion Beam
	self:Debuff(zone, 70272, 3, 5, 5) --Frost Breath
	self:Debuff(zone, 70273, 4, 5, 5) --Pustulant Flesh
	self:Debuff(zone, 70274, 5, 5, 5) --Toxic Waste
	self:Debuff(zone, 70302, 6, 5, 5) --Blinding Dirt
	self:Debuff(zone, 70280, 7, 5, 5) --Shovelled!
	self:Debuff(zone, 70283, 8, 5, 5) --Hellfire
	self:Debuff(zone, 70282, 9, 5, 5) --Fireball
	self:Debuff(zone, 70285, 10, 5, 5) --Blight

	--Forgemaster Garfrost
	self:BossName(zone, 20, "Forgemaster Garfrost")
	self:Debuff(zone, 68771, 21, 5, 5) --Thundering Stomp
	self:Debuff(zone, 72930, 22, 5, 5, true) --Deep Freeze
	self:Debuff(zone, 68786, 23, 5, 5, false, true) --Permafrost

	--Krick and Ick
	self:BossName(zone, 30, "Krick and Ick")
	self:Debuff(zone, 68987, 31, 5, 5, true) --Pursuit
	self:Debuff(zone, 70436, 32, 5, 5) --Toxic Waste

	--Scourgelord Tyrannus
	self:BossName(zone, 40, "Scourgelord Tyrannus")
	self:Debuff(zone, 69275, 41, 5, 5, true) --Mark of Rimefang
	self:Debuff(zone, 69172, 42, 5, 5, true) --Overlord's Brand
	self:Debuff(zone, 69238, 43, 5, 5) --Icy Blast
	self:Debuff(zone, 69245, 44, 5, 5, true) --Hoarfrost
end

GridStatusRaidDebuff:Import(import)