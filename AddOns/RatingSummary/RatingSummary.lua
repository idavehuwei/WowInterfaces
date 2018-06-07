local StatLogic = LibStub:GetLibrary("LibStatLogic-1.1")
local RatingSummaryEnable;
local function SetOrHookScript(frame, scriptName, func)
	if( frame:GetScript(scriptName) ) then
		frame:HookScript(scriptName, func);
	else
		frame:SetScript(scriptName, func);
	end
end

function RatingSummary_OnLoad(self)
	InspectFrame_LoadUI();
	RatingSummary_SetupHook();	
end

function RatingSummary_Toggle(switch)
	if (switch) then
		RatingSummaryEnable = true;
		RatingSummaryFrame:RegisterEvent("VARIABLES_LOADED");
		RatingSummaryFrame:RegisterEvent("UNIT_INVENTORY_CHANGED");
		RatingSummaryFrame:RegisterEvent("INSPECT_TALENT_READY");
		RatingSummaryFrame:RegisterEvent("INSPECT_HONOR_UPDATE");
		
	else
		RatingSummaryEnable = false;
		RatingSummaryFrame:UnregisterEvent("VARIABLES_LOADED");
		RatingSummaryFrame:UnregisterEvent("UNIT_INVENTORY_CHANGED");
		RatingSummaryFrame:UnregisterEvent("INSPECT_TALENT_READY");
		RatingSummaryFrame:UnregisterEvent("INSPECT_HONOR_UPDATE");
		
		RatingSummarySelfFrame:Hide();
		RatingSummaryTargetFrame:Hide();
	end
end

function RatingSummary_SetupHook()
	--3.1 failed
	--hooksecurefunc("PaperDollFrame_OnShow", RatingSummary_PaperDollFrame_OnShow);
	--hooksecurefunc("PaperDollFrame_OnHide", RatingSummary_PaperDollFrame_OnHide);
	--hooksecurefunc("InspectPaperDollFrame_OnShow", RatingSummary_InspectFrame_Show);
	--hooksecurefunc("InspectFrame_OnHide", RatingSummary_InspectFrame_OnHide);
	SetOrHookScript(PaperDollFrame, "OnShow", RatingSummary_PaperDollFrame_OnShow);
	SetOrHookScript(PaperDollFrame, "OnHide", RatingSummary_PaperDollFrame_OnHide);
	SetOrHookScript(InspectFrame, "OnShow", RatingSummary_InspectFrame_OnShow);
	SetOrHookScript(InspectFrame, "OnHide", RatingSummary_InspectFrame_OnHide);
end

function RatingSummary_Register()
	
end

function RatingSummary_CreateButton(buttonName, parentFrame, width, height, texture, TexCoords)
	local button = CreateFrame("Frame", buttonName, parentFrame or UIParent, "MagicResistanceFrameTemplate");
	
	button.texture = button:CreateTexture(nil, "BACKGROUND")	;
	button.texture:SetAllPoints(button);
	button.texture:SetTexture(texture);
	if TexCoords then
		button.texture:SetTexCoord(strsplit("|",TexCoords));
	end
	
	button.text = button:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall");
	button.text:SetPoint("BOTTOM", button, "BOTTOM", 0, 3);
	button.text:SetTextColor(1, 1, 1);
	button.text:SetText("0");
	
	return button;
end

function RatingSummary_CreateFrame(frameName, parentFrame, width, height, textNum, textL, textY)
	local textNum = textNum or 1;
	local textL = textL or 0; local textY = textY or -1; 
	local frame = CreateFrame("Frame", frameName, parentFrame or UIParent);
	frame:SetWidth(width);  frame:SetHeight(height);
	frame:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = {left = 5, right = 5, top = 5, bottom = 5}});
	frame:SetBackdropBorderColor(0.6, 0.7, 0.8, 0.4);
	frame:SetBackdropColor(0.2, 0.3, 0.4, 0.6);
	
	frame.title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall");
	frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 6, -4);
	frame.title:SetTextColor(0.6,0.8,0.2);

	for i = 1, textNum do
		frame["text"..i] = frame:CreateFontString(nil, "ARTWORK", "GameTooltipTextSmall");
		frame["text"..i]:SetPoint("TOPLEFT", frame["text"..(i-1)] or frame.title, "BOTTOMLEFT", (i == 1) and textL or 0, (i == 1) and -3 or textY);
		frame["text"..i]:SetTextColor(0.9,0.8,0.12);
		frame["stat"..i] = frame:CreateFontString(nil, "ARTWORK", "GameTooltipTextSmall");
		frame["stat"..i]:SetPoint("RIGHT", frame["text"..i], "LEFT", width - textL -14, 0);
		frame["stat"..i]:SetJustifyH("RIGHT");
		frame["stat"..i]:SetTextColor(0.9,0.9,0.9);
	end
	
	return frame
