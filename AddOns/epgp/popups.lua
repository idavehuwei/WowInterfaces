local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")
local GP = LibStub("LibGearPoints-1.0")
local GS = LibStub("LibGuildStorage-1.0")

local function SaveAnchors(t, ...)
  for n=1,select('#', ...) do
    local frame = select(n, ...)
    for i=1,frame:GetNumPoints() do
      local point, relativeTo, relativePoint, x, y = frame:GetPoint(i)
      if point then
        table.insert(t, {frame, point, relativeTo, relativePoint, x, y })
      end
    end
  end
end

local function RestoreAnchors(t)
  for i=1,#t do
    local frame, point, relativeTo, relativePoint, x, y = unpack(t[i])
    frame:SetPoint(point, relativeTo, relativePoint, x, y)
  end
end

local blizzardPopupAnchors = {}

StaticPopupDialogs["EPGP_CONFIRM_GP_CREDIT"] = {
  text = L["Credit GP to %s"],
  button1 = ACCEPT,
  button2 = CANCEL,
  button3 = GUILD_BANK,
  timeout = 0,
  whileDead = 1,
  maxLetters = 16,
  hideOnEscape = 1,
  hasEditBox = 1,
  hasItemFrame = 1,

  OnAccept = function(self)
               local link = self.itemFrame.link
               local gp = tonumber(self.editBox:GetText())
               EPGP:IncGPBy(self.name, link, gp)
             end,

  OnAlt = function(self)
            EPGP:BankItem(self.itemFrame.link)
          end,

  OnShow = function(self, data)
             if not blizzardPopupAnchors[self] then
               blizzardPopupAnchors[self] = {}
               SaveAnchors(blizzardPopupAnchors[self],
                           self.itemFrame, self.editBox, self.button1)
             end

             self.editBox:SetPoint("RIGHT", -55, 0)

             local gp1, gp2 = GP:GetValue(self.itemFrame.link)
             if not gp1 then
               self.editBox:SetText("")
             elseif not gp2 then
               self.editBox:SetText(tostring(gp1))
             else
               self.editBox:SetText(L["%d or %d"]:format(gp1, gp2))
             end
             self.editBox:HighlightText()
           end,

  OnHide = function(self)
             -- Clear anchor points of frames that we modified, and revert them.
             self.itemFrame:ClearAllPoints()
             self.editBox:ClearAllPoints()
             self.button1:ClearAllPoints()

             RestoreAnchors(blizzardPopupAnchors[self])

             if ChatEdit_GetActiveWindow() then
               ChatEdit_FocusActiveWindow()
             end
             self.editBox:SetText("")
           end,

  OnUpdate = function(self, elapsed)
               local link = self.itemFrame.link
               local gp = tonumber(self.editBox:GetText())
               if EPGP:CanIncGPBy(link, gp) then
                 self.button1:Enable()
               else
                 self.button1:Disable()
               end
             end,

  EditBoxOnEnterPressed = function(self)
                            self:GetParent().button1:Click()
                          end,

  EditBoxOnEscapePressed = function(self)
                             self:GetParent():Hide()
                           end
}

StaticPopupDialogs["EPGP_DECAY_EPGP"] = {
  text = L["Decay EP and GP by %d%%?"],
  button1 = ACCEPT,
  button2 = CANCEL,
  timeout = 0,
  hideOnEscape = 1,
  whileDead = 1,
  OnAccept = function()
               EPGP:DecayEPGP()
             end,

  OnUpdate = function(self, elapsed)
               if EPGP:CanDecayEPGP() then
                 self.button1:Enable()
               else
                 self.button1:Disable()
               end
             end,
}

StaticPopupDialogs["EPGP_RESET_EPGP"] = {
  text = L["Reset all main toons' EP and GP to 0?"],
  button1 = ACCEPT,
  button2 = CANCEL,
  timeout = 0,
  hideOnEscape = 1,
  whileDead = 1,
  OnAccept = function()
               EPGP:ResetEPGP()
             end,

  OnUpdate = function(self, elapsed)
               if EPGP:CanResetEPGP() then
                 self.button1:Enable()
               else
                 self.button1:Disable()
               end
             end,
}

