--[[
        Chinese Local : CWDG Translation Team CondyWl
        CWDG site: http://cwowaddon.com
        $Rev$
        $Date$
]]
--2009.03.30
if (GetLocale() == "zhCN") then
------------------------------------------------------------------------------
-- Simplified Chinese localization
------------------------------------------------------------------------------

--DropDowns.lua
	TTDD_FontFlags_None = "|cffffa0a0无";
	TTDD_FontFlags_Outline = "轮廓";
	TTDD_FontFlags_ThickOutline = "轮廓加粗";

	TTDD_AnchorType_Normal = "普通";
	TTDD_AnchorType_Mouse = "鼠标跟随";
	TTDD_AnchorType_ParentAnchor = "全局跟随";

	TTDD_AnchorPos_T = "顶部";
	TTDD_AnchorPos_TL = "左上";
	TTDD_AnchorPos_TR = "右上";
	TTDD_AnchorPos_B = "底部";
	TTDD_AnchorPos_BL = "左下";
	TTDD_AnchorPos_BR = "右下";
	TTDD_AnchorPos_L = "居左";
	TTDD_AnchorPos_R = "居右";
	TTDD_AnchorPos_C = "居中";

	TTDD_BarText_None = "|cffffa0a0无";
	TTDD_BarText_Percent = "百分比模式";
	TTDD_BarText_Values = "数值";
	TTDD_BarText_Deficit = "显示差值";
