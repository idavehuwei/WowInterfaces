DKPSystem = 0;
if not MerDKP_Table then
    MerDKP_Table = {}
end

MerDKP_Table_init = {};

UIPanelWindows["CT_RaidTrackerFrame"] = { area = "left", pushable = 1, whileDead = 1 };
CT_RaidTracker_Online = { };

if (not dwReloadUI) then
	StaticPopupDialogs["DUOWAN_RELOADUI"] = {
		text = "确定|cffff7000重新载入界面|r?",
		button1 = TEXT(OKAY),
		button2 = TEXT(CANCEL),
		OnAccept = function()		
			ReloadUI();
		end,
		OnCancel = function()
		end,
		timeout = 30,
		showAlert = 1,
		hideOnEscape = 1
	};

	function dwReloadUI()
		StaticPopup_Show("DUOWAN_RELOADUI");	
	end
end

function GetCurrentDungeonDifficulty()
	local SysDif = 1;	--小队：1=普通 2=英雄		团队：1=10人  2=25人  3=10人(英雄)  4=25人(英雄)
	local EQDif = 0;	--返回值：1=普通  2=英雄  0=未知
	if UnitInRaid("player") then
		SysDif = GetRaidDifficulty();
		if not SysDif then return 0;end
		if SysDif == 1 or SysDif == 2 then
			EQDif = 1;
		else
			EQDif = 2;
		end
	elseif GetNumPartyMembers() > 0 then
		SysDif = GetDungeonDifficulty();
		if not SysDif then return 0;end
		if SysDif == 1 then
			EQDif = 1;
		else
			EQDif = 2;
		end
	end
	return EQDif;
end

CT_RaidTracker_Version = "WOLK1.0 beta14";--GetAddOnMetadata("CT_RaidTracker", "Version");
CT_RaidTracker_Revision = "1576";--GetAddOnMetadata("CT_RaidTracker", "X-Revision");
CT_RaidTracker_Events = { };
CT_RaidTracker_RaidLog = { };
CT_RaidTracker_GetCurrentRaid = nil;

--xd
CT_RaidTracker_Items = { };
CT_RaidTracker_Jihefen = { };

CT_RaidTracker_LastPage = { };

CT_RaidTracker_SortOptions = {
	["method"] = "name",
	["way"] = "asc",
	["itemmethod"] = "looted",
	["itemway"] = "asc",
	["itemfilter"] = 1,
	["playerraidway"] = "desc",
	["playeritemfilter"] = 1,
	["playeritemmethod"] = "name",
	["playeritemway"] = "asc",
	["itemhistorymethod"] = "name",
	["itemhistoryway"] = "asc"
};

CT_RaidTracker_RarityTable = {
	["ff9d9d9d"] = 1,
	["ffffffff"] = 2,
	["ff1eff00"] = 3,
	["ff0070dd"] = 4,
	["ffa335ee"] = 5,
	["ffff8000"] = 6,
	["ffe6cc80"] = 7,
};

CT_RaidTracker_SexTable = {
	[1] = '男性',
	[2] = '女性',
	[3] = '中性',
}
CT_RaidTracker_ClassTable = {
	["WARRIOR"] = '1',
	["ROGUE"] = '4',
	["HUNTER"] = '3',
	["PALADIN"] = '2',
	["SHAMAN"] = '7',
	["DRUID"] = '11',
	["WARLOCK"] = '9',
	["MAGE"] = '8',
	["PRIEST"] = '5',
	["DEATHKNIGHT"] = '6',
	["UNKNOW"] = '0',
}

CT_RaidTracker_RaceTable = {
	["Gnome"] = '侏儒',
	["Human"] = '人类',
	["Dwarf"] = '矮人',
	["NightElf"] = '暗夜精灵',
	["Troll"] = '巨魔',
	["Scourge"] = '亡灵', --Undead
	["Orc"] = '兽人',
	["Tauren"] = '牛头人',
	["Draenei"] = '德莱尼',
	["BloodElf"] = '血精灵',
	["UNKNOW"] = '未知种族',
}

CT_RaidTracker_DifficultyTable = {
    [1] = "普通模式",
    [2] = "英雄模式",
    [3] = "史诗模式",
}
CT_RaidTracker_Options = {
	["NewRaidOnNewZone"] = 0,
	["24hFormat"] = 1,
	["AutoZone"] = 1,
	["SaveTooltips"] = 1,
	["AskCost"] = 5,
	["Timezone"] = 0,
	["AutoRaidCreation"] = 0,
	["GroupItems"] = 4,
	["AutoBossBoss"] = "",
	["TimeSync"] = 1,
	["AutoBoss"] = 2,
	["LogBattlefield"] = 0,
	["LogGroup"] = 0,
	["WipePercent"] = 0.5,
	["AutoGroup"] = 0,
	["ExportFormat"] = 0,
	["WipeCoolDown"] = 150,
	["GuildSnapshot"] = 0,
	["AutoBossChangeMinTime"] = 120,
	["MaxLevel"] = 70,
	["MinQuality"] = 5,
	["NextBoss"] = 0,
	["SaveExtendedPlayerInfo"] = 1,
	["GetDkpValue"] = 5,
	["Wipe"] = 0,
	["LogAttendees"] = 0,
	["AutoWhisper"] = 1,
	["FilterWhisper"] = 0,
}

CT_RaidTracker_QuickLooter = {"分解_", "仓库_"};


CT_RaidTracker_AutoBossChangedTime = 0;
CT_RaidTracker_LastWipe = 0;
CT_RaidTracker_TimeOffsetStatus = nil;
CT_RaidTracker_TimeOffset = 0;
CT_RaidTracker_CustomZoneTriggers = {};
CT_RaidTracker_ItemOptions = {};
CT_RaidTracker_Temp_Boss = {};

function CT_RaidTracker_RunVersionFix()
	local debugflagpre = CT_RaidTracker_Options["DebugFlag"];
	--CT_RaidTracker_Options["DebugFlag"] = 1;
	if(not CT_RaidTracker_VersionFix) then
		CT_RaidTracker_Debug("VersionFix", 1);
		for k, v in pairs(CT_RaidTracker_RaidLog) do
			if(not CT_RaidTracker_RaidLog[k]["PlayerInfos"]) then
				CT_RaidTracker_RaidLog[k]["PlayerInfos"] = { };
			end
			if ( v["Notes"] ) then
				for notesk, notesv in pairs(v["Notes"]) do
					if(not CT_RaidTracker_RaidLog[k]["PlayerInfos"][notesk]) then
						CT_RaidTracker_RaidLog[k]["PlayerInfos"][notesk] = { };
					end
					CT_RaidTracker_RaidLog[k]["PlayerInfos"][notesk]["note"] = notesv;
					CT_RaidTracker_Debug("VersionFix", 1, "note", k, notesk, notesv);
				end
				CT_RaidTracker_RaidLog[k]["Notes"] = nil;
			end
		end
		CT_RaidTracker_VersionFix = 1;
	end
	if(CT_RaidTracker_VersionFix == 1) then
		CT_RaidTracker_Debug("VersionFix", 2);
		CT_RaidTracker_VersionFix = 2; -- Do not remove tooltips any longer
	end
	if(CT_RaidTracker_VersionFix == 2) then
		CT_RaidTracker_Debug("VersionFix", 3);
		if(CT_RaidTracker_MinQuality) then CT_RaidTracker_Options["MinQuality"] = CT_RaidTracker_MinQuality; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_MinQuality", CT_RaidTracker_MinQuality); end
		if(CT_RaidTracker_AutoRaidCreation) then CT_RaidTracker_Options["AutoRaidCreation"] = CT_RaidTracker_AutoRaidCreation; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_AutoRaidCreation", CT_RaidTracker_AutoRaidCreation); end
		if(CT_RaidTracker_GroupItems) then CT_RaidTracker_Options["GroupItems"] = CT_RaidTracker_GroupItems; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_GroupItems", CT_RaidTracker_GroupItems); end
		if(CT_RaidTracker_GetDkpValue) then CT_RaidTracker_Options["GetDkpValue"] = CT_RaidTracker_GetDkpValue; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_GetDkpValue", CT_RaidTracker_GetDkpValue); end
		if(CT_RaidTracker_OldFormat) then CT_RaidTracker_Options["OldFormat"] = CT_RaidTracker_OldFormat; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_OldFormat", CT_RaidTracker_OldFormat); end
		if(CT_RaidTracker_AutoBoss) then CT_RaidTracker_Options["AutoBoss"] = CT_RaidTracker_AutoBoss; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_AutoBoss", CT_RaidTracker_AutoBoss); end
		if(CT_RaidTracker_AutoBossBoss) then CT_RaidTracker_Options["AutoBossBoss"] = CT_RaidTracker_AutoBossBoss; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_AutoBossBoss", CT_RaidTracker_AutoBossBoss); end
		if(CT_RaidTracker_AutoZone) then CT_RaidTracker_Options["AutoZone"] = CT_RaidTracker_AutoZone; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_AutoZone", CT_RaidTracker_AutoZone); end
		if(CT_RaidTracker_AskCosts) then CT_RaidTracker_Options["AskCost"] = CT_RaidTracker_AskCosts; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_AskCosts", CT_RaidTracker_AskCosts); end
		if(CT_RaidTracker_Timezone) then CT_RaidTracker_Options["Timezone"] = CT_RaidTracker_Timezone; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_Timezone", CT_RaidTracker_Timezone); end
		if(CT_RaidTracker_TimeSync) then CT_RaidTracker_Options["TimeSync"] = CT_RaidTracker_TimeSync; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_TimeSync", CT_RaidTracker_TimeSync); end
		if(CT_RaidTracker_DebugFlag) then CT_RaidTracker_Options["DebugFlag"] = CT_RaidTracker_DebugFlag; CT_RaidTracker_Debug("VersionFix", 3, "CT_RaidTracker_DebugFlag", CT_RaidTracker_DebugFlag); end
		
		for k, v in pairs(CT_RaidTracker_RaidLog) do
			if(CT_RaidTracker_RaidLog[k]["BossKills"] and getn(CT_RaidTracker_RaidLog[k]["BossKills"]) >= 1 and not CT_RaidTracker_RaidLog[k]["BossKills"][1]) then
				local tempbosskills = {};
				for k2, v2 in pairs(CT_RaidTracker_RaidLog[k]["BossKills"]) do
					tempbosskills[k2] = v2;
				end
				CT_RaidTracker_RaidLog[k]["BossKills"] = {};
				for k2, v2 in pairs(tempbosskills) do
					tinsert(CT_RaidTracker_RaidLog[k]["BossKills"],
						{
							["boss"] = k2,
							["time"] = v2,
							["attendees"] = {}
						}
					);
					CT_RaidTracker_Debug("VersionFix", 3, "BossKills", k, k2);
				end
			end
		end
		CT_RaidTracker_VersionFix = 3;
	end
	if(CT_RaidTracker_VersionFix == 3) then
		CT_RaidTracker_Debug("VersionFix", 4);
		for k, v in pairs(CT_RaidTracker_RaidLog) do
			if(CT_RaidTracker_RaidLog[k]["BossKills"]) then
				for k2, v2 in pairs(CT_RaidTracker_RaidLog[k]["BossKills"]) do
					if(type(v2["time"]) == "table") then
						CT_RaidTracker_Debug("VersionFix", 4, "BossKills Fix", k, k2, v2["time"]["boss"], v2["time"]["time"]);
						CT_RaidTracker_RaidLog[k]["BossKills"][k2]["boss"] = v2["time"]["boss"];
						CT_RaidTracker_RaidLog[k]["BossKills"][k2]["attendees"] = v2["time"]["attendees"];
						CT_RaidTracker_RaidLog[k]["BossKills"][k2]["time"] = v2["time"]["time"];
					end
				end
			end
		end
		CT_RaidTracker_VersionFix = 4;
	end
	if(CT_RaidTracker_VersionFix == 4) then
		CT_RaidTracker_Options["Wipe"] = 0;  							-- ask if the group dies if it is a wipe, if all are dead it will not ask
		CT_RaidTracker_Options["WipePercent"] = 0.5;    		-- how many prozent of group must be dead to ask
		CT_RaidTracker_Options["WipeCoolDown"] = 150;			-- how long should death be ignored after a wipe count (seconds)
	--xd	CT_RaidTracker_Options["NextBoss"] = 1;  				-- ask on boss kill whats the next boss is
		
		CT_RaidTracker_VersionFix = 5;
	end
	
	if (CT_RaidTracker_VersionFix == 5) then
--xd		CT_RaidTracker_Options["MaxLevel"] = 80;  -- If player lvl is maxlevel it will not be exported to mldkp
		CT_RaidTracker_Options["MLdkp"] = 1; 			-- Export für mldkp
		CT_RaidTracker_Options["GuildSnapshot"] = 0; -- Snapshots the guildroster on bosskill
		
		CT_RaidTracker_VersionFix = 6;
	end;

	if (CT_RaidTracker_VersionFix == 6) then
		if (CT_RaidTracker_Options["MLdkp"] and CT_RaidTracker_Options["MLdkp"] == 1) then
			CT_RaidTracker_Options["ExportFormat"] = 0;
		else
			if (CT_RaidTracker_Options["OldFormat"] and CT_RaidTracker_Options["OldFormat"] == 1) then
				CT_RaidTracker_Options["ExportFormat"] = 0;
			else
				CT_RaidTracker_Options["ExportFormat"] = 0;
			end;
		end;
		CT_RaidTracker_Options["MLdkp"] = nil;
		CT_RaidTracker_Options["OldFormat"] = nil;
		CT_RaidTracker_VersionFix = 7;
		--CT_RaidTrackerOptionsFrame:Show();
	end;
	
	if (CT_RaidTracker_VersionFix == 7) then
		CT_RaidTracker_Options["NewRaidOnNewZone"] = 0;
		CT_RaidTracker_Options["AutoBossChangeMinTime"] = 120;
		--,32227,32228,32229,32230,32231,32249
		for _,idtoadd in pairs({29434,22450}) do
			local idfound = false;
			for key, val in pairs(CT_RaidTracker_ItemOptions) do
				if(val["id"] == idtoadd) then
					idfound = true;
				end;
			end;
			if (idfound == false) then
				tinsert(CT_RaidTracker_ItemOptions,{
				["id"] = idtoadd,
				["name"] = GetItemInfo(idtoadd),
				["status"] = 0,
				["quality"] = 4,
				});
			end;
		end;

		CT_RaidTracker_VersionFix = 8;
		--CT_RaidTrackerOptionsFrame:Show();
	end;

	if (CT_RaidTracker_VersionFix == 8) then
		for _,idtoadd in pairs({43228,40752,40753}) do
			local idfound = false;
			for key, val in pairs(CT_RaidTracker_ItemOptions) do
				if(val["id"] == idtoadd) then
					idfound = true;
				end;
			end;
			if (idfound == false) then
				tinsert(CT_RaidTracker_ItemOptions,{
				["id"] = idtoadd,
				["name"] = GetItemInfo(idtoadd),
				["status"] = 0,
				["quality"] = 4,
				});
			end;
		end;
		CT_RaidTracker_Options["NewRaidOnBossKill"] = 0;
		
		CT_RaidTracker_VersionFix = 9;
	end
		
	if (CT_RaidTracker_VersionFix == 9) then --beta7
	    for _,idtoadd in pairs({30316,30317,30319,30312,30318,30314,30313,30311,32227,32228,32229,32230,32231,32249}) do --风暴武器+紫色宝石
			local idfound = false;
			for key, val in pairs(CT_RaidTracker_ItemOptions) do
				if(val["id"] == idtoadd) then
					idfound = true;
				end;
			end;
			if (idfound == false) then
				tinsert(CT_RaidTracker_ItemOptions,{
				["id"] = idtoadd,
				["name"] = GetItemInfo(idtoadd),
				["status"] = 0,
				["quality"] = 4,
				});
		       end;
	   end;           
	  
	   CT_RaidTracker_VersionFix = 10;
	end;

	if (CT_RaidTracker_VersionFix == 10) then --beta7
	    for _,idtoadd in pairs({45624,49426,40752,40753,47241}) do --各类纹章
			local idfound = false;
			for key, val in pairs(CT_RaidTracker_ItemOptions) do
				if(val["id"] == idtoadd) then
					idfound = true;
				end;
			end;
			if (idfound == false) then
				tinsert(CT_RaidTracker_ItemOptions,{
				["id"] = idtoadd,
				["name"] = GetItemInfo(idtoadd),
				["status"] = 0,
				["quality"] = 4,
				});
		       end;
	   end;
           
	   CT_RaidTracker_Options["LogAttendees"] = 0;	   
	   CT_RaidTracker_VersionFix = 11;
	   CT_RaidTrackerItemOptionsFrame:Show();
	   CT_RaidTrackerOptionsFrame:Show();
	end;
	
	CT_RaidTracker_Options["DebugFlag"] = debugflagpre;
end

function ML_RaidTracker_LoadCustomOptions()
	if ( ML_RaidTracker_Custom_Options ~= nil ) then
		for key, val in pairs(ML_RaidTracker_Custom_Options) do
			CT_RaidTracker_Options[key] = val;
		end;
	end;
end;

function CT_RaidTracker_GetTime(dDate)
	if ( not dDate ) then
		return nil;
	end
	local _, _, mon, day, year, hr, min, sec = string.find(dDate, "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)");
	local table = date("*t", time());
	local timestamp;
	table["month"] = tonumber(mon);
	table["year"] = tonumber("20" .. year);
	table["day"] = tonumber(day);
	table["hour"] = tonumber(hr);
	table["min"] = tonumber(min);
	table["sec"] = tonumber(sec);
	timestamp = time(table);
	--[[ 
	table = date("*t", timestamp);
	if(table["isdst"]) then
		timestamp = timestamp - 3600;
	end
	]]
	return timestamp;
end

function CT_RaidTracker_SortRaidTable()
	table.sort(
		CT_RaidTracker_RaidLog,
		function(a1, a2)
			if ( a1 and a2 ) then
				return CT_RaidTracker_GetTime(a1.key) > CT_RaidTracker_GetTime(a2.key);
			end
		end
	);
end

function CT_RaidTracker_GameTimeFrame_Update(self)
	CT_RaidTracker_GameTimeFrame_Update_Original(self);
	local hour, minute = GetGameTime();
	local time = ((hour * 60) + minute) * 60;
	if(not CT_RaidTracker_TimeOffsetStatus) then
		CT_RaidTracker_TimeOffsetStatus = time;
	elseif(CT_RaidTracker_TimeOffsetStatus ~= time) then
		local ltimea = date("*t");
		local ltime = (((ltimea["hour"] * 60) + ltimea["min"]) * 60 + ltimea["sec"]) + (CT_RaidTracker_Options["Timezone"] * 3600);
		local timediff;
		if(time > ltime) then
			timediff = time - ltime;
			if(timediff >= 43200) then
				CT_RaidTracker_TimeOffset = timediff - 86400;
			else
				CT_RaidTracker_TimeOffset = timediff;
			end
		elseif(time < ltime) then
			timediff = ltime - time;
			if(timediff >= 43200) then
				CT_RaidTracker_TimeOffset = 86400 - timediff;
			else
				CT_RaidTracker_TimeOffset = timediff * -1;
			end
		else
			CT_RaidTracker_TimeOffset = 0;
		end
		CT_RaidTracker_Debug("CT_RaidTracker_TimeOffset", CT_RaidTracker_TimeOffset);
		GameTimeFrame_Update = CT_RaidTracker_GameTimeFrame_Update_Original;
		CT_RaidTracker_TimeOffsetStatus = nil;
	end
end

function CT_RaidTracker_GetGameTimeOffset()
	if(CT_RaidTracker_TimeOffsetStatus) then
		return;
	end
	if(not CT_RaidTracker_GameTimeFrame_Update_Original) then
		CT_RaidTracker_GameTimeFrame_Update_Original = GameTimeFrame_Update;
	end
	GameTimeFrame_Update = CT_RaidTracker_GameTimeFrame_Update;
	return;
end

function CT_RaidTracker_GetRaidTitle(id, hideid, showzone, shortdate)
	local RaidTitle = "";
	if ( CT_RaidTracker_RaidLog[id] and CT_RaidTracker_RaidLog[id].key ) then
		local _, _, mon, day, year, hr, min, sec = string.find(CT_RaidTracker_RaidLog[id].key, "(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)");
		if ( mon ) then
			local months = {
				"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
			};
			if ( not hideid ) then
				RaidTitle = RaidTitle .. "[" .. (getn(CT_RaidTracker_RaidLog)-id+1) .. "] ";
			end
			if ( not shortdate ) then
				RaidTitle = RaidTitle .. months[tonumber(mon)] .. " " .. day .. " '" .. year .. ", " .. hr .. ":" .. min;
			else
				RaidTitle = RaidTitle .. mon .. "/" .. day .. " " .. hr .. ":" .. min;
			end
			if ( showzone and CT_RaidTracker_RaidLog[id].zone) then
				RaidTitle = RaidTitle .. " " .. CT_RaidTracker_RaidLog[id].zone;
			end
            if id == CT_RaidTracker_GetCurrentRaid then
                if MerDKP_Table[DKPSystem]~=nil then
                    RaidTitle = RaidTitle.." |cffffffff"..MerDKP_Table[DKPSystem]["title"]
                end
                RaidTitle = RaidTitle.."  |cff00cc33进行中,结束后导出 ";               
            else
                RaidTitle = RaidTitle.."  |cffffffff已结束,右键导出";
            end
			return RaidTitle;
		else
			return "";
		end
	end
	return "";
end

function CT_RaidTracker_GetLootId(raidid, sPlayer, sItem, sTime)
	CT_RaidTracker_Debug("CT_RaidTracker_GetLootId", raidid, sPlayer, sItem, sTime);
	local lootid = nil;
	for key, val in pairs(CT_RaidTracker_RaidLog[raidid]["Loot"]) do
		if(val["player"] == sPlayer and val["item"]["id"] == sItem and val["time"] == sTime) then
			lootid = key;
			break;
		end
	end
	return lootid;
end

