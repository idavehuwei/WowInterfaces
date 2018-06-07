zFeeder = HunterMod:NewModule("zFeeder", "AceEvent-3.0", "AceHook-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("HunterMod");
local z = zFeeder;

--------------------------------------------
--	locals
--------------------------------------------
local inCombat = false;
local needCheck = false;
local zLastTime = false;
local isMoving = nil;
local zFeedHooked = false;
local zWarningPoint = 2;
local zHappinessMap = { PET_HAPPINESS1 = 2, PET_HAPPINESS2 = 3 };

-----------------
-- OnXX
do
local function OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	if (z.db.profile.Link) then
		GameTooltip:SetText(ZF_BUTTON_TITLE);
		GameTooltip:AddDoubleLine(ZF_FOODNAME, z.db.profile.Link, 1, 1, 1, 1,1,1);
		GameTooltip:AddDoubleLine(ZF_FOODQUANTITY, z.db.profile.Count, 1, 1, 1, 1,1,1);
		GameTooltip:AddLine(L["Hold shift to move frame\nShift + Right click to reset position"], 0.5, 0.5, 0.5, 1);
	else
		GameTooltip:AddLine(ZF_NO_FOOD, 1, 1, 1);
		GameTooltip:AddLine(L["Hold shift to move frame\nShift + Right click to reset position"], 0.5, 0.5, 0.5, 1);
	end
	GameTooltip:Show();
end

local function OnLeave(self)
	GameTooltip:Hide();
end

local function PreClick(self, button)	
	if (InCombatLockdown()) then	-- 战斗状态下不能动作
		return;
	end	

	if (CursorHasItem()) then
		local _, itemName, itemLink = GetCursorInfo();
		local itemTexture = select(10, GetItemInfo(itemLink));
		if (itemName and itemLink and itemTexture) then
			z.db.profile.Item = itemName;
			z.db.profile.Link = itemLink;
			z.db.profile.Texture = itemTexture;				
		end
		GameTooltip:Hide();
		ClearCursor();
		z:Update();
	else
		if (IsShiftKeyDown() and button == "RightButton") then
			self:ClearAllPoints();
			self:SetPoint("RIGHT", "PetFrame", "LEFT", -2, -4);
		elseif (z.db.profile.Link) then
			local bag, slot = z:GetItemIndex(z.db.profile.Link);
			local hasEffect = z:HasFeedEffect();
			if (bag and slot and not hasEffect) then
				PickupContainerItem(bag, slot);			
			end
		end
	end
end

local function OnDragStart(self)
	GameTooltip:Hide();
	if (IsShiftKeyDown()) then	
		self:SetMovable(true);
		self:StartMoving();
		self.isMoving = true;
		return;
	end
	z.db.profile.Link = nil;
	z.db.profile.Count = nil;
	z.db.profile.Texture = nil;
	z.db.profile.Item = "";
	SetItemButtonCount(self, 0);
	SetItemButtonTexture(self, nil);
end

local function OnDragStop(self)
	if (self.isMoving) then		
		self:StopMovingOrSizing();
		self:SetMovable(true);
	end
end

local function OnUpdate(self, elapsed)
	self.time = self.time + elapsed;
	if (self.time > 0.3) then
		local hasEffect, duration, timeleft = z:HasFeedEffect();		
		if (hasEffect and duration) then
			PetFrameManaBar:SetStatusBarColor(0.0, 1.0, 1.0);
			PetFrameManaBar:SetMinMaxValues(0, duration);
			PetFrameManaBar:SetValue(duration - math.floor(timeleft));
			PetFrameManaBar:UnregisterEvent("UNIT_HAPPINESS");
			self.feeding = true;
		elseif (self.feeding) then
			PetFrameManaBar:RegisterEvent("UNIT_HAPPINESS");
			UnitFrameManaBar_Update(PetFrameManaBar:GetParent());
			self.feeding = false;
		end

		self.time = 0;
	end
end

function z:CreateButton()
	if (not self.button) then
		self.button = CreateFrame("Button", "zFeederButton", PetFrame, "ItemButtonTemplate, SecureActionButtonTemplate");
		self.button:SetHeight(28);
		self.button:SetWidth(28);
		self.button:SetPoint("RIGHT", PetFrame, "LEFT", -2, -4);
		self.button:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2");
		self.button.normalTexture = self.button:GetNormalTexture();
		self.button.normalTexture:SetWidth(42);
		self.button.normalTexture:SetHeight(42);
		self.button.normalTexture:SetPoint("CENTER", self.button, "CENTER");
		self.button:RegisterForDrag("LeftButton", "RightButton");
		self.button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
		self.button:SetAttribute("unit", "pet");
		self.button:SetAttribute("type", "target");
		self.button:SetScript("OnEnter", OnEnter);
		self.button:SetScript("OnLeave", OnLeave);
		self.button:SetScript("PreClick", PreClick);
		self.button:SetScript("OnDragStart", OnDragStart);
		self.button:SetScript("OnDragStop", OnDragStop);
		self.button:SetScript("OnUpdate", OnUpdate);		
		self.button.time = 0;
	end
end
end
------------------------
-- 从link中获得Id和名字
function z:ParseItemLink(link)
	if (link) then
		for id, name in string.gmatch(link, "|c%x+|Hitem:(%d+):%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+:%-?%d+|h%[(.+)%]|h|r") do
			return tonumber(id), name;
		end
	end
end

-------------------------
-- 找到喂食状态
function z:HasFeedEffect()
	local i = 1;	
	local name, rank, texture, count, debuffType, duration, expirationTime = UnitAura("pet", i);
	
	while (texture) do
		local timeLeft = expirationTime - GetTime();
		if ( string.find(texture, "Ability_Hunter_BeastTraining") ) then				
			return true, duration, timeLeft;
		end
		i = i + 1;
		name, rank, texture, count, debuffType, duration, expirationTime = UnitAura("pet", i);
	end
	return nil;
end

--------------------
-- item index
function z:GetItemIndex(itemlink)
	if (not itemlink) then
		return nil, nil;
	end
	
	for bag = 0, NUM_BAG_FRAMES do
		for slot = 1, GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot);
			if (link) then
				local id1 = self:ParseItemLink(link);
				local id2 = self:ParseItemLink(self.db.profile.Link);

				if (id1 and id2 and id1 == id2) then
					return bag, slot;
				end
			end
		end
	end
	return nil, nil;
