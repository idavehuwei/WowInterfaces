local mod = DBM:NewMod("GeneralVezax", "DBM-Ulduar")
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 924 $"):sub(12, -3))
mod:SetCreatureID(33271)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_INTERRUPT",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"SPELL_CAST_SUCCESS",
	"CHAT_MSG_RAID_BOSS_EMOTE"
)

local specWarnShadowCrash	= mod:NewSpecialWarning("SpecialWarningShadowCrash")
local specWarnSurgeDarkness	= mod:NewSpecialWarning("SpecialWarningSurgeDarkness", false)
local specWarnLifeLeechYou	= mod:NewSpecialWarning("SpecialWarningLLYou")
local specWarnLifeLeechNear 	= mod:NewSpecialWarning("SpecialWarningLLNear")

local timerEnrage		= mod:NewEnrageTimer(600)
local timerSearingFlamesCast	= mod:NewCastTimer(2, 62661) -- "timerSearingFlamesCast",
local timerSurgeofDarkness	= mod:NewBuffActiveTimer(10, 62662) -- "timerSurgeofDarkness",
local timerSaroniteVapors	= mod:NewNextTimer(30, 63322) -- "timerSaroniteVapors",

local warnShadowCrash	= mod:NewAnnounce("WarningShadowCrash", 4, 62660)

mod:AddBoolOption("SetIconOnShadowCrash", true, "announce")
mod:AddBoolOption("SetIconOnLifeLeach", true, "announce")
mod:AddBoolOption("CrashWhisper", false, "announce")

function mod:OnCombatStart(delay)
	timerEnrage:Start(-delay)
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 62661 then	-- Searing Flames
		timerSearingFlamesCast:Start()

	elseif args.spellId == 62662 then 
		specWarnSurgeDarkness:Show()
		if self.Options.SpecialWarningSurgeDarkness then
			PlaySoundFile("Sound\\Creature\\HoodWolf\\HoodWolfTransformPlayer01.wav")
		end
	end
end

function mod:SPELL_INTERRUPT(args)
	if args.spellId == 62661 then
		timerSearingFlamesCast:Stop()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 62662 then	-- Surge of Darkness
		timerSurgeofDarkness:Start()
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 62662 then	
		timerSurgeofDarkness:Stop()
	end
end

function mod:ShadowCrashTarget()
	local targetname = self:GetBossTarget()
	if not targetname then return end
	if self.Options.SetIconOnShadowCrash then
		self:SetIcon(targetname, 8, 10)
	end
	
	if DBM:GetRaidRank() >= 1 and self.Options.CrashWhisper then
		self:SendWhisper(L.CrashWhisper, targetname)
	end
	warnShadowCrash:Show(targetname)
	if targetname == UnitName("player") then
		specWarnShadowCrash:Show(targetname)
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 62660 then		-- Shadow Crash
		self:ScheduleMethod(0.1, "ShadowCrashTarget")
	elseif args.spellId == 63276 then	-- Mark of the Faceless
		if self.Options.SetIconOnLifeLeach then
			mod:SetIcon(args.destName, 7, 10)
		end
		if args.destName == UnitName("player") then
			specWarnLifeLeechYou:Show()
		else
			local uId = DBM:GetRaidUnitId(args.destName)
			if uId then
				local inRange = CheckInteractDistance(uId, 2)
				if inRange then
					specWarnLifeLeechNear:Show(args.destName)
				end
			end
		end
	end
end

function mod:CHAT_MSG_RAID_BOSS_EMOTE(emote)
	if emote == L.EmoteSaroniteVapors then
		timerSaroniteVapors:Start()
	end
end


