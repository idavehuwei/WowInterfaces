if GetLocale() ~= "zhCN" then return end

local L

---------------
--  Malygos  --
---------------
L = DBM:GetModLocalization("Malygos")

L:SetGeneralLocalization({
	name = "玛里苟斯"
})

L:SetWarningLocalization({
	WarningSpark		= "力量火花 出现了",
	WarningVortex		= "旋涡",
	WarningBreathSoon	= "深呼吸 即将到来",
	WarningBreath		= "深呼吸!",
	WarningSurge		= "力量奔腾: >%s<",
	WarningVortexSoon	= "旋涡 即将到来",
	WarningSurgeYou		= "你中了力量奔腾!"
})

L:SetTimerLocalization({
	TimerSpark		= "下一个火花",
	TimerVortex		= "旋涡",
	TimerBreath		= "深呼吸",
	TimerVortexCD		= "旋涡冷却"
})

L:SetOptionLocalization({
	WarningSpark		= "显示力量火花警告",
	WarningVortex		= "显示旋涡警告",
	WarningBreathSoon	= "显示深呼吸的预先警告",
	WarningBreath		= "显示深呼吸警告",
	WarningSurge		= "显示力量奔腾警告",
	TimerSpark		= "显示力量火花定时器",
	TimerVortex		= "显示旋涡定时器",
	TimerBreath		= "显示深呼吸定时器",
	TimerVortexCD		= "显示旋涡的冷却定时器 (不准确)",
	WarningVortexSoon	= "显示旋涡的预先警告 (不准确)",
	WarningSurgeYou		= "当你中了力量奔腾时显示特别警告"
})

L:SetMiscLocalization({
	YellPull		= "我的耐心到此为止了。我要亲自消灭你们!",
	EmoteSpark		= "一个力量火花从附近的裂缝中形成。",
	YellPhase2		= "我原本只是想尽快结束你们的生命",
	EmoteBreath		= "只要我的龙息尚存，你们就毫无机会!",
	YellPhase3		= "现在你们幕后的主使终于出现"
})
