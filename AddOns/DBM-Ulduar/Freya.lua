local mod = DBM:NewMod("Freya", "DBM-Ulduar")
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1175 $"):sub(12, -3))
mod:SetZone()

mod:SetCreatureID(32906)
mod:RegisterCombat("combat")
mod:RegisterKill("yell", L.YellKill)

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"SPELL_AURA_REMOVED",
	"UNIT_DIED",
	"CHAT_MSG_MONSTER_YELL",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED"
)

-- Trash: 33430 Guardian Lasher (so ne blume)
-- 33355 (nymphe)
-- 33354 (baum)

--
-- Elder Stonebark (ground tremor / fist of stone)
-- Elder Brightleaf (unstable sunbeam)


mod:AddBoolOption("HealthFrame", true)

local warnPhase2		= mod:NewAnnounce("WarnPhase2", 3)
local warnSimulKill		= mod:NewAnnounce("WarnSimulKill", 1)
local warnFury			= mod:NewAnnounce("WarnFury", 2, 63571)
local warnRoots			= mod:NewAnnounce("WarnRoots", 2, 63601)

local specWarnFury		= mod:NewSpecialWarning("SpecWarnFury")

local enrage 			= mod:NewEnrageTimer(600)

local timerAlliesOfNature	= mod:NewNextTimer(60, 62678)
local timerSimulKill		= mod:NewTimer(12, "TimerSimulKill")
local timerFury			= mod:NewTargetTimer(10, 63571)
local timerTremorCD 		= mod:NewCDTimer(28, 62859) 
local warnTremor		= mod:NewSpecialWarning("WarningTremor")	-- Hardmode
local specWarnBeam		= mod:NewSpecialWarning("UnstableEnergy")		-- Hardmode

mod:AddBoolOption("PlaySoundOnFury")

local adds = {}


function mod:OnCombatStart(delay)
	enrage:Start()
	table.wipe(adds)
end

function mod:OnCombatEnd()
	DBM.BossHealth:Hide()
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
			if self.Options.PlaySoundOnFury then
				PlaySoundFile("Sound\\Creature\\HoodWolf\\HoodWolfTransformPlayer01.wav")
			end
			specWarnFury:Show()
		end
		timerFury:Start(args.destName)
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

local killTime = 0
function mod:UNIT_DIED(args)
	local cid = self:GetCIDFromGUID(args.destGUID)
	if cid == 33202 or cid == 32916 or cid == 32919 then
		if self.Options.HealthFrame then
			DBM.BossHealth:RemoveBoss(cid)
		end
		if (GetTime() - killTime) > 20 then
			killTime = GetTime()
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


local rootedPlayers = {}
local function showRootWarning()
	warnRoots:Show(table.concat(rootedPlayers, "< >"))
	table.wipe(rootedPlayers)
end

local iconId = 6
function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 62861 or args.spellId == 62438 then
		iconId = iconId - 1
		self:SetIcon(args.destName, iconId, 15)
		table.insert(rootedPlayers, args.destName)
		self:Unschedule(showRootWarning)
		if #rootedPlayers >= 3 then
			showRootWarning()
		else
			self:Schedule(0.5, showRootWarning)
		end

	elseif (args.spellId == 62451 or args.spellId == 62865) and args.destName == UnitName("player")  then
		specWarnBeam:Show()
	end 
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 62861 or args.spellId == 62438 then
		self:RemoveIcon(args.destName)
		iconId = iconId + 1
	end
end



