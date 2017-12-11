if not CastYeller then return end
if select(2, UnitClass('player')) ~= 'WARLOCK' then return end
--#DEFAULT_NODOC

--[[
Soulstone are a special case :
- the warlock create a Soulstone using the spell "Create Soulstone",
- it then uses the Soulstone, casting "Soulstone Resurrection" on the target.

So we create as special IsKnown method to handle it.
--]]
local soulstoneAnnounce = {
	events  = { start = true, failure = true },
	channel = { '_BROADCAST', '_WHISPER' },
	ranks   = { 20707, 20762, 20763, 20764, 20765, 27239 }, -- Soulstone Ressurection
}
do
	-- Check for Create Soulstone
	local name = nil
	local ranks = { 693, 5232, 16892, 16893, 16895, 16896, 22116 }
	function soulstoneAnnounce:IsKnown()
		if not name then
			for i,id in pairs(ranks) do
				name = GetSpellInfo(id)
				if name then
					break
				end
			end
		end
		return name and (not not GetSpellName(name))
	end
end

--#WIKI == Warlock ==
--#WIKI === Spells ===

CastYeller:RegisterAnnounces({
	--#WIKI * Ritual of Souls
	['spell-29893'] = {
		events     = { start = true, failure = true },
		channel    = { '_BROADCAST' },
	},
	--#WIKI * Ritual of Summoning
	['spell-698'] = {
		events          = { start = true, failure = true },
		channel         = { '_BROADCAST', '_WHISPER' },
		usePlayerTarget = true,
	},
	--#WIKI * Fear
	['spell-5782'] = {
		events     = { start = true, miss = true, failure = true },
		channel    = { '_BROADCAST' },
	},
	--#WIKI * Banish
	['spell-710'] = {
		events     = { start = true, miss = true, failure = true },
		channel    = { '_BROADCAST' },
	},
	--#WIKI * Soulstone
	['spell-20707'] = soulstoneAnnounce,
})

--#WIKI === Funnny announces ===

local locale = GetLocale()
if locale == "enUS" then
	--#WIKI * enUS, credits to Melvalian

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Melvalian',
		['spell-29893'] = {
			"Click on the portal to bring forth the candy machine.",
			"Hey its a fair trade, a few clicks for a few stones.",
			"You want a healthstone? Too bad! Of course if you click on the portal, there is nothing I can do to stop you.",
		},
		['spell-698'] = {
			"Warlock Taxi Service! Summoning <$TARGET>, please click on the portal.",
			"<$TARGET> wants to join us. Yet they are too lazy to get here themselves.",
			"Clicking on the portal will bring certain death to <$TARGET>!",
			"What do you think I make these things for fun? Click on the portal so <$TARGET> can come play with us.",
			"A warlock's job is never done. Click on the portal to make this lock do his job.",
		},
		['spell-5782'] = {
			"HAHA Look at <$TARGET> go! Who's afraid of the big bad warlock?",
			"And <$TARGET> thought they where good enough to get close to me. ",
			"Hey <$TARGET>, repeat after me. FEAR BOMB!",
		},
		['spell-710'] = {
			"<$TARGET> has been banished.",
			"<$TARGET> can't get me... Banish FTW",
		},
	})

elseif locale == "deDE" then
	--#WIKI * deDE, credits to EnSabahNur

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'EnSabahNur',
		['spell-29893'] = {
			"Klicke f\195\188r den Seelenbrunnen einfach auf das Portal.",
			"Hey das ist ein fairer Handel, ein paar helfende H\195\164nde f\195\188r ein paar Gesundheitssteine.",
			"Du willst einen Gesundheitsstein? Zu schade, alle weg! Aber wenn du das Portal benutzen willst kann ich dich nicht daran hindern.",
		},
		['spell-698'] = {
			"Hexenmeister Taxi Service! Teleportiere <$TARGET>, bitte benutzt das Portal.",
			"<$TARGET> m\195\182chte zu uns sto\195\159en. Aber es ist zu faul um selbst herzulaufen.",
			"Wenn Ihr das Portal benutzt bedeutet das den sicheren Tod f\195\188r <$TARGET>!",
			"Glaubt Ihr ich mache diese dinger nur zum Spa\195\159? Benutzt das Portal damit <$TARGET> mit uns spielen kann.",
			"Benutzt das Portal um diesem Hexer zu erm\195\182glichen seinen Job zu erledigen.",
		},
		['spell-5782'] = {
			"HAHA schaut euch nur <$TARGET> an! Wer hat Angst vor'm gro\195\159en b\195\182sen Hexenmeister?",
			"Und <$TARGET> dachte es w\195\164re gut genug nahe an mich heranzukommen.",
			"Hey <$TARGET>, wiederhole es f\195\188r mich: Angsthase!",
		},
		['spell-710'] = {
			"<$TARGET> wurde verbannt.",
			"<$TARGET> wurde gebannt, los jetzt!",
		},
	})

elseif locale == "zhTW" then
	--#WIKI * zhTW, credits to Melvalian and Andyca

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Melvalian, Andyca',
		['spell-29893'] = {
			"點擊時空之門，帶給你甜蜜的糖果機!",
			"來個公平交易! 你點擊這個門，我給你昨天丟到虛空的糖果機!",
			"來來來，快舉起你的雙手!...呃...就是你! 還不快舉起來!",
			"我需要二雙手，來幫忙製造糖果機。",
			"請幫忙點擊，方便製造糖果盒(10顆入)",
		},
		['spell-698'] = {
			"術士工商服務時間! 招喚<$TARGET>，請按門!",
			"各位先生，各位女士，<$TARGET>即將出現!",
			"正在進行召喚儀式，請點擊傳送門，以便把<$TARGET>拉回來。",
			"[<${TARGET}>! ]所有的實體，所有的空間對我來說都是開放的! (召喚儀式)",
			"你逃不掉的! <$TARGET>! (召喚儀式)",
			"[<${TARGET}>，]孫悟空是逃不出如來佛手掌心的。",
		},
		['spell-5782'] = {
			"哈哈，快跑吧，<$TARGET>! 我等下就會解決你!",
			"感受心中的恐懼吧，<$TARGET>!",
			"正在恐懼<$TARGET>，最多10秒鐘。",
			"<$TARGET>正在他的人 (?) 生的路上，不知何去何從。",
		},
		['spell-710'] = {
			"正在放逐<$TARGET>。",
			"放逐<$TARGET>!",
		},
	})

elseif locale == "koKR" then
	--#WIKI * koKR, credits to Melvalian, translation by Fenlis

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Melvalian, translation by Fenlis',
		['spell-29893'] = {
			"사탕 기계를 갖고 오기 위해 포탈을 클릭해주세요.",
		},
		['spell-698'] = {
			"흑마법사 택시 서비스! <$TARGET> 소환, 포탈을 클릭해 주세요.",
		},
		['spell-5782'] = {
			"헤이 <$TARGET>, 나중에 또 보자. 공포 작열!",
		},
		['spell-710'] = {
			"<$TARGET> 추방되었습니다.",
		},
	})

end
