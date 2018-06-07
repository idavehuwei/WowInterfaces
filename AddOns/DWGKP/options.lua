------------------------------------------------------------------------------------------
-- options ver 1.0
-- 日期: 2010-6-7
-- 作者: dugu@bigfoot
-- 描述: 多玩GKP缺省配置
-- 版权所有 (C) duowan.com
------------------------------------------------------------------------------------------
local GKP = LibStub("AceAddon-3.0"):GetAddon("DWGKP");
local L = LibStub("AceLocale-3.0"):GetLocale("DWGKP");
local config = LibStub("AceConfig-3.0");

local function updateIgnorItems()
	local itemLists = {};
	for key, v in pairs(GKP.config.ignorItems) do		
		local itemName, itemLink, itemRarity = GetItemInfo(key);
		if (itemName and itemRarity) then		
			local r, g, b, hex = GetItemQualityColor(itemRarity);
			itemLists[key] = format("%s%s|r", hex, itemName);
		else
			itemLists[key] = L["Unknown Item"];
		end		
	end
	return itemLists;
end

function GKP:InitOptionTable()
	local options = {
		type = "group",
		name = L["DWGKP"],
		args = {
			--[[
			BaseOption = {
				type = "header",
				name = L["Base Option Info"],
				order = 1,
			},
			ItemQuality = {
				type = "select",
				style = "radio",
				name = L["Low item quality"],
				get = function()
					return self.config.itemQuality;
				end,
				set = function(info, value)
					self.config.itemQuality = value;
				end,
				values = DWGKP_QUALITY_LOW,
				order = 10,
			},
			DistributeGroup = {
				type = "select",
				style = "radio",
				name = L["Default dirstibute group"],
				get = function()
					return self.config.defaultGroup;
				end,
				set = function(info, value)
					self.config.defaultGroup = value;
				end,
				values = DWGKP_DEFAULT_DIST,
				order = 20,
			},
			AnnounceChannel = {
				type = "select",
				style = "radio",
				name = L["Announce Channel"],
				get = function()
					return self.config.announceChannel;
				end,
				set = function()
					self.config.announceChannel = value;
				end,
				values = DWGKP_REPORT_CHANNEL,
				order = 30,
			},
			]]
			IgnorList = {
				type = "header",
				name = L["Ignor Item List"],
				order = 100,
			},
			AddIgnorItem = {
				type = "input",
				name = L["Add Ignor Item"],			
				get = function()
					return ""
				end,
				set = function(_, value)
					local itemID = self:GetItemID(value);
					if (itemID) then
						self.config.ignorItems[itemID] = true;						
					end
				end,
				order = 110,
			},
			IgnorItemList = {
				type = 'multiselect',
				name = L["Ignor Item List"],
				get = function(_, key)
					return self.config.ignorItems[key];
				end,
				set = function(_, key, value)
					print(value);
					self.config.ignorItems[key] = value;
				end,
				values = updateIgnorItems,
				order = 120,
			},
		},
	};

	

	local helps = {
		type = "group",
		name = L["DWGKP"],
		args = {			
			Introduce = {
				type = "header",
				name = L["Introduce"],
				order = 1,
			},			
			IntroduceText1 = {
				type = "description",		
				name = L["IntroduceText1"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 2,
			},
			IntroduceText2 = {
				type = "description",		
				name = L["IntroduceText2"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 3,
			},
			IntroduceText3 = {
				type = "description",		
				name = L["IntroduceText3"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 4,
			},
			Useflow  = {
				type = "header",
				name = L["Useflow"],
				order = 10,
			},	
			UseflowText1 = {
				type = "description",		
				name = L["UseflowText1"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 11,
			},
			UseflowText2 = {
				type = "description",		
				name = L["UseflowText2"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 12,
			},
			UseflowText3 = {
				type = "description",		
				name = L["UseflowText3"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 13,
			},
			UseflowText4 = {
				type = "description",		
				name = L["UseflowText4"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 14,
			},
			UseflowText5 = {
				type = "description",		
				name = L["UseflowText5"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 15,
			},
			UseflowText6 = {
				type = "description",		
				name = L["UseflowText6"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 16,
			},
			QandA  = {
				type = "header",
				name = L["Q&A"],
				order = 20,
			},	
			QandAText1 = {
				type = "description",		
				name = L["Q&AText1"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 21,
			},
			QandAText2 = {
				type = "description",		
				name = L["Q&AText2"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 21,
			},
			QandAText3 = {
				type = "description",		
				name = L["Q&AText3"],
				fontSize = "small", --  "large", "medium", "small". 
				order = 21,
			},			
		},
	};
	
	config:RegisterOptionsTable(L["DWGKP"], options);
	config:RegisterOptionsTable(L["DWGKPHELP"], helps);
end