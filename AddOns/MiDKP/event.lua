MiDKP=MiDKP or {} local M = MiDKP local info = select(4,GetBuildInfo()) M.E={} M.E.ErrorList={} M.E.EventList={} function M.E:Assert(MiDKP_c947a4fd43f33304666b2655fad74dbf,MiDKP_d19c45ccfeb67ac4ec8851203c94e263,...) if not MiDKP_c947a4fd43f33304666b2655fad74dbf then self:ThrowError(MiDKP_d19c45ccfeb67ac4ec8851203c94e263,...) end end function M.E:ThrowError(MiDKP_d19c45ccfeb67ac4ec8851203c94e263,...) local entity = ... local name = type(entity)=='table' and entity:GetName() if M.L["ERROR_"..MiDKP_d19c45ccfeb67ac4ec8851203c94e263] then error(string.format(M.L["ERROR_"..MiDKP_d19c45ccfeb67ac4ec8851203c94e263],name or entity)) else error(M.L.UNDEFINED_ERROR) end end function M.E:RegisterEvent(MiDKP_d0708241b607c9a9dd1953c812fadfb7,handle) if (not self.EventList[MiDKP_d0708241b607c9a9dd1953c812fadfb7]) then self.EventList[MiDKP_d0708241b607c9a9dd1953c812fadfb7] = {}; end table.insert(self.EventList[MiDKP_d0708241b607c9a9dd1953c812fadfb7], handle); end function M.E:UnregisterEvent(MiDKP_d0708241b607c9a9dd1953c812fadfb7) self.EventList[MiDKP_d0708241b607c9a9dd1953c812fadfb7] = {}; end function M.E:FireEvent(MiDKP_d0708241b607c9a9dd1953c812fadfb7,...) if M.L["INFO_"..MiDKP_d0708241b607c9a9dd1953c812fadfb7] then local entity = ... M.U:Print("info",M.L["INFO_"..MiDKP_d0708241b607c9a9dd1953c812fadfb7], entity and (entity.GetName and entity:GetName()) or entity) end if (self.EventList[MiDKP_d0708241b607c9a9dd1953c812fadfb7]) then for _, MiDKP_04c0600c1b894c6808bccb7243e44859 in ipairs(self.EventList[MiDKP_d0708241b607c9a9dd1953c812fadfb7]) do MiDKP_04c0600c1b894c6808bccb7243e44859(...); end end end function M.E:Init() M.U:Debug("Events Inited") M.E:RegisterEvent("ITEM_NEW_SPLIT" ,M.DO.Event .OnNewSplitItem) M.E:RegisterEvent("ITEM_MODIFY_SPLIT" ,M.DO.Event .OnModifySplitItem) M.E:RegisterEvent("ITEM_DELETE_SPLIT" ,M.DO.Event .OnDelSplitItem) M.E:RegisterEvent("EVENT_DELETE_SPLIT" ,M.DO.Item .OnDelSplitEvent) M.E:RegisterEvent("RAID_SELECTED" ,M.UI.Raid .OnSelectedRaidChange) M.E:RegisterEvent("BUTTON_SELECTED" ,M.Widget.Panel.OnSelectedButtonChange) M.E:RegisterEvent("BUTTON_TOGGLED" ,M.UI.Page.EntityToggle) M.E:RegisterEvent("ENTITY_DELETED" ,M.UI.Page.OnButtonDeleted) M.E:RegisterEvent("EVENT_NEW_SYS" ,M.UI.NotifyList.OnNewEvent) M.E:RegisterEvent("ITEM_NEW_SYS" ,M.UI.NotifyList.OnNewItem) M.E:RegisterEvent("POINT_MODIFIED" ,M.DO.Member.UpdateMemberPoint) M.E:RegisterEvent("RAID_ACTIVATED" ,M.UI.Page.OnRaidActivated) M.E:RegisterEvent("MEMBER_DELETED" ,M.DO.Member.OnMemberDeleted) end function M.E:ClearEvents() M.E:UnregisterEvent("ITEM_NEW_SPLIT") M.E:UnregisterEvent("ITEM_MODIFY_SPLIT") M.E:UnregisterEvent("ITEM_DELETE_SPLIT") M.E:UnregisterEvent("EVENT_DELETE_SPLIT") M.E:UnregisterEvent("RAID_SELECTED") M.E:UnregisterEvent("RAID_STARTED") M.E:UnregisterEvent("RAID_ACTIVATED") M.E:UnregisterEvent("RAID_ENDED") M.E:UnregisterEvent("BUTTON_SELECTED") M.E:UnregisterEvent("ENTITY_DELETED") end M.E.H={} function M.E.H:ChatMsgLoot(...) local arg1 = ... local player, itemLink,itemString = M.U:GetItemLink(arg1) if (not itemLink) then return end local member local name, link, quality = GetItemInfo(itemLink) if (name and quality) then if M.DO.Config:IsIgnoredItem(name) then return end if (quality >= M.DO.Config:GetConfig("item_quality") + 1) or M.Debug then member = M.Data.Members:Find(player) M.E:Assert(member,"MEMBER_NOT_IN_LIST",player) M.DO.Notify:AddItemEvent(itemString,member) end end end function M.E.H:ZoneChange() M.U:Debug("Zone Changed") local zone = M.OO.Zone:Find( GetRealZoneText()) if (zone and M.Data.Raid and M.Data.Raid:IsRaidValid()) then M.U:Debug("Zone Added") M.Data.Raid:AddPlace(zone) end end function M.E.H:RaidUpdate() if M.DO.Raid:IsRunning() then M.DO.Raid:UpdateMembers(true) end end function M.E.H:MonsterEmote(...) local msg = ... local boss = M.OO.Boss:GetByEmote(msg) if boss then M.DO.Notify:AddBossEvent(boss) end end function M.E.H:ChatMessage(...) local msg, player = ... if not M.DO.Config:GetConfig('whisper_enable') then return end local member = M.DO.Member:FindPlayer(player) if not member then return end local printType,val = M.DO.Chat:ParseCommand(msg) if printType then M.U:Debug("Command Type: "..printType) M.DO.Chat:DoSend(printType,member,not M.DO.Config:GetConfig("hide_whisper_reply"),val) end end function M.E.H:AddonLoaded(...) M.S:LDBReg() if not (ModManagement_RegisterMod) then M.S:DoHook() M.UI.Frame:OnAddOnLoaded() return else M.S:BigFootReg() end end function M.E.H:CombatLog(...) local timestamp,event,hideCaster,sourceGUID,sourceName,sourceFlags,sourceFlags2,destGUID,destName,destFlags,destFlags2,auraId, auraName; if info >=40200 then timestamp,event,hideCaster,sourceGUID,sourceName,sourceFlags,sourceFlags2,destGUID,destName,destFlags,destFlags2,auraId, auraName = ...; else timestamp,event,hideCaster,sourceGUID,sourceName,sourceFlags,destGUID,destName,destFlags,auraId, auraName = ...; end if (event == "UNIT_DIED") then if (destName) then local zone = M.OO.Zone:Find( GetRealZoneText()) if not zone then return end local boss = M.OO.Boss:Find(zone,destName) if boss then self.tempBoss = nil M.DO.Notify:AddBossEvent(boss) return end if self.tempBoss then boss = self.tempBoss else boss = M.OO.Boss:FindMultiKill(zone,destName) if not boss then return end self.tempBoss = boss end boss:AddMultiKill(destName) if boss:DoneMultiKill() then M.DO.Notify:AddBossEvent(boss) self.tempBoss = nil end end end end function M.E.H.ChatFrameMsg(ui,event,...) local msg, sender = ... if (msg and sender) then local id = msg .. ":" .. sender if (event == "CHAT_MSG_AFK" or event == "CHAT_MSG_DND") then if (MiDKP_AFKDND[sender]) then return end end if (event == "CHAT_MSG_WHISPER_INFORM" and MiDKP_HiddenWhisper[id] and M.DO.Config:GetConfig("hide_whisper_reply") ) then return end end M.E.H.ChatFrameMsg_ORI(ui,event, ...) end function M.E.H.SlashCommand(cmd,editbox) M.UI.Frame:Toggle() end function M.E.H:StartEndFight() if self.currentBoss then if not UnitExists("boss1") or UnitHealth("boss1")/UnitHealthMax("boss1")<0.01 then local boss = M.OO.Boss:Create() boss:SetName(self.currentBoss) M.DO.Notify:AddBossEvent(boss) end end end function M.E.H:StartSpecicalBoss() self.currentBoss = nil local bossName = UnitName("boss1") local bossTable = M.Bosses.bosses.special if UnitExists("boss1") then if bossTable and bossTable[bossName] then self.currentBoss = bossName end end end 
