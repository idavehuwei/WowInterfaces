local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")
local GP = LibStub("LibGearPoints-1.0")
local Debug = LibStub("LibDebug-1.0")

function EPGP:SetupOptions()
  local options = {
    name = "EPGP",
    type = "group",
    childGroups = "tab",
    handler = self,
    args = {
      help = {
        order = 1,
        type = "description",
        name = L["EPGP is an in game, relational loot distribution system"],
      },
      hint = {
        order = 2,
        type = "description",
        name = L["Hint: You can open these options by typing /epgp config"],
      },
      list_errors = {
        order = 1000,
        type = "execute",
        name = L["List errors"],
        desc = L["Lists errors during officer note parsing to the default chat frame. Examples are members with an invalid officer note."],
        func = function()
                 outputFunc = function(s) DEFAULT_CHAT_FRAME:AddMessage(s) end
                 EPGP:ReportErrors(outputFunc)
               end,
      },
      reset = {
        order = 1001,
        type = "execute",
        name = L["Reset EPGP"],
        desc = L["Resets EP and GP of all members of the guild. This will set all main toons' EP and GP to 0. Use with care!"],
        func = function() StaticPopup_Show("EPGP_RESET_EPGP") end,
      },
    },
  }

  local registry = LibStub("AceConfigRegistry-3.0")
  registry:RegisterOptionsTable("EPGP Options", options)

  local dialog = LibStub("AceConfigDialog-3.0")
  dialog:AddToBlizOptions("EPGP Options", "EPGP")

  -- Setup options for each module that defines them.
  for name, m in self:IterateModules() do
    if m.optionsArgs then
      -- Set all options under this module as disabled when the module
      -- is disabled.
      for n, o in pairs(m.optionsArgs) do
        if o.disabled then
          local old_disabled = o.disabled
          o.disabled = function(i)
                         return old_disabled(i) or m:IsDisabled()
                       end
        else
          o.disabled = "IsDisabled"
        end
      end
      -- Add the enable/disable option.
      m.optionsArgs.enabled = {
        order = 0,
        type = "toggle",
        width = "full",
        name = ENABLE,
        get = "IsEnabled",
        set = "SetEnabled",
      }
    end
    if m.optionsName then
      registry:RegisterOptionsTable("EPGP " .. name, {
                                      handler = m,
                                      order = 100,
                                      type = "group",
                                      name = m.optionsName,
                                      desc = m.optionsDesc,
                                      args = m.optionsArgs,
                                      get = "GetDBVar",
                                      set = "SetDBVar",
                                    })
      dialog:AddToBlizOptions("EPGP " .. name, m.optionsName, "EPGP")
    end
  end

  EPGP:RegisterChatCommand("epgp", "ProcessCommand")
end

function EPGP:ProcessCommand(str)
  str = str:gsub("%%t", UnitName("target") or "notarget")
  local command, nextpos = self:GetArgs(str, 1)
  if command == "config" then
    InterfaceOptionsFrame_OpenToCategory("EPGP")
  elseif command == "debug" then
    Debug:Toggle()
  elseif command == "massep" then
    local reason, amount = self:GetArgs(str, 2, nextpos)
    amount = tonumber(amount)
    if self:CanIncEPBy(reason, amount) then
      self:IncMassEPBy(reason, amount)
    end
  elseif command == "ep" then
    local member, reason, amount = self:GetArgs(str, 3, nextpos)
    amount = tonumber(amount)
    if self:CanIncEPBy(reason, amount) then
      self:IncEPBy(member, reason, amount)
    end
  elseif command == "gp" then
    local member, itemlink, amount = self:GetArgs(str, 3, nextpos)
    self:Print(member, itemlink, amount)
    if amount then
      amount = tonumber(amount)
    else
      local gp1, gp2 = GP:GetValue(itemlink)
      self:Print(gp1, gp2)
      -- Only automatically fill amount if we have a single GP value.
      if gp1 and not gp2 then
        amount = gp1
      end
    end

    if self:CanIncGPBy(itemlink, amount) then
      self:IncGPBy(member, itemlink, amount)
    end
  elseif command == "decay" then
    if EPGP:CanDecayEPGP() then
      StaticPopup_Show("EPGP_DECAY_EPGP", EPGP:GetDecayPercent())
    end
  elseif command == "help" then
    local help = {
      self.version,
      "   config - "..L["Open the configuration options"],
      "   debug - "..L["Open the debug window"],
      "   massep <reason> <amount> - "..L["Mass EP Award"],
      "   ep <name> <reason> <amount> - "..L["Award EP"],
      "   gp <name> <itemlink> [<amount>] - "..L["Credit GP"],
      "   decay - "..L["Decay of EP/GP by %d%%"]:format(EPGP:GetDecayPercent()),
    }
    EPGP:Print(table.concat(help, "\n"))
  else
    EPGP:ToggleUI()
  end
end

function EPGP:ToggleUI()
  if EPGPFrame and IsInGuild() then
    if EPGPFrame:IsShown() then
      HideUIPanel(EPGPFrame)
    else
      ShowUIPanel(EPGPFrame)
    end
  end
end
