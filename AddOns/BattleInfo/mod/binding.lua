local L=BATTLEINFO_LOACALE

BINDING_HEADER_BATTLEINFO="Battle Info"
BINDING_NAME_BATTLEINFO_QUEUE=L.BINDING_NAME_BATTLEINFO_QUEUE
BINDING_NAME_BATTLEINFO_ALWAYS_QUEUE=L.BINDING_NAME_BATTLEINFO_ALWAYS_QUEUE
BINDING_NAME_BATTLEINFO_JOIN=L.BINDING_NAME_BATTLEINFO_JOIN
BINDING_NAME_BATTLEINFO_LEAVE=L.BINDING_NAME_BATTLEINFO_LEAVE

function BattleInfo_Binding_Queue()
	BattlefieldFrameJoinButton_OnClick()
end

local always=nil
local f = CreateFrame("Frame")
f:SetScript("OnEvent",function(...)
	BattlefieldFrameJoinButton_OnClick()
end)

function BattleInfo_Binding_AlwayQueue()
	always=not always
	if always then
		BattleInfo_Print(L.ALWAYS_QUEUE_ON)
		f:RegisterEvent("BATTLEFIELDS_SHOW")
	else
		BattleInfo_Print(L.ALWAYS_QUEUE_OFF)
		f:UnregisterEvent("BATTLEFIELDS_SHOW")
	end
end

local function getOnlyKey()
	local joining=nil
	local count=0
	for i=1, MAX_BATTLEFIELD_QUEUES do
		status, mapName, instanceID = GetBattlefieldStatus(i)
		if status == "confirm" then
			joining=i
			count=count+1
		end
	end
	if count==1 then
		return joining
	end
	return 0
end

function BattleInfo_Binding_Join()
	AcceptBattlefieldPort(getOnlyKey(),1)
end

function BattleInfo_Binding_Leave()
	AcceptBattlefieldPort(getOnlyKey(),nil)
end