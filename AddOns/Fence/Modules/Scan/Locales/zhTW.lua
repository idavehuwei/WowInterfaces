--------
-- Localization
-- dugu@bigfoot 2010-6-3
local L = LibStub("AceLocale-3.0"):NewLocale("Fence_Scan", "zhTW");

if (L) then
	L["Scan"] = "掃 描";
	L["page"] = "頁";
	L["Scaning finished, total %d items, %d records."] = "掃描完畢, 共掃描 %d 類物品, %d 條記錄";
	L["Start bid: "] = "拍賣單價";
	L["Start group bid(%d): "] = "每組拍價(%d): ";
	L["Group bid(%d%%): "] = "競標單價(%d%%): ";
	L["Bid out(%d%%): "] = "直購單價(%d%%): ";
	L["Fence: Clear auction data sucess"] = "拍賣助手: 成功清除拍賣行數!";
	L["All information about auction items will be cleared, Are you sure?"] = "確認清除所有物品的拍賣資訊?";
	L["Confirmation"] = "確認競拍該物品";
end
