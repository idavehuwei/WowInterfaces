-- Simplified Chinese by Diablohu
-- http://wow.gamespot.com.cn
-- Last Update: 12/13/2008

if GetLocale() ~= "zhCN" then return end

local L

local spell = "%s"
local debuff = "%s: >%s<"
local spellCD = "%s - 冷却" -- translate
local spellSoon = "%s - 即将施放" -- translate
local optionWarning = "显示%s警报" -- translate
local optionPreWarning = "显示%s预警" -- translate
local optionSpecWarning = "显示%s特殊警报" -- translate
local optionTimerCD = "显示%s冷却计时条" -- translate
local optionTimerDur = "显示%s持续时间" -- translate
local optionTimerCast = "显示%s施法时间" -- translate

----------------------------------
-- Ahn'Kahet: The Old Kingdom  --
----------------------------------
-- Prince Taldaram  --
-----------------------
L = DBM:GetModLocalization("Taldaram")

L:SetGeneralLocalization({
    name = "塔达拉姆王子"
})

L:SetWarningLocalization({
    WarningFlame = spell,
    WarningEmbrace = debuff
})

L:SetTimerLocalization({
    TimerEmbrace = debuff,
    TimerFlameCD = spellCD
})

L:SetOptionLocalization({
    WarningFlame = optionWarning:format(GetSpellInfo(55931)),
    WarningEmbrace = optionWarning:format(GetSpellInfo(55959)),
    TimerEmbrace = optionTimerDur:format(GetSpellInfo(55959)),
    TimerFlameCD = optionTimerCD:format(GetSpellInfo(55931))
})

-------------------
-- Elder Nadox  --
-------------------
L = DBM:GetModLocalization("Nadox")

L:SetGeneralLocalization({
    name = "纳多克斯长老"
})

L:SetWarningLocalization({
    WarningPlague = debuff
})

L:SetTimerLocalization({
    TimerPlague = debuff,
    TimerPlagueCD = spellCD
})

L:SetOptionLocalization({
    WarningPlague = optionWarning:format(GetSpellInfo(56130)),
    TimerPlague = optionTimerDur:format(GetSpellInfo(56130)),
    TimerPlagueCD = optionTimerCD:format(GetSpellInfo(56130))
})

---------------------------
-- Jedoga Shadowseeker  --
---------------------------
L = DBM:GetModLocalization("JedogaShadowseeker")

L:SetGeneralLocalization({
    name = "耶戈达·觅影者"
})

L:SetWarningLocalization({
    WarningThundershock = spell
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningThundershock = optionWarning:format(GetSpellInfo(56926)),
})

---------------------
-- Herald Volazj  --
---------------------
L = DBM:GetModLocalization("Volazj")

L:SetGeneralLocalization({
    name = "传令官沃拉兹"
})

L:SetWarningLocalization({
    WarningInsanity = spell
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningInsanity = optionWarning:format(GetSpellInfo(57496))
})

----------------
-- Amanitar  --
----------------
L = DBM:GetModLocalization("Amanitar")

L:SetGeneralLocalization({
    name = "埃曼尼塔"
})

L:SetWarningLocalization({
    WarningMini = spell
})

L:SetTimerLocalization({
    TimerMiniCD = spellCD
})

L:SetOptionLocalization({
    WarningMini = optionWarning:format(GetSpellInfo(57055)),
    TimerMiniCD = optionTimerCD:format(GetSpellInfo(57055))
})

-------------------
-- Azjol-Nerub  --
---------------------------------
-- Krik'thir the Gatewatcher  --
---------------------------------
L = DBM:GetModLocalization("Krikthir")

L:SetGeneralLocalization({
    name = "看门者克里克希尔"
})

L:SetWarningLocalization({
    WarningCurse = spell
})

L:SetTimerLocalization({
    TimerCurse = spell
})

L:SetOptionLocalization({
    WarningCurse = optionWarning:format(GetSpellInfo(52592)),
    TimerCurse = optionTimerDur:format(GetSpellInfo(52592))
})

----------------
-- Hadronox  --
----------------
L = DBM:GetModLocalization("Hadronox")

L:SetGeneralLocalization({
    name = "哈多诺克斯"
})

L:SetWarningLocalization({
    WarningLeech = spell,
    WarningCloud = spell
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningLeech = optionWarning:format(GetSpellInfo(53030)),
    WarningCloud = optionWarning:format(GetSpellInfo(53400))
})

-------------------------
-- Anub'arak (Party)  --
-------------------------
L = DBM:GetModLocalization("Anubarak")

L:SetGeneralLocalization({
    name = "阿努巴拉克(5人副本)"
})

L:SetWarningLocalization({
    WarningPound = spell
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningPound = optionWarning:format(GetSpellInfo(53472)),
})

---------------------------------------
-- Caverns of Time: Old Stratholme  --
---------------------------------------
-- Meathook  --
----------------
L = DBM:GetModLocalization("Meathook")

L:SetGeneralLocalization({
    name = "肉钩"
})

L:SetWarningLocalization({
    WarningChains = debuff
})

L:SetTimerLocalization({
    TimerChains = debuff,
    TimerChainsCD = spellCD
})

L:SetOptionLocalization({
    WarningChains = optionWarning:format(GetSpellInfo(52696)),
    TimerChains = optionTimerDur:format(GetSpellInfo(52696)),
    TimerChainsCD = optionTimerCD:format(GetSpellInfo(52696))
})

--------------------------------
-- Salramm the Fleshcrafter  --
--------------------------------
L = DBM:GetModLocalization("SalrammTheFleshcrafter")

L:SetGeneralLocalization({
    name = "塑血者沙尔拉姆"
})

L:SetWarningLocalization({
    WarningCurse = debuff,
    WarningSteal = debuff,
    WarningGhoul = spell
})

L:SetTimerLocalization({
    TimerGhoulCD = spellCD,
    TimerCurse = debuff
})

