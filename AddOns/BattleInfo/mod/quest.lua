local L=BATTLEINFO_LOACALE

BattleInfo_Quest={}

function BattleInfo_Quest:New()
	local x={}
	x.quest=UnitFactionGroup("player")=="Alliance" and L.CONCERTEDEFFORTS or L.FORGREATHONOR
	x.pMax=0
	x.f= CreateFrame("Frame", nil)
	self.__index = self
	setmetatable(x, self)
	return x
end

function BattleInfo_Quest:Hook()
	self.f:RegisterEvent("GOSSIP_SHOW")
	self.f:RegisterEvent("QUEST_COMPLETE")
	self.f:RegisterEvent("QUEST_PROGRESS")
	
	self.f:SetScript("OnEvent", function(...)
		
		if (event == "QUEST_PROGRESS") then
			if GetTitleText()==self.quest then
				if IsQuestCompletable() then
					if self.pMax>0 then
						QuestProgressCompleteButton_OnClick()
					end
				else
					if self.pMax>0 then
					
					BattleInfo_Print(string.format(L.MARKLEFT,self.pMax))
					BattleInfo_Print(L.MARKLACK)
					end
				end
				
			end
	
		elseif (event == "QUEST_COMPLETE") then
			if GetTitleText()==self.quest then
				QuestRewardCompleteButton_OnClick()
				
				self.pMax=self.pMax-1
				if self.pMax>0 then
					BattleInfo_Print(string.format(L.MARKLEFT,self.pMax))
				elseif self.pMax==0 then
					BattleInfo_Print(L.MARKCOMP)
				end
				
			end
		elseif event == "GOSSIP_SHOW" then
			if GetGossipAvailableQuests() then
					i = 0
					for index, value in pairs({GetGossipAvailableQuests()}) do
							if( mod(index,3) == 1) then
							i = i + 1
							if (value == self.quest) then
								if self.pMax>0 then
									SelectGossipAvailableQuest(i);
								else
									BattleInfo_Print(L.MARKHELP,1)
								end
								break
							end
						end
					end
				end
		end		
			
		
	end)
end