local Gladius = Gladius
local self = Gladius
local LSM = LibStub("LibSharedMedia-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Gladius", true)
LSM:Register("statusbar", "Minimalist", "Interface\\Addons\\Gladius\\images\\Minimalist")

local defaults = {
	profile = {
	    x=0,
		y=0,
		frameScale = 1,
		barWidth=150,
		barHeight=25,
		manaBarHeight=15,
		castBarHeight=12,
		petBarHeight=15,
		petBarWidth=150,
		padding=5,
		frameColor = {r = 0, g = 0, b = 0, a = .3},
		manaColor = {r = .18, g = .44, b = .75, a = 1},
		energyColor = {r = 1, g = 1, b = 0, a = 1},
		rageColor = {r = 1, g = 0, b = 0, a = 1},
		rpColor = {r = 0, g = 0.82, b = 1, a = 1},
		selectedFrameColor = {r = 1, g = .7, b = 0, a = 1},
		focusBorderColor = {r = 1, g = 0, b = 0, a = 1},
		castBarColor = {r = 1, g = 1, b = 0, a = 1},
		manaFontColor = {r = 2.55, g = 2.55, b = 2.55, a = 1},
		healthFontColor = {r = 2.55, g = 2.55, b = 2.55, a = 1},
		castBarFontColor = {r = 2.55, g = 2.55, b = 2.55, a = 1},
		petBarFontColor = {r = 2.55, g = 2.55, b = 2.55, a = 1},
		auraFontColor = {r = 0, g = 1, b = 0, a = 1},
		healthColor = {r = 0.20, g = 0.90, b = 0.20, a = 1},
		healthFontSize = 11,
		manaFontSize = 10,
		castBarFontSize = 9,
		petFontSize = 9,
		auraFontSize = 16,
		barTexture = "Minimalist",
		barBottomMargin = 8,
		highlight = true,
		selectedBorder = true,
		focusBorder = true,
		manaDefault = false,
		energyDefault = false,
		rageDefualt = false,
		rpDefualt = false,
		locked=false,
		manaText=true,
		manaPercentage=false,
		manaActual=true,
		manaMax=true,
		healthPercentage=true,
		healthActual=false,
		healthMax=false,
		shortHpMana=true,
		frameResize=true,
		classText=false,
		raceText=true,
		castBar=true,
		powerBar=true,
		classIcon=true,
		targetIcon=false,
		trinketStatus=true,
		prodSpecial=false,
		displayAuras=true,
		frameResize=true,
		enemyAnnounce=false,
		trinketUpAnnounce=false,
		trinketUsedAnnounce=false,
		lowHealthAnnounce=false,
		lowHealthPercentage=30,
		drinkAnnounce=false,
		growUp=false,
		cliqueSupport=false,
		showPets=false,
		showPetType=true,
		showPetHealth=true,
		trinketDisplay="nameIcon",
		bigTrinketScale=1,
		announceType="party",
		attributes = {
			{ name = "Target", button = "1", modifier = "", action = "target", spell = ""},
			{ name = "Focus", button = "2", modifier = "", action = "focus", spell = ""},
		},
		auras = {},
	}
}

-- insert the auralist to the defaults
for k, v in pairs(Gladius:GetAuraList()) do
	table.insert(defaults.profile.auras, { name = k, priority = v, deleted = false })
end

-- setup  the default attributes 3-10
for i=3, 10 do
	table.insert(defaults.profile.attributes, {name = string.format(L["Action #%d"], i), modifier = "", button = "", action = "disabled", spell = ""})
end

--LSM statusbars
local statusbars = {}

for _, name in pairs(LSM:List(LSM.MediaType.STATUSBAR)) do
	statusbars[name] = name
end
function GladiusslashHandler(option)
	if option == "ui" or option == "config" or option == "options" then
		Gladius:ShowOptions()
	elseif option == "test1" then
		self:ToggleFrame(1)
	elseif option == "test2" then
		self:ToggleFrame(2)
	elseif option == "test3" then
		self:ToggleFrame(3)
	elseif option == "test4" then
		self:ToggleFrame(4)
	elseif option == "test5" or option == "test" then
		self:ToggleFrame(5)
	elseif option == "hide" then
		self:HideFrame()
	elseif option == "trinket" then
		Gladius:TrinketUsed("arena1")
	else
		self:Print("Valid slash commands:")
		self:Print("/gladius ui")
		self:Print("/gladius test1-5")	
		self:Print("/gladius hide")
	end