L:SetOptionLocalization({
    WarningCurse = optionWarning:format(GetSpellInfo(58845)),
    WarningSteal = optionWarning:format(GetSpellInfo(52709)),
    WarningGhoul = optionWarning:format(GetSpellInfo(52451)),
    TimerGhoulCD = optionTimerCD:format(GetSpellInfo(52451)),
    TimerCurse = optionTimerDur:format(GetSpellInfo(58845))
})

-------------------------
-- Chrono-Lord Epoch  --
-------------------------
L = DBM:GetModLocalization("ChronoLordEpoch")

L:SetGeneralLocalization({
    name = "时光领主埃博克"
})

L:SetWarningLocalization({
    WarningTime = spell,
    WarningCurse = debuff
})

L:SetTimerLocalization({
    TimerTimeCD = spellCD,
    TimerCurse = debuff
})

L:SetOptionLocalization({
    WarningTime = optionWarning:format("Time Stop/Warp"), -- requires translation
    WarningCurse = optionWarning:format(GetSpellInfo(52772)),
    TimerTimeCD = optionTimerCD:format("Time Stop/Warp"), -- translate
    TimerCurse = optionTimerDur:format(GetSpellInfo(52772))
})

-----------------
-- Mal'Ganis  --
-----------------
L = DBM:GetModLocalization("MalGanis")

L:SetGeneralLocalization({
    name = "玛尔加尼斯"
})

L:SetWarningLocalization({
    WarningSleep = debuff
})

L:SetTimerLocalization({
    TimerSleep = debuff,
    TimerSleepCD = spellCD
})

L:SetOptionLocalization({
    WarningSleep = optionWarning:format(GetSpellInfo(52721)),
    TimerSleep = optionTimerDur:format(GetSpellInfo(52721)),
    TimerSleepCD = optionTimerCD:format(GetSpellInfo(52721))
})

L:SetMiscLocalization({
    Outro = "你的旅程才刚开始，年轻的王子。集合你的部队，到诺森德再次挑战我。在那里，我们将了结彼此之间的恩怨，你将了解到你真正的命运。"
})

-------------------
-- Wave Timers  --
-------------------
L = DBM:GetModLocalization("StratWaves")

L:SetGeneralLocalization({
    name = "斯坦索姆小怪"
})

L:SetWarningLocalization({
    WarningWaveNow = "第%d波: %s 出现了"
})

L:SetTimerLocalization({
    TimerWaveIn = "下一波(6)",
    TimerRoleplay = "角色扮演事件计时"
})

L:SetOptionLocalization({
    WarningWaveNow = optionWarning:format("新一波"),
    TimerWaveIn = "为下一波显示计时条 (之后的5批小怪)",
    TimerRoleplay = "为角色扮演事件显示计时条"
})

L:SetMiscLocalization({
    Meathook = "肉钩",
    Salramm = "塑血者沙尔拉姆",
    Devouring = "狼吞虎咽的食尸鬼",
    Enraged = "暴怒的食尸鬼",
    Necro = "通灵大师",
    Fiend = "地穴恶魔",
    Stalker = "墓穴猎手",
    Abom = "缝补构造体",
    Acolyte = "侍僧",
    Wave1 = "%d %s",
    Wave2 = "%d %s 和 %d %s",
    Wave3 = "%d %s，%d %s 和 %d %s",
    Wave4 = "%d %s，%d %s，%d %s 和 %d %s",
    WaveBoss = "%s",
    WaveCheck = "天灾波次 = (%d+)/10",
    Roleplay = "乌瑟尔，你总算及时赶到了。",
    Roleplay2 = "大家都做好准备了吧。记住，斯坦索姆的城民已经受到感染，很快就会丧命。我们必须清洗斯坦索姆，确保洛丹伦的其它地区免受天灾军团的侵蚀。出发吧。"
})

------------------------
-- Drak'Tharon Keep  --
------------------------
-- Trollgore  --
-----------------
L = DBM:GetModLocalization("Trollgore")

L:SetGeneralLocalization({
    name = "托尔戈"
})

L:SetWarningLocalization({})

L:SetTimerLocalization({})

L:SetOptionLocalization({})

--------------------------
-- Novos the Summoner  --
--------------------------
L = DBM:GetModLocalization("NovosTheSummoner")

L:SetGeneralLocalization({
    name = "召唤者诺沃斯"
})

L:SetWarningLocalization({
    WarnCrystalHandler = "水晶处理者出现了 (剩余%d)"
})

L:SetTimerLocalization({
    timerCrystalHandler = "水晶处理者 出现"
})

L:SetOptionLocalization({
    WarnCrystalHandler = "当水晶处理者出现时显示警报",
    timerCrystalHandler = "为下一次 水晶处理者出现显示计时条"
})

L:SetMiscLocalization({
    YellPull = "笼罩你的寒气就是厄运的先兆。",
    HandlerYell = "协助防御！快点，废物们！",
    Phase2 = "很快你们就会发现一切都是徒劳无功。",
    YellKill = "这一切……都是毫无意义的。"
})

-----------------
-- King Dred  --
-----------------
L = DBM:GetModLocalization("KingDred")

L:SetGeneralLocalization({
    name = "暴龙之王爵德"
})

L:SetWarningLocalization({
    WarningFear = spell,
    WarningBite = debuff,
    WarningSlash = spell
})

L:SetTimerLocalization({
    TimerFear = spellCD,
    TimerSlash = debuff,
    TimerSlashCD = spellCD
})

L:SetOptionLocalization({
    WarningSlash = optionWarning:format("Mangling/Piercing Slash"), -- needs translation
    WarningFear = optionWarning:format(GetSpellInfo(22686)),
    WarningBite = optionWarning:format(GetSpellInfo(48920)),
    TimerFear = optionTimerCD:format(GetSpellInfo(22686)),
    TimerSlash = optionTimerDur:format("Mangling/Piercing Slash"), -- needs translation
    TimerSlashCD = optionTimerCD:format("Mangling/Piercing Slash") -- needs translation
})