--	TTDD_BarText_Kilo = "千字数值";
	TTDD_BarText_Auto = "自动";

	TTDD_Font = {
		["英文数字"]		= "Fonts\\FRIZQT__.TTF",
		["伤害数字"]		= "Fonts\\ZYKai_C.ttf",
		["默认"]			= "Fonts\\ZYKai_T.ttf",
		["聊天"]			= "Fonts\\ZYHei.ttf",
	};
	TTDD_Background = {
		["预设"] = "Interface\\Tooltips\\UI-Tooltip-Background",
		["实心"] = "Interface\\Buttons\\WHITE8X8", --"Interface\\ChatFrame\\ChatFrameBackground
	};
	TTDD_Border = {
		["无边框"] = "Interface\\None",
		["对话框"]  = "Interface\\DialogFrame\\UI-DialogBox-Border",
		["讯息框"] = "Interface\\Tooltips\\UI-Tooltip-Border",
		["固定框"] = "Interface\\Buttons\\WHITE8X8",
	};
	TTDD_Statusbar = {
		["预设"] = "Interface\\TargetingFrame\\UI-StatusBar",
	};

	TTDD_Layout_TTNewStyle = "TipTac 新样式";
	TTDD_Layout_Default = "TipTac (默认)";
	TT_TargetYOU = "|cFFFF0000【>>*你*<<】";
	--TT_BarFontFace = "Fonts\\ZYKai_T.TTF";

	TT_Elite = "%s|r (精英)";
	TT_WorldBoss = "%s|r (首领)";
	TT_Rare = "%s|r (稀有)";
	TT_RareElite = "+%s|r (稀有精英)";

	TT_Normal_Tiny = "等级 %s";
	TT_Elite_Tiny = "等级 %s|cffffcc00 精英";
	TT_WorldBoss_Tiny = "等级 %s|cffff0000 首领";
	TT_Rare_Tiny = "等级 %s|cffff66ff 稀有";
	TT_RareElite_Tiny = "等级 %s|cffffaaff 稀有精英";

	TT_Elite_Roth = "%s精英";
	TT_WorldBoss_Roth = "%s首领";
	TT_Rare_Roth = "%s稀有";
	TT_RareElite_Roth = "%s稀有精英";

	TTOD_Layouttext_LoadedText = "|cff80ff80模板已载入!";
	TTOD_Layouttext_LayoutDeleted = "|cffff8080模板已删除!";
	TTOD_Layouttext_PickLayout = "|cff00ff00应用模板...";
	TTOD_Layouttext_DeleteLayout = "|cff00ff00删除模板...";

	--TipTacOptions.lua
	-- General
	TTO_General = "常规选项";
	TTO_UnitTip = "开启TipTac鼠标提示";
	TTO_UnitTipTooltip = "开启TipTac鼠标提示,可通过TipTac设置更改显示设置内容.";
	TTO_Status = "显示<离线>/<暂离>/<勿扰>状态";
	TTO_StatusTooltip = "在玩家名字前面显示<离线>/<暂离>/<勿扰>状态提示。";
	TTO_GuildRank = "显示玩家公会等级名称";
	TTO_GuildRankTooltip = "显示公会名称和公会等级名称";
	TTO_TargetedBy = "显示和你选定同样目标的玩家";
	TTO_TargetedByTooltip = "当在一个小队或团队中，将会显示在你队伍中和你选定同样目标的玩家。";
	TTO_NameType = "名称类型";
	TTO_NameType_Normal = "仅名称";
	TTO_NameType_Title = "使用玩家名字";
	TTO_NameType_Original = "提取于默认提示";
	TTO_Realm = "战场中玩家所属服";
	TTO_Realm_Not = "不显示";
	TTO_Realm_Show = "显示";
	TTO_Realm_Instead = "用(*)代替";
	TTO_Target = "显示目标的目标";
	TTO_Target_Not = "不显示";
	TTO_Target_1stLine = "第一行";
	TTO_Target_2ndLine = "第二行";
	TTO_Target_LastLine = "最后一行";
	TTO_Target_You = "自定义OT文字";

	--special
	TTO_Special = "特殊选项";
	TTO_AuctioneerFix = "启用拍卖行扩展提示";
	TTO_AuctioneerFixTootip = "如果你有使用拍卖行类插件，开启这个选项，会将提示设置于TipTac锚点处。";
	TTO_TipTacScale = "TipTac提示窗口大小";
	TTO_GameTooltipScale = "普通提示窗口大小";
	TTO_UpdateFreq = "提示信息实时更新频率";

	--Colors
	TTO_Colors = "颜色设置";
	TTO_ColSameGuild = "所在公会名称颜色";
	TTO_ColSameGuildTooltip = "为了方便认出你的会友，可以自定义你所在公会名称的颜色。";
	TTO_ColRace = "种族和种类颜色";
	TTO_ColRaceTooltip = "可自定义玩家所属种族和目标所属种类的说明文字颜色。";
	TTO_ColLevel = "中立目标等级颜色";
	TTO_ColLevelTooltip = "可自定义你不能攻击的目标等级数字颜色。";
	TTO_ColByClass = "按职业颜色显示玩家名字";
	TTO_ColByClassTooltip = "当开启此功能，目标玩家的名字会按照其自身职业对应的颜色来显示。";
	TTO_ColBorder = "按职业颜色显示提示窗口边框";
	TTO_ColBorderTooltip = "当开启此功能，目标玩家的提示信息窗口边框颜色将会显示为目标玩家的职业颜色。";
	TTO_ItemBorder = "按物品品质等级颜色显示物品提示边框";
	TTO_ItemBorderTooltip = "当开启此选项，物品提示信息窗口边框颜色将会变成该物品的品质级别颜色\注意：必须打开【整合特殊提示信息】选项。";

	-- Reactions & BG Color
	TTO_Reactions = "目标属性";
	TTO_ReactText = "显示目标属性说明文字";
	TTO_ReactTextTooltip = "当开启此选项，所选目标的属性说明文字将会显示在最后一行。";
	TTO_BGColor = "背景颜色";
	TTO_ReactBGCol = "按目标状态属性定义提示框背景色";
	TTO_ReactBGColTooltip = "如果开启此选项，提示框的背景颜色将替换为自定义的目标状态属性颜色；关闭此选项后，提示框的背景颜色将显示为在“窗口背景”标签页设置的颜色。";
	TTO_ColoredBorder = "按目标状态着色边框颜色";
	TTO_ColoredBorderTooltip = "如果开启此选项，只是边框\n提示: 这个设置将覆盖已按职业着色的边框！";
	TTO_ColReact1 = "低级别目标（灰名）颜色";
	TTO_ColReact2 = "敌对目标颜色";
	TTO_ColReact3 = "高级别目标（红名）颜色";
	TTO_ColReact4 = "中立目标颜色";
	TTO_ColReact5 = "友好NPC或开启PVP状态友方玩家颜色";
	TTO_ColReact6 = "未开启PVP状态友方玩家颜色";
	TTO_ColReact7 = "死亡目标颜色";

	--Backdrop
	TTO_Backdrop = "背景边框";
	TTO_GradientTip = "提示框背景渐变";
	TTO_GradientTipToolTip = "在提示框背景顶部显示一块渐变区域，使其更有立体感。如果你有其他的皮肤插件（例如Skinner），你可能需要禁止此功能以解决显示不正常的问题。";
	TTO_GradientColor = "渐变颜色";
	TTO_TipBG = "信息窗口背景样式";
	TTO_TipBGEdge = "信息窗口边框样式";
	TTO_TipBGSize = "信息窗口边框大小";
	TTO_TipBGInsets = "信息窗口背景颜色";
	TTO_TipBGColor = "普通提示窗口背景色";
	TTO_TipBorColor = "普通提示窗口边框色";
	TTO_TipTacBGColor = "TipTac提示窗口背景色";
	TTO_TipTacBorColor = "TipTac提示窗口边框色";

	--Font
	TTO_Font = "字体设置";
	TTO_ModifyFonts = "自定义字体";
	TTO_ModifyFontsTooltip = "如果想自定义提示信息字体或其他字体请开启此选项。";
	TTO_FontFace = "字体名称";
	TTO_FontFlags = "字体样式";
	TTO_FontSize = "字体大小";

	--Classify
	TTO_Classify = "目标类型";
	TTO_Classification_Normal = "普通";
	TTO_Classification_Elite = "精英";
	TTO_Classification_WorldBoss = "首领";
	TTO_Classification_Rare = "稀有";
	TTO_Classification_RareElite = "稀有精英";

	-- Fading
	TTO_Fading = "窗口特效";
	TTO_OverrideFade = "取消默认提示渐隐";
	TTO_OverrideFadeTooltip = "取消默认的鼠标提示渐隐功能,如出现问题,请停用.";
	TTO_PreFadeTime = "提示窗口关闭延迟时间";
	TTO_FadeOutTime = "TipTac窗口关闭时淡出时间";
	TTO_HideWorldTips = "隐藏世界物品信息提示";
	TTO_HideWorldTipsToolTip = "开启此选项将会隐藏世界物品信息提示（例如：邮箱、药草、矿脉等）。";

	-- Bars
	TTO_Bars = "血条数值";
	TTO_DefaultBar = "隐藏默认生命条";
	TTO_DefaultBarTooltip = "检测并隐藏默认的生命条";
	TTO_Health = "显示生命条";
	TTO_HealthToolTip = "显示指定目标的生命条。";
	TTO_HealthText = "生命值模式";
	TTO_HealthClassCol = "按职业颜色显示生命条";
	TTO_HealthClassColTooltip = "开启此选项会将生命条的颜色显示为该玩家的职业颜色。";
	TTO_HealthColor = "生命条颜色";
	TTO_HealthColorTooltip = "设置生命条显示的颜色，如果开启“按职业颜色显示生命条”选项则此调整颜色功能无效。";
	TTO_ManaBar = "显示法力条";
	TTO_ManaBarToolTip = "如果指定的目标会施法，那么将会显示法力条。";
	TTO_ManaBarText = "法力值模式";
	TTO_ManaColor = "法力条颜色";
	TTO_ManaColorTooltip = "设置法力条显示的颜色。";
	TTO_Others = "显示能量/怒气/焦点监视条";
	TTO_OthersToolTip = "如果指定的目标有/能量/怒气/焦点监视条，那么将会显示对应的内容。";
	TTO_OthersText = "显示模式";

	-- Bars Misc
	TTO_BarsMisc = "血条样式";
	TTO_BarFontFace = "状态条字体名称";
	TTO_BarFontFlags = "状态条字体样式";
	TTO_BarFontSize = "状态条字体大小";
	TTO_BarTexture = "状态条材质";
	TTO_BarHeight = "状态条高度";

	-- Auras
	TTO_Auras = "BUFF设置";
	TTO_AurasBottom = "BUFF/DEBUFF图标提示窗口底部显示。";
	TTO_AurasBottomTooltip = "将BUFF/DEBUFF图标移到提示窗口底部。";
	TTO_UnitBuffs = "显示目标Buff";
	TTO_UnitBuffsTooltip = "显示选定目标的增益状态。";
	TTO_CastableBuffs = "显示可施放的Buff";
	TTO_CastableBuffsTooltip = "只显示你目前可施放的增益状态。";
	TTO_UnitDebuff = "显示目标Debuff";
	TTO_UnitDebuffTooltip = "显示目标的减益状态。";
	TTO_RemovableDebuff = "显示可驱散的Debuff";
	TTO_RemovableDebuffTooltip = "只显示你目前可驱散的减益状态。";
	TTO_AuraIconDimension = "Buff/Debuff图标大小";
	TTO_MaxAuraRows = "最大图标行数";
	TTO_CooldownModels = "显示Buff/Debuff倒计时";
	TTO_CooldownModelsTooltip = "打开此选项后，你将会看到Buff/Debuff剩余时间（只对你施放的Buff/Debuff有效）。";
	
	TTO_SelfAura = "仅显示你施放的状态";
	TTO_SelfAuraTip = "仅显示你施放在目标身上的状态";

	-- Icon
	TTO_Icon = "图标显示";
	TTO_ShowIcon = "显示团队和阵营图标";
	TTO_IconToolTip = "在鼠标提示里显示团队和阵营的图标";
	TTO_IconAnchor = "图标锚点";
	TTO_IconSize = "图标尺寸";
	
	TTO_ShowRaidIcon = "显示团队标记图标";
	TTO_ShowRaidIconTip = "显示目标头顶的团队标记(若有的话)";
	TTO_ShowFactionIcon = "显示阵营图标";
	TTO_ShowFactionIconTip = "显示目标所属阵营图标";
	TTO_ShowCombatIcon = "显示战斗状态图标";
	TTO_ShowCombatIconTip = "目标若处于战斗状态则显示战斗图标";

	-- Anchor
	TTO_Anchor = "窗口定位";
	TTO_Anchor_WUT = "世界单位类型";
	TTO_Anchor_WUP = "世界单位定位";
	TTO_Anchor_WTT = "世界提示类型";
	TTO_Anchor_WTP = "世界提示定位";
	TTO_Anchor_FUT = "框体单位类型";
	TTO_Anchor_FUP = "框体单位定位";
	TTO_Anchor_FTT = "框体提示类型";
	TTO_Anchor_FTP = "框体提示定位";

	-- Mouse
	TTO_Mouse = "鼠标偏移";
	TTO_MouseAnchorX = "鼠标跟随X轴偏移值";
	TTO_MouseAnchorY = "鼠标跟随Y轴偏移值";

	-- Combat
	TTO_Combat = "战斗隐藏";
	TTO_AllTipsInCombat = "战斗中隐藏所有提示";
	TTO_AllTipsInCombatTooltip = "进入战斗中时,此设置将关闭所有单位提示.";
	TTO_UFTipsInCombat = "战斗中隐藏活动单位提示";
	TTO_UFTipsInCombatToolTips = "当进入战斗中时,鼠标经过的单位鼠标提示将被隐藏.";

	--Layouts
	TTO_Layouts = "模板样式";
	TTO_DropDown = "模板样式";

	--Talents
	TTO_Talents = "天赋样式";
	TTO_ShowTalents = "开启天赋提示";
	TTO_ShowTalentsTooltip = "开启此选项则可察看目标的天赋属性。";
	TTO_TalentFormat = "天赋格式";
	TTO_TalentFormat1 = "元素 (57/14/00)";
	TTO_TalentFormat2 = "元素";
	TTO_TalentFormat3 = "57/14/00";
	
	TTO_EnableTalents = "启用天赋模块";
	TTO_EnableTalentsTip = "启用此模块可在鼠标提示信息中显示目标的天赋";
	TTO_TalentCacheSize = "天赋缓存大小";

	TTO_Header = "选项";
	TTO_TipAnchor = "定位";
	TTO_Defaults = "默认";
	TTO_Close = "关闭";


