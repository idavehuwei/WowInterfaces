local beql = LibStub("AceAddon-3.0"):GetAddon("beql")
local L = LibStub("AceLocale-3.0"):GetLocale("beql")

local GameTooltip = GameTooltip

local hooked
local oldheight = 0

local GameTooltipQuests = {}

local function RGBPercToHex(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return string.format("%02x%02x%02x", r*255, g*255, b*255)
end

--------------------------------------------
-- Notes:
-- Init the Tooltips for beql
--
-- Returns:
-- * nothing
--------------------------------------------
function beql:InitTooltip()
	if not hooked then
		-- do some GameTooltip hooks
		GameTooltip:HookScript("OnShow", beql.GameTooltip_OnShow)
		GameTooltip:HookScript("OnTooltipSetItem", beql.GameTooltip_OnTooltipSetItem)
		GameTooltip:HookScript("OnTooltipSetUnit", beql.GameTooltip_OnTooltipSetUnit)
		hooked = true
	end


	-- Init Tracker Tooltips
	if QuestWatchFrame then
		QuestWatchFrame:SetScript("OnMouseDown",
			function()
				if not beql.db.char.saved.minimizedtracker then
					beql:TrackerClick()
				end
			end
		)

		QuestWatchFrame:SetScript("OnUpdate", function()
			if not MouseIsOver(QuestWatchFrame) and beql.db.char.saved.tooltipset then
				ResetCursor()
				GameTooltip:FadeOut()
				beql.db.char.saved.tooltipset = false
			end
			if MouseIsOver(QuestWatchFrame) then
				beql:TrackerTooltip()
			end
		end)
	end
end


function beql.GameTooltip_OnShow(this)
	if not beqlQ or not beql:IsActive() or not beql.db.profile.tooltipmob then
		-- not need
		return
	end

	-- not a mob, item or spell, may an object, check it for queststrings
	if not GameTooltip:GetUnit() and not GameTooltip:GetItem() and not GameTooltip:GetSpell() and GameTooltip:NumLines() > 0 and GameTooltip:IsShown() then
		if beql:ScanGameTooltip() then
			local maxwidth = 0
			for i=1, GameTooltip:NumLines() do
				maxwidth = max(getglobal("GameTooltipTextLeft" .. i):GetWidth(), maxwidth)
			end

			-- adjust width
			if (GameTooltip:GetWidth() - maxwidth) < 20 then
				GameTooltip:SetWidth(maxwidth + 20.48)
			end
		end
	end
end

--------------------------------------------
-- Notes:
-- Scans Tooltip for any Quests
--
-- Returns:
-- * boolean - true if found a quest
--------------------------------------------
function beql:ScanGameTooltip()
	GameTooltipQuests = {}
	local found, qstat = false, false
	local questline
	local line, hexcolor, linetext
	local qID, qTitle, qLvl, qTag, _
	local color = {}
	local Color = {}
	for i= 1, GameTooltip:NumLines() do
		if i > 1 then
			line = getglobal("GameTooltipTextLeft" .. i)
			Color.r, Color.g, Color.b, Color.a = line:GetTextColor()
			hexcolor = RGBPercToHex(Color.r, Color.g, Color.b)
			if (hexcolor == "fed100" or hexcolor == 'fefefe') then
				-- may a Quest
				linetext = line:GetText()
				for key, quest in pairs(beqlQ.quests) do
					-- search quest by name
					if quest.title == linetext then
						-- Quest found!
						found = true
						qstat = true
						qID = key;
						table.insert(GameTooltipQuests, qID)
						_, _ , qTitle, qLvl, _, _, _, _, _, _ = beqlQ:GetQuestByUid(qID)

						if beql.db.profile.TooltipItemFade then
							-- color.r, color.g, color.b = GetQuestDifficultyColor(qLvl).r, GetQuestDifficultyColor(qLvl).g , GetQuestDifficultyColor(qLvl).b
							color.r, color.g, color.b = GetDifficultyColor(qLvl).r, GetDifficultyColor(qLvl).g , GetDifficultyColor(qLvl).b
						else
							color.r, color.g, color.b  = beql.db.profile.Color.ColorMobTooltip.r, beql.db.profile.Color.ColorMobTooltip.g, beql.db.profile.Color.ColorMobTooltip.b
						end
						--line:SetTextColor(color.r, color.g, color.b)
						if beql.db.profile.showlevel then
								qTag = " [" .. qLvl .. string.upper(beqlQ:GetShortTagForQuest(qID)).."] "
						else
								qTag = " "
						end
					end
				end

				if qstat and (hexcolor == "fed100" or hexcolor == 'fefefe') then
					if linetext == qTitle then
						-- Questtitle
						line:SetText(qTag .. line:GetText())-- .. " (QuestId: " .. tostring(key) .. ")")
						line:SetTextColor(color.r, color.g, color.b)

					elseif hexcolor == 'fefefe' and strmatch(linetext, " - ") then
						-- Objective
						line:SetText(" " .. line:GetText())
						line:SetTextColor(color.r, color.g, color.b)
					else
						-- quest has ended
						qstat = false
					end
				else
					qstat = false
				end

			end
		end
		line, linetext, hexcolor = nil, nil, nil;
	end
	return found