StaticPopupDialogs["EPGP_BOSS_DEAD"] = {
  text = L["%s is dead. Award EP?"],
  button1 = ACCEPT,
  button2 = CANCEL,
  timeout = 0,
  whileDead = 1,
  hasEditBox = 1,
  OnAccept = function(self)
               local ep = tonumber(self.editBox:GetText())
               EPGP:IncMassEPBy(self.reason, ep)
             end,

  OnHide = function(self)
             if ChatEdit_GetActiveWindow() then
               ChatEdit_FocusActiveWindow()
             end
             self.editBox:SetText("")
             self.reason = nil
           end,

  OnUpdate = function(self, elapsed)
               local ep = tonumber(self.editBox:GetText())
               if EPGP:CanIncEPBy(self.reason, ep) then
                 self.button1:Enable()
               else
                 self.button1:Disable()
               end
             end,

  EditBoxOnEnterPressed = function(self)
                            self:GetParent().button1:Click()
                          end,

  EditBoxOnEscapePressed = function(self)
                             self:GetParent():Hide()
                           end,
}

StaticPopupDialogs["EPGP_BOSS_ATTEMPT"] = {
  text = L["Wiped on %s. Award EP?"],
  button1 = ACCEPT,
  button2 = CANCEL,
  timeout = 0,
  whileDead = 1,
  hasEditBox = 1,
  OnAccept = function(self)
               local ep = tonumber(self.editBox:GetText())
               EPGP:IncMassEPBy(self.reason .. " (attempt)", ep)
             end,

  OnHide = function(self)
             if ChatEdit_GetActiveWindow() then
               ChatEdit_FocusActiveWindow()
             end
             self.editBox:SetText("")
             self.reason = nil
           end,

  OnUpdate = function(self, elapsed)
               local ep = tonumber(self.editBox:GetText())
               if EPGP:CanIncEPBy(self.reason, ep) then
                 self.button1:Enable()
               else
                 self.button1:Disable()
               end
             end,

  EditBoxOnEnterPressed = function(self)
                            self:GetParent().button1:Click()
                          end,

  EditBoxOnEscapePressed = function(self)
                             self:GetParent():Hide()
                           end,
}

StaticPopupDialogs["EPGP_LOOTMASTER_ASK_TRACKING"] = {
  text = "You are the Loot Master, would you like to use EPGP Lootmaster to distribute loot?\r\n\r\n(You will be asked again next time. Use the configuration panel to change this behaviour)",
  button1 = YES,
  button2 = NO,
  OnAccept = function()
    EPGP:GetModule("lootmaster"):EnableTracking()
    EPGP:Print('You have enabled loot tracking for this raid')
  end,
  OnCancel = function()
    EPGP:GetModule("lootmaster"):DisableTracking()
    EPGP:Print('You have disabled loot tracking for this raid')
  end,
  OnShow = function()
  end,
  OnHide = function()
  end,
  timeout = 0,
  hideOnEscape = 0,
  whileDead = 1,
  showAlert = 1
}

StaticPopupDialogs["EPGP_NEW_VERSION"] = {
  text = "|cFFFFFF00EPGP " .. EPGP.version .. "|r\n" ..
    L["You can now check your epgp standings and loot on the web: http://www.epgpweb.com"], -- /script EPGP.db.profile.last_version = nil
  button1 = OKAY,
  hideOnEscape = 1,
  timeout = 0,
  whileDead = 1,
}

StaticPopupDialogs["EPGP_TRIM_LOG"] = {
  text = L["Are you sure you want to delete log entries older than one month?"],
  button1 = ACCEPT,
  button2 = CANCEL,
  timeout = 0,
  hideOnEscape = 1,
  whileDead = 1,

  OnAccept = function()
    EPGP:GetModule("log"):TrimToOneMonth()
  end,
}
