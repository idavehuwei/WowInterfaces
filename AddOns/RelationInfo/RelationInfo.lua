--------------------------------------------------------------------------
-- Relation Info ver 1.0
-- 日期: 2010-12-10
-- 作者: dugu
-- 描述: 保存玩家在游戏中的好友和公会信息
-- 版权所有: duowan.com
--------------------------------------------------------------------------
local R = CreateFrame("Frame");

RelationInfoDB = "";
local LocalToID = {CLASS = {}, RACE = {},};
--[[
服务器类型：
0-国服
1-台服
 
种族：
0-human 人类
1-dwarf 矮人
2-nightElf 暗夜精灵
3-gnome 侏儒
4-draenei 德莱尼
5-worgen 狼人（台服仅有）
 
6-orc 兽人
7-undead 亡灵/不死族
8-tauren 牛头人
9-troll 巨魔
10-bloodElf 血精灵
11-goblin 哥布林（台服仅有）
 
职业：
0-牧师：priest
1-潜行者：rogue
2-德鲁伊：druid
3-猎人：hunter
4-圣骑士：paladin
5-法师：mage
6-萨满祭司：shaman
7-术士：warlock
8-战士：worrior
9-死亡骑士: deathknight 

性别: 
1 = Neutrum / Unknown
2 = Male
3 = Female
]]
LocalToID.CLASS["PRIEST"] = 0;
LocalToID.CLASS["ROGUE"] = 1;
LocalToID.CLASS["DRUID"] = 2;
LocalToID.CLASS["HUNTER"] = 3;
LocalToID.CLASS["PALADIN"] = 4;
LocalToID.CLASS["MAGE"] = 5;
LocalToID.CLASS["SHAMAN"] = 6;
LocalToID.CLASS["WARLOCK"] = 7;
LocalToID.CLASS["WARRIOR"] = 8;
LocalToID.CLASS["DEATHKNIGHT"] = 9;

LocalToID.RACE["HUMAN"] = 0;
LocalToID.RACE["DWARF"] = 1;
LocalToID.RACE["NIGHTELF"] = 2;
LocalToID.RACE["GNOME"] = 3;
LocalToID.RACE["DRAENEI"] = 4;
LocalToID.RACE["WORGEN"] = 5;
LocalToID.RACE["ORC"] = 6;
LocalToID.RACE["SCOURGE"] = 7;
LocalToID.RACE["TAUREN"] = 8;
LocalToID.RACE["TROLL"] = 9;
LocalToID.RACE["BLOODELF"] = 10;
LocalToID.RACE["GOBLIN"] = 11;

function R:Initialize()
	self.playerInfo = {};
	self.friendInfo = {};
	self.guildInfo = {};
	self:RegisterEvent("FRIENDLIST_UPDATE");
	self:RegisterEvent("GUILD_ROSTER_UPDATE");
	self:RegisterEvent("PLAYER_LOGIN");
	self:RegisterEvent("PLAYER_LOGOUT");
	self:SetScript("OnEvent", function(this, event, ...)
		self:OnEvent(event);
	end);

	self.palyerGuild = GetGuildInfo("player");
end

function R:SavePlayerInfo()
	local name = UnitName("player");
	local _, class = UnitClass("player");
	local server = GetCVar("realmName");
	local _, race = UnitRace("player");
	local sex = UnitSex("player");
	local level = UnitLevel("player");
	local guild = self.palyerGuild or "";
	local loc = GetLocale();
	self.playerInfo = {
		type = loc,
		server = server,
		name = name,
		sex = sex,
		job = strupper(class),
		race = strupper(race),
		rank = level,
		guild = guild,
	};
end

function R:SaveFriendInfo()
	local numF = GetNumFriends();
	local name;
	for index=1, numF do
		name = GetFriendInfo(index);
		if (name) then
			self.friendInfo[name] = true;
		end		
	end
end

function R:SaveGuildInfo()
	local numGM = GetNumGuildMembers(true);
	local name;
	for index=1, numGM do
		name = GetGuildRosterInfo(index);
		self.guildInfo[name] = true;
	end
end

function R:ToXML()
	-- 限制只能是台服或者国服
	local xml = "";
	local loc = GetLocale();
	--print(loc, LocalToID.CLASS[self.playerInfo.job], LocalToID.RACE[self.playerInfo.race], self.playerInfo.race)
	if (loc == "zhCN" or loc == "zhTW") then
		local pi = self.playerInfo;
		local localid = (loc == "zhCN") and 0 or 1;
		if (LocalToID.CLASS[pi.job] and LocalToID.RACE[pi.race]) then
			xml = "<wowinfo>";	
				-- 玩家信息
				xml = xml .. "<type>".. localid .."</type>";
				xml = xml .. "<server>".. pi.server .."</server>";
				xml = xml .. "<name>".. pi.name .."</name>";
				xml = xml .. "<sex>" .. pi.sex .. "</sex>"
				xml = xml .. "<job>".. LocalToID.CLASS[pi.job] .."</job>";
				xml = xml .. "<race>".. LocalToID.RACE[pi.race] .."</race>";
				xml = xml .. "<rank>".. pi.rank .."</rank>";
				xml = xml .. "<guild>".. pi.guild .."</guild>";
				-- 好友
				xml = xml .. "<buddy-lists>";
					for friend, _ in pairs(self.friendInfo) do
						xml = xml .. format("<buddy-list name=\"%s\"/>", friend);
					end
				xml = xml .. "</buddy-lists>";
				-- 公会
				--[[
				xml = xml .. "<crew-lists>";					
					for name, _ in pairs(self.guildInfo) do
						xml = xml .. format("<crew-list name=\"%s\"/>", name);
					end					
				xml = xml .. "</crew-lists>";
				]]
			xml = xml .. "</wowinfo>";
		end
	end
	RelationInfoDB = xml;
end

function R:OnEvent(event)
	if (event == "PLAYER_LOGIN") then
		if (GetGuildInfo("player")) then
			GuildRoster();
		end
		self:SaveFriendInfo();
	elseif (event == "FRIENDLIST_UPDATE") then
		self:SaveFriendInfo();
	elseif (event == "GUILD_ROSTER_UPDATE") then	
		--self:SaveGuildInfo();
		self.palyerGuild = GetGuildInfo("player");
	elseif (event == "PLAYER_LOGOUT") then
		self:SavePlayerInfo();
		self:ToXML();
	end
end

R:Initialize();