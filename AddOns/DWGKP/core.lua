------------------------------------------------------------------------------------------
-- core ver 1.0
-- 日期: 2010-11-21
-- 作者: dugu@bigfoot
-- 描述: 多玩金团活动记分及分配系统
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------------------
DWGKP = LibStub("AceAddon-3.0"):NewAddon("DWGKP", "AceHook-3.0", "AceEvent-3.0");
local L =  LibStub("AceLocale-3.0"):GetLocale("DWGKP");
local GKP = DWGKP;
GKP._DEBUG = false;
GKP._VER = "1.0.2";		
GKP.P = {};	-- string pattern
GKP.Maps = {members={},};
GKP.RaidTracker_Online = {};
DWGKP_DB = {};
DWGKP_Config = nil;

function GKP:OnInitialize()	
	self.db = DWGKP_DB;
	self.PLAYER = UnitName("player");
	self:InitLootItemPattern();
	self:InitConfiguration();
	self:InitOptionTable();
	self:SetupLDB();
	self.CurRaidInfo = self:CloneTable(DWGKP_DEFAULT_RAID_INFO);
end

function GKP:OnEnable()
	self:RegisterEvents();
	self:UpdateMembers();
end

function GKP:OnDisable()
	self:UnregisterEvents();
end

function GKP:print(msg, ...)
	DEFAULT_CHAT_FRAME:AddMessage(format(msg, ...));
end

function GKP:debug(msg, ...)
	if (self._DEBUG) then
		self:print(msg, ...);
	end
end

function GKP:Send(msg, ...)	
	local msg = format(msg, ...);
	local chatType = self:GetCVar("announceChannel") or "SAY";
	if ((strupper(chatType) == "RAID" and GetNumRaidMembers() == 0) or (strupper(chatType) == "PARTY" and GetNumPartyMembers() == 0)) then
		chatType = "SAY";
	end
	SendChatMessage(msg , strupper(chatType));
end
------------
-- 编辑配置信息
function GKP:SetCVar(...)
	local num = select("#", ...);
	local db = self.config;
	if (num > 2) then
		for i=1, num-1 do
			db[select(i, ...)] = db[select(i, ...)] or {};
			db = db[select(i, ...)];
		end
	end
	db[select(num-1, ...)] = select(num, ...);
end
-- 获得配置信息
function GKP:GetCVar(...)
	local num = select("#", ...);
	local db = self.config;
	for i=1, num do
		if (db[select(i, ...)]) then
			db = db[select(i, ...)];
		else
			return nil;
		end
	end
	return db;
end

function GKP:CloneTable(t)
	assert(type(t) == "table", "CloneTable need table argument");
	local tmp = {};
	for k, v in pairs(t) do
		if (type(v) == "table") then
			tmp[k] = self:CloneTable(v);
		else
			tmp[k] = v;
		end
	end
	return tmp;
end

function GKP:getn(t)
	assert(type(t) == "table", "getn need table argument");
	
	local n = 0;
	for k,  v in pairs(t) do
		n = n + 1;
	end
	return n;
end

function GKP:GetCurVer()
	local a, b, c = strmatch(self._VER, "^(%d+)%.(%d+)%.(%d+)$");
	local verString = string.format("%02d%02d%03d", tonumber(a), tonumber(b), tonumber(c));	
	local verNumber = tonumber(verString);
	return verNumber, verString;
end

function GKP:GetConfigVer()
	if (DWGKP_Config) then
		local a, b, c = strmatch(DWGKP_Config["version"], "^(%d+)%.(%d+)%.(%d+)$");
		local verString = string.format("%02d%02d%03d", tonumber(a), tonumber(b), tonumber(c));
		local verNumber = tonumber(verString);
		return verNumber, verString;
	end
	return 0, nil;
end

function GKP:HasNewVersion()
	if (self:GetCurVer() > self:GetConfigVer()) then
		return true;
	end
	return false;
end
------------
-- 初始化配置
function GKP:InitConfiguration()
	if (not DWGKP_Config or self:HasNewVersion()) then
		DWGKP_Config = self:CloneTable(DWGKP_Default_Config);
		DWGKP_Config["version"] = self._VER;
	end
	self.config = DWGKP_Config;
