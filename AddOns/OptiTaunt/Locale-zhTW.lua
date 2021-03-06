﻿local L = AceLibrary("AceLocale-2.2"):new("OptiTaunt")

L:RegisterTranslations("zhTW", function() return {
    --Addon Stuff
	["Tooltip"] = "右鍵點擊開啟選項.",
	["Slash-Commands"] = { "/optitaunt", "/ot" },
	
	["Statistics"] = "統計資料",
	["Taunts"] = "嘲諷次數:",
	["Resisted"] = "被抵抗次數:",
	
	--Skills
	["Taunt"] = "嘲諷",
	["Mocking Blow"] = "懲戒痛擊",
	["Shield Wall"] = "盾牆",
	["Last Stand"] = "破釜沉舟",
	["Challenging Shout"] = "挑戰怒吼",
	["Righteous Defense"] = "正義防禦",
	["Avenger's Shield"] = "復仇之盾",
	["Growl"] = "低吼",
	["Frenzied Regeneration"] = "狂暴恢復",
	["Challenging Roar"] = "挑戰咆哮",
	["Survival Instincts"] = "求生本能",
	["Barkskin"] = "樹皮術",
			
	--Messages
	["resistmessage"] = "注意! {t} 抵抗了我的 {a}!",
	["immunemessage"] = "注意! {t} 免疫我的技能 {a}!",
	["abilitymessage"] = ">>> {a} 開啟了 ({d}s) <<<",
	
	--Whisper Strings
	["Resist-Whisper-Message-Warrior"] = "啊! 幸好你能多撐幾下.",
	["Resist-Whisper-Message-Druid"] = "變熊才是王道!",
	["Resist-Whisper-Message-Paladin"] = "快拿出你的正義之鎚敲下去!",
	["Resist-Whisper-Message-Mage"] = "冰箱, 冰箱, 快冰箱!",
	["Resist-Whisper-Message-Warlock"] = "你可能極需粉碎?",
	["Resist-Whisper-Message-Hunter"] = "拿出你最帥的姿勢假死吧!",
	["Resist-Whisper-Message-Rogue"] = "還能消失吧?",
	["Resist-Whisper-Message-Priest"] = "祈禱吧...",
	["Resist-Whisper-Message-Shaman"] = "你先跟你的圖騰待一下吧",
	
	--Options
	["opt_name_raidparty"] = "團隊/隊伍",
	["opt_desc_raidparty"] = "發佈 OptiTaunt 警告在隊伍或是團隊頻道.",
	["opt_name_say"] = "說",
	["opt_desc_say"] = "發佈 OptiTaunt 警告在說話頻.",
	["opt_name_autowhisper"] = "密語",
	["opt_desc_autowhisper"] = "自動密語警告給玩家當未取得目標仇恨而嘲諷失敗時發出警告.",
	["opt_name_raidwarning"] = "團隊警告",
	["opt_desc_raidwarning"] = "發佈 Optitaunt 警告為團隊警告.",
	["opt_name_audio"] = "音效警告",
	["opt_desc_audio"] = "播放音效警告當你嘲諷失敗時.",
	["opt_name_aggrocheck"] = "檢查 aggro",
	["opt_desc_aggrocheck"] = "OptiTaunt 只會在你未取得aggro而嘲諷失敗時發出警告.",
	["opt_name_whisperwarriors"] = "密語戰士",
	["opt_desc_whisperwarriors"] = "OptiTaunt 會自動密語戰士當你嘲諷失敗時.",
	["opt_name_pvpcheck"] = "檢查 PvP",
	["opt_desc_pvpcheck"] = "PVP 時,不發佈警告.",
	["opt_name_output_sink"] = "輸出 (經由 SinkLib)",
	["opt_name_announces"] = "發佈技能",
	["opt_desc_announces"] = "發佈哪些技能.",
	["opt_name_output"] = "輸出 (聊天)",
	["opt_desc_output"] = "在哪個聊天發佈你的警告.",
	["opt_name_outputchannel"] = "輸出 (頻道)",
	["opt_desc_outputchannel"] = "在哪個頻道發佈你的警告.",
	["opt_name_options"] = "其他選項",
	["opt_desc_options"] = "其他選項",
	["opt_name_messagetexts"] = "訊息警告",
	["opt_desc_messagetexts"] = "編輯你的訊息警告.",
	["opt_name_resistmessage"] = "訊息警告: 抵抗",
	["opt_usage_resistmessage"] = "\n{t}: 目標名\n{a}: 技能名",
	["opt_name_immunemessage"] = "訊息警告: 免疫",
	["opt_usage_immunemessage"] = "\n{t}: 目標名\n{a}: 技能名",
	["opt_name_abilitymessage"] = "訊息警告: 開啟的技能",
	["opt_usage_abilitymessage"] = "\n{a}: 技能\n{d}: 持續時間",
	["Reset counters"] = "重置計數器",
	["opt_desc_resetcounters"] = "重置嘲諷統計計數器.",
	["opt_name_announceresist"] = "發佈抵抗",
	["opt_desc_announceresist"] = "是否開啟抵抗發佈功能.",
	["opt_name_announceimmue"] = "發佈免疫",
	["opt_desc_announceimmue"] = "是否開啟免疫發佈功能.",
	["opt_name_announceability"] = "發佈技能",
	["opt_desc_announceability"] = "是否開啟技能使用發佈功能.",
		
} end)