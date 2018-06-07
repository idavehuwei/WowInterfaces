function Party_Spellbar_OnLoad(self)	
	self:SetFrameStrata("MEDIUM")
	RaiseFrameLevel(self)
	CastingBarFrame_OnLoad(self, "party"..self:GetID(), false, false);		
	SetPartySpellbarAspect(self);
end

function SetPartySpellbarAspect(self)
	local frameText = dwGetglobal(self:GetName().."Text")
	if (frameText) then
		frameText:SetTextHeight(13);
		frameText:SetWidth(82);
		frameText:ClearAllPoints()
		frameText:SetPoint("TOP", self, "TOP", 0, 2)
	end

	local frameBorder = _G[self:GetName().."Border"]
	if (frameBorder) then
		frameBorder:SetTexture("");		
	end

	local frameFlash = _G[self:GetName().."Flash"]
	if (frameFlash) then
		frameFlash:SetTexture("");		
	end
end

function Party_Spellbar_OnShow(self)
	_G["EUF_PartyFrame"..self:GetID().."HP"]:SetAlpha(0);
	_G["EUF_PartyFrame"..self:GetID().."MP"]:SetAlpha(0);
end

function Party_Spellbar_OnHide(self)
	_G["EUF_PartyFrame"..self:GetID().."HP"]:SetAlpha(1);
	_G["EUF_PartyFrame"..self:GetID().."MP"]:SetAlpha(1);
end

function Party_Spellbar_OnEvent(self, event, ...)
	local newevent = event
	local newarg1 = ...

	if (event == "CVAR_UPDATE") then
		if (self.casting or self.channeling) then
			self:Show();
		else
			self:Hide();
		end
		return;
	elseif (event == "PARTY_MEMBERS_CHANGED") or (event == "PARTY_MEMBER_ENABLE") or (event == "PARTY_MEMBER_DISABLE") or (event == "PARTY_LEADER_CHANGED") then
		-- check if the new target is casting a spell		
		local nameChannel = UnitChannelInfo(self.unit);
		local nameSpell = UnitCastingInfo(self.unit);		

		if (nameChannel) then
			newevent = "UNIT_SPELLCAST_CHANNEL_START";
			newarg1 = "party"..self:GetID();
		elseif (nameSpell) then
			newevent = "UNIT_SPELLCAST_START";
			newarg1 = "party"..self:GetID();
		else
			self.casting = nil;
			self.channeling = nil;
			self:SetMinMaxValues(0, 0);
			self:SetValue(0);
			self:Hide();
			return;
		end
	end	
	
	CastingBarFrame_OnEvent(self, newevent, newarg1, select(2, ...));
end

function PartyCast_Toggle(switch)
	local self;
	if (switch) then
		for i=1, 4 do		
			self = _G["PartyFrame" .. i .. "SpellBar"];
			self:RegisterEvent("PARTY_MEMBERS_CHANGED");
			self:RegisterEvent("PARTY_MEMBER_ENABLE");
			self:RegisterEvent("PARTY_MEMBER_DISABLE");
			self:RegisterEvent("PARTY_LEADER_CHANGED");			
			self:RegisterEvent("UNIT_SPELLCAST_START");
			self:RegisterEvent("UNIT_SPELLCAST_STOP");
			self:RegisterEvent("UNIT_SPELLCAST_FAILED");
			self:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED");
			self:RegisterEvent("UNIT_SPELLCAST_DELAYED");
			self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START");
			self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE");
			self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP");
			self:RegisterEvent("PLAYER_ENTERING_WORLD");
			self:RegisterEvent("CVAR_UPDATE");			
		end
	else
		for i=1, 4 do
			self = _G["PartyFrame" .. i .. "SpellBar"];
			self:UnregisterEvent("PARTY_MEMBERS_CHANGED");
			self:UnregisterEvent("PARTY_MEMBER_ENABLE");
			self:UnregisterEvent("PARTY_MEMBER_DISABLE");
			self:UnregisterEvent("PARTY_LEADER_CHANGED");			
			self:UnregisterEvent("UNIT_SPELLCAST_START");
			self:UnregisterEvent("UNIT_SPELLCAST_STOP");
			self:UnregisterEvent("UNIT_SPELLCAST_FAILED");
			self:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED");
			self:UnregisterEvent("UNIT_SPELLCAST_DELAYED");
			self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_START");
			self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE");
			self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_STOP");
			self:UnregisterEvent("PLAYER_ENTERING_WORLD");			
			self:Hide();
		end
	end
end