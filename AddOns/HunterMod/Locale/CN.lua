local L = LibStub("AceLocale-3.0"):NewLocale("HunterMod", "zhCN");
if L then
	L["HunterMod:"] = "猎人助手: "
	L["Aimed Shot"] = "瞄准射击"
	L["Auto Shot"] = "自动射击"
	L["Hold shift to move frame"] = "Shift +左键拖动自动射击条";
	L["Hold shift to move frame\nShift + Right click to reset position"] = "Shift+左键可拖动框体\nShift+右键重置位置";
	L["BEAST"] = "野兽";
	L["HUMANOID"] = "人型生物";
	L["UNDEAD"] = "亡灵";
	L["GIANT"] = "巨人";
	L["ELEMENTAL"] = "元素生物";
	L["DEMON"] = "恶魔";
	L["DRAGONKIN"] = "龙类";
	L["TAUREN"] = "牛头人";

	L["ASPECT_PACK"] = "豹群守护";
	L["ASPECT_CHEETAH"] = "猎豹守护";
	L["Daze"] = "眩晕";

	L["MISDIRECT_PATTERN"] = ">>$player<< 已被误导";
end

if (GetLocale() == "zhCN") then
	ZF_HUNTER = "猎人";
	ZF_NO_FOOD = "没有提供宠物粮食。\n拖曳物品图标入内可以设定宠物粮食。";
	ZF_HUNGER = "你的宠物饥肠辘辘，对你有些不满";
	ZF_BUTTON_TITLE = "宠物粮食供应";
	ZF_FOODNAME = "食物: ";
	ZF_FOODQUANTITY = "数量: ";
	BINDING_HEADER_ZFEEDER = "猎人助手";
	_G["BINDING_NAME_CLICK zFeederButton:LeftButton"] = "一键喂养";
	ZF_SLASH_HELP = {
			"使用方法： /zf 或者 /zfeeder",
			"/zf reset - 重置按钮于默认位置",
			"/zf free - 将按钮置于屏幕中心，按住CTRL可自由移动",
	};
end
