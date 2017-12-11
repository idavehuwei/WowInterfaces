if not CastYeller then return end
if select(2, UnitClass('player')) ~= 'PRIEST' then return end

--#WIKI == Priest ==
--#WIKI === Spells ===

CastYeller:RegisterAnnounces({
	--#WIKI * Shackle Undead
	['spell-9484'] = {
		events     = { start = true, failure = true, miss = true },
		channel    = '_BROADCAST',
	},
	--#WIKI * Resurrection
	['spell-2006'] = {
		events     = { start = true },
		channel    = { '_BROADCAST', '_WHISPER' },
	},
	--#WIKI * Mind Control
	['spell-605'] = {
		events     = { start = true, failure = true, miss = true },
		channel    = { '_BROADCAST' },
	},
})

--#WIKI === Funnny announces ===

local locale = GetLocale()
if locale == "enUS" then
	--#WIKI * enUS
	
	CastYeller:RegisterFunnyAnnounces({
		['spell-9484'] = {
			"Shackling '$TARGET' because corpses can't say no.",
			"Shackling '$TARGET!'  Stay away from the bling!",
			"I hope you brought the gag '$TARGET', I got the shackles!",
			"Believe it or not, '$TARGET', I am into bondage.",
			"Shackling '$TARGET!' Drop what you're doing and break it! ",
			"Shackling '$TARGET'. Everytime you break it, I'll kill a kitten.",
			"Shackling '$TARGET!'  You break it, you tank it.",
			"'$TARGET' is my corpse. There are many others like it but this one is mine.",
			"Go to your cage, '$TARGET!'",
			},
		['spell-2006'] = {
			"Okay, $TARGET, nap time is over! Back to work!",
			"Granddaddy always said laughter was the best medicine. I guess it wasn't strong enough to keep $TARGET alive.",
			"Ressing $TARGET, can I get an Amen!",
			"$TARGET, your subscription to Life(tm) has expired. Do you wish to renew?",
			"YAY! I always wanted my very own $TARGET-zombie!",
			"It just so happens that $TARGET is only MOSTLY dead. There's a big difference between mostly dead and all dead. Mostly dead is slightly alive.",
			"Cool, I received 42 silver, 32 copper from Corpse of $TARGET",
			"GAME OVER, $TARGET. To continue press up, up, down, down, left, right, left, right, B, A, B, A, Select + Start",
			"If you are reading this message, $TARGET is already dead.",
			"Don't rush me $TARGET. You rush a miracle worker, you get rotten miracles.",
			"Death comes for you $TARGET! With large, pointy teeth!",
			"Resurrecting $TARGET. Side effects may include: nausea, explosive bowels, a craving for brains, and erectile dysfunction. Resurrection is not for everyone. Please consult healer before dying.",
			"Dammit $TARGET, I'm a doctor! Not a priest! .... Wait a second.... Nevermind. Ressing $TARGET",
			"Dying makes me sad, $TARGET.",
			"...death defying feats are clearly not your strong point, $TARGET",
			"Walk it off, $TARGET.",
			"$TARGET, this better not be another attempt to get me to give you mouth-to-mouth.",
			"Arise $TARGET, and fear death no more; or at least until the next pull.",
			"Stop slacking, $TARGET. You can sleep when you're . . . Oh. . . Um, ressing $TARGET",
			"We can rebuild $TARGET, we can make him stronger, faster, but we can't make him any smarter.",
			"Bring out your dead! *throws $TARGET on the cart*",
			"$TARGET, quit hitting on the Spirit Healer and come kill something!",
			"$TARGET I *warned* you, but did you listen to me? Oh, no, you *knew*, didn't you? Oh, it's just a harmless little *bunny*, isn't it?",
			"There are worse things then death, $TARGET. Have you ever grouped with... oh, wait. We aren't supposed to mention that in front of you.",
			"Wee-ooo! Wee-ooo! Wee-ooo! Wee-ooo! Wee-ooo! Wee-ooo... that's the best ambulance imperssion I can do, $TARGET.",
			"Tsk tsk, $TARGET. See, I told you to sacrifice that virgin to the Volcano God.",
			"$TARGET gets a Mulligan.",
			"Eww!  What's that smell!  It smells like something died in here!  Hey, where is $TARGET?... Oh.",
			"Can somebody get $TARGET a Phoenix Down over here? *stumbles* Wow, out of body experience...",
			"Funny how everyone else can die and come back, but a Phoenix Down won't take care of $TARGET.",
			"Sorry $TARGET, I know I'm a priest ... but come ON! Did you see how many guys there were!?",
			"Hey $TARGET! Don't go towards the light! Well, unless it says 'Accept' ... but even then, it might be a trick!",
			"Sorry $TARGET, I couldn't heal you. I was too busy being the tank.",
			},
	})