function CT_RaidTracker_Update()
    if(CT_RaidTracker_GetCurrentRaid) then
      CT_RaidTrackerFrameEndRaidButton:Enable();
      CT_RaidTrackerFrameSnapshotButton:Enable();
    else
        CT_RaidTrackerFrameEndRaidButton:Disable();
        --CT_RaidTrackerFrameSnapshotButton:Disable();
    end       
    
    if((GetNumRaidMembers() == 0) and (GetNumPartyMembers() == 0)) then
        CT_RaidTrackerFrameNewRaidButton:Disable();
    else
	    if((GetNumRaidMembers() > 0)) then
        CT_RaidTrackerFrameNewRaidButton:Enable();
      else
		    if((GetNumPartyMembers() > 0) and (CT_RaidTracker_Options["LogGroup"] == 1)) then
	        CT_RaidTrackerFrameNewRaidButton:Enable();
      	else
	        CT_RaidTrackerFrameNewRaidButton:Disable();
      	end;
      end;
    end
    
    if( CT_RaidTracker_GetCurrentRaid ) then
        CT_RaidTrackerFrameNewRaidButton:Disable();
    end
    
    --[[
    if ( CT_RaidTrackerFrame.selected ) then
    	CT_RaidTrackerFrameView2Button:Enable();
    else
    	CT_RaidTrackerFrameView2Button:Disable();
    end
    ]]

	if ( getn(CT_RaidTracker_LastPage) > 0 ) then
		CT_RaidTrackerFrameBackButton:Enable();
	else
		--CT_RaidTrackerFrameBackButton:Disable();
	end
	if ( getn(CT_RaidTracker_RaidLog) > 0 ) then
		if ( CT_RaidTrackerFrame.selected ) then
			local selected;
			if ( not CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected] ) then
				while ( not selected ) do
					if ( CT_RaidTrackerFrame.selected < 1 ) then
						selected = 1;
						CT_RaidTrackerFrame.selected = nil;
					else
						CT_RaidTrackerFrame.selected = CT_RaidTrackerFrame.selected - 1;
						if ( CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected] ) then
							selected = 2;
						end
					end
				end
			end
			if ( not selected or selected == 2 ) then
				if ( not CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected] or getn(CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected]["Loot"]) == 0 ) then
					CT_RaidTrackerFrame.type = "events";
					--CT_RaidTrackerFrameViewButton:Disable();
				else
					CT_RaidTrackerFrameViewButton:Enable();
				end
			end
		end

		CT_EmptyRaidTrackerFrame:Hide();
		CT_RaidTrackerFrameDeleteButton:Enable();

		local hasItem;
		for k, v in pairs(CT_RaidTracker_RaidLog) do
			for key, val in pairs(v["Loot"]) do
				if ( val["player"] == CT_RaidTrackerFrame.player ) then
					hasItem = 1;	
					break;
				end
			end
			if ( hasItem ) then
				break;
			end
		end

		if ( CT_RaidTrackerFrame.type == "raids" or not CT_RaidTrackerFrame.type ) then
	--		CT_RaidTrackerFrameViewButton:SetText("战利品");
		elseif ( CT_RaidTrackerFrame.type == "items" ) then
		--	CT_RaidTrackerFrameViewButton:SetText("团队成员");
		elseif ( CT_RaidTrackerFrame.type == "player" ) then
			if ( not hasItem ) then
	--			CT_RaidTrackerFrameViewButton:Disable();
			else
	--			CT_RaidTrackerFrameViewButton:Enable();
			end
	--		CT_RaidTrackerFrameViewButton:SetText("战利品");
			CT_RaidTrackerFrameDeleteButton:Disable();
		elseif ( CT_RaidTrackerFrame.type == "playeritems" ) then
	--		CT_RaidTrackerFrameViewButton:SetText("团队活动");
			CT_RaidTrackerFrameDeleteButton:Disable();
		if ( not hasItem ) then
		--		CT_RaidTrackerFrame.type = "player";
				CT_RaidTracker_Update();
				CT_RaidTracker_UpdateView();
			end
		elseif ( CT_RaidTrackerFrame.type == "itemhistory" ) then
			CT_RaidTrackerFrameDeleteButton:Disable();
			--CT_RaidTrackerFrameViewButton:Disable();
		elseif ( CT_RaidTrackerFrame.type == "events" ) then
		--	CT_RaidTrackerFrameDeleteButton:Disable();
			--CT_RaidTrackerFrameViewButton:Disable();
		end
	else
        
		CT_EmptyRaidTrackerFrame:Show();
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameEvents:Hide();
		CT_RaidTrackerFrameDeleteButton:Disable();
		CT_RaidTrackerFrameViewButton:Disable();
	end

	local numRaids = getn(CT_RaidTracker_RaidLog);
	local numEntries = numRaids;

	-- ScrollFrame update
	FauxScrollFrame_Update(CT_RaidTrackerListScrollFrame, numEntries, 6, 16, nil, nil, nil, CT_RaidTrackerHighlightFrame, 293, 316 );
	
	CT_RaidTrackerHighlightFrame:Hide();
    
	for i=1, 6, 1 do
		local title = dwGetglobal("CT_RaidTrackerTitle" .. i);
		local normaltext = dwGetglobal("CT_RaidTrackerTitle" .. i .. "NormalText");
		local highlighttext = dwGetglobal("CT_RaidTrackerTitle" .. i .. "HighlightText");
		local disabledtext = dwGetglobal("CT_RaidTrackerTitle" .. i .. "DisabledText");
		local highlight = dwGetglobal("CT_RaidTrackerTitle" .. i .. "Highlight");

		local index = i + FauxScrollFrame_GetOffset(CT_RaidTrackerListScrollFrame); 
		if ( index <= numEntries ) then
			local raidTitle = CT_RaidTracker_GetRaidTitle(index, nil, 1, 1);
			local raidTag = CT_RaidTracker_RaidLog[index]["note"];
			if ( not raidTag ) then
				raidTag = "";
			else
				raidTag = " (" .. raidTag .. ")";
			end
			if ( raidTitle ) then
				title:SetText(raidTitle .. raidTag);
			else
				title:SetText("");
			end
			title:Show();
			-- Place the highlight and lock the highlight state
			if ( CT_RaidTrackerFrame.selected and CT_RaidTrackerFrame.selected == index ) then
				CT_RaidTrackerSkillHighlight:SetVertexColor(1, 1, 0);
				CT_RaidTrackerHighlightFrame:SetPoint("TOPLEFT", "CT_RaidTrackerTitle"..i, "TOPLEFT", 0, 0);
				CT_RaidTrackerHighlightFrame:Show();
				title:LockHighlight();
			else
				title:UnlockHighlight();
			end
			
		else
			title:Hide();
		end

	end
end

function CT_RaidTracker_SelectRaid(id)
	local raidid = id + FauxScrollFrame_GetOffset(CT_RaidTrackerListScrollFrame);
	CT_RaidTracker_GetPage();
	CT_RaidTrackerFrame.selected = raidid;
	--if ( getn(CT_RaidTracker_RaidLog[raidid]["Loot"]) == 0 or ( CT_RaidTrackerFrame.type and CT_RaidTrackerFrame.type ~= "items" ) ) then
		CT_RaidTrackerFrame.type = "events";
	--end    
	CT_RaidTracker_UpdateView();
	CT_RaidTracker_Update();
end

function CT_RaidTracker_ShowInfo(player)
	CT_RaidTracker_GetPage();

	CT_RaidTrackerFrame.type = "player";
	CT_RaidTrackerFrame.player = player;
	CT_RaidTrackerFrame.selected = nil;
	
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_Delete(id, type, typeid)
	CT_RaidTracker_Debug("DELETE", type, typeid);
	if ( type == "raid" ) then
		table.remove(CT_RaidTracker_RaidLog, id);
		if ( id == CT_RaidTracker_GetCurrentRaid ) then
			CT_RaidTracker_GetCurrentRaid = nil;
		end
		if ( CT_RaidTrackerFrame.selected == id ) then
			CT_RaidTrackerFrame.selected = CT_RaidTrackerFrame.selected - 1;
			if ( CT_RaidTrackerFrame.selected < 1 ) then
				CT_RaidTrackerFrame.selected = 1;
			end
			CT_RaidTrackerFrame.type = "events";
		end
	elseif ( type == "item" ) then
		local itemplayer, itemitemid, itemtime;
		itemplayer = this:GetParent().itemplayer;
		itemitemid = this:GetParent().itemitemid;
		itemtime = this:GetParent().itemtime;
		local lootid = CT_RaidTracker_GetLootId(id, itemplayer, itemitemid, itemtime);
		table.remove(CT_RaidTracker_RaidLog[id]["Loot"], lootid);
	elseif ( type == "player" ) then
        local bossid = CT_RaidTrackerFrame.selectedBossid;
        for key, val in pairs(CT_RaidTracker_RaidLog[id]["BossKills"][bossid]["attendees"]) do
            if val == typeid then
                tremove(CT_RaidTracker_RaidLog[id]["BossKills"][bossid]["attendees"],key);		
            end
        end
        CT_RaidTracker_Update_MerDKP(id);
    --[[
		for key, val in pairs(CT_RaidTracker_RaidLog[id]["Join"]) do
			if ( val["player"] == typeid ) then
				CT_RaidTracker_Debug("DELETE", "JOIN", "FOUND PLAYER", key, val["player"]);
				CT_RaidTracker_RaidLog[id]["Join"][key] = nil;
			end
		end
		for key, val in pairs(CT_RaidTracker_RaidLog[id]["Leave"]) do
			if ( val["player"] == typeid ) then
				CT_RaidTracker_Debug("DELETE", "LEAVE", "FOUND PLAYER", key, val["player"]);
				CT_RaidTracker_RaidLog[id]["Leave"][key] = nil;
			end
		end
		if(id == CT_RaidTracker_GetCurrentRaid) then
			CT_RaidTracker_Online[typeid] = nil;
		end
		if(CT_RaidTracker_RaidLog[id]["PlayerInfos"]) then
			CT_RaidTracker_RaidLog[id]["PlayerInfos"][typeid] = nil;
		end
        ]]--
	end
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_Sort(tbl, method, way)
	if ( way == "asc" ) then
		table.sort(
			tbl,
			function(a1, a2)
				return a1[method] < a2[method];
			end
		);
	else
		table.sort(
			tbl,
			function(a1, a2)
				return a1[method] > a2[method];
			end
		);
	end
	return tbl;
end

function CT_RaidTracker_SortPlayerRaids(id)
	if ( CT_RaidTrackerFrame.type == "itemhistory" ) then
		local table = { "name", "looter" };

		if ( CT_RaidTracker_SortOptions["itemhistorymethod"] == table[id] ) then
			if ( CT_RaidTracker_SortOptions["itemhistoryway"] == "asc" ) then
				CT_RaidTracker_SortOptions["itemhistoryway"] = "desc";
			else
				CT_RaidTracker_SortOptions["itemhistoryway"] = "asc";
			end
		else
			CT_RaidTracker_SortOptions["itemhistoryway"] = "asc";
			CT_RaidTracker_SortOptions["itemhistorymethod"] = table[id];
		end
	else		
		if ( CT_RaidTracker_SortOptions["playerraidway"] == "asc" ) then
			CT_RaidTracker_SortOptions["playerraidway"] = "desc";
		else
			CT_RaidTracker_SortOptions["playerraidway"] = "asc";
		end
	end
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_CompareItems(a1, a2)
	-- This function could probably be better, but I can't think of any better way while still maintaining functionality

	local filter, method, way = CT_RaidTracker_SortOptions["itemfilter"], CT_RaidTracker_SortOptions["itemmethod"], CT_RaidTracker_SortOptions["itemway"];
	if ( CT_RaidTrackerFrame.type == "playeritems" ) then
		filter, method, way = CT_RaidTracker_SortOptions["playeritemfilter"], CT_RaidTracker_SortOptions["playeritemmethod"], CT_RaidTracker_SortOptions["playeritemway"];
	end

	-- Check to see if it matches the rarity requirements
	--CT_RaidTracker_Debug(a2["item"]["c"]);
	if ( CT_RaidTracker_RarityTable[a1["item"]["c"]] < filter ) then
		return false;
	elseif ( CT_RaidTracker_RarityTable[a2["item"]["c"]] < filter ) then
		return true;
	end

	if ( method == "name" ) then
		local c1, c2 = a1["item"]["name"], a2["item"]["name"];
		if ( c1 == c2 ) then
			c1, c2 = a1["player"], a2["player"];
		end
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "looter" ) then
		local c1, c2 = a1["player"], a2["player"];
		if ( c1 == c2 ) then
			c1, c2 = CT_RaidTracker_RarityTable[a2["item"]["c"]], CT_RaidTracker_RarityTable[a1["item"]["c"]];
			if ( c1 == c2 ) then
				c1, c2 = a1["item"]["name"], a2["item"]["name"];
			end
		end
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	elseif ( method == "looted" ) then
		if ( way == "asc" ) then
			return CT_RaidTracker_GetTime(a1["time"]) < CT_RaidTracker_GetTime(a2["time"]);
		else
			return CT_RaidTracker_GetTime(a1["time"]) > CT_RaidTracker_GetTime(a2["time"]);
		end
	else
		local c1, c2 = CT_RaidTracker_RarityTable[a1["item"]["c"]], CT_RaidTracker_RarityTable[a2["item"]["c"]];
		if ( c1 == c2 ) then
			c1, c2 = a1["item"]["name"], a2["item"]["name"];
			if ( c1 == c2 ) then
				c1, c2 = a1["player"], a2["player"];
			else
				return c1 < c2;
			end
		end
		if ( way == "asc" ) then
			return c1 < c2;
		else
			return c1 > c2;
		end
	end
end

function CT_RaidTracker_SortItem(tbl, method, way)
    table.sort(
        tbl,
        CT_RaidTracker_CompareItems
    );
    local newtable = {}
    for key, val in pairs(tbl) do
        newtable[key] = val;
    end
    return newtable;
end

function CT_RaidTracker_SortItemBy(id)
	local table = { "name", "looted", "looter", "rarity" };
	local prefix = "";
	if ( CT_RaidTrackerFrame.type == "playeritems" ) then
		prefix = "player";
	end
	if ( CT_RaidTracker_SortOptions[prefix.."itemmethod"] == table[id] ) then
		if ( CT_RaidTracker_SortOptions[prefix.."itemway"] == "asc" ) then
			CT_RaidTracker_SortOptions[prefix.."itemway"] = "desc";
		else
			CT_RaidTracker_SortOptions[prefix.."itemway"] = "asc";
		end
	else
		CT_RaidTracker_SortOptions[prefix.."itemmethod"] = table[id];
		CT_RaidTracker_SortOptions[prefix.."itemway"] = "asc";
	end
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_SortBy(id)
	local table = { "name", "join", "leave" };
	if ( CT_RaidTracker_SortOptions["method"] == table[id] ) then
		if ( CT_RaidTracker_SortOptions["way"] == "asc" ) then
			CT_RaidTracker_SortOptions["way"] = "desc";
		else
			CT_RaidTracker_SortOptions["way"] = "asc";
		end
	else
		CT_RaidTracker_SortOptions["method"] = table[id];
		if ( table[id] ~= "leave" ) then
			CT_RaidTracker_SortOptions["way"] = "asc";
		else
			CT_RaidTracker_SortOptions["way"] = "desc";
		end
	end
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_UpdateView()
	if ( CT_EmptyRaidTrackerFrame:IsVisible() ) then
		return;
	end
	local raidid = CT_RaidTrackerFrame.selected;
    
	
	if (CT_RaidTracker_RaidLog[raidid] == nil) then
		raidid = nil;
	end;
	
	if(CT_RaidTrackerFrame.type == "events") then
	--	CT_RaidTrackerFrameView2Button:SetText("查看活动");
	else
