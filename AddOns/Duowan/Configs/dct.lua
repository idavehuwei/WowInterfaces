------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	FIGHTING_TITLE = "战斗指示";
	FIGHTING_OPT = "更多设置"
	FIGHTING_OPTION1 = "开启战斗指示器" .. DUOWAN_COLOR["STEELBLUE"] .. " (dct)" .. DUOWAN_COLOR["END"];
	FIGHTING_OPTION3 = "开启伤害输出" .. DUOWAN_COLOR["STEELBLUE"] .. " (damage)" .. DUOWAN_COLOR["END"];
	FIGHTING_OPTION4 = "开启法术预警" .. DUOWAN_COLOR["STEELBLUE"] .. " (spellAlert)" .. DUOWAN_COLOR["END"];
	FIGHTING_FCT	= "开启基本输出信息";
	FIGHTING_FCT_OPT= "更多设置";
elseif (GetLocale() == "zhTW") then
	FIGHTING_TITLE = "戰鬥指示";
	FIGHTING_OPT = "更多設置"
	FIGHTING_OPTION1 = "開啟戰鬥指示器" .. DUOWAN_COLOR["STEELBLUE"] .. " (DCT)" .. DUOWAN_COLOR["END"];	
	FIGHTING_OPTION3 = "開啟傷害輸出" .. DUOWAN_COLOR["STEELBLUE"] .. " (damage)" .. DUOWAN_COLOR["END"];
	FIGHTING_OPTION4 = "開啟法術預警" .. DUOWAN_COLOR["STEELBLUE"] .. " (spellAlert)" .. DUOWAN_COLOR["END"];
	FIGHTING_FCT	= "開啟基本輸出資訊";
	FIGHTING_FCT_OPT= "更多設置";
	
else
	FIGHTING_TITLE = "DCT";
	FIGHTING_OPT = "Option..."
	FIGHTING_OPTION1 = "Enable DCT";
	FIGHTING_OPTION3 = "Enable DCT Damage Mod";
	FIGHTING_OPTION4 = "Enable DCT Spell Alert";	
	FIGHTING_FCT	= "开启基本输出信息";
	FIGHTING_FCT_OPT= "更多设置";	
end

local function ToggleBlzCombat(arg)
	if (arg) then				
		SetCVar("CombatDamage","1");
		SetCVar("CombatLogPeriodicSpells","1");
		SetCVar("PetMeleeDamage","1");
		SetCVar("PetSpellDamage","1");
		SetCVar("CombatDamage","1");
		SetCVar("CombatHealing","1");
		SetCVar("fctSpellMechanics","1");
		SetCVar("fctSpellMechanicsOther","1");
	else
		SetCVar("CombatDamage","0");
		SetCVar("CombatLogPeriodicSpells","0");
		SetCVar("PetMeleeDamage","0");
		SetCVar("PetSpellDamage","0");
		SetCVar("CombatDamage","0");
		SetCVar("CombatHealing","0");
		SetCVar("fctSpellMechanics","0");
		SetCVar("fctSpellMechanicsOther","0");
	end
end

if (dwIsConfigurableAddOn("dct")) then
	dwRegisterMod(
		"DenniCombatText",
		FIGHTING_TITLE,
		"FIGHTING",
		"",
		"Interface\\ICONS\\INV_Sword_62",
		nil
	);

	dwRegisterCheckButton(
		"DenniCombatText",
		FIGHTING_OPTION1,
		nil,
		"EnableDCT",
		1,
		function (arg)			
			if (arg == 1) then				
				if (not dwIsAddOnLoaded("dct")) then
					dwLoadAddOn("dct");	
				end	
				DCT_Set("DCT_Enable",1);
				SetCVar("enableCombatText", "0");
			else
				if (dwIsAddOnLoaded("dct")) then
					SetCVar("enableCombatText", "1");
					DCT_Set("DCT_Enable",0);
				end
			end
		end
	);
	
	if (dwIsConfigurableAddOn("dct_damage")) then
		dwRegisterCheckButton(
			"DenniCombatText",
			FIGHTING_OPTION3,
			"",
			"DctDamage",
			0,
			function (arg)			
				if(arg==1)then				
					if (not dwIsAddOnLoaded("dct_damage")) then
						dwLoadAddOn("dct_damage");
					end
					DCTD_PERCONFIG["DCTD_ENABLE"] = 1;
					ToggleBlzCombat(false);
				else				
					if (dwIsAddOnLoaded("dct_damage") and DCTD_PERCONFIG) then
						DCTD_PERCONFIG["DCTD_ENABLE"] = 0;
						ToggleBlzCombat(true);
					end					
				end
			end,
			1
		);
	end
	
	if (dwIsConfigurableAddOn("dct_spellAlert")) then
		dwRegisterCheckButton(
			"DenniCombatText",
			FIGHTING_OPTION4,
			"",
			"DctSpellAlert",
			0,
			function (arg)		
				if(arg==1)then
					if (not dwIsAddOnLoaded("dct_spellAlert")) then
						dwLoadAddOn("dct_spellAlert");
					end
					DuowanAddon_DCTSA_PERCONFIG["DCTSA_ENABLE"] = 1;					
				else
					if (dwIsAddOnLoaded("dct_spellAlert") and DuowanAddon_DCTSA_PERCONFIG) then
						DuowanAddon_DCTSA_PERCONFIG["DCTSA_ENABLE"] = 0;						
					end
				end
			end,
			1
		);
	end

	dwRegisterButton(
		"DenniCombatText",
		FIGHTING_OPT, 
		function()
			if (not dwIsAddOnLoaded("dct_options")) then
				dwLoadAddOn("dct_options");
			end
			if (dwIsAddOnLoaded("dct_options")) then
				HideUIPanel(DuowanConfigFrame);
				DCT_showMenu();
			end
		end, 
		1
	);
	--[[
	dwRegisterCheckButton(
		"DenniCombatText",
		FIGHTING_FCT,
		nil,
		"FIGHTING_FCT",
		1,
		function (arg)			
			if (arg == 1) then				
				SetCVar("CombatDamage","1");
				SetCVar("CombatLogPeriodicSpells","1");
				SetCVar("PetMeleeDamage","1");
				SetCVar("PetSpellDamage","1");
				SetCVar("CombatDamage","1");
				SetCVar("CombatHealing","1");
				SetCVar("fctSpellMechanics","1");
				SetCVar("fctSpellMechanicsOther","1");
			else
				SetCVar("CombatDamage","0");
				SetCVar("CombatLogPeriodicSpells","0");
				SetCVar("PetMeleeDamage","0");
				SetCVar("PetSpellDamage","0");
				SetCVar("CombatDamage","0");
				SetCVar("CombatHealing","0");
				SetCVar("fctSpellMechanics","0");
				SetCVar("fctSpellMechanicsOther","0");
			end
		end
	);
	
	dwRegisterButton(
		"DenniCombatText",
		FIGHTING_FCT_OPT, 
		function()
			InterfaceOptionsFrame_OpenToCategory(COMBATTEXT_LABEL);	
		end, 
		1
	);
	]]
end