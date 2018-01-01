--[[
Name: Quixote-1.0
Revision: $Revision: 151 $
Author(s): Kemayo (kemayo@gmail.com)
Website: http://www.wowace.com/wiki/Quixote-1.0
Documentation: http://www.wowace.com/wiki/Quixote-1.0
SVN: http://svn.wowace.com/wowace/trunk/Quixote/
Description: Abstracts out questlog handling.
Dependencies: AceLibrary, AceEvent-2.0, AceComm-2.0 (optional), Deformat-2.0
License: LGPL v2.1
]]

local MAJOR_VERSION = "Quixote-1.0"
local MINOR_VERSION = 90000 + tonumber(("$Revision: 151 $"):match("(%d+)"))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end
if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

if not AceLibrary:HasInstance("AceEvent-2.0") then error(MAJOR_VERSION .. " requires AceEvent-2.0.") end
if not AceLibrary:HasInstance("Deformat-2.0") then error(MAJOR_VERSION .. " requires Deformat-2.0.") end

local deformat
local Quixote = {}

------------------------------------------------
-- Light localization
------------------------------------------------

local DUNGEON = LFG_TYPE_DUNGEON
local HEROIC = DUNGEON_DIFFICULTY2
local PVP = PVP_ENABLED
local UPGRADEMSG1 = "%s tried to share quest info, but has a newer version of the addon; please upgrade"
local UPGRADEMSG2 = "You have an older version of the Quixote library than %s -- please upgrade the quest addon which is using it."

if GetLocale() == "koKR" then
	PVP = "전쟁" -- check global strings
	UPGRADEMSG1 = "%s|1이;가; 퀘스트 정보를 공유하려고 시도했으나, 애드온의 새로운 버전이 필요합니다; 업데이트 해주세요"
	UPGRADEMSG2 = "Quixote 라이브러리가 %s님 보다 하위 버전입니다 -- 사용하는 애드온을 업데이트 해주세요."
elseif GetLocale() == "zhCN" then
	UPGRADEMSG1 = "%s尝试和分享任务信息,但有较新的插件;请更新!"
	UPGRADEMSG2 = "你的Quixote函数库比%s版本旧 -- 请更新你的插件."
elseif GetLocale() == "zhTW" then
	UPGRADEMSG1 = "%s嘗試和你分享任務資訊，但有較新的插件。請更新!"
	UPGRADEMSG2 = "你的 Quixote 程式庫比%s的舊 -- 請更新你的插件。"
elseif GetLocale() == "ruRU" then --Translation by Eritnull (StingerSoft aka Шептун)
	UPGRADEMSG1 = "%s пытается поделиться информацией о задании, но у него более новая версия аддона, пожалуйста обновитесь"
	UPGRADEMSG2 = "У вас устаревшая версия библиотеки Quixote нежели %s -- пожалуйста обновите аддон, использующий данную библиотеку."
end

local tag = {
	[ELITE] = '+',
	[GROUP] = 'g',
	[PVP] = 'p',
	[RAID] = 'r',
	[DUNGEON] = 'd',
	[HEROIC] = 'd+',
}
if DAILY then
	tag[DAILY] = 'y'
end

local new, newSet, del, deepDel
do
	local list = setmetatable({}, {__mode='k'})
	function new(...)
		local t = next(list)
		if t then
			list[t] = nil
			for i = 1, select('#', ...) do
				t[i] = select(i, ...)
			end
			return t
		else
			return { ... }
		end
	end
	function newSet(...)
		local t = next(list)
		if t then
			list[t] = nil
		else
			t = {}
		end
		for i = 1, select('#', ...) do
			t[select(i, ...)] = true
		end
		return t
	end
	function del(t)
		setmetatable(t, nil)
		for k in pairs(t) do
			t[k] = nil
		end
		t[true] = true
		t[true] = nil
		list[t] = true
		return nil
	end
	function deepDel(t)
		if type(t) ~= "table" then
			return nil
		end
		for k,v in pairs(t) do
			t[k] = deepDel(v)
		end
		return del(t)
	end
end

-- All the cool kids seem to be pulling global functions into local scope, and I want to be hip to their jive.

local GetQuestLogTitle = GetQuestLogTitle
local GetQuestLogSelection = GetQuestLogSelection
local GetNumQuestLogEntries = GetNumQuestLogEntries
local GetQuestLogQuestText = GetQuestLogQuestText
local GetNumQuestLeaderBoards = GetNumQuestLeaderBoards

------------------------------------------------
-- activate, external
------------------------------------------------

local function activate(self, oldLib, oldDeactivate)
	if oldLib then
		self.quests = oldLib.quests
		self.quests_zone = oldLib.quests_zone
		self.quests_level = oldLib.quests_level
		self.mobs = oldLib.mobs
		self.items = oldLib.items
		self.quest_names = oldLib.quest_names
		self.zones = oldLib.zones
		self.numQuests = oldLib.numQuests
		self.numQuestsDone = oldLib.numQuestsDone
		self.firstScanDone = oldLib.firstScanDone
		self.party = oldLib.party

		oldLib:UnregisterAllEvents()
		oldLib:CancelAllScheduledEvents()

		if oldLib.commPrefix then
			oldLib.UnregisterAllComms(self) -- AceLibrary's magic reference-changing
			self.commPrefix = oldLib.commPrefix
		end
	end

	if not self.quests then self.quests = {} end
	if not self.quests_zone then self.quests_zone = {} end
	if not self.quests_level then self.quests_level = {} end
	if not self.mobs then self.mobs = {} end
	if not self.items then self.items = {} end
	if not self.quest_names then self.quest_names = {} end
	if not self.zones then self.zones = {} end
	if not self.numQuests then self.numQuests = 0 end
	if not self.numQuestsDone then self.numQuestsDone = 0 end
	if not self.firstScanDone then self.firstScanDone = false end
	if not self.party then self.party = {} end

	if oldDeactivate then oldDeactivate(oldLib) end