end

function RatingSummary_CreateMainFrame()
	--talent Frame
	local frame = RatingSummary_CreateFrame("RatingSummaryTalent", InspectPaperDollFrame, 110, 56, 2, 32, 0);
	frame:SetPoint("TOPLEFT", InspectPaperDollFrame, "TOPLEFT", 184, -260);
	frame.icon1 = frame:CreateTexture(nil, "BORDER");
	frame.icon1:SetWidth(24) frame.icon1:SetHeight(24);
	frame.icon1:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark");
	frame.icon1:SetPoint("TOPLEFT", frame.title, "BOTTOMLEFT", 2, -2);
	frame.title:SetText(RATING_SUMMARY_TALENT);
	frame.text2:SetTextColor(0.9,0.9,0.9);

	--pvp Frame
	frame = RatingSummary_CreateFrame("RatingSummaryPVP", InspectPaperDollFrame, 110, 68, 3, 2);
	frame:SetPoint("TOPLEFT", RatingSummaryTalent, "BOTTOMLEFT", 0, 2);
	frame.title:SetText("PvP:");
	
	--resistance	
	frame = CreateFrame("Frame", "RatingSummaryRES", InspectPaperDollFrame);
	frame:SetWidth(40); frame:SetHeight(1);
	frame:SetPoint("TOPRIGHT", InspectPaperDollFrame, "TOPLEFT", 297, -77);
	local texture = "Interface\\PaperDollInfoFrame\\UI-Character-ResistanceIcons"
	local TexCoords = {
		"0|1|0.2265625|0.33984375",
		"0|1|0|0.11328125",
		"0|1|0.11328125|0.2265625",
		"0|1|0.33984375|0.453125",
		"0|1|0.453125|0.56640625",}	
	local tooltip = {6, 2, 3, 4, 5};
	local formatText = string.gsub(RESISTANCE_TOOLTIP_SUBTEXT, "\n.+", "");
	
	for i = 1, 5 do
		frame["button"..i] = RatingSummary_CreateButton("RatingSummaryRESbutton"..i, frame, 20, 20, texture, TexCoords[i])
		frame["button"..i].tooltip = dwGetglobal("RESISTANCE" .. tooltip[i] .. "_NAME");
		frame["button"..i].tooltipSubtext = format(formatText, dwGetglobal("RESISTANCE_TYPE" .. tooltip[i]));
		frame["button"..i]:SetPoint("TOPRIGHT", dwGetglobal("RatingSummaryRESbutton" .. (i - 1)) or frame, "BOTTOMRIGHT", 0, -1);
	end
	--base effect
	frame = RatingSummary_CreateFrame("RatingSummaryBase", InspectPaperDollFrame, 110, 122, 7, 4)
	frame:SetPoint("TOPLEFT", InspectPaperDollFrame, "TOPLEFT", 73, -260)
	frame.title:SetText(RATING_SUMMARY_BASE)

	InspectModelFrame:SetHeight(200);

	-- refresh button
	local button = CreateFrame("Button", "RatingSummaryRefreshButton", InspectPaperDollFrame, "UIPanelButtonTemplate");
	button:SetWidth(60);
	button:SetHeight(25);
	button:SetText("刷 新");
	button:SetPoint("TOPRIGHT", InspectFrame, "TOPRIGHT", -40, -36);
	button:SetScript("OnClick", function()
		local unit = InspectFrame.unit or "target";
		if (CheckInteractDistance(unit, 1) and CanInspect(unit)) then
			InspectUnit(unit);
		end		
	end);
	button:SetScript("OnEnter", function(self)
		GameTooltip_SetDefaultAnchor(GameTooltip, self);
		GameTooltip:SetText("无法看到装备宝石时点击刷新", 1, 1, 1);
		GameTooltip:Show();
	end);
	button:SetScript("OnLeave", function(self)		
		GameTooltip:Hide();
	end);
