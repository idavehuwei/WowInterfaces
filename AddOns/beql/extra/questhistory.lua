if 1 == 2 then

local beql = LibStub("AceAddon-3.0"):GetAddon("beql")
local L = LibStub("AceLocale-3.0"):GetLocale("beql")
local charlist = AceLibrary("Dewdrop-2.0")
local filters = AceLibrary("Dewdrop-2.0")

beql.TimeSinceLastUpdate = 0
beql.AniType = ""

function beql:HistoryInit()
	local nowiam = UnitName("player").."-"..GetRealmName()
	local info = {
		type = 'group',
		args = {},
	}
	local i = 0
	charlist.value = nowiam
	beqlHistoryCharacterList:SetText(string.sub(nowiam,0,string.find(nowiam,"-")-1))	
	for k, v in pairs (beql.db.profile.QuestHistory) do 
		i = i +1
		info.args[i] = {
			type = 'toggle',
			name = k,
			desc = k,
			get = function() if charlist.value == k then return true else return false end end,
			set = function() charlist.value = k beqlHistoryCharacterList:SetText(string.sub(k,0,string.find(k,"-")-1)) beql:HistoryUpdate() end,
		}
	end
	charlist:Register(beqlHistoryCharacterList, 'children', function() charlist:FeedAceOptionsTable(info) end)
	
	filters.value2 = "all"
	beqlHistoryFilterButton:SetText("Show All")
	
	local filterinfo = {
		type = 'group',
		args = {
			all = {
				type = 'toggle',
				name = "Show All",
				desc = "Show All",
				get = function() if filters.value2 == "all" then return true else return false end end,
				set = function() filters.value2 = "all" beqlHistoryFilterButton:SetText("Show All") beql:HistoryUpdate() end,
			},
			completed = {
				type = 'toggle',
				name = "Completed Only",
				desc = "Completed Only",
				get = function() if filters.value2 == "completed" then return true else return false end end,
				set = function() filters.value2 = "completed" beqlHistoryFilterButton:SetText("Completed Only") beql:HistoryUpdate() end,
			},
			notcompleted = {
				type = 'toggle',
				name = "Not Completed Only",
				desc = "Not Completed Only",
				get = function() if filters.value2 == "notcompleted" then return true else return false end end,
				set = function() filters.value2 = "notcompleted" beqlHistoryFilterButton:SetText("Not Completed Only") beql:HistoryUpdate() end,
			},
			daily = {
				type = 'toggle',
				name = "Daily Only",
				desc = "Daily Only",
				get = function() if filters.value2 == "daily" then return true else return false end end,
				set = function() filters.value2 = "daily" beqlHistoryFilterButton:SetText("Daily Only") beql:HistoryUpdate() end,
			},
		},
	}
	filters:Register(beqlHistoryFilterButton, 'children', function() filters:FeedAceOptionsTable(filterinfo) end)
end


function beql:HistoryCharListClick()
	if charlist:IsOpen() then
		charlist:Close()
	else
		charlist:Open(beqlHistoryCharacterList)
	end
end

function beql:HistoryFilterClick()
	if filters:IsOpen() then
		filters:Close()
	else
		filters:Open(beqlHistoryFilterButton)
	end
end
-----

function beql:HistoryToggle()
	if beql.AniType ~= "" then return end
	if beqlHistoryFrame:IsShown() then
		beqlHistoryFrame:SetAlpha(1)
		beqlHistoryFrame:SetScale(1)
		beql.AniType = "FadeIn"
	else
		beqlHistoryFrame:Show()	
		beqlHistoryFrame:SetScale(0.01)
		beqlHistoryFrame:SetAlpha(0)
		beql.AniType = "FadeOut"
		beql:HistoryUpdate()
	end
end

