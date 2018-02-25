SellJunk = LibStub("AceAddon-3.0"):NewAddon("SellJunk", "AceConsole-3.0", "AceEvent-3.0")
local addon = LibStub("AceAddon-3.0"):GetAddon("SellJunk")
local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local addonName, addonTable = ...
local L = addonTable.L

addon.optionsFrame = {}
local options = nil

addon.sellButton = CreateFrame("Button", nil, MerchantFrame, "OptionsButtonTemplate")
addon.sellButton:SetPoint("TOPRIGHT", -41, -40)
addon.sellButton:SetText(L["Sell Junk"])
addon.sellButton:SetScript("OnClick", function() SellJunk:Sell() end)

-- upvalues
local floor = floor
local mod = mod
local string_find = string.find
local pairs = pairs
local wipe = wipe
local DeleteCursorItem = DeleteCursorItem
local GetContainerItemInfo = GetContainerItemInfo
local GetItemInfo = GetItemInfo
local PickupContainerItem = PickupContainerItem
local PickupMerchantItem = PickupMerchantItem

function addon:OnInitialize()
    self:RegisterChatCommand("selljunk", "HandleSlashCommands")
    self:RegisterChatCommand("sj", "HandleSlashCommands")

    self.db = LibStub("AceDB-3.0"):New("SellJunkDB")
    self.db:RegisterDefaults({
        char = {
            auto = true,
            max12 = false,
            printGold = true,
            showSpam = true
        },
        global = {
            exceptions = {},
        }
    })

    self:PopulateOptions()
    AceConfigRegistry:RegisterOptionsTable("SellJunk", options)
    addon.optionsFrame = AceConfigDialog:AddToBlizOptions("SellJunk", nil, nil, "general")
end

function addon:OnEnable()
    self:RegisterEvent("MERCHANT_SHOW")
    self.total = 0
end

function addon:MERCHANT_SHOW()
    if addon.db.char.auto then
        self:Sell()
    end
end

function addon:AddProfit(profit)
    if profit then
        self.total = self.total + profit
    end
end

-------------------------------------------------------------
-- Sells items:                                            --
-- - grey quality, unless it's in exception list         --
-- - better than grey quality, if it's in exception list --
-------------------------------------------------------------
function addon:Sell()
    local limit = 0
    local currPrice
    local showSpam = addon.db.char.showSpam
    local max12 = addon.db.char.max12

    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local item = GetContainerItemLink(bag, slot)
            if item then
                -- is it grey quality item?
                local grey = string_find(item, "|cff9d9d9d")

                if (grey and (not addon:isException(item))) or ((not grey) and (addon:isException(item))) then
                    currPrice = select(11, GetItemInfo(item)) * select(2, GetContainerItemInfo(bag, slot))
                    -- this should get rid of problems with grey items, that cant be sell to a vendor
                    if currPrice > 0 then
                        addon:AddProfit(currPrice)
                        PickupContainerItem(bag, slot)
                        PickupMerchantItem()
                        if showSpam then
                            self:Print(L["Sold"] .. ": " .. item)
                        end

                        if max12 then
                            limit = limit + 1
                            if limit == 12 then
                                return
                            end
                        end
                    end
                end
            end
        end
    end

    if self.db.char.printGold then
        self:PrintGold()
    end
    self.total = 0
end

-------------------------------------------------------------
-- Destroys items:                                         --
-- - grey quality, unless it's in exception list         --
-- - better than grey quality, if it's in exception list --
-------------------------------------------------------------
function addon:Destroy(count)
    local limit = 9001 -- it's over NINE THOUSAND!!!
    if count ~= nil then
        limit = count
    end

    local showSpam = addon.db.char.showSpam

    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local item = GetContainerItemLink(bag, slot)
            if item then
                -- is it grey quality item?
                local grey = string_find(item, "|cff9d9d9d")

                if (grey and (not addon:isException(item))) or ((not grey) and (addon:isException(item))) then
                    PickupContainerItem(bag, slot)
                    DeleteCursorItem()
                    if showSpam then
                        self:Print(L["Destroyed"] .. ": " .. item)
                    end
                    limit = limit - 1
                    if limit == 0 then
                        break
                    end
                end
            end
        end
        if limit == 0 then
            break
        end
    end

    if self.db.char.printGold then
        self:PrintGold()
    end
    self.total = 0
end

function addon:PrintGold()
    local ret = ""
    local gold = floor(self.total / (COPPER_PER_SILVER * SILVER_PER_GOLD));
    local silver = floor((self.total - (gold * COPPER_PER_SILVER * SILVER_PER_GOLD)) / COPPER_PER_SILVER);
    local copper = mod(self.total, COPPER_PER_SILVER);
    if gold > 0 then
        ret = gold .. " " .. L["gold"] .. " "
    end
    if silver > 0 or gold > 0 then
        ret = ret .. silver .. " " .. L["silver"] .. " "
    end
    ret = ret .. copper .. " " .. L["copper"]
    if silver > 0 or gold > 0 or copper > 0 then
        self:Print(L["Gained"] .. ": " .. ret)
    end
end

