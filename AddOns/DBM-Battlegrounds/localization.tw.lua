﻿
if GetLocale() ~= "zhTW" then return end


local L

----------------------------
--  General BG functions  --
----------------------------
L = DBM:GetModLocalization("Battlegrounds")

L:SetGeneralLocalization({
	name 			= "基本戰埸功能"
})

L:SetTimerLocalization({
	TimerInvite 		= "%s"
})

L:SetOptionLocalization({
	ColorByClass		= "在得分視窗中設置玩家名為職業顏色",
	ShowInviteTimer		= "顯示戰場組隊計時",
	AutoSpirit		= "自動釋放靈魂"
})

L:SetMiscLocalization({
	ArenaInvite		= "競技場邀請"
})


--------------
--  Arenas  --
--------------
L = DBM:GetModLocalization("Arenas")

L:SetGeneralLocalization({
	name 			= "競技場"
})

L:SetTimerLocalization({
	TimerStart		= "戰鬥即將開始",
	TimerShadow		= "暗影之眼"
})

L:SetOptionLocalization({
	TimerStart 		= "顯示開始計時器",
	TimerShadow 		= "顯示暗影水晶計時器"
})

L:SetMiscLocalization({
	Start60 		= "競技場戰鬥在1分鐘內開始!",
	Start30 		= "競技場戰鬥在30秒內開始!",
	Start15 		= "競技場戰鬥在30秒內開始!"
})

---------------
--  Alterac  --
---------------
L = DBM:GetModLocalization("Alterac")

L:SetGeneralLocalization({
	name 			= "奧特蘭克山谷"
})

L:SetTimerLocalization({
	TimerStart 		= "戰鬥開始", 
	TimerTower 		= "%s",
	TimerGY 		= "%s",
})

L:SetMiscLocalization({
	BgStart60 		= "奧特蘭克山谷一分鐘後開始戰鬥。",
	BgStart30 		= "奧特蘭克山谷30秒後開始戰鬥。",
	ZoneName 		= "奧特蘭克山谷",
})

L:SetOptionLocalization({
	TimerStart  		= "顯示開始計時器",
	TimerTower 		= "顯示奪取哨塔計時器",
	TimerGY 		= "顯示奪取墓地計時器",
	AutoTurnIn 		= "自動繳交任務物品"
})

---------------
--  Arathi  --
---------------
L = DBM:GetModLocalization("Arathi")

L:SetGeneralLocalization({
	name 			= "阿拉希盆地"
})

L:SetMiscLocalization({
	BgStart60 		= "阿拉希盆地的戰鬥將在1分鐘後開始。",
	BgStart30 		= "阿拉希盆地的戰鬥將在30秒後開始。",
	ZoneName 		= "阿拉希盆地",
	ScoreExpr 		= "(%d+)/2000",
	Alliance 		= "聯盟",
	Horde 			= "部落",
	WinBarText 		= "%s 勝利",
	BasesToWin 		= "勝利需要基地: %d",
	Flag 			= "旗幟"
})

L:SetTimerLocalization({
	TimerStart 		= "戰鬥開始", 
	TimerCap 		= "%s",
})

L:SetOptionLocalization({
	TimerStart  		= "顯示開始計時器",
	TimerWin 		= "顯示勝利計時器",
	TimerCap 		= "顯示奪取計時器",
	ShowAbEstimatedPoints 	= "顯示戰鬥結束時雙方資源預計值",
	ShowAbBasesToWin 	= "顯示勝利需要的基地數量"
})

-----------------------
--  Eye of the Storm --
-----------------------
L = DBM:GetModLocalization("EyeOfTheStorm")

L:SetGeneralLocalization({
	name 			= "暴風之眼"
})

L:SetMiscLocalization({
	BgStart60 		= "戰鬥在1分鐘內開始!",
	BgStart30 		= "戰鬥在30秒內開始!",
	ZoneName 		= "暴風之眼",
	ScoreExpr 		= "(%d+)/2000",
	Alliance 		= "聯盟",
	Horde 			= "部落",
	WinBarText 		= "%s 勝利",
	FlagReset 		= "旗幟已重置!",
	FlagTaken 		= "(.+)已經奪走了旗幟!",
	FlagCaptured 		= "(.+)已奪得旗幟!",
	FlagDropped 		= "旗幟已經掉落!",

})

