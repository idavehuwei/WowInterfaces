if (GetLocale() == "zhTW") then
	-- 繁體中文
	WHISPERPOP_LOCALE = {
		["title"] = "密語聊天",
		["no new messages"] = "沒有未閱讀消息",
		["new messages from"] = "未閱讀消息來自: ",
		["receive only"] = "僅顯示接收到的消息",
		["sound notifying"] = "聲音提示",
		["square minimap"] = "方形迷你地圖",
		["class icon"] = "顯示職業圖標",
		["level"] = "顯示人物等級",
		["time"] = "顯示時間標簽",
		["requires playerdb"] = "依賴功能缺失: PlayerDB 1.0",
		["receive only tooltip"] = "如果選中，外發的消息將不會顯示在列表中。",
		["sound notifying tooltip"] = "如果選中，每次接收到新消息時將發出聲音提示。",
		["square minimap tooltip"] = "如果選中，迷你地圖按鈕將被定位為方形定位模式。",
		["disabled by SexyMap"] = "已被SexyMap禁止",
		["class icon tooltip"] = "如果選中，人物的職業圖標將被顯示在消息列表中。需要 PlayerDB 1.0或更高版本。",
		["level tooltip"] = "如果選中，人物的等級數字將被顯示在消息列表中。需要 PlayerDB 1.0或更高版本。",
		["time tooltip"] = "如果选中，時間標簽將被添加到每一行消息文字前面。",
		["hide minimap button"] = "隱藏迷你地圖按鈕",
		["hide minimap button tooltip"] = "如果選中，此插件的迷你地圖按鈕將被隱藏。",
		["delete message"] = "|cff00ff00點擊:|r 刪除所有收發於 %s 的消息",
		["toggle frame"] = "打開/關閉WhisperPop框體",
		["help tip"] = "操作提示",
		["show help tip"] = "顯示操作提示",
		["show help tip tooltip"] = "如果選中，當鼠標移動到某個玩家按鈕或消息文本行時，一個|cffffd200操作提示|r標簽會顯示出來。",
		["player help tip text 1"] = "|cff00ff00點擊:|r 打開與 %s 的密聊通話",
		["player help tip text 2"] = "|cff00ff00Shift-點擊:|r 查詢 %s 的角色信息",
		["player help tip text 3"] = "|cff00ff00Alt-點擊:|r 邀請 %s 加入你的隊伍",
		["player help tip text 4"] = "|cff00ff00右鍵點擊:|r 打開 %s 的角色菜單",
		["message help tip text"] = "|cff00ff00Ctrl-點擊:|r 復制這條信息到聊天輸入框",
		["link tip text1"] = "|cff00ff00點擊:|r 打開/關閉鏈接標簽",
		["link tip text2"] = "|cff00ff00Shift-點擊:|r 轉貼這條鏈接",
		["detach minimap button"] = "迷你地圖按鈕脫離",
		["detach minimap button tooltip"] = "如果選中，此插件的迷你地圖按鈕將脫離迷你地圖并可以用鼠標自由拖動到任意位置。",
	};

	WHISPER_POP_LABEL = "密語聊天"
	WHISPER_POP_DESC = "記錄玩家的密語聊天信息"
end