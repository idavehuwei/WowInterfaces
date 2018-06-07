local tablet = AceLibrary("Tablet-2.0")
local L = AceLibrary("AceLocale-2.2"):new("OptiTaunt")
OptiTaunt = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0", "AceDB-2.0")

OptiTaunt.TOCversion = GetAddOnMetadata("OptiTaunt", "Version")
OptiTaunt.version = OptiTaunt.TOCversion
OptiTaunt.revision = OptiTaunt.TOCversion


function OptiTaunt:OnInitialize()
	self:RegisterDB("DuowanAddon_OptiTauntDB", "DuowanAddon_OptiTauntDBPC")
	self:RegisterDefaults("profile", {
				
		--messages
		resistmessage=L["resistmessage"],
		immunemessage=L["immunemessage"],
		abilitymessage=L["abilitymessage"],
				
		-- ouput
		outputsettings = {
			["Growl"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Frenzied Regeneration"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Barkskin"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Survival Instincts"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Challenging Roar"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Taunt"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Mocking Blow"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Shield Wall"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Last Stand"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Challenging Shout"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Righteous Defense"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
			["Avenger's Shield"] = {
						raid = true,
						say = false,
						whisper = true,
						raidwarning = false,
						channel = {},
			},
		},
			
		--options
		announceresist = true,
		announceimmune = true,
		announceability = true,
		
		giveAudioWarning = true,
		aggroCheck = true,
		whisperWarriors = false,
		pvpCheck = true,
		
	} )
	
	self:RegisterChatCommand(L["Slash-Commands"], self.options)
	self.opt = self.db.profile
	self.OnMenuRequest = self.options
	
	self.tauntsoundfile = "Interface\\AddOns\\OptiTaunt\\Sounds\\combo.ogg"
	self.tauntcount = 0
	self.tauntresistcount = 0
	self.tauntresistpercent = 0
	
	-- Only show class dependent abilities and do some other class depending stuff
	_, self.playerclass	= UnitClass("player")
	if (self.playerclass == "DRUID") then
		self.ability_list = { L["Growl"], L["Challenging Roar"], L["Frenzied Regeneration"], L["Survival Instincts"], L["Barkskin"] }
	elseif (self.playerclass == "WARRIOR") then 
		self.ability_list = { L["Taunt"], L["Mocking Blow"], L["Shield Wall"], L["Last Stand"], L["Challenging Shout"] }
	elseif (self.playerclass == "PALADIN") then
		self.ability_list = { L["Righteous Defense"], L["Avenger's Shield"] }
	else
		self.ability_list = { }
	end
	
	-- Add custom channels
	OptiTaunt:CreateOutputSettings(self.ability_list)
	
	-- set to true for debugging messages
	self.isDebug = false
end


function OptiTaunt:OnProfileEnable()
	self.opt = self.db.profile
end


function OptiTaunt:OnEnable()
    
end

local opt_enable = false;
function OptiTaunt:Toggle(switch)
	if (switch) then
		if (not opt_enable) then
			opt_enable = true;
			self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")	
			self:RegisterEvent("CHANNEL_UI_UPDATE")		
		end
	else
		if (opt_enable) then
			opt_enable = false;
			self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")	
			self:UnregisterEvent("CHANNEL_UI_UPDATE")		
		end
	end
end
function OptiTaunt:dbg(msg)
	if ( self.isDebug ) then
		OptiTaunt:Print(msg)
	end
end


function OptiTaunt:CreateOutputSettings(ability_list)

	--something might have changed, so rebuild ability menu from scratch just to be safe
	local ability, activate
	self.channels = {GetChannelList()}
	self.options.args.ability_options.args = {}
				
	--rebuild abilites
	for ability=1,table.getn(ability_list) do
		self.options.args.ability_options.args[ability] = {}
		self.options.args.ability_options.args[ability] = {
			type  = 'group',
			name  = ability_list[ability],
			desc  = ability_list[ability],
			args  = {},
		}
	end
		
	--rebuild ability options
	for ability=1,table.getn(ability_list) do
		
		--raid/group
		self.options.args.ability_options.args[ability].args[1] = {
		type = 'toggle',
		order = 2,
		name = L["opt_name_raidparty"],
		desc = L["opt_desc_raidparty"],
		get = function()
				return self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].raid
			  end,
		set = function()
			    self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].raid = 
				not self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].raid
		      end,
		}
		
		--say
		self.options.args.ability_options.args[ability].args[2] = {
		type = 'toggle',
		order = 1,
		name = L["opt_name_say"],
		desc = L["opt_desc_say"],
		get = function()
				return self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].say
			  end,
		set = function()
			    self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].say = 
				not self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].say
		      end,
		}
		
		--whisper (disabled for activation announcements)
		if (L:GetReverseTranslation(ability_list[ability]) ~= "Challenging Roar") and 
		   (L:GetReverseTranslation(ability_list[ability]) ~= "Frenzied Regeneration") and 
		   (L:GetReverseTranslation(ability_list[ability]) ~= "Survival Instincts") and 
		   (L:GetReverseTranslation(ability_list[ability]) ~= "Barkskin") and 
		   (L:GetReverseTranslation(ability_list[ability]) ~= "Shield Wall") and 
		   (L:GetReverseTranslation(ability_list[ability]) ~= "Last Stand") and 
		   (L:GetReverseTranslation(ability_list[ability]) ~= "Challenging Shout") then
			OptiTaunt.options.args.ability_options.args[ability].args[3] = {
				type = 'toggle',
				order = 4,
				name = L["opt_name_autowhisper"],
				desc = L["opt_desc_autowhisper"],
				get = function()
						return self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].whisper
					  end,
				set = function()
						self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].whisper = 
						not self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].whisper
					  end,
				}
		else
			self.options.args.ability_options.args[ability].args[3] = nil
		end
		
		--Raidwarning
		self.options.args.ability_options.args[ability].args[4] = {
		type = 'toggle',
		order = 3,
		name = L["opt_name_raidwarning"],
		desc = L["opt_desc_raidwarning"],
		get = function()
				return self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].raidwarning
			  end,
		set = function()
			    self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].raidwarning = 
				not self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].raidwarning
		      end,
		}
		
		--custom channels
		for i=5,table.getn(self.channels)/2+4 do
			self.options.args.ability_options.args[ability].args[i] = {
				type = 'toggle',
				name = self.channels[(i-4)*2],
				desc = self.channels[(i-4)*2],
			
				get = function()
					local rc = false
					for j=1,table.getn(self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].channel) do
						if self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].channel[j] == self.channels[(i-4)*2] then 
							rc = true 
						end
					end
					return rc
				end,
				set = function()
					local deletion = false
					for j=1,table.getn(self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].channel) do
						if self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].channel[j] == self.channels[(i-4)*2] then
							table.remove(self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].channel, j)
							deletion=true
						end
					end
					if not deletion then
						table.insert(self.db.profile.outputsettings[L:GetReverseTranslation(ability_list[ability])].channel, self.channels[(i-4)*2])
					end
				end,
			}
		end
	end
