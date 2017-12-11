if not CastYeller then return end
if select(2, UnitClass('player')) ~= 'DRUID' then return end

--#WIKI == Druid ==
--#WIKI === Spells ===

CastYeller:RegisterAnnounces({
	--#WIKI * Innervate
	['spell-29166'] = {
		events     = { success = true, failure = true },
		channel    = { '_BROADCAST', '_WHISPER' },
		conditions = { 'combat' },
	},
	--#WIKI * Rebirth
	['spell-20484'] = {
		events     = { start = true, failure = true },
		channel    = { '_BROADCAST', '_WHISPER' },
		conditions = { 'combat' },
	},
	--#WIKI * Hibernate
	['spell-2637'] = {
		events     = { start = true, failure = true , miss = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Cyclone
	['spell-33786'] = {
		events     = { start = true, failure = true , miss = true },
		channel    = '_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Tranquility
	['spell-740'] = {
		events     = { start = true },
		channel    = '_PARTY_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Growl
	['spell-6795'] = {
		events     = { miss = true, failure = true },
		channel    = '_BROADCAST',
	},
	--#WIKI * Challenging Roar
	['spell-5209'] = {
		events     = { success = true, miss = true, failure = true },
		channel    = '_BROADCAST',
	},
	--#WIKI * Revive
	['spell-50769'] = {
		events     = { start = true },
		channel    = { '_BROADCAST', '_WHISPER' },
	},	
})

--#WIKI === Funnny announces ===

local locale = GetLocale()
if locale == "enUS" then
	--#WIKI * enUS, credits to Arzach@Dragonblight-EU

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Arzach@Dragonblight-EU',
		['spell-29166'] = {
			"Innervating $TARGET. Enjoy !",
			"Maybe it wasn't a bright idea, but I've innervated $TARGET.",
			"And the winner is... $TARGET. What a lucky guy... or girl... or whatever!",
			"42 is the answer, but what was the question? For sure $TARGET is innervated.",
			"Like it or not, $TARGET is innervated.",
			"-- This space for rent, call 666.666.666 -- $TARGET is innervated",
		},
		['WHISPER:spell-29166'] = {
			"You are innervated!",
			"The power of $PLAYER is on you, use it wisely! (SuperManaRegen mode ON)",
			"Bow before me, 'cuz I've just innervated you. ^^",
			"Try to not die in the next 20 seconds, or my innervate will be wasted. Ty :)",
			"You are innervated. HINT: don't cast spells in the next 20 seconds to maximize the effects.",
			"I used *MY* Innervate on YOU, now *I* will need to drink mana pots. Unfair, isn't it?",
		},
		['spell-20484'] = {
			"$TARGET, wake up and fight, you lazy.",
			"$SPELL on $TARGET. Please try to not die (again) in the next 30 mins or so.",
		},
		['spell-2637'] = {
			"$TARGET is going to sleep a few, don't wake up please.",
			"$TARGET is sleeping. You wake up, you tank.",
		},
		['spell-33786'] = "$TARGET is cyclone'd, attacking is useless... for a few.",
		['spell-740'] = {
			"Feel the $SPELL going on!",
			"$SPELL on those close to me! (others might suffer illiness, sickness and even sudden death).",
			"$SPELL is a friggin' high mana spell. If something will interrupt it, I'll be VERY angry.",
		},
	})

elseif locale == "zhTW" then
	--#WIKI * zhTW

	CastYeller:RegisterFunnyAnnounces({
		__credit = '',
		['spell-29166'] = {
			"啟動[<${TARGET}>]，享受快速回魔的快感吧!",
			"啟動一下，[<$TARGET>，]我賜給你源源不絕的魔力!",
			"別害羞[<${TARGET}>]，啟動給你魔力高潮!",
		},
		['WHISPER:spell-29166'] = {
			"你已經被啟動了!",
			"記得補我啊，我剛啟動你了 ^^",
			"我剛啟動你了，休息一下回魔更快喔 ^^",
		},
		['spell-20484'] = {
			"[<${TARGET}>，]你這個懶惰蟲，快起來繼續打!",
			"[<${TARGET}>，]死只是一時的，快起來再趴一次吧!",
			"已[在<${TARGET}>身上]種下了萌的種子! 快萌芽啊~~",
			"你為什麼總說他[<${TARGET}>]死了? 誰告訴你他死了? 我從來都沒那麼說過。他只是玩太累睡著了而已!",
			"[<${TARGET}>請起床，]賴床的話，事後就會招致被踩的行動!",
			"戰復[<${TARGET}>]，請記得找好時間點起來啊，別起來又趴嚕。",
		},
		['spell-2637'] = {
			"[<${TARGET}>]快快睡，不要叫醒他喔。",
			"[<${TARGET}>]已經進入了夢鄉.......zzZZZZ",
		},
		['spell-33786'] = {
			"[<${TARGET}>]被捲上天了，不要再打他了。",
			"[對<${TARGET}>]施放好高好高的遊戲!",
		},
		['spell-740'] = {
			"感覺<$SPELL>吧!",
			"施放<$SPELL>，請同隊隊友別離我太遠!",
		},
	})

elseif locale == "koKR" then
	--#WIKI * koKR, credits to Fenlis

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Fenlis', 
		['spell-29166'] = {
			"$TARGET 정신 자극. Enjoy !",
			"좋은 생각이 아닐지 모르지만 $TARGET에게 자극을 줍니다.",
			"좋든 싫든, $TARGET에게 자극들어 갑니다.",
		},
		['WHISPER:spell-29166'] = {
			"당신은 정신 자극을 받았습니다!",
		},
		['spell-20484'] = {
			"$TARGET, 게으름 피우지 말고 일어나서 싸우세요.",
			"$TARGET에 $SPELL. 30분 내에 죽지마세요.",
		},
		['spell-2637'] = {
			"$TARGET 잠시 잠이 듭니다, 제발 깨우지 마세요.",
			"$TARGET 잡니다.",
		},
		['spell-33786'] = "$TARGET에 회오리 바람, 공격해도 소용없습니다...",
		['spell-740'] = {
			"feel the $SPELL going on!",
			"$SPELL on those close to me! (others might suffer illiness, sickness and even sudden death).",
			"$SPELL is a friggin' high mana spell. If something will interrupt it, I'll be VERY angry.",
		},
	})

end