-----------------------------
-- The Prophet Tharon'ja  --
-----------------------------
L = DBM:GetModLocalization("ProphetTharonja")

L:SetGeneralLocalization({
    name = "先知萨隆亚"
})

L:SetWarningLocalization({
    WarningCloud = spell
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningCloud = optionWarning:format(GetSpellInfo(49548))
})

---------------
-- Gundrak  --
----------------
-- Slad'ran  --
----------------
L = DBM:GetModLocalization("Sladran")

L:SetGeneralLocalization({
    name = "斯拉德兰"
})

L:SetWarningLocalization({
    WarningNova = spell
})

L:SetTimerLocalization({
    TimerNovaCD = spellCD
})

L:SetOptionLocalization({
    WarningNova = optionWarning:format(GetSpellInfo(55081)),
    TimerNovaCD = optionTimerCD:format(GetSpellInfo(55081))
})

---------------
-- Moorabi  --
---------------
L = DBM:GetModLocalization("Moorabi")

L:SetGeneralLocalization({
    name = "莫拉比"
})

L:SetWarningLocalization({
    WarningTransform = spell
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningTransform = optionWarning:format(GetSpellInfo(55098))
})

-------------------------
-- Drakkari Colossus  --
-------------------------
L = DBM:GetModLocalization("BloodstoneAnnihilator")

L:SetGeneralLocalization({
    name = "达卡莱巨像"
})

L:SetWarningLocalization({
    WarningElemental = "元素阶段",
    WarningStone = "巨像阶段"
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningElemental = "为元素阶段显示警报",
    WarningStone = "为巨像阶段显示警报"
})

-----------------
-- Gal'darah  --
-----------------
L = DBM:GetModLocalization("Galdarah")

L:SetGeneralLocalization({
    name = "迦尔达拉"
})

L:SetWarningLocalization({})

L:SetTimerLocalization({})

L:SetOptionLocalization({})

-------------------------
-- Eck the Ferocious  --
-------------------------
L = DBM:GetModLocalization("Eck")

L:SetGeneralLocalization({
    name = "凶残的伊克"
})

L:SetWarningLocalization({})

L:SetTimerLocalization({})

L:SetOptionLocalization({})

--------------------------
-- Halls of Lightning  --
--------------------------
-- General Bjarngrim  --
-------------------------
L = DBM:GetModLocalization("Gjarngrin")

L:SetGeneralLocalization({
    name = "比亚格里将军"
})

L:SetWarningLocalization({
    WarningWhirlwind = spell
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningWhirlwind = optionWarning:format(GetSpellInfo(52027))
})

-------------
-- Ionar  --
-------------
L = DBM:GetModLocalization("Ionar")

L:SetGeneralLocalization({
    name = "艾欧纳尔"
})

L:SetWarningLocalization({
    WarningOverload = debuff,
    WarningSplit = spell
})

L:SetTimerLocalization({
    TimerOverload = debuff
})

L:SetOptionLocalization({
    WarningOverload = optionWarning:format(GetSpellInfo(52658)),
    WarningSplit = optionWarning:format(GetSpellInfo(52770)),
    TimerOverload = optionTimerDur:format(GetSpellInfo(52658)),
    SetIconOnOverloadTarget = DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(52658)
})

---------------
-- Volkhan  --
---------------
L = DBM:GetModLocalization("Volkhan")

L:SetGeneralLocalization({
    name = "沃尔坎"
})

L:SetWarningLocalization({
    WarningStomp = spell
})

L:SetTimerLocalization({
    TimerStompCD = spellCD
})

L:SetOptionLocalization({
    WarningStomp = optionWarning:format(GetSpellInfo(52237)),
    TimerStompCD = optionTimerCD:format(GetSpellInfo(52237))
})

--------------
-- Kronus  --
--------------
L = DBM:GetModLocalization("Kronus")

L:SetGeneralLocalization({
    name = "洛肯"
})

L:SetWarningLocalization({
    WarningNova = spell
})

L:SetTimerLocalization({
    TimerNovaCD = spellCD
})

L:SetOptionLocalization({
    WarningNova = optionWarning:format(GetSpellInfo(53960)),
    TimerNovaCD = optionTimerCD:format(GetSpellInfo(53960))
})

----------------------
-- Halls of Stone  --
-----------------------
-- Maiden of Grief  --
-----------------------
L = DBM:GetModLocalization("MaidenOfGrief")

L:SetGeneralLocalization({
    name = "悲伤圣女"
})

L:SetWarningLocalization({
    WarningWoe = debuff,
    WarningSorrow = spell,
    WarningStorm = spell
})

L:SetTimerLocalization({
    TimerWoe = debuff,
    TimerSorrow = spell,
    TimerSorrowCD = spellCD,
    TimerStormCD = spellCD
})

L:SetOptionLocalization({
    WarningWoe = optionWarning:format(GetSpellInfo(50761)),
    WarningSorrow = optionWarning:format(GetSpellInfo(50760)),
    WarningStorm = optionWarning:format(GetSpellInfo(50752)),
    TimerWoe = optionTimerDur:format(GetSpellInfo(50761)),
    TimerSorrow = optionTimerDur:format(GetSpellInfo(50760)),
    TimerSorrowCD = optionTimerCD:format(GetSpellInfo(50760)),
    TimerStormCD = optionTimerCD:format(GetSpellInfo(50752)),
})

------------------
-- Krystallus  --
------------------
L = DBM:GetModLocalization("Krystallus")

L:SetGeneralLocalization({
    name = "克莱斯塔卢斯"
})

L:SetWarningLocalization({
    WarningShatter = spell
})

L:SetTimerLocalization({
    TimerShatterCD = spellCD
})

L:SetOptionLocalization({
    WarningShatter = optionWarning:format(GetSpellInfo(50810)),
    TimerShatterCD = optionTimerCD:format(GetSpellInfo(50810))
})

