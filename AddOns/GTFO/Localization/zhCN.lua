--------------------------------------------------------------------------
-- zhTW.lua 
--------------------------------------------------------------------------
--[[
GTFO Traditional Chinese Localization
Translator: wowuicn

Change Log:
	v3.0
		- Added Traditional Chinese localization
	v3.2.2
		- Added untranslated strings
	v3.3
		- Added untranslated strings
]]--

if (GetLocale() == "zhCN") then

GTFOLocal = 
{
	Active_Off = "插件暂停",
	Active_On = "插件恢复",
	ClosePopup_Message = "你可以在以后设定你的 GTFO , 使用指令: %s",
	Group_None = "无",
	Group_NotInGroup = "你不在一个小队或团队中.",
	Group_PartyMembers = "%d 在 %d 个小队成员正在使用这个插件.",
	Group_RaidMembers = "%d 在 %d 个团员正在使用这个插件.",
	Help_Intro = "v%s (|cFFFFFFFF指令列表|r)",
	Help_Options = "显示选项",
	Help_Suspend = "暂停/恢复插件",
	Help_Suspended = "插件当前为暂停.",
	Help_TestFail = "播放测试音效 (失败警报)",
	Help_TestFriendlyFire = "播放测试音效 (友方火焰)",
	Help_TestHigh = "播放测试音效 (高危险)",
	Help_TestLow = "播放测试音效 (低危险)",
	Help_Version = "显示其他正在运行这个插件的团员",
	LoadingPopup_Message = "你的 GTFO 设定已重置为预设.  你想要现在就进行设定吗?",
	Loading_Loaded = "v%s 已加载.",
	Loading_LoadedSuspended = "v%s 已加载. (|cFFFF1111暂停|r)",
	Loading_LoadedWithPowerAuras = "v%s 已和 Power Auras 共同加载.",
	Loading_NewDatabase = "v%s: 发现新的数据库版本, 重设为预设.",
	Loading_OutOfDate = "v%s 已可以下载!  |cFFFFFFFF请更新.|r",
	Loading_PowerAurasOutOfDate = "你的 |cFFFFFFFFPower Auras Classic|r 版本已经过期!  GTFO & Power Auras 整合将不会被加载.",
	TestSound_Fail = "测试音效 (失败警报) 播放.",
	TestSound_FailMuted = "测试音效 (失败警报) 播放. [|cFFFF4444静音|r]",
	TestSound_FriendlyFire = "测试音效 (友方火焰) 播放.",
	TestSound_FriendlyFireMuted = "测试音效 (友方火焰) 播放. [|cFFFF4444静音|r]",
	TestSound_High = "测试音效 (高危险)播放.",
	TestSound_HighMuted = "测试音效 (高危险) 播放. [|cFFFF4444静音|r]",
	TestSound_Low = "测试音效 (低危险) 播放.",
	TestSound_LowMuted = "测试音效 (低危险) 播放. [|cFFFF4444静音|r]",
	UI_Enabled = "启用",
	UI_EnabledDescription = "开启 GTFO 插件.",
	UI_Fail = "失败警报音效",
	UI_FailDescription = "当移动失败时 GTFO 警报音效 -- 希望你下次会记住!",
	UI_FriendlyFire = "友方火焰音效",
	UI_FriendlyFireDescription = "启用当队友正在移动将要爆炸时的警报.",
	UI_HighDamage = "团队/高危险音效",
	UI_HighDamageDescription = "当你在危险环境中必须立即走开时启用 GTFO 警报音效.",
	UI_LowDamage = "PvP/环境/低危险音效",
	UI_LowDamageDescription = "启用 GTFO boop 音效 -- 当你在低危险环境时按你自己的选择是否移动",
	UI_Test = "测试",
	UI_TestDescription = "测试音效.",
	UI_TestMode = "实验模式/Beta 模式",
	UI_TestModeDescription = "激活未测试/未确认的警报 (Beta/PTR)",
	UI_TestModeDescription2 = "请回报任何问题到 |cFF44FFFF%s@%s.%s|r",
	UI_Trivial = "琐碎内容警报",
	UI_TrivialDescription = "启用基于你角色当前等级在低等级地城的其他警报.",
	UI_Unmute = "当静音时播放音效",
	UI_UnmuteDescription = "如果你设定了静音, GTFO 将尝试打开音效来播放 GTFO 警报.",
	UI_UnmuteDescription2 = "这个需要音量高于 0%.",
	UI_Volume = "GTFO 音量",
	UI_VolumeDescription = "设置警报音效的音量.",
	UI_VolumeLoud = "4: 大声",
	UI_VolumeLouder = "5: 大声",
	UI_VolumeMax = "最大",
	UI_VolumeMin = "最小",
	UI_VolumeNormal = "3: 普通 (推荐)",
	UI_VolumeQuiet = "1: 安静",
	UI_VolumeSoft = "2: 轻柔",
}

end