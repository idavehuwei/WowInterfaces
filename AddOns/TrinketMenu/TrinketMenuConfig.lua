local loaded = false;
function TrinketMenu_Toggle(switch)
	if (switch) then
		if (not loaded) then
			TrinketMenu.Initialize();
			if (TrinketMenuPerOptions.userHide) then
				TrinketMenu_MainFrame:Show();
				TrinketMenu_IconFrame:Show();
			end
		else			
			TrinketMenu_MainFrame:Show();
			TrinketMenu_IconFrame:Show();			
		end		
		loaded = true;
		TrinketMenu_MainFrame:RegisterEvent("PLAYER_REGEN_ENABLED");
		TrinketMenu_MainFrame:RegisterEvent("PLAYER_REGEN_DISABLED");
		TrinketMenu_MainFrame:RegisterEvent("PLAYER_UNGHOST");
		TrinketMenu_MainFrame:RegisterEvent("PLAYER_ALIVE");
		TrinketMenu_MainFrame:RegisterEvent("UNIT_INVENTORY_CHANGED");
		TrinketMenu_MainFrame:RegisterEvent("UPDATE_BINDINGS");
		TrinketMenu_MainFrame:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN");
		TrinketMenu_MainFrame:RegisterEvent("SPELLS_CHANGED");
		
		SlashCmdList["TrinketMenuCOMMAND"] = TrinketMenu.SlashHandler;
		SLASH_TrinketMenuCOMMAND1 = "/trinketmenu";
		SLASH_TrinketMenuCOMMAND2 = "/trinket";
	else
		TrinketMenu_MainFrame:Hide();
		TrinketMenu_IconFrame:Hide();
		
		TrinketMenuPerOptions.userHide = true;
		TrinketMenu_MainFrame:UnregisterEvent("PLAYER_REGEN_ENABLED");
		TrinketMenu_MainFrame:UnregisterEvent("PLAYER_REGEN_DISABLED");
		TrinketMenu_MainFrame:UnregisterEvent("PLAYER_UNGHOST");
		TrinketMenu_MainFrame:UnregisterEvent("PLAYER_ALIVE");
		TrinketMenu_MainFrame:UnregisterEvent("UNIT_INVENTORY_CHANGED");
		TrinketMenu_MainFrame:UnregisterEvent("UPDATE_BINDINGS");
		TrinketMenu_MainFrame:UnregisterEvent("ACTIONBAR_UPDATE_COOLDOWN");		

		SlashCmdList["TrinketMenuCOMMAND"] = nil;
		SLASH_TrinketMenuCOMMAND1 = nil;
		SLASH_TrinketMenuCOMMAND2 = nil;
	end
end

function TrinketMenu_OpenBinding()
	dwShowKeyBindingFrame("HEADER_TRINKETMENU");
end