local L=BATTLEINFO_LOACALE
local BINewBattle={}

function BINewBattle:New()
	local x={}
	x.OldBT={}
	x.OldOldBT={}
	x.OldTime=GetTime()
	x.Clicking=0
	self.__index = self
	setmetatable(x, self)
	return x
end

function BINewBattle:lastNew(id)
	if #(self.OldOldBT)==0 or GetTime()-self.OldTime>60 then
		return nil
	end
	
	for i in pairs(self.OldOldBT) do
		if self.OldOldBT[i]..""==id then
			return nil
		end
	end
	return 1	
end

function BINewBattle:IsNew(id)
	if self.Clicking==0 then
		return nil
	end
	
	for i in pairs(self.OldBT) do
		if self.OldBT[i]..""==id then
			if self:lastNew(id) then
				return L.PERHAPS
			else
				return L.OLD
			end
		end
	end
	return L.NEW
end

function BINewBattle:BeforeJoin()
	self.Clicking=1
	self.OldOldBT=self.OldBT
	self.OldTime=GetTime()
	self.OldBT={}

	for i=1, GetNumBattlefields()  do
		instanceID = GetBattlefieldInstanceInfo(i)
		table.insert(self.OldBT,instanceID)
	end
	
	table.sort(self.OldBT)
end

BattleInfo_NewBattleFinder={}

function BattleInfo_NewBattleFinder:New()
	local x={}
	x.data={
		[L.WARSONG]=BINewBattle:New(),
		[L.ARATHI]=BINewBattle:New(),
		[L.EYE]=BINewBattle:New(),
		[L.ALTERAC]=BINewBattle:New(),
		[L.SOACIENTS]=BINewBattle:New(),
		["DEFAULT"]={},
	}
	x.selfsay=true
	x.sayto=L.SELF
	x.f= CreateFrame("Frame", nil)
	self.__index = self
	setmetatable(x, self)
	return x
end

function BattleInfo_NewBattleFinder:FindNew(t)
	local outstr=""
	local lsj=1
	for i in pairs(t) do
		j=lsj
		while j<=t[i]-1 do		
			k=t[i]-1-j
			if k>2 then
				outstr=outstr..j.."->"..j+k.." "
				break
			else
				outstr=outstr..j.." "
				j=j+1
			end
		end
		lsj=t[i]+1
		
	end
	outstr=outstr..lsj..L.ANDAFTER
	
	return outstr
end

function BattleInfo_NewBattleFinder:Hook(callback)
	--CONFIRM_NEW_BFENTRY SSPVP
	
	if StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"] then
		StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].button2=L.LEAVEBUTTON

		StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].OnCancel=function(arg1,arg2,arg3)
			if IsControlKeyDown() and arg3=="clicked" then
				AcceptBattlefieldPort(arg2,nil)
			end
		end
		
		StaticPopupDialogs["CONFIRM_BATTLEFIELD_ENTRY"].OnShow=function()
			local thisBT=dwGetglobal(this:GetName().."Text")
			local tx=thisBT:GetText()
			if string.find(tx,L.OLD,1,1) or string.find(tx,L.NEW,1,1) then			
				return
			end
			for i in pairs(self.data) do
				local _,_,toJ,_ = string.find(tx, ".+"..i.." (%d+).+");	
				if toJ then						
					thisBT:SetText(string.gsub(tx,toJ,toJ..(self.data[i]:IsNew(toJ) or "")))
					break
				end
			end		
		end
	
	elseif StaticPopupDialogs["CONFIRM_NEW_BFENTRY"] then
		StaticPopupDialogs["CONFIRM_NEW_BFENTRY"].button2=L.LEAVEBUTTON

		StaticPopupDialogs["CONFIRM_NEW_BFENTRY"].OnCancel=function(arg1,arg2,arg3)
			if IsControlKeyDown() and arg3=="clicked" then
				AcceptBattlefieldPort(arg2,nil)
			end
		end
		hooksecurefunc(StaticPopupDialogs["CONFIRM_NEW_BFENTRY"],"OnUpdate",function()
			local thisBT=dwGetglobal(this:GetName().."Text")
			local tx=thisBT:GetText()
			if string.find(tx,L.OLD,1,1) or string.find(tx,L.NEW,1,1) or string.find(tx,L.OLD,1,1) then			
				return
			end
			for i in pairs(self.data) do
				local _,_,toJ,_ = string.find(tx, ".+"..i.." #(%d+).+");	
				if toJ then						
					thisBT:SetText(string.gsub(tx,"#"..toJ,"#"..toJ..(self.data[i]:IsNew(toJ) or "")))
					break
				end
			end		
		end)
	end


	--BattlefieldFrameJoinButton_OnClick
	hooksecurefunc("JoinBattlefield",function()
		local mapName= GetBattlefieldInfo()
		if self.data[mapName] then
			self.data[mapName]:BeforeJoin()
			if self.selfsay then
				callback()
			end
		end
	end)

	self.f:SetScript("OnEvent", function()
				self.data[BattleInfo_SafeZone()].Clicking=0
		end)
	self.f:RegisterEvent("PLAYER_ENTERING_WORLD")
	
end
