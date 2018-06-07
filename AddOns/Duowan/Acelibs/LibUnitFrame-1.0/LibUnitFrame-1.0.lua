------------------------------------------------------------------------------
-- 文件名: LibUnitFrame ver 1.0
-- 日期: 2011-04-05
-- 作者: dugu
-- 描述: 重新实现系统头像的一些功能
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------
DW_PARTYMEMBER_MACRO = "/target party%d";
DW_PARTYTARGET_MACRO ="/target partypet%d";

local SecureCallStack = {};

local UnitFrames = {
	["PlayerFrame"] = "player",		
	["PetFrame"] = "pet",
};

local UnitToVehicle = {
	["player"] = "vehicle",
	["pet"] = "player",
};
local AddOns = {"XPerl", "Pitbull4", "ag_Unitframes", "ShadowedUnitFrames", "Perl_Player", "oUF"};
function HasOtherUnitAddOn()
	local name, title, notes, enabled;	
	for k, n in pairs(AddOns) do
		name, title, notes, enabled = GetAddOnInfo(n);
		if (name and enabled) then
			return true;
		end
	end

	return false;
end

local function SecureCall(func, ...)
	if (not InCombatLockdown()) then
		pcall(func, ...);
	else
		local arg1 = ...;
		SecureCallStack[func] = SecureCallStack[func] or {};
		SecureCallStack[func][arg1] = {...};
	end
end

local function DeleteSecureCall(func, ...)
	local arg1 = ...;
	if (SecureCallStack[func] and SecureCallStack[func][arg1]) then
		SecureCallStack[func][arg1] = nil;
	end
end

