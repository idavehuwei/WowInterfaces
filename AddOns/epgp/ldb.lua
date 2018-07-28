local mod = EPGP:NewModule("ldb")

local L = LibStub:GetLibrary("AceLocale-3.0"):GetLocale("EPGP")

function mod:StopRecurringAward()
  self.ldb.text = L["Idle"]
end

function mod:RecurringAwardUpdate(event_type, reason, amount, time_left)
  local fmt, val = SecondsToTimeAbbrev(time_left)
  self.ldb.text = string.format(L["Next award in "] .. fmt, val)
end

function mod:OnEnable()
  local LDB = LibStub("LibDataBroker-1.1")
  if not LDB then return end
  if self.ldb then return end

  self.ldb = LDB:NewDataObject(
    "epgp",
    {
      type = "data source",
      text = L["Idle"],
      label = "EPGP",
      OnClick =
        function(self, button)
          if button == "LeftButton" then
            EPGP:ToggleUI()
          else
            InterfaceOptionsFrame_OpenToCategory("EPGP")
          end
        end,
      OnTooltipShow =
        function(tooltip)
          tooltip:AddLine("EPGP")
          tooltip:AddLine(" ")
          tooltip:AddLine("Left-click to toggle the EPGP standings", 0, 1, 0)
          tooltip:AddLine("Right-click to open the EPGP config", 0, 1, 0)
          tooltip:AddLine(" ")
          local status = string.format(
            L["Decay=%s%% BaseGP=%s MinEP=%s Extras=%s%%"],
            "|cFFFFFFFF"..EPGP:GetDecayPercent().."|r",
            "|cFFFFFFFF"..EPGP:GetBaseGP().."|r",
            "|cFFFFFFFF"..EPGP:GetMinEP().."|r",
            "|cFFFFFFFF"..EPGP:GetExtrasPercent().."|r")
          local lines = {strsplit(" ", status)}
          for _, line in pairs(lines) do
            tooltip:AddLine(line)
          end
        end,
    })

  EPGP.RegisterCallback(mod, "StopRecurringAward")
  EPGP.RegisterCallback(mod, "RecurringAwardUpdate")
end