function beql:HistoryAnimate(elapsed)

	if beql.AniType ~= "FadeIn" and beql.AniType ~= "FadeOut" then
		return
	end

	local alpha = 0
	local scale = 0

	beql.TimeSinceLastUpdate = beql.TimeSinceLastUpdate + elapsed

	if (beql.TimeSinceLastUpdate > 0.01) then
	
		if beql.AniType ~= "FadeIn" then
			alpha = beqlHistoryFrame:GetAlpha()
			alpha = alpha + 0.05
			scale = beqlHistoryFrame:GetScale()
			scale = scale + 0.05
			beqlHistoryFrame:SetAlpha(alpha)
			if scale > 1 then scale = 1 end
			beqlHistoryFrame:SetScale(scale)
			if alpha == 1 or alpha > 1 then
				beqlHistoryFrame:SetAlpha(1)
				beqlHistoryFrame:SetScale(1)
				beqlHistoryFrame:Show()
				beql.AniType = ""
			end
		else
			alpha = beqlHistoryFrame:GetAlpha()
			alpha = alpha - 0.05
			scale = beqlHistoryFrame:GetScale()
			scale = scale - 0.05			
			beqlHistoryFrame:SetAlpha(alpha)
			if scale < 0.01 then scale = 0.01 end
			beqlHistoryFrame:SetScale(scale)			
			if alpha == 0 or alpha < 0 then
				beqlHistoryFrame:SetAlpha(0)
				beqlHistoryFrame:SetScale(0.01)			
				beqlHistoryFrame:Hide()
				beql.AniType = ""
			end
		end

		beql.TimeSinceLastUpdate = 0
	end

end

function beql:HistoryScanLog()
	local nowiam = UnitName("player").."-"..GetRealmName()
	local zone
	local questid
	local qtitle, qlevel, qtag
	
	if beql.db.profile.QuestHistory[nowiam] == nil then
		beql.db.profile.QuestHistory[nowiam] = {} 
	end
	
	-- DB
		-- Char-Server
			-- Zone
				-- QuestName
					-- QuestID
					-- QLevel
					-- IsDaily -
					-- Tag
					-- Start Date
					-- Complete Date
					-- Start Pos
					-- Complete Pos
	
	for i, zone in beqlQ:IterZones() do 
		if beql.db.profile.QuestHistory[nowiam][zone] == nil then
			beql.db.profile.QuestHistory[nowiam][zone] = {}
		end
		for i, questid in beqlQ:QuestsByZone(zone) do 
			qtitle, qlevel, qtag = beqlQ:GetQuestById(questid)
			if beql.db.profile.QuestHistory[nowiam][zone][qtitle] == nil then
				beql.db.profile.QuestHistory[nowiam][zone][qtitle] = {}
				beql.db.profile.QuestHistory[nowiam][zone][qtitle].Level = qlevel
				beql.db.profile.QuestHistory[nowiam][zone][qtitle].StartDate = 0
				beql.db.profile.QuestHistory[nowiam][zone][qtitle].StartPos = 0
				beql.db.profile.QuestHistory[nowiam][zone][qtitle].EndPos = 0
				beql.db.profile.QuestHistory[nowiam][zone][qtitle].EndDate = 0
				beql.db.profile.QuestHistory[nowiam][zone][qtitle].XP = 0
				beql.db.profile.QuestHistory[nowiam][zone][qtitle].Rep = 0
				beql.db.profile.QuestHistory[nowiam][zone][qtitle].Tag = qtag
				if qtag == "y" then 
					beql.db.profile.QuestHistory[nowiam][zone][qtitle].Daily = true
				else
					beql.db.profile.QuestHistory[nowiam][zone][qtitle].Daily = false
				end
			end
		end
	end
end

