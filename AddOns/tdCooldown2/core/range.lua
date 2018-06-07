local tCD = tdCooldown2;
local IsActionInRange = IsActionInRange;

local function tdRange_GetColor(id)
	local isUsable, notEnoughMana = IsUsableAction(id)
	if notEnoughMana then
		return 0.5, 0.5, 1.0, 1
	elseif not isUsable then
		return 0.4, 0.4, 0.4, 2
	elseif IsActionInRange(id) == 0 then
		return 0.5, 0.1, 0.1, 3
	else
		return 1.0, 1.0, 1.0, 0
	end
end

function tCD:ActionButton_UpdateUsable(self)
	local r, g, b, index = tdRange_GetColor(ActionButton_GetPagedID(self))
	--if not (self.index and self.index == index) then
	--	self.index = index
	dwGetglobal(self:GetName().."Icon"):SetVertexColor(r, g, b);
	--end
end

hooksecurefunc("ActionButton_UpdateUsable", function(self)
	if ( tCD.db.redout ) then
		tCD:ActionButton_UpdateUsable(self);
	end	
end);

hooksecurefunc("ActionButton_OnUpdate", function(self, elapsed)
	if ( tCD.db.redout and self.rangeTimer and self.rangeTimer <= elapsed ) then
		 tCD:ActionButton_UpdateUsable(self);
	end
end)