elseif locale == "zhTW" then
	--#WIKI * zhTW, credits to Andyca
	
	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Andyca',
		['spell-9484'] = {
			"感覺神聖的力量[，<${TARGET}>]！",
			"束縛[<${TARGET}>]，不要打它喔！",
			"已完成[對<${TARGET}>的]鎖鏈綑綁！",
			"[<${TARGET}>是我的]鎖鏈目標！",
		},
		['spell-2006'] = {
			"[<${TARGET}>...]別以為你長得帥我就不復活你。",
			"星星在哪裡都很亮的，可是[<${TARGET}>]你不用一直抬頭去看它們。",
			"[<${TARGET}>，]願意當我一輩子的僕人請按【確定】。",
			"[對<${TARGET}>]施放復活術失敗：免疫。",
			"[<${TARGET}>]...如果你這裡過不了，我們會跟你媽說你是條漢子。",
			"[<${TARGET}>，]如果要接關，請按 上 上 下 下 左 右 左 右 B A~",
			"酷! [我從<${TARGET}>身上]拿到了24金57銀40銅。",
			"酷! [我從<${TARGET}>身上]拿到了75金23銀55銅。",
			"[<${TARGET}>，]聊天打字的時間結束了，該上工了。",
			"啊對了，[<${TARGET}>，]我要復活你了，別跟著那道光跑啊。",
			"[<${TARGET}>，你的]HP點數已經到期，要續約的話請按【確定】。",
			"看! 就是那道光....好了，[<${TARGET}>]該起床了~",
			"嘿! [<${TARGET}>]不要過橋哦! 快回來啊~~",
			"[<${TARGET}>]快起來吧，別逼我找人對你做人工呼吸 A_A。",
			"正在[對<${TARGET}>]使用從格利夫塔「令人驚奇的護符商人」處買來的「永恆神妙魔法護身符」。",
			"[<${TARGET}>]快起來，我的晚餐不想多你這一道菜。",
			"我擁有通往天堂的鑰匙! 跟著我來吧[<${TARGET}>]，你會看到的!",
			"善惡的分別，躺著[的<${TARGET}>]想清楚了嗎? 如果你墮落的思想已被淨化，請按【確定】!",
			"我會讓你們看到: 被打趴[的<${TARGET}>]，是可以復活的!",
			"來吧，溫和的夜晚; 把[<${TARGET}>的]生命還給我們!",
			"你們看，我的個人收藏中有[<${TARGET}>的]靈魂...",
			"慈因積善，誓救眾生！[<${TARGET}>聽到請答應！]",
			"[請問失神的<${TARGET}>，]恆河沙乘以不可思議減無量加大數除以阿僧祇等於多少？",
			"命到付款，[<${TARGET}>]請記得付100G給我。",
		},
	})

elseif locale == "koKR" then
	--#WIKI * koKR, credits to Fenlis
	
	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Fenlis',
		['spell-9484'] = {
			"감옥으로 돌아가라, '$TARGET!'",
			},
		['spell-2006'] = {
			"그래, $TARGET, 낮잠 잘 시간은 끝났다! 일어나라!",
			"좋아, $TARGET의 시체로 부터 42실버, 32쿠퍼를 받았습니다.",
			"게임 종료, $TARGET. 계속하려면 위, 위, 아래, 아래, 왼쪽, 오른쪽, 왼쪽, 오른쪽, B, A, B, A, 선택 + 시작 버튼을 누르세요.",
			"$TARGET님 죄송해요, 탱커 힐 하느라 여유가 없었어요.",
			},
	})

end