if GetLocale() ~= "zhCN" then return end

local L


----------------------
--  FlameLeviathan  --
----------------------
L = DBM:GetModLocalization("FlameLeviathan")

L:SetGeneralLocalization{
	name = "烈焰战轮"
}

L:SetTimerLocalization{
	timerPursued			= "猎杀: %s",
	timerFlameVents			= "烈焰外泄",
	timerSystemOverload		= "电路超载"
}
	
L:SetMiscLocalization{
	YellPull			= "发现敌意实体。启动威胁评估协定。首要目标接近中。30秒后将再度评估。",
	Emote				= "%%s紧追(%S+)%。"
}

L:SetWarningLocalization{
	PursueWarn			= "猎杀 >%s<!",
	warnNextPursueSoon		= "5秒后 猎杀转换",
	SpecialPursueWarnYou		= "你中了猎杀啰 快跑",
	SystemOverload			= "电路超载"
}

L:SetOptionLocalization{
	timerSystemOverload		= "显示电路超载定时器",
	timerFlameVents			= "显示烈焰外泄定时器",
	timerPursued			= "显示猎杀定时器",
	SystemOverload			= "为电路超载显示特别警告",
	SpecialPursueWarnYou		= "当猎杀时显示特别警告",
	PursueWarn			= "当玩家中了猎杀时显示团队警告",
	warnNextPursueSoon		= "猎杀转换前警告"
}


-------------
--  Ignis  --
-------------
L = DBM:GetModLocalization("Ignis")

L:SetGeneralLocalization{
	name = "『火炉之主』伊格尼司"
}

L:SetTimerLocalization{
	TimerFlameJetsCast		= "烈焰喷泄",
	TimerFlameJetsCooldown		= "下一次 烈焰喷泄",
	TimerScorch			= "下一次 灼烧",
	TimerScorchCast			= "灼烧",
	TimerSlagPot			= "熔渣之盆: %s"
}

L:SetWarningLocalization{
	WarningSlagPot			= "熔渣之盆: >%s<",
	SpecWarnJetsCast		= "烈焰喷泄 - 停止施法"
}

L:SetOptionLocalization{
	SpecWarnJetsCast		= "为烈焰喷泄显示特别警告 (断法)",
	TimerFlameJetsCast		= "显示烈焰喷泄的施法定时器",
	TimerFlameJetsCooldown		= "显示烈焰喷泄的冷却定时器",
	TimerScorch			= "显示灼烧的冷却计时",
	TimerScorchCast			= "显示灼烧的施法计时",
	WarningSlagPot			= "提示熔渣之盆的目标",
	TimerSlagPot			= "显示熔渣之盆定时器",
	SlagPotIcon			= "设置标记在熔渣之盆的目标"
}

------------------
--  Razorscale  --
------------------
L = DBM:GetModLocalization("Razorscale")

L:SetGeneralLocalization{
	name = "锐鳞"
}

L:SetWarningLocalization{	
	SpecWarnDevouringFlame		= "吞噬烈焰 - 移动啰!!",
	warnTurretsReadySoon		= "20秒后 第四座炮塔完成",
	warnTurretsReady		= "第四座炮塔已完成",
	SpecWarnDevouringFlameCast	= "你中了吞噬烈焰",
	WarnDevouringFlameCast		= "吞噬烈焰: >%s<", 
}
L:SetTimerLocalization{
	timerDeepBreathCooldown		= "下一次 火息术",
	timerDeepBreathCast		= "火息术",
	timerAllTurretsReady		= "炮塔",
	timerTurret1			= "炮塔1",
	timerTurret2			= "炮塔2",
	timerTurret3			= "炮塔3",
	timerTurret4			= "炮塔4"
}
L:SetOptionLocalization{
	timerDeepBreathCooldown		= "为下一次火息术显示定时器",
	timerDeepBreathCast		= "显示火息术的施法定时器",
	SpecWarnDevouringFlame		= "当你在吞噬烈焰的攻击范围时显示特别警告",
	PlaySoundOnDevouringFlame	= "当受到吞噬烈焰时播放音效",
	timerAllTurretsReady		= "为炮塔显示定时器",
	warnTurretsReadySoon		= "显示炮塔的预先警告",
	warnTurretsReady		= "显示炮塔的警告",
	SpecWarnDevouringFlameCast    	= "当你中了吞噬烈焰时显示特别警告",
	WarnDevouringFlameCast       	= "当施放吞噬烈焰时显示警告",
	timerTurret1			= "显示炮塔1的计时器",
	timerTurret2			= "显示炮塔2的计时器",
	timerTurret3			= "显示炮塔3的计时器 (英雄)",
	timerTurret4			= "显示炮塔4的计时器 (英雄)",
}

