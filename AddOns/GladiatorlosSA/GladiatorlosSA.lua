GladiatorlosSA = LibStub("AceAddon-3.0"):NewAddon("GladiatorlosSA", "AceEvent-3.0","AceConsole-3.0","AceTimer-3.0")
GladiatorlosSA._DEBUG = false;
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local self , GladiatorlosSA = GladiatorlosSA , GladiatorlosSA
local GSA_TEXT="GladiatorlosSA"
local GSA_VERSION= " r335.01"
local GSA_AUTHOR=" updated by superk"
local gsadb
local PlaySoundFile = PlaySoundFile
local dbDefaults = {
	profile = {
		all = false,
		arena = true,
		battleground = false,
		field = false,
		
		aruaApplied = false,
		aruaRemoved = false,
		castStart = false,
		castSuccess = false,
		interrupt = false,
		
		onlyTarget = false,
		class = false,
		shadowmeld = true,
		trinket = true,

		thorns = true,
		survivalInstincts = true,
		innervate = true,
		barkskin = true,
		naturesSwiftness = true,
		naturesGrasp = true,
		frenziedRegeneration = true,
		enrage = false,
		desh = false,

		auraMastery = true,
		handOfProtection = true,
		handOfFreedom = true,
		divineShield = true,
		sacrifice = true,
		divineGuardian = true,
		divinePlea = true,

		shadowDance = true,
		sprint = true,
		cloakOfShadows = true,
		adrenalineRush = true,
		evasion = true,
		vanish = true,

		deathWish = true,
		enragedRegeneration = true,
		shieldWall = true,
		berserkerRage = true,
		retaliation = true,
		spellReflection = true,
		sweepingStrikes = true,
		bladestorm = true,

		painSuppression = true,
		powerInfusion = true,
		fearWard = true,
		dispersion = true,

		waterShield = false,
		shamanisticRage = true,
		earthShield = true,
		naturesSwiftness2 = true,

		iceBlock = true,
		arcanePower = true,
		invisibility = true,

		iceboundFortitude = true,
		lichborne = true,
		vampiricBlood = true,

		theBeastWithin = true,
		deterrence = true,
		feignDeath = true,
		
		protectionDown = true,
		bubbleDown = true,
		cloakDown = true,
		evasionDown = true,
		PSDown = true,
		dispersionDown = true,
		iceBlockDown = true,
		lichborneDown = false,
		iceboundFortitudeDown = false,
		
		onlySelf = false,

		bigHeal = true,
		resurrection = true,

		hibernate = true,
		cyclone = true,

		manaBurn = true,
		shackleUndead = true,
		mindControl = true,

		hex = true,

		polymorph = true,

		revivePet = true,
		scareBeast = true,

		fear = true,
		fear2 = true,
		banish = true,


		skullBash = false,

		rebuke = false,
		repentance = true,

		disarm2 = true,
		blind = true,
		kick = true,
		preparation = true,

		disarm = true,
		fear3 = true,
		pummel = true,
		shieldBash = true,

		fear4 = true,
		shadowFiend = true,
		disarm3 = true,

		grounding = true,
		manaTide = true,
		tremorTotem = true,

		coldSnap = true,
		deepFreeze = true,
		counterspell = true,

		mindFreeze = true,
		strangulate = true,
		runeWeapon = true,
		gargoyle = true,
		hungeringCold = true,

		wyvernSting = true,

		fear2 = true,
		spellLock = true,
		demonicCircleTeleport = true,

		lockout = true,
			
	}	
}
function GladiatorlosSA:OnInitialize()
	self.db1 = LibStub("AceDB-3.0"):New("GladiatorlosSADB",dbDefaults, "Default");
	--DEFAULT_CHAT_FRAME:AddMessage(GSA_TEXT .. GSA_VERSION .. GSA_AUTHOR .."  - /gsa ");
	--LibStub("AceConfig-3.0"):RegisterOptionsTable("GladiatorlosSA", GladiatorlosSA.Options, {"GladiatorlosSA", "SS"})
	self:RegisterChatCommand("GladiatorlosSA", "ShowConfig")
	self:RegisterChatCommand("gsa", "ShowConfig")
	self.db1.RegisterCallback(self, "OnProfileChanged", "ChangeProfile")
	self.db1.RegisterCallback(self, "OnProfileCopied", "ChangeProfile")
	self.db1.RegisterCallback(self, "OnProfileReset", "ChangeProfile")
	gsadb = self.db1.profile
	
	GladiatorlosSA.options = {
		name = "GladiatorlosSA",
		desc = "PVP技能语音提示",
		type = 'group',
		icon = 'Interface\\Icons\\Spell_Nature_ForceOfNature',
		args = {},
	}

	-- create fire alert frame
	self.AlertFrame = CreateFrame("MessageFrame", nil,UIParent);	
	self.AlertFrame:SetWidth(UIParent:GetWidth());
	self.AlertFrame:SetHeight(32);
	self.AlertFrame:SetInsertMode("TOP");
	self.AlertFrame:SetFrameStrata("HIGH");
	self.AlertFrame:SetTimeVisible(1.5);
	self.AlertFrame:SetFadeDuration(1);
	self.AlertFrame:SetFont("Fonts\\ZYKai_T.TTF", 26, "OUTLINE");
	self.AlertFrame:SetPoint("CENTER", 0, -50);

	self.isInArena = false;
	self:PLAYER_ENTERING_WORLD();
	self.lastFireTarget = nil;
	--[[
	local bliz_options = CopyTable(GladiatorlosSA.options)
	bliz_options.args.load = {
		name = "加载配置",
		desc = "加载配置选项",
		type = 'execute',
		func = "ShowConfig",
		handler = GladiatorlosSA,
	}

	LibStub("AceConfig-3.0"):RegisterOptionsTable("GladiatorlosSA_bliz", bliz_options)
	AceConfigDialog:AddToBlizOptions("GladiatorlosSA_bliz", "GladiatorlosSA")
	]]	
end

function GladiatorlosSA:Toggle(switch)
	if (switch) then
		self:RegisterEvent("PLAYER_ENTERING_WORLD");
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");		
	else
		self:UnregisterEvent("PLAYER_ENTERING_WORLD");
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");		
	end