end

dwAsynCall("Blizzard_InspectUI", "RatingSummary_CreateMainFrame");

function RatingSummary_UpdateTalentFrame()
	local name, iconTexture, point, point1, point2, point3
	point1 = select(3, GetTalentTabInfo(1,true,nil,GetActiveTalentGroup(true)));
	point2 = select(3, GetTalentTabInfo(2,true,nil,GetActiveTalentGroup(true)));
	point3 = select(3, GetTalentTabInfo(3,true,nil,GetActiveTalentGroup(true)));
	point = max(point1, point2, point3);
	if point == point1 then
		name, iconTexture = GetTalentTabInfo(1,true,nil,GetActiveTalentGroup(true));
	elseif point == point2 then
		name, iconTexture = GetTalentTabInfo(2,true,nil,GetActiveTalentGroup(true));
	elseif point == point3 then
		name, iconTexture = GetTalentTabInfo(3,true,nil,GetActiveTalentGroup(true));
	end	
	local frame = RatingSummaryTalent;
	frame.text1:SetText(name);
	frame.text2:SetFormattedText("%s/%s/%s", point1, point2, point3);
	frame.icon1:SetTexture(iconTexture);
end

function RatingSummary_ClearPVPFrame()
	local frame = RatingSummaryPVP
	frame.text1:SetFormattedText("%s |cffFFFFFF%s|r |cff666666%s|r", "2v2", "-", "-")
	frame.text2:SetFormattedText("%s |cffFFFFFF%s|r |cff666666%s|r", "3v3", "-", "-")
	frame.text3:SetFormattedText("%s |cffFFFFFF%s|r |cff666666%s|r", "5v5", "-", "-")
	if ( not HasInspectHonorData() ) then
		RequestInspectHonorData()
	else
		RatingSummary_OnEvent(nil, "INSPECT_HONOR_UPDATE");	
	end
end

function RatingSummary_UpdateMainFrame(sum)
	local frame;	

	RatingSummary_ClearPVPFrame();

	frame = RatingSummaryRES;
	frame.button1.text:SetText(sum["ARCANE_RES"] or 0);
	frame.button2.text:SetText(sum["FIRE_RES"] or 0);
	frame.button3.text:SetText(sum["NATURE_RES"] or 0);
	frame.button4.text:SetText(sum["FROST_RES"] or 0);
	frame.button5.text:SetText(sum["SHADOW_RES"] or 0);
	
	frame = RatingSummaryBase
	frame.text1:SetText(RATING_SUMMARY_STRENGTH);
	frame.text2:SetText(RATING_SUMMARY_AGILITY);
	frame.text3:SetText(RATING_SUMMARY_STAMINA);
	frame.text4:SetText(RATING_SUMMARY_INTELLECT);
	frame.text5:SetText(RATING_SUMMARY_SPIRIT);
	frame.text6:SetText(RATING_SUMMARY_RESILIENCE);
	frame.text7:SetText(RATING_SUMMARY_ARMOR);

	frame.stat1:SetText(sum["STR"] or 0);
	frame.stat2:SetText(sum["AGI"] or 0);
	frame.stat3:SetText(sum["STA"] or 0);
	frame.stat4:SetText(sum["INT"] or 0);
	frame.stat5:SetText(sum["SPI"] or 0);
	frame.stat6:SetText(sum["RESILIENCE_RATING"] or 0);
	frame.stat7:SetText(sum["ARMOR"] or 0);
end

