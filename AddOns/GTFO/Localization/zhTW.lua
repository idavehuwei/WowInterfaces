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

if (GetLocale() == "zhTW") then

GTFOLocal = 
{
	Active_Off = "插件暫停",
	Active_On = "插件恢復",
	ClosePopup_Message = "你可以在以後設定你的 GTFO , 使用指令: %s",
	Group_None = "無",
	Group_NotInGroup = "你不在一個小隊或團隊中.",
	Group_PartyMembers = "%d 在 %d 個小隊成員正在使用這個插件.",
	Group_RaidMembers = "%d 在 %d 個團員正在使用這個插件.",
	Help_Intro = "v%s (|cFFFFFFFF指令列表|r)",
	Help_Options = "顯示選項",
	Help_Suspend = "暫停/恢復插件",
	Help_Suspended = "插件當前為暫停.",
	Help_TestFail = "播放測試音效 (失敗警報)",
	Help_TestFriendlyFire = "播放測試音效 (友方火焰)",
	Help_TestHigh = "播放測試音效 (高危險)",
	Help_TestLow = "播放測試音效 (低危險)",
	Help_Version = "顯示其他正在運行這個插件的團員",
	LoadingPopup_Message = "你的 GTFO 設定已重置為預設.  你想要現在就進行設定嗎?",
	Loading_Loaded = "v%s 已加載.",
	Loading_LoadedSuspended = "v%s 已加載. (|cFFFF1111暫停|r)",
	Loading_LoadedWithPowerAuras = "v%s 已和 Power Auras 共同加載.",
	Loading_NewDatabase = "v%s: 發現新的數據庫版本, 重設為預設.",
	Loading_OutOfDate = "v%s 已可以下載!  |cFFFFFFFF請更新.|r",
	Loading_PowerAurasOutOfDate = "你的 |cFFFFFFFFPower Auras Classic|r 版本已經過期!  GTFO & Power Auras 整合將不會被加載.",
	TestSound_Fail = "測試音效 (失敗警報) 播放.",
	TestSound_FailMuted = "測試音效 (失敗警報) 播放. [|cFFFF4444靜音|r]",
	TestSound_FriendlyFire = "測試音效 (友方火焰) 播放.",
	TestSound_FriendlyFireMuted = "測試音效 (友方火焰) 播放. [|cFFFF4444靜音|r]",
	TestSound_High = "測試音效 (高危險)播放.",
	TestSound_HighMuted = "測試音效 (高危險) 播放. [|cFFFF4444靜音|r]",
	TestSound_Low = "測試音效 (低危險) 播放.",
	TestSound_LowMuted = "測試音效 (低危險) 播放. [|cFFFF4444靜音|r]",
	UI_Enabled = "啟用",
	UI_EnabledDescription = "開啟 GTFO 插件.",
	UI_Fail = "失敗警報音效",
	UI_FailDescription = "當移動失敗時 GTFO 警報音效 -- 希望你下次會記住!",
	UI_FriendlyFire = "友方火焰音效",
	UI_FriendlyFireDescription = "啟用當隊友正在移動將要爆炸時的警報.",
	UI_HighDamage = "團隊/高危險音效",
	UI_HighDamageDescription = "當你在危險環境中必須立即走開時啟用 GTFO 警報音效.",
	UI_LowDamage = "PvP/環境/低危險音效",
	UI_LowDamageDescription = "啟用 GTFO boop 音效 -- 當你在低危險環境時按你自己的選擇是否移動",
	UI_Test = "測試",
	UI_TestDescription = "測試音效.",
	UI_TestMode = "實驗模式/Beta 模式",
	UI_TestModeDescription = "激活未測試/未確認的警報 (Beta/PTR)",
	UI_TestModeDescription2 = "請回報任何問題到 |cFF44FFFF%s@%s.%s|r",
	UI_Trivial = "瑣碎內容警報",
	UI_TrivialDescription = "啟用基於你角色當前等級在低等級地城的其他警報.",
	UI_Unmute = "當靜音時播放音效",
	UI_UnmuteDescription = "如果你設定了靜音, GTFO 將嘗試打開音效來播放 GTFO 警報.",
	UI_UnmuteDescription2 = "這個需要音量高於 0%.",
	UI_Volume = "GTFO 音量",
	UI_VolumeDescription = "設置警報音效的音量.",
	UI_VolumeLoud = "4: 大聲",
	UI_VolumeLouder = "5: 大聲",
	UI_VolumeMax = "最大",
	UI_VolumeMin = "最小",
	UI_VolumeNormal = "3: 普通 (推薦)",
	UI_VolumeQuiet = "1: 安靜",
	UI_VolumeSoft = "2: 輕柔",
}

end