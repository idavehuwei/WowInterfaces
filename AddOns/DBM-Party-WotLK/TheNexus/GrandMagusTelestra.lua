local mod = DBM:NewMod("GrandMagusTelestra", "DBM-Party-WotLK", 8)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 437 $"):sub(12, -3))
mod:SetCreatureID(26731)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"UNIT_HEALTH",
	"CHAT_MSG_MONSTER_YELL"
)

local warningSplitSoon		= mod:NewAnnounce("WarningSplitSoon", 2, 19569)
local warningSplitNow		= mod:NewAnnounce("WarningSplitNow", 3, 19569)
local warningMerge		= mod:NewAnnounce("WarningMerge", 2, 40105)

local warnedSplit = false

function mod:OnCombatStart()
	warnedSplit = false
end

function mod:UNIT_HEALTH(arg1)
	if UnitName(arg1) == L.name then
		local h = UnitHealth(arg1)
		if h>85 then
			warnedSplit = false
		elseif h>50 and h<54 and not warnedSplit then
			warningSplitSoon:Show()
			warnedSplit = true
		end
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L.SplitTrigger1 or msg == L.SplitTrigger2 then
		warningSplitNow:Show()
	elseif msg == L.MergeTrigger then
		warningMerge:Show()
	end
end