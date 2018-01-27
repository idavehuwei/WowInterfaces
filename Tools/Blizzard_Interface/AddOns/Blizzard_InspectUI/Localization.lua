-- This file is executed at the end of addon load

for i=1, (InspectFrame.numTabs or 0) do
	local tabName = "InspectFrameTab"..i;
	_G[tabName.."Text"]:SetPoint("CENTER", tabName, "CENTER", 0, 5);
end
