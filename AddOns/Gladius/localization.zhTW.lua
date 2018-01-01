﻿--由一區烈焰峰-水鏡花緣漢化 

local L local L = LibStub("AceLocale-3.0"):NewLocale("Gladius", "zhTW", false) 

if L then 

--Welcome message 
	L["Welcome to Gladius!"] = "歡迎使用Gladius!" 
	L["First run has been detected, displaying test frame."] = "第一次使用,顯示測試框體" 
	L["Valid slash commands are:"] = "命令設置為:" 
	L["/gladius ui"] = "/gladius ui" 
	L["/gladius test1-5"] = "/gladius test1-5" 
	L["If this is not your first run please lock or move the frame to prevent this from happening."] = "如果非初次使用，請鎖定或者移動框體以保證不顯示該信息." 

--Frame 
	L["Gladius - drag to move"] = "Gladius -按住拖動" 

--Options 
	L["General"] = "一般" 
	L["General settings"] = "一般設置" 
	L["Bars"] = "條" 
	L["Bar settings"] = "條設置" 
	L["Colors"] = "顏色和紋理" 
	L["Color settings"] = "顏色紋理設置" 
	L["Size and margin"] = "大小和邊緣" 
	L["Size and margin settings"] = "大小和邊緣設置" 
	L["Text"] = "文字" 
	L["TextDesc"] = "文字設置" 
	L["Lock frame"] = "鎖定界面" 
	L["Frame resize"] = "界面重置" 
	L["If this is enabled the frame will automaticly get resized to the appropriate size every time you enter an arena"] = "按人數自動調整大小" 
	L["Toggle if the frame can be moved"] = "點擊後鎖定" 
	L["Frame scale"] = "界面大小" 
	L["Scale of the frame"] = "界面大小" 
	L["Frame padding"] = "界面間隙" 
	L["Padding of the frame"] = "界面間隙" 
	L["Show cast bars"] = "顯示施法條" 
	L["Show power percentage"] = "顯示能力條百分比" 
	L["Show mana/energy/rage percentage on the power bar"] = "顯示魔法/能量/怒氣百分比" 
	L["Show race text"] = "顯示種族文本" 
	L["Show race text on the power bar"] = "在能力條上顯示種族文本" 
	L["Show class text"] = "顯示職業文本" 
	L["Show class text on the power bar"] = "在能力條上顯示職業文本" 
	L["Highlight target"] = "目標突出" 
	L["Toggle if the selected target should be highlighted"] = "目標突出顯示" 
	L["Show border around target"] = "目標邊框" 
	L["Toggle if a border should be shown around the selected target"] = "目標邊框顯示" 
	L["Bar texture"] = "條紋理" 
	L["Bar width"] = "條寬" 
	L["Width of the health and power bars"] = "血條和能力條的寬度" 
	L["Health bar height"] = "血條高度" 
	L["Height of the health bars"] = "血條高度" 
	L["Power bar height"] = "能力條高度" 
	L["Height of the power bars"] = "能力條高度" 
	L["Cast bar height"] = "施法條高度" 
	L["Height of the cast bars"] = "施法條高度" 
	L["Bar bottom margin"] = "條間隙" 
	L["Margin to the next bar"] = "條之間的間隙" 
	L["Frame color"] = "界面顏色" 
	L["Color of the frame"] = "界面顏色" 
	L["Selected border color"] = "選擇邊框顏色" 
	L["Color of the selected targets border"] = "選擇目標邊框顏色" 
	L["Mana color"] = "魔法" 
	L["Color of the mana bar"] = "藍條的顏色" 
	L["Energy color"] = "能量" 
	L["Color of the energy bar"] = "能量條顏色" 
	L["Rage color"] = "怒氣" 
	L["Color of the rage bar"] = "怒氣條顏色" 
	L["Runic Power color"] = "符文" 
	L["Color of the runic power bar"] = "符文條顏色" 
	L["Game default"] = "遊戲默認" 
	L["Use game default rage color"] = "使用遊戲默認的怒氣條顏色" 
	L["Use game default energy color"] = "使用遊戲默認的能量條顏色" 
	L["Use game default mana color"] = "使用遊戲默認的魔法條顏色" 
	L["Use game default runic power color"] = "使用遊戲默認的符文條顏色" 
	L["Cast bar color"] = "施法條顏色" 
	L["Color of the cast bar"] = "施法條顏色" 
	L["Health text size"] = "血量文字大小" 
	L["Size of the health bar text"] = "血量文字大小" 
	L["Health text color"] = "血量文字顏色" 
	L["Color of the health bar text"] = "血量文字顏色" 
	L["Mana text size"] = "魔法文字大小" 
	L["Size of the mana bar text"] = "魔法文字大小" 
	L["Mana text color"] = "魔法文字顏色" 
	L["Color of the mana bar text"] = "魔法文字顏色" 
	L["Cast bar text size"] = "施法條文字大小" 
	L["Size of the cast bar text"] = "施法條文字大小" 
	L["Cast bar text color"] = "施法條文字顏色" 
	L["Color of the cast bar text"] = "施法條文字顏色" 
	L["Aura text size"] = "光環文字大小" 
	L["Size of the aura text"] = "光環文字大小" 
	L["Aura text color"] = "光環文字顏色" 
	L["Color of the aura text"] = "光環文字顏色" 
	L["Show power bars"] = "顯示能力條" 
	L["Show class icon"] = "顯示職業圖標" 
	L["Show class icon\nIMPORTANT:\nToggling this off will disable showing auras even if it is enabled"] = "顯示職業圖標\n注意:\n開啟此功能顯示光環功能才可用" 
	L["Show auras"] = "顯示光環" 
	L["Show important auras over the class icon with a timer. You can select which auras to show and their respective priorites in the auralist.lua file"] = "重要的光環效果會覆蓋職業圖標並記時。你可以在auralist.lua中更改技能和優先級" 
	L["Left Click"] = "左鍵" 
	L["Right Click"] = "右鍵" 
	L["Middle Mouse Click"] = "中鍵" 
	L["Mouse 4 Click"] = "鼠標按鍵4" 
	L["Mouse 5 Click"] = "鼠標按鍵5" 
	L["Spell Name"] = "法術名稱" 
	L["Cast Spell"] = "釋放法術" 
	L["Show the actual power"] = "顯示數值" 
	L["Show the actual mana/energy/rage on the power bar"] = "顯示魔法/能量/怒氣的數值" 
	L["Show max power"] = "顯示最大值" 
	L["Show maximum mana/energy/rage on the power bar"] = "顯示魔法/怒氣/能量的最大值" 
	L["Show power text"] = "顯示文字" 
	L["Show mana/energy/rage text on the power bar"] = "顯示魔法/怒氣/能量的文本文字" 
	L["Show target icon"] = "顯示目標圖標" 
	L["Trinket"] = "顯示徽章狀態" 
	L["TrinketDesc"] = "在敵人名右側顯示徽章狀態" 
	L["Sizes"] = "大小" 
	L["SizesDesc"] = "文字大小" 
	L["Target icon size"] = "目標圖標大小" 
	L["TargetIconSizeDesc"] = "目標圖標大小" 
	L["Big icon scale"] = "大圖標" 
	L["BigIconScaleDesc"] = "大飾品圖標" 

	L["TrinketDisplay"] = "徽章顯示" 
	L["TrinketDisplayDesc"] = "選擇如何顯示徽章" 
	L["trinketNameText"] = "文字" 
	L["trinketNameIcon"] = "圖標" 
	L["trinketBigIcon"] = "大圖標" 
	L["trinketOverrideIcon"] = "覆蓋職業/光環圖標" 
	L["trinketSmallIcon"] = "小圖標" 
	L["trinketGridIcon"] = "Grid-樣式圖標" 

	L["enemyAnnounce"] = "新的敵人" 
	L["enemyAnnounceDesc"] = "通告找到的新敵人" 
	L["trinketUsedAnnounce"] = "徽章使用" 
	L["trinketUsedAnnounceDesc"] = "通告敵人使用徽章" 
	L["trinketUpAnnounce"] = "徽章冷卻" 
	L["trinketUpAnnounceDesc"] = "通告敵人徽章冷卻完畢" 

	L["announceType"] = "通告類型" 
	L["announceTypeDesc"] = "通告到哪個頻道" 

	L["announceParty"] = "小隊" 
	L["announceRw"] = "團隊警報" 
	L["announceSct"] = "SCT" 
	L["announceMsbt"] = "MSBT" 
	L["announceFct"] = "FCT (Blizzard)" 

	L["lowHealthAnnounce"] = "生命垂危通告" 
	L["lowHealthAnnounceDesc"] = "通告敵人生命垂危." 
	L["lowHealthPercentage"] = "生命垂危閥值" 
	L["lowHealthPercentageDesc"] = "低於這個值將會被判定為生命垂危" 

	L["Grow frame upwards"] = "向上增長" 
	L["If this is toggled the frame will grow upwards instead of downwards."] = "勾選此項,條將會向上增長" 

	L["Announcements"] = "通告設置" 
	L["Set options for different announcements"] ="設置不同的通告" 
	L["Trinket display"] = "徽章顯示" 
	L["Set options for the trinket status display"] = "設置徽章顯示方法" 
	L["Clicks"] = "點擊" 
	L["Set options for mouse clicks on the arena targets"] = "設置各種鼠標點擊敵人的功能" 
	L["focus"] = "焦點" 

