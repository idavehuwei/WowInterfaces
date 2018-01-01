
local TalentViewer_Eventer;

if (GetLocale() == "zhCN") then
	TALENT_VIEWER_SHOW_ENUMERATOR = "模拟器";
elseif (GetLocale() == "zhTW") then
	TALENT_VIEWER_SHOW_ENUMERATOR = "顯示模擬器";
else
	TALENT_VIEWER_SHOW_ENUMERATOR = "Enumerator";
end

if (GetLocale() == "zhCN" and IsConfigurableAddOn("TalentViewer")) then
	TalentViewer_Eventer = BLibrary("BEvent");
	TalentViewer_Eventer:RegisterEvent("ADDON_LOADED");

	TalentViewer_Eventer.ADDON_LOADED = function(self, addon)
		if (addon == "Blizzard_TalentUI") then
			local button = CreateFrame("Button", "TalentViewer_ShowButton", PlayerTalentFrame);
			local texture = button:CreateTexture(nil, "BACKGROUND");
			texture:SetTexture("Interface\\WorldMap\\WorldMap-MagnifyingGlass");
			texture:SetVertexColor(1.0, 0.7, 0);
			texture:SetWidth(24);
			texture:SetHeight(24);
			texture:SetPoint("LEFT", button, "LEFT", 0, 0);
			button:SetText(TALENT_VIEWER_SHOW_ENUMERATOR);
			button:SetWidth(90);
			button:SetHeight(24);
			button:SetNormalFontObject("GameFontNormalSmall");
			button:SetHighlightFontObject("GameFontHighlightSmall");
			button:SetText(TALENT_VIEWER_SHOW_ENUMERATOR);
			button:GetFontString():SetPoint("LEFT", button, "LEFT", 20, 4);
			if (TalentViewerFrame) then
				button:SetText(TALENT_VIEWER_SHOW_ENUMERATOR);
			end

			button:SetScript("OnClick", function()
				if (not BigFoot_IsAddOnLoaded("TalentViewer")) then
					BigFoot_LoadAddOn("TalentViewer");
				end

				TalentViewerFrame:ClearAllPoints();
				TalentViewerFrame:SetPoint("TOPLEFT", "PlayerTalentFrame", "TOPRIGHT", -35, 0);
				TalentViewerFrame:Show();
			end);

			button:SetPoint("BOTTOMLEFT", PlayerTalentFrame, "BOTTOMLEFT", 23, 76);
			button:Show();
		end
	end
end