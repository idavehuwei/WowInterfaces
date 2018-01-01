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
		padding=5,
		frameColor = {r = 0, g = 0, b = 0, a = .3},
		manaColor = {r = .18, g = .44, b = .75, a = 1},
		energyColor = {r = 1, g = 1, b = 0, a = 1},
		rageColor = {r = 1, g = 0, b = 0, a = 1},
		rpColor = {r = 0, g = 0.82, b = 1, a = 1},
		selectedFrameColor = {r = 1, g = .7, b = 0, a = 1},
		castBarColor = {r = 1, g = 1, b = 0, a = 1},
		manaFontColor = {r = 2.55, g = 2.55, b = 2.55, a = 1},
		healthFontColor = {r = 2.55, g = 2.55, b = 2.55, a = 1},
		castBarFontColor = {r = 2.55, g = 2.55, b = 2.55, a = 1},
		auraFontColor = {r = 0, g = 1, b = 0, a = 1},
		healthFontSize = 12,
		manaFontSize = 10,
		castBarFontSize = 9,
		auraFontSize = 16,
		barTexture = "Minimalist",
		barBottomMargin = 8,
		highlight = true,
		selectedBorder = true,
		manaDefault = false,
		energyDefault = false,
		rageDefualt = false,
		rpDefualt = false,
		locked=false,
		manaText=true,
		manaPercentage=false,
		manaActual=true,
		manaMax=true,
		frameResize=true,
		classText=false,
		raceText=true,
		castBar=true,
		powerBar=true,
		classIcon=true,
		targetIcon=false,
		trinketStatus=true,
		auras=true,
		frameResize=true,
		enemyAnnounce=false,
		trinketUpAnnounce=false,
		trinketUsedAnnounce=false,
		lowHealthAnnounce=false,
		lowHealthPercentage=30,
		growUp=false,
		leftClick="target",
		rightClick="focus",
		middleClick="disabled",
		mouse4="disabled",
		mouse5="disabled",
		leftSpell="",
		rightSpell="",
		middleSpell="",
		mouse4spell="",
		mouse5spell="",
		trinketDisplay="nameIcon",
		bigTrinketScale=1,
		announceType="party"
	}
}

--LSM statusbars
statusbars = {}

for _, name in pairs(LSM:List(LSM.MediaType.STATUSBAR)) do
		statusbars[name] = name
end

local slashHandler = function(option)
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
		self.frame:Hide()
		self:UnregisterAllEvents()
		self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
		self:ClearAllUnits()
		self.currentBracket = nil
		self.frame.testing = false
	else
		self.currentBracket = i
		if (self.frame == nil) then
			self:CreateFrame()
		end
		self:RegisterEvent("PLAYER_TARGET_CHANGED")
		self:RegisterEvent("UNIT_TARGET")
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

