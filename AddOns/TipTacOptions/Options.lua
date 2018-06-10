local cfg = TipTac_Config;
local modName = "TipTac";
local ignoreConfigUpdate;

-- Options
local activePage = 1;
local frames = {};
local options = {
    -- General
    {
        [0] = TTO_General,
        { type = "Check", var = "showUnitTip", label = TTO_Unit, tip = TTO_UnitToolTip, y = 8 },
        { type = "Check", var = "showStatus", label = TTO_Status, tip = TTO_StatusTooltip },
        { type = "Check", var = "showGuildRank", label = TTO_GuildRank, tip = TTO_GuildRankTooltip },
        { type = "Check", var = "showTargetedBy", label = TTO_TargetBy, tip = TTO_TargetByToolTip, y = 16 },
        { type = "DropDown", var = "nameType", label = TTO_NameType, list = { [TTO_Name_Only] = "normal", [TTO_Use_Player_Titles] = "title", [TTO_Copy_From_OriginalTooltip] = "original" } },
        { type = "DropDown", var = "showRealm", label = TTO_Realm, list = { [TTO_Realm_Not] = "none", [TTO_Realm_Show] = "show", [TTO_Realm_Instead] = "asterisk" } },
        { type = "DropDown", var = "showTarget", label = TTO_Target, list = { [TTO_Target_Not] = "none", [TTO_Target_1stLine] = "first", [TTO_Target_2ndLine] = "second", [TTO_Target_LastLine] = "last" }, y = 16 },
        { type = "Text", var = "targetYouText", label = TTO_Target_You },
    },
    -- Special
    {
        [0] = TTO_Special,
        { type = "Slider", var = "gttScale", label = TTO_GameTooltipScale, min = 0.2, max = 4, step = 0.05 },
        { type = "Slider", var = "updateFreq", label = TTO_UpdateFrequency, min = 0, max = 5, step = 0.05 },
    },
    -- Colors
    {
        [0] = TTO_Colors,
        { type = "Color", subType = 2, var = "colSameGuild", label = TTO_ColSameGuild, tip = TTO_ColSameGuildTooltip },
        { type = "Color", subType = 2, var = "colRace", label = TTO_ColRace, tip = TTO_ColRaceTooltip },
        { type = "Color", subType = 2, var = "colLevel", label = TTO_ColLevel, tip = TTO_ColLevelTooltip, y = 12 },
        { type = "Check", var = "colorNameByClass", label = TTO_ColByClass, tip = TTO_ColByClassTooltip },
        { type = "Check", var = "classColoredBorder", label = TTO_ColBorder, tip = TTO_ColBorderTooltip, y = 12 },
        { type = "Check", var = "itemQualityBorder", label = TTO_ItemBorder, tip = TTO_ItemBorderTooltip },
    },
    -- Reactions
    {
        [0] = TTO_Reactions,
        { type = "Check", var = "reactText", label = TTO_ReactText, tip = TTO_ReactTextTooltip, y = 42 },
        { type = "Color", subType = 2, var = "colReactText1", label = TTO_ColReact1 },
        { type = "Color", subType = 2, var = "colReactText2", label = TTO_ColReact2 },
        { type = "Color", subType = 2, var = "colReactText3", label = TTO_ColReact3 },
        { type = "Color", subType = 2, var = "colReactText4", label = TTO_ColReact4 },
        { type = "Color", subType = 2, var = "colReactText5", label = TTO_ColReact5 },
        { type = "Color", subType = 2, var = "colReactText6", label = TTO_ColReact6 },
        { type = "Color", subType = 2, var = "colReactText7", label = TTO_ColReact7 },
    },
    -- BG Color
    {
        [0] = TTO_BGColor,
        { type = "Check", var = "reactColoredBackdrop", label = TTO_ReactBGCol, tip = TTO_ReactBGColTooltip },
        { type = "Check", var = "reactColoredBorder", label = TTO_ReactColoredBorder, tip = TTO_ReactColoredBorderTooltip, y = 20 },
        { type = "Color", var = "colReactBack1", label = TTO_ColReact1 },
        { type = "Color", var = "colReactBack2", label = TTO_ColReact2 },
        { type = "Color", var = "colReactBack3", label = TTO_ColReact3 },
        { type = "Color", var = "colReactBack4", label = TTO_ColReact4 },
        { type = "Color", var = "colReactBack5", label = TTO_ColReact5 },
        { type = "Color", var = "colReactBack6", label = TTO_ColReact6 },
        { type = "Color", var = "colReactBack7", label = TTO_ColReact7 },
    },
    -- Backdrop
    {
        [0] = TTO_Backdrop,
        { type = "DropDown", var = "tipBackdropBG", label = TTO_TipBG, media = "background" },
        { type = "DropDown", var = "tipBackdropEdge", label = TTO_TipBGEdge, media = "border", y = 8 },
        { type = "Slider", var = "backdropEdgeSize", label = TTO_TipBGSize, min = 0, max = 64, step = 0.5 },
        { type = "Slider", var = "backdropInsets", label = TTO_TipBGInsets, min = -20, max = 20, step = 0.5, y = 18 },
        { type = "Color", var = "tipColor", label = TTO_TipBGColor },
        { type = "Color", var = "tipBorderColor", label = TTO_TipBorColor, y = 10 },
        { type = "Check", var = "gradientTip", label = TTO_GradientTip, tip = TTO_GradientTipToolTip, y = 6 },
        { type = "Color", var = "gradientColor", label = TTO_GradientColor, tip = TTO_gradientColorTooltip },
    },
    -- Font
    {
        [0] = TTO_Font,
        { type = "Check", var = "modifyFonts", label = TTO_ModifyFonts, tip = TTO_ModifyFontsTooltip, y = 12 },
        { type = "DropDown", var = "fontFace", label = TTO_FontFace, media = "font" },
        { type = "DropDown", var = "fontFlags", label = TTO_FontFlags, list = TipTacDropDowns.FontFlags },
        { type = "Slider", var = "fontSize", label = TTO_FontSize, min = 6, max = 29, step = 1 },
    },
    -- Classify
    {
        [0] = TTO_Classify,
        { type = "Text", var = "classification_normal", label = TTO_Classification_Normal },
        { type = "Text", var = "classification_elite", label = TTO_Classification_Elite },
        { type = "Text", var = "classification_worldboss", label = TTO_Classification_WorldBoss },
        { type = "Text", var = "classification_rare", label = TTO_Classification_Rare },
        { type = "Text", var = "classification_rareelite", label = TTO_Classification_RareElite },
    },
    -- Fading
    {
        [0] = TTO_Fading,
        { type = "Check", var = "overrideFade", label = TTO_OverrideFade, tip = TTO_OverrideFadeTip, y = 16 },
        { type = "Slider", var = "preFadeTime", label = TTO_PreFadeTime, min = 0, max = 5, step = 0.05 },
        { type = "Slider", var = "fadeTime", label = TTO_FadeOutTime, min = 0, max = 5, step = 0.05, y = 16 },
        { type = "Check", var = "hideWorldTips", label = TTO_HideWorldTip, tip = TTO_HideWorldTipToolTip },
    },
    -- Bars
    {
        [0] = TTO_Bars,
        { type = "Check", var = "hideDefaultBar", label = TTO_HideDefaultBar, tip = TTO_HideDefaultBarToolTip },
        { type = "Check", var = "healthBar", label = TTO_Health, tip = TTO_HealthToolTip },
        { type = "DropDown", var = "healthBarText", label = TTO_HealthText, list = TipTacDropDowns.BarTextFormat, y = -2 },
        { type = "Check", var = "healthBarClassColor", label = TTO_HealthClassCol, tip = TTO_HealthClassColTooltip, y = 6 },
        { type = "Color", var = "healthBarColor", label = TTO_HealthColor, tip = TTO_HealthColorTooltip, y = 10 },
        { type = "Check", var = "manaBar", label = TTO_ManaBar, tip = TTO_ManaBarToolTip },
        { type = "DropDown", var = "manaBarText", label = TTO_ManaBarText, list = TipTacDropDowns.BarTextFormat },
        { type = "Color", var = "manaBarColor", label = TTO_ManaColor, tip = TTO_ManaColorTooltip, y = 10 },
        { type = "Check", var = "powerBar", label = TTO_Others, tip = TTO_OthersToolTip },
        { type = "DropDown", var = "powerBarText", label = TTO_OthersText, list = TipTacDropDowns.BarTextFormat },
    },
    -- Bars Misc
    {
        [0] = TTO_BarsLook,
        { type = "DropDown", var = "barFontFace", label = TTO_BarFontFace, media = "font" },
        { type = "DropDown", var = "barFontFlags", label = TTO_BarFontFlags, list = TipTacDropDowns.FontFlags },
        { type = "Slider", var = "barFontSize", label = TTO_BarFontSize, min = 6, max = 29, step = 1, y = 36 },
        { type = "DropDown", var = "barTexture", label = TTO_BarTexture, media = "statusbar" },
        { type = "Slider", var = "barHeight", label = TTO_BarHeight, min = 1, max = 50, step = 1 },
    },
    -- Auras
    {
        [0] = TTO_Auras,
        { type = "Check", var = "aurasAtBottom", label = TTO_AurasBottom, tip = TTO_AurasBottomTooltip, y = 12 },
        { type = "Check", var = "showBuffs", label = TTO_UnitBuffs, tip = TTO_UnitBuffsTooltip },
        { type = "Check", var = "showDebuffs", label = TTO_UnitDebuff, tip = TTO_UnitDebuffTooltip, y = 12 },
        { type = "Check", var = "selfAurasOnly", label = TTO_ShowAuras, tip = TTO_ShowAurasTooltip, y = 12 },
        { type = "Slider", var = "auraSize", label = TTO_AuraIconDimension, min = 8, max = 60, step = 1 },
        { type = "Slider", var = "auraMaxRows", label = TTO_MaxAuraRows, min = 1, max = 8, step = 1, y = 8 },
        { type = "Check", var = "showAuraCooldown", label = TTO_CooldownModels, tip = TTO_CooldownModelsTooltip },
    },
    -- Icon
    {
        [0] = TTO_Icon,
        { type = "Check", var = "iconRaid", label = TTO_ShowRaidIcon, tip = TTO_ShowRaidIcontip },
        { type = "Check", var = "iconFaction", label = TTO_ShowFactionIcon, tip = TTO_ShowFactionIcontip },
        { type = "Check", var = "iconCombat", label = TTO_ShowCombatIcon, tip = TTO_ShowCombatIcontip, y = 12 },
        { type = "DropDown", var = "iconAnchor", label = TTO_IconAnchor, list = TipTacDropDowns.AnchorPos },
        { type = "Slider", var = "iconSize", label = TTO_IconSize, min = 8, max = 60, step = 1 },
    },
    -- Anchors
    {
        [0] = TTO_Anchor,
        { type = "DropDown", var = "anchorWorldUnitType", label = TTO_AnchorWorldUnitType, list = TipTacDropDowns.AnchorType },
        { type = "DropDown", var = "anchorWorldUnitPoint", label = TTO_AnchorWorldUnitPoint, list = TipTacDropDowns.AnchorPos, y = 14 },
        { type = "DropDown", var = "anchorWorldTipType", label = TTO_AnchorWorldTipType, list = TipTacDropDowns.AnchorType },
        { type = "DropDown", var = "anchorWorldTipPoint", label = TTO_AnchorWorldTipPoint, list = TipTacDropDowns.AnchorPos, y = 14 },
        { type = "DropDown", var = "anchorFrameUnitType", label = TTO_AnchorFrameUnitType, list = TipTacDropDowns.AnchorType },
        { type = "DropDown", var = "anchorFrameUnitPoint", label = TTO_AnchorFrameUnitPoint, list = TipTacDropDowns.AnchorPos, y = 14 },
        { type = "DropDown", var = "anchorFrameTipType", label = TTO_AnchorFrameTipType, list = TipTacDropDowns.AnchorType },
        { type = "DropDown", var = "anchorFrameTipPoint", label = TTO_AnchorFrameTipPoint, list = TipTacDropDowns.AnchorPos, y = 14 },
    },
    -- Mouse
    {
        [0] = TTO_Mouse,
        { type = "Slider", var = "mouseOffsetX", label = TTO_MouseAnchorX, min = -200, max = 200, step = 1 },
        { type = "Slider", var = "mouseOffsetY", label = TTO_MouseAnchorY, min = -200, max = 200, step = 1 },
    },
    -- Combat
    {
        [0] = TTO_Combat,
        { type = "Check", var = "hideAllTipsInCombat", label = TTO_HideAllTipsInCombat, tip = TTO_HideAllTipsInCombatTooltip },
        { type = "Check", var = "hideUFTipsInCombat", label = TTO_HideUFTipsInCombat, tip = TTO_HideUFTipsInCombatTooltip },
        { type = "Check", var = "showHiddenTipsOnShift", label = TTO_ShowHiddenTipsOnShift, tip = TTO_ShowHiddenTipsOnShiftTooltip },
        --		{ type = "DropDown", var = "hideCombatTip", label = "Hide Tips in Combat For", list = { ["Unit Frames"] = "uf", ["All Tips"] = "all", ["No Tips"] = "none" } },
    },
    -- Layouts
    {
        [0] = TTO_Layouts,
        { type = "DropDown", label = TTO_DropDown, init = TipTacDropDowns.LoadLayout_Init, y = 20 },
        --		{ type = "Text", label = "Save Layout", func = nil },
        --		{ type = "DropDown", label = "Delete Layout", init = TipTacDropDowns.DeleteLayout_Init },
    },
};

