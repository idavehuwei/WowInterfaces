CCBreaker = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0","FuBarPlugin-2.0","AceConsole-2.0","AceDB-2.0")
local AceEvent = AceLibrary("AceEvent-2.0")
local CCLocale  = AceLibrary("AceLocale-2.2"):new("CCBreaker")
local CCTablet = AceLibrary("Tablet-2.0")
CCBreaker.revision = tonumber(string.find("$Revision$","%d+")) or 1

-- Database

CCBreaker:RegisterDB("DuowanAddon_CCBreakerDB","DuowanAddon_CCBreakerDBPC")

-- basic datastructures

local oddline = {
	['text']="",
	['text2']="",
	['text3']="",
	['text4']="",
	['textR']=1,
	['textG']=1,
	['textB']=1,
	['text2R']=1,
	['text2G']=1,
	['text2B']=1,
	['text3R']=1,
	['text3G']=1,
	['text3B']=1,
	['text4R']=1,
	['text4G']=1,
	['text4B']=1,
	['justify']="LEFT",
	['justify2']="LEFT",
	['justify3']="LEFT",
	['justify4']="LEFT",
}

local evenline = {
	['text']="",
	['text2']="",
	['text3']="",
	['text4']="",
	['textR']=0.7,
	['textG']=0.7,
	['textB']=0.7,
	['text2R']=0.7,
	['text2G']=0.7,
	['text2B']=0.7,
	['text3R']=0.7,
	['text3G']=0.7,
	['text3B']=0.7,
	['text4R']=0.7,
	['text4G']=0.7,
	['text4B']=0.7,
	['justify']="LEFT",
	['justify2']="LEFT",
	['justify3']="LEFT",
	['justify4']="LEFT",
}

--combat log locals
local CombatLog_Object_IsA = CombatLog_Object_IsA
local COMBATLOG_OBJECT_NONE = COMBATLOG_OBJECT_NONE
local COMBATLOG_OBJECT_REACTION_HOSTILE	= COMBATLOG_OBJECT_REACTION_HOSTILE or 0x00000040

local breakers = {}

local toUnitID = {}
local playerName = UnitName("player")

local should_UpdateToUnitID = false
local function UpdateToUnitID()
	should_UpdateToUnitID = false
	for k in pairs(toUnitID) do
		if k ~= playerName then
			toUnitID[k] = nil
		end
	end
	
	local numParty = GetNumPartyMembers()
	local numRaid = GetNumRaidMembers()
	if numRaid > 0 then
		for i = 1, numRaid do
			local unitID = "raidpet" .. i
			if UnitExists(unitID) then
				toUnitID[UnitName(unitID)] = unitID
			end
		end
		if UnitExists("pet") then
			toUnitID[UnitName("pet")] = "pet"
		end
		for i = 1, numRaid do
			local unitID = "raid" .. i
			toUnitID[UnitName(unitID)] = unitID
		end
	elseif numParty > 0 then
		for i = 1, numParty do
			local unitID = "partypet" .. i
			if UnitExists(unitID) then
				toUnitID[UnitName(unitID)] = unitID
			end
		end
		if UnitExists("pet") then
			toUnitID[UnitName("pet")] = "pet"
		end
		for i = 1, numParty do
			local unitID = "party" .. i
			toUnitID[UnitName(unitID)] = unitID
		end
	else
		if UnitExists("pet") then
			toUnitID[UnitName("pet")] = "pet"
		end
	end
end


-- table recycling
local breakertablecache ={}

local function RecycleBreakerTable()
	while #breakers > 0 do
		table.insert(breakertablecache, table.remove(breakers))
	end
end

local function GetBreakerTable()
	local t
	if #breakertablecache > 0 then
		t = table.remove(breakertablecache)
	else
		t = {}
	end
	return t
end

function CCBreaker:reset()
	self.lastBreaker = nil
	RecycleBreakerTable()
	self:UpdateText()
end

-- Initialisation

CCBreaker.hasIcon = true

function CCBreaker:OnInitialize()
	self.defaultMinimapPosition = 300
	self:RegisterEvent("RAID_ROSTER_UPDATE","UnitUpdate")
	self:RegisterEvent("PARTY_MEMBERS_CHANGED","UnitUpdate")
	self:RegisterEvent("UNIT_PET","UnitUpdate")
	self:RegisterEvent("PLAYER_PET_CHANGED","UnitUpdate")
	self:RegisterEvent("PLAYER_LOGIN","UnitUpdate")
	self:RegisterEvent("UNIT_NAME_UPDATE","UnitUpdate")
