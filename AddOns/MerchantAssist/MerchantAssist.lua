-------------------------------------------------------------------------------
-- MerchantAssist ver 1.01
-- 日期：2010-5-19
-- 作者：dugu
-- 描述：自动贩卖垃圾物品、自动修理破损装备、自动购买法术材料
-- 版权所有 (c) duowan.com
-------------------------------------------------------------------------------
MerchantAssist = LibStub("AceAddon-3.0"):NewAddon("MerchantAssist", "AceEvent-3.0", "AceHook-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("MerchantAssist", true);
--local ItemPrice = LibStub("ItemPrice-1.1", true);
MerchantAssist["AutoSellButtons"] = {};
MerchantAssist["AutoSellTitles"] = {};
MerchantAssist["AutoBuyButtons"] = {};
MerchantAssist["BagItemInfo"] = {};
MerchantAssist["AutoBuyItemInfo"] = {};
MerchantAssist["TempBagItemInfo"] = {};
MerchantAssist["CollapsedHeader"] = {};
MerchantAssist["AutobuyAddItemButton"] = {};
MerchantAssist["ClassItemInfo"] = {};
local ITEMS_TO_DISPLAY = 8;
local btnText = L["贩卖垃圾"];
local MONEY_PATTERN = "|cffffff00%d" .. L["金"] ..  "|r |cffbbbbbb%d".. L["银"] .."|r |cffffcc00%d".. L["铜"] .. "|r";
local playerName = UnitName("player");
local _DEBUG = false;
local ident = GetCVar("realmName") .. "_" .. playerName;
local curAutoSellItemID;
local curAutoBuySelect;
local curAutoBuyItemID;
local curItemPrice;
local MerchantAssistConfig = {
	["UseGuidBank"] = true;
	["Repair"] = true,
	["RepairInventory"] = true,
	["Sell"] = true,
	["SellAY"] = true,		-- true 表示不出售
	["AutoBuy"] = true,
};

ITEM_QUALITY_COLOR = {
	[0] = {r=157, g=157, b=157},
	[1] = {r=255, g=255, b=255},
	[2] = {r=30, g=255, b=0},
	[3] = {r=0, g=112, b=221},
	[4] = {r=163, g=53, b=238},
	[5] = {r=157, g=157, b=157},
	[6] = {r=157, g=157, b=157},
	[7] = {r=157, g=157, b=157}
};

StaticPopupDialogs["MERCHANT_AUTOSELL_CONFIRM"] = {
	text = L["确定将 %s 设置为自动售卖物品"],
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function()
		if (curAutoSellItemID and GetItemInfo(curAutoSellItemID)) then
			MerchantAssist:AddAutoSellItem(curAutoSellItemID);			
			MerchantAssist:ScanBags(true);
			MerchantAssist_Update();
		end
	end,
	OnCancel = function()		
	end,
	timeout = 30,
	showAlert = 1,
	hideOnEscape = 1
};

StaticPopupDialogs["MERCHANT_DELETE_AUTOSELL"] = {
	text = L["确定从自动售卖列表中取消\n%s"],
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function()
		if (curAutoSellItemID and GetItemInfo(curAutoSellItemID)) then
			MerchantAssist:DeleteAutoSellItem(curAutoSellItemID);
			MerchantAssist:InitAutoSellItemList();
			MerchantAssist_Update();
		end
	end,
	OnCancel = function()		
	end,
	timeout = 30,
	showAlert = 1,
	hideOnEscape = 1
};

StaticPopupDialogs["MERCHANT_AUTOBUY_CONFIRM"] = {
	text = L["确定将 %s 设置为自动购买物品"],
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function()
		if (GetItemInfo(StaticPopupDialogs["MERCHANT_AUTOBUY_CONFIRM"].ItemID)) then
			MerchantAssist:AddToList(StaticPopupDialogs["MERCHANT_AUTOBUY_CONFIRM"].ItemID);
			MerchantAssist:UpdateAutoBuyInfo();
			MerchantAssist_Update();
		end
	end,
	OnCancel = function()		
	end,
	timeout = 30,
	showAlert = 1,
	hideOnEscape = 1
};

StaticPopupDialogs["MERCHANT_DELETE_AUTOBUY"] = {
	text = L["确定取消对%s的自动购买"],
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function()
		if (GetItemInfo(curAutoBuyItemID)) then
			MerchantAssist:RemoveFromList(curAutoBuyItemID);
			MerchantAssist:UpdateAutoBuyInfo();
			MerchantAssist_Update();
		end
	end,
	OnCancel = function()		
	end,
	timeout = 30,
	showAlert = 1,
	hideOnEscape = 1
};

StaticPopupDialogs["MERCHANT_AUTOBUY_ITEM_CONFIRM"] = {
	text = L["确定购买以下物品:\n %s"],
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function()
		if (StaticPopupDialogs["MERCHANT_AUTOBUY_ITEM_CONFIRM"].list and MerchantAssist:getn(StaticPopupDialogs["MERCHANT_AUTOBUY_ITEM_CONFIRM"].list)) then
			local cost = 0;
			for id, need in pairs(StaticPopupDialogs["MERCHANT_AUTOBUY_ITEM_CONFIRM"].list) do				
				cost = cost + MerchantAssist:BuyItem(id, need);
				if cost > 0 then
					MerchantAssist:PrintCost(cost, L["自动购买: "]);
				end
			end
		end
	end,
	OnCancel = function()		
	end,
	timeout = 30,
	showAlert = 1,
	hideOnEscape = 1
};

MerchatAssistDB = {};

-- 暗月马戏团任务物品
AUTO_SELL_ANYUE_ITEMS = {
	[L["毛茸茸的小爪子"]] = true,
	[L["破损的熊皮"]] = true,
	[L["柔软的尾巴"]] = true,
	[L["鲜艳的羽毛"]] = true,
	[L["邪恶的蝙蝠眼"]] = true,
};

-------------------
-- 法术材料过滤条件
local GLYPHOFRENEWEDLIFE = 58059;	-- 新生雕文
local GLYPHOFRAISEDEAD = 60200;		-- 亡者复生雕文
local GLYPHOFREBIRTH = 54733;		-- 复生雕文

local function FilterGlyph(glyph)
	local spellId;
	for i=1, GetNumGlyphSockets()  do
		spellId = select(3, GetGlyphSocketInfo(i));
		--local link = GetGlyphLink(i);
		--print(spellId .. " -=> " .. link)
		if (spellId and spellId == glyph) then
			return false;
		end
	end
	return true;
end

AUTO_BUY_ITEMS = {};
-- 德鲁伊
AUTO_BUY_ITEMS["DRUID"] = {};
AUTO_BUY_ITEMS["DRUID"][1] = {id = 17034, need = -1, show = true, level = 20, maxlevel = 30, func=function() FilterGlyph(GLYPHOFREBIRTH) end};-- 枫树种子 复生(1)
AUTO_BUY_ITEMS["DRUID"][2] = {id = 17035, need = -1, show = true, level = 30, maxlevel = 40, func=function() FilterGlyph(GLYPHOFREBIRTH) end};-- 荆棘种子 复生(2)
AUTO_BUY_ITEMS["DRUID"][3] = {id = 17036, need = -1, show = true, level = 40, maxlevel = 50, func=function() FilterGlyph(GLYPHOFREBIRTH) end};-- 灰木种子 复生(3)
AUTO_BUY_ITEMS["DRUID"][4] = {id = 17037, need = -1, show = true, level = 50, maxlevel = 60, func=function() FilterGlyph(GLYPHOFREBIRTH) end};-- 角树种子 复生(4)
AUTO_BUY_ITEMS["DRUID"][5] = {id = 17038, need = -1, show = true, level = 60, maxlevel = 70, func=function() FilterGlyph(GLYPHOFREBIRTH) end};-- 铁木种子 复生(5)
AUTO_BUY_ITEMS["DRUID"][6] = {id = 22147, need = -1, show = true, level = 70, maxlevel = 79, func=function() FilterGlyph(GLYPHOFREBIRTH) end};-- 灼草种子 复生(6)
AUTO_BUY_ITEMS["DRUID"][7] = {id = 44614, need = -1, show = true, level = 79, maxlevel = -1, func=function() FilterGlyph(GLYPHOFREBIRTH) end};-- 星葉種子 复生(7)
AUTO_BUY_ITEMS["DRUID"][8] = {id = 17021, need = -1, show = true, level = 50, maxlevel = 60, func=nil};-- 野生浆果 野性赐福
AUTO_BUY_ITEMS["DRUID"][9] = {id = 17026, need = -1, show = true, level = 60, maxlevel = 70, func=nil};-- 野生棘根草 野性赐福
AUTO_BUY_ITEMS["DRUID"][10] = {id = 22148, need = -1, show = true, level = 70, maxlevel = 80, func=nil};-- 野生刺藤 野性赐福
AUTO_BUY_ITEMS["DRUID"][11] = {id = 44605, need = -1, show = true, level = 80, maxlevel = -1, func=nil};-- 野脊葉 野性賜福(4)
-- 法师
AUTO_BUY_ITEMS["MAGE"] = {};
AUTO_BUY_ITEMS["MAGE"][1] = {id = 17031, need = -1, show = true, level = 20, maxlevel = -1, func=nil};	-- 传送符文
AUTO_BUY_ITEMS["MAGE"][2] = {id = 17032, need = -1, show = true, level = 40, maxlevel = -1, func=nil};	-- 传送门符文
AUTO_BUY_ITEMS["MAGE"][3] = {id = 17020, need = -1, show = true, level = 56, maxlevel = -1, func=nil};	-- 魔粉
-- 圣骑士
AUTO_BUY_ITEMS["PALADIN"] = {};
AUTO_BUY_ITEMS["PALADIN"][1] = {id = 17033, need = -1, show = true, level = 30, maxlevel = -1, func=nil};	 -- 神圣符印
AUTO_BUY_ITEMS["PALADIN"][2] = {id = 21177, need = -1, show = true, level = 60, maxlevel = -1, func=nil};	 -- 王者印记
-- 牧师
AUTO_BUY_ITEMS["PRIEST"] = {};
AUTO_BUY_ITEMS["PRIEST"][1] = {id = 17028, need = -1, show = true, level = 48, maxlevel = 60, func=nil};	-- 圣洁蜡烛
AUTO_BUY_ITEMS["PRIEST"][2] = {id = 17029, need = -1, show = true, level = 60, maxlevel = 70, func=nil};	-- 神圣蜡烛
AUTO_BUY_ITEMS["PRIEST"][3] = {id = 44615, need = -1, show = true, level = 70, maxlevel = -1, func=nil};	-- 虔诚蜡烛
-- 萨满
AUTO_BUY_ITEMS["SHAMAN"] = {};
AUTO_BUY_ITEMS["SHAMAN"][1] = {id = 17030, need = -1, show = true, level = 30, maxlevel = -1, func=function() FilterGlyph(GLYPHOFRENEWEDLIFE) end};	-- 十字章
-- 术士
AUTO_BUY_ITEMS["WARLOCK"] = {};
AUTO_BUY_ITEMS["WARLOCK"][1] = {id = 16583, need = -1, show = true, level = 60, maxlevel = -1, func=nil};	-- 恶魔雕像
AUTO_BUY_ITEMS["WARLOCK"][2] = {id = 5565, need = -1, show = true, level = 55, maxlevel = -1, func=nil};	-- 地狱火石
-- 死亡骑士
AUTO_BUY_ITEMS["DEATHKNIGHT"] = {};
AUTO_BUY_ITEMS["DEATHKNIGHT"][1] = {id = 37201, need = -1, show = true, level = 55, maxlevel = -1, func=function() FilterGlyph(GLYPHOFRAISEDEAD) end};	-- 屍塵

AUTO_BUY_ITEMS["ROGUE"] = {};
AUTO_BUY_ITEMS["HUNTER"] = {};
AUTO_BUY_ITEMS["WARRIOR"] = {};



AUTO_REPAIR_SLOT = {};
AUTO_REPAIR_SLOT[1] = "HeadSlot";
AUTO_REPAIR_SLOT[2] = "ShoulderSlot";
AUTO_REPAIR_SLOT[3] = "ChestSlot";
AUTO_REPAIR_SLOT[4] = "WaistSlot";
AUTO_REPAIR_SLOT[5] = "LegsSlot";
AUTO_REPAIR_SLOT[6] = "FeetSlot";
AUTO_REPAIR_SLOT[7] = "WristSlot";
AUTO_REPAIR_SLOT[8] = "HandsSlot";
AUTO_REPAIR_SLOT[9] = "MainHandSlot";
AUTO_REPAIR_SLOT[10] = "SecondaryHandSlot";
AUTO_REPAIR_SLOT[11] = "RangedSlot";

function MerchantAssist:debug(msg, ...)
	if (_DEBUG) then
		print(format(msg, ...));
	end
end

-- 合并表, 优先考虑a
function MerchantAssist:MergeTable(a, b)
	for k, v in pairs(b) do
		if (type(v) == "table") then
			a[k] = a[k] or {};
			self:MergeTable(a[k], v);
		else
			a[k] = a[k] or b[k];
		end
	end
end

function MerchantAssist:IsIgnorItem(item)
	if ((not MerchantAssistConfig.SellAY and AUTO_SELL_ANYUE_ITEMS[item])) then
		return true;
	end
	return false;
end

function MerchantAssist:getn(t)
	local count = 0;
	for k, v in pairs(t) do
		count = count + 1;
	end
	return count;
end

function MerchantAssist:OnInitialize()	
	self.Tooltip = CreateFrame("GameTooltip", "MerChatAssistTooltip", UIParent, "GameTooltipTemplate");
	self.Tooltip:SetOwner(UIParent, "ANCHOR_NONE");
	self.Tooltip:SetScript("OnTooltipAddMoney", function(self, amount)
		if (InRepairMode()) then
			return;
		end
		curItemPrice = amount;
	end);
	self:RegisterEvent("MERCHANT_SHOW", "OnMerchantShow");
	if (not MerchatAssistDB[ident]) then
		MerchatAssistDB[ident] = {};
	end
	self.db = MerchatAssistDB[ident];
	self:UpdateDB();
end

function MerchantAssist:OnEnable()
	self:RegisterEvent("MERCHANT_SHOW", "OnMerchantShow");
	self:RegisterEvent("MERCHANT_CLOSED", "OnMerchantClose");
	self:RegisterEvent("UNIT_LEVEL");
	self:SecureHook("MerchantFrame_Update");
end

function MerchantAssist:OnDisable()
	self:UnregisterEvent("MERCHANT_SHOW");
	self:UnregisterEvent("MERCHANT_CLOSED");
	self:UnregisterEvent("UNIT_LEVEL");
	self:Unhook("MerchantFrame_Update");
	self:HideAutoBuyAddItemButtons();
end

function MerchantAssist:GetPrice(bag, slot)
	curItemPrice = 0;
	MerChatAssistTooltip:SetBagItem(bag, slot);
	return curItemPrice;
end

function MerchantAssist:UpdateDB()
	local _, class = UnitClass("player");
	local db = AUTO_BUY_ITEMS[class];
	local level = UnitLevel("player");
	-- TODO: 逻辑需要重新建立
	local name, stack, need;
	local tmp = {};
	local tmp2 = {};
	for k, v in pairs(db) do
		name, _, _, _, _, _, _, stack = GetItemInfo(v.id);
		if (name) then
			if (level >= v.level and (v.maxlevel < 0 or level < v.maxlevel)) then
				need = v.need > 0 and v.need or stack;
				tmp[v.id] = {need = need, show = v.show};
			end
			self["ClassItemInfo"][v.id] = v.func;
			tmp2[v.id] = v;
		end
	end

	if (not self.db["autobuy"] and type(self.db["autobuy"]) ~= "table") then
		self.db["autobuy"] = {};
	end
	self:MergeTable(self.db["autobuy"], tmp);
	
	for k, v in pairs(self.db["autobuy"]) do
		if (tmp2[k]) then
			if (level < tmp2[k].level or (tmp2[k].maxlevel >0 and level>= tmp2[k].maxlevel)) then
				v.show = false;
			end
		end
	end
	
	if (not self.db["autosell"] or type(self.db["autosell"]) ~= "table") then
		self.db["autosell"] = {};
	end
end

function AutoRepair_Toggle(switch)
	MerchantAssistConfig.Repair = switch;
end

function AutoSell_Toggle(switch)
	MerchantAssistConfig.Sell = switch;	
end
function AutoSell_ToggleIgnor(switch)
	MerchantAssistConfig.SellAY = switch;	
end
function AutoRepair_UseGuidBank(switch)
	MerchantAssistConfig.UseGuidBank = switch;
end

function AutoRepair_RepairInvOnly(switch)
	MerchantAssistConfig.RepairInventory = switch;
end

function AutoBuy_Toggle(switch)
	MerchantAssistConfig.AutoBuy = switch;
end
-- 修理身上装备
function MerchantAssist:RepairInventory()
	if (CanMerchantRepair()) then
		local totalCost = 0;
		local id, hasItem, repairCost;
		for i, v in ipairs(AUTO_REPAIR_SLOT) do
			id, textureName = GetInventorySlotInfo(v);
			hasItem, _, repairCost = self.Tooltip:SetInventoryItem("player", id);
			if ( hasItem and repairCost ) then
				ShowRepairCursor();
				PickupInventoryItem(id);
				totalCost = totalCost + repairCost;
			end
		end
		HideRepairCursor();
		return totalCost;
	end
end

function MerchantAssist:OnMerchantShow()	
	local totalCost = 0;
	if ( CanMerchantRepair() and MerchantAssistConfig.Repair) then			
		if (GetRepairAllCost() ~= 0) then
			-- 使用公会银行
			if (MerchantAssistConfig.UseGuidBank and CanGuildBankRepair()) then
				RepairAllItems(1);
				PlaySound("ITEM_REPAIR");
			end
			-- 只修理身上的装备
			if (MerchantAssistConfig.RepairInventory) then
				totalCost = self:RepairInventory();
				if (totalCost > 0) then
					self:PrintCost(totalCost, L["自动修理了全身装备, 此次修理共花费: "])
				end
			else
				if ( GetRepairAllCost() < GetMoney() ) then				
					RepairAllItems();
					totalCost = GetRepairAllCost();
					self:PrintCost(totalCost, L["自动修理了所有装备, 此次修理装备花费:"]);	
				else
					Print(L["抱歉, 你的钱不够修复全身装备."]);
				end
			end			
		end
	end
	
	-- 自动售卖垃圾物品
	self:Sell_Junk();

	if (MerchantAssistConfig.AutoBuy) then
		self:BuyItems();
	end
end

function MerchantAssist:OnMerchantClose()
	if (MerchantAssistFrame:IsVisible()) then
		MerchantAssistFrame:Hide();
	end
end

function MerchantAssist:UNIT_LEVEL(event, unit)
	if (unit == "player") then
		self:UpdateDB();		
	end
end

function MerchantAssist:PrintCost(Cost, prev)
	local msg = prev or "";
	local gold, silver, copper;
	gold = floor(Cost/10000);
	Cost = Cost - gold*10000;
	silver = floor(Cost/100);
	Cost = Cost - silver*100;
	copper = Cost;

	msg = msg .. format(MONEY_PATTERN, gold, silver, copper);
	Print(msg);
end

function MerchantAssist:Sell_Junk()
	self:ScanBags(MerchantAssistConfig.Sell);	
end

function MerchantAssist:FindMerchatItem(name)
	local index,itemName, texture, price, size, maxNum;
	for index=1, GetMerchantNumItems() do
		itemName, texture, price, size, maxNum = GetMerchantItemInfo(index);
		
		if (name == itemName) then			
			return index, price, size, maxNum ;
		end
	end
	return nil, nil, 0, 0;
end

function MerchantAssist:BuyItem(itemID, needed)
	local name = GetItemInfo(itemID);
	if (not name) then
		return;
	end
	
	if needed <= 0 then
		return 0;
	end
	
	local index, price, size, maxNum = self:FindMerchatItem(name);	
	if not index or not size or size < 1 then
		return 0;
	end

	-- 可购数量有限制
	if maxNum ~= -1 then
		if maxNum == 0 then
			return 0;
		end

		if needed > maxNum then
			needed = maxNum;
		end
	end

	local loops = 0;
	local qty = nil;
	local leftover = 0;

	if size == 1 then
		qty = GetMerchantItemMaxStack(index);
		if maxNum ~= -1 and qty > maxNum then
			qty = maxNum;
		end

		if (qty or 0) < 1 then
			return 0;
		end

		loops = math.floor(needed / qty);
		leftover = needed % qty;
		price = price * (loops * qty + leftover);
		if GetMoney() < price then
			return 0;
		end
	else
		loops = math.floor(needed / size);
		price = price * loops;		
		if GetMoney() < price then			
			return 0;
		end
	end
	
	for i = 1, loops do
		BuyMerchantItem(index, qty);
	end

	if leftover > 0 then
		BuyMerchantItem(index, leftover);
	end
	
	return price;
end

function MerchantAssist:BuyItems()
	local cost = 0;
	local tmp = {};
	local text = "";
	
	for id, v in pairs(self.db.autobuy) do
		if (v.show and (type(self["ClassItemInfo"][id]) ~= "function" or self["ClassItemInfo"][id]())) then
			local needed = v.need - GetItemCount(id);
			if (needed > 0 and self:FindMerchatItem(GetItemInfo(id))) then
				text = text .. select(2, GetItemInfo(id)) .. " x " .. needed .. "\n";
				tmp[id] = needed;
			end
		end
	end

	if (self:getn(tmp) > 0) then
		StaticPopupDialogs["MERCHANT_AUTOBUY_ITEM_CONFIRM"].list = tmp;
		StaticPopup_Show("MERCHANT_AUTOBUY_ITEM_CONFIRM", text);
	end
end

function MerchantSpinBoxPrev_OnLoad(self)
	self:RegisterForClicks("LeftButtonUp" ,"RightButtonUp");
end

function MerchantSpinBoxPrev_OnClick(self)
	local parent = self:GetParent():GetParent();
	local itemID = parent.itemID;
	local editbox = _G[self:GetParent():GetName() .. "EditBox"];
	if (itemID and MerchatAssistDB[ident]["autobuy"][itemID] and MerchatAssistDB[ident]["autobuy"][itemID].need > 0) then
		MerchatAssistDB[ident]["autobuy"][itemID].need = MerchatAssistDB[ident]["autobuy"][itemID].need - 1;
		editbox:SetNumber(MerchatAssistDB[ident]["autobuy"][itemID].need);
	end
end

function MerchantSpinBoxNext_OnLoad(self)
	self:RegisterForClicks("LeftButtonUp" ,"RightButtonUp");
end

function MerchantSpinBoxNext_OnClick(self)
	local parent = self:GetParent():GetParent();
	local itemID = parent.itemID;
	local editbox = _G[self:GetParent():GetName() .. "EditBox"];
	if (itemID and MerchatAssistDB[ident]["autobuy"][itemID] and MerchatAssistDB[ident]["autobuy"][itemID].need) then
		MerchatAssistDB[ident]["autobuy"][itemID].need = MerchatAssistDB[ident]["autobuy"][itemID].need + 1;
		editbox:SetNumber(MerchatAssistDB[ident]["autobuy"][itemID].need);
	end
end

function MerchantSpinBoxEditBox_OnTextChanged(self)
	local parent = self:GetParent():GetParent();
	local itemID = parent.itemID;
	local value = self:GetNumber();
	local editbox = _G[self:GetParent():GetName() .. "EditBox"];
	if (type(value) == "number") then
		if (itemID and MerchatAssistDB[ident]["autobuy"][itemID] and MerchatAssistDB[ident]["autobuy"][itemID].need) then
			MerchatAssistDB[ident]["autobuy"][itemID].need = value;
			editbox:SetNumber(value);
		end
	end
end

local TabIndex = {};
function MerchantSpinBoxEditBox_OnTabPressed(self)
	EditBox_HandleTabbing(TabIndex);
end

function MerchantSpinBox_OnShow(self)
	local parent = self:GetParent();
	local eidtbox = _G[self:GetName() .. "EditBox"];
	if (parent.itemID and MerchatAssistDB[ident]["autobuy"][parent.itemID] and MerchatAssistDB[ident]["autobuy"][parent.itemID].need) then
		eidtbox:SetNumber(MerchatAssistDB[ident]["autobuy"][parent.itemID].need);
	end
end

function MerchantAssist:GetItemID(link)
	local itemID;
	if (link and type(link) == "string") then
		itemID = strmatch(link, "|c%x+|Hitem:(%d+):.+|h%[.-%]|h|r");
	end
	return itemID;
end

function MerchantAssist:AddAutoSellItem(itemID)
	self.db["autosell"][itemID] = true;
end

function MerchantAssist:DeleteAutoSellItem(itemID)
	self.db["autosell"][itemID] = nil;
end

function MerchantAssist:AddAutoBuyItem(itemID)
	local itemName, link, quality, itemLevel, level, mType, sType, stack = GetItemInfo(itemID);
	if (stack and not self.db["autobuy"][itemID]) then
		self.db["autobuy"][itemID] = {need = stack, show = true};
	end	
end

function MerchantAssist:DeleteAutoBuyItem(itemID)
	self.db["autobuy"][itemID] = nil;
end

function MerChantBaseItem_OnEnter(self)
	if (self:GetParent().itemID) then
		local _, link = GetItemInfo(self:GetParent().itemID);
		if (link) then
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT");
			GameTooltip:SetHyperlink(link);
		end
	end
end

function MerChantBaseItem_OnLeave(self)
	GameTooltip:Hide();
end

function MerChantBaseItem_OnClick(self, button)
	if (MerchantAssist.curType == "autosell") then
		curAutoSellItemID = self:GetParent().itemID;
		if (IsControlKeyDown()) then
			if (not MerchantAssist.db.autosell[curAutoSellItemID]) then
				MerchantAssist:AddAutoSellItem( self:GetParent().itemID);
				MerchantAssist:ScanBags(true);
				MerchantAssist_Update();
			end
		else			
			local _, link = GetItemInfo(curAutoSellItemID);
			if (link) then
				if (MerchantAssist.db.autosell[curAutoSellItemID]) then					
					StaticPopup_Show("MERCHANT_DELETE_AUTOSELL", link);
				else
					StaticPopup_Show("MERCHANT_AUTOSELL_CONFIRM", link);
				end
			end
		end
	elseif (MerchantAssist.curType == "autobuy") then
		local p = self:GetParent();
		local _, link = GetItemInfo(p.itemID);
		if (link) then
			curAutoBuyItemID = p.itemID;
			StaticPopup_Show("MERCHANT_DELETE_AUTOBUY", link);
		end
	end
end

function MerchantAssist:SellItem(itemID)
	local bagId, slotId
	for bagId = 0, 4 do
		for slotId = 1, GetContainerNumSlots(bagId) do
			local itemLink = GetContainerItemLink(bagId, slotId);
			if ( itemLink ) then				
				local id = self:GetItemID(itemLink);
				if (id == itemID) then
					UseContainerItem(bagId, slotId)
					Print(L["售出"] .. ": " .. itemLink, 1, 1, 0);
				end
			end
		end
	end	
end

function MerchantAssist:UpdateState()
	for k, v in ipairs(self.AutoBuyButtons) do
		if (curAutoBuySelect and curAutoBuySelect == v) then
			v:LockHighlight();
		else
			v:UnlockHighlight();
		end
	end
end

function MerchantAssist:UpdateAutoBuyInfo()
	wipe(self.AutoBuyItemInfo);
	local itemName, link, quality, itemLevel, level, mType, sType, stack, slot, texture;
	for k, v in pairs(self.db.autobuy) do
		if (v.show) then
			itemName, link, quality, itemLevel, level, mType, sType, stack, slot, texture = GetItemInfo(k);
			local need = v.need == -1 and stack or v.need;
			tinsert(self.AutoBuyItemInfo, {need = need, name = itemName, itemID = k, icon = texture, stack = stack});
		end
	end
end

function MerchantAssist:GetItemInfo(bagId, slotId)
	local link, count, money = "", 0, 0;
	if (slotId) then
		link = GetContainerItemLink(bagId, slotId);
		_, count = GetContainerItemInfo(bagId, slotId);
		if (count and count > 0) then
			money = self:GetPrice(bagId, slotId) / count;
		end			
	else
		link = select(2, GetItemInfo(bagId));
	end
	if (link) then
		local itemID = self:GetItemID(link);
		local itemName, link, quality, itemLevel, level, mType, sType, stack, slot, texture = GetItemInfo(itemID);
		
		return itemID, itemName, link, texture, money, quality, count;
	end
end

function MerchantAssist:IsItemAutoSell(itemID, itemName, quality)
	if ((self.db["autosell"][itemID] or (quality and quality == 0)) and not self:IsIgnorItem(itemName)) then
		return true;
	end
	return false;
end

function MerchantAssist:StoreItem(tmpTable, itemID, itemName, texture, quality, price)
	if (type(tmpTable) == "table") then
		tmpTable[quality] = tmpTable[quality] or {};
		if (not tmpTable[quality][itemID]) then
			tmpTable[quality][itemID] = {};
			tmpTable[quality][itemID]["itemName"] = itemName;
			tmpTable[quality][itemID]["icon"] = texture;
			tmpTable[quality][itemID]["count"] = GetItemCount(itemID);
			tmpTable[quality][itemID]["price"] = price;
		end
	end
end

function MerchantAssist:ScanBags(autoSell)
	wipe(self.TempBagItemInfo);
	wipe(self.BagItemInfo);

	local tmpTable = {};
	local itemID, itemName, link, texture, money, quality, count;
	local totalMoney = 0;
	for bagId = 0, NUM_BAG_FRAMES, 1 do
		local numSlots = GetContainerNumSlots(bagId);
		if (numSlots and numSlots > 0) then
			for slotId =numSlots, 1, -1 do
				itemID, itemName, link, texture, money, quality, count = self:GetItemInfo(bagId, slotId);
				
				if (itemName) then
					if (autoSell) then
						if (self:IsItemAutoSell(itemID, itemName, quality) and money and money > 0) then
							if ( MerchantFrame:IsVisible() and not locked ) then								
								UseContainerItem(bagId, slotId);
								totalMoney = totalMoney + money*count;
								Print(L["售出"] .. ": " .. link, 1, 1, 0);
							end
						else
							if (itemName and texture and money and money > 0) then	
								self:StoreItem(tmpTable, itemID, itemName, texture, quality, money);
							end
						end
					else
						if (itemName and texture and money and money > 0) then							
							self:StoreItem(tmpTable, itemID, itemName, texture, quality, money);
						end
					end
				end
			end
		end
	end
	
	if (autoSell and totalMoney > 0) then
		self:PrintCost(totalMoney, L["出售物品总价为: "])		
	end
	self.TempBagItemInfo = tmpTable;
	self:InitAutoSellItemList();
end

function MerchantAssist:InitAutoSellItemList()
	local index;

	wipe(self.BagItemInfo);	

	for index = 0, 7 do
		if ( self.TempBagItemInfo[index] ) then
			table.sort(self.TempBagItemInfo[index]);
			local item = {};
			item["name"] = MERCHANT_ASSIST_QUALITY_NAME[index];
			item["header"] = 1;
			item["color"] = ITEM_QUALITY_COLOR[index];

			if ( not self.CollapsedHeader[MERCHANT_ASSIST_QUALITY_NAME[index]] ) then
				item["expanded"] = 1;
			end

			table.insert(self.BagItemInfo, item);
			
			if ( not self.CollapsedHeader[MERCHANT_ASSIST_QUALITY_NAME[index]] ) then
				for itemID, value in pairs(self.TempBagItemInfo[index]) do					
					item = {};
					item["itemID"] = itemID;
					item["name"] = value["itemName"];
					item["icon"] = value["icon"];
					item["count"] = value["count"];
					item["price"] = value["price"];
					item["quality"] = index;
					table.insert(self.BagItemInfo, item);
				end
			end
		end
	end

	local count = self:getn(self.db.autosell);
	if ( count > 0 ) then
		local item = {};
		item["name"] = L["自动售卖物品"];
		item["header"] = 1;
		item["color"] = {r=255, g=255, b=0};

		if ( not self.CollapsedHeader[L["自动售卖物品"]] ) then
			item["expanded"] = 1;
		end

		table.insert(self.BagItemInfo, item);
		local itemID, itemName, link, texture, money, quality;
		if ( not self.CollapsedHeader[L["自动售卖物品"]] ) then
			for itemID, _ in pairs(self.db.autosell) do
				itemID, itemName, link, texture, money, quality = self:GetItemInfo(itemID);
				item = {};
				item["itemID"] = itemID;
				item["name"] = itemName;
				item["icon"] = texture;
				item["count"] = GetItemCount(itemID) or 0;
				item["price"] = money * item["count"];
				item["quality"] = quality;
				table.insert(self.BagItemInfo, item);
			end
		end
	end

end

function MerchantAssist:GetNumItemLines()
	if (self.curType == "autosell") then
		return self:getn(self.BagItemInfo);
	else
		return self:getn(self.AutoBuyItemInfo);
	end
end

function MerchantAssist:GetItemLineInfo(index)
	local ishead, expanded, name, icon, count, price, color, itemID, quality;
	local tmp = self.BagItemInfo[index];
	if (tmp and type(tmp) == "table") then
		if (tmp["header"]) then
			ishead = true;
			expanded = tmp["expanded"];
			name = tmp["name"];
			color = tmp["color"];
		else
			ishead = false;
			itemID = tmp["itemID"];
			name = tmp["name"];
			icon = tmp["icon"];
			count = tmp["count"];
			price = tmp["price"];
			quality = tmp["quality"];
			color = ITEM_QUALITY_COLOR[tmp["quality"]];
		end
	end
	return ishead, expanded, name, icon, count, price, color, itemID, quality;
end

function MerchantAssist:SetItem(index, i)
	if (self.curType == "autosell") then
		local ishead, expanded, name, icon, count, price, color, itemID, quality = self:GetItemLineInfo(i);
		if (ishead) then
			MerchantAssist["AutoSellTitles"][index]:SetText(name);
			MerchantAssist["AutoSellButtons"][index]:Hide();
			MerchantAssist["AutoSellTitles"][index]:Show();
			MerchantAssist["AutoSellTitles"][index].itemIndex = i;			
			if ( expanded ) then
				MerchantAssist["AutoSellTitles"][index]:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
				MerchantAssist["AutoSellTitles"][index].isExpanded = 1;
			else
				MerchantAssist["AutoSellTitles"][index]:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
				MerchantAssist["AutoSellTitles"][index].isExpanded = nil;
			end
			return;
		else
			local bname = MerchantAssist["AutoSellButtons"][index]:GetName();
			local title = _G[bname .. "Name"];
			local countText = _G[bname .. "ItemCount"];
			local moneyFrame = _G[bname .. "Money"];
			local iconTexture = _G[bname .. "ItemIcon"];

			title:SetText(name)
			title:SetTextColor(color.r / 255, color.g / 255, color.b / 255);
			countText:SetText(count);
			iconTexture:SetTexture(icon);
			MoneyFrame_Update(moneyFrame:GetName(), price * count);
			MerchantAssist["AutoSellButtons"][index].itemID = itemID;
			MerchantAssist["AutoSellButtons"][index].quality = quality;
			MerchantAssist["AutoSellTitles"][index]:Hide();
			MerchantAssist["AutoSellButtons"][index]:Show();
		end
	else
		local name = MerchantAssist["AutoBuyButtons"][index]:GetName();
		local title = _G[name .. "Name"];
		local countText = _G[name .. "ItemCount"];
		local editBox = _G[name .. "SpinBoxEditBox"];
		local iconTexture = _G[name .. "ItemIcon"];
		local tmp = self.AutoBuyItemInfo[i];

		title:SetText(tmp.name);
		countText:SetText(GetItemCount(tmp.name));
		iconTexture:SetTexture(tmp.icon);
		editBox:SetNumber(tonumber(tmp.need));
		MerchantAssist["AutoBuyButtons"][index].itemID = tmp.itemID;
		MerchantAssist["AutoBuyButtons"][index]:Show();
	end
end

function MerchantAssist:HideButton(index)
	if (self.curType == "autosell") then
		MerchantAssist["AutoSellButtons"][index]:Hide();
		MerchantAssist["AutoSellTitles"][index]:Hide();
	else		
		MerchantAssist["AutoBuyButtons"][index]:Hide();
	end
end

function MerchantAssist_Update()
	local numItemLines = MerchantAssist:GetNumItemLines();
	local offset = (FauxScrollFrame_GetOffset(MerchantAssistFrameScrollFrame) or 0) + 1;

	local index = 1;
	for i = offset,  offset + ITEMS_TO_DISPLAY - 1 do
		if ( i <= numItemLines ) then
			MerchantAssist:SetItem(index, i);
		else
			break;
		end
		index = index + 1;
	end

	if (MerchantAssist.curType == "autosell") then			
		MerchantAssistFrameAutoSellFrameExpandFrameAllButton.isExpanded = 1;
		MerchantAssistFrameAutoSellFrameExpandFrameAllButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
		for i = 1, numItemLines do
			local ishead, expanded, name, icon, count, price, color = MerchantAssist:GetItemLineInfo(i);
			if ( ishead ) then
				if ( not expanded ) then
					MerchantAssistFrameAutoSellFrameExpandFrameAllButton.isExpanded = nil;
					MerchantAssistFrameAutoSellFrameExpandFrameAllButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
					break;
				end
			end
		end
	end

	if (index < ITEMS_TO_DISPLAY) then
		for i = index, ITEMS_TO_DISPLAY do
			MerchantAssist:HideButton(i);
		end
	end	
	FauxScrollFrame_Update(MerchantAssistFrameScrollFrame, numItemLines, ITEMS_TO_DISPLAY, 37 );
end

function MerchantAssistFrame_OnScroll(self, offset)
	FauxScrollFrame_OnVerticalScroll(self, offset, 37, MerchantAssist_Update);
end

function MerchantAssist:AddToList(itemID)	
	if (self.curType == "autobuy") then
		local itemName, link, quality, itemLevel, level, mType, sType, stack, slot, texture = GetItemInfo(itemID);
		itemID = self:GetItemID(link);
		if (itemName and not self.db["autobuy"][itemID]) then
			self:AddAutoBuyItem(itemID);
		end
	end
end

function MerchantAssist:RemoveFromList(itemID, index)
	-- TODO: 关联到配置档
	local t = self.db["autobuy"];
	if (self.curType == "autosell") then
		t = self.TempBagItemInfo[index];
	end

	for k, v in pairs(t) do
		if (tonumber(k) == tonumber(itemID)) then
			t[k] = nil;
		end
	end	
end

function MerChantAutoSellItem_OnClick(self)
	MerchantAssist:SellItem(self.itemID);
	MerchantAssist:RemoveFromList(self.itemID, self.quality);
	MerchantAssist:InitAutoSellItemList();
	MerchantAssist_Update();
end

function MerChantAutoBuyItem_OnClick(self)
	curAutoBuySelect = self;
	MerchantAssist:UpdateState();
end

function MerChantTitle_CollapseHeader(itemIndex)
	if ( itemIndex == 0 ) then
		for index in ipairs(MerchantAssist.BagItemInfo) do
			if (MerchantAssist.BagItemInfo[index]["header"] ) then				
				local isheader, _, itemName = MerchantAssist:GetItemLineInfo(index);
				MerchantAssist.CollapsedHeader[itemName] = 1;
			end
		end
	else
		local isheader, _, name = MerchantAssist:GetItemLineInfo(itemIndex);
		if ( isheader ) then
			MerchantAssist.CollapsedHeader[name] = 1;
		end
	end

	MerchantAssist:InitAutoSellItemList();
end

function MerChantTitle_ExpandHeader(itemIndex)
	if ( itemIndex == 0 ) then
		MerchantAssist.CollapsedHeader = {};
	else
		local isheader, _, name = MerchantAssist:GetItemLineInfo(itemIndex);
		if ( isheader ) then
			MerchantAssist.CollapsedHeader[name] = nil;
		end
	end

	MerchantAssist:InitAutoSellItemList();
end

function MerchantAssistFrameTab_OnClick(self, button, id)
	local id = id or self:GetID();	
	PanelTemplates_SetTab(MerchantAssistFrame, id)
	if (id == 1) then
		MerchantAssistFrameAutoSellFrame:Show();
		MerchantAssistFrameAutoBuyFrame:Hide();
		MerchantAssist.curType = "autosell";
	elseif (id == 2) then
		MerchantAssistFrameAutoSellFrame:Hide();
		MerchantAssistFrameAutoBuyFrame:Show();
		MerchantAssist.curType = "autobuy";
	end
	
	MerchantAssist_Update();
	PlaySound("igCharacterInfoTab");
end

function MerchantAssistFrameAutoBuyFrameAdd_OnClick(self)
	local text = _G[self:GetName() .. "Input"]:GetText();
	_G[self:GetName() .. "Input"]:SetText("");
	local name, link = GetItemInfo(text);
	if (name and link) then
		local itemID = MerchantAssist:GetItemID(link);
		MerchantAssist:AddToList(itemID);
		MerchantAssist:UpdateAutoBuyInfo();
		MerchantAssist_Update();
	end
end

function MerchantAssistFrame_OnLoad(self)
	PanelTemplates_SetNumTabs(self, 2);
	PanelTemplates_SetTab(self, 1);	

	for i=1, 12 do
		MerchantAssist["AutobuyAddItemButton"][i]  = CreateFrame("Button", "MerchantAssistAutoBuyAddItemButton" .. i, _G["MerchantItem" .. i .. "ItemButton"], "MerchantAutoBuyAddItemButtonTemplate");
	end
end

function MerchantAutoBuyAddItemButton_OnClick(self, button)	
	local link = GetMerchantItemLink(self:GetParent():GetID());
	if (link) then	
		if (not MerchantAssistFrameAutoBuyFrame:IsVisible()) then
			MerchantAssistFrame:Show();
			MerchantAssistFrameTab_OnClick(nil, nil, 2);
		end
		
		StaticPopupDialogs["MERCHANT_AUTOBUY_CONFIRM"].ItemID = MerchantAssist:GetItemID(link);
		StaticPopup_Show("MERCHANT_AUTOBUY_CONFIRM", link);
	end
end

function MerchantAssistFrame_OnShow(self)
	PlaySound("igBackPackOpen");
	SetPortraitTexture(MerchantAssistFramePortrait, "player");
	MerchantAssist:ScanBags();
	MerchantAssist:UpdateAutoBuyInfo();
	MerchantAssistFrameTab_OnClick(nil, nil, 1);
end

function MerchantAssistFrame_OnHide(self)
	PlaySound("igBackPackClose");
end

function MerChantAutoSellFrame_OnLoad(self)	
	local name1 = "MerChantAutoSellItem";
	local name2 = "MerChantAutoBuyItem";
	local lastb, lastt;
	for i=1, 8 do
		MerchantAssist["AutoSellButtons"][i] = CreateFrame("Button", name1 .. i, self, "MerChantAutoSellItemTemplate");
		MerchantAssist["AutoSellButtons"][i]:SetID(i);
		if (i == 1) then
			MerchantAssist["AutoSellButtons"][i]:SetPoint("TOPLEFT", self, "TOPLEFT", 38, -80);
		else
			MerchantAssist["AutoSellButtons"][i]:SetPoint("TOPLEFT", lastb, "BOTTOMLEFT", 0, -3);
		end
		lastb = MerchantAssist["AutoSellButtons"][i];
		
		MerchantAssist["AutoSellTitles"][i] = CreateFrame("Button", name2 .. i, self, "MerChantTitleTemplate");
		MerchantAssist["AutoSellTitles"][i]:SetID(i);
		if (i == 1) then
			MerchantAssist["AutoSellTitles"][i]:SetPoint("LEFT", self, "TOPLEFT", 22, -98);
		else
			MerchantAssist["AutoSellTitles"][i]:SetPoint("TOPLEFT", lastt, "BOTTOMLEFT", 0, -3);
		end
		lastt = MerchantAssist["AutoSellTitles"][i];
	end
end

function MerChantAutoBuyFrame_OnLoad(self)	
	local name = "MerChantAutoBuyItem";
	local lastt;
	for i=1, 8 do
		MerchantAssist["AutoBuyButtons"][i] = CreateFrame("Button", name .. i, self, "MerChantAutoBuyItemTemplate");
		MerchantAssist["AutoBuyButtons"][i]:SetID(i);
		if (i == 1) then
			MerchantAssist["AutoBuyButtons"][i]:SetPoint("TOPLEFT", self, "TOPLEFT", 38, -80);
		else
			MerchantAssist["AutoBuyButtons"][i]:SetPoint("TOPLEFT", lastt, "BOTTOMLEFT", 0, -3);
		end
		lastt = MerchantAssist["AutoBuyButtons"][i];
	end
end

function MerChantAutoBuyItemDelteButton_OnClick(self, button)
	local p = self:GetParent();	
	local _, link = GetItemInfo(p.itemID);
	if (link) then
		curAutoBuyItemID = p.itemID;
		StaticPopup_Show("MERCHANT_DELETE_AUTOBUY", link);
	end
end

function MerchantShowFrameButton_OnShow(self)
	self:SetText(L["交易助手<<"]);
end

function MerchantShowFrameButton_OnClick(self)
	if (MerchantAssistFrame:IsShown()) then
		self:SetText(L["交易助手<<"]);
		MerchantAssistFrame:Hide();
	else
		self:SetText(L["交易助手>>"]);
		MerchantAssistFrame:Show();
	end	
end

function MerchantAssist:MerchantFrame_Update()
	for i, b in ipairs(self.AutobuyAddItemButton) do
		if ( MerchantFrame.selectedTab == 1 ) then
			b:Show();
		else
			b:Hide();
		end		
	end	
end

function MerchantAssist:HideAutoBuyAddItemButtons()
	for i, b in ipairs(self.AutobuyAddItemButton) do		
		b:Hide();	
	end	
end