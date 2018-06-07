
local tCD = tdCooldown2;

tCD:SetAddOn("LoseControl", function()
	local l = _G.LoseControlFrame;
	l.button = CreateFrame("Frame");
	l.button:SetAllPoints(l);
	l.button:SetFrameStrata("LOW");
	l.texture:SetParent(l.button);
	l.type = "ACTION";
	l:SetParent(l.button);
end)