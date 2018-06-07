------------------------------------------------------------------------------------------
-- ButtonFacade ver 1.0
-- 日期: 2010-08-04
-- 作者: 独孤傲雪
-- 描述: 给动作条添加换皮肤的引擎
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------------------
DUOWAN_FACADE_ENABLED = false;
DUOWAN_BUFFFACADE_ENABLE = false;
local BlzButtonData = {
	{"ActionButton", 12},
	{"BonusActionButton", 12},
	{"MultiBarBottomLeftButton", 12},
	{"MultiBarBottomRightButton", 12},
	{"MultiBarRightButton", 12},
	{"MultiBarLeftButton", 12},
	{"ShapeshiftButton", NUM_SHAPESHIFT_SLOTS},
	{"PetActionButton", NUM_PET_ACTION_SLOTS},
	{"dwPetActionButton", NUM_PET_ACTION_SLOTS},
	{"PossessButton", 2},	
};

local UserButtonData = {
	{"AspectPosionBar", "AspectPosionBarButton", 10},
	-- 多玩移动
	
	{"DuowanMove", "dwMainBarButton", 12},
	{"DuowanMove", "dwBottomLeftBarButton", 12},
	{"DuowanMove", "dwBottomRightBarButton", 12},
	{"DuowanMove", "dwRightBar1Button", 12},
	{"DuowanMove", "dwRightBar2Button", 12},
	
	-- 饰品管理
	{"TrinketMenu", {"TrinketMenu_Trinket0", "TrinketMenu_Trinket1"}},
};

local NameToId;
if (GetLocale() == "zhCN") then
	NameToId = {["可爱圆"] = "Serenity", ["典雅方"] = "Caith", ["高雅黑"] = "Darion", ["炫酷铜"] = "Entropy: Khorium", ["清新方"] = "Serenity: Square", ["凯蒂猫"] = "HelloKitty"};
elseif (GetLocale() == "zhTW") then
	NameToId = {["可愛圓"] = "Serenity", ["典雅方"] = "Caith", ["高雅黑"] = "Darion", ["炫酷銅"] = "Entropy: Khorium", ["清新方"] = "Serenity: Square", ["凱蒂貓"] = "HelloKitty"};
else
	NameToId = {["可爱圆"] = "Serenity", ["典雅方"] = "Caith", ["高雅黑"] = "Darion", ["炫酷铜"] = "Entropy: Khorium", ["清新方"] = "Serenity: Square", ["凯蒂猫"] = "HelloKitty"};
end

function dwBuffFacade_Toggle(switch)
	if (switch) then
		DUOWAN_BUFFFACADE_ENABLE = true;
		bfRegisterButton("Buff", "BuffButton", BUFF_ACTUAL_DISPLAY);	
		bfRegisterButton("Debuff", "DebuffButton", DEBUFF_ACTUAL_DISPLAY);
		bfRegisterButton("Debuff", "TempEnchant", 2);
	else
		DUOWAN_BUFFFACADE_ENABLE = false;
		bfUnregisterButton("Buff", "BuffButton", BUFF_ACTUAL_DISPLAY);
		bfUnregisterButton("Debuff", "DebuffButton", DEBUFF_ACTUAL_DISPLAY);
		bfUnregisterButton("Debuff", "TempEnchant", 2);
	end
end

local isUnRegistered = false;
hooksecurefunc("BuffFrame_Update", function ()
	if (DUOWAN_BUFFFACADE_ENABLE) then	
		bfRegisterButton("Buff", "BuffButton", BUFF_ACTUAL_DISPLAY);	
		bfRegisterButton("Debuff", "DebuffButton", DEBUFF_ACTUAL_DISPLAY);
		bfRegisterButton("Debuff", "TempEnchant", 2);
	
		isUnRegistered = false;
	else
		if (not isUnRegistered) then	
			bfUnregisterButton("Buff", "BuffButton", BUFF_ACTUAL_DISPLAY);
			bfUnregisterButton("Debuff", "DebuffButton", DEBUFF_ACTUAL_DISPLAY);
			bfUnregisterButton("Debuff", "TempEnchant", 2);

			isUnRegistered = true;
		end		
	end
end);

function dwButtonFacade_Toggle(switch)
	if (switch) then
		if (not DUOWAN_FACADE_ENABLED) then
			for i, b in ipairs(BlzButtonData) do
				bfRegisterButton("ActionButton", unpack(b));
			end
			for i, b in ipairs(UserButtonData) do
				dwAsynCall(b[1], "bfRegisterButton","ActionButton", b[2], b[3]);
			end
		
			for i=1, 10 do
				if (_G["DuowanActionBar" .. i]) then
					bfRegisterButton("ActionButton", "DuowanActionBar" .. i .. "Button", 12);
				end		
			end
			DUOWAN_FACADE_ENABLED = true;
		end
	else
		if (DUOWAN_FACADE_ENABLED) then
			for i, b in ipairs(BlzButtonData) do
				bfUnregisterButton("ActionButton", unpack(b));
			end
			for i, b in ipairs(UserButtonData) do
				dwAsynCall(b[1], "bfUnregisterButton", "ActionButton", b[2], b[3]);
			end

			for i=1, 10 do
				if (_G["DuowanActionBar" .. i]) then
					bfUnregisterButton("ActionButton", "DuowanActionBar" .. i .. "Button", 12);
				end
			end
			DUOWAN_FACADE_ENABLED = false;
		end		
	end
end

local skin = "Blizzard";
function dwButtonFacadeSetSkin(name)
	skin = NameToId[name] or "Blizzard";
	bfApplySkin("ActionButton", skin);
end

function dwButtonFacadeToggleGloss(switch)
	bfGloss_Toggle(switch);	
	bfApplySkin("ActionButton", skin);
end