end

-----------------------------
-- updates
function z:Update()
	if(self.db.profile.Texture) then
		SetItemButtonTexture(self.button, self.db.profile.Texture);
	end

	if (self.db.profile.Link) then
		self.db.profile.Count = GetItemCount(self.db.profile.Link);
		SetItemButtonCount(self.button, self.db.profile.Count);
		if(self.db.profile.Count and self.db.profile.Count == 0) then
			zFeederButtonIconTexture:SetVertexColor(1.0, 0.1, 0.1);
		else
			zFeederButtonIconTexture:SetVertexColor(1.0, 1.0, 1.0);
		end
	end
end
-----------------------------------------
--	OnX
-----------------------------------------

function z:OnModuleEnable()	
	self:RegisterEvent("PLAYER_REGEN_ENABLED");
	self:RegisterEvent("BAG_UPDATE");
	self:SecureHook("PetFrame_SetHappiness");
	self.button:Show();
end

function z:OnModuleDisable()
	self:UnregisterEvent("PLAYER_REGEN_ENABLED");
	self:UnregisterEvent("BAG_UPDATE");
	self:Unhook("PetFrame_SetHappiness");
	self.button:Hide();
end

function z:OnInitialize()	
	self.db = HunterMod.db:RegisterNamespace("zFeeder", {
		profile = {
			Link = nil,
			Texture = nil,
			Count = nil,
			Item = "",
		},
	} );
	
	self:CreateButton();
	self:Update();
end

function z:CHappiness(happiness)
	local happiness = tostring(happiness);
	zWarningPoint = zHappinessMap[happiness] or 2;
end

function z:PLAYER_REGEN_ENABLED()
end

function z:BAG_UPDATE()
	self:Update();
end
--------------------------------------
--	Override
--------------------------------------
function z:PetFrame_SetHappiness(...)	
	local happiness = GetPetHappiness();
	if (happiness and happiness < zWarningPoint) then	
		if ( not zLastTime or (GetTime() - zLastTime) > 1000 ) then
			zLastTime = GetTime();
			UIErrorsFrame:AddMessage(ZF_HUNGER, 1.0, 1.0, 0.0, 1.0, UIERRORS_HOLD_TIME);
		end
	end
	needCheck = false;
end

function z:Toggle(switch)
	if (switch) then
		self:OnModuleEnable();
	else
		self:OnModuleDisable();
	end
end