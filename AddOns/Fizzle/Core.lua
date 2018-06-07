-- Create the addon
Fizzle = LibStub("AceAddon-3.0"):NewAddon("Fizzle", "AceEvent-3.0", "AceBucket-3.0", "AceHook-3.0", "AceConsole-3.0")
local self, Fizzle = Fizzle, Fizzle
local defaults = {
	profile = {
		Percent = true,
		Border = true,
		Invert = false,
		HideText = false,
		DisplayWhenFull = true,
		repairCost = true,
		modules = {
			["Inspect"] = true,
		},
	},
}

Fizzle.enable = true;
local L = LibStub("AceLocale-3.0"):GetLocale("Fizzle")
local fontSize = 12
local _G = _G
local sformat = string.format
local ipairs = ipairs
local db -- We'll put our saved vars here later
-- Make some of the inventory functions more local (ordered by string length!)
local GetItemQualityColor = GetItemQualityColor
local GetInventorySlotInfo = GetInventorySlotInfo
local GetInventoryItemQuality = GetInventoryItemQuality
local GetInventoryItemDurability = GetInventoryItemDurability
-- Flag to check if the borders were created or not
local bordersCreated = false
local items, nditems -- our item slot tables

-- Return an options table full of goodies!
local function getOptions()
	local options = {
		type = "group",
		name = GetAddOnMetadata("Fizzle", "Title"),
		args = {
			fizzledesc = {
				type = "description",
				order = 0,
				name = GetAddOnMetadata("Fizzle", "Notes"),
			},
			percent = {
				name = L["Percent"],
				desc = L["Toggle percentage display."],
				type = "toggle",
				order = 100,
				width = "full",
				get = function() return db.Percent end,
				set = function()
					db.Percent = not db.Percent
					Fizzle:UpdateItems()
				end,
			},
			border = {
				name = L["Border"],
				desc = L["Toggle quality borders."],
				type = "toggle",
				order = 200,
				width = "full",
				get = function() return db.Border end,
				set = function()
					db.Border = not db.Border
					Fizzle:BorderToggle()
				end,
			},
			invert = {
				name = L["Invert"],
				desc = L["Show numbers the other way around. Eg. 0% = full durability , 100 = no durability."],
				type = "toggle",
				order = 300,
				width = "full",
				get = function() return db.Invert end,
				set = function()
					db.Invert = not db.Invert
					Fizzle:UpdateItems()
				end,
			},
			hidetext = {
				name = L["Hide Text"],
				desc = L["Hide durability text."],
				type = "toggle",
				order = 400,
				width = "full",
				get = function() return db.HideText end,
				set = function()
					db.HideText = not db.HideText
					Fizzle:UpdateItems()
				end,
			},
			showfull = {
				name = L["Show Full"],
				desc = L["Show durability when full."],
				type = "toggle",
				order = 500,
				width = "full",
				get = function() return db.DisplayWhenFull end,
				set = function()
					db.DisplayWhenFull = not db.DisplayWhenFull
					Fizzle:UpdateItems()
				end,
			},
			-- Inspect module toggle
			inspect = {
				name = L["Inspect"],
				desc = L["Show item quality when inspecting people."],
				type = "toggle",
				order = 600,
				width = "full",
				get = function() return db.modules["Inspect"] end,
				set = function(info, v)
					db.modules["Inspect"] = v
					if v then
						Fizzle:EnableModule("Inspect")
					else
						Fizzle:DisableModule("Inspect")
					end
				end,
			}
		}
	}
	return options
end

local function Update_RepairCost(cost)	
	local framex = CharacterFrameMoneyFrame:GetName();
	if(cost>0)then
		CharacterFrameMoneyFrame.RepairText:SetText(L["REPAIR_ITEM"]);
	else
		CharacterFrameMoneyFrame.RepairText:SetText(L["NO_REPAIR"]);
	end
	MoneyFrame_Update(framex, cost);
end

