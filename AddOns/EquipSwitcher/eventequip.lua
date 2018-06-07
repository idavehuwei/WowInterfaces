-----------------------------------------------------------------
-- 事件换装
-- $Revision: 2063 $
-- $Date: 2009-04-22 11:22:20 +0800 (三, 2009-04-22) $
-- 根据eventEquip以及itemrack思路进行写的一个事件自动换装的模块
-- 此模块只能使用在wow3.1或更高版本上
-- Author: 月色狼影@cwdg
--[[
 BugList & TODO:
1. saveButton以及delButton目前还是不能太灵活的使用
2. 事件换装触发
]]
-----------------------------------------------------------------
local L = LibStub("AceLocale-3.0"):GetLocale("EquipSwitcher");
local MODULENAME = "EventEquip";
local addon = EquipSwitcher:NewModule(MODULENAME, "AceEvent-3.0", "AceHook-3.0");

local GameTooltip = GameTooltip
local CreateFrame = CreateFrame
local eventSelected, setSelected--for dropdown value
local db

addon.EventsVersion = 1;

addon.DefaultEvents = {
	["PVP"] = {
		text = "PVP",
		Type = "Zone",
		Unequip = 1,  
		Zones = {
			["Alterac Valley"] = 1,
			["Arathi Basin"] = 1,
			["Warsong Gulch"] = 1,
			["Eye of the Storm"] = 1,
			["Ruins of Lordaeron"] = 1,
			["Blade's Edge Arena"] = 1,
			["Nagrand Arena"] = 1,
		}
	},
	["City"] = {
		text = "城市",
		Type = "Zone",
		Unequip = 1,
		Zones = {
			["Ironforge"] = 1,
			["Stormwind City"] = 1,
			["Darnassus"] = 1,
			["The Exodar"] = 1,
			["Orgrimmar"] = 1,
			["Thunder Bluff"] = 1,
			["Silvermoon City"] = 1,
			["Undercity"] = 1,
			["Shattrath City"] = 1,
		}
	},
	["Mounted"] = { text = "坐骑", Type = "Buff", Unequip = 1, Anymount = 1 },
	["Drinking"] = { text = "喝水", Type = "Buff", Unequip = 1, Buff = "Drink" },
	["Evocation"] = { text = "召唤", Type = "Buff", Unequip = 1, Buff = "Evocation" },

	["Warrior Battle"] = { text = "战士战斗姿态", Type = "Stance", Stance = 1 },
	["Warrior Defensive"] = { text = "战士防御姿态", Type = "Stance", Stance = 2 },
	["Warrior Berserker"] = { text = "战士狂暴姿态", Type = "Stance", Stance = 3 },

	["Priest Shadowform"] = { text = "牧师暗影形态", Type = "Stance", Unequip = 1, Stance = 1 },

	["Druid Humanoid"] = { text = "德鲁伊人形态", Type = "Stance", Stance = 0 },
	["Druid Bear"] = { text = "德鲁伊熊形态", Type = "Stance", Stance = 1 },
	["Druid Aquatic"] = { text = "德鲁伊海豹形态", Type = "Stance", Stance = 2 },
	["Druid Cat"] = { text = "德鲁伊猫形态", Type = "Stance", Stance = 3 },
	["Druid Travel"] = { text = "德鲁伊旅行形态", Type = "Stance", Stance = 4 },
	["Druid Moonkin"] = { text = "德鲁伊枭兽形态", Type = "Stance", Stance = "Moonkin Form" },
	["Druid Tree of Life"] = { text = "德鲁伊树形态", Type = "Stance", Stance = "Tree of Life" },
	["Druid Flight Form"] = { text = "德鲁伊飞行形态", Type = "Stance", Unequip = 1, Stance = "Flight Form" },
	["Druid Swift Flight Form"] = { text = "德鲁伊高级飞行形态", Type = "Stance", Unequip = 1, Stance = "Swift Flight Form" },

	["Rogue Stealth"] = { text = "潜行状态", Type = "Stance", Unequip = 1, Stance = 1 },

	["Shaman Ghostwolf"] = { text = "萨满祭司幽灵狼形态", Type = "Stance", Unequip = 1, Stance = 1 },

	--[=[
	["Swimming"] = {
		text = "游泳",
		["Trigger"] = "MIRROR_TIMER_START",
		["Type"] = "Script",
		["Script"] = "local set = \"Name of set\"\nif IsSwimming() and not IsSetEquipped(set) then\n  EquipSet(set)\n  if not SwimmingEvent then\n    function SwimmingEvent()\n      if not IsSwimming() then\n        ItemRack.StopTimer(\"SwimmingEvent\")\n        UnequipSet(set)\n      end\n    end\n    ItemRack.CreateTimer(\"SwimmingEvent\",SwimmingEvent,.5,1)\n  end\n  ItemRack.StartTimer(\"SwimmingEvent\")\nend\n--[[Equips a set when swimming and breath gauge appears and unequips soon after you stop swimming.]]",
	},]=]

	--[=[["Buffs Gained"] = {
		text = "Buff获取",
		Type = "Script",
		Trigger = "UNIT_AURA",
		Script = "if arg1==\"player\" then\n  IRScriptBuffs = IRScriptBuffs or {}\n  local buffs = IRScriptBuffs\n  for i in pairs(buffs) do\n    if not UnitAura(\"player\",i) then\n      buffs[i] = nil\n    end\n  end\n  local i,b = 1,1\n  while b do\n    b = UnitBuff(\"player\",i)\n    if b and not buffs[b] then\n      ItemRack.Print(\"Gained buff: \"..b)\n      buffs[b] = 1\n    end\n    i = i+1\n  end\nend\n--[[For script demonstration purposes. Doesn't equip anything just informs when a buff is gained.]]",
	},

	["After Cast"] = {
		text = "施法后",
		Type = "Script",
		Trigger = "UNIT_SPELLCAST_SUCCEEDED",
		Script = "local spell = \"Name of spell\"\nlocal set = \"Name of set\"\nif arg1==\"player\" and arg2==spell then\n  EquipSet(set)\nend\n\n--[[This event will equip \"Name of set\" when \"Name of spell\" has finished casting.  Change the names for your own use.]]",
	},]=]
}