L:SetMiscLocalization{
	YellAir 			= "给我们一点时间来准备建造炮塔。",
	YellGroundTemp			= "快!她可不会在地面上待太久!",
	EmotePhase2			= "%%s再也飞不动了!",
	FlamecastUnknown		= "未知"
}


-------------
--  XT002  --
-------------
L = DBM:GetModLocalization("XT002")

L:SetGeneralLocalization{
	name = "XT-002拆解者"
}

L:SetTimerLocalization{
}

L:SetWarningLocalization{
	SpecialWarningLightBomb 	= "你中了裂光弹!",
	WarningLightBomb		= "裂光弹: >%s<",
	SpecialWarningGravityBomb	= "你中了重力弹!",
	WarningGravityBomb		= "重力弹: >%s<",
}

L:SetOptionLocalization{
	SpecialWarningLightBomb		= "当你中了裂光弹时显示特别警告",
	WarningLightBomb		= "提示裂光弹",
	SpecialWarningGravityBomb	= "当你中了重力弹时显示特别警告",
	WarningGravityBomb		= "提示重力弹",
	PlaySoundOnGravityBomb		= "当你中了重力弹时播放音效",
	PlaySoundOnTympanicTantrum	= "躁怒时播放音效",
	SetIconOnLightBombTarget	= "设置标记在裂光弹的目标",
	SetIconOnGravityBombTarget	= "设置标记在重力弹的目标",
}

-------------------
--  IronCouncil  --
-------------------
L = DBM:GetModLocalization("IronCouncil")

L:SetGeneralLocalization{
	name = "铁之议会"
}

L:SetWarningLocalization{
	WarningSupercharge		= "超级充能 即将到来",
	WarningChainlight		= "闪电链",
	WarningFusionPunch		= "熔能拳击",
	WarningOverwhelmingPower	= "极限威能: >%s<",
	WarningRuneofPower		= "力之符文",
	WarningRuneofDeath		= "死亡符文",
	RuneofDeath			= "死亡符文 - 移动",
	LightningTendrils		= "闪电触须 - 跑开!",
	WarningRuneofSummoning			= "召唤符文"
}

L:SetTimerLocalization{
	TimerSupercharge		= "超级充能",
	TimerOverload			= "超载",
	TimerLightningWhirl		= "闪电旋风",
	TimerLightningTendrils		= "闪电触须",
	timerFusionPunchCast		= "熔能拳击施放",
	timerFusionPunchActive		= "熔能拳击: %s",
	timerOverwhelmingPower		= "极限威能: %s",
	timerRunicBarrier		= "符刻屏障",
	timerRuneofDeath		= "死亡符文",
}

