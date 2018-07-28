local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")
local GS = LibStub("LibGuildStorage-1.0")
local Debug = LibStub("LibDebug-1.0")

local callbacks = EPGP.callbacks

local frame = CreateFrame("Frame", "EPGP_RecurringAwardFrame")
local timeout = 0
local function RecurringTicker(self, elapsed)
  -- EPGP's db is available after GUILD_ROSTER_UPDATE. So we have a
  -- guard.
  if not EPGP.db then return end

  local vars = EPGP.db.profile
  local now = GetTime()
  if now > vars.next_award and GS:IsCurrentState() then
    EPGP:IncMassEPBy(vars.next_award_reason, vars.next_award_amount)
    vars.next_award =
      vars.next_award + vars.recurring_ep_period_mins * 60
  end
  timeout = timeout + elapsed
  if timeout > 0.5 then
    callbacks:Fire("RecurringAwardUpdate",
                   vars.next_award_reason,
                   vars.next_award_amount,
                   vars.next_award - now)
    timeout = 0
  end
end
frame:SetScript("OnUpdate", RecurringTicker)
frame:Hide()

function EPGP:StartRecurringEP(reason, amount)
  local vars = EPGP.db.profile
  if vars.next_award then
    return false
  end

  vars.next_award_reason = reason
  vars.next_award_amount = amount
  vars.next_award = GetTime() + vars.recurring_ep_period_mins * 60
  frame:Show()

  callbacks:Fire("StartRecurringAward",
                 vars.next_award_reason,
                 vars.next_award_amount,
                 vars.recurring_ep_period_mins)
  return true
end

StaticPopupDialogs["EPGP_RECURRING_RESUME"] = {
  text = "%s",
  button1 = YES,
  button2 = NO,
  timeout = 0,
  hideOnEscape = 1,
  whileDead = 1,
  OnAccept = function()
               callbacks:Fire("ResumeRecurringAward",
                              EPGP.db.profile.next_award_reason,
                              EPGP.db.profile.next_award_amount,
                              EPGP.db.profile.recurring_ep_period_mins)
               frame:Show()
             end,
  OnCancel = function(self, data, reason)
               if reason ~= "override" then
                 EPGP:StopRecurringEP()
               end
             end,
}

function EPGP:ResumeRecurringEP()
  local vars = EPGP.db.profile

  local period_secs = vars.recurring_ep_period_mins * 60
  local timeout = vars.next_award + period_secs - GetTime()
  StaticPopupDialogs["EPGP_RECURRING_RESUME"].timeout = timeout

  StaticPopup_Show(
    "EPGP_RECURRING_RESUME",
    -- We need to do the formatting here because static popups do
    -- not allow for 3 arguments to the formatting function.
    L["Do you want to resume recurring award (%s) %d EP/%s?"]:format(
      vars.next_award_reason,
      vars.next_award_amount,
      EPGP:RecurringEPPeriodString()))
end

function EPGP:CanResumeRecurringEP()
  local vars = EPGP.db.profile
  local now = GetTime()
  if not vars.next_award then return false end

  local period_secs = vars.recurring_ep_period_mins * 60
  local last_award = vars.next_award - period_secs
  local next_next_award = vars.next_award + period_secs
  if last_award < now and now < next_next_award then
    return true
  end
  return false
end

function EPGP:CancelRecurringEP()
  StaticPopup_Hide("EPGP_RECURRING_RESUME")
  local vars = EPGP.db.profile
  vars.next_award_reason = nil
  vars.next_award_amount = nil
  vars.next_award = nil
  frame:Hide()
end

function EPGP:StopRecurringEP()
  self:CancelRecurringEP()

  callbacks:Fire("StopRecurringAward")
  return true
end

function EPGP:RunningRecurringEP()
  local vars = EPGP.db.profile
  return not not vars.next_award
end

function EPGP:RecurringEPPeriodMinutes(val)
  local vars = EPGP.db.profile
  if val == nil then
    return vars.recurring_ep_period_mins
  end
  vars.recurring_ep_period_mins = val
end

function EPGP:RecurringEPPeriodString()
  local vars = EPGP.db.profile
  local fmt, val = SecondsToTimeAbbrev(vars.recurring_ep_period_mins * 60)
  return fmt:format(val)
end
