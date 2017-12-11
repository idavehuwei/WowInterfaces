if not CastYeller then return end
if select(2, UnitClass('player')) ~= 'SHAMAN' then return end

--#WIKI == Shaman ==
--#WIKI === Spells ===

CastYeller:RegisterAnnounces({
	--#WIKI * Mana Tide Totem
	['spell-16190'] = {
		events     = { success = true },
		channel    = '_PARTY_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Bloodlust
	['spell-2825'] = {
		events     = { success = true },
		channel    = '_PARTY_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Heroism
	['spell-32182'] = {
		events     = { success = true },
		channel    = '_PARTY_BROADCAST',
		conditions = { 'combat' },
	},
	--#WIKI * Ancestral Spirit
	['spell-2008'] = {
		events     = { start = true },
		channel    = { '_BROADCAST', '_WHISPER' },
	},
})

--#WIKI === Funnny announces ===

if GetLocale() == "zhTW" then
	--#WIKI * zhTW, credits to Andyca

	CastYeller:RegisterFunnyAnnounces({
		__credit = 'Andyca',
		['spell-2008'] = {
			"[對<${TARGET}>]施放先祖之魂失敗：抵抗。",
			"外人亂我[<${TARGET}>]兄弟者，視投名狀，必殺之！",
			"[<${TARGET}>，]我們一起打王去，死也要拖個墊背的！",
			"起來吧...[<${TARGET}>]，我的勇士，繼續為我而戰。",
			"願風的指引，[讓<${TARGET}>]快回到我的身邊吧。",
			"[<${TARGET}>，]如果要接關，請按 上 上 下 下 左 右 左 右 B A~",
			"酷! [我從<${TARGET}>身上]拿到了24金57銀40銅。",
			"酷! [我從<${TARGET}>身上]拿到了75金23銀55銅。",
			"[<${TARGET}>，]聊天打字的時間結束了，該上工了。",
			"啊對了，[<${TARGET}>，]我要復活你了，別跟著那道光跑啊。",
			"[<${TARGET}>，你的]HP點數已經到期，要續約的話請按【確定】。",
			"看! 就是那道光....好了，[<${TARGET}>]該起床了~",
			"先祖之靈，請聽從我的呼喚，把[<${TARGET}>]無助的靈魂，帶回我們的身邊。",
			"[<${TARGET}>]快起來吧，別逼我找人對你做人工呼吸 A_A。",
			"格利夫塔令人驚奇的「永恆神妙魔法護身符」確實將[<${TARGET}>的]靈魂保存了! 請放心吧! 絕對有效!",
			"[<${TARGET}>]快起來，我的晚餐不想多你這一道菜。",
			"正在[對<${TARGET}>]插復活圖騰。",
			"喔[<${TARGET}>]，我們一定要找到回家的路!",
			"我會讓你們看到: 被打趴[的<${TARGET}>]，是可以復活的!",
			"來吧，溫和的夜晚; 把[<${TARGET}>的]生命還給我們!",
			"你們看，我的個人收藏中有[<${TARGET}>的]靈魂...",
			"正在[對<${TARGET}>]的萌點灌入術活之術。",
		},
	})

end