L:SetOptionLocalization{
	TimerSupercharge		= "显示超级充能定时器",
	WarningSupercharge		= "当超级充能施放时显示警告",
	WarningChainlight		= "提示闪电链",
	TimerOverload			= "显示超载的施法定时器",
	PlaySoundOnOverload		= "当超载施放时播放音效",
	TimerLightningWhirl		= "显示闪电旋风的施法定时器",
	LightningTendrils		= "为闪电触须显示特别警告",
	TimerLightningTendrils		= "显示闪电旋风的持续时间定时器",
	PlaySoundLightningTendrils	= "闪电触须时播放音效",
	WarningFusionPunch		= "提示熔能拳击",
	timerFusionPunchCast		= "为熔能拳击显示施法计时条",
	timerFusionPunchActive		= "显示熔能拳击定时器",
	WarningOverwhelmingPower	= "提示极限威能",
	timerOverwhelmingPower		= "显示极限威能定时器",
	SetIconOnOverwhelmingPower	= "设置标记在极限威能的目标",
	timerRunicBarrier		= "显示符刻屏障定时器",
	WarningRuneofPower		= "提示力之符文",
	WarningRuneofDeath		= "提示死亡符文",
	RuneofDeath			= "为死亡符文显示特别警告",
	timerRuneofDeath		= "显示死亡符文的持续时间定时器",
	PlaySoundDeathRune		= "当死亡符文施放时播放音效",
	WarningRuneofSummoning 		= "提示召唤符文"
}

L:SetMiscLocalization{
	Steelbreaker			= "破钢者",
	RunemasterMolgeim		= "符文大师墨吉姆",
	StormcallerBrundir 		= "风暴召唤者布伦迪尔"
}


---------------
--  Algalon  --
---------------
L = DBM:GetModLocalization("Algalon")

L:SetGeneralLocalization{
	name = "『观察者』艾尔加隆"
}

L:SetTimerLocalization{
	TimerBigBangCast		= "大爆炸 施放",
}
L:SetWarningLocalization{
	WarningPhasePunch		= "相位拳击: >%s<",
	WarningBlackHole		= "黑洞爆炸",
}

L:SetOptionLocalization{
	TimerBigBangCast		= "为大爆炸显示施法计时条",
	SpecWarnPhasePunch		= "当你中了相位拳击显示特别警告",
	WarningPhasePunch		= "提示相位拳击的目标",
	WarningBlackHole		= "提示黑洞爆炸",
}


----------------
--  Kologarn  --
----------------
L = DBM:GetModLocalization("Kologarn")

L:SetGeneralLocalization{
	name = "科罗刚恩"
}

L:SetWarningLocalization{
	SpecialWarningEyebeam		= "集束目光看着你 - 跑开",
	WarningEyebeam			= "集束目光: >%s<",
	WarnGrip			= "坚石之握: >%s<"
}

L:SetTimerLocalization{
	timerEyebeam			= "集束目光: %s",
	timerPetrifyingBreath		= "石化之息",
	timerNextShockwave		= "下一个 震摄波",
	timerLeftArm			= "左臂 重生",
	timerRightArm			= "右臂 重生",
	achievementDisarmed		= "卸除手臂 计时器"
}

L:SetOptionLocalization{
	SpecialWarningEyebeam		= "当集束目光看着你显示特别警告",
	WarningEyebeam			= "提示集束目光的目标",
	timerEyebeam			= "显示集束目光的定时器",
	SetIconOnEyebeamTarget		= "设置标记在集束目光的目标",
	timerPetrifyingBreath		= "显示石化之息的定时器",
	timerNextShockwave		= "显示震摄波的定时器",
	timerLeftArm			= "显示手臂重生(左) 的定时器",
	timerRightArm			= "显示手臂重生(右) 的定时器",
	WarnGrip			= "提示坚石之握的目标",
	SetIconOnGripTarget		= "设置标记在坚石之握的目标",
	achievementDisarmed		= "为成就:卸除手臂显示定时器"
}

L:SetMiscLocalization{
	Yell_Trigger_arm_left		= "小小的擦伤!",
	Yell_Trigger_arm_right		= "只是皮肉之伤!",
	Health_Body			= "科罗刚恩身体",
	Health_Right_Arm		= "右臂",
	Health_Left_Arm			= "左臂"
}

---------------
--  Auriaya  --
---------------
L = DBM:GetModLocalization("Auriaya")

L:SetGeneralLocalization{
	name = "奥芮雅"
}

L:SetMiscLocalization{
	Defender 			= "野性防卫者 (%d)"
}

