------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	DUOWAN_CHARACTER_TITLE = "装备信息";
	DUOWAN_CHARACTER_RATING = "开启装备属性合计对比";
	DUOWAN_CHARACTER_FIZZLE_ENABLE = "显示装备的耐久度并高亮边框";	
	DUOWAN_CHARACTER_FIZZLE_BORDER = "按照物品品质高亮边框";
	DUOWAN_CHARACTER_RATINGBUSTER_DISP = "开启装备属性解析" .. DUOWAN_COLOR["STEELBLUE"] .. " (RatingBuster)" .. DUOWAN_COLOR["END"];
	DUOWAN_CHARACTER_RATINGBUSTER_OPTION = "更多设置";
	DUOWAN_CHARACTER_FIZZLE_RAIRCOST = "显示装备修理费用";
	EQUIPCOMPARE_ENABLE = "不按住Shift键即可进行装备比较";	
	EQUIPCOMAPRE_ATTRI_ENABLE = "显示属性点数对比";
	EQUIPCOMPARE_ENABLE_TIP = "不需要按住Shift即可进行装备比较";
	DUOWAN_GEARSCORELITE = "开启装备评分";
elseif (GetLocale() == "zhTW") then
	DUOWAN_CHARACTER_TITLE = "裝備資訊";
	DUOWAN_CHARACTER_RATING = "開啟裝備屬性合計對比";
	DUOWAN_CHARACTER_FIZZLE_ENABLE = "顯示裝備的耐久度并高亮邊框";	
	DUOWAN_CHARACTER_FIZZLE_BORDER = "按照物品品質高亮邊框";
	DUOWAN_CHARACTER_RATINGBUSTER_DISP = "開啟裝備屬性解析" .. DUOWAN_COLOR["STEELBLUE"] .. " (RatingBuster)" .. DUOWAN_COLOR["END"];
	DUOWAN_CHARACTER_RATINGBUSTER_OPTION = "更多設置";
	DUOWAN_CHARACTER_FIZZLE_RAIRCOST = "顯示裝備修理費用";
	EQUIPCOMPARE_ENABLE = "不按住Shift鍵即可進行裝備比較";	
	EQUIPCOMAPRE_ATTRI_ENABLE = "顯示屬性點數對比";
	EQUIPCOMPARE_ENABLE_TIP = "不需要按住Shift即可進行裝備比較";
	DUOWAN_GEARSCORELITE = "開啟裝備評分";
else
	DUOWAN_CHARACTER_TITLE = "装备信息";
	DUOWAN_CHARACTER_RATING = "开启装备属性合计对比";
	DUOWAN_CHARACTER_FIZZLE_ENABLE = "显示玩家装备的耐久度";	
	DUOWAN_CHARACTER_FIZZLE_PERCENT = "按照百分比显示";
	DUOWAN_CHARACTER_FIZZLE_HIDETEX = "隐藏耐久度文字";
	DUOWAN_CHARACTER_FIZZLE_BORDER = "按照物品品质高亮边框";
	DUOWAN_CHARACTER_FIZZLE_INSPECT = "当观察别人时显示物品质量";	
	DUOWAN_CHARACTER_RATINGBUSTER_DISP = "开启装备属性解析";
	DUOWAN_CHARACTER_RATINGBUSTER_OPTION = "更多设置";
	DUOWAN_CHARACTER_FIZZLE_RAIRCOST = "显示装备修理费用";
	EQUIPCOMPARE_ENABLE = "不按住Shift键即可进行装备比较";	
	EQUIPCOMAPRE_ATTRI_ENABLE = "显示属性点数对比";
	EQUIPCOMPARE_ENABLE_TIP = "不需要按住Shift即可进行装备比较";
	DUOWAN_GEARSCORELITE = "开启装备评分";
end

if (dwIsConfigurableAddOn("GearScoreLite") or dwIsConfigurableAddOn("RatingSummary") or dwIsConfigurableAddOn("Fizzle")  or dwIsConfigurableAddOn("RatingBuster") or dwIsConfigurableAddOn("Love")) then	
	dwRegisterMod(
		"ChracterInfo",
		DUOWAN_CHARACTER_TITLE,
		"DUOWAN_CHARACTER",
		"",
		"Interface\\ICONS\\Spell_Holy_Crusade",
		nil
	);