end

function CCBreaker:UnitUpdate()
	should_UpdateToUnitID = true
	UpdateToUnitID()
end

function CCBreaker:OnEnable()
	toUnitID[playerName]="player"
	self.raidid = 0
end

local ccb_enable = false;
function CCBreaker:Toggle(switch)
	if (switch) then
		if (not ccb_enable) then
			ccb_enable = true;
			self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "CrowdControlBroken");
		end
	else
		if (ccb_enable) then
			ccb_enable = false;
			self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");			
		end
	end
end

function CCBreaker:OnDisable()
end

-- Workload

function CCBreaker:Print(msg)
	local msg = CCLocale["CCBreaker"] .. tostring(msg);
	print(msg);
end

local function CreateText(info,textatt)
	local hlcolor
	local basecolor
	local text
	strings = textatt.strings
	if (strings.two =="") then
		strings.two = CCLocale["[spell] on [target] was removed"]
	end
	if (strings.three =="") then
		strings.three = CCLocale["[spell] on [target] was removed by [breaker]"]
	end
	if (strings.four =="") then
		strings.four = CCLocale["[spell] on [target] was removed by [breaker]'s [ability]"]
	end

	if textatt.colors then
		hlcolor = textatt.color.colortext
		basecolor = "|r"
	else 
		hlcolor = ""
		basecolor = ""
	end
	text = basecolor
	if info.sourceName then
	  if info.sourceAbilityName then
		  text = string.gsub(strings.four,"%[ability%]",hlcolor..info.sourceAbilityName..basecolor)
	  else
		  text = strings.three
	  end
	  text = string.gsub(text,"%[breaker%]",hlcolor..info.sourceName..basecolor)
	else
	  text = strings.two
	end
	text = string.gsub(text,"%[spell%]",hlcolor..info.recipientAbilityName..basecolor)
	text = string.gsub(text,"%[target%]",hlcolor..info.recipientName..basecolor)
	return text
end

local function DisplayConsole(info)
	if CCBreaker.db.char.display.console.enable then
		CCBreaker:Print(CreateText(info,CCBreaker.db.char.display.console))
	end
end

function DisplayCenter(info)
	if CCBreaker.db.char.display.center.enable then
		UIErrorsFrame:AddMessage(CreateText(info,CCBreaker.db.char.display.center),
			1.0, 1.0, 1.0, 5.0)
	end
end

function SendToChat(info)
	if (CCBreaker.db.char.chat.raid and GetNumRaidMembers() > 0) then
		SendChatMessage( CreateText(info,CCBreaker.db.char.chat),"RAID" ,nil ,nil)
	end
	if (CCBreaker.db.char.chat.raidwarning and GetNumRaidMembers()+GetNumPartyMembers() > 0)then
		SendChatMessage( CreateText(info,CCBreaker.db.char.chat),"RAID_WARNING" ,nil ,nil)
	end
	if (CCBreaker.db.char.chat.party and GetNumPartyMembers() > 0) then
		SendChatMessage( CreateText(info,CCBreaker.db.char.chat),"PARTY" ,nil ,nil)
	end
end

