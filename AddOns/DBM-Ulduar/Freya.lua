local mod = DBM:NewMod("Freya", "DBM-Ulduar")
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1052 $"):sub(12, -3))
mod:SetZone()

mod:SetCreatureID(32906)
mod:RegisterCombat("combat")
mod:RegisterKill("yell", L.YellKill)

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_REMOVED",
	"UNIT_DIED",
	"CHAT_MSG_MONSTER_YELL"
)

mod:AddBoolOption("HealthFrame", true)

local warnPhase2 = mod:NewAnnounce("WarnPhase2", 3)
local warnSimulKill = mod:NewAnnounce("WarnSimulKill", 1)
local warnFury = mod:NewAnnounce("WarnFury", 2, 63571)

local specWarnFury = mod:NewSpecialWarning("SpecWarnFury")

local enrage = mod:NewEnrageTimer(600)

local timerAlliesOfNature	= mod:NewTimer(60, "TimerAlliesOfNature", 62678)
local timerSimulKill		= mod:NewTimer(60, "TimerSimulKill")
local timerFuryYou		= mod:NewTimer(10, "TimerFuryYou", 63571)
local timerTremorCD 	= mod:NewCDTimer(28, 62859) 
local warnTremor		= mod:NewSpecialWarning("WarningTremor")

local adds = {}

function mod:OnCombatStart(delay)
	enrage:Start()
	table.wipe(adds)
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 62519 then
		warnPhase2:Show()
	end
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 62437 or args.spellId == 62859 then
		warnTremor:Show()
		timerTremorCD:Start()
	end
end 


local altIcon = true
function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 62678 then -- Summon Allies of Nature
		timerAlliesOfNature:Start()
	elseif args.spellId == 63571 or args.spellId == 62589 then -- Nature's Fury
		altIcon = not altIcon	--Alternates between Skull and X
		self:SetIcon(args.destName, altIcon and 7 or 8, 10)
		warnFury:Show(args.destName)
		if args.destName == UnitName("player") then -- only cast on players; no need to check destFlags
			specWarnFury:Show()
			timerFuryYou:Start()
		end
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L.SpawnYell then
		if self.Options.HealthFrame then
			if not adds[33202] then DBM.BossHealth:AddBoss(33202, L.WaterSpirit) end -- ancient water spirit
			if not adds[32916] then DBM.BossHealth:AddBoss(32916, L.Snaplasher) end  -- snaplasher
			if not adds[32919] then DBM.BossHealth:AddBoss(32919, L.StormLasher) end -- storm lasher
		end
		adds[33202] = true
		adds[32916] = true
		adds[32919] = true
	end
end

function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 33202 or cid == 32916 or cid == 32919 then
		if self.Options.HealthFrame then
			DBM.BossHealth:RemoveBoss(cid)
		end
		if not timerSimulKill:IsStarted() then
			timerSimulKill:Start()
			warnSimulKill:Show()
		end
		adds[cid] = nil
		local counter = 0
		for i, v in pairs(adds) do
			counter = counter + 1
		end
		if counter == 0 then
			timerSimulKill:Stop()
		end
	end
end


