local L=BATTLEINFO_LOACALE

BattleInfo_AutoExeC={}

function BattleInfo_AutoExeC:New()
	local x={}
	x.jointime=-1
	x.lasttime=GetTime()
	x.leaveleft=-1
	x.leavetime=3
	x.igleft=true
	x.autoleave=true
	x.autorelease=true
	x.stat=true
	x.joined=0
	x.f= CreateFrame("Frame", nil)
	self.__index = self
	setmetatable(x, self)
	return x
end

function BattleInfo_AutoExeC:Hook()
	self.f:SetScript("OnEvent", function(uiself,event,...)
			if event=="BATTLEFIELDS_SHOW" then
				if IsControlKeyDown() then
					BattlefieldFrameJoinButton_OnClick(uiself)
				end
			elseif event=="MODIFIER_STATE_CHANGED" then	
				if (arg1=="LCTRL" or arg1=="RCTRL") and BattlefieldFrame:IsVisible() then
					--BattlefieldFrameJoinButton_OnClick()
				end
			elseif event=="PLAYER_ENTERING_WORLD" then	
				if BattleInfo_InBattle() then
					self.joined=GetBattlefieldInstanceRunTime()
				end
				DEFAULT_CHAT_FRAME:RegisterEvent("CHAT_MSG_SYSTEM")
				this:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
			elseif event=="PLAYER_DEAD" then
				if self.autorelease then
					if BattleInfo_InBattle() then
						RepopMe()
						--BattleInfo_Print(L.HINT4,1)
					end
				end
			elseif event=="CHAT_MSG_SYSTEM" and GetBattlefieldWinner() then
				local info = ChatTypeInfo["SYSTEM"]
				if not (string.find(arg1,string.gsub(ERR_RAID_MEMBER_REMOVED_S,"%%s","%.")) or DEFAULT_CHAT_FRAME:IsEventRegistered("CHAT_MSG_SYSTEM")) then
					DEFAULT_CHAT_FRAME:AddMessage(arg1,info.r, info.g, info.b, info.id)
				end
			elseif event=="UPDATE_BATTLEFIELD_STATUS" then
				for i=1, MAX_BATTLEFIELD_QUEUES do
					status, mapName, instanceID = GetBattlefieldStatus(i)
					if status == "confirm" then
						--AcceptBattlefieldPort(i,1)
					end
				end
	
				if GetBattlefieldWinner() and BattleInfo_InBattle() then
					if self.autoleave then
						self.leaveleft=self.leavetime
					end
					
					if self.stat then
						for i=1,80 do
							local name, _, _, _, honorGained = GetBattlefieldScore(i)
							local runtime = (GetBattlefieldInstanceRunTime() - self.joined)/60000
							if name == UnitName("player") and runtime>0 then
								BattleInfo_Print(string.format(L.SPEED,honorGained,runtime,honorGained/runtime*60))
							end	
				
						end
					end
					
					if self.igleft then
						DEFAULT_CHAT_FRAME:UnregisterEvent("CHAT_MSG_SYSTEM")
					end
				end	
				
			end
		end)
		
	self.f:SetScript("OnUpdate", function()
	
			if GetTime()-self.lasttime>1 then
			
				if self.leaveleft>0 then
				
					if not BattleInfo_InBattle()then
						self.leaveleft=-1
						return
					end
					
					WorldStateScoreFrameLeaveButton:SetText(string.format(L.HINT5,self.leaveleft))
					self.leaveleft=self.leaveleft-1			
				elseif self.leaveleft==0 then
					if(GetBattlefieldWinner()) then
						LeaveBattlefield()
						--BattleInfo_Print(L.HINT6,1)
						self.leaveleft=-1
						this:UnregisterEvent("UPDATE_BATTLEFIELD_STATUS")
					end						
				end
				
				
				self.lasttime=GetTime()
			end
			
		end)

	self.f:RegisterEvent("CHAT_MSG_SYSTEM")
	self.f:RegisterEvent("BATTLEFIELDS_SHOW")
	self.f:RegisterEvent("PLAYER_DEAD")
	self.f:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")		
	self.f:RegisterEvent("PLAYER_ENTERING_WORLD")
	--self.f:RegisterEvent("MODIFIER_STATE_CHANGED")
end