-- TipTacTalents Support
if (TipTacTalents) then
    options[#options + 1] = {
        [0] = TTO_Talents,
        { type = "Check", var = "showTalents", label = TTO_ShowTalents, tip = TTO_ShowTalentsTooltip, y = 12 },
        { type = "DropDown", var = "talentFormat", label = TTO_TalentFormat, list = { [TTO_Elemental1] = 1, [TTO_Elemental2] = 2, ["57/14/00"] = 3, }, y = 8 },
        { type = "Slider", var = "talentCacheSize", label = TTO_TalentsCacheSize, min = 0, max = 50, step = 1 },
    };
end

--------------------------------------------------------------------------------------------------------
-- Initialize Frame                                          --
--------------------------------------------------------------------------------------------------------

local f = CreateFrame("Frame", modName .. "Options", UIParent);

f:SetWidth(424);
f:SetHeight(360);
f:SetBackdrop({ bgFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = 1, tileSize = 16, edgeSize = 16, insets = { left = 3, right = 3, top = 3, bottom = 3 } });
f:SetBackdropColor(0.1, 0.22, 0.35, 1);
f:SetBackdropBorderColor(0.1, 0.1, 0.1, 1);
f:EnableMouse(1);
f:SetMovable(1);
f:SetFrameStrata("DIALOG");
f:SetToplevel(1);
f:SetClampedToScreen(1);
f:SetScript("OnShow", function() f:BuildCategoryPage(); end);
f:Hide();