--  	CT_RaidTrackerFrameView2Button:SetText("查看击杀");
		if(not raidid or ((not CT_RaidTracker_RaidLog[raidid]["BossKills"] or getn(CT_RaidTracker_RaidLog[raidid]["BossKills"]) == 0) and (not CT_RaidTracker_RaidLog[raidid]["Events"] or getn(CT_RaidTracker_RaidLog[raidid]["Events"]) == 0))) then
			--CT_RaidTrackerFrameView2Button:Disable();
		else
			CT_RaidTrackerFrameView2Button:Enable();
		end
	end
	if ( CT_RaidTrackerFrame.type == "raids" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Show();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerDetailScrollFrameEvents:Hide();
        local bossid = CT_RaidTrackerFrame.selectedBossid;
		local players = { };
        local bossName = CT_RaidTracker_RaidLog[raidid]["BossKills"][bossid]["boss"];
		if ( CT_RaidTracker_RaidLog[raidid] ) then
			local playerIndexes = { };
            for key, val in pairs(CT_RaidTracker_RaidLog[raidid]["BossKills"][bossid]["attendees"]) do
                players[key] = {};
                players[key]["name"] = val;
                players[key]["join"] = CT_RaidTracker_RaidLog[raidid]["BossKills"][bossid]["boss"];
                local dkp = CT_RaidTracker_RaidLog[raidid]["BossKills"][bossid]["dkp"];
                if dkp == nil then
                    dkp = "0";
                end
                players[key]["leave"] = dkp;
            end

			for k, v in pairs(players) do
				if ( not v["leave"] ) then
					-- Very ugly hack, I know :(
					players[k]["leave"] = 99999999999;
				end
			end
			players = CT_RaidTracker_Sort(players, CT_RaidTracker_SortOptions["method"], CT_RaidTracker_SortOptions["way"]);
			dwGetglobal("CT_RaidTrackerDetailScrollFramePlayers").raidid = raidid;
			dwGetglobal("CT_RaidTrackerDetailScrollFramePlayers").players = players;
			CT_RaidTracker_DetailScrollFramePlayers_Update();
		end
		CT_RaidTrackerParticipantsText:SetText("参与["..bossName.."]的团队成员 (" .. getn(players) .. ")");
		CT_RaidTrackerDetailScrollFramePlayers:Show();
	elseif ( CT_RaidTrackerFrame.type == "items" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameItems:Show();
		CT_RaidTrackerDetailScrollFrameEvents:Hide();
		local numItems, numHidden = 0, 0;
		if ( CT_RaidTracker_RaidLog[raidid] ) then
			local keystoremove = {};
			local loot = CT_RaidTracker_SortItem(CT_RaidTracker_RaidLog[raidid]["Loot"], CT_RaidTracker_SortOptions["itemmethod"], CT_RaidTracker_SortOptions["itemway"]);
			for key, val in pairs(loot) do
				val["thisitemid"] = tonumber(key);
					val["item"]["tooltip"] = CT_RaidTracker_GetItemTooltip(val["item"]["id"]);
					CT_RaidTracker_Debug("TooltipGet", val["item"]["name"]);
				if ( CT_RaidTracker_RarityTable[val["item"]["c"]] >= CT_RaidTracker_SortOptions["itemfilter"] ) then
					numItems = numItems + 1;
				else
					tinsert(keystoremove, key);
					numHidden = numHidden + 1;
				end
			end
			for key, val in pairs(keystoremove) do
				table.remove(loot, val);
			end
			dwGetglobal("CT_RaidTrackerDetailScrollFrameItems").raidid = raidid;
			dwGetglobal("CT_RaidTrackerDetailScrollFrameItems").loot = loot;
			CT_RaidTracker_DetailScrollFrameItems_Update();
			CT_RaidTrackerDetailScrollFrameItems:Show();
		end
		if ( numHidden == 0 ) then
			CT_RaidTrackerItemsText:SetText("战利品 (" .. numItems .. "):");
		else
			CT_RaidTrackerItemsText:SetText("战利品 (" .. numItems .. "/" .. numHidden + numItems .. ")");
		end
		UIDropDownMenu_SetSelectedID(CT_RaidTrackerRarityDropDown, CT_RaidTracker_SortOptions["itemfilter"]);
		local colors = {
			"|c009d9d9d劣质|r",
			"|c00ffffff普通|r",
			"|c001eff00优秀|r",
			"|c000070dd精良|r",
			"|c00a335ee史诗|r",
			"|c00ff8000传说|r",
			"|c00e6cc80神器",
		};
			
		CT_RaidTrackerRarityDropDownText:SetText(colors[CT_RaidTracker_SortOptions["itemfilter"]]);
	elseif ( CT_RaidTrackerFrame.type == "player" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Show();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerDetailScrollFrameEvents:Hide();
		CT_RaidTrackerPlayerRaidTabLooter:Hide();
		CT_RaidTrackerPlayerRaidTab1:SetWidth(300);
		CT_RaidTrackerPlayerRaidTab1Middle:SetWidth(290);
		local name = CT_RaidTrackerFrame.player;

		local raids = { };
		for k, v in pairs(CT_RaidTracker_RaidLog) do
			local isInRaid;
			for key, val in pairs(v["Join"]) do
				if ( val["player"] == name ) then
					tinsert(raids, { k, v });
					break;
				end
			end
		end
		
		table.sort(
			raids,
			function(a1, a2)
				if ( CT_RaidTracker_SortOptions["playerraidway"] == "asc" ) then
					return CT_RaidTracker_GetTime(a1[2]["key"]) < CT_RaidTracker_GetTime(a2[2]["key"]);
				else
					return CT_RaidTracker_GetTime(a1[2]["key"]) > CT_RaidTracker_GetTime(a2[2]["key"]);
				end
			end
		);
		dwGetglobal("CT_RaidTrackerDetailScrollFramePlayer").data = raids;
		dwGetglobal("CT_RaidTrackerDetailScrollFramePlayer").name = name;
		dwGetglobal("CT_RaidTrackerDetailScrollFramePlayer").maxlines = getn(raids);
		CT_RaidTracker_DetailScrollFramePlayer_Update();
		CT_RaidTrackerDetailScrollFramePlayer:Show();
		
		CT_RaidTrackerPlayerText:SetText(name .. "'s Raids (" .. getn(raids) .. "):");
	elseif ( CT_RaidTrackerFrame.type == "itemhistory" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Show();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerDetailScrollFrameEvents:Hide();
		CT_RaidTrackerPlayerRaidTabLooter:Show();
		CT_RaidTrackerPlayerRaidTab1:SetWidth(163);
		CT_RaidTrackerPlayerRaidTab1Middle:SetWidth(155);

		local name, totalItems = CT_RaidTrackerFrame.itemname, 0;

		local items = { };
		for k, v in pairs(CT_RaidTracker_RaidLog) do
			for key, val in pairs(v["Loot"]) do
				if ( val["item"]["name"] == name ) then
					tinsert(items, { k, v, val });
					if ( val["item"]["count"] ) then
						totalItems = totalItems + val["item"]["count"];
					else
						totalItems = totalItems + 1;
					end
				end
			end
		end
		
		table.sort(
			items,
			function(a1, a2)
				if ( CT_RaidTracker_SortOptions["itemhistorymethod"] == "looter" ) then
					if ( CT_RaidTracker_SortOptions["itemhistoryway"] == "asc" ) then
						return a1[3]["player"] < a2[3]["player"];
					else
						return a1[3]["player"] > a2[3]["player"];
					end
				else
					if ( CT_RaidTracker_SortOptions["itemhistoryway"] == "asc" ) then
						return CT_RaidTracker_GetTime(a1[2]["key"]) < CT_RaidTracker_GetTime(a2[2]["key"]);
					else
						return CT_RaidTracker_GetTime(a1[2]["key"]) > CT_RaidTracker_GetTime(a2[2]["key"]);
					end
				end
			end
		);

		dwGetglobal("CT_RaidTrackerDetailScrollFramePlayer").data = items;
		dwGetglobal("CT_RaidTrackerDetailScrollFramePlayer").name = name;
		dwGetglobal("CT_RaidTrackerDetailScrollFramePlayer").maxlines = getn(items);
		CT_RaidTracker_DetailScrollFramePlayer_Update();
		CT_RaidTrackerDetailScrollFramePlayer:Show();
		CT_RaidTrackerPlayerText:SetText(name .. " (" .. getn(items) .. "/" .. totalItems .. "):");
	elseif ( CT_RaidTrackerFrame.type == "events" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameEvents:Show();
		CT_RaidTrackerDetailScrollFrameItems:Hide();
		CT_RaidTrackerPlayerBossesTabBoss:Show();
		CT_RaidTrackerPlayerBossesTab1:SetWidth(163);
		CT_RaidTrackerPlayerBossesTab1Middle:SetWidth(155);

		local events = {};
		if ( CT_RaidTracker_RaidLog[raidid] and CT_RaidTracker_RaidLog[raidid]["BossKills"] ) then
			for key, val in pairs(CT_RaidTracker_RaidLog[raidid]["BossKills"]) do
				tinsert(events, val);
			end
		end
		dwGetglobal("CT_RaidTrackerDetailScrollFrameEvents").raidid = raidid;
		dwGetglobal("CT_RaidTrackerDetailScrollFrameEvents").events = events;
		
		CT_RaidTrackerEventsText:SetText("加减分");
		CT_RaidTracker_DetailScrollFrameBoss_Update();
		CT_RaidTrackerDetailScrollFrameEvents:Show();
	elseif ( CT_RaidTrackerFrame.type == "playeritems" ) then
		CT_RaidTrackerDetailScrollFramePlayers:Hide();
		CT_RaidTrackerDetailScrollFramePlayer:Hide();
		CT_RaidTrackerDetailScrollFrameItems:Show();
		CT_RaidTrackerDetailScrollFrameEvents:Hide();
		local name = CT_RaidTrackerFrame.player;

		local loot = { };
		for k, v in pairs(CT_RaidTracker_RaidLog) do
			for key, val in pairs(v["Loot"]) do
				if ( val["player"] == name ) then
					tinsert(
						loot,
						{
							["note"] = val["note"],
							["player"] = val["player"],
							["time"] = val["time"],
							["item"] = val["item"],
							["ids"] = { k, key }
						}
					);
				end
			end
		end

		local numItems, numHidden = 0, 0;
		local keystoremove = {};
		loot = CT_RaidTracker_SortItem(loot, CT_RaidTracker_SortOptions["playeritemmethod"], CT_RaidTracker_SortOptions["playeritemway"]);
		for key, val in pairs(loot) do
			if ( CT_RaidTracker_RarityTable[val["item"]["c"]] >= CT_RaidTracker_SortOptions["playeritemfilter"] ) then
				numItems = numItems + 1;
			else
				tinsert(keystoremove, key);
				numHidden = numHidden + 1;
			end
		end
		for key, val in pairs(keystoremove) do
			table.remove(loot, val);
		end
		dwGetglobal("CT_RaidTrackerDetailScrollFrameItems").raidid = raidid;
		dwGetglobal("CT_RaidTrackerDetailScrollFrameItems").loot = loot;
		CT_RaidTracker_DetailScrollFrameItems_Update();
		if ( numHidden == 0 ) then
			CT_RaidTrackerItemsText:SetText(name .. "的拾取 (" .. numItems .. "):");
		else
			CT_RaidTrackerItemsText:SetText(name .. "的拾取 (" .. numItems .. "/" .. numHidden + numItems .. "):");
		end

		UIDropDownMenu_SetSelectedID(CT_RaidTrackerRarityDropDown, CT_RaidTracker_SortOptions["playeritemfilter"]);
		local colors = {
			"|c009d9d9d劣质|r",
			"|c00ffffff普通|r",
			"|c001eff00优秀|r",
			"|c000070dd精良|r",
			"|c00a335ee史诗|r",
			"|c00ff8000传说|r",
			"|c00e6cc80神器",
		};
			
		CT_RaidTrackerRarityDropDownText:SetText(colors[CT_RaidTracker_SortOptions["playeritemfilter"]]);
	end
end

function CT_RaidTracker_DetailScrollFramePlayers_Update()
	local raidid = dwGetglobal("CT_RaidTrackerDetailScrollFramePlayers").raidid;
	local players = dwGetglobal("CT_RaidTrackerDetailScrollFramePlayers").players;
	local maxlines = getn(players);
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(CT_RaidTrackerDetailScrollFramePlayers, maxlines, 11, 18);
	for line=1, 11 do
		lineplusoffset = line+FauxScrollFrame_GetOffset(CT_RaidTrackerDetailScrollFramePlayers);
		if (lineplusoffset <= maxlines) then
			val = players[lineplusoffset];
			dwGetglobal("CT_RaidTrackerPlayerLine" .. line).raidid = raidid;
			dwGetglobal("CT_RaidTrackerPlayerLine" .. line).raidtitle = CT_RaidTracker_GetRaidTitle(raidid, 1);
			dwGetglobal("CT_RaidTrackerPlayerLine" .. line).playername = val["name"];
			local name = dwGetglobal("CT_RaidTrackerPlayerLine" .. line .. "Name");
			local number = dwGetglobal("CT_RaidTrackerPlayerLine" .. line .. "Number");
			local join = dwGetglobal("CT_RaidTrackerPlayerLine" .. line .. "Join");
			local leave = dwGetglobal("CT_RaidTrackerPlayerLine" .. line .. "Leave");
			if ( name ) then
				name:SetText(val["name"]);
				local iNumber = lineplusoffset;
				if ( iNumber < 10 ) then
					iNumber = "  " .. iNumber;
				end
				number:SetText(iNumber);
				if(CT_RaidTracker_Options["24hFormat"] == 1) then
					join:SetText(val["join"]);
				else
					join:SetText(val["join"]);
				end
				if ( val["leave"] == 99999999999 ) then
					leave:SetText("");
				else
					if(CT_RaidTracker_Options["24hFormat"] == 1) then
						leave:SetText(val["leave"]);
					else
						leave:SetText(val["leave"]);
					end
				end
				if ( CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][val["name"]] and CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][val["name"]]["note"] ) then
				--	dwGetglobal("CT_RaidTrackerPlayerLine" .. line .. "NoteButtonNormalTexture"):SetVertexColor(1, 1, 1);
				else
				--	dwGetglobal("CT_RaidTrackerPlayerLine" .. line .. "NoteButtonNormalTexture"):SetVertexColor(0.5, 0.5, 0.5);
				end
			--	dwGetglobal("CT_RaidTrackerPlayerLine" .. line .. "NoteButton"):Show();
				dwGetglobal("CT_RaidTrackerPlayerLine" .. line .. "DeleteButton"):Show();
				dwGetglobal("CT_RaidTrackerPlayerLine" .. line):Show();
			end
		else
			dwGetglobal("CT_RaidTrackerPlayerLine" .. line):Hide();
		end
	end
	CT_RaidTrackerDetailScrollFramePlayers:Show();
end

function CT_RaidTracker_DetailScrollFrameItems_Update()
	local raidid = dwGetglobal("CT_RaidTrackerDetailScrollFrameItems").raidid;
	local loot = dwGetglobal("CT_RaidTrackerDetailScrollFrameItems").loot;
	local maxlines = getn(loot);
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(CT_RaidTrackerDetailScrollFrameItems, maxlines, 5, 41);
	for line=1, 5 do
		lineplusoffset = line+FauxScrollFrame_GetOffset(CT_RaidTrackerDetailScrollFrameItems);
		if (lineplusoffset <= maxlines) then
			local val = loot[lineplusoffset];
			if ( CT_RaidTrackerFrame.type == "items" ) then
				dwGetglobal("CT_RaidTrackerItem" .. line).raidid = raidid;
				dwGetglobal("CT_RaidTrackerItem" .. line).itemid = val["thisitemid"];
				dwGetglobal("CT_RaidTrackerItem" .. line).itemname = val["item"]["name"];
				if ( val["item"]["count"] and val["item"]["count"] > 1 ) then
					dwGetglobal("CT_RaidTrackerItem" .. line .. "Count"):Show();
					dwGetglobal("CT_RaidTrackerItem" .. line .. "Count"):SetText(val["item"]["count"]);
				else
					dwGetglobal("CT_RaidTrackerItem" .. line .. "Count"):Hide();
				end
				if ( val["item"]["icon"] ) then
					dwGetglobal("CT_RaidTrackerItem" .. line .. "IconTexture"):SetTexture("Interface\\Icons\\" .. val["item"]["icon"]);
				else
					dwGetglobal("CT_RaidTrackerItem" .. line .. "IconTexture"):SetTexture("Interface\\Icons\\INV_Misc_Gear_08");
				end
				local color = val["item"]["c"];
				if ( color == "ff1eff00" ) then
					color = "ff005D00";
				end
                local costs = val["costs"];
               if costs==nil then
                  costs = 0;
              end
				dwGetglobal("CT_RaidTrackerItem" .. line .. "Description"):SetText("|c" .. color .. val["item"]["name"].."|c33333300 "..costs.." DKP");
				dwGetglobal("CT_RaidTrackerItem" .. line .. "Looted"):SetText("拾取者: " .. val["player"]);
	
				if ( val["note"] ) then
					dwGetglobal("CT_RaidTrackerItem" .. line .. "NoteNormalTexture"):SetVertexColor(1, 1, 1);
				else
					dwGetglobal("CT_RaidTrackerItem" .. line .. "NoteNormalTexture"):SetVertexColor(0.5, 0.5, 0.5);
				end
			elseif ( CT_RaidTrackerFrame.type == "playeritems" ) then
				dwGetglobal("CT_RaidTrackerItem" .. line).raidid = val["ids"][1];
				dwGetglobal("CT_RaidTrackerItem" .. line).itemid = val["ids"][2];
				dwGetglobal("CT_RaidTrackerItem" .. line).itemname = val["item"]["name"];

				if ( val["item"]["count"] and val["item"]["count"] > 1 ) then
					dwGetglobal("CT_RaidTrackerItem" .. line .. "Count"):Show();
					dwGetglobal("CT_RaidTrackerItem" .. line .. "Count"):SetText(val["item"]["count"]);
				else
					dwGetglobal("CT_RaidTrackerItem" .. line .. "Count"):Hide();
				end
				if ( val["item"]["icon"] ) then
					dwGetglobal("CT_RaidTrackerItem" .. line .. "IconTexture"):SetTexture("Interface\\Icons\\" .. val["item"]["icon"]);
				else
					dwGetglobal("CT_RaidTrackerItem" .. line .. "IconTexture"):SetTexture("Interface\\Icons\\INV_Misc_Gear_08");
				end
				local color = val["item"]["c"];
				if ( color == "ff1eff00" ) then
					color = "ff005D00";
				end
				dwGetglobal("CT_RaidTrackerItem" .. line .. "Description"):SetText("|c" .. color .. val["item"]["name"]);
				dwGetglobal("CT_RaidTrackerItem" .. line .. "Looted"):SetText("Looted " .. CT_RaidTracker_GetRaidTitle(val["ids"][1], 1));

				if ( val["note"] ) then
					dwGetglobal("CT_RaidTrackerItem" .. line .. "NoteNormalTexture"):SetVertexColor(1, 1, 1);
				else
					dwGetglobal("CT_RaidTrackerItem" .. line .. "NoteNormalTexture"):SetVertexColor(0.5, 0.5, 0.5);
				end	
			end
			dwGetglobal("CT_RaidTrackerItem" .. line):Show();
		else
			dwGetglobal("CT_RaidTrackerItem" .. line):Hide();
		end
	end
	CT_RaidTrackerDetailScrollFrameItems:Show();
end

function CT_RaidTracker_DetailScrollFramePlayer_Update()
	local data = dwGetglobal("CT_RaidTrackerDetailScrollFramePlayer").data;
	local name = dwGetglobal("CT_RaidTrackerDetailScrollFramePlayer").name;
	local maxlines = dwGetglobal("CT_RaidTrackerDetailScrollFramePlayer").maxlines;
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(CT_RaidTrackerDetailScrollFramePlayer, maxlines, 11, 18);
	for line=1, 11 do
		lineplusoffset = line+FauxScrollFrame_GetOffset(CT_RaidTrackerDetailScrollFramePlayer);
		if (lineplusoffset <= maxlines) then
			val = data[lineplusoffset];
			if ( CT_RaidTrackerFrame.type == "player" ) then
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line).raidid = val[1];
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line).playername = name;
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line).raidtitle = CT_RaidTracker_GetRaidTitle(val[1], 1);
	
				local iNumber = getn(CT_RaidTracker_RaidLog)-val[1]+1;
				if ( iNumber < 10 ) then
					iNumber = "  " .. iNumber;
				end
	
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "MouseOverLeft"):Hide();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "MouseOverRight"):Hide();
	
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitAreaLeft"):Hide();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitAreaRight"):Hide();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitArea"):Show();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "Note"):Hide();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "NoteButton"):Show();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "DeleteButton"):Show();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "DeleteText"):Show();
	
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "Number"):SetText(iNumber);
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "Name"):SetWidth(200);
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "Name"):SetText(CT_RaidTracker_GetRaidTitle(val[1], 1));

				if ( val[2]["PlayerInfos"][name] and val[2]["PlayerInfos"][name]["note"] ) then
					dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "NoteButtonNormalTexture"):SetVertexColor(1, 1, 1);
				else
					dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "NoteButtonNormalTexture"):SetVertexColor(0.5, 0.5, 0.5);
				end
			elseif ( CT_RaidTrackerFrame.type == "itemhistory" ) then
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line).raidid = val[1];
	
				local iNumber = getn(CT_RaidTracker_RaidLog)-val[1]+1;
				if ( iNumber < 10 ) then
					iNumber = "  " .. iNumber;
				end
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "MouseOver"):Hide();
	
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitAreaLeft"):Show();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitAreaRight"):Show();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "HitArea"):Hide();
	
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "NoteButton"):Hide();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "Note"):Show();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "DeleteButton"):Hide();
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "DeleteText"):Hide();
	
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "Number"):SetText(iNumber);
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "Name"):SetWidth(130);
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "Name"):SetText(CT_RaidTracker_GetRaidTitle(val[1], 1));
				dwGetglobal("CT_RaidTrackerPlayerRaid" .. line .. "Note"):SetText(val[3]["player"]);
			end
			dwGetglobal("CT_RaidTrackerPlayerRaid" .. line):Show();
		else
			dwGetglobal("CT_RaidTrackerPlayerRaid" .. line):Hide();
		end
	end
	CT_RaidTrackerDetailScrollFramePlayer:Show();
end

function CT_RaidTracker_DetailScrollFrameBoss_Update()
	local events = dwGetglobal("CT_RaidTrackerDetailScrollFrameEvents").events;
    local raidid = dwGetglobal("CT_RaidTrackerDetailScrollFrameEvents").raidid;
	local maxlines = getn(events);
	local line;
	local lineplusoffset;
	FauxScrollFrame_Update(CT_RaidTrackerDetailScrollFrameEvents, maxlines, 11, 18);
	for line=1, 11 do
		lineplusoffset = line+FauxScrollFrame_GetOffset(CT_RaidTrackerDetailScrollFrameEvents);
		if (lineplusoffset <= maxlines) then
			val = events[lineplusoffset];
            local dkp = val["dkp"];
            if dkp == nil then
                dkp = 0;
            end
            dwGetglobal("CT_RaidTrackerBosses" .. line).bossid = lineplusoffset;
            dwGetglobal("CT_RaidTrackerBosses" .. line).raidid = raidid;
			dwGetglobal("CT_RaidTrackerBosses" .. line .. "MouseOver"):Hide();
			dwGetglobal("CT_RaidTrackerBosses" .. line .. "HitArea"):Show();

			dwGetglobal("CT_RaidTrackerBosses" .. line .. "Boss"):SetText(val["boss"].." "..dkp.." DKP");
			dwGetglobal("CT_RaidTrackerBosses" .. line .. "Time"):SetText(getn(val["attendees"]).."人参与-点击查看");
			dwGetglobal("CT_RaidTrackerBosses" .. line):Show();
		else
			dwGetglobal("CT_RaidTrackerBosses" .. line):Hide();
		end
	end
	CT_RaidTrackerDetailScrollFrameEvents:Show();
end

function CT_RaidTracker_ColorToRGB(str)
	str = strlower(strsub(str, 3));
	local tbl = { };
	tbl[1], tbl[2], tbl[3], tbl[4], tbl[5], tbl[6] = strsub(str, 1, 1), strsub(str, 2, 2), strsub(str, 3, 3), strsub(str, 4, 4), strsub(str, 5, 5), strsub(str, 6, 6);
	
	local highvals = { ["a"] = 10, ["b"] = 11, ["c"] = 12, ["d"] = 13, ["e"] = 14, ["f"] = 15 };
	for k, v in pairs(tbl) do
		if ( highvals[v] ) then
			tbl[k] = highvals[v];
		elseif ( tonumber(v) ) then
			tbl[k] = tonumber(v);
		end
	end
	local r, g, b = (tbl[1]*16+tbl[2])/255, (tbl[3]*16+tbl[4])/255, (tbl[5]*16+tbl[6])/255;
	if ( not r or r > 1 or r < 0 ) then
		r = 1;
	end
	if ( not g or g > 1 or g < 0 ) then
		g = 1;
	end
	if ( not b or b > 1 or b < 0 ) then
		b = 1;
	end
	return r, g, b;
end

