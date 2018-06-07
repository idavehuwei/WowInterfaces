------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then	
	RAID_MOD_OMEN = "仇恨统计";
	RAID_MOD_RECOUNT = "伤害统计";
	RAID_MOD_GRID = "团队框架";
	RAID_MOD_CLIQUE = "一键施法";
	RAID_MOD_DECURSIVE = "一键驱散";
	RAID_MOD_BIGWIGS = "首领模块";
	RAID_MOD_ORA3 = "团队助手";
	RAID_MOD_OPTITAUNT = "嘲讽助手";
	RAID_MOD_CCBREAKER = "破控警告";
	RAID_MOD_CASTYELLER = "施法通告";
	RAID_MOD_RAIDALERTER = "团队报警器";
	RAID_MOD_OPEN_CONFIG = "开启配置";
	RAID_MOD_SHOW_PANEL = "显示面板";
	RAID_MOD_ATLASLOOT = "副本掉落";
	RAID_MOD_GROUPVOICE = "组队语音";
	RAID_MOD_DWGKP = "金团助手";
	RAID_MOD_LEADER = "团长助手";
	
	RAID_MOD_LEADER_ENABLE = "开启团长助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (PhoenixStyle)" .. DUOWAN_COLOR["END"];
	RAID_MOD_LEADER_ENABLE_DESC = "详细的分析战斗记录并找出灭团责任人";
	RAID_MOD_TEAMNOTICE_ENABLE = "开启团队密语通报";
	RAID_MOD_TEAMNOTICE_ENABLE_DESC = "向新加入的队员密语通报团队规则";
	RAID_MOD_TEAMNOTICE_EDIT = "编辑密语";
	RAID_MOD_OMEN_ENABLE = "开启仇恨统计" .. DUOWAN_COLOR["STEELBLUE"] .. " (Omen)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RECOUNT_ENABLE = "开启伤害统计" .. DUOWAN_COLOR["STEELBLUE"] .. " (Recount)" .. DUOWAN_COLOR["END"];
	RAID_MOD_GRID_ENABLE = "开启团队框架" .. DUOWAN_COLOR["STEELBLUE"] .. " (Grid)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CLIQUE_ENABLE = "开启一键施法" .. DUOWAN_COLOR["STEELBLUE"] .. " (Clique)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DECURSIVE_ENABLE = "开启一键驱散" .. DUOWAN_COLOR["STEELBLUE"] .. " (Decursive)" .. DUOWAN_COLOR["END"];
	RAID_MOD_BIGWIGS_ENABLE = "开启首领报警" .. DUOWAN_COLOR["STEELBLUE"] .. " (DBM)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DBM_SPELLTIMER = "开启团队冷却计时";
	RAID_MOD_DBM_SPELLTIMER_DESC = "显示队员重要技能冷却情况";
	RAID_MOD_MOVE_BAR = "移动计时条";
	RAID_MOD_AVRE_ENABLE = "开启首领站位" .. DUOWAN_COLOR["STEELBLUE"] .. " (AVRE)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ORA3_ENABLE = "开启团队助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (oRA3)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ORA3_OPENCONFIG = "开启界面";
	RAID_MOD_ORA3_OPENWITH_RAID = "跟随团队界面打开";
	RAID_MOD_OPTITAUNT_ENABLE = "开启嘲讽抵抗OT警报" .. DUOWAN_COLOR["STEELBLUE"] .. " (OptiTaunt)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CCBREAKER_ENABLE = "开启破控警告" .. DUOWAN_COLOR["STEELBLUE"] .. " (CCBreaker)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CASTYELLER_ENABLE = "开启施法通告" .. DUOWAN_COLOR["STEELBLUE"] .. " (CastYeller)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RAIDALERTER_ENABLE = "开启团队报警器".. DUOWAN_COLOR["STEELBLUE"] .. " (RaidAlerter)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RAIDALERTER_DESC = "提供RAID和5人副本队伍的各种特色警报如：\nMT血量危急、嘲讽抵抗、仇恨、驱散、猎人\n误导、被控制、打破控制和团队检查等。";
	RAID_MOD_RAIDALERTER_LOCKPOSITION = "锁定位置"; 
	RAID_MOD_RAIDALERTER_OPENCONFIG = "开启界面";
	RAID_MOD_GRID_CLICKSET_OPTION = "点击设置";
	RAID_MOD_CASTYELLER_DESC = "变羊，激活，干涉，闷棍，束缚等通告";
	RAID_MOD_CCBREAKER_DESC = "变形术、闷棍等被打破后发出警告";
	RAID_MOD_ATLASLOOT_ENABLE = "开启副本掉落查询" .. DUOWAN_COLOR["STEELBLUE"] .. " (AtlasLoot)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ATLASLOOT_OPTION = "查询掉落";
	RAID_MOD_GROUPVOICE_ENABLE = "开启自动组队语音";
	RAID_MOD_GROUPVOICE_DESC = "进入团队时自动加入语音频道";
	RAID_MOD_GROUPVOICE_PARTY_ENABLE = "开启小队语音";
	RAID_MOD_GROUPVOICE_PARTY_DESC = "进入小队时自动加入语音频道";
	RAID_MOD_DWGKP_ENABLE = "开启魔盒金团助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (DWGKP)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DWGKP_QUALITY = "记录物品:";
	RAID_MOD_DWGKP_QUALITY_LIST = {"|cff1eff00绿色品质|r", "|cff0070dd蓝色品质|r", "|cffa335ee紫色品质|r",};
	RAID_MOD_DWGKP_DISTRIBUTE = "分配成员:";
	RAID_MOD_DWGKP_DISTRIBUTE_LIST = {"前5组", "全团",};	
	RAID_MOD_DWGKP_CHANNEL = "通报频道:";
	RAID_MOD_DWGKP_CHANNEL_LIST = {"说话", "小队", "团队",};
	RAID_MOD_DWGKP_SHOW_TITAN = "显示泰坦信息条按键";
	RAID_MOD_DWGKP_OPEN_FRAME = "打开界面";