CCBreaker.filters={}
function CCBreaker.filters.unitfilter(filter,value)
	local id
	local name, class, role
	if value then
		unittype, unitnumber = string.match(value,"(%a*)(%d*)")
	else
		return filter.others
	end
	if ((not(unitnumber == "")) and UnitInRaid(value)) then
		name, _, _, _, _, class, _, _, _, role, _ = GetRaidRosterInfo(unitnumber)
	else
		if UnitInParty(value) then
			_,class = UnitClass(value)
			class = string.upper(class)
		end
	end
	

	
	local player = (unittype == "player")
	local party = (unittype == "party")
	local raid = (unittype == "raid")
	local pet = (unittype == "pet")
	local partypet = (unittype == "partypet")
	local raidpet = (unittype == "raidpet")
	
	-- I am in a raid
	if player and UnitInRaid(value) then
		local i = 0
		name, _, _, _, _, class, _, _, _, role, _ =  GetRaidRosterInfo(CCBreaker.raidid)
		if not(name == UnitName("player")) then
			i=1 --go search
		end
		if i >0 then
			local playername = UnitName("player")
			while i <= 40 do
				name, _, _, _, _, class, _, _, _, role, _ = GetRaidRosterInfo(i)
				if name == playername then
					CCBreaker.raidid = i
					i = 40
				end
				i=i+1
			end
		end
	end
	-- finaly got my role for sure
	local typevalue = (  --check
		( player and (filter.player)) or
		( party and (filter.party)) or
		( raid and (filter.raid)) or
		( pet and (filter.pet)) or
		( partypet and (filter.partypet)) or
		( raidpet and (filter.raidpet)) or
		(not (player or party or raid or pet or partypet or raidpet) and filter.others)
		)
	local classvalue = ( --check
		(filter.warrior and class == "WARRIOR") or
		(filter.warlock and class == "WARLOCK") or
		(filter.hunter and class == "HUNTER") or
		(filter.mage and class == "MAGE") or
		(filter.priest and class == "PRIEST") or
		(filter.druid and class == "DRUID") or
		(filter.paladin and class == "PALADIN") or
		(filter.shaman and class == "SHAMAN") or
		(filter.rogue and class == "ROGUE") or 
		(class == nil))
	local rolevalue =  not(((not filter.maintank) and role == "MAINTANK") or
			((not filter.mainassist) and role == "MAINASSIST"))
	return (typevalue and classvalue and rolevalue)
end

CCBreaker.PolyId={
	[118]=true, -- Polymorph (rank 1)
	[12824]=true, -- Polymorph (rank 2)
	[12825]=true, -- Polymorph (rank 3)
	[12826]=true, -- Polymorph (rank 4)
	[28272]=true, -- Polymorph (rank 1:pig)
	[28271]=true, -- Polymorph (rank 1:turtle)
}

CCBreaker.ShackleId={
	[9484]=true, -- Shackle Undead (rank 1)
	[9485]=true, -- Shackle Undead (rank 2)
	[10955]=true, -- Shackle Undead (rank 3)
}

CCBreaker.FreezingTrapId={
	[3355]=true, -- Freezing Trap Effect (rank 1)
	[14308]=true, -- Freezing Trap Effect (rank 2)
	[14309]=true, -- Freezing Trap Effect (rank 3)
}

CCBreaker.HibernateId={
	[2637]=true, -- Hibernate (rank 1)
	[18657]=true, -- Hibernate (rank 2)
	[18658]=true, -- Hibernate (rank 3)
}

CCBreaker.SapId={
	[6770]=true, -- Sap (rank 1)
	[2070]=true, -- Sap (rank 2)
	[11297]=true, -- Sap (rank 3)
}

CCBreaker.SeductionId={
	[6358]=true, -- Seduction (succubus)
}

local PolyId = CCBreaker.PolyId
local ShackleId = CCBreaker.ShackleId
local FreezingTrapId = CCBreaker.FreezingTrapId
local HibernateId = CCBreaker.HibernateId
local SapId = CCBreaker.SapId
local SeductionId = CCBreaker.SeductionId

function CCBreaker.filters.showeffects(showeffects,spellid)

	return (ShackleId[spellid] and showeffects.shackleundead) or
		   (HibernateId[spellid] and showeffects.hibernate) or
		   (SapId[spellid] and showeffects.sap) or
		   (PolyId[spellid] and showeffects.polymorph) or
		   (FreezingTrapId[spellid] and showeffects.freezingtrap)

