------------------------------------
-- dugu 2009-12-22
local L = {};
if (GetLocale() == "zhCN") then
	BATTLEINFO_TITLE = "战场指示器";
	-- battle info
	BATTLEINFO_ENABLE = "开启战场指示器";
	BATTLEINFO_SHOWHELP = "显示帮助信息";
	BATTLEINFO_AUTORELEASE= "自动释放灵魂";
	BATTLEINFO_AUTOLEV = "自动离场";
	BATTLEINFO_LEVTIME = "停留时间(秒)";
	BATTLEINFO_SAYTO = "报告新场到";
	BATTLEINFO_AUTOSAYTO = "加入队列时自动报告新场";
	BATTLEINFO_GAINSPEED = "计算上一场荣誉获得速度";
	BATTLEINFO_IGLEFT = "屏蔽战场结束时侯的离队信息";	

	L.SELF="自己"
	L.SAY="说"
	L.YELL="大喊"
	L.PARTY="团队/小队"
	L.RAID="团队/小队"
	L.CURRENT="当前聊天"
	L.CHATBOX="输入框中"
elseif (GetLocale() == "zhTW") then
	BATTLEINFO_TITLE = "戰場指示器";
	-- battle info
	BATTLEINFO_ENABLE = "開啟戰場指示器";
	BATTLEINFO_SHOWHELP = "顯示幫助資訊";
	BATTLEINFO_AUTORELEASE= "自動釋放靈魂";
	BATTLEINFO_AUTOLEV = "自動離場";
	BATTLEINFO_LEVTIME = "停留時間(秒)";
	BATTLEINFO_SAYTO = "報告新場到";
	BATTLEINFO_AUTOSAYTO = "加入佇列時自動報告新場";
	BATTLEINFO_GAINSPEED = "計算上一場榮譽获得速度";
	BATTLEINFO_IGLEFT = "遮罩戰場結束時侯的離隊資訊";	

	L.SELF="自己"
	L.SAY="說"
	L.YELL="大喊"
	L.PARTY="團隊/小隊"
	L.RAID="團隊/小隊"
	L.CURRENT="當前聊天"
	L.CHATBOX="輸入框中"
else
	BATTLEINFO_TITLE = "战场指示器";
	-- battle info
	BATTLEINFO_ENABLE = "开启战场指示器";
	BATTLEINFO_SHOWHELP = "显示帮助信息";
	BATTLEINFO_AUTORELEASE= "自动释放灵魂";
	BATTLEINFO_AUTOLEV = "自动离场";
	BATTLEINFO_LEVTIME = "停留时间(秒)";
	BATTLEINFO_SAYTO = "报告新场到";
	BATTLEINFO_AUTOSAYTO = "加入队列时自动报告新场";
	BATTLEINFO_GAINSPEED = "计算上一场荣誉获得速度";
	BATTLEINFO_IGLEFT = "屏蔽战场结束时侯的离队信息";	

	L.SELF="自己"
	L.SAY="说"
	L.YELL="大喊"
	L.PARTY="团队/小队"
	L.RAID="团队/小队"
	L.CURRENT="当前聊天"
	L.CHATBOX="输入框中"
end

if (dwIsConfigurableAddOn("BattleInfo")) then
	dwRegisterMod(
		"BattleGroundMod",
		BATTLEINFO_TITLE,
		"BattleGroundMod",
		"",
		"Interface\\ICONS\\Ability_Rogue_ShadowStrikes",
		nil
	);
end

if (dwIsConfigurableAddOn("BattleInfo")) then
	dwRegisterCheckButton(
		"BattleGroundMod",
		BATTLEINFO_ENABLE,
		nil,
		"BattleInfoEnable",
		1,
		function (arg)			
			if(arg==1)then
				if (not dwIsAddOnLoaded("BattleInfo")) then
					dwLoadAddOn("BattleInfo");				
				end				
			else			
			end
		end
	);

	dwRegisterCheckButton(
		"BattleGroundMod",
		BATTLEINFO_SHOWHELP,
		nil,
		"BattleInfoShowHelp",
		1,
		function (arg)			
			if(arg==1)then
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("showhelp",true);
				end
			else
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("showhelp",false);
				end
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"BattleGroundMod",
		BATTLEINFO_AUTORELEASE,
		nil,
		"BattleInfoAutoRelease",
		0,
		function (arg)
			if(arg==1)then
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("autorelease",true);	
				end
			else
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("autorelease",false);
				end
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"BattleGroundMod",
		BATTLEINFO_AUTOLEV,
		nil,
		"BattleInfoAutoLev",
		1,
		function (arg)			
			if(arg==1)then
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("autoleave",true);	
				end
			else
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("autoleave",false);
				end
			end
		end,
		1
	);

	dwRegisterSpinBox(
		"BattleGroundMod",
		BATTLEINFO_LEVTIME, 
		DUOWAN_SPINBOX_RANGE, 
		"BattleInfoLevTime", 
		{1, 120, 1}, 
		3, 
		function(arg)
			if (dwIsAddOnLoaded("BattleInfo")) then
				BattleInfo_SetValue("leavetime",arg);
			end
		end, 
		2
	);

	dwRegisterCheckButton(
		"BattleGroundMod",
		BATTLEINFO_AUTOSAYTO,
		nil,
		"BattleInfoAutoSayTo",
		1,
		function (arg)			
			if(arg==1)then	
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("selfsay",true);
				end
			else
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("selfsay",false);
				end
			end
		end,
		1
	);

	dwRegisterSpinBox(
		"BattleGroundMod",
		BATTLEINFO_SAYTO, 
		nil, 
		"BattleInfoSayTo", 
		{L.SELF, L.SAY, L.YELL, L.PARTY, L.RAID, L.CURRENT}, 
		L.SELF, 
		function(arg)
			if (dwIsAddOnLoaded("BattleInfo")) then
				BattleInfo_SetValue("sayto",arg);
			end
		end, 
		2
	);

	dwRegisterCheckButton(
		"BattleGroundMod",
		BATTLEINFO_GAINSPEED,
		nil,
		"BattleInfoShowStat",
		1,
		function (arg)
			if(arg==1)then	
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("showstat",true);
				end
			else
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("showstat",false);
				end
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"BattleGroundMod",
		BATTLEINFO_IGLEFT,
		nil,
		"BattleInfoIgLeft",
		1,
		function (arg)			
			if(arg==1)then
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("igleft",true);
				end
			else
				if (dwIsAddOnLoaded("BattleInfo")) then
					BattleInfo_SetValue("igleft",false);
				end
			end
		end,
		1
	);
end
