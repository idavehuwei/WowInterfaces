local mod = DBM:NewMod("YoggSaron", "DBM-Ulduar")
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1037 $"):sub(12, -3))
mod:SetCreatureID(33288)
mod:SetZone()

mod:RegisterCombat("yell", L.YellPull)

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_SUMMON",
	"CHAT_MSG_MONSTER_YELL",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"SPELL_AURA_REMOVED_DOSE",
	"UNIT_HEALTH",
	"UNIT_DIED",
	"CHAT_MSG_MONSTER_YELL"
)


local warnGuardianSpawned 		= mod:NewAnnounce("WarningGuardianSpawned", 3, 62979)
local warnP2 				= mod:NewAnnounce("WarningP2", 2)
local warnP3 				= mod:NewAnnounce("WarningP3", 2)
local warnSanity 			= mod:NewAnnounce("WarningSanity", 3)
local specWarnGuardianLow 		= mod:NewSpecialWarning("SpecWarnGuardianLow", false)
local warnBrainLink 			= mod:NewAnnounce("WarningBrainLink", 2)
local specWarnBrainLink 		= mod:NewSpecialWarning("SpecWarnBrainLink")
local specWarnSanity 			= mod:NewSpecialWarning("SpecWarnSanity")
local warnMadness 			= mod:NewAnnounce("WarnMadness", 1)
local timerMadness 			= mod:NewCastTimer(60, 64059)
local specWarnMadnessOutNow		= mod:NewSpecialWarning("SpecWarnMadnessOutNow")
local warnBrainPortalSoon		= mod:NewAnnounce("WarnBrainPortalSoon", 1)
local warnSqueeze			= mod:NewAnnounce("WarnSqueeze", 1)
local brainportal			= mod:NewTimer(27, "NextPortal")

mod:AddBoolOption("ShowSaraHealth")
mod:AddBoolOption("WhisperBrainLink", false)
mod:AddBoolOption("WarningSqueeze", false, "announce")
mod:AddBoolOption("SetIconOnFearTarget")

local enrageTimer	= mod:NewEnrageTimer(900)

local phase = 1
local targetWarningsShown = {}
local brainLink1

function mod:OnCombatStart(delay)
	phase = 1
	brainLink1 = nil
	enrageTimer:Start()
	if self.Options.ShowSaraHealth and not self.Options.HealthFrame then
		DBM.BossHealth:Show(L.name)
	end
	if self.Options.ShowSaraHealth then
		DBM.BossHealth:AddBoss(33134, L.Sara)
	end
	table.wipe(targetWarningsShown)
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 64059 then	-- Induce Madness
		timerMadness:Start()
		warnMadness:Show()
		brainportal:Schedule(60)
		warnBrainPortalSoon:Schedule(85)
		specWarnMadnessOutNow:Schedule(56)
	end
end

function mod:SPELL_SUMMON(args)
	if args.spellId == 62979 then
		warnGuardianSpawned:Show()
	end
end

-- 4/24 21:56:29.656  SPELL_AURA_APPLIED,0xF150008208022C87,"Yogg-Saron",0xa48,0xF150008208022C87,"Yogg-Saron",0xa48,63894,"Shadowy Barrier",0x20,BUFFfunction mod:SPELL_AURA_APPLIED(args)

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 63802 then		-- Brain Link
		if not brainLink1 then
			self:SetIcon(args.destName, 6, 30)
			brainLink1 = args.destName
		else
			self:SetIcon(args.destName, 7, 30)
			warnBrainLink:Show(brainLink1, args.destName)
			self:AnnounceBrainLink(brainLink1, args.destName)
			self:AnnounceBrainLink(args.destName, brainLink1)
			brainLink1 = nil
		end

	elseif args.spellId == 63830 and self.Options.SetIconOnFearTarget then	-- Malady of the Mind (Fear)
		self:SetIcon(args.destName, 8, 30)

	elseif args.spellId == 64126 then	-- Squeeze		
		warnSqueeze:Show(args.destName)		
		if args.destName == UnitName("player") and self.Options.WarningSqueeze then			
			SendChatMessage(L.WarningYellSqueeze, "YELL")			
		end	

	elseif args.spellId == 63894 then	-- Shadowy Barrier of Yogg-Saron (this is happening when p2 starts)
		phase = 2
		brainportal:Start(60)
		warnBrainPortalSoon:Schedule(57)
		warnP2:Show()
		if self.Options.ShowSaraHealth then
			DBM.BossHealth:RemoveBoss(33134)
			if not self.Options.HealthFrame then
				DBM.BossHealth:Hide()
			end
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 63894 then		-- Shadowy Barrier removed from Yogg-Saron (start p3)
		warnP3:Show()
		phase = 3
		brainportal:Stop()
	end
end

function mod:AnnounceBrainLink(player, other)
	if player == UnitName("player") then
		specWarnBrainLink:Show(other)
	end
	if DBM:GetRaidRank() >= 1 and self.Options.WhisperBrainLink then
		self:SendWhisper(L.WhisperBrainLink:format(other), player)
	end
end


function mod:SPELL_AURA_REMOVED_DOSE(args)
	if args.spellId == 63050 and args.destGUID == UnitGUID("player") then
		if args.amount == 50 then
			warnSanity:Show(args.amount)
		elseif args.amount == 25 or args.amount == 15 or args.amount == 5 then
			warnSanity:Show(args.amount)
			specWarnSanity:Show(args.amount)
		end
	end
end

function mod:UNIT_HEALTH(uId)
	if phase == 1 and uId == "target" and self:GetUnitCreatureId(uId) == 33136 and UnitHealth(uId) / UnitHealthMax(uId) <= 0.3 and not targetWarningsShown[UnitGUID(uId)] then
		targetWarningsShown[UnitGUID(uId)] = true
		specWarnGuardianLow:Show()
	end
end

--[[
function mod:UNIT_DIED(args)
	if self:GetCIDFromGUID(args.srcGUID) == 33983 then
		timerMadness:Stop()
	end
end
function mod:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L.YellPhase2 then
		self:SendSync("Phase2")
	end
end
function mod:OnSync(event, args)
	if event == "Phase2" and phase == 1 then
		phase = 2
		brainportal:Start(70)
		warnBrainPortalSoon:Schedule(70)
		warnP2:Show()
		--if self.Options.ShowSaraHealth and self:GetCIDFromGUID(args.destGUID) == 33134 then
		if self.Options.ShowSaraHealth then
			DBM.BossHealth:RemoveBoss(33134)
			if not self.Options.HealthFrame then
				DBM.BossHealth:Hide()
			end
		end
	end
end
--]]


