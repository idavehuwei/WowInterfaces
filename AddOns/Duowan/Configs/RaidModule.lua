------------------------------------
-- dugu@bigfoot 2009-12-22

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

	RAID_MOD_OMEN_ENABLE = "开启仇恨统计" .. DUOWAN_COLOR["STEELBLUE"] .. " (Omen)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RECOUNT_ENABLE = "开启伤害统计" .. DUOWAN_COLOR["STEELBLUE"] .. " (Recount)" .. DUOWAN_COLOR["END"];
	RAID_MOD_GRID_ENABLE = "开启团队框架" .. DUOWAN_COLOR["STEELBLUE"] .. " (Grid)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CLIQUE_ENABLE = "开启一键施法" .. DUOWAN_COLOR["STEELBLUE"] .. " (Clique)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DECURSIVE_ENABLE = "开启一键驱散" .. DUOWAN_COLOR["STEELBLUE"] .. " (Decursive)" .. DUOWAN_COLOR["END"];
	RAID_MOD_BIGWIGS_ENABLE = "开启首领报警" .. DUOWAN_COLOR["STEELBLUE"] .. " (DBM)" .. DUOWAN_COLOR["END"];
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
	RAID_MOD_CASTYELLER_DESC = "变羊，激活，干涉，闷棍，束缚等通告";
	RAID_MOD_CCBREAKER_DESC = "变形术、闷棍等被打破后发出警告";
	RAID_MOD_ATLASLOOT_ENABLE = "开启副本掉落查询" .. DUOWAN_COLOR["STEELBLUE"] .. " (AtlasLoot)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ATLASLOOT_OPTION = "查询掉落";
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

	RAID_MOD_OMEN_ENABLE = "開啟仇恨統計" .. DUOWAN_COLOR["STEELBLUE"] .. " (Omen)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RECOUNT_ENABLE = "開啟傷害統計" .. DUOWAN_COLOR["STEELBLUE"] .. " (Recount)" .. DUOWAN_COLOR["END"];
	RAID_MOD_GRID_ENABLE = "開啟團隊框架" .. DUOWAN_COLOR["STEELBLUE"] .. " (Grid)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CLIQUE_ENABLE = "開啟一鍵施法" .. DUOWAN_COLOR["STEELBLUE"] .. " (Clique)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DECURSIVE_ENABLE = "開啟一鍵驅散" .. DUOWAN_COLOR["STEELBLUE"] .. " (Decursive)" .. DUOWAN_COLOR["END"];
	RAID_MOD_BIGWIGS_ENABLE = "開啟首領報警" .. DUOWAN_COLOR["STEELBLUE"] .. " (DBM)" .. DUOWAN_COLOR["END"];
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
	RAID_MOD_CASTYELLER_DESC = "變羊，啟動，干涉，悶棍，束縛等通告";
	RAID_MOD_CCBREAKER_DESC = "變形術、悶棍等被打破後發出警告";
	RAID_MOD_ATLASLOOT_ENABLE = "開啟副本掉落查詢" .. DUOWAN_COLOR["STEELBLUE"] .. " (AtlasLoot)" .. DUOWAN_COLOR["END"];
	RAID_MOD_ATLASLOOT_OPTION = "查詢掉落";
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

	RAID_MOD_OMEN_ENABLE = "开启仇恨统计" .. DUOWAN_COLOR["STEELBLUE"] .. " (Omen)" .. DUOWAN_COLOR["END"];
	RAID_MOD_RECOUNT_ENABLE = "开启伤害统计" .. DUOWAN_COLOR["STEELBLUE"] .. " (Recount)" .. DUOWAN_COLOR["END"];
	RAID_MOD_GRID_ENABLE = "开启团队框架" .. DUOWAN_COLOR["STEELBLUE"] .. " (Grid)" .. DUOWAN_COLOR["END"];
	RAID_MOD_CLIQUE_ENABLE = "开启一键施法" .. DUOWAN_COLOR["STEELBLUE"] .. " (Clique)" .. DUOWAN_COLOR["END"];
	RAID_MOD_DECURSIVE_ENABLE = "开启一键驱散" .. DUOWAN_COLOR["STEELBLUE"] .. " (Decursive)" .. DUOWAN_COLOR["END"];
	RAID_MOD_BIGWIGS_ENABLE = "开启首领报警" .. DUOWAN_COLOR["STEELBLUE"] .. " (DBM)" .. DUOWAN_COLOR["END"];
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
end

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
		1,
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
		1,
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
		"Interface\\ICONS\\INV_Axe_39",
		nil,
		"RAID"
	);

	dwRegisterCheckButton(
		"GridMod",
		RAID_MOD_GRID_ENABLE,
		nil,
		"GridEnable",
		1,
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
		1,
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
		1,
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
		1,
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
		1,
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
		1,
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
