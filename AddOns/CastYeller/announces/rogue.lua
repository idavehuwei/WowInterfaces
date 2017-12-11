if not CastYeller then return end
if select(2, UnitClass('player')) ~= 'ROGUE' then return end

--#WIKI == Rogue ==
--#WIKI === Spells ===

CastYeller:RegisterAnnounces({
	--#WIKI * Kick
	['spell-1766'] = {
		events     = { success = true, failure = true, miss = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
		ranks      = { 1766, 1767, 1768, 1769, 38768 },
	},
	--#WIKI * Sap
	['spell-6770'] = {
		events     = { success = true, miss = true },
		channel    = '_BROADCAST',
		conditions = { 'nocombat' },
		ranks      = { 6770, 2077, 11297 },
	},
	--#WIKI * Blind
	['spell-2094'] = {
		events     = { success = true, failure = true, miss = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
	},
})

--#WIKI === Funnny announces ===

local locale = GetLocale()
if locale == "enUS" then
	--#WIKI * enUS, credits to Mylar@Medivh-US

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Mylar@Medivh-US',
		['failure:spell-1766'] = {
			"Unable to KICK because '$REASON.'",
		},
		['miss:spell-1766'] = {
			"KICK MISSED on $TARGET!",
		},
		['success:spell-1766'] = {
			"$TARGET has just experienced spellus interruptus!",
			"$TARGET's casting interrupted!",
		},
		['success:spell-6770'] = {
			"$TARGET SAPPED! Commence the pwnage!",
			"$TARGET SAPPED! It will now stand there looking drunk with a purple swirl over its head for the next 45 seconds.",
			"$TARGET SAPPED! Feel free to break it at any time in the next 45 seconds... if you are willing to tank it.",
			"$TARGET SAPPED! That's what the purple swirl over the mob's head means.",
			"$TARGET SAPPED! Pull... Hurry up... C'mon, time's a-wastin' here...",
			"$TARGET SAPPED! Let's go! I feel the urge to kill something!",
		},
	})

elseif locale == "zhTW" then
	--#WIKI * zhTW
	
	CastYeller:RegisterFunnyAnnounces({
		['failure:spell-1766'] = {
			"無法腳踢，因為$REASON。",
		},
		['miss:spell-1766'] = {
			"腳踢[<${TARGET}>]失敗!",
		},
		['success:spell-1766'] = {
			"腳踢[<${TARGET}>]，成功斷法!",
			"腳薰[<${TARGET}>]，他一時說不出話來。",
			"我用剪刀腳使[<${TARGET}>]的嘴巴一時張不開。",
			"用腳摀住[<${TARGET}>]，斷法成功！",
		},
		['success:spell-6770'] = {
			"我悶了[<${TARGET}>]! 快動手，我有殺人的衝動!",
			"賞[<${TARGET}>]一棍! 快讓我們解決它吧!",
			"[<${TARGET}>]頭暈45秒!",
			"[<${TARGET}>]被我用酒精悶醉了，總共45秒!",
		},
	})

elseif locale == "koKR" then
	--#WIKI * koKR, credits to Fenlis
	
	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Fenlis',
		['failure:spell-1766'] = {
			"발차기를 사용할 수 없습니다 : '$REASON.'",
		},
		['miss:spell-1766'] = {
			"$TARGET에 발차기 실패!",
		},
		['success:spell-1766'] = {
			"$TARGET의 시전이 차단되었습니다!",
		},
		['success:spell-6770'] = {
			"$TARGET 기절함! 풀 하세요!",
			"$TARGET 기절함! 지금 부터 45동안 머리위에 자주색 소용돌이가 돌면서 취한 것 처럼 서있을 것입니다.",
			"$TARGET 기절함! 이놈을 탱킹하려면 45이내 아무때나 깨우세요.",
			"$TARGET 기절함! 빨리... 풀... 고고, 시간 없습니다...",
		},
	})

end