------------------------------
-- Sjonnir the Ironshaper  --
------------------------------
L = DBM:GetModLocalization("SjonnirTheIronshaper")

L:SetGeneralLocalization({
    name = "塑铁者斯约尼尔"
})

L:SetWarningLocalization({
    WarningCharge = debuff,
    WarningRing = spell
})

L:SetTimerLocalization({
    TimerCharge = debuff,
    TimerChargeCD = spellCD,
    TimerRingCD = spellCD
})

L:SetOptionLocalization({
    WarningCharge = optionWarning:format(GetSpellInfo(50834)),
    WarningRing = optionWarning:format(GetSpellInfo(50840)),
    TimerCharge = optionTimerDur:format(GetSpellInfo(50834)),
    TimerChargeCD = optionTimerCD:format(GetSpellInfo(50834)),
    TimerRingCD = optionTimerCD:format(GetSpellInfo(50840))
})

--------------------------------------
-- Brann Bronzebeard Escort Event  --
--------------------------------------
L = DBM:GetModLocalization("BrannBronzebeard")

L:SetGeneralLocalization({
    name = "布莱恩护卫事件"
})

L:SetWarningLocalization({
    WarningPhase = "第%d阶段"
})

L:SetTimerLocalization({
    timerEvent = "剩余时间"
})

L:SetOptionLocalization({
    WarningPhase = optionWarning:format("阶段数"),
    timerEvent = "为事件的持续时间显示计时条"
})

L:SetMiscLocalization({
    Pull = "嗯，你们帮我看着点外面。我这样的强者只要锤两下就能搞定这破烂……",
    Phase1 = "安全系统发现不明入侵。历史文档的分析工作优先级转为低。对策程序立即启动。",
    Phase2 = "已超出威胁指数标准。天界文档中断。提高安全级别。",
    Phase3 = "威胁指数过高。虚空分析程序关闭。启动清理协议。",
    Kill = "警告：安全系统自动修复装置已被关闭。立刻消除化全部存储器内容并……"
})

-----------------
-- The Nexus  --
-----------------
-- Anomalus  --
----------------
L = DBM:GetModLocalization("Anomalus")

L:SetGeneralLocalization({
    name = "阿诺玛鲁斯"
})

L:SetWarningLocalization({
    WarningRiftSoon = spellSoon,
    WarningRiftNow = spell,
})

L:SetOptionLocalization({
    WarningRiftSoon = optionPreWarning:format(GetSpellInfo(47743)),
    WarningRiftNow = optionWarning:format(GetSpellInfo(47743))
})

-------------------------------
-- Ormorok the Tree-Shaper  --
-------------------------------
L = DBM:GetModLocalization("OrmorokTheTreeShaper")

L:SetGeneralLocalization({
    name = "塑树者奥莫洛克"
})

L:SetWarningLocalization({
    WarningSpikes = spell,
    WarningReflection = spell,
    WarningFrenzy = spell,
    WarningAdd = spell
})

L:SetTimerLocalization({
    TimerReflection = spell,
    TimerReflectionCD = spellCD
})

L:SetOptionLocalization({
    WarningSpikes = optionWarning:format(GetSpellInfo(47958)),
    WarningReflection = optionWarning:format(GetSpellInfo(47981)),
    WarningFrenzy = optionWarning:format(GetSpellInfo(48017)),
    WarningAdd = optionWarning:format(GetSpellInfo(61564)),
    TimerReflection = optionTimerDur:format(GetSpellInfo(47981)),
    TiemrReflectionCD = optionTimerCD:format(GetSpellInfo(47981))
})

----------------------------
-- Grand Magus Telestra  --
----------------------------
L = DBM:GetModLocalization("GrandMagusTelestra")

L:SetGeneralLocalization({
    name = "大魔导师泰蕾丝塔"
})

L:SetWarningLocalization({
    WarningSplitSoon = "分裂 即将到来",
    WarningSplitNow = "分裂",
    WarningMerge = "融合"
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningSplitSoon = "为分裂显示提前警报",
    WarningSplitNow = "为分裂显示警报",
    WarningMerge = "为融合显示警报"
})

L:SetMiscLocalization({
    SplitTrigger1 = "这里有我千万个分身。",
    SplitTrigger2 = "我要让你们尝尝无所适从的滋味!",
    MergeTrigger = "现在，最后一步！"
})

-------------------
-- Keristrasza  --
-------------------
L = DBM:GetModLocalization("Keristrasza")

L:SetGeneralLocalization({
    name = "克莉斯塔萨"
})

L:SetWarningLocalization({
    WarningChains = debuff,
    WarningEnrage = spell,
    WarningNova = spell
})

L:SetTimerLocalization({
    TimerChains = debuff,
    TimerNova = spell,
    TimerChainsCD = spellCD,
    TimerNovaCD = spellCD
})

L:SetOptionLocalization({
    WarningChains = optionWarning:format(GetSpellInfo(50997)),
    WarningNova = optionWarning:format(GetSpellInfo(48179)),
    WarningEnrage = optionWarning:format(GetSpellInfo(8599)),
    TimerChains = optionTimerDur:format(GetSpellInfo(50997)),
    TimerChainsCD = optionTimerCD:format(GetSpellInfo(50997)),
    TimerNova = optionTimerDur:format(GetSpellInfo(48179)),
    TimerNovaCD = optionTimerCD:format(GetSpellInfo(48179))
})

-----------------------------------
-- Commander Kolurg/Stoutbeard  --
-----------------------------------
L = DBM:GetModLocalization("Commander")

local commander = "未知"
if UnitFactionGroup("player") == "Alliance" then
    commander = "指挥官库鲁尔格"
elseif UnitFactionGroup("player") == "Horde" then
    commander = "指挥官斯托比德"
end

L:SetGeneralLocalization({
    name = commander
})

L:SetWarningLocalization({
    WarningFear = spell,
    WarningWhirlwind = spell
})

L:SetTimerLocalization({
    TimerFearCD = spellCD,
    TimerWhirlwindCD = spellCD
})

