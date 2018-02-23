
-- This is a symbol available for people who need to know the locale (separate from GetLocale())
LOCALE_zhCN = true;

function Localize()
	-- Put all locale specific string adjustments here
end

function LocalizeFrames()
	-- Put all locale specific UI adjustments here
	
	-- Hide profanity checkbox
	-- UIOptionsFrameCheckButton5:Hide();
	
	-- Adjust spell text
	for i=1, SPELLS_PER_PAGE do
		local buttonName = "SpellButton"..i;
		local buttonNameText = _G[buttonName.."SpellName"];
		buttonNameText:SetPoint("LEFT", buttonName, "RIGHT", 4, 4);
		local subSpellName = _G[buttonName.."SubSpellName"];
		subSpellName:SetPoint("TOPLEFT", buttonNameText, "BOTTOMLEFT", 0, 1);
		-- Hack to avoid racial passive tag truncation (Bug  ID: 55605)
		subSpellName:SetWidth(108);
	end

	-- Adjust friends frame title
	FriendsFrameTitleText:SetPoint("TOP", "FriendsFrame", "TOP", 0, -15);

	-- Adjust text in character and friends frame tabs
	for i=1, (CharacterFrame.numTabs or 0) do
		local tabName = "CharacterFrameTab"..i;
		_G[tabName.."Text"]:SetPoint("CENTER", tabName, "CENTER", 0, 5);
		tabName = "FriendsFrameTab"..i;
		_G[tabName.."Text"]:SetPoint("CENTER", tabName, "CENTER", 0, 5);
	end

	for i = 1, WHOS_TO_DISPLAY do
		--Who tab
		_G["WhoFrameButton" .. i .. "Name"]:SetPoint("TOPLEFT", 10, -2);
	end

	for i = 1, GUILDMEMBERS_TO_DISPLAY do
		--Guild tab
		_G["GuildFrameButton" .. i .. "Name"]:SetPoint("TOPLEFT", 14, -2);
	end

	--Fix the positioning of the dropdown list
	WhoFrameDropDown:SetPoint("TOPLEFT", WhoFrameColumnHeader2, "TOPLEFT", -15, 1);

	for i = 1, MAX_CHANNEL_MEMBER_BUTTONS do
		--Chat tab
		_G["ChannelMemberButton" .. i .. "Name"]:SetPoint("TOPLEFT", 13, 1);
	end

	-- Guild Member Detail Window Custom Sizing
	GUILD_DETAIL_NORM_HEIGHT = 222
	GUILD_DETAIL_OFFICER_HEIGHT = 285

	-- Mailframe tabs
	for i=1, (MailFrame.numTabs or 0) do
		local tabName = "MailFrameTab"..i;
		_G[tabName.."Text"]:SetPoint("CENTER", tabName, "CENTER", 0, 5);
	end

	-- Chat Editbox
	ChatEdit_LanguageShow();

	-- Honor stuff
	HonorFrameCurrentSessionTitle:SetPoint("TOPLEFT", "HonorFrame", "TOPLEFT", 36, -111);
	HonorFrameCurrentHK:SetPoint("TOPLEFT", "HonorFrameCurrentSessionTitle", "BOTTOMLEFT", 10, 1);
	HonorFrameYesterdayTitle:SetPoint("TOPLEFT", "HonorFrameCurrentSessionTitle", "BOTTOMLEFT", 0, -36);
	HonorFrameYesterdayHK:SetPoint("TOPLEFT", "HonorFrameYesterdayTitle", "BOTTOMLEFT", 10, -1);
	HonorFrameThisWeekTitle:SetPoint("TOPLEFT", "HonorFrameYesterdayTitle", "BOTTOMLEFT", 0, -43);
	HonorFrameThisWeekHK:SetPoint("TOPLEFT", "HonorFrameThisWeekTitle", "BOTTOMLEFT", 10, 2);
	HonorFrameLastWeekTitle:SetPoint("TOPLEFT", "HonorFrameYesterdayTitle", "BOTTOMLEFT", 0, -97);
	HonorFrameLastWeekHK:SetPoint("TOPLEFT", "HonorFrameLastWeekTitle", "BOTTOMLEFT", 10, 2);
	HonorFrameLifeTimeTitle:SetPoint("TOPLEFT", "HonorFrameLastWeekTitle", "BOTTOMLEFT", 0, -60);
	HonorFrameLifeTimeHK:SetPoint("TOPLEFT", "HonorFrameLifeTimeTitle", "BOTTOMLEFT", 10, 2);


	-- Quest Log
	QuestLogQuestCount:SetPoint("TOPRIGHT", "QuestLogCountTopRight", "BOTTOMLEFT", 1, 6);
	QuestLogDailyQuestCount:SetPoint("TOPLEFT", "QuestLogQuestCount", "BOTTOMLEFT", 0, 2);


	local point, relativeTo, relativePoint, xOfs, yOfs;

	-- Player Frame
	point, relativeTo, relativePoint, xOfs, yOfs = PlayerFrameHealthBarText:GetPoint();
	PlayerFrameHealthBarText:SetPoint(point, relativeTo, relativePoint, 50, 3);

	-- Pet Frame
	PetFrameHealthBarText:SetPoint("CENTER", PetFrameHealthBarText:GetParent(), "TOPLEFT", 82, -26);
	PetFrameManaBarText:SetPoint("CENTER", PetFrameManaBarText:GetParent(), "TOPLEFT", 82, -34);

	-- Party Frame
	for i=1, MAX_PARTY_MEMBERS do
		local currPartyMemberBarText;

		-- adjust health bar text
		currPartyMemberBarText = _G["PartyMemberFrame"..i.."HealthBarText"];
		point, relativeTo, relativePoint, xOfs, yOfs = currPartyMemberBarText:GetPoint();
		currPartyMemberBarText:SetPoint(point, relativeTo, relativePoint, 20, 11);

		-- adjust mana bar text
		currPartyMemberBarText = _G["PartyMemberFrame"..i.."ManaBarText"];
		point, relativeTo, relativePoint, xOfs, yOfs = currPartyMemberBarText:GetPoint();
		currPartyMemberBarText:SetPoint(point, relativeTo, relativePoint, 20, 2);
	end

	-- Reputation Watch Bar
	ReputationWatchStatusBarText:SetFontObject(TextStatusBarText);

	-- Set range indicator for ActionBar. The text on action buttons is switched as needed so changing it here is enough.
	RANGE_INDICATOR = "•";
	-- WatchFrame item button template sets the text to be RANGE_INDICATOR, so must iterate through any existing buttons
	for i = 1, WATCHFRAME_NUM_ITEMS do
		_G["WatchFrameItem"..i.."HotKey"]:SetText(RANGE_INDICATOR);
	end

	-- Fix money display everywhere
	MONEY_TEXT_VADJUST = 2;	
end