function addon:Add(link)

    -- remove all trailing whitespace
    link = strtrim(link)

    -- extract name from an itemlink
    local found, _, name = string_find(link, "^|c%x+|H.+|h.(.*)\].+")

    -- if it's not an itemlink, guess it's name of an item
    if not found then
        name = link
    end

    local exceptions = self.db.global.exceptions
    for k, v in pairs(exceptions) do
        if v == name or v == link then
            return
        end
    end

    -- append name of the item to global exception list
    exceptions[#exceptions + 1] = name
    self:Print(L["Added"] .. ": " .. link)
end

function addon:Rem(link)
    -- remove all trailing whitespace
    link = strtrim(link)

    -- extract name from an itemlink
    local isLink, _, name = string_find(link, "^|c%x+|H.+|h.(.*)\].+")

    -- if it's not an itemlink, guess it's name of an item
    if not isLink then
        name = link
    end

    -- looping through exceptions
    local found = false
    local exception
    local exceptions = self.db.global.exceptions
    for k, v in pairs(exceptions) do
        found = false
        -- comparing exception list entry with given name
        if v:lower() == name:lower() then
            found = true
        end

        -- extract name from itemlink (only for compatibility with old saved variables)
        isLink, _, exception = string_find(v, "^|c%x+|H.+|h.(.*)\].+")
        if isLink then
            -- comparing exception list entry with given name
            if exception:lower() == name:lower() then
                found = true
            end
        end

        if found then
            if exceptions[k + 1] then
                exceptions[k] = exceptions[k + 1]
            else
                exceptions[k] = nil
            end
            self:Print(L["Removed"] .. ": " .. link)
            break
        end
    end
end

function addon:isException(link)
    local exception = nil

    -- extracting name of an item from the itemlink
    local isLink, _, name = string_find(link, "^|c%x+|H.+|h.(.*)\].+")

    -- it's not an itemlink, so guess it's name of the item
    if not isLink then
        name = link
    end

    local exceptions = self.db.global.exceptions
    if exceptions then

        -- looping through global exceptions
        for k, v in pairs(exceptions) do

            -- comparing exception list entry with given name
            if v:lower() == name:lower() then
                return true
            end

            -- extract name from itemlink (only for compatibility with old saved variables)
            isLink, _, exception = string_find(v, "^|c%x+|H.+|h.(.*)\].+")
            if isLink then
                -- comparing exception list entry with given name
                if exception:lower() == name:lower() then
                    return true
                end
            end
        end
    end

    -- item not found in exception list
    return false
end

function addon:ClearDB()
    wipe(self.db.global.exceptions)
    self:Print(L["Exceptions succesfully cleared."])
end

function addon:HandleSlashCommands(input)
    local arg1, arg2 = self:GetArgs(input, 2, 1, input)
    if arg1 == 'destroy' then
        self:Destroy(arg2)
    elseif arg1 == 'add' and arg2 ~= nil then
        if arg2:find('|Hitem') == nil then
            self:Print(L["Command accepts only itemlinks."])
        else
            self:Add(arg2, true)
        end
    elseif (arg1 == 'rem' or arg1 == 'remove') and arg2 ~= nil then
        if arg2:find('|Hitem') == nil then
            self:Print(L["Command accepts only itemlinks."])
        else
            self:Rem(arg2, true)
        end
    else
        InterfaceOptionsFrame_OpenToCategory(addon.optionsFrame)
    end
end

function addon:PopulateOptions()
    if not options then
        options = {
            order = 1,
            type = "group",
            name = "SellJunk",
            args = {
                general = {
                    order = 1,
                    type = "group",
                    name = "global",
                    args = {
                        divider1 = {
                            order = 1,
                            type = "description",
                            name = "",
                        },
                        auto = {
                            order = 2,
                            type = "toggle",
                            name = L["Automatically sell junk"],
                            desc = L["Toggles the automatic selling of junk when the merchant window is opened."],
                            get = function() return addon.db.char.auto end,
                            set = function() self.db.char.auto = not self.db.char.auto end,
                        },
                        divider2 = {
                            order = 3,
                            type = "description",
                            name = "",
                        },
                        max12 = {
                            order = 4,
                            type = "toggle",
                            name = L["Sell max. 12 items"],
                            desc = L["This is failsafe mode. Will sell only 12 items in one pass. In case of an error, all items can be bought back from vendor."],
                            get = function() return addon.db.char.max12 end,
                            set = function() self.db.char.max12 = not self.db.char.max12 end,
                        },
                        divider3 = {
                            order = 5,
                            type = "description",
                            name = "",
                        },
                        printGold = {
                            order = 6,
                            type = "toggle",
                            name = L["Show gold gained"],
                            desc = L["Shows gold gained from selling trash."],
                            get = function() return addon.db.char.printGold end,
                            set = function() self.db.char.printGold = not self.db.char.printGold end,
                        },
                        divider4 = {
                            order = 7,
                            type = "description",
                            name = "",
                        },
                        showSpam = {
                            order = 8,
                            type = "toggle",
                            name = L["Show 'item sold' spam"],
                            desc = L["Prints itemlinks to chat, when automatically selling items."],
                            get = function() return addon.db.char.showSpam end,
                            set = function() addon.db.char.showSpam = not addon.db.char.showSpam end,
                        },
                        divider5 = {
                            order = 9,
                            type = "header",
                            name = L["Clear exceptions"],
                        },
                        clearglobal = {
                            order = 10,
                            type = "execute",
                            name = L["Clear"],
                            desc = L["Removes all exceptions."],
                            func = function() addon:ClearDB() end,
                        },
                        divider6 = {
                            order = 12,
                            type = "description",
                            name = "",
                        },
                        header1 = {
                            order = 13,
                            type = "header",
                            name = L["Exceptions"],
                        },
                        note1 = {
                            order = 14,
                            type = "description",
                            name = L["Drag item into this window to add/remove it from exception list"],
                        },
                        add = {
                            order = 15,
                            type = "input",
                            name = L["Add item"] .. ':',
                            usage = L["<Item Link>"],
                            get = false,
                            set = function(info, v) addon:Add(v) end,
                        },
                        rem = {
                            order = 16,
                            type = "input",
                            name = L["Remove item"] .. ':',
                            usage = L["<Item Link>"],
                            get = false,
                            set = function(info, v) addon:Rem(v) end,
                        },
                    }
                }
            }
        }
    end
end
