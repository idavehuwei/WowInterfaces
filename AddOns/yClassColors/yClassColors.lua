--[[
	Copyright (c) 2008-2010 yleaf (yaroot@gmail.com)
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
]]

--------------------------------------------------------------------------
local enable_friendslist = true
local enable_friendslist_wowfriendswhitetext = true
local enable_friendslist_wowcrossrealmfriend = true
local enable_guildlist = true
local enable_lfrlist = true
local enable_wholist = true
local enable_bgscoreboard = true
--------------------------------------------------------------------------


local GUILD_INDEX_MAX = 12
local SMOOTH = {
	1, 0, 0,
	1, 1, 0,
	0, 1, 0,
}
local myName = UnitName'player'

local BC = {}
for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
	BC[v] = k
end
for k, v in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
	BC[v] = k
end

local RAID_CLASS_COLORS = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS

local function Hex(r, g, b)
	if(type(r) == 'table') then
		if(r.r) then r, g, b = r.r, r.g, r.b else r, g, b = unpack(r) end
	end
	
	if(not r or not g or not b) then
		r, g, b = 1, 1, 1
	end
	
	return format('|cff%02x%02x%02x', r*255, g*255, b*255)
end

-- http://www.wowwiki.com/ColorGradient
local function ColorGradient(perc, ...)
	if perc >= 1 then
		local r, g, b = select(select('#', ...) - 2, ...)
		return r, g, b
	elseif perc <= 0 then
		local r, g, b = ...
		return r, g, b
	end
	
	local num = select('#', ...) / 3

	local segment, relperc = math.modf(perc*(num-1))
	local r1, g1, b1, r2, g2, b2 = select((segment*3)+1, ...)

	return r1 + (r2-r1)*relperc, g1 + (g2-g1)*relperc, b1 + (b2-b1)*relperc
end

--GuildControlGetNumRanks()
--GuildControlGetRankName(index)
local guildRankColor = setmetatable({}, {
	__index = function(t, i)
		if i then
			t[i] = {ColorGradient(i/GUILD_INDEX_MAX, unpack(SMOOTH))}
		end
		return i and t[i] or {1,1,1}
	end
})

local diffColor = setmetatable({}, {
	__index = function(t,i)
		local c = i and GetQuestDifficultyColor(i)
		if not c then return '|cffffffff' end
		t[i] = Hex(c)
		return t[i]
	end
})

local classColorHex = setmetatable({}, {
	__index = function(t,i)
		local c = i and RAID_CLASS_COLORS[BC[i] or i]
		if not c then return '|cffffffff' end
		t[i] = Hex(c)
		return t[i]
	end
})

local classColors = setmetatable({}, {
	__index = function(t,i)
		local c = i and RAID_CLASS_COLORS[BC[i] or i]
		if not c then return {1,1,1} end
		t[i] = {c.r, c.g, c.b}
		return t[i]
	end
})

if CUSTOM_CLASS_COLORS then
	local function callBack()
		wipe(classColorHex)
		wipe(classColors)
	end
	CUSTOM_CLASS_COLORS:RegisterCallback(callBack)
end

if(enable_friendslist) then
    local WHITE = {r = 1, g = 1, b = 1}
    local FRIENDS_LEVEL_TEMPLATE = FRIENDS_LEVEL_TEMPLATE:gsub('%%d', '%%s')
    FRIENDS_LEVEL_TEMPLATE = FRIENDS_LEVEL_TEMPLATE:gsub('%$d', '%$s') -- '%2$s %1$d-го уровня'
    hooksecurefunc(FriendsFrameFriendsScrollFrame, 'buttonFunc', function(button, index, fristButton)
        local height
        local nameText
        local infoText
        local nameColor
        local playerArea = GetRealZoneText()

        if(button.buttonType == FRIENDS_BUTTON_TYPE_WOW) then
            local name, level, class, area, connected, status, note = GetFriendInfo(button.id)
            if(connected) then
               nameText = classColorHex[class] .. name .. "|r, " .. format(FRIENDS_LEVEL_TEMPLATE, diffColor[level] .. level .. '|r', class)
               nameColor = WHITE
               if(area == playerArea) then
                    infoText = format('|cff00ff00%s|r', area)
                end
            end
        elseif(button.buttonType == FRIENDS_BUTTON_TYPE_BNET) then
            local presenceID, givenName, surname, toonName, toonID, client, isOnline, lastOnline, isAFK, isDND, messageText, noteText = BNGetFriendInfo(button.id)
            if(isOnline and client==BNET_CLIENT_WOW) then
                local hasFocus, toonName, client, realmName, faction, race, class, guild, zoneName, level, gameText, broadcastText, broadcastTime = BNGetToonInfo(toonID)
                if(givenName and surname and toonName) then
                    if(enable_friendslist_wowcrossrealmfriend or CanCooperateWithToon(toonID)) then
                        nameText = format(BATTLENET_NAME_FORMAT, givenName, surname) ..' '.. FRIENDS_WOW_NAME_COLOR_CODE .. '(' .. classColorHex[class] .. toonName .. FRIENDS_WOW_NAME_COLOR_CODE .. ')'
                        if(zoneName == playerArea) then
                            infoText = format('|cff00ff00%s|r', zoneName)
                        end
                    end
                end
            end
        end
       if(nameText) then
           button.name:SetText(nameText)
       end
       if(nameColor and enable_friendslist_wowfriendswhitetext) then
           button.name:SetTextColor(nameColor.r, nameColor.g, nameColor.b)
       end
       if(infoText) then
           button.info:SetText(infoText)
       end
    end)
