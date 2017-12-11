if not CastYeller then return end
if select(2, UnitClass('player')) ~= 'WARRIOR' then return end

--#WIKI == Warrior ==
--#WIKI === Spells ===

CastYeller:RegisterAnnounces({
	--#WIKI * Challenging Shout
	['spell-1161'] = {
		events     = { success = true, },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Shield Wall
	['spell-871'] = {
		events     = { success = true, },
		channel    = '_BROADCAST',
	},
	--#WIKI * Last Stand
	['spell-12975'] = {
		events     = { success = true, },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Taunt
	['spell-355'] = {
		events     = { miss = true, failure = true },
		channel    = '_BROADCAST',
	},
	--#WIKI * Mocking Blow
	['spell-694'] = {
		events     = { miss = true, failure = true },
		channel    = '_BROADCAST',
		ranks      = { 694, 7400, 7402, 20559, 20560, 25266 },
	},
	--#WIKI * Pummel
	['spell-6552'] = {
		events     = { success = true, },
		channel    = '_BROADCAST',
		defaultDisabled = true,
		ranks      = { 6552, 6554 },
	},
	--#WIKI * Shield Bash
	['spell-72'] = {
		events     = { success = true, miss = true, failure = true },
		channel    = '_BROADCAST',
		defaultDisabled = true,
		ranks      = { 72, 1671, 1672, 29704 },
	},
	--#WIKI * Sunder Armor
	['spell-7386'] = {
		events     = { success = true, },
		channel    = '_BROADCAST',
		defaultDisabled = true,
		ranks      = { 7386, 7405, 8380, 11596, 11597, 25225 }
	},
})

