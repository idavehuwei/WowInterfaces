if (GetLocale() == "zhCN") then
------------------------------------------------------------------------------
-- Traditional Chinese localization 
------------------------------------------------------------------------------
	--TT.lua
	TT_Font = "Fonts\\ZYKai_T.TTF";
	TT_BarFont = "Fonts\\ZYKai_T.TTF";
	TT_TargetYOU = "|cFFFF0000>>你<<";
	
	TT_Elite = "%s|r (精英)";
	TT_WorldBoss = "%s|r (首领)";
	TT_Rare = "%s|r (稀有)";
	TT_RareElite = "%s|r (稀有精英)";

	TT_Not_Specified = "未指定";
	TT_Tapped = "低等级";
	
	TTAnchor_Text = "视窗定位点";
		
	TTParam_Options1 = "无法开启 TicTac 选项: |1";
	TTparam_Options2 = "|r。请确认是否已从角色选单中启用此插件。";
	TTParam_Invalid1 = "这个插件的有效界限为|2|r以下:";
	TTParam_Invalid2 = " |2锚定|r = 显示提示视窗出现的位置";
	
	TT_Targeting = "\n|cffffd100目标为: ";
	TT_Unknown = "未知";
	TT_DC = " <离线>";
	TT_AFK = " <暂离>";
	TT_DND = " <勿扰>";
	TT_TargetedBy = "谁的目标 (|cffffffff%d|r): %s";
	
else
------------------------------------------------------------------------------
-- English localization (default)
------------------------------------------------------------------------------
	--TT.lua
	TT_Font = "Fonts\\FRIZQT__.TTF";
	TT_BarFont = "Fonts\\FRIZQT__.TTF";
	TT_TargetYOU = "<<YOU>>";
	
	TT_Elite = "+%s";
	TT_WorldBoss = "%s|r (Boss)";
	TT_Rare = "%s|r (Rare)";
	TT_RareElite = "+%s|r (Rare)";
	
	TT_Not_Specified = "Not specified";
	TT_Tapped = "Tapped";
	
	TTAnchor_Text = "TipTacAnchor";
	
	TTParam_Options1 = "Could not open TicTac Options: |1";
	TTparam_Options2 = "|r. Please make sure the addon is enabled from the character selection screen.";
	TTParam_Invalid1 = "The following |2parameters|r are valid for this addon:";
	TTParam_Invalid2 = " |2anchor|r = Shows the anchor where the tooltip appears";

	TT_Targeting = "\n|cffffd100Targeting: ";
	TT_DC = " <DC>";
	TT_AFK = " <AFK>";
	TT_DND = " <DND>";
	TT_Unknown = "Unknown";
	TT_TargetedBy = "Targeted By (|cffffffff%d|r): %s";

end