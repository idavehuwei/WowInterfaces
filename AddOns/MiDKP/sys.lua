local M = MiDKP M.S={} function M.S:DoRaidHook() MiDKP3Frame:RegisterEvent("CHAT_MSG_LOOT") MiDKP3Frame:RegisterEvent("ZONE_CHANGED_NEW_AREA") MiDKP3Frame:RegisterEvent("RAID_ROSTER_UPDATE") MiDKP3Frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED","UNIT_DIED") MiDKP3Frame:RegisterEvent("CHAT_MSG_MONSTER_YELL") MiDKP3Frame:RegisterEvent("CHAT_MSG_MONSTER_EMOTE") MiDKP3Frame:RegisterEvent("LOOT_OPENED") MiDKP3Frame:RegisterEvent("PLAYER_REGEN_ENABLED") MiDKP3Frame:RegisterEvent("PLAYER_REGEN_DISABLED") MiDKP3Frame:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT") end function M.S.DoRaidUnhook() MiDKP3Frame:UnregisterEvent("CHAT_MSG_LOOT") MiDKP3Frame:UnregisterEvent("ZONE_CHANGED_NEW_AREA") MiDKP3Frame:UnregisterEvent("RAID_ROSTER_UPDATE") MiDKP3Frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED") MiDKP3Frame:UnregisterEvent("CHAT_MSG_MONSTER_YELL") MiDKP3Frame:UnregisterEvent("CHAT_MSG_MONSTER_EMOTE") MiDKP3Frame:UnregisterEvent("LOOT_OPENED") MiDKP3Frame:UnregisterEvent("PLAYER_REGEN_ENABLED") MiDKP3Frame:UnregisterEvent("PLAYER_REGEN_DISABLED") MiDKP3Frame:UnregisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT") end function M.S:DoHook() M.U:Print("info",M.L.GREETING_INFO,GetAddOnMetadata("MiDKP","Version")) SlashCmdList["MiDKP"] = M.E.H.SlashCommand self.ErrorHandler_Ori = geterrorhandler() seterrorhandler(self.ErrorHandler) M.E.H.ChatFrameMsg_ORI= M.E.H.ChatFrameMsg_ORI or ChatFrame_MessageEventHandler ChatFrame_MessageEventHandler=M.E.H.ChatFrameMsg M.S.SetItemRef_ORI= M.S.SetItemRef_ORI or SetItemRef SetItemRef=M.S.SetItemRef M.S.ChatEditInsertLink_ORI= M.S.ChatEditInsertLink_ORI or ChatEdit_InsertLink ChatEdit_InsertLink=M.S.ChatEditInsertLink if M.HasLDB and M.DO.Config:GetConfig("show_minimap_icon")<1 then MiDKP3MiniButton:Hide() else MiDKP3MiniButton:Show() end MiDKP3Frame:RegisterEvent("CHAT_MSG_WHISPER") MiDKP3Frame:RegisterEvent("PLAYER_LEAVING_WORLD") end function M.S:DoUnhook() SlashCmdList["MiDKP"] = nil ChatFrame_MessageEventHandler=M.E.H.ChatFrameMsg_ORI or ChatFrame_MessageEventHandler SetItemRef=M.S.SetItemRef_ORI or SetItemRef ChatEdit_InsertLink=M.S.ChatEditInsertLink_ORI or ChatEdit_InsertLink seterrorhandler(self.ErrorHandler_Ori) MiDKP3MiniButton:Hide() MiDKP3Frame:UnregisterEvent("CHAT_MSG_WHISPER") MiDKP3Frame:UnregisterEvent("PLAYER_LEAVING_WORLD") end function M.S:LDBReg() if not LibStub then return end local hasLDB,LDB = pcall(function() return LibStub:GetLibrary("LibDataBroker-1.1") end); if not hasLDB then return end M.HasLDB = true LDB:NewDataObject("MiDKP", { type = "launcher", icon = [[Interface\AddOns\MiDKP\img\icon]], OnClick = function(frame,button) if button=="RightButton" then if MiDKP3MiniButton:IsShown() then MiDKP3MiniButton:Hide() M.DO.Config:SetConfig("show_minimap_icon",0) else MiDKP3MiniButton:Show() M.DO.Config:SetConfig("show_minimap_icon",1) end else M.UI.Frame:Toggle() end end, OnTooltipShow = function(self) self:AddLine(M.L.ADDON_TITLE) self:AddLine(M.L.LDBTOOLTIP1) self:AddLine(M.L.LDBTOOLTIP2) end }) end function M.S:BigFootReg() ModManagement_RegisterCheckBox( "MiDKP", M.L.ADDON_ENABLE, nil, "MiDKPEnable", 0, function (arg) if (arg == 1 and not MiDKP_e60e25d6b953188ad3c52f917a45f7b8) then MiDKP_e60e25d6b953188ad3c52f917a45f7b8 = 1; if (not MiDKP_6581b65a15732c47fbd26c267d2abd87) then self:DoHook() M.UI.Frame:OnAddOnLoaded() MiDKP_6581b65a15732c47fbd26c267d2abd87 = true; end elseif (arg == 0 and MiDKP_e60e25d6b953188ad3c52f917a45f7b8) then self:DoUnhook(); MiDKP_6581b65a15732c47fbd26c267d2abd87=false; MiDKP_e60e25d6b953188ad3c52f917a45f7b8 = nil; end end ); end function M.S.SetItemRef(link,text,button,...) local panel = _G.MiDKP3EditPanel local panelText = _G.MiDKP3EditPanelText if (panel and panel:IsVisible() and panelText:HasFocus()) then local _, MiDKP_15ad1e501e228eb80be1cc7800ab967d= GetItemInfo(link) if MiDKP_15ad1e501e228eb80be1cc7800ab967d then if M.U:FindItemLink(panelText:GetText()) then return end panelText:SetText(panelText:GetText()..MiDKP_15ad1e501e228eb80be1cc7800ab967d) else M.S.SetItemRef_ORI(link, text, button,...) end else M.S.SetItemRef_ORI(link, text, button,...) end end function M.S.ChatEditInsertLink(text) local panel = _G.MiDKP3EditPanel local panelText = _G.MiDKP3EditPanelText if (panel and panel:IsVisible() and panelText:HasFocus()) then if M.U:FindItemLink(panelText:GetText()) then return false end panelText:SetText(panelText:GetText()..text) return true; else return M.S.ChatEditInsertLink_ORI(text) end end function M.S.SaveError(msg) MiDKP3_Config = MiDKP3_Config or {} MiDKP3_Config.Log = MiDKP3_Config.Log or {} MiDKP3_Config.Log[msg] = M.U:GetTimeStamp()[1] end function M.S.ErrorHandler(message) local function isMiDKP (msg) local MiDKP_6e4d0db7491d6883f86de390d20dbe5b, MiDKP_a2f3972c23a0aa3bd7fb0e9823d918f2, MiDKP_1652701c940a7445a6e43b954d36ec9b = string.find(msg, "\\AddOns\\(%w+)\\"); if MiDKP_1652701c940a7445a6e43b954d36ec9b =="MiDKP" then return true end return false end local function findError(msg) local _,content = string.match(msg, ":(%d+):(.*)") return content end if isMiDKP(message) then M.U:Print("error",findError(message)) M.U:Debug(debugstack()) M.S.SaveError(debugstack()) else M.S.ErrorHandler_Ori(message) end end 
