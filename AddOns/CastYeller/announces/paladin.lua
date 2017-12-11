if not CastYeller then return end
if select(2, UnitClass('player')) ~= 'PALADIN' then return end

--#WIKI == Paladin ==
--#WIKI === Spells ===

CastYeller:RegisterAnnounces({
	--#WIKI * Divine Intervention
	['spell-19752'] = {
		events     = { success = true, failure = true },
		channel    = { '_BROADCAST', '_WHISPER' },
		conditions = { 'combat' },
	},
	--#WIKI * Blessing of Protection
	['spell-1022'] = {
		events     = { success = true, failure = true },
		channel    = { '_BROADCAST', '_WHISPER' },
		conditions = { 'combat' },
	},
	--#WIKI * Redemption
	['spell-7328'] = {
		events     = { start = true },
		channel    = { '_BROADCAST', '_WHISPER' },
	},
	--#WIKI * Lay on Hands
	['spell-633'] = {
		events     = { success = true },
		channel    = { '_BROADCAST', '_WHISPER' },
		conditions = { 'combat' },
	},
})

--#WIKI === Funnny announces ===

local locale = GetLocale()
if locale == "enUS" then
	--#WIKI * enUS

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'various authors',
		['spell-19752'] = {
			"It is ok everyone, you can rest assured $TARGET is safe.",
			"$TARGET has been saved from certain death.",
			"The powers that be smiles upon $TARGET.",
			"I just gave my life for $TARGET, such is true friendship.",
			"Once again, I saved $TARGET from certain death.",
		},
		['spell-1022'] = {
			"$TARGET is under my personal protection.",
			"$TARGET suddenly achieved 100% physical resistance.",
		},
		['spell-7328'] = {
			"Ressing $TARGET.",
			"$TARGET will not be dead for long.",
			"Oh, $TARGET is just mostly dead, I can fix mostly dead.",
			"I am bringing $TARGET back from the dead.",
			"$TARGET is alive, IT'S ALIVE!!",
			"$TARGET shall rise from the dead, thereby conquering death and hell.",
			"No sleeping on the job $TARGET, rise and shine.",
			"No more cookies for $TARGET.",
			"...death defying feats are clearly not your strong point, $TARGET.",
			"Resurrecting $TARGET - side effects may include: Insomnia, erectile disfunction, explosive bowels, and craving of brains. Resurrection is not for everyone, please consult your physician before dying.",
			"Aw, how cute. $TARGET is dead again. Get up!",
			"If you can read this, $TARGET is dead.",
			"Ok, one more time. The bad guys are supposed to die, the good guys are supposed to live. And, $TARGET? We're the good guys.",
			"$TARGET has failed at life, I'm giving him a second chance. That's right, not God, ME!!",
		},
	})

elseif locale == "deDE" then
	--#WIKI * deDE, credits to Poetter

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Poetter',
		['spell-19752'] = {
			"<$TARGET> kann uns sp\195\164ter rezzen. Alle sterben!",
			"Habe <$TARGET> rausgenommen.",
			"<$TARGET> ist durch g\195\182ttliches Eingreifen gesch\195\188tzt",
		},
		['spell-1022'] = {
			"<$TARGET> gesch\195\188tzt durch $SPELL",
			"<$TARGET> darf auch mal ne Angstblase testen",
			"<$TARGET> steht unter meinem pers\195\182nlichem Schutz",
		},
		['spell-7328'] = {
			"Rezze <$TARGET>",
			"<$TARGET> wird nicht l\195\164nger unter den Toten weilen.",
			"Liegen geblieben? Rufe 0900/ERL\195\150SUNG! Rezze <$TARGET>",
			"Schluss mit faul rumliegen <$TARGET>. Weiter gehts.",
			"Erl\195\182se <$TARGET>",
			"Belebe <$TARGET> wieder",
			"Ich hole <$TARGET> von den Toten zur\195\188ck",
		},
	})

elseif locale == "zhTW" then
	--#WIKI * zhTW, credits to Andyca

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Andyca',
		['spell-19752'] = {
			"[<${TARGET}>]已經被干涉了，大家快找個好地方趴一趴吧!",
			"干涉[<${TARGET}>]，效果持續三分鐘。",
		},
		['spell-1022'] = {
			"[<${TARGET}>]已經被我保護了，10秒內不會再被攻擊了!",
			"乖孩子[<${TARGET}>]，不要怕，你已經被我保護了!",
		},
		['spell-7328'] = {
			"你的救贖[對<${TARGET}>]復活造成致命一擊。",
			"看在黨國的份上，拉兄弟[<${TARGET}>]一把吧！",
			"既然你[<${TARGET}>]誠心誠意的趴了，我就大發慈悲的復活你～",
			"起來吧...[<${TARGET}>]，我的勇士，繼續為我而戰。",
			"我虔誠的[為<${TARGET}>]祝福，快回到我的身邊吧。",
			"[<${TARGET}>，]如果要接關，請按 上 上 下 下 左 右 左 右 B A~",
			"酷! [我從<${TARGET}>身上]拿到了24金57銀40銅。",
			"酷! [我從<${TARGET}>身上]拿到了75金23銀55銅。",
			"[<${TARGET}>，]聊天打字的時間結束了，該上工了。",
			"啊對了，[<${TARGET}>，]我要復活你了，別跟著那道光跑啊。",
			"[<${TARGET}>，你的]HP點數已經到期，要續約的話請按【確定】。",
			"看! 就是那道光....好了，[<${TARGET}>]該起床了~",
			"呼喚聖光，願救贖之力降臨[<${TARGET}>]!",
			"[<${TARGET}>]快起來吧，別逼我找人對你做人工呼吸 A_A。",
			"看過來! 格利夫塔令人驚奇的「永恆神妙魔法護身符」 - 正要展現它驚奇的效果[讓<${TARGET}>復活]!",
			"爺爺說: 常笑就是最好的長生不老藥，但是很顯然的，其藥力好像[對<${TARGET}>]不夠?",
			"[<${TARGET}>]快起來，我的晚餐不想多你這一道菜。",
			"善惡的分別，躺著[的<${TARGET}>]想清楚了嗎? 如果你墮落的思想已被淨化，請按【確定】!",
			"我會讓你們看到: 被打趴[的<${TARGET}>]，是可以復活的!",
			"來吧，溫和的夜晚; 把[<${TARGET}>的]生命還給我們!",
			"你們看，我的個人收藏中有[<${TARGET}>的]靈魂...",
			"為了聖光，[<${TARGET}>]即便趴，記得也要趴得有型／美美的。",
		},
	})

end