end


function OptiTaunt:OnTooltipUpdate()
	
	if (self.tauntresistcount == 0) then
		self.tauntresistpercent = 0
	else
		self.tauntresistpercent = math.floor((self.tauntresistcount / self.tauntcount) * 10000)/100
	end
		
	tablet:SetHint(L["Tooltip"])
	
	local cat = tablet:AddCategory(
       'text', L["Statistics"],
       'columns', 2,
       'child_textR', 1,
       'child_textG', 1,
       'child_textB', 0,
       'child_textR2', 1,
       'child_textG2', 1,
       'child_textB2', 1
   )
   
   cat:AddLine(
       'text', L["Taunts"],
       'text2', self.tauntcount
   )
   
   cat:AddLine(
       'text', L["Resisted"],
       'text2', self.tauntresistcount.." ("..self.tauntresistpercent.."%)"
   ) 
    
end


function OptiTaunt:CHANNEL_UI_UPDATE()
	
	OptiTaunt:dbg("---Entering OptiTaunt:CHANNEL_UI_UPDATE---")
	OptiTaunt:CreateOutputSettings(self.ability_list)

end


function OptiTaunt:COMBAT_LOG_EVENT_UNFILTERED(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)
	
	--debug stuff
	--[[local message = format("%s> %s, %s, %s, %s, %s, %s, %s",
	                       timestamp, eventtype, srcGUID, srcName or "nil", srcFlags or "nil", dstGUID, dstName or "nil", dstFlags or "nil");
	for i = 9, select("#", ...) do
		message = message..", "..(select(i, ...) or "nil");
	end
	OptiTaunt:dbg(message)]]
	
	if (eventtype == "SPELL_MISSED") and (srcGUID == UnitGUID("player")) then
		OptiTaunt:Spell_Missed(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,...)
	end
	
	if (eventtype == "SPELL_CAST_SUCCESS") and (srcGUID == UnitGUID("player")) then
		OptiTaunt:Spell_Cast_Success(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,...)
	end