elseif (GetLocale() == "zhTW") then
------------------------------------------------------------------------------
-- Traditional Chinese localization 
------------------------------------------------------------------------------
--DropDowns.lua
	TTDD_FontFlags_None = "|cffffa0a0無";
	TTDD_FontFlags_Outline = "輪廓";
	TTDD_FontFlags_ThickOutline = "輪廓加粗";

	TTDD_AnchorType_Normal = "普通";
	TTDD_AnchorType_Mouse = "鼠標跟隨";
	TTDD_AnchorType_ParentAnchor = "全局跟隨";

	TTDD_AnchorPos_T = "頂部";
	TTDD_AnchorPos_TL = "左上";
	TTDD_AnchorPos_TR = "右上";
	TTDD_AnchorPos_B = "底部";
	TTDD_AnchorPos_BL = "左下";
	TTDD_AnchorPos_BR = "右下";
	TTDD_AnchorPos_L = "居左";
	TTDD_AnchorPos_R = "居右";
	TTDD_AnchorPos_C = "居中";

	TTDD_BarText_None = "|cffffa0a0無";
	TTDD_BarText_Percent = "百分比模式";
	TTDD_BarText_Values = "數值";
	TTDD_BarText_Deficit = "顯示差值";
--	TTDD_BarText_Kilo = "千字數值";
	TTDD_BarText_Auto = "自動";

	TTDD_Font = {
	    ["英文字型"]		= "Fonts\\FRIZQT__.TTF",
		["提示訊息"]		= "Fonts\\bHEI00M.ttf",
		["聊天"]			= "Fonts\\bHEI01B.ttf",
		["傷害數字"]		= "Fonts\\bKAI00M.ttf",
		["預設"]			= "Fonts\\bLEI00D.ttf",
	};
	TTDD_Background = {
		["預設"] = "Interface\\Tooltips\\UI-Tooltip-Background",
		["實心"] = "Interface\\Buttons\\WHITE8X8", --"Interface\\ChatFrame\\ChatFrameBackground
	};
	TTDD_Border = {
		["無邊框"] = "Interface\\None",
		["對話框"]  = "Interface\\DialogFrame\\UI-DialogBox-Border",
		["訊息框"] = "Interface\\Tooltips\\UI-Tooltip-Border",
		["固定框"] = "Interface\\Buttons\\WHITE8X8",
	};
	TTDD_Statusbar = {
		["預設"] = "Interface\\TargetingFrame\\UI-StatusBar",
	};

	TTDD_Layout_TTNewStyle = "TipTac 新樣式";
	TTDD_Layout_Default = "TipTac (默認)";
	TT_TargetYOU = "|cFFFF0000【>>*你*<<】";
	--TT_BarFontFace = "Fonts\\ZYKai_T.TTF";

	TT_Elite = "%s|r (精英)";
	TT_WorldBoss = "%s|r (首領)";
	TT_Rare = "%s|r (稀有)";
	TT_RareElite = "+%s|r (稀有精英)";

	TT_Normal_Tiny = "等級 %s";
	TT_Elite_Tiny = "等級 %s|cffffcc00 精英";
	TT_WorldBoss_Tiny = "等級 %s|cffff0000 首領";
	TT_Rare_Tiny = "等級 %s|cffff66ff 稀有";
	TT_RareElite_Tiny = "等級 %s|cffffaaff 稀有精英";

	TT_Elite_Roth = "%s精英";
	TT_WorldBoss_Roth = "%s首領";
	TT_Rare_Roth = "%s稀有";
	TT_RareElite_Roth = "%s稀有精英";

	TTOD_Layouttext_LoadedText = "|cff80ff80模板已載入!";
	TTOD_Layouttext_LayoutDeleted = "|cffff8080模板已刪除!";
	TTOD_Layouttext_PickLayout = "|cff00ff00應用模板...";
	TTOD_Layouttext_DeleteLayout = "|cff00ff00刪除模板...";

	--TipTacOptions.lua
	-- General
	TTO_General = "常規選項";
	TTO_UnitTip = "開啟TipTac鼠標提示";
	TTO_UnitTipTooltip = "開啟TipTac鼠標提示,可通過TipTac設置更改顯示設置內容.";
	TTO_Status = "顯示<離線>/<暫離>/<勿擾>狀態";
	TTO_StatusTooltip = "在玩家名字前面顯示<離線>/<暫離>/<勿擾>狀態提示。";
	TTO_GuildRank = "顯示玩家公會等級名稱";
	TTO_GuildRankTooltip = "顯示公會名稱和公會等級名稱";
	TTO_TargetedBy = "顯示和你選定同樣目標的玩家";
	TTO_TargetedByTooltip = "當在一個小隊或團隊中，將會顯示在你隊伍中和你選定同樣目標的玩家。";
	TTO_NameType = "名稱類型";
	TTO_NameType_Normal = "僅名稱";
	TTO_NameType_Title = "使用玩家名字";
	TTO_NameType_Original = "提取於默認提示";
	TTO_Realm = "戰場中玩家所屬服";
	TTO_Realm_Not = "不顯示";
	TTO_Realm_Show = "顯示";
	TTO_Realm_Instead = "用(*)代替";
	TTO_Target = "顯示目標的目標";
	TTO_Target_Not = "不顯示";
	TTO_Target_1stLine = "第一行";
	TTO_Target_2ndLine = "第二行";
	TTO_Target_LastLine = "最後一行";
	TTO_Target_You = "自定義OT文字";

	--special
	TTO_Special = "特殊選項";
	TTO_AuctioneerFix = "啟用拍賣行擴展提示";
	TTO_AuctioneerFixTootip = "如果你有使用拍賣行類插件，開啟這個選項，會將提示設置於TipTac錨點處。";
	TTO_TipTacScale = "TipTac提示窗口大小";
	TTO_GameTooltipScale = "普通提示窗口大小";
	TTO_UpdateFreq = "提示信息實時更新頻率";

	--Colors
	TTO_Colors = "顏色設置";
	TTO_ColSameGuild = "所在公會名稱顏色";
	TTO_ColSameGuildTooltip = "為了方便認出你的會友，可以自定義你所在公會名稱的顏色。";
	TTO_ColRace = "種族和種類顏色";
	TTO_ColRaceTooltip = "可自定義玩家所屬種族和目標所屬種類的說明文字顏色。";
	TTO_ColLevel = "中立目標等級顏色";
	TTO_ColLevelTooltip = "可自定義你不能攻擊的目標等級數字顏色。";
	TTO_ColByClass = "按職業顏色顯示玩家名字";
	TTO_ColByClassTooltip = "當開啟此功能，目標玩家的名字會按照其自身職業對應的顏色來顯示。";
	TTO_ColBorder = "按職業顏色顯示提示窗口邊框";
	TTO_ColBorderTooltip = "當開啟此功能，目標玩家的提示信息窗口邊框顏色將會顯示為目標玩家的職業顏色。";
	TTO_ItemBorder = "按物品品質等級顏色顯示物品提示邊框";
	TTO_ItemBorderTooltip = "當開啟此選項，物品提示信息窗口邊框顏色將會變成該物品的品質級別顏色\註意：必須打開【整合特殊提示信息】選項。";

	-- Reactions & BG Color
	TTO_Reactions = "目標屬性";
	TTO_ReactText = "顯示目標屬性說明文字";
	TTO_ReactTextTooltip = "當開啟此選項，所選目標的屬性說明文字將會顯示在最後一行。";
	TTO_BGColor = "背景顏色";
	TTO_ReactBGCol = "按目標狀態屬性定義提示框背景色";
	TTO_ReactBGColTooltip = "如果開啟此選項，提示框的背景顏色將替換為自定義的目標狀態屬性顏色；關閉此選項後，提示框的背景顏色將顯示為在“窗口背景”標簽頁設置的顏色。";
	TTO_ColoredBorder = "按目標狀態著色邊框顏色";
	TTO_ColoredBorderTooltip = "如果開啟此選項，只是邊框\n提示: 這個設置將覆蓋已按職業著色的邊框！";
	TTO_ColReact1 = "低級別目標（灰名）顏色";
	TTO_ColReact2 = "敵對目標顏色";
	TTO_ColReact3 = "高級別目標（紅名）顏色";
	TTO_ColReact4 = "中立目標顏色";
	TTO_ColReact5 = "友好NPC或開啟PVP狀態友方玩家顏色";
	TTO_ColReact6 = "未開啟PVP狀態友方玩家顏色";
	TTO_ColReact7 = "死亡目標顏色";

	--Backdrop
	TTO_Backdrop = "背景邊框";
	TTO_GradientTip = "提示框背景漸變";
	TTO_GradientTipToolTip = "在提示框背景頂部顯示一塊漸變區域，使其更有立體感。如果你有其他的皮膚插件（例如Skinner），你可能需要禁止此功能以解決顯示不正常的問題。";
	TTO_GradientColor = "漸變顏色";
	TTO_TipBG = "信息窗口背景樣式";
	TTO_TipBGEdge = "信息窗口邊框樣式";
	TTO_TipBGSize = "信息窗口邊框大小";
	TTO_TipBGInsets = "信息窗口背景顏色";
	TTO_TipBGColor = "普通提示窗口背景色";
	TTO_TipBorColor = "普通提示窗口邊框色";
	TTO_TipTacBGColor = "TipTac提示窗口背景色";
	TTO_TipTacBorColor = "TipTac提示窗口邊框色";

	--Font
	TTO_Font = "字體設置";
	TTO_ModifyFonts = "自定義字體";
	TTO_ModifyFontsTooltip = "如果想自定義提示信息字體或其他字體請開啟此選項。";
	TTO_FontFace = "字體名稱";
	TTO_FontFlags = "字體樣式";
	TTO_FontSize = "字體大小";

	--Classify
	TTO_Classify = "目標類型";
	TTO_Classification_Normal = "普通";
	TTO_Classification_Elite = "精英";
	TTO_Classification_WorldBoss = "首領";
	TTO_Classification_Rare = "稀有";
	TTO_Classification_RareElite = "稀有精英";

	-- Fading
	TTO_Fading = "窗口特效";
	TTO_OverrideFade = "取消默認提示漸隱";
	TTO_OverrideFadeTooltip = "取消默認的鼠標提示漸隱功能,如出現問題,請停用.";
	TTO_PreFadeTime = "提示窗口關閉延遲時間";
	TTO_FadeOutTime = "TipTac窗口關閉時淡出時間";
	TTO_HideWorldTips = "隱藏世界物品信息提示";
	TTO_HideWorldTipsToolTip = "開啟此選項將會隱藏世界物品信息提示（例如：郵箱、藥草、礦脈等）。";

	-- Bars
	TTO_Bars = "血條數值";
	TTO_DefaultBar = "隱藏默認生命條";
	TTO_DefaultBarTooltip = "檢測並隱藏默認的生命條";
	TTO_Health = "顯示生命條";
	TTO_HealthToolTip = "顯示指定目標的生命條。";
	TTO_HealthText = "生命值模式";
	TTO_HealthClassCol = "按職業顏色顯示生命條";
	TTO_HealthClassColTooltip = "開啟此選項會將生命條的顏色顯示為該玩家的職業顏色。";
	TTO_HealthColor = "生命條顏色";
	TTO_HealthColorTooltip = "設置生命條顯示的顏色，如果開啟“按職業顏色顯示生命條”選項則此調整顏色功能無效。";
	TTO_ManaBar = "顯示法力條";
	TTO_ManaBarToolTip = "如果指定的目標會施法，那麽將會顯示法力條。";
	TTO_ManaBarText = "法力值模式";
	TTO_ManaColor = "法力條顏色";
	TTO_ManaColorTooltip = "設置法力條顯示的顏色。";
	TTO_Others = "顯示能量/怒氣/焦點監視條";
	TTO_OthersToolTip = "如果指定的目標有/能量/怒氣/焦點監視條，那麽將會顯示對應的內容。";
	TTO_OthersText = "顯示模式";

	-- Bars Misc
	TTO_BarsMisc = "血條樣式";
	TTO_BarFontFace = "狀態條字體名稱";
	TTO_BarFontFlags = "狀態條字體樣式";
	TTO_BarFontSize = "狀態條字體大小";
	TTO_BarTexture = "狀態條材質";
	TTO_BarHeight = "狀態條高度";

	-- Auras
	TTO_Auras = "BUFF設置";
	TTO_AurasBottom = "BUFF/DEBUFF圖標提示窗口底部顯示。";
	TTO_AurasBottomTooltip = "將BUFF/DEBUFF圖標移到提示窗口底部。";
	TTO_UnitBuffs = "顯示目標Buff";
	TTO_UnitBuffsTooltip = "顯示選定目標的增益狀態。";
	TTO_CastableBuffs = "顯示可施放的Buff";
	TTO_CastableBuffsTooltip = "只顯示你目前可施放的增益狀態。";
	TTO_UnitDebuff = "顯示目標Debuff";
	TTO_UnitDebuffTooltip = "顯示目標的減益狀態。";
	TTO_RemovableDebuff = "顯示可驅散的Debuff";
	TTO_RemovableDebuffTooltip = "只顯示你目前可驅散的減益狀態。";
	TTO_AuraIconDimension = "Buff/Debuff圖標大小";
	TTO_MaxAuraRows = "最大圖標行數";
	TTO_CooldownModels = "顯示Buff/Debuff倒計時";
	TTO_CooldownModelsTooltip = "打開此選項後，你將會看到Buff/Debuff剩余時間（只對你施放的Buff/Debuff有效）。";
	
	TTO_SelfAura = "僅顯示你施放的狀態";
	TTO_SelfAuraTip = "僅顯示你施放在目標身上的狀態";

	-- Icon
	TTO_Icon = "圖標顯示";
	TTO_ShowIcon = "顯示團隊和陣營圖標";
	TTO_IconToolTip = "在鼠標提示裏顯示團隊和陣營的圖標";
	TTO_IconAnchor = "圖標錨點";
	TTO_IconSize = "圖標尺寸";
	
	TTO_ShowRaidIcon = "顯示團隊標記圖標";
	TTO_ShowRaidIconTip = "顯示目標頭頂的團隊標記(若有的話)";
	TTO_ShowFactionIcon = "顯示陣營圖標";
	TTO_ShowFactionIconTip = "顯示目標所屬陣營圖標";
	TTO_ShowCombatIcon = "顯示戰鬥狀態圖標";
	TTO_ShowCombatIconTip = "目標若處於戰鬥狀態則顯示戰鬥圖標";

	-- Anchor
	TTO_Anchor = "窗口定位";
	TTO_Anchor_WUT = "世界單位類型";
	TTO_Anchor_WUP = "世界單位定位";
	TTO_Anchor_WTT = "世界提示類型";
	TTO_Anchor_WTP = "世界提示定位";
	TTO_Anchor_FUT = "框體單位類型";
	TTO_Anchor_FUP = "框體單位定位";
	TTO_Anchor_FTT = "框體提示類型";
	TTO_Anchor_FTP = "框體提示定位";

	-- Mouse
	TTO_Mouse = "鼠標偏移";
	TTO_MouseAnchorX = "鼠標跟隨X軸偏移值";
	TTO_MouseAnchorY = "鼠標跟隨Y軸偏移值";

	-- Combat
	TTO_Combat = "戰鬥隱藏";
	TTO_AllTipsInCombat = "戰鬥中隱藏所有提示";
	TTO_AllTipsInCombatTooltip = "進入戰鬥中時,此設置將關閉所有單位提示.";
	TTO_UFTipsInCombat = "戰鬥中隱藏活動單位提示";
	TTO_UFTipsInCombatToolTips = "當進入戰鬥中時,鼠標經過的單位鼠標提示將被隱藏.";

	--Layouts
	TTO_Layouts = "模板樣式";
	TTO_DropDown = "模板樣式";

	--Talents
	TTO_Talents = "天賦樣式";
	TTO_ShowTalents = "開啟天賦提示";
	TTO_ShowTalentsTooltip = "開啟此選項則可察看目標的天賦屬性。";
	TTO_TalentFormat = "天賦格式";
	TTO_TalentFormat1 = "元素 (57/14/00)";
	TTO_TalentFormat2 = "元素";
	TTO_TalentFormat3 = "57/14/00";
	
	TTO_EnableTalents = "啟用天賦模塊";
	TTO_EnableTalentsTip = "啟用此模塊可在鼠標提示信息中顯示目標的天賦";
	TTO_TalentCacheSize = "天賦緩存大小";

	TTO_Header = "選項";
	TTO_TipAnchor = "定位";
	TTO_Defaults = "默認";
	TTO_Close = "關閉";