elseif (GetLocale() == "zhTW") then 
	RAID_MOD_OMEN = "仇恨統計";
	RAID_MOD_RECOUNT = "傷害統計";
	RAID_MOD_GRID = "團隊框架";
	RAID_MOD_CLIQUE = "一鍵施法";
	RAID_MOD_DECURSIVE = "一鍵驅散";
	RAID_MOD_BIGWIGS = "首領模組";
	RAID_MOD_ORA3 = "團隊助手";
	RAID_MOD_OPTITAUNT = "嘲諷助手";
	RAID_MOD_CCBREAKER = "破控警告";
	RAID_MOD_CASTYELLER = "施法通告";
	RAID_MOD_RAIDALERTER = "團隊報警器";
	RAID_MOD_OPEN_CONFIG = "開啟配置";
	RAID_MOD_SHOW_PANEL = "顯示面板";
	RAID_MOD_ATLASLOOT = "副本掉落";
	RAID_MOD_GROUPVOICE = "组队语音";
	RAID_MOD_DWGKP = "金團助手";
	RAID_MOD_LEADER = "團長助手";
	
	RAID_MOD_LEADER_ENABLE = "開啟團長助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (PhoenixStyle)" .. DUOWAN_COLOR["END"];
	RAID_MOD_LEADER_ENABLE_DESC = "詳細的分析戰鬥記錄並找出滅團責任人";
	RAID_MOD_TEAMNOTICE_ENABLE = "開啟團隊密語通報";
	RAID_MOD_TEAMNOTICE_ENABLE_DESC = "向新加入的隊員密語通報團隊規則";
	RAID_MOD_TEAMNOTICE_EDIT = "編輯密語";
	RAID_MOD_OMEN_ENABLE = "開啟仇恨統計" .. DUOWAN_COLOR["STEELBLUE"] .. " (Omen)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RECOUNT_ENABLE = "開啟傷害統計" .. DUOWAN_COLOR["STEELBLUE"] .. " (Recount)" .. DUOWAN_COLOR["END"];
	RAID_MOD_GRID_ENABLE = "開啟團隊框架" .. DUOWAN_COLOR["STEELBLUE"] .. " (Grid)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CLIQUE_ENABLE = "開啟一鍵施法" .. DUOWAN_COLOR["STEELBLUE"] .. " (Clique)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DECURSIVE_ENABLE = "開啟一鍵驅散" .. DUOWAN_COLOR["STEELBLUE"] .. " (Decursive)" .. DUOWAN_COLOR["END"];
	RAID_MOD_BIGWIGS_ENABLE = "開啟首領報警" .. DUOWAN_COLOR["STEELBLUE"] .. " (DBM)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DBM_SPELLTIMER = "開啟團隊冷卻計時";
	RAID_MOD_DBM_SPELLTIMER_DESC = "顯示隊員重要技能冷卻情況";
	RAID_MOD_MOVE_BAR = "移動計時條";
	RAID_MOD_AVRE_ENABLE = "開啟首領站位" .. DUOWAN_COLOR["STEELBLUE"] .. " (AVRE)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ORA3_ENABLE = "開啟團隊助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (oRA3)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ORA3_OPENCONFIG = "開啟介面";
	RAID_MOD_ORA3_OPENWITH_RAID = "跟隨團隊介面打開";
	RAID_MOD_OPTITAUNT_ENABLE = "開啟嘲諷抵抗OT警報" .. DUOWAN_COLOR["STEELBLUE"] .. " (OptiTaunt)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CCBREAKER_ENABLE = "開啟破控警報" .. DUOWAN_COLOR["STEELBLUE"] .. " (CCBreaker)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CASTYELLER_ENABLE = "開啟施法通告" .. DUOWAN_COLOR["STEELBLUE"] .. " (CastYeller)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RAIDALERTER_ENABLE = "開啟團隊報警器".. DUOWAN_COLOR["STEELBLUE"] .. " (RaidAlerter)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RAIDALERTER_DESC = "提供RAID和5人副本隊伍的各種特色警報如：\nMT血量危急、嘲諷抵抗、仇恨、驅散、獵人\n誤導、被控制、打破控制和團隊檢查等。";
	RAID_MOD_RAIDALERTER_LOCKPOSITION = "鎖定位置"; 
	RAID_MOD_RAIDALERTER_OPENCONFIG = "開啟介面";
	RAID_MOD_GRID_CLICKSET_OPTION = "點擊設置";
	RAID_MOD_CASTYELLER_DESC = "變羊，啟動，干涉，悶棍，束縛等通告";
	RAID_MOD_CCBREAKER_DESC = "變形術、悶棍等被打破後發出警告";
	RAID_MOD_ATLASLOOT_ENABLE = "開啟副本掉落查詢" .. DUOWAN_COLOR["STEELBLUE"] .. " (AtlasLoot)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ATLASLOOT_OPTION = "查詢掉落";
	RAID_MOD_GROUPVOICE_ENABLE = "開啟自動組隊語音";
	RAID_MOD_GROUPVOICE_DESC = "進入團隊時自動加入語音頻道";
	RAID_MOD_GROUPVOICE_PARTY_ENABLE = "開啟小隊語音";
	RAID_MOD_GROUPVOICE_PARTY_DESC = "進入小隊時自動加入語音頻道";
	RAID_MOD_DWGKP_ENABLE = "開啟魔盒金團助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (DWGKP)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DWGKP_QUALITY = "記錄物品";
	RAID_MOD_DWGKP_QUALITY_LIST = {"|cff1eff00綠色品質|r", "|cff0070dd藍色品質|r", "|cffa335ee紫色品質|r",};
	RAID_MOD_DWGKP_DISTRIBUTE = "分配成員";
	RAID_MOD_DWGKP_DISTRIBUTE_LIST = {"前5組", "全團",};	
	RAID_MOD_DWGKP_CHANNEL = "通報頻道";
	RAID_MOD_DWGKP_CHANNEL_LIST = {"說話", "小隊", "團隊",};
	RAID_MOD_DWGKP_SHOW_TITAN = "顯示泰坦信息條按鍵";
	RAID_MOD_DWGKP_OPEN_FRAME = "打開介面";