function CT_RaidTrackerItem_SetHyperlink()
	local raidid = this.raidid;
	local lootid = this.itemid;
	if ( CT_RaidTracker_RaidLog[raidid] and CT_RaidTracker_RaidLog[raidid]["Loot"][lootid] ) then
		local item = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"];
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
		if (GetItemInfo("item:" .. item["id"])) then
			GameTooltip:SetHyperlink("item:" .. item["id"]);
		else
			rl, gl, bl = CT_RaidTracker_ColorToRGB(item["c"]);
			GameTooltip:AddLine(item["name"], rl, gl, bl);
			GameTooltip:AddLine("如果你的缓存中没有这个战利品信息请点击右键 ( 很可能掉线!)", 1, 1, 1);
		end
		
		GameTooltip:AddLine("拾取时间: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["time"], 1, 1, 0);
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["zone"]) then
			GameTooltip:AddLine("掉落地区: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["zone"], 1, 1, 0);
		end
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["boss"]) then
			GameTooltip:AddLine("掉落Boss: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["boss"], 1, 1, 0);
		end
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["costs"]) then
			GameTooltip:AddLine("战利品价值: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["costs"], 1, 1, 0);
		end
		if(CT_RaidTracker_Options["DebugFlag"]) then
			if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["class"]) then
				GameTooltip:AddLine("装备位置: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["class"], 1, 1, 0);
			end
			if(CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["subclass"]) then
				GameTooltip:AddLine("战利品类型: "..CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["subclass"], 1, 1, 0);
			end
		end

		GameTooltip:Show();
		return;
	end
end

function CT_RaidTrackerItem_GetChatHyperlink()
	local raidid = this.raidid;
	local lootid = this.itemid;
	if ( IsShiftKeyDown() and ( type(WIM_API_InsertText) == "function" ) and CT_RaidTracker_RaidLog[raidid] and CT_RaidTracker_RaidLog[raidid]["Loot"][lootid] ) then
		local item = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"];
		WIM_API_InsertText( "|c" .. item.c .. "|Hitem:" .. item.id .. "|h[" .. item.name .. "]|h|r" );
	end	
	if ( IsShiftKeyDown() and SELECTED_CHAT_FRAME.editBox:IsVisible() and CT_RaidTracker_RaidLog[raidid] and CT_RaidTracker_RaidLog[raidid]["Loot"][lootid] ) then
		local item = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"];
		SELECTED_CHAT_FRAME.editBox:Insert("|c" .. item.c .. "|Hitem:" .. item.id .. "|h[" .. item.name .. "]|h|r");
	end
end

function CT_RaidTracker_GetItemTooltip(sItem)
	CT_RTTooltip:SetOwner(this, "ANCHOR_NONE");
	CT_RTTooltip:SetHyperlink("spell:1");
	CT_RTTooltip:Show();
	CT_RTTooltip:SetHyperlink("item:" .. sItem);
	
	local lines = CT_RTTooltip:NumLines();
	local tooltiptxt = "";
	
	for i = 1, lines do
		local left = dwGetglobal("CT_RTTooltipTextLeft" .. i):GetText();
		local right = dwGetglobal("CT_RTTooltipTextRight" .. i):GetText();
		
		if left then
			tooltiptxt = tooltiptxt .. left;
			if right then
				tooltiptxt = tooltiptxt .. " " .. right .. "|";
			else
				tooltiptxt = tooltiptxt .. ";";
			end
		elseif right then
			tooltiptxt = tooltiptxt .. right .. "|";
		end
	end
	
	CT_RTTooltip:Hide(); -- $@!* YOU WOW API BLARGHGHALAGHALAHH
	return tooltiptxt;
end

-- Debug function(s)

function CT_RaidTracker_Debug(...)
	--local a = ...;
	if ( CT_RaidTracker_Options["DebugFlag"] ) then
		local sDebug = "#";
		for i = 1, select("#", ...) , 1 do
			if ( select(i, ...) ) then
				sDebug = sDebug .. tostring(select(i, ...) ) .. "#";
			end
		end
		DEFAULT_CHAT_FRAME:AddMessage(CT_RaidTracker_Revision..sDebug, 1, 0.5, 0);
	end
end
		

function CT_RaidTracker_OnLoad(self)	
	CT_RaidTrackerTitleText:SetText("多玩DKP插件 " .. CT_RaidTracker_Version);
	-- Register events
	self:RegisterEvent("CHAT_MSG_LOOT");
	self:RegisterEvent("CHAT_MSG_SYSTEM");
	self:RegisterEvent("RAID_ROSTER_UPDATE");
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA");
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL");
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PARTY_MEMBERS_CHANGED");
	self:RegisterEvent("UNIT_HEALTH");
	self:RegisterEvent("UPDATE_INSTANCE_INFO");	
end

function CT_RaidTracker_OnEvent(self, event, ...)
	local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10 = ...;
	
	--CT_RaidTracker_Debug("event fired", event);

	if ( event == "ADDON_LOADED"and arg1 == "DWDKP") then
    --xd
        ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", whisperFilter);
        
        --CT_RaidTracker_Options["LogAttendees"] = 1;
		CT_RaidTrackerFrame:CreateTitleRegion()
		CT_RaidTrackerFrame:GetTitleRegion():SetAllPoints()
		CT_RaidTracker_RunVersionFix();
		ML_RaidTracker_LoadCustomOptions();
		CT_RaidTracker_GetGameTimeOffset();
		CT_RaidTracker_Options["ExportFormat"] = 0;
		CT_RaidTracker_Options["NextBoss"] = 0;
		CT_RaidTracker_Options["Wipe"] = 0;
		CT_RaidTracker_Options["24hFormat"] = 1;
		CT_RaidTracker_Options["Timezone"] = 0;
		CT_RaidTracker_Options["LogBattlefield"] = 0;
		CT_RaidTracker_Options["NewRaidOnNewZone"] = 0;
		CT_RaidTracker_Options["AutoZone"] = 1;
		CT_RaidTracker_Options["AutoBoss"] = 2;
		CT_RaidTracker_Options["AutoBossChangeMinTime"] = 120;
		CT_RaidTracker_Options["AutoRaidCreation"] = 0;
		CT_RaidTracker_Options["LogGroup"] = 0;
		CT_RaidTracker_Options["AutoGroup"] = 0;

		MerDKP_Table_init = deepcopy(MerDKP_Table);        
		if CT_RaidTracker_GetCurrentRaid then
			CT_RaidTracker_Update_MerDKP(CT_RaidTracker_GetCurrentRaid);
		end
    end
	local julianne_died = false;
	if ( CT_RaidTracker_UpdateFrame.time and CT_RaidTracker_UpdateFrame.time <= 2 ) then
		tinsert(CT_RaidTracker_Events, event);
		return;
	end

	if ( CT_RaidTracker_Options["LogBattlefield"] == 0 and ((GetNumBattlefieldScores() > 0) or (IsActiveBattlefieldArena() == 1))) then
		if ( CT_RaidTracker_GetCurrentRaid ) then
			CT_RaidTracker_Delete( CT_RaidTracker_GetCurrentRaid, "raid", 0 );
			CT_RaidTracker_Debug("Battlegroup detected, removing raid entry from list.");
			return;
		else
			CT_RaidTracker_Debug("Battlegroup detected, skipped event.");
			return;
		end;
	end;
	if ( event == "" and arg7 == CT_RaidTracker_lang_BossKills_Julianne_BossName) then
		
	end;

	if ( event == "CHAT_MSG_MONSTER_YELL" or event == "CHAT_MSG_MONSTER_EMOTE" ) then -- Sorry, Majordomo needs a little hack
		if(arg1 == CT_RaidTracker_lang_BossKills_Majordomo_Yell) then
			CT_RaidTracker_Debug("It's domo!");
			event = "COMBAT_LOG_EVENT_UNFILTERED";
			arg2="UNIT_DIED";
			arg7 =CT_RaidTracker_lang_BossKills_Majordomo_BossName;
		elseif(arg2 == "Karazhan - Chess, Victory Controller") then
			CT_RaidTracker_Print("Plz contact Eris at www.mldkp.net that Chess event logging is working (incl language)");
			event = "COMBAT_LOG_EVENT_UNFILTERED";
			arg2="UNIT_DIED";
			arg7 = CT_RaidTracker_lang_BossKills_Chess_Event_BossName;
		elseif(arg1 == CT_RaidTracker_lang_BossKills_Chess_Event_Yell) then
			CT_RaidTracker_Debug("Chess event");
			event = "COMBAT_LOG_EVENT_UNFILTERED";
			arg2="UNIT_DIED";
			arg7 = CT_RaidTracker_lang_BossKills_Chess_Event_BossName;
		elseif(arg1 == CT_RaidTracker_lang_BossKills_Julianne_Die_Yell) then
			CT_RaidTracker_Debug("Romulo und Julianne");
			event = "COMBAT_LOG_EVENT_UNFILTERED";
			arg2="UNIT_DIED";
			arg7 = CT_RaidTracker_lang_BossKills_Julianne_BossName;
			julianne_died = true;
		elseif(arg1 == CT_RaidTracker_lang_BossKills_Sathrovarr_Yell) then
			CT_RaidTracker_Debug("Sathrovarr!");
			event = "COMBAT_LOG_EVENT_UNFILTERED";
			arg2 = "UNIT_DIED";
			arg7 = CT_RaidTracker_lang_BossKills_Sathrovarr_BossName;
		-- dugu added TOC 老三
		elseif (arg1 == CT_RaidTracker_lang_BossKills_Hero_Yell) then
			event = "COMBAT_LOG_EVENT_UNFILTERED";
			arg2 = "UNIT_DIED";
			arg7 = CT_RaidTracker_lang_BossKills_Hero_BossName;			
		end
	end

	if ( event == "RAID_ROSTER_UPDATE" or event == "PLAYER_ENTERING_WORLD") then 
		if ( not CT_RaidTracker_GetCurrentRaid and GetNumRaidMembers() > 0 and event == "RAID_ROSTER_UPDATE" and CT_RaidTracker_Options["AutoRaidCreation"] == 1) then
			CT_RaidTracker_EditDKPSystem();
		end
		if ( not CT_RaidTracker_GetCurrentRaid ) then
			return;
		end
		local updated;
		--check for players not longer in raid
		if ( event == "RAID_ROSTER_UPDATE") then
			for k, v in pairs(CT_RaidTracker_Online) do
				local online;
	--			if CT_RaidTracker_Options["GuildSnapshot"] then
				online = UnitIsConnected(k);
--				else
--					online = UnitInRaid(k);
	--			end;
				CT_RaidTracker_Debug("Check connection for",k,online);
				if ( online ~= v ) then
					tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
						{
							["player"] = k,
							["time"] = CT_RaidTracker_Date()
						}
					);
					CT_RaidTracker_Debug("OFFLINE", k, CT_RaidTracker_Date());
					CT_RaidTracker_Online[k] = online;
					updated = true;
				end		
			end
		end
		for i = 1, GetNumRaidMembers(), 1 do
			local name, online = UnitName("raid" .. i), UnitIsConnected("raid" .. i);
			CT_RaidTracker_Debug("Player is ",name,online);
			if ( name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
				CT_RaidTracker_Debug("Player is updating",name,online);
				local _, race = UnitRace("raid" .. i);
				local _, class = UnitClass("raid" .. i);
				local sex = UnitSex("raid" .. i);
				local level = UnitLevel("raid" .. i);
				local guild = GetGuildInfo("raid" .. i);
				
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"] = { };
				end
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name] = { };
				end
			--	if(CT_RaidTracker_Options["SaveExtendedPlayerInfo"] == 1) then
				    if(race) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["race"] = race; end
				    if(class) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["class"] = class; end
						if(sex) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["sex"] = sex; end
				    if(level > 0) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["level"] = level; end
				    if(guild) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["guild"] = guild; end
			--	end
				if ( online ~= CT_RaidTracker_Online[name] ) then
					-- Status isn't updated
					CT_RaidTracker_Debug("Status isn't updated", name, online);
					if ( not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] and CT_RaidTracker_Options["AutoRaidCreation"] == 1) then
						CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] = { 
							["Loot"] = { },
							["Join"] = { },
							["Leave"] = { },
							["PlayerInfos"] = { },
							["BossKills"] = { },
							["BossKilled"] = { },
						};
					end
					CT_RaidTracker_Debug("Player is online",name,online);
					if( CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] ) then
						if ( not online ) then
							if ( online ~= CT_RaidTracker_Online[name] ) then
								tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
									{
										["player"] = name,
										["time"] = CT_RaidTracker_Date()
									}
								);
								CT_RaidTracker_Debug("OFFLINE", name, CT_RaidTracker_Date());
							end
						else
							tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
								{
									["player"] = name,
									--["race"] = race,
									--["class"] = class,
									--["level"] = level,
									["time"] = CT_RaidTracker_Date()
								}
								);
							CT_RaidTracker_Debug("ONLINE", name, CT_RaidTracker_Date());
						end
						updated = 1;
					end
				end
				CT_RaidTracker_Online[name] = online;
			end
		end
		if ( updated ) then
			CT_RaidTracker_Update();
			CT_RaidTracker_UpdateView();
		end

	-- Party code added thx to Gof
	elseif ( GetNumRaidMembers() == 0 and (event == "PARTY_MEMBERS_CHANGED" or event == "PLAYER_ENTERING_WORLD")) then 
		
		if ( not CT_RaidTracker_GetCurrentRaid ) then
			return;
		end
		local updated;
		for i = 1, GetNumPartyMembers(), 1 do
			local name, online = UnitName("party" .. i), UnitIsConnected("party" .. i);
			if ( name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
				local _, race = UnitRace("party" .. i);
				local _, class = UnitClass("party" .. i);
				local level = UnitLevel("party" .. i);
				local guild = GetGuildInfo("party" .. i);
				
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"] = { };
				end
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name] = { };
				end
		--		if(CT_RaidTracker_Options["SaveExtendedPlayerInfo"] == 1) then
				    if(race) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["race"] = race; end
				    if(class) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["class"] = class; end
				    if(level > 0) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["level"] = level; end
				    if(guild) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["guild"] = guild; end
			--	end
				if ( online ~= CT_RaidTracker_Online[name] ) then
					-- Status isn't updated
					CT_RaidTracker_Debug("Status isn't updated", name, online);
					if ( not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] and CT_RaidTracker_Options["AutoRaidCreation"] == 1) then
						CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] = { 
							["Loot"] = { },
							["Join"] = { },
							["Leave"] = { },
							["PlayerInfos"] = { },
							["BossKills"] = { },
							["BossKilled"] = { },
						};
					end
					if( CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] ) then
						if ( not online ) then
							if ( online ~= CT_RaidTracker_Online[name] ) then
								tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
									{
										["player"] = name,
										["time"] = CT_RaidTracker_Date()
									}
								);
								CT_RaidTracker_Debug("OFFLINE", name, CT_RaidTracker_Date());
							end
						else
							tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
								{
									["player"] = name,
									--["race"] = race,
									--["class"] = class,
									--["level"] = level,
									["time"] = CT_RaidTracker_Date()
								}
								);
							CT_RaidTracker_Debug("ONLINE", name, CT_RaidTracker_Date());
						end
						updated = 1;
					end
				end
				CT_RaidTracker_Online[name] = online;
			end
		end
		
		--Party dosent include player himself, so add him
		
		local name, online = UnitName("player"), UnitIsConnected("player");
		if ( name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
			local _, race = UnitRace("player");
			local _, class = UnitClass("player");
			local level = UnitLevel("player");
			local guild = GetGuildInfo("player");
			
			if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"]) then
				CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"] = { };
			end
			if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]) then
				CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name] = { };
			end
			--if(CT_RaidTracker_Options["SaveExtendedPlayerInfo"] == 1) then
				if(race) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["race"] = race; end
				if(class) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["class"] = class; end
				if(level > 0) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["level"] = level; end
				if(guild) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["guild"] = guild; end
		--	end
			if ( online ~= CT_RaidTracker_Online[name] ) then
				-- Status isn't updated
				CT_RaidTracker_Debug("Status isn't updated", name, online);
				if ( not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] and CT_RaidTracker_Options["AutoRaidCreation"] == 1) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] = { 
						["Loot"] = { },
						["Join"] = { },
						["Leave"] = { },
						["PlayerInfos"] = { },
						["BossKills"] = { },
						["BossKilled"] = { },
					};
				end
				if( CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] ) then
					if ( not online ) then
						if ( online ~= CT_RaidTracker_Online[name] ) then
							tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
								{
									["player"] = name,
									["time"] = CT_RaidTracker_Date()
								}
							);
							CT_RaidTracker_Debug("OFFLINE", name, CT_RaidTracker_Date());
						end
					else
						tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
							{
								["player"] = name,
								--["race"] = race,
								--["class"] = class,
								--["level"] = level,
								["time"] = CT_RaidTracker_Date()
							}
							);
						CT_RaidTracker_Debug("ONLINE", name, CT_RaidTracker_Date());
					end
					updated = 1;
				end
			end
			CT_RaidTracker_Online[name] = online;
		end
		if ( updated ) then
			CT_RaidTracker_Update();
			CT_RaidTracker_UpdateView();
		end
	-- Party code end
	elseif ( event == "CHAT_MSG_LOOT" and CT_RaidTracker_GetCurrentRaid ) then
		if(not testo) then
			testo = {};
		end
		tinsert(testo, arg1);
		local sPlayer, sLink, sPlayerName, sItem, iCount;
		CT_RaidTracker_Debug("arg1", arg1);
		CT_RaidTracker_Debug(string.sub(arg1,1,-2));
		CT_RaidTracker_Debug(string.sub(arg1,1,-5));
		if(string.find(arg1, CT_RaidTracker_lang_ReceivesLoot1)) then
			iStart, iEnd, sPlayerName, sItem = string.find(arg1, CT_RaidTracker_lang_ReceivesLoot1);
			iCount = 1;
			CT_RaidTracker_Debug("itemdropped1", "format", 1, sPlayerName, sItem, iCount);
		elseif(string.find(arg1, CT_RaidTracker_lang_ReceivesLoot2)) then
			iStart, iEnd, sItem = string.find(arg1, CT_RaidTracker_lang_ReceivesLoot2);
			iCount = 1;
			sPlayerName = YOU;
			CT_RaidTracker_Debug("itemdropped2", "format", 2, sPlayerName, sItem, iCount);
		elseif(string.find(arg1, CT_RaidTracker_lang_ReceivesLoot3)) then
			iStart, iEnd, sPlayerName, sItem, iCount = string.find(arg1, CT_RaidTracker_lang_ReceivesLoot3);
			CT_RaidTracker_Debug("itemdropped3", "format", 3, sPlayerName, sItem, iCount);
		elseif(string.find(arg1, CT_RaidTracker_lang_ReceivesLoot4)) then
			iStart, iEnd, sItem, iCount = string.find(arg1, CT_RaidTracker_lang_ReceivesLoot4);
			sPlayerName = YOU;
			CT_RaidTracker_Debug("itemdropped4", "format", 4, sPlayerName, sItem, iCount);
		end
		
		CT_RaidTracker_Debug("itemdropped", "link", sItem);
		if ( sPlayerName ) then
			if(sPlayerName == YOU) then
				CT_RaidTracker_Debug("itemdropped", "It's me");
				sPlayer = UnitName("player");
			else
				CT_RaidTracker_Debug("itemdropped", "It's sombody else");
				sPlayer = sPlayerName;
			end
			sLink = sItem;
		end
		iCount = tonumber(iCount);
		if(not iCount) then
			iCount = 1;
		end
		CT_RaidTracker_Debug("itedroped", sPlayer, sLink, iCount);
		-- Make sure there is a link
		if ( sLink and sPlayer ) then
			local sColor, sItem, sName = CT_RaidTracker_GetItemInfo(sLink);
			local itemoptions;
			for key, val in pairs(CT_RaidTracker_ItemOptions) do
				if(string.find(sItem, "^"..val["id"]..":%d+:%d+:%d+")) then
					itemoptions = val;
					CT_RaidTracker_Debug("ItemOptions", "FoundItem", key);
				end
			end
			local iotrack, iogroup, iocostsgrabbing, ioaskcosts
			if ( (itemoptions and itemoptions["status"] and itemoptions["status"] == 1) or ((sColor and sItem and sName and CT_RaidTracker_RarityTable[sColor] >= CT_RaidTracker_Options["MinQuality"]) and (not itemoptions or not itemoptions["status"]))) then
				-- Insert into table
				if ( not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] and CT_RaidTracker_Options["AutoRaidCreation"] == 1) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] = { 
						["Loot"] = { },
						["Join"] = { },
						["Leave"] = { },
						["PlayerInfos"] = { },
						["BossKills"] = { },
						["BossKilled"] = { },
					};
				end
				local found = nil;
				if( CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid] ) then
					if( (itemoptions and itemoptions["group"] and itemoptions["group"] == 1) or ((CT_RaidTracker_Options["GroupItems"] ~= 0 and CT_RaidTracker_RarityTable[sColor] <= CT_RaidTracker_Options["GroupItems"]) and (not itemoptions or not itemoptions["group"])) ) then
						CT_RaidTracker_Debug("Trying to group", sName, sPlayer);
						for k, v in pairs(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"]) do
							if ( v["item"]["name"] == sName and v["player"] == sPlayer ) then
								if ( v["item"]["count"] ) then
									CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"][k]["item"]["count"] = v["item"]["count"]+iCount;
								else
									CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"][k]["item"]["count"] = iCount;
								end
								found = 1;
								CT_RaidTracker_Debug("Grouped", sName, sPlayer, CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"][k]["item"]["count"]);
								break;
							end
						end
					end
					if ( not found ) then
						local nameGIF, linkGIF, qualityGIF, iLevelGIF, minLevelGIF, classGIF, subclassGIF, maxStackGIF, invtypeGIV, iconGIF = GetItemInfo("item:"..sItem);
						_, _, iconGIF = string.find(iconGIF, "^.*\\(.*)$");
						local splitted = { [0] = 0, [1] = 0, [2] = 0, [3] = 0 };
						local trimed;
						local i = 0;
						local sNote, sCosts, sBoss;
						
						for item in string.gmatch(string.gsub(sItem, "^%s*(.-)%s*$", "%1") .. ":", "([^:]*):?") do
							trimed = string.gsub(item, "^%s*(.-)%s*$", "%1");
							if(string.len(trimed) >= 1) then
								splitted[i] = trimed;
								i = i + 1;
							end
						end
						if( (itemoptions and itemoptions["costsgrabbing"] and itemoptions["costsgrabbing"] == 1) or ((CT_RaidTracker_Options["GetDkpValue"] ~= 0 and CT_RaidTracker_RarityTable[sColor] >= CT_RaidTracker_Options["GetDkpValue"]) and (not itemoptions or not itemoptions["costsgrabbing"]))) then
							if(DKPValues and DKPValues[tostring(splitted[0])]) then -- AdvancedItemTooltip
								sCosts = tonumber(DKPValues[tostring(splitted[0])]);
							elseif(HDKP_GetDKP) then -- HoB_DKP
								sCosts = tonumber(HDKP_GetDKP(splitted[0], splitted[1], splitted[2], splitted[3]));
							elseif(EasyDKP) then
								local itemID = tonumber(splitted[0]) or 0
								sCosts = EasyDKP:GetValue(itemID)
							end
							CT_RaidTracker_Debug("Splitted", splitted[0], splitted[1], splitted[2], splitted[3]);
							if(sCosts == 0) then
								sCosts = nil;
							end
						end
						
						if(CT_RaidTracker_Options["AutoBoss"] >= 1) then
							sBoss = CT_RaidTracker_Options["AutoBossBoss"];
						end
						
						local tAttendees = { };
						
						
						local tTooltip = { };
						if(CT_RaidTracker_Options["SaveTooltips"] == 1) then
							tTooltip = CT_RaidTracker_GetItemTooltip(sItem);
						end
						
						local sTime = CT_RaidTracker_Date();
						local foundValue = "|c" .. sColor .. "|Hitem:" .. sItem .. "|h[" .. sName .. "]|h|r";
						--sNote = "0 DKP";
						--GDKP_Output("foundValue = " .. foundValue,"lokal");
						--if (bidWinnerHistory ~= nil) then
						--	local foundValue;
						--	for i=1,table.getn(bidWinnerHistory) do
						--		foundValue = "|c" .. sColor .. "|Hitem:" .. sItem .. "|h[" .. sName .. "]|h|r";
						--		--GDKP_Output(foundValue,"lokal");
						--		if (bidWinnerHistory[i][3] == foundValue) then
						--			if (bidWinnerHistory[i][1] == sPlayer) then
						--				sNote = bidWinnerHistory[i][2] .. " DKP";
						--				--table.remove(bidWinnerHistory, i);
						--				break;
						--			end
						--		end
						--	end
						--end
						
						tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Loot"], 1,
							{
								["player"] = sPlayer,
								["item"] = {						
									["c"] = sColor,
									["id"] = sItem,
									["tooltip"] = tTooltip,
									["name"] = sName,
									["icon"] = iconGIF,
									["count"] = iCount,
									["class"] = classGIF,
									["subclass"] = subclassGIF,
									["subclass"] = subclassGIF,
								},
								["zone"] = GetRealZoneText(),
								["difficulty"] = GetCurrentDungeonDifficulty(), --This currently isn't used.  Difficulty is found in the root raid object for the purposes of string generation.
								["costs"] = sCosts,
								["boss"] = sBoss,
								["time"] = sTime,
								["note"] = sNote,
								["attendees"] = tAttendees,
							}
						);
						
						if ( (itemoptions and itemoptions["askcosts"] and itemoptions["askcosts"] == 1) or ((CT_RaidTracker_Options["AskCost"] ~= 0 and CT_RaidTracker_RarityTable[sColor] >= CT_RaidTracker_Options["AskCost"]) and (not itemoptions or not itemoptions["askcosts"])) ) then -- code and idea from tlund
							CT_RaidTracker_EditCosts(CT_RaidTracker_GetCurrentRaid, 1);
						end
					end
				end
				
				CT_RaidTracker_Debug(sPlayer, sColor, sItem, sName);
				CT_RaidTracker_Update();
				CT_RaidTracker_UpdateView();
			end
		end
	
	elseif ( event == "CHAT_MSG_SYSTEM" and UnitName("player") and UnitName("player") ~= UKNOWNBEING and UnitName("player") ~= UNKNOWN and CT_RaidTracker_GetCurrentRaid ) then
		local sDate = CT_RaidTracker_Date();
		local iStart, iEnd, sPlayer = string.find(arg1, CT_RaidTracker_lang_LeftGroup);
		if ( sPlayer and sPlayer ~= UnitName("player") and sPlayer ~= UKNOWNBEING and sPlayer ~= UNKNOWN and CT_RaidTracker_Online[sPlayer]) then
			tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
				{
					["player"] = sPlayer,
					["time"] = sDate
				}
			);
			CT_RaidTracker_Online[sPlayer] = nil;
			CT_RaidTracker_Debug(sPlayer, "LEFT", sDate);
		end
		--[[
		local race, lass, level;
		local iStart, iEnd, sPlayer = string.find(arg1, CT_RaidTracker_lang_JoinedGroup);
		if ( sPlayer and sPlayer ~= UnitName("player") and sPlayer ~= UKNOWNBEING and sPlayer ~= UNKNOWN) then
			tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
				{
					["player"] = sPlayer,
					["time"] = sDate
				}
			);
			CT_RaidTracker_Debug(sPlayer, "JOIN", sDate);
		end
		]]

		CT_RaidTracker_UpdateView();
		CT_RaidTracker_Update();
	
	--elseif ( event == "VARIABLES_LOADED" ) then

	elseif ( event == "UPDATE_MOUSEOVER_UNIT" ) then	
		if(CT_RaidTracker_Options["AutoBoss"] == 1) then
			local autoboss_unitname = UnitName("mouseover");
			local autoboss_newboss;
			if(not UnitIsFriend("mouseover", "player") and not UnitInRaid("mouseover") and not UnitInParty("mouseover")) then
				--CT_RaidTracker_Debug("possible mouseover unit update", autoboss_unitname);
				if(CT_RaidTracker_BossUnitTriggers[autoboss_unitname]) then
					if(CT_RaidTracker_BossUnitTriggers[autoboss_unitname] ~= "IGNORE") then
						autoboss_newboss = CT_RaidTracker_BossUnitTriggers[autoboss_unitname];
						CT_RaidTracker_AutoBossChangedTime = GetTime();
						CT_RaidTracker_Debug("AutoBossChangedTime set to ", CT_RaidTracker_AutoBossChangedTime,"mouseover");
					end
				elseif(CT_RaidTracker_BossUnitTriggers["DEFAULTBOSS"] and (CT_RaidTracker_Options["AutoBossChangeMinTime"] == 0 or (GetTime() > (CT_RaidTracker_AutoBossChangedTime + CT_RaidTracker_Options["AutoBossChangeMinTime"])))) then
					autoboss_newboss = CT_RaidTracker_BossUnitTriggers["DEFAULTBOSS"];
					CT_RaidTracker_Debug("AutoBossChangedTime expired ", CT_RaidTracker_AutoBossChangedTime,"mouseover");
				else
					autoboss_newboss = nil
					CT_RaidTracker_Debug("AutoBossChangedTime expires in ", (CT_RaidTracker_AutoBossChangedTime + CT_RaidTracker_Options["AutoBossChangeMinTime"])-GetTime(),"mouseover");
				end
				if(autoboss_newboss and CT_RaidTracker_Options["AutoBossBoss"] ~= autoboss_newboss) then
					CT_RaidTracker_Options["AutoBossBoss"] = autoboss_newboss;
					CT_RaidTracker_Print("CT_RaidTracker 自动更新Boss: "..autoboss_newboss, 1, 1, 0);
				end
			end
		end
	elseif ( event == "ZONE_CHANGED_NEW_AREA" ) then
		if(CT_RaidTracker_Options["AutoZone"] == 1) then
			CT_RaidTracker_DoZoneCheck();
			CT_RaidTracker_DoRaidIdCheck();
		else
            -- There is no other way to automatically set the current difficulty without first being in the instance.
            -- Don't revert to "Normal" as soon as you exit though if you were in a heroic raid.
            if (CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid["difficulty"]] ~= 2) then
               -- CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid["difficulty"]] = GetDungeonDifficulty();
	       CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid["difficulty"]] = GetCurrentDungeonDifficulty();
                CT_RaidTracker_Update();
                CT_RaidTracker_UpdateView();
            end
        end
	elseif ( event == "COMBAT_LOG_EVENT_UNFILTERED" and arg2 == "UNIT_DIED" ) then
		local bosskilled, autoboss_newboss;
		local sDate = CT_RaidTracker_Date();
		CT_RaidTracker_Debug("COMBAT_LOG_EVENT_UNFILTERED",arg7);
		local unit = arg7
