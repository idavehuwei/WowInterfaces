
function EUF_SetClass(portrait, unit)
	-- Set 8 class icon
	local class, category, categoryId;
	if (unit ~= "player" and unit ~= "target" and not string.find(unit, "^party(%d)$")) then
		return;
	end
	if unit == "player" then
		category = "Player";
		categoryId = "";
	end
	if unit == "target" then
		category = "Target";
		categoryId = "";
	end
	local partyexists = string.find(unit, "^party");
	if partyexists then
		category = "Party";
		categoryId = strmatch(unit, "(%d)");
	end

	portrait:SetTexCoord(0, 1, 0, 1);
	local classLoc, class = UnitClass(unit);
	
	if classLoc then
		if (EUF_CurrentOptions) then
			if EUF_CurrentOptions[string.upper(category) .. "CLASSICONSMALL"] == 1 then
				if class and UnitIsPlayer(unit) then
					EUF_SetPortraitTexture(dwGetglobal("EUF_" .. category .. "Frame" .. categoryId .. "PortraitIcon"), class);
					dwGetglobal("EUF_" .. category .. "Frame" .. categoryId .. "Portrait"):Show();
				else
					dwGetglobal("EUF_" .. category .. "Frame" .. categoryId .. "Portrait"):Hide();
				end
			end
		end
	end
end

function EUF_SetPortraitTexture(portrait, class)
	-- Set 8 class icon
	portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles");
	local Coord = CLASS_BUTTONS[class];	
	portrait:SetTexCoord(Coord[1],Coord[2],Coord[3],Coord[4]);
end

function EUF_ClassIcon_Update(unit, iconType, value)
	if unit=="player" then
		if iconType=="Big" then			
		else
			if value == 0 then
				EUF_PlayerFramePortrait:Hide();
			else
				EUF_SetClass(PlayerPortrait, "player");
			end
		end
	elseif unit=="target" then
		if iconType=="Big" then			
		else
			if value == 0 then
				EUF_TargetFramePortrait:Hide();
			else
				EUF_SetClass(TargetFramePortrait, "target")
			end
		end
	elseif unit=="party" then
		local i;
		if iconType=="Big" then		
		else
			for i = 1, 4, 1 do
				if (GetPartyMember(i)) then
					if (value == 0) then
						dwGetglobal("EUF_PartyFrame" .. i .. "Portrait"):Hide();
					else
						EUF_SetClass(dwGetglobal("PartyMemberFrame" .. i .. "Portrait"), "party"..i);
					end
				end
			end
		end
	end
end

function EUF_FrameClassIcon_Update()	
	EUF_ClassIcon_Update("player", "Small", EUF_CurrentOptions["PLAYERCLASSICONSMALL"]);	
	EUF_ClassIcon_Update("target", "Small", EUF_CurrentOptions["PLAYERCLASSICONSMALL"]);	
	EUF_ClassIcon_Update("party", "Small", EUF_CurrentOptions["PARTYCLASSICONSMALL"]);
end

function EUF_UnitFrame_OnEvent(self, event, ...)
	if ((event == "UNIT_PORTRAIT_UPDATE") and (arg1 == self.unit)) then
		EUF_SetClass(self.portrait, self.unit)
	end	
end

function EUF_UnitFrame_Update(self)
	EUF_SetClass(self.portrait, self.unit)
	return;
end

hooksecurefunc("UnitFrame_OnEvent", EUF_UnitFrame_OnEvent)
hooksecurefunc("UnitFrame_Update", EUF_UnitFrame_Update)