L:SetWarningLocalization{
	SpecWarnBlast 			= "哨兵冲击 - 打断!",
	SpecWarnVoid			= "虚空区域 - 移动!",
	WarnCatDied 			= "野性防卫者倒下 (剩余%d支)",
	WarnCatDiedOne 			= "野性防卫者倒下 (剩下最后一条命)",
	WarnFear 			= "恐惧!",
	WarnFearSoon 			= "下一次恐惧即将到来!",
	WarnSonic			= "音速尖啸!",
	WarnSwarm			= "猫群守护者: >%s<"
}

L:SetOptionLocalization{
	SpecWarnBlast	 		= "为哨兵冲击显示特别警告",
	SpecWarnVoid			= "当站在野性精华上面时显示特别警告",
	WarnFear 			= "显示恐惧警告",
	WarnFearSoon 			= "显示即将恐惧警告",
	WarnCatDied 			= "当野性防卫者死亡时显示警告",
	WarnCatDiedOne 			= "当野性防卫者剩下最后一条命时显示警告",
	WarnSwarm			= "当猫群守护者出现时显示警告",
	WarnSonic			= "显示音速尖啸警告"
}


-------------
--  Hodir  --
-------------
L = DBM:GetModLocalization("Hodir")

L:SetGeneralLocalization{
	name = "霍迪尔"
}

L:SetWarningLocalization{
	WarningFlashFreeze		= "闪霜",
	WarningBitingCold		= "刺骨之寒 - 移动"
}

L:SetTimerLocalization{
	TimerFlashFreeze		= "闪霜 即将到来",  -- all ppl have to move on the rock patches
}

L:SetOptionLocalization{
	TimerFlashFreeze		= "显示闪霜的施放定时器",
	WarningFlashFreeze		= "为闪霜显示警告",
	WarningBitingCold		= "为刺骨之寒显示警告",
	PlaySoundOnFlashFreeze		= "当闪霜施放时播放音效"
}

L:SetMiscLocalization{
	YellKill			= "我…我终于从他的掌控中…解脱了。"
}


--------------
--  Thorim  --
--------------
L = DBM:GetModLocalization("Thorim")

L:SetGeneralLocalization{
	name = "索林姆"
}

L:SetWarningLocalization{
	WarningStormhammer		= "风暴之锤: >%s<",
	UnbalancingStrike		= "失衡打击: >%s<",
	WarningPhase2			= "第二阶段",
	WarningLightningCharge		= "闪电充能",
	WarningBomb			= "引爆符文: >%s<",
	LightningOrb 			= "你中了闪电震击! 快跑!"
}

L:SetTimerLocalization{
	TimerHardmode			= "困难模式"
}

L:SetOptionLocalization{
	TimerHardmode			= "显示困难模式定时器",
	UnbalancingStrike		= "提示失衡打击的目标",
	WarningStormhammer		= "提示风暴之锤的目标",
	WarningLightningCharge		= "提示闪电充能",
	WarningPhase2			= "提示第二阶段",
	RangeFrame			= "显示距离框",
	WarningBomb			= "提示引爆符文",
	LightningOrb 			= "当你中了闪电充能时显示特别警告"
}

L:SetMiscLocalization{
	YellPhase1			= "擅闯者!像你们这种胆敢干涉我好事的凡人将付出…等等--你……",
	YellPhase2			= "无礼的小辈，你竟敢在我的王座之上挑战我?我会亲手碾碎你们!",
	YellKill			= "住手!我认输了!"
}


-------------
--  Freya  --
-------------
L = DBM:GetModLocalization("Freya")

L:SetGeneralLocalization{
	name = "芙蕾雅"
}

L:SetMiscLocalization{
	SpawnYell 			= "孩子们，协助我!",
	WaterSpirit 			= "上古水之灵",
	Snaplasher 			= "猛攫鞭笞者",
	StormLasher 			= "风暴鞭笞者",
	YellKill			= "他对我的操控已然退散。我已再次恢复神智了。感激不尽，英雄们。"
}

L:SetWarningLocalization{
	WarnPhase2 			= "第二阶段",
	WarnSimulKill			= "第一支小怪死亡 - 1分钟后复活",
	WarnFury 			= "自然烈怒: >%s<",
	SpecWarnFury 			= "你中了自然烈怒!",
	WarningTremor   		= "地面震颤 - 停止施法"
}