--font
	L["GFont"] = "Fonts\\bKAI00M.ttf"
	
--Announcement
	L["LowHP"] ="生命垂危 %s"
	L["trinketready"] = "徽章冷卻完畢: %s (%s)"
	L["trinketused"] = "徽章已經使用: %s (%s)"
	L["Gtestplayer"] = "敵方玩家"
	
	BINDING_HEADER_GLADIUS = "Gladius" 
	BINDING_NAME_GLADIUSTARGET1_LEFT = "Left click enemy #1" 
	BINDING_NAME_GLADIUSTARGET2_LEFT = "Left click enemy #2" 
	BINDING_NAME_GLADIUSTARGET3_LEFT = "Left click enemy #3" 
	BINDING_NAME_GLADIUSTARGET4_LEFT = "Left click enemy #4" 
	BINDING_NAME_GLADIUSTARGET5_LEFT = "Left click enemy #5" 
	BINDING_NAME_GLADIUSTARGET1_RIGHT = "Right click enemy #1" 
	BINDING_NAME_GLADIUSTARGET2_RIGHT = "Right click enemy #2" 
	BINDING_NAME_GLADIUSTARGET3_RIGHT = "Right click enemy #3" 
	BINDING_NAME_GLADIUSTARGET4_RIGHT = "Right click enemy #4" 
	BINDING_NAME_GLADIUSTARGET5_RIGHT = "Right click enemy #5" 

end
