--------
-- Localization
-- dugu@bigfoot 2010-6-3
local L = LibStub("AceLocale-3.0"):NewLocale("Fence_Scan", "enUS", true);

if (L) then
	L["Scan"] = true;
	L["page"] = true;
	L["Scaning finished, total %d items, %d records."] = true;
	L["Start bid: "] = true;
	L["Start group bid(%d): "] = true;
	L["Group bid(%d%%): "] = true;
	L["Bid out(%d%%): "] = true;
	L["Fence: Clear auction data sucess"] = true;
	L["All information about auction items will be cleared, Are you sure?"] = true;
	L["Confirmation"] = true;
end
