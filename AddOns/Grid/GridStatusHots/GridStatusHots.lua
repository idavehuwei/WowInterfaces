--{{{ Libraries

local RL -- only loaded in OnEnable when used with non-guid Grid now:    = AceLibrary("Roster-2.1")
local L = AceLibrary("AceLocale-2.2"):new("GridStatusHots")

--}}}

local playerClass, englishClass = UnitClass("player")

local spellNameCache = {};
spellNameCache.Lifebloom = GetSpellInfo(33763);
spellNameCache.Regrowth = GetSpellInfo(8936);
spellNameCache.Rejuvenation = GetSpellInfo(774);
spellNameCache.Renew = GetSpellInfo(139);
local tmpname, tmprank, tmpicon = GetSpellInfo(139);
spellNameCache.WildGrowth = GetSpellInfo(48438);
spellNameCache.SheathofLight = GetSpellInfo(54203);
spellNameCache.SacredShield = GetSpellInfo(53601);
spellNameCache.Riptide = GetSpellInfo(61295);
spellNameCache.PrayerofMending = GetSpellInfo(33076);
spellNameCache.BeaconofLight = GetSpellInfo(53563);
spellNameCache.Earthliving = GetSpellInfo(51945);
spellNameCache.Grace = GetSpellInfo(47930);
GridStatusHots = GridStatus:NewModule("GridStatusHots")
GridStatusHots.menuName = L["My HoTs"];

GridStatusHots.extraOptions = {
	["frequency"] = {
		type = 'range',
		name = L["Refresh frequency"],
		desc = L["Seconds between status refreshes"],
		get = function() return GridStatusHots.db.profile.frequency end,
		set = function(v)
				  GridStatusHots.db.profile.frequency = v
				  GridStatusHots:UpdateFrequency()
			  end,
		min = 0.01,
		max = 1,
		step = 0.01,
		isPercent = false,
		order = -1,
	},
}


