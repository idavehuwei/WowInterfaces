------------------------------------
-- dugu@bigfoot 2009-12-22
local L = {};
if (GetLocale() == "zhCN") then
	PVP_TITLE = "PVP助手";
	-- battle info
	PVP_BATTLEINFO_ENABLE = "开启战场指示器";
	PVP_BATTLEINFO_SHOWHELP = "显示帮助信息";
	PVP_BATTLEINFO_AUTORELEASE= "自动释放灵魂";
	PVP_BATTLEINFO_AUTOLEV = "自动离场";
	PVP_BATTLEINFO_LEVTIME = "停留时间(秒)";
	PVP_BATTLEINFO_SAYTO = "报告新场到";
	PVP_BATTLEINFO_AUTOSAYTO = "加入队列时自动报告新场";
	PVP_BATTLEINFO_GAINSPEED = "计算上一场荣誉获得速度";
	PVP_BATTLEINFO_IGLEFT = "屏蔽战场结束时侯的离队信息";	
	-- 竞技场	
	PVP_GLADIUS_ENABLE = "开启竞技场助手";
	PVP_GLADIUS_OPTION ="打开配置";	
	L.SELF="自己"
	L.SAY="说"
	L.YELL="大喊"
	L.PARTY="团队/小队"
	L.RAID="团队/小队"
	L.CURRENT="当前聊天"
	L.CHATBOX="输入框中"
elseif (GetLocale() == "zhTW") then
	PVP_TITLE = "PVP助手";
	-- battle info
	PVP_BATTLEINFO_ENABLE = "開啟戰場指示器";
	PVP_BATTLEINFO_SHOWHELP = "顯示幫助資訊";
	PVP_BATTLEINFO_AUTORELEASE= "自動釋放靈魂";
	PVP_BATTLEINFO_AUTOLEV = "自動離場";
	PVP_BATTLEINFO_LEVTIME = "停留時間(秒)";
	PVP_BATTLEINFO_SAYTO = "報告新場到";
	PVP_BATTLEINFO_AUTOSAYTO = "加入佇列時自動報告新場";
	PVP_BATTLEINFO_GAINSPEED = "計算上一場榮譽获得速度";
	PVP_BATTLEINFO_IGLEFT = "遮罩戰場結束時侯的離隊資訊";	
	-- 競技場	
	PVP_GLADIUS_ENABLE = "開啟競技場助手";
	PVP_GLADIUS_OPTION ="打開配置";	
	L.SELF="自己"
	L.SAY="說"
	L.YELL="大喊"
	L.PARTY="團隊/小隊"
	L.RAID="團隊/小隊"
	L.CURRENT="當前聊天"
	L.CHATBOX="輸入框中"
else
	PVP_TITLE = "PVP助手";
	-- battle info
	PVP_BATTLEINFO_ENABLE = "开启战场指示器";
	PVP_BATTLEINFO_SHOWHELP = "显示帮助信息";
	PVP_BATTLEINFO_AUTORELEASE= "自动释放灵魂";
	PVP_BATTLEINFO_AUTOLEV = "自动离开战场";
	PVP_BATTLEINFO_LEVTIME = "停留时间(s)";
	PVP_BATTLEINFO_SAYTO = "报告新场到";
	PVP_BATTLEINFO_AUTOSAYTO = "加入队列时自动报告新场";
	PVP_BATTLEINFO_GAINSPEED = "计算上一场荣誉活的速度";
	PVP_BATTLEINFO_IGLEFT = "屏蔽战场结束时侯的离队信息";	
	-- 竞技场	
	PVP_GLADIUS_ENABLE = "开启竞技场助手";
	PVP_GLADIUS_OPTION ="打开配置";	
	L.SELF="Self"
	L.SAY="Say"
	L.YELL="Yell"
	L.PARTY="Raid / Party"
	L.RAID="Raid / Party"
	L.CURRENT="Current chat"
	L.CHATBOX="Chat Box"
end

if (dwIsConfigurableAddOn("BattleInfo") or dwIsConfigurableAddOn("Gladius")) then
	dwRegisterMod(
		"PVPHISTRY",
		PVP_TITLE,
		"PVP",
		"",
		"Interface\\ICONS\\Ability_Rogue_ShadowStrikes",
		nil
	);