L:SetOptionLocalization({
    WarningFear = optionWarning:format(GetSpellInfo(19134)),
    WarningWhirlwind = optionWarning:format(GetSpellInfo(38619)),
    TimerFearCD = optionTimerCD:format(GetSpellInfo(19134)),
    TimerWhirlwindCD = optionTimerCD:format(GetSpellInfo(38619))
})

------------------
-- The Oculus  --
-------------------------------
-- Drakos the Interrogator  --
-------------------------------
L = DBM:GetModLocalization("DrakosTheInterrogator")

L:SetGeneralLocalization({
    name = "审讯者达库斯"
})

L:SetWarningLocalization({})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    MakeitCountTimer = "为成就：分秒必争显示计时条"
})

L:SetMiscLocalization({
    MakeitCountTimer = "分秒必争"
})

----------------------
-- Mage-Lord Urom  --
----------------------
L = DBM:GetModLocalization("MageLordUrom")

L:SetGeneralLocalization({
    name = "法师领主伊洛姆"
})

L:SetWarningLocalization({
    WarningTimeBomb = debuff,
    WarningExplosion = spell
})

L:SetTimerLocalization({
    TimerTimeBomb = debuff,
    TimerExplosion = spell
})

L:SetOptionLocalization({
    WarningTimeBomb = optionWarning:format(GetSpellInfo(51121)),
    WarningExplosion = optionWarning:format(GetSpellInfo(51110)),
    TimerTimeBomb = optionTimerDur:format(GetSpellInfo(51121)),
    TimerExplosion = optionTimerDur:format(GetSpellInfo(51110)),
    SpecWarnBombYou = optionSpecWarning:format(GetSpellInfo(51121))
})

L:SetMiscLocalization({
    CombatStart = "可怜而无知的蠢货！"
})

--------------------------
-- Varos Cloudstrider  --
--------------------------
L = DBM:GetModLocalization("VarosCloudstrider")

L:SetGeneralLocalization({
    name = "瓦尔洛斯·云击"
})

L:SetWarningLocalization({
    WarningAmplify = debuff
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningAmplify = optionWarning:format(GetSpellInfo(51054))
})

---------------------------
-- Ley-Guardian Eregos  --
---------------------------
L = DBM:GetModLocalization("LeyGuardianEregos")

L:SetGeneralLocalization({
    name = "魔网守护者埃雷苟斯"
})

L:SetWarningLocalization({
    WarningShift = spell,
    WarningEnrage = spell,
    WarningShiftEnd = "位面转移结束"
})

L:SetTimerLocalization({
    TimerShift = spell,
    TimerEnrage = spell
})

L:SetOptionLocalization({
    WarningShift = optionWarning:format(GetSpellInfo(51162)),
    WarningShiftEnd = optionWarning:format(GetSpellInfo(51162) .. "结束"),
    WarningEnrage = optionWarning:format(GetSpellInfo(51170)),
    TimerShift = optionTimerDur:format(GetSpellInfo(51162)),
    TimerEnrage = optionTimerDur:format(GetSpellInfo(51170))
})

L:SetMiscLocalization({
    MakeitCountTimer = "分秒必争"
})

--------------------
-- Utgarde Keep  --
-----------------------
-- Prince Keleseth  --
-----------------------
L = DBM:GetModLocalization("Keleseth")

L:SetGeneralLocalization({
    name = "凯雷塞斯王子"
})

L:SetWarningLocalization({
    WarningTomb = debuff
})

L:SetTimerLocalization({
    TimerTomb = debuff
})

L:SetOptionLocalization({
    WarningTomb = optionWarning:format(GetSpellInfo(48400)),
    TimerTomb = optionTimerDur:format(GetSpellInfo(48400))
})

--------------------------------
-- Skarvald the Constructor  --
-- & Dalronn the Controller  --
--------------------------------
L = DBM:GetModLocalization("ConstructorAndController")

L:SetGeneralLocalization({
    name = "控制者达尔隆"
})

L:SetWarningLocalization({
    WarningEnfeeble = debuff,
    WarningSummon = spell
})

L:SetTimerLocalization({
    TimerEnfeeble = debuff
})

L:SetOptionLocalization({
    WarningEnfeeble = optionWarning:format(GetSpellInfo(43650)),
    WarningSummon = optionWarning:format(GetSpellInfo(52611)),
    TimerEnfeeble = optionTimerDur:format(GetSpellInfo(43650))
})

----------------------------
-- Ingvar the Plunderer  --
----------------------------
L = DBM:GetModLocalization("IngvarThePlunderer")

L:SetGeneralLocalization({
    name = "劫掠者因格瓦尔"
})

L:SetWarningLocalization({
    WarningSmash = spell,
    WarningGrowl = spell,
    WarningWoeStrike = debuff,
    SpecialWarningSpelllock = "Spell-lock - stop casting!" -- translate
})

L:SetTimerLocalization({
    TimerSmash = spell,
    TimerWoeStrike = debuff
})

L:SetOptionLocalization({
    WarningSmash = optionWarning:format(GetSpellInfo(42723)),
    WarningGrowl = optionWarning:format(GetSpellInfo(42708)),
    WarningWoeStrike = optionWarning:format(GetSpellInfo(42730)),
    TimerSmash = optionTimerCast:format(GetSpellInfo(42723)),
    TimerWoeStrike = optionTimerDur:format(GetSpellInfo(42730))
})

L:SetMiscLocalization({
    YellCombatEnd = "不！不！我还可以……做得更好。"
})

------------------------
-- Utgarde Pinnacle  --
--------------------------
-- Skadi the Ruthless  --
--------------------------
L = DBM:GetModLocalization("SkadiTheRuthless")

L:SetGeneralLocalization({
    name = "残忍的斯卡迪"
})

L:SetWarningLocalization({
    WarningWhirlwind = spell,
    WarningPoison = debuff
})

L:SetTimerLocalization({
    TimerPoison = debuff,
    TimerWhirlwindCD = spellCD
})