end


--this is were we actually check for resisted/immune taunts and decide wether to report them or not
function OptiTaunt:Spell_Missed(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool, missType)
	
	OptiTaunt:dbg("---Entering OptiTaunt:Spell_Missed---")
	
	if (missType == "MISS") or (missType == "IMMUNE") then
	
	OptiTaunt:dbg("missType: "..missType)
	OptiTaunt:dbg("spellName: "..spellName)
	
		--check if a spell resisted we are looking for
		if (spellId == 355) --Taunt
		or (spellId == 6795) --Growl
		or (spellId == 694) --Mocking Blow
		or (spellId == 31789) --Righteous Defense
		--or ((spellId == 26985) and self.isDebug) --Wrath (for testing)
		or (spellId == 31935) or (spellId == 32699) or (spellId == 32700) or (spellId == 48826) or (spellId == 48827) then 
		--Avenger's Shield
					
			local doAlert=true
			
			--when aggrocheck is enabled we have to check if we already have aggro
			if (self.db.profile.aggroCheck) and (UnitIsUnit("player","targettarget")) then
				doAlert=false
			end
			
			--when pvpcheck is enabled we check if our target is another player
			if (doAlert) and (self.db.profile.pvpCheck) and (UnitPlayerControlled("target")) then
				doAlert=false
			end
			
			--if all checks were successful we give an alert
			if (doAlert) then
				if (missType == "MISS") then
					self.tauntresistcount = self.tauntresistcount + 1
					if self.db.profile.announceresist then 
						OptiTaunt:giveAlert(spellName, dstName, missType)
						OptiTaunt:giveAudioAlert()
					end
				elseif (missType == "IMMUNE" and self.db.profile.announceimmune) then
					OptiTaunt:giveAlert(spellName, dstName, missType)
					OptiTaunt:giveAudioAlert()
				end
			end
		end
	end
	OptiTaunt:dbg("---Leaving OptiTaunt:Spell_Missed---")
end


--this checks for additional abilities being activated
function OptiTaunt:Spell_Cast_Success(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, spellId, spellName, spellSchool)
	
	OptiTaunt:dbg("---Entering OptiTaunt:Spell_Cast_Success---")
	
	--Taunt
	if (spellId == 355) then
		self.tauntcount = self.tauntcount + 1
	end
	
	--Growl
	if (spellId == 6795) then
		self.tauntcount = self.tauntcount + 1
	end
	
	--Mocking Blow
	if (spellId == 694) then
		self.tauntcount = self.tauntcount + 1
	end
	
	--Avenger's Shield
	if (spellId == 31935) or (spellId == 32699) or (spellId == 32700) or (spellId == 48826) or (spellId == 48827) then
		self.tauntcount = self.tauntcount + 1
	end
	
	--Righteous Defense
	if (spellId == 31789) then
		self.tauntcount = self.tauntcount + 1
	end	
		
	--- this is for announcements
	--Shield Wall
	if (spellId == 871) then
		self.abilityduration="10"
		if (self.db.profile.announceability) then
			OptiTaunt:giveAlert(spellName, _, "ABILITY")
		end
	end
	
	--Last Stand
	if (spellId == 12975) then
		self.abilityduration="20"
		if (self.db.profile.announceability) then
			OptiTaunt:giveAlert(spellName, _, "ABILITY")
		end
	end
	
	--Frenzied Regeneration
	if (spellId == 22842) then
		self.abilityduration="10"
		if (self.db.profile.announceability) then
			OptiTaunt:giveAlert(spellName, _, "ABILITY")
		end
	end
		
	--Survival Instincts
	if (spellId == 50322) or (spellId == 61336) then
		self.abilityduration="20"
		if (self.db.profile.announceability) then
			OptiTaunt:giveAlert(spellName, _, "ABILITY")
		end
	end
	
	--Challenging Shout
	if (spellId == 1161) then
		self.abilityduration="6"
		if (self.db.profile.announceability) then
			OptiTaunt:giveAlert(spellName, _, "ABILITY")
		end
	end
	
	--Challenging Roar
	if (spellId == 5209) then
		self.abilityduration="6"
		if (self.db.profile.announceability) then
			OptiTaunt:giveAlert(spellName, _, "ABILITY")
		end
	end
	
	--Barkskin 
	if (spellId == 22812) and (GetShapeshiftForm(true) == 1) then
		self.abilityduration="12"
		if (self.db.profile.announceability) then
			OptiTaunt:giveAlert(spellName, _, "ABILITY")
		end
	end
	
	OptiTaunt:dbg("---Leaving OptiTaunt:Spell_Cast_Success---")
