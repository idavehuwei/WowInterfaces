TITAN_PANEL_MENU_FUNC_HIDE = "TitanPanelRightClickMenu_Hide";
local _G = getfenv(0);
local L = LibStub("AceLocale-3.0"):GetLocale("Titan", true)

function TitanRightClickMenu_OnLoad(self)
	local id = TitanUtils_GetButtonIDFromMenu(self);	
	if (id) then	
		local prepareFunction = _G["TitanPanelRightClickMenu_Prepare"..id.."Menu"];
		if prepareFunction and type(prepareFunction) == "function" then
		 	UIDropDownMenu_Initialize(self, prepareFunction, "MENU");		 	
		end
	end
end

function TitanPanelRightClickMenu_Toggle(self, isChildButton)
	local position = TitanPanelGetVar("Position");
	local x, y = GetCursorPosition(UIParent);
	
	TITAN_PANEL_SELECTED = TitanUtils_GetButtonID(self:GetName())
	-- Toggle menu
	if isChildButton then
		local parent = self:GetParent():GetName();
		TITAN_PANEL_SELECTED = TitanUtils_GetButtonID(parent)
	end

	local i = TitanPanel_GetButtonNumber(TITAN_PANEL_SELECTED)
	
	if TITAN_PANEL_SELECTED ~= "Bar" and TITAN_PANEL_SELECTED ~= "AuxBar" then
		if TitanPanelSettings.Location[i] ~= nil then
			TITAN_PANEL_SELECTED = TitanPanelSettings.Location[i]
		else
	  		TitanPanelSettings.Location[i] = "Bar"
  	 		TITAN_PANEL_SELECTED = "Bar"
		end
	end

	-- fix for Right-Click menu on the DoubleBar	
	local menu;	
	if self:GetName() == "TitanPanelBarButtonHider" then
		menu = _G["TitanPanelBarButton".."RightClickMenu"]
	elseif self:GetName() == "TitanPanelAuxBarButtonHider" then
		menu = _G["TitanPanelAuxBarButton".."RightClickMenu"]
	else
		menu = _G[self:GetName().."RightClickMenu"];
	end
	
	--Debug(menu:GetName())

	if (  TITAN_PANEL_SELECTED == "Bar" and position == TITAN_PANEL_PLACE_TOP ) then
		menu.point = "TOPLEFT";
		menu.relativePoint = "BOTTOMLEFT";
	else 
		menu.point = "BOTTOMLEFT";
		menu.relativePoint = "TOPLEFT";
	end
	
	-- take UI Scale into consideration
	local listFrame = _G["DropDownList1"];
	local listframeScale = listFrame:GetScale();
	
	local uiScale;
	local uiParentScale = UIParent:GetScale();
				
	if ( GetCVar("useUIScale") == "1" ) then
		uiScale = tonumber(GetCVar("uiscale"));
		if ( uiParentScale < uiScale ) then
			uiScale = uiParentScale;
		end
	else
		uiScale = uiParentScale;
	end
				
	x = x/uiScale;
	y = y/uiScale;
	listFrame:SetScale(uiScale);	


	ToggleDropDownMenu(1, nil, menu, "TitanPanel" .. TITAN_PANEL_SELECTED .. "Button", TitanUtils_Max(x - 40, 0), 0, nil, self);
	
	local listFrame = _G["DropDownList"..UIDROPDOWNMENU_MENU_LEVEL];
	local offscreenX, offscreenY = TitanUtils_GetOffscreen(listFrame);

	if ( offscreenX == 1 ) then
		if ( TITAN_PANEL_SELECTED == "Bar" and position == TITAN_PANEL_PLACE_TOP ) then 
			listFrame:ClearAllPoints();
			listFrame:SetPoint("TOPRIGHT", "TitanPanel" .. TITAN_PANEL_SELECTED .. "Button", "BOTTOMLEFT", x, 0);
		else
			listFrame:ClearAllPoints();
			listFrame:SetPoint("BOTTOMRIGHT", "TitanPanel" .. TITAN_PANEL_SELECTED .. "Button", "TOPLEFT", x, 0);
		end	
	end
end

function TitanPanelRightClickMenu_IsVisible()
	return DropDownList1:IsVisible();
end

function TitanPanelRightClickMenu_Close()
	DropDownList1:Hide();
end

function TitanPanelRightClickMenu_AddTitle(title, level)
	if (title) then
		local info = {};
		info.text = title;
		info.notClickable = 1;
		info.isTitle = 1;
		UIDropDownMenu_AddButton(info, level);
	end
end

function TitanPanelRightClickMenu_AddCommand(text, value, functionName, level)
	local info = {};
	info.text = text;
	info.value = value;
	info.func = function()
		local callback = _G[functionName];
-- callback must be a function else do nothing (spank developer)
		if callback and type(callback)== "function" then 
			callback(value)			
		end
	end
	UIDropDownMenu_AddButton(info, level);
end

function TitanPanelRightClickMenu_AddSpacer(level)
	local info = {};
	info.disabled = 1;
	UIDropDownMenu_AddButton(info, level);
end

function TitanPanelRightClickMenu_Hide(value) 
	TitanPanel_RemoveButton(value);
end

function TitanPanelRightClickMenu_AddToggleVar(text, id, var, toggleTable)
	local info = {};
	info.text = text;
	info.value = {id, var, toggleTable};
	info.func = function()		
		TitanPanelRightClickMenu_ToggleVar({id, var, toggleTable})
	end
	info.checked = TitanGetVar(id, var);
	info.keepShownOnClick = 1;
	UIDropDownMenu_AddButton(info);
end

function TitanPanelRightClickMenu_AddToggleIcon(id)
	TitanPanelRightClickMenu_AddToggleVar(L["TITAN_PANEL_MENU_SHOW_ICON"], id, "ShowIcon");
end

function TitanPanelRightClickMenu_AddToggleLabelText(id)
	TitanPanelRightClickMenu_AddToggleVar(L["TITAN_PANEL_MENU_SHOW_LABEL_TEXT"], id, "ShowLabelText");
end

function TitanPanelRightClickMenu_AddToggleColoredText(id)
	TitanPanelRightClickMenu_AddToggleVar(L["TITAN_PANEL_MENU_SHOW_COLORED_TEXT"], id, "ShowColoredText");
end

function TitanPanelRightClickMenu_ToggleVar(value)
local id,var, toggleTable = nil;
	
  -- table expected else do nothing  
	if type(value)~="table" then return end
	
	if value and value[1] then id = value[1] end
	if value and value[2] then var = value[2] end
	if value and value[3] then toggleTable = value[3] end

	-- Toggle var
	TitanToggleVar(id, var);
	
	if ( TitanPanelRightClickMenu_AllVarNil(id, toggleTable) ) then
		-- Undo if all vars in toggle table nil
		TitanToggleVar(id, var);
	else
		-- Otherwise continue and update the button
		TitanPanelButton_UpdateButton(id, 1);
	end
	
end

function TitanPanelRightClickMenu_AllVarNil(id, toggleTable)
	if ( toggleTable ) and type(toggleTable)== "table" then
		for i, v in toggleTable do
			if ( TitanGetVar(id, v) ) then
				return;
			end
		end	
		return 1;
	end	
end

function TitanPanelRightClickMenu_ToggleColoredText(value)
	TitanToggleVar(value, "ShowColoredText");
	TitanPanelButton_UpdateButton(value, 1);
end
