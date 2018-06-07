-------------------
-- 自动切换追踪 - 根据当前目标的类型改变追踪技能
-------------------
AutoTrack = HunterMod:NewModule("AutoTrack", "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("HunterMod");
local enable_tracking = true;
local tracking = {};
local orig_tracking_id = nil;
local track_talent;
local creature = {
	[L["BEAST"]] = "Beast";
	[L["HUMANOID"]] = "Humanoid";
	[L["UNDEAD"]] = "Undead";
	[L["GIANT"]] = "Giant";
	[L["ELEMENTAL"]] = "Elemental";
	[L["DEMON"]] = "Demon";
	[L["DRAGONKIN"]] = "Dragonkin";	
};
local ignor_tracking_buff = {
	["player"] = {5384, 13481},	-- 假死, 驯服野兽
	["target"] = {13481}			-- 驯服野兽
}; 

function AutoTrack:UpdateTrackTalent()
	-- 强化追踪
	local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq  = GetTalentInfo(3, 1);
	
	if (rank and rank >= 1) then
		track_talent = true;
	else
		track_talent = false;
	end
end

function AutoTrack:UpdateTrackingID()
	for id=1, GetNumTrackingTypes() do
		local name, texture, active, category = GetTrackingInfo(id);
		if ( name == GetSpellInfo(1494) ) then			
			tracking["Beast"] = id;
		elseif ( name == GetSpellInfo(19883) )then
			tracking["Humanoid"] = id;
		elseif ( name == GetSpellInfo(19884) ) then 
			tracking["Undead"] = id;
		elseif ( name == GetSpellInfo(19882) ) then
			tracking["Giant"] = id;
		elseif ( name == GetSpellInfo(19880) ) then 
			tracking["Elemental"] = id;
		elseif ( name == GetSpellInfo(19878) ) then 
			tracking["Demon"] = id;
		elseif ( name == GetSpellInfo(19879) ) then
			tracking["Dragonkin"] = id;
		end
	end
end

function AutoTrack:GetCurTrackingID()
	for id=1, GetNumTrackingTypes() do
		local name, texture, active, category = GetTrackingInfo(id);
		if (active) then
			return id;
		end
	end
	return false;
end

function AutoTrack:CanTracking()
	local spellName = GetSpellInfo(19883);
	local start, duration, enabled = GetSpellCooldown(spellName);
	if (duration == 0) then
		return true;
	else
		return false;
	end
end

local function delayTracking(trackingID)
	if (trackingID > 0 and AutoTrack:GetCurTrackingID() ~= tracingID and InCombatLockdown() and not AutoTrack:UnitHasIgnoreBuff() ) then
		SetTracking(trackingID);
	end
end

function AutoTrack:CastTracking()
	if (not track_talent) then return end
	
	local creatureType = UnitCreatureType("target");
	local trackingID = 0;
	if (creatureType and creature[creatureType]) then		
		if (UnitCanAttack("player", "target") and not UnitIsDeadOrGhost("target")) then			
			trackingID = tracking[creature[creatureType]] or 0;			
		end
	end
	
	if (trackingID > 0 and self:GetCurTrackingID() ~= trackingID) then
		if (not self:UnitHasIgnoreBuff() and self:CanTracking()) then			
			SetTracking(trackingID);
		end
	end

	if (self:GetCurTrackingID() == trackingID) then
		self.tracking = false;
		--self:CancelTimer(self.trackerHandle, true);		
	end
end

function AutoTrack:OnSkillChange()
	self:UpdateTrackingID();
end

function AutoTrack:PLAYER_REGEN_DISABLED()		
	orig_tracking_id = self:GetCurTrackingID();
	
	if (enable_tracking) then
		--self:CastTracking();
		self.tracking = true;
		--self:CancelTimer(self.trackerHandle, true);
		--self.trackerHandle = self:ScheduleRepeatingTimer("CastTracking", 0.01);
	end
end

function AutoTrack:UnitHasIgnoreBuff()
	local spellName, debuffName;
	local i = 1;
	if (ignor_tracking_buff.player) then
		local buffName = UnitAura("player", i,"HELPFUL");
		while (buffName) do
			for k, v in pairs(ignor_tracking_buff.player) do
				spellName = GetSpellInfo(v);
				if (buffName == spellName) then
					return true;
				end
			end
			i = i +1;
			buffName = UnitAura("player", i,"HELPFUL");
		end
	end
	if (ignor_tracking_buff.target) then
		i = 1;
		debuffName = UnitAura("target", i, "HARMFUL|PLAYER");
		while (debuffName) do
			for k, v in ipairs(ignor_tracking_buff.target) do
				spellName = GetSpellInfo(v);
				if (debuffName == spellName) then
					return true;
				end
			end
			i = i +1;
			debuffName = UnitAura("target", i, "HARMFUL|PLAYER");
		end
	end
	return false;
end

function AutoTrack:ReTracking()
	if (enable_tracking and track_talent and orig_tracking_id and not InCombatLockdown()) then		
		if (orig_tracking_id ~= self:GetCurTrackingID() and self:CanTracking() and not self:UnitHasIgnoreBuff()) then
			SetTracking(orig_tracking_id);
		end

		if (orig_tracking_id == self:GetCurTrackingID()) then
			orig_tracking_id = nil;
			--self:CancelTimer(self.retrackerHandle, true);
			self.retracking = false;
		end		
	end
end

function AutoTrack:PLAYER_REGEN_ENABLED()
	--self:ReTracking();
	self.retracking = true;
	--self:CancelTimer(self.retrackerHandle, true);
	--self.retrackerHandle = self:ScheduleRepeatingTimer("ReTracking", 0.01);
end

function AutoTrack:SPELLS_CHANGED()
	self:ScheduleTimer("UpdateTrackTalent", 1);
	self:ScheduleTimer("UpdateTrackingID", 1);
	self:UnregisterEvent("SPELLS_CHANGED");
end
-----------------------------------------
--	OnX
-----------------------------------------
function AutoTrack:OnModuleEnable()	
	enable_tracking = true;	
	self:RegisterEvent("PLAYER_REGEN_DISABLED");
	self:RegisterEvent("PLAYER_REGEN_ENABLED");
end

function AutoTrack:OnModuleDisable()
	self:UpdateTrackingID();
	self:UpdateTrackTalent();
	enable_tracking = false;
end

function AutoTrack:OnUpdate(this, elapsed)
	this.updateTime = this.updateTime + elapsed;
	if (this.updateTime > 0.01) then		
		if (self.tracking) then			
			self:CastTracking();
		elseif (self.retracking) then
			self:ReTracking();
		end
		this.updateTime = 0;
	end
end

function AutoTrack:OnInitialize()	
	self.tracking = nil;	
	self.retracking = nil;		
	local updateFrame = CreateFrame("Frame");
	updateFrame.updateTime = 0;
	updateFrame:SetScript("OnUpdate", function(this, elapsed)
		self:OnUpdate(this, elapsed);
	end);
	updateFrame:Show();
	self:RegisterEvent("SPELLS_CHANGED");
	self:RegisterEvent("CHARACTER_POINTS_CHANGED",  "UpdateTrackTalent");
	self:RegisterEvent("CHAT_MSG_SKILL", "OnSkillChange");
end

function AutoTrack:Toggle(switch)
	if (switch) then
		self:OnModuleEnable();
	else
		self:OnModuleDisable();
	end
end