-- 没有自带头像
if (not HasOtherUnitAddOn()) then
	local VehicleDriverFrame = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate");
	RegisterStateDriver(VehicleDriverFrame, "vehicle", "[target=vehicle,exists,bonusbar:5]vehicle;novehicle");
	VehicleDriverFrame:SetAttribute("_onstate-vehicle", [[
		if newstate == "vehicle" then
			for idx, frame in pairs(VEHICLE_FRAMES) do
				frame:SetAttribute("unit", frame:GetAttribute("vehicleUnit"));
			end
		else
			for idx, frame in pairs(VEHICLE_FRAMES) do
				frame:SetAttribute("unit", frame:GetAttribute("normalUnit"));
			end
		end
	]]);

	VehicleDriverFrame:Execute([[
		VEHICLE_FRAMES = newtable();
	]]);

	local function VehicleRegisterFrame(self, unit)
		self:SetAttribute("normalUnit", unit);

		if UnitToVehicle[unit] then
			self:SetAttribute("vehicleUnit", UnitToVehicle[unit]);
		end

		VehicleDriverFrame:SetFrameRef("vehicleFrame", self);
		VehicleDriverFrame:Execute([[
			local frame = self:GetFrameRef("vehicleFrame");
			table.insert(VEHICLE_FRAMES, frame);
		]]);
	end	
	
	function dwFixUnitFrame()
		for name, unit in pairs(UnitFrames) do
			if (_G[name]) then
				VehicleRegisterFrame(_G[name], unit);
				RegisterUnitWatch(_G[name]);
			end
		end
		
		RegisterUnitWatch(_G["TargetFrame"]);

		for i=1, 4 do
			-- boss Frames
			RegisterUnitWatch(_G["Boss"..i.."TargetFrame"]);

			local PartyPetDriverFrame = CreateFrame("Frame", "PartyPetDriverFrame"..i, UIParent, "SecureHandlerStateTemplate");		
			RegisterStateDriver(PartyPetDriverFrame, "position", "[target=partypet"..i..",exists]bottom;top");		
			PartyPetDriverFrame:SetFrameRef("PositionFrame", _G["PartyMemberFrame"..i.."PetFrame"]);
			PartyPetDriverFrame:SetFrameRef("parentFrame", _G["PartyMemberFrame"..i]);
			PartyPetDriverFrame:SetAttribute("_onstate-position", [[
				local frame = self:GetFrameRef("PositionFrame");
				local parent = self:GetFrameRef("parentFrame");
				frame:SetAttribute("unit", "partypet"..parent:GetID());
				parent:SetAttribute("unit", "party"..parent:GetID());
				if newstate == "bottom" then					
					frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 23, -43);
				else					
					frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 23, -27);
				end
			]]);			
			
			_G["PartyMemberFrame"..i]:SetAttribute("unit", "party"..i);
			_G["PartyMemberFrame"..i.."PetFrame"]:SetAttribute("unit", "partypet"..i);
			RegisterUnitWatch(_G["PartyMemberFrame"..i]);
			RegisterUnitWatch(_G["PartyMemberFrame"..i.."PetFrame"]);			
			_G["PartyMemberFrame"..i]:SetAttribute("*type1", "macro");
			_G["PartyMemberFrame"..i]:SetAttribute("macrotext", format(DW_PARTYMEMBER_MACRO, i));
			_G["PartyMemberFrame"..i.."PetFrame"]:SetAttribute("*type1", "macro");
			_G["PartyMemberFrame"..i.."PetFrame"]:SetAttribute("macrotext", format(DW_PARTYTARGET_MACRO, i));
			_G["PartyMemberFrame"..i]:SetAttribute("macrotext", "/piv party"..i.."\n/target partypet"..i.."\n/upiv tarty"..i.."\n/target party"..i.."\n/end");
			_G["PartyMemberFrame"..i.."PetFrame"]:SetAttribute("*type1", "macro");
			_G["PartyMemberFrame"..i.."PetFrame"]:SetAttribute("macrotext", "/piv partypet"..i.."\n/target party"..i.."\n/upiv tartypet"..i.."\n/target partypet"..i.."\n/end");
		end
	end	

	PlayerFrame:UnregisterEvent('UNIT_ENTERING_VEHICLE')
	PlayerFrame:UnregisterEvent('UNIT_ENTERED_VEHICLE')
	PlayerFrame:UnregisterEvent('UNIT_EXITING_VEHICLE')
	PlayerFrame:UnregisterEvent('UNIT_EXITED_VEHICLE')

	PetFrame:UnregisterEvent("PET_UI_UPDATE")
	PetFrame:UnregisterEvent("UNIT_PET")
	
	function PetFrame_Update(self, override)
		
	end

	function _PetFrame_Update (unit)
		PetFrame.unit = unit;
		if ( UnitIsVisible(PetFrame.unit) ) then
			if ( PetFrame:IsShown() ) then
				UnitFrame_Update(PetFrame);			
			end

			if ( UnitPowerMax(PetFrame.unit) == 0 ) then
				PetFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-SmallTargetingFrame-NoMana");
				PetFrameManaBarText:Hide();
			else
				PetFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-SmallTargetingFrame");
			end
			PetAttackModeTexture:Hide();

			PetFrame_SetHappiness(PetFrame);
			RefreshDebuffs(PetFrame, PetFrame.unit);
		end
	end

	function _PlayerFrame_ToPlayerArt()
		--Unswap frame		
		PlayerFrame.state = "player";
		PlayerFrame.unit = "player";
		PlayerFrameHealthBar.unit = "player";
		PlayerFrameManaBar.unit = "player";
		_PetFrame_Update("pet");
		PlayerFrame_Update();
		UnitFrame_Update (PlayerFrame);
		BuffFrame_Update();
		ComboFrame_Update();
		
		if (EUF_CurrentOptions and EUF_CurrentOptions["PLAYERHPMP"] == 1) then
			EUF_PlayerFrameTextureExt:SetAlpha(1);
			EUF_PlayerFrameBackground:SetWidth(214);
		else
			PlayerFrameTexture:Show();
		end		
		PlayerFrameVehicleTexture:Hide();
		PlayerName:SetPoint("CENTER",50,19);
		PlayerLeaderIcon:SetPoint("TOPLEFT",40,-12);
		PlayerMasterIcon:SetPoint("TOPLEFT",80,-10);
		PlayerFrameGroupIndicator:SetPoint("BOTTOMLEFT", PlayerFrame, "TOPLEFT", 97, -20);
		PlayerFrameHealthBar:SetWidth(119);
		PlayerFrameHealthBar:SetPoint("TOPLEFT",106,-41);
		PlayerFrameManaBar:SetWidth(119);
		PlayerFrameManaBar:SetPoint("TOPLEFT",106,-52);
		PlayerFrameBackground:SetWidth(119);
		PlayerLevelText:Show();
	end

	function _PlayerFrame_ToVehicleArt(vehicleType)
		--Swap frame
		PlayerFrame.state = "vehicle";
		PlayerFrame.unit = "vehicle"
		PlayerFrameHealthBar.unit = "vehicle"
		PlayerFrameManaBar.unit = "vehicle"
		_PetFrame_Update("player");
		PlayerFrame_Update();
		UnitFrame_Update (PlayerFrame);
		BuffFrame_Update();
		ComboFrame_Update();
				
		PlayerFrameTexture:Hide();
		if ( vehicleType == "Natural" ) then
			if (EUF_CurrentOptions and EUF_CurrentOptions["PLAYERHPMP"] == 1) then
				PlayerFrameVehicleTexture:SetWidth(480);
				PlayerFrameVehicleTexture:SetTexture("Interface\\AddOns\\Duowan\\textures\\UI-Vehicle-Frame-Organic");
				PlayerFrameVehicleTexture:ClearAllPoints();
				PlayerFrameVehicleTexture:SetPoint("LEFT", PlayerFrame, "LEFT", 16, 0);
				EUF_PlayerFrameTextureExt:SetAlpha(0);
				EUF_PlayerFrameBackground:SetWidth(210);
			else
				PlayerFrameVehicleTexture:SetWidth(240);
				PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Organic");			
			end
			PlayerFrameHealthBar:SetWidth(103);
			PlayerFrameHealthBar:SetPoint("TOPLEFT",116,-41);
			PlayerFrameManaBar:SetWidth(103);
			PlayerFrameManaBar:SetPoint("TOPLEFT",116,-52);
		else
			if (EUF_CurrentOptions and EUF_CurrentOptions["PLAYERHPMP"] == 1) then
				PlayerFrameVehicleTexture:SetWidth(480);
				PlayerFrameVehicleTexture:SetTexture("Interface\\AddOns\\Duowan\\textures\\UI-Vehicle-Frame");
				PlayerFrameVehicleTexture:ClearAllPoints();
				PlayerFrameVehicleTexture:SetPoint("LEFT", PlayerFrame, "LEFT", 16, 0);
				EUF_PlayerFrameTextureExt:SetAlpha(0);
				EUF_PlayerFrameBackground:SetWidth(210);
			else
				PlayerFrameVehicleTexture:SetWidth(240);
				PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame");
				PlayerFrameVehicleTexture:SetPoint("CENTER", PlayerFrame, "CENTER", 0, 0);
			end
			
			PlayerFrameHealthBar:SetWidth(100);
			PlayerFrameHealthBar:SetPoint("TOPLEFT",119,-41);
			PlayerFrameManaBar:SetWidth(100);
			PlayerFrameManaBar:SetPoint("TOPLEFT",119,-52);
		end
		PlayerFrameVehicleTexture:Show();
		
		PlayerName:SetPoint("CENTER",50,23);
		PlayerLeaderIcon:SetPoint("TOPLEFT",40,-12);
		PlayerMasterIcon:SetPoint("TOPLEFT",86,0);
		PlayerFrameGroupIndicator:SetPoint("BOTTOMLEFT", PlayerFrame, "TOPLEFT", 97, -13);
		
		PlayerFrameBackground:SetWidth(114);
		PlayerLevelText:Hide();
	end
	
	function PartyMemberFrame_UpdatePet (self, id)
		if ( not id ) then
			id = self:GetID();
		end
		
		local frameName = "PartyMemberFrame"..id;
		local petFrame = _G["PartyMemberFrame"..id.."PetFrame"];
		
		if ( UnitIsConnected("party"..id) and UnitExists("partypet"..id) and SHOW_PARTY_PETS == "1" ) then
			if (not UnitWatchRegistered(petFrame)) then				
				SecureCall(RegisterUnitWatch, petFrame);
				DeleteSecureCall(UnregisterUnitWatch, petFrame);
			end
		elseif (SHOW_PARTY_PETS ~= "1") then
			if (UnitWatchRegistered(petFrame)) then
				SecureCall(UnregisterUnitWatch, petFrame);
				DeleteSecureCall(RegisterUnitWatch, petFrame);
			end
			if (petFrame:IsShown()) then
				dwSecureCall(petFrame.Hide, petFrame);
			end
		end
		
		PartyMemberFrame_RefreshPetDebuffs(self, id);
		UpdatePartyMemberBackground();
	end
	
	function PartyMemberFrame_UpdateMember (self)
		if (HIDE_PARTY_INTERFACE == "1" and GetNumRaidMembers() > 0) then
			if (UnitWatchRegistered(self)) then
				SecureCall(UnregisterUnitWatch, self);
				DeleteSecureCall(RegisterUnitWatch, self);
			end
			if (self:IsShown()) then
				dwSecureCall(self.Hide, self);
			end
			return;
		end
		
		if not UnitWatchRegistered(self) then
			SecureCall(RegisterUnitWatch, self);
			DeleteSecureCall(UnregisterUnitWatch, self);
		end
		
		local id = self:GetID();
		if ( GetPartyMember(id) ) then
			UnitFrame_Update(self);

			local masterIcon = _G[self:GetName().."MasterIcon"];
			local lootMethod;
			local lootMaster;
			lootMethod, lootMaster = GetLootMethod();
			if ( id == lootMaster ) then
				masterIcon:Show();
			else
				masterIcon:Hide();
			end
		end
		PartyMemberFrame_UpdatePet(self);
		PartyMemberFrame_UpdatePvPStatus(self);
		RefreshDebuffs(self, "party"..id);
		PartyMemberFrame_UpdateVoiceStatus(self);
		PartyMemberFrame_UpdateReadyCheck(self);
		PartyMemberFrame_UpdateOnlineStatus(self);
		UpdatePartyMemberBackground();
	end
	
	function PartyMemberFrame_ToVehicleArt(self, vehicleType)
		self.state = "vehicle";
		local prefix = self:GetName();
		_G[prefix.."Texture"]:Hide();
		if ( vehicleType == "Natural" ) then
			if (EUF_CurrentOptions and EUF_CurrentOptions["PLAYERHPMP"] == 1) then
				_G[prefix.."VehicleTexture"]:SetWidth(256);
				_G[prefix.."VehicleTexture"]:SetTexture("Interface\\AddOns\\Duowan\\textures\\UI-Vehicles-PartyFrame-Organic");
				_G[prefix.."VehicleTexture"]:ClearAllPoints();
				_G[prefix.."VehicleTexture"]:SetPoint("LEFT", self, "LEFT", -4, 0);
			else
				_G[prefix.."VehicleTexture"]:SetWidth(128);
				_G[prefix.."VehicleTexture"]:SetTexture("Interface\\Vehicles\\UI-Vehicles-PartyFrame-Organic");
				_G[prefix.."VehicleTexture"]:ClearAllPoints();
				_G[prefix.."VehicleTexture"]:SetPoint("LEFT", self, "LEFT", 0, 0);
			end			
		else
			if (EUF_CurrentOptions and EUF_CurrentOptions["PLAYERHPMP"] == 1) then
				_G[prefix.."VehicleTexture"]:SetWidth(256);
				_G[prefix.."VehicleTexture"]:SetTexture("Interface\\AddOns\\Duowan\\textures\\UI-VEHICLES-PARTYFRAME");
				_G[prefix.."VehicleTexture"]:ClearAllPoints();
				_G[prefix.."VehicleTexture"]:SetPoint("LEFT", self, "LEFT", -4, 0);
			else
				_G[prefix.."VehicleTexture"]:SetWidth(128);
				_G[prefix.."VehicleTexture"]:SetTexture("Interface\\Vehicles\\UI-Vehicles-PartyFrame");
				_G[prefix.."VehicleTexture"]:ClearAllPoints();
				_G[prefix.."VehicleTexture"]:SetPoint("LEFT", self, "LEFT", 0, 0);
			end
		end
		_G[prefix.."VehicleTexture"]:Show();
		_G[prefix.."Portrait"]:SetPoint("TOPLEFT", 4, -9);
		_G[prefix.."LeaderIcon"]:SetPoint("TOPLEFT", -3, 0);
		_G[prefix.."MasterIcon"]:SetPoint("TOPLEFT", 29, 0);
		_G[prefix.."PVPIcon"]:SetPoint("TOPLEFT", -12, -15);
		_G[prefix.."Disconnect"]:SetPoint("LEFT", -10, -1);
	
		self.overrideName = "party"..self:GetID();
		
		self.unit = "partypet"..self:GetID();
		_G[self:GetName().."HealthBar"].unit = "partypet"..self:GetID();
		_G[self:GetName().."ManaBar"].unit = "partypet"..self:GetID();
		
		_G[self:GetName().."PetFrame"].unit = "party"..self:GetID();
		_G[self:GetName().."PetFrameHealthBar"].unit = "party"..self:GetID();
		
		PartyMemberFrame_UpdateMember(self);
	
		UnitFrame_Update(self);
	end
	
	function PartyMemberFrame_ToPlayerArt(self)
		self.state = "player";
		local prefix = self:GetName();
		_G[prefix.."VehicleTexture"]:Hide();
		_G[prefix.."Texture"]:Show();
		_G[prefix.."Portrait"]:SetPoint("TOPLEFT", 7, -6);
		_G[prefix.."LeaderIcon"]:SetPoint("TOPLEFT", 0, 0);
		_G[prefix.."MasterIcon"]:SetPoint("TOPLEFT", 32, 0);
		_G[prefix.."PVPIcon"]:SetPoint("TOPLEFT", -9, -15);
		_G[prefix.."Disconnect"]:SetPoint("LEFT", -7, -1);
		
		self.overrideName = nil;
		
		self.unit = "party"..self:GetID();
		_G[self:GetName().."HealthBar"].unit = "party"..self:GetID();
		_G[self:GetName().."ManaBar"].unit = "party"..self:GetID();
		
		_G[self:GetName().."PetFrame"].unit = "partypet"..self:GetID();
		_G[self:GetName().."PetFrameHealthBar"].unit = "partypet"..self:GetID();
		PartyMemberFrame_UpdateMember(self);
		
		UnitFrame_Update(self);
	end

	InterfaceOptionsUnitFramePanelPartyInRaid:SetScript("PostClick", function()
		for i=1, 4 do
			PartyMemberFrame_UpdateMember (_G["PartyMemberFrame"..i]);
		end		
	end)

	-- FocusFrame
	FocusFrame:UnregisterEvent("PLAYER_FOCUS_CHANGED");
	TargetFrame:UnregisterEvent("PLAYER_FOCUS_CHANGED");
	RegisterUnitWatch(FocusFrame);
	--RegisterUnitWatch(FocusFrameToT);	
	
	local VehicleEventFrame = CreateFrame("Frame", nil, UIParent);
	VehicleEventFrame:RegisterEvent("UNIT_ENTERED_VEHICLE");
	VehicleEventFrame:RegisterEvent("UNIT_EXITED_VEHICLE");
	VehicleEventFrame:RegisterEvent("PET_UI_UPDATE");
	VehicleEventFrame:RegisterEvent("UNIT_PET");
	VehicleEventFrame:RegisterEvent("PLAYER_FOCUS_CHANGED");
	VehicleEventFrame:RegisterEvent("PLAYER_REGEN_ENABLED");


	VehicleEventFrame:SetScript("OnEvent", function(self, event, ...)
		local unit, arg2, vehicleType = ...
		
		if (event == "UNIT_ENTERED_VEHICLE") then
			if (unit == "player") then
				_PlayerFrame_ToVehicleArt(vehicleType);
			end
		elseif (event == "UNIT_EXITED_VEHICLE") then
			if (unit == "player") then
				_PlayerFrame_ToPlayerArt();
			end
		elseif ((event == "UNIT_PET" and unit == "player") or event == "PET_UI_UPDATE") then			
			local _unit
			if ( UnitInVehicle("player") and UnitHasVehicleUI("player") ) then
				_unit = "player";
			else
				_unit = "pet";
			end
			PetFrame.unit = _unit;
			PetFrameHealthBar.unit = _unit;
			PetFrameManaBar.unit = _unit;
			UnitFrame_Update (PetFrame);
			_PetFrame_Update(_unit);
		elseif (event == "PLAYER_FOCUS_CHANGED") then			
			if (UnitExists("focus")) then
				TargetFrame_Update(FocusFrame);
				TargetFrame_UpdateRaidTargetIcon(FocusFrame);
			elseif (UnitExists("target")) then
				TargetFrame_Update(TargetFrame);
				TargetFrame_UpdateRaidTargetIcon(TargetFrame);
			end
		elseif (event == "PLAYER_REGEN_ENABLED") then
			for func, v in pairs(SecureCallStack) do
				for k, args in pairs(v) do
					pcall(func, unpack(args));
				end
			end
		end
	end)
	
	function TargetofTarget_Update(self, elapsed)
		local parent = self:GetParent();		

		if ( UnitExists(parent.unit) and UnitExists(self.unit) ) then
			if ( parent.spellbar ) then
				parent.haveToT = true;					
			end
			local _,enClass = UnitClass(self.unit);			
			local color = RAID_CLASS_COLORS[enClass];
			if (UnitIsPlayer("targettarget") and color) then
				self.name:SetTextColor(color.r or 1, color.g or 0.8, color.b or 0);
			else
				self.name:SetTextColor(1, 0.8, 0);
			end

			UnitFrame_Update(self);
			TargetofTarget_CheckDead(self);
			TargetofTargetHealthCheck(self);
			RefreshDebuffs(self, self.unit);
		else
			if ( parent.spellbar ) then
				parent.haveToT = nil;
			end
		end
		Target_Spellbar_AdjustPosition(parent.spellbar);
	end

	function TargetFrame_Update (self)
		if ( UnitExists(self.unit) ) then
			-- Moved here to avoid taint from functions below
			if ( self.totFrame ) then
				TargetofTarget_Update(self.totFrame);
			end
			
			UnitFrame_Update(self);
			if ( self.showLevel ) then
				TargetFrame_CheckLevel(self);
			end
			TargetFrame_CheckFaction(self);
			if ( self.showClassification ) then
				TargetFrame_CheckClassification(self);
			end
			TargetFrame_CheckDead(self);
			if ( self.showLeader ) then
				if ( UnitIsPartyLeader(self.unit) and (UnitInParty(self.unit) or UnitInRaid(self.unit)) ) then
					if ( HasLFGRestrictions() ) then
						self.leaderIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES");
						self.leaderIcon:SetTexCoord(0, 0.296875, 0.015625, 0.3125);
					else
						self.leaderIcon:SetTexture("Interface\\GroupFrame\\UI-Group-LeaderIcon");
						self.leaderIcon:SetTexCoord(0, 1, 0, 1);
					end
					self.leaderIcon:Show();
				else
					self.leaderIcon:Hide();
				end
			end
			TargetFrame_UpdateAuras(self);
			if ( self.portrait ) then
				self.portrait:SetAlpha(1.0);
			end
		end
	end
	-----------------------
	-- 重新定义目标的目标头像
	function CreateToTFrame(unit)
		local name, parent;
		if (unit == "targettarget") then
			name = "dwToTFrame";
			parent = TargetFrame;
		else
			name = "dwFocusToTFrame";
			parent = FocusFrame;
		end

		local frame = CreateFrame("Button", name, parent, "TargetofTargetFrameTemplate");
		UnitFrame_Initialize(frame, unit, _G[name.."TextureFrameName"], _G[name.."Portrait"],
						 _G[name.."HealthBar"], _G[name.."TextureFrameHealthBarText"],
						 _G[name.."ManaBar"], _G[name.."TextureFrameManaBarText"]);
		SetTextStatusBarTextZeroText(frame.healthbar, DEAD);
		frame.deadText = _G[name.."TextureFrameDeadText"];
		SecureUnitButton_OnLoad(frame, unit);
		frame.unit = unit;
		frame:SetScript("OnUpdate", function(self, elapsed)			
			local parent = self:GetParent();
			
			if UnitExists(unit) then
				local _,enClass = UnitClass(unit);
				local color = RAID_CLASS_COLORS[enClass];
				if (UnitIsPlayer(unit) and color) then
					frame.name:SetTextColor(color.r or 1, color.g or 0.8, color.b or 0);
				else
					frame.name:SetTextColor(1, 0.8, 0);
				end
				
				if ( parent.spellbar ) then
					parent.haveToT = true;
					Target_Spellbar_AdjustPosition(parent.spellbar);
				end

				UnitFrame_Update(self);
				TargetofTarget_CheckDead(self);			
				TargetofTargetHealthCheck(self);
				RefreshDebuffs(self, self.unit);			
			else
				if ( parent.spellbar ) then
					parent.haveToT = nil;
					Target_Spellbar_AdjustPosition(parent.spellbar);
				end
			end
		end);		
	end

	dwFixUnitFrame();
	CreateToTFrame("focustarget");
	CreateToTFrame("targettarget");
end

function dwTargetTOT_Toggle(switch)
	if (switch) then
		if (dwFocusToTFrame) then
			RegisterUnitWatch(dwFocusToTFrame);
		end
		if (dwToTFrame) then
			TargetFrame.totFrame = nil;
			RegisterUnitWatch(dwToTFrame);
		else
			SetCVar("showTargetOfTarget", "1");
		end
	else
		if (dwFocusToTFrame) then
			UnregisterUnitWatch(dwFocusToTFrame);
		end
		if (dwToTFrame) then
			TargetFrame.totFrame = nil;
			UnregisterUnitWatch(dwToTFrame);
			dwSecureCall(dwToTFrame.Hide, dwToTFrame);
		else
			SetCVar("showTargetOfTarget", "0");
		end
	end
end

if (SHOW_TARGET_OF_TARGET == "1") then
	dwTargetTOT_Toggle(true);
end

InterfaceOptionsCombatPanelTargetOfTarget:SetScript("PostClick", function(self, button)
	if (not dwToTFrame) then
		return;
	end

	if (SHOW_TARGET_OF_TARGET == "1") then
		dwTargetTOT_Toggle(true);
	else
		dwTargetTOT_Toggle(false);
	end
end);

	