f.outline = CreateFrame("Frame", nil, f);
f.outline:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = 1, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 } });
f.outline:SetBackdropColor(0.1, 0.1, 0.2, 1);
f.outline:SetBackdropBorderColor(0.8, 0.8, 0.9, 0.4);
f.outline:SetPoint("TOPLEFT", 12, -12);
f.outline:SetPoint("BOTTOMLEFT", 12, 12);
f.outline:SetWidth(84);

f:SetScript("OnMouseDown", function() f:StartMoving() end);
f:SetScript("OnMouseUp", function() f:StopMovingOrSizing(); cfg.optionsLeft = f:GetLeft(); cfg.optionsBottom = f:GetBottom(); end);

if (cfg.optionsLeft) and (cfg.optionsBottom) then
    f:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", cfg.optionsLeft, cfg.optionsBottom);
else
    f:SetPoint("CENTER");
end

f.header = f:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
f.header:SetFont(GameFontNormal:GetFont(), 22, "THICKOUTLINE");
f.header:SetPoint("TOPLEFT", f.outline, "TOPRIGHT", 10, -4);
f.header:SetText(modName .. TTO_Header);

f.vers = f:CreateFontString(nil, "ARTWORK", "GameFontNormal");
f.vers:SetPoint("TOPRIGHT", -20, -20);
f.vers:SetText(GetAddOnMetadata(modName, "Version"));
f.vers:SetTextColor(1, 1, 0.5);

