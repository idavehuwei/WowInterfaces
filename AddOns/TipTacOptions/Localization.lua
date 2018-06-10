if (GetLocale() == "zhCN") then
    ------------------------------------------------------------------------------
    -- Traditional Chinese localization
    ------------------------------------------------------------------------------
    -- DropDowns.lua
    TTDD_FontFlags_None = "|cffffa0a0无";
    TTDD_FontFlags_Outline = "轮廓";
    TTDD_FontFlags_ThickOutline = "轮廓加粗";

    TTDD_AnchorType_Normal = "普通跟随";
    TTDD_AnchorType_Mouse = "滑鼠跟随";
    TTDD_AnchorType_Parent = "两者跟随";

    TTDD_AnchorPos_T = "顶部";
    TTDD_AnchorPos_TL = "左上";
    TTDD_AnchorPos_TR = "右上";
    TTDD_AnchorPos_B = "底部";
    TTDD_AnchorPos_BL = "左下";
    TTDD_AnchorPos_BR = "右下";
    TTDD_AnchorPos_L = "居左";
    TTDD_AnchorPos_R = "居右";
    TTDD_AnchorPos_C = "齐中";

    TTDD_BarText_None = "|cffffa0a0无";
    TTDD_BarText_Percentage = "百分比";
    TTDD_BarText_Values = "数值";
    TTDD_BarText_Auto_Values = "自动数值";
    TTDD_BarText_Deficit = "差额";

    TTDD_Font = {
        ["提示讯息"] = "Fonts\\ZYKai_T.TTF",
        ["聊天字型"] = "Fonts\\ZYKai_T.TTF",
        ["伤害数字"] = "Fonts\\ZYKai_T.TTF",
        ["预设"] = "Fonts\\ZYKai_T.TTF",
    };
    TTDD_Blizzard_Tooltip = "预设";
    TTDD_Solid = "立体";
    TTDD_None = "无边框";
    TTDD_Dialog = "对话框";
    TTDD_Tooltip = "讯息框";
    TTDD_StatusBar = "预设";

    TTDD_Layout_NewStyle = "TipTac 新风格";
    TT_TargetYOU = "|cFFFF0000>>你<<";

    TT_Elite = "%s|r (精英)";
    TT_WorldBoss = "%s|r (首领)";
    TT_Rare = "%s|r (稀有)";
    TT_RareElite = "%s|r (稀有精英)";

    TTDD_Layout_OldStyle = "TipTac 旧风格";
    TT_TargetYOU1 = "[你]";

    TT_Normal_Tiny = "等级 %s";
    TT_Elite_Tiny = "等级 %s|cffffcc00 精英";
    TT_WorldBoss_Tiny = "等级 %s|cffff0000 首领";
    TT_Rare_Tiny = "等级 %s|cffff66ff 稀有";
    TT_RareElite_Tiny = "等级 %s|cffffaaff 稀有精英";

    TT_TargetYOU2 = "|cFFFF0000>>你<<";

    TT_Layout_Loaded = "|cff80ff80版面编排已载入";
    TT_Layout_Deleted = "|cffff8080版面编排已删除!";
    TT_Pick_Layout = "|cff00ff00挑选版面编排...";
    TT_Delete_Layout = "|cff00ff00删除版面编排...";

    --TipTacOptions.lua
    -- General
    TTO_General = "一般设定";
    TTO_Unit = "啓用TipTac的提示外观";
    TTO_UnitToolTip = "如果你关闭此选项，TipTac将只会显示最基本的提示讯息。";
    TTO_Status = "显示<离线>/<暂离>/<勿扰>状态";
    TTO_StatusTooltip = "在玩家名字前面显示<离线>/<暂离>/<勿扰>状态提示。";
    TTO_GuildRank = "显示玩家的公会会阶";
    TTO_GuildRankTooltip = "除了公会名称之外，这个选项也可以让你看到他们的公会会阶";
    TTO_TargetBy = "显示谁注视这个目标";
    TTO_TargetByToolTip = "当你在队伍或团队中，将会显示队伍中有谁注视这个目标。";
    TTO_NameType = "名称类型";
    TTO_Name_Only = "只有名称";
    TTO_Use_Player_Titles = "使用玩家头衔";
    TTO_Copy_From_OriginalTooltip = "从原始提示中複製";
    TTO_Realm = "战场中玩家伺服器";
    TTO_Realm_Not = "不显示";
    TTO_Realm_Show = "显示";
    TTO_Realm_Instead = "以 (*) 取代";
    TTO_Target = "显示目标的目标";
    TTO_Target_Not = "不显示";
    TTO_Target_1stLine = "第一行";
    TTO_Target_2ndLine = "第二行";
    TTO_Target_LastLine = "最后一行";
    TTO_Target_You = "自订目标样式";

    --Special
    TTO_Special = "特殊设定";
    TTO_Scaling = "缩放比例";
    TTO_GameTooltipScale = "游戏提示讯息大小";
    TTO_UpdateFrequency = "提示讯息更新频率";

    --Colors
    TTO_Colors = "颜色设定";
    TTO_ColSameGuild = "同公会的名称颜色";
    TTO_ColSameGuildTooltip = "方便让你识别出公会会员，你可设定你的公会名称颜色。";
    TTO_ColRace = "种族和种类颜色";
    TTO_ColRaceTooltip = "自订玩家的种族和目标的种类的颜色。";
    TTO_ColLevel = "中立目标等级颜色";
    TTO_ColLevelTooltip = "自订你无法攻击的目标等级颜色。";
    TTO_ColByClass = "依职业颜色显示玩家姓名";
    TTO_ColByClassTooltip = "当启用此选项，玩家姓名将会以玩家职业对应的颜色表示。";
    TTO_ColBorder = "依职业颜色显示提示讯息边框";
    TTO_ColBorderTooltip = "提示讯息边框将会以玩家职业对应的颜色表示。";
    TTO_ItemBorder = "依物品品质等级颜色显示提示讯息边框";
    TTO_ItemBorderTooltip = "当开启此选项，物品提示讯息边框颜色将会变成此物品的品质级别颜色\注意：必须开启【整合特殊提示讯息】选项。";

    -- Reactions & BG Color
    TTO_Reactions = "互动属性";
    TTO_ReactText = "显示与目标互动关系的提示文字";
    TTO_ReactTextTooltip = "当启用此选项时，将会显示与目标的互动关系在最后一行。";
    TTO_BGColor = "背景颜色";
    TTO_ReactBGCol = "依照目标互动属性设定提示背景颜色";
    TTO_ReactBGColTooltip = "当起用此选项时，提示框的背景颜色将替换与目标的互动关系颜色。如关闭此选项，背景颜色将使用在「背景设定」中的颜色。";
    TTO_ReactColoredBorder = "依照目标互动属性设定提示边框颜色";
    TTO_ReactColoredBorderTooltip = "当起用此选项时，提示框的边框颜色将替换与目标的互动关系颜色。如关闭此选项，边框颜色将使用在「边框设定」中的颜色。";
    TTO_ColReact1 = "低等级目标颜色";
    TTO_ColReact2 = "敌对目标颜色";
    TTO_ColReact3 = "高等级目标颜色";
    TTO_ColReact4 = "中立目标颜色";
    TTO_ColReact5 = "友好NPC或PvP玩家颜色";
    TTO_ColReact6 = "友好玩家颜色";
    TTO_ColReact7 = "死亡目标颜色";

    --Backdrop
    TTO_Backdrop = "背景设定";
    TTO_TipBG = "提示讯息背景材质";
    TTO_TipBGEdge = "提示讯息边框材质";
    TTO_TipBGSize = "提示讯息边框大小";
    TTO_TipBGInsets = "提示讯息背景大小";
    TTO_TipBGColor = "提示讯息背景颜色";
    TTO_TipBorColor = "提示讯息边框颜色";
    TTO_GradientTip = "提示讯息背景渐变";
    TTO_GradientTipToolTip = "在提示讯息背景顶部显示一个渐变区域，看起来更有立体感。如果你有其他的面板插件（例如Skinner）可能需要关闭此选项来解决显示错误的问题。";
    TTO_GradientColor = "渐变颜色";
    TTO_gradientColorTooltip = "选择渐变的基础颜色";

    --Font
    TTO_Font = "字型设定";
    TTO_ModifyFonts = "变更提示讯息字型样式";
    TTO_ModifyFontsTooltip = "启用此选项，TipTac 将会修改游戏内提示讯息的字型样式。";
    TTO_FontFace = "字型名称";
    TTO_FontFlags = "字型样式";
    TTO_FontSize = "字型大小";

    --Classify
    TTO_Classify = "目标类型";
    TTO_Classification_Normal = "普通";
    TTO_Classification_Elite = "精英";
    TTO_Classification_WorldBoss = "首领";
    TTO_Classification_Rare = "稀有";
    TTO_Classification_RareElite = "稀有精英";

    -- Fading
    TTO_Fading = "视窗效果";
    TTO_OverrideFade = "覆盖游戏提示讯息预设的淡出功能";
    TTO_OverrideFadeTip = "覆盖游戏提示讯息预设的淡出功能，如果看到淡出功能有问题，请停用。";
    TTO_PreFadeTime = "视窗关闭延迟时间";
    TTO_FadeOutTime = "视窗关闭淡出时间";
    TTO_HideWorldTip = "关闭世界物品讯息提示";
    TTO_HideWorldTipToolTip = "此功能将会关闭世界物品讯息提示（例如：邮箱、药草、矿脉等）。";

    -- Bars
    TTO_Bars = "状态数值";
    TTO_HideDefaultBar = "隐藏预设的生命条";
    TTO_HideDefaultBarToolTip = "勾选后隐藏预设的生命条";
    TTO_Health = "显示生命力条";
    TTO_HealthToolTip = "显示目标单位的生命条。";
    TTO_HealthText = "生命条文字";
    TTO_HealthClassCol = "使用目标职业对应的颜色于生命条";
    TTO_HealthClassColTooltip = "这个选项会把生命条的颜色设定为和玩家职业相同的颜色。";
    TTO_HealthColor = "生命条色彩";
    TTO_HealthColorTooltip = "此设定将套用于生命条的颜色，如果启用上一个选项将无法作用。";
    TTO_ManaBar = "显示法力条";
    TTO_ManaBarToolTip = "如果目标单位拥有法力，则会显示法力条。";
    TTO_ManaBarText = "法力条文字";
    TTO_ManaColor = "法力条色彩";
    TTO_ManaColorTooltip = "设定法力条的颜色";
    TTO_Others = "显示能量、怒气、专注条";
    TTO_OthersToolTip = "如果目标单位拥有能量、怒气或者专注，则将会显示。";
    TTO_OthersText = "动能条文字";

    -- Bars Misc
    TTO_BarsLook = "杂项设定";
    TTO_BarFontFace = "字型名称";
    TTO_BarFontFlags = "字型样式";
    TTO_BarFontSize = "字型大小";
    TTO_BarTexture = "状态条材质";
    TTO_BarHeight = "状态条高度";

    -- Auras
    TTO_Auras = "光环图示";
    TTO_AurasBottom = "增益/减益图示显示在框架底部。";
    TTO_AurasBottomTooltip = "将增益/减益图示移动到提示框架底部。";
    TTO_UnitBuffs = "显示增益";
    TTO_UnitBuffsTooltip = "显示目标的增益";
    TTO_UnitDebuff = "显示减益";
    TTO_UnitDebuffTooltip = "显示目标的减益";
    TTO_ShowAuras = "只显示你所施放的光环";
    TTO_ShowAurasTooltip = "这将筛选掉只显示你自己施放的光环";
    TTO_AuraIconDimension = "增益/减益图示大小";
    TTO_MaxAuraRows = "最大图示行数";
    TTO_CooldownModels = "显示倒数计时模组";
    TTO_CooldownModelsTooltip = "启用此选项，你将可看到增益/减益倒数计时（仅作用于你施放的效果）。";

    --Icon
    TTO_Icon = "阵营图示";
    TTO_ShowRaidIcon = "显示团队图示";
    TTO_ShowRaidIcontip = "显示团队图示到提示中";
    TTO_ShowFactionIcon = "显示阵营图示";
    TTO_ShowFactionIcontip = "显示阵营图示到提示中";
    TTO_ShowCombatIcon = "显示战斗图示";
    TTO_ShowCombatIcontip = "显示战斗图示到提示中，如果该单位在战斗中的话";
    TTO_IconAnchor = "图示位置";
    TTO_IconSize = "图示大小";

    -- Anchor
    TTO_Anchor = "视窗位置";
    TTO_AnchorWorldUnitType = "世界单位类型";
    TTO_AnchorWorldUnitPoint = "世界单位点";
    TTO_AnchorWorldTipType = "世界提示类型";
    TTO_AnchorWorldTipPoint = "世界提示点";
    TTO_AnchorFrameUnitType = "框架单位类型";
    TTO_AnchorFrameUnitPoint = "框架单位点";
    TTO_AnchorFrameTipType = "框架提示类型";
    TTO_AnchorFrameTipPoint = "框架提示点";

    -- "Mouse"
    TTO_Mouse = "游标锚点";
    TTO_MouseAnchorX = "游标锚点 X 轴偏移";
    TTO_MouseAnchorY = "游标锚点 Y 轴偏移";

    -- Combat
    TTO_Combat = "战斗讯息";
    TTO_HideAllTipsInCombat = "战斗中隐藏所有提示讯息";
    TTO_HideAllTipsInCombatTooltip = "在战斗中，这个选项将隐藏所有提示讯息的显示";
    TTO_HideUFTipsInCombat = "战斗时隐藏头像框架提示讯息";
    TTO_HideUFTipsInCombatTooltip = "当你进入战斗时，于滑鼠经过目标单位头像框架时将不显示。";
    TTO_ShowHiddenTipsOnShift = "当按住Shift时仍然显示已隐藏的提示讯息";
    TTO_ShowHiddenTipsOnShiftTooltip = "当你勾选此选项或者一个以上的选项时，按住shift仍然可以强制显示提示讯息。";

    -- Talents
    TTO_Talents = "天赋设定";
    TTO_ShowTalents = "啓用TipTacTalents";
    TTO_ShowTalentsTooltip = "这个选项可以在提示讯息中显示其他玩家的天赋";
    TTO_TalentFormat = "天赋格式";
    TTO_Elemental1 = "元素 (57/14/00)";
    TTO_Elemental2 = "元素";
    TTO_TalentsCacheSize = "天赋快取大小";

    --Layouts
    TTO_Layouts = "面版风格";
    TTO_DropDown = "面版风格选单";

    TTO_Header = " 选项";
    TTO_TipAnchor = "定位";
    TTO_Defaults = "预设";
    TTO_Close = "关闭";

    -- Libs
    TTO_Select_Value = "|cff00ff00选择数值...";
    TTO_Error = "|2<错误>|r 无效的对象类型！";

