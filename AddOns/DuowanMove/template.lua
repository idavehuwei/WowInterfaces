--------------------------------------------
-- template - ver 1.0
-- 日期: 2010-4-10
-- 作者: dugu
-- 描述: 多玩移动中心模板
-- 版权所有 (c) Duowan.com
--------------------------------------------
local L = LibStub("AceLocale-3.0"):GetLocale("DuowanMove", true);
local SimpleSticky = LibStub("LibSimpleSticky-1.0");

function DuowanMoveTab_OnLoad(self)
	self.lable = _G[self:GetName() .. "Lable"];
	self:RegisterForDrag("LeftButton");
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp");	
	
	self.ShowLabel = function(self, show)
		if show then 
			UIFrameFadeIn(self.lable, 0.2, 0, 1);
		else 
			UIFrameFadeOut(self.lable, 1, 1, 0);
		end
	end
	self:SetScript("OnEnter", function(self)
		self:ShowLabel(true);
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:SetText(L["多玩界面"], 1, 1, 1);
		GameTooltip:AddLine(L["右键打开菜单"]);
		GameTooltip:Show();
	end);
	self:SetScript("OnLeave", function()
		self:ShowLabel(false);
		GameTooltip:Hide();
	end);	
end

function DuowanMoveTab_OnClick(self, button)
	self:GetParent():ShowMenu(self, button);
end

function DuowanMoveTab_OnDragStart(self, button)
	local p = self:GetParent();
	if (not p.lock) then
		p:StartMoving();
		if (RevStickyBarList[p:GetName()]) then
			SimpleSticky:StartMoving(p, StickyBarList, -4, -4, -4, -4);
		end		
		self.ismoving = true;
	end
end

function DuowanMoveTab_OnDragStop(self, button)
	local p = self:GetParent();
	if (self.ismoving) then
		p:StopMovingOrSizing();
		self.ismoving = false;
		--local pos = {p:GetPoint()};
		--pos[2] = "UIParent";
		if (RevStickyBarList[p:GetName()]) then
			SimpleSticky:StopMoving(p);
		end
		local pos = {"TOPLEFT", "UIParent", "BOTTOMLEFT", p:GetLeft(), p:GetTop()};		
		p:SaveInfo("pos", pos);		
	end
end

function DuowanMoveFrame_OnLoad(self)
	self:SetClampedToScreen(true);
end

local NameToId, defaultName, SkinTable;
if (GetLocale() == "zhCN") then
	defaultName = "可爱圆";
	SkinTable = {"可爱圆", "可爱圆1", "典雅方", "典雅方1", "高雅黑", "高雅黑1", "炫酷铜", "炫酷铜1", "清新方", "清新方1", "凯蒂猫", "凯蒂猫1"};
elseif (GetLocale() == "zhTW") then
	defaultName = "可愛圓";
	SkinTable = {"可愛圓", "典雅方", "高雅黑", "炫酷銅", "清新方", "凱蒂貓"};
else
	defaultName = "可爱圆";
	SkinTable = {"可爱圆", "可爱圆1", "典雅方", "典雅方1", "高雅黑", "高雅黑(亮)", "炫酷铜", "炫酷铜(亮)", "清新方", "清新方(亮)", "凯蒂猫", "凯蒂猫(亮)"};
end
-------------------
-- spinbox
local function FindSkinIndex()
	local curSkin = dwRawGetCVar("DuowanBar", "curSkin", defaultName);
	local Gloss = dwRawGetCVar("DuowanBar", "Gloss", 1);

	curSkin = curSkin .. (Gloss == 1 and "1" or "");
	
	local index = 0;
	for i, name in ipairs(SkinTable) do
		if (name == curSkin) then
			index = i;
			break;
		end
	end

	return index;
end

function DuowanMoveSpinBoxPrev_OnLoad(self)
	self:RegisterForClicks("LeftButtonUp" ,"RightButtonUp");
end

function DuowanMoveSpinBoxPrev_OnClick(self)
	local text = _G[self:GetParent():GetName() .. "Text"];
	local index = FindSkinIndex();
	if (index > 1) then
		index = index - 1;
	else
		index = #(SkinTable);
	end
	
	if ((index%2) == 0) then
		local theme = strmatch(SkinTable[index], "^(.+)1$");
		dwButtonFacadeSetSkin(theme);
	text:SetText(theme.."(亮)");
		dwSetCVar("DuowanBar", "curSkin", theme);
		dwSetCVar("DuowanBar", "Gloss", 1);
		dwButtonFacadeToggleGloss(true);
	else
		dwButtonFacadeSetSkin(SkinTable[index]);
		text:SetText(SkinTable[index]);
		dwSetCVar("DuowanBar", "curSkin", SkinTable[index]);
		dwSetCVar("DuowanBar", "Gloss", 0);
		dwButtonFacadeToggleGloss(false);
	end
end

function DuowanMoveSpinBoxNext_OnLoad(self)
	self:RegisterForClicks("LeftButtonUp" ,"RightButtonUp");
end

function DuowanMoveSpinBoxNext_OnClick(self)
	local text = _G[self:GetParent():GetName() .. "Text"];
	local index = FindSkinIndex();
	if (index < #SkinTable) then
		index = index+1;
	else
		index = 1;
	end

	if ((index%2) == 0) then
		local theme = strmatch(SkinTable[index], "^(.+)1$");
		dwButtonFacadeSetSkin(theme);
		text:SetText(theme.."(亮)");
		dwSetCVar("DuowanBar", "curSkin", theme);
		dwSetCVar("DuowanBar", "Gloss", 1);
		dwButtonFacadeToggleGloss(true);
	else
		dwButtonFacadeSetSkin(SkinTable[index]);
		text:SetText(SkinTable[index]);
		dwSetCVar("DuowanBar", "curSkin", SkinTable[index]);
		dwSetCVar("DuowanBar", "Gloss", 0);
		dwButtonFacadeToggleGloss(false);
	end
end

function DuowanMoveSpinBox_OnShow(self)
	local text = _G[self:GetName() .. "Text"];
	local index = FindSkinIndex();
	if ((index%2) == 0) then
		local theme = strmatch(SkinTable[index], "^(.+)1$");
		text:SetText(theme.."(亮)");
	else
		text:SetText(SkinTable[index]);
	end
end

local function updateMinmaxButtonView(self)
	--if (self.stat == 1) then
	--	self:SetNormalTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Up");
	--	self:SetPushedTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Down");
	--else
		self:SetNormalTexture("Interface\\Buttons\\UI-Panel-ExpandButton-Up");
		self:SetPushedTexture("Interface\\Buttons\\UI-Panel-ExpandButton-Down");
	--end	
end

function DuowanMoveMinmaxButton_OnLoad(self)
	self.stat = 0;
	self.udatefunc = updateMinmaxButtonView;
	self:RegisterForClicks("LeftButtonUp" ,"RightButtonUp");
end