else
	RAID_MOD_OMEN = "仇恨统计";
	RAID_MOD_RECOUNT = "伤害统计";
	RAID_MOD_GRID = "团队框架";
	RAID_MOD_CLIQUE = "一键施法";
	RAID_MOD_DECURSIVE = "一键驱散";
	RAID_MOD_BIGWIGS = "首领模块";
	RAID_MOD_ORA3 = "团队助手";
	RAID_MOD_OPTITAUNT = "嘲讽助手";
	RAID_MOD_CCBREAKER = "破控警告";
	RAID_MOD_CASTYELLER = "施法通告";
	RAID_MOD_RAIDALERTER = "团队报警器";
	RAID_MOD_OPEN_CONFIG = "开启配置";
	RAID_MOD_SHOW_PANEL = "显示面板";
	RAID_MOD_ATLASLOOT = "副本掉落";
	RAID_MOD_GROUPVOICE = "组队语音";
	RAID_MOD_DWGKP = "金团助手";
	RAID_MOD_LEADER = "团长助手";
	
	RAID_MOD_LEADER_ENABLE = "开启团长助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (PhoenixStyle)" .. DUOWAN_COLOR["END"];
	RAID_MOD_LEADER_ENABLE_DESC = "详细的分析战斗记录并找出灭团责任人";
	RAID_MOD_TEAMNOTICE_ENABLE = "开启团队密语通报";
	RAID_MOD_TEAMNOTICE_ENABLE_DESC = "向新加入的队员密语通报团队规则";
	RAID_MOD_TEAMNOTICE_EDIT = "编辑密语";
	RAID_MOD_OMEN_ENABLE = "开启仇恨统计" .. DUOWAN_COLOR["STEELBLUE"] .. " (Omen)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RECOUNT_ENABLE = "开启伤害统计" .. DUOWAN_COLOR["STEELBLUE"] .. " (Recount)" .. DUOWAN_COLOR["END"];
	RAID_MOD_GRID_ENABLE = "开启团队框架" .. DUOWAN_COLOR["STEELBLUE"] .. " (Grid)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CLIQUE_ENABLE = "开启一键施法" .. DUOWAN_COLOR["STEELBLUE"] .. " (Clique)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DECURSIVE_ENABLE = "开启一键驱散" .. DUOWAN_COLOR["STEELBLUE"] .. " (Decursive)" .. DUOWAN_COLOR["END"];
	RAID_MOD_BIGWIGS_ENABLE = "开启首领报警" .. DUOWAN_COLOR["STEELBLUE"] .. " (DBM)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DBM_SPELLTIMER = "开启团队冷却计时";
	RAID_MOD_DBM_SPELLTIMER_DESC = "显示队员重要技能冷却情况";
	RAID_MOD_MOVE_BAR = "移动计时条";
	RAID_MOD_AVRE_ENABLE = "开启首领站位" .. DUOWAN_COLOR["STEELBLUE"] .. " (AVRE)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ORA3_ENABLE = "开启团队助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (oRA3)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ORA3_OPENCONFIG = "开启界面";
	RAID_MOD_ORA3_OPENWITH_RAID = "跟随团队界面打开";
	RAID_MOD_OPTITAUNT_ENABLE = "开启嘲讽抵抗OT警报" .. DUOWAN_COLOR["STEELBLUE"] .. " (OptiTaunt)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CCBREAKER_ENABLE = "开启破控警报" .. DUOWAN_COLOR["STEELBLUE"] .. " (CCBreaker)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CASTYELLER_ENABLE = "开启施法通告" .. DUOWAN_COLOR["STEELBLUE"] .. " (CastYeller)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RAIDALERTER_ENABLE = "开启团队报警器".. DUOWAN_COLOR["STEELBLUE"] .. " (RaidAlerter)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RAIDALERTER_DESC = "提供RAID和5人副本队伍的各种特色警报如：\nMT血量危急、嘲讽抵抗、仇恨、驱散、猎人\n误导、被控制、打破控制和团队检查等。";
	RAID_MOD_RAIDALERTER_LOCKPOSITION = "锁定位置"; 
	RAID_MOD_RAIDALERTER_OPENCONFIG = "开启界面";
	RAID_MOD_CASTYELLER_DESC = "变羊，激活，干涉，闷棍，束缚等通告";
	RAID_MOD_CCBREAKER_DESC = "变形术、闷棍等被打破后发出警告";
	RAID_MOD_ATLASLOOT_ENABLE = "开启副本掉落查询" .. DUOWAN_COLOR["STEELBLUE"] .. " (AtlasLoot)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ATLASLOOT_OPTION = "查询掉落";
	RAID_MOD_GROUPVOICE_ENABLE = "开启自动组队语音";
	RAID_MOD_GROUPVOICE_DESC = "进入团队时自动加入语音频道";
	RAID_MOD_GROUPVOICE_PARTY_ENABLE = "开启小队语音";
	RAID_MOD_GROUPVOICE_PARTY_DESC = "进入小队时自动加入语音频道";
	RAID_MOD_DWGKP_ENABLE = "开启多玩金团助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (DWGKP)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DWGKP_QUALITY = "记录物品";
	RAID_MOD_DWGKP_QUALITY_LIST = {"|cff1eff00绿色品质|r", "|cff0070dd蓝色品质|r", "|cffa335ee紫色品质|r",};
	RAID_MOD_DWGKP_DISTRIBUTE = "分配成员";
	RAID_MOD_DWGKP_DISTRIBUTE_LIST = {"前5组", "全团",};	
	RAID_MOD_DWGKP_CHANNEL = "通报频道";
	RAID_MOD_DWGKP_CHANNEL_LIST = {"说话", "小队", "团队",};
	RAID_MOD_DWGKP_SHOW_TITAN = "显示泰坦信息条按键";
	RAID_MOD_DWGKP_OPEN_FRAME = "打开界面";
