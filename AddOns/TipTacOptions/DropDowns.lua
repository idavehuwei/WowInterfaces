TipTacDropDowns = {};
local cfg = TipTac_Config;

-- Shared Media
local LSM = LibStub and LibStub("LibSharedMedia-3.0",1);

-- DropDown Lists
TipTacDropDowns.FontFlags = {
	[TTDD_FontFlags_None] = "",
	[TTDD_FontFlags_Outline] = "OUTLINE",
	[TTDD_FontFlags_ThickOutline] = "THICKOUTLINE",
};
TipTacDropDowns.AnchorType = {
	[TTDD_AnchorType_Normal] = "normal",
	[TTDD_AnchorType_Mouse] = "mouse",
	[TTDD_AnchorType_Parent] = "parent",
};

TipTacDropDowns.AnchorPos = {
	[TTDD_AnchorPos_T] = "TOP",
	[TTDD_AnchorPos_TL] = "TOPLEFT",
	[TTDD_AnchorPos_TR] = "TOPRIGHT",
	[TTDD_AnchorPos_B] = "BOTTOM",
	[TTDD_AnchorPos_BL] = "BOTTOMLEFT",
	[TTDD_AnchorPos_BR] = "BOTTOMRIGHT",
	[TTDD_AnchorPos_L] = "LEFT",
	[TTDD_AnchorPos_R] = "RIGHT",
	[TTDD_AnchorPos_C] = "CENTER",
};

TipTacDropDowns.BarTextFormat = {
	[TTDD_BarText_None] = "none",
	[TTDD_BarText_Percentage] = "percent",
	[TTDD_BarText_Values] = "value",
	[TTDD_BarText_Auto_Values] = "auto",
	[TTDD_BarText_Deficit] = "deficit",
};

--------------------------------------------------------------------------------------------------------
--                                        Default DropDown Init                                       --
--------------------------------------------------------------------------------------------------------

local function Default_SelectValue(dropDown,entry,index)
	cfg[dropDown.option.var] = entry.value;
	TipTac:ApplySettings();
end