--[[	return (((spell == CCBabble["Shackle Undead"]) and (showeffects.shackleundead)) or
		((spell == CCBabble["Hibernate"]) and (showeffects.hibernate)) or
		((spell == CCBabble["Sap"]) and (showeffects.sap)) or
		((spell == CCBabble["Seduction"]) and (showeffects.seduction)) or
		(((spell == CCBabble["Polymorph"]) or (spell == CCBabble["Polymorph: Pig"]) 
			or (spell == CCBabble["Polymorph: Turtle"])) and (showeffects.polymorphor
		((spell == CCBabble["Freezing Trap Effect"]) and (showeffects.freezingtrap)))]]
end



function CCBreaker:filter(info)
	local filters = self.filters
	local sourceid
	local targetid

	local db	= self.db.char
	local spell	= info.recipientAbilityName
	local showfrom	= self.db.char.showfrom
	
	return (
		-- "Show on" filter 
		filters.unitfilter(db.showon,info.recipientID) and
		-- "Show From" filter
		filters.unitfilter(db.showfrom,info.sourceID) and
		-- "Show Effect" filter
		filters.showeffects(db.showeffects,info.recipientAbilityId)
	)
end

function CCBreaker:OnTextUpdate()
	local text = {}
	local lastbreaker = self.lastBreaker
	local fubar = self.db.char.display.fubar
	if ((lastbreaker == nil) or not
		(fubar.spell or 
		fubar.target or
		fubar.breaker or
		fubar.ability
		))then 
		table.insert(text,"CCBreaker")
	else
		if fubar.spell then 
			table.insert(text,lastbreaker.spell)
		end
		if fubar.target then
			table.insert(text,lastbreaker.target)
		end
		if (fubar.breaker and not (lastbreaker.breaker=="")) then
			table.insert(text,lastbreaker.breaker)
		end
		if (fubar.ability and not (lastbreaker.ability=="")) then
			table.insert(text,lastbreaker.ability)
		end
	end 
		self:SetText(table.concat(text,"|"))
end



function CCBreaker:OnTooltipUpdate()
	local cat = CCTablet:AddCategory(
		'text',"",
		'columns', 4
	)
	
	cat:AddLine(
		'text', CCLocale["spell"],
		'text2',CCLocale["target"],
		'text3',CCLocale["breaker"],
		'text4',CCLocale["ability"],
		'textR',0,
		'textG',1,
		'textB',0,
		'text2R',0,
		'text2G',1,
		'text2B',0,
		'text3R',0,
		'text3G',1,
		'text3B',0,
		'text4R',0,
		'text4G',1,
		'text4B',0,
		'justify',"LEFT",
		'justify2',"LEFT",
		'justify3',"LEFT",
		'justify4',"LEFT"
	)

	local isodd = true
	local current
	
	for i=1, #breakers do
		if isodd then current = oddline else current = evenline end
		isodd = not isodd
		current['text'] = breakers[#breakers+1-i].spell
		current['text2'] = breakers[#breakers+1-i].target
		current['text3'] = breakers[#breakers+1-i].breaker
		current['text4'] = breakers[#breakers+1-i].ability
		cat:AddLine(current)
	end
	
	CCTablet:SetHint(CCLocale["Rightclick for options"])
end

function CCBreaker:CrowdControlBroken(
	_,
	eventType,
	sourceGUID,
	sourceName,
	_,
	destGUID,
	destName,
	destFlags,
	spellId,
	spellName,
	_,
	extraSpellId,
	extraSpellName
)
	if eventType == "SPELL_AURA_BROKEN" or eventType == "SPELL_AURA_BROKEN_SPELL" then
		local info = {
			["recipientID"] = toUnitID[recipientName],
			["recipientName"] = destName,
			["recipientAbilityName"] = spellName,
			["recipientAbilityId"] = spellId,
			["sourceID"] = toUnitID[sourceName],
			["sourceName"] = sourceName,
			["sourceAbilityName"] = extraSpellName,
			["sourceAbilityId"] = extraSpellId,
		}
		if CCBreaker.db.char.debug then
			CCBreaker:PrintLiteral(info)
			CCBreaker:PrintLiteral(CCBreaker:filter(info))
			CCBreaker:PrintLiteral(toUnitID)
			--self:PrintLiteral(self.db.char.display.console)
		end

		if CCBreaker:filter(info) then
			DisplayConsole(info)
			DisplayCenter(info)
			SendToChat(info)
			
			--tooltip
			local breaker = GetBreakerTable()
			if (info.recipientAbilityName) then 
				breaker.spell = info.recipientAbilityName
			else
				breaker.spell = ""
			end
			
			if (info.recipientName) then 
				breaker.target = info.recipientName
			else
				breaker.target = ""
			end
			
			if (info.sourceAbilityName) then 
				breaker.ability = info.sourceAbilityName
			else
				breaker.ability = ""
			end
			
			if (info.sourceName) then 
				breaker.breaker = info.sourceName
			else
				breaker.breaker = ""
			end
			table.insert(breakers,breaker)
			self.lastBreaker = breaker
			self:UpdateText()
		end
	end
end