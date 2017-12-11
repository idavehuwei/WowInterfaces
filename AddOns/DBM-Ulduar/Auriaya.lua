local mod = DBM:NewMod("Auriaya", "DBM-Ulduar")
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1162 $"):sub(12, -3))

mod:SetZone()

mod:SetCreatureID(33515)
mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_CAST_START",
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED_DOSE",
	"SPELL_AURA_REMOVED",
	"SPELL_DAMAGE"
)

local canInterrupt
do
	local class = select(2, UnitClass("player"))
	canInterrupt = class == "SHAMAN"
		or class == "WARRIOR"
		or class == "ROGUE"
		or class == "MAGE"
end


mod:AddBoolOption("HealthFrame", true)

local warnSwarm 	= mod:NewAnnounce("WarnSwarm", 2, 64396)

local specWarnBlast	= mod:NewSpecialWarning("SpecWarnBlast", canInterrupt)
local specWarnVoid 	= mod:NewSpecialWarning("SpecWarnVoid")
local warnFear 		= mod:NewAnnounce("WarnFear", 3, 64386)
local warnFearSoon 	= mod:NewAnnounce("WarnFearSoon", 1, 64386)
local warnCatDied 	= mod:NewAnnounce("WarnCatDied", 3, 64455)
local warnCatDiedOne	= mod:NewAnnounce("WarnCatDiedOne", 3, 64455)
local warnSonic		= mod:NewAnnounce("WarnSonic", 2, 64688)

local timerFear 	= mod:NewCastTimer(64386)
local timerNextFear 	= mod:NewNextTimer(35.5, 64386)
local timerSonic	= mod:NewCastTimer(64688)

local isFeared = false

local enrageTimer				= mod:NewEnrageTimer(600)

function mod:OnCombatStart(delay)
	enrageTimer:Start(-delay)
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 64678 or args.spellId == 64389 then -- Sentinel Blast
		specWarnBlast:Show()
	elseif args.spellId == 64386 then -- Terrifying Screech
		warnFear:Show()
		timerFear:Start()
		timerNextFear:Schedule(2)
		warnFearSoon:Schedule(34)
	elseif args.spellId == 64688 or args.spellId == 64422 then --Sonic Screech
		warnSonic:Show()
		timerSonic:Start()
		-- What about adding a "soon" timer. It seems to be 25-35 seconds between Sonic Screeches
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 64396 then -- Guardian Swarm
		warnSwarm:Show(args.destName)
	elseif args.spellId == 64455 then -- Feral Essence
		DBM.BossHealth:AddBoss(34035, L.Defender:format(9))
	elseif args.spellId == 64386 and args.destName == UnitName("player") then
		isFeared = true		
	end
end

function mod:SPELL_AURA_REMOVED_DOSE(args)
	if args.spellId == 64455 then -- Feral Essence
		if args.amount == 1 then
			warnCatDiedOne:Show()
		else
			warnCatDied:Show(args.amount)
		end
		if self.Options.HealthFrame then
			DBM.BossHealth:RemoveBoss(34035)
			DBM.BossHealth:AddBoss(34035, L.Defender:format(args.amount))
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 64455 then -- Feral Essence
		if self.Options.HealthFrame then
			DBM.BossHealth:RemoveBoss(34035)
		end
	elseif args.spellId == 64386 and args.destName == UnitName("player") then
		isFeared = false	
	end
	
end

function mod:SPELL_DAMAGE(args)
	if (args.spellId == 64459 or args.spellId == 64675) and args.destName == UnitName("player") then
		specWarnVoid:Show()
	end
end
		
		