function RatingSummary_OnEvent(self, event, ...)
	local arg1, arg2, arg3 = ...;

	if event == "VARIABLES_LOADED" then
		if RATING_SUMMARY_ANNOUNCE then DEFAULT_CHAT_FRAME:AddMessage(RATING_SUMMARY_ANNOUNCE) end
	end

	if (event == "INSPECT_HONOR_UPDATE") then
		local frame = RatingSummaryPVP
		for i = 1, MAX_ARENA_TEAMS do
			local _, teamSize, teamRating, _, _, _, playerRating = GetInspectArenaTeamData(i)
			if teamSize == 2 then
				frame.text1:SetFormattedText("%s |cffFFFFFF%s|r |cff666666%s|r", "2v2", teamRating, playerRating)
			elseif teamSize == 3 then
				frame.text2:SetFormattedText("%s |cffFFFFFF%s|r |cff666666%s|r", "3v3", teamRating, playerRating)
			elseif teamSize == 5 then
				frame.text3:SetFormattedText("%s |cffFFFFFF%s|r |cff666666%s|r", "5v5", teamRating, playerRating)
			end
		end
	end

	if  event == "UNIT_INVENTORY_CHANGED" then
		if ((arg1 == "player") and RatingSummarySelfFrame:IsVisible()) then
			RatingSummary_HideFrame(RatingSummarySelfFrame);
			if (RatingSummaryTargetFrame:IsVisible()) then
				RatingSummary_ShowFrame(RatingSummarySelfFrame,RatingSummaryTargetFrame,UnitName("player"),tiptext,0,0);
			else
				RatingSummary_ShowFrame(RatingSummarySelfFrame,PaperDollFrame,UnitName("player"),tiptext,-30,-12);
			end
		elseif ( InspectFrame:IsVisible() and arg1 == InspectFrame.unit and RatingSummaryTargetFrame:IsVisible()) then
			RatingSummary_HideFrame(RatingSummaryTargetFrame);
			RatingSummary_ShowFrame(RatingSummaryTargetFrame,InspectFrame,UnitName(InspectFrame.unit),tiptext,-30,-12);
			RatingSummary_ShowFrame(RatingSummarySelfFrame,RatingSummaryTargetFrame,UnitName("player"),tiptext,0,0);
		end
	end

	if event == "INSPECT_TALENT_READY" then
		local frame = RatingSummaryTargetFrame;
		RatingSummary_UpdateTalentFrame();
		if frame:IsVisible() and not frame.talented then
			local tiptext = dwGetglobal(frame:GetName().."Text"):GetText();
			tiptext = tiptext.."\n\n"..RatingSummary_GetTalentString(1);
			RatingSummary_SetFrameText(frame, nil, tiptext);
			frame.talented = true;			
		end

	end
end

function RatingSummary_PaperDollFrame_OnShow()
	if (not RatingSummaryEnable) then
		return;
	end
	if InspectFrame:IsVisible() then return end
	RatingSummary_ShowFrame(RatingSummarySelfFrame,PaperDollFrame,UnitName("player"),tiptext,-30,-12);
end

function RatingSummary_PaperDollFrame_OnHide()
	if (not RatingSummaryEnable) then
		return;
	end
	if InspectFrame:IsVisible() then return end
	RatingSummary_HideFrame(RatingSummarySelfFrame);
end

function RatingSummary_InspectFrame_OnShow(unit)
	if (not RatingSummaryEnable) then
		return;
	end
	if(not InspectFrame:IsVisible()) then return end;
	local guild, level, levelid = GetGuildInfo("target")
	if(guild) then 
		InspectTitleText:Show();
		InspectTitleText:SetText("<"..guild.."> "..level); 
	else
		InspectTitleText:Hide();
	end
	RatingSummary_ShowFrame(RatingSummaryTargetFrame,InspectFrame,UnitName(InspectFrame.unit),tiptext,-30,-12);
	RatingSummary_ShowFrame(RatingSummarySelfFrame,RatingSummaryTargetFrame,UnitName("player"),tiptext,0,0);
end

function RatingSummary_InspectFrame_OnHide()
	if (not RatingSummaryEnable) then
		return;
	end
	RatingSummary_HideFrame(RatingSummaryTargetFrame);
	RatingSummary_HideFrame(RatingSummarySelfFrame);
end

function RatingSummary_GetTalentString(isInspecting) 
	local talentString = "";
	local main = "";
	local max = 0;
	for v = 1,3 do
		local tn, _, num = GetTalentTabInfo(v, isInspecting)
		if num > max then
			max = num;
			main = tn;
		end
		if #talentString > 0 then talentString = talentString.."/"; end
		talentString = talentString..num;
	end

	return TALENTS..":"..NORMAL_FONT_COLOR_CODE..main..FONT_COLOR_CODE_CLOSE..GREEN_FONT_COLOR_CODE.."("..talentString..")"..FONT_COLOR_CODE_CLOSE;
