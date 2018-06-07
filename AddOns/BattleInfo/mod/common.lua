local L=BATTLEINFO_LOACALE

local BMax={
	[L.WARSONG]=10,
	[L.ARATHI]=15,
	[L.EYE]=15,
	[L.ALTERAC]=40,
	[L.SOACIENTS]=15,
	["DEFAULT"]=0,
}


function BattleInfo_BMax()
		return BMax[BattleInfo_SafeZone()] and BMax[BattleInfo_SafeZone()] or 0
end

function BattleInfo_InBattle()
	inInstance, instanceType = IsInInstance()
	return instanceType=="pvp"
end

function BattleInfo_SafeZone()
	if BattleInfo_InBattle() then
		return BMax[GetRealZoneText()] and GetRealZoneText() or "DEFAULT"
	else
		return "DEFAULT"
	end
end

function BattleInfo_Print(msg,ishelp)
	if ishelp and not DuowanAddon_BattleInfoDB.showhelp then
		return
	end
	DEFAULT_CHAT_FRAME:AddMessage("|CFFFF0000<|r|CFFFFD100" .. L["Battle Info"] .. "|r|CFFFF0000>|r"..(msg or ""))
end