L:SetOptionLocalization({
    WarningWhirlwind = optionWarning:format(GetSpellInfo(59332)),
    WarningPoison = optionWarning:format(GetSpellInfo(59331)),
    TimerPoison = optionTimerDur:format(GetSpellInfo(59331)),
    TimerWhirlwindCD = optionTimerCD:format(GetSpellInfo(59332))
})

L:SetMiscLocalization({
    CombatStart = "什么样的狗杂种竟然胆敢入侵这里？快点，弟兄们！谁要是能把他们的头提来，就赏他吃肉！",
    Phase2 = "你这只无能的蠢龙！你的尸体干脆给我的新飞龙拿去当点心算了！"
})

-------------------
-- King Ymiron  --
-------------------
L = DBM:GetModLocalization("Ymiron")

L:SetGeneralLocalization({
    name = "伊米隆国王"
})

L:SetWarningLocalization({
    WarningBane = spell
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningBane = optionWarning:format(GetSpellInfo(48294))
})

-------------------------
-- Svala Sorrowgrave  --
-------------------------
L = DBM:GetModLocalization("SvalaSorrowgrave")

L:SetGeneralLocalization({
    name = "席瓦拉·索格蕾"
})

L:SetWarningLocalization({
    WarningSword = debuff
})

L:SetTimerLocalization({
    timerRoleplay = "席瓦拉·索格蕾 开始攻击"
})

L:SetOptionLocalization({
    WarningSword = optionWarning:format(GetSpellInfo(48276)),
    timerRoleplay = "为席瓦拉·索格蕾开始攻击前的角色扮演显示计时条"
})

L:SetMiscLocalization({
    SvalaRoleplayStart = "尊敬的陛下！我已经完成您的全部要求，希望您能不吝赐下伟大的祝福！"
})

-----------------------
-- Gortok Palehoof  --
-----------------------
L = DBM:GetModLocalization("GortokPalehoof")

L:SetGeneralLocalization({
    name = "戈托克·苍蹄"
})

L:SetWarningLocalization({
    WarningImpale = debuff
})

L:SetTimerLocalization({
    TimerImpale = debuff
})

L:SetOptionLocalization({
    WarningImpale = optionWarning:format(GetSpellInfo(48261)),
    TimerImpale = optionTimerDur:format(GetSpellInfo(48261))
})

-----------------------
-- The Violet Hold  --
-----------------------
-- Cyanigosa  --
-----------------
L = DBM:GetModLocalization("Cyanigosa")

L:SetGeneralLocalization({
    name = "塞安妮苟萨"
})

L:SetWarningLocalization({
    WarningVacuum = spell,
    WarningBlizzard = spell,
    WarningMana = debuff
})

L:SetTimerLocalization({
    TimerVacuumCD = spellCD,
    TimerMana = debuff,
    TimerCombatStart = "战斗开始"
})

L:SetOptionLocalization({
    WarningVacuum = optionWarning:format(GetSpellInfo(58694)),
    WarningBlizzard = optionWarning:format(GetSpellInfo(58693)),
    WarningMana = optionWarning:format(GetSpellInfo(59374)),
    TimerMana = optionTimerDur:format(GetSpellInfo(59374)),
    TimerVacuumCD = optionTimerCD:format(GetSpellInfo(58694)),
    TimerCombatStart = "为战斗开始显示计时条"
})

L:SetMiscLocalization({
    CyanArrived = "真是一群英勇的卫兵，但这座城市必须被夷平。我要亲自执行玛里苟斯大人的指令！"
})

--------------
-- Erekem  --
--------------
L = DBM:GetModLocalization("Erekem")

L:SetGeneralLocalization({
    name = "埃雷克姆"
})

L:SetWarningLocalization({
    WarningES = spell
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    WarningES = optionWarning:format(GetSpellInfo(54479))
})

---------------
-- Ichoron  --
---------------
L = DBM:GetModLocalization("Ichoron")

L:SetGeneralLocalization({
    name = "艾库隆"
})

L:SetWarningLocalization({})

L:SetTimerLocalization({})

L:SetOptionLocalization({})

-----------------
-- Lavanthor  --
-----------------
L = DBM:GetModLocalization("Lavanthor")

L:SetGeneralLocalization({
    name = "拉文索尔"
})

L:SetWarningLocalization({})

L:SetTimerLocalization({})

L:SetOptionLocalization({})

--------------
-- Moragg  --
--------------
L = DBM:GetModLocalization("Moragg")

L:SetGeneralLocalization({
    name = "摩拉格"
})

L:SetWarningLocalization({
    WarningLink = debuff
})

L:SetTimerLocalization({
    TimerLink = debuff,
    TimerLinkCD = spellCD
})

L:SetOptionLocalization({
    WarningLink = optionWarning:format(GetSpellInfo(54396)),
    TimerLink = optionTimerDur:format(GetSpellInfo(54396)),
    TimerLinkCD = optionTimerCD:format(GetSpellInfo(54396))
})

--------------
-- Xevozz  --
--------------
L = DBM:GetModLocalization("Xevoss")

L:SetGeneralLocalization({
    name = "谢沃兹"
})

L:SetWarningLocalization({})

L:SetTimerLocalization({})

L:SetOptionLocalization({})

-------------------------------
-- Zuramat the Obliterator  --
-------------------------------
L = DBM:GetModLocalization("Zuramat")

L:SetGeneralLocalization({
    name = "湮灭者祖拉玛特"
})

L:SetWarningLocalization({
    SpecialWarningVoidShifted = spell:format(GetSpellInfo(54343)),
    SpecialShroudofDarkness = spell:format(GetSpellInfo(59745))
})

L:SetTimerLocalization({})

L:SetOptionLocalization({
    SpecialWarningVoidShifted = optionSpecWarning:format(GetSpellInfo(54343)),
    SpecialShroudofDarkness = optionSpecWarning:format(GetSpellInfo(59745))
})

