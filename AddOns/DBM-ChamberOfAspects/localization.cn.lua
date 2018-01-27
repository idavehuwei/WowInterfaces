if GetLocale() ~= "zhCN" then return end

local L

---------------
--  Shadron  --
---------------
L = DBM:GetModLocalization("Shadron")

L:SetGeneralLocalization({
	name = "夏德朗"
})


---------------
--  Tenebron  --
---------------
L = DBM:GetModLocalization("Tenebron")

L:SetGeneralLocalization({
	name = "坦纳伯朗"
})


---------------
--  Vesperon  --
---------------
L = DBM:GetModLocalization("Vesperon")

L:SetGeneralLocalization({
	name = "维斯佩朗"
})


---------------
--  Sartharion  --
---------------
L = DBM:GetModLocalization("Sartharion")

L:SetGeneralLocalization({
	name = "『黑曜守护者』撒尔萨里安"
})


L:SetWarningLocalization({
	WarningTenebron			= "坦纳伯朗进入战斗",
	WarningShadron			= "夏德朗进入战斗",
	WarningVesperon			= "维斯佩朗进入战斗",
	WarningFireWall			= "火墙!",
	WarningVesperonPortal	= "维斯佩朗的传送门!",
	WarningTenebronPortal	= "坦纳伯朗的传送门!",
	WarningShadronPortal	= "夏德朗的传送门!",
})

L:SetTimerLocalization({
	TimerWall	= "火墙冷却",
	TimerTenebron	= "坦纳伯朗进入战斗",
	TimerShadron	= "夏德朗进入战斗",
	TimerVesperon	= "维斯佩朗进入战斗"
})

L:SetOptionLocalization({
	PlaySoundOnFireWall	= "为\"火墙\"播放音效",
	AnnounceFails		= "公布踩中虚空区域和撞上火墙的玩家到团队频道(需要开启团队广播及团长/队长权限)",

	TimerWall		= "为\"火墙\"显示定时器",
	TimerTenebron		= "为坦纳伯朗显示定时器",
	TimerShadron		= "为夏德朗显示定时器",
	TimerVesperon		= "为维斯佩朗显示定时器",

	WarningFireWall		= "显示\"火墙\"的特别警告",
	WarningTenebron		= "显示坦纳伯朗出现计时",
	WarningShadron		= "显示夏德朗出现计时",
	WarningVesperon		= "显示维斯佩朗出现计时",

	WarningTenebronPortal	= "为坦纳伯朗的传送门显示特别警告",
	WarningShadronPortal	= "为夏德朗的传送门显示特别警告",
	WarningVesperonPortal	= "为维斯佩朗的传送门显示特别警告",
})

L:SetMiscLocalization({
	Wall			= "围绕着%s的熔岩开始剧烈地翻腾!",
	Portal			= "%s开始开启暮光传送门!",
	NameTenebron	= "坦纳伯朗",
	NameShadron		= "夏德朗",
	NameVesperon	= "维斯佩朗",
	FireWallOn		= "火墙: %s",
	VoidZoneOn		= "虚空区域: %s",
	VoidZones		= "踩中虚空区域(这一次): %s",
	FireWalls		= "撞上火墙 (这一次): %s",
	--[[ not in use; don't translate.
	Vesperon	= "Vesperon, the clutch is in danger! Assist me!",
	Shadron		= "Shadron! Come to me! All is at risk!",
	Tenebron	= "Tenebron! The eggs are yours to protect as well!"
	--]]
})