end

function GKP:GetTimeStamp()
	local timeStamp = "20" .. date("%y-%m-%d %H:%M");		-- 2010-06-07 17:50
	local simpleTime = date("%H:%M:%S");					-- 17:40:03
	return timeStamp, simpleTime;
end

function GKP:ParseTimeStamp(ts)
	assert(type(ts) == "string", "#ts need a string value.");
	-- 检查时间格式

	local year, month, day, hour, mini = strmatch(ts, "(%d+)%-(%d+)%-(%d+) (%d+):(%d+)");
	
	return day*24*3600+hour*3600+mini*60;
end

-- 计算间隔时间
function GKP:GetDuration(start, ends)
	local sTime = self:ParseTimeStamp(start);
	local eTime = self:ParseTimeStamp(ends);
	local duration = eTime - sTime;
	
	return duration;
end

function GKP:GetTimeText(sec)
	local hour = math.floor(sec / 3600);
	local mini = math.floor((sec-hour*3600)/60);

	return format(L["TimeFormat"], hour, mini);
end

function GKP:String2Pattern(str)
	str = string.gsub(str, "%(", "%%(") ;
	str = string.gsub(str, "%)", "%%)") ;
	str = string.gsub(str, "%%s", "(.-)") ;
	str = string.gsub(str, "%%d", "(%%d+)") ;
	return str;
end

function GKP:InitLootItemPattern()
	self.P.LOOT_ITEM = self:String2Pattern(LOOT_ITEM);
	self.P.LOOT_ITEM_MULTIPLE = self:String2Pattern(LOOT_ITEM_MULTIPLE);
	self.P.LOOT_ITEM_SELF = self:String2Pattern(LOOT_ITEM_SELF) ;
	self.P.LOOT_ITEM_SELF_MULTIPLE = self:String2Pattern(LOOT_ITEM_SELF_MULTIPLE);
	self.P.LOOT_ITEM_PUSHED_SELF = self:String2Pattern(LOOT_ITEM_PUSHED_SELF) ;
	self.P.LOOT_ITEM_PUSHED_SELF_MULTIPLE = self:String2Pattern(LOOT_ITEM_PUSHED_SELF_MULTIPLE) ;
end

function GKP:GetItemString(lootString)
	local playerName,itemLink,itemNum ;
	if (not itemLink) then 
		playerName, itemLink, itemNum = strmatch(lootString, self.P.LOOT_ITEM_MULTIPLE) ;
	end 
	if (not itemLink) then 
		playerName, itemLink = strmatch(lootString,self.P.LOOT_ITEM) ;
	end 
	if (not itemLink) then 
		itemLink, itemNum = strmatch(lootString, self.P.LOOT_ITEM_SELF_MULTIPLE) ;
	end
	if (not itemLink) then 
		itemLink = strmatch(lootString, self.P.LOOT_ITEM_SELF) ;
	end 
	if (not itemLink) then
		itemLink = strmatch(lootString,self.P.LOOT_ITEM_PUSHED_SELF) ;
	end
	if (not itemLink) then 
		itemLink,itemNum = strmatch(lootString, self.P.LOOT_ITEM_PUSHED_SELF_MULTIPLE) ;
	end
	if (not playerName or playerName == L["YOU"]) then 
		playerName = UnitName("player");
	end
	
	if (not itemLink) then
		return;
	end 
	itemNum = tonumber(itemNum) or 1 

	return playerName, itemLink, itemNum;
end

function GKP:RegisterEvents()
	self:RegisterEvent("CHAT_MSG_LOOT");	
	self:RegisterEvent("RAID_ROSTER_UPDATE", "OnRaidRosterUpdate");
	self:RegisterEvent("CHAT_MSG_SYSTEM", "OnSystemMsg");
end

function GKP:UnregisterEvents()
	self:UnregisterEvent("CHAT_MSG_LOOT");
	self:UnregisterEvent("RAID_ROSTER_UPDATE");
	self:UnregisterEvent("CHAT_MSG_SYSTEM");