function addon:OnInitialize()
	--self.db = EquipSwitcher.db:RegisterNamespace(MODULENAME, {profile = {}});
	--db = self.db.profile
	--self:SetEnabledState(EquipSwitcher.db.profile.enabledEE);

	--self.playerClass = select(2, UnitClass("player"));
end
--[[
function addon:OnEnable()
	self:ToggleEEFrameButton();
	if self.toggleEEButton then
		self.toggleEEButton:Show()
	end
	self:CreateEEFrame();

	self:HookScript(GearManagerDialog, "OnHide", function() 
		if EventEquipFrame then EventEquipFrame:Hide() end
	end);

	self:HookScript(GearManagerDialogSaveSet, "OnClick", function() 
		if EventEquipFrame then EventEquipFrame:Hide() end
	end);

	self:LoadEvents();
	self:RegisterEvents();
end

function addon:OnDisable()
	if self.toggleEEButton then
		self.toggleEEButton:Hide()
	end
	self:UnhookAll()
	self:UnregisterAllEvents();
end
]]
function addon:ToggleEEFrameButton()
	if not self.toggleEEButton then
		local button = CreateFrame("Button", nil, GearManagerDialog)
		button:SetWidth(22);
		button:SetHeight(22);
		button:SetPoint("BOTTOM", GearManagerDialog, "BOTTOM", 2, 12);
		button:SetNormalTexture("Interface\\Minimap\\Tracking\\Repair");
		button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight");
		button:GetHighlightTexture():SetTexCoord(0,.64,0,.64);
		button:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT");
			GameTooltip:SetText(L["事件换装"], 1, 1, 1);
			GameTooltip:AddLine(L["点击打开事件换装面板"]);
			GameTooltip:Show();
		end)
		button:SetScript("OnLeave", function(self) 
			GameTooltip:Hide()
		end)
		button:SetScript("OnClick", function(self, button)
			addon:ToggleEEFrame()
		end)
		button:Hide();
		self.toggleEEButton = button
	end
