------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	BUFFTIMER_TITLE = "魔法增益";
	BUFFTIMER_ENABLE = "显示玩家详细的Buff时间";
	TCC_BUFF_CD = "显示BUFF计时";
	TCC_BUFF_POINT_DESC = "显示位置:";	
	TCC_BUFF_POINT = {"左上", "上边", "右上", "左边", "正中", "右边", "左下", "底部", "右下"};
	BUFFFACADE_TITLE = "开启魔法增益美化皮肤";
elseif (GetLocale() == "zhTW") then
	BUFFTIMER_TITLE = "魔法增益";
	BUFFTIMER_ENABLE = "顯示玩家詳細的Buff時間";	
	TCC_BUFF_CD = "顯示BUFF計時";
	TCC_BUFF_POINT_DESC = "顯示位置:";	
	TCC_BUFF_POINT = {"左上", "上邊", "右上", "左邊", "正中", "右邊", "左下", "底部", "右下"};
	BUFFFACADE_TITLE = "開啟魔法增益美化皮膚";
else
	BUFFTIMER_TITLE = "魔法增益";
	BUFFTIMER_ENABLE = "显示玩家详细的Buff时间";	
	TCC_BUFF_CD = "显示BUFF计时";
	TCC_BUFF_POINT_DESC = "显示位置:";	
	TCC_BUFF_POINT = {"左上", "上边", "右上", "左边", "正中", "右边", "左下", "底部", "右下"};
	BUFFFACADE_TITLE = "开启魔法增益美化皮肤";
end

if (dwIsConfigurableAddOn("BuffTimer") or dwIsConfigurableAddOn("Love")) then	
	dwRegisterMod(
		"BuffTimer",
		BUFFTIMER_TITLE,
		"BuffTimer",
		"",
		"Interface\\ICONS\\Spell_Holy_ImprovedResistanceAuras",
		nil
	);
end

if (dwIsConfigurableAddOn("BuffTimer")) then
	dwRegisterCheckButton(
		"BuffTimer",
		BUFFTIMER_ENABLE,
		nil,
		"BuffTimerEnable",
		1,
		function (arg)		
			if arg==1 then
				dwLoadAddOn("BuffTimer");
				
				BuffTimer_Toggle(true);
			else
				if (dwIsAddOnLoaded("BuffTimer")) then	
					BuffTimer_Toggle(false);
				end				
			end
		end
	);	
	dwRegisterCheckButton(
		"BuffTimer",
		TCC_BUFF_CD,
		"",
		"EnableTCCICON",
		0,
		function (arg)		
			if (arg == 1) then
				dwLoadAddOn("tdCooldown2");
				
				tdCooldown2:SetCurVal("BUFF", "config", true);				
			else
				if (dwIsAddOnLoaded("tdCooldown2")) then
					tdCooldown2:SetCurVal("BUFF", "config", false);
				end
			end
		end		
	);

	dwRegisterSpinBox(
		"BuffTimer",
		TCC_BUFF_POINT_DESC,
		nil, 
		"AnchorPoint", 
		TCC_BUFF_POINT, 
		TCC_BUFF_POINT[5], 
		function(arg)
			tdCooldown2:SetBuffAchor(arg);
		end,
		1
	);
end

if (dwIsConfigurableAddOn("Love")) then
	dwRegisterCheckButton(
		"BuffTimer",
		BUFFFACADE_TITLE,
		nil,
		"BuffFacadeEnable",
		1,
		function (arg)		
			if arg==1 then
				dwLoadAddOn("Love");
				
				dwBuffFacade_Toggle(true);
			else
				if (dwIsAddOnLoaded("Love")) then	
					dwBuffFacade_Toggle(false);
				end				
			end
		end
	);
end