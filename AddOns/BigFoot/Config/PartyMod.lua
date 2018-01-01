
if (GetLocale() == "zhCN") then
	MOD_PARTY_ASSIST = {"组队工具", "zuduigongju"};
	MOD_PARTY_ASSIST_ENABLE_TEXT = "开启组队施法";
	MOD_PARTY_ASSIST_ENABLE_TIP_TEXT = "允许你在队友头像旁边设置法术的快捷按钮以方便施放针对队友的增益魔法。";
	MOD_PARTY_ASSIST_8_BUTTONS = "允许放置8种魔法";
	MOD_PARTY_ASSIST_LITE_TIPS = "精简鼠标提示信息";

	MOD_CLIQUE_ENABLE_TEXT = "开启一键施法(Clique)";
	MOD_CLIQUE_ENABLE_TOOLTIP = "开启一键施法后，你可以在法术书上找到一键施法的设置界面。";
	CLIQUE_DISABLE_DELAY_TEXT = "|cff00c0c0<一键施法>|r 你已经关闭一键施法模块，该设置将在下次插件载入时生效。";
elseif (GetLocale() == "zhTW") then
	MOD_PARTY_ASSIST = {"組隊工具", "zuduigongju"};
	MOD_PARTY_ASSIST_ENABLE_TEXT = "開啟組隊施法";
	MOD_PARTY_ASSIST_ENABLE_TIP_TEXT = "允許你在隊友頭像旁邊設置法術的快捷按鈕以方便施放針對隊友的增益魔法。";
	MOD_PARTY_ASSIST_8_BUTTONS = "允許放置8種魔法";
	MOD_PARTY_ASSIST_LITE_TIPS = "精簡滑鼠提示信息";

	MOD_CLIQUE_ENABLE_TEXT = "開啟一鍵施法(Clique)";
	MOD_CLIQUE_ENABLE_TOOLTIP = "開啟一鍵施法後，你可以在法術書上找到一鍵施法的設置介面。";
	CLIQUE_DISABLE_DELAY_TEXT = "|cff00c0c0<一鍵施法>|r 你已經關閉一鍵施法模組，該設置將在下次外掛程式載入時生效。";
else
	MOD_PARTY_ASSIST = "Party Toolkit";
	MOD_PARTY_ASSIST_ENABLE_TEXT = "Enable PartyAssist";
	MOD_PARTY_ASSIST_ENABLE_TIP_TEXT = "Allow you place some spell on the right of party member portraits.";
	MOD_PARTY_ASSIST_8_BUTTONS = "Set 8 spell buttons";
	MOD_PARTY_ASSIST_LITE_TIPS = "Simple Tips";

	MOD_CLIQUE_ENABLE_TEXT = "Enable Clique";
	MOD_CLIQUE_ENABLE_TOOLTIP = "After clique is enabled, you can find setting interface in your spellbook.";
	CLIQUE_DISABLE_DELAY_TEXT = "|cff00c0c0<Clique>|r Clique has been disabled. This setting will be available next time.";
end

if (IsConfigurableAddOn("PartyAssist") or IsConfigurableAddOn("Clique")) then
	ModManagement_RegisterMod(
		"PartyToolkit",
		"Interface\\Icons\\Ability_Warrior_VictoryRush",
		MOD_PARTY_ASSIST,
		"",
		nil
	);
end

if (IsConfigurableAddOn("PartyAssist")) then
	ModManagement_RegisterCheckBox(
		"PartyToolkit",
		MOD_PARTY_ASSIST_ENABLE_TEXT,
		MOD_PARTY_ASSIST_ENABLE_TIP_TEXT,
		"EnablePartyAssist",
		0,
		function (arg)
			if ( arg == 1 ) then
				if (not BigFoot_IsAddOnLoaded("PartyAssist")) then
					BigFoot_LoadAddOn("PartyAssist");
				end

				if (BigFoot_IsAddOnLoaded("PartyAssist")) then
					PartyAssist_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("PartyAssist")) then
					PartyAssist_Toggle(false);
				end
			end
		end
	);

	ModManagement_RegisterCheckBox(
		"PartyToolkit",
		MOD_PARTY_ASSIST_8_BUTTONS,
		nil,
		"8Buttons",
		0,
		function (arg)
			if (BigFoot_IsAddOnLoaded("PartyAssist")) then
				if (arg == 1) then
					PartyAssist_Toggle8Buttons(true);
				else
					PartyAssist_Toggle8Buttons(false);
				end
			end
		end,
		1
	);

	ModManagement_RegisterCheckBox(
		"PartyToolkit",
		MOD_PARTY_ASSIST_LITE_TIPS,
		nil,
		"LiteTips",
		0,
		function (arg)
			if (BigFoot_IsAddOnLoaded("PartyAssist")) then
				if (arg == 1) then
					PartyAssist_ToggleTipMod(true);
				else
					PartyAssist_ToggleTipMod(false);
				end
			end
		end,
		1
	);
end

if (IsConfigurableAddOn("Clique")) then
	ModManagement_RegisterCheckBox(
		"PartyToolkit",
		MOD_CLIQUE_ENABLE_TEXT,
		MOD_CLIQUE_ENABLE_TOOLTIP,
		"EnableClique",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("Clique")) then
					BigFoot_LoadAddOn("Clique");
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("Clique")) then
					BigFoot_RequestReloadUI(function() BigFoot_Print(CLIQUE_DISABLE_DELAY_TEXT); end);
				end
			end
		end
	);
end