end

function addon:ToggleEEFrame()
	if not EventEquipFrame then
		self:CreateEEFrame()
	end
	if EventEquipFrame:IsShown() then
		EventEquipFrame:Hide()
	else
		EventEquipFrame:Show()
	end
end

function addon:CreateEEFrame()
	local frame = CreateFrame("Frame", "EventEquipFrame", GearManagerDialog, "UIPanelDialogTemplate");
	frame:SetWidth(261);
	frame:SetHeight(280);
	frame:SetPoint("TOP", GearManagerDialog, "BOTTOM", 0, 4);
	frame.title:SetText("事件换装");
	
	local desc = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
	desc:SetParent(frame);
	desc:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -32)
	desc:SetHeight(30)
	desc:SetWidth(frame:GetWidth() - 30)
	desc:SetNonSpaceWrap(30)
	desc:SetJustifyH("LEFT");
	desc:SetText("选择一个事件, 然后为此事件选择一个套装.");
	
	--event list
	local eventframe = CreateFrame("Frame", "EventEquipFrameEventDropDown", frame, "UIDropDownMenuTemplate");
	eventframe:SetPoint("TOP", frame, "TOP", -55, -80);
	--eventframe:SetWidth(200);

	local function eventOnClick(self)
		UIDropDownMenu_SetSelectedValue(eventframe, self.value);
		eventSelected = self.value
		local uset = db.UserEvents.Set
		if uset[eventSelected] then
			local setindex = EquipSwitcher:GetSetID(uset[eventSelected].setname)
			if setindex then
				UIDropDownMenu_SetText(EventEquipFrameSetsListDropDown, uset[eventSelected].setname)
				UIDropDownMenu_SetSelectedValue(EventEquipFrameSetsListDropDown, setindex);
				setSelected = setindex
			end
		end
	end
	UIDropDownMenu_Initialize(eventframe, function()
		local current, info = UIDropDownMenu_GetSelectedValue(eventframe), UIDropDownMenu_CreateInfo();
		for k, t in pairs(self.DefaultEvents) do
			info.text = t.text
			info.value = k
			info.checked = k == current
			info.func = eventOnClick
			UIDropDownMenu_AddButton(info)
		end
	end);
	--lable
	local eventlabel = eventframe:CreateFontString(nil, "ARTWORK", "GameFontNormal");
	eventlabel:SetText("选择事件: ");
	eventlabel:SetPoint("BOTTOM", eventframe, "TOP", 0, 5);
	--end

	--setlist
	local setsframe = CreateFrame("Frame", "EventEquipFrameSetsListDropDown", frame, "UIDropDownMenuTemplate");
	setsframe:SetPoint("TOP", eventframe, "BOTTOM", 0, -30);
	local function setOnClick(self)
		UIDropDownMenu_SetSelectedValue(setsframe, self.value);
		setSelected = self.value
	end
	UIDropDownMenu_Initialize(setsframe, function()
		local current, info = UIDropDownMenu_GetSelectedValue(setsframe), UIDropDownMenu_CreateInfo();
		if not EquipSwitcher.equipSets then return end--check EquipSwitcher.equipSets is nil value
		for k, t in pairs(EquipSwitcher.equipSets) do
			info.text = t.setname
			info.value = k
			info.checked = k == current
			info.func = setOnClick
			UIDropDownMenu_AddButton(info)
		end
	end);
	--lable
	local setslabel = eventframe:CreateFontString(nil, "ARTWORK", "GameFontNormal");
	setslabel:SetText("选择套装: ");
	setslabel:SetPoint("BOTTOM", setsframe, "TOP", 0, 5);
	--end

	--save button
	local savebutton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate");
	savebutton:SetPoint("BOTTOM", frame, "BOTTOM", -35, 30);
	savebutton:SetText(SAVE);
	savebutton:SetHeight(25)
	savebutton:SetWidth(80)
	savebutton:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
		GameTooltip:SetText(L["事件换装"], 1, 1, 1);
		GameTooltip:AddLine(L["点击保存此套装备的事件应用"]);
		GameTooltip:Show();
	end)
	savebutton:SetScript("OnLeave", function(self) 
		GameTooltip:Hide()
	end)
	savebutton:SetScript("OnClick", function(self, button)
		local enabled = db.UserEvents.Enabled
		local uset = db.UserEvents.Set
		if setSelected and eventSelected then
			local setname = EquipSwitcher:GetSetNameByID(setSelected)
			enabled[eventSelected] = true--事件的启用
			if not uset[eventSelected] then
				uset[eventSelected] = {}
			end
			uset[eventSelected].setname = setname
		end
	end)

	--del button
	local delbutton = CreateFrame("Button", nil, frame, "UIPanelButtonGrayTemplate");
	delbutton:SetPoint("LEFT", savebutton, "RIGHT", 10, 0);
	delbutton:SetText(DELETE);
	delbutton:SetHeight(25)
	delbutton:SetWidth(80)
	delbutton:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
		GameTooltip:SetText(L["事件换装"], 1, 1, 1);
		GameTooltip:AddLine(L["点击删除此套装备的事件应用"]);
		GameTooltip:Show();
	end)
	delbutton:SetScript("OnLeave", function(self) 
		GameTooltip:Hide()
	end)
	delbutton:SetScript("OnClick", function(self, button)
		local enabled = db.UserEvents.Enabled
		local uset = db.UserEvents.Set
		if setSelected and eventSelected then
			local setname = EquipSwitcher:GetSetNameByID(setSelected)
			enabled[eventSelected] = nil--事件的启用
			if not uset[eventSelected] then return end
			--remove
			if uset[eventSelected].setname == setname then
				uset[eventSelected].setname = nil
				--update UIDropDown
			--	UIDropDownMenu_Refresh(eventframe)
			--	UIDropDownMenu_Refresh(setsframe)
			end
		end
	end)

	frame:Hide();
