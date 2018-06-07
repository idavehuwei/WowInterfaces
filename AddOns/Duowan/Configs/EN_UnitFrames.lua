if (GetLocale() == "zhCN") then
	EUF_TITLE = "头像增强";
	-- player
	EUF_PLAYERFRAME_ENABLE		= "开启玩家头像扩展";	
	EUF_PLAYERFRAME_XPBAR			= "显示经验条";
	EUF_PLAYERFRAME_ELITE			= "显示精英边框";
	EUF_PLAYERFRAME_CLASSICON		= "显示职业图标";
	-- target
	EUF_TARGETFRAME_ENABLE		= "开启目标头像扩展";
	EUF_TARGETFRAME_HPMP			= "显示目标生命值和魔法值";
	EUF_TARGETFRAME_PERCENT		= "显示百分比";
	EUF_TARGETFRAME_CLASSICON		= "显示职业图标";
	EUF_TARGETFRAME_INFO			= "显示目标信息";
	-- tot 
	EUF_TARGETTARGET_ENABLE		= "显示目标的目标";
	EUF_TARGETTARGETTARGET		= "显示目标的目标的目标";
	-- focus
	EUF_FOCUSFRAME_EANBLE		= "显示焦点头像";
	EUF_FOCUSTARGET_EANBLE		= "显示焦点的目标的头像"
	-- party
	EUF_PARTYFRAME_ENABLE			= "显示队友头像扩展";	
	EUF_PARTYFRAME_TARGET			= "显示队友目标";
	EUF_SHOW_PARTYBUFF			= "显示队友BUFF";
	EUF_PARTYFRAME_CASTBAR		= "显示队友施法条";
	-- general
	EUF_3DPORTRAIT_ENABLE			= "玩家和目标显示3D头像";
	EUF_AUTOHEALTHCOLOR			= "按照生命值高低改变生命条颜色";

elseif (GetLocale() == "zhTW") then
	EUF_TITLE = "頭像增強";
	EUF_PLAYERFRAME_ENABLE		= "開啟玩家頭像擴展";	
	EUF_PLAYERFRAME_XPBAR			= "顯示經驗條";
	EUF_PLAYERFRAME_ELITE			= "顯示精英邊框";
	EUF_PLAYERFRAME_CLASSICON		= "顯示職業圖示";
	
	EUF_TARGETFRAME_ENABLE		= "開啟目標頭像擴展";
	EUF_TARGETFRAME_HPMP			= "顯示目標生命值和魔法值";
	EUF_TARGETFRAME_PERCENT		= "顯示百分比";
	EUF_TARGETFRAME_CLASSICON		= "顯示職業圖示";
	EUF_TARGETFRAME_INFO			= "顯示目標資訊";

	EUF_TARGETTARGET_ENABLE		= "顯示目標的目標";	
	EUF_TARGETTARGETTARGET		= "顯示目標的目標的目標";

	EUF_FOCUSFRAME_EANBLE		= "顯示焦點頭像";
	EUF_FOCUSTARGET_EANBLE		= "顯示焦點的目標的頭像"
	
	EUF_PARTYFRAME_ENABLE			= "顯示隊友頭像擴展";	
	EUF_PARTYFRAME_TARGET			= "顯示隊友目標";
	EUF_SHOW_PARTYBUFF			= "顯示隊友BUFF";
	EUF_PARTYFRAME_CASTBAR		= "顯示隊友施法條";
	EUF_3DPORTRAIT_ENABLE			= "玩家和目標顯示3D頭像";
	EUF_AUTOHEALTHCOLOR			= "按照生命值高低改變生命條顏色";

else
	EUF_TITLE = "头像增强";
	EUF_PLAYERFRAME_ENABLE		= "开启玩家头像扩展";	
	EUF_PLAYERFRAME_XPBAR			= "显示经验条";
	EUF_PLAYERFRAME_ELITE			= "显示精英边框";
	EUF_PLAYERFRAME_CLASSICON		= "显示职业图标";
	
	EUF_TARGETFRAME_ENABLE		= "开启目标头像扩展";
	EUF_TARGETFRAME_HPMP			= "显示目标生命值和魔法值";
	EUF_TARGETFRAME_PERCENT		= "显示百分比";
	EUF_TARGETFRAME_CLASSICON		= "显示职业图标";
	EUF_TARGETFRAME_INFO			= "显示目标信息";

	EUF_TARGETTARGET_ENABLE		= "显示目标的目标";
	EUF_TARGETTARGETTARGET		= "显示目标的目标的目标";

	EUF_FOCUSFRAME_EANBLE		= "显示焦点头像";
	EUF_FOCUSTARGET_EANBLE		= "显示焦点的目标的头像"
	
	EUF_PARTYFRAME_ENABLE			= "显示队友头像扩展";	
	EUF_PARTYFRAME_TARGET			= "显示队友目标";
	EUF_SHOW_PARTYBUFF			= "显示队友BUFF";
	EUF_PARTYFRAME_CASTBAR		= "显示队友施法条";
	EUF_3DPORTRAIT_ENABLE			= "玩家和目标显示3D头像";
	EUF_AUTOHEALTHCOLOR			= "按照生命值高低改变生命条颜色";