end

function RatingSummary_SetFrameText(frame, tiptitle, tiptext)

	local text = dwGetglobal(frame:GetName().."Text");
	local title = dwGetglobal(frame:GetName().."Title");

	if(tiptitle) then title:SetText(tiptitle); end

	text:SetText(tiptext);
	height = text:GetHeight();
	width = text:GetWidth();
	if(width < title:GetWidth()) then
		width = title:GetWidth();
	end
	frame:SetHeight(height+30);
	frame:SetWidth(width+30);
end

function RatingSummary_ShowFrame(frame,target,tiptitle,tiptext,anchorx,anchory)
	local unit = "player";
	if(RatingSummaryTargetFrame == frame) then
		if(InspectFrame.unit) then
			unit = InspectFrame.unit;
		else
			return;
		end
	end
	local sum = RatingSummary_Sum(not (unit == "player") );
	local _, uc = UnitClass(unit)
	local _, ur = UnitRace(unit)
	local ul = UnitLevel(unit)

	--DevTools_Dump(sum);
	tiptext = "";
	if (unit == InspectFrame.unit) then
		RatingSummary_UpdateMainFrame(sum);
	end	

	local cat, v;
	for _, cat in pairs(RatingSummary_CLASS_STAT[uc]) do
		local catStr = "";
		for _, stat in pairs(RatingSummary_STAT[cat]) do
			--ChatFrame1:AddMessage(stat);
			local func = RatingSummary_Calc[stat]
			local s1,s2,s3,s4;
			if not func then
				s1 = sum[stat] or 0
			else
				s1,s2,s3,s4 = func(sum, stat, sum[stat] or 0, uc, ul) 
			end

			local ff = RatingSummary_FORMAT[stat] or GREEN_FONT_COLOR_CODE.."%d"..FONT_COLOR_CODE_CLOSE;
			if(type(s1)~="number") then 
				ChatFrame1:AddMessage(stat..":"..tostring(s1))
			elseif(s1 and s1>0) then
				local _, sname = StatLogic:GetStatNameFromID(stat);
				if stat=="TOTAL_AVOID" then
					sname = RATING_SUMMARY_TOTAL_AVOID
				elseif not sname then
					sname = stat;
				else
					sname = string.gsub(sname, "%(%%%)", "");
					sname = string.gsub(sname, "%%", "%%%%");
				end
				sname = NORMAL_FONT_COLOR_CODE..sname..":"..FONT_COLOR_CODE_CLOSE;

				ff = sname..ff;
				catStr = catStr.."\n"..format(ff, s1, s2, s3, s4)
				--ChatFrame1:AddMessage(format(ff, s1, s2, s3, s4))	
			end
		
		end
		if catStr ~="" then
			if tiptext ~= "" then tiptext = tiptext.."\n"; end
			tiptext = tiptext.."\n"..HIGHLIGHT_FONT_COLOR_CODE..(WB_STATS_CAT[cat] or cat)..":"..FONT_COLOR_CODE_CLOSE;
			tiptext = tiptext..catStr;
		end
	end

	--item levels
	if tiptext ~= "" then tiptext = tiptext.."\n"; end
	tiptext = tiptext.."\n"..HIGHLIGHT_FONT_COLOR_CODE..RATING_SUMMARY_ITEM_LEVEL_TITLE..":"..FONT_COLOR_CODE_CLOSE;
	for v = 7, 2, -1 do
		if(sum["ITEMCOUNT"..v]) then
			local _,_,_,colorCode = GetItemQualityColor(v)
			tiptext = tiptext.."\n"..format(colorCode.."%s "..RATING_SUMMARY_ITEM_LEVEL_FORMAT.."|r", RATING_SUMMARY_ITEM_QUANLITY_NAME[v], sum["ITEMCOUNT"..v], sum["ITEMLEVEL"..v]/sum["ITEMCOUNT"..v])
		end
	end

	--talent
	if unit=="player" then
		tiptext = tiptext.."\n\n"..RatingSummary_GetTalentString();
	else
		frame.talented=false;
	end

	RatingSummary_SetFrameText(frame, tiptitle, tiptext);

	if(StatCompareSelfFrame and ( target == PaperDollFrame or target == InspectFrame )) then
		frame:SetPoint("TOPLEFT", StatCompareSelfFrame, "TOPRIGHT", anchorx + 30, anchory + 30);
	elseif(IsAddOnLoaded("oSkin") or IsAddOnLoaded("Skinner")) then
		if(UnitName("player") == tiptitle and (target:GetName() == "InspectFrame" or target:GetName() == "PaperDollFrame")) then
			frame:SetPoint("TOPLEFT", target:GetName(), "TOPRIGHT", anchorx + 30, anchory + 12);
		else
			frame:SetPoint("TOPLEFT", target:GetName(), "TOPRIGHT", anchorx, anchory);
		end
	else
		frame:SetPoint("TOPLEFT", target:GetName(), "TOPRIGHT", anchorx, anchory);
	end
	frame:Show();