---------------------
-- Portal Timers  --
---------------------
L = DBM:GetModLocalization("PortalTimers")

L:SetGeneralLocalization({
    name = "传送门计时"
})

L:SetWarningLocalization({
    WarningPortalSoon = "新传送门即将开启",
    WarningPortalNow = "传送门 #%d",
    WarningBossNow = "首领到来"
})

L:SetTimerLocalization({
    TimerPortalIn = "传送门 #%d",
})

L:SetOptionLocalization({
    WarningPortalNow = optionWarning:format("新传送门"),
    WarningPortalSoon = optionPreWarning:format("新传送门"),
    WarningBossNow = optionWarning:format("首领到来"),
    TimerPortalIn = "为下一次 传送门显示计时条(击败首领后)",
    ShowAllPortalTimers = "为所有传送门显示计时条(不准确)"
})

L:SetMiscLocalization({
    Sealbroken = "我们冲破了监狱的大门！进入达拉然的道路被清理干净了！魔枢之战终于可以结束了！",
    WavePortal = "已打开传送门：(%d+)/18"
})

-----------------------------
-- Trial of the Champion  --
-----------------------------
-- The Black Knight  --
------------------------
L = DBM:GetModLocalization("BlackKnight")

L:SetGeneralLocalization({
    name = "黑骑士"
})

L:SetWarningLocalization({
    warnExplode = "食尸鬼爆炸 - 快跑开"
})

L:SetTimerLocalization {
    TimerCombatStart = "战斗开始"
}

L:SetOptionLocalization({
    TimerCombatStart = "为战斗开始显示计时条",
    warnExplode = "当食尸鬼即将自我爆炸时警报",
    AchievementCheck = "报告'这还不算惨'成就的失败信息给小队",
    SetIconOnMarkedTarget = DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(67823)
})

L:SetMiscLocalization({
    Pull = "干得好，今天，你证明了自己的实力。",
    AchievementFailed = ">> 成就失败: %s 被食尸鬼爆炸击中了 <<",
    YellCombatEnd = "勇士们，祝贺你们！经历过一系列计划之中和意料之外的试炼，你们终于取得了胜利。" -- can also be "No! I must not fail... again ..."
})

-----------------------
-- Grand Champions  --
-----------------------
L = DBM:GetModLocalization("GrandChampions")

L:SetGeneralLocalization({
    name = "总冠军"
})

L:SetWarningLocalization({})

L:SetOptionLocalization({})

L:SetMiscLocalization({
    YellCombatEnd = "干得漂亮！你的下一个挑战将来自于十字军的骑士们。他们将以强大的实力对你进行测试。"
})

----------------------------------
-- Argent Confessor Paletress  --
----------------------------------
L = DBM:GetModLocalization("Confessor")

L:SetGeneralLocalization({
    name = "银色神官帕尔崔丝"
})

L:SetWarningLocalization({})

L:SetOptionLocalization({})

L:SetMiscLocalization({
    YellCombatEnd = "真是精彩！"
})

-----------------------
-- Eadric the Pure  --
-----------------------
L = DBM:GetModLocalization("EadricthePure")

L:SetGeneralLocalization({
    name = "纯洁者耶德瑞克"
})

L:SetWarningLocalization({
    specwarnRadiance = "光芒耀眼 - 快转身背对"
})

L:SetOptionLocalization({
    specwarnRadiance = "为$spell:66935显示特别警报",
    SetIconOnHammerTarget = DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(66940)
})

L:SetMiscLocalization({
    YellCombatEnd = "我认输！我投降。你做的很好。我可以走了吧？"
})

--------------------
-- Pit of Saron  --
---------------------
-- Ick and Krick  --
---------------------
L = DBM:GetModLocalization("Ick")

L:SetGeneralLocalization({
    name = "伊克和科瑞克"
})

L:SetWarningLocalization({
    warnPursuit = "扑杀: >%s<",
    specWarnPursuit = "你中了扑杀 - 快跑"
})

L:SetOptionLocalization({
    warnPursuit = "提示扑杀的目标",
    specWarnPursuit = "当你被扑杀时显示特别警告",
    SetIconOnPursuitTarget = DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(68987)
})

L:SetMiscLocalization({
    IckPursuit = "%s正在追击着你!",
    Barrage = "%s开始不断召唤出炸雷！"
})

----------------------------
-- Forgemaster Garfrost  --
----------------------------
L = DBM:GetModLocalization("ForgemasterGarfrost")

L:SetGeneralLocalization({
    name = "熔炉之主加弗斯特"
})

L:SetWarningLocalization({
    warnSaroniteRock = "投入萨隆邪铁: >%s<",
    specWarnSaroniteRock = "你中了投入萨隆邪铁 - 快跑开",
    specWarnSaroniteRockNear = "你附近有人中了投入萨隆邪铁 - 快跑开",
    specWarnPermafrost = "%s: %s"
})

L:SetOptionLocalization({
    warnSaroniteRock = "提示$spell:70851的目标",
    specWarnSaroniteRock = "当你中了$spell:70851时显示特别警告",
    specWarnSaroniteRockNear = "当你附近有人中了$spell:70851时显示特别警告",
    specWarnPermafrost = "当$spell:70336堆叠太高时显示特别警告(11层)",
    AchievementCheck = "为'11大限'成就发送报警到队伍频道",
    SetIconOnSaroniteRockTarget = DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(70851)
})

L:SetMiscLocalization({
    SaroniteRockThrow = "%s向你用力投出一大块萨隆邪铁巨石！",
    AchievementWarning = "小心: %s 已拥有 %d 层永冻",
    AchievementFailed = ">> 成就失败: %s 已超过 %d 层永冻 <<"
})

----------------------------
-- Scourgelord Tyrannus  --
----------------------------
L = DBM:GetModLocalization("ScourgelordTyrannus")

L:SetGeneralLocalization({
    name = "天灾领主泰兰努斯"
})

