------------------------------------------------------------
-- TrinketMenu Module - AutoWhip （From EasyTrinket）
--
-- Automatically wear special trinkets when you mount or shapeshift
-- into flight forms .
--
-- Abin、dugu
------------------------------------------------------------
local EASYTRINKET_SOULBINDING;
local L = {};
if (GetLocale() == "zhCN") then
	EASYTRINKET_SOULBINDING = "已绑定";
	L["low trinkets"] = { ["棍子上的胡萝卜"] = 3 };
	L["normal trinkets"] = { ["碎天者之鞭"] = 10, ["马鞭"] = 10 };
elseif (GetLocale() == "zhTW") then
	EASYTRINKET_SOULBINDING = "靈魂綁定";
	L["low trinkets"] = { ["棍子上的胡蘿蔔"] = 3 };
	L["normal trinkets"] = { ["破天者皮鞭"] = 10, ["騎乘馬鞭"] = 10 };
else
	EASYTRINKET_SOULBINDING = "已绑定";
	L["low trinkets"] = { ["Carrot on a Stick"] = 3 };
	L["normal trinkets"] = { ["Skybreaker Whip"] = 10, ["Riding Crop"] = 10 };
end

if UnitLevel("player") > 80 then return end

local db = {};
local updateElapsed = 0;
local checkMount = nil;

-- Determine if an item can whip
local function IsWhip(lnk)
	if type(lnk) ~= "string" then
		return nil;
	end

	local name = GetItemInfo(lnk);
	if not name then
		return nil;
	end
	
	local found = nil;
	
	-- normal trinkets
	found = L["normal trinkets"][name];
	if not found then
		found = L["low trinkets"][name];
	end
	
	return found and lnk or nil;
end

local Tooltip=CreateFrame("GameTooltip", "TrinktMenuTooltip", UIParent, "GameTooltipTemplate");


local function FindWhip()
	local bag, slot;
	local inx;
	local left;
	local strs = "";
	for bag = 0, 4 do
    		for slot = 1, GetContainerNumSlots(bag) do
			local lnk = GetContainerItemLink(bag, slot);	
			Tooltip:SetOwner(UIParent, "ANCHOR_TOPRIGHT");		
			Tooltip:SetBagItem(bag, slot);				
			for inx=1,5 do 
				left = dwGetglobal(Tooltip:GetName().."TextLeft"..inx);
				if(left and left:GetText())then
					strs = left:GetText();	
					if (strfind(strs, EASYTRINKET_SOULBINDING) and IsWhip(lnk))then							
						Tooltip:Hide();
						return bag, slot, lnk;
					end
				end 
			end
			Tooltip:Hide();
		end
	end
	return nil; 
end

-- Player mounted
local function OnMount()
	checkMount = nil;
	local prvTrinket1, prvTrinket2;
	prvTrinket1 = GetInventoryItemLink("player", 13);
	prvTrinket2 = GetInventoryItemLink("player", 14);
	local ins, ts = IsInInstance();	
	if (not ins or db["autowhip"] == 1) and ts ~= "arena" then		
		local bag, slot, lnk = FindWhip();	
		if bag and slot and lnk and (not IsWhip(prvTrinket1)) and (not IsWhip(prvTrinket2))then		
			db["prevTrinket"] = prvTrinket2;
			db["whip"] = lnk;
			local name = GetItemInfo(lnk);
			TrinketMenu.EquipTrinketByName(name, 14);			
		end
	end
	db["prevMounted"] = 1;	
end

-- Player dismounted, put back "prevTrinket" if any.
local function OnDismount()
	checkMount = nil;	

	if db["prevTrinket"] and GetInventoryItemLink("player", 14) == db["whip"] then	
		local name = GetItemInfo(db["prevTrinket"]);			
		TrinketMenu.EquipTrinketByName(name, 14);			
	end

	db["prevTrinket"] = nil;
	db["whip"] = nil;
	db["prevMounted"] = nil;
end

-- The frame to monitor player mounting status and handle trinket switching
local frame = CreateFrame("Frame", "TrinketMenu_AutoWhip_Monitor", EasyTrinketMainBar);
frame:Hide();

frame:SetScript("OnHide", function(self)  dwSecureCall(OnDismount) end);

frame:SetScript("OnUpdate", function(self, elapsed)
	if not checkMount then
		return; -- Not checking
	end

	updateElapsed = updateElapsed + elapsed;
	if updateElapsed < 0.1 then
		return; -- Only check every 0.1 second
	end

	updateElapsed = 0;
	
	if GetTime() > checkMount then
		checkMount = nil;
		return; -- Check ended
	end

	-- Check mount status
	local mounted = IsMounted() and not UnitOnTaxi("player");
	if db then
		if mounted then
			if not db["prevMounted"] then				
				dwSecureCall(OnMount);
			end
		else
			if db["prevMounted"] then
				dwSecureCall(OnDismount);
			end
		end	
	end
end);

frame:RegisterEvent("ADDON_LOADED");
frame:SetScript("OnEvent", function(self, event, unit)
	if event == "ADDON_LOADED" and unit == "TrinketMenu" then		
		self:UnregisterEvent("ADDON_LOADED"); 
		db = TrinketMenuPerOptions;
		self:RegisterEvent("PLAYER_LEVEL_UP");
		self:RegisterEvent("UNIT_AURA");		
	elseif event == "PLAYER_LEVEL_UP" then
		if (tonumber(unit or 0) or 0) > 80.5 then
			self:UnregisterAllEvents();
			self:Hide();
			if type(self.OnLevelDisable) == "function" then
				self:OnLevelDisable();
			end
		end
	elseif event == "UNIT_AURA" and unit == "player" and (not InCombatLockdown() or (db and db["prevMounted"])) then
		checkMount = GetTime() + 2;
	end
end);

function TrinketMenu_AutoWhip_Toggle(switch)
	if (switch) then
		TrinketMenu_AutoWhip_Monitor:Show();		
	else
		TrinketMenu_AutoWhip_Monitor:Hide();		
	end
end

function TrinketMenu_AutoWhip_OutBG(switch)
	if (switch) then
		TrinketMenuPerOptions["autowhip"] = 2;
	else
		TrinketMenuPerOptions["autowhip"] = 1;
	end
end