end

--------------------------------------------
-- Notes:
-- Adds a Quest on Questmob if not exists
--
-- Returns:
-- * nothing
--------------------------------------------
function beql:GameTooltip_OnTooltipSetUnit(skipscan)

	if not beqlQ or not beql:IsActive() or not beql.db.profile.tooltipmob then
		-- not need
		return
	end

	beql:ScanGameTooltip()

	local Color = {
		r = beql.db.profile.Color.ColorMobTooltip.r,
		g = beql.db.profile.Color.ColorMobTooltip.g,
		b = beql.db.profile.Color.ColorMobTooltip.b,
	}
	local uID
	local queryString = GameTooltip:GetUnit()
	if queryString then
		if beqlQ:IsQuestMob(queryString) then
			uID = beqlQ.quest_mobs[queryString]
		end
	end

	-- questmob not found, may we must "collect" the mob as item? (i.e. "Snowfall Glade Pup")
	if not uID and beqlQ:IsQuestItem(queryString) then
		uID = beqlQ:IsQuestItem(queryString)
	end

	if uID and type(uID) == 'number' then
		local found = false
		for _, qid in pairs (GameTooltipQuests) do
			if uID == qid then
				-- quest already in tooltip
				found = true
			end
		end
		if not found then

			local color = {}
			-- not in tooltip, add it
			local qID, _ , qTitle, qLvl, qTag, qObj, qStat, qRec, qdaily, qZone = beqlQ:GetQuestByUid(uID)

			-- color
			if beql.db.profile.TooltipItemFade then
				-- color.r, color.g, color.b = GetQuestDifficultyColor(qLvl).r, GetQuestDifficultyColor(qLvl).g , GetQuestDifficultyColor(qLvl).b
				color.r, color.g, color.b = GetDifficultyColor(qLvl).r, GetDifficultyColor(qLvl).g , GetDifficultyColor(qLvl).b
			else
				color.r, color.g, color.b = beql.db.profile.Color.ColorMobTooltip.r, beql.db.profile.Color.ColorMobTooltip.g, beql.db.profile.Color.ColorMobTooltip.b
			end

			if beql.db.profile.showlevel then
					qTag = " [" .. qLvl .. string.upper(beqlQ:GetShortTagForQuest(qID)).."] "
			else
					qTag = " "
			end

			GameTooltip:AddLine(qTag .. qTitle, color.r, color.g, color.b)
			for objname, objval in pairs(beqlQ.quest_objectives[uID]) do
				if objname == queryString then
					local objP, objN,_ = unpack(objval)
					GameTooltip:AddLine("  - " .. objname .. ": " .. objP .. "/" .. objN, color.r, color.g, color.b)
				end
			end

			-- perform a manual Tooltipupdate out of updatetime
			GameTooltip:GetScript("OnUpdate")(GameTooltip, 1)
		end
	end

end

