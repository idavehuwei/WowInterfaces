if GetLocale() ~= "zhCN" then return end

local L

-------------------
--  Anub'Rekhan  --
-------------------
L = DBM:GetModLocalization("Anub'Rekhan")

L:SetGeneralLocalization({
	name = "阿努比瑞克汉"
})

L:SetWarningLocalization({
	SpecialLocust			= "蝗虫风暴!",
	WarningLocustSoon		= "15秒后 蝗虫风暴",
	WarningLocustNow		= "蝗虫风暴!",
	WarningLocustFaded		= "蝗虫风暴消失了"
})

L:SetTimerLocalization({
	TimerLocustIn			= "蝗虫风暴", 
	TimerLocustFade 		= "蝗虫风暴启动"
})

L:SetOptionLocalization({
	SpecialLocust			= "为蝗虫风暴显示特别警告",
	WarningLocustSoon		= "显示蝗虫风暴的预先警告",
	WarningLocustNow		= "显示蝗虫风暴警告",
	WarningLocustFaded		= "显示蝗虫风暴消失警告",
	TimerLocustIn			= "显示蝗虫风暴定时器", 
	TimerLocustFade 		= "显示蝗虫风暴消失定时器"
})


----------------------------
--  Grand Widow Faerlina  --
----------------------------
L = DBM:GetModLocalization("Faerlina")

L:SetGeneralLocalization({
	name = "大寡妇费琳娜"
})

L:SetWarningLocalization({
	WarningEmbraceActive		= "寡妇之拥启动",
	WarningEmbraceExpire		= "寡妇之拥5秒后完结",
	WarningEmbraceExpired		= "寡妇之拥消失",
	WarningEnrageSoon		= "5秒后 狂怒",
	WarningEnrageNow		= "狂怒!"
})

L:SetTimerLocalization({
	TimerEmbrace			= "寡妇之拥启动",
	TimerEnrage			= "狂怒",
})

L:SetOptionLocalization({
	TimerEmbrace			= "显示寡妇之拥定时器",
	WarningEmbraceActive		= "显示寡妇之拥警告",
	WarningEmbraceExpire		= "当寡妇之拥完结时显示警告",
	WarningEmbraceExpired		= "当寡妇之拥即将完结时显示警告",
	WarningEnrageSoon		= "显示即将狂怒警告",
	WarningEnrageNow		= "显示狂怒警告",
	TimerEnrage			= "显示狂怒计时",
})


---------------
--  Maexxna  --
---------------
L = DBM:GetModLocalization("Maexxna")

L:SetGeneralLocalization({
	name = "梅克丝娜"
})

L:SetWarningLocalization({
	WarningWebWrap			= "撒网缠绕: >%s<",
	WarningWebSpraySoon		= "5秒后 撒网(晕)",
	WarningWebSprayNow		= "撒网!",
	WarningSpidersSoon		= "5秒后 小蜘蛛",
	WarningSpidersNow		= "小蜘蛛出现了!"
})

L:SetTimerLocalization({
	TimerWebSpray			= "撒网",
	TimerSpider			= "小蜘蛛"
})

L:SetOptionLocalization({
	WarningWebWrap			= "提示缠绕的蜘蛛网的目标",
	WarningWebSpraySoon		= "显示撒网的预先警告",
	WarningWebSprayNow		= "显示撒网警告",
	WarningSpidersSoon		= "显示小蜘蛛的预先警告",
	WarningSpidersNow		= "显示小蜘蛛警告",
	TimerWebSpray			= "显示撒网定时器",
	TimerSpider			= "显示小蜘蛛定时器"
})

L:SetMiscLocalization({
	YellWebWrap			= "我被缠绕住了! 救我!"
})

------------------------------
--  Noth the Plaguebringer  --
------------------------------
L = DBM:GetModLocalization("Noth")

L:SetGeneralLocalization({
	name = "『瘟疫使者』诺斯"
})

L:SetWarningLocalization({
	WarningTeleportNow		= "闪现!",
	WarningTeleportSoon		= "20秒后 闪现",
	WarningCurse			= "诅咒!"
})

L:SetTimerLocalization({
	TimerTeleport			= "闪现",
	TimerTeleportBack		= "闪现回来"
})