end	


function OptiTaunt:giveAlert(ability,mob,msgtype)
	
	-- parse warningmessage
	if (msgtype == "MISS") then
		self.warningmessage = string.gsub(string.gsub(self.db.profile.resistmessage, "{t}", mob), "{a}", ability)
	elseif (msgtype == "IMMUNE") then
		self.warningmessage = string.gsub(string.gsub(self.db.profile.immunemessage, "{t}", mob), "{a}", ability)
	elseif (msgtype == "ABILITY") then
		self.warningmessage = string.gsub(string.gsub(self.db.profile.abilitymessage, "{a}", ability), "{d}", self.abilityduration)
	end
	
	--only for testing
	--if (self.isDebug) then
	--	SendChatMessage(self.warningmessage, "SAY")
	--end
	
	-- Say
	if self.db.profile.outputsettings[L:GetReverseTranslation(ability)].say then
		SendChatMessage(self.warningmessage, "SAY")
	end
	
	-- Party- or Raidchat warning
	if self.db.profile.outputsettings[L:GetReverseTranslation(ability)].raid then
		if (GetNumRaidMembers() > 0) then
			SendChatMessage(self.warningmessage, "RAID")
		elseif (GetNumPartyMembers() > 0) then
			SendChatMessage(self.warningmessage, "PARTY")
		end
	end
	
	-- Raidwarning
	if self.db.profile.outputsettings[L:GetReverseTranslation(ability)].raidwarning then
		if (GetNumRaidMembers() > 0) and IsRaidOfficer() then
			SendChatMessage(self.warningmessage, "RAID_WARNING")
		end
	end
	
	-- custom channel warning
	for j=1,table.getn(self.db.profile.outputsettings[L:GetReverseTranslation(ability)].channel) do
		if (self.db.profile.outputsettings[L:GetReverseTranslation(ability)].channel[j] ~= nil) then 
			local index = GetChannelName(self.db.profile.outputsettings[L:GetReverseTranslation(ability)].channel[j])
			if (index~=nil) then 
				SendChatMessage(self.warningmessage, "CHANNEL", nil, index); 
			end
		end
	end
	
	if (msgtype ~= "ABILITY") then
			
		-- Autowhisper
		if self.db.profile.outputsettings[L:GetReverseTranslation(ability)].whisper and (UnitName("targettarget") ~= nil) and (UnitPlayerControlled("targettarget")) then
			_, englishClass = UnitClass("targettarget");
		
			if (not self.db.profile.whisperWarriors and englishClass == "WARRIOR") then
			-- This (below) is planned but so far we are not sure if a we are talking to a tankadin or a feral druid...
			--if (not self.db.profile.whisperWarriors and englishClass == "WARRIOR" or "PALADIN" or "DRUID") then
				--
			else
				-- we will do class dependent warnings, just for fun
				if (englishClass == "WARRIOR") then
					self.ResistWhisperMessage = L["Resist-Whisper-Message-Warrior"]
				elseif (englishClass == "DRUID") then
					self.ResistWhisperMessage = L["Resist-Whisper-Message-Druid"]
				elseif (englishClass == "MAGE") then
					self.ResistWhisperMessage = L["Resist-Whisper-Message-Mage"]
				elseif (englishClass == "WARLOCK") then
					self.ResistWhisperMessage = L["Resist-Whisper-Message-Warlock"]
				elseif (englishClass == "PALADIN") then
					self.ResistWhisperMessage = L["Resist-Whisper-Message-Paladin"]
				elseif (englishClass == "PRIEST") then
					self.ResistWhisperMessage = L["Resist-Whisper-Message-Priest"]
				elseif (englishClass == "HUNTER") then
					self.ResistWhisperMessage = L["Resist-Whisper-Message-Hunter"]
				elseif (englishClass == "ROGUE") then
					self.ResistWhisperMessage = L["Resist-Whisper-Message-Rogue"]
				else
					self.ResistWhisperMessage = L["Resist-Whisper-Message-Shaman"]
				end
				
				SendChatMessage(self.warningmessage.." "..self.ResistWhisperMessage, "WHISPER", nil, UnitName("targettarget"));
			end
		end
	end