--{{{ AceDB defaults
--
GridStatusHots.defaultDB = {
	frequency = 0.5,
	alert_renew = {
		text = L["Buff: My Renew"],
		desc = L["Buff: My Renew"],
		enable = true,
		totshow = false,
		priority = 95,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 0, g = 1, b = 0, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
	},
	alert_rejuv = {
		text = L["Buff: My Rejuvenation"],
		desc = L["Buff: My Rejuvenation"],
		enable = true,
		totshow = true,
		priority = 97,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 0, g = 0, b = 1, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
	},
	alert_regrow = {
		text = L["Buff: My Regrowth"],
		desc = L["Buff: My Regrowth"],
		enable = true,
		totshow = true,
		priority = 96,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 1, g = 1, b = 1, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
	},
	alert_lifebl = {
		text = L["Buff: My Lifebloom"],
		desc = L["Buff: My Lifebloom"],
		enable = true,
		totshow = true,
		priority = 98,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 1, g = 0, b = 0, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 0, g = 1, b = 0, a = 1 },
	},
	alert_lifebl_stack = {
		text = L["Buff: Lifebloom Stack Colored"],
		desc = L["Buff: Lifebloom Stack Colored"],
		enable = true,
		totshow = true,
		priority = 98,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 1, g = 0, b = 0, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 0, g = 1, b = 0, a = 1 },
	},
	alert_wgrowth = {
		text = L["Buff: My Wild Growth"],
		desc = L["Buff: My Wild Growth"],
		enable = true,
		totshow = true,
		priority = 95,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 0, g =1, b = 1, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
	},
	alert_slight = {
		text = L["Buff: My Sheath of Light"],
		desc = L["Buff: My Sheath of Light"],
		enable = true,
		totshow = true,
		priority = 98,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 0, g = 1, b = 0, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
	},
	alert_sashield = {
		text = L["Buff: My Sacred Shield"],
		desc = L["Buff: My Sacred Shield"],
		enable = true,
		totshow = true,
		priority = 97,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 0, g = 1, b = 0, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
	},
	alert_riptide = {
		text = L["Buff: My Riptide"],
		desc = L["Buff: My Riptide"],
		enable = true,
		totshow = true,
		priority = 98,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 0, g = 1, b = 0, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
	},
	alert_tothots = {
		text = L["Buff: Hot Count"],
		desc = L["Buff: Hot Count"],
		enable = true,
		lbeach = false,
		priority = 94,
		range = false,
		color = { r = 0, g = 1, b = 0, a = 1 },
	},
	alert_pom = {
		text = L["Prayer of Mending"],
		desc = L["Prayer of Mending"],
		enable = true,
		priority = 70,
		range = false,
		color = { r = 1, g = 0, b = 0, a = 1 },
		color2 = { r = 1, g = .5, b = 0, a = 1 },
		color3 = { r = 1, g = 1, b = 0, a = 1 },
		color4 = { r = 0, g = 1, b = 1, a = 1 },
		color5 = { r = .5, g = 1, b = 0, a = 1 },
		color6 = { r = 0, g = 1, b = 0, a = 1 },
	},
	alert_beacon = {
		text = L["Beacon of Light"],
		desc = L["Beacon of Light"],
		enable = true,
		priority = 95,
		range = false,
		threshold2 = 10,
		threshold3 = 5,
		color = { r = 0, g = 1, b = 0, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
	},
	alert_earth = {
		text = L["Buff: My Earthliving"],
		desc = L["Buff: My Earthliving"],
		enable = true,
		totshow = true,
		priority = 97,
		range = false,
		threshold2 = 4,
		threshold3 = 2,
		color = { r = 0, g = 1, b = 0, a = 1 },
		color2 = { r = 1, g = 1, b = 0, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
	},
	alert_gracestack = {
		text = L["Grace Stack"],
		enable = true,
		priority = 90,
		range = false,
		color = { r = 1, g = .41, b = .28, a = 1 },
		color2 = { r = 1, g = 1, b = .52, a = 1 },
		color3 = { r = .5, g = 1, b = .23, a = 1 },
	},
	alert_gracedurstack = {
		text = L["Grace Duration + Stack"],
		enable = true,
		priority = 90,
		range = false,
		threshold2 = 5.5,
		threshold3 = 3,
		color = { r = .5, g = 1, b = .23, a = 1 },
		color2 = { r = 1, g = 1, b = .52, a = 1 },
		color3 = { r = 1, g = .41, b = .28, a = 1 },
	},
}

local tothots_options = {
	["lbeach"] = {
		type = "toggle",
		name = L["Count Lifebloom as 1 HoT per stack"],
		desc = L["Check, if you want each stack of Lifebloom to count as 1 HoT"],
		get = function () return GridStatusHots.db.profile.alert_tothots.lbeach end,
		set = function (arg)
			GridStatusHots.db.profile.alert_tothots.lbeach = arg
		end,
	},
}

local renew_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_renew.threshold2
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_renew.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_renew.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_renew.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_renew.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_renew.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_renew.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_renew.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_renew.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_renew.totshow = arg
		end,
	},
}

local rejuv_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_rejuv.threshold2
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_rejuv.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_rejuv.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_rejuv.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_rejuv.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_rejuv.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_rejuv.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_rejuv.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_rejuv.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_rejuv.totshow = arg
		end,
	},
}

local regrow_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_regrow.threshold2
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_regrow.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_regrow.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_regrow.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_regrow.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_regrow.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_regrow.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_regrow.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_regrow.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_regrow.totshow = arg
		end,
	},
}

local lifebl_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_lifebl.threshold2
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_lifebl.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_lifebl.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_lifebl.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_lifebl.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_lifebl.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_lifebl.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_lifebl.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_lifebl.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_lifebl.totshow = arg
		end,
	},
}

local lifebl_stack_hotcolors = {
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_lifebl_stack.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_lifebl_stack.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_lifebl_stack.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_lifebl_stack.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_lifebl_stack.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_lifebl_stack.totshow = arg
		end,
	},
}

local wgrowth_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_wgrowth.threshold2
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_wgrowth.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_wgrowth.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_wgrowth.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_wgrowth.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_wgrowth.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_wgrowth.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_wgrowth.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_wgrowth.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_wgrowth.totshow = arg
		end,
	},
}

local slight_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_slight.threshold2
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_slight.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_slight.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_slight.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_slight.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_slight.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_slight.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_slight.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_slight.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_slight.totshow = arg
		end,
	},
}

local sashield_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_sashield.threshold2
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_sashield.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_sashield.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_sashield.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_sashield.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_sashield.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_sashield.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_sashield.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_sashield.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_sashield.totshow = arg
		end,
	},
}

local riptide_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
				return GridStatusHots.db.profile.alert_riptide.threshold2
			end,
		set = function (v)
			GridStatusHots.db.profile.alert_riptide.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_riptide.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_riptide.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_riptide.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_riptide.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_riptide.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_riptide.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_riptide.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_riptide.totshow = arg
		end,
	},
}

