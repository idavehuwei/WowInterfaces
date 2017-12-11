local CCLocale		= AceLibrary("AceLocale-2.2"):new("CCBreaker")
local CCWaterfall	= AceLibrary("Waterfall-1.0")

local PolyId = CCBreaker.PolyId
local ShackleId = CCBreaker.ShackleId
local FreezingTrapId = CCBreaker.FreezingTrapId
local HibernateId = CCBreaker.HibernateId
local SapId = CCBreaker.SapId
local SeductionId = CCBreaker.SeductionId

CCBreaker:RegisterDefaults("char",{
	debug = false;
	showon = {
		player = false,
		party = false,
		raid = false,
		pet = false,
		partypet = false,
		raidpet = false,
		others = true,
		warrior = true,
		warlock = true,
		hunter = true,
		rogue = true,
		shaman = true,
		priest = true,
		paladin = true,
		mage = true,
		druid = true,
		maintank = true,
		mainassist = true,
	},
	showfrom = {
		player = true,
		party = true,
		raid = true,
		pet = true,
		partypet = true,
		raidpet = true,
		others = false,
		warrior = true,
		warlock = true,
		hunter = true,
		rogue = true,
		shaman = true,
		priest = true,
		paladin = true,
		mage = true,
		druid = true,
		maintank = true,
		mainassist = true,
	},
	showeffects = {
		freezingtrap = true,
		hibernate = true,
		polymorph = true,
		shackleundead = true,
		sap = true,
		seduction = true,
	},
	chat = {
		raid = false,
		raidwarning = false,
		party = false,
		strings={
			two=CCLocale["[spell] on [target] was removed"],
			three=CCLocale["[spell] on [target] was removed by [breaker]"],
			four=CCLocale["[spell] on [target] was removed by [breaker]'s [ability]"],
		},
	},
	display = {
		fubar = {
			spell = true,
			target = false,
			breaker = true,
			ability = false,
		},
		center = {
			colors = true,   
			enable = false,
			color = {
				r = 1,
				g = 1,
				b = 0.5,
				a = 0,
				colortext = "|cffff8000"
			},
			strings={
				two=CCLocale["[spell] on [target] was removed"],
				three=CCLocale["[spell] on [target] was removed by [breaker]"],
				four=CCLocale["[spell] on [target] was removed by [breaker]'s [ability]"],
			}
		},
		console = {
			colors = true,   
			enable = true,
			color = {
				r = 1,
				g = 1,
				b = 0.5,
				a = 0,
				colortext = "|cffff8000"
			},
			strings={
				two=CCLocale["[spell] on [target] was removed"],
				three=CCLocale["[spell] on [target] was removed by [breaker]"],
				four=CCLocale["[spell] on [target] was removed by [breaker]'s [ability]"],
			},
			colors = false;
		},
	},
})


-- Menu