L:SetTimerLocalization{
	TimerUnstableSunBeam 		= "太阳光束: %s",
	TimerAlliesOfNature 		= "自然和谐冷却",
	TimerSimulKill 			= "复活",
	TimerFuryYou 			= "你中了自然烈怒"
}

L:SetOptionLocalization{
	TimerAlliesOfNature 		= "显示自然和谐冷却时间",
	TimerSimulKill 			= "显示小怪复活定时器",
	TimerFuryYou 			= "显示自然烈怒定时器",
	WarnPhase2 			= "提示第二阶段",
	WarnSimulKill			= "提示小怪复活",
	WarnFury 			= "提示自然烈怒",
	SpecWarnFury 			= "当你中了自然烈怒时显示特别警告",
	WarningTremor   		= "当王施放地面震颤时显示特别警告"
}

-------------------
--  Mimiron  --
-------------------
L = DBM:GetModLocalization("Mimiron")

L:SetGeneralLocalization{
	name = "弥米伦"
}

L:SetWarningLocalization{
	DarkGlare 			= "雷射弹幕",
	WarningPlasmaBlast		= "离子冲击: %s - 治疗", --unusable?
	Phase2Engaged			= "第二阶段即将到来 - 现在重组",
	Phase3Engaged			= "第三阶段即将到来 - 现在重组",
	WarnShell			= "凝汽弹: >%s<",
	WarnBlast			= "离子冲击: >%s<",
	MagneticCore			= ">%s< 拿到了磁能之核",
	WarningShockBlast		= "震爆 - 跑开!"
}

L:SetTimerLocalization{
	ProximityMines			= "新的环罩地雷",
	TimeToPhase2			= "第二阶段开始",
	TimeToPhase3			= "第三阶段开始",
}

L:SetOptionLocalization{
	WarningShockBlast		= "显示震爆警告",
	WarningPlasmaBlast		= "显示离子冲击",
	ProximityMines			= "显示环罩地雷定时器",
	PlaySoundOnShockBlast 		= "当震爆施放时播放音效",
	DarkGlare 			= "提示雷射弹幕",
	PlaySoundOnDarkGlare 		= "雷射弹幕施放前播放音效",
	NextDarkGlare 			= "下一次 雷射弹幕的计时器",
	TimeToPhase2			= "显示第二阶段开始计时器", --第二阶段开始
	TimeToPhase3			= "显示第三阶段开始计时器", --第三阶段开始
	SpinUp 				= "显示暖机(雷射弹幕施放前的技能)定时器",
	MagneticCore			= "提示磁能之核的拾取者",
	HealthFramePhase4		= "显示第4阶段的首领血量框架",
	WarnShell			= "提示凝汽弹的目标",
	WarnBlast			= "提示离子冲击的目标"
}

L:SetMiscLocalization{
	YellPull			= "我们没有太多时间，朋友们!你们要帮我测试我最新也是最伟大的创作。在你们改变心意之前，别忘了就是你们把XT-002搞得一团糟，你们欠我一次。",	
	YellPhase2			= "太好了!绝妙的良好结果!外壳完整度98.9%!几乎只有一点擦痕!继续下去。",
	YellPhase3			= "感谢你，朋友们!我们的努力让我获得了一些绝佳的数据!现在，我把东西放在哪儿了--噢，在这里。",
	LootMsg				= "(.+)拾取了物品:.*Hitem:(%d+)",
	MobPhase1 			= "空中指挥装置",
	MobPhase2 			= "VX-001",
	MobPhase3 			= "战轮MK II"
}


--------------------
--  GeneralVezax  --
--------------------
L = DBM:GetModLocalization("GeneralVezax")

L:SetGeneralLocalization{
	name = "威札斯将军"
}