local function Reset_OnClick(self)
    for index, tbl in ipairs(options[activePage]) do
        if (tbl.var) then
            cfg[tbl.var] = nil;
        end
    end
    TipTac:ApplySettings();
    f:BuildCategoryPage();
end

f.btnAnchor = CreateFrame("Button", nil, f, "UIPanelButtonTemplate");
f.btnAnchor:SetWidth(75);
f.btnAnchor:SetHeight(24);
f.btnAnchor:SetPoint("BOTTOMLEFT", f.outline, "BOTTOMRIGHT", 10, 3);
f.btnAnchor:SetScript("OnClick", function() if (TipTac:IsVisible()) then TipTac:Hide(); else TipTac:Show(); end end);
f.btnAnchor:SetText(TTO_TipAnchor);

f.btnReset = CreateFrame("Button", nil, f, "UIPanelButtonTemplate");
f.btnReset:SetWidth(75);
f.btnReset:SetHeight(24);
f.btnReset:SetPoint("LEFT", f.btnAnchor, "RIGHT", 38, 0);
f.btnReset:SetScript("OnClick", Reset_OnClick);
f.btnReset:SetText(TTO_Defaults);

f.btnClose = CreateFrame("Button", nil, f, "UIPanelButtonTemplate");
f.btnClose:SetWidth(75);
f.btnClose:SetHeight(24);
f.btnClose:SetPoint("BOTTOMRIGHT", -15, 15);
f.btnClose:SetScript("OnClick", function() f:Hide(); end);
f.btnClose:SetText(TTO_Close);