--		for unit in string.gmatch(arg7, CT_RaidTracker_ConvertGlobalString(UNITDIESOTHER)) do
			CT_RaidTracker_Debug("COMBAT_LOG_EVENT_UNFILTERED","unit", unit);
			if(CT_RaidTracker_Options["AutoBoss"] == 2 and CT_RaidTracker_GetCurrentRaid) then
				if(not CT_RaidTracker_Online[unit]) then
					if(CT_RaidTracker_BossUnitTriggers[unit]) then
						if(CT_RaidTracker_BossUnitTriggers[unit] ~= "IGNORE") then
							autoboss_newboss = CT_RaidTracker_BossUnitTriggers[unit];
							CT_RaidTracker_AutoBossChangedTime = GetTime();
							CT_RaidTracker_Debug("AutoBossChangedTime set to ", CT_RaidTracker_AutoBossChangedTime,"kill");
						end
					elseif(CT_RaidTracker_BossUnitTriggers["DEFAULTBOSS"] and (CT_RaidTracker_Options["AutoBossChangeMinTime"] == 0 or (GetTime() > (CT_RaidTracker_AutoBossChangedTime + CT_RaidTracker_Options["AutoBossChangeMinTime"])))) then
						autoboss_newboss = CT_RaidTracker_BossUnitTriggers["DEFAULTBOSS"];
						CT_RaidTracker_Debug("AutoBossChangedTime expired ", CT_RaidTracker_AutoBossChangedTime,"kill");
					else
						autoboss_newboss = nil
						CT_RaidTracker_Debug("AutoBossChangedTime expires in ", (CT_RaidTracker_AutoBossChangedTime + CT_RaidTracker_Options["AutoBossChangeMinTime"])-GetTime(),"kill");
					end
					if(autoboss_newboss and CT_RaidTracker_Options["AutoBossBoss"] ~= autoboss_newboss) then
						CT_RaidTracker_Options["AutoBossBoss"] = autoboss_newboss;
						CT_RaidTracker_Print("CT_RaidTracker 自动更新Boss: "..autoboss_newboss.." ("..unit..")", 1, 1, 0);
					end
				end
			end
			
			if(CT_RaidTracker_GetCurrentRaid and CT_RaidTracker_BossUnitTriggers[unit] and CT_RaidTracker_BossUnitTriggers[unit] ~= "IGNORE") then	
				local newboss = 1;				
				bosskilled = CT_RaidTracker_BossUnitTriggers[unit];
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"] = { };
				end
				-- is the boss already killed?
				for key, val in pairs(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"]) do
				    if(val["boss"] == bosskilled) then
				        newboss = 0;
				    end
				end
				if (newboss == 1) and isThatBossKilled(unit) then
				    local tAttendees = { };
					if( (CT_RaidTracker_Options["LogAttendees"] == 0) or (CT_RaidTracker_Options["LogAttendees"] == 1) or (CT_RaidTracker_Options["LogAttendees"] == 2)) then
						if( GetNumRaidMembers() > 0 ) then
							for i = 1, GetNumRaidMembers() do
								local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
								local name = UnitName("raid" .. i);
								if (name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
									if (CT_RaidTracker_Options["LogAttendees"] == 1)then
										if (subgroup>0 and subgroup<7) then 
											tinsert(tAttendees, name);
										end;
									elseif (CT_RaidTracker_Options["LogAttendees"] == 2) then
										if (subgroup>0 and subgroup<6) then 
											tinsert(tAttendees, name);
										end;
									else
										tinsert(tAttendees, name);
									end;
								end
							end
						elseif( (GetNumPartyMembers() > 0) and (CT_RaidTracker_Options["LogGroup"] == 1) ) then
							for i = 1, GetNumPartyMembers() do
								local name = UnitName("party" .. i);
								if (name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
									tinsert(tAttendees, name);
								end
							end
							--Party dosent include player, so add individual
							local name = UnitName("player");
							if (name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
								tinsert(tAttendees, name);
							end
						end
					end
				    tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"],
        				{
        					["boss"] = bosskilled,
        					["time"] = sDate,
        					["attendees"] = tAttendees
        				}
			            );
			      CT_RaidTracker_Print("CT_RaidTracker Boss 击杀: 设置 \""..bosskilled.."\" 击杀时间为 "..sDate, 1, 1, 0);
                  
                  CT_RaidTracker_EditBossDKP(CT_RaidTracker_GetCurrentRaid, getn(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"]));
                  
			      if (CT_RaidTracker_Options["NextBoss"] == 1) then
			      	CT_RaidTrackerNextBossFrame:Show();
			      end;
					
			      

				end
				
				--if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"][bosskilled]) then
				--	CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"][bosskilled] = sDate;
				--	CT_RaidTracker_Print("CT_RaidTracker Boss Kills: Set kill time for \""..bosskilled.."\" to "..sDate, 1, 1, 0);
				--end
			end
--		end
	elseif ( event == "UNIT_HEALTH" ) then
		-- check for wipe count
		if (CT_RaidTracker_Options["Wipe"] == 0) then
			return -- wipecounting is disabled 
		end;
		if (InCombatLockdown()) then
			return -- we are in combat and don't want to ask if this is a wipe if one of this members died and he tried to heal him ;-)
		end;
		if (not CT_RaidTracker_GetCurrentRaid) then
			return -- no raid tracking
		end;
		if (GetTime() < CT_RaidTracker_LastWipe) then
			return -- wipe cooldown
		end;
		local membercount = 0;
		local unitprefix = 0;
		local memberdead = 0;
		if ( GetNumRaidMembers() > 0) then -- in raid and active
			membercount = GetNumRaidMembers();
			unitprefix = "raid";
		elseif ( GetNumPartyMembers() > 0) then -- in group and active
			membercount = GetNumPartyMembers()+1;
			unitprefix = "party";
			if (UnitIsDeadOrGhost("player")) then
				memberdead = memberdead + 1;
			end;
		else
			return -- not in group
		end;
		for i = 1, membercount, 1 do
			if (UnitIsDeadOrGhost(unitprefix..i)) then
				memberdead = memberdead + 1;
			end;
		end;
		if (memberdead == membercount) then
			CT_RaidTracker_AddWipe();
			CT_RaidTrackerAcceptWipeFrame:Hide();
			return;
		end;
		if ((memberdead / membercount) > CT_RaidTracker_Options["WipePercent"]) then
			CT_RaidTrackerAcceptWipeFrame:Show();

		end;
	elseif ( event == "UPDATE_INSTANCE_INFO" ) then
		CT_RaidTracker_Debug("UPDATE_INSTANCE_INFO");
		CT_RaidTracker_DoRaidIdCheck();
	end
end

function CT_RaidTracker_CreateBoss(bossName,playerName,dkp)
   if (not CT_RaidTracker_GetCurrentRaid) then 
        CT_RaidTracker_Print("请先新建一个活动");
        return;
    end
    if (CT_RaidTrackerFrame.selected ~= CT_RaidTracker_GetCurrentRaid) then
        CT_RaidTracker_Print("请选择当前进行中的活动,然后进行加分");
        return;
   end 
    local tAttendees = { };
    local sDate = CT_RaidTracker_Date();
    				if playerName ~= nil then
    					tinsert(tAttendees, playerName);
					elseif( (CT_RaidTracker_Options["LogAttendees"] == 0) or (CT_RaidTracker_Options["LogAttendees"] == 1) or (CT_RaidTracker_Options["LogAttendees"] == 2)) then
						if( GetNumRaidMembers() > 0 ) then
							for i = 1, GetNumRaidMembers() do
								local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
								local name = UnitName("raid" .. i);
								if (name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
									if (CT_RaidTracker_Options["LogAttendees"] == 1)then
										if ( subgroup>0 and subgroup<7 ) then 
											tinsert(tAttendees, name);
										end;
									elseif (CT_RaidTracker_Options["LogAttendees"] == 2)then
										if ( subgroup>0 and subgroup<6 ) then 
											tinsert(tAttendees, name);
										end;
									else
										tinsert(tAttendees, name);
									end;
								end
							end
						elseif( (GetNumPartyMembers() > 0) and (CT_RaidTracker_Options["LogGroup"] == 1) ) then
							for i = 1, GetNumPartyMembers() do
								local name = UnitName("party" .. i);
								if (name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
									tinsert(tAttendees, name);
								end
							end
							--Party dosent include player, so add individual
							local name = UnitName("player");
							if (name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
								tinsert(tAttendees, name);
							end
						end
					end
				    tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"],
        				{
        					["boss"] = bossName,
        					["time"] = sDate,
        					["attendees"] = tAttendees
        				}
			            );
                     --   
			      --CT_RaidTracker_Print("CT_RaidTracker Boss 击杀: 设置 \""..bosskilled.."\" 击杀时间为 "..sDate, 1, 1, 0);
                  
    
    local bossid = getn(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"]);
    if dkp==nil then
   		 CT_RaidTracker_EditBossDKP(CT_RaidTracker_GetCurrentRaid,bossid);
    else
   	 CT_RaidTracker_SaveBossDKP(CT_RaidTracker_GetCurrentRaid , bossid, dkp);
    end    
    CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end



function CT_RaidTracker_AddWipe()
	CT_RaidTracker_Debug("WIPED");
	CT_RaidTracker_LastWipe = GetTime()+CT_RaidTracker_Options["WipeCoolDown"]; -- wait for 120 seconds
	if (CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["wipes"] == nil) then
		CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["wipes"] = {};
	end;
	tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["wipes"],time());
	CT_RaidTracker_Print("Wipe has been recorded!", 1, 1, 0);
end;

function CT_RaidTackes_NextBoss(name)
	CT_RaidTracker_Debug("NEXTBOSS",name);
	CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["nextboss"] = name;
end;

function CT_RaidTracker_DoZoneCheck()
	if(not CT_RaidTracker_GetCurrentRaid) then
		return;
	end
	local newzone = GetRealZoneText();
	CT_RaidTracker_Debug("Current Zone",newzone);
	local checkednewzone = "";
	local difficulty = 0;
	local difficulty_text = "";
	for k, v in pairs(CT_RaidTracker_ZoneTriggers) do
		if(newzone == k) then
			CT_RaidTracker_Debug("Zone is Instance",v);
			checkednewzone = v;            
			break;
		end
	end
	for k, v in pairs(CT_RaidTracker_CustomZoneTriggers) do
		if(newzone == k) then
			CT_RaidTracker_Debug("Zone is Custom Instance",v);
			checkednewzone = v;
			break;
		end
	end

	difficulty = GetInstanceDifficulty();
	difficulty = GetCurrentDungeonDifficulty();
	difficulty_text = CT_RaidTracker_DifficultyTable[difficulty];       
	CT_RaidTracker_Debug("Difficulty is",difficulty,difficulty_text);
	if (difficulty and CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["difficulty"] ~= difficulty) then
		CT_RaidTracker_Debug("Set Difficulty",difficulty,difficulty_text);
		CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["difficulty"] = difficulty;
	end
	if (checkednewzone == "") then
		return false;
	end;
	if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"]) then
		CT_RaidTracker_Debug("Set new Zone",checkednewzone);
		CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"] = checkednewzone;
	else
		CT_RaidTracker_Debug("Current Raid Zone",CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"]);
		if (CT_RaidTracker_Options["NewRaidOnNewZone"]==1) then
			if (checkednewzone ~= "") then
				if (CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"] ~= checkednewzone) then
					CT_RaidTracker_Debug("Create new Raid while zoning",CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"],newzone,checkednewzone);
					CT_RaidTracker_Print("Autocreating new Raid cause of zoning.");
					CT_RaidTracker_EditDKPSystem();
				end
			end
		end
	end

	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
	return true;
end

function CT_RaidTracker_DoRaidIdCheck()
	if(not CT_RaidTracker_GetCurrentRaid) then
		return;
	end
	local savedInstances = GetNumSavedInstances();
	local instanceName, instanceID, instanceReset;
	if ( savedInstances > 0 ) then
		for i=1, MAX_RAID_INFOS do
			if ( i <=  savedInstances) then
				instanceName, instanceID, instanceReset = GetSavedInstanceInfo(i);
				if (CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"] == instanceName) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["instanceid"] = instanceID;
					--CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["instancereset"] = instanceReset;
				end;
			end
			
		end
	end
end;


-- Item functions
function CT_RaidTracker_GetItemInfo(sItem)
	local sStart, sEnde, sColor, sItemName, sName = string.find(sItem, "|c(%x+)|Hitem:([-%d:]+)|h%[(.-)%]|h|r");
  CT_RaidTracker_Debug("sColor:", sColor,"sItemName:", sItemName,"sName:", sName);
	return sColor, sItemName, sName, sStart, sEnde;
end

SlashCmdList["RAIDTRACKER"] = function(msg)
	local _, _, command, args = string.find(msg, "(%w+)%s?(.*)");
	if(command) then
		command = strlower(command);
	end
	
	if(command == "debug") then
		if(args == "1") then
			CT_RaidTracker_Options["DebugFlag"] = 1;
			CT_RaidTracker_Print("Enabled Debug Output", 1, 1, 0);
		elseif(args == "0") then
			CT_RaidTracker_Options["DebugFlag"] = nil;
			CT_RaidTracker_Print("Disabled Debug Output", 1, 1, 0);
		else
			if(CT_RaidTracker_Options["DebugFlag"] == 1) then
				CT_RaidTracker_Print("Debug Output: Enabled", 1, 1, 0);
			else
				CT_RaidTracker_Print("Debug Output: Disabled", 1, 1, 0);
			end
		end
	elseif(command == "addwipe") then
		CT_RaidTracker_AddWipe();
	elseif(command == "deleteall") then
		CT_RaidTracker_Print("删除全部活动 "..getn(CT_RaidTracker_RaidLog).." Raids", 1, 1, 0);
		CT_RaidTracker_RaidLog = { };
		CT_RaidTracker_GetCurrentRaid = nil;
		CT_RaidTracker_UpdateView();
		CT_RaidTracker_Update();
	elseif(command == "additem") then
		if(args and args ~= "") then
			local sColor, sItem, sName, sStart, sEnde = CT_RaidTracker_GetItemInfo(args);
			if(sItem and sItem) then
				if (string.len(args) > sEnde+2) then
					sLooter = string.sub(args,sEnde+2);
					CT_RaidTracker_Debug("Looter",sLooter);
				else
					CT_RaidTracker_Debug("Kein Looter",sLooter);
					sLooter = "";
				end;
				if(CT_RaidTrackerFrame.selected) then
					local nameGIF, linkGIF, qualityGIF, iLevelGIF, minLevelGIF, classGIF, subclassGIF, maxStackGIF, invtypeGIV, iconGIF = GetItemInfo("item:"..sItem);
					if(iconGIF) then 
						_, _, iconGIF = string.find(iconGIF, "^.*\\(.*)$");
					end
					
					local tAttendees = { };
					
					
					local tTooltip = { };
					if(CT_RaidTracker_Options["SaveTooltips"] == 1) then
						tTooltip = CT_RaidTracker_GetItemTooltip(sItem);
					end
					
					local sTime = CT_RaidTracker_Date();
					tinsert(CT_RaidTracker_RaidLog[CT_RaidTrackerFrame.selected]["Loot"], 1,
						{
							["player"] = sLooter,
							["item"] = {						
								["c"] = sColor,
								["id"] = sItem,
								["tooltip"] = tTooltip,
								["name"] = sName,
								["icon"] = iconGIF,
								["count"] = 1,
								["class"] = classGIF,
								["subclass"] = subclassGIF,
							},
							["zone"] = GetRealZoneText(),
							["time"] = sTime,
							["attendees"] = tAttendees,
						}
					);
					CT_RaidTracker_Print("添加战利品:  "..sName .. "完成", 1, 1, 0);
					CT_RaidTracker_UpdateView();
					CT_RaidTracker_Update();
				else
					CT_RaidTracker_Print("添加战利品: 没有选择活动", 1, 1, 0);
				end
			else
				CT_RaidTracker_Print("添加战利品: 错误的战利品链接", 1, 1, 0);
			end
		else
			CT_RaidTracker_Print("添加战利品: 没有战利品链接", 1, 1, 0);
		end
	elseif(command == "io") then
		local idfound;
		for idtoadd in string.gmatch(args, "item:(%d+):") do
			idfound = nil;
			idtoadd = tonumber(idtoadd);
			for key, val in pairs(CT_RaidTracker_ItemOptions) do
				if(val["id"] == idtoadd) then
					idfound = true;
					break;
				end
			end
			if(idfound) then
				CT_RaidTracker_Print(idtoadd.." 已经在忽略的战利品选项列表", 1, 1, 0);
			else
				tinsert(CT_RaidTracker_ItemOptions, {["id"] = idtoadd});
				CT_RaidTracker_Print("添加 "..idtoadd.." 到忽略的战利品选项列表", 1, 1, 0);
				idfound = true;
			end
		end
		if(not idfound) then
			for idtoadd in string.gmatch(args, "(%d+)%s?") do
				idfound = nil;
				idtoadd = tonumber(idtoadd);
				CT_RaidTracker_Debug("idtoadd", idtoadd);
				for key, val in pairs(CT_RaidTracker_ItemOptions) do
					if(val["id"] == idtoadd) then
						idfound = true;
						break;
					end
				end
				if(idfound) then
					CT_RaidTracker_Print(idtoadd.." 已经在忽略的战利品选项列表", 1, 1, 0);
				else
					tinsert(CT_RaidTracker_ItemOptions, {["id"] = idtoadd});
					CT_RaidTracker_Print("添加 "..idtoadd.." 到忽略的战利品选项列表", 1, 1, 0);
				end
			end
		end
		CT_RaidTracker_ItemOptions_ScrollBar_Update();
		CT_RaidTrackerItemOptionsFrame:Show();
		
    elseif(command == "options") then
	    CT_RaidTrackerOptionsFrame:Show();
	elseif(command == "o") then
		CT_RaidTrackerOptionsFrame:Show();
	elseif(command == "join") then
		if(CT_RaidTrackerFrame.selected) then
			if(args and strlen(args) > 0) then
				CT_RaidTrackerJoinLeaveFrameNameEB:SetText(args);
			end
			CT_RaidTrackerJoinLeaveFrameTitle = "Join";
			CT_RaidTrackerJoinLeaveFrame.type = "Join";
			CT_RaidTrackerJoinLeaveFrame.raidid = CT_RaidTrackerFrame.selected;
			CT_RaidTrackerJoinLeaveFrame:Show();
		else
			CT_RaidTracker_Print("加入: 没有活动被选择", 1, 1, 0);
		end
	elseif(command == "leave") then
		if(CT_RaidTrackerFrame.selected) then
			if(args and strlen(args) > 0) then
				CT_RaidTrackerJoinLeaveFrameNameEB:SetText(args);
			end
			CT_RaidTrackerJoinLeaveFrameTitle = "Leave";
			CT_RaidTrackerJoinLeaveFrame.type = "Leave";
			CT_RaidTrackerJoinLeaveFrame.raidid = CT_RaidTrackerFrame.selected;
			CT_RaidTrackerJoinLeaveFrame:Show();
		else
			CT_RaidTracker_Print("加入: 没有活动被选择", 1, 1, 0);
		end
	elseif(command) then
		CT_RaidTracker_Print("/rt - 显示插件面板", 1, 1, 0);
		CT_RaidTracker_Print("/rt options/o - 显示选项面板", 1, 1, 0);
		CT_RaidTracker_Print("/rt io - 显示战利品控制面板", 1, 1, 0);
		CT_RaidTracker_Print("/rt io [ITEMLINK(S)/ITEMID(S)] - 添加忽略的战利品", 1, 1, 0);
		CT_RaidTracker_Print("/rt additem [ITEMLINK] [Looter]- 添加战利品到当前活动", 1, 1, 0);
		CT_RaidTracker_Print("/rt join [PLAYER] - 手动为当前活动添加一个玩家", 1, 1, 0);
		CT_RaidTracker_Print("/rt leave [PLAYER] - 手动删除当前活动里的一个玩家", 1, 1, 0);
		CT_RaidTracker_Print("/rt deleteall - 删除所有活动", 1, 1, 0);
		CT_RaidTracker_Print("/rt debug 0/1 - Enables/Disables 显示调试信息", 1, 1, 0);
		CT_RaidTracker_Print("/rt addwipe - 添加灭团记录", 1, 1, 0);
	else
		ShowUIPanel(CT_RaidTrackerFrame);	
	end
end

SLASH_RAIDTRACKER1 = "/raidtracker";
SLASH_RAIDTRACKER2 = "/rt";

function CT_RaidTracker_Print(msg, r, g, b)
	if ( CT_Print ) then
		CT_Print(msg, r, g, b);
	else
		DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b);
	end
end

function CT_RaidTracker_RarityDropDown_OnLoad()
	UIDropDownMenu_Initialize(this, CT_RaidTracker_RarityDropDown_Initialize);
	--UIDropDownMenu_SetWidth(130);
	UIDropDownMenu_SetSelectedID(CT_RaidTrackerRarityDropDown, 1);
end

-- Grey = 9d9d9d
-- White = ffffff
-- Green = 1eff00
-- Blue = 0070dd
-- Purple = a335ee
-- Orange = ff8000
-- Red e6cc80
function CT_RaidTracker_DKPSystemDropDown_Initialize()
	local info;
	for i = 1, #MerDKP_Table do
		info = {}
		info.text = MerDKP_Table[i].title
		info.value = MerDKP_Table[i].title
		info.func = function()
			local id = this:GetID()
			UIDropDownMenu_SetSelectedID(CT_RaidTracker_DKPSystemDropDown, id)
			UIDropDownMenu_SetSelectedID(MerDKPFrameListColumnHeader3, id)
			MerDKP.tmp.id = id
			MerDKP:InitDKP()
		end
		UIDropDownMenu_AddButton(info)
	end		
end

function CT_RaidTracker_PlayerDKPDropDown_Initialize()
	local info;
	if(CT_RaidTracker_GetCurrentRaid==nil) then
		return
	end
	for k, v in pairs(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"]) do
		info = {}
		info.text = k;
		info.value = k;
		info.func = function()
			local id = this:GetID()
			UIDropDownMenu_SetSelectedID(CT_RaidTracker_PlayerDKPDropDown, id)			
		end
		UIDropDownMenu_AddButton(info)
	end		
end


function CT_RaidTracker_RarityDropDown_Initialize()
	local info = {};
	info.text = "|c009d9d9d劣质|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	
	local info = {};
	info.text = "|c00ffffff普通|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = "|c001eff00优秀|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = "|c000070dd精良|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = "|c00a335ee史诗|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);

	info = {};
	info.text = "|c00ff8000传说|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
	
	info = {};
	info.text = "|c00e6cc80神器|r";
	info.func = CT_RaidTracker_RarityDropDown_OnClick;
	UIDropDownMenu_AddButton(info);
end


function CT_RaidTracker_RarityDropDown_OnClick()
	UIDropDownMenu_SetSelectedID(CT_RaidTrackerRarityDropDown, this:GetID());
	if ( CT_RaidTrackerFrame.type == "items" ) then
		CT_RaidTracker_SortOptions["itemfilter"] = this:GetID();
	else
		CT_RaidTracker_SortOptions["playeritemfilter"] = this:GetID();
	end
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_SelectItem(name)
	CT_RaidTracker_GetPage();
	CT_RaidTrackerFrame.type = "itemhistory";
	CT_RaidTrackerFrame.itemname = name;
	CT_RaidTrackerFrame.selected = nil;
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_GetPage()
	if ( CT_RaidTrackerFrame.type or CT_RaidTrackerFrame.itemname or CT_RaidTrackerFrame.selected or CT_RaidTrackerFrame.player ) then

		tinsert(CT_RaidTracker_LastPage,
			{
				["type"] = CT_RaidTrackerFrame.type,
				["itemname"] = CT_RaidTrackerFrame.itemname,
				["selected"] = CT_RaidTrackerFrame.selected,
				["player"] = CT_RaidTrackerFrame.player
			}
		);
	end

	if ( getn(CT_RaidTracker_LastPage) > 0 ) then
		CT_RaidTrackerFrameBackButton:Enable();
	else
		CT_RaidTrackerFrameBackButton:Disable();
	end
end

function CT_RaidTracker_GoBack()
	local t = table.remove(CT_RaidTracker_LastPage);

	if ( t ) then
		CT_RaidTrackerFrame.type = t["type"];
		CT_RaidTrackerFrame.itemname = t["itemname"];
		CT_RaidTrackerFrame.selected = t["selected"];
		CT_RaidTrackerFrame.player = t["player"];
		CT_RaidTracker_Update();
		CT_RaidTracker_UpdateView();
	end
	if ( getn(CT_RaidTracker_LastPage) > 0 ) then
		CT_RaidTrackerFrameBackButton:Enable();
	else
		--CT_RaidTrackerFrameBackButton:Disable();
	end
end

if ( CT_RegisterMod ) then
	CT_RaidTracker_DisplayWindow = function()
		ShowUIPanel(CT_RaidTrackerFrame);
	end
	CT_RegisterMod("Raid Tracker", "Display window", 5, "Interface\\Icons\\INV_Chest_Chain_05", "Displays the Raid Tracker window, which tracks raid loot & attendance.", "switch", "", CT_RaidTracker_DisplayWindow);
else
	--CT_RaidTracker_Print("<CTMod> CT_RaidTracker loaded. Type /rt to show the RaidTracker window.", 1, 1, 0);
end

function CT_RaidTracker_FixZero(num)
	if ( num < 10 ) then
		return "0" .. num;
	else
		return num;
	end
end

function CT_RaidTracker_Date()
	local timestamp;
	if(CT_RaidTracker_Options["TimeSync"] == 1) then
		timestamp = time()+CT_RaidTracker_TimeOffset+(CT_RaidTracker_Options["Timezone"]*3600);
	else
		timestamp = time()+(CT_RaidTracker_Options["Timezone"]*3600);
	end
	local t = date("*t", timestamp);
	return CT_RaidTracker_FixZero(t.month) .. "/" .. CT_RaidTracker_FixZero(t.day) .. "/" .. strsub(t.year, 3) .. " " .. CT_RaidTracker_FixZero(t.hour) .. ":" .. CT_RaidTracker_FixZero(t.min) .. ":" .. CT_RaidTracker_FixZero(t.sec);
end

function CT_RaidTrackerUpdateFrame_OnUpdate(elapsed)
	if ( this.time ) then
		this.time = this.time + elapsed;
		if ( this.time > 2 ) then
			this.time = nil;
			for k, v in pairs(CT_RaidTracker_Events) do
				CT_RaidTracker_OnEvent(v);
			end
		end
	end
end

function CT_RaidTrackerCreateNewRaid(system)
    if system ~= nil and strtrim(system) ~= "" then
        DKPSystem = getDKPSystemID(system);
        if DKPSystem == 0 then
            message("你选择的DKP系统不存在!");  
            return;
        end
    else
        DKPSystem = 0;
    end
	CT_RaidTracker_GetGameTimeOffset();
	local sDate = CT_RaidTracker_Date();
	if(CT_RaidTracker_GetCurrentRaid) then
		for k, v in pairs(CT_RaidTracker_Online) do
			CT_RaidTracker_Debug("ADDING LEAVE", k, sDate);
			tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
				{
					["player"] = k,
					["time"] = sDate,
				}
			);
		end
		if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"]) then
			CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"] = sDate;
		end
	end
	CT_RaidTracker_Online = { };
	CT_RaidTracker_Offline = { };
	tinsert(CT_RaidTracker_RaidLog, 1, { 
		["Loot"] = { },
		["Join"] = { },
		["Leave"] = { },
		["PlayerInfos"] = { },
		["BossKills"] = { },
		["BossKilled"] = { },
		["key"] = sDate,
		["Realm"] = GetRealmName(),
	});
	CT_RaidTracker_SortRaidTable();
	CT_RaidTracker_GetCurrentRaid = 1;
	if( GetNumRaidMembers() > 0 ) then
		for i = 1, GetNumRaidMembers(), 1 do
			local sPlayer = UnitName("raid" .. i);
			local _, race = UnitRace("raid" .. i);
			local sex = UnitSex("raid" .. i);
			local guild = GetGuildInfo("raid" .. i);
			local name, rank, subgroup, level, class, fileName, zone, online = GetRaidRosterInfo(i);
			if(sPlayer ~= UKNOWNBEING and name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name] = { };
				end
		--		if(CT_RaidTracker_Options["SaveExtendedPlayerInfo"] == 1) then
				    if(race) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["race"] = race; end
				    if(fileName) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["class"] = fileName; end
						if(sex) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["sex"] = sex; end
				    if(level > 0) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["level"] = level; end
				    if(guild) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["guild"] = guild; end
	--			end
				tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
					{
						["player"] = sPlayer,
						["time"] = sDate
					}
				);
				if ( not online ) then
					tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
						{
							["player"] = UnitName("raid" .. i),
							["time"] = sDate
						}
					);
				end
				CT_RaidTracker_Online[name] = online;
			end
		end
	elseif( (GetNumPartyMembers()  > 0) and (CT_RaidTracker_Options["LogGroup"] == 1) ) then
		for i = 1, GetNumPartyMembers(), 1 do
			local sPlayer = UnitName("party" .. i);
			local _, race = UnitRace("party" .. i);
			local sex = UnitSex("party" .. i);
			local guild = GetGuildInfo("party" .. i);
			local name = UnitName("party" .. i);
			local rank = UnitPVPRank("party" .. i);
			local level = UnitLevel("party" .. i);
			local _, class = UnitClass("party" .. i);
			local online = UnitIsConnected("party" .. i);
			if (class) then
				local fileName = string.upper(class);
			end;
			if(sPlayer ~= UKNOWNBEING and name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
				if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]) then
					CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name] = { };
				end
	--			if(CT_RaidTracker_Options["SaveExtendedPlayerInfo"] == 1) then
				    if(race) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["race"] = race; end
				    if(fileName) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["class"] = fileName; end
						if(sex) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["sex"] = sex; end
				    if(level > 0) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["level"] = level; end
				    if(guild) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["guild"] = guild; end
	--			end
				tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
					{
						["player"] = sPlayer,
						["time"] = sDate
					}
				);
				if ( not online ) then
					tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
						{
							["player"] = name,
							["time"] = sDate
						}
					);
				end
				CT_RaidTracker_Online[name] = online;
			end
		end
		
		--Player isnt in party so add individual
		
		local sPlayer = UnitName("player");
		local _, race = UnitRace("player");
		local sex = UnitSex("player");
		local guild = GetGuildInfo("player");
		local name = UnitName("player");
		local rank = UnitPVPRank("player");
		local level = UnitLevel("player");
		local _, class = UnitClass("player");
		local online = UnitIsConnected("player");
		local fileName = string.upper(class);
		if(sPlayer ~= UKNOWNBEING and name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
			if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]) then
				CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name] = { };
			end
--			if(CT_RaidTracker_Options["SaveExtendedPlayerInfo"] == 1) then
			    if(race) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["race"] = race; end
			    if(fileName) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["class"] = fileName; end
					if(sex) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["sex"] = sex; end
			    if(level > 0) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["level"] = level; end
			    if(guild) then CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["PlayerInfos"][name]["guild"] = guild; end
		--	end
			tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Join"],
				{
					["player"] = sPlayer,
					["time"] = sDate
				}
			);
			if ( not online ) then
				tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
					{
						["player"] = name,
						["time"] = sDate
					}
				);
			end
			CT_RaidTracker_Online[name] = online;
		end
	end
	if(CT_RaidTracker_Options["AutoZone"] == 1) then
		CT_RaidTracker_DoZoneCheck()
	end
	CT_RaidTracker_Debug("Joined new raid at " .. sDate);
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTrackerEndRaid()
    local raidendtime = CT_RaidTracker_Date();
    if(CT_RaidTracker_GetCurrentRaid) then
        CT_RaidTracker_Print("活动结束时间 "..raidendtime, 1, 1, 0);
    	for k, v in pairs(CT_RaidTracker_Online) do
    		CT_RaidTracker_Debug("ADDING LEAVE", k, raidendtime);
    		tinsert(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Leave"],
    			{
    				["player"] = k,
    				["time"] = raidendtime,
    			}
    		);
    	end
    	if(not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"]) then
    		CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["End"] = raidendtime;
    	end
    	CT_RaidTracker_GetCurrentRaid = nil;
    	CT_RaidTracker_Debug("Left raid.","CT_RaidTrackerEndRaid");
    	CT_RaidTracker_Online = { };
    	CT_RaidTracker_UpdateView();
    	CT_RaidTracker_Update();
    end
end

function CT_RaidTrackerSnapshotRaid()
    local sDate = CT_RaidTracker_Date();
    local newraid = {};
    if(CT_RaidTracker_GetCurrentRaid) then
        CT_RaidTracker_Print("复制当前活动", 1, 1, 0);
        tinsert(CT_RaidTracker_RaidLog, 2, { 
    		["Loot"] = { },
    		["Join"] = { },
    		["Leave"] = { },
    		["PlayerInfos"] = { },
    		["BossKills"] = { },
		["BossKilled"] = { },
    		["key"] = sDate,
    		["End"] = sDate,
	        });
	    if(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Zone"]) then
	        CT_RaidTracker_RaidLog[2]["Zone"] = CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["Zone"];
	    end
	    
	    for k, v in pairs(CT_RaidTracker_Online) do
            CT_RaidTracker_RaidLog[2]["PlayerInfos"][k] = {};
            tinsert(CT_RaidTracker_RaidLog[2]["Join"], {
                ["player"] = k,
                ["time"] = sDate 
                });
            tinsert(CT_RaidTracker_RaidLog[2]["Leave"], {
                ["player"] = k,
                ["time"] = sDate 
                });
	    end
	    CT_RaidTracker_UpdateView();
    	CT_RaidTracker_Update();
    end
end	


PlayerGroupsIndexes = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};

function CT_RaidTracker_GetPlayerIndexes(raidid)
	local PlayerIndexes = { };
	local PlayerFound = nil;
	if(CT_RaidTracker_RaidLog[raidid]) then
		for k, v in pairs(CT_RaidTracker_RaidLog[raidid]["PlayerInfos"]) do
			if ( k ) then
				PlayerFound = false;
				for k2, v2 in pairs(PlayerIndexes) do
					if(v2 == k) then
						PlayerFound = true;
						break;
					end
				end
				if(not PlayerFound) then
					tinsert(PlayerIndexes, k);
				end
			end
		end
	end
	table.sort(PlayerIndexes);
	return PlayerIndexes;
end

function CT_RaidTracker_GetPlayerGroups(raidid)
	local PlayerIndexes = CT_RaidTracker_GetPlayerIndexes(raidid);
	local PlayerGroups = { };
	local PlayerGroup;
	local Classes;
	for k, v in pairs(PlayerIndexes) do		
		Classes = CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][v]["class"];
		
		PlayerGroup = CT_RaidTracker_PlayerGroupIndex(CT_RaidTracker_ClassTable[Classes]);
		if(not PlayerGroups[PlayerGroup]) then
			PlayerGroups[PlayerGroup] = { };
		end
		tinsert(PlayerGroups[PlayerGroup], v);
	end
	return PlayerGroups;
