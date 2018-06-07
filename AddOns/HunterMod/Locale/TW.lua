local L = LibStub("AceLocale-3.0"):NewLocale("zHunterMod", "zhTW")
if L then
	L["HunterMod:"] = "獵人助手: "
	L["Aimed Shot"] = "瞄準射擊"
	L["Auto Shot"] = "自動射擊"

	L["Hold shift to move frame"] = "Shift +左鍵拖動自動射擊條";
	L["Hold shift to move frame\nShift + Right click to reset position"] = "Shift+左键可拖動框體\nShift+右鍵重置位置";
	L["BEAST"] = "野獸";
	L["HUMANOID"] = "人型生物";
	L["UNDEAD"] = "亡靈";
	L["GIANT"] = "巨人";
	L["ELEMENTAL"] = "元素生物";
	L["DEMON"] = "惡魔";
	L["DRAGONKIN"] = "龍類";
	L["TAUREN"] = "牛頭人";

	L["ASPECT_PACK"] = "豹群守護";
	L["ASPECT_CHEETAH"] = "獵豹守護";
	L["Daze"] = "眩暈";

	L["MISDIRECT_PATTERN"] = ">>$player<< 已被誤導";
end

if (GetLocale() == "zhTW") then
	ZF_HUNTER = "獵人";
	ZF_NO_FOOD = "沒有提供寵物糧食";
	ZF_HUNGER = "你的寵物飢腸轆轆，對你有些不滿";
	ZF_BUTTON_TITLE = "宠物糧食供應";
	ZF_FOODNAME = "食物: ";
	ZF_FOODQUANTITY = "數量: ";
	BINDING_HEADER_ZFEEDER = "獵人助手";
	_G["BINDING_NAME_CLICK zFeederButton:LeftButton"] = "一鍵餵養";
	ZF_SLASH_HELP = {
		"用法：/zf 或 /zfeeder",
		"/zf reset - 重置按鈕于默認位置",
		"/zf free - 將按鈕置于屏幕中心，按住CTRL可自由移動",
	};
end
