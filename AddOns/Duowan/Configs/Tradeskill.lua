------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	TRADESKILL_TITLE = "商业技能库";
	TRADESKILL_OPT = "更多设置"
	TRADESKILL_OPTION1 = "开启专业技能助手";
	TRADESKILL_BUTTON1 = "开启助手界面";
	TRADESKILL_TABS = "开启制造技能标签";
elseif (GetLocale() == "zhTW") then
	TRADESKILL_TITLE = "商業技能庫";
	TRADESKILL_OPT = "更多設置"
	TRADESKILL_OPTION1 = "開啟專業技能助手";
	TRADESKILL_BUTTON1 = "開啟助手介面";
	TRADESKILL_TABS = "開啟製造技能標籤";
else
	TRADESKILL_TITLE = "商业技能库";
	TRADESKILL_OPT = "更多设置"
	TRADESKILL_OPTION1 = "开启专业技能助手";
	TRADESKILL_BUTTON1 = "开启助手界面";
	TRADESKILL_TABS = "开启制造技能标签";
end
--TradeskillInfoUI
if (dwIsConfigurableAddOn("TradeskillInfo") or dwIsConfigurableAddOn("DuowanTradeskill")) then	
	dwRegisterMod(
		"TradeSkillMod",
		TRADESKILL_TITLE,
		"TRADESKILL",
		"",
		"Interface\\ICONS\\INV_Jewelcrafting_Nightseye_01",
		nil
	);
end

if dwIsConfigurableAddOn("TradeskillInfo") then	
	dwRegisterCheckButton(
		"TradeSkillMod",
		TRADESKILL_OPTION1,
		nil,
		"TRADESKILL_OPTION1",
		1,
		function (arg)			
			if(arg==1)then				
				if (not dwIsAddOnLoaded("TradeskillInfo")) then
					dwLoadAddOn("TradeskillInfo");
				end
				TradeskillInfo:Toggle(true);
			else
				if (dwIsAddOnLoaded("TradeskillInfo")) then					
					TradeskillInfo:Toggle(false);
				end
			end
		end
	);

	dwRegisterButton(
		"TradeSkillMod",
		TRADESKILL_OPT, 
		function()
			if (dwIsAddOnLoaded("TradeskillInfo")) then
				--HideUIPanel(DuowanConfigFrame);
				TradeskillInfoConfigToggle();
			end
		end,
		1
	);
	dwRegisterButton(
		"TradeSkillMod",
		TRADESKILL_BUTTON1, 
		function()		
			if (dwIsAddOnLoaded("TradeskillInfo")) then
				HideUIPanel(DuowanConfigFrame);
				TradeskillInfoUI_Toggle();
			end
		end, 
		1
	);
end

if dwIsConfigurableAddOn("DuowanTradeskill") then
	dwRegisterCheckButton(
		"TradeSkillMod",
		TRADESKILL_TABS,
		nil,
		"TradeTabs",
		1,
		function (arg)			
			if(arg==1)then				
				if (not dwIsAddOnLoaded("DuowanTradeskill")) then
					dwLoadAddOn("DuowanTradeskill");
				end
				DuowanTradeskill:ToggleTabs(true);
			else
				if (dwIsAddOnLoaded("DuowanTradeskill")) then					
					DuowanTradeskill:ToggleTabs(false);
				end
			end
		end
	);
	
end