UISpecialFrames[#UISpecialFrames + 1] = f:GetName();

--------------------------------------------------------------------------------------------------------
-- Options Category List                                       --
--------------------------------------------------------------------------------------------------------

local listButtons = {};

local function List_OnClick(self, button)
    listButtons[activePage].text:SetTextColor(1, 0.82, 0);
    listButtons[activePage]:UnlockHighlight();
    activePage = self.index;
    self.text:SetTextColor(1, 1, 1);
    self:LockHighlight();
    PlaySound("igMainMenuOptionCheckBoxOn");
    f:BuildCategoryPage();
end

local buttonWidth = (f.outline:GetWidth() - 8);
local function MakeListEntry()
    local b = CreateFrame("Button", nil, f.outline);
    b:SetWidth(buttonWidth);
    b:SetHeight(18);
    b:SetScript("OnClick", List_OnClick);
    b:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");
    b:GetHighlightTexture():SetAlpha(0.7);
    b.text = b:CreateFontString(nil, "ARTWORK", "GameFontNormal");
    b.text:SetPoint("LEFT", 3, 0);
    listButtons[#listButtons + 1] = b;
    return b;
end

local button;
for index, table in ipairs(options) do
    button = listButtons[index] or MakeListEntry();
    button.text:SetText(table[0]);
    button.index = index;
    if (index == 1) then
        button:LockHighlight();
        button.text:SetTextColor(1, 1, 1);
        button:SetPoint("TOPLEFT", f.outline, "TOPLEFT", 5, -6);
    else
        button:SetPoint("TOPLEFT", listButtons[index - 1], "BOTTOMLEFT");
    end
end

--------------------------------------------------------------------------------------------------------
-- Build Option Category                                       --
--------------------------------------------------------------------------------------------------------
local function ChangeSettingFunc(self, var, value)
    if (not ignoreConfigUpdate) then
        cfg[var] = value;
        TipTac:ApplySettings();
    end
end

local factory = AzOptionsFactory:New(f, nil, ChangeSettingFunc);

-- Build Page
function f:BuildCategoryPage()
    AzDropDown:HideMenu();
    factory:ResetObjectUse();
    local frame;
    local yOffset = -38;
    -- Loop Through Options
    ignoreConfigUpdate = 1;
    for index, option in ipairs(options[activePage]) do
        -- Init & Setup the Frame
        frame = factory:GetObject(option.type);
        frame.option = option;
        frame.text:SetText(option.label);
        -- slider
        if (option.type == "Slider") then
            frame.slider:SetMinMaxValues(option.min, option.max);
            frame.slider:SetValueStep(option.step);
            frame.slider:SetValue(cfg[option.var]);
            frame.edit:SetNumber(cfg[option.var]);
            frame.low:SetText(option.min);
            frame.high:SetText(option.max);
            -- check
        elseif (option.type == "Check") then
            frame:SetHitRectInsets(0, frame.text:GetWidth() * -1, 0, 0);
            frame:SetChecked(cfg[option.var]);
            -- color
        elseif (option.type == "Color") then
            frame:SetHitRectInsets(0, frame.text:GetWidth() * -1, 0, 0);
            if (option.subType == 2) then
                frame.color[1], frame.color[2], frame.color[3], frame.color[4] = factory:HexStringToRGBA(cfg[option.var]);
            else
                frame.color[1], frame.color[2], frame.color[3], frame.color[4] = unpack(cfg[option.var]);
            end
            frame.texture:SetVertexColor(frame.color[1], frame.color[2], frame.color[3], frame.color[4] or 1);
            -- dropdown
        elseif (option.type == "DropDown") then
            frame.InitFunc = (option.init or option.media and TipTacDropDowns.SharedMediaLib_Init or TipTacDropDowns.Default_Init);
            frame:InitSelectedItem(cfg[option.var]);
            -- text
        elseif (option.type == "Text") then
            frame:SetText(cfg[option.var]:gsub("|", "||"));
        end
        -- Anchor the Frame
        frame:ClearAllPoints();
        frame:SetPoint("TOPLEFT", f.outline, "TOPRIGHT", factory.objectOffsetX[option.type] + (option.x or 0), yOffset);
        yOffset = (yOffset - frame:GetHeight() - factory.objectOffsetY[option.type] - (option.y or 0));
        -- Show
        frame:Show();
    end
    -- End Update
    ignoreConfigUpdate = nil;
end