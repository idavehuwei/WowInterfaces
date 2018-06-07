-----------------------------------------
---				      ---
---		ezIcons		      ---
---				      ---
---	 Raid Icon Targeting Mod      ---
---				      ---
-----------------------------------------
local L = LibStub('AceLocale-3.0'):GetLocale('Love')
local options = { 
    	type='group',
    	args = {
       		radial = {
           		type = 'toggle',
           		desc = L["Enable/Disable the radial target icon menu"] ,
           		name = L["Radial"],
           		get = "IsRadialMode",
           		set = "ToggleRadialMode",
        	},
        	mouseover = {
            		type = 'toggle',
					desc = L["Enable/Disable mouseover set icon keybindings"],
					name = L["Mouseover"],
            		get = "IsMouseoverMode",
            		set = "ToggleMouseoverMode",
        	},
        	massIcon = {
           		type = 'toggle',
					desc = L["Enable/Disable mass mouseover set icon modifier keys"],
					name = L["Massicon"],
            		get = "IsMassIconMode",
            		set = "ToggleMassIconMode"
        	},
    	},
}

--ezIcons = AceLibrary("AceAddon-3.0"):new("AceEvent-3.0", "AceDB-3.0", "AceConsole-3.0")
ezIcons = LibStub("AceAddon-3.0"):NewAddon("ezIcons", "AceEvent-3.0", "AceConsole-3.0")
ezIcons:RegisterChatCommand("/ezIcons", "/ezi", options)

