
if (GetLocale() == "zhCN") then
	MOD_ARENA_MOD = {"竞技助手", "jingjizhushou"};
	MOD_ARENA_PROXMIO_ENABLE_TEXT = "开启竞技助手(Gladius)";
	GLADIUS_DISABLE_DELAY_TEXT = "|cff00c0c0<竞技助手>|r 你已经关闭竞技助手模块，该设置将在下次插件载入时生效。";
elseif (GetLocale() == "zhTW") then
	MOD_ARENA_MOD = {"競技助手", "jingjizhushou"};
	MOD_ARENA_PROXMIO_ENABLE_TEXT = "開啟競技助手(Gladius)";
	GLADIUS_DISABLE_DELAY_TEXT = "|cff00c0c0<競技助手>|r 你已經關閉競技助手模組，該設置將在下次外掛程式載入時生效。";
else
	MOD_ARENA_MOD = "Arena Mod";
	MOD_ARENA_PROXMIO_ENABLE_TEXT = "Enable Gladius";
	GLADIUS_DISABLE_DELAY_TEXT = "|cff00c0c0<Gladius>|r Proximo has been disabled. This setting will be available next time.";
end

if (IsConfigurableAddOn("Gladius")) then
	ModManagement_RegisterMod(
		"ArenaMod",
		"Interface\\Icons\\INV_Jewelry_Necklace_14",
		MOD_ARENA_MOD
	);

	ModManagement_RegisterCheckBox(
		"ArenaMod",
		MOD_ARENA_PROXMIO_ENABLE_TEXT,
		nil,
		"EnableProximo",
		1,
		function (arg)
			if ( arg == 1 ) then
				if (not BigFoot_IsAddOnLoaded("Gladius")) then
					BigFoot_LoadAddOn("Gladius");
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("Gladius")) then
					BigFoot_RequestReloadUI(function() BigFoot_Print(GLADIUS_DISABLE_DELAY_TEXT); end);
				end
			end
		end
	);
end