L:SetOptionLocalization({
	WarningTeleportNow		= "显示闪现警告",
	WarningTeleportSoon		= "显示闪现的预先警告",
	WarningCurse			= "显示诅咒警告",
	TimerTeleport			= "显示闪现定时器",
	TimerTeleportBack		= "显示闪现回来定时器"
})


--------------------------
--  Heigan the Unclean  --
--------------------------
L = DBM:GetModLocalization("Heigan")

L:SetGeneralLocalization({
	name = "『不洁者』海根"
})

L:SetWarningLocalization({
	WarningTeleportNow		= "闪现!",
	WarningTeleportSoon		= "%d秒后 闪现",
})

L:SetTimerLocalization({
	TimerTeleport			= "闪现",
})

L:SetOptionLocalization({
	WarningTeleportNow		= "显示闪现警告",
	WarningTeleportSoon		= "显示闪现的预先警告",
	WarningCurse			= "显示诅咒警告",
	TimerTeleport			= "显示闪现定时器",
	TimerTeleportBack		= "显示闪现回来定时器"
})


----------------
--  Lolotheb  --
----------------
L = DBM:GetModLocalization("Loatheb")

L:SetGeneralLocalization({
	name = "憎恨者"
})

L:SetWarningLocalization({
	WarningSporeNow			= "孢子出现了!",
	WarningSporeSoon		= "5秒后 孢子",
	WarningDoomNow			= "无可避免的末日 #%d",
	WarningHealSoon			= "3秒后可以治疗",
	WarningHealNow			= "现在治疗!"
})

L:SetTimerLocalization({
	TimerDoom			= "无可避免的末日 #%d",
	TimerSpore			= "下一个 孢子",
	TimerAura			= "亡域光环"
})

L:SetOptionLocalization({
	WarningSporeNow			= "显示孢子警告",
	WarningSporeSoon		= "显示孢子的预先警告",
	WarningDoomNow			= "显示无可避免的末日警告",
	WarningHealSoon			= "显示\"3秒后可以治疗\"的预先警告",
	WarningHealNow			= "显示\"现在治疗\"警告",
	TimerDoom			= "显示无可避免的末日定时器",
	TimerSpore			= "显示孢子定时器",
	TimerAura			= "显示亡域光环定时器"
})



-----------------
--  Patchwerk  --
-----------------
L = DBM:GetModLocalization("Patchwerk")

L:SetGeneralLocalization({
	name = "缝补者"
})

L:SetOptionLocalization({
	WarningHateful 			= "通告憎恨打击到团队频道\n(你需要团队领袖或助理权限)"
})

L:SetMiscLocalization({
	yell1 				= "缝补者要跟你玩!",
	yell2 				= "科尔苏加德让缝补者成为战争的化身!",
	HatefulStrike 			= "憎恨打击 --> %s [%s]"
})


-----------------
--  Grobbulus  --
-----------------
L = DBM:GetModLocalization("Grobbulus")

L:SetGeneralLocalization({
	name = "葛罗巴斯"
})

L:SetOptionLocalization({
	WarningInjection		= "显示突变注射警告",
	SpecialWarningInjection		= "当你中了突变注射时显示特别警告"
})

L:SetWarningLocalization({
	WarningInjection		= "突变注射: >%s<",
	SpecialWarningInjection		= "你中了突变注射!"
})

L:SetTimerLocalization({
})


-------------
--  Gluth  --
-------------
L = DBM:GetModLocalization("Gluth")

L:SetGeneralLocalization({
	name = "古鲁斯"
})

L:SetOptionLocalization({
	WarningDecimateNow		= "显示残杀警告",
	WarningDecimateSoon		= "显示残杀的预先警告",
	TimerDecimate			= "显示残杀定时器"
})

L:SetWarningLocalization({
	WarningDecimateNow		= "残杀!",
	WarningDecimateSoon		= "10秒后 残杀"
})

L:SetTimerLocalization({
	TimerDecimate			= "残杀冷却"
})


----------------
--  Thaddius  --
----------------
L = DBM:GetModLocalization("Thaddius")

L:SetGeneralLocalization({
	name = "泰迪斯"
})