end

-- TODO: 刷新视图
function GKP:UpdateView(force)
	if (force) then
		self:UpdateMemberView();
		self:UpdateItemView();
		self:UpdateEventView();
		self:UpdateDistributeView();
		self:UpdateRaidView();
	else
		local index = PanelTemplates_GetSelectedTab(DWGKPDKPFrame);
		if (index == 1) then
			self:UpdateMemberView();
		elseif (index == 2) then
			self:UpdateItemView();
		elseif (index == 3) then
			self:UpdateEventView();
		elseif (index == 4) then
			self:UpdateDistributeView();
		elseif (index == 5) then
			self:UpdateRaidView();
		end		
	end	
end

function GKP:HasActiveRaid()
	local curRaid = self:GetCurRaid();
	if (curRaid and curRaid.info.status == "ACTIVE") then
		return true;
	end
	return false;
end

function GKP:GetCurDate(dType, name)
	local curRaid = self:GetCurRaid();
	if (curRaid) then		
		if (dType == "member") then
			if (not self.Maps.members[name] or self.Maps.members[name] == 0) then				
				self:AddMember({name = name,});				
			end
			return curRaid.memberList[self.Maps.members[name]];
		elseif (dType == "info") then
			return curRaid.info[name];
		else
			self:debug("not valide type=> ", dType);
			return nil;
		end
	else
		self:debug("GetCurDate failed, no curRaid");
		return nil;
	end
end

function GKP:CheckClass(class)	
	if (DWGKP_CLASS_SORT_DATA[class]) then
		return true;
	end
	
	return false;
end

function GKP:FormatClassName(text, name)
	local name = name or text;
	local curRaid = self:GetCurRaid();
	if (curRaid and text) then
		local class = curRaid.name2class[name];
		if (class) then
			local color = RAID_CLASS_COLORS[class];
			return format("|cff%02x%02x%02x%s|r", color.r*255, color.g*255, color.b*255, text);
		end
	end
	return text or "";
end
--------------------------------
-- 刷新物品信息
function GKP:AddItemInfo(itemLink, itemNum, playerName)
	if (self:CheckRecordItem(itemLink)) then
		local mTime, sTime = self:GetTimeStamp();
		local itemName, itemLink, itemRarity, _, _, _, _, _, _, itemTexture = GetItemInfo(itemLink);
		local itemInfo = {};
		itemInfo["name"] = itemName;
		itemInfo["cost"] = 0;
		itemInfo["precost"] = 0;
		itemInfo["time"] = sTime;
		itemInfo["player"] = playerName;
		itemInfo["count"] = itemNum;
		itemInfo["icon"] = itemTexture;
		itemInfo["rarity"] = itemRarity;
		itemInfo["link"] = itemLink;
		itemInfo["note"] = "";

		self:AddItem(itemInfo);
	end
end

function GKP:CHAT_MSG_LOOT(event, lootString)
	if (not self:HasActiveRaid()) then return end
	
	local playerName, itemLink, itemNum = self:GetItemString(lootString);
	
	self:AddItemInfo(itemLink, itemNum, playerName);
	-- Update
	self:UpdateView();
end
--------------------
-- 刷新成员信息
function GKP:GetCheckInfo(memberInfo, subgroup)
	local checkInfo = 0;
	
	if (not memberInfo["ischeck"]) then
		-- TODO: 是否前5组设置
		local fiveG = self:GetCVar("fiveGroup");
		if (not fiveG or (fiveG and subgroup > 5)) then
			checkInfo = 1;
		end
	else
		checkInfo = memberInfo["ischeck"];
	end

	return checkInfo;
end

