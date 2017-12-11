if not CastYeller then return end
if select(2, UnitClass('player')) ~= 'MAGE' then return end

local PORTAL = "Portal"
local POLYMORPH = GetSpellInfo(118)

local locale = GetLocale()
if locale == "frFR" then
	PORTAL = "Portail"
elseif locale == "koKR" then
	PORTAL = '차원문'
elseif locale == "zhTW" then
	PORTAL = '傳送'
end

--#WIKI == Mage ==
--#WIKI === Spells ===

CastYeller:RegisterAnnounces({
	--#WIKI * Counterspell
	['spell-2139'] = { 
		events     = { success = true, failure = true, miss = true },
		channel    = '_BROADCAST',
	},

	--#WIKI * Polymorphs
	['spell-118'] = { -- Polymorph
		events     = { start = true, failure = true, miss = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
		group      = 'Polymorph',
		label      = POLYMORPH,
	},
	['spell-28272'] = { -- Polymorph: Pig
		events     = { start = true, failure = true, miss = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
		group      = 'Polymorph',
		label      = POLYMORPH,
	},
	['spell-28271'] = { -- Polymorph: Turtle
		events     = { start = true, failure = true, miss = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
		group      = 'Polymorph',
		label      = POLYMORPH,
	},

	--#WIKI * Portals
	["spell-11419"] = { -- Portal: Darnassus
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-32266"] = { -- Portal: Exodar
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-11416"] = { -- Portal: Ironforge
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-11417"] = { -- Portal: Orgrimmar
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-33691"] = { --  Portal: Shattrath
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-32267"] = { -- Portal: Silvermoon
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-49361"] = { -- Portal: Stonard
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-10059"] = { -- Portal: Stormwind
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-49360"] = { -- Portal: Theramore
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-11420"] = { -- Portal: Thunder Bluff
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	["spell-11418"] = { -- Portal: Undercity
		events     = { start = true, },
		channel    = '_BROADCAST',
		group      = 'Portal',
		label      = PORTAL,
	},
	
	--#WIKI * Spellsteal
	['spell-30449'] = {
		events     = { success = true, failure = true, miss = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
	},

	--#WIKI * Conjure food/water and Ritual of Refreshment
	['spell-587'] = { -- Conjure Food
		events     = { success = true },
		channel    = '_BROADCAST',
		conditions = { 'nocombat' },
	},
	['spell-5504'] = { -- Conjure Water
		events     = { success = true },
		channel    = '_BROADCAST',
		conditions = { 'nocombat' },
	},
	['spell-43987'] = { -- Ritual of Refreshment
		events     = { start = true },
		channel    = '_BROADCAST',
		conditions = { 'nocombat' },
	},
})

--#WIKI === Funnny announces ===

if locale == "enUS" then
 --#WIKI * enUS
 
	CastYeller:RegisterFunnyAnnounces({
		__credits = 'MarsJenkar',
		['spell-28271'] = {
			"Poly-ing $TARGET. You break it, you tank it.",
			"Time out for $TARGET.",
			"You toucha mah $TARGET, ah breaka yo' face.",
			"Polymorphing $TARGET.  Break it, and you'll make me angry.  And you won't like me when I'm angry.",
			"Now, don't any of you hares touch tortoise $TARGET.  Thank you.",
			"$TARGET is now a slowpoke!",
			"Making $TARGET hide in his shell.",
			"$TARGET's suffering from shell shock.",
		},
		['miss:spell-28271'] = {
			"Lemme try that again.  First, give $TARGET a shell....",
			"Wait a second, that doesn't look like a turtle.  Lemme try poly-ing $TARGET again....",
		},
		['failure:spell-28271'] = {
			"Lemme try that again.  First, give $TARGET a shell....",
			"Wait a second, that doesn't look like a turtle.  Lemme try poly-ing $TARGET again....",
		},
		['spell-43987'] = {
			"Click the portal if you want to NOMNOMNOMNOMNOM!",
			"Just another water cooler doing his job.",
			"Trading mana for manna; please click the portal.",
			"Click the shiny blue aperture if you want to be fed!",
			"The cake is NOT a lie.  Well, it won't be if you click the portal.",
			"Sure, sure.  Make food, make water, make portals.  Blah, blah, blah.",
			"Now be nice when you ask me for food.  You don't want me to drop this table on your head next time.",
			"Mage is summoning a table!  Grab the food now, while you're still able.",
			"Huh?  What's that?  Oh, why biscuits?  Trust me, it takes a LOT less mana to make a thousand nutritious biscuits than to summon just one roast turkey.",
			"Now available: Biscuits so moist, you don't even need water to wash them down with!",
		},
		['spell-2139'] = {
			"Nice try, $TARGET.",
			"Tapping two islands, $TARGET.",
			"Energy Vortex; $TARGET, play another card.",
			"Mah na mah na. (Doot doooooo do $TARGET.)",
			"Try another school, $TARGET.",
		},
		['miss:spell-2139'] = {
			"No, no, you're supposed to *stop* casting, $TARGET!",
			"Looks like $TARGET countered my counter.  Darn.",
		},
		['failure:spell-2139'] = {
			"No, no, you're supposed to *stop* casting, $TARGET!",
			"Looks like $TARGET countered my counter.  Darn.",
		},
		['spell-11419'] = {
			"The Arcanist Science Corporation would like to remind you that after you take the portal to your destination of Darnassus, you will be baked, and then there will be cake.",
			"Next stop: Darnassus.  Trees, night elves, trees, wisps, and...trees.",
		},
		['spell-32266'] = {
			"The Arcanist Science Corporation would like to remind you that after you take the portal to your destination of the Exodar, you will be baked, and then there will be cake.",
			"Next stop: The Exodar, the last best hope for the draenei.  Or wait, was that something else....",
		},
		['spell-11416'] = {
			"The Arcanist Science Corporation would like to remind you that after you take the portal to your destination of Ironforge, you will be baked, and then there will be cake.",
			"Next stop: Ironforge.  Home of the world's biggest forge, the world's biggest anvil, and some of the world's smallest people.",
		},
		['spell-33691'] = {
			"The Arcanist Science Corporation would like to remind you that after you take the portal to your destination of Shattrath City, you will be baked, and then there will be cake.",
			"Next stop: Shattrath City.  The city's structure may lie in ruins, but its hope does not.",
		},
		['spell-10059'] = {
			"The Arcanist Science Corporation would like to remind you that after you take the portal to your destination of Stormwind City, you will be baked, and then there will be cake.",
			"Next stop: Stormwind City.  White walls, white buildings, white towers...and a melting pot of peoples from throughout the Alliance."
		},
		['spell-49360'] = {
			"The Arcanist Science Corporation would like to remind you that after you take the portal to your destination of Theramore Isle, you will be baked, and then there will be cake.",
			"Next stop: Theramore Isle.  A safe haven for the Alliance nestled outside hostile territory.",
		},
	})
	
elseif locale == 'koKR' then
 --#WIKI * koKR
 
	CastYeller:RegisterFunnyAnnounces({
		['spell-118'] = {
			"$TARGET에게 양치기 무한 주사위 저주를 시전합니다. 님들하, 젭알!",
			"$TARGET 건들면 폭파상태로 변경됩니다.",
			"$TARGET 건드시면 삼대가 고생합니다. 돠줍쇼.",
			"$TARGET 양치기 골드훔치기를 시전합니다. 미리 감사~",
		},
		['miss:spell-118'] = {
			"$TARGET 변이되지 않았습니다!",
			"웁쓰! $TARGET 변이 실패!!",
		},
	})
end