end

if (dwIsConfigurableAddOn("EN_UnitFrames")) then
	dwRegisterMod(
		"EN_UnitFrames",
		EUF_TITLE,
		"EN_UnitFrames Assist",
		"",
		"Interface\\Icons\\INV_Helmet_74",		
		nil
	);

	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_PLAYERFRAME_ENABLE,
		"",
		"PlayerFrameExtend",
		1,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("EN_UnitFrames")) then
					dwLoadAddOn("EN_UnitFrames");
				end
				
				EUF_Options_Update("PLAYERHPMP",1);							
				EUF_Options_Update("PLAYERPETHPMP",1);				
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_Options_Update("PLAYERHPMP",0);							
					EUF_Options_Update("PLAYERPETHPMP",0);						
				end
			end
		end
	);

	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_PLAYERFRAME_XPBAR,
		"",
		"PlayerFrameXPBar",
		1,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_XPBarToggle(true);
				end
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_XPBarToggle(false);
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_TARGETFRAME_ENABLE,
		"",
		"TargetFrameExtend",
		1,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("EN_UnitFrames")) then
					dwLoadAddOn("EN_UnitFrames");
				end
				EUF_Options_Update("TARGETHPMP",1);
				EUF_Options_Update("TARGETCLASSICONSMALL",1);
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_Options_Update("TARGETHPMP",0);
					EUF_Options_Update("TARGETCLASSICONSMALL",0);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_TARGETFRAME_PERCENT	,
		"",
		"TargetPercent",
		1,
		function (arg)			
			if (arg == 1) then				
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_Options_Update("TARGETHPMPPERCENT",1);					
				end
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_Options_Update("TARGETHPMPPERCENT",0);					
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_TARGETTARGET_ENABLE,
		"",
		"TOT",
		1,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("EN_UnitFrames")) then
					dwLoadAddOn("EN_UnitFrames");
				end
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					dwTargetTOT_Toggle(true);
				end
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					dwTargetTOT_Toggle(false);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_TARGETTARGETTARGET,
		"",
		"TOTOT",
		1,
		function (arg)
			if (arg == 1) then						
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EN_ToToT_Toggle(true);
				end
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EN_ToToT_Toggle(false);
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_FOCUSFRAME_EANBLE,
		"",
		"FocusFrame",
		1,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					SetCVar("fullSizeFocusFrame", "1");
					FocusFrame_SetSmallSize(false, true);
				end
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					SetCVar("fullSizeFocusFrame", "0");
					FocusFrame_SetSmallSize(true, true);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_PARTYFRAME_ENABLE ,
		"",
		"PartyExtend",
		1,
		function (arg)
			if (arg == 1) then
				if (not dwIsAddOnLoaded("EN_UnitFrames")) then
					dwLoadAddOn("EN_UnitFrames");
				end				
				EUF_PartyInfoToggle(true);
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_PartyInfoToggle(false);
				end
			end
		end
	);
	
	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_PARTYFRAME_TARGET	,
		"",
		"PartyTarget",
		1,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					PartyTarget_Toggle(true);
				end
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					PartyTarget_Toggle(false);
				end
			end
		end,
		1
	);
	
	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_SHOW_PARTYBUFF,
		"",
		"PartyBuff",
		1,
		function (arg)		
			if (arg == 1) then				
				if (dwIsAddOnLoaded("EN_UnitFrames")) then	
					EUF_TogglePartyBuffs(true);
				end
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_TogglePartyBuffs(false);
				end
			end
		end,
		1
	);	

	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_PARTYFRAME_CASTBAR,
		"",
		"PartyCast",
		0,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					PartyCast_Toggle(true)
				end
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					PartyCast_Toggle(false);
				end
			end
		end,
		1
	);
	
	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_3DPORTRAIT_ENABLE,
		"",
		"3DPortrait",
		0,
		function (arg)
			if (arg == 1) then
				if (not dwIsAddOnLoaded("EN_UnitFrames")) then
					dwLoadAddOn("EN_UnitFrames");
				end				
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_Options_Update("3DPORTRAIT",1);					
				end				
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_Options_Update("3DPORTRAIT",0);					
				end
			end
		end		
	);
	
	dwRegisterCheckButton(
		"EN_UnitFrames",
		EUF_AUTOHEALTHCOLOR,
		"",
		"AutoHealthColor",
		1,
		function (arg)
			if (arg == 1) then
				if (not dwIsAddOnLoaded("EN_UnitFrames")) then
					dwLoadAddOn("EN_UnitFrames");
				end
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_Options_Update("AUTOHEALTHCOLOR",1);					
				end				
			else
				if (dwIsAddOnLoaded("EN_UnitFrames")) then
					EUF_Options_Update("AUTOHEALTHCOLOR",0);				
				end
			end
		end		
	);
end