end

if (dwIsConfigurableAddOn("RatingSummary") ) then
	dwRegisterCheckButton(
		"ChracterInfo",
		DUOWAN_CHARACTER_RATING,
		nil,
		"DUOWAN_CHARACTER_RATING",
		1,
		function (arg)			
			if(arg==1)then				
				dwLoadAddOn("RatingSummary");

				RatingSummary_Toggle(true);			
			else
				if (dwIsAddOnLoaded("RatingSummary")) then
					RatingSummary_Toggle(false);			
				end				
			end
		end
	);
end

if (dwIsConfigurableAddOn("RatingBuster")) then
	dwRegisterCheckButton(
		"ChracterInfo",
		DUOWAN_CHARACTER_RATINGBUSTER_DISP,
		nil,
		"EnableRatingBuster",
		1,
		function (arg)	
			if (arg == 1) then
				dwLoadAddOn("RatingBuster");

				RatingBuster:Enable();
			else
				if (dwIsAddOnLoaded("RatingBuster")) then
					RatingBuster:Disable();
				end				
			end
		end
	);	
	--[[
	dwRegisterButton(
		"ChracterInfo",
		DUOWAN_CHARACTER_RATINGBUSTER_OPTION, 
		function()
			if (dwIsAddOnLoaded("RatingBuster")) then				
				RatingBuster:ShowConfig();
			end
		end, 
		1
	);
	]]
end

if (dwIsConfigurableAddOn("Fizzle") ) then
	dwRegisterCheckButton(
		"ChracterInfo",
		DUOWAN_CHARACTER_FIZZLE_ENABLE,
		nil,
		"FizzleEnable",
		1,
		function (arg)			
			if(arg==1)then				
				dwLoadAddOn("Fizzle");

				Fizzle_Toggle(true);
				Fizzle.db.profile.Border = true;
				Fizzle:BorderToggle()
			else
				if (dwIsAddOnLoaded("Fizzle")) then
					Fizzle_Toggle(false);
					Fizzle.db.profile.Border = false;
					Fizzle:BorderToggle()
				end				
			end
		end
	);

	dwRegisterCheckButton(
		"ChracterInfo",
		DUOWAN_CHARACTER_FIZZLE_RAIRCOST,
		nil,
		"FizzleRepairCost",
		1,
		function (arg)			
			if(arg==1)then
				if (dwIsAddOnLoaded("Fizzle")) then	
					Fizzle:ToggleCost(true);
				end
			else
				if (dwIsAddOnLoaded("Fizzle")) then
					Fizzle:ToggleCost(false);
				end				
			end
		end
	);	
end

if (dwIsConfigurableAddOn("Love")) then	
	dwRegisterCheckButton(
		"ChracterInfo",
		EQUIPCOMPARE_ENABLE,
		EQUIPCOMPARE_ENABLE_TIP,
		"EquipComareEnable",
		1,
		function (arg)		
			if arg==1 then
				dwLoadAddOn("Love");					
				QuickCompare:Toggle(true);
			else
				if (dwIsAddOnLoaded("Love")) then	
					QuickCompare:Toggle(false);
				end	
			end
		end
	);

	dwRegisterCheckButton(
		"ChracterInfo",
		EQUIPCOMAPRE_ATTRI_ENABLE,
		nil,
		"EquipAttribute",
		1,
		function (arg)		
			if arg==1 then
				if (dwIsAddOnLoaded("Love")) then
					QuickCompare:ToggleAttri(true);
				end
			else
				if (dwIsAddOnLoaded("Love")) then	
					QuickCompare:ToggleAttri(false);
				end	
			end
		end,
		1
	);	
end

if (dwIsConfigurableAddOn("GearScoreLite")) then	
	dwRegisterCheckButton(
		"ChracterInfo",
		DUOWAN_GEARSCORELITE,
		nil,
		"GearScoreLiteEnable",
		1,
		function (arg)		
			if arg==1 then
				dwLoadAddOn("GearScoreLite");	
				
				GS_Toggle(true);
			else
				if (dwIsAddOnLoaded("GearScoreLite")) then	
					GS_Toggle(false);
				end				
			end
		end
	);		
end

