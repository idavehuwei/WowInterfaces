local mod = DBM:NewMod("Razorscale", "DBM-Ulduar")
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1046 $"):sub(12, -3))
mod:SetCreatureID(33186)
mod:SetZone()

--mod:RegisterCombat("combat")
mod:RegisterCombat("yell", L.YellAir)

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_DAMAGE",
	"UNIT_TARGET",
	"CHAT_MSG_MONSTER_YELL",
	"CHAT_MSG_RAID_BOSS_EMOTE"
)

local specWarnDevouringFlame		= mod:NewSpecialWarning("SpecWarnDevouringFlame")
local timerDeepBreathCooldown		= mod:NewCDTimer(21, 64021)
local timerDeepBreathCast		= mod:NewCastTimer(2.5, 64021)
local warnTurretsReadySoon		= mod:NewAnnounce("warnTurretsReadySoon", 1)
local warnTurretsReady			= mod:NewAnnounce("warnTurretsReady", 3)

local timerTurret1			= mod:NewTimer(55, "timerTurret1")
local timerTurret2			= mod:NewTimer(75, "timerTurret2")
local timerTurret3			= mod:NewTimer(95, "timerTurret3")
local timerTurret4			= mod:NewTimer(115, "timerTurret4")
local timerGroundedTemp			= mod:NewTimer(45, "timerGroundedTemp")

local enrageTimer			= mod:NewEnrageTimer(600)

local specWarnDevouringFlameCast	= mod:NewSpecialWarning("SpecWarnDevouringFlameCast")
local warnDevouringFlameCast		= mod:NewAnnounce("WarnDevouringFlameCast", 2, 64733) 

mod:AddBoolOption("PlaySoundOnDevouringFlame", false, "announce")

local castFlames

function mod:OnCombatStart(delay)
	enrageTimer:Start(-delay)
	if GetInstanceDifficulty() == 1 then
		warnTurretsReadySoon:Schedule(70-delay)
		warnTurretsReady:Schedule(75-delay)
		timerTurret1:Start(-delay)
		timerTurret2:Start(-delay)
	else
		warnTurretsReadySoon:Schedule(95-delay)
		warnTurretsReady:Schedule(115-delay)
		timerTurret1:Start(-delay) -- 55sec
		timerTurret2:Start(-delay) -- +20
		timerTurret3:Start(-delay) -- +20
		timerTurret4:Start(-delay) -- +20
	end
end

function mod:SPELL_DAMAGE(args)
	if args.spellId == 64733 and args.destName == UnitName("player") then
		specWarnDevouringFlame:Show()
		if self.Options.PlaySoundOnDevouringFlame then
			PlaySoundFile("Sound\\Creature\\HoodWolf\\HoodWolfTransformPlayer01.wav")
		end		
	end
end


function mod:CHAT_MSG_RAID_BOSS_EMOTE(emote)
	if emote == L.EmotePhase2 then
		-- phase2
		timerTurret1:Stop()
		timerTurret2:Stop()
		timerTurret3:Stop()
		timerTurret4:Stop()
		timerGroundedTemp:Stop()
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg, mob)
	if msg == L.YellAir then
		if GetInstanceDifficulty() == 1 then
			warnTurretsReadySoon:Schedule(70)
			warnTurretsReady:Schedule(75)
			timerTurret1:Start()
			timerTurret2:Start()
		else
			warnTurretsReadySoon:Schedule(95)
			warnTurretsReady:Schedule(115)
			timerTurret1:Start()
			timerTurret2:Start()
			timerTurret3:Start()
			timerTurret4:Start()
		end

	elseif msg == L.YellGroundTemp then
		timerGroundedTemp:Start()
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 64021 then	-- deep breath
		timerDeepBreathCast:Start()
		timerDeepBreathCooldown:Start()
	elseif args.spellId == 63236 then
		local target = self:GetBossTarget(self.creatureId)
		if target then
			self:flameCast(target)
		else
			castFlames = true
		end
	end
end

function mod:UNIT_TARGET(unit)	-- I think this is useless, why have anyone in the raid razorflame as target? (this is required for this function)
	if castFlames and self:GetUnitCreatureId(unit.."target") == self.creatureId then
		local target = UnitName(unit.."targettarget")
		if target then
			self:flameCast(target)
		else
			self:flameCast(L.FlamecastUnknown)
		end
		castFlames = false
	end
end 

function mod:flameCast(target)
	warnDevouringFlameCast:Show(target)
	if target == UnitName("player") then
		specWarnDevouringFlameCast:Show()
	end
	self:SetIcon(target, 8, 9)
end 