end

function GladiatorlosSA:FireToggle(switch)
	if (switch) then
		self.FireArenaEnable = true;
		self:PLAYER_ENTERING_WORLD();
	else
		self.FireArenaEnable = false;
		self:CancelAllTimers();
	end
end

function GladiatorlosSA:PLAYER_ENTERING_WORLD()
	local _,currentZoneType = IsInInstance();
	CombatLogClearEntries();
	if (currentZoneType == "arena" or self._DEBUG) then		
		self:ScheduleRepeatingTimer("UpdateArenaTarget", 0.01, self);
	else
		self:CancelAllTimers();
	end
end

function GladiatorlosSA:UpdateArenaTarget()
	if (self.FireArenaEnable) then
		self.ArenaInfo = {};		
		for i=1, 5 do
			if (UnitExists("arena"..i) and UnitExists("arena"..i.."target") and UnitInParty("arena"..i.."target") and UnitIsPlayer("arena"..i.."target") and not UnitIsDeadOrGhost("arena"..i.."target")) then
				local name = UnitName("arena"..i.."target");
				local class = select(2, UnitClass("arena"..i.."target"));
				self.ArenaInfo[name] = self.ArenaInfo[name] or {};
				self.ArenaInfo[name]["name"] = name;
				self.ArenaInfo[name]["class"] = class;
				self.ArenaInfo[name]["count"] = self.ArenaInfo[name]["count"] or 1;
			end
		end

		-- 计算count最大的
		local name, class, maxCount = nil, 0;
		for k, v in pairs(self.ArenaInfo) do
			if (v["count"] > maxCount) then
				maxCount = v["count"];
				name = k;
				class = v["class"];
			end
		end

		if (name ~= self.lastFireTarget) then
			self:FireAlert(name, class, maxCount);
		end
	end
end

function GladiatorlosSA:FireAlert(name, class, count)
	if (count >= 2) then	
		if (name == UnitName("player")) then
			name = ">>你<<";
		end
		-- 颜色
		local color = RAID_CLASS_COLORS[class];
		if (color) then
			name = format("|cff%02x%02x%02x%s|r", color.r*255, color.g*255, color.b*255, name);
		end
		
		local msg = format("%s 被|cff56dc7c%d|r人集火!", name, count);
		self.AlertFrame:AddMessage(msg, 1.0, 1.0, 0.1);

		self.lastFireTarget = name;
	end
end

function GladiatorlosSA:OnEnable()
	--self:Toggle(true);
end

function GladiatorlosSA:OnDisable()
	--self:Toggle(false);
end

local function initOptions()
	if GladiatorlosSA.options.args.general then
		return
	end

	GladiatorlosSA:OnOptionsCreate()

	for k, v in GladiatorlosSA:IterateModules() do
		if type(v.OnOptionsCreate) == "function" then
			v:OnOptionsCreate()
		end
	end
	AceConfig:RegisterOptionsTable("GladiatorlosSA", GladiatorlosSA.options)
end

function GladiatorlosSA:ShowConfig()
	initOptions()
	if not (AceConfigDialog:Close("GladiatorlosSA")) then
		AceConfigDialog:Open("GladiatorlosSA");
	end
end

function GladiatorlosSA:ChangeProfile()
	gsadb = self.db1.profile
	for k,v in GladiatorlosSA:IterateModules() do
		if type(v.ChangeProfile) == 'function' then
			v:ChangeProfile()
		end
	end
end

function GladiatorlosSA:AddOption(key, table)
	self.options.args[key] = table
end

