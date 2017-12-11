--by Mermaid 2008-12-07

local L = {
	["Raid Start:"] 	= "活動時間：",
	["Raid Zone:"] 		= "活動地點：",
	["Kill Boss:"] 		= "\n推倒BOSS：",
	["Joins:"]			= "\n參與人員\n",
	["Drops:"]			= "\nBOSS掉落及物品獲得者\n",
	["Looter:"] 		= "　　獲得者：",
	default = { key = 1 },
	class = {
		["戰士"]		= 1,
		["法師"]		= 1,
		["盜賊"]		= 1,
		["德魯伊"]		= 1,
		["獵人"]		= 1,
		["薩滿"]		= 1,
		["牧師"]		= 1,
		["術士"]		= 1,
		["聖騎士"]		= 1,
		["死亡騎士"]		= 1,
		[UNKNOWN]		= 1,
	},
}

function CT_RaidTrackerVowView(id)
	local profile = CT_RaidTracker_RaidLog[id] or L.default
	local text = L["Raid Start:"] .. profile.key .. " - " .. (profile.End
or "") .. "\n"
	text = text .. L["Raid Zone:"] .. (profile.zone or "") .. "\n"	
	if profile.BossKills and #profile.BossKills > 0 then
		text = text .. L["Kill Boss:"]
		for _, v in pairs(profile.BossKills) do
			text = text .. v.boss .. "　"
		end
		text = text .. "\n"
	end	
	text = text .. L["Joins:"]
	for class in pairs(L.class) do
		local num, txt = 0, ""
		for name, v in pairs(profile.PlayerInfos or {}) do
			if v.class == class then
				txt = txt .. name .."　"
				num = num + 1
			end
		end
		if num > 0 then		
			text = text .. "\n " .. class .. "[".. num .. "]： "
			text = text .. txt .. "\n"
		end
	end	
	if profile.Loot and #profile.Loot > 0 then
		text = text .. L["Drops:"]
		for _, v in pairs(profile.Loot) do
			if v.item.count > 1 then
				text = text .. "[".. v.item.name .. "]x" .. v.item.count ..
L["Looter:"] .. v.player
			else
				text = text .. "[".. v.item.name .. "]" .. L["Looter:"] .. v.player			
			end
			if v.costs and v.costs ~= 0 then
				text = text .. "  (-" .. v.costs .."DKP)"
			end
			text = text .. "\n"
		end
	end	
	MerReportFrame:Show()
	MerReportFrame_EditBox:SetText(text)
	MerReportFrame_EditBox:HighlightText()
	return text
end