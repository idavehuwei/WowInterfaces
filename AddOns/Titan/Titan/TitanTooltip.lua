local InCombatLockdown	= _G.InCombatLockdown;

-- Globals
TitanTooltipOrigScale = 1;
TitanTooltipScaleSet = 0;

-- Set both the parent and the position of GameTooltip
function TitanTooltip_SetOwnerPosition(parent, anchorPoint, relativeToFrame, relativePoint, xOffset, yOffset)
	GameTooltip:SetOwner(parent, "ANCHOR_NONE");
	GameTooltip:SetPoint(anchorPoint, relativeToFrame, relativePoint, xOffset, yOffset);
	-- set alpha (transparency) for the Game Tooltip
	local red, green, blue, _ = GameTooltip:GetBackdropColor();
	local red2, green2, blue2, _ = GameTooltip:GetBackdropBorderColor();
	GameTooltip:SetBackdropColor(red,green,blue,TitanPanelGetVar("TooltipTrans"));
	GameTooltip:SetBackdropBorderColor(red2,green2,blue2,TitanPanelGetVar("TooltipTrans"));
	-- set font size for the Game Tooltip
	if not TitanPanelGetVar("DisableTooltipFont") then
		if TitanTooltipScaleSet < 1 then
		TitanTooltipOrigScale = GameTooltip:GetScale();
		TitanTooltipScaleSet = TitanTooltipScaleSet + 1;
		end
		GameTooltip:SetScale(TitanPanelGetVar("TooltipFont"));
	end
end

function TitanTooltip_SetGameTooltip(self)
	if ( self.tooltipCustomFunction ) then
		self.tooltipCustomFunction();
	elseif ( self.tooltipTitle ) then
		GameTooltip:SetText(self.tooltipTitle, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);	
		if ( self.tooltipText ) then
			TitanTooltip_AddTooltipText(self.tooltipText);
		end
	end

	GameTooltip:Show();
end

function TitanTooltip_SetPanelTooltip(self, id)
	if not TitanPanelGetVar("ToolTipsShown") or (TitanPanelGetVar("HideTipsInCombat") and InCombatLockdown()) then
		return;
	end

	if ( not self.tooltipCustomFunction and not self.tooltipTitle ) then
		return;
	end

	-- Set GameTooltip
	local button = TitanUtils_GetButton(id);
	local position = TitanPanelGetVar("Position");
	local scale = TitanPanelGetVar("Scale");	
	local offscreenX, offscreenY;
	local i = TitanPanel_GetButtonNumber(id);

	if (TitanPanelSettings.Location[i] == "Bar") then 
		if position == TITAN_PANEL_PLACE_TOP then
			TitanTooltip_SetOwnerPosition(button, "TOPLEFT", button:GetName(), "BOTTOMLEFT", -10, -4 * scale);
			TitanTooltip_SetGameTooltip(self);
	
			-- Adjust GameTooltip position if it's off the screen
			offscreenX, offscreenY = TitanUtils_GetOffscreen(GameTooltip);
			if ( offscreenX == -1 ) then
				TitanTooltip_SetOwnerPosition(button, "TOPLEFT", "TitanPanelBarButton", "BOTTOMLEFT", 0, 0);
				TitanTooltip_SetGameTooltip(self);
			elseif ( offscreenX == 1 ) then
				TitanTooltip_SetOwnerPosition(button, "TOPRIGHT", "TitanPanelBarButton", "BOTTOMRIGHT", 0, 0);
				TitanTooltip_SetGameTooltip(self);	
			end	
		else
			TitanTooltip_SetOwnerPosition(button, "BOTTOMLEFT", button:GetName(), "TOPLEFT", -10, 4 * scale);
			TitanTooltip_SetGameTooltip(self);
	
			-- Adjust GameTooltip position if it's off the screen
			offscreenX, offscreenY = TitanUtils_GetOffscreen(GameTooltip);
			if ( offscreenX == -1 ) then
				TitanTooltip_SetOwnerPosition(button, "BOTTOMLEFT", "TitanPanel" .. TitanPanelSettings.Location[i] .."Button", "TOPLEFT", 0, 0);
				TitanTooltip_SetGameTooltip(self);	
			elseif ( offscreenX == 1 ) then
				TitanTooltip_SetOwnerPosition(button, "BOTTOMRIGHT", "TitanPanel" .. TitanPanelSettings.Location[i] .."Button", "TOPRIGHT", 0, 0);
				TitanTooltip_SetGameTooltip(self);	
			end
		end
	else
		TitanTooltip_SetOwnerPosition(button, "BOTTOMLEFT", button:GetName(), "TOPLEFT", -10, 4 * scale);
		TitanTooltip_SetGameTooltip(self);
	
		-- Adjust GameTooltip position if it's off the screen
		offscreenX, offscreenY = TitanUtils_GetOffscreen(GameTooltip);
		if ( offscreenX == -1 ) then
			TitanTooltip_SetOwnerPosition(button, "BOTTOMLEFT", "TitanPanelAuxBarButton", "TOPLEFT", 0, 0);
			TitanTooltip_SetGameTooltip(self);	
		elseif ( offscreenX == 1 ) then
			TitanTooltip_SetOwnerPosition(button, "BOTTOMRIGHT", "TitanPanelAuxBarButton", "TOPRIGHT", 0, 0);
			TitanTooltip_SetGameTooltip(self);	
		end
	end
end

function TitanTooltip_AddTooltipText(text)
	if ( text ) then
		-- Append a "\n" to the end 
		if ( string.sub(text, -1, -1) ~= "\n" ) then
			text = text.."\n";
		end
		
		for text1, text2 in string.gmatch(text, "([^\t\n]*)\t?([^\t\n]*)\n") do
			if ( text2 ~= "" ) then
				GameTooltip:AddDoubleLine(text1, text2);
			elseif ( text1 ~= "" ) then
				GameTooltip:AddLine(text1);
			else
				GameTooltip:AddLine("\n");
			end			
		end
	end
end