function Gladius:SetupOptions()
	local clickValues = {
		["target"] = TARGET,
		["focus"] = L["focus"],
		["spell"] = L["Cast Spell"],
		["disabled"] = ADDON_DISABLED,
	}
	
	local trinketValues = {
		["nameText"] = L["trinketNameText"],
		["nameIcon"] = L["trinketNameIcon"],
		["bigIcon"] = L["trinketBigIcon"],
		["overrideIcon"] = L["trinketOverrideIcon"],
		["smallIcon"] = L["trinketSmallIcon"],
		["gridIcon"] = L["trinketGridIcon"],
	}
	
	local announceValues = {
		["party"] = L["announceParty"],
		["rw"] = L["announceRw"],
		["sct"] = L["announceSct"],
		["msbt"] = L["announceMsbt"],
		["fct"] = L["announceFct"],
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
					auras = {
						type="toggle",
						name=L["Show auras"],
						desc=L["Show important auras over the class icon with a timer. You can select which auras to show and their respective priorites in the auralist.lua file"],
						disabled = function() return not self.db.profile.classIcon end,						
						order=96,
					},
					announcements = {
						type="group",
						name=L["Announcements"],
						order=1,
						desc=L["Set options for different announcements"],
						args = {
							announceType = {
								type = "select",
								name = L["announceType"],
								desc = L["announceTypeDesc"],
								values=announceValues,
								order=5,
							},
							enemyAnnounce = {
								type="toggle",
								name=L["enemyAnnounce"],
								desc=L["enemyAnnounceDesc"],
								order=10,
							},
							trinketUsedAnnounce = {
								type="toggle",
								name=L["trinketUsedAnnounce"],
								desc=L["trinketUsedAnnounceDesc"],
								order=20,
							},
							trinketUpAnnounce = {
								type="toggle",
								name=L["trinketUpAnnounce"],
								desc=L["trinketUpAnnounceDesc"],
								order=30,
							},
							lowHealthAnnounce = {
								type="toggle",
								name=L["lowHealthAnnounce"],
								desc=L["lowHealthAnnounceDesc"],
								order=40,
							},
							lowHealthPercentage = {
								type="range",
								name=L["lowHealthPercentage"],
								desc=L["lowHealthPercentageDesc"],
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
								name=L["Trinket"],
								desc=L["TrinketDesc"],
								order=10,
							},
							trinketDisplay = {
								type = "select",
								name = L["TrinketDisplay"],
								desc = L["TrinketDisplayDesc"],
								values=trinketValues,
								disabled = function() return not self.db.profile.trinketStatus end,
								order=20,
							},
							bigTrinketScale = {
								type="range",
								name=L["Big icon scale"],
								desc=L["BigIconScaleDesc"],
								min=.1,
								max=2,
								step=.1,
								disabled = function() return not self.db.profile.trinketStatus or self.db.profile.trinketDisplay ~= "bigIcon" end,						
								order=30,
							},
						},
					},
					clicks = {
						type="group",
						name=L["Clicks"],
						order=3,
						desc=L["Set options for mouse clicks on the arena targets"],
						args = {
							leftClick = {
								type = "select",
								name = L["Left Click"],
								desc = L["Left Click"],
								values=clickValues,
								order=1,
							},
							leftSpell = {
								type = "input",
								name = L["Spell Name"],
								desc = L["Spell Name"],
								disabled = function() return self.db.profile.leftClick ~= "spell" end,
								order=2,
							},
							rightClick = {
								type = "select",
								name = L["Right Click"],
								desc = L["Right Click"],
								values=clickValues,
								order=3,
							},
							rightSpell = {
								type = "input",
								name = L["Spell Name"],
								desc = L["Spell Name"],
								get=getOption,
								set=setOption,
								disabled = function() return self.db.profile.rightClick ~= "spell" end,
								order=4,
							},
							middleClick = {
								type = "select",
								name = L["Middle Mouse Click"],
								desc = L["Middle Mouse Click"],
								values=clickValues,
								order=5,
							},
							middleSpell = {
								type = "input",
								name = L["Spell Name"],
								desc = L["Spell Name"],
								disabled = function() return self.db.profile.middleClick ~= "spell" end,
								order=6,
							},
							mouse4 = {
								type = "select",
								name = L["Mouse 4 Click"],
								desc = L["Mouse 4 Click"],
								values=clickValues,
								order=7,
							},
							mouse4spell = {
								type = "input",
								name = L["Spell Name"],
								desc = L["Spell Name"],
								disabled = function() return self.db.profile.mouse4 ~= "spell" end,
								order=8,
							},
							mouse5 = {
								type = "select",
								name = L["Mouse 5 Click"],
								desc = L["Mouse 5 Click"],
								values=clickValues,
								order=9,
							},
							mouse5spell = {
								type = "input",
								name = L["Spell Name"],
								desc = L["Spell Name"],
								disabled = function() return self.db.profile.mouse5 ~= "spell" end,
								order=10,
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
				desc=L["TextDesc"],
				order=3,
				args = {
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
					sizes = {
						type="group",
						name=L["Sizes"],
						desc=L["SizesDesc"],
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
	
	self.options.plugins.profiles = { profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db) }
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Gladius", self.options)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Gladius", "Gladius")
	self:RegisterChatCommand("gladius", slashHandler)
	
end

function Gladius:ShowOptions()
  InterfaceOptionsFrame_OpenToCategory("Gladius")
end