end

local function external(self, major, instance)
	if major == "AceEvent-2.0" then
		instance:embed(self)
		self:UnregisterAllEvents()
		self:CancelAllScheduledEvents()
		if instance:IsFullyInitialized() then
			self:AceEvent_FullyInitialized()
		else
			self:RegisterEvent("AceEvent_FullyInitialized", "AceEvent_FullyInitialized", true)
		end
	elseif major == "Deformat-2.0" then
		deformat = instance
	elseif major == "AceComm-2.0" then
		instance:embed(self)
		if not self.commPrefix then
			self:SetCommPrefix("Quixote")
			--Memoize the handler names
			self:RegisterMemoizations({"PING", "PONG", "GETQUESTS", "STARTSYNC", "STOPSYNC", "QUESTSTATUS", "QUESTGAINED", "QUESTCOMPLETE", "QUESTLOST", "OLDVERSION",})
		end
		self:RegisterComm(self.commPrefix, "PARTY")
		self:RegisterComm(self.commPrefix, "WHISPER")
	end
end

------------------------------------------------
-- Internal functions
------------------------------------------------

-- #NODOC
function Quixote:AceEvent_FullyInitialized()
	self:RegisterBucketEvent("QUEST_LOG_UPDATE", 1)
	--We use a bucket event because scanning the quest log can trigger QUEST_LOG_UPDATE once per quest-related item if it has to repopulate the game's itemcache.
	self:QUEST_LOG_UPDATE()

	self:TriggerEvent("Quixote_Enabled")
	--Comm stuff:
	self:RegisterEvent("Quixote_Leaderboard_Update")
	self:RegisterEvent("Quixote_Quest_Gained")
	self:RegisterEvent("Quixote_Quest_Lost")
	--self:RegisterEvent("Quixote_Quest_Abandoned")
	self:RegisterEvent("Quixote_Quest_Complete")
	self:RegisterBucketEvent("Quixote_SyncTo", 5, "SyncQuests")
	self:RegisterBucketEvent("Quixote_PingResponse", 5)
	self:RegisterEvent("PARTY_MEMBERS_CHANGED")
	self:PARTY_MEMBERS_CHANGED()

	if self:HasAnythingFuckedUpGetQuestLogTitle() then
		self:error("An addon has broken GetQuestLogTitle. Please make sure all addons involving the quest log are up to date.")
	end
end

do
	local orig_abandon_onaccept, orig_abandon_items_onaccept, abandon_onaccept, abandon_items_onaccept
	function Quixote:HookDialogs()
		orig_abandon_onaccept = StaticPopupDialogs["ABANDON_QUEST"].OnAccept
		orig_abandon_items_onaccept = StaticPopupDialogs["ABANDON_QUEST_WITH_ITEMS"].OnAccept
		StaticPopupDialogs["ABANDON_QUEST"].OnAccept = abandon_onaccept
		StaticPopupDialogs["ABANDON_QUEST_WITH_ITEMS"].OnAccept = abandon_items_onaccept
	end
	function Quixote:UnhookDialogs()
		StaticPopupDialogs["ABANDON_QUEST"].OnAccept = orig_abandon_onaccept
		StaticPopupDialogs["ABANDON_QUEST_WITH_ITEMS"].OnAccept = orig_abandon_items_onaccept
	end
	function abandon_onaccept()
		local name = GetAbandonQuestName()
		orig_abandon_onaccept()
		Quixote:TriggerEvent("Quixote_Quest_Abandoned", name, Quixote.quest_names[name])
	end
	function abandon_items_onaccept()
		local name = GetAbandonQuestName()
		orig_abandon_items_onaccept()
		Quixote:TriggerEvent("Quixote_Quest_Abandoned", name, Quixote.quest_names[name])
	end
end

------------------------------------------------
-- Quest scanning
------------------------------------------------