end

---------------------
-- 团长助手

dwRegisterMod(
	"DWPSMOD",
	RAID_MOD_LEADER,
	"PhoenixStyle",
	"",
	"Interface\\ICONS\\Spell_Holy_DivineProvidence",
	nil,
	"RAID"
);

if (dwIsConfigurableAddOn("PhoenixStyle")) then
	dwRegisterCheckButton(
		"DWPSMOD",
		RAID_MOD_LEADER_ENABLE,
		RAID_MOD_LEADER_ENABLE_DESC,
		"psEnable",
		0,
		function (arg)		
			if(arg==1)then
				if (not dwIsAddOnLoaded("PhoenixStyle")) then
					dwLoadAddOn("PhoenixStyle");
				end				
			else
				if (dwIsAddOnLoaded("PhoenixStyle")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	dwRegisterButton(
		"DWPSMOD",
		RAID_MOD_DWGKP_OPEN_FRAME, 
		function()			
			if (dwIsAddOnLoaded("PhoenixStyle")) then
				PS_MinimapButton_OnClick();
			end
		end, 
		1
	);	
end

dwRegisterCheckButton(
	"DWPSMOD",
	RAID_MOD_TEAMNOTICE_ENABLE,
	RAID_MOD_TEAMNOTICE_ENABLE_DESC,
	"ShowNotice",
	0,
	function (arg)		
		if(arg==1)then
			dwTeamNotice_Toggle(true);
		else
			dwTeamNotice_Toggle(false);
		end
	end
);
dwRegisterButton(
	"DWPSMOD",
	RAID_MOD_TEAMNOTICE_EDIT, 
	function()			
		dwSetTeamNotice();
		HideUIPanel(DuowanConfigFrame);
	end, 
	1
);

if (dwIsConfigurableAddOn("DWGKP")) then
	dwRegisterMod(
		"DWGKPMOD",
		RAID_MOD_DWGKP,
		"DWGKP",
		"",
		"Interface\\ICONS\\INV_Misc_Coin_01",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"DWGKPMOD",
		RAID_MOD_DWGKP_ENABLE,
		nil,
		"gkpEnable",
		0,
		function (arg)		
			if(arg==1)then
				if (not dwIsAddOnLoaded("DWGKP")) then
					dwLoadAddOn("DWGKP");
				end
				DWGKP:Toggle(true);
			else
				if (dwIsAddOnLoaded("DWGKP")) then
					DWGKP:Toggle(false);
				end
			end
		end
	);
	dwRegisterCheckButton(
		"DWGKPMOD",
		RAID_MOD_DWGKP_SHOW_TITAN,
		nil,
		"showTitan",
		1,
		function (arg)		
			if(arg==1)then
				if (dwIsAddOnLoaded("DWGKP")) then
					DWGKP:ToggleTitanButton(true);
				end
			else
				if (dwIsAddOnLoaded("DWGKP")) then
					DWGKP:ToggleTitanButton(false);
				end
			end
		end,
		1
	);	
	dwRegisterSpinBox(
		"DWGKPMOD",
		RAID_MOD_DWGKP_QUALITY,
		nil, 
		"logQuality", 
		RAID_MOD_DWGKP_QUALITY_LIST, 
		RAID_MOD_DWGKP_QUALITY_LIST[2], 
		function(arg)			
			DWGKP:SetLowLogItemQuality(arg);
		end,
		1
	);
	dwRegisterSpinBox(
		"DWGKPMOD",
		RAID_MOD_DWGKP_DISTRIBUTE,
		nil, 
		"distrubuteGroup", 
		RAID_MOD_DWGKP_DISTRIBUTE_LIST, 
		RAID_MOD_DWGKP_DISTRIBUTE_LIST[2], 
		function(arg)			
			DWGKP:SetdistributeGroup(arg);
		end,
		1
	);
	dwRegisterSpinBox(
		"DWGKPMOD",
		RAID_MOD_DWGKP_CHANNEL,
		nil, 
		"reportChannel", 
		RAID_MOD_DWGKP_CHANNEL_LIST, 
		RAID_MOD_DWGKP_CHANNEL_LIST[3], 
		function(arg)			
			DWGKP:SetReportChannel(arg);
		end,
		1
	);
	dwRegisterButton(
		"DWGKPMOD",
		RAID_MOD_DWGKP_OPEN_FRAME, 
		function()			
			if (dwIsAddOnLoaded("DWGKP")) then
				DWGKPMainFrame:Show();
			end
		end, 
		1
	);
end
--[[
if (dwIsConfigurableAddOn("GroupVoice")) then
	dwRegisterMod(
		"GroupVoiceMod",
		RAID_MOD_GROUPVOICE,
		"GroupVoice",
		"",
		"Interface\\AddOns\\Duowan\\textures\\Icons\\YYIcon",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"GroupVoiceMod",
		RAID_MOD_GROUPVOICE_ENABLE,
		RAID_MOD_GROUPVOICE_DESC,
		"GroupVoiceEnable",
		1,
		function (arg)		
			if(arg==1)then
				if (not dwIsAddOnLoaded("GroupVoice")) then
					dwLoadAddOn("GroupVoice");
				end
				GroupVoice:Enable();
			else
				if (dwIsAddOnLoaded("GroupVoice")) then
					GroupVoice:Disable();
				end
			end
		end
	);

	dwRegisterCheckButton(
		"GroupVoiceMod",
		RAID_MOD_GROUPVOICE_PARTY_ENABLE,
		RAID_MOD_GROUPVOICE_PARTY_DESC,
		"EnableParty",
		1,
		function (arg)
			if(arg==1)then
				if (dwIsAddOnLoaded("GroupVoice")) then
					GroupVoice:EnableParty(true);
				end
			else
				if (dwIsAddOnLoaded("GroupVoice")) then
					GroupVoice:EnableParty(false);
				end
			end
		end,
		1
	);
end
]]
local _, PlayerClass = UnitClass("player");
if (dwIsConfigurableAddOn("oRA3")) then
	dwRegisterMod(
		"oRA3Mod",
		RAID_MOD_ORA3,
		"oRA3",
		"",
		"Interface\\ICONS\\Spell_Holy_GreaterBlessingofSanctuary",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"oRA3Mod",
		RAID_MOD_ORA3_ENABLE,
		DUOWAN_RELOAD_DESC,
		"oRA3Enable",
		0,
		function (arg)		
			if(arg==1)then
				if (not dwIsAddOnLoaded("oRA3")) then
					dwLoadAddOn("oRA3");
				end			
			else
				if (dwIsAddOnLoaded("oRA3")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"oRA3Mod",
		RAID_MOD_ORA3_OPENWITH_RAID,
		nil,
		"withRaid",
		1,
		function (arg)		
			if(arg==1)then
				if (dwIsAddOnLoaded("oRA3")) then
					oRA3_ShowWithRaid(true);
				end			
			else
				if (dwIsAddOnLoaded("oRA3")) then
					oRA3_ShowWithRaid(false);
				end
			end
		end,
		1
	);	
	
	dwRegisterButton(
		"oRA3Mod",
		RAID_MOD_ORA3_OPENCONFIG, 
		function()			
			if (dwIsAddOnLoaded("oRA3")) then
				oRA3_OpenConfig() ;
			end
		end, 
		1
	);	
end

if (dwIsConfigurableAddOn("Omen")) then
	dwRegisterMod(
		"OmenMod",
		RAID_MOD_OMEN,
		"Omen",
		"",
		"Interface\\ICONS\\Spell_Shadow_LastingAfflictions",
		nil,
		"RAID"
	);
	
	dwRegisterCheckButton(
		"OmenMod",
		RAID_MOD_OMEN_ENABLE,
		DUOWAN_RELOAD_DESC,
		"OmenEnable",
		0,
		function (arg)			
			if(arg==1)then
				if (not dwIsAddOnLoaded("Omen")) then
					dwLoadAddOn("Omen");
				end
				OmenShowPanel();
			else
				if (dwIsAddOnLoaded("Omen")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	dwRegisterButton(
		"OmenMod",
		RAID_MOD_OPEN_CONFIG, 
		function()			
			if (dwIsAddOnLoaded("Omen")) then
				Omen:ShowConfig() ;
			end
		end, 
		1
	);	
	dwRegisterButton(
		"OmenMod",
		RAID_MOD_SHOW_PANEL, 
		function()			
			if (dwIsAddOnLoaded("Omen")) then
				Omen:Toggle(true);
			end
		end, 
		1
	);	
end

if (dwIsConfigurableAddOn("Clique")) then
	dwRegisterMod(
		"CliqueMod",
		RAID_MOD_CLIQUE,
		"Clique",
		"",
		"Interface\\AddOns\\Duowan\\textures\\Icons\\CliqueIcon",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"CliqueMod",
		RAID_MOD_CLIQUE_ENABLE,
		DUOWAN_RELOAD_DESC,
		"CliqueEnable",
		0,
		function (arg)			
			if(arg==1)then
				if (not dwIsAddOnLoaded("Clique")) then
					dwLoadAddOn("Clique");
				end			
			else
				if (dwIsAddOnLoaded("Clique")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);

	dwRegisterButton(
		"CliqueMod",
		RAID_MOD_OPEN_CONFIG, 
		function()			
			if (dwIsAddOnLoaded("Clique")) then
				if (not InCombatLockdown()) then
					SpellBookFrame:Show();			
				end
			end
		end, 
		1
	);	
end

if (dwIsConfigurableAddOn("Grid")) then
	dwRegisterMod(
		"GridMod",
		RAID_MOD_GRID,
		"Grid",
		"",
		"Interface\\AddOns\\Duowan\\textures\\Icons\\Grid",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"GridMod",
		RAID_MOD_GRID_ENABLE,
		nil,
		"GridEnable",
		0,
		function (arg)		
			if(arg==1)then
				if (not dwIsAddOnLoaded("Grid")) then
					dwLoadAddOn("Grid");
				end
				Grid:Toggle(true);	
			else
				if (dwIsAddOnLoaded("Grid")) then
					Grid:Toggle(false);	
				end
			end
		end
	);
	dwRegisterButton(
		"GridMod",
		RAID_MOD_OPEN_CONFIG, 
		function()			
			if (dwIsAddOnLoaded("Grid")) then
				Grid_OpenConfig();
			end
		end, 
		1
	);
	dwRegisterButton(
		"GridMod",
		RAID_MOD_GRID_CLICKSET_OPTION, 
		function()			
			if (dwIsAddOnLoaded("Grid")) then
				GridClickSetsFrame:Show();
			end
		end, 
		1
	);	
end

if (dwIsConfigurableAddOn("Recount")) then
	dwRegisterMod(
		"RecountMod",
		RAID_MOD_RECOUNT,
		"Recount",
		"",
		"Interface\\ICONS\\INV_Gizmo_KhoriumPowerCore",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"RecountMod",
		RAID_MOD_RECOUNT_ENABLE,		
		DUOWAN_RELOAD_DESC,
		"RecountEnable",
		0,
		function (arg)			
			if(arg==1)then
				if (not dwIsAddOnLoaded("Recount")) then
					dwLoadAddOn("Recount");
				end
			else
				if (dwIsAddOnLoaded("Recount")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);

	dwRegisterButton(
		"RecountMod",
		RAID_MOD_SHOW_PANEL, 
		function()			
			if (dwIsAddOnLoaded("Recount")) then
				Recount.MainWindow:Show();
				Recount:RefreshMainWindow();
			end
		end, 
		1
	);	
	
end

if (dwIsConfigurableAddOn("Decursive")) then
	dwRegisterMod(
		"DecursiveMod",
		RAID_MOD_DECURSIVE,
		"Decursive",
		"",
		"Interface\\ICONS\\Spell_Nature_NatureBlessing",
		nil,
		"RAID"
	);
	dwRegisterCheckButton(
		"DecursiveMod",
		RAID_MOD_DECURSIVE_ENABLE,
		DUOWAN_RELOAD_DESC,
		"DecursiveEnable",
		0,
		function (arg)	
			if(arg==1)then
				if (not dwIsAddOnLoaded("Decursive")) then
					dwLoadAddOn("Decursive");
				end			
			else
				if (dwIsAddOnLoaded("Decursive")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	
	dwRegisterButton(
		"DecursiveMod",
		RAID_MOD_SHOW_PANEL, 
		function()			
			if (dwIsAddOnLoaded("Decursive")) then
				Dcr:HideBar(0);
			end
		end, 
		1
	);	

	dwRegisterButton(
		"DecursiveMod",
		RAID_MOD_OPEN_CONFIG, 
		function()			
			if (dwIsAddOnLoaded("Decursive")) then
				LibStub("AceConfigDialog-3.0"):Open("Decursive");
			end
		end, 
		1
	);	
end

if (dwIsConfigurableAddOn("DBM-Core")) then
	dwRegisterMod(
		"DBMMod",
		RAID_MOD_BIGWIGS,
		"DBM",
		"",
		"Interface\\ICONS\\INV_Misc_Orb_05",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"DBMMod",
		RAID_MOD_BIGWIGS_ENABLE,
		DUOWAN_RELOAD_DESC,
		"DBMEnable",
		1,
		function (arg)		
			if(arg==1)then
				if (not dwIsAddOnLoaded("DBM-Core")) then
					dwLoadAddOn("DBM-Core");
					dwLoadAddOn("DBM-BurningCrusade");
				end
			else
				if (dwIsAddOnLoaded("DBM-Core")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	
	dwRegisterCheckButton(
		"DBMMod",
		RAID_MOD_DBM_SPELLTIMER,
		RAID_MOD_DBM_SPELLTIMER_DESC,
		"DBMSpellTimers",
		0,
		function (arg)		
			if(arg==1)then
				if (not dwIsAddOnLoaded("DBM-SpellTimers")) then
					dwLoadAddOn("DBM-SpellTimers");					
				end
				DBM_SpellTimer_Toggle(true);
			else
				if (dwIsAddOnLoaded("DBM-SpellTimers")) then
					DBM_SpellTimer_Toggle(false);
				end
			end
		end,
		1
	);

	dwRegisterButton(
		"DBMMod",
		RAID_MOD_OPEN_CONFIG, 
		function()			
			if (dwIsAddOnLoaded("DBM-Core")) then
				DBM:LoadGUI();
			end
		end, 
		1
	);
	--[[
	dwRegisterCheckButton(
		"DBMMod",
		RAID_MOD_AVRE_ENABLE,
		DUOWAN_RELOAD_DESC,
		"AVREEnable",
		0,
		function (arg)		
			if(arg==1)then
				if (not dwIsAddOnLoaded("AVRE")) then
					dwLoadAddOn("AVRE");
				end
			else
				if (dwIsAddOnLoaded("AVRE")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	]]
	dwRegisterButton(
		"DBMMod",
		RAID_MOD_MOVE_BAR, 
		function()			
			if (dwIsAddOnLoaded("DBM-Core")) then
				DBM.Bars:ShowMovableBar();
			end
		end, 
		1
	);
	
end

if ((PlayerClass == "DRUID" or PlayerClass == "WARRIOR" or PlayerClass == "PALADIN") and dwIsConfigurableAddOn("OptiTaunt")) then
	dwRegisterMod(
		"OptiTauntMod",
		RAID_MOD_OPTITAUNT,
		"OptiTaunt",
		"",
		"Interface\\ICONS\\Ability_Druid_ChallangingRoar",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"OptiTauntMod",
		RAID_MOD_OPTITAUNT_ENABLE,
		nil,
		"OptiTauntEnable",
		0,
		function (arg)	
			if(arg==1)then
				if (not dwIsAddOnLoaded("OptiTaunt")) then
					dwLoadAddOn("OptiTaunt");
				end
				OptiTaunt:Toggle(true);
			else
				if (dwIsAddOnLoaded("OptiTaunt")) then
					OptiTaunt:Toggle(false);
				end
			end
		end
	);
end

if (dwIsConfigurableAddOn("CCBreaker")) then
	dwRegisterMod(
		"CCBreakerMod",
		RAID_MOD_CCBREAKER,
		"CCBreaker",
		"",
		"Interface\\ICONS\\Spell_Shadow_Teleport",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"CCBreakerMod",
		RAID_MOD_CCBREAKER_ENABLE,
		RAID_MOD_CCBREAKER_DESC,
		"CCBreakerEnable",
		0,
		function (arg)	
			if(arg==1)then
				if (not dwIsAddOnLoaded("CCBreaker")) then
					dwLoadAddOn("CCBreaker");
				end		
				CCBreaker:Toggle(true);
			else
				if (dwIsAddOnLoaded("CCBreaker")) then
					CCBreaker:Toggle(false);
				end
			end
		end
	);
	dwRegisterButton(
		"CCBreakerMod",
		RAID_MOD_OPEN_CONFIG, 
		function()			
			if (dwIsAddOnLoaded("CCBreaker")) then
				CCBreak_OpenConfig();
			end
		end, 
		1
	);	
end

if (dwIsConfigurableAddOn("CastYeller")) then
	dwRegisterMod(
		"CastYellerMod",
		RAID_MOD_CASTYELLER,
		"CastYeller",
		"",
		"Interface\\ICONS\\Spell_Nature_LightningBolt",
		nil,
		"RAID"
	);
	dwRegisterCheckButton(
		"CastYellerMod",
		RAID_MOD_CASTYELLER_ENABLE,
		RAID_MOD_CASTYELLER_DESC,		
		"CastYellerEnable",
		0,
		function (arg)	
			if(arg==1)then
				if (not dwIsAddOnLoaded("CastYeller")) then
					dwLoadAddOn("CastYeller");
				end	
				CastYeller:Toggle(true);
			else
				if (dwIsAddOnLoaded("CastYeller")) then
					CastYeller:Toggle(false);
				end
			end
		end
	);
	dwRegisterButton(
		"CastYellerMod",
		RAID_MOD_OPEN_CONFIG, 
		function()			
			if (dwIsAddOnLoaded("CastYeller")) then
				CastYeller_OpenConfig();
			end
		end, 
		1
	);	
end

if (dwIsConfigurableAddOn("RaidAlerter")) then
	dwRegisterMod(
		"RaidAlerterMod",
		RAID_MOD_RAIDALERTER,
		"RaidAlerter",
		"",
		"Interface\\ICONS\\Ability_Hunter_ZenArchery",
		nil,
		"RAID"
	);
	dwRegisterCheckButton(
		"RaidAlerterMod",
		RAID_MOD_RAIDALERTER_ENABLE,
		RAID_MOD_RAIDALERTER_DESC,		
		"RaidAlerterEnable",
		0,
		function (arg)	
			if(arg==1)then
				if (not dwIsAddOnLoaded("RaidAlerter")) then
					dwLoadAddOn("RaidAlerter");
				end
				RaidAlerter_Toggle(true);
			else
				if (dwIsAddOnLoaded("RaidAlerter")) then
					RaidAlerter_Toggle(false);
				end				
			end
		end
	);
	dwRegisterCheckButton(
		"RaidAlerterMod",
		RAID_MOD_RAIDALERTER_LOCKPOSITION,
		nil,		
		"RaidAlerterLockPosition",
		0,
		function (arg)	
			if(arg==1)then
				if (dwIsAddOnLoaded("RaidAlerter")) then
					RaidAlerte_LockPosition(true);
				end				
			else
				if (dwIsAddOnLoaded("RaidAlerter")) then
					RaidAlerte_LockPosition(false);
				end				
			end
		end,
		1
	);
	
	dwRegisterButton(
		"RaidAlerterMod",
		RAID_MOD_RAIDALERTER_OPENCONFIG, 
		function()			
			if (dwIsAddOnLoaded("RaidAlerter")) then
				RaidAlerter_MainFrame:Show();
			end
		end, 
		1
	);	
end

if (dwIsConfigurableAddOn("AtlasLoot")) then
	dwRegisterMod(
		"AtlasLootMod",
		RAID_MOD_ATLASLOOT,
		"AtlasLoot",
		"",
		"Interface\\ICONS\\INV_Box_01",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"AtlasLootMod",
		RAID_MOD_ATLASLOOT_ENABLE,
		DUOWAN_RELOAD_DESC,
		"AtlasLootEnable",
		0,
		function (arg)		
			if(arg==1)then
				if (not dwIsAddOnLoaded("AtlasLoot")) then
					dwLoadAddOn("AtlasLoot");
				end			
			else
				if (dwIsAddOnLoaded("AtlasLoot")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	
	dwRegisterButton(
		"AtlasLootMod",
		RAID_MOD_ATLASLOOT_OPTION, 
		function()			
			if (dwIsAddOnLoaded("AtlasLoot")) then
				AtlasLootDefaultFrame:Show();
			end
		end, 
		1
	);	
end