function Fizzle:OnInitialize()
	local moneyFrame, RMoney;
	-- Grab our db
	self.db = LibStub("AceDB-3.0"):New("DuowanAddon_FizzleDB", defaults)
	db = self.db.profile

	local moneyTooltip = CreateFrame("GameTooltip", "moneyFrameTooltip", nil, "GameTooltipTemplate")
	moneyTooltip:SetOwner(UIParent, "ANCHOR_NONE")
	moneyTooltip:SetAlpha(0);

	moneyFrame = CreateFrame("Frame", "CharacterFrameMoneyFrame", PaperDollFrame, "SmallMoneyFrameTemplate")
	MoneyFrame_SetType(moneyFrame, "STATIC");	
	moneyFrame:SetPoint("BOTTOMLEFT", PlayerStatFrameLeftDropDown, "TOPLEFT", 24, 4);
	
	RMoney = moneyFrame:CreateFontString(moneyFrame:GetName().."RepairMoney","ARTWORK", "GameFontNormal");	
	RMoney:SetPoint("BOTTOMLEFT", moneyFrame, "TOPLEFT", -2, 2);	
	RMoney:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
	RMoney:SetText(L["REPAIR_ITEM"]);
	CharacterFrameMoneyFrame.RepairText = RMoney;

	--Update_RepairCost();
	self:RegisterChatCommand("fizzle", function() InterfaceOptionsFrame_OpenToCategory(LibStub("AceConfigDialog-3.0").BlizOptions["Fizzle"].frame) end)
	self:RegisterChatCommand("fizz", function() InterfaceOptionsFrame_OpenToCategory(LibStub("AceConfigDialog-3.0").BlizOptions["Fizzle"].frame) end)
end

function Fizzle:OnEnable()
	CharacterFrame:HookScript("OnShow", Fizzle_CharacterFrame_OnShow)
	CharacterFrame:HookScript("OnHide", Fizzle_CharacterFrame_OnHide)
	if not bordersCreated then
		self:MakeTypeTable()
	end
end

function Fizzle:OnDisable()
	for _, item in ipairs(items) do
		_G[item .. "FizzleS"]:SetText("")
	end
	self:HideBorders()
end

function Fizzle_Toggle(switch)
	if (switch) then
		Fizzle.enable = true;
		Fizzle:UpdateItems();
	else
		Fizzle.enable = false;
		for _, item in ipairs(items) do
			_G[item .. "FizzleS"]:SetText("")
		end
	end
end

function Fizzle:CreateBorder(slottype, slot, name, hasText)
	local gslot = _G[slottype..slot.."Slot"]
	if gslot then
		-- Create border
		local border = gslot:CreateTexture(slot .. name .. "B", "OVERLAY")
		border:SetTexture("Interface\\Buttons\\UI-ActionButton-Border")
		border:SetBlendMode("ADD")
		border:SetAlpha(0.75)
		border:SetHeight(68)
		border:SetWidth(68)
		border:SetPoint("CENTER", gslot, "CENTER", 0, 1)
		border:Hide()

		-- Check if we need a text field creating
		if hasText then
			local str = gslot:CreateFontString(slot .. name .. "S", "OVERLAY")
			local font, _, flags = ChatFontNormal:GetFont()
			str:SetFont(font, fontSize, "OUTLINE")
			str:SetPoint("CENTER", gslot, "BOTTOM", 0, 8)
		end
	end
end

function Fizzle:MakeTypeTable()
	-- Table of item types and slots.  Thanks Tekkub.
	items = {
		"Head",
		"Shoulder",
		"Chest",
		"Waist",
		"Legs",
		"Feet",
		"Wrist",
		"Hands",
		"MainHand",
		"SecondaryHand",
		"Ranged",
	}
         
	-- Items without durability but with some quality, needed for border colouring.
	nditems = {
		"Ammo",
		"Neck",
		"Back",
		"Finger0",
		"Finger1",
		"Trinket0",
		"Trinket1",
		"Relic",
		"Tabard",
	}
         
	for _, item in ipairs(items) do
		self:CreateBorder("Character", item, "Fizzle", true)
	end

	-- Same again, but for ND items, and only creating a border
	for _, nditem in ipairs(nditems) do
		self:CreateBorder("Character", nditem, "Fizzle", false)
	end
end

local function GetThresholdColour(percent)
	if percent < 0 then
		return 1, 0, 0
	elseif percent <= 0.5 then
		return 1, percent * 2, 0
	elseif percent >= 1 then
		return 0, 1, 0
	else
		return 2 - percent * 2, 1, 0
	end
end

