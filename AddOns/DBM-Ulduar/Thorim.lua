local mod = DBM:NewMod("Thorim", "DBM-Ulduar")
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 1176 $"):sub(12, -3))
mod:SetCreatureID(32865)
mod:SetZone()

mod:RegisterCombat("yell", L.YellPhase1)
mod:RegisterKill("yell", L.YellKill)

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"CHAT_MSG_MONSTER_YELL",
	"SPELL_CAST_SUCCESS",
	"SPELL_DAMAGE"
)

local enrageTimer		= mod:NewEnrageTimer(369)

local timerStormhammer		= mod:NewCastTimer(16, 62042)
local timerLightningCharge 	= mod:NewCDTimer(16, 62466) 
local timerUnbalancingStrike	= mod:NewCastTimer(21, 62130)
local timerHardmode		= mod:NewTimer(175, "TimerHardmode", 62042)

local warnPhase2		= mod:NewAnnounce("WarningPhase2", 1)
local warnStormhammer		= mod:NewAnnounce("WarningStormhammer", 2, 62470)
local warnLightningCharge	= mod:NewAnnounce("WarningLightningCharge", 2, 62466)
local warnUnbalancingStrike	= mod:NewAnnounce("UnbalancingStrike", 4, 62130)	-- nice blizzard, very new stuff, hmm or not? ^^ aq40 4tw :)
local warningBomb		= mod:NewAnnounce("WarningBomb", 4)

local specWarnOrb		= mod:NewSpecialWarning("LightningOrb")

local lastcharge = {} 
mod:AddBoolOption("RangeFrame")
mod:AddBoolOption("AnnounceFails", false, "announce") 

function mod:OnCombatStart(delay)
	enrageTimer:Start()
	timerHardmode:Start()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(10)
	end
	table.wipe(lastcharge) 
end

local sortedFailsC = {}
local function sortFails1C(e1, e2)
	return (lastcharge[e1] or 0) > (lastcharge[e2] or 0)
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
	if self.Options.AnnounceFails and DBM:GetRaidRank() >= 1 then
		local lcharge = ""
		for k, v in pairs(lastcharge) do
			table.insert(sortedFailsC, k)
		end
		table.sort(sortedFailsC, sortFails1C)
		for i, v in ipairs(sortedFailsC) do
			lcharge = lcharge.." "..v.."("..(lastcharge[v] or "")..")"
		end
		SendChatMessage(L.Charge:format(lcharge), "RAID")
		table.wipe(sortedFailsC)
	end
end


function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 62042 then 					-- Storm Hammer
		warnStormhammer:Show(args.destName)

	elseif args.spellId == 62130 then				-- Unbalancing Strike
		warnUnbalancingStrike:Show(args.destName)
		
	elseif args.spellId == 62526 or args.spellId == 62527 then	-- Runic Detonation - missing 10ppl ID
		self:SetIcon(args.destName, 8, 5)
		warningBomb:Show(args.destName)
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 62042 then 		-- Storm Hammer
		timerStormhammer:Schedule(2)
	elseif args.spellId == 62466 then   	-- Lightning Charge
		timerLightningCharge:Start()	
	elseif args.spellId == 62130 then	-- Unbalancing Strike
		timerUnbalancingStrike:Start()
	end
end


function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L.YellPhase2 then		-- Bossfight (tank and spank)
		self:SendSync("Phase2")
	end
end

local spam = 0
function mod:SPELL_DAMAGE(args)
	if args.spellId == 62017 then -- Lightning Shock
		if bit.band(args.destFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) ~= 0
		and bit.band(args.destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) ~= 0
		and GetTime() - spam > 5 then
			spam = GetTime()
			specWarnOrb:Show()
		end
	elseif self.Options.AnnounceFails and args.spellId == 62466 and DBM:GetRaidRank() >= 1 and DBM:GetRaidUnitId(args.destName) ~= "none" and args.destName then
		lastcharge[args.destName] = (lastcharge[args.destName] or 0) + 1
		SendChatMessage(L.ChargeOn:format(args.destName), "RAID")
	end
end

function mod:OnSync(event, arg)
	if event == "Phase2" then
		warnPhase2:Show()
		enrageTimer:Stop()
		timerHardmode:Stop()
		enrageTimer:Start(300)
	end
end