L:SetMiscLocalization({
	Yell				= "斯塔拉格要碾碎你﹗",
	Emote				= "%s超过负荷!", -- ?
	Emote2				= "泰斯拉线圈超过负荷!", -- ?
	Boss1 = "伏晨",
	Boss2 = "斯塔拉格",
	Charge1 = "负极",
	Charge2 = "正极",
})

L:SetOptionLocalization({
	WarningShiftCasting		= "显示极性转换警告",
	WarningChargeChanged		= "显示特别警告当你的极性变了",
	WarningChargeNotChanged		= "显示特别警告当你的极性没有改变",
	TimerShiftCast			= "显示极性转换施放定时器",
	TimerNextShift			= "显示极性转换冷却定时器",
	ArrowsEnabled			= "显示箭头 (正常 \"二边\" 站位打法)",
	ArrowsRightLeft			= "显示左/右箭头 给 \"四角\" 站位打法 (如果极性改变显示左箭头, 没变显示左箭头)",
	ArrowsInverse			= "倒转的 \"四角\" 站位打法 (如果极性改变显示左箭头, 没变显示右箭头)",
	WarningThrow			= "显示投掷坦克警告",
	WarningThrowSoon		= "显示投掷坦克的预先警告",
	TimerThrow			= "显示投掷坦克定时器"
})

L:SetWarningLocalization({
	WarningShiftCasting		= "5秒后 极性转换!",
	WarningChargeChanged		= "极性变为%s",
	WarningChargeNotChanged		= "极性没有改变",
	WarningThrow			= "投掷坦克!",
	WarningThrowSoon		= "3秒后 投掷坦克"
})

L:SetTimerLocalization({
	TimerShiftCast			= "施放极性转换",
	TimerNextShift			= "下一次极性转换",
	TimerThrow			= "投掷坦克"
})

L:SetOptionCatLocalization({
	Arrows				= "箭头",
})


-----------------
--  Razuvious  --
-----------------
L = DBM:GetModLocalization("Razuvious")

L:SetGeneralLocalization({
	name = "讲师拉祖维斯"
})

L:SetMiscLocalization({
	Yell1 				= "绝不留情!",
	Yell2 				= "练习时间到此为止!都拿出真本事来!",
	Yell3 				= "照我教你的做!",
	Yell4 				= "绊腿……有什么问题吗?"
})

L:SetOptionLocalization({
	WarningShoutNow			= "显示混乱怒吼警告",
	WarningShoutSoon		= "显示混乱怒吼的预先警告",
	TimerShout			= "显示混乱怒吼定时器",
	WarningShieldWallSoon		= "显示盾墙失效警告",
	TimerShieldWall			= "显示盾墙定时器",
	TimerTaunt			= "显示嘲讽定时器"
})

L:SetWarningLocalization({
	WarningShoutNow			= "混乱怒吼!",
	WarningShoutSoon		= "5秒后 混乱怒吼",
	WarningShieldWallSoon		= "5秒后 盾墙失效"
})

L:SetTimerLocalization({
	TimerShout			= "混乱怒吼",
	TimerTaunt			= "嘲讽",
	TimerShieldWall			= "盾墙"
})

--------------
--  Gothik  --
--------------
L = DBM:GetModLocalization("Gothik")

L:SetGeneralLocalization({
	name = "『收割者』高希"
})

L:SetOptionLocalization({
	TimerWave			= "显示波段计时",
	TimerPhase2			= "显示第二阶段计时",
	WarningWaveSoon			= "显示波段的预先警告",
	WarningWaveSpawned		= "显示波段出现警告",
	WarningRiderDown		= "当骑兵死亡时显示警告",
	WarningKnightDown		= "死亡骑士死亡时显示警告",
	WarningPhase2			= "显示第二阶段警告"
})

L:SetTimerLocalization({
	TimerWave			= "第 #%d 波",
	TimerPhase2			= "第2阶段"
})

L:SetWarningLocalization({
	WarningWaveSoon			= "3秒后第%d波: %s",
	WarningWaveSpawned		= "第%d波: %s 出现了",
	WarningRiderDown		= "骑兵已死亡﹗",
	WarningKnightDown		= "死亡骑士已死亡﹗",
	WarningPhase2			= "第二阶段"
})

