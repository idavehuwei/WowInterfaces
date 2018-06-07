EquipSwitcher = LibStub("AceAddon-3.0"):NewAddon("EquipSwitcher", "AceEvent-3.0", "AceConsole-3.0", "AceHook-3.0")
local revision = tonumber(("$Revision: 2338 $"):match("%d+"));
EquipSwitcher.revision = revision
local L = LibStub("AceLocale-3.0"):GetLocale("EquipSwitcher");
local db;

--equipment API
local GetNumEquipmentSets = GetNumEquipmentSets
local GetEquipmentSetInfo = GetEquipmentSetInfo
local GameTooltip = GameTooltip
local equipSets = {};
local IsHideRaid=false;
function EquipSwitcher_SetHideRaid(tf)
	IsHideRaid=tf;
	if (db.showBar and tf and GetNumRaidMembers() > 0) then
		EquipSwitcher_Bar:Hide();
	end
end
local defaults = {
	profile = {
		enabled = true,
		showBar = true,
		enabledEE = false,
		equipbar = {
			posX = 98,
			posY = 0,
			showNum = 4,
		},
	},
}
local function EquipSwitcher_OnUpdate()
	if(not IsHideRaid)then
		return;
	end
	if(GetCVarBool("equipmentManager") and (db.enabled))then
		if (EquipSwitcher_Bar:IsVisible() and PlayerFrameGroupIndicator:IsVisible()) then
			
			local a, b = GetCursorPosition();
			if ( b < 600) then
				EquipSwitcher_Bar:Hide();
			end
		end
	end
end
local function EquipSwitcher_OnEnter()
	if(GetCVarBool("equipmentManager") and (db.enabled))then
		EquipSwitcher_Bar:Show()
	end
end
local function EquipSwitcher_UpdateGroupIndicator()
	if((db.enabled~=true) or (not IsHideRaid)) then
		return;
	end

	if (GetNumRaidMembers() == 0) then
		EquipSwitcherEnableBar(true);
	else
		EquipSwitcherEnableBar(false);
	end
end
function EquipSwitcher:OnInitialize()

	self.db = LibStub("AceDB-3.0"):New("EquipSwitcherDB", defaults, "Default");
	db = self.db.profile

	self:SetEnabledState(db.enabled);
	--self:SetupOptions();
	--LibStub("AceConfigDialog-3.0"):Open("EquipSwitcher")

	hooksecurefunc("PlayerFrame_UpdateGroupIndicator", EquipSwitcher_UpdateGroupIndicator);
	PlayerFrame:HookScript("OnEnter", EquipSwitcher_OnEnter);
	PlayerFrame:HookScript("OnUpdate", EquipSwitcher_OnUpdate);

	BINDING_HEADER_DUOWAN_EquipSwitcher = L["一键换装"]
	BINDING_NAME_EquipSwitcher_EQUIP1 = L["套装"]..1
	BINDING_NAME_EquipSwitcher_EQUIP2 = L["套装"]..2
	BINDING_NAME_EquipSwitcher_EQUIP3 = L["套装"]..3
	BINDING_NAME_EquipSwitcher_EQUIP4 = L["套装"]..4
	BINDING_NAME_EquipSwitcher_EQUIP5 = L["套装"]..5
	BINDING_NAME_EquipSwitcher_EQUIP6 = L["套装"]..6
	BINDING_NAME_EquipSwitcher_EQUIP7 = L["套装"]..7
	BINDING_NAME_EquipSwitcher_EQUIP8 = L["套装"]..8
	
end

function EquipSwitcher:OnEnable()
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateEquipSets");
	self:RegisterEvent("EQUIPMENT_SETS_CHANGED", "UpdateEquipSets");
	self:RegisterEvent("PARTY_MEMBERS_CHANGED");
	self:SecureHook("EquipmentManager_EquipSet", "Blz_EquipmentManager_EquipSet")
	self:RegisterEvent("CVAR_UPDATE");
	self:UpdateShow();
	--self:EnableEventEquip();

	--enable cvar
	SetCVar("equipmentManager", 1);
end

function EquipSwitcher:OnDisable()
	self:UnregisterAllEvents();
	EquipSwitcher_Bar:Hide()
	
end

function EquipSwitcher:PARTY_MEMBERS_CHANGED()	
	if (db.showBar) then
		if (IsHideRaid and GetNumRaidMembers() > 0 and EquipSwitcher_Bar:IsShown()) then
			EquipSwitcher_Bar:Hide();
		else
			if (not EquipSwitcher_Bar:IsShown()) then
				EquipSwitcher_Bar:Show();
			end
		end
	end
end

function EquipSwitcher:UpdateEquipSets(event)
	wipe(equipSets);
	for i=1, GetNumEquipmentSets() do
		local name, icon = GetEquipmentSetInfo(i)
		equipSets[i] = {["setname"]= name, ["icon"] = icon};
	end

	if db.currentset then
		self:SetButtonOnClick(db.currentset, true)
	end
	self:UpdateShow();
	EquipSwitcher.equipSets = equipSets