local pom_hotcolors = {
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color when player has two counters of mending."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_pom.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_pom.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color when player has three counters of mending."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_pom.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_pom.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["color4"] = {
		type = "color",
		name = L["Color 4"],
		desc = L["Color when player has four counters of mending."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_pom.color4
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_pom.color4
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["color5"] = {
		type = "color",
		name = L["Color 5"],
		desc = L["Color when player has five counters of mending."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_pom.color5
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_pom.color5
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["color6"] = {
		type = "color",
		name = L["Color 6"],
		desc = L["Color when player has six counters of mending."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_pom.color6
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_pom.color6
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
}

local beacon_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
				return GridStatusHots.db.profile.alert_beacon.threshold2
			end,
		set = function (v)
			GridStatusHots.db.profile.alert_beacon.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_beacon.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_beacon.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_beacon.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_beacon.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_beacon.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_beacon.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
}

local earth_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
				return GridStatusHots.db.profile.alert_earth.threshold2
			end,
		set = function (v)
			GridStatusHots.db.profile.alert_earth.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_earth.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_earth.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 10,
		min = 1,
		step = .5,
		get = function ()
			return GridStatusHots.db.profile.alert_earth.threshold3
		end,
		set = function (v)
			GridStatusHots.db.profile.alert_earth.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_earth.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_earth.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["totshow"] = {
		type = "toggle",
		name = L["Show HoT-Counter"],
		desc = L["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"],
		get = function () return GridStatusHots.db.profile.alert_earth.totshow end,
		set = function (arg)
			GridStatusHots.db.profile.alert_earth.totshow = arg
		end,
	},
}

local gracestack_hotcolors = {
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color when player has two counters of grace."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_gracestack.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_gracestack.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color when player has three counters of grace."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_gracestack.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_gracestack.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
}

local gracedurstack_hotcolors = {
	["threshold2"] = {
		type = "range",
		name = L["Threshold to activate color 2"],
		desc = L["Threshold to activate color 2"],
		max = 7,
		min = 1,
		step = .5,
		get = function ()
			      return GridStatusHots.db.profile.alert_gracedurstack.threshold2
		      end,
		set = function (v)
			       GridStatusHots.db.profile.alert_gracedurstack.threshold2 = v
		end,
	},
	["color2"] = {
		type = "color",
		name = L["Color 2"],
		desc = L["Color 2"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_gracedurstack.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_gracedurstack.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["threshold3"] = {
		type = "range",
		name = L["Threshold to activate color 3"],
		desc = L["Threshold to activate color 3"],
		max = 7,
		min = 1,
		step = .5,
		get = function ()
			      return GridStatusHots.db.profile.alert_gracedurstack.threshold3
		      end,
		set = function (v)
			       GridStatusHots.db.profile.alert_gracedurstack.threshold3 = v
		end,
	},
	["color3"] = {
		type = "color",
		name = L["Color 3"],
		desc = L["Color 3"],
		hasAlpha = true,
		get = function ()
			local color = GridStatusHots.db.profile.alert_gracedurstack.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusHots.db.profile.alert_gracedurstack.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
}
--}}}


function GridStatusHots:OnInitialize()
	self.super.OnInitialize(self)

	self:RegisterStatus("alert_tothots", L["Buff: Hot Count"], tothots_options)
	if englishClass == "PRIEST" then
		self:RegisterStatus("alert_renew", L["Buff: My Renew"], renew_hotcolors)
        self:RegisterStatus("alert_pom", L["Prayer of Mending"], pom_hotcolors)
		self:RegisterStatus("alert_gracestack", L["Grace Stack"], gracestack_hotcolors)
		self:RegisterStatus("alert_gracedurstack", L["Grace Duration + Stack"], gracedurstack_hotcolors)
	end
	if englishClass == "DRUID" then
		self:RegisterStatus("alert_rejuv", L["Buff: My Rejuvenation"], rejuv_hotcolors)
		self:RegisterStatus("alert_regrow", L["Buff: My Regrowth"], regrow_hotcolors)
		self:RegisterStatus("alert_lifebl", L["Buff: My Lifebloom"], lifebl_hotcolors)
		self:RegisterStatus("alert_lifebl_stack", L["Buff: Lifebloom Stack Colored"], lifebl_stack_hotcolors)
		self:RegisterStatus("alert_wgrowth", L["Buff: My Wild Growth"], wgrowth_hotcolors)
	end
	if englishClass == "PALADIN" then
		self:RegisterStatus("alert_slight", L["Buff: My Sheath of Light"], slight_hotcolors)
		self:RegisterStatus("alert_sashield", L["Buff: My Sacred Shield"], sashield_hotcolors)
		self:RegisterStatus("alert_beacon", L["Beacon of Light"], beacon_hotcolors)
	end
	if englishClass == "SHAMAN" then
		self:RegisterStatus("alert_riptide", L["Buff: My Riptide"], riptide_hotcolors)
		self:RegisterStatus("alert_earth", L["Buff: My Earthliving"], earth_hotcolors)
	end
end

function GridStatusHots:OnEnable()
	if not GridRoster then
		RL = AceLibrary("Roster-2.1")
	end
	self:ScheduleRepeatingEvent("GHS_Refresh", self.UpdateAll, GridStatusHots.db.profile.frequency, self)
end

function GridStatusHots:UpdateFrequency()
	self:CancelScheduledEvent("GHS_Refresh");
	self:ScheduleRepeatingEvent("GHS_Refresh", self.UpdateAll, GridStatusHots.db.profile.frequency, self)
end

function GridStatusHots:Reset()
	self.super.Reset(self)
end

local function updateUnit(self, gridid, unitid)
		local total_hots, lbstack, pomstack, grastack = 0, 0, 0, 0;
		local retime,rjtime,rgtime,lbtime,wgtime,sltime,sstime,ritime,pomtime,boltime,eatime,gratime

		local now = GetTime()
		-- Find number of hots per unit
		for i=1,999 do
			local bname,brank,btexture,bcount,btype,bdur,bexptime,bismine = UnitBuff(unitid, i)
			if not bname then break end

			local btime = bexptime - now
			if bname == spellNameCache["Renew"] and btexture == tmpicon then
				total_hots = total_hots + 1;
				if (bismine == "player" and btime) then retime = btime end
			elseif bname == spellNameCache["Regrowth"] then
				total_hots = total_hots + 1;
				if (bismine == "player" and btime) then rgtime = btime end
			elseif bname == spellNameCache["Rejuvenation"] then
				total_hots = total_hots + 1;
				if (bismine == "player" and btime) then rjtime = btime end
			elseif bname == spellNameCache["Lifebloom"] then
				if self.db.profile.alert_tothots.lbeach then
					total_hots = total_hots + bcount;
				else
					total_hots = total_hots + 1;
				end
				if (bismine == "player" and btime) then
					lbtime = btime
					lbstack = bcount
				end
			elseif bname == spellNameCache["WildGrowth"] then
				total_hots = total_hots + 1;
				if (bismine == "player" and btime) then wgtime = btime end
			elseif bname == spellNameCache["SheathofLight"] then
				total_hots = total_hots + 1;
				if (bismine == "player" and btime) then sltime = btime end
			elseif bname == spellNameCache["SacredShield"] then
				if (bismine == "player" and btime) then sstime = btime end
			elseif bname == spellNameCache["Riptide"] then
				total_hots = total_hots + 1;
				if (bismine == "player" and btime) then ritime = btime end
			elseif bname == spellNameCache["PrayerofMending"] then
				if btime then
					pomtime = btime
					pomstack = bcount
				end
			elseif bname == spellNameCache["BeaconofLight"] then
				if (bismine == "player" and btime) then boltime = btime end
			elseif bname == spellNameCache["Earthliving"] then
				total_hots = total_hots + 1;
				if (bismine == "player" and btime) then eatime = btime end
			elseif bname == spellNameCache["Grace"] then
				if (bismine == "player" and btime) then
					gratime = btime
					grastack = bcount
				end
			end
		end
		-- Set number of hots currently running on all units
		if total_hots > 0 then
			local settings = self.db.profile.alert_tothots
			self.core:SendStatusGained(gridid, "alert_tothots",
				settings.priority,
				(settings.range and 40),
				settings.color,
				tostring(total_hots)
			)
		else
			if self.core:GetCachedStatus(gridid, "alert_tothots") then self.core:SendStatusLost(gridid, "alert_tothots") end
		end

		--Renew
		if retime then
			-- Add self thrown countdown and status
			local settings = self.db.profile.alert_renew
			local hotcolor = settings.color
			if retime <= settings.threshold2 then hotcolor = settings.color2 end
			if retime <= settings.threshold3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_renew",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(retime).."-"..tostring(total_hots))
				)
			else
				self.core:SendStatusGained(gridid, "alert_renew",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(retime))
				)
			end
		else
			if self.core:GetCachedStatus(gridid, "alert_renew") then self.core:SendStatusLost(gridid, "alert_renew") end
		end

		--Regrowth
		if rgtime then
			-- Add self thrown countdown and status
			local settings = self.db.profile.alert_regrow
			local hotcolor = settings.color
			if rgtime <= settings.threshold2 then hotcolor = settings.color2 end
			if rgtime <= settings.threshold3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_regrow",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(rgtime).."-"..tostring(total_hots))
				)
			else
				self.core:SendStatusGained(gridid, "alert_regrow",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(rgtime))
				)
			end
		else
			if self.core:GetCachedStatus(gridid, "alert_regrow") then self.core:SendStatusLost(gridid, "alert_regrow") end
		end

		--Rejuv
		if rjtime then
			-- Add self thrown countdown and status
			local settings = self.db.profile.alert_rejuv
			local hotcolor = settings.color
			if rjtime <= settings.threshold2 then hotcolor = settings.color2 end
			if rjtime <= settings.threshold3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_rejuv",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(rjtime).."-"..tostring(total_hots))
				)
			else
				self.core:SendStatusGained(gridid, "alert_rejuv",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(rjtime))
				)
			end
		else
			if self.core:GetCachedStatus(gridid, "alert_rejuv") then self.core:SendStatusLost(gridid, "alert_rejuv") end
		end

		--Lifebloom
		if lbtime then
			-- Add self thrown countdown and status
			local settings = self.db.profile.alert_lifebl_stack
			local hotcolor = settings.color
			if lbstack == 2 then hotcolor = settings.color2 end
			if lbstack == 3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_lifebl_stack",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					string.format("%d-%.1f", total_hots, lbtime)
				)
			else
				self.core:SendStatusGained(gridid, "alert_lifebl_stack",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					string.format("%.1f", lbtime)
				)
			end

			local settings = self.db.profile.alert_lifebl
			local hotcolor = settings.color
			if lbtime <= settings.threshold2 then hotcolor = settings.color2 end
			if lbtime <= settings.threshold3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_lifebl",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					string.format("%d-%.1f-%d", lbstack, lbtime, total_hots)
				)
			else
				local settings = self.db.profile.alert_lifebl
				local hotcolor = settings.color
				if lbtime <= settings.threshold2 then hotcolor = settings.color2 end
				if lbtime <= settings.threshold3 then hotcolor = settings.color3 end
				self.core:SendStatusGained(gridid, "alert_lifebl",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					string.format("%d-%.1f", lbstack, lbtime)
				)
			end
		else
			if self.core:GetCachedStatus(gridid, "alert_lifebl") then self.core:SendStatusLost(gridid, "alert_lifebl") end
			if self.core:GetCachedStatus(gridid, "alert_lifebl_stack") then self.core:SendStatusLost(gridid, "alert_lifebl_stack") end
		end

		--Wild Growth
		if wgtime then
			local settings = self.db.profile.alert_wgrowth
			local hotcolor = settings.color
			if wgtime <= settings.threshold2 then hotcolor = settings.color2 end
			if wgtime <= settings.threshold3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_wgrowth",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(wgtime).."-"..tostring(total_hots))
				)
			else
				self.core:SendStatusGained(gridid, "alert_wgrowth",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(wgtime))
				)
			end
		else
			if self.core:GetCachedStatus(gridid, "alert_wgrowth") then self.core:SendStatusLost(gridid, "alert_wgrowth") end
		end

		--Sheath of Light
		if sltime then
			local settings = self.db.profile.alert_slight
			local hotcolor = settings.color
			if sltime <= settings.threshold2 then hotcolor = settings.color2 end
			if sltime <= settings.threshold3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_slight",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(sltime).."-"..tostring(total_hots))
				)
			else
				self.core:SendStatusGained(gridid, "alert_slight",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(sltime))
				)
			end
		else
			if self.core:GetCachedStatus(gridid, "alert_slight") then self.core:SendStatusLost(gridid, "alert_slight") end
		end

		--Sacred Shield
		if sstime then
			local settings = self.db.profile.alert_sashield
			local hotcolor = settings.color
			if sstime <= settings.threshold2 then hotcolor = settings.color2 end
			if sstime <= settings.threshold3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_sashield",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(sstime).."-"..tostring(total_hots))
				)
			else
				self.core:SendStatusGained(gridid, "alert_sashield",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(sstime))
				)
			end
		else
			if self.core:GetCachedStatus(gridid, "alert_sashield") then self.core:SendStatusLost(gridid, "alert_sashield") end
		end

		--Riptide
		if ritime then
			local settings = self.db.profile.alert_riptide
			local hotcolor = settings.color
			if ritime <= settings.threshold2 then hotcolor = settings.color2 end
			if ritime <= settings.threshold3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_riptide",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(ritime).."-"..tostring(total_hots))
				)
			else
				self.core:SendStatusGained(gridid, "alert_riptide",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(ritime))
				)
			end
		else
			if self.core:GetCachedStatus(gridid, "alert_riptide") then self.core:SendStatusLost(gridid, "alert_riptide") end
		end

		--Prayer of Mending
		if pomtime then
			local settings = self.db.profile.alert_pom
			local hotcolor = settings.color
			if pomstack == 2 then hotcolor = settings.color2 end
			if pomstack == 3 then hotcolor = settings.color3 end
			if pomstack == 4 then hotcolor = settings.color4 end
			if pomstack == 5 then hotcolor = settings.color5 end
			if pomstack == 6 then hotcolor = settings.color6 end
			self.core:SendStatusGained(gridid, "alert_pom",
				settings.priority,
				(settings.range and 40),
				hotcolor,
				tostring(math.floor(pomtime))
			)
		else
			if self.core:GetCachedStatus(gridid, "alert_pom") then self.core:SendStatusLost(gridid, "alert_pom") end
		end

		--Beacon of Light
		if boltime then
			local settings = self.db.profile.alert_beacon
			local hotcolor = settings.color
			if boltime <= settings.threshold2 then hotcolor = settings.color2 end
			if boltime <= settings.threshold3 then hotcolor = settings.color3 end
			self.core:SendStatusGained(gridid, "alert_beacon",
				settings.priority,
				(settings.range and 40),
				hotcolor,
				tostring(math.floor(boltime))
			)
		else
			if self.core:GetCachedStatus(gridid, "alert_beacon") then self.core:SendStatusLost(gridid, "alert_beacon") end
		end

		--Earthliving
		if eatime then
			local settings = self.db.profile.alert_earth
			local hotcolor = settings.color
			if eatime <= settings.threshold2 then hotcolor = settings.color2 end
			if eatime <= settings.threshold3 then hotcolor = settings.color3 end
			if settings.totshow then
				self.core:SendStatusGained(gridid, "alert_earth",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(eatime).."-"..tostring(total_hots))
				)
			else
				self.core:SendStatusGained(gridid, "alert_earth",
					settings.priority,
					(settings.range and 40),
					hotcolor,
					tostring(math.floor(eatime))
				)
			end
		else
			if self.core:GetCachedStatus(gridid, "alert_earth") then self.core:SendStatusLost(gridid, "alert_earth") end
		end

		--Grace
		if gratime then
			local settings = self.db.profile.alert_gracestack
			local hotcolor = settings.color
			if grastack == 2 then hotcolor = settings.color2 end
			if grastack == 3 then hotcolor = settings.color3 end
			self.core:SendStatusGained(gridid, "alert_gracestack",
				settings.priority,
				(settings.range and 40),
				hotcolor,
				tostring(math.floor(gratime))
			)

			local settings = self.db.profile.alert_gracedurstack
			local hotcolor = settings.color
			if gratime <= settings.threshold2 then hotcolor = settings.color2 end
			if gratime <= settings.threshold3 then hotcolor = settings.color3 end
			self.core:SendStatusGained(gridid, "alert_gracedurstack",
				settings.priority,
				(settings.range and 40),
				hotcolor,
				tostring(math.floor(gratime).."-"..tostring(grastack))
			)
		else
			if self.core:GetCachedStatus(gridid, "alert_gracestack") then self.core:SendStatusLost(gridid, "alert_gracestack") end
			if self.core:GetCachedStatus(gridid, "alert_gracedurstack") then self.core:SendStatusLost(gridid, "alert_gracedurstack") end
		end
end

function GridStatusHots:UpdateAll()

	if GridRoster then
		for guid, unitid in GridRoster:IterateRoster() do
			updateUnit(self, guid, unitid)
		end
	else
		for u in RL:IterateRoster(true) do
			local name = UnitName(u.unitid)
			if name then
				updateUnit(self, name, u.unitid)
			end
		end
	end
end