else
    ------------------------------------------------------------------------------
    -- English localization (default)
    ------------------------------------------------------------------------------
    -- DropDowns.lua
    TTDD_FontFlags_None = "|cffffa0a0None";
    TTDD_FontFlags_Outline = "Outline";
    TTDD_FontFlags_ThickOutline = "Thick Outline";

    TTDD_AnchorType_Normal = "Normal Anchor";
    TTDD_AnchorType_Mouse = "Mouse Anchor";
    TTDD_AnchorType_Parent = "Parent Anchor";

    TTDD_AnchorPos_T = "Top";
    TTDD_AnchorPos_TL = "Top Left";
    TTDD_AnchorPos_TR = "Top Right";
    TTDD_AnchorPos_B = "Bottom";
    TTDD_AnchorPos_BL = "Bottom Left";
    TTDD_AnchorPos_BR = "Bottom Right";
    TTDD_AnchorPos_L = "Left";
    TTDD_AnchorPos_R = "Right";
    TTDD_AnchorPos_C = "Center";

    TTDD_BarText_None = "|cffffa0a0None";
    TTDD_BarText_Percentage = "Percentage";
    TTDD_BarText_Values = "Values";
    TTDD_BarText_Auto_Values = "Auto Values";
    TTDD_BarText_Deficit = "Deficit";

    TTDD_Font = {
        ["Friz Quadrata TT"] = "Fonts\\FRIZQT__.TTF",
        ["Arial Narrow"] = "Fonts\\ARIALN.TTF",
        ["Skurri"] = "Fonts\\SKURRI.TTF",
        ["Morpheus"] = "Fonts\\MORPHEUS.TTF",
    };
    TTDD_Blizzard_Tooltip = "Blizzard Tooltip";
    TTDD_Solid = "Solid";
    TTDD_None = "None";
    TTDD_Dialog = "Blizzard Dialog";
    TTDD_Tooltip = "Blizzard Tooltip";
    TTDD_StatusBar = "Blizzard StatusBar";

    TTDD_Layout_NewStyle = "TipTac NewStyle";
    TT_TargetYOU = "<<YOU>>";

    TT_Elite = "+%s";
    TT_WorldBoss = "%s|r (Boss)";
    TT_Rare = "%s|r (Rare)";
    TT_RareElite = "+%s|r (Rare)";

    TTDD_Layout_OldStyle = "TipTac OldStyle";

    TT_TargetYOU1 = "[YOU]";

    TT_Normal_Tiny = "Level %s";
    TT_Elite_Tiny = "Level %s|cffffcc00 Elite";
    TT_WorldBoss_Tiny = "Level %s|cffff0000 Boss";
    TT_Rare_Tiny = "Level %s|cffff66ff Rare";
    TT_RareElite_Tiny = "Level %s|cffffaaff Rare Elite";

    TT_TargetYOU2 = "|cffff0000<<YOU>>";

    TT_Layout_Loaded = "|cff80ff80Layout Loaded";
    TT_Layout_Deleted = "|cffff8080Layout Deleted!";
    TT_Pick_Layout = "|cff00ff00Pick Layout...";
    TT_Delete_Layout = "|cff00ff00Delete Layout...";

    --TipTacOptions.lua
    -- General
    TTO_General = "General";
    TTO_Unit = "Enable TipTac Unit Tips Appearance";
    TTO_UnitToolTip = "Will change the appearance of how unit tips look. Many options in TipTac only work with this setting enabled";
    TTO_Status = "Show DC, AFK and DND Status";
    TTO_StatusTooltip = "Will show the <DC>, <AFK> and <DND> status infront of the player name";
    TTO_GuildRank = "Show Player Guild Rank Title";
    TTO_GuildRankTooltip = "In addition to the guild name, with this option on, you will also see their guild rank by title";
    TTO_TargetedBy = "Show Who Targets the Unit";
    TTO_TargetedByTooltip = "When in a raid or party, the tip will show who from your group is targeting the unit";
    TTO_NameType = "Name Type";
    TTO_Name_Only = "Name only";
    TTO_Use_Player_Titles = "Use player titles";
    TTO_Copy_From_OriginalTooltip = "Copy from original tip";
    TTO_Realm = "Show Unit Realm";
    TTO_Realm_Not = "Do not show realm";
    TTO_Realm_Show = "Show realm";
    TTO_Realm_Instead = "Show (*) instead";
    TTO_Target = "Show Unit Target";
    TTO_Target_Not = "Do not show target";
    TTO_Target_1stLine = "First line";
    TTO_Target_2ndLine = "Second line";
    TTO_Target_LastLine = "Last line";
    TTO_Target_You = "Targeting You Text";

    -- Special
    TTO_Special = "Special";
    TTO_Scaling = "Scaling";
    TTO_GameTooltipScale = "GameTooltip Scale";
    TTO_UpdateFrequency = "Tip Update Frequency";

    -- Colors
    TTO_Colors = "Colors";
    TTO_ColSameGuild = "Same Guild Color";
    TTO_ColSameGuildTooltip = "To better recognise players from your guild, you can configure the the color of your guild name individually";
    TTO_ColRace = "Race & Create Type Color";
    TTO_ColRaceTooltip = "The color of the race and creature type text";
    TTO_ColLevel = "Neutral Level Color";
    TTO_ColLevelTooltip = "Units you cannot attack will have their level text shown in this color";
    TTO_ColByClass = "Color Player Names by Class Color";
    TTO_ColByClassTooltip = "With this option on, player names are colored by their class color, otherwise they will be colored by reaction";
    TTO_ColBorder = "Color Tip Border by Class Color";
    TTO_ColBorderTooltip = "For players, the border color will be colored to match the color of their class";
    TTO_ItemBorder = "Show Item Tips with Colored Border of Their Quality";
    TTO_ItemBorderTooltip = "When enabled and the tip is showing an item, the tip border will have the color of the item's quality\nNOTE: the Hook Special Tips option must be enabled";

    -- Reactions & BG Color
    TTO_Reactions = "Reactions";
    TTO_ReactText = "Show the unit's reaction as text";
    TTO_ReactTextTooltip = "With this option on, the reaction of the unit will be shown as text on the last line";
    TTO_BGColor = "BG Color";
    TTO_ReactBGCol = "Color backdrop depending on the unit's reaction";
    TTO_ReactBGColTooltip = "If you want the tip's background color to be determined by the unit's reaction towards you, enable this. With the option off, the background color will be the one selected on the 'Backdrop' page";
    TTO_ReactColoredBorder = "Color border based on the unit's reaction";
    TTO_ReactColoredBorderTooltip = "Same as the above option, just for the border\nNOTE: This option overrides class colored border";
    TTO_ColReact1 = "Tapped Color";
    TTO_ColReact2 = "Hostile Color";
    TTO_ColReact3 = "Caution Color";
    TTO_ColReact4 = "Neutral Color";
    TTO_ColReact5 = "Friendly NPC or PvP Player Color";
    TTO_ColReact6 = "Friendly Player Color";
    TTO_ColReact7 = "Dead Color";

    -- Backdrop
    TTO_Backdrop = "Backdrop";
    TTO_TipBG = "Background Texture";
    TTO_TipBGEdge = "Border Texture";
    TTO_TipBGSize = "Backdrop Edge Size";
    TTO_TipBGInsets = "Backdrop Insets";
    TTO_TipBGColor = "Tip Background Color";
    TTO_TipBorColor = "Tip Border Color";
    TTO_gradientTip = "Show Gradient Tip";
    TTO_gradientTipTooltip = "Display a small gradient area at the top of the tip to add a minor 3D effect to it. If you have an addon like Skinner, you may wish to disable this to avoid conflicts";
    TTO_gradientColor = "Gradient Color";
    TTO_gradientColorTooltip = "Select the base color for the gradient";

    -- Font
    TTO_Font = "Font";
    TTO_ModifyFonts = "Modify the GameTooltip Font Templates";
    TTO_ModifyFontsTooltip = "For TipTac to change the GameTooltip font templates and thus all tooltips in the User Interface, you have to enable this option";
    TTO_FontFace = "Font Face";
    TTO_FontFlags = "Font Flags";
    TTO_FontSize = "Font Size";

    -- Classify
    TTO_Classify = "Classify";
    TTO_Classification_Normal = "Normal";
    TTO_Classification_Elite = "Elite";
    TTO_Classification_WorldBoss = "Boss";
    TTO_Classification_Rare = "Rare";
    TTO_Classification_RareElite = "Rare Elite";

    -- Fading
    TTO_Fading = "Fading";
    TTO_OverrideFade = "Override Default GameTooltip Fade";
    TTO_OverrideFadeTip = "Overrides the default fadeout function of the GameTooltip. If you are seeing problems regarding fadeout, please disable.";
    TTO_PreFadeTime = "Prefade Time";
    TTO_FadeOutTime = "Fadeout Time";
    TTO_HideWorldTip = "Instantly Hide World Frame Tips";
    TTO_HideWorldTipToolTip = "This option will make tips which appear from objects in the world disappear instantly when you take the mouse off the object. Examples such as mailboxes, herbs or veins";

    -- Bars
    TTO_Bars = "Bars";
    TTO_HideDefaultBar = "Hide the Default Health Bar";
    TTO_HideDefaultBarToolTip = "Check this to hide the default health bar";
    TTO_Health = "Show Health Bar";
    TTO_HealthToolTip = "Will show a health bar of the unit. This supports MobHealth, and will show estimated health if installed and available for that unit.";
    TTO_HealthText = "Health Bar Text";
    TTO_HealthClassCol = "Color the Health Bar in the Unit's Class Color";
    TTO_HealthClassColTooltip = "This options colors the health bar in the same color as the player class";
    TTO_HealthColor = "Health Bar Color";
    TTO_HealthColorTooltip = "The color of the health bar color, has no effect for players with the option above enabled";
    TTO_ManaBar = "Show Mana Bar";
    TTO_ManaBarToolTip = "If the unit has mana, a mana bar will be shown.";
    TTO_ManaBarText = "Mana Bar Text";
    TTO_ManaColor = "Mana Bar Color";
    TTO_ManaColorTooltip = "The color of the mana bar";
    TTO_Others = "Show Energy, Rage or Focus Bar";
    TTO_OthersToolTip = "If the unit uses either energy, rage or focus, a bar for that will be shown.";
    TTO_OthersText = "Power Bar Text";

    -- Bars Misc
    TTO_BarsLook = "Bars Look";
    TTO_BarFontFace = "Font Face";
    TTO_BarFontFlags = "Font Flags";
    TTO_BarFontSize = "Font Size";
    TTO_BarTexture = "Bar Texture";
    TTO_BarHeight = "Bar Height";

    -- Auras
    TTO_Auras = "Auras";
    TTO_AurasBottom = "Put Aura Icons at the Bottom Instead of Top";
    TTO_AurasBottomTooltip = "Puts the aura icons at the bottom of the tip instead of the default top";
    TTO_UnitBuffs = "Show Unit Buffs";
    TTO_UnitBuffsTooltip = "Show buffs of the unit";
    TTO_UnitDebuff = "Show Unit Debuffs";
    TTO_UnitDebuffTooltip = "Show debuffs of the unit";
    TTO_ShowAuras = "Only Show Auras Coming from You";
    TTO_ShowAurasTooltip = "This will filter out and only display auras you cast yourself";
    TTO_AuraIconDimension = "Aura Icon Dimension";
    TTO_MaxAuraRows = "Max Aura Rows";
    TTO_CooldownModels = "Show Cooldown Models";
    TTO_CooldownModelsTooltip = "With this option on, you will see a visual progress of the time left on the buff. Only works for buffs you cast.";

    -- Icon
    TTO_Icon = "Icon";
    TTO_ShowRaidIcon = "Show Raid Icon";
    TTO_ShowRaidIcontip = "Shows the raid icon next to the tip";
    TTO_ShowFactionIcon = "Show Faction Icon";
    TTO_ShowFactionIcontip = "Shows the faction icon next to the tip";
    TTO_ShowCombatIcon = "Show Combat Icon";
    TTO_ShowCombatIcontip = "Shows a combat icon next to the tip, if the unit is in combat";
    TTO_IconAnchor = "Icon Anchor";
    TTO_IconSize = "Icon Dimension";

    -- Anchor
    TTO_Anchor = "Anchor";
    TTO_AnchorWorldUnitType = "World Unit Type";
    TTO_AnchorWorldUnitPoint = "World Unit Point";
    TTO_AnchorWorldTipType = "World Tip Type";
    TTO_AnchorWorldTipPoint = "World Tip Point";
    TTO_AnchorFrameUnitType = "Frame Unit Type";
    TTO_AnchorFrameUnitPoint = "Frame Unit Point";
    TTO_AnchorFrameTipType = "Frame Tip Type";
    TTO_AnchorFrameTipPoint = "Frame Tip Point";

    -- Mouse
    TTO_Mouse = "Mouse";
    TTO_MouseAnchorX = "Mouse Anchor X Offset";
    TTO_MouseAnchorY = "Mouse Anchor Y Offset";

    -- Combat
    TTO_Combat = "Combat";
    TTO_HideAllTipsInCombat = "Hide All Unit Tips in Combat";
    TTO_HideAllTipsInCombatTooltip = "In combat, this option will prevent any unit tips from showing";
    TTO_HideUFTipsInCombat = "Hide Unit Tips for Unit Frames in Combat";
    TTO_HideUFTipsInCombatTooltip = "When you are in combat, this option will prevent tips from showing when you have the mouse over a unit frame";
    TTO_ShowHiddenTipsOnShift = "Still Show Hidden Tips when Holding Shift";
    TTO_ShowHiddenTipsOnShiftTooltip = "When you have this option checked, and one of the above options, you can still force the tip to show, by holding down shift";

    -- Layouts
    TTO_Layouts = "Layouts";
    TTO_DropDown = "Layout Template";

    -- Talents
    TTO_Talents = "Talents";
    TTO_ShowTalents = "Enable TipTacTalents";
    TTO_ShowTalentsTooltip = "This options makes the tip show the talents of other players";
    TTO_TalentFormat = "Talent Format";
    TTO_Elemental1 = "Elemental (57/14/00)";
    TTO_Elemental2 = "Elemental";
    TTO_TalentsCacheSize = "Talent Cache Size";

    TTO_Header = " Options";
    TTO_TipAnchor = "Anchor";
    TTO_Defaults = "Defaults";
    TTO_Close = "Close";

    -- Libs
    TTO_Select_Value = "|cff00ff00Select Value...";
    TTO_Error = "|2<ERROR>|r Invalid factory object type!";
end