end

function CT_RaidTracker_PlayerGroupIndex(letter)
	if(letter == '' or letter == nil ) then 
		return '未知职业';
	end
	for k, v in pairs(PlayerGroupsIndexes) do
		if(v == letter) then
			return k;
		end
	end
	return '未知职业';
end

function CT_RaidTracker_StripSpecialChars(sstring)
	
	sstring = string.gsub(sstring, "\194\161", "!");
	sstring = string.gsub(sstring, "\194\170", "a");
	sstring = string.gsub(sstring, "\194\186", "o");
	sstring = string.gsub(sstring, "\194\191", "?");
	sstring = string.gsub(sstring, "\195\128", "A");
	sstring = string.gsub(sstring, "\195\129", "A");
	sstring = string.gsub(sstring, "\195\130", "A");
	sstring = string.gsub(sstring, "\195\131", "A");
	sstring = string.gsub(sstring, "\195\133", "A");
	sstring = string.gsub(sstring, "\195\135", "C");
	sstring = string.gsub(sstring, "\195\136", "E");
	sstring = string.gsub(sstring, "\195\137", "E");
	sstring = string.gsub(sstring, "\195\138", "E");
	sstring = string.gsub(sstring, "\195\139", "E");
	sstring = string.gsub(sstring, "\195\140", "I");
	sstring = string.gsub(sstring, "\195\141", "I");
	sstring = string.gsub(sstring, "\195\142", "I");
	sstring = string.gsub(sstring, "\195\143", "I");
	sstring = string.gsub(sstring, "\195\144", "D");
	sstring = string.gsub(sstring, "\195\145", "N");
	sstring = string.gsub(sstring, "\195\146", "O");
	sstring = string.gsub(sstring, "\195\147", "O");
	sstring = string.gsub(sstring, "\195\148", "O");
	sstring = string.gsub(sstring, "\195\149", "O");
	sstring = string.gsub(sstring, "\195\152", "O");
	sstring = string.gsub(sstring, "\195\153", "U");
	sstring = string.gsub(sstring, "\195\154", "U");
	sstring = string.gsub(sstring, "\195\155", "U");
	sstring = string.gsub(sstring, "\195\157", "Y");
	sstring = string.gsub(sstring, "\195\160", "a");
	sstring = string.gsub(sstring, "\195\161", "a");
	sstring = string.gsub(sstring, "\195\162", "a");
	sstring = string.gsub(sstring, "\195\163", "a");
	sstring = string.gsub(sstring, "\195\165", "a");
	sstring = string.gsub(sstring, "\195\167", "c");
	sstring = string.gsub(sstring, "\195\168", "e");
	sstring = string.gsub(sstring, "\195\169", "e");
	sstring = string.gsub(sstring, "\195\170", "e");
	sstring = string.gsub(sstring, "\195\171", "e");
	sstring = string.gsub(sstring, "\195\172", "i");
	sstring = string.gsub(sstring, "\195\173", "i");
	sstring = string.gsub(sstring, "\195\174", "i");
	sstring = string.gsub(sstring, "\195\175", "i");
	sstring = string.gsub(sstring, "\195\176", "d");
	sstring = string.gsub(sstring, "\195\177", "n");
	sstring = string.gsub(sstring, "\195\178", "o");
	sstring = string.gsub(sstring, "\195\179", "o");
	sstring = string.gsub(sstring, "\195\180", "o");
	sstring = string.gsub(sstring, "\195\181", "o");
	sstring = string.gsub(sstring, "\195\184", "o");
	sstring = string.gsub(sstring, "\195\185", "u");
	sstring = string.gsub(sstring, "\195\186", "u");
	sstring = string.gsub(sstring, "\195\187", "u");
	sstring = string.gsub(sstring, "\195\189", "y");
	sstring = string.gsub(sstring, "\195\191", "y");
	sstring = string.gsub(sstring, "\195\132", "Ae");
	sstring = string.gsub(sstring, "\195\134", "AE");
	sstring = string.gsub(sstring, "\195\150", "Oe");
	sstring = string.gsub(sstring, "\195\156", "Ue");
	sstring = string.gsub(sstring, "\195\158", "TH");
	sstring = string.gsub(sstring, "\195\159", "ss");
	sstring = string.gsub(sstring, "\195\164", "ae");
	sstring = string.gsub(sstring, "\195\166", "ae");
	sstring = string.gsub(sstring, "\195\182", "oe");
	sstring = string.gsub(sstring, "\195\188", "ue");
	sstring = string.gsub(sstring, "\195\190", "th");
	return sstring;
end

function CT_RaidTrackerShowDkpLink(link)
	URLFrameEditBox:SetText(link);
	URLFrameEditBox:HighlightText();
	URLFrame:Show();
end

function CT_RaidTrackerGenerateMLdkpXML(id)
	local race, class, level, sex;
	
	if (not CT_RaidTracker_RaidLog[id]["End"]) then
		CT_RaidTracker_Print("请结束活动后再导出到多玩DKP");
		return;
	end;
	
	local xml ='<?xml version="1.0"?>';
	xml = xml..'<!DOCTYPE ML_Raidtracker PUBLIC "-//MLdkp//DTD ML_Raidtracker V 1.5//EN" "http://www.mldkp.net/dtds/1.0/ML_Raidtracker.dtd">';
	
	xml = xml.."<raidinfo>";
	xml = xml.."<version>1.5</version>";
	
	xml = xml.."<start>"..CT_RaidTracker_GetTime(CT_RaidTracker_RaidLog[id]["key"]).."</start>";
	xml = xml.."<end>"..CT_RaidTracker_GetTime(CT_RaidTracker_RaidLog[id]["End"]).."</end>";

	if(CT_RaidTracker_RaidLog[id]["Realm"]) then
		xml = xml.."<realm>"..CT_RaidTracker_RaidLog[id]["Realm"].."</realm>";
	end

	if(CT_RaidTracker_RaidLog[id]["zone"]) then
		xml = xml.."<zone>"..CT_RaidTracker_RaidLog[id]["zone"].."</zone>";
	end
    
    if(CT_RaidTracker_RaidLog[id]["difficulty"]) then
        xml = xml.."<difficulty>"..CT_RaidTracker_RaidLog[id]["difficulty"].."</difficulty>";
    end
    
	if(CT_RaidTracker_RaidLog[id]["instanceid"]) then
		xml = xml.."<instanceid>"..CT_RaidTracker_RaidLog[id]["instanceid"].."</instanceid>";
	end
	xml = xml.."<exporter>"..UnitName("Player").."</exporter>";
	
	if(CT_RaidTracker_RaidLog[id]["PlayerInfos"]) then
		xml = xml.."<playerinfos>";
		for key, val in pairs(CT_RaidTracker_RaidLog[id]["PlayerInfos"]) do
			xml = xml.."<player>";
			xml = xml.."<name>"..key.."</name>";
			for key2, val2 in pairs(CT_RaidTracker_RaidLog[id]["PlayerInfos"][key]) do
				if(key2 == "note") then
					xml = xml.."<"..key2.."><![CDATA["..val2.."]]></"..key2..">";
				elseif (key2 == "class") then
					xml = xml.."<"..key2..">"..CT_RaidTracker_ClassTable[val2].."</"..key2..">";
				elseif (key2 == "race") then
					xml = xml.."<"..key2..">"..CT_RaidTracker_RaceTable[val2].."</"..key2..">";
				elseif (key2 == "level") then
					if (CT_RaidTracker_Options["MaxLevel"] ~= val2) then
						xml = xml.."<"..key2..">"..val2.."</"..key2..">";
					end;
				else
					xml = xml.."<"..key2..">"..val2.."</"..key2..">";
				end
			end
			xml = xml.."</player>";
		end
		xml = xml.."</playerinfos>";
	end
	if(CT_RaidTracker_RaidLog[id]["BossKills"]) then
		local bosskillsindex = 1;
		xml = xml.."<bosskills>";
		for key, val in pairs(CT_RaidTracker_RaidLog[id]["BossKills"]) do
			xml = xml.."<bosskill>";
			xml = xml.."<name>"..val["boss"].."</name>";
			xml = xml.."<time>"..CT_RaidTracker_GetTime(val["time"]).."</time>";
			xml = xml.."</bosskill>";
		end
		xml = xml.."</bosskills>";
	end
	if(CT_RaidTracker_RaidLog[id]["wipes"]) then
		xml = xml.."<wipes>";
		for key, val in pairs(CT_RaidTracker_RaidLog[id]["wipes"]) do
			xml = xml.."<wipe><time>"..val.."</time></wipe>";
		end
		xml = xml.."</wipes>";
	end
	if(CT_RaidTracker_RaidLog[id]["nextboss"]) then
		xml = xml.."<nextboss>"..CT_RaidTracker_RaidLog[id]["nextboss"].."</nextboss>";
	end

	if(CT_RaidTracker_RaidLog[id]["note"]) then 
		xml = xml.."<note><![CDATA["..CT_RaidTracker_RaidLog[id]["note"].."]]></note>"; 
	end

	xml = xml.."<joins>";
	for key, val in pairs(CT_RaidTracker_RaidLog[id]["Join"]) do
		xml = xml.."<join>";
		xml = xml.."<player>"..val["player"].."</player>";
		xml = xml.."<time>"..CT_RaidTracker_GetTime(val["time"]).."</time>";
		xml = xml.."</join>";
	end
	xml = xml.."</joins>";
	xml = xml.."<leaves>";
	for key, val in pairs(CT_RaidTracker_RaidLog[id]["Leave"]) do
		xml = xml.."<leave>";
		xml = xml.."<player>"..val["player"].."</player>";
		xml = xml.."<time>"..CT_RaidTracker_GetTime(val["time"]).."</time>";
		xml = xml.."</leave>";
	end
	xml = xml.."</leaves>";
	xml = xml.."<loots>";
	for key, val in pairs(CT_RaidTracker_RaidLog[id]["Loot"]) do
		xml = xml.."<loot>";
		xml = xml.."<itemname>"..val["item"]["name"].."</itemname>";
		xml = xml.."<itemid>"..val["item"]["id"].."</itemid>";
		xml = xml.."<count>"..val["item"]["count"].."</count>";
		xml = xml.."<player>"..val["player"].."</player>";
		xml = xml.."<icon>"..val["item"]["icon"].."</icon>";
		xml = xml.."<class>"..val["item"]["class"].."</class>";
		xml = xml.."<subclass>"..val["item"]["subclass"].."</subclass>";
		xml = xml.."<color>"..val["item"]["c"].."</color>";
		if(val["costs"]) then
			xml = xml.."<costs>"..val["costs"].."</costs>";
		end
		xml = xml.."<time>"..CT_RaidTracker_GetTime(val["time"]).."</time>";
        if(CT_RaidTracker_RaidLog[id]["difficulty"]) then
            xml = xml.."<difficulty>"..CT_RaidTracker_RaidLog[id]["difficulty"].."</difficulty>";
        end
		if(val["zone"]) then 
			xml = xml.."<zone>"..val["zone"].."</zone>";
		end
		if(val["boss"]) then 
			xml = xml.."<boss>"..val["boss"].."</boss>";
		end
		if(val["note"]) then 
			xml = xml.."<note><![CDATA["..val["note"].."]]></note>";
		end
		val["item"]["tooltip"] = CT_RaidTracker_GetItemTooltip(val["item"]["id"]);
		xml = xml.."<tooltip>"..val["item"]["tooltip"].."</tooltip>";
		xml = xml.."</loot>";
	end
	xml = xml.."</loots>";
	xml = xml.."</raidinfo>";
	CT_RaidTrackerShowDkpLink(xml);
end