local function setOption(info, value)
	local name = info[#info]
	gsadb[name] = value
end

local function getOption(info)
	local name = info[#info]
	return gsadb[name]
end

function GladiatorlosSA:OnOptionsCreate()
	self:AddOption("profiles", LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db1))
	self.options.args.profiles.order = -1
	self:AddOption('一般', {
		type = 'group',
		name = "一般",
		desc = "一般选项",
		order = 1,
		args = {
			enableArea = {
				type = 'group',
				inline = true,
				name = "当何时启用",
				set = setOption,
				get = getOption,
				args = {
					all = {
						type = 'toggle',
						name = "总是启用",
						desc = "在任何地方GladiatorlosSA都处于开启状态",
						order = 1,
					},
					arena = {
						type = 'toggle',
						name = "竞技场",
						desc = "在竞技场中启用GladiatorlosSA",
						disabled = function() return gsadb.all end,
						order = 2,
					},
					battleground = {
						type = 'toggle',
						name = "战场",
						desc = "在战场中启用GladiatorlosSA",
						disabled = function() return gsadb.all end,
						order = 3,
					},
					field = {
						type = 'toggle',
						name = "野外",
						desc = "除了战场、竞技场和副本的任何地方都启用GladiatorlosSA",
						disabled = function() return gsadb.all end,
						order = 4,
					}
				},
			},
		}
	})
	self:AddOption('技能', {
		type = 'group',
		name = "技能",
		desc = "技能选项",
		order = 1,
		args = {
			spellGeneral = {
				type = 'group',
				name = "技能模块控制",
				desc = "技能各个模块禁用选项",
				inline = true,
				set = setOption,
				get = getOption,
				order = -1,
				args = {
					aruaApplied = {
						type = 'toggle',
						name = "禁用敌方增益技能",
						desc = "勾选此选项以关闭敌方增益型技能通报",
						order = 1,
					},
					aruaRemoved = {
						type = 'toggle',
						name = "禁用敌方增益结束",
						desc = "勾选此选项以关闭敌方增益型技能结束通报",
						order = 2,
					},
					castStart = {
						type = 'toggle',
						name = "禁用敌方读条技能",
						desc = "勾选此选项以关闭敌方对友方读条技能通报",
						order = 3,
					},
					castSuccess = {
						type = 'toggle',
						name = "禁用敌方特殊技能",
						desc = "勾选此选项以关闭敌方对友方特殊技能通报",
						order = 4,
					},
					interrupt = {
						type = 'toggle',
						name = "禁用友方打断技能",
						desc = "勾选此选项以关闭友方对敌方打断技能成功的通报",
						order = 5,
					}
				},
			},
			spellAuraApplied = {
				type = 'group',
				--inline = true,
				name = "敌方增益技能",
				set = setOption,
				get = getOption,
				disabled = function() return gsadb.aruaApplied end,
				order = 1,
				args = {
					onlyTarget = {
						type = 'toggle',
						name = "仅目标获得时启用",
						desc = "仅当敌对增益法术在你的目标身上时才启用语音提示",
						order = 1,
					},
					class = {
						type = 'toggle',
						name = "徽章职业提示",
						desc = "在竞技场中,通报徽章的同时提示使用徽章的职业",
						order = 2,
					},
					general = {
						type = 'group',
						inline = true,
						name = "通用技能",
						order = 3,
						args = {
							trinket = {
								type = 'toggle',
								name = GetSpellInfo(42292).."("..GetSpellInfo(59752)..")",
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(42292));
								end,
								descStyle = "custom",
								order = 2,
							},
						}
					},
					druid = {
						type = 'group',
						inline = true,
						name = "|cffFF7D0A德鲁伊|r",
						order = 4,
						args = {
							survivalInstincts = {
								type = 'toggle',
								name = GetSpellInfo(61336),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(61336));
								end,
								descStyle = "custom",
								order = 2,
							},
							innervate = {
								type = 'toggle',
								name = GetSpellInfo(29166),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(29166));
								end,
								descStyle = "custom",
								order = 3,
							},
							barkskin = {
								type = 'toggle',
								name = GetSpellInfo(22812),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(22812));
								end,
								descStyle = "custom",
								order = 4,
							},
							naturesSwiftness = {
								type = 'toggle',
								name = GetSpellInfo(17116),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(17116));
								end,
								descStyle = "custom",
								order = 5,
							},
							naturesGrasp = {
								type = 'toggle',
								name = GetSpellInfo(16689),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(16689));
								end,
								descStyle = "custom",
								order = 6,
							},
							frenziedRegeneration = {
								type = 'toggle',
								name = GetSpellInfo(22842),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(22842));
								end,
								descStyle = "custom",
								order = 7,
							},
						}	
					},
					paladin = {
						type = 'group',
						inline = true,
						name = "|cffF58CBA圣骑士|r",
						order = 5,
						args = {
							auraMastery = {
								type = 'toggle',
								name = GetSpellInfo(31821),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(31821));
								end,
								descStyle = "custom",
								order = 1,
							},
							handOfProtection = {
								type = 'toggle',
								name = GetSpellInfo(1022),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(1022));
								end,
								descStyle = "custom",
								order = 2,
							},
							handOfFreedom = {
								type = 'toggle',
								name = GetSpellInfo(1044),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(1044));
								end,
								descStyle = "custom",
								order = 3,
							},
							divineShield = {
								type = 'toggle',
								name = GetSpellInfo(642),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(642));
								end,
								descStyle = "custom",
								order = 4,
							},
							sacrifice = {
								type = 'toggle',
								name = GetSpellInfo(6940),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(6940));
								end,
								descStyle = "custom",
								order = 5,
							},
							divineGuardian = {
								type = 'toggle',
								name = GetSpellInfo(64205),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(64205));
								end,
								descStyle = "custom",
								order = 6,
							},
							divinePlea = {
								type = 'toggle',
								name = GetSpellInfo(54428),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(54428));
								end,
								descStyle = "custom",
								order = 7,
							},
						}	
					},
					rogue = {
						type = 'group',
						inline = true,
						name = "|cffFFF569盗贼|r",
						order = 6,
						args = {
							shadowDance = {
								type = 'toggle',
								name = GetSpellInfo(51713),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(51713));
								end,
								descStyle = "custom",
								order = 1,
							},
							cloakOfShadows = {
								type = 'toggle',
								name = GetSpellInfo(31224),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(31224));
								end,
								descStyle = "custom",
								order = 3,
							},
							adrenalineRush = {
								type = 'toggle',
								name = GetSpellInfo(13750),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(13750));
								end,
								descStyle = "custom",
								order = 4,
							},
							evasion = {
								type = 'toggle',
								name = GetSpellInfo(5277),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(5277));
								end,
								descStyle = "custom",
								order = 5,
							},
						}	
					},
					warrior	= {
						type = 'group',
						inline = true,
						name = "|cffC79C6E战士|r",
						order = 7,
						args = {
							shieldWall = {
								type = 'toggle',
								name = GetSpellInfo(871),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(871));
								end,
								descStyle = "custom",
								order = 2,
							},
							berserkerRage = {
								type = 'toggle',
								name = GetSpellInfo(18499),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(18499));
								end,
								descStyle = "custom",
								order = 3,
							},
							retaliation = {
								type = 'toggle',
								name = GetSpellInfo(20230),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(20230));
								end,
								descStyle = "custom",
								order = 4,
							},
							spellReflection = {
								type = 'toggle',
								name = GetSpellInfo(23920),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(23920));
								end,
								descStyle = "custom",
								order = 5,
							},
							sweepingStrikes = {
								type = 'toggle',
								name = GetSpellInfo(12328),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(12328));
								end,
								descStyle = "custom",
								order = 6,
							},
							bladestorm = {
								type = 'toggle',
								name = GetSpellInfo(46924),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(46924));
								end,
								descStyle = "custom",
								order = 7,
							},
							deathWish = {
								type = 'toggle',
								name = GetSpellInfo(12292),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(12292));
								end,
								descStyle = "custom",
								order = 8,
							},
						}	
					},
					preist	= {
						type = 'group',
						inline = true,
						name = "|cffFFFFFF牧师|r",
						order = 8,
						args = {
							painSuppression = {
								type = 'toggle',
								name = GetSpellInfo(33206),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(33206));
								end,
								descStyle = "custom",
								order = 1,
							},
							powerInfusion = {
								type = 'toggle',
								name = GetSpellInfo(37274),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(37274));
								end,
								descStyle = "custom",
								order = 2,
							},
							fearWard = {
								type = 'toggle',
								name = GetSpellInfo(6346),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(6346));
								end,
								descStyle = "custom",
								order = 3,
							},
							dispersion = {
								type = 'toggle',
								name = GetSpellInfo(47585),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(47585));
								end,
								descStyle = "custom",
								order = 4,
							},
						}	
					},
					shaman	= {
						type = 'group',
						inline = true,
						name = "|cff0070DE萨满|r",
						order = 9,
						args = {
							shamanisticRage = {
								type = 'toggle',
								name = GetSpellInfo(30823),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(30823));
								end,
								descStyle = "custom",
								order = 1,
							},
							earthShield = {
								type = 'toggle',
								name = GetSpellInfo(49284),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(49284));
								end,
								descStyle = "custom",
								order = 2,
							},
							naturesSwiftness2 = {
								type = 'toggle',
								name = GetSpellInfo(16188),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(16188));
								end,
								descStyle = "custom",
								order = 3,
							},
							waterShield = {
								type = 'toggle',
								name = GetSpellInfo(33736),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(33736));
								end,
								descStyle = "custom",
								order = 4,
							},
						}	
					},
					mage = {
						type = 'group',
						inline = true,
						name = "|cff69CCF0法师|r",
						order = 10,
						args = {
							iceBlock = {
								type = 'toggle',
								name = GetSpellInfo(45438),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(45438));
								end,
								descStyle = "custom",
								order = 1,
							},
							arcanePower = {
								type = 'toggle',
								name = GetSpellInfo(12042),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(12042));
								end,
								descStyle = "custom",
								order = 2,
							},
						}	
					},
					dk	= {
						type = 'group',
						inline = true,
						name = "|cffC41F3B死亡骑士|r",
						order = 11,
						args = {
							lichborne = {
								type = 'toggle',
								name = GetSpellInfo(49039),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(49039));
								end,
								descStyle = "custom",
								order = 1,
							},
							iceboundFortitude = {
								type = 'toggle',
								name = GetSpellInfo(48792),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(48792));
								end,
								descStyle = "custom",
								order = 2,
							},
							vampiricBlood = {
								type = 'toggle',
								name = GetSpellInfo(55233),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(55233));
								end,
								descStyle = "custom",
								order = 3,
							},
						}	
					},
					hunter = {
						type = 'group',
						inline = true,
						name = "|cffABD473猎人|r",
						order = 12,
						args = {
							theBeastWithin = {
								type = 'toggle',
								name = GetSpellInfo(34471),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(34471));
								end,
								descStyle = "custom",
								order = 1,
							},
							deterrence = {
								type = 'toggle',
								name = GetSpellInfo(19263),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(19263));
								end,
								descStyle = "custom",
								order = 2,
							},
						}	
					},
				},
			},
			spellAuraRemoved = {
				type = 'group',
				--inline = true,
				name = "敌方增益结束",
				set = setOption,
				get = getOption,
				disabled = function() return gsadb.aruaRemoved end,
				order = 2,
				args = {
					paladin = {
						type = 'group',
						inline = true,
						name = "|cffF58CBA圣骑士|r",
						order = 4,
						args = {
							protectionDown = {
								type = 'toggle',
								name = GetSpellInfo(1022),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(1022));
								end,
								descStyle = "custom",
								order = 2,
							},
							bubbleDown = {
								type = 'toggle',
								name = GetSpellInfo(642),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(642));
								end,
								descStyle = "custom",
								order = 4,
							},
						}	
					},
					rogue = {
						type = 'group',
						inline = true,
						name = "|cffFFF569盗贼|r",
						order = 5,
						args = {
							cloakDown = {
								type = 'toggle',
								name = GetSpellInfo(31224),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(31224));
								end,
								descStyle = "custom",
								order = 3,
							},
							evasionDown = {
								type = 'toggle',
								name = GetSpellInfo(5277),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(5277));
								end,
								descStyle = "custom",
								order = 5,
							},
						}	
					},
					preist	= {
						type = 'group',
						inline = true,
						name = "|cffFFFFFF牧师|r",
						order = 7,
						args = {
							PSDown = {
								type = 'toggle',
								name = GetSpellInfo(33206),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(33206));
								end,
								descStyle = "custom",
								order = 1,
							},
							dispersionDown = {
								type = 'toggle',
								name = GetSpellInfo(47585),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(47585));
								end,
								descStyle = "custom",
								order = 2,
							},
						}	
					},
					mage = {
						type = 'group',
						inline = true,
						name = "|cff69CCF0法师|r",
						order = 9,
						args = {
							iceBlockDown = {
								type = 'toggle',
								name = GetSpellInfo(45438),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(45438));
								end,
								descStyle = "custom",
								order = 1,
							},
						},
					},
					dk = {
						type = 'group',
						inline = true,
						name = "|cffC41F3B死亡騎士|r",
						order = 10,
						args = {
							iceboundFortitudeDown = {
								type = 'toggle',
								name = GetSpellInfo(48792),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(48792));
								end,
								descStyle = "custom",
								order = 1,
							},
							lichborneDown = {
								type = 'toggle',
								name = GetSpellInfo(49039),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(49039));
								end,
								descStyle = "custom",
								order = 2,
							},
						},
					}
				},
			},
			spellCastStart = {
				type = 'group',
				--inline = true,
				name = "敌方读条技能",
				disabled = function() return gsadb.castStart end,
				set = setOption,
				get = getOption,
				order = 2,
				args = {
					general = {
						type = 'group',
						inline = true,
						name = "通用技能",
						order = 2,
						args = {
							bigHeal = {
								type = 'toggle',
								name = "大型治疗法术",
								desc = "强效治疗术 圣光术 治疗波 治疗之触",
								order = 1,
							},
							resurrection = {
								type = 'toggle',
								name = "复活技能",
								desc = "复活术 救赎 先祖之魂 复活",
								order = 2,
							},
						}
					},
					druid = {
						type = 'group',
						inline = true,
						name = "|cffFF7D0A德鲁伊|r",
						order = 3,
						args = {
							hibernate = {
								type = 'toggle',
								name = GetSpellInfo(2637),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(2637));
								end,
								descStyle = "custom",
								order = 1,
							},
							cyclone = {
								type = 'toggle',
								name = GetSpellInfo(33786),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(33786));
								end,
								descStyle = "custom",
								order = 2,
							},
						}
					},
					preist	= {
						type = 'group',
						inline = true,
						name = "|cffFFFFFF牧师|r",
						order = 6,
						args = {
							manaBurn = {
								type = 'toggle',
								name = GetSpellInfo(8129),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(8129));
								end,
								descStyle = "custom",
								order = 1,
							},
							shackleUndead = {
								type = 'toggle',
								name = GetSpellInfo(9484),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(9484));
								end,
								descStyle = "custom",
								order = 2,
							},
							mindControl = {
								type = 'toggle',
								name = GetSpellInfo(605),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(605));
								end,
								descStyle = "custom",
								order = 3,
							},
						}
					},
					shaman	= {
						type = 'group',
						inline = true,
						name = "|cff0070DE萨满|r",
						order = 7,
						args = {
							hex = {
								type = 'toggle',
								name = GetSpellInfo(51514),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(51514));
								end,
								descStyle = "custom",
								order = 1,
							},
						}	
					},
					mage = {
						type = 'group',
						inline = true,
						name = "|cff69CCF0法师|r",
						order = 8,
						args = {
							polymorph = {
								type = 'toggle',
								name = GetSpellInfo(118),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(118));
								end,
								descStyle = "custom",
								order = 1,
							},
						}	
					},
					hunter = {
						type = 'group',
						inline = true,
						name = "|cffABD473猎人|r",
						order = 10,
						args = {
							revivePet = {
								type = 'toggle',
								name = GetSpellInfo(982),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(982));
								end,
								descStyle = "custom",
								order = 1,
							},
							scareBeast = {
								type = 'toggle',
								name = GetSpellInfo(14327),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(14327));
								end,
								descStyle = "custom",
								order = 2,
							},
						}	
					},
					warlock	= {
						type = 'group',
						inline = true,
						name = "|cff9482C9术士|r",
						order = 11,
						args = {
							fear = {
								type = 'toggle',
								name = GetSpellInfo(5782),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(5782));
								end,
								descStyle = "custom",
								order = 1,
							},
							fear2 = {
								type = 'toggle',
								name = GetSpellInfo(5484),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(5484));
								end,
								descStyle = "custom",
								order = 2,
							},
							banish = {
								type = 'toggle',
								name = GetSpellInfo(710),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(710));
								end,
								descStyle = "custom",
								order = 3,
							},
						}	
					},
				},
			},
			spellCastSuccess = {
				type = 'group',
				--inline = true,
				name = "敌方特殊技能",
				disabled = function() return gsadb.castSuccess end,
				set = setOption,
				get = getOption,
				order = 3,
				args = {
					rogue = {
						type = 'group',
						inline = true,
						name = "|cffFFF569盗贼|r",
						order = 4,
						args = {
							disarm2 = {
								type = 'toggle',
								name = GetSpellInfo(51722),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(51722));
								end,
								descStyle = "custom",
								order = 1,
							},
							blind = {
								type = 'toggle',
								name = GetSpellInfo(2094),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(2094));
								end,
								descStyle = "custom",
								order = 2,
							},
							kick = {
								type = 'toggle',
								name = GetSpellInfo(1766),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(1766));
								end,
								descStyle = "custom",
								order = 3,
							},
							preparation = {
								type = 'toggle',
								name = GetSpellInfo(14185),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(14185));
								end,
								descStyle = "custom",
								order = 4,
							},
							vanish = {
								type = 'toggle',
								name = GetSpellInfo(1856),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(1856));
								end,
								descStyle = "custom",
								order = 5,
							},
						}	
					},
					warrior	= {
						type = 'group',
						inline = true,
						name = "|cffC79C6E战士|r",
						order = 5,
						args = {
							disarm = {
								type = 'toggle',
								name = GetSpellInfo(676),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(676));
								end,
								descStyle = "custom",
								order = 1,
							},
							fear3 = {
								type = 'toggle',
								name = GetSpellInfo(5246),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(5246));
								end,
								descStyle = "custom",
								order = 2,
							},
							pummel = {
								type = 'toggle',
								name = GetSpellInfo(6552),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(6552));
								end,
								descStyle = "custom",
								order = 3,
							},
							shieldBash = {
								type = 'toggle',
								name = GetSpellInfo(72),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(72));
								end,
								descStyle = "custom",
								order = 4,
							},
						}	
					},
					preist	= {
						type = 'group',
						inline = true,
						name = "|cffFFFFFF牧师|r",
						order = 6,
						args = {
							fear4 = {
								type = 'toggle',
								name = GetSpellInfo(8122),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(8122));
								end,
								descStyle = "custom",
								order = 1,
							},
							shadowFiend = {
								type = 'toggle',
								name = GetSpellInfo(34433),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(34433));
								end,
								descStyle = "custom",
								order = 2,
							},
							disarm3 = {
								type = 'toggle',
								name = GetSpellInfo(64044),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(64044));
								end,
								descStyle = "custom",
								order = 3,
							},
						}	
					},
					shaman	= {
						type = 'group',
						inline = true,
						name = "|cff0070DE萨满|r",
						order = 7,
						args = {
							grounding = {
								type = 'toggle',
								name = GetSpellInfo(8177),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(8177));
								end,
								descStyle = "custom",
								order = 1,
							},
							manaTide = {
								type = 'toggle',
								name = GetSpellInfo(16190),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(16190));
								end,
								descStyle = "custom",
								order = 2,
							},
							tremorTotem = {
								type = 'toggle',
								name = GetSpellInfo(8143),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(8143));
								end,
								descStyle = "custom",
								order = 3,
							},
						}	
					},
					mage = {
						type = 'group',
						inline = true,
						name = "|cff69CCF0法师|r",
						order = 8,
						args = {
							coldSnap = {
								type = 'toggle',
								name = GetSpellInfo(11958),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(11958));
								end,
								descStyle = "custom",
								order = 1,
							},
							deepFreeze = {
								type = 'toggle',
								name = GetSpellInfo(44572),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(44572));
								end,
								descStyle = "custom",
								order = 2,
							},
							counterspell = {
								type = 'toggle',
								name = GetSpellInfo(2139),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(2139));
								end,
								descStyle = "custom",
								order = 3,
							},							
							invisibility = {
								type = 'toggle',
								name = GetSpellInfo(66),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(66));
								end,
								descStyle = "custom",
								order = 4,
							},
						}	
					},
					dk	= {
						type = 'group',
						inline = true,
						name = "|cffC41F3B死亡骑士|r",
						order = 9,
						args = {
							mindFreeze = {
								type = 'toggle',
								name = GetSpellInfo(47528),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(47528));
								end,
								descStyle = "custom",
								order = 1,
							},
							strangulate = {
								type = 'toggle',
								name = GetSpellInfo(47476),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(47476));
								end,
								descStyle = "custom",
								order = 2,
							},
							runeWeapon = {
								type = 'toggle',
								name = GetSpellInfo(47568),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(47568));
								end,
								descStyle = "custom",
								order = 3,
							},
							gargoyle = {
								type = 'toggle',
								name = GetSpellInfo(49206),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(49206));
								end,
								descStyle = "custom",
								order = 4,
							},
							hungeringCold = {
								type = 'toggle',
								name = GetSpellInfo(49203),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(49203));
								end,
								descStyle = "custom",
								order = 5,
							},
						}	
					},
					hunter = {
						type = 'group',
						inline = true,
						name = "|cffABD473猎人|r",
						order = 10,
						args = {
							wyvernSting = {
								type = 'toggle',
								name = GetSpellInfo(19386),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(19386));
								end,
								descStyle = "custom",
								order = 1,
							},
						}	
					},
					warlock = {
						type = 'group',
						inline = true,
						name = "|cff9482C9术士|r",
						order = 11,
						args = {
							fear2 = {
								type = 'toggle',
								name = GetSpellInfo(5484),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(5484));
								end,
								descStyle = "custom",
								order = 1,
							},
							spellLock = {
								type = 'toggle',
								name = GetSpellInfo(19647),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(19647));
								end,
								descStyle = "custom",
								order = 2,
							},
							demonicCircleTeleport = {
								type = 'toggle',
								name = GetSpellInfo(48020),
								desc = function () 
									GameTooltip:SetHyperlink(GetSpellLink(48020));
								end,
								descStyle = "custom",
								order = 3,
							},
						}	
					},
				},
			},
			spellInterrupt = {
				type = 'group',
				--inline = true,
				name = "友方打断技能",
				disabled = function() return gsadb.interrupt end,
				set = setOption,
				get = getOption,
				order = 4,
				args = {
					lockout = {
						type = 'toggle',
						name = "友方打断技能",
						desc = "法术封锁 法术反制 脚踢 拳击 盾击 心智冰封",
						order = 1,
					},
				}
			},
		}
	})
