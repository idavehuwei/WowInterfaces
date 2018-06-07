-----------------------------------------------------------
-- Duowan Trade skill ver 1.0
-- 日期：2010年8月26日
-- 作者：独孤傲雪
-- 描述：扩展游戏自带的制作面板，并提供技能切换快捷按键
-- 版权所有 (c) duowan.com
-- 感谢TradeTabs 和 TradeskillHD
-----------------------------------------------------------

DuowanTradeskill = LibStub("AceAddon-3.0"):NewAddon("DuowanTradeskill", "AceHook-3.0", "AceEvent-3.0");
local DT = DuowanTradeskill;
DT.tradeSpells = { -- Spell order in this table determines the tab order
	28596, -- Alchemy
	29844, -- Blacksmithing
	28029, -- Enchanting
	30350, -- Engineering
	45357, -- Inscription
	28897, -- Jewel Crafting
	32549, -- Leatherworking
	53428, -- Runeforging
	2656,  -- Smelting
	26790, -- Tailoring
	
	33359, -- Cooking
	27028, -- First Aid
	
	13262, -- Disenchant
	51005, -- Milling
	31252, -- Prospecting
	818,   -- Basic Campfire
};
DT.config = {
	tabs = true,
	double = true,
};
DT.TradeTabs = {};

function DT:OnInitialize()
	dwAsynCall("Blizzard_TradeSkillUI", "DWT_Init");
end

function DT:OnEnable()
	self:ToggleTabs(true);
end

function DT:OnDisable()
	self:ToggleTabs(false);
end

-----------------------
-- 增加制作标签
-----------------------
do
	local function onEnter(self) 
		GameTooltip:SetOwner(self,"ANCHOR_RIGHT");
		GameTooltip:SetText(self.tooltip);
		self:GetParent():LockHighlight();
	end

	local function onLeave(self) 
		GameTooltip:Hide();
		self:GetParent():UnlockHighlight();
	end   

	local function updateSelection(self)
		if IsCurrentSpell(self.spellID,"spell") then
			self:SetChecked(true);
			self.clickStopper:Show();
		else
			self:SetChecked(false);
			self.clickStopper:Hide();
		end
	end

	local function createClickStopper(button)
		local f = CreateFrame("Frame",nil,button);
		f:SetAllPoints(button);
		f:EnableMouse(true);
		f:SetScript("OnEnter",onEnter);
		f:SetScript("OnLeave",onLeave);
		button.clickStopper = f;
		f.tooltip = button.tooltip;
		f:Hide();
	end

	function DT:CreateTab(spell, spellID, parent)
		local button = CreateFrame("CheckButton", nil, parent, "SpellBookSkillLineTabTemplate,SecureActionButtonTemplate");
		button.tooltip = spell;
		button:Show();
		button:SetAttribute("type","spell");
		button:SetAttribute("spell",spell);
		button.spellID = spellID;
		button:SetNormalTexture(GetSpellTexture(spellID, "spell"));
		
		button:SetScript("OnEvent", updateSelection);
		button:RegisterEvent("TRADE_SKILL_SHOW");
		button:RegisterEvent("TRADE_SKILL_CLOSE");
		button:RegisterEvent("CURRENT_SPELL_CAST_CHANGED");

		createClickStopper(button);
		updateSelection(button);
		return button;
	end
end

function DT:InitTabs()
	if self.initialized then return end
	
	for i=1, #(self.tradeSpells) do
		local n = GetSpellInfo(self.tradeSpells[i]);
		self.tradeSpells[n] = -1;
		self.tradeSpells[i] = n;
	end
	
	local parent = TradeSkillFrame;
	if SkilletFrame then
		parent = SkilletFrame;
		self:UnregisterAllEvents();
	end	

	for i=1,MAX_SPELLS do
		local n = GetSpellName(i,"spell");
		if self.tradeSpells[n] then
			self.tradeSpells[n] = i;
		end		
	end

	local prev;
	for i,spell in ipairs(self.tradeSpells) do
		local spellid = self.tradeSpells[spell];
		if type(spellid) == "number" and spellid > 0 then
			local tab = self:CreateTab(spell,spellid,parent);
			table.insert(self.TradeTabs, tab);
			local point,relPoint,x,y = "TOPLEFT","BOTTOMLEFT",0,-17;
			if not prev then
				prev,relPoint,x,y = parent,"TOPRIGHT",-33,-44;
				if parent == SkilletFrame then x = 0; end
			end
			tab:SetPoint(point, prev, relPoint, x, y);
			prev = tab;
		end
	end

	if (not self.enableTabs) then
		for i, button in ipairs(self.TradeTabs) do
			button:UnregisterEvent("TRADE_SKILL_SHOW");
			button:UnregisterEvent("TRADE_SKILL_CLOSE");
			button:UnregisterEvent("CURRENT_SPELL_CAST_CHANGED");
			button:Hide();
		end
	end
	
	self.initialized = true;
end

function DWT_Init()
	dwSecureCall(DuowanTradeskill.InitTabs, DuowanTradeskill);
end

function DT:ToggleTabs(switch)
	if (switch) then
		if (self.initialized) then
			for i, button in ipairs(self.TradeTabs) do				
				button:RegisterEvent("TRADE_SKILL_SHOW");
				button:RegisterEvent("TRADE_SKILL_CLOSE");
				button:RegisterEvent("CURRENT_SPELL_CAST_CHANGED");
				button:Show();
			end
		else
			self.enableTabs = true;
		end
	else
		if (self.initialized) then
			for i, button in ipairs(self.TradeTabs) do				
				button:UnregisterEvent("TRADE_SKILL_SHOW");
				button:UnregisterEvent("TRADE_SKILL_CLOSE");
				button:UnregisterEvent("CURRENT_SPELL_CAST_CHANGED");
				button:Hide();
			end
		else
			self.enableTabs = false;
		end
	end
end

---------------------
-- 扩展制作窗口
---------------------