function GKP:OnRaidRosterUpdate(event)
	if (not self:HasActiveRaid()) then return end

	local memberInfo;
	local updated = false;
	local curRaid = self:GetCurRaid();
	-- 全部设置为离线
	for k, v in pairs(self.RaidTracker_Online) do
		self.RaidTracker_Online[k] = false;
	end
	
	for i = 1, GetNumRaidMembers(), 1 do
		local name, rank, subgroup, level, class, fileName, _, online = GetRaidRosterInfo(i);

		if ( name and name ~= UKNOWNBEING and name ~= UNKNOWN) then
			memberInfo = self:GetCurDate("member", name);
			memberInfo["ischeck"] = self:GetCheckInfo(memberInfo, subgroup);
			memberInfo["checked"] = memberInfo["checked"] or 0;
			memberInfo["class"] = class;
			memberInfo["level"] = level;
			memberInfo["precent"] = memberInfo["precent"] or 100;
			memberInfo["bro"] = memberInfo["bro"] or 0;
			memberInfo["bonus"] = memberInfo["bonus"] or 0;
			

			curRaid.name2class[name] = fileName;
			if (online ~= memberInfo["online"]) then
				if ( not online ) then								
					memberInfo["endtime"] = self:GetTimeStamp();
				else
					-- 加入队伍
					if (not memberInfo["starttime"]) then
						memberInfo["starttime"] = self:GetTimeStamp();
						local startTime = self:GetCurDate("info", "starttime");
						local endTime = memberInfo["starttime"];
						memberInfo["offtime"] = self:GetDuration(startTime, endTime);
					-- 离线重上
					else
						local startTime = memberInfo["endtime"];
						local endTime = self:GetTimeStamp();
						if (startTime and endTime) then
							memberInfo["offtime"] = memberInfo["offtime"] + self:GetDuration(startTime, endTime);
						end
					end
				end
			else
				-- 创建活动时成员就是掉线状态
				if (not online) then
					local stime = self:GetTimeStamp();
					if (not memberInfo["starttime"]) then
						memberInfo["starttime"] = stime;
					end					
					memberInfo["endtime"] = stime;
				end				
			end

			memberInfo["online"] = online;
			self.RaidTracker_Online[name] = online;
		end
	end
	
	self:UpdateMembers();
	-- TODO: 刷新显示
	self:UpdateView();
end

function GKP:OnSystemMsg(event, msg)
	local name = strmatch(msg, L["LeftGroup"]);
	if (name and name ~= self.PLAYER and name ~= UKNOWNBEING and name ~= UNKNOWN and self.RaidTracker_Online[name]) then
		self:OnRaidRosterUpdate();
	end
end
--------------------
-- 刷新事件信息
function GKP:OnUpdateEvents()
	local curRaid = self:GetCurRaid();
	local tmp;
	-- 初始化
	if (curRaid) then
		wipe(curRaid.eventList);
		curRaid.info.distribute = 0;		-- 分配人数

		self.CurRaidInfo = self:CloneTable(DWGKP_DEFAULT_RAID_INFO);
		-- 人员
		for i, v in ipairs(curRaid.memberList) do
			tmp = {["in"]=0, out=0};
			if (v.ischeck == 1) then
				curRaid.info.distribute = curRaid.info.distribute + 1;
			end
			if (v.bonus > 0) then
				tmp["out"] = v.bonus;		
				self.CurRaidInfo.mout =self.CurRaidInfo.mout + tmp["out"];
			elseif (v.bonus < 0) then
				tmp["in"] = 0-v.bonus;	
				self.CurRaidInfo.minc =self.CurRaidInfo.minc + tmp["in"];
			end
			if (tmp["in"] ~= 0 or tmp["out"] ~= 0) then
				tmp["type"] = "member";
				tmp["name"] = v.name;
				tmp["player"] = v.name;
				tmp["class"] = v.class;
				table.insert(curRaid.eventList, tmp);
			end		
		end
		-- 物品
		for i, v in ipairs(curRaid.itemList) do
			tmp = {["in"]=0, out=0};
			if (v.cost > 0) then
				tmp["in"] = v.cost;
				self.CurRaidInfo.iinc = self.CurRaidInfo.iinc + tmp["in"];
			elseif (v.cost < 0) then
				tmp["out"] = 0-v.cost;
				self.CurRaidInfo.iout = self.CurRaidInfo.iout + tmp["out"];
			end
			if (tmp["in"] ~= 0 or tmp["out"] ~= 0) then
				tmp["type"] = "item";
				tmp["name"] = v.name;
				tmp["count"] = v.count;
				tmp["rarity"] = v.rarity;
				tmp["player"] = v.player;
				tmp["link"] = v.link;
				table.insert(curRaid.eventList, tmp);
			end
		end
		-- 自定义
		for i, v in ipairs(curRaid.customList) do
			tmp = {["in"]=0, ["out"]=0};
			if (v["in"] and v["in"] > 0) then
				tmp["in"] = v["in"];
				self.CurRaidInfo.cinc = self.CurRaidInfo.cinc + tmp["in"];
			elseif (v["out"] and v["out"] > 0) then
				tmp["out"] = v["out"];
				self.CurRaidInfo.cout = self.CurRaidInfo.cout + tmp["out"];
			end
			tmp["type"] = "custom";		
			tmp["player"] = v.player;
			tmp["content"] = v.content;
			tmp["cIndex"] = i;
			table.insert(curRaid.eventList, tmp);
		end

		curRaid.info.incoin = self.CurRaidInfo.minc + self.CurRaidInfo.iinc + self.CurRaidInfo.cinc;		-- 总收入金额
		curRaid.info.outcoin = self.CurRaidInfo.mout + self.CurRaidInfo.iout + self.CurRaidInfo.cout;		-- 总支出金额
	end
	-- 刷新视图
	-- self:UpdateView();