--------------------------------------------
-- Notes:
-- Adds a Quest on Questitem if not exist
--
-- Returns:
-- * nothing
--------------------------------------------
function beql:GameTooltip_OnTooltipSetItem()
	if not beqlQ or not beql:IsActive() then
		-- not need
		return
	end

--		beql:ScanGameTooltip() -- may in future
	GameTooltipQuests = {}


	if beql.db.profile.tooltipitem then
		local Color = {
			r = beql.db.profile.Color.ColorItemTooltip.r,
			g = beql.db.profile.Color.ColorItemTooltip.g,
			b = beql.db.profile.Color.ColorItemTooltip.b,
		}
		local queryString = GameTooltip:GetItem()
		if queryString then
			if beqlQ:IsQuestItem(queryString) then

				local uID, objName, objP, objN, _ = beqlQ:IsQuestItem(queryString)
				local found = false
				if GameTooltipQuests and #GameTooltipQuests > 0 then
					for _, qid in pairs (GameTooltipQuests) do
						if uID == qid then
							-- quest already in tooltip
							found = true
						end
					end
				end
				if not found then
					local color = {}
					-- not in tooltip, add it
					local qID, _ , qTitle, qLvl, qTag, qObj, qStat, qRec, qdaily, qZone = beqlQ:GetQuestByUid(uID)

					-- color
					if beql.db.profile.TooltipItemFade then
						-- color.r, color.g, color.b = GetQuestDifficultyColor(qLvl).r, GetQuestDifficultyColor(qLvl).g , GetQuestDifficultyColor(qLvl).b
						color.r, color.g, color.b = GetDifficultyColor(qLvl).r, GetDifficultyColor(qLvl).g , GetDifficultyColor(qLvl).b
					else
						color.r, color.g, color.b = beql.db.profile.Color.ColorMobTooltip.r, beql.db.profile.Color.ColorMobTooltip.g, beql.db.profile.Color.ColorMobTooltip.b
					end

					if beql.db.profile.showlevel then
							qTag = " [" .. qLvl .. string.upper(beqlQ:GetShortTagForQuest(qID)).."] "
					else
							qTag = " "
					end

					GameTooltip:AddLine(qTag .. qTitle, color.r, color.g, color.b)
					GameTooltip:AddLine("  - " .. objName .. ": " .. objP .. "/" .. objN, color.r, color.g, color.b)
				end
			end
		end
	end
end

--------------------------------------------
-- Notes:
-- Handles klicks on Questtracker
--
-- Returns:
-- * nothing
--------------------------------------------
function beql:TrackerClick()
		if QuestWatchFrame.ismoving then
			return
		end
		if (not beql.db.char.saved.CurrentHoveredQuest or beql.db.char.saved.CurrentHoveredQuest <= 0) then
			return
		end
		if arg1 == "LeftButton" and beql.db.profile.activetrackerleft then
			if not IsShiftKeyDown() and IsControlKeyDown()  then
				if ChatFrameEditBox:IsVisible() then
					beql:AddQuestStatusToChatFrame(beql.db.char.saved.CurrentHoveredQuest)
				end
			else
				SelectQuestLogEntry(beql.db.char.saved.CurrentHoveredQuest)
				if( not QuestLogFrame:IsVisible() ) then
					ShowUIPanel(QuestLogFrame)
				else
					QuestLog_Update()
					QuestLog_UpdateQuestDetails(1)
				end
				if beql.db.char.saved.minimized then
					beql:Maximize()
				end
			end
		elseif arg1 == "RightButton" and beql.db.profile.activetrackerright then
			if beql.db.char.saved.tooltipset then
				ResetCursor()
				GameTooltip:FadeOut()
				beql.db.char.saved.tooltipset = false
			end
			RemoveQuestWatch(beql.db.char.saved.CurrentHoveredQuest)
			QuestLog_Update()
			WatchFrame_Update()
		end
end