else
------------------------------------------------------------------------------
-- English localization (default)
------------------------------------------------------------------------------
--DropDowns.lua
	TTDD_FontFlags_None = "|cffffa0a0None";
	TTDD_FontFlags_Outline = "Outline";
	TTDD_FontFlags_ThickOutline = "Thick Outline";

	TTDD_AnchorType_Normal = "Normal Anchor";
	TTDD_AnchorType_Mouse = "Mouse Anchor";
	TTDD_AnchorType_ParentAnchor = "Parent Anchor";

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
	TTDD_BarText_Percent = "Show percentage";
	TTDD_BarText_Values = "Show values if available";
	TTDD_BarText_Deficit = "Show deficit";
--	TTDD_BarText_Kilo = "Show values in kilo";
	TTDD_BarText_Auto = "Auto";

	TTDD_Font = {
		["Arial Narrow"]			= "Fonts\\ARIALN.TTF",
		["Friz Quadrata TT"]		= "Fonts\\FRIZQT__.TTF",
		["Morpheus"]				= "Fonts\\MORPHEUS.TTF",
		["Nimrod MT"]			= "Fonts\\NIM_____.ttf",
		["Skurri"]				= "Fonts\\SKURRI.TTF",
	};
	TTDD_Background = {
		["Blizzard Tooltip"] = "Interface\\Tooltips\\UI-Tooltip-Background",
		["Solid"] = "Interface\\Buttons\\WHITE8X8", --"Interface\\ChatFrame\\ChatFrameBackground
	};
	TTDD_Border = {
		["None"] = "Interface\\None",
		["Blizzard Dialog"]  = "Interface\\DialogFrame\\UI-DialogBox-Border",
		["Blizzard Tooltip"] = "Interface\\Tooltips\\UI-Tooltip-Border",
		["Solid"] = "Interface\\Buttons\\WHITE8X8",
	};
	TTDD_Statusbar = {
		["Blizzard StatusBar"] = "Interface\\TargetingFrame\\UI-StatusBar",
	};

	TTDD_Layout_TTNewStyle = "TipTac NewStyle";
	TTDD_Layout_Default = "TipTac (Default)";
	TT_TargetYOU = "<<YOU>>";
	--TT_BarFontFace = "Fonts\\ARIALN.TTF";

	TT_Elite = "+%s";
	TT_WorldBoss = "%s|r (Boss)";
	TT_Rare = "%s|r (Rare)";
	TT_RareElite = "+%s|r (Rare)";

	TT_Normal_Tiny = "Level %s";
	TT_Elite_Tiny = "Level %s|cffffcc00 Elite";
	TT_WorldBoss_Tiny = "Level %s|cffff0000 Boss";
	TT_Rare_Tiny = "Level %s|cffff66ff Rare";
	TT_RareElite_Tiny = "Level %s|cffffaaff Rare Elite";

	TT_Elite_Roth = "%s+";
	TT_WorldBoss_Roth = "%sb++";
	TT_Rare_Roth = "%sr";
	TT_RareElite_Roth = "%sr+";

	TTOD_Layouttext_LoadedText = "|cff80ff80Layout Loaded";
	TTOD_Layouttext_LayoutDeleted = "|cffff8080Layout Deleted!";
	TTOD_Layouttext_PickLayout = "|cff00ff00Pick Layout...";
	TTOD_Layouttext_DeleteLayout = "|cff00ff00Delete Layout...";


	--TipTacOptions.lua
	-- General
	TTO_General = "General";
	TTO_UnitTip = "Enable TipTac Unit Tips Appearance";
	TTO_UnitTipTooltip = "Will change the appearance of how unit tips look. Many options in TipTac only work with this setting enabled";
	TTO_Status = "Show DC, AFK and DND Status";
	TTO_StatusTooltip = "Will show the <DC>, <AFK> and <DND> status infront of the player name";
	TTO_GuildRank = "Show Player Guild Rank Title";
	TTO_GuildRankTooltip = "In addition to the guild name, with this option on, you will also see their guild rank by title";
	TTO_TargetedBy = "Show Who Targets the Unit";
	TTO_TargetedByTooltip = "When in a raid or party, the tip will show who from your group is targeting the unit";
	TTO_NameType = "Name Type";
	TTO_NameType_Normal = "Name only";
	TTO_NameType_Title = "Use player titles";
	TTO_NameType_Original = "Copy from original tip";
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

	--special
	TTO_Special = "Special";
	TTO_AuctioneerFix = "Enable Auctioneer LibExtraTip Workaround";
	TTO_AuctioneerFixTootip = "Please try out this option, if you are using the Auctioneer Suite, and are seeing the tooltip not being in the place you set the TipTacAnchor";
	TTO_TipTacScale = "TipTac Scale";
	TTO_GameTooltipScale = "GameTooltip Scale";
	TTO_UpdateFreq = "Tip Update Frequency";

	--Colors
	TTO_Colors = "Colors";
	TTO_ColSameGuild = "Same Guild Color";
	TTO_ColSameGuildTooltip = "To better recognise players from your guild, you can configure the the color of your guild name individually";
	TTO_ColRace = "Race & Create Type Color";
	TTO_ColRaceTooltip = "The color of the Race & Create Type text";
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
	TTO_ColoredBorder = "Color border based on the unit's reaction";
	TTO_ColoredBorderTooltip = "Same as the above option, just for the border\nNOTE: This option overrides class colored border";
	TTO_ColReact1 = "Tapped Color";
	TTO_ColReact2 = "Hostile Color";
	TTO_ColReact3 = "Caution Color";
	TTO_ColReact4 = "Neutral Color";
	TTO_ColReact5 = "Friendly NPC or PvP Player Color";
	TTO_ColReact6 = "Friendly Player Color";
	TTO_ColReact7 = "Dead Color";

	--Backdrop
	TTO_Backdrop = "Backdrop";
	TTO_GradientTip = "Show Gradient Tip";
	TTO_GradientTipToolTip = "Display a small gradient area at the top of the tip to add a minor 3D effect to it. If you have an addon like Skinner, you may wish to disable this to avoid conflicts";
	TTO_GradientColor = "Gradient Color";
	TTO_GradientColorTooltip = "Select the base color for the gradient";
	TTO_Backdrop = "Backdrop";
	TTO_TipBG = "Background Texture";
	TTO_TipBGEdge = "Border Texture";
	TTO_TipBGSize = "Backdrop Edge Size";
	TTO_TipBGInsets = "Backdrop Insets";
	TTO_TipBGColor = "Tip Background Color";
	TTO_TipBorColor = "Tip Border Color";
	TTO_TipTacBGColor = "TipTac Background Color";
	TTO_TipTacBorColor = "TipTac Border Color";

	--Font
	TTO_Font = "Font";
	TTO_ModifyFonts = "Modify the GameTooltip Font Templates";
	TTO_ModifyFontsTooltip = "For TipTac to change the GameTooltip font templates and thus all tooltips in the User Interface, you have to enable this option";
	TTO_FontFace = "Font Face";
	TTO_FontFlags = "Font Flags";
	TTO_FontSize = "Font Size";

	--Classify
	TTO_Classify = "Classify";
	TTO_Classification_Normal = "Normal";
	TTO_Classification_Elite = "Elite";
	TTO_Classification_WorldBoss = "Boss";
	TTO_Classification_Rare = "Rare";
	TTO_Classification_RareElite = "Rare Elite";

	-- Fading
	TTO_Fading = "Fading";
	TTO_OverrideFade = "Override Default GameTooltip Fade";
	TTO_OverrideFadeTooltip = "Overrides the default fadeout function of the GameTooltip. If you are seeing problems regarding fadeout, please disable.";
	TTO_PreFadeTime = "Pre Fade Time";
	TTO_FadeOutTime = "Fade Out Time";
	TTO_HideWorldTips = "Instantly Hide World Frame Tips";
	TTO_HideWorldTipsTooltip = "This option will make tips which appear from objects in the world disappear instantly when you take the mouse off the object. Examples such as mailboxes, herbs or veins.\nNOTE: Does not work for all world objects.";

	-- Bars
	TTO_Bars = "Bars";
	TTO_DefaultBar = "Hide the Default Health Bar";
	TTO_DefaultBarTooltip = "Check this to hide the default health bar";
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
	TTO_BarsMisc = "Bars Look";
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
	TTO_CastableBuffs = "Show Castable Buffs Only";
	TTO_CastableBuffsTooltip = "This will filter out and not display any buffs you cannot cast";
	TTO_UnitDebuff = "Show Unit Debuffs";
	TTO_UnitDebuffTooltip = "Show debuffs of the unit";
	TTO_RemovableDebuff = "Show Removable Debuffs Only";
	TTO_RemovableDebuffTooltip = "This will filter out and not display any debuffs you cannot remove";
	TTO_AuraIconDimension = "Aura Icon Dimension";
	TTO_MaxAuraRows = "Max Aura Rows";
	TTO_CooldownModels = "Show Cooldown Models";
	TTO_CooldownModelsTooltip = "With this option on, you will see a visual progress of the time left on the buff. Only works for buffs you cast.";
	TTO_SelfAura = "Only Show Auras Coming from You";
	TTO_SelfAuraTip = "This will filter out and only display auras you cast yourself";

	-- Icon
	TTO_Icon = "Icon";
	TTO_ShowIcon = "Show Raid and Faction Icon";
	TTO_IconToolTip = "Shows the raid or faction icon next to the tip";
	TTO_IconAnchor = "Icon Anchor";
	TTO_IconSize = "Icon Dimension";
	TTO_ShowRaidIcon = "Show Raid Icon";
	TTO_ShowRaidIconTip = "Shows the raid icon next to the tip";
	TTO_ShowFactionIcon = "Show Faction Icon";
	TTO_ShowFactionIconTip = "Shows the faction icon next to the tip";
	TTO_ShowCombatIcon = "Show Combat Icon";
	TTO_ShowCombatIconTip = "Shows a combat icon next to the tip, if the unit is in combat";

	-- Anchor
	TTO_Anchor = "Anchor";
	TTO_Anchor_WUT = "World Unit Type";
	TTO_Anchor_WUP = "World Unit Point";
	TTO_Anchor_WTT = "World Tip Type";
	TTO_Anchor_WTP = "World Tip Point";
	TTO_Anchor_FUT = "Frame Unit Type";
	TTO_Anchor_FUP = "Frame Unit Point";
	TTO_Anchor_FTT = "Frame Tip Type";
	TTO_Anchor_FTP = "Frame Tip Point";

	--Mouse
	TTO_Mouse = "Mouse";
	TTO_MouseAnchorX = "Mouse Anchor X Offset";
	TTO_MouseAnchorY = "Mouse Anchor Y Offset";

	-- Combat
	TTO_Combat = "Combat";
	TTO_AllTipsInCombat = "Hide All Unit Tips in Combat";
	TTO_AllTipsInCombatTooltip = "In combat, this option will prevent any unit tips from showing";
	TTO_UFTipsInCombat = "Hide Unit Tips for Unit Frames in Combat";
	TTO_UFTipsInCombatToolTips = "When you are in combat, this option will prevent tips from showing when you have the mouse over a unit frame";

	--Layouts
	TTO_Layouts = "Layouts";
	TTO_Layouts_DropDown = "Layout Template";

	--Talents
	TTO_Talents = "Talents";
	TTO_ShowTalents = "Enable TipTacTalents";
	TTO_ShowTalentsTooltip = "This options makes the tip show the talents of other players";
	TTO_TalentFormat = "Talent Format";
	TTO_TalentFormat1 = "Elemental (57/14/00)";
	TTO_TalentFormat2 = "Elemental";
	TTO_TalentFormat3 = "57/14/00";
	TTO_EnableTalents = "Enable TipTacTalents";
	TTO_EnableTalentsTip = "This options makes the tip show the talents of other players";
	TTO_TalentCacheSize = "talentCacheSize";

	TTO_Header = "Options";
	TTO_TipAnchor = "Anchor";
	TTO_Defaults = "Defaults";
	TTO_Close = "Close";
end
