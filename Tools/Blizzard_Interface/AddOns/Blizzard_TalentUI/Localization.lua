-- This file is executed at the end of addon load

-- Talent tabs
for i=1, (PlayerTalentFrame.numTabs or 0) do
	local tabName = "PlayerTalentFrameTab"..i;
	_G[tabName.."Text"]:SetPoint("CENTER", tabName, "CENTER", 0, 5);
end