-- ezIcons:RegisterDB("ezIconsDB", "ezIconsDBPC")
-- ezIcons:RegisterDefaults("profile", {
local defaults = {
	profile = {
		radial = true,
		Mouseover = true,
		MassIcon = true,
	},
};

local menu, doubleClick, doubleClickX, doubleClick, playerFaction;
local raidt = {0,0,0,0,0,0,0,0}
local low = 0;

function ezIcons:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("ezIconsDB", defaults, true);	
	playerFaction, localizedFaction = UnitFactionGroup("player");
end

function ezIcons:OnEnable()
	--self:RegisterSelfEvents();
end

function ezIcons:OnDisable()
	--self:DisableAll();
end

function ezIcons:DisableAll()
	self:UnregisterAllEvents();
end

function ezIcons:buildMenu()
	if ( menu ) then return; end
	menu = CreateFrame("button", "radial", UIParent);
	menu:SetWidth(100);
	menu:SetHeight(100);
	menu:SetPoint( "CENTER", UIParent, "BOTTOMLEFT", 0, 0 );
	menu:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	menu:RegisterEvent("PLAYER_TARGET_CHANGED");
	menu.p = menu:CreateTexture("radialPortrait","BORDER");
	menu.p:SetWidth(40);
	menu.p:SetHeight(40);
	menu.p:SetPoint("CENTER", menu, "CENTER", 0, 0 );
	menu.b = menu:CreateTexture("radialBorder", "BACKGROUND");
	menu.b:SetTexture("Interface\\Minimap\\UI-TOD-Indicator");
	menu.b:SetWidth(80);
	menu.b:SetHeight(80);
	menu.b:SetTexCoord(0.5,1,0,1);
	menu.b:SetPoint("CENTER", menu, "CENTER", 10, -10 );
	for i=1, 8 do
		menu[i] = menu:CreateTexture("radial"..i,"OVERLAY");
	end

	menu:SetScript("OnUpdate", function(self)
			local saved, index = self.i, GetRaidTargetIndex("target");
			local curtime = GetTime();
			if ( not self.h ) then
				if ( not UnitExists("target") or ( not UnitPlayerOrPetInRaid("target") and UnitIsDeadOrGhost("target") ) ) then
					if ( menu.portrait ) then
						self:Hide();
						return;
					else
						self.h = curtime;
					end
				elseif ( menu.portrait ) then
					menu.portrait = nil;
					if ( not UnitIsUnit("target","mouseover") ) then
						self:Hide();
						return;
					end
					PlaySound("igMainMenuOptionCheckBoxOn");
					SetPortraitTexture( menu.p, "target" );
				end

				local x, y = GetCursorPosition();
				local s = menu:GetEffectiveScale();
				local mx, my = menu:GetCenter();
				x = x / s;
				y = y / s;

				local a, b = y - my, x - mx;

				local dist = floor(math.sqrt( a*a + b*b ));

				self.i = nil;

				if ( dist > 60 ) then
					if ( dist > 200 ) then
						self.l = nil;
						self.h = curtime;
						self.s = nil;
						PlaySound("igMainMenuOptionCheckBoxOff");
					elseif ( not self.l ) then
						self.l = curtime;
					end
				else
					self.l = nil;

					if ( dist > 20 and dist < 50 ) then
						local pos = math.deg(math.atan2( a, b )) + 27.5;
						self.i = mod(11-ceil(pos/45),8)+1;
					end
				end

				for i=1, 8 do
					local t = self[i];
					if ( index == i ) then
						t:SetTexCoord(0,1,0,1);
						t:SetTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up");
					else
						t:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons");
						SetRaidTargetIconTexture(t,i);
					end
				end

				if ( ( self.c or IsControlKeyDown() ) and self.i ) then
					self:Click();
				end

				if ( self.c == 0 and not IsControlKeyDown() ) then
					self.c = nil;
				end
			end

			if ( self.s ) then
				local status = curtime - self.s;
				if ( status > 0.1 ) then
					menu.p:SetAlpha(1);
					menu.b:SetAlpha(1);
					for i=1, 8 do
						local t, radians = self[i], (0.375 - i/8) * 360;
						t:SetPoint("CENTER", self, "CENTER", 36*cos(radians), 36*sin(radians) );
						t:SetAlpha(0.5);
						t:SetWidth(18);
						t:SetHeight(18);
					end
					self.s = nil;
				else
					status = status / 0.1;
					menu.p:SetAlpha(status);
					menu.b:SetAlpha(status);
					for i=1, 8 do
						local t, radians = self[i], (0.375 - i/8) * 360;
						t:SetPoint("CENTER", self, "CENTER", (20*status + 16)*cos(radians), (20*status + 16)*sin(radians) );
						if ( i == index ) then
							t:SetAlpha(status);
						else
							t:SetAlpha(0.5*status);
						end
						t:SetWidth(9*status + 9);
						t:SetHeight(9*status + 9);
					end
				end
			elseif ( self.h ) then
				local status = curtime - self.h;
				if ( status > 0.1 ) then
					self.h = nil;
					self:Hide();
				else
					status = 1 - status / 0.1;
					menu.p:SetAlpha(status);
					menu.b:SetAlpha(status);
					for i=1, 8 do
						local t, radians = self[i], (0.375 - i/8) * 360;
						if ( self.i == i ) then
							t:SetWidth(36-18*status);
							t:SetHeight(36-18*status);
							t:SetAlpha(min(4*status,1));
						else
							t:SetPoint("CENTER", self, "CENTER", (20*status + 16)*cos(radians), (20*status + 16)*sin(radians) );
							t:SetAlpha(0.75*status);
							t:SetWidth(18*status);
							t:SetHeight(18*status);
						end
					end
				end
			else
				for i=1, 8 do
					local t = self[i];
					if ( i == index ) then
						t:SetAlpha(1);
					else
						t:SetAlpha(0.75);
					end
					t:SetWidth(18);
					t:SetHeight(18);
				end
			end

			if ( self.i ) then
				local t = self[self.i];
				local a, w = t:GetAlpha(), t:GetWidth();

				if ( not self.t or saved ~= self.i ) then
					self.t = curtime;
				end
				local s = 1 + min( (curtime - self.t)/0.05, 1 );

				t:SetAlpha(min(a+0.125*s,1));
				t:SetWidth(w*s);
				t:SetHeight(w*s);
			end

			if ( self.l ) then
				local status = curtime - self.l;
				if ( status > 0.75 ) then
					self.h = curtime;
					self.l = nil
					self.s = nil
					self.i = nil;
					PlaySound("igMainMenuOptionCheckBoxOff");
				end
			end
		end
		);

	menu:SetScript("OnClick", function(self)
			if ( not self.h ) then
				local index = GetRaidTargetIndex("target");
				if ( ( arg1 == "RightButton" and index and index > 0 ) or ( self.i and self.i == index ) ) then
					self.i = index;
					PlaySound("igMiniMapZoomOut");
					SetRaidTarget("target", 0);
				elseif ( self.i ) then
					PlaySound("igMiniMapZoomIn");
					SetRaidTarget("target", self.i);
				else
					PlaySound("igMainMenuOptionCheckBoxOff");
				end
				self.s = nil;
				self.h = GetTime();
			end
		end
		);

	menu:SetScript("OnEvent", function(self)
			if ( self:IsVisible() and not self.e and not self.h ) then
				self.i = nil;
				self.s = nil;
				self.h = GetTime();
				PlaySound("igMainMenuOptionCheckBoxOff");
			end
			self.e = nil;
		end
		);

	return menu;
end

function ezIcons:radial_Show()
	if (( not self.db.profile.radial ) ) then return; end
	if ( not IsPartyLeader() ) then
		local num = GetNumRaidMembers();
		if ( num == 0 ) then return; end

		local _, rank = GetRaidRosterInfo(num);
		if ( rank == 0 ) then return; end
	end

	menu = _G["radial"];
	if ( not menu ) then
		menu = ezIcons:buildMenu();
	end
	menu.s = GetTime();
	menu.h = nil;
	menu.i = nil;
	menu.l = nil;
	menu.e = 1;
	menu.portrait = 1;

	local x,y = GetCursorPosition();
	local s = menu:GetEffectiveScale();
	menu:SetPoint( "CENTER", UIParent, "BOTTOMLEFT", x/s, y/s );
	menu:Show();
end

local OnMouseUp = WorldFrame:GetScript("OnMouseUp");

WorldFrame:SetScript("OnMouseUp", function(self, button, ...)
		if ( button == "LeftButton" ) then
			local curtime = GetTime();
			local x, y = GetCursorPosition();
			if ( doubleClick and curtime - doubleClick < 0.25 and abs(x-doubleClickX) < 20 and abs(y-doubleClickY) < 20 ) then
				ezIcons:radial_Show();
				if ( menu ) then
					menu.c = 1;
				end
				doubleClick = nil;
			else
				doubleClick = curtime;
			end
			doubleClickX, doubleClickY = x, y;
		end
		if ( OnMouseUp ) then
			OnMouseUp();
		end
	end
);


function ezIcons:assign_()
	if ( ( not self.db.profile.Mouseover ) ) then return; end
	-- check if party leader
	if UnitIsPartyLeader("player") == 1 then	
		if UnitExists("mouseover") then
			tar = GetRaidTargetIndex("mouseover")
			if tar ~= nil then
				if tar ~=0 then  
					return;
				end
			else
				targ=GetRaidTargetIndex("mouseover")
				targFaction, targLocalzedFaction = UnitFactionGroup("mouseover")
				if ( targFaction == playerFaction ) then
					return;
				else
					low = self:findlow();
					SetRaidTarget("mouseover",low);
					raidt[low] = raidt[low] + 1;
				end
			end		
		end
	end	
end

function ezIcons:assign_m()
	if ( ( not self.db.profile.MassIcon ) ) then return; end
	-- check if party leader
	if UnitIsPartyLeader("player") == 1 then	
		if UnitExists("mouseover") then
			tar = GetRaidTargetIndex("mouseover")
			if tar ~= nil then
				if tar ~=0 then  
					return;
				end
			else
				targ = GetRaidTargetIndex("mouseover")
				targFaction, targLocalzedFaction = UnitFactionGroup("mouseover")
				if ( targFaction == playerFaction ) then
					return;
				else
					low = self:findlow();
					SetRaidTarget("mouseover",low);
					raidt[low] = raidt[low] + 1;
				end
			end		
		end
	end	
end

function ezIcons:unassign_()
	if ( ( not self.db.profile.Mouseover ) ) then return; end
	-- check if party leader
	if UnitIsPartyLeader("player") == 1 then	
		if UnitExists("mouseover") then
			tar = GetRaidTargetIndex("mouseover")
			if tar ~= nil then
				if tar ~=0 then  
					self:remove()
				end
			end		
		end
	end	
end

function ezIcons:unassign_m()
	if ( ( not self.db.profile.MassIcon ) ) then return; end
	-- check if party leader
	if UnitIsPartyLeader("player") == 1 then	
		if UnitExists("mouseover") then
			tar = GetRaidTargetIndex("mouseover")
			if tar ~= nil then
				if tar ~=0 then  
					self:remove()
				end
			end		
		end
	end	
end




function ezIcons:reset()
	for x = 8, 0, -1 do
		SetRaidTarget("player",x)
	end
	raidt = {0,0,0,0,0,0,0,0}
end

function ezIcons:remove()
	tar = GetRaidTargetIndex("mouseover");
	if tar  ~= nil then
		if tar ~= 0 then
			SetRaidTarget("mouseover",0);
			raidt[tar] = raidt[tar] - 1;
		end
	end
end

function ezIcons:findlow()
	value = raidt[1]
	mn = 1 
	for x=2,8 do
		if raidt[x] < value then
			value = raidt[x]
			mn = x 
		end
	end
	return mn
end

function ezIcons:PLAYER_REGEN_ENABLED()
	raidt = {0,0,0,0,0,0,0,0}
end

function ezIcons:UPDATE_MOUSEOVER_UNIT()
	if ( IsShiftKeyDown() ) then 
		self:assign_m();
	elseif ( IsControlKeyDown() ) then
		self:unassign_m();
	end
end

function ezIcons:RegisterSelfEvents()
	self:RegisterEvent("PLAYER_REGEN_ENABLED");
	self:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
end

function ezIcons:IsRadialMode()
	return self.db.profile.radial
end

function ezIcons:ToggleRadialMode()
	self.db.profile.radial = not self.db.profile.radial
end


function ezIcons:IsMouseoverMode()
	return self.db.profile.Mouseover
end

function ezIcons:ToggleMouseoverMode()
	self.db.profile.Mouseover = not self.db.profile.Mouseover
end


function ezIcons:IsMassIconMode()
	return self.db.profile.MassIcon
end

function ezIcons:ToggleMassIconMode()
	self.db.profile.MassIcon = not self.db.profile.MassIcon
end

function ezIcons:Toggle(switch)
	if (switch) then
		self:RegisterSelfEvents();
		self.db.profile.radial = true;
		self.db.profile.Mouseover = true;
		self.db.profile.MassIcon = true;
	else
		self:UnregisterAllEvents();
		self.db.profile.radial = false;
		self.db.profile.Mouseover = false;
		self.db.profile.MassIcon = false;
	end
end