L:SetWarningLocalization{
	SpecialWarningShadowCrash	= "你中了暗影暴击",
	SpecialWarningSurgeDarkness	= "暗郁奔腾",
	WarningShadowCrash		= "暗影暴击: >%s<",
	SpecialWarningLLYou		= "你中了无面者印记!",
	SpecialWarningLLNear		= "接近你的%s中了无面者印记!"
}

L:SetOptionLocalization{
	WarningShadowCrash		= "为暗影暴击显示特别警告",
	SetIconOnShadowCrash		= "为暗影暴击的目标设置标记(头颅)",
	SetIconOnLifeLeach		= "为无面者印记的目标设置标记(十字)",
	SpecialWarningSurgeDarkness	= "为暗郁奔腾显示特别警告",
	SpecialWarningShadowCrash	= "为暗影暴击显示特别警告",
	SpecialWarningLLYou		= "当你中了无面者印记时显示特别警告",
	SpecialWarningLLNear		= "当你附近的人中了无面者印记时显示特别警告",
	CrashWhisper 			= "密语提示中了暗影暴击的人"
}

L:SetMiscLocalization{
	EmoteSaroniteVapors		= "一片萨伦烟雾在附近聚合!",
	CrashWhisper			= "你中了暗影暴击! 跑开!"
}


-----------------
--  YoggSaron  --
-----------------
L = DBM:GetModLocalization("YoggSaron")

L:SetGeneralLocalization{
	name = "尤格萨伦"
}

L:SetMiscLocalization{
	YellPull 			= "我们即将有机会打击怪物的首脑!现在将你的愤怒与仇恨贯注在他的爪牙上!",
	YellPhase2 			= "我是清醒的梦境。",
	Sara 				= "萨拉",
	WhisperBrainLink 		= "你中了脑波连结! 跑向 %s!",
	WarningYellSqueeze		= "我给触手绑了! 快救命!"
}

L:SetWarningLocalization{
	WarningWellSpawned 		= "理智之井 出现了",
	WarningGuardianSpawned 		= "尤格萨伦守护者 出现了",
	WarningP2 			= "第二阶段",
	WarningP3 			= "第三阶段",
	WarningBrainLink 		= "脑波连结: >%s< 和 >%s<",
	SpecWarnBrainLink 		= "你和%s中了脑波连结!",
	WarningSanity 			= "剩下 %d 理智",
	SpecWarnSanity 			= "剩下 %d 理智",
	SpecWarnGuardianLow 		= "停止攻击这支守护者!",
	WarnMadness 			= "正在施放 疯狂诱陷",
	SpecWarnMadnessOutNow		= "疯狂诱陷即将完结 - 快传送出去",
	WarnBrainPortalSoon		= "3秒后 传送门出现",
	WarnSqueeze 			= "压榨(触手绑人): >%s<"
}

L:SetTimerLocalization{
	NextPortal			= "下一次 传送门",
}

L:SetOptionLocalization{
	WarningWellSpawned 		= "提示理智之井的出现",
	WarningGuardianSpawned 		= "提示尤格萨伦守护者的出现",
	WarningP2 			= "提示第二阶段",
	WarningP3			= "提示第三阶段",
	WarningBrainLink		= "提示脑波连结",
	SpecWarnBrainLink 		= "当你中了脑波链接显示特别警告",
	WarningSanity			= "当理智剩下50时显示警告",
	SpecWarnSanity			= "当理智过低(25,15,5)时显示特别警告",
	SpecWarnGuardianLow		= "当守护者(P1)血量过低时(DD用)显示特别警告",
	WarnMadness 			= "显示疯狂诱陷的施放警告",
	SpecWarnMadnessOutNow		= "在疯狂诱陷完结前显示特别警告",
	WhisperBrainLink 		= "密语提示中了脑波连结的人",
	NextPortal			= "显示下一次 传送门的定时器",
	WarnBrainPortalSoon		= "提示传送门",
	WarnSqueeze			= "提示压榨 (触手绑人)",
	WarningSqueeze			= "当你中了压榨 (触手绑人)时大喊",
	SetIconOnFearTarget		= "设置标记在恐惧的目标",
	ShowSaraHealth			= "显示萨拉的血量"
}
