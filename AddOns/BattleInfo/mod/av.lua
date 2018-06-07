local L=BATTLEINFO_LOACALE
--[[
	fix a blizzard bug that av states not shown before battle starts
	by farmer1992@gmail.com
]]
local OldGetNumWorldStateUI=GetNumWorldStateUI

GetNumWorldStateUI=function(...)
	if BattleInfo_SafeZone()==L.ALTERAC then
		return 2
	elseif BattleInfo_SafeZone()==L.SOACIENTS then
		return 8
	else
		return OldGetNumWorldStateUI(...)
	end
end

local OldGetWorldStateUIInfo=GetWorldStateUIInfo
local status={
	[2]=5,
	[3]=6,
	[5]=2,
	[6]=3,
}
GetWorldStateUIInfo=function(i,...)

	if BattleInfo_SafeZone()==L.ALTERAC then
		local r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11=OldGetWorldStateUIInfo(i,...)
		return r1,1,r3,r4,r5,r6,r7,r8,r9,r10,r11
	elseif BattleInfo_SafeZone()==L.SOACIENTS then
		local r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11=OldGetWorldStateUIInfo(i,...)
		
		if r2==0 and status[i] then
			_,thisr2=OldGetWorldStateUIInfo(status[i],...)
			if thisr2==0 then
				if UnitFactionGroup("player")=="Alliance" then
					if i==2 or i==3 then
						r2=1
					end
				else
					if i==5 or i==6 then
						r2=1
					end
				end
			end
		end
		
		--BattleInfo_Print(i.." "..r2)
		return r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11
	else
		return OldGetWorldStateUIInfo(i,...)
	end
end