CCBreaker.OnMenuRequest = {
	type = "group",
	args = {
		debug ={
			type = "toggle",
			name = CCLocale["debug"],
			desc = CCLocale["Enable debug messages"],
			get = function() return CCBreaker.db.char.debug end,
			set = function(v) CCBreaker.db.char.debug = v end, 
		},
		reset = {
			type = "execute",
			name = CCLocale["reset"],
			desc = CCLocale["Reset breaker data"],
			func = "reset",
		},
		config = {
			type = "execute",
			name = CCLocale["config"],
			desc = CCLocale["Open config in a Waterall window"],
			func = function() CCWaterfall:Open("CCBreaker") end,
		},
		
		
		
		chat = {
			type = "group",
			name = CCLocale["chat"],
			desc = CCLocale["Chat options"],
			args = {
				raid = {
					type = "toggle",
					name = CCLocale["raid"],
					desc = CCLocale["broadcast to raid"],
					get = function() return CCBreaker.db.char.chat.raid end,
					set = function(v) CCBreaker.db.char.chat.raid = v end,
				},
				raidwarning = {
					type = "toggle",
					name = CCLocale["raidwarning"],
					desc = CCLocale["broadcast as raidwarning"],
					get = function() return CCBreaker.db.char.chat.raidwarning end,
					set = function(v) CCBreaker.db.char.chat.raidwarning = v end,
				},
				party = {
					type = "toggle",
					name = CCLocale["party"],
					desc = CCLocale["broadcast to party"],
					get = function() return CCBreaker.db.char.chat.party end,
					set = function(v) CCBreaker.db.char.chat.party = v end,
				},
				text = {
					type = "group",
					name = CCLocale["text"],
					desc = CCLocale["Change the displayed text, leave blank for default"],
					args ={
						two = {
							type = "text",
							name = CCLocale["two"],
							desc = CCLocale["text if only spell an target are given"],
							usage = "[spell], [target]",
							get = function() return CCBreaker.db.char.chat.strings.two end,
							set = function(v) CCBreaker.db.char.chat.strings.two = v end,
						},
						three = {
							type = "text",
							name = CCLocale["three"],
							desc = CCLocale["text if only spell, target and breaker are given"],
							usage = "[spell], [target], [breaker]",
							get = function() return CCBreaker.db.char.display.console.strings.three end,
							set = function(v) CCBreaker.db.char.chat.strings.three = v end,
						},
						four = {
							type = "text",
							name = CCLocale["four"],
							desc = CCLocale["text if spell, target, breaker and ability are given"],
							usage = "[spell], [target], [breaker], [ability]",
							get = function() return CCBreaker.db.char.display.console.strings.four end,
							set = function(v) CCBreaker.db.char.chat.strings.four = v end,
						},
					},
				},
			},
		},
		
		
		
		display = {
			type = "group",
			name = CCLocale["display"],
			desc = CCLocale["Display options"],
			args = {
				console ={
					type = "group",
					name = CCLocale["console"],
					desc = CCLocale["Display options in console"],
					args = {
						color = {
							type = "toggle",
							name = CCLocale["color text"],
							desc = CCLocale["Color messages"],
							get = function() return CCBreaker.db.char.display.console.colors end,
							set = function(v) CCBreaker.db.char.display.console.colors = v end,
						},
						colors = {
							type = "color",
							name = CCLocale["color"],
							desc = CCLocale["Chose color to use"],
							get = function() local color = CCBreaker.db.char.display.console.color
									  return color.r,color.g,color.b,color.a 
								  end,
							set = function(r,g,b,a) local color = CCBreaker.db.char.display.console.color
									   color.r = r 
									   color.g = g
									   color.b = b
									   color.colortext = string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
								  end,
						},
						enable = {
							type = "toggle",
							name = CCLocale["enable"],
							desc = CCLocale["Display console messages"],
							get = function() return CCBreaker.db.char.display.console.enable end,
							set = function(v) CCBreaker.db.char.display.console.enable = v end,
						},
						text = {
							type = "group",
							name = CCLocale["text"],
							desc = CCLocale["Change the displayed text, leave blank for default"],
							args ={
								two = {
									type = "text",
									name = CCLocale["two"],
									desc = CCLocale["text if only spell an target are given"],
									usage = "[spell], [target]",
									get = function() return CCBreaker.db.char.display.console.strings.two end,
									set = function(v) CCBreaker.db.char.display.console.strings.two = v end,
								},
								three = {
									type = "text",
									name = CCLocale["three"],
									desc = CCLocale["text if only spell, target and breaker are given"],
									usage = "[spell], [target], [breaker]",
									get = function() return CCBreaker.db.char.display.console.strings.three end,
									set = function(v) CCBreaker.db.char.display.console.strings.three = v end,
								},
								four = {
									type = "text",
									name = CCLocale["four"],
									desc = CCLocale["text if spell, target, breaker and ability are given"],
									usage = "[spell], [target], [breaker], [ability]",
									get = function() return CCBreaker.db.char.display.console.strings.four end,
									set = function(v) CCBreaker.db.char.display.console.strings.four = v end,
								},
							},
						},
					},
				},
				center ={
					type = "group",
					name = CCLocale["center"],
					desc = CCLocale["Display options for centered messages"],
					args = {
						color = {
							type = "toggle",
							name = CCLocale["color text"],
							desc = CCLocale["Color messages"],
							get = function() return CCBreaker.db.char.display.center.colors end,
							set = function(v) CCBreaker.db.char.display.center.colors = v end,
						},
						colors = {
							type = "color",
							name = CCLocale["color"],
							desc = CCLocale["Chose color to use"],
							get = function() local color = CCBreaker.db.char.display.center.color
									  return color.r,color.g,color.b,color.a 
								  end,
							set = function(r,g,b,a) local color = CCBreaker.db.char.display.center.color
									   color.r = r 
									   color.g = g
									   color.b = b
									   color.colortext = string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
								  end,
						},
						enable = {
							type = "toggle",
							name = CCLocale["enable"],
							desc = CCLocale["Display centered messages"],
							get = function() return CCBreaker.db.char.display.center.enable end,
							set = function(v) CCBreaker.db.char.display.center.enable = v end,
						},
						text = {
							type = "group",
							name = CCLocale["text"],
							desc = CCLocale["Change the displayed text, leave blank for default"],
							args ={
								two = {
									type = "text",
									name = CCLocale["two"],
									desc = CCLocale["text if only spell an target are given"],
									usage = "[spell], [target]",
									get = function() return CCBreaker.db.char.display.center.strings.two end,
									set = function(v) CCBreaker.db.char.display.center.strings.two = v end,
								},
								three = {
									type = "text",
									name = CCLocale["three"],
									desc = CCLocale["text if only spell, target and breaker are given"],
									usage = "[spell], [target], [breaker]",
									get = function() return CCBreaker.db.char.display.center.strings.three end,
									set = function(v) CCBreaker.db.char.display.center.strings.three = v end,
								},
								four = {
									type = "text",
									name = CCLocale["four"],
									desc = CCLocale["text if spell, target, breaker and ability are given"],
									usage = "[spell], [target], [breaker], [ability]",
									get = function() return CCBreaker.db.char.display.center.strings.four end,
									set = function(v) CCBreaker.db.char.display.center.strings.four = v end,
								},
							},
						},
					},
				},
				fubar = {
					type = "group",
					name = CCLocale["fubar"],
					desc = CCLocale["Display options in Fubar"],
					args = {
						spell = {
							type = "toggle",
							name = CCLocale["spell"],
							desc = CCLocale["Display broken spell"],
							get = function() return CCBreaker.db.char.display.fubar.spell end,
							set = function(v) CCBreaker.db.char.display.fubar.spell = v end,
						},
						target = {
							type = "toggle",
							name = CCLocale["target"],
							desc = CCLocale["Display freed target"],
							get = function() return CCBreaker.db.char.display.fubar.target end,
							set = function(v) CCBreaker.db.char.display.fubar.target = v end,
						},
						breaker = {
							type = "toggle",
							name = CCLocale["breaker"],
							desc = CCLocale["Display who broke CC"],
							get = function() return CCBreaker.db.char.display.fubar.breaker end,
							set = function(v) CCBreaker.db.char.display.fubar.breaker = v end,
						},
						ability = {
							type = "toggle",
							name = CCLocale["ability"],
							desc = CCLocale["Display ability breaking the CC"],
							get = function() return CCBreaker.db.char.display.fubar.ability end,
							set = function(v) CCBreaker.db.char.display.fubar.ability = v end,
						},
					},
				},
			},
		},
		filter = {
			type = "group",
			name = CCLocale["filter"],
			desc = CCLocale["Filter Options"],
			args = {
				
				showon = {
					type = "group",
					name = CCLocale["show on"],
					desc = CCLocale["Report CC breaks to those targets only"],
					args = {
						role = {
							type = "group",
							name = CCLocale["role"],
							desc = CCLocale["Filter for raid roles"],
							args = {
								maintank = {
									type = "toggle",
									name = CCLocale["maintank"],
									desc = CCLocale["Show break on maintanks"],
									get = function() return CCBreaker.db.char.showon.maintank end,
									set = function(v) CCBreaker.db.char.showon.maintank = v end,
								},
								mainassist = {
									type = "toggle",
									name = CCLocale["mainassist"],
									desc = CCLocale["Show break on mainassists"],
									get = function() return CCBreaker.db.char.showon.mainassist end,
									set = function(v) CCBreaker.db.char.showon.mainassist = v end,
								},
							},
						},
						unit = {
							type = "group",
							name = CCLocale["unit"],
							desc = CCLocale["Filter for unit types"],
							args = {
								player = {
									type = "toggle",
									name = CCLocale["player"],
									desc = CCLocale["Show break on player"],
									get = function() return CCBreaker.db.char.showon.player end,
									set = function(v) CCBreaker.db.char.showon.player = v end,
								},
								party = {
									type = "toggle",
									name = CCLocale["party"],
									desc = CCLocale["Show break on party members"],
									get = function() return CCBreaker.db.char.showon.party end,
									set = function(v) CCBreaker.db.char.showon.party = v end,
								},
								raid = {
									type = "toggle",
									name = CCLocale["raid"],
									desc = CCLocale["Show break on raid members"],
									get = function() return CCBreaker.db.char.showon.raid end,
									set = function(v) CCBreaker.db.char.showon.raid = v end,
								},
								pet = {
									type = "toggle",
									name = CCLocale["pet"],
									desc = CCLocale["Show break on your pet"],
									get = function() return CCBreaker.db.char.showon.pet end,
									set = function(v) CCBreaker.db.char.showon.pet = v end,
								},
								partypet = {
									type = "toggle",
									name = CCLocale["party pet"],
									desc = CCLocale["Show break on party pets"],
									get = function() return CCBreaker.db.char.showon.partypet end,
									set = function(v) CCBreaker.db.char.showon.partypet = v end,
								},
								raidpet = {
									type = "toggle",
									name = CCLocale["raid pet"],
									desc = CCLocale["Show break on raid pets"],
									get = function() return CCBreaker.db.char.showon.raidpet end,
									set = function(v) CCBreaker.db.char.showon.raidpet = v end,
								},
								others = {
									type = "toggle",
									name = CCLocale["others"],
									desc = CCLocale["Show break on others"],
									get = function() return CCBreaker.db.char.showon.others end,
									set = function(v) CCBreaker.db.char.showon.others = v end,
								},
							},
						},
						
						class = {
							type = "group",
							name = CCLocale["class"],
							desc = CCLocale["Filter for classes"],
							args = {
								warrior = {
									type = "toggle",
									name = CCLocale["warrior"],
									desc = CCLocale["Show break on warriors"],
									get = function() return CCBreaker.db.char.showon.warrior end,
									set = function(v) CCBreaker.db.char.showon.warrior = v end,
								},
								warlock = {
									type = "toggle",
									name = CCLocale["warlock"],
									desc = CCLocale["Show break on warlocks"],
									get = function() return CCBreaker.db.char.showon.warlock end,
									set = function(v) CCBreaker.db.char.showon.warlock = v end,
								},
								hunter = {
									type = "toggle",
									name = CCLocale["hunter"],
									desc = CCLocale["Show break on hunters"],
									get = function() return CCBreaker.db.char.showon.hunter end,
									set = function(v) CCBreaker.db.char.showon.hunter = v end,
								},
								paladin = {
									type = "toggle",
									name = CCLocale["paladin"],
									desc = CCLocale["Show break on paladins"],
									get = function() return CCBreaker.db.char.showon.paladin end,
									set = function(v) CCBreaker.db.char.showon.paladin = v end,
								},
								priest = {
									type = "toggle",
									name = CCLocale["priest"],
									desc = CCLocale["Show break on priests"],
									get = function() return CCBreaker.db.char.showon.priest end,
									set = function(v) CCBreaker.db.char.showon.priest = v end,
								},
								druid = {
									type = "toggle",
									name = CCLocale["druid"],
									desc = CCLocale["Show break on druids"],
									get = function() return CCBreaker.db.char.showon.druid end,
									set = function(v) CCBreaker.db.char.showon.druid = v end,
								},
								shaman = {
									type = "toggle",
									name = CCLocale["shaman"],
									desc = CCLocale["Show break on shamans"],
									get = function() return CCBreaker.db.char.showon.shaman end,
									set = function(v) CCBreaker.db.char.showon.shaman = v end,
								},
								mage = {
									type = "toggle",
									name = CCLocale["mage"],
									desc = CCLocale["Show break on mages"],
									get = function() return CCBreaker.db.char.showon.mage end,
									set = function(v) CCBreaker.db.char.showon.mage = v end,
								},
								rogue = {
									type = "toggle",
									name = CCLocale["rogue"],
									desc = CCLocale["Show break on rogues"],
									get = function() return CCBreaker.db.char.showon.rogue end,
									set = function(v) CCBreaker.db.char.showon.rogue = v end,
								},
							},
						},
					},
				},
				showfrom = {
					type = "group",
					name = CCLocale["show from"],
					desc = CCLocale["Report CC breaks from those only"],
					args = {
						role = {
							type = "group",
							name = CCLocale["role"],
							desc = CCLocale["Filter for raid roles"],
							args = {
								maintank = {
									type = "toggle",
									name = CCLocale["maintank"],
									desc = CCLocale["Show break from maintanks"],
									get = function() return CCBreaker.db.char.showfrom.maintank end,
									set = function(v) CCBreaker.db.char.showfrom.maintank = v end,
								},
								mainassist = {
									type = "toggle",
									name = CCLocale["mainassist"],
									desc = CCLocale["Show break from mainassists"],
									get = function() return CCBreaker.db.char.showfrom.mainassist end,
									set = function(v) CCBreaker.db.char.showfrom.mainassist = v end,
								},
							},
						},
						unit = {
							type = "group",
							name = CCLocale["unit"],
							desc = CCLocale["Filter for unit types"],
							args = {
								player = {
									type = "toggle",
									name = CCLocale["player"],
									desc = CCLocale["Show break from player"],
									get = function() return CCBreaker.db.char.showfrom.player end,
									set = function(v) CCBreaker.db.char.showfrom.player = v end,
								},
								party = {
									type = "toggle",
									name = CCLocale["party"],
									desc = CCLocale["Show break from party members"],
									get = function() return CCBreaker.db.char.showfrom.party end,
									set = function(v) CCBreaker.db.char.showfrom.party = v end,
								},
								raid = {
									type = "toggle",
									name = CCLocale["raid"],
									desc = CCLocale["Show break from raid members"],
									get = function() return CCBreaker.db.char.showfrom.raid end,
									set = function(v) CCBreaker.db.char.showfrom.raid = v end,
								},
								pet = {
									type = "toggle",
									name = CCLocale["pet"],
									desc = CCLocale["Show break from your pet"],
									get = function() return CCBreaker.db.char.showfrom.pet end,
									set = function(v) CCBreaker.db.char.showfrom.pet = v end,
								},
								partypet = {
									type = "toggle",
									name = CCLocale["party pet"],
									desc = CCLocale["Show break from party pets"],
									get = function() return CCBreaker.db.char.showfrom.partypet end,
									set = function(v) CCBreaker.db.char.showfrom.partypet = v end,
								},
								raidpet = {
									type = "toggle",
									name = CCLocale["raid pet"],
									desc = CCLocale["Show break from raid pets"],
									get = function() return CCBreaker.db.char.showfrom.raidpet end,
									set = function(v) CCBreaker.db.char.showfrom.raidpet = v end,
								},
								others = {
									type = "toggle",
									name = CCLocale["others"],
									desc = CCLocale["Show break from others"],
									get = function() return CCBreaker.db.char.showfrom.others end,
									set = function(v) CCBreaker.db.char.showfrom.others = v end,
								},
							},
						},
						class = {
							type = "group",
							name = CCLocale["class"],
							desc = CCLocale["Filter for classes"],
							args = {
								warrior = {
									type = "toggle",
									name = CCLocale["warrior"],
									desc = CCLocale["Show break from warriors"],
									get = function() return CCBreaker.db.char.showfrom.warrior end,
									set = function(v) CCBreaker.db.char.showfrom.warrior = v end,
								},
								warlock = {
									type = "toggle",
									name = CCLocale["warlock"],
									desc = CCLocale["Show break from warlocks"],
									get = function() return CCBreaker.db.char.showfrom.warlock end,
									set = function(v) CCBreaker.db.char.showfrom.warlock = v end,
								},
								hunter = {
									type = "toggle",
									name = CCLocale["hunter"],
									desc = CCLocale["Show break from hunters"],
									get = function() return CCBreaker.db.char.showfrom.hunter end,
									set = function(v) CCBreaker.db.char.showfrom.hunter = v end,
								},
								paladin = {
									type = "toggle",
									name = CCLocale["paladin"],
									desc = CCLocale["Show break from paladins"],
									get = function() return CCBreaker.db.char.showfrom.paladin end,
									set = function(v) CCBreaker.db.char.showfrom.paladin = v end,
								},
								priest = {
									type = "toggle",
									name = CCLocale["priest"],
									desc = CCLocale["Show break from priests"],
									get = function() return CCBreaker.db.char.showfrom.priest end,
									set = function(v) CCBreaker.db.char.showfrom.priest = v end,
								},
								druid = {
									type = "toggle",
									name = CCLocale["druid"],
									desc = CCLocale["Show break from druids"],
									get = function() return CCBreaker.db.char.showfrom.druid end,
									set = function(v) CCBreaker.db.char.showfrom.druid = v end,
								},
								shaman = {
									type = "toggle",
									name = CCLocale["shaman"],
									desc = CCLocale["Show break from shamans"],
									get = function() return CCBreaker.db.char.showfrom.shaman end,
									set = function(v) CCBreaker.db.char.showfrom.shaman = v end,
								},
								mage = {
									type = "toggle",
									name = CCLocale["mage"],
									desc = CCLocale["Show break from mages"],
									get = function() return CCBreaker.db.char.showfrom.mage end,
									set = function(v) CCBreaker.db.char.showfrom.mage = v end,
								},
								rogue = {
									type = "toggle",
									name = CCLocale["rogue"],
									desc = CCLocale["Show break from rogues"],
									get = function() return CCBreaker.db.char.showfrom.rogue end,
									set = function(v) CCBreaker.db.char.showfrom.rogue = v end,
								},
							},
						},  
					}, 
				},
				showeffects = {
					type = "group",
					name = CCLocale["show effects"],
					desc = CCLocale["Report CC breaks of effects"],
					args = {
						freezingtrap = {
							type = "toggle",
							name = GetSpellInfo(3355),
							desc = CCLocale["Show break of "]..GetSpellInfo(3355),
							get = function() return CCBreaker.db.char.showeffects.freezingtrap end,
							set = function(v) CCBreaker.db.char.showeffects.freezingtrap = v end,
						},
						hibernate = {
							type = "toggle",
							name = GetSpellInfo(2637),
							desc = CCLocale["Show break of "], GetSpellInfo(2637),
							get = function() return CCBreaker.db.char.showeffects.hibernate end,
							set = function(v) CCBreaker.db.char.showeffects.hibernate = v end,
						},
						polymorph = {
							type = "toggle",
							name = GetSpellInfo(118),
							desc = CCLocale["Show break of "]..GetSpellInfo(118)..", "
								..GetSpellInfo(28271).." and "
								..GetSpellInfo(28272),
							get = function() return CCBreaker.db.char.showeffects.polymorph end,
							set = function(v) CCBreaker.db.char.showeffects.polymorph = v end,
						},
						sap = {
							type = "toggle",
							name = GetSpellInfo(6770),
							desc = CCLocale["Show break of "]..GetSpellInfo(6770),
							get = function() return CCBreaker.db.char.showeffects.sap end,
							set = function(v) CCBreaker.db.char.showeffects.sap = v end,
						},
						seduction = {
							type = "toggle",
							name = GetSpellInfo(6358),
							desc = CCLocale["Show break of "]..GetSpellInfo(6358),
							get = function() return CCBreaker.db.char.showeffects.seduction end,
							set = function(v) CCBreaker.db.char.showeffects.seduction = v end,
						},
						shackleundead = {
							type = "toggle",
							name = GetSpellInfo(9484),
							desc = CCLocale["Show break of "]..GetSpellInfo(9484),
							get = function() return CCBreaker.db.char.showeffects.shackleundead end,
							set = function(v) CCBreaker.db.char.showeffects.shackleundead = v end,
						},
					}, 
				},
			},
		},
	},
}



--CCBreaker:RegisterChatCommand(CCLocale["Slash-Commands"],CCBreaker.OnMenuRequest)
CCWaterfall:Register("CCBreaker","aceOptions",CCBreaker.OnMenuRequest,"title","CCBreaker Options","treeLevels",3) 


function CCBreak_OpenConfig()
	CCWaterfall:Open("CCBreaker");
end
