-- Raid target icon function 
function EUF_PartyIcon_OnLoad(self)
	self:RegisterEvent("PLAYER_ENTERING_WORLD"); 
	self:RegisterEvent("RAID_TARGET_UPDATE");
	self.raidTargetIcon = _G[self:GetName().."RaidTargetIcon"];
	self.unit = "party"..self:GetID();
end

function EUF_PartyIcon_OnEvent(self, event, ...)
	if (event == "RAID_TARGET_UPDATE" or event == "PLAYER_ENTERING_WORLD") then
		EUF_UpdatePartyIcon (self);
	end
end

function EUF_UpdatePartyIcon (self) 
    local index = GetRaidTargetIndex(self.unit);
    if ( index ) then
        SetRaidTargetIconTexture(self.raidTargetIcon, index);
        self.raidTargetIcon:Show();
    else
        self.raidTargetIcon:Hide();
    end
end