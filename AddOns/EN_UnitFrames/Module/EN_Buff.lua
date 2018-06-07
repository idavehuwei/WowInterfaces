
local buff
local frame = CreateFrame("Frame", nil, PartyMemberFrame1);
-- Party Buffs/Debuffs --
for i = 1, 4 do
	local str = "PartyMemberFrame"..i
	-- buff
	for j = 1, 16 do
		buff = CreateFrame("Button", str.."Buff"..j, frame, "TargetBuffFrameTemplate")
		buff:SetID(j)
		buff:SetWidth(15)
		buff:SetHeight(15)
		buff:EnableMouse(true);
		buff:SetScript("OnEnter",function(self)
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", 15, -25);
			GameTooltip:SetUnitBuff(_G[str].unit, self:GetID());			
		end)
		
		buff:SetScript("OnUpdate",function()
			_, _, icon = UnitBuff("party"..i, j)
			dwGetglobal(str.."Buff"..j.."Icon"):SetTexture(icon)
		end)

		buff:SetScript("OnLeave",function()
			GameTooltip:Hide()
		end)


		if j == 1 then
			buff:SetPoint("TOPLEFT", str, "TOPLEFT", 47, -32)
		else
			buff:SetPoint("LEFT", str.."Buff"..j-1, "RIGHT", 2, 0)
		end
	end
	-- debuff
	local debuffbutton1 = dwGetglobal(str.."Debuff1")
	debuffbutton1:ClearAllPoints()
	debuffbutton1:SetPoint("TOPLEFT", str, "RIGHT", 20, 33)
	for j = 5, 10 do
		buff = CreateFrame("Button", str.."Debuff"..j, _G[str], "PartyBuffFrameTemplate")
		buff:SetPoint("LEFT", str.."Debuff"..j-1, "RIGHT", 2, 0)
	end
end

-- Pet Buffs/Debuffs --
for i = 1, 10 do
	buff = CreateFrame("Button", "PetFrameBuff"..i, PetFrame, "TargetBuffFrameTemplate")
	buff:SetID(i)
	buff:SetWidth(15)
	buff:SetHeight(15)	
	buff:SetScript("OnEnter",function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetUnitBuff("pet", self:GetID())
	end)

	buff:SetScript("OnUpdate",function()
		local _, _, icon = UnitBuff("pet", i)
		_G["PetFrameBuff"..i.."Icon"]:SetTexture(icon)
	end)

	buff:SetScript("OnLeave",function()
		GameTooltip:Hide()
	end)

	if i == 1 then
		buff:SetPoint("TOPLEFT", PetFrame, "TOPLEFT", 48, -42)
	else
		buff:SetPoint("LEFT", "PetFrameBuff"..i-1, "RIGHT", 2, 0)
	end
	buff = CreateFrame("Button", "PetFrameDebuff"..i, PetFrame, "PartyPetDeBuffFrameTemplate")
end

-- 
local old_PartyMemberBuffTooltip_Update = PartyMemberBuffTooltip_Update;
function EUF_TogglePartyBuffs(switch)
	if (switch) then
		PartyMemberBuffTooltip_Update = DUMMY_FUNC;
		frame:Show()
	else
		PartyMemberBuffTooltip_Update = old_PartyMemberBuffTooltip_Update;
		frame:Hide()
	end
end