end

function GKP:GetGoldString(gold, simple)
	if (simple) then
		return L["SimpleGoldString"]:format(gold);
	else
		return L["GoldString"]:format(gold);
	end	
end

local function getItemQualityColorStr(text, q)
	local r, g, b, hex = GetItemQualityColor(q);
	
	return format("%s%s|r", hex, text);
end

function GKP:GetFormatEventString(item, simple)
	local text = "";
	local intext, outtext, name;
	if (item.type == "member") then
		name = simple and item.name or self:FormatClassName(item.name);
		if (item["in"] > 0) then
			text = L["MemberIn"]:format(name, self:GetGoldString(item["in"], simple));
		elseif (item["out"] > 0) then
			text = L["MemberOut"]:format(name, self:GetGoldString(item["out"], simple));		
		end
	elseif (item.type == "item") then
		name = simple and item.name or self:FormatClassName(item.player);
		if (item["in"] > 0) then
			if (tonumber(item["count"]) == 1) then				
				text = L["ItemIn"]:format(item["link"], self:GetGoldString(item["in"], simple));
			else
				local count = simple and item["count"] or getItemQualityColorStr(tostring(item["count"]), item["rarity"]);
				text = L["ItemInMuti"]:format(item["link"], count, self:GetGoldString(item["in"], simple));
			end						
		elseif (item["out"] > 0) then
			if (tonumber(item["count"]) == 1) then
				
				text = L["ItemOut"]:format(item["link"], self:GetGoldString(item["out"], simple));
			else
				local count = simple and item["count"] or getItemQualityColorStr(tostring(item["count"]), item["rarity"]);
				text = L["ItemOutMuti"]:format(item["link"], count, self:GetGoldString(item["out"], simple));
			end			
		end
	elseif (item.type == "custom") then
		if (item["in"] > 0) then			
			text = L["CustomIn"]:format(item.content, self:GetGoldString(item["in"], simple));
		elseif (item["out"] > 0) then
			text = L["CustomOut"]:format(item.content, self:GetGoldString(item["out"], simple));
		else
			text = item.content;
		end
	end

	return text;
end
--------------------
-- Item
function GKP:AddItem(item)
	assert(type(item) == "table", "invalid event added event must be a table value");
	
	if (self:HasActiveRaid() or self._DEBUG) then
		local curRaid = self:GetCurRaid();
		table.insert(curRaid.itemList, 1, item);		
	end
end

