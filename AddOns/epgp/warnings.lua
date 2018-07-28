local mod = EPGP:NewModule("warnings", "AceHook-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")

StaticPopupDialogs["EPGP_OFFICER_NOTE_WARNING"] = {
  text = L["EPGP is using Officer Notes for data storage. Do you really want to edit the Officer Note by hand?"],
  button1 = YES,
  button2 = NO,
  timeout = 0,
  OnAccept = function(self)
               self:Hide()
               mod.hooks[GuildMemberOfficerNoteBackground]["OnMouseUp"]()
             end,
  whileDead = 1,
  hideOnEscape = 1,
  showAlert = 1,
  enterClicksFirstButton = 1,
}

StaticPopupDialogs["EPGP_MULTIPLE_MASTERS_WARNING"] = {
  text = L["Make sure you are the only person changing EP and GP. If you have multiple people changing EP and GP at the same time, for example one awarding EP and another crediting GP, you *are* going to have data loss."],
  button1 = OKAY,
  showAlert = 1,
  enterClicksFirstButton = 1,
  timeout = 15,
}

mod.dbDefaults = {
  profile = {
    enabled = true,
  }
}

function mod:OnEnable()
  local function officer_note_warning()
    StaticPopup_Show("EPGP_OFFICER_NOTE_WARNING")
  end

  if GuildMemberOfficerNoteBackground and
     GuildMemberOfficerNoteBackground:HasScript("OnMouseUp") then
    self:RawHookScript(GuildMemberOfficerNoteBackground, "OnMouseUp",
                       officer_note_warning)
  end

  local events_for_multiple_masters_warning = {
    "StartRecurringAward",
    "EPAward",
    "GPAward",
  }

  -- We want to show this warning just once.
  local function multiple_masters_warning()
    StaticPopup_Show("EPGP_MULTIPLE_MASTERS_WARNING")
    for _, event in pairs(events_for_multiple_masters_warning) do
      EPGP.UnregisterCallback(self, event)
    end
  end

  for _, event in pairs(events_for_multiple_masters_warning) do
    EPGP.RegisterCallback(self, event, multiple_masters_warning)
  end
end
