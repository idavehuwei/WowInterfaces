-----------------------------------------------------------------------------------------
-- ButtonFacade - ver 1.0
-- 日期: 2010 - 07 - 27
-- 作者: 独孤傲雪
-- 描述: 为系统的动作条提供美化皮肤
-- 版权所有 (c) duowan.com
-----------------------------------------------------------------------------------------
local LBF = LibStub("LibButtonFacade", true);
local lst = LBF:ListSkins();
local SkinData = LBF:GetSkins()
local groupButton = LBF:Group("Duowan", "ActionButton");
local groupBuff = LBF:Group("Duowan", "Buff");
local groupDebuff = LBF:Group("Duowan", "Debuff");
local db = DM_SKIN_DB;
local index = 1;
local isGloss = 0;
local SkinList = {};
local borders = {};
local db = {};
local BorderColors = {
	none = {0.8, 0, 0, 1},
	Magic = {0.2, 0.6, 1, 1},
	Curse = {0.6, 0, 1, 1},
	Poison = {0, 0.6, 0, 1},
	Disease = {0.6, 0.4, 0, 1},
	Enchant = {0.2, 0, 0.4, 1},
};

for k, v in pairs(lst) do
	SkinList[index] = v;
	index = index + 1;
end
index = 1;

LBF:RegisterSkinCallback("Duowan", function(db, SkinID, Gloss, Backdrop, Group, Button, Colors)
	--PrintTable(Backdrop);
	if not Group then
		db.SkinID = SkinID
		db.Gloss = Gloss
		db.Backdrop = Backdrop
		db.Colors = Colors
	else
		db[Group] = db[Group] or {};
		db[Group]["SkinID"] = SkinID
		db[Group]["Gloss"] = Gloss
		db[Group]["Backdrop"] = Backdrop
		db[Group]["Colors"] = Colors
	end
	--PrintTable(db);
end, db);

-- Updates the border for the specified debuff button.
local function UpdateBorder(button, class)
	if button and _G[button] then
		local border = button.."Border"
		local color = BorderColors[class];
		_G[border]:SetVertexColor(unpack(color));
	end
end

function bfRegisterButton(typ, button, count, ...)
	local skinName, group, _, class;
	if (typ == "ActionButton") then
		skinName = dwRawGetCVar("ButtonFacade", "buttonSkin", "Blizzard");
		group = groupButton;
	elseif (typ == "Buff") then
		skinName = dwRawGetCVar("ButtonFacade", "buffSkin", "Dek2");
		group = groupBuff;
	elseif (typ == "Debuff") then
		skinName = dwRawGetCVar("ButtonFacade", "debuffSkin", "Dek2");
		group = groupDebuff;
				
	end
	if (skinName and group) then
		if (type(button) == "string") then
			for i=1, count do
				if (_G[button..i]) then				
					group:AddButton(_G[button .. i]);
					if (typ == "Debuff") then
						if (button == "TempEnchant") then
							class = "Enchant";		
						else
							_, _, _, _, class = UnitDebuff("player", i);
							class = class or "none";
						end
						UpdateBorder(button .. i, class);	
					end						
					if (button == "ActionButton") then
						_G[button..i]:SetFrameStrata("HIGH");
					elseif (button == "BonusActionButton") then
						_G[button..i]:SetFrameStrata("DIALOG");
					end
				end
			end
		elseif (type(button) == "table") then
			for i, btn in ipairs(button) do
				group:AddButton(_G[btn]);
			end
		else
			local buttons = {button, count, ...};
			for i, button in ipairs(buttons) do				
				group:AddButton(button);				
			end
		end
		bfApplySkin(typ, skinName)
	end	
end

function bfUnregisterButton(typ, button, count, ...)
	local group;
	if (typ == "ActionButton") then
		group = groupButton;
	elseif (typ == "Buff") then
		group = groupBuff;
	elseif (typ == "Debuff") then
		group = groupDebuff;
	end

	if (group) then
		if (type(button) == "string") then
			for i=1, count do
				if (_G[button..i]) then				
					group:RemoveButton(_G[button .. i]);
				end
			end
		elseif (type(button) == "table") then
			for i, btn in ipairs(button) do
				groupButton:RemoveButton(btn);
			end
		else
			local buttons = {button, count, ...};
			for i, button in ipairs(buttons) do
				groupButton:RemoveButton(button);
			end
		end		
	end	
end

function bfApplySkin(typ, skinName)
	--local db = SkinData[skinName];
	
	if (typ == "ActionButton") then
		dwSetCVar("ButtonFacade", "buttonSkin", skinName);
		groupButton:Skin(skinName, isGloss, false);
	elseif (typ == "Buff") then
		dwSetCVar("ButtonFacade", "buffSkin", skinName);
		groupBuff:Skin("Dek2", 0, 1);
	elseif (typ == "Debuff") then
		dwSetCVar("ButtonFacade", "debuffSin", skinName);
		groupDebuff:Skin("Dek2", 0, 1);
	else
		print("Invlide skin type");
	end	
end

--PrintTable(SkinData);
function bfGloss_Toggle(switch)
	if (switch) then
		isGloss = 1;
	else
		isGloss = 0;
	end	
end
------------------------------
-- 注册技能键美化方案

function BF_TEST()	
	local value = SkinList[index];
	print(value)
	bfApplySkin("ActionButton", value);
	if (index == #(SkinList)) then
		index = 1;
	else
		index = index + 1;
	end
end
