if not CastYeller then return end
if select(2, UnitClass('player')) ~= 'HUNTER' then return end

--#WIKI == Hunter ==
--#WIKI === Spells ===

CastYeller:RegisterAnnounces({
	--#WIKI * Misdirection
	['spell-34477'] = {
		events     = { success = true, failure = true },
		channel    = { '_BROADCAST', '_WHISPER' },
	},
	--#WIKI * Freezing Trap
	['spell-1499'] = {
		events     = { success = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Wyvern Sting
	['spell-19386'] = {
		events     = { start = true, failure = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Feign Death
	['spell-5384'] = {
		events     = { success = true },
		channel    = 'EMOTE',
		conditions = { 'combat', 'party' },
	},
	--#WIKI * Tranquilizing Shot
	['spell-19801'] = {
		events     = { success = true, failure = true, miss = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
	},

	--[[
	-- Debug spells
	['spell-1130'] = { -- Hunter's Mark
		events     = { success = true, miss = true },
		channel    = { '_BROADCAST', 'EMOTE' },
		conditions = { 'debug' },
	},
	['item-6948'] = { -- Hearthstone
		events     = { start = true, success = true, miss = true, failure = true },
		channel    =  { '_BROADCAST', 'EMOTE' },
		conditions = { 'debug' },
	},
	--]]
})

--#WIKI === Funnny announces ===

if GetLocale() == "frFR" then
	--#WIKI * frFR

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Adirelle',
		['EMOTE:spell-5384'] = { -- Feign Death
			'a tr\195\169buch\195\169.',
			'fait une micro-sieste.',
			"s'endort en sursaut.",
			"admire un caillou de près, très près.",
		},
		['spell-19386'] = { -- Wyvern Sting
			'$TARGET va faire un petit somme !',
			'$TARGET, tes paupi\195\168res sont lourdes ! Dors, je le veux !',
		},
		['spell-34477'] = { -- Misdirection
			"C'est pas moi, c'est $TARGET !",
			"Livraison express pour $TARGET !",
			"Hey, gros moche ! J'aurais pas aim\195\169 ce qu'a dit $TARGET sur ta  m\195\168re !",
			"Pour toute r\195\169clamation concernant des fl\195\168ches ou balles perdues, adressez-vous \195\160 $TARGET !",
		},
		['spell-1499'] = { -- Freezing Trap
			"Et un iceberg, un !",
			"Apportez \195\160 boire, j'apporte les gla\195\167ons !",
			"J'invoque Mister Freeze, regardez !",
		},
	})

end
