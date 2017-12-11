-- Beta localization by Ptash
if (GetLocale() == "zhTW") then
	TTCL_DC = " <離線>";
	TTCL_AFK = " <暫離>";
	TTCL_DND = " <勿擾>";
	TTCL_Targeting = "\n|cffffd100目標: ";
	TTCL_Targetedby = "關注";
	TTCL_TargetYouText = "<<<你>>>";
	TTCL_Elite = "+%s|r (精英)";
	TTCL_Boss = "%s|r (首領) ";
	TTCL_Rare = "%s|r (稀有) ";
	TTCL_Rareelite = "+%s|r (稀有精英) ";
elseif (GetLocale() == "zhCN") then
	TTCL_DC = " <离线>";
	TTCL_AFK = " <暂离>";
	TTCL_DND = " <勿扰>";
	TTCL_Targeting = "\n|cffffd100目标: ";
	TTCL_Targetedby = "关注";
	TTCL_TargetYouText = "<<<你>>>";
	TTCL_Elite = "+%s|r (精英)";
	TTCL_Boss = "%s|r (首領) ";
	TTCL_Rare = "%s|r (稀有) ";
	TTCL_Rareelite = "+%s|r (稀有精英) ";
else
	TTCL_DC = " <DC>";
	TTCL_AFK = " <AFK>";
	TTCL_DND = " <DND>";
	TTCL_Targeting = "\n|cffffd100Targeting: ";
	TTCL_Targetedby = "Targeted by ";
	TTCL_TargetYouText = "<<<YOU>>>";
	TTCL_Elite = "+%s|r ";
	TTCL_Boss = "+%s|r (Boss) ";
	TTCL_Rare = "%s|r (Rare) ";
	TTCL_Rareelite = "+%s|r (Rare+) ";
end
