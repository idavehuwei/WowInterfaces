--[[
	Project.: BlizzFacade
	File....: Locales.lua
	Version.: 15
	Author..: StormFX
]]

-- This contents of this file are automatically generated.
-- Please use the localization application on WoWAce.com to submit translations.
-- http://www.wowace.com/projects/blizzfacade/localization/

local AL3 = LibStub("AceLocale-3.0")
local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local L = AL3:NewLocale("BlizzFacade", "enUS", true, debug)
if L then
    L["Action Bars"] = true
    L["Allows the default action bars to be skinned by ButtonFacade."] = true
    L["Allows the default buff frame to be skinned by ButtonFacade."] = true
    L["Bar Options"] = true
    L["BLF_Desc"] = "Adds ButtonFacade support to the default interface. If you experience any display issues, disable the affected module or element and reload your interface."
    L["Border Colors"] = true
    L["Buff Frame"] = true
    L["Change the border color of debuffs with no type."] = true
    L["Change the border color of %s debuffs."] = true
    L["Change the border color of temporary enchants."] = true
    L["Curse"] = true
    L["Disease"] = true
    L["Enable"] = true
    L["Enable skinning of the action bars."] = true
    L["Enable skinning of the buff frame."] = true
    L["Enchant"] = true
    L["Magic"] = true
    L["Main Bar"] = true
    L["Multi-Bars"] = true
    L["None"] = true
    L["Options"] = true
    L["Pet Bar"] = true
    L["Poison"] = true
    L["Possess Bar"] = true
    L["Profiles"] = true
    L["Reset all colors."] = true
    L["Reset Colors"] = true
    L["Skin the buttons of the %s."] = true
    L["Stance Bar"] = true
    L["Vehicle Bar"] = true
    L["ToC/Adds ButtonFacade support to the default interface."] = "Adds ButtonFacade support to the default interface."

    if GetLocale() == "enUS" then return end
end

local L = AL3:NewLocale("BlizzFacade", "zhCN")
if L then
    L["Action Bars"] = "动作条"
    L["Allows the default action bars to be skinned by ButtonFacade."] = "允许默认动作条使用 ButtonFacade 样式皮肤."
    L["Allows the default buff frame to be skinned by ButtonFacade."] = "允许默认增益框架使用 ButtonFacade 样式皮肤."
    L["Bar Options"] = "动作条选项"
    L["BLF_Desc"] = "让 ButtonFacade 支持默认界面. 如果你遇到任何显示问题, 请禁用受到影响的模块或元素并重载界面."
    L["Border Colors"] = "边框颜色"
    L["Buff Frame"] = "增益框架"
    L["Change the border color of debuffs with no type."] = "更改减益边框颜色类型为无。" -- Needs review
    L["Change the border color of %s debuffs."] = "修改%s减益边框颜色。" -- Needs review
    L["Change the border color of temporary enchants."] = "更改临时附魔边框颜色。" -- Needs review
    L["Curse"] = "诅咒" -- Needs review
    L["Disease"] = "疾病" -- Needs review
    L["Enable"] = "启用"
    L["Enable skinning of the action bars."] = "启用动作条皮肤."
    L["Enable skinning of the buff frame."] = "启用增益框架皮肤."
    L["Enchant"] = "附魔" -- Needs review
    L["Magic"] = "魔法" -- Needs review
    L["Main Bar"] = "主动作条"
    L["Multi-Bars"] = "扩展动作条"
    L["None"] = "无" -- Needs review
    L["Options"] = "选项" -- Needs review
    L["Pet Bar"] = "宠物条"
    L["Poison"] = "中毒" -- Needs review
    L["Possess Bar"] = "控制条" -- Needs review
    L["Profiles"] = "配置文件" -- Needs review
    L["Reset all colors."] = "重置所有颜色。" -- Needs review
    L["Reset Colors"] = "重置颜色" -- Needs review
    L["Skin the buttons of the %s."] = "启用%s按钮皮肤."
    L["Stance Bar"] = "姿态条"
    L["Vehicle Bar"] = "载具条"
    L["ToC/Adds ButtonFacade support to the default interface."] = "让 ButtonFacade 支持默认界面."

    return
end

local L = AL3:NewLocale("BlizzFacade", "zhTW")
    if L then
    L["Action Bars"] = "動作條"
    -- L["Allows the default action bars to be skinned by ButtonFacade."] = "Allows the default action bars to be skinned by ButtonFacade."
    -- L["Allows the default buff frame to be skinned by ButtonFacade."] = "Allows the default buff frame to be skinned by ButtonFacade."
    -- L["Bar Options"] = "Bar Options"
    -- L["BLF_Desc"] = "Adds ButtonFacade support to the default interface. If you experience any display issues, disable the affected module or element and reload your interface."
    -- L["Border Colors"] = "Border Colors"
    -- L["Buff Frame"] = "Buff Frame"
    L["Change the border color of debuffs with no type."] = "更改減益邊框顏色類型為無。" -- Needs review
    L["Change the border color of %s debuffs."] = "更改%s減益邊框顏色。" -- Needs review
    L["Change the border color of temporary enchants."] = "更改臨時附魔邊框顏色。" -- Needs review
    L["Curse"] = "詛咒" -- Needs review
    L["Disease"] = "疾病" -- Needs review
    L["Enable"] = "啟用"
    -- L["Enable skinning of the action bars."] = "Enable skinning of the action bars."
    -- L["Enable skinning of the buff frame."] = "Enable skinning of the buff frame."
    L["Enchant"] = "附魔" -- Needs review
    L["Magic"] = "魔法" -- Needs review
    -- L["Main Bar"] = "Main Bar"
    -- L["Multi-Bars"] = "Multi-Bars"
    L["None"] = "無" -- Needs review
    L["Options"] = "選項" -- Needs review
    L["Pet Bar"] = "寵物條"
    L["Poison"] = "毒" -- Needs review
    -- L["Possess Bar"] = "Possess Bar"
    L["Profiles"] = "設定檔" -- Needs review
    L["Reset all colors."] = "重置所有顏色。" -- Needs review
    L["Reset Colors"] = "重置顏色" -- Needs review
    -- L["Skin the buttons of the %s."] = "Skin the buttons of the %s."
    -- L["Stance Bar"] = "Stance Bar"
    -- L["Vehicle Bar"] = "Vehicle Bar"
    -- L["ToC/Adds ButtonFacade support to the default interface."] = "Adds ButtonFacade support to the default interface."

    return
end