end

function addon:LoadEvents(resetDefault, resetAll)

	local version = tonumber(db.version) or 0
	if self.EventsVersion > version then
		resetDefault = 1
		db.version = self.EventsVersion
	end

	if not db.UserEvents or resetAll then--user events
		db.UserEvents = {
			Enabled = {},
			Set = {}
		}
	end

	--global events
	if not db.Events or resetAll then
		db.Events = {}
	end

	if resetDefault or resetAll then
		for i in pairs(self.DefaultEvents) do
			self:CopyDefaultsEvent(i)
		end
	end
	
	self:ClearupEvents();
end

function addon:CopyDefaultsEvent(eventName)
	db.Events[eventName] = {}
	local event = db.Events[eventName]
	local default = self.DefaultEvents[eventName]

	for i in pairs(default) do
		if (type(default[i]) ~= "table") then
			event[i] = default[i]
		else
			event[i] = {}
			for j in pairs(default[i]) do
				event[i][j] = default[i][j]
			end
		end
	end
end

function addon:ClearupEvents()
	--[[local event = db.UserEvents

	for i in pairs(event.Set) do
		if not db.Events[i] then
			event.Set[i] = nil
			event.Enabled[i] = nil
		end
	end

	for i in pairs(event.Enabled) do
		if not db.Events[i] do
			event.Set[i] = nil
			event.Enabled[i] = nil
		end
	end]]
end

function addon:RegisterEvents()
	--reset addon event
	self:UnregisterAllEvents();
	if not EquipSwitcher.db.profile.enabledEE then return end
	local enabled = db.UserEvents.Enabled
	local events = db.Events
	local eventType
	
	for eventName in pairs(enabled) do
		
	end
end