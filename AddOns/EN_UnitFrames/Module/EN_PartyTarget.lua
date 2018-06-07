local PartyTarget_Enable = true;
local frame
for i = 1, MAX_PARTY_MEMBERS do
	frame = CreateFrame("Button", "PartyTarget"..i, _G["PartyMemberFrame"..i], "PartyTargetFrameTemplate")
	frame:SetPoint("TOPLEFT", _G["PartyMemberFrame"..i], "TOPLEFT", 200, -6)
	frame:SetAttribute("unit", "party"..i.."target")
	frame:SetAttribute("*type1", "target")
end

function PartyTarget_OnUpdate(self, elapsed)
	if (not PartyTarget_Enable) then
		return;
	end

	self.timer = (self.timer or 0) + elapsed
	if self.timer >= 0.2 then
		local i = self:GetID()
		local unit = "party" .. i .."target"
		if UnitExists(unit) then
			_, en = UnitClass(unit)
			color = RAID_CLASS_COLORS[en] or NORMAL_FONT_COLOR
			perc = floor( (UnitHealth(unit) or 0) / max((UnitHealthMax(unit) or 1),1) * 100 )
			dwGetglobal("PartyTarget"..i.."Name"):SetText(UnitName(unit))
			dwGetglobal("PartyTarget"..i.."Name"):SetTextColor(color.r, color.g, color.b)
			dwGetglobal("PartyTarget"..i.."HealthBar"):SetValue(perc)
			dwGetglobal("PartyTarget"..i.."HealthBarText"):SetText(perc .. "%")
			if perc == 0 then
				dwGetglobal("PartyTarget"..i.."HealthBarText"):SetText("|cffeed200DEAD|r")
			end
			if UnitIsEnemy("player", unit) then
				dwGetglobal("PartyTarget"..i.."Border"):SetVertexColor(1, 0.2, 0.2)
				dwGetglobal("PartyTarget"..i.."HealthBar"):SetStatusBarColor(1, 0.55, 0.72)
			elseif UnitIsFriend("player", unit) then
				dwGetglobal("PartyTarget"..i.."Border"):SetVertexColor(0, 1, 0)
				dwGetglobal("PartyTarget"..i.."HealthBar"):SetStatusBarColor(0, 1, 0)
			else
				dwGetglobal("PartyTarget"..i.."Border"):SetVertexColor(0.9, 0.82, 0)
				dwGetglobal("PartyTarget"..i.."HealthBar"):SetStatusBarColor(0.65, 0.9, 0.85)
			end
		end
		this.timer = 0
	end
end

hooksecurefunc("PartyMemberFrame_OnUpdate", function(self, elapsed)
	PartyTarget_OnUpdate(self, elapsed)
end )


function PartyTarget_Toggle(switch)
	if (switch) then
		PartyTarget_Enable = true;
		for i=1, MAX_PARTY_MEMBERS do
			local frame = _G["PartyTarget" .. i];
			dwSecureCall2(RegisterUnitWatch, {frame}, true);
			dwRemoveSecureCall(UnregisterUnitWatch, frame)
		end
	else
		PartyTarget_Enable = false;
		for i=1, MAX_PARTY_MEMBERS do
			local frame = _G["PartyTarget" .. i];
			dwSecureCall2(UnregisterUnitWatch, {frame}, true);
			dwRemoveSecureCall(RegisterUnitWatch, frame)
			dwSecureCall(frame.Hide, frame);
		end
	end
end