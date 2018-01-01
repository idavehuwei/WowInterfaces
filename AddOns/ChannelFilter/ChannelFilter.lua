 if (GetLocale() == "zhCN") then CHANNEL_FILTER_MSG_ALREADY_EXIST = "|cff00adef[频道过滤]|r 关键字\"|cffff0000%s|r\"已经存在于屏蔽文字列表中。"; CHANNEL_FILTER_MSG_ADDED = "|cff00adef[频道过滤]|r 关键字\"|cffff0000%s|r\"已经被加入至屏蔽文字列表中。"; CHANNEL_FILTER_MSG_REMOVED = "|cff00adef[频道过滤]|r 关键字\"|cffff0000%s|r\"已经从屏蔽文字列表中删除。"; CHANNEL_FILTER_MSG_KEY_NOT_FOUND = "|cff00adef[频道过滤]|r 没有找到关键字\"|cffff0000%s|r\"。"; CHANNEL_FILTER_MSG_OUT_OF_BOUND = "|cff00adef[频道过滤]|r 过滤列表中不存在该序号。"; CHANNEL_FILTER_MSG_ALL_CLEAR = "|cff00adef[频道过滤]|r 过滤列表中的所有数据已经删除。"; CHANNEL_FILTER_MSG_ENABLE = "|cff00adef[频道过滤]|r 开启频道过滤功能。"; CHANNEL_FILTER_MSG_DISABLE = "|cff00adef[频道过滤]|r 关闭频道过滤功能。"; CHANNEL_FILTER_MSG_RESET = "|cff00adef[频道过滤]|r 过滤列表已经被重置为缺省设置。"; CHANNEL_FILTER_MSG_USAGE_PINGBI_FUNCTION = "\n功能：将某条文字加入到屏蔽文字列表中，凡是出现该文字字眼的频道消息将被自动屏蔽掉。"; CHANNEL_FILTER_MSG_USAGE_PINGBI_USAGE = "使用格式：/guolv|cff00ff00[空格]|r+|cff00ff00[空格]|r<屏蔽文字>"; CHANNEL_FILTER_MSG_USAGE_PINGBI_EXAMPLE = "样例：/guolv + 出售外挂"; CHANNEL_FILTER_MSG_EMPTY_LIST = "|cffff0000不存在数据。|r"; CHANNEL_FILTER_MSG_LIST_TITLE = "|cffffffff屏蔽文字列表中包括如下：|r"; CHANNEL_FILTER_MSG_SELECT = "请输入\"/guolv - <序号>\"来删除列表中的屏蔽文字。"; CHANNEL_HELP_TEXT1 = "\n|cffffffff频道过滤命令使用帮助：|r"; CHANNEL_HELP_TEXT2 = "/guolv + <过滤字眼> |cff00ff00增加过滤关键字|r"; CHANNEL_HELP_TEXT3 = "/guolv - <序号> |cff00ff00删除列表中的关键字|r"; CHANNEL_HELP_TEXT4 = "/guolv - * |cff00ff00删除列表中的所有关键字|r"; CHANNEL_HELP_TEXT5 = "/guolv * |cff00ff00显示过滤列表中的关键字|r"; CHANNEL_HELP_TEXT6 = "/guolv on |cff00ff00开启频道过滤功能|r"; CHANNEL_HELP_TEXT7 = "/guolv off |cff00ff00关闭频道过滤功能|r"; CHANNEL_FILTER_ENABLE_TEXT = "开启频道过滤功能"; CHANNEL_FILTER_TITLE = {"频道过滤", "pindaoguolv"}; CHANNEL_FILTER_ADD_TEXT = "增加"; CHANNEL_FILTER_REMOVE_TEXT = "删除"; CHANNEL_FILTER_REST_TEXT = "重置"; CHANNEL_FILTER_ADD_WORD_TEXT = "请输入你想要屏蔽的文字："; CHANNEL_FILTER_AUTO_IGNORE_TEXT = "自动屏蔽该玩家一段时间"; CHANNEL_FILTER_AUTO_IGNORE_DESC = "当频道过滤发现某个玩家发送了一段屏蔽的文字后，自动将该玩家以后一段时间内的所有消息屏蔽掉。"; CHANNEL_FILTER_BAN_FLOOD_TEXT = "过滤重复的语句"; CHANNEL_FILTER_BAN_FLOOD_DESC = "过滤掉聊天频道中重复发送的语句。"; ChannelFilter_Config = {}; ChannelFilter_Config.Enabled = 1; ChannelFilter_Config.IgnoreWords = { n = 5, "金币", "代练", "金库", "WWW%.", "www%." }; ChannelFilter_Config.IgnorePlayer = {}; ChannelFilter_Config.AutoIgnorePlayer = 1; ChannelFilter_NewIgnoreWords_Default = { n = 5, "金币", "代练", "金库", "WWW%.", "www%." } CHANNEL_FILTER_MUTE_LABEL = "频道消息"; CHANNEL_FILTER_MUTE_DESC = "点击按钮进行切换是否屏蔽频道信息的功能"; elseif (GetLocale() == "zhTW") then CHANNEL_FILTER_MSG_ALREADY_EXIST = "|cff00adef[頻道過濾]|r 關鍵字\"|cffff0000%s|r\"已經存在于屏蔽文字列表中。"; CHANNEL_FILTER_MSG_ADDED = "|cff00adef[頻道過濾]|r 關鍵字\"|cffff0000%s|r\"已經被加入至屏蔽文字列表中。"; CHANNEL_FILTER_MSG_REMOVED = "|cff00adef[頻道過濾]|r 關鍵字\"|cffff0000%s|r\"已經從屏蔽文字列表中刪除。"; CHANNEL_FILTER_MSG_KEY_NOT_FOUND = "|cff00adef[頻道過濾]|r 沒有找到關鍵字\"|cffff0000%s|r\"。"; CHANNEL_FILTER_MSG_OUT_OF_BOUND = "|cff00adef[頻道過濾]|r 過濾列表中不存在該序號。"; CHANNEL_FILTER_MSG_ALL_CLEAR = "|cff00adef[頻道過濾]|r 過濾列表中的所有數據已經刪除。"; CHANNEL_FILTER_MSG_ENABLE = "|cff00adef[頻道過濾]|r 開啓頻道過濾功能。"; CHANNEL_FILTER_MSG_DISABLE = "|cff00adef[頻道過濾]|r 關閉頻道過濾功能。"; CHANNEL_FILTER_MSG_USAGE_PINGBI_FUNCTION = "\n功能：將某條文字加入到屏蔽文字列表中，凡是出現該文字字眼的頻道消息將被自動屏蔽掉。"; CHANNEL_FILTER_MSG_USAGE_PINGBI_USAGE = "使用格式：/guolv|cff00ff00[空格]|r+|cff00ff00[空格]|r<屏蔽文字>"; CHANNEL_FILTER_MSG_USAGE_PINGBI_EXAMPLE = "樣例：/guolv + 出售外挂"; CHANNEL_FILTER_MSG_EMPTY_LIST = "|cffff0000不存在數據。|r"; CHANNEL_FILTER_MSG_LIST_TITLE = "|cffffffff屏蔽文字列表中包括如下：|r"; CHANNEL_FILTER_MSG_SELECT = "請輸入\"/guolv - <序號>\"來刪除列表中的屏蔽文字。"; CHANNEL_HELP_TEXT1 = "\n|cffffffff頻道過濾命令使用幫助：|r"; CHANNEL_HELP_TEXT2 = "/guolv + <過濾字眼> |cff00ff00增加過濾關鍵字|r"; CHANNEL_HELP_TEXT3 = "/guolv - <序號> |cff00ff00刪除列表中的關鍵字|r"; CHANNEL_HELP_TEXT4 = "/guolv - * |cff00ff00刪除列表中的所有關鍵字|r"; CHANNEL_HELP_TEXT5 = "/guolv * |cff00ff00顯示過濾列表中的關鍵字|r"; CHANNEL_HELP_TEXT6 = "/guolv on |cff00ff00開啓頻道過濾功能|r"; CHANNEL_HELP_TEXT7 = "/guolv off |cff00ff00關閉頻道過濾功能|r"; CHANNEL_FILTER_ENABLE_TEXT = "開啓頻道過濾功能"; CHANNEL_FILTER_TITLE = {"頻道過濾", "pindaoguolv"}; CHANNEL_FILTER_ADD_TEXT = "增加"; CHANNEL_FILTER_REMOVE_TEXT = "刪除"; CHANNEL_FILTER_REST_TEXT = "重置"; CHANNEL_FILTER_ADD_WORD_TEXT = "請輸入你想要屏蔽的文字："; CHANNEL_FILTER_AUTO_IGNORE_TEXT = "自動屏蔽該玩家一段時間"; CHANNEL_FILTER_AUTO_IGNORE_DESC = "當頻道過濾發現某個玩家發送了一段屏蔽的文字後，自動將該玩家以後一段時間內的所有消息屏蔽掉。"; CHANNEL_FILTER_BAN_FLOOD_TEXT = "過濾重複的語句"; CHANNEL_FILTER_BAN_FLOOD_DESC = "過濾掉聊天頻道中重複發送的語句"; ChannelFilter_Config = {}; ChannelFilter_Config.Enabled = 1; ChannelFilter_Config.IgnoreWords = { n = 5, "金幣", "代練", "金庫", "WWW%.", "www%." }; ChannelFilter_Config.IgnorePlayer = {}; ChannelFilter_Config.AutoIgnorePlayer = 1; ChannelFilter_NewIgnoreWords_Default = { n = 5, "金幣", "代練", "金庫", "WWW%.", "www%." } CHANNEL_FILTER_MUTE_LABEL = "頻道消息"; CHANNEL_FILTER_MUTE_DESC = "點擊按鈕進行切換是否屏蔽頻道信息的功能"; else CHANNEL_FILTER_MSG_ALREADY_EXIST = "|cff00adef[ChannelFilter]|r Keyword \"|cffff0000%s|r\" is already exist in ignore list."; CHANNEL_FILTER_MSG_ADDED = "|cff00adef[ChannelFilter]|r Keyword \"|cffff0000%s|r\" has been added into ignore list."; CHANNEL_FILTER_MSG_REMOVED = "|cff00adef[ChannelFilter]|r Keyword \"|cffff0000%s|r\" has been removed from ignore list."; CHANNEL_FILTER_MSG_KEY_NOT_FOUND = "|cff00adef[ChannelFilter]|r Can not find keyword \"|cffff0000%s|r\"。"; CHANNEL_FILTER_MSG_OUT_OF_BOUND = "|cff00adef[ChannelFilter]|r The number does not exist in ignore list."; CHANNEL_FILTER_MSG_ALL_CLEAR = "|cff00adef[ChannelFilter]|r All data in ignore list has been removed."; CHANNEL_FILTER_MSG_ENABLE = "|cff00adef[ChannelFilter]|r Channel Filter On."; CHANNEL_FILTER_MSG_DISABLE = "|cff00adef[ChannelFilter]|r Channel Filter Off"; CHANNEL_FILTER_MSG_USAGE_PINGBI_FUNCTION = "\nFunction: Add words into ignore list to prevent from being shown in channel."; CHANNEL_FILTER_MSG_USAGE_PINGBI_USAGE = "Usage: /guolv|cff00ff00[space]|r+|cff00ff00[space]|r<Ignore words>"; CHANNEL_FILTER_MSG_USAGE_PINGBI_EXAMPLE = "Sample: /guolv + Sell Gold"; CHANNEL_FILTER_MSG_EMPTY_LIST = "|cffff0000The data does not exist.|r"; CHANNEL_FILTER_MSG_LIST_TITLE = "|cffffffffThe follwing are included in ignore list:|r"; CHANNEL_FILTER_MSG_SELECT = "Please input \"/guolv - <No.>\" to delete item in ignore list."; CHANNEL_HELP_TEXT1 = "\n|cffffffffChannel Filter Help:|r"; CHANNEL_HELP_TEXT2 = "/guolv + <words> |cff00ff00Add words into ignore list.|r"; CHANNEL_HELP_TEXT3 = "/guolv - <No.> |cff00ff00Delete keywords.|r"; CHANNEL_HELP_TEXT4 = "/guolv - * |cff00ff00Delete all keywords in ignore list.|r"; CHANNEL_HELP_TEXT5 = "/guolv * |cff00ff00Show keywords in ignore list.|r"; CHANNEL_HELP_TEXT6 = "/guolv on |cff00ff00Enable Channel Filter|r"; CHANNEL_HELP_TEXT7 = "/guolv off |cff00ff00Close Channel Filter|r"; CHANNEL_FILTER_ENABLE_TEXT = "Enable Channel Filter"; CHANNEL_FILTER_TITLE = "Channel Filter"; CHANNEL_FILTER_ADD_TEXT = "Add"; CHANNEL_FILTER_REMOVE_TEXT = "Delete"; CHANNEL_FILTER_REST_TEXT = "Reset"; CHANNEL_FILTER_ADD_WORD_TEXT = "Please type the word you want to ban:"; CHANNEL_FILTER_AUTO_IGNORE_TEXT = "Ignore all messages from this player for a while"; CHANNEL_FILTER_AUTO_IGNORE_DESC = nil ChannelFilter_Config = {}; ChannelFilter_Config.Enabled = 1; ChannelFilter_Config.IgnoreWords = { n = 0 }; ChannelFilter_Config.IgnorePlayer = {}; ChannelFilter_Config.AutoIgnorePlayer = 1; ChannelFilter_NewIgnoreWords_Default = { n = 0 } CHANNEL_FILTER_MUTE_LABEL = "Channel Messages"; CHANNEL_FILTER_MUTE_DESC = "Click to toggle showing channel messages"; end ChannelFilter_5c176ea17920293f9393a0d853cfc2e4 = {}; ChannelFilter_6871a3b1763bbc925b1adeb8fade8acb = {}; StaticPopupDialogs["CHANNEL_FILTER_ADD_WORD"] = { text = CHANNEL_FILTER_ADD_WORD_TEXT, button1 = TEXT(ACCEPT), button2 = TEXT(CANCEL), hasEditBox = 1, maxLetters = 12, OnAccept = function(self) ChannelFilter_31d2b1f6c943bbb6272644a023663342(self.editBox:GetText()); ChannelFilterList_Update(); end, OnShow = function(self) getglobal(self:GetName().."EditBox"):SetFocus(); end, OnHide = function(self) if ( ChatFrameEditBox:IsVisible() ) then ChatFrameEditBox:SetFocus(); end getglobal(self:GetName().."EditBox"):SetText(""); end, EditBoxOnEnterPressed = function(self) local text = self:GetParent().editBox:GetText(); ChannelFilter_31d2b1f6c943bbb6272644a023663342(text); ChannelFilterList_Update(); self:GetParent():Hide(); end, EditBoxOnEscapePressed = function(self) self:GetParent():Hide(); end, timeout = 0, exclusive = 1, whileDead = 1, hideOnEscape = 1 }; function ChannelFilter_cca6e81523d4253f35038608e9e1dae1(ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88) ChatFrame1:AddMessage(ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88, 1.0, 1.0, 0.0); end function ChannelFilter_f4a7ca345e4ea814dd44abaab06a1761(ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae) if ( ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae ) then ChannelFilter_Config.Enabled = 1; BigFoot_SetModVariable("InfoEnhancement", "EnableChannelFilter", 1); ChannelFilter_ReportStatus(); ChannelFilter_UpdateOption(); else ChannelFilter_Config.Enabled = nil; BigFoot_SetModVariable("InfoEnhancement", "EnableChannelFilter", 0); ChannelFilter_ReportStatus(); ChannelFilter_UpdateOption(); end end function ChannelFilter_OnLoad(self) ChannelFilterFrame.last_updated = 0; ModManagement_RegisterMod( "ChannelFilter", "Interface\\Icons\\Ability_Rogue_Disguise", CHANNEL_FILTER_TITLE, "", nil, "ChannelFilterOptionFrame" ); SlashCmdList["GUOLV"] = ChannelFilter_b2f123d7517af7a7d51eca4375d01d8c; SLASH_GUOLV1 = "/guolv"; SLASH_GUOLV2 = "/gl"; SLASH_GUOLV3 = "/过滤"; SLASH_GUOLV4 = "/channelfilter"; SLASH_GUOLV5 = "/filter"; local hooker = BLibrary("BHook"); hooker:Hook("ChatFrame_MessageEventHandler", ChannelFilter_ChatFrame_OnEvent); self:RegisterEvent("ADDON_LOADED"); end function ChannelFilter_OnEvent(self, event, ...) if (event == "ADDON_LOADED") then local addon = ...; if (addon == "ChannelFilter") then ChannelFilter_bfda630401df06fcd17a268bf2416b36(); end end end function ChannelFilter_ReportStatus() if ( ChannelFilter_Config.Enabled ) then ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_ENABLE); else ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_DISABLE); end end function IsNull(str) return (str==nil or str==""); end function ChannelFilter_MatchMessage(str1, str2) if (str1 == str2) then return 100; else return 0; end end function ChannelFilter_ChatFrame_OnEvent(ChannelFilter_7c151c5e4af573821a13320cffbe335b, self, event, ...) if ( ChannelFilter_Config.Enabled ) then local id = self:GetID(); if (id == SELECTED_CHAT_FRAME:GetID()) then local msg, player, _, _, _, _, _, channel_id = ...; local ChannelFilter_49a34e51f5b777fb9f2d3ec8bfc169f2 = UnitName("player"); if (player ~= ChannelFilter_49a34e51f5b777fb9f2d3ec8bfc169f2) then if (event == "CHAT_MSG_TRADESKILLS" and ChannelFilter_Config.mute) then return; end if (event == "CHAT_MSG_CHANNEL" or event == "CHAT_MSG_YELL") then if (((event == "CHAT_MSG_CHANNEL" and channel_id and channel_id ~= 0) or event == "CHAT_MSG_YELL") and ChannelFilter_Config.mute) then return; end if (ChannelFilter_924f23bc0b2494d114e61b77931c2730(arg1)) then return; end end if (event == "CHAT_MSG_CHANNEL" or event == "CHAT_MSG_YELL") then local now = GetTime(); if (now - ChannelFilterFrame.last_updated > 120) then ChannelFilterFrame.last_updated = 0; for k1, v1 in pairs(ChannelFilter_6871a3b1763bbc925b1adeb8fade8acb) do for k2, v2 in ipairs(v1) do if (now - v2["time"] > 120) then table.remove(v2, k2); end end end end local msg, player, _, _, _, _, _, channel_id = ...; if (msg and player) then if (ChannelFilter_6871a3b1763bbc925b1adeb8fade8acb[player]) then for k1, v1 in ipairs(ChannelFilter_6871a3b1763bbc925b1adeb8fade8acb[player]) do if (channel_id and channel_id ~= 0 and now - v1["time"] < 1) then return; end local mv = ChannelFilter_MatchMessage(v1["msg"], msg); if ((mv > 80) and (now - v1["time"] <= 60)) then if (v1["windows"][id]) then return; else v1["windows"][id] = true; end end end end if (not ChannelFilter_6871a3b1763bbc925b1adeb8fade8acb[player]) then ChannelFilter_6871a3b1763bbc925b1adeb8fade8acb[player] = {}; end table.insert(ChannelFilter_6871a3b1763bbc925b1adeb8fade8acb[player], {["msg"] = msg, ["time"] = now, ["windows"] = {[id] = true}}); end end end end end ChannelFilter_7c151c5e4af573821a13320cffbe335b(self, event, ...); end function ChannelFilterMuteButton_OnClick() if (ChannelFilter_Config.mute) then ChannelFilter_Config.mute = false; else ChannelFilter_Config.mute = true; end ChannelFilter_bfda630401df06fcd17a268bf2416b36(); end function ChannelFilter_bfda630401df06fcd17a268bf2416b36() if (ChannelFilter_Config.mute) then ChannelFilterMuteButton:SetNormalTexture("Interface\\AddOns\\ChannelFilter\\artworks\\mute-up"); ChannelFilterMuteButton:SetPushedTexture("Interface\\AddOns\\ChannelFilter\\artworks\\mute-down"); ChannelFilterMuteButton:SetDisabledTexture("Interface\\AddOns\\ChannelFilter\\artworks\\mute-disabled"); else ChannelFilterMuteButton:SetNormalTexture("Interface\\AddOns\\ChannelFilter\\artworks\\normal-up"); ChannelFilterMuteButton:SetPushedTexture("Interface\\AddOns\\ChannelFilter\\artworks\\normal-down"); ChannelFilterMuteButton:SetDisabledTexture("Interface\\AddOns\\ChannelFilter\\artworks\\normal-disabled"); end end function ChannelFilter_924f23bc0b2494d114e61b77931c2730(ChannelFilter_eed0be1c2d5f65980b06b5094460c3c5) local __index; for __index = 1, #ChannelFilter_Config.IgnoreWords, 1 do if ( string.find(ChannelFilter_eed0be1c2d5f65980b06b5094460c3c5, ChannelFilter_Config.IgnoreWords[__index]) ) then return 1; end end end function ChannelFilter_b2f123d7517af7a7d51eca4375d01d8c(ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae) if ( not ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae or ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae == "" ) then ChannelFilter_0900e4822400fb50cfa421dc6b6a0106(); return; end local ChannelFilter_6e4d0db7491d6883f86de390d20dbe5b, ChannelFilter_a2f3972c23a0aa3bd7fb0e9823d918f2, ChannelFilter_934b29c1721e73eb148dc0580ccfb0b6, ChannelFilter_f622c4931a4714cc787b533eaaab65e7, ChannelFilter_7ae7f2ee67d777af9a48ac82a1cdd27b = string.find(ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae, "([^%s]+)(%s*)(.*)"); if ( not ChannelFilter_6e4d0db7491d6883f86de390d20dbe5b ) then ChannelFilter_0900e4822400fb50cfa421dc6b6a0106(); return; end if ( ChannelFilter_934b29c1721e73eb148dc0580ccfb0b6 == "+" or ChannelFilter_934b29c1721e73eb148dc0580ccfb0b6 == "add" ) then ChannelFilter_31d2b1f6c943bbb6272644a023663342(ChannelFilter_7ae7f2ee67d777af9a48ac82a1cdd27b); elseif ( ChannelFilter_934b29c1721e73eb148dc0580ccfb0b6 == "-" or ChannelFilter_934b29c1721e73eb148dc0580ccfb0b6 == "remove" ) then ChannelFilter_0a3b0cbda5450bd05d7c2955e018fd9b(ChannelFilter_7ae7f2ee67d777af9a48ac82a1cdd27b); elseif ( ChannelFilter_934b29c1721e73eb148dc0580ccfb0b6 == "*" or ChannelFilter_934b29c1721e73eb148dc0580ccfb0b6 == "list" ) then ChannelFilter_36b3da8059b22d2587b9522bc0159d52(); elseif ( ChannelFilter_934b29c1721e73eb148dc0580ccfb0b6 == "on" ) then ChannelFilter_f4a7ca345e4ea814dd44abaab06a1761(1); elseif ( ChannelFilter_934b29c1721e73eb148dc0580ccfb0b6 == "off" ) then ChannelFilter_f4a7ca345e4ea814dd44abaab06a1761(); else ChannelFilter_0900e4822400fb50cfa421dc6b6a0106(); end end function ChannelFilter_0900e4822400fb50cfa421dc6b6a0106() ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_HELP_TEXT1); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_HELP_TEXT2); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_HELP_TEXT3); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_HELP_TEXT4); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_HELP_TEXT5); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_HELP_TEXT6); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_HELP_TEXT7); end function ChannelFilter_31d2b1f6c943bbb6272644a023663342(ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae) if ( not ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae or ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae == "" ) then ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_USAGE_PINGBI_FUNCTION); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_USAGE_PINGBI_USAGE); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_USAGE_PINGBI_EXAMPLE); return; end local __index; for __index = 1, #ChannelFilter_Config.IgnoreWords, 1 do if ( ChannelFilter_Config.IgnoreWords[__index] == ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae ) then local ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88 = string.format(CHANNEL_FILTER_MSG_ALREADY_EXIST, ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88); return; end end ChannelFilter_d9a31f63708362057d280f4e78db3ea3(ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae); local ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88 = string.format(CHANNEL_FILTER_MSG_ADDED, ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88); end function ChannelFilter_36e4b551303d04c14eb2146a9605928c() return #ChannelFilter_Config.IgnoreWords; end function ChannelFilter_351c17201185fce926ef0bd074ab66d8() ChannelFilter_Config.IgnoreWords = ChannelFilter_NewIgnoreWords_Default; ChannelFilter_Config.IgnorePlayer = {}; end function ChannelFilter_0a3b0cbda5450bd05d7c2955e018fd9b(ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae) if ( not ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae or ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae == "" ) then ChannelFilter_36b3da8059b22d2587b9522bc0159d52(); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_SELECT); return; end if ( ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae == "*" ) then ChannelFilter_87504618c605f6b2ac5fdbaf8810af00(); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_ALL_CLEAR); return; end local __index = tonumber(ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae); if ( not __index ) then if ( not ChannelFilter_074e10d4da0144099cc8ca2f67cd7a97(ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae) ) then local ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88 = string.format(CHANNEL_FILTER_MSG_KEY_NOT_FOUND, ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88); else local ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88 = string.format(CHANNEL_FILTER_MSG_REMOVED, ChannelFilter_7739b813d90aed43ab9d0eb84ec1c1ae); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88); end return; end if ( __index > #ChannelFilter_Config.IgnoreWords ) then ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_OUT_OF_BOUND); return; end local ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88 = string.format(CHANNEL_FILTER_MSG_REMOVED, ChannelFilter_Config.IgnoreWords[__index]); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(ChannelFilter_c9bd86bc8bc59457d49315cf5b8c5b88); ChannelFilter_893e84a2fc9c86694109792079e8cb68(__index); end function ChannelFilter_36b3da8059b22d2587b9522bc0159d52() local ChannelFilter_3f50417fb16be9b1078eb68d24fa9c26 = #ChannelFilter_Config.IgnoreWords; ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_LIST_TITLE); if ( ChannelFilter_3f50417fb16be9b1078eb68d24fa9c26 == 0 ) then ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_EMPTY_LIST); return; end local __index; for __index = 1, ChannelFilter_3f50417fb16be9b1078eb68d24fa9c26, 1 do ChannelFilter_cca6e81523d4253f35038608e9e1dae1(__index..": |cffff0000"..ChannelFilter_Config.IgnoreWords[__index].."|r"); end return 1; end function ChannelFilter_d9a31f63708362057d280f4e78db3ea3(ChannelFilter_413bf9c15ce77baa8ebf1cda4cbf4887) table.insert(ChannelFilter_Config.IgnoreWords, ChannelFilter_413bf9c15ce77baa8ebf1cda4cbf4887); end function ChannelFilter_893e84a2fc9c86694109792079e8cb68(__index) table.remove(ChannelFilter_Config.IgnoreWords, __index); end function ChannelFilter_074e10d4da0144099cc8ca2f67cd7a97(ChannelFilter_413bf9c15ce77baa8ebf1cda4cbf4887) local ChannelFilter_3f50417fb16be9b1078eb68d24fa9c26 = #ChannelFilter_Config.IgnoreWords; local __index; for __index = 1, ChannelFilter_3f50417fb16be9b1078eb68d24fa9c26, 1 do if ( ChannelFilter_413bf9c15ce77baa8ebf1cda4cbf4887 == ChannelFilter_Config.IgnoreWords[__index] ) then ChannelFilter_893e84a2fc9c86694109792079e8cb68(__index); return 1; end end end function ChannelFilter_83db3bfe22406ceb77f6b9fa06ae4142(__index) return ChannelFilter_Config.IgnoreWords[__index]; end function ChannelFilter_3afa8f44bbcebd4466f2606a4e264c54(__index) ChannelFilter_76d6f12ba3810515a6368ac18850ddac = __index; end function ChannelFilter_ff376af5724fd739f29ed8014d542a7b(__index) return ChannelFilter_76d6f12ba3810515a6368ac18850ddac; end function ChannelFilter_87504618c605f6b2ac5fdbaf8810af00() ChannelFilter_Config.IgnoreWords = { n = 0 }; end function ChannelFilterWordButton_OnClick(self, ChannelFilter_99f3cf2c6f1fdfadb0fd4ab6e0843bf5) ChannelFilter_3afa8f44bbcebd4466f2606a4e264c54(self:GetID()); ChannelFilterList_Update(); end function ChannelFilterList_Update() local ChannelFilter_6a6e9e50c54c6dd20e3a8c58f5cd1de2 = ChannelFilter_36e4b551303d04c14eb2146a9605928c(); local ChannelFilter_47eefd9873494a7ac112542867e34eda = FauxScrollFrame_GetOffset(ChannelFilterScrollFrame); local ChannelFilter_48666c3db4d9f4d39e05d6ea45236773 = ChannelFilter_ff376af5724fd739f29ed8014d542a7b(); local ChannelFilter_910e55c928d53443ec341f365a151493; if (ChannelFilter_48666c3db4d9f4d39e05d6ea45236773 and ChannelFilter_Config.Enabled and ChannelFilter_48666c3db4d9f4d39e05d6ea45236773 <= ChannelFilter_36e4b551303d04c14eb2146a9605928c()) then ChannelFilterRemoveButton:Enable(); else ChannelFilterRemoveButton:Disable(); end for ChannelFilter_e914904fab9d05d3f54d52bfc31a0f3f = 1, 8, 1 do ChannelFilter_910e55c928d53443ec341f365a151493 = ChannelFilter_47eefd9873494a7ac112542867e34eda + ChannelFilter_e914904fab9d05d3f54d52bfc31a0f3f; local ChannelFilter_e6955c64cf39bdb23dc86de1a9ec2117 = ChannelFilter_83db3bfe22406ceb77f6b9fa06ae4142(ChannelFilter_910e55c928d53443ec341f365a151493); getglobal("ChannelFilterWordButton"..ChannelFilter_e914904fab9d05d3f54d52bfc31a0f3f.."ButtonTextName"):SetText(ChannelFilter_e6955c64cf39bdb23dc86de1a9ec2117); ChannelFilter_653ea955459e0e801c4f1325b13556b4 = getglobal("ChannelFilterWordButton"..ChannelFilter_e914904fab9d05d3f54d52bfc31a0f3f); ChannelFilter_653ea955459e0e801c4f1325b13556b4:SetID(ChannelFilter_910e55c928d53443ec341f365a151493); if ( ChannelFilter_910e55c928d53443ec341f365a151493 == ChannelFilter_48666c3db4d9f4d39e05d6ea45236773 and ChannelFilter_Config.Enabled) then ChannelFilter_653ea955459e0e801c4f1325b13556b4:LockHighlight(); else ChannelFilter_653ea955459e0e801c4f1325b13556b4:UnlockHighlight(); end if ( ChannelFilter_910e55c928d53443ec341f365a151493 > ChannelFilter_6a6e9e50c54c6dd20e3a8c58f5cd1de2 ) then ChannelFilter_653ea955459e0e801c4f1325b13556b4:Hide(); else ChannelFilter_653ea955459e0e801c4f1325b13556b4:Show(); end end if (ChannelFilter_Config.Enabled) then FauxScrollFrame_Update(ChannelFilterScrollFrame, ChannelFilter_6a6e9e50c54c6dd20e3a8c58f5cd1de2, 8, 16); else FauxScrollFrame_Update(ChannelFilterScrollFrame, 1, 8, 16); end end function ChannelFilterOptionFrame_OnShow(self) ChannelFilterEnableText:SetText(CHANNEL_FILTER_ENABLE_TEXT); ChannelFilter_UpdateOption(); ChannelFilterAutoIgnoreText:SetText(CHANNEL_FILTER_AUTO_IGNORE_TEXT); ChannelFilterAutoIgnore.tooltip = CHANNEL_FILTER_AUTO_IGNORE_DESC; ChannelFilterBanFloodText:SetText(CHANNEL_FILTER_BAN_FLOOD_TEXT); ChannelFilterBanFloodText.tooltip = CHANNEL_FILTER_BAN_FLOOD_DESC; end function ChannelFilterAddButton_OnClick(self) StaticPopup_Show("CHANNEL_FILTER_ADD_WORD"); end function ChannelFilterOptionFrame_OnHide(self) StaticPopup_Hide("CHANNEL_FILTER_ADD_WORD"); end function ChannelFilterRemoveButton_OnClick(self) local __index = ChannelFilter_ff376af5724fd739f29ed8014d542a7b(); ChannelFilter_0a3b0cbda5450bd05d7c2955e018fd9b(__index); ChannelFilterList_Update(); end function ChannelFilterResetButton_OnClick(self) ChannelFilter_351c17201185fce926ef0bd074ab66d8(); ChannelFilter_cca6e81523d4253f35038608e9e1dae1(CHANNEL_FILTER_MSG_RESET); ChannelFilterList_Update(); end function ChannelFilter_UpdateOption() if (ChannelFilter_Config.Enabled) then ChannelFilterEnable:SetChecked(1); MobElement_Enable(ChannelFilterAutoIgnore); for i = 1, 8, 1 do local ChannelFilter_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ChannelFilterWordButton"..i); local ChannelFilter_e6955c64cf39bdb23dc86de1a9ec2117 = getglobal("ChannelFilterWordButton"..i.."ButtonTextName"); ChannelFilter_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Enable(); ChannelFilter_e6955c64cf39bdb23dc86de1a9ec2117:SetTextColor(1.0, 0.82, 0); end ChannelFilterAddButton:Enable(); if (ChannelFilter_ff376af5724fd739f29ed8014d542a7b()) then ChannelFilterRemoveButton:Enable(); end ChannelFilterResetButton:Enable(); else ChannelFilterEnable:SetChecked(0); MobElement_Disable(ChannelFilterAutoIgnore); for i = 1, 8, 1 do local ChannelFilter_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ChannelFilterWordButton"..i); local ChannelFilter_e6955c64cf39bdb23dc86de1a9ec2117 = getglobal("ChannelFilterWordButton"..i.."ButtonTextName"); ChannelFilter_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Disable(); ChannelFilter_e6955c64cf39bdb23dc86de1a9ec2117:SetTextColor(0.5, 0.5, 0.5); end ChannelFilterAddButton:Disable(); ChannelFilterRemoveButton:Disable(); ChannelFilterResetButton:Disable(); end ChannelFilterList_Update(); if (ChannelFilter_Config.AutoIgnorePlayer) then ChannelFilterAutoIgnore:SetChecked(1); else ChannelFilterAutoIgnore:SetChecked(0); end if (ChannelFilter_Config.BanFlood == nil) then ChannelFilter_Config.BanFlood = true; end if (ChannelFilter_Config.BanFlood) then ChannelFilterBanFlood:SetChecked(1); else ChannelFilterBanFlood:SetChecked(0); end end function ChannelFilterEnable_OnClick(self) if (ChannelFilter_Config.Enabled) then ChannelFilter_Config.Enabled = nil; else ChannelFilter_Config.Enabled = 1; end ChannelFilter_UpdateOption(); end function ChannelFilterAutoIgnore_OnClick(self) if (ChannelFilter_Config.AutoIgnorePlayer) then ChannelFilter_Config.AutoIgnorePlayer = nil; else ChannelFilter_Config.AutoIgnorePlayer = 1; end ChannelFilter_UpdateOption(); end function ChannelFilterBanFlood_OnClick(self) if (ChannelFilter_Config.BanFlood) then ChannelFilter_Config.BanFlood = false; else ChannelFilter_Config.BanFlood = true; end ChannelFilter_UpdateOption(); end