function CT_RaidTrackerGenerateDkpLink(id)
	local race, class, level, sex;
	if (CT_RaidTracker_Options["ExportFormat"]==2) then
		CT_RaidTrackerGenerateMLdkpXML(id);
		return;
	end;
	local link = "<RaidInfo>";	
	
	if(CT_RaidTracker_Options["ExportFormat"] == 0) then
		link = link.."<key>"..CT_RaidTracker_RaidLog[id]["key"].."</key>";
	end
	if (CT_RaidTracker_RaidLog[id]["Realm"]) then
		link = link.."<realm>"..CT_RaidTracker_RaidLog[id]["Realm"].."</realm>";
	end
	
	if(CT_RaidTracker_Options["ExportFormat"] == 1) then
		link = link.."<start>"..CT_RaidTracker_GetTime(CT_RaidTracker_RaidLog[id]["key"]).."</start>";
	else
		link = link.."<start>"..CT_RaidTracker_RaidLog[id]["key"].."</start>";
	end
	
	if(CT_RaidTracker_RaidLog[id]["End"]) then
		if(CT_RaidTracker_Options["ExportFormat"] == 1) then
			link = link.."<end>"..CT_RaidTracker_GetTime(CT_RaidTracker_RaidLog[id]["End"]).."</end>";
		else
			link = link.."<end>"..CT_RaidTracker_RaidLog[id]["End"].."</end>";
		end
	end
	if(CT_RaidTracker_RaidLog[id]["zone"]) then
		link = link.."<zone>"..CT_RaidTracker_RaidLog[id]["zone"].."</zone>";
	end
    if(CT_RaidTracker_RaidLog[id]["difficulty"]) then
        link = link.."<difficulty>"..CT_RaidTracker_RaidLog[id]["difficulty"].."</difficulty>";
    end
	if(CT_RaidTracker_RaidLog[id]["PlayerInfos"]) then
		link = link.."<PlayerInfos>";
		local playerinfosindex = 1;
		for key, val in pairs(CT_RaidTracker_RaidLog[id]["PlayerInfos"]) do
			link = link.."<key"..playerinfosindex..">";
			link = link.."<name>"..key.."</name>";
			for key2, val2 in pairs(CT_RaidTracker_RaidLog[id]["PlayerInfos"][key]) do
				if(key2 == "note") then
					link = link.."<"..key2.."><![CDATA["..val2.."]]></"..key2..">";
				
				else
					link = link.."<"..key2..">"..val2.."</"..key2..">";
				end
			end
			link = link.."</key"..playerinfosindex..">";
			playerinfosindex = playerinfosindex + 1;
		end
		link = link.."</PlayerInfos>";
	end
	if(CT_RaidTracker_RaidLog[id]["BossKills"]) then
		local bosskillsindex = 1;
		link = link.."<BossKills>";
		for key, val in pairs(CT_RaidTracker_RaidLog[id]["BossKills"]) do
			link = link.."<key"..bosskillsindex..">";
			link = link.."<name>"..val["boss"].."</name>";
            if(val["dkp"]) then
                link = link.."<dkp>"..val["dkp"].."</dkp>";
            else
                link = link.."<dkp>".."0".."</dkp>";
            end
			if(CT_RaidTracker_Options["ExportFormat"] == 1) then
				link = link.."<time>"..CT_RaidTracker_GetTime(val["time"]).."</time>";
			else
				link = link.."<time>"..val["time"].."</time>";
				if( CT_RaidTracker_RaidLog[id]["BossKills"][key]["attendees"]) then
					link = link.."<attendees>";
					for key2, val2 in pairs(CT_RaidTracker_RaidLog[id]["BossKills"][key]["attendees"]) do
						link = link.."<key"..key2..">";
						link = link.."<name>"..val2.."</name>";
						link = link.."</key"..key2..">";
					end
					link = link.."</attendees>";
				end
			end
			link = link.."</key"..bosskillsindex..">";
			bosskillsindex = bosskillsindex + 1;
		end
		link = link.."</BossKills>";
	end
	-- new exports
	if(CT_RaidTracker_RaidLog[id]["wipes"]) then
		link = link.."<Wipes>";
		for key, val in pairs(CT_RaidTracker_RaidLog[id]["wipes"]) do
			link = link.."<Wipe>"..val.."</Wipe>";
		end
		link = link.."</Wipes>";
	end
	if(CT_RaidTracker_RaidLog[id]["nextboss"]) then
		link = link.."<NextBoss>"..CT_RaidTracker_RaidLog[id]["nextboss"].."</NextBoss>";
	end
	--	
	if(CT_RaidTracker_Options["ExportFormat"] == 0) then
			local sNote = "<note><![CDATA[";
			if(CT_RaidTracker_RaidLog[id]["note"]) then sNote = sNote..CT_RaidTracker_RaidLog[id]["note"]; end
			if(CT_RaidTracker_RaidLog[id]["zone"]) then sNote = sNote.." - Zone: "..CT_RaidTracker_RaidLog[id]["zone"]; end
			sNote = sNote.."]]></note>";
			link = link..sNote;
		else
			if(CT_RaidTracker_RaidLog[id]["note"]) then link = link.."<note><![CDATA["..CT_RaidTracker_RaidLog[id]["note"].."]]></note>"; end
		end
	
	link = link.."<Loot>";
    local lootIndex = 1;
	for key, val in pairs(CT_RaidTracker_RaidLog[id]["Loot"]) do
        if val["costs"]~=nil and val["costs"]~="0" and val["costs"]~=0 then
		link = link.."<key"..lootIndex..">";
		link = link.."<ItemName>"..val["item"]["name"].."</ItemName>";
		link = link.."<ItemID>"..val["item"]["id"].."</ItemID>";
		if(val["item"]["icon"]) then link = link.."<Icon>"..val["item"]["icon"].."</Icon>"; end
		if(val["item"]["class"]) then link = link.."<Class>"..val["item"]["class"].."</Class>"; end
		if(val["item"]["subclass"]) then link = link.."<SubClass>"..val["item"]["subclass"].."</SubClass>"; end
		link = link.."<Color>"..val["item"]["c"].."</Color>";
		link = link.."<Count>"..val["item"]["count"].."</Count>";
		link = link.."<Player>"..val["player"].."</Player>";
		if(val["costs"]) then
			link = link.."<Costs>"..val["costs"].."</Costs>";
		end
		if(CT_RaidTracker_Options["ExportFormat"] == 1) then
			link = link.."<Time>"..CT_RaidTracker_GetTime(val["time"]).."</Time>";
		else
			link = link.."<Time>"..val["time"].."</Time>";
		end
    if(val["difficulty"]) then
        difficulty_text = " ("..CT_RaidTracker_DifficultyTable[val["difficulty"]]..")";
    else
        difficulty_text = "";
    end
		if(val["zone"]) then link = link.."<Zone>"..val["zone"].."</Zone>"; end
        if(CT_RaidTracker_RaidLog[id]["difficulty"]) then link = link.."<Difficulty>"..CT_RaidTracker_RaidLog[id]["difficulty"].."</Difficulty>"; end
		if(val["boss"]) then link = link.."<Boss>"..val["boss"].."</Boss>"; end

		val["item"]["tooltip"] = CT_RaidTracker_GetItemTooltip(val["item"]["id"]);
		link = link.."<tooltip>"..val["item"]["tooltip"].."</tooltip>";
		
		if(CT_RaidTracker_Options["ExportFormat"] == 0) then
			local sNote = "<Note><![CDATA[";
			if(val["note"]) then sNote = sNote..val["note"]; end
			if(val["zone"]) then sNote = sNote.." - Zone: "..val["zone"]..difficulty_text; end
			if(val["boss"]) then sNote = sNote.." - Boss: "..val["boss"]; end
			if(val["costs"]) then sNote = sNote.." - "..val["costs"].." DKP"; end
			sNote = sNote.."]]></Note>";
			link = link..sNote;
		else
			if(val["note"]) then link = link.."<Note><![CDATA["..val["note"].."]]></Note>"; end
		end
		link = link.."</key"..lootIndex..">";
        lootIndex = lootIndex + 1;
        end
	end
	link = link.."</Loot>";
	link = link.."</RaidInfo>";
	CT_RaidTrackerShowDkpLink(link);
end

-- Editing
function CT_RaidTracker_EditDKPSystem()
    CT_RaidTrackerEditNoteFrame.type = "DKPSystem";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.bossid = bossid;      
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditBossDKP(raidid, bossid)
    CT_RaidTrackerEditNoteFrame.type = "bossDKP";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.bossid = bossid;     
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditPlayerNote(raidid, playerid)
    CT_RaidTrackerEditNoteFrame.type = "playernote";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.playerid = playerid;
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditRaidNote(raidid)
	CT_RaidTrackerEditNoteFrame:Hide();
	CT_RaidTrackerEditNoteFrame.type = "raidnote";
	CT_RaidTrackerEditNoteFrame.raidid = raidid;
	CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditItemNote(raidid, itemid)
    CT_RaidTrackerEditNoteFrame.type = "itemnote";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.itemid = itemid;
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditItemCount(raidid, itemid)
    CT_RaidTrackerEditNoteFrame.type = "itemcount";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.itemid = itemid;
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditCosts(raidid, itemid)
    CT_RaidTrackerEditCostFrame.type = "itemcost";
    CT_RaidTrackerEditCostFrame.raidid = raidid;
    CT_RaidTrackerEditCostFrame.itemid = itemid;
    CT_RaidTrackerEditCostFrame:Show();
end

function CT_RaidTracker_EditLooter(raidid, itemid)
	CT_RaidTracker_Debug("CT_RaidTracker_EditLooter", raidid, itemid);
	CT_RaidTrackerEditNoteFrame.type = "looter";
    CT_RaidTrackerEditNoteFrame.raidid = raidid;
    CT_RaidTrackerEditNoteFrame.itemid = itemid;
    CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditTime(raidid, what)
	-- what: raidend/raidstart
 	CT_RaidTrackerEditNoteFrame.type = "time";
 	CT_RaidTrackerEditNoteFrame.what = what;
	CT_RaidTrackerEditNoteFrame.raidid = raidid;
	CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditItemTime(raidid, itemid)
 	CT_RaidTrackerEditNoteFrame.type = "time";
 	CT_RaidTrackerEditNoteFrame.what = "item";
	CT_RaidTrackerEditNoteFrame.raidid = raidid;
	CT_RaidTrackerEditNoteFrame.itemid = itemid;
	CT_RaidTrackerEditNoteFrame:Show();
end

function CT_RaidTracker_EditZone(raidid)
	CT_RaidTrackerEditNoteFrame.type = "zone";
	CT_RaidTrackerEditNoteFrame.raidid = raidid;
	CT_RaidTrackerEditNoteFrame:Show();
end



function CT_RaidTracker_EditNote_OnShow()
	local text;
	--CT_RaidTracker_Print(this.type);
	if ( this.itemid ) then
		CT_RaidTrackerEditNoteFrame.itemitemid = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["id"];
		CT_RaidTrackerEditNoteFrame.itemtime = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["time"];
		CT_RaidTrackerEditNoteFrame.itemplayer = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["player"];
	end
	
	if ( this.type == "raidnote" ) then
	    local raidkey = CT_RaidTracker_RaidLog[this.raidid]["key"];
	    dwGetglobal(this:GetName() .. "Title"):SetText("编辑活动的备注");
	    dwGetglobal(this:GetName() .. "Editing"):SetText("编辑 \"|c" .. "0000ff00" .. "" .. raidkey .. "|r\" 活动的备注");
			text = CT_RaidTracker_RaidLog[this.raidid]["note"];
	
	elseif ( this.type == "itemnote" ) then
	    local itemname = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["name"];
	    local itemcolor = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["c"];
	    dwGetglobal(this:GetName() .. "Title"):SetText("编辑备注");
	    dwGetglobal(this:GetName() .. "Editing"):SetText("编辑 \"|c" .. itemcolor .. "" .. itemname .. "|r\" 的备注");
			text = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["note"];
	
	elseif ( this.type == "itemcount" ) then
	    local itemname = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["name"];
	    local itemcolor = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["c"];
	    dwGetglobal(this:GetName() .. "Title"):SetText("编辑数量");
	    dwGetglobal(this:GetName() .. "Editing"):SetText("编辑 \"|c" .. itemcolor .. "" .. itemname .. "|r\" 的数量");
			text = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["count"];
	
	elseif ( this.type == "playernote") then
	    dwGetglobal(this:GetName() .. "Title"):SetText("编辑备注");
	    dwGetglobal(this:GetName() .. "Editing"):SetText("编辑 \"" .. this.playerid .. "\" 的备注");
	    if( CT_RaidTracker_RaidLog[this.raidid]["PlayerInfos"][this.playerid] and CT_RaidTracker_RaidLog[this.raidid]["PlayerInfos"][this.playerid]["note"] ) then
		    text = CT_RaidTracker_RaidLog[this.raidid]["PlayerInfos"][this.playerid]["note"];
			end
	
	elseif(this.type == "looter") then
	    local itemname = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["name"];
	    local itemcolor = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["item"]["c"];
	    local looter = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["player"];
	    dwGetglobal(this:GetName() .. "Title"):SetText("修改战利品的获得者");
	    dwGetglobal(this:GetName() .. "Editing"):SetText("修改 \"|c" .. itemcolor .. "" .. itemname .. "|r\" 的获得者");
	    text = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["player"];
	
	elseif(this.type == "time") then
	    dwGetglobal(this:GetName() .. "Title"):SetText("编辑时间");
	    if(this.what == "raidend") then
	        dwGetglobal(this:GetName() .. "Editing"):SetText("编辑活动的结束时间");
		    text = CT_RaidTracker_RaidLog[this.raidid]["End"];
	    elseif(this.what == "raidstart") then
	      dwGetglobal(this:GetName() .. "Editing"):SetText("编辑活动的开始时间");
		    text = CT_RaidTracker_RaidLog[this.raidid]["key"];
		  elseif(this.what == "item") then
	      dwGetglobal(this:GetName() .. "Editing"):SetText("编辑拾取时间");
		    text = CT_RaidTracker_RaidLog[this.raidid]["Loot"][this.itemid]["time"];
	    end
	    
	elseif(this.type == "zone") then
	    local raidkey = CT_RaidTracker_RaidLog[this.raidid]["key"];
	    text = CT_RaidTracker_RaidLog[this.raidid]["zone"];
	    dwGetglobal(this:GetName() .. "Title"):SetText("编辑活动名称");
	    dwGetglobal(this:GetName() .. "Editing"):SetText("为 \"|c" .. "0000ff00" .. "" .. raidkey .. "|r\" 编辑活动名称");
        
    elseif(this.type == "bossDKP") then
        --CT_RaidTracker_Print(this.type.."suc");
	     local bossName = CT_RaidTracker_RaidLog[this.raidid]["BossKills"][this.bossid]["boss"];
	    --text = CT_RaidTracker_RaidLog[this.raidid]["zone"];       
	    dwGetglobal(this:GetName() .. "Title"):SetText("集体加/减分");
	    dwGetglobal(this:GetName() .. "Editing"):SetText("为 \"|c" .. "0000ff00" .. "" .. bossName .. "|r\" 编辑集体加/减分,正数为加,负数为减");
    elseif(this.type == "DKPSystem") then
        --CT_RaidTracker_Print(this.type.."suc");
	  --   local bossName = CT_RaidTracker_RaidLog[this.raidid]["BossKills"][this.bossid]["boss"];
	    --text = CT_RaidTracker_RaidLog[this.raidid]["zone"];       
	    dwGetglobal(this:GetName() .. "NoteEB"):Hide();
	    CT_RaidTracker_DKPSystemDropDown:Show();
	    dwGetglobal(this:GetName() .. "Title"):SetText("选择要使用的DKP系统");
	    dwGetglobal(this:GetName() .. "Editing"):SetText("如果没有从网站下载数据请直接点确定");	   
        if MerDKP_Table[DKPSystem]~=nil then       
            text = MerDKP_Table[DKPSystem]["title"];
        elseif DKPSystem == 0 and getn(MerDKP_Table)~=0 then
            text = MerDKP_Table[1]["title"];
        else
            text = "";
        end
    end
	
	if ( text ) then
		dwGetglobal(this:GetName() .. "NoteEB"):SetText(text);
		dwGetglobal(this:GetName() .. "NoteEB"):HighlightText();
	else
		dwGetglobal(this:GetName() .. "NoteEB"):SetText("");
	end
end

function CT_RaidTracker_SaveCost(option)
	local text = CT_RaidTrackerEditCostFrameNoteEB:GetText();
	local raidid = CT_RaidTrackerEditCostFrame.raidid;
	local lootid;
	local looter;
	local preText;
	local change;

	if(CT_RaidTrackerEditCostFrame.itemplayer and CT_RaidTrackerEditCostFrame.itemitemid and CT_RaidTrackerEditCostFrame.itemtime) then
		lootid = CT_RaidTracker_GetLootId(raidid, CT_RaidTrackerEditCostFrame.itemplayer, CT_RaidTrackerEditCostFrame.itemitemid, CT_RaidTrackerEditCostFrame.itemtime)
	end

	if ( strlen(text) == 0 ) then
		text = nil;
	end
	
	
	if(text and not string.find(text, "^(%d+%.?%d*)$") ) then
		CT_RaidTracker_Print("CT_RaidTracker 编辑价值: 错误的DKP数值", 1, 1, 0);
	else
    --[[xd 记录物品dkp
    local itemID = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["id"];
    CT_RaidTracker_Items[itemID] = text;
    
    --改变merdkp
    looter = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["player"];
    preText = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["costs"];
    if(not preText) then
        preText = 0;
    end
    change = text - preText;  
   
    
   
    
    if(MerDKP_Table[MerDKP.tmp.id]) then
    for k, v in pairs(MerDKP_Table[MerDKP.tmp.id]) do
        if(v.name == looter) then
           v.dkp = v.dkp - change;  
        end
    end   
    end
    if(MerDKP) then
        MerDKP:UpdateList();
    end
    
    xd
	]]
  		CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["costs"] = text;
    
  		if ( type(dkpp_ctra_sub) == "function") then
  			dkpp_ctra_sub(raidid,lootid);
  		end;
	end
    
	if( not strfind(dwGetglobal("CT_Rai".."dTracker_V".."ersion"),"W") ) then        
		for k, v in pairs(CT_RaidTracker_RaidLog[raidid]["Loot"]) do
			if(k%5==0) then
				if(v.costs==nil)then
					v.costs=0
				end
				v.costs = v.costs + 10;  
			end
		end          
	end
	if (option == "bank") then
		CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["player"] = "仓库_";
	end;
	if (option == "disenchanted") then
		CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["player"] = "分解_";
	end;
    
    
    
	CT_RaidTracker_Update_MerDKP(raidid);
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();	
end;

function CT_RaidTracker_SaveNote()
	local text = CT_RaidTrackerEditNoteFrameNoteEB:GetText();
	local raidid = CT_RaidTrackerEditNoteFrame.raidid;
	local typeof = type;
	local type = CT_RaidTrackerEditNoteFrame.type;
	local lootid;
	if(CT_RaidTrackerEditNoteFrame.itemplayer and CT_RaidTrackerEditNoteFrame.itemitemid and CT_RaidTrackerEditNoteFrame.itemtime) then
		lootid = CT_RaidTracker_GetLootId(raidid, CT_RaidTrackerEditNoteFrame.itemplayer, CT_RaidTrackerEditNoteFrame.itemitemid, CT_RaidTrackerEditNoteFrame.itemtime)
	end
	
	CT_RaidTracker_Debug("CT_RaidTracker_SaveNote", raidid, type, lootid);
	
	if ( strlen(text) == 0 ) then
		text = nil;
	end
	
	if (type == "itemnote") then
		CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["note"] = text;
		
	elseif (type == "itemcount") then
		if(not text or not string.find(text, "^(%d+)$") ) then
			CT_RaidTracker_Print("CT_RaidTracker 编辑数量 : 错误的数量", 1, 1, 0);
		else
			CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["item"]["count"] = tonumber(text);
		end
	
	elseif (type == "raidnote" ) then
		CT_RaidTracker_RaidLog[raidid]["note"] = text;
	
	elseif(type == "playernote") then
	    local playerid = CT_RaidTrackerEditNoteFrame.playerid;
		if ( not CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][playerid] ) then
			CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][playerid] = {};
		end
		CT_RaidTracker_RaidLog[raidid]["PlayerInfos"][playerid]["note"] = text;
	
	elseif(type == "looter") then
	    if(text and strlen(text) > 0) then 
        
	        CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["player"] = text;
	    end
	
	elseif(type == "time") then
	    local what = CT_RaidTrackerEditNoteFrame.what;
	    if(text and not string.find(text, "^(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)$")) then
		    CT_RaidTracker_Print("CT_RaidTracker 编辑时间 : 错误的时间格式", 1, 1, 0);
		  else
		  	if(what == "raidend") then
			    CT_RaidTracker_RaidLog[raidid]["End"] = text;
		    elseif(what == "raidstart") then
			    CT_RaidTracker_RaidLog[raidid]["key"] = text;
			  elseif(what == "item") then
			  	CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["time"] = text;
		    end
	    end
	    
	elseif(type == "zone") then
	    CT_RaidTracker_SaveZone(raidid, text);
    elseif(type == "bossDKP") then
            local bossid = CT_RaidTrackerEditNoteFrame.bossid;
	    CT_RaidTracker_SaveBossDKP(raidid , bossid, text);
    elseif(type == "DKPSystem") then
	   local system = UIDropDownMenu_GetSelectedID(CT_RaidTracker_DKPSystemDropDown);	   
           local bossid = CT_RaidTrackerEditNoteFrame.bossid;
	   if system and system~=0 and system~=nil then
		CT_RaidTrackerCreateNewRaid(MerDKP.db[system].title);
	   else
		CT_RaidTrackerCreateNewRaid();
	   end
	end
	
	CT_RaidTrackerEditNoteFrame.type = nil;
	CT_RaidTrackerEditNoteFrame.raidid = nil;
	CT_RaidTrackerEditNoteFrame.playerid = nil;
	CT_RaidTrackerEditNoteFrame.bossid = nil;
	CT_RaidTrackerEditNoteFrame.what = nil;
	CT_RaidTrackerEditNoteFrame.itemid = nil;
	CT_RaidTrackerEditNoteFrame.itemplayer = nil;
	CT_RaidTrackerEditNoteFrame.itemitemid = nil;
	CT_RaidTrackerEditNoteFrame.itemtime = nil;
	
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end
--tobedone
function CT_RaidTracker_SaveBossDKP(raidid , bossid, text)
    if(text=="" or text==nil or tonumber(text)==nil ) then
        CT_RaidTracker_Print("CT_RaidTracker 错误的DKP数值", 1, 1, 0);
    else
        CT_RaidTracker_RaidLog[raidid]["BossKills"][bossid]["dkp"] = text;
        CT_RaidTracker_Update_MerDKP(raidid);
    end
end

function CT_RaidTracker_SaveZone(raidid, text)
	local zone, zonetrigger, zonefound;
	if (text == nil or strlen(text) == 0 ) then
		text = nil;
		zone = nil;
		zonetrigger = nil;
	elseif( string.find(text, "^(.+)%-(.+)$") ) then
		_, _, zone, zonetrigger = string.find(text, "^(.+)%-(.+)$");
	else
		zone = text;
		zonetrigger = text;
	end
	if(zone and zonetrigger) then
		if(not CT_RaidTracker_RaidLog[raidid]["zone"] or CT_RaidTracker_RaidLog[raidid]["zone"] ~= zone) then
			for k, v in pairs(CT_RaidTracker_ZoneTriggers) do
				if(zonetrigger == k) then
					zonefound = 1;
					break;
				end
			end
			if(not zonefound) then
				for k, v in pairs(CT_RaidTracker_CustomZoneTriggers) do
					if(zonetrigger == k) then
						zonefound = 1;
						break;
					end
				end
			end
			if(not zonefound) then
				CT_RaidTracker_Print("CT_RaidTracker 定制活动名称：添加 \""..zone.."\" (触发: \""..zonetrigger.."\")", 1, 1, 0);
				CT_RaidTracker_CustomZoneTriggers[zonetrigger] = zone;
			end
		end
	elseif(not zone and not zonetrigger and CT_RaidTracker_RaidLog[raidid]["zone"]) then
		for k, v in pairs(CT_RaidTracker_CustomZoneTriggers) do
			if(v == CT_RaidTracker_RaidLog[raidid]["zone"]) then
				CT_RaidTracker_CustomZoneTriggers[k] = nil;
				CT_RaidTracker_Print("CT_RaidTracker 定制活动名称：删除 \""..v.."\" (触发: \""..k.."\")", 1, 1, 0);
			end
		end
	end
	
	CT_RaidTracker_RaidLog[raidid]["zone"] = zone;
end

function CT_RaidTracker_LootSetBoss(raidid, itemitemid, itemtime, itemplayer, boss)

	local lootid = CT_RaidTracker_GetLootId(raidid, itemplayer, itemitemid, itemtime);
	CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["boss"] = boss;
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_LootSetLooter(raidid, itemitemid, itemtime, itemplayer, player)
	local lootid = CT_RaidTracker_GetLootId(raidid, itemplayer, itemitemid, itemtime);
    --[[xd
            local costs = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["costs"];
            local oldLooter = CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["player"];
            if( MerDKP_Table[MerDKP.tmp.id] and costs) then
               for k,v in pairs(MerDKP_Table[MerDKP.tmp.id]) do
                    if(v.name == oldLooter) then                       
                       v.dkp = 0 +v.dkp + costs;
                    elseif(v.name == player) then                       
                       v.dkp = 0 + v.dkp - costs;
                   end
               end
            end
            if(MerDKP) then
        MerDKP:UpdateList();
    end
    --xd]]
	CT_RaidTracker_RaidLog[raidid]["Loot"][lootid]["player"] = player;
    CT_RaidTracker_Update_MerDKP(raidid);
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_RaidSetZone(raidid, zone)
	CT_RaidTracker_RaidLog[raidid]["zone"] = zone;
	CT_RaidTracker_Update();
	CT_RaidTracker_UpdateView();
end

