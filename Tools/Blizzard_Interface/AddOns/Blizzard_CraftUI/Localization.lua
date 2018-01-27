-- This file is executed at the end of addon load

-- make sure that the reagent count does not get cut off on the left side
local i = 1;
local fontFrame;
repeat
	local craft = getglobal("CraftReagent"..i.."Count");
	if ( (i % 2) ~= 0 ) then
		if ( craft ) then
			local parent = "CraftReagent"..i.."IconTexture";
			craft:ClearAllPoints();
			craft:SetJustifyH("LEFT");
			craft:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 0, 2);
		end
	end
	i = i + 1
until ( not craft)