L:SetMiscLocalization({
	yell				= "你们这些蠢货已经主动步入了陷阱。",
	WarningWave1			= "%d %s",
	WarningWave2			= "%d %s 和 %d %s",
	WarningWave3			= "%d %s, %d %s 和 %d %s",
	Trainee				= "受训者",
	Knight				= "死骑",
	Rider				= "骑兵",
})


----------------
--  Horsemen  --
----------------
L = DBM:GetModLocalization("Horsemen")

L:SetGeneralLocalization({
	name = "四骑士"
})

L:SetOptionLocalization({
	TimerMark			= "显示印记定时器",
	WarningMarkSoon			= "显示印记的预先警告",
	WarningMarkNow			= "显示印记警告",
	SpecialWarningMarkOnPlayer	= "当你印记迭加大于四时显示特别警告"
})

L:SetTimerLocalization({
	TimerMark 			= "印记 %d"
})

L:SetWarningLocalization({
	WarningMarkSoon			= "3秒后 印记 %d",
	WarningMarkNow			= "印记 #%d",
	SpecialWarningMarkOnPlayer	= "%s: %s",
})

L:SetMiscLocalization({
	Korthazz			= "寇斯艾兹族长",
	Rivendare			= "瑞文戴尔男爵",
	Blaumeux			= "布洛莫斯女士",
	Zeliek				= "札里克爵士",
})


-----------------
--  Sapphiron  --
-----------------
L = DBM:GetModLocalization("Sapphiron")

L:SetGeneralLocalization({
	name = "萨菲隆"
})

L:SetOptionLocalization({
	WarningDrainLifeNow		= "显示生命吸取警告",
	WarningDrainLifeSoon		= "显示生命吸取的预先警告",
	WarningAirPhaseSoon		= "显示空中阶段的预先警告",
	WarningAirPhaseNow		= "显示空中阶段警告",
	WarningLanded			= "显示地上阶段警告",
	TimerDrainLifeCD		= "显示生命吸取定时器",
	TimerAir			= "显示空中阶段定时器",
	TimerLanding			= "显示降落定时器",
	TimerIceBlast			= "显示深呼吸定时器",
	WarningDeepBreath		= "显示深呼吸特别警告",
	WarningIceblock			= "当你中了冰箱大喊",
})

L:SetMiscLocalization({
	EmoteBreath			= "%s深深地吸了一口气。",
	WarningYellIceblock		= "我在冰箱入面!"
})

L:SetWarningLocalization({
	WarningDrainLifeNow		= "生命吸取!",
	WarningDrainLifeSoon		= "生命吸取 即将发动",
	WarningAirPhaseSoon		= "10秒后 空中阶段",
	WarningAirPhaseNow		= "空中阶段",
	WarningLanded			= "萨菲隆降落了",
	WarningDeepBreath		= "深呼吸!",
})

L:SetTimerLocalization({
	TimerDrainLifeCD		= "生命吸取冷却",
	TimerAir			= "空中阶段",
	TimerLanding			= "降落",
	TimerIceBlast			= "深呼吸"	
})

------------------
--  Kel'thuzad  --
------------------

L = DBM:GetModLocalization("Kel'Thuzad")

L:SetGeneralLocalization({
	name = "科尔苏加德"
})

L:SetOptionLocalization({
	TimerPhase2			= "显示第二阶段定时器",
	WarningBlastTargets		= "显示冰霜冲击警告",
	WarningPhase2			= "显示第二阶段警告",
	WarningFissure			= "显示暗影裂缝警告",
	WarningMana			= "显示爆裂法力警告",
	WarningChainsTargets		= "显示科尔苏加德之炼(心控)警告"
})

L:SetMiscLocalization({
	Yell 				= "仆从们，侍卫们，隶属于黑暗与寒冷的战士们!听从科尔苏加德的召唤!"
})

L:SetWarningLocalization({
	WarningBlastTargets		= "冰霜冲击: >%s<",
	WarningPhase2			= "第二阶段",
	WarningFissure			= "暗影裂缝 出现了",
	WarningMana			= "爆裂法力: >%s<",
	WarningChainsTargets		= "科尔苏加德之炼(心控): >%s<"
})

L:SetTimerLocalization({
	TimerPhase2			= "第二阶段"
})