end

function EquipSwitcher:CVAR_UPDATE(event, name, value)
	if name == "USE_EQUIPMENT_MANAGER" then
		self:UpdateShow();
	end
end

function EquipSwitcher:GetSetID(setname)
	if not setname then return end
	for id, setinfo in pairs(equipSets) do
		for k, t in pairs(setinfo) do
			if k == "setname" then
				if t == setname then
					return id
				end
			end
		end
	end
	return false
end

function EquipSwitcher:GetSetNameByID(setindex)
	if not setindex then return end
	for id, setinfo in pairs(equipSets) do
		if id == setindex then
			return setinfo.setname
		end
	end
end

--监视
function EquipSwitcher:Blz_EquipmentManager_EquipSet(setname)
	local setid = self:GetSetID(setname)
	--save current set
	db.currentset = setid
	self:SetButtonOnClick(setid, true)
end

function EquipSwitcher:SwitchEquip(name)
	EquipmentManager_EquipSet(name)
end

function EquipSwitcher:ShowTooltip(self, id)
	if id > GetNumEquipmentSets() then return end

	--GameTooltip_SetDefaultAnchor(GameTooltip, self);
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine(L["一键换装"]..": ");
	GameTooltip:AddLine(equipSets[id].setname);
	GameTooltip:AddTexture(equipSets[id].icon)
	GameTooltip:Show();
end

function EquipSwitcher:SetButtonOnClick(id, switchequip)
	if CursorHasItem() or UnitIsDeadOrGhost("player") then return end
	for i=1, 8 do
		dwGetglobal("EquipSwitcher_BarSetButton"..i):SetChecked(nil);
	end
	
	if id > GetNumEquipmentSets() then return end
	local setname = equipSets[id].setname;

	if (id == 1) then
		EquipSwitcher_BarSetButton1:SetChecked(1)
	elseif (id == 2) then
		EquipSwitcher_BarSetButton2:SetChecked(1)
	elseif (id == 3) then
		EquipSwitcher_BarSetButton3:SetChecked(1)
	elseif (id == 4) then
		EquipSwitcher_BarSetButton4:SetChecked(1)
	elseif (id == 5) then
		EquipSwitcher_BarSetButton5:SetChecked(1)
	elseif (id == 6) then
		EquipSwitcher_BarSetButton6:SetChecked(1)
	elseif (id == 7) then
		EquipSwitcher_BarSetButton7:SetChecked(1)
	elseif (id == 8) then
		EquipSwitcher_BarSetButton8:SetChecked(1)
	end

	if not switchequip then
		self:SwitchEquip(setname)
	end
end

function EquipSwitcher:UpdateShow()--equip bar
	if db.showBar and GetCVarBool("equipmentManager") then
		EquipSwitcher_Bar:Show()
	else
		EquipSwitcher_Bar:Hide()
	end

	EquipSwitcher_Bar:ClearAllPoints();
	EquipSwitcher_Bar:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", self.db.profile.equipbar.posX, self.db.profile.equipbar.posY)
	--update show
	local showbutton
	local savedset = GetNumEquipmentSets()
	if savedset < self.db.profile.equipbar.showNum then
		showbutton = savedset
	else
		showbutton = self.db.profile.equipbar.showNum
	end

	for i = 1, self.db.profile.equipbar.showNum do
		dwGetglobal("EquipSwitcher_BarSetButton"..i):Show();
	end

	for i = showbutton + 1, 8 do
		dwGetglobal("EquipSwitcher_BarSetButton"..i):Hide();
	end
end

local _order = 0
function order()
	_order = _order + 1
	return _order
end
function EquipSwitcherEnable(op)--启用/禁用一键换装插件
	db.enabled = op
	if op then		
		EquipSwitcher:Enable()
	else
		EquipSwitcher:Disable()
	end
end
--[[
function EquipSwitcherEnableEvent(op)--启用/禁用事件换装
	db.enabledEE = op
	local ee = self:GetModule("EventEquip");
	if op then
		ee:Enable()
	else
		ee:Disable()
end
--]]
function EquipSwitcherEnableBar(op)--在玩家头像上方显示快速换装条
	db.showBar = op;
	EquipSwitcher:UpdateShow();
end
function EquipSwitcherXPOS(op)--设置换装条X轴显示位置
	db.equipbar.posX = op;
	EquipSwitcher:UpdateShow();
end
function EnableEquipSwitcher(op)--设置换装条Y轴显示位置
	db.equipbar.posY = op;
	EquipSwitcher:UpdateShow();  

end
function EnableEquipSwitcher(count)--设置换装条显示按钮个数
	db.equipbar.showNum = count;
	EquipSwitcher:UpdateShow();
end