--------------------------------------------
-- Notes:
-- Shows Tooltip on Questtracker
--
-- Returns:
-- * nothing
--------------------------------------------
function beql:TrackerTooltip()
		if not MouseIsOver(QuestWatchFrame) or (GetMouseFocus() ~= QuestWatchFrame) then
			return
		end
		local qid = 0
		local textline = 0
		local watchLine
		local x, y = GetCursorPosition()
		local s = QuestWatchFrame:GetEffectiveScale()
		x,y = x/s, y/s

		-- search actual line
		for i, watchLine in pairs(beql.QuestLines) do
			if not(watchLine == nil) and not (watchLine:GetLeft() == nil) then
				if (watchLine:IsVisible()) then
					local l, r, t, b = watchLine:GetLeft(), watchLine:GetRight(), watchLine:GetTop(), watchLine:GetBottom()
					if ( x <= r and x >= l and y <= t and y >= b ) then
						-- found !
						textline = i
						break;
					end
				end
			end
		end

		if not beql.db.char.TrackerQuests[textline] then
			beql.db.char.saved.CurrentHoveredQuest = nil;
			ResetCursor()
			GameTooltip:FadeOut()
			return;
		end

		if beql.db.char.TrackerQuests[textline] then
			ResetCursor()
			qid = beql.db.char.TrackerQuests[textline]
			local qTitle,qLvl,qTag,qRec,qStat,qObj,qZone,qID = beqlQ:GetQuest(qid)
			_, qID, qTitle, qLvl, _, _, _, _, _, _  = beqlQ:GetQuestByUid(qid)
			local oldSelection = GetQuestLogSelection()
			SelectQuestLogEntry(qID)
			local _, questObjectives = GetQuestLogQuestText()
			SelectQuestLogEntry(oldSelection)
			beql.db.char.saved.CurrentHoveredQuest = qID

			if beql.db.profile.activetracker then
				ShowInspectCursor()
				GameTooltip:SetOwner(QuestWatchFrame, "ANCHOR_CURSOR")
				if beql.db.profile.TooltipTitleDiff then
					-- Color = GetQuestDifficultyColor(qLvl)
					Color = GetDifficultyColor(qLvl)
				else
					Color = beql.db.profile.Color.TooltipQuestTitle
				end
				GameTooltip:AddLine(qTitle,Color.r,Color.g,Color.b)
				if beql.db.profile.activetrackerdesc then
					GameTooltip:AddLine(questObjectives,beql.db.profile.Color.TooltipDesc.r,beql.db.profile.Color.TooltipDesc.g,beql.db.profile.Color.TooltipDesc.b,1)
				end
				if beql.db.profile.activetrackerparty then
					if GetNumPartyMembers() > 0 then
						for i=1, GetNumPartyMembers(), 1 do
							local name = UnitName("party"..i)
							if beqlQ:PartyMemberHasQuest(name,qTitle) then
								if beqlQ:PartyMemberHasQuixote(name) then
									GameTooltip:AddLine(name,beql.db.profile.Color.TooltipPartyQuixote.r,beql.db.profile.Color.TooltipPartyQuixote.g,beql.db.profile.Color.TooltipPartyQuixote.b)
									for description in beqlQ:IteratePartyQuestLeaderboard(name, qTitle) do
										local oPos, oNeed = beqlQ:GetPartyQuestStatus(name, qTitle, description)
										if beql.db.profile.TooltipObjFade then
											Color = beql:FadeColors(beql.db.profile.Color.TooltipPartyObj,beql.db.profile.Color.TooltipPartyObjComp,oPos,oNeed)
										else
											if oPos == oNeed then
												Color = beql.db.profile.Color.TooltipPartyObjComp
											else
												Color = beql.db.profile.Color.TooltipPartyObj
											end
										end
										GameTooltip:AddDoubleLine("  "..description, oPos.."/"..oNeed,Color.r,Color.g,Color.b)
									end
								else
									GameTooltip:AddLine(name,beql.db.profile.Color.TooltipPartyNonQuixote.r, beql.db.profile.Color.TooltipPartyNonQuixote.g, beql.db.profile.Color.TooltipPartyNonQuixote.b)
								end
							end
						end
					end
				end
				GameTooltip:Show()
				beql.db.char.saved.tooltipset = true
			end
		else
			if beql.db.char.saved.tooltipset then
				ResetCursor()
				GameTooltip:FadeOut()
				beql.db.char.saved.tooltipset = false
			end
		end
end

--- EOF ---