function Fizzle:UpdateItems()
	-- Don't update unless the charframe is open.
	-- No point updating what we can't see.
	if CharacterFrame:IsVisible() then		
		-- Go and set the durability string for each slot that has an item equipped that has durability.
		-- Thanks Tekkub again for the base of this code.
		local CostSum = 0;
		for _, item in ipairs(items) do
			local id, _ = GetInventorySlotInfo(item .. "Slot")
			local str = _G[item.."FizzleS"]
			local v1, v2 = GetInventoryItemDurability(id)
			v1, v2 = tonumber(v1) or 0, tonumber(v2) or 0
			local percent = v1 / v2 * 100

			if (((v2 ~= 0) and ((percent ~= 100) or db.DisplayWhenFull)) and not db.HideText) then
				local text
			
				-- Colour our string depending on current durability percentage
				str:SetTextColor(GetThresholdColour(v1/v2))

				if db.Invert then
					v1 = v2 - v1
					percent = 100 - percent
				end

				-- Are we showing the % or raw cur/max
				if db.Percent then
					text = sformat("%d%%", percent)
				else
					text = v1.."/"..v2
				end

				str:SetText(text)
			else
				-- No durability in slot, so hide the text.
				str:SetText("")
			end
            
			if (db.repairCost) then
				local lHasItem, _, lRepairCost = moneyFrameTooltip:SetInventoryItem("player", id);
				if (lHasItem) then
					CostSum = CostSum + lRepairCost;
				end
			end
			--Finally, colour the borders
			if db.Border then
				self:ColourBorders(id, item)
			end
		end
         
		 if (db.repairCost) then
		 	Update_RepairCost(CostSum);
		 end
		-- Colour the borders of ND items
		if db.Border then
			self:ColourBordersND()
		end
	end
end

function Fizzle_CharacterFrame_OnShow()
	if (not Fizzle.enable) then
		return;
	end
	
	Fizzle:RegisterEvent("UNIT_INVENTORY_CHANGED", "UpdateItems")
	Fizzle:RegisterBucketEvent("UPDATE_INVENTORY_DURABILITY", 0.5, "UpdateItems")
	Fizzle:UpdateItems()
end

function Fizzle_CharacterFrame_OnHide()
	Fizzle:UnregisterEvent("UNIT_INVENTORY_CHANGED")
	Fizzle:UnregisterBucket("UPDATE_INVENTORY_DURABILITY")
end

-- Border colouring split into two functions so I only need to iterate over each table once.
-- Border colouring for items with durability.
function Fizzle:ColourBorders(slotID, rawslot)
	local quality = GetInventoryItemQuality("player", slotID)
	if quality then
		local r, g, b, _ = GetItemQualityColor(quality)
		_G[rawslot.."FizzleB"]:SetVertexColor(r, g, b)
		_G[rawslot.."FizzleB"]:Show()
	else
		_G[rawslot.."FizzleB"]:Hide()
	end
end

-- Border colouring for items without durability
function Fizzle:ColourBordersND()
	for _, nditem in ipairs(nditems) do
		if _G["Character"..nditem.."Slot"] then
			local slotID, _ = GetInventorySlotInfo(nditem .. "Slot")
			local quality = GetInventoryItemQuality("player", slotID)
			if quality then
				local r, g, b, _ = GetItemQualityColor(quality)
				_G[nditem.."FizzleB"]:SetVertexColor(r, g, b)
				_G[nditem.."FizzleB"]:Show()
			else
				_G[nditem.."FizzleB"]:Hide()
			end
		end
	end
end

-- Toggle the border colouring
function Fizzle:BorderToggle()
	if not db.Border then
		self:HideBorders()
	else
		self:UpdateItems()
	end
end

-- Hide quality borders
function Fizzle:HideBorders()
	for _, item in ipairs(items) do
		local border = _G[item.."FizzleB"]
		if border then
			border:Hide()
		end
	end

	for _, nditem in ipairs(nditems) do
		local border = _G[nditem.."FizzleB"]
		if border then
			border:Hide()
		end
	end
end

function Fizzle:ToggleCost(switch)
	if (switch) then
		db.repairCost = true;
		CharacterFrameMoneyFrame:Show();
	else
		db.repairCost = false;
		CharacterFrameMoneyFrame:Hide();
	end
end
