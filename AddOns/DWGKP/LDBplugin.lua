------------------------------------------------------------------------------------------
-- LDBplugin.lua ver 1.0
-- 日期: 2010-12-8
-- 作者: dugu@bigfoot
-- 描述: 显示于泰坦条上的LDB插件
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------------------

local GKP = LibStub("AceAddon-3.0"):GetAddon("DWGKP");
local L = LibStub("AceLocale-3.0"):GetLocale("DWGKP");

local hovertip
function DWGKP_ShowTitanButton(switch)
	if (not TitanPanelSettings) then
		dwDelayCall("TitanPanelShowCustomButton", 1, "LDBT_DWGKP", switch);
	else
		TitanPanelShowCustomButton("LDBT_DWGKP", switch);
	end	
end

function GKP:SetupLDB()
	self.ldbp = LibStub("LibDataBroker-1.1"):NewDataObject("DWGKP", {
		icon = "Interface\\ICONS\\INV_Misc_Coin_01",
		label = "|cFF33FF33"..L["DWGKP"].."|r",
		type = "launcher",
		text  = L["DWGKP"],
		OnClick = function(clickedFrame, button)
			self:TogglePanel();
			if hovertip and hovertip.Hide then
				hovertip:Hide()
			end
		end,
		OnTooltipShow = function(tt)
			tt:SetText(L['DWGKP'], 1, 1, 1)
			tt:AddLine(L["Click to toggle gkp frame."])
			hovertip = tt
		end,
	});	
end