function Quixote:QUEST_LOG_UPDATE()
	local startingQuestLogSelection = GetQuestLogSelection()
	local numEntries, numQuests = GetNumQuestLogEntries()
	local numQuestsDone = 0

	local oldquests, oldquest_names = self.quests, self.quest_names
	local quests, quest_names, quests_zone, quests_level, mobs, items, zones = new(), new(), new(), new(), new(), new(), new()

	local zoneIndex = "Unknown" --The first item in the quest log should always be a header, so this should always be replaced.  But just in case, give it a default value.

	if numEntries > 0 then
		local questid
		for questid = 1, numEntries do
			SelectQuestLogEntry(questid) -- this is required for a few of the quest functions.
			local strQuestLogTitleText, strQuestLevel, strQuestTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(questid)

			if isHeader then
				zoneIndex = strQuestLogTitleText
				if not quests_zone[zoneIndex] then
					zones[#zones+1] = zoneIndex
					quests_zone[zoneIndex] = new()
				end
			else
				local q = new()
				local strQuestDescription, strQuestObjectives = GetQuestLogQuestText(questid)

				--Many mods like to hook GetQuestLogTitle to add levels to the names.  This is annoying, so strip out the common format for it.
				if strQuestLogTitleText:match('^%[') then strQuestLogTitleText = strQuestLogTitleText:match("^%[[^%]]+%]%s?(.*)") end

				quest_names[strQuestLogTitleText] = questid

				q.zone = zoneIndex
				q.id = questid
				q.title = strQuestLogTitleText
				q.level = strQuestLevel
				
				if isDaily then
					if strQuestTag and tag[strQuestTag] then
						q.tag = tag[DAILY]..tag[strQuestTag]
						strQuestTag = string.format(DAILY_QUEST_TAG_TEMPLATE, strQuestTag)
					else
						q.tag = tag[DAILY]
						strQuestTag = DAILY
					end
				else
					q.tag = tag[strQuestTag] and tag[strQuestTag] or ''
				end
				q.longtag = strQuestTag or ''
				q.complete = isComplete -- 1 if complete, -1 if failed, nil otherwise
				q.description = strQuestDescription
				q.objective = strQuestObjectives
				q.group = suggestedGroup

				if isComplete == 1 then
					numQuestsDone = numQuestsDone + 1
				end

				local lb = new()
				--The "or 0" in this is an attempt to avoid erroring when addons that incompetently hook quest functions are installed. Yes, I'm talking about EQL.
				if (GetNumQuestLeaderBoards(questid) or 0) > 0 then
					local ii
					for ii=1, GetNumQuestLeaderBoards(questid) do
						local desc, qtype, done = GetQuestLogLeaderBoard(ii, questid)
						local numNeeded,numItems,mobName
						local l = new()

						if qtype == 'item' or qtype == 'object' then --'object' for the leaderboard in Dousing the Flames of Protection; maybe others.
							desc,numItems,numNeeded = deformat(desc, QUEST_OBJECTS_FOUND)
							items[desc] = ("%s: %d/%d"):format(strQuestLogTitleText, numItems, numNeeded)
						elseif qtype == 'monster' then
							mobName,numItems,numNeeded = deformat(desc, QUEST_MONSTERS_KILLED)
							if mobName == nil or numItems == nil or numNeeded == nil then
								--Sometimes we get objectives like "Find Mankrik's Wife: 0/1", which are listed as "monster".
								mobName, numItems, numNeeded = deformat(desc, QUEST_OBJECTS_FOUND)
							end
							desc = mobName
							if mobs[desc] then
								--Another quest also wants this mob!  Convert mobs[desc] to a table.
								if type(mobs[desc]) == 'string' then
									local s = mobs[desc]
									mobs[desc] = new()
									mobs[desc][1] = s
								end
								local t = mobs[desc]
								t[#t+1] = ("%s: %d/%d"):format(strQuestLogTitleText, numItems, numNeeded)
							else
								mobs[desc] = ("%s: %d/%d"):format(strQuestLogTitleText, numItems, numNeeded)
							end
						elseif qtype == 'reputation' then
							desc,numItems,numNeeded = deformat(desc, QUEST_FACTION_NEEDED)
						elseif qtype == 'event' then
							numNeeded = 1
							if done then
								numItems = 1
							else
								numItems = 0
							end
						end

						l.description = desc
						l.type = qtype
						l.numGot = numItems
						l.numNeeded = numNeeded
						l.done = done
						
						lb[#lb+1] = l
					end
				end
				q.leaderboard = lb

				quests[questid] = q
				local t = quests_zone[zoneIndex]
				t[#t+1] = questid
				quests_level[#quests_level+1] = questid
			end
		end
		SelectQuestLogEntry(startingQuestLogSelection)
	end
	
	self.quests_zone = deepDel(self.quests_zone)
	self.quests_level = deepDel(self.quests_level)
	self.mobs = deepDel(self.mobs)
	self.items = deepDel(self.items)
	self.zones = deepDel(self.zones)
	
	self.quests = quests
	self.quest_names = quest_names
	self.quests_level = self:SortQuests(quests_level)
	for zone, quests in pairs(quests_zone) do
		quests_zone[zone] = self:SortQuests(quests)
	end
	self.quests_zone = quests_zone
	self.items = items
	self.mobs = mobs
	self.zones = zones
	self.numQuests = numQuests
	self.numEntries = numEntries
	self.numQuestsDone = numQuestsDone

	if self.firstScanDone then
		--Do all this checking down here so we can guarantee that library calls in response to triggered events will receive data about the current state of the quest log.
		for name,id in pairs(quest_names) do
			--have we gained any quests?
			if not oldquest_names[name] then
				self:TriggerEvent("Quixote_Quest_Gained", name, id, #quests[id].leaderboard)
			else
				local quest = quests[id]
				local oldquest = oldquests[oldquest_names[name]]
				-- copy the unique id if we have one
				if oldquest.uqid then
					quest.uqid = oldquest.uqid
				end
				--have we changed any leaderboards?
				for l, goal in pairs(quest.leaderboard) do
					local oldgoal = oldquest.leaderboard[l]
					if oldgoal and goal.numGot ~= 0 and oldgoal.description == goal.description and oldgoal.numGot ~= goal.numGot then
						self:TriggerEvent("Quixote_Leaderboard_Update", name, id, l, goal.description, oldgoal.numGot, goal.numGot, goal.numNeeded, goal.type)
					end
				end
				--did we complete/fail a quest?
				if not oldquest.complete and quest.complete then
					if quest.complete == 1 then
						self:TriggerEvent("Quixote_Quest_Complete", name, id)
					elseif quest.complete == -1 then
						self:TriggerEvent("Quixote_Quest_Failed", name, id)
					end
				end
			end
		end
		--have we lost any quests?
		for name, id in pairs(oldquest_names) do
			if not quest_names[name] then
				self:TriggerEvent("Quixote_Quest_Lost", name, id)
			end
		end
	else
		self.firstScanDone = true
		self:TriggerEvent("Quixote_Ready")
	end
	
	oldquests = deepDel(oldquests)
	oldquest_names = del(oldquest_names)

	self:TriggerEvent("Quixote_Update")
end

-- Sorts a table of quests by level, with quests of the same level ordered
-- by elite, dungeon or raid tags, i.e. normal < elite < dungeon < raid.
-- Quests of the same level and tag are sorted alphabetically by title.
local mySort
-- #NODOC
function Quixote:SortQuests(quests)
	if not mySort then
		mySort = function(a,b)
			local q = self.quests
			local aa = q[a].level*4
			local bb = q[b].level*4
			if q[a].tag == tag[DAILY] then aa = aa+1
			elseif q[a].tag == tag[ELITE] then aa = aa+2
			elseif q[a].tag == tag[GROUP] then aa = aa+2
			elseif q[a].tag == tag[DUNGEON] then aa = aa+3
			elseif q[a].tag == tag[HEROIC] then aa = aa+4
			elseif q[a].tag == tag[RAID] then aa = aa+5
			elseif q[a].tag == tag[PVP] then aa = aa+6 end
			if q[b].tag == tag[DAILY] then bb = bb+1
			elseif q[b].tag == tag[ELITE] then bb = bb+2
			elseif q[b].tag == tag[GROUP] then bb = bb+2
			elseif q[b].tag == tag[DUNGEON] then bb = bb+3
			elseif q[b].tag == tag[HEROIC] then bb = bb+4
			elseif q[b].tag == tag[RAID] then bb = bb+5
			elseif q[b].tag == tag[PVP] then bb = bb+6 end
			if aa == bb then
				return q[a].title < q[b].title
			end
			return aa < bb
		end
	end
	table.sort(quests, mySort)

	return quests
end

local function questIter(questList, i)
	i = i + 1
	local v = questList and questList[i]
	if v then
		return i, v
	end
end

local function questGetItr(handler, i)
	i = next(handler.quests,i)
	if i then
		return i, handler:GetQuestById(i)
	end
end

local function partyQuestIter(t)
	local n = t.n
	n = n + 1
	t.n = n
	return t[n] or del(t)
end

local function mobIter(mobList, i)
	-- This iterator is lightly special-cased to allow mobList to either be a list or a string.
	-- Note to self: consider changing this to a much simpler iter, and special-case the string inside :IterateQuestsForMob.
	i = i + 1
	local v
	if type(mobList) == 'table' then
		v = mobList and mobList[i]
	else
		if i > 1 then
			-- If mobList is a string, we can only get one valid response from it, so force it to abort on the second pass.
			return nil
		else
			v = mobList
		end
	end
	if v then
		local _, _, mob, numGot, numNeeded = string.find(v, "(.+): (%d+)/(%d+)")
		return i, mob, tonumber(numGot), tonumber(numNeeded)
	end
end

local function hashstr(str)
	if not str or string.len(str) == 0 then
		return 0
	end

	local hash = 0
	for i=1,string.len(str) do
		hash = (hash + string.byte(str, i)) % 4294967291
	end

	return hash
end


------------------------------------------------
-- AceComm
------------------------------------------------

local COMM_COMPAT = 2
local commHandlers = {}
local warned_of_new_version

function Quixote:OnCommReceive(prefix, sender, distribution, compat, handler, ...)
	if not (self.SendCommMessage and compat) then return end
	if compat > COMM_COMPAT then
		if not warned_of_new_version then
			DEFAULT_CHAT_FRAME:AddMessage(string.format(UPGRADEMSG1, sender))
			warned_of_new_version = true
		end
	elseif compat == COMM_COMPAT and type(handler) == 'string' and commHandlers[handler] then
		commHandlers[handler](self, sender, ...)
	end
end

function commHandlers:PING(sender)
	self:SendCommMessage("PARTY", COMM_COMPAT, "PONG")
end

function commHandlers:PONG(sender)
	self:TriggerEvent("Quixote_PingResponse", sender)
end

function commHandlers:GETQUESTS(sender)
	self:TriggerEvent("Quixote_SyncTo", sender)
end

function commHandlers:STARTSYNC(sender)
	if self.party[sender] then
		self.party[sender] = deepDel(self.party[sender])
	end
	self.party[sender] = new()
	self.party[sender].__sync = true
end

function commHandlers:STOPSYNC(sender)
	if self.party[sender] then
		self.party[sender].__sync = nil
		self:TriggerEvent("Quixote_Party_Quest_Sync", sender)
	end
end

function commHandlers:QUESTGAINED(sender, title)
	if not self.party[sender] then
		self:SendCommMessage("WHISPER", sender, COMM_COMPAT, "GETQUESTS")
	else
		self.party[sender][title] = new()
		if not self.party[sender].__sync then
			self:TriggerEvent("Quixote_Party_Quest_Gained", sender, title)
		end
	end
end

function commHandlers:QUESTCOMPLETE(sender, title)
	--Doesn't do anything to self.party[sender] because theoretically this is largely redundant -- if all the objectives in self.party[sender][quest] are complete, the quest is complete.
	self:TriggerEvent("Quixote_Party_Quest_Complete", sender, title)
end

function commHandlers:QUESTLOST(sender, title)
	if not self.party[sender] then
		self.party[sender] = new()
	end
	self.party[sender][title] = deepDel(self.party[sender][title])
	self:TriggerEvent("Quixote_Party_Quest_Lost", sender, title)
end

function commHandlers:QUESTSTATUS(sender, title, description, numGot, numNeeded)
	if not self.party[sender] or not self.party[sender][title] then
		self:SendCommMessage("WHISPER", sender, COMM_COMPAT, "GETQUESTS")
	else
		local numHad
		if not self.party[sender][title][description] then
			self.party[sender][title][description] = new(numGot, numNeeded)
		else
			for o,n in pairs(self.party[sender][title]) do
				if o == description then
					numHad = self.party[sender][title][o][1]
					self.party[sender][title][o][1] = numGot
					break
				end
			end
		end
		if numHad and (not self.party[sender].__sync) then
			self:TriggerEvent("Quixote_Party_Leaderboard_Update", sender, title, description, numHad, numGot, numNeeded)
		end
	end
end

-- #NODOC
function Quixote:Quixote_Leaderboard_Update(name, qid, lbid, description, numHad, numGot, numNeeded, lbtype)
	if type(self.SendCommMessage) == "function" then
		self:SendCommMessage("PARTY", COMM_COMPAT, "QUESTSTATUS", name, description, numGot, numNeeded)
	end
end
-- #NODOC
function Quixote:Quixote_Quest_Gained(title, id, nObj)
	if type(self.SendCommMessage) == "function" then
		self:SendCommMessage("PARTY", COMM_COMPAT, "QUESTGAINED", title)
		for _,g in pairs(self.quests[id].leaderboard) do
			self:SendCommMessage("PARTY", COMM_COMPAT, "QUESTSTATUS", title, g.description, g.numGot, g.numNeeded)
		end
	end
end
-- #NODOC
function Quixote:Quixote_Quest_Lost(title, id)
	if type(self.SendCommMessage) == "function" then
		self:SendCommMessage("PARTY", COMM_COMPAT, "QUESTLOST", title)
	end
end
-- #NODOC
function Quixote:Quixote_Quest_Complete(title, id)
	if type(self.SendCommMessage) == "function" then
		self:SendCommMessage("PARTY", COMM_COMPAT, "QUESTCOMPLETE", title)
	end
end
-- #NODOC
function Quixote:PARTY_MEMBERS_CHANGED()
	if type(self.SendCommMessage) == "function" then
		self:SendCommMessage("PARTY", COMM_COMPAT, "PING")
	end
end
-- #NODOC
function Quixote:Quixote_PingResponse(responders)
	if type(self.SendCommMessage) == "function" then
		for name in pairs(responders) do
			if not self.party[name] then
				self:SendCommMessage("WHISPER", name, COMM_COMPAT, "GETQUESTS")
			end
		end
	end
end
-- #NODOC
function Quixote:SyncQuests(sender)
	if type(self.SendCommMessage) == "function" then
		self:SendCommMessage("PARTY", COMM_COMPAT, "STARTSYNC")
		for quest,id in pairs(self.quest_names) do
			self:SendCommMessage("PARTY", COMM_COMPAT, "QUESTGAINED", quest)
			for _,g in pairs(self.quests[id].leaderboard) do
				self:SendCommMessage("PARTY", COMM_COMPAT, "QUESTSTATUS", quest, g.description, g.numGot, g.numNeeded)
			end
		end
		self:SendCommMessage("PARTY", COMM_COMPAT, "STOPSYNC")
	end
end

------------------------------------------------
-- API
------------------------------------------------

--------------------------------------------
-- Arguments:
-- string - mob name
--
-- Notes:
-- Checks if the mob is one referenced by name in a leaderboard objective for any quest.
--
-- Example:
-- Quixote:IsQuestMob(UnitName('target'))
--
-- Returns:
-- * boolean - whether the mob is a quest mob
--------------------------------------------
function Quixote:IsQuestMob(mobname)
	self:argCheck(mobname, 2, "string")
	return self.mobs and self.mobs[mobname] and true
end

--------------------------------------------
-- Arguments:
-- string - mob name
--
-- Notes:
-- Iterate over quests for which a mob is a leaderboard item.
-- Note that in the vast majority of cases this will only be one mob.
--
-- Example:
-- for _, mobName, numberGot, numberNeeded in quixote:IterateQuestsForMob("Tseric") do ... end
--------------------------------------------
function Quixote:IterateQuestsForMob(mobname)
	self:argCheck(mobname, 2, "string")
	if not self.mobs[mobname] then return false end
	return mobIter, self.mobs[mobname], 0
end

--------------------------------------------
-- Arguments:
-- string - item name
--
-- Notes:
-- Checks if the item is one referenced by name in a leaderboard objective for any quest.
--
-- Example:
-- Quixote:IsQuestItem("Ghost Mushroom")
--
-- Returns:
-- * string - item name
-- * string - number of item you have
-- * string - number of item you need
--------------------------------------------
function Quixote:IsQuestItem(itemname)
	self:argCheck(itemname, 2, "string")
	if self.items[itemname] then
		return self.items[itemname]:match("(.+): (%d+)/(%d+)")
	end
end

--------------------------------------------
-- Notes:
-- Use to iterate over zones in which this character has quests.
-- Gives the localized of the zone, which can then be passed into Quixote:QuestsByZone.
--
-- Example:
-- for i, zone in quixote:IterZones() do ... end
--------------------------------------------
function Quixote:IterZones()
	return questIter, self.zones, 0
end

--------------------------------------------
-- Arguments:
-- string - zone name
--
-- Notes:
-- Use to iterate over quests in a given zone.  Argument is the localized zone name.
--
-- Example:
-- for i, questid in quixote:QuestsByZone(zone) do ... end
--------------------------------------------
function Quixote:QuestsByZone(zone)
	self:argCheck(zone, 2, "string")
	return questIter, self.quests_zone[zone], 0
end

--------------------------------------------
-- Notes:
-- Use to iterate over quests in order of level, from lowest to highest.
--
-- Example:
-- for i, questid in quixote:QuestsByLevel() do ... end
--------------------------------------------
function Quixote:QuestsByLevel()
	return questIter, self.quests_level, 0
end

--------------------------------------------
-- Notes:
-- Use to iterate over all quests.
-- Warning: works unlike the other quest iterators -- returns all quest details, instead of the quest id.
--
-- Example:
-- for id, title, level, tag, suggestedGroup, complete, numObjectives, zone in Quixote:IterateQuests() do ... end
--------------------------------------------
function Quixote:IterateQuests()
    return questGetItr, self, nil
end

--------------------------------------------
-- Arguments:
-- string/number- quest name OR quest id
--
-- Notes:
-- Get quest details, either by id or name.
--
-- Returns:
-- * string - quest title
-- * string - quest level
-- * string - quest tag
-- * number - number of players recommended (or nil)
-- * number - 1 if complete, -1 if failed, nil otherwise
-- * number - number of leaderboard objectives
-- * string - zone name
-- * number - quest id
--------------------------------------------
function Quixote:GetQuest(q)
	self:argCheck(q, 2, "string", "number")
	if type(q)=='number' then return self:GetQuestById(q)
	else return self:GetQuestByName(q) end
end

--------------------------------------------
-- Arguments:
-- number - quest id
--
-- Notes:
-- Get quest details, by id.
--
-- Returns:
-- * string - quest title
-- * string - quest level
-- * string - quest tag
-- * number - number of players recommended (or nil)
-- * number - 1 if complete, -1 if failed, nil otherwise
-- * number - number of leaderboard objectives
-- * string - zone name
-- * number - quest id
--------------------------------------------
function Quixote:GetQuestById(q)
	self:argCheck(q, 2, "number")
	local q = self.quests[q]
	if q then
		return q.title, q.level, q.tag, q.group, q.complete, #q.leaderboard, q.zone, q.id
	else
		return false
	end
end

--------------------------------------------
-- Arguments:
-- string - quest name
--
-- Notes:
-- Get quest details, by name.
--
-- Returns:
-- * string - quest title
-- * string - quest level
-- * string - quest tag
-- * number - number of players recommended (or nil)
-- * number - 1 if complete, -1 if failed, nil otherwise
-- * number - number of leaderboard objectives
-- * string - zone name
-- * number - quest id
--------------------------------------------
function Quixote:GetQuestByName(q)
	self:argCheck(q, 2, "string")
	if q:find('^%[') then q = select(3, q:find("^%[?%d*.?]?%s?(.*)")) end
	if self.quest_names[q] then
		return self:GetQuestById(self.quest_names[q])
	else
		return false
	end
end

--------------------------------------------
-- Notes:
-- Get the number of quests currently in the log
--
-- Returns:
-- * number - number of quests
-- * number - number of completed quests
--------------------------------------------
function Quixote:GetNumQuests()
	return self.numQuests, self.numQuestsDone
end

--------------------------------------------
-- Notes:
-- Get the number of objectives for a quest
--
-- Returns:
-- * number - number of objectives
-- * number - number of complete objectives
--------------------------------------------
function Quixote:GetNumQuestObjectives(q)
	self:argCheck(q, 2, "string", "number")
	if type(q)=='string' then q = self.quest_names[q] end
	if q and self.quests[q] then
		local objectives = self.quests[q].leaderboard
		local complete = 0
		for i, l in pairs(objectives) do
			if l.numGot == l.numNeeded then
				complete = complete + 1
			end
		end
		return #objectives, complete
	end
end

--------------------------------------------
-- Arguments:
-- number - quest id
-- number - leaderboard id
--
-- Notes:
-- Get quest objective details, by quest id and leaderboard number.  (Leaderboards are from 1 to numObjectives.)
--
-- Returns:
-- * string - description
-- * string - objective type (item, object, monster, reputation, event)
-- * string - number possessed
-- * string - number needed
-- * boolean - complete
--------------------------------------------
function Quixote:GetQuestStatusById(q, i)
	self:argCheck(q, 2, "number")
	self:argCheck(i, 3, "number")
	if self.quests[q] and self.quests[q].leaderboard[i] then
		local l = self.quests[q].leaderboard[i]
		return l.description, l.type, l.numGot, l.numNeeded, l.done
	end
end

--------------------------------------------
-- Arguments:
-- number/string - quest id OR quest name
--
-- Notes:
-- Get quest objective and description, either by id or name.
--
-- Returns:
-- * string - objective
-- * string - description
--------------------------------------------
function Quixote:GetQuestText(q)
	self:argCheck(q, 2, "string", "number")
	if type(q)=='string' then q = self.quest_names[q] end
	return self.quests[q].objective, self.quests[q].description
end

--------------------------------------------
-- Arguments:
-- number/string - quest id OR quest name
--
-- Notes:
-- Gets a unqiue ID for the given quest, this SHOULD be unique enough for each quest and persitable
--
-- Returns:
-- * string - unique id
--------------------------------------------
function Quixote:GetUniqueId(q)
	self:argCheck(q, 2, "string", "number")
	if type(q) == "string" then
		q = self.quest_names[q]
	end

	local quest = self.quests[q]
	if not quest then
		return false
	end

	if not quest.uqid then
		local uqid = string.format("QID:%s:%s:%s:%s:%s", hashstr(quest.title), quest.level, hashstr(quest.objective), hashstr(quest.description), hashstr(quest.zone))
		if (quest.longtag and string.len(quest.longtag) ~= 0) then
			uqid = string.format("%s:%s", uqid, hashstr(quest.longtag))
		end

		quest.uqid = uqid
	end

	return quest.uqid;
end

--------------------------------------------
-- Arguments:
-- number/string - quest id OR quest name
--
-- Notes:
-- Gets a quest based on it's unique id, if we can't find the quest then false is returned.
--
-- Returns:
-- * string - quest title
-- * string - quest level
-- * string - quest tag
-- * number - number of players recommended (or nil)
-- * number - 1 if complete, -1 if failed, nil otherwise
-- * number - number of leaderboard objectives
-- * string - zone name
-- * number - quest id
--------------------------------------------
function Quixote:GetQuestByUniqueId(uqid)
	self:argCheck(uqid, 2, "string")
	for id, q in self.quests do
		if q.uqid and q.uqid == uqid then
			return self:GetQuestById(id)
		end
	end

	return false;
end

--------------------------------------------
-- Arguments:
-- number/string - quest id OR quest name
--
-- Notes:
-- Gets the long tag text (the text as provided by blizard)
--
-- Returns:
-- * string - long tag
--------------------------------------------
function Quixote:GetLongTag(quest)
	self:argCheck(quest, 2, "string", "number")
	if type(quest)=='string' then 
		quest = self.quest_names[q]
	end
	if not self.quests[quest] then
		return ''
	end
	return self.quests[quest].longtag
end

--------------------------------------------
-- Arguments:
-- string - UnitName('partyX') or 'partyX'
--
-- Notes:
-- Checks whether a party member has Quixote
--
-- Returns:
-- * boolean - whether the party member has  quixote
--------------------------------------------
function Quixote:PartyMemberHasQuixote(name)
	if name:match('^party') then
		name = UnitName(name)
	end
	if self.party[name] then return true end
end

--------------------------------------------
-- Arguments:
-- string - UnitName('partyX') or 'partyX'
-- number/string - quest id OR quest name
--
-- Notes:
-- Checks whether a party member is on a given quest, as far as Quixote knows.  Only works for others with Quixote, or those in close range.
-- (Giving the quest id as the argument will only return info if the current character also has the quest.)
--
-- Returns:
-- * boolean - whether the party member has the quest
--------------------------------------------
function Quixote:PartyMemberHasQuest(name, quest)
	self:argCheck(name, 2, "string")
	self:argCheck(quest, 3, "string", "number")

	local unit, id
	if name:match('^party') then
		unit = name
		name = UnitName(name)
	end
	if type(quest) == 'number' then
		id = quest
		quest = self.quests[quest].title
	end
	
	if self.party[name] and self.party[name][quest] then
		return true
	else
		-- Fall back to IsUnitOnQuest if the other person doesn't have Quixote.
		if not unit then
			for i=1,GetNumPartyMembers() do
				local u = ("party%d"):format(i)
				if name == UnitName(u) then
					unit = u
				end
			end
		end

		if not id then
			local q = self.quest_names[quest]
			if q then
				id = self.quests[q].id
			end
		end
		if unit and id then
			return IsUnitOnQuest(id, unit)
		end
	end
end

--------------------------------------------
-- Arguments:
-- string - UnitName('partyX') or 'partyX'
--
-- Notes:
-- Iterate over the quests that a party member has.
--
-- Example:
-- for quest in quixote:IteratePartyQuests("Supakillarouge") do ... end
--------------------------------------------
function Quixote:IteratePartyQuests(name)
	if name:match('^party') then
		name = UnitName(name)
	end
	
	if not self.party[name] then return false end
	
	local tmp = new()
	for quest in pairs(self.party[name]) do
		tmp[#tmp+1] = quest
	end
	
	--table.sort(tmp, sortFunc)
	tmp.n = 0
	
	return partyQuestIter, tmp, nil
end

--------------------------------------------
-- Arguments:
-- string - UnitName('partyX') or 'partyX'
-- string - quest name
--
-- Notes:
-- Iterate over the leaderboard of a party member's quest
--
-- Example:
-- for description in quixote:IteratePartyQuestLeaderboard(player, quest) do print(description, quixote:GetPartyQuestStatus(player, quest, description)) end
--------------------------------------------
function Quixote:IteratePartyQuestLeaderboard(name, quest)
	if name:match('^party') then
		name = UnitName(name)
	end
	
	if not self.party[name] and not self.party[name][quest] then return false end
	
	local tmp = new()
	for desc in pairs(self.party[name][quest]) do
		tmp[#tmp+1] = desc
	end
	
	--table.sort(tmp, sortFunc)
	tmp.n = 0
	
	return partyQuestIter, tmp, nil
end

--------------------------------------------
-- Arguments:
-- string - UnitName('partyX') or 'partyX'
-- number/string - quest id OR quest name
-- string - description (as returned by :GetQuestStatusById)
--
-- Notes:
-- Get objective completion status of a party member's quest.  Only works for party members who have Quixote.
-- (Giving the quest id as the argument will only return info if the current character also has the quest.)
-- (The rest of the API may later be changed to behave slightly more like this function.  Moving away from the internal-game-ids approach, where possible.)
--
-- Returns:
-- * number - "numGot"
-- * number - "numNeeded"
--------------------------------------------
function Quixote:GetPartyQuestStatus(name, quest, objective)
	self:argCheck(name, 2, "string")
	self:argCheck(quest, 3, "string", "number")
	self:argCheck(objective, 4, "string") -- Make this allow number, too?
	if name:match('^party') then name = UnitName(name) end
	if type(quest) == 'number' and self.quests[quest] then quest = self.quests[quest].title end
	if self.party[name] and self.party[name][quest] and self.party[name][quest][objective] then
		return self.party[name][quest][objective][1], self.party[name][quest][objective][2]
	end
end

--------------------------------------------
-- Notes:
-- Get the number of objectives for a party member's quest
--
-- Returns:
-- * number - number of objectives
-- * number - number of complete objectives
--------------------------------------------
function Quixote:GetNumPartyQuestObjectives(name, quest)
	self:argCheck(name, 2, "string")
	self:argCheck(quest, 3, "string", "number")
	if name:match('^party') then name = UnitName(name) end
	if type(quest) == 'number' and self.quests[quest] then quest = self.quests[quest].title end
	if self.party[name] and self.party[name][quest] then
		local objectives = self.party[name][quest]
		local total = 0
		local complete = 0
		for desc, l in pairs(objectives) do
			total = total + 1
			if l[1] == l[2] then
				complete = complete + 1
			end
		end
		return total, complete
	end
end

-- Get a numeric equivalent to a reaction level, from Hated=1 to Exalted=8.
do
	local reactions = {
		[FACTION_STANDING_LABEL1] = 1,
		[FACTION_STANDING_LABEL1_FEMALE] = 1,
		[FACTION_STANDING_LABEL2] = 2,
		[FACTION_STANDING_LABEL2_FEMALE] = 2,
		[FACTION_STANDING_LABEL3] = 3,
		[FACTION_STANDING_LABEL3_FEMALE] = 3,
		[FACTION_STANDING_LABEL4] = 4,
		[FACTION_STANDING_LABEL4_FEMALE] = 4,
		[FACTION_STANDING_LABEL5] = 5,
		[FACTION_STANDING_LABEL5_FEMALE] = 5,
		[FACTION_STANDING_LABEL6] = 6,
		[FACTION_STANDING_LABEL6_FEMALE] = 6,
		[FACTION_STANDING_LABEL7] = 7,
		[FACTION_STANDING_LABEL7_FEMALE] = 7,
		[FACTION_STANDING_LABEL8] = 8,
		[FACTION_STANDING_LABEL8_FEMALE] = 8,
	}
	--------------------------------------------
	-- Arguments:
	-- string - faction standing text
	--
	-- Notes:
	-- Returns a numeric-equivalent for faction standings.
	--
	-- Returns:
	-- * number - number from 1 to 8 or -1 if invalid
	--------------------------------------------
	function Quixote:GetReactionLevel(leveltext)
		return leveltext and reactions[leveltext] or -1
	end
end

-- #NODOC
function Quixote:HasAnythingFuckedUpGetQuestLogTitle()
	return (select('#', GetQuestLogTitle(1)) < 7)
end

------------------------------------------------
-- Register!
------------------------------------------------

AceLibrary:Register(Quixote, MAJOR_VERSION, MINOR_VERSION, activate, nil, external)
