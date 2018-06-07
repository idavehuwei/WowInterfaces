--------
-- Localization
-- dugu@bigfoot 2010-6-3
local L = LibStub("AceLocale-3.0"):NewLocale("Fence_Scan", "zhCN");

if (L) then
	L["Scan"] = "扫 描";
	L["page"] = "页";
	L["Scaning finished, total %d items, %d records."] = "扫描完毕, 共扫描 %d 类物品, %d 条记录";
	L["Start bid: "] = "拍卖单价";
	L["Start group bid(%d): "] = "每组拍价(%d): ";
	L["Group bid(%d%%): "] = "竞标单价(%d%%): ";
	L["Bid out(%d%%): "] = "一口单价(%d%%): ";
	L["Fence: Clear auction data sucess"] = "拍卖助手: 成功清除拍卖行数!";
	L["All information about auction items will be cleared, Are you sure?"] = "确认清除所有物品的拍卖信息?";
	L["Confirmation"] = "确认竞拍该物品";
end
