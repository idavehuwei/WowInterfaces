-- This file is executed at the end of addon load

-- make sure that the reagent count does not get cut off on the left side
local i = 1;
local fontFrame;
repeat
	local tradeSkill = getglobal("TradeSkillReagent"..i.."Count");
	if ( (i % 2) ~= 0 ) then
		if ( tradeSkill ) then
			local parent = "TradeSkillReagent"..i.."IconTexture";
			tradeSkill:ClearAllPoints();
			tradeSkill:SetJustifyH("LEFT");
			tradeSkill:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 0, 2);
		end
	end
	i = i + 1
until ( not tradeSkill )

--Make the skill line numbers smaller
TradeSkillRankFrameSkillRank:SetFontObject("NumberFontNormalSmall");