end
local function slashHandler(option)
	if option == "ui" or option == "config" or option == "options" then
		Gladius:ShowOptions()
	elseif option == "test1" then
		self:ToggleFrame(1)
	elseif option == "test2" then
		self:ToggleFrame(2)
	elseif option == "test3" then
		self:ToggleFrame(3)
	elseif option == "test4" then
		self:ToggleFrame(4)
	elseif option == "test5" or option == "test" then
		self:ToggleFrame(5)
	elseif option == "hide" then
		self:HideFrame()
	elseif option == "trinket" then
		Gladius:TrinketUsed("arena1")
	else
		self:Print("Valid slash commands:")
		self:Print("/gladius ui")
		self:Print("/gladius test1-5")	
		self:Print("/gladius hide")
	end
end

function Gladius:ToggleFrame(i)
	self:ClearAllUnits()
	if (self.frame and self.frame:IsShown() and i == self.currentBracket) then
		self:UnregisterAllEvents()
		self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
		self.frame:Hide()
		self.frame.testing = false
	else
		self.currentBracket = i
		if ( not self.frame ) then
			self:CreateFrame()
		end
		self:RegisterEvent("PLAYER_TARGET_CHANGED")
		self:RegisterEvent("PLAYER_FOCUS_CHANGED")
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self:RegisterEvent("UNIT_PET")
		self:RegisterEvent("UNIT_NAME_UPDATE")
		self.frame:Show()
		self.frame.testing = true
		self:Test()
		self:UpdateFrame()
		Gladius:UpdateBindings()
	end
end

function Gladius:HideFrame()
	if ( self.frame ) then
		self.frame:Hide()
		self.frame.testing = false
	end
	self:UnregisterAllEvents()
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
	self.currentBracket = nil
end

