local L = AceLibrary("AceLocale-2.2"):new("GridStatusBanzai")
L:RegisterTranslations("enUS", function() return {
	["Banzai"] = true,
	["Banzai alert"] = true,
} end)
L:RegisterTranslations("zhCN", function() return {
	["Banzai"] = "怪物目标",
	["Banzai alert"] = "怪物目标警告",
} end)
L:RegisterTranslations("zhTW", function() return {
	["Banzai"] = "怪物目標",
	["Banzai alert"] = "怪物目標警告",
} end)


local banzai = AceLibrary("LibBanzai-2.0-GUID")

GridStatusBanzai = GridStatus:NewModule("GridStatusBanzai")
GridStatusBanzai.menuName = L["Banzai"]

--{{{ AceDB defaults

GridStatusBanzai.defaultDB = {
	debug = false,
	alert_banzai = {
		text =  L["Banzai"],
		enable = true,
		color = { r = 1, g = 1, b = 0, a = 1 },
		priority = 92,
		range = false,
	},
}

--}}}

GridStatusBanzai.options = false

function GridStatusBanzai:OnInitialize()
	self.super.OnInitialize(self)
	self:RegisterStatus("alert_banzai", L["Banzai alert"], nil, true)
end

local function callback(aggro, guid, unit, ...)
	if aggro == 1 then
		local settings = GridStatusBanzai.db.profile.alert_banzai
		GridStatusBanzai.core:SendStatusGained(
			guid,
			"alert_banzai",
			settings.priority,
			(settings.range and 40),
			settings.color,
			settings.text,
			nil,
			nil,
			settings.icon
		)
	elseif aggro == 0 then
		GridStatusBanzai.core:SendStatusLost(guid, "alert_banzai")
	end
end

function GridStatusBanzai:OnEnable()
	banzai:RegisterCallback(callback)
end

function GridStatusBanzai:OnDisable()
	banzai:UnregisterCallback(callback)
end

