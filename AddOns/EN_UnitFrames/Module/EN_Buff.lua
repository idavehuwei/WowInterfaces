
local buff

-- Party Buffs/Debuffs --
for i = 1, 4 do
	local str = "PartyMemberFrame"..i
	-- buff
	for j = 1, 16 do
		buff = CreateFrame("Button", str.."Buff"..j, getglobal(str), "TargetBuffFrameTemplate")
		buff:SetID(j)
		buff:SetWidth(15)
		buff:SetHeight(15)
		buff:SetScript("OnEnter",function()
			GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT", 15, -25)
			GameTooltip:SetUnitBuff("party"..this:GetParent():GetID(), this:GetID())
		end)
		
		buff:SetScript("OnUpdate",function()
			_, _, icon = UnitBuff("party"..i, j)
			getglobal(str.."Buff"..j.."Icon"):SetTexture(icon)
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
	local debuffbutton1 = getglobal(str.."Debuff1")
	debuffbutton1:ClearAllPoints()
	debuffbutton1:SetPoint("TOPLEFT", str, "RIGHT", 20, 33)
	for j = 5, 10 do
		buff = CreateFrame("Button", str.."Debuff"..j, getglobal(str), "PartyBuffFrameTemplate")
		buff:SetPoint("LEFT", str.."Debuff"..j-1, "RIGHT", 2, 0)
	end
end

-- Pet Buffs/Debuffs --
for i = 1, 10 do
	buff = CreateFrame("Button", "PetFrameBuff"..i, PetFrame, "TargetBuffFrameTemplate")
	buff:SetID(i)
	buff:SetWidth(15)
	buff:SetHeight(15)	
	buff:SetScript("OnEnter",function()
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
		GameTooltip:SetUnitBuff("pet", this:GetID())
	end)

	buff:SetScript("OnUpdate",function()
		_, _, icon = UnitBuff("pet", i)
		getglobal("PetFrameBuff"..i.."Icon"):SetTexture(icon)
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

function PartyMemberBuffTooltip_Update(isPet)
end