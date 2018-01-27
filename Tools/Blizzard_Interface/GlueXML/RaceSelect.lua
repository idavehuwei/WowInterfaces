
-- This variable is used in CharacterCreate too!
MAX_CLASSES_PER_RACE = 8;

function RaceSelect_OnLoad(self)
	self:RegisterEvent("UPDATE_SELECTED_RACE");

	self.selected = nil;
	self:SetSequence(0);
	self:SetCamera(0);

	SetRaceSelectFrame("RaceSelect");
end

function RaceSelect_OnEvent(event, arg1)
	if ( event == "UPDATE_SELECTED_RACE" ) then
		UpdateSelectedRace(arg1);
	end
end

function RaceSelect_OnKeyDown(key)
	if ( key == "ESCAPE" ) then
		RaceSelect_Back();
	elseif (key == "ENTER" ) then
		RaceSelect_OnOk();
	end
end

function RaceSelect_OnMouseUp()
	RaceSelectProcessClick();
end

function RaceSelect_OnUpdate()
	UpdateRaceHighlight();
end

function UpdateSelectedRace(raceName)
	RaceSelect.selected = raceName;
	if ( not raceName ) then
		RaceSelectInfoFrame:Hide();
		return;
	end

	PlaySound("gsCharacterCreationRace");
	GlueFrameFadeOut(RaceSelectInfoFrame, RACE_SELECT_INFO_FADE_OUT, RaceSelectInfo_FadeIn);
end

function RaceSelectInfo_FadeIn()
	local factionName, internalFactionName = GetFactionForRace();
	local infoText = getglobal("RACE_INFO_"..strupper(gsub(RaceSelect.selected, "(%.*)%s+(%.*)", "%1".."%2")));
	local abilityText = getglobal("ABILITY_INFO_"..strupper(RaceSelect.selected));
	local factionText = getglobal("FACTION_INFO_"..strupper(internalFactionName));
	RaceSelectRaceName:SetText(RaceSelect.selected);
	RaceSelectRaceInfo:SetText(infoText);
	RaceSelectAbilityInfo:SetText(abilityText);
	RaceSelectFactionName:SetText(factionName);
	RaceSelectFactionInfo:SetText(factionText);
	RaceSelectInfoFrame:Show();
	GlueFrameFadeIn(RaceSelectInfoFrame, RACE_SELECT_INFO_FADE_IN);
	UpdateAvailableClasses(GetClassesForRace());
end

function UpdateAvailableClasses(...)
	local numClasses = select("#", ...);
	if ( numClasses > MAX_CLASSES_PER_RACE ) then
		message("Too many classes!  Update MAX_CLASSES_PER_RACE");
		return;
	end

	for i=1, numClasses, 1 do
		local string = getglobal("RaceSelectClass"..i);
		string:SetText("- "..select(i, ...));
		string:Show();
	end
	for i=numClasses + 1, MAX_CLASSES_PER_RACE, 1 do
		getglobal("RaceSelectClass"..i):Hide();
	end
end

function RaceSelect_OnOk()
	if ( not RaceSelect.selected ) then
		return;
	end
	PlaySound("gsCharacterSelectionCreateNew");
	SetGlueScreen("charcreate");
end

function RaceSelect_Back()
	PlaySound("gsCharacterCreationCancel");
	SetGlueScreen("charselect");
end