end

if(enable_guildlist) then
    hooksecurefunc('GuildStatus_Update', function()
        local playerArea = GetRealZoneText()
        
        if ( FriendsFrame.playerStatusFrame ) then
            local guildOffset = FauxScrollFrame_GetOffset(GuildListScrollFrame)
            local guildIndex
            
            for i=1, GUILDMEMBERS_TO_DISPLAY, 1 do
                guildIndex = guildOffset + i
                local name, rank, rankIndex, level, class, zone, note, officernote, online, status, classFileName = GetGuildRosterInfo(guildIndex)
                if not name then return end
                if online then
                    local nameText = getglobal('GuildFrameButton'..i..'Name')
                    local zoneText = getglobal('GuildFrameButton'..i..'Zone')
                    local levelText = getglobal('GuildFrameButton'..i..'Level')
                    local classText = getglobal('GuildFrameButton'..i..'Class')
                    
                    nameText:SetVertexColor(unpack(classColors[class]))
                    if playerArea == zone then
                        zoneText:SetFormattedText('|cff00ff00%s|r', zone)
                    end
                    levelText:SetText(diffColor[level] .. level)
                end
            end
        else
            local guildOffset = FauxScrollFrame_GetOffset(GuildListScrollFrame)
            local guildIndex
            
            for i=1, GUILDMEMBERS_TO_DISPLAY, 1 do
                guildIndex = guildOffset + i
                local name, rank, rankIndex, level, class, zone, note, officernote, online, status, classFileName = GetGuildRosterInfo(guildIndex)
                if not name then return end
                if online then
                    local nameText = getglobal('GuildFrameGuildStatusButton'..i..'Name')
                    nameText:SetVertexColor(unpack(classColors[class]))
                    
                    local rankText = getglobal('GuildFrameGuildStatusButton'..i..'Rank')
                    rankText:SetVertexColor(unpack(guildRankColor[rankIndex]))
                end
            end
        end
    end)
end

if(enable_wholist) then
    hooksecurefunc('WhoList_Update', function()
        local whoIndex
        local whoOffset = FauxScrollFrame_GetOffset(WhoListScrollFrame)
        
        local playerZone = GetRealZoneText()
        local playerGuild = GetGuildInfo'player'
        local playerRace = UnitRace'player'
        
        for i=1, WHOS_TO_DISPLAY, 1 do
            whoIndex = whoOffset + i
            local nameText = getglobal('WhoFrameButton'..i..'Name')
            local levelText = getglobal('WhoFrameButton'..i..'Level')
            local classText = getglobal('WhoFrameButton'..i..'Class')
            local variableText = getglobal('WhoFrameButton'..i..'Variable')
            
            local name, guild, level, race, class, zone, classFileName = GetWhoInfo(whoIndex)
            if not name then return end
            if zone == playerZone then
                zone = '|cff00ff00' .. zone
            end
            if guild == playerGuild then
                guild = '|cff00ff00' .. guild
            end
            if race == playerRace then
                race = '|cff00ff00' .. race
            end
            local columnTable = { zone, guild, race }
            
            nameText:SetVertexColor(unpack(classColors[class]))
            levelText:SetText(diffColor[level] .. level)
            variableText:SetText(columnTable[UIDropDownMenu_GetSelectedID(WhoFrameDropDown)])
        end
    end)
end

if(enable_lfrlist) then
    hooksecurefunc('LFRBrowseFrameListButton_SetData', function(button, index)
        local name, level, areaName, className, comment, partyMembers, status, class, encountersTotal, encountersComplete, isLeader, isTank, isHealer, isDamage = SearchLFGGetResults(index)
        
        local c = class and classColors[class]
        if c then
            button.name:SetTextColor(unpack(c))
            button.class:SetTextColor(unpack(c))
        end
        if level then
            button.level:SetText(diffColor[level] .. level)
        end
    end)
end

if(enable_bgscoreboard) then
    hooksecurefunc('WorldStateScoreFrame_Update', function()
        local inArena = IsActiveBattlefieldArena()
        for i = 1, MAX_WORLDSTATE_SCORE_BUTTONS do
            local index = FauxScrollFrame_GetOffset(WorldStateScoreScrollFrame) + i
            local name, killingBlows, honorableKills, deaths, honorGained, faction, rank, race, class, classToken, damageDone, healingDone = GetBattlefieldScore(index)
            -- faction: Battlegrounds: Horde = 0, Alliance = 1 / Arenas: Green Team = 0, Yellow Team = 1
            if name then
                local n, r = strsplit('-', name, 2)
                n = classColorHex[classToken] .. n .. '|r'
                if n == myName then
                    n = '> ' .. n .. ' <'
                end
                
                if r then
                    local color
                    if inArena then
                        if faction == 1 then
                            color = '|cffffd100'
                        else
                            color = '|cff19ff19'
                        end
                    else
                        if faction == 1 then
                            color = '|cff00adf0'
                        else
                            color = '|cffff1919'
                        end
                    end
                    r = color .. r .. '|r'
                    n = n .. '|cffffffff-|r' .. r
                end
                
                local buttonNameText = getglobal('WorldStateScoreButton' .. i .. 'NameText')
                buttonNameText:SetText(n)
            end
        end
    end)
end