function GKP:DeleteItem(index)	
	if (self:HasActiveRaid() or self._DEBUG) then
		local curRaid = self:GetCurRaid();
		if (index <= #(curRaid.itemList)) then	
			table.remove(curRaid.itemList, index);
		end
	end
end

function GKP:EditItem(index, item)
	assert(type(item) == "table", "invalid event added event must be a table value");

	if (self:HasActiveRaid()) then
		local curRaid = self:GetCurRaid();
		curRaid.itemList[index] = item;
	end
end

function GKP:GetItemID(item)
	local itemName, itemLink = GetItemInfo(item);
	if (itemName and itemLink) then
		return tostring(strmatch(itemLink, "item:(%d+)"));
	end
	return false;
end

function GKP:CheckRecordItem(item)
	local itemName, itemLink, itemQuality = GetItemInfo(item);
	if (itemName and itemLink) then
		local itemID = self:GetItemID(itemLink);
		local minQuality = self:GetCVar("itemQuality");
		local ignorItems = self:GetCVar("ignorItems");
		if (itemQuality and itemQuality >= minQuality and not ignorItems[itemID]) then
			return true;
		end

		-- TODO: 需要记录的特殊物品
	end
	
	return false;
end
--------------------
-- Member
function GKP:AddMember(item)
	assert(type(item) == "table", "invalid event added event must be a table value");
	
	if (self:HasActiveRaid()) then
		local curRaid = self:GetCurRaid();
		table.insert(curRaid.memberList, item);

		self:UpdateMembers();
	end
end

function GKP:DeleteMember(index)	
	if (self:HasActiveRaid()) then
		local curRaid = self:GetCurRaid();
		if (index <= #(curRaid.memberList)) then			
			table.remove(curRaid.memberList, index);

			self:UpdateMembers();
		end
	end
end

function GKP:EditMember(index, item)
	assert(type(item) == "table", "invalid event added event must be a table value");
	
	if (self:HasActiveRaid()) then
		local curRaid = self:GetCurRaid();
		curRaid.memberList[index] = item;
	end
end
--------------------
-- Event
function GKP:AddEvent(item)
	assert(type(item) == "table", "invalid event added event must be a table value");
	
	if (self:HasActiveRaid()) then
		local curRaid = self:GetCurRaid();
		table.insert(curRaid.eventList, item);
	end
end

function GKP:DeleteEvent(index)	
	if (self:HasActiveRaid()) then
		local curRaid = self:GetCurRaid();
		if (index <= #(curRaid.eventList)) then
			table.remove(curRaid.eventList, index);
		end
	end
end

function GKP:EditEvent(index, item)
	assert(type(item) == "table", "invalid event added event must be a table value");

	if (self:HasActiveRaid()) then
		local curRaid = self:GetCurRaid();
		curRaid.eventList[index] = item;
	end
end
--------------------
-- Raid
function GKP:CreateRaid(name)
	assert(name and type(name) == "string");
	
	local ctime = self:GetTimeStamp();
	local key = name .. ctime;
	
	local newRaid = {};
	newRaid.info = {};
	newRaid.info.name = name;
	newRaid.info.ctime = ctime;
	newRaid.info.creator = UnitName("player");
	newRaid.info.realm = GetRealmName();
	newRaid.info.status = "DEACTIVE";
	newRaid.info.zone = GetRealZoneText();
	newRaid.info.incoin = 0;		-- 收入金额
	newRaid.info.outcoin = 0;		-- 支出金额
	newRaid.info.distribute = 0;	-- 分配人数
	newRaid.memberList = {};		-- 成员
	newRaid.eventList = {};		-- 事件
	newRaid.itemList = {};		-- 物品
	newRaid.customList = {};		-- 自定义事件
	newRaid.name2class = {};		-- 名字到职业
	-- 映射数据
	self.db[key] = newRaid;
	self:SetCVar("CurRaid", key);
	return newRaid;
end

function GKP:GetCurRaid()
	if (self.config.CurRaid and self.db[self.config.CurRaid]) then
		return self.db[self.config.CurRaid];
	end
	return nil;
end

function GKP:SetCurRaid(name)
	assert(name and type(name) == "string");
	
	if (self.db[name]) then
		self:SetCVar("CurRaid", name);
	end
end

function GKP:DeleteRaid(name)
	assert(name and type(name) == "string");

	if (self.db[name] and self:GetCurRaid() ~= name) then
		self.db[name] = nil;
		return true;
	end

	return false;
end

function GKP:BeginRaid()
	local curRaid = self:GetCurRaid();
	if (curRaid) then
		curRaid.info.status = "ACTIVE";
		curRaid.info.starttime = self:GetTimeStamp();

		self:OnRaidRosterUpdate();
	else
		self:debug("Begin raid failed, no curRaid");
	end
end

function GKP:EndRaid(force)
	if (self:HasActiveRaid() or force) then
		local curRaid = self:GetCurRaid();
		if (curRaid) then
			curRaid.info.status = "DEACTIVE";
			curRaid.info.endtime = self:GetTimeStamp();
			self.Maps.members = {};
		end		
		self:SetCVar("CurRaid", nil);
	else
		self:debug("End raid failed, no curRaid");
	end
end

function GKP:ActiveRaid(raid, force)
	local curRaid;
	for k, v in pairs(self.db) do
		v.info.status = "DEACTIVE";
		if (v.info.name == raid.name and v.info.ctime == raid.ctime) then
			curRaid = v;
		end
	end

	if (curRaid and (true or force)) then
		curRaid.info.status = "ACTIVE";
		local key = curRaid.info.name..curRaid.info.ctime;
		self:SetCurRaid(key);
		-- 刷新映射
		self:UpdateMembers();
	end	
end

-----------
-- 判断当前是否处于观察状态
function GKP:InViewMod()
	local curRaid = self:GetCurRaid();
	-- 有当前活动, 且当前活动已经结束, 并且不是激活状态
	if (curRaid and curRaid.info.endtime and curRaid.info.status ~= "ACTIVE") then
		return true;
	end

	return false;
end

function GKP:GetRaidModColor()
	local curRaid = self:GetCurRaid();
	if (curRaid) then
		if (self:InViewMod()) then
			return 1, 0.45, 0;
		else
			return 0.1, 0.8, 0.1;
		end
	else
		return 1.0, 0.82, 0;
	end
end
---------------------
--
function GKP:UpdateMembers()
	if (self:HasActiveRaid()) then
		local curRaid = self:GetCurRaid();
		for name, v in pairs(self.Maps.members) do
			self.Maps.members[name] = 0;			
		end

		for i, v in ipairs(curRaid.memberList) do
			self.Maps.members[v.name] = i;
		end
	end
end

---------------------
-- 获得排序和过滤的数据
--local function getStartTime(st)
	--local a, b = strmatch(st, "(%d+):(%d+)");
	--return tonumber(format("%02d%02d", a, b));
--end
function GKP:SortMember()
	local curRaid = self:GetCurRaid();
	local key = self:GetCVar("sortkey");
	if (curRaid and key) then
		if (key == "name") then
			table.sort(curRaid.memberList, function(a, b)
				return a.name < b.name;
			end);
		elseif (key == "class") then			
			table.sort(curRaid.memberList, function(a, b)
				return DWGKP_CLASS_SORT_DATA[a.class] < DWGKP_CLASS_SORT_DATA[b.class];
			end);
		elseif (key == "precent") then
			table.sort(curRaid.memberList, function(a, b)
				return a.precent > b.precent;
			end);
		elseif (key == "bro") then
			table.sort(curRaid.memberList, function(a, b)
				return abs(a.bro) > abs(b.bro);
			end);
		elseif (key == "jion") then
			table.sort(curRaid.memberList, function(a, b)
				if (type(a.starttime) ~= "string") then
					a.starttime = self:GetTimeStamp();
				end
				if (type(b.starttime) ~= "string") then
					b.starttime = self:GetTimeStamp();
				end
				
				return self:ParseTimeStamp(a.starttime) < self:ParseTimeStamp(b.starttime);
			end);	
		elseif (key == "offline") then
			table.sort(curRaid.memberList, function(a, b)
				return (a.offtime or 0) > (b.offtime or 0);
			end);
		elseif (key == "bonus") then
			table.sort(curRaid.memberList, function(a, b)
				return abs(a.bonus) > abs(b.bonus);
			end);
		end

		self:UpdateMembers();
	end
end

function GKP:GetMemberData(classes)	
	local curRaid = self:GetCurRaid();
	local data = {};
	if (curRaid) then	
		local tmp = {};
		local classes = classes or curRaid.info.classfilter or DWGKP_DEFAULT_CLASS_FILTER;
		for k, v in ipairs(classes) do
			tmp[L[v]] = k;
		end		
		if (classes) then
			curRaid.info.classfilter = self:CloneTable(classes);
		end
		self:SortMember();
		for i, v in ipairs(curRaid.memberList) do
			if (v["class"] and tmp[v["class"]]) then
				tinsert(data, v);
			end
		end
		
	end
	return data;
end
--[[===================
多玩G团助手报表(简明)
--------------------
收支明细:

--------------------
总收入: 6200G

罚款收入: 200G
装备拍卖: 5000G
其他收入: 1000G
--------------------
总花费: 520G

奖励支出: 500G
购买物品: 10G
其他花费: 10G
--------------------
最终分配: 5680G
分配人数: 25人
人均分配: 227G
小队配分:		(5人)
=====================]]

function GKP:ReportEventLog()	
	if (self:HasActiveRaid()) then
		-- 刷新事件记录	
		self:OnUpdateEvents();
		local curRaid = self:GetCurRaid();
		local data = curRaid.eventList;
		local simpleMod = self:GetCVar("reportMod");
		local totalIncome = self:GetGoldString(curRaid.info.incoin, true);
		local totalOutcome = self:GetGoldString(curRaid.info.outcoin, true);
		
		local minc = self:GetGoldString(self.CurRaidInfo.minc, true);
		local mout = self:GetGoldString(self.CurRaidInfo.mout, true);
		local iinc = self:GetGoldString(self.CurRaidInfo.iinc, true);
		local iout = self:GetGoldString(self.CurRaidInfo.iout, true);
		local cinc = self:GetGoldString(self.CurRaidInfo.cinc, true);
		local cout = self:GetGoldString(self.CurRaidInfo.cout, true);
		
		local finalIncome = curRaid.info.incoin - curRaid.info.outcoin;
		local FIText = self:GetGoldString(finalIncome, true);
		local playerNum = curRaid.info.distribute;
		local average = 0;
		if (playerNum > 0) then
			average = floor(finalIncome/playerNum);
		end
		local aveText = self:GetGoldString(average, true);
		local partyText = self:GetGoldString(average*5, true);

		if (simpleMod == 1) then
			self:Send(L["ReportLogSimple"]);	-- 简明
		else
			self:Send(L["ReportLogDetail"]);		-- 详细
			self:Send(L["Seperate line"]);
			self:Send(L["Income and Expenses Detail"]);
			self:Send(" ");	-- 空行
			for i, v in ipairs(data) do
				local text = self:GetFormatEventString(v, true);
				self:Send(text);
			end
			self:Send(" ");	-- 空行
		end

		self:Send(L["Seperate line"]);
		self:Send(L["Total Income"], totalIncome);
		self:Send(" ");	-- 空行
		if (self.CurRaidInfo.minc > 0) then
			self:Send(L["Forfeit"], minc);
		end
		if (self.CurRaidInfo.iinc > 0) then
			self:Send(L["BidIncome"], iinc);
		end
		if (self.CurRaidInfo.cinc > 0) then
			self:Send(L["OtherIncome"], cinc);
		end

		self:Send(L["Seperate line"]);
		self:Send(L["Total Outcome"], totalOutcome);
		self:Send(" ");	-- 空行
		if (self.CurRaidInfo.mout > 0) then
			self:Send(L["Bonus"], mout);
		end
		if (self.CurRaidInfo.iout > 0) then
			self:Send(L["BuyItem"], iout);
		end
		if (self.CurRaidInfo.cout > 0) then
			self:Send(L["OtherOutcome"], cout);
		end

		self:Send(L["Seperate line"]);
		self:Send(L["FinalIncome"], FIText);
		self:Send(L["Distribute num"], playerNum);
		self:Send(L["Average"], aveText);
		self:Send(L["PartyAve"], partyText);
	end	
end