end

function RatingSummary_HideFrame(frame)
	frame:Hide();
end

local slots = {
	[1] = "Head",
	[2] = "Neck",
	[3] = "Shoulder",
	[4] = "Shirt",
	[5] = "Chest",
	[6] = "Waist",
	[7] = "Legs",
	[8] = "Feet",
	[9] = "Wrist",
	[10] = "Hands",
	[11] = "Finger0",
	[12] = "Finger1",
	[13] = "Trinket0",
	[14] = "Trinket1",
	[15] = "Back",
	[16] = "MainHand",
	[17] = "SecondaryHand",
	[18] = "Ranged",
	[19] = "Tabard",
}


function RatingSummary_Sum(inspecting)
	local slotID;
	--[[ 0 = ammo 1 = head 2 = neck 3 = shoulder 4 = shirt 5 = chest 6 = belt 7 = legs 8 = feet 9 = wrist 10 = gloves 11 = finger 1 12 = finger 2 13 = trinket 1 14 = trinket 2 15 = back 16 = main hand 17 = off hand 18 = ranged 19 = tabard ]]--

	local unit = "player";
	if(inspecting) then unit=InspectFrame.unit end
	local _, uc = UnitClass(unit)
	local _, ur = UnitRace(unit)
	local ul = UnitLevel(unit)


	local sum = {};

	for i=1, 18 ,1 do
		if i~=4 then
			local slotButton = dwGetglobal( (inspecting and "Inspect" or "Character")..slots[i].."Slot");
			local slotBorder = dwGetglobal(slotButton:GetName()):GetNormalTexture();
			local link = GetInventoryItemLink(unit, i);

			if (link) then
				local _, _, quality, iLevel = GetItemInfo(link);
				if(slotBorder) then slotBorder:SetVertexColor(GetItemQualityColor(quality)) end
				--slotBorder:Show();

				--[[# 2 - Uncommon # 3 - Rare # 4 - Epic # 5 - Legendary # 7 Account]]
				if(quality >=2 and quality <=7) then
					sum["ITEMCOUNT"..quality] = (sum["ITEMCOUNT"..quality] or 0) + 1;
					sum["ITEMLEVEL"..quality] = (sum["ITEMLEVEL"..quality] or 0) + iLevel; 
				end

				local itemStat = StatLogic:GetSum(link);

				for k,v in pairs(itemStat) do
					if(k~="itemType" and k~="link") then --if(type(v)=="number") then
						if(not sum[k]) then sum[k] = 0 end
						sum[k] = sum[k] + v;
					end
				end
			else
				if(slotBorder) then slotBorder:SetVertexColor(GetItemQualityColor(1,1,1,1)) end
				--slotBorder:Hide();
			end
		end
	end

	return sum;
end

WB_STATS_CAT = {
	BASE = PLAYERSTAT_BASE_STATS,
	MELEE = PLAYERSTAT_MELEE_COMBAT,
	RANGED = PLAYERSTAT_RANGED_COMBAT,
	TANK = PLAYERSTAT_DEFENSES,
	SPELL = PLAYERSTAT_SPELL_COMBAT,
	OTHER = RATING_SUMMARY_OTHER,
}

RatingSummary_STAT = {
	BASE = { "STR", "AGI", "STA", "INT", "SPI", "ARMOR",  },
	MELEE = { "AP", "FERAL_AP", "MELEE_HIT", "MELEE_CRIT", "MELEE_HASTE", "EXPERTISE_RATING",  },
	RANGED = { "RANGED_AP", "RANGED_HIT", "RANGED_CRIT", "RANGED_HASTE", },
	TANK = { "DEFENSE", "DODGE", "PARRY", "BLOCK", "BLOCK_VALUE", "TOTAL_AVOID" },
	SPELL = { "SPELL_DMG", "HEAL", "SPELL_HIT", "SPELL_CRIT", "SPELL_HASTE", "SPELLPEN", "MANA_REG",  },
	OTHER = { "RESILIENCE_RATING", "ARMOR_PENETRATION", "ARCANE_RES", "FIRE_RES", "NATURE_RES", "FROST_RES", "SHADOW_RES" }
}

RatingSummary_CLASS_STAT = {
	HUNTER = { "BASE", "MELEE", "RANGED", "SPELL", "OTHER" },
	ROGUE = { "BASE", "MELEE", "OTHER" },
	WARRIOR = { "BASE", "MELEE", "TANK", "OTHER" },
	DEATHKNIGHT = { "BASE", "MELEE", "TANK", "OTHER" },
	DRUID = { "BASE", "MELEE", "TANK", "SPELL", "OTHER" },
	PALADIN = { "BASE", "MELEE", "TANK", "SPELL", "OTHER" },
	SHAMAN = { "BASE", "MELEE", "SPELL", "OTHER" },
	WARLOCK = { "BASE", "SPELL", "OTHER" },
	PRIEST = { "BASE", "SPELL", "OTHER" },
	MAGE = { "BASE", "SPELL", "OTHER" },
}

local ratingToEffect = function(sum, stat, val, class, level) val = sum[stat.."_RATING"] or 0; val=StatLogic:GetEffectFromRating( val, stat.."_RATING", level ) return val, sum[stat.."_RATING"] or 0 end

local SL = StatLogic;
RatingSummary_Calc = {
	STR = nil,
	AGI = function(sum, stat, val, class, level) return val, SL:GetCritFromAgi(val, class, level) end,
	STA = nil,
	INT = function(sum, stat, val, class, level) return val, SL:GetSpellCritFromInt(val, class, level) end,
	SPI = function(sum, stat, val, class, level) return val, SL:GetNormalManaRegenFromSpi(val) end,

	AP = function(sum, stat, val, class, level) return val + SL:GetAPFromAgi(sum["AGI"] or 0, class) + SL:GetAPFromStr(sum["STR"] or 0, class), val end,
	FERAL_AP = nil,
	MELEE_HIT = ratingToEffect,
	MELEE_CRIT = function(sum, stat, val, class, level) val=sum[stat.."_RATING"] or 0 local e = SL:GetEffectFromRating( val, stat.."_RATING", level ) return --[[e,]] e + SL:GetCritFromAgi(sum["AGI"] or 0, class, level), val end,
	MELEE_HASTE = ratingToEffect,
	EXPERTISE_RATING = function(sum, stat, val, class, level) local e = SL:GetEffectFromRating( val, stat, level )*0.25; return e,val  end,
	ARMOR_PENETRATION = ratingToEffect,

	RANGED_AP = function(sum, stat, val, class, level) return val + SL:GetRAPFromAgi(sum["AGI"] or 0, class),val end,
	RANGED_HIT = ratingToEffect,
	RANGED_CRIT = function(sum, stat, val, class, level) val=sum[stat.."_RATING"] or 0 local e = SL:GetEffectFromRating((sum["MELEE_CRIT_RATING"] or 0), "MELEE_CRIT_RATING", level) + SL:GetEffectFromRating( val, stat.."_RATING", level ) return --[[e,]] e + SL:GetCritFromAgi(sum["AGI"] or 0, class, level), val end,
	RANGED_HASTE = ratingToEffect,

	ARMOR = function(sum, stat, val, class, level) return (sum["ARMOR"] or 0), (sum["ARMOR_BONUS"] or 0) end,
	DEFENSE = function(sum, stat, val, class, level) 
			local e = SL:GetEffectFromRating( sum[stat.."_RATING"] or 0, stat.."_RATING", level ); 
			if(e>0) then return e+level*5,e*0.04 else return 0 end
		end,
	DODGE = ratingToEffect,
	PARRY = ratingToEffect,
	BLOCK = ratingToEffect,
	BLOCK_VALUE = nil,
	TOTAL_AVOID = function(sum, stat, val, class, level) 
			local dr = SL:GetEffectFromRating( sum["DEFENSE_RATING"] or 0, "DEFENSE_RATING", level ) * 0.04
			local parry = SL:GetEffectFromRating( sum["PARRY_RATING"] or 0, "PARRY_RATING", level ) + dr
			local dodge = SL:GetEffectFromRating( sum["DODGE_RATING"] or 0, "DODGE_RATING", level ) + dr
			local block = SL:GetEffectFromRating( sum["BLOCK_RATING"] or 0, "BLOCK_RATING", level ) + dr
			--local missing = 5 - 0.6 + dr
			local hasParry = (class=="WARRIOR" or class=="PALADIN" or class=="SHAMAN" or class=="ROGUE" or class=="HUNTER" or class=="DEATHKNIGHT")
			local hasBlock = (class=="WARRIOR" or class=="PALADIN" or class=="SHAMAN")
			if(not hasParry and not hasBlock) then return 0 end
			return (hasParry and parry or 0) + dodge, (hasBlock and block or 0);
		end,
	RESILIENCE_RATING = function(sum, stat, val, class, level) local e = SL:GetEffectFromRating( val, stat, level ); return e,val end,

	SPELL_DMG = nil,
	HEAL = nil,
	SPELL_HIT = ratingToEffect,
	SPELL_CRIT = function(sum, stat, val, class, level) val=sum[stat.."_RATING"] or 0 local e = SL:GetEffectFromRating( val, stat.."_RATING", level ) return --[[e,]] e + SL:GetSpellCritFromInt(sum["INT"] or 0, class, level), val end,
	SPELL_HASTE = ratingToEffect,
	SPELLPEN = nil, 
	MANA_REG = nil
}

local FI = "%d";
local FP = "%.2f%%";
local FL = "%.1f";
local FR = GREEN_FONT_COLOR_CODE..FP..FONT_COLOR_CODE_CLOSE.."("..FI..")";
local CFI = GREEN_FONT_COLOR_CODE..FI..FONT_COLOR_CODE_CLOSE
local BFI = GREEN_FONT_COLOR_CODE.."%d"..FONT_COLOR_CODE_CLOSE
local FCRI = GREEN_FONT_COLOR_CODE..FP..FONT_COLOR_CODE_CLOSE.."("..FI..")";

RatingSummary_FORMAT = {
	STR = BFI,
	AGI = BFI.."("..NORMAL_FONT_COLOR_CODE..RATING_SUMMARY_MELEE_CRIT..FONT_COLOR_CODE_CLOSE.."%.2f%%"..")",
	STA = BFI,
	INT = BFI.."("..NORMAL_FONT_COLOR_CODE..RATING_SUMMARY_SPELL_CRIT..FONT_COLOR_CODE_CLOSE.."%.2f%%"..")",
	SPI = BFI.."("..NORMAL_FONT_COLOR_CODE..RATING_SUMMARY_MANA_REGEN..FONT_COLOR_CODE_CLOSE..FL..")",

	AP = CFI.."("..FI..")",
	FERAL_AP = CFI,
	MELEE_HIT = FR,
	MELEE_CRIT = FCRI,
	MELEE_HASTE = FR,
	EXPERTISE_RATING = FR,
	ARMOR_PENETRATION = FR,

	RANGED_AP = CFI.."("..FI..")",
	RANGED_HIT = FR,
	RANGED_CRIT = FCRI,
	RANGED_HASTE = FR,

	ARMOR = CFI,
	DEFENSE = ""..CFI.."("..FP..")",
	DODGE = FR,
	PARRY = FR,
	BLOCK = FR,
	BLOCK_VALUE = CFI,
	TOTAL_AVOID = GREEN_FONT_COLOR_CODE..FP..FONT_COLOR_CODE_CLOSE.."(".."%.1f%%"..")",
	RESILIENCE_RATING = FR,

	SPELL_DMG = CFI,
	HEAL = CFI,
	SPELL_HIT = FR,
	SPELL_CRIT = FCRI,
	SPELL_HASTE = FR,
	SPELLPEN = CFI, 
	MANA_REG = CFI.."/MP5",
}