function beql:HistoryUpdate()
	local questIndex
	local questHistory = beql.db.profile.QuestHistory[charlist.value]
	local i,k,v
	local ListFrame
	local qTag
	local scrolloffset
	local isCollapsed
	local i = 1
	local controli = 0

	FauxScrollFrame_Update(beqlHistoryListScrollFrame,beql:GetHistoryCount(),25,14)
	scrollofset = FauxScrollFrame_GetOffset(beqlHistoryListScrollFrame)
	
	for k, v in pairs (questHistory) do
		-- Print the Zones
		controli = controli + 1
		if controli > scrollofset then
			if i > 25 then 
				break 
			end
			ListFrame = getglobal("beqlQuestHistoryListFrame"..i)
			ListFrame:SetText(k)
			ListFrame:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
			ListFrame:Show()
			i = i +1
			if  questHistory[k].Collapsed  then
				ListFrame:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
			else
				ListFrame:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up"); 
			end					
		end

		-- Print the Quests in the Zone
		if not questHistory[k].Collapsed then
			for j, l in pairs (questHistory[k]) do
				if j ~= "Collapsed" then
					if (filters.value2 == "completed" and questHistory[k][j].EndDate and questHistory[k][j].EndDate ~= 0) 
					or (filters.value2 == "notcompleted" and not questHistory[k][j].EndDate or questHistory[k][j].EndDate == 0)
					or (filters.value2 == "daily" and questHistory[k][j].Tag == "y")
					or (filters.value2 == "all") then
					controli = controli + 1
					if controli > scrollofset then
						
						if i > 25 then 
							break 
						end
						ListFrame = getglobal("beqlQuestHistoryListFrame"..i)
						ListFrame:SetNormalTexture("")
						ListFrame:SetText("")
						if questHistory[k][j].Tag then
							qTag = string.upper(questHistory[k][j].Tag)
						else
							qTag = ""
						end
						ListFrame:SetText("  ["..questHistory[k][j].Level..qTag.."] "..j)
						ListFrame:SetTextColor(GetDifficultyColor(questHistory[k][j].Level).r,GetDifficultyColor(questHistory[k][j].Level).g,GetDifficultyColor(questHistory[k][j].Level).b)
						ListFrame:Show()	
						i = i +1		
						
					end
					end
				end
			end
		end
		
		
	end
	--Clean Up unused ID's
	for j = i, 25 ,1 do
		ListFrame = getglobal("beqlQuestHistoryListFrame"..j)
		ListFrame:Hide()
	end
end

function beql:QuestHistoryTitleClick(arg1)
	local Name = this:GetText()
	local questHistory = beql.db.profile.QuestHistory[charlist.value]
	beqlHistoryDetailFrame:Hide()
	if not questHistory[Name] then
		beql:ShowQuestDescription(Name)
		return
	end
	if questHistory[Name].Collapsed then
		questHistory[Name].Collapsed = false
	else
		questHistory[Name].Collapsed = true
	end
	beql:HistoryUpdate()
end

function beql:ShowQuestDescription(name)
	local questHistory = beql.db.profile.QuestHistory[charlist.value]
	local qTag
	
	for k, v in pairs (questHistory) do
		if not questHistory[k].Collapsed then
			for j, l in pairs (questHistory[k]) do
				if j ~= "Collapsed" then
					if questHistory[k][j].Tag then
						qTag = string.upper(questHistory[k][j].Tag)
					else
						qTag = ""
					end			
					if name == "  ["..questHistory[k][j].Level..qTag.."] "..j then
						beql:PopulateDetailData(questHistory[k][j],j)
					end
				end
			end
		end
	end	
end

function beql:PopulateDetailData(QuestData,Name)
	local qTag
	if QuestData.Tag then  
		qTag = string.upper(QuestData.Tag)
	else
		qTag = ""
	end
	beqlHistoryDetailLine1:SetText("Quest Name: "..Name)
	beqlHistoryDetailLine2:SetText("Level: "..QuestData.Level..qTag)
	beqlHistoryDetailLine3:SetText("Start Date: "..QuestData.StartDate)
	beqlHistoryDetailLine4:SetText("Start Position: "..QuestData.StartPos)
	beqlHistoryDetailLine5:SetText("Completed: ")
	beqlHistoryDetailLine6:SetText("End Date: ")
	beqlHistoryDetailLine7:SetText("End Pos: ")
	beqlHistoryDetailLine8:SetText("XP:")
	beqlHistoryDetailLine9:SetText("Rep:")
	beqlHistoryDetailLine10:SetText("")		
	-- Daily
	-- EndDate
	-- EndPos
	-- XP
	-- Rep
	beqlHistoryDetailFrame:Show()
end

function beql:GetHistoryCount()
	local questHistory = beql.db.profile.QuestHistory[charlist.value]
	local k,v,j,l
	local n = 0
	for k, v in pairs (questHistory) do
		n = n +1
		if not questHistory[k].Collapsed then
			for j, l in pairs (questHistory[k]) do
				if j ~= "Collapsed" then
					n = n +1
				end
			end
		end
	end
	return n
end

function Beql_ScrollFrame_Update()
	beql:HistoryUpdate()
end

end

-- EOF --