function TipTacDropDowns.Default_Init(dropDown,list)
	dropDown.SelectValueFunc = Default_SelectValue;
	local tbl;
	for text, option in next, dropDown.option.list do
		tbl = list[#list + 1]
		tbl.text = text; tbl.value = option;
	end
end;

--------------------------------------------------------------------------------------------------------
--                                          Lib Shared Media                                          --
--------------------------------------------------------------------------------------------------------

local LibSharedMediaSubstitute = not LSM and {
	["font"] = {
TTDD_Font
	},
	["background"] = {
		[TTDD_Blizzard_Tooltip] = "Interface\\Tooltips\\UI-Tooltip-Background",
		[TTDD_Solid] = "Interface\\Buttons\\WHITE8X8",
	},
	["border"] = {
		[TTDD_None] = "Interface\\None",
		[TTDD_Dialog]  = "Interface\\DialogFrame\\UI-DialogBox-Border",
		[TTDD_Tooltip] = "Interface\\Tooltips\\UI-Tooltip-Border",
		[TTDD_Solid] = "Interface\\Buttons\\WHITE8X8",
	},
	["statusbar"] = {
		[TTDD_StatusBar] = "Interface\\TargetingFrame\\UI-StatusBar",
	},
} or nil;

if (LSM) then
	LSM:Register("border","Solid","Interface\\Buttons\\WHITE8X8");
end

function TipTacDropDowns.SharedMediaLib_Init(dropDown,list)
	local query = dropDown.option.media;
	dropDown.SelectValueFunc = Default_SelectValue;
	local tbl;
	if (LSM) then
		for _, name in next, LSM:List(query) do
			tbl = list[#list + 1];
			tbl.text = name; tbl.value = LSM:Fetch(query,name);
		end
	else
		for name, value in next, LibSharedMediaSubstitute[query] do
			tbl = list[#list + 1];
			tbl.text = name; tbl.value = value;
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                           Layout Presets                                           --
--------------------------------------------------------------------------------------------------------

local layout_presets = {
	-- TipTac Layout
	[TTDD_Layout_NewStyle] = {
		showTarget = "last",
		targetYouText = TT_TargetYOU,

		tipBackdropBG = "Interface\\Buttons\\WHITE8X8",
		tipBackdropEdge = "Interface\\Tooltips\\UI-Tooltip-Border",
		backdropEdgeSize = 14,
		backdropInsets = 2.5,
		tipColor = { 0.1, 0.1, 0.2, 1.0 },
		tipBorderColor = { 0.3, 0.3, 0.4, 1.0 },
		gradientTip = true,
		gradientColor = { 0.8, 0.8, 0.8, 0.2 },

		reactColoredBackdrop = false,

		colSameGuild = "|cffff32ff",
		colRace = "|cffffffff",
		colLevel = "|cffc0c0c0",

		colorNameByClass = false,
		classColoredBorder = false,

		barFontFace = "Fonts\\ARIALN.TTF",
		barFontSize = 10,
		barFontFlags = "OUTLINE",
		barHeight = 6,

		classification_normal = "%s ",
		classification_elite = TT_Elite,
		classification_worldboss = TT_WorldBoss,
		classification_rare = TT_Rare,
		classification_rareelite = TT_RareElite,

		overrideFade = true,
		preFadeTime = 0.1,
		fadeTime = 0.1,
		hideWorldTips = true,

		hideDefaultBar = true,
		healthBar = true,
		healthBarClassColor = true,
		healthBarText = "value",
		healthBarColor = { 0.3, 0.9, 0.3, 1 },
		manaBar = false,
		powerBar = false,
	},
	-- TipTac Layout
	[TTDD_Layout_OldStyle] = {
		showTarget = "second",
		targetYouText = TT_TargetYOU,

		tipBackdropBG = "Interface\\Tooltips\\UI-Tooltip-Background",
		tipBackdropEdge = "Interface\\Tooltips\\UI-Tooltip-Border",
		backdropEdgeSize = 16,
		backdropInsets = 4,
		tipColor = { 0.1, 0.1, 0.2, 1.0 },
		tipBorderColor = { 0.3, 0.3, 0.4, 1.0 },
		gradientTip = false,

		reactColoredBackdrop = false,

		colSameGuild = "|cffff32ff",
		colRace = "|cffffffff",
		colLevel = "|cffc0c0c0",

		colorNameByClass = false,
		classColoredBorder = false,

		barFontFace = "Fonts\\FRIZQT__.TTF",
		barFontSize = 12,
		barFontFlags = "OUTLINE",
		barHeight = 6,

		classification_normal = "%s ",
		classification_elite = TT_Elite,
		classification_worldboss = TT_WorldBoss,
		classification_rare = TT_Rare,
		classification_rareelite = TT_RareElite,

		hideDefaultBar = true,
		healthBar = true,
		healthBarClassColor = true,
		healthBarText = "value",
		healthBarColor = { 0.3, 0.9, 0.3, 1 },
		manaBar = false,
		powerBar = false,
	},
	-- TipBuddy Layout
	["TipBuddy"] = {
		showTarget = "first",
		targetYouText = TT_TargetYOU1,

		tipBackdropBG = "Interface\\Tooltips\\UI-Tooltip-Background",
		tipBackdropEdge = "Interface\\Tooltips\\UI-Tooltip-Border",
		backdropEdgeSize = 16,
		backdropInsets = 4,
		tipColor = { 0.1, 0.1, 0.1, 0.8 },
		tipBorderColor = { 0.8, 0.8, 0.9, 1.0 },

		reactColoredBackdrop = false,

		colSameGuild = "|cffff32ff",
		colRace = "|cffffffff",
		colLevel = "|cffc0c0c0",

		colorNameByClass = false,
		classColoredBorder = false,

		barFontFace = "Fonts\\ARIALN.TTF",
		barFontSize = 12,
		barFontFlags = "OUTLINE",
		barHeight = 6,

		classification_normal = "%s ",
		classification_elite = TT_Elite,
		classification_worldboss = TT_WorldBoss,
		classification_rare = TT_Rare,
		classification_rareelite = TT_RareElite,

		hideDefaultBar = false,
		healthBar = false,
		manaBar = false,
		powerBar = false,
	},
	-- TinyTip Layout
	["TinyTip"] = {
		showTarget = "last",
		targetYouText = TT_TargetYOU,

		tipBackdropBG = "Interface\\Tooltips\\UI-Tooltip-Background",
		tipBackdropEdge = "Interface\\Tooltips\\UI-Tooltip-Border",
		backdropEdgeSize = 16,
		backdropInsets = 4,
		tipColor = { 0, 0, 0, 1 },
		tipBorderColor = { 0, 0, 0, 1 },

		reactColoredBackdrop = true,

		colRace = "|cffddeeaa",
		colLevel = "|cffffcc00",

		classification_normal = TT_Normal_Tiny,
		classification_elite = TT_Elite_Tiny,
		classification_worldboss = TT_WorldBoss_Tiny,
		classification_rare = TT_Rare_Tiny,
		classification_rareelite = TT_RareElite_Tiny,

		hideDefaultBar = false,
		healthBar = false,
		manaBar = false,
		powerBar = false,
	},
	-- Solid Border Layout
	["Solid Border"] = {
		showTarget = "last",
		targetYouText = TT_TargetYOU2,

		tipBackdropBG = "Interface\\Buttons\\WHITE8X8",
		tipBackdropEdge = "Interface\\Buttons\\WHITE8X8",
		backdropEdgeSize = 2.5,
		backdropInsets = 0,
		tipColor = { 0.09, 0.09, 0.19, 1.0 },
		tipBorderColor = { 0.6, 0.6, 0.6, 1.0 },

		reactColoredBackdrop = false,

		colorNameByClass = false,
		classColoredBorder = true,
	},
};

local function LoadLayout_SelectValue(dropDown,entry,index)
	for name, value in next, layout_presets[entry.value] do
		cfg[name] = value;
	end
	TipTac:ApplySettings();
	dropDown.label:SetText(TT_Layout_Loaded);
end

local function DeleteLayout_SelectValue(dropDown,entry,index)
	layout_presets[entry.value] = nil;
	dropDown.label:SetText(TT_Layout_Deleted);
end

function TipTacDropDowns.LoadLayout_Init(dropDown,list)
	dropDown.SelectValueFunc = LoadLayout_SelectValue;
	local tbl;
	for name in next, layout_presets do
		tbl = list[#list + 1];
		tbl.text = name; tbl.value = name;
	end
	dropDown.label:SetText(TT_Pick_Layout);
end

function TipTacDropDowns.DeleteLayout_Init(dropDown,list)
	dropDown.SelectValueFunc = DeleteLayout_SelectValue;
	local tbl;
	for name in next, layout_presets do
		tbl = list[#list + 1];
		tbl.text = name; tbl.value = name;
	end
	dropDown.label:SetText(TT_Delete_Layout);
end