end

if (dwIsConfigurableAddOn("BattleInfo")) then
	dwRegisterCheckButton(
		"PVPHISTRY",
		PVP_BATTLEINFO_ENABLE,
		nil,
		"BattleInfoEnable",
		1,
		function (arg)			
			if(arg==1)then
				if (not IsAddOnLoaded("BattleInfo")) then
					LoadAddOn("BattleInfo");				
				end				
			else			
			end
		end
	);

	dwRegisterCheckButton(
		"PVPHISTRY",
		PVP_BATTLEINFO_SHOWHELP,
		nil,
		"BattleInfoShowHelp",
		1,
		function (arg)			
			if(arg==1)then
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.showhelp = true;
				end
			else
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.showhelp = false;
				end
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"PVPHISTRY",
		PVP_BATTLEINFO_AUTORELEASE,
		nil,
		"BattleInfoAutoRelease",
		0,
		function (arg)
			if(arg==1)then
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.autorelease = true;	
				end
			else
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.autorelease = false;
				end
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"PVPHISTRY",
		PVP_BATTLEINFO_AUTOLEV,
		nil,
		"BattleInfoAutoLev",
		1,
		function (arg)			
			if(arg==1)then
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.autoleave = true;	
				end
			else
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.autoleave = false;
				end
			end
		end,
		1
	);

	dwRegisterSpinBox(
		"PVPHISTRY",
		PVP_BATTLEINFO_LEVTIME, 
		DUOWAN_SPINBOX_RANGE, 
		"BattleInfoLevTime", 
		{1, 120, 1}, 
		3, 
		function(arg)
			if (IsAddOnLoaded("BattleInfo")) then
				DuowanAddon_BattleInfoDB.leavetime = arg;
			end
		end, 
		2
	);

	dwRegisterCheckButton(
		"PVPHISTRY",
		PVP_BATTLEINFO_AUTOSAYTO,
		nil,
		"BattleInfoAutoSayTo",
		1,
		function (arg)			
			if(arg==1)then	
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.selfsay = true;
				end
			else
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.selfsay = false;
				end
			end
		end,
		1
	);

	dwRegisterSpinBox(
		"PVPHISTRY",
		PVP_BATTLEINFO_SAYTO, 
		nil, 
		"BattleInfoSayTo", 
		{L.SELF, L.SAY, L.YELL, L.PARTY, L.RAID, L.CURRENT}, 
		L.SELF, 
		function(arg)
			if (IsAddOnLoaded("BattleInfo")) then
				DuowanAddon_BattleInfoDB.sayto = arg;
			end
		end, 
		2
	);

	dwRegisterCheckButton(
		"PVPHISTRY",
		PVP_BATTLEINFO_GAINSPEED,
		nil,
		"BattleInfoShowStat",
		1,
		function (arg)
			if(arg==1)then	
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.showstat = true;
				end
			else
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.showstat = false;
				end
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"PVPHISTRY",
		PVP_BATTLEINFO_IGLEFT,
		nil,
		"BattleInfoIgLeft",
		1,
		function (arg)			
			if(arg==1)then
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.igleft = true;
				end
			else
				if (IsAddOnLoaded("BattleInfo")) then
					DuowanAddon_BattleInfoDB.igleft = false;
				end
			end
		end,
		1
	);
end


if (dwIsConfigurableAddOn("Gladius")) then
	dwRegisterCheckButton(
		"PVPHISTRY",
		PVP_GLADIUS_ENABLE,
		nil,
		"GladiusEnable",
		1,
		function (arg)
			if(arg==1)then
				if(not IsAddOnLoaded("Gladius"))then
					LoadAddOn("Gladius");
				end
				Gladius:Toggle(true);
			else
				if(IsAddOnLoaded("Gladius"))then
					Gladius:Toggle(false);
				end
			end
		end
	);
		
	dwRegisterButton(
		"PVPHISTRY",
		PVP_GLADIUS_OPTION, 
		function()
			if (IsAddOnLoaded("Gladius")) then
				--HideUIPanel(DuowanConfigFrame);				
				Gladius:ShowOptions();
			end
		end, 
		1
	);
end