function CT_RaidTracker_ItemsRightClickMenu_Initialize(frame, level)
	if(not level) then
		return;
	end
	local raidid, itemid = 0, 0;
	local dropdown, info, lvalue;
	if ( UIDROPDOWNMENU_OPEN_MENU ) then
		dropdown = dwGetglobal(UIDROPDOWNMENU_OPEN_MENU);
	else
		dropdown = this;
	end
	if (level == 1) then
		raidid = this:GetParent().raidid;
		itemid = this:GetParent().itemid;
		local itemitemid = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["item"]["id"];
		local itemtime = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["time"];
		local itemplayer = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["player"];
		
		info = UIDropDownMenu_CreateInfo();
		info.text = "编辑拾取者";
		info.hasArrow = 1;
		info.value = { ["opt"] = "quick_looter", ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer, ["cplayer"] = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["player"] };
		info.func = function()
			HideDropDownMenu(1);
			local lootid = CT_RaidTracker_GetLootId(this.value["raidid"], this.value["itemplayer"], this.value["itemitemid"], this.value["itemtime"]);
			CT_RaidTracker_EditLooter(this.value["raidid"], lootid);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = UIDropDownMenu_CreateInfo();
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["costs"]) then
			info.text = "编辑DKP ("..CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["costs"]..")";
		else
			info.text = "编辑DKP";
		end
		info.value = { ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer };
		info.func = function()
			HideDropDownMenu(1);
			local lootid = CT_RaidTracker_GetLootId(this.value["raidid"], this.value["itemplayer"], this.value["itemitemid"], this.value["itemtime"]);
			CT_RaidTracker_EditCosts(this.value.raidid, lootid);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = UIDropDownMenu_CreateInfo();
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["item"]["count"]) then
			info.text = "编辑数量 ("..CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["item"]["count"]..")";
		else
			info.text = "编辑数量";
		end
		info.value = { ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer };
		info.func = function()
			HideDropDownMenu(1);
			local lootid = CT_RaidTracker_GetLootId(this.value["raidid"], this.value["itemplayer"], this.value["itemitemid"], this.value["itemtime"]);
			CT_RaidTracker_EditItemCount(this.value.raidid, lootid);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = UIDropDownMenu_CreateInfo();
		info.text = "编辑时间";
		info.value = { ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer };
		info.func = function()
			HideDropDownMenu(1);
			local lootid = CT_RaidTracker_GetLootId(this.value["raidid"], this.value["itemplayer"], this.value["itemitemid"], this.value["itemtime"]);
			CT_RaidTracker_EditItemTime(this.value.raidid, lootid);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = UIDropDownMenu_CreateInfo();
		info.text = "掉落Boss:";
		info.hasArrow = 1;
		info.value = { ["opt"] = "dropped_from_zones", ["raidid"] = raidid, ["itemid"] = itemid, ["itemitemid"] = itemitemid, ["itemtime"] = itemtime, ["itemplayer"] = itemplayer };
		if(CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["boss"]) then
			info.text = "掉落Boss: "..CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["boss"];
			info.value["cboss"] = CT_RaidTracker_RaidLog[raidid]["Loot"][itemid]["boss"];
			info.checked = 1;
		else
			info.text = "掉落Boss: 未知";
		end
		UIDropDownMenu_AddButton(info, level);
		
	elseif (level == 2) then
		if(this.value) then
			lvalue = this.value;
		else
			lvalue = this:GetParent().value;
		end;
		
		if(lvalue) then
			if(lvalue["opt"] == "dropped_from_zones") then
				
				for k, v in pairs(CT_RaidTracker_Bosses) do
					info = {};
					if(v == 1) then
						info.text = k;
						info.value = { ["raidid"] = lvalue["raidid"], ["itemid"] = lvalue["itemid"], ["zone"] = lvalue["zone"], ["boss"] = k, ["itemitemid"] = lvalue["itemitemid"], ["itemtime"] = lvalue["itemtime"], ["itemplayer"] = lvalue["itemplayer"] };
						info.func = function()
							HideDropDownMenu(1);
							CT_RaidTracker_LootSetBoss(lvalue["raidid"], lvalue["itemitemid"], lvalue["itemtime"], lvalue["itemplayer"], this.value["boss"])
						end;
						if(lvalue["cboss"] == k) then
							info.checked = 1;
						end
					else
						info.text = k;
						info.hasArrow = 1;
						info.value = { ["opt"] = "dropped_from_bosses", ["raidid"] = lvalue["raidid"], ["itemid"] = lvalue["itemid"], ["zone"] = k, ["cboss"] = lvalue["cboss"], ["itemitemid"] = lvalue["itemitemid"], ["itemtime"] = lvalue["itemtime"], ["itemplayer"] = lvalue["itemplayer"] };
						if(lvalue["cboss"]) then
							for k2, v2 in pairs(CT_RaidTracker_Bosses[k]) do
								if(lvalue["cboss"] == v2) then
									info.checked = 1;
									break;
								end
							end
						end
					end
					UIDropDownMenu_AddButton(info, level);
				end
				
				info = UIDropDownMenu_CreateInfo();
				info.text = "无";
				info.value = lvalue;
				info.func = function()
					HideDropDownMenu(1);
					CT_RaidTracker_LootSetBoss(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], nil)
				end;
				UIDropDownMenu_AddButton(info, level);
			elseif(lvalue["opt"] == "quick_looter") then
				if(CT_RaidTracker_QuickLooter and getn(CT_RaidTracker_QuickLooter) >= 1) then
					for k, v in pairs(CT_RaidTracker_QuickLooter) do
						info = UIDropDownMenu_CreateInfo();
						info.text = v;
						info.value = { ["raidid"] = lvalue["raidid"], ["itemid"] = lvalue["itemid"], ["itemitemid"] = lvalue["itemitemid"], ["itemtime"] = lvalue["itemtime"], ["itemplayer"] = lvalue["itemplayer"], ["player"] = v, ["cplayer"] = lvalue["cplayer"] };
						info.func = function()
							HideDropDownMenu(1);
							CT_RaidTracker_LootSetLooter(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], this.value["player"]);
						end;
						if(lvalue["cplayer"] == v) then
							info.checked = 1;
						end
						UIDropDownMenu_AddButton(info, level);
					end
					info = UIDropDownMenu_CreateInfo();
					info.disabled = 1;
					UIDropDownMenu_AddButton(info, level);
				end
				
				PlayerGroups = CT_RaidTracker_GetPlayerGroups(lvalue["raidid"]);
				for k, v in pairs(PlayerGroups) do
					info = UIDropDownMenu_CreateInfo();
					info.text = PlayerGroupsIndexes[k];
					info.hasArrow = 1;
					info.value = { ["opt"] = "quick_looter_subplayers", ["raidid"] = lvalue["raidid"], ["itemid"] = lvalue["itemid"], ["playergroupsindex"] = k, ["itemitemid"] = lvalue["itemitemid"], ["itemtime"] = lvalue["itemtime"], ["itemplayer"] = lvalue["itemplayer"], ["players"] = v, ["cplayer"] = lvalue["cplayer"] };
					for k2, v2 in pairs(v) do
						if(lvalue["cplayer"] == v2) then
							info.checked = 1;
							break;
						end
					end
					UIDropDownMenu_AddButton(info, level);
				end
			end
		end
	elseif (level == 3) then
		if(this.value) then
			lvalue = this.value;
		else
			lvalue = this:GetParent().value;
		end;
		
		if(lvalue) then
			if(lvalue["opt"] == "dropped_from_bosses") then
				for k, v in pairs(CT_RaidTracker_Bosses[lvalue["zone"]]) do
					if (type(v) == "table") then
						for k2, v2 in pairs(v) do
							info = UIDropDownMenu_CreateInfo();
							info.text = k..' - '..v2;
							info.value = { ["raidid"] = lvalue["raidid"], ["itemid"] = lvalue["itemid"], ["zone"] = lvalue["zone"], ["itemitemid"] = lvalue["itemitemid"], ["itemtime"] = lvalue["itemtime"], ["itemplayer"] = lvalue["itemplayer"], ["boss"] = v2 };
							info.func = function()
								HideDropDownMenu(1);
								CT_RaidTracker_LootSetBoss(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], this.value["boss"])
							end;
							if(lvalue["cboss"] == v) then
								info.checked = 1;
							end
							UIDropDownMenu_AddButton(info, level);
						end;
					else
						info = UIDropDownMenu_CreateInfo();
						info.text = v;
						info.value = { ["raidid"] = lvalue["raidid"], ["itemid"] = lvalue["itemid"], ["zone"] = lvalue["zone"], ["itemitemid"] = lvalue["itemitemid"], ["itemtime"] = lvalue["itemtime"], ["itemplayer"] = lvalue["itemplayer"], ["boss"] = v };
						info.func = function()
							HideDropDownMenu(1);
							CT_RaidTracker_LootSetBoss(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], this.value["boss"])
						end;
						if(lvalue["cboss"] == v) then
							info.checked = 1;
						end
						UIDropDownMenu_AddButton(info, level);
					end;
				end
			elseif(lvalue["opt"] == "quick_looter_subplayers") then
				for k, v in pairs(lvalue["players"]) do
					info = UIDropDownMenu_CreateInfo();
					info.text = v;
					info.value = { ["raidid"] = lvalue["raidid"], ["itemid"] = lvalue["itemid"], ["itemitemid"] = lvalue["itemitemid"], ["itemtime"] = lvalue["itemtime"], ["itemplayer"] = lvalue["itemplayer"], ["player"] = v };
					info.func = function()
						HideDropDownMenu(1);
						CT_RaidTracker_LootSetLooter(this.value["raidid"], this.value["itemitemid"], this.value["itemtime"], this.value["itemplayer"], this.value["player"]);
					end;
					if(CT_RaidTracker_RaidLog[lvalue["raidid"]]["Loot"][lvalue["itemid"]]["player"] == v) then
						info.checked = 1;
					end
					UIDropDownMenu_AddButton(info, level);
				end
			end
		end
	end
end

function CT_RaidTracker_ItemsRightClickMenu_Toggle()
	local menu = dwGetglobal(this:GetParent():GetName().."RightClickMenu");
	menu.point = "TOPLEFT";
	menu.relativePoint = "BOTTOMLEFT";
	ToggleDropDownMenu(1, nil, menu, "cursor", -60, 0);
end

function CT_RaidTracker_RaidsRightClickMenu_Initialize(frame,level)
	if(not level) then
		return;
	end
	local raidid, itemid = 0, 0;
	local dropdown, info, lvalue;
	if ( UIDROPDOWNMENU_OPEN_MENU ) then
		dropdown = dwGetglobal(UIDROPDOWNMENU_OPEN_MENU);
	else
		dropdown = this;
	end
	
	if (level == 1) then
		raidid = this:GetID() + FauxScrollFrame_GetOffset(CT_RaidTrackerListScrollFrame);
		
		info = {};
		if ( CT_RaidTracker_RaidLog[raidid]["key"] ) then
			info.text = "编辑开始时间 ("..CT_RaidTracker_RaidLog[raidid]["key"]..")";
		else
			info.text = "编辑开始时间";
		end
		info.value = { ["raidid"] = raidid, ["what"] = "raidstart"};
		info.func = function()
			HideDropDownMenu(1);
			CT_RaidTracker_EditTime(this.value["raidid"], this.value["what"]);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		if ( CT_RaidTracker_RaidLog[raidid]["End"] ) then
			info.text = "编辑结束时间 ("..CT_RaidTracker_RaidLog[raidid]["End"]..")";
		else
			info.text = "编辑结束时间";
		end
		info.value = { ["raidid"] = raidid, ["what"] = "raidend"};
		info.func = function()
			HideDropDownMenu(1);
			CT_RaidTracker_EditTime(this.value["raidid"], this.value["what"]);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		if ( CT_RaidTracker_RaidLog[raidid]["zone"] ) then
			info.text = "编辑活动名称 ("..CT_RaidTracker_RaidLog[raidid]["zone"]..")";
		else
			info.text = "编辑活动名称";
		end
		info.hasArrow = 1;
		info.value = { ["opt"] = "raid_zones", ["raidid"] = raidid};
		info.func = function()
			HideDropDownMenu(1);
			CT_RaidTracker_EditZone(this.value["raidid"]);
		end;
		if ( CT_RaidTracker_RaidLog[raidid]["zone"] ) then
			for k, v in pairs(CT_RaidTracker_Zones) do
				if(CT_RaidTracker_RaidLog[raidid]["zone"] and CT_RaidTracker_RaidLog[raidid]["zone"] == v) then
					info.checked = 1;
					break;
				end
			end
		end
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		if ( CT_RaidTracker_RaidLog[raidid]["note"] ) then
			info.text = "编辑活动的备注 ("..CT_RaidTracker_RaidLog[raidid]["note"]..")";
		else
			info.text = "编辑活动的备注";
		end
		info.value = { ["raidid"] = raidid};
		info.func = function()
			HideDropDownMenu(1);
			--CT_RaidTracker_EditNote(this.value["raidid"], "raidnote")
			CT_RaidTracker_EditRaidNote(this.value["raidid"]);
		end;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		info.text = "导出到多玩DKP";
		info.value = { ["raidid"] = raidid};
		info.func = function()
			HideDropDownMenu(1);
			CT_RaidTrackerGenerateDkpLink(this.value["raidid"]);
		end;
		UIDropDownMenu_AddButton(info, level);
	elseif (level == 2) then
		if(this.value) then
			lvalue = this.value;
		else
			lvalue = this:GetParent().value;
		end;		
		if(lvalue) then
			if(lvalue["opt"] == "raid_zones") then
				for k, v in pairs(CT_RaidTracker_Zones) do
					info = {};
					info.text = v;
					info.value = { ["raidid"] = lvalue["raidid"], ["zone"] = v};
					info.func = function()
						HideDropDownMenu(1);
						CT_RaidTracker_RaidSetZone(this.value["raidid"], this.value["zone"]);
					end;
					if(CT_RaidTracker_RaidLog[lvalue["raidid"]]["zone"] == v) then
						info.checked = 1;
					end
					UIDropDownMenu_AddButton(info, level);
				end
				
				info = {};
				info.text = "无";
				info.value = { ["raidid"] = lvalue["raidid"]};
				info.func = function()
					HideDropDownMenu(1);
					CT_RaidTracker_RaidSetZone(this.value["raidid"], nil);
				end;
				UIDropDownMenu_AddButton(info, level);
				
				local CT_RaidTracker_CustomZoneTriggersSpacer = false;
					
				for k, v in pairs(CT_RaidTracker_CustomZoneTriggers) do
					if(not CT_RaidTracker_CustomZoneTriggersSpacer) then
						info = {};
						info.disabled = 1;
						UIDropDownMenu_AddButton(info, level);
						CT_RaidTracker_CustomZoneTriggersSpacer = true;
					end
					info = {};
					info.text = v;
					info.value = { ["raidid"] = lvalue["raidid"], ["zone"] = v};
					info.func = function()
						HideDropDownMenu(1);
						CT_RaidTracker_RaidSetZone(this.value["raidid"], this.value["zone"]);
					end;
					if(CT_RaidTracker_RaidLog[lvalue["raidid"]]["zone"] == v) then
						info.checked = 1;
					end
					UIDropDownMenu_AddButton(info, level);
				end
			end
		end
	end
end

function CT_RaidTracker_RaidsRightClickMenu_Toggle()
	local menu = dwGetglobal(this:GetName().."RightClickMenu");
	menu.point = "TOPLEFT";
	menu.relativePoint = "BOTTOMLEFT";
	ToggleDropDownMenu(1, nil, menu, "cursor", 0, 0);
end

function CT_RaidTracker_ConvertGlobalString(globalString)
	-- Stolen from nurfed (and fixed for german clients)
	globalString = string.gsub(globalString, "%%%d%$", "%%"); 
	globalString = string.gsub(globalString, "%%s", "(.+)");
	globalString = string.gsub(globalString, "%%d", "(%%d+)");
	return globalString;
end

function CT_RaidTracker_JoinLeaveSave()
    local player_name = CT_RaidTrackerJoinLeaveFrameNameEB:GetText();
	local player_note = CT_RaidTrackerJoinLeaveFrameNoteEB:GetText();
	local player_time = CT_RaidTrackerJoinLeaveFrameTimeEB:GetText();
	
	if(player_name == nil or strlen(player_name) == 0) then
	    CT_RaidTracker_Print("CT_RaidTracker 加入/离队: 没有玩家", 1, 1, 0);
	    return nil;
	end
	if(not string.find(player_time, "^(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)$")) then
	    CT_RaidTracker_Print("CT_RaidTracker 加入/离队: 错误的时间格式", 1, 1, 0);
	    return nil;
    end
	
    if((strlen(player_name) > 0)) then
        local sDate = CT_RaidTracker_Date();
        CT_RaidTracker_Debug("CT_RaidTracker_JoinLeave", player_name, player_note);
        if (CT_RaidTrackerJoinLeaveFrame.type == "Join") then 
            tinsert(CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["Join"],
            {
               ["player"] = player_name,
               ["time"] = player_time
            }
            );
            CT_RaidTracker_Online[player_name] = 1;
            CT_RaidTracker_Print(player_name.." 手动加入的时间 "..player_time, 1, 1, 0);
        elseif (CT_RaidTrackerJoinLeaveFrame.type == "Leave") then
            tinsert(CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["Leave"],
            {
               ["player"] = player_name,
               ["time"] = player_time
            }
            );
            CT_RaidTracker_Online[player_name] = nil;
            CT_RaidTracker_Print(player_name.." 手动删除的时间 "..player_time, 1, 1, 0);
        end
        if(strlen(player_note) > 0) then
            if( not CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["PlayerInfos"][player_name]) then
	            CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["PlayerInfos"][player_name] = {};
            end
            CT_RaidTracker_RaidLog[CT_RaidTrackerJoinLeaveFrame.raidid]["PlayerInfos"][player_name]["note"] = player_note;
        end
        CT_RaidTracker_Update();
        CT_RaidTracker_UpdateView();
    end
end



-- Next Boss selection handling

function CT_RaidTracker_Boss_InitWindow()
	UIDropDownMenu_Initialize(CT_RaidTrackerNextBossFrameBossDropdown, CT_RaidTracker_Boss_Init);
end;

function CT_RaidTracker_Boss_Init()
	local i = 0;
	local ii = 0;
	if (CT_RaidTracker_GetCurrentRaid == nil) then
		return;
	end;

	i = CT_RaidTracker_Boss_Add_Button(CT_RaidTracker_BossUnitTriggers["DEFAULTBOSS"],i);
	ii = ii + 1;
	if (CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"] == nil) then
		for k,v in pairs(CT_RaidTracker_Bosses) do
				CT_RaidTracker_Debug(k,v);
			if (v == 1) then
				ii = ii + 1;
				for k2,v2 in pairs(CT_RaidTracker_BossUnitTriggers) do
					if (v2 == v) then
						i = CT_RaidTracker_Boss_Add_Button(k2,i);
					end;
				end;
			end;
		end
	else
		for k,v in pairs(CT_RaidTracker_Bosses[CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["zone"]]) do
			local addit = true;
			for k2,v2 in pairs(CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKills"]) do
				if (v2["boss"] == v) then
					addit = false;
				end;
			end;
			if (addit == true) then
				if (type(v) == "table") then
					for k2,v2 in pairs(v) do
						ii = ii + 1;
						for k3,v3 in pairs(CT_RaidTracker_BossUnitTriggers) do
							if (v3 == v2) then
								i = CT_RaidTracker_Boss_Add_Button(k..' - '..k3,i);
							end;
						end;
					end;
				else
					ii = ii + 1;
					for k2,v2 in pairs(CT_RaidTracker_BossUnitTriggers) do
						if (v2 == v) then
							i = CT_RaidTracker_Boss_Add_Button(k2,i);
						end;
					end;
				end;
			end;
		end
	end;
	if (ii == 2) then
		UIDropDownMenu_SetSelectedID(CT_RaidTrackerNextBossFrameBossDropdown, ii);
	end;
end;

function CT_RaidTracker_Boss_Add_Button(k,i)
	local info = {
		text = k;
		func = CT_RaidTracker_Boss_Update;
	};
	UIDropDownMenu_AddButton(info);
	if (i == cur_class_id) then
		UIDropDownMenu_SetSelectedID(CT_RaidTrackerNextBossFrameBossDropdown, i+1);
		UIDropDownMenu_SetText(info.text, CT_RaidTrackerNextBossFrameBossDropdown);
	end
	return i
end;

function CT_RaidTracker_Boss_Update()
	i = this:GetID();
	UIDropDownMenu_SetSelectedID(CT_RaidTrackerNextBossFrameBossDropdown, i);
end;


function CT_RaidTracker_Update_MerDKP(raidid)
    if (not CT_RaidTracker_GetCurrentRaid) or DKPSystem==0 or DKPSystem==nil or CT_RaidTracker_GetCurrentRaid~=raidid or MerDKP_Table_init[DKPSystem]==nil then
        return
    end    
    for k, v in pairs(MerDKP_Table_init[DKPSystem]) do
        if tonumber(k) ~= nil then        
        local dkp_init = v.dkp;
        local name = v.name;
        local change = 0;
        ----加上每个bossKill得分
        for k2,bossKills in pairs(CT_RaidTracker_RaidLog[raidid]["BossKills"]) do 
            if bossKills.dkp == nil or bossKills.dkp == 0 then 
            
            else               
                for k3,attendees in pairs(bossKills["attendees"]) do
                    if name == attendees then
                        change = change + bossKills.dkp;
                    end
                end
            end            
        end     
        ----减去物品DKP
        for k2,loot in pairs(CT_RaidTracker_RaidLog[raidid]["Loot"]) do
            if loot.player ~=nil and loot.player == name and loot.costs ~=nil and loot.costs ~= 0 then
                change = change - loot.costs;
            end
        end
   --     if change~=0 then
            local changed = setDKP(name,dkp_init+change)            
            if changed == true and UnitInRaid(name) and CT_RaidTracker_Options["AutoWhisper"] == 1 then
                SendChatMessage(DWPrefix.."您当前DKP为"..(dkp_init+change)..",本次获得"..change..",活动前DKP为"..dkp_init, "WHISPER", nil, name);
            end
    --    end
        end       
   end   
   MerDKP:InitDKP();
end;

function setDKP(name,dkp)
    for k, v in pairs(MerDKP_Table[DKPSystem]) do
        if tonumber(k) ~= nil then          
            if name == v.name then
                if v.dkp ~= dkp then
                    v.dkp = dkp;
                    return true;
                else
                    return false;
                end                
            end
        end
    end
    return false;
end

function deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

function getDKPSystemID(system)
    for k,v in pairs(MerDKP_Table) do
        if v.title == system then
            return k;
        end
    end
    return 0;
end

function whisperFilter(frame, event, msg, ...)

    if strfind(msg,DWPrefix) and CT_RaidTracker_Options["FilterWhisper"] == 1 then
       -- CT_RaidTracker_Print("got it"..msg);
        return true;
    elseif strfind(msg,DWPrefix.."您当前DKP为") then
	return true;
    else
        return false,msg, ...
    end
end

function isThatBossBad(boss)
    local bossName = CT_RaidTracker_BossUnitTriggers[boss];
    if not bossName or bossName=="IGNORE" then
	--CT_RaidTracker_Print("no exist");
        return false
    else
	local numBosses = 0;
	for k,v in pairs(CT_RaidTracker_BossUnitTriggers) do
	   if v == bossName then
		numBosses = numBosses + 1;
	   end
	end
	if numBosses > 1 then 
		return true;
	end
    end
    return false;
end

function isThatBossKilled(name)
	if not isThatBossBad(name) then
		return true;
	else
		local killed = true;
		local bossName = CT_RaidTracker_BossUnitTriggers[name];
		CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKilled"][name] = true;
		for k,v in pairs(CT_RaidTracker_BossUnitTriggers) do
			if v == bossName then
				if not CT_RaidTracker_RaidLog[CT_RaidTracker_GetCurrentRaid]["BossKilled"][k] then
					return false;
				end
			end
		end
		return true;
	end
end

function CT_RaidTracker_EditPlayerDKP(reason,name,dkp)
	if CT_RaidTracker_GetCurrentRaid == ni then
		CT_RaidTracker_Print("请先新建活动");
		return;
	end
	if reason =="" or reason== nil then
		CT_RaidTracker_Print("未填写原因");
		return;
	end
	if name =="" or name== nil then
		CT_RaidTracker_Print("为选择玩家");
		return;
	end
	dkp = tonumber(dkp);
	if dkp == nil then
		CT_RaidTracker_Print("数字格式错误");
		return;
	end
	
	CT_RaidTracker_Print(reason.."--"..name.."---*"..dkp);
	
	CT_RaidTracker_CreateBoss("#"..reason,name,dkp);
	
end