L:SetWarningLocalization({
    WarningPortalSoon = "New Portal Soon",
    WarningPortalNow = "Portal #%d",
    WarningBossNow = "Boss incoming",
    WavePortal = "Portals Opened: (%d+)/18",
    specWarnHoarfrost = "你中了霜降 - 快跑开",
    specWarnHoarfrostNear = "你附近有人中了霜降 - 快跑开"
})

L:SetTimerLocalization({
    TimerPortalIn = "Portal #%d",
    TimerCombatStart = "战斗开始"
})

L:SetOptionLocalization({
    WarningPortalNow = optionWarning:format("New Portal"),
    WarningPortalSoon = optionPreWarning:format("New Portal"),
    WarningBossNow = optionWarning:format("Boss Now"),
    TimerPortalIn = "Show \"Portal: #\" timer",
    ShowAllPortalTimers = "Show timers for all waves",
    specWarnHoarfrost = "当你中了$spell:69246时显示特别警告",
    specWarnHoarfrostNear = "你附近有人中了$spell:69246时显示特别警告",
    TimerCombatStart = "为战斗开始显示定时器",
    SetIconOnHoarfrostTarget = DBM_CORE_AUTO_ICONS_OPTION_TEXT:format(69246)
})

L:SetMiscLocalization({
    yell1 = "Prison guards, we are leaving! These adventurers are taking over! Go go go!",
    CombatStart = "唉，勇敢的冒险者，你们的路已经到头了。难道你们没有听到身后隧道里钢铁撞击的声音吗？那就是末日降临的乐章。", --Cannot promise just yet if this is right emote, it may be the second emote after this, will need to do more testing.
    HoarfrostTarget = "冰霜巨龙霜牙凝视着(%S+)，准备发动一次冰霜袭击！",
    YellCombatEnd = "不可能……霜牙……警报……"
})

----------------------
-- Forge of Souls  --
----------------------
-- Bronjahm  --
----------------
L = DBM:GetModLocalization("Bronjahm")

L:SetGeneralLocalization({
    name = "布隆亚姆"
})

L:SetWarningLocalization({
    specwarnSoulstorm = "灵魂风暴 - 快贴近boss"
})

L:SetOptionLocalization({
    specwarnSoulstorm = "当$spell:68872施放时显示特别警告(提示贴近)"
})

-------------------------
-- Devourer of Souls  --
-------------------------
L = DBM:GetModLocalization("DevourerofSouls")

L:SetGeneralLocalization({
    name = "噬魂者"
})

L:SetWarningLocalization({
    specwarnMirroredSoul = "停止攻击",
    specwarnWailingSouls = "哀嚎之魂 - 快躲到boss背后"
})

L:SetOptionLocalization({
    specwarnMirroredSoul = "为$spell:69051需要停止攻击时显示特别警告",
    specwarnWailingSouls = "当$spell:68899施放时显示特别警告",
    SetIconOnMirroredTarget = "为$spell:69051的目标设置标记"
})


---------------------------
-- Halls of Reflection  --
---------------------------
-- Wave Timers  --
-------------------
L = DBM:GetModLocalization("HoRWaveTimer")

L:SetGeneralLocalization({
    name = "波数计时"
})

L:SetWarningLocalization({
    WarnNewWaveSoon = "新一波 即将到来",
    WarnNewWave = "%s 到来"
})

L:SetTimerLocalization({
    TimerNextWave = "下一波"
})

L:SetOptionLocalization({
    WarnNewWave = "当首领到来时显示警告",
    WarnNewWaveSoon = "为新一波显示预先警告(击败首领后)",
    ShowAllWaveWarnings = "为所有波数显示警告",
    TimerNextWave = "为下一波显示计时条(击败首领后)",
    ShowAllWaveTimers = "为所有波数显示计时及预先警告(不精确)"
})

L:SetMiscLocalization({
    Falric = "法瑞克",
    WaveCheck = "灵魂波次 = (%d+)/10"
})

--------------
-- Falric  --
--------------
L = DBM:GetModLocalization("Falric")

L:SetGeneralLocalization({
    name = "法瑞克"
})

L:SetWarningLocalization({})

L:SetTimerLocalization({})

L:SetOptionLocalization({})

L:SetMiscLocalization({})

--------------
-- Marwyn  --
--------------
L = DBM:GetModLocalization("Marwyn")

L:SetGeneralLocalization({
    name = "玛维恩"
})

L:SetWarningLocalization({})

L:SetTimerLocalization({})

L:SetOptionLocalization({})

L:SetMiscLocalization({})

-----------------------
-- Lich King Event  --
-----------------------
L = DBM:GetModLocalization("LichKingEvent")

L:SetGeneralLocalization({
    name = "逃离巫妖王事件"
})

L:SetWarningLocalization({
    WarnWave1 = "食尸鬼(6)巫医(1) 即将到来",
    WarnWave2 = "食尸鬼(6)巫医(2)憎恶(1) 即将到来",
    WarnWave3 = "食尸鬼(6)巫医(2)憎恶(2) 即将到来",
    WarnWave4 = "食尸鬼(12)巫医(4)憎恶(3) 即将到来"
})

L:SetTimerLocalization({
    achievementEscape = "逃离计时"
})

L:SetOptionLocalization({
    ShowWaves = "为下一波 即将到来显示警告"
})

L:SetMiscLocalization({
    Ghoul = "狂怒食尸鬼",
    Abom = "笨拙憎恶体",
    WitchDoctor = "复活的巫医",
    ACombatStart = "他太强大了!我们必须立刻离开这里!我的魔法只能困住他一小段时间。快来吧，英雄们!",
    HCombatStart = "他……太强大了。英雄们，快，快过来！我们必须马上离开！你们先走。我会尽全力挡住他。",
    Wave1 = "你们无路可逃！",
    Wave2 = "屈服于死亡的严寒吧！",
    Wave3 = "死路一条！",
    Wave4 = "你能抵挡多久？",
    YellCombatEnd = "开火！开火！"
})
