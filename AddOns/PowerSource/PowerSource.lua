local function postSetUnitAura(self, func, unit, index, filter)
	local srcUnit = select(8, func(unit, index, filter))
	if srcUnit then
		self:AddLine(" ")
		
		local src = GetUnitName(srcUnit, true)
		if srcUnit == "pet" or srcUnit == "vehicle" then
			src = format("%s (%s)", src, GetUnitName("player", true))
		else
			local partypet = srcUnit:match("^partypet(%d+)$")
			local raidpet = srcUnit:match("^raidpet(%d+)$")
			if partypet then
				src = format("%s (%s)", src, GetUnitName("party"..partypet, true))
			elseif raidpet then
				src = format("%s (%s)", src, GetUnitName("raid"..raidpet, true))
			end
		end
		
		self:AddLine(src)
		self:Show()
	end
end


GameTooltip.OldSetUnitAura = GameTooltip.SetUnitAura

function GameTooltip:SetUnitAura(unit, index, filter, ...)
	self:OldSetUnitAura(unit, index, filter, ...)
	postSetUnitAura(self, UnitAura, unit, index, filter)
end


GameTooltip.OldSetUnitBuff = GameTooltip.SetUnitBuff

function GameTooltip:SetUnitBuff(unit, index, filter, ...)
	self:OldSetUnitBuff(unit, index, filter, ...)
	postSetUnitAura(self, UnitBuff, unit, index, filter)
end


GameTooltip.OldSetUnitDebuff = GameTooltip.SetUnitDebuff

function GameTooltip:SetUnitDebuff(unit, index, filter, ...)
	self:OldSetUnitDebuff(unit, index, filter, ...)
	postSetUnitAura(self, UnitDebuff, unit, index, filter)
end