-- General Get/Set etc
local function getOption(info)
  return (info.arg and Gladius.db.profile[info.arg] or Gladius.db.profile[info[#info]])
end

local function setOption(info, value)
  local key = info.arg or info[#info]
  Gladius.db.profile[key] = value
  Gladius:UpdateFrame()
end

local function getColorOption(info)
  local key = info.arg or info[#info]
  return Gladius.db.profile[key].r, Gladius.db.profile[key].g, Gladius.db.profile[key].b, Gladius.db.profile[key].a
end

local function setColorOption(info, r, g, b, a)
  local key = info.arg or info[#info]
  Gladius.db.profile[key].r, Gladius.db.profile[key].g, Gladius.db.profile[key].b, Gladius.db.profile[key].a = r, g, b, a
  Gladius:UpdateFrame()
end

function Gladius:getDefaults()
	return defaults
end

-- Get/set for auras
local function setAura(info, value)
	Gladius.db.profile.auras[tonumber(info[#(info) - 1])][info[(#info)]] = value

	if ( info[#(info)] == "name" ) then
		self.options.args.auras.args.list.args[info[#(info) - 1]].name = value 
	end

	Gladius:ConvertAuraList()
	Gladius:UpdateFrame()
end

local function getAura(info)
	return Gladius.db.profile.auras[tonumber(info[#(info) - 1])][info[(#info)]]
end

-- Get/set for attributes, credits to Shadowed (SSAF)
local function setAttribute(info, value)
	Gladius.db.profile.attributes[tonumber(info[#(info) - 1])][info[(#info)]] = value

	if ( info[#(info)] == "name" ) then 
		self.options.args.clicks.args[info[#(info) - 1]].name = value 
	end

	Gladius:UpdateFrame()
end

local function getAttribute(info)
	return Gladius.db.profile.attributes[tonumber(info[#(info) - 1])][info[(#info)]]
end

-- Value tables for attributes
local modifiers = {[""] = L["None"], ["ctrl-"] = L["CTRL"], ["shift-"] = L["SHIFT"], ["alt-"] = L["ALT"]}
local buttons = {["1"] = L["Left button"], ["2"] = L["Right button"], ["3"] = L["Middle button"], ["4"] = L["Button 4"], ["5"] = L["Button 5"]}
local clickValues = {["macro"] = MACRO, ["target"] = TARGET, ["focus"] = FOCUS, ["spell"] = L["Cast Spell"], ["disabled"] = ADDON_DISABLED}

-- Setup an attribute in the options
local function SetupAttributeOption(number)
	local attribute = {
		order = number,
		type = "group",
		name = self.db.profile.attributes[number].name,
		desc = self.db.profile.attributes[number].name,
		get = getAttribute,
		set = setAttribute,
		args = {
			name = {
				type = "input",
				name = L["Name"],
				desc = L["Select the name of the click option"],
				order=1,
			},
			button = {
				type = "select",
				name = L["Button"],
				desc = L["Select which mouse button to use"],
				values=buttons,
				order=2,
			},
			modifier = {
				type = "select",
				name = L["Modifier"],
				desc = L["Select which modifier to use"],
				values = modifiers,
				order=3,
			},
			action = {
				type = "select",
				name = L["Action"],
				desc = L["Select what action this mouse button does"],
				values=clickValues,
				order=4,
			},
			spell = {
				type = "input",
				multiline = true,
				name = L["Spell name / Macro text"],
				desc = L["Spell name / Macro text"],
				disabled = function() return Gladius.db.profile.attributes[number].action ~= "spell" and Gladius.db.profile.attributes[number].action ~= "macro" end,
				order=5,
			},
		},
	}
	
	return attribute
end

local function SetupAuraOption(number)
	local aura = {
		type = "group",
		name = self.db.profile.auras[number].name,
		desc = self.db.profile.auras[number].name,
		get = getAura,
		set = setAura,
		args = {
			name = {
				type = "input",
				name = L["Name"],
				desc = L["Name of the aura"],
				order=1,
			},
			priority = {
				type= "range",
				name = L["Priority"],
				desc = L["Select what priority the aura should have - higher equals more priority"],
				min=1,
				max=5,
				step=1,
				order=2,
			},
			delete = {
				type = "execute",
				name = L["Delete"],
				func = function(info)
				
					local defaultAuras = Gladius:GetAuraList()
					local name = self.db.profile.auras[tonumber(info[#(info) - 1])].name
					
					-- check if it's a default aura, thus it can't really get deleted and it'll just set the deleted variable to true instead
					if ( defaultAuras[name] ) then
						self.db.profile.auras[tonumber(info[#(info) - 1])].deleted = true
					else
						table.remove(self.db.profile.auras, tonumber(info[#(info) - 1]))
					end
					
					self.options.args.auras.args.list.args = {}
					for i=#(self.db.profile.auras), 1, -1 do
						if ( not self.db.profile.auras[i].deleted ) then
							self.options.args.auras.args.list.args[tostring(i)] = SetupAuraOption(i)
						end
					end
					
					Gladius:ConvertAuraList()
				end,
			},
		},
	}
	return aura
end

function Gladius:SetupOptions()

	local newAuraPrio = 3
	local newAuraName = "Aura name"
	
	local trinketValues = {
		["nameText"] = L["Name text"],
		["nameIcon"] = L["Name icon"],
		["bigIcon"] = L["Big icon"],
		["overrideIcon"] = L["Override class/aura icon"],
		["smallIcon"] = L["Small icon"],
		["gridIcon"] = L["Grid-style icon"],
	}
	
	local announceValues = {
		["party"] = L["Party"],
		["rw"] = L["Raid Warning"],
		["sct"] = L["Scrolling Combat Text"],
		["msbt"] = L["MikScrollingBattleText"],
		["fct"] = L["Blizzard's Floating Combat Text"],
	}
	
	self.options = {
		type = "group",
		name = "Gladius",
		plugins = {},
		get=getOption,
		set=setOption,
		args = {
			general = {
				type="group",
				name=L["General"],
				desc=L["General settings"],
				order=1,
				args = {
					locked = {
					type="toggle",
					name=L["Lock frame"],
					desc=L["Toggle if the frame can be moved"],
					order=5,
					},
					growUp = {
						type="toggle",
						name=L["Grow frame upwards"],
						desc=L["If this is toggled the frame will grow upwards instead of downwards."],
						order=7,
					},
					frameResize = {
						type="toggle",
						name=L["Frame resize"],
						desc=L["If this is enabled the frame will automaticly get resized to the appropriate size every time you enter an arena"],
						order=10,
					},
					frameScale = {
						type="range",
						name=L["Frame scale"],
						desc=L["Scale of the frame"],
						min=.1,
						max=2,
						step=.1,
						order=20,
					},
					padding = {
						type="range",
						name=L["Frame padding"],
						desc=L["Padding of the frame"],
						min=0,
						max=20,
						step=1,
						order=30,
					},
					frameColor = {
						type="color",
						name=L["Frame color"],
						desc=L["Color of the frame"],
						hasAlpha=true,
						order=35,
						get=getColorOption,
						set=setColorOption,
					},			
					highlight = {
						type="toggle",
						name=L["Highlight target"],
						desc=L["Toggle if the selected target should be highlighted"],
						order=80,
					},
					selectedBorder = {
						type="toggle",
						name=L["Show border around target"],
						desc=L["Toggle if a border should be shown around the selected target"],
						order=90,
					},
					focusBorder = {
						type="toggle",
						name=L["Show border around focus"],
						desc=L["Toggle if a border should be shown around your current focus"],
						order=91,
					},
					classIcon = {
						type="toggle",
						name=L["Show class icon"],
						desc=L["Show class icon\nIMPORTANT:\nToggling this off will disable showing auras even if it is enabled"],
						order=95,
					},
					targetIcon = {
						type="toggle",
						name=L["Show target icon"],
						desc=L["Show target icon"],
						order=97,
					},
					displayAuras = {
						type="toggle",
						name=L["Show auras"],
						desc=L["Show important auras over the class icon with a timer. You can select which auras to show and their respective priorites in the auralist.lua file"],
						disabled = function() return not self.db.profile.classIcon end,						
						order=96,
					},
					cliqueSupport = {
						type="toggle",
						name=L["Clique support"],
						desc=L["Toggles the Clique support, requires UI reload to take effect"],					
						order=100,
					},
					announcements = {
						type="group",
						name=L["Announcements"],
						order=1,
						desc=L["Set options for different announcements"],
						args = {
							announceType = {
								type = "select",
								name = L["Announcement type"],
								desc = L["Where to display the announcement messages"],
								values=announceValues,
								order=5,
							},
							enemyAnnounce = {
								type="toggle",
								name=L["New enemies"],
								desc=L["Announce new enemies found"],
								order=10,
							},
							drinkAnnounce = {
								type="toggle",
								name=L["Drinking"],
								desc=L["Announces enemies that start to drink"],
								order=11,
							},
							trinketUsedAnnounce = {
								type="toggle",
								name=L["Trinket used"],
								desc=L["Announce when an enemy's trinket is used"],
								order=20,
							},
							trinketUpAnnounce = {
								type="toggle",
								name=L["Trinket ready"],
								desc=L["Announce when an enemy's trinket is ready again"],
								order=30,
							},
							lowHealthAnnounce = {
								type="toggle",
								name=L["Enemies on low health"],
								desc=L["Announce enemies that go below a certain percentage of health"],
								order=40,
							},
							lowHealthPercentage = {
								type="range",
								name=L["Low health percentage"],
								desc=L["The percentage when enemies are counted as having low health"],
								min=1,
								max=100,
								step=1,
								disabled = function() return not self.db.profile.lowHealthAnnounce end,						
								order=50,
							},							
						},
					},
					trinket = {
						type="group",
						order=2,
						name=L["Trinket display"],
						desc=L["Set options for the trinket status display"],
						args = {
							trinketStatus = {
								type="toggle",
								name=L["Show PvP trinket status"],
								desc=L["Show PvP trinket status to the right of the enemy name"],
								order=10,
							},
							trinketDisplay = {
								type = "select",
								name = L["Trinket display"],
								desc = L["Choose how to display the trinket status"],
								values=trinketValues,
								disabled = function() return not self.db.profile.trinketStatus end,
								order=20,
							},
							bigTrinketScale = {
								type="range",
								name=L["Big icon scale"],
								desc=L["The scale of the big trinket icon"],
								min=.1,
								max=2,
								step=.1,
								disabled = function() return not self.db.profile.trinketStatus or self.db.profile.trinketDisplay ~= "bigIcon" end,						
								order=30,
							},
						},
					},
				},
			},
			bars = {
				type="group",
				name=L["Bars"],
				desc=L["Bar settings"],
				order=2,
				args = {
					showPets = {
						type="toggle",
						name=L["Show pet bars"],
						desc=L["Show pet bars"],
						order=5,
					},
					castBar = {
						type="toggle",
						name=L["Show cast bars"],
						desc=L["Show cast bars"],
						order=10,
					},
					powerBar = {
						type="toggle",
						name=L["Show power bars"],
						desc=L["Show power bars"],
						order=20,
					},
					barsizes = {
						type="group",
						name=L["Size and margin"],
						desc=L["Size and margin settings"],
						order=1,
						args = {
							barWidth = {
								type="range",
								name=L["Bar width"],
								desc=L["Width of the health and power bars"],
								min=100,
								max=500,
								step=5,
								order=2,
								},
							barHeight = {
								type="range",
								name=L["Health bar height"],
								desc=L["Height of the health bars"],
								min=10,
								max=50,
								step=1,
								order=3,
							},
							petBarWidth = {
								type="range",
								name=L["Pet bar width"],
								desc=L["Width of the pet bars"],
								disabled = function() return not self.db.profile.showPets end,
								min=50,
								max=500,
								step=1,
								order=4,
							},
							petBarHeight = {
								type="range",
								name=L["Pet bar height"],
								desc=L["Height of the pet bars"],
								disabled = function() return not self.db.profile.showPets end,
								min=10,
								max=50,
								step=1,
								order=4,
							},
							manaBarHeight = {
								type="range",
								name=L["Power bar height"],
								desc=L["Height of the power bars"],
								disabled = function() return not self.db.profile.powerBar end,
								min=10,
								max=50,
								step=1,
								order=4,
							},
							castBarHeight = {
								type="range",
								name=L["Cast bar height"],
								desc=L["Height of the cast bars"],
								disabled = function() return not self.db.profile.castBar end,
								min=10,
								max=50,
								step=1,
								order=5,
							},
							barBottomMargin = {
								type="range",
								name=L["Bar bottom margin"],
								desc=L["Margin to the next bar"],
								min=0,
								max=30,
								step=1,
								order=6,
							},
						},
					},
					colors = {
						type="group",
						name=L["Colors"],
						desc=L["Color settings"],
						order=2,
						args = {
							barTexture = {
								type="select",
								name=L["Bar texture"],
								dialogControl = "LSM30_Statusbar",
								values = statusbars,
								get=function(info)
										return statusbars[Gladius.db.profile.barTexture]
									end,
								set=function(info, v)
										Gladius.db.profile.barTexture = statusbars[v]
										self:UpdateFrame()
									end,
								order=1
							},
							selectedFrameColor = {
								type="color",
								name=L["Selected border color"],
								desc=L["Color of the selected targets border"],
								disabled = function() return not self.db.profile.selectedBorder end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=0,
							},
							focusBorderColor = {
								type="color",
								name=L["Focus border color"],
								desc=L["Color of the focus border"],
								disabled = function() return not self.db.profile.focusBorder end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=1,
							},
							healthColor = {
								type="color",
								name=L["Pet bar color"],
								desc=L["Color of the pet bar"],
								disabled = function() return not self.db.profile.showPets end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=2,
							},
							manaColor = {
								type="color",
								name=L["Mana color"],
								desc=L["Color of the mana bar"],
								disabled = function() return not self.db.profile.powerBar or self.db.profile.manaDefault end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=3,
							},
							manaDefault = {
								type="toggle",
								name=L["Game default"],
								desc=L["Use game default mana color"],
								order=4,
							},
							energyColor = {
								type="color",
								name=L["Energy color"],
								desc=L["Color of the energy bar"],
								disabled = function() return not self.db.profile.powerBar or self.db.profile.energyDefault end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=5,
							},
							energyDefault = {
								type="toggle",
								name=L["Game default"],
								desc=L["Use game default energy color"],
								order=6,
							},
							rageColor = {
								type="color",
								name=L["Rage color"],
								desc=L["Color of the rage bar"],
								disabled = function() return not self.db.profile.powerBar or self.db.profile.rageDefault end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=7,
							},
							rageDefault = {
								type="toggle",
								name=L["Game default"],
								desc=L["Use game default rage color"],
								order=8,
							},
							rpColor = {
								type="color",
								name=L["Runic Power color"],
								desc=L["Color of the runic power bar"],
								disabled = function() return not self.db.profile.powerBar or self.db.profile.rpDefault end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=10,
							},
							rpDefault = {
								type="toggle",
								name=L["Game default"],
								desc=L["Use game default runic power color"],
								order=11,
							},
							castBarColor = {
								type="color",
								name=L["Cast bar color"],
								desc=L["Color of the cast bar"],
								disabled = function() return not self.db.profile.castBar end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=20,
							},
						},
					},
				},
			},
			text = {
				type="group",
				name=L["Text"],
				desc=L["Text settings"],
				order=3,
				args = {
					shortHpMana = {
						type="toggle",
						name=L["Shorten Health/Power text"],
						desc=L["Shorten the formatting of the health and power text to e.g. 20.0/25.3 when the amount is over 9999"],
						order=5,
					},
					healthPercentage = {
						type="toggle",
						name=L["Show health percentage"],
						desc=L["Show health percentage on the health bar"],
						order=10,
					},
					healthActual = {
						type="toggle",
						name=L["Show the actual health"],
						desc=L["Show the actual health on the health bar"],
						order=15,
					},
					healthMax = {
						type="toggle",
						name=L["Show max health"],
						desc=L["Show maximum health on the health bar"],
						order=20,
					},					
					manaText = {
						type="toggle",
						name=L["Show power text"],
						desc=L["Show mana/energy/rage text on the power bar"],
						disabled = function() return not self.db.profile.powerBar end,
						order=55,
					},
					manaPercentage = {
						type="toggle",
						name=L["Show power percentage"],
						desc=L["Show mana/energy/rage percentage on the power bar"],
						disabled = function() return not self.db.profile.powerBar or not self.db.profile.manaText end,
						order=60,
					},
					manaActual = {
						type="toggle",
						name=L["Show the actual power"],
						desc=L["Show the actual mana/energy/rage on the power bar"],
						disabled = function() return not self.db.profile.powerBar or not self.db.profile.manaText end,
						order=63,
					},
					manaMax = {
						type="toggle",
						name=L["Show max power"],
						desc=L["Show maximum mana/energy/rage on the power bar"],
						disabled = function() return not self.db.profile.powerBar or not self.db.profile.manaText end,
						order=66,
					},
					classText = {
						type="toggle",
						name=L["Show class text"],
						desc=L["Show class text on the power bar"],
						disabled = function() return not self.db.profile.powerBar end,
						order=70,
					},
					raceText = {
						type="toggle",
						name=L["Show race text"],
						desc=L["Show race text on the power bar"],
						disabled = function() return not self.db.profile.powerBar end,
						order=75,
					},
					showPetType = {
						type="toggle",
						name=L["Show pet type text"],
						desc=L["Show pet type on the pet bar"],
						disabled = function() return not self.db.profile.showPets end,
						order=80,
					},
					showPetHealth = {
						type="toggle",
						name=L["Show pet health text"],
						desc=L["Show pet health on the pet bar (formatted the same as the ordinary health text)"],
						disabled = function() return not self.db.profile.showPets end,
						order=85,
					},	
					sizes = {
						type="group",
						name=L["Sizes"],
						desc=L["Size settings for the text"],
						order=1,
						args = {
							healthFontSize = {
								type="range",
								name=L["Health text size"],
								desc=L["Size of the health bar text"],
								min=1,
								max=20,
								step=1,
								order=1,
							},
							manaFontSize = {
								type="range",
								name=L["Mana text size"],
								desc=L["Size of the mana bar text"],
								disabled = function() return not self.db.profile.powerBar end,
								min=1,
								max=20,
								step=1,
								order=3,
							},						
							castBarFontSize = {
								type="range",
								name=L["Cast bar text size"],
								desc=L["Size of the cast bar text"],
								disabled = function() return not self.db.profile.castBar end,
								min=1,
								max=20,
								step=1,
								order=5,
							},
							petFontSize = {
								type="range",
								name=L["Pet bar text size"],
								desc=L["Size of the pet bar text"],
								min=1,
								max=20,
								step=1,
								order=6,
							},
							auraFontSize = {
								type="range",
								name=L["Aura text size"],
								desc=L["Size of the aura text"],
								disabled = function() return not self.db.profile.auras end,
								min=1,
								max=20,
								step=1,
								order=10,
							},
						},
					},
					colors = {
						type="group",
						name=L["Colors"],
						desc=L["Color settings"],
						order=2,
						args = {
							healthFontColor = {
								type="color",
								name=L["Health text color"],
								desc=L["Color of the health bar text"],
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=2,
							},
							manaFontColor = {
								type="color",
								name=L["Mana text color"],
								desc=L["Color of the mana bar text"],
								disabled = function() return not self.db.profile.powerBar end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=4,
							},
							castBarFontColor = {
								type="color",
								name=L["Cast bar text color"],
								desc=L["Color of the cast bar text"],
								disabled = function() return not self.db.profile.castBar end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=6,
							},
							petBarFontColor = {
								type="color",
								name=L["Pet bar text color"],
								desc=L["Color of the text on the pet bar"],
								disabled = function() return not self.db.profile.showPets end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=7,
							},
							auraFontColor = {
								type="color",
								name=L["Aura text color"],
								desc=L["Color of the aura text"],
								disabled = function() return not self.db.profile.auras end,
								get=getColorOption,
								set=setColorOption,
								hasAlpha=true,
								order=10,
							},												
						},
					},
				},
			},
		}
	}
	
	self.options.args.auras = {
		type = "group",
		order = 9,
		name = L["Auras"],
		args = {
			new = {
				type = "group",
				name = L["Add new aura"],
				args = {
					name = {
						type = "input",
						name = L["Name"],
						desc = L["Name of the aura"],
						get = function() return newAuraName end,
						set = function(info, value) newAuraName = value end,
						order=2,
					},
					priority = {
						type= "range",
						name = L["Priority"],
						desc = L["Select what priority the aura should have - higher equals more priority"],
						min=1,
						max=5,
						step=1,
						get = function() return newAuraPrio end,
						set = function(info, value) newAuraPrio = value end,
						order=3,
					},
					Add = {
						type = "execute",
						name = L["Add"],
						order = 4,
						func = function()
							if ( newAuraName ~= "") then
								table.insert(self.db.profile.auras, { name = newAuraName, priority = newAuraPrio })
								newAuraName = ""
								self.options.args.auras.args.list.args = {}
								for i=#(self.db.profile.auras), 1, -1 do
									if ( not self.db.profile.auras[i].deleted ) then
										self.options.args.auras.args.list.args[tostring(i)] = SetupAuraOption(i)
									end
								end
								Gladius:ConvertAuraList()
							end
						end,
					},
				},
			},
			list = {
				type = "group",
				name = L["Aura list"],
				args = {},
			},
		},
	}
	
	
	-- fix for aura variable that i managed to fuck up in r20
	if ( type(self.db.profile.auras) == "boolean" ) then
		self.db.profile.displayAuras = self.db.profile.auras
		self.db.profile.auras = defaults.profile.auras
	end
	
	for i=#(self.db.profile.auras), 1, -1 do
		if ( not self.db.profile.auras[i].deleted ) then
			self.options.args.auras.args.list.args[tostring(i)] = SetupAuraOption(i)
		end
	end
	
	Gladius:ConvertAuraList()
	
	self.options.args.clicks = {
		type = "group",
		order = 10,
		name = L["Click actions"],
		args = {},
	}
	
	for i=1, 10 do
		self.options.args.clicks.args[tostring(i)] = SetupAttributeOption(i)
	end
	
	self.options.plugins.profiles = { profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) }
	LibStub("AceConfig-3.0"):RegisterOptionsTable(L["Gladius"], self.options)
	--LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Gladius", "Gladius")
	self:RegisterChatCommand("gladius", slashHandler)
	
end

function Gladius:ShowOptions()
	LibStub("AceConfigDialog-3.0"):Open(L["Gladius"]);
  --InterfaceOptionsFrame_OpenToCategory("Gladius")
end