L:SetTimerLocalization({
	TimerStart 		= "戰鬥開始", 
	TimerFlag 		= "旗幟重生",
})

L:SetOptionLocalization({
	TimerStart  		= "顯示開始計時器",
	TimerWin 		= "顯示勝利計時器",
	TimerFlag 		= "顯示旗幟重生計時器",
	ShowPointFrame 		= "顯示旗幟攜帶者和預計勝利方",
})

--------------------
--  Warsong Gulch --
--------------------
L = DBM:GetModLocalization("Warsong")

L:SetGeneralLocalization({
	name 			= "戰歌峽谷"
})

L:SetMiscLocalization({
	BgStart60 		= "戰歌峽谷戰鬥將在1分鐘內開始。",
	BgStart30 		= "戰歌峽谷戰鬥將在30秒鐘內開始。做好準備!",
	ZoneName 		= "戰歌峽谷",
	Alliance 		= "聯盟",
	Horde 			= "部落",	
	InfoErrorText 		= "當你離開戰鬥後，旗幟框架將會回復。",
	ExprFlagPickUp 		= "(.+)的旗幟被(.+)拔掉了!",
	ExprFlagCaptured 	= "(.+)佔據了(.+)的旗幟!",
	ExprFlagReturn 		= "(.+)的旗幟被(.+)還到了它的基地",
	FlagAlliance 		= "聯盟旗幟: ",
	FlagHorde 		= "部落旗幟: ",
	FlagBase 		= "基地",
})

L:SetTimerLocalization({
	TimerStart 		= "戰鬥開始", 
	TimerFlag 		= "旗幟重生",
})

L:SetOptionLocalization({
	TimerStart  		= "顯示開始計時器",
	TimerWin 		= "顯示勝利計時器",
	TimerFlag 		= "顯示旗幟重生計時器",
	ShowFlagCarrier 	= "顯示旗幟攜帶者",
	ShowFlagCarrierErrorNote = "當正在戰鬥時顯示旗幟錯誤提示。",
})



----------------
--  Archavon  --
----------------

L = DBM:GetModLocalization("Archavon")

L:SetGeneralLocalization({
	name 			= "『石之看守者』亞夏梵"
})

L:SetWarningLocalization({
	WarningShards		= "岩石裂片: >%s<",
	WarningGrab		= "亞夏梵撞擊 >%s<"
})

L:SetTimerLocalization({
	TimerShards 		= "岩石裂片: %s"
})

L:SetMiscLocalization({
	TankSwitch 		= "%%s撲向(%S+)!"
})

L:SetOptionLocalization({
	TimerShards 		= "顯示岩石裂片計時器",
	WarningShards 		= "顯示岩石裂片警告",
	WarningGrab 		= "顯示坦克撞擊警告"
})

--------------
--  Emalon  --
--------------

L = DBM:GetModLocalization("Emalon")

L:SetGeneralLocalization{
	name = "『風暴看守者』艾瑪隆"
}

L:SetWarningLocalization{
	specWarnNova 		= "閃電新星",
	warnNova 		= "閃電新星",
	warnOverCharge		= "超載"
}

L:SetTimerLocalization{
	timerMobOvercharge	= "超載爆炸"
}

L:SetOptionLocalization{
	specWarnNova 		= ("為|cff71d5ff|Hspell:%d|h%s|h|r顯示特別警告"):format(64216, "閃電新星"),
	warnNova 		= ("為|cff71d5ff|Hspell:%d|h%s|h|r顯示警告"):format(64216, "閃電新星"),
	NovaSound		= "當施放閃電新星時播放音效",
	warnOverCharge 		= ("為|cff71d5ff|Hspell:%d|h%s|h|r顯示警告"):format(64218, "超載"),
	timerMobOvercharge	= "為超載的小怪顯示計時器(減益疊加)"
}