end

function OptiTaunt:giveAudioAlert()
	if (self.db.profile.giveAudioWarning) then
			PlaySound("GAMEHIGHLIGHTFRIENDLYUNIT"); --workaround from wowace-forums for buggy soundsystem
			PlaySoundFile(self.tauntsoundfile);
	end
end

--Toggle Options
function OptiTaunt:IsShowInRaidAnnouncement()
    return self.db.profile.showInRaidAnnouncement
end

function OptiTaunt:ToggleShowInRaidAnnouncement()
    self.db.profile.showInRaidAnnouncement = not self.db.profile.showInRaidAnnouncement
end

function OptiTaunt:IsShowInRaidPartyChat()
    return self.db.profile.showInRaidPartyChat
end

function OptiTaunt:ToggleShowInRaidPartyChat()
    self.db.profile.showInRaidPartyChat = not self.db.profile.showInRaidPartyChat
end

function OptiTaunt:IsAutoWhisper()
    return self.db.profile.autoWhisper
end

function OptiTaunt:ToggleAutoWhisper()
    self.db.profile.autoWhisper = not self.db.profile.autoWhisper
end

function OptiTaunt:IsGiveAudioWarning()
    return self.db.profile.giveAudioWarning
end

function OptiTaunt:ToggleGiveAudioWarning()
    self.db.profile.giveAudioWarning = not self.db.profile.giveAudioWarning
end

function OptiTaunt:IsAggroCheck()
    return self.db.profile.aggroCheck
end

function OptiTaunt:ToggleAggroCheck()
    self.db.profile.aggroCheck = not self.db.profile.aggroCheck
end

function OptiTaunt:IsWhisperWarriors()
    return self.db.profile.whisperWarriors
end

function OptiTaunt:ToggleWhisperWarriors()
    self.db.profile.whisperWarriors = not self.db.profile.whisperWarriors
end

function OptiTaunt:IsPvPCheck()
    return self.db.profile.pvpCheck
end

function OptiTaunt:TogglePvPCheck()
    self.db.profile.pvpCheck = not self.db.profile.pvpCheck
end

function OptiTaunt:GetResistMessage()
	return self.db.profile.resistmessage
end
	
function OptiTaunt:SetResistMessage(arg1)
	self.db.profile.resistmessage = arg1
end

function OptiTaunt:GetImmuneMessage()
	return self.db.profile.immunemessage
end
	
function OptiTaunt:SetImmuneMessage(arg1)
	self.db.profile.immunemessage = arg1
end
                   
function OptiTaunt:GetAbilityMessage()
	return self.db.profile.abilitymessage
end
	
function OptiTaunt:SetAbilityMessage(arg1)
	self.db.profile.abilitymessage = arg1
end

function OptiTaunt:ResetCounters()
	self.tauntcount = 0
	self.tauntresistcount = 0
	self.tauntresistpercent = 0
end

function OptiTaunt:IsAnnounceResist()
	return self.db.profile.announceresist
end

function OptiTaunt:ToggleAnnounceResist()
	self.db.profile.announceresist = not self.db.profile.announceresist
end

function OptiTaunt:IsAnnounceImmune()
	return self.db.profile.announceimmune
end

function OptiTaunt:ToggleAnnounceImmune()
	self.db.profile.announceimmune = not self.db.profile.announceimmune
end

function OptiTaunt:IsAnnounceAbility()
	return self.db.profile.announceability
end

function OptiTaunt:ToggleAnnounceAbility()
	self.db.profile.announceability = not self.db.profile.announceability
end