end

function GladiatorlosSA:PlayTrinket()
	PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Trinket.mp3")
end

function GladiatorlosSA:ArenaClass(id)
	for i = 1 , 5 do
		if id == UnitGUID("arena"..i) then
			return select(2, UnitClass ("arena"..i))
		end
	end
end

function GladiatorlosSA:COMBAT_LOG_EVENT_UNFILTERED(event , ...)
	local _,currentZoneType = IsInInstance()
	if (not ((currentZoneType == "none" and gsadb.field) or (currentZoneType == "pvp" and gsadb.battleground) or (currentZoneType == "arena" and gsadb.arena) or gsadb.all)) then
		--print (currentZoneType,gsadb.field,gsadb.battleground,gsadb.arena,gsadb.all)
		return
	end
	local timestamp,event,sourceGUID,sourceName,sourceFlags,destGUID,destName,destFlags,spellID,spellName= select ( 1 , ... );
	--print (sourceName,destName,event,spellName,spellID);
	local toEnemy,fromEnemy,toSelf,toTarget = false , false , false , false
	if (destName and not CombatLog_Object_IsA(destFlags, COMBATLOG_OBJECT_NONE) ) then
		toEnemy = CombatLog_Object_IsA(destFlags, COMBATLOG_FILTER_HOSTILE_PLAYERS)
	end
	if (sourceName and not CombatLog_Object_IsA(sourceFlags, COMBATLOG_OBJECT_NONE) ) then
		fromEnemy = CombatLog_Object_IsA(sourceFlags, COMBATLOG_FILTER_HOSTILE_PLAYERS)
	end
	if (destName and not CombatLog_Object_IsA(destFlags, COMBATLOG_OBJECT_NONE) ) then
		toSelf = CombatLog_Object_IsA(destFlags, COMBATLOG_FILTER_MINE)
	end
	if (destName and not CombatLog_Object_IsA(destFlags, COMBATLOG_OBJECT_NONE) ) then
		toFriend = CombatLog_Object_IsA(destFlags, COMBATLOG_FILTER_FRIENDLY_UNITS)
	end
	if (destName and not CombatLog_Object_IsA(destFlags, COMBATLOG_OBJECT_NONE) ) then
		toTarget = (UnitGUID("target") == destGUID)
	end
	--print (toTarget,sourceName,destName)
	--[[debug
	if (spellID == 80964 or spellID == 80965 or spellID == 85285) then 
		print (sourceName,destName,event,spellName,spellID)
	end
	enddebug]]--
	if (event == "SPELL_AURA_APPLIED" and toEnemy and (not gsadb.onlyTarget or toTarget) and not gsadb.aruaApplied) then
		--general
		if ( (spellName == "自利" or spellName == "PvP饰品") and gsadb.trinket) then -- 徽章
			if (gsadb.class and currentZoneType == "arena" ) then
				local c = self:ArenaClass(destGUID)
				PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\"..c..".mp3");
				self:ScheduleTimer("PlayTrinket", 0.3)
			else
				self:PlayTrinket()
			end
			--PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Trinket.mp3");
		end
		--druid
		if (spellName == "生存本能" and gsadb.survivalInstincts) then -- 求生本能
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Survival Instincts.mp3");
		end
		if (spellName == "激活" and gsadb.innervate) then -- 启动
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Innervate.mp3");
		end
		if (spellName == "树皮术" and gsadb.barkskin) then -- 树皮术
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\barkskin.mp3");
		end
		if (spellName == "自然迅捷" and gsadb.naturesSwiftness) then -- 自然迅捷
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Natures Swiftness.mp3");
		end
		if (spellName == "自然之握" and gsadb.naturesGrasp) then -- 自然之握
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Natures Grasp.mp3");
		end
		if (spellName == "狂暴回复" and gsadb.frenziedRegeneration) then -- 狂暴恢复
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Frenzied Regeneration.mp3");
		end
		--paladin
		if (spellName == "光环掌握" and gsadb.auraMastery) then -- 光环精通
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Aura Mastery.mp3");
		end
		if (spellName == "保护之手" and gsadb.handOfProtection) then -- 保护
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Hand of Protection.mp3");
		end
		if (spellName == "自由之手" and gsadb.handOfFreedom) then -- 自由
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Hand of Freedom.mp3");
		end
		if (spellName == "圣盾术" and gsadb.divineShield) then -- 无敌
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\divine shield.mp3");
		end
		if (spellName == "牺牲之手" and gsadb.sacrifice) then -- 牺牲祝福
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Sacrifice.mp3");
		end
		if (spellName == "神圣牺牲" and gsadb.divineGuardian) then -- 神性牺牲
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Divine Guardian.mp3");
		end
		if (spellName == "神圣恳求" and gsadb.divinePlea) then -- 神性恳求
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Divine Plea.mp3");
		end
		--rogue
		if (spellName == "暗影之舞" and gsadb.shadowDance) then -- 暗影之舞
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Shadow Dance.mp3");
		end
		if (spellName == "暗影斗篷" and gsadb.cloakOfShadows) then -- 斗篷
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Cloak of Shadows.mp3");
		end
		if (spellName == "冲动" and gsadb.adrenalineRush) then -- 冲动
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Adrenaline Rush.mp3");
		end
		if (spellName == "闪避" and gsadb.evasion) then -- 闪避
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Evasion.mp3");
		end
		--warrior
		if (spellName == "盾墙" and gsadb.shieldWall) then --盾墙
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Shield Wall.mp3")
		end
		if (spellName == "狂暴之怒" and gsadb.berserkerRage) then -- 狂暴之怒
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Berserker Rage.mp3");
		end
		if (spellName == "反击风暴" and gsadb.retaliation) then -- 反击风暴
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Retaliation.mp3")
		end
		if (spellName == "法术反射" and gsadb.spellReflection) then -- 盾反
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Spell Reflection.mp3")
		end
		if (spellName == "横扫攻击" and gsadb.sweepingStrikes) then -- 横扫攻击
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Sweeping Strikes.mp3");
		end
		if (spellName == "利刃风暴" and gsadb.bladestorm) then -- 剑刃风暴
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Bladestorm.mp3");
		end
		if (spellName == "死亡之愿" and gsadb.deathWish) then
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Death Wish.mp3");
		end
		--preist
		if (spellName == "痛苦压制" and gsadb.painSuppression) then -- 痛苦压制
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\pain suppression.mp3");
		end
		if (spellName == "能量灌注" and gsadb.powerInfusion) then -- 能量灌注
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Power Infusion.mp3");
		end
		if (spellName == "防护恐惧结界" and gsadb.fearWard) then -- 反恐
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Fear Ward.mp3");
		end	
		if (spellName == "消散" and gsadb.dispersion) then -- 消散
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Dispersion.mp3");
		end		
		--shaman
		
		if (spellName == "水之护盾" and gsadb.waterShield) then
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\water shield.mp3");
		end
		if (spellName == "萨满之怒" and gsadb.shamanisticRage) then -- 萨满之怒
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Shamanistic Rage.mp3")
		end
		if (spellName == "大地之盾" and gsadb.earthShield) then -- 大地之盾
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Earth shield.mp3");
		end
		--mage
		if (spellName == "寒冰屏障" and gsadb.iceBlock) then -- 寒冰屏障
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\ice block.mp3");
		end
		if (spellName == "奥术强化" and gsadb.arcanePower) then -- 秘法强化
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Arcane Power.mp3");
		end
		--dk
		if (spellName == "巫妖之躯" and gsadb.lichborne) then -- 巫妖之躯
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Lichborne.mp3");
		end
		if (spellName == "冰封之韧" and gsadb.iceboundFortitude) then -- 冰固
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Icebound Fortitude.mp3");
		end
		if (spellName == "吸血鬼之血" and gsadb.vampiricBlood) then -- 血族之裔
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Vampiric Blood.mp3");
		end
		--hunter
		if (spellName == "威慑" and gsadb.deterrence) then -- 威慑
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Deterrence.mp3");
		end
		if (spellName == "野兽之心" and gsadb.theBeastWithin) then -- 野兽之心
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\The Beast Within.mp3")
		end
		--warlock
	end
	if (event == "SPELL_AURA_REMOVED" and toEnemy and not gsadb.auraRemoved) then
		if (spellName == "圣盾术" and gsadb.bubbleDown) then
		   PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\Bubble down.mp3")
		end
		if (spellName == "消散" and gsadb.dispersionDown) then
		   PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\Dispersion down.mp3")
		end
		if (spellName == "保护之手" and gsadb.protectionDown) then
		   PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\Protection down.mp3")
		end
		if (spellName == "暗影斗篷" and gsadb.cloakDown) then
		   PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\Cloak down.mp3")
		end
		if (spellName == "痛苦压制" and gsadb.PSDown) then
		   PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\PS down.mp3")
		end
		if (spellName == "闪避" and gsadb.evasionDown) then
		   PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\Evasion down.mp3")
		end
		if (spellName == "寒冰屏障" and gsadb.iceBlockDown) then
		   PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\Ice Block down.mp3")
		end
		if (spellName == "巫妖之躯" and gsadb.lichborneDown) then
		   PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\lichborne Down.mp3")
		end
		if (spellName == "冰封之韧" and gsadb.iceboundFortitudeDown) then
		   PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\Icebound Fortitude Down.mp3")
		end
	end
	if (event == "SPELL_CAST_START" and fromEnemy and not gsadb.castStart) then
	--general
		if ((spellName == "强效治疗术" or spellName == "圣光术" or spellName == "治疗波" or spellName == "治疗之触") and gsadb.bigHeal) then -- 强效治疗术 神光术 强效治疗波 治疗之触
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\big heal.mp3");
		end
		if ((spellName == "复活术" or spellName == "救赎" or spellName == "先祖之魂" or spellName == "起死回生") and gsadb.resurrection) then -- 复活术 救赎 先祖之魂 复活
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Resurrection.mp3");
		end
	--hunter
		if (spellName == "复活宠物" and gsadb.revivePet) then -- 复活宠物
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Revive Pet.mp3");
		end
	end
	if (event == "SPELL_CAST_START" and fromEnemy and not gsadb.castStart) then
		
		--druid
		if (spellName == "旋风" and gsadb.cyclone) then -- 吹风
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\cyclone.mp3");
		end
		if (spellName == "休眠" and gsadb.hibernate) then -- 休眠
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\hibernate.mp3");
		end
		--paladin
		--rogue
		--warrior
		--preist          
		if (spellName == "法力燃烧" and gsadb.manaBurn) then -- 法力燃烧
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Mana Burn.mp3");
		end
		if (spellName == "束缚亡灵" and gsadb.shackleUndead) then -- 束缚亡灵
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Shackle Undead.mp3");
		end
		if (spellName == "精神控制" and gsadb.mindControl) then -- 精神控制
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Mind Control.mp3");
		end
		--shaman
		if (spellName == "妖术" and gsadb.hex) then -- 妖术
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Hex.mp3");
		end
		--maga
		if (spellName == "变形术" and gsadb.polymorph) then -- 变形术 羊猪猫兔蛇鸡龟
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\polymorph.mp3");
		end
		--dk
		--hunter
		if (spellName == "恐吓野兽" and gsadb.scareBeast) then
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Scare Beast.mp3");
		end
		--warlock
		if (spellName == "放逐术" and gsadb.banish) then -- 放逐术
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Banish.mp3");
		end
		if (spellName == "恐惧" and gsadb.fear) then -- 恐惧
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\fear.mp3");
		end
		if (spellName == "恐惧嚎叫" and gsadb.fear2) then -- 恐惧嚎叫
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\fear2.mp3");
		end
	end
	if (event == "SPELL_CAST_SUCCESS" and fromEnemy and not gsadb.castSuccess) then
		--general
		--druid
		--paladin
		--rogue
		if (spellName == "拆卸" and gsadb.disarm2) then -- 拆卸
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Disarm2.mp3")
		end
		if (spellName == "致盲" and gsadb.blind) then -- 致盲
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Blind.mp3")
		end
		if (spellName == "脚踢" and gsadb.kick) then -- 脚踢
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\kick.mp3")
		end
		if (spellName == "伺机待发" and gsadb.kick) then -- 伺机待发
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\preparation.mp3")
		end
		if (spellName == "消失" and gsadb.vanish) then -- 消失
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Vanish.mp3")
		end
		--warrior
		if (spellName == "缴械" and gsadb.disarm) then -- 缴械
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Disarm.mp3")
		end
		if (spellName == "破胆怒吼" and gsadb.fear3) then -- 破胆怒吼
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Fear3.mp3");
		end
		if (spellName == "拳击" and gsadb.pummel) then -- 拳击
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\pummel.mp3")
		end
		if (spellName == "盾击" and gsadb.shieldBash) then -- 盾击
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Shield Bash.mp3")
		end
		--preist
		if (spellName == "心灵尖啸" and gsadb.fear4) then -- 心灵尖啸
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Fear4.mp3");
		end
		if (spellName == "暗影恶魔" and gsadb.shadowFiend) then -- 暗影恶魔
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Shadowfiend.mp3")
		end
		if (spellName == "心灵惊骇" and gsadb.disarm3) then -- 心灵惊骇
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\disarm3.mp3")
		end
		--shaman
		if (spellName == "根基图腾" and gsadb.grounding) then -- 根基图腾
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Grounding.mp3")
		end
		if (spellName == "法力之潮图腾" and gsadb.manaTide) then -- 法力之潮
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Mana Tide.mp3");
		end
		if (spellName == "战栗图腾" and gsadb.tremorTotem) then -- 战栗图腾
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\tremor Totem.mp3");
		end
		--mage
		if (spellName == "深度冻结" and gsadb.deepFreeze) then -- 深结
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Deep Freeze.mp3");
		end
		if (spellName == "法术反制" and gsadb.counterspell) then -- 法术反制
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Counterspell.mp3");
		end
		if (spellName == "急速冷却" and gsadb.counterspell) then -- 急速冷却
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\cold snap.mp3");
		end
		if (spellName == "隐形术" and gsadb.invisibility) then -- 隐形术
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Invisibility.mp3");
		end
		--dk
		if (spellName == "心灵冰冻" and gsadb.mindFreeze) then -- 心智冰封
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Mind Freeze.mp3")
		end
		if (spellName == "绞袭" and gsadb.strangulate) then -- 绞杀
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Strangulate.mp3");
		end
		if (spellName == "符文武器增效" and gsadb.runeWeapon) then -- 强力符文武器
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Rune Weapon.mp3");
		end
		if (spellName == "召唤石像鬼" and gsadb.gargoyle) then -- 召唤石像鬼
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\gargoyle.mp3");
		end
		if (spellName == "饥饿之寒" and gsadb.hungeringCold) then -- 饥饿之寒
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Hungering cold.mp3");
		end
		--hunter
		if (spellName == "翼龙钉刺" and gsadb.wyvernSting) then -- 翼龙钉刺
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Wyvern Sting.mp3");
		end
		--warlock
		if (spellName == "恐惧嚎叫" and gsadb.fear2) then -- 恐惧嚎叫
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\fear2.mp3");
		end
		if (spellName == "法术封锁" and gsadb.spellLock) then -- 法术封锁
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Spell Lock.mp3");
		end
		if (spellName == "恶魔法阵：传送" and gsadb.demonicCircleTeleport) then -- 恶魔法阵:传送
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\voice\\Demonic Circle Teleport.mp3");
		end
	end
	if (event == "SPELL_INTERRUPT" and toEnemy and not gsadb.interrupt) then -- 法术封锁 法术反制 脚踢 拳击 盾击 心智冰封 碎颅猛击 责难
		if ((spellName == "法术封锁" or spellName == "法术反制" or spellName == "脚踢" or spellName == "拳击" or spellName == "盾击" or spellName == "心灵冰冻" ) and gsadb.lockout) then 
			PlaySoundFile("Interface\\Addons\\GladiatorlosSA\\Voice\\lockout.mp3");
		end
	end
end



