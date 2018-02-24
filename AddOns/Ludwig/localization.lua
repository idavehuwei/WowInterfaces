--[[
	Localization for Ludwig
--]]

--[[ English - Default Language ]]--

--Keybinding text
BINDING_HEADER_LUDWIG = "Ludwig"
BINDING_NAME_LUDWIG_SHOW = "Show Ludwig"

LUDWIG_LOCALS = {}
local L = LUDWIG_LOCALS

--UI text
L.FrameTitle = "Ludwig: %d Items"

--filters
L.Key = "Key"
L.Quest = "Quest"
L.Junk = "Junk"
L.Parts = "Parts"
L.Explosives = "Explosives"
L.Devices = "Devices"
L.TradeGoods = "Trade Goods"

--Slash command responses
L.DBRefreshed = "Database Refreshed"
L.UnknownCommand = "\"%s\" is an unknown command"
L.NoMatchingItems = "There are no items matching '%s'"
L.NumMatching = "There are %d items matching '%s':"
L.GenTime = "Generated in %.3f seconds"

-- Chinese translation (zhCN) by lostcup @ NGACN

if ( GetLocale() == "zhCN" ) then

--UI text
L.FrameTitle = "Ludwig: %d件物品"

--filters
L.Key = "钥匙"
L.Quest = "任务"
L.Junk = "垃圾"
L.Parts = "零件"
L.Explosives = "爆炸物"
L.Devices = "设备"
L.TradeGoods = "商品"

--Slash command responses
L.DBRefreshed = "数据库已更新"
L.UnknownCommand = "\"%s\"命令不能被识别"
L.NoMatchingItems = "没有物品能够匹配关键字\"%s\""
L.NumMatching = "共有%d件物品能够匹配关键字\"%s\"："
L.GenTime = "耗时%.3f秒"

end