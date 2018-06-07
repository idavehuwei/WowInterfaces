-------------------
-- 自动取消豹守、误导喊话
-------------------
AntiDaze = HunterMod:NewModule("AntiDaze", "AceEvent-3.0", "AceHook-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("HunterMod");

local groupmate = bit.bor( 
	COMBATLOG_OBJECT_AFFILIATION_MINE, 
	COMBATLOG_OBJECT_AFFILIATION_PARTY,
	COMBATLOG_OBJECT_REACTION_FRIENDLY, 
	COMBATLOG_OBJECT_CONTROL_PLAYER, 
	COMBATLOG_OBJECT_CONTROL_NPC, 
	COMBATLOG_OBJECT_TYPE_PLAYER, 
	COMBATLOG_OBJECT_TYPE_PET, 
	COMBATLOG_OBJECT_TYPE_GUARDIAN, 
	COMBATLOG_OBJECT_TYPE_OBJECT
);
 
local function UnitIsA(unitFlags, flagType) 
	if (bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_AFFILIATION_MASK) > 0 and
		bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_REACTION_MASK) > 0 and 
		bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_CONTROL_MASK) > 0 and 
		bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_TYPE_MASK) > 0) or 
		bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_SPECIAL_MASK) > 0 then 
		
		return true 
	end 
	return false 
end 

function AntiDaze:IsBuffActive(name)
	local i = 1;
	local buffName = UnitBuff("player", i);
	while (buffName) do
		if (buffName == name) then
			return i; 
		end 
		i = i + 1; 
		buffName = UnitBuff("player", i);
	end 
	return 0; 
end 

function AntiDaze:AntiDaze(guid) 
	local buffID = self:IsBuffActive(L["ASPECT_PACK"]);
	if (guid == UnitGUID("player")) then
		buffID = self:IsBuffActive(L["ASPECT_CHEETAH"]);
	end 
	
	if (buffID and buffID > 0) then 
		CancelUnitBuff("player", buffID); 
	end
end 

--------------
-- OnX

function AntiDaze:OnModuleEnable()	
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "OnCombatEvent"); 
end

function AntiDaze:OnModuleDisable()
	self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED"); 
end

function AntiDaze:OnInitialize()	
	
end

function AntiDaze:OnCombatEvent(_, timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)
	if (event == "SPELL_AURA_APPLIED" or event == "SPELL_AURA_APPLIED_DOSE") then
		if (UnitIsA(destFlags, groupmate)) then 
			local spellName, spellSchool, auraType, amount = select(2, ...); 
			if (strupper(auraType) == "DEBUFF" and spellName == L["Daze"]) then
				self:AntiDaze(destGUID); 
			end
		end		
	end
end

function AntiDaze:Toggle(switch)
	if (switch) then
		self:OnModuleEnable();
	else
		self:OnModuleDisable();
	end
end

-------------------------------
-- 误导喊话
misDirectYell = HunterMod:NewModule("misDirectYell", "AceEvent-3.0", "AceHook-3.0");
local misDirect = GetSpellInfo(34477); 
local misDirectPlayer; 

function misDirectYell:Yell(msg)
	SendChatMessage(msg, "yell"); 
end 

function misDirectYell:UNIT_SPELLCAST_SENT(event, unit, spell, _, player)
	if (strlower(unit) == "player" and spell == misDirect ) then 
		misDirectPlayer = player; 
	end 
end 

function misDirectYell:UNIT_SPELLCAST_SUCCEEDED(event, unit, spell) 
	if (strlower(unit) == "player" and spell == misDirect and IsInInstance()) then 
		self:Yell(string.gsub(L["MISDIRECT_PATTERN"], "$player", misDirectPlayer)); 
	end 
end

function misDirectYell:Toggle(switch) 
	if (switch) then 
		self:RegisterEvent("UNIT_SPELLCAST_SENT");
		self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED"); 
	else
		self:UnregisterEvent("UNIT_SPELLCAST_SENT");
		self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED");
	end 
end 