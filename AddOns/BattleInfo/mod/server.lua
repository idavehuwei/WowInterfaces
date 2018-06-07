local L=BATTLEINFO_LOACALE
local ServerData={}

function ServerData:New()
	local x={}
	self.__index = self
	x.num=0
	x.server={}
	x.color={
			r,g,b
		}
	x.class={
		["DRUID"]=0,
		["HUNTER"]=0,
		["MAGE"]=0,
		["PALADIN"]=0,
		["PRIEST"]=0,
		["ROGUE"]=0,
		["SHAMAN"]=0,
		["WARLOCK"]=0,
		["WARRIOR"]=0,
		["DEATHKNIGHT"]=0,
		}
	setmetatable(x,self)
	return x
end

function ServerData:UpdateColor()
	self.color.r,self.color.g,self.color.b=self:ColorRank(self.num*2-self:ServerNum()-1)
end

function ServerData:GetTooltip()
	
	local x="";
	for i in pairs(self.class) do 
		if self.class[i] > 0 then	
			x=x..L.CLASSNAME_COLOR[i].."("..self.class[i]..")\n";
		end
	end 
	local ms=self:MaxServer()
	local sn=self:ServerNum() 
	local n=self.num
	if ms~=nil then
		if ms.num>BattleInfo_BMax()/2 then
			x=x..string.format(L.REPORT_5,ms.name)
		else
			x=x..L.REPORT_6
		end
	end
	
	x=x..string.format(L.REPORT_7,n,sn)
	
	return x

end

function ServerData:AddServer(sn)
	local t=true

	for i in pairs(self.server) do 
		if (self.server[i].name==sn) then
			t=false
			self.server[i].num=self.server[i].num+1
		end
	end
				
	if t then
		local ts={
			name=sn,
			num=1
		}
		table.insert(self.server,1,ts)
	end
end

function ServerData:ServerNum() 
	t=0
	for i in pairs(self.server) do 
		if self.server[i].num > 0 then	
			t=t+1
		end
	end
	return t
end

function ServerData:MaxServer()
	local t=1
	local s
	for i in pairs(self.server) do  
		if self.server[i].num>t then
			t=self.server[i].num
			s=self.server[i]
		end
	end
	return s
end

function ServerData:Clear()
	self.num=0
	self.server={}
	self.class["DRUID"]=0
	self.class["HUNTER"]=0
	self.class["MAGE"]=0
	self.class["PALADIN"]=0
	self.class["PRIEST"]=0
	self.class["ROGUE"]=0
	self.class["SHAMAN"]=0
	self.class["WARLOCK"]=0
	self.class["WARRIOR"]=0
	self.class["DEATHKNIGHT"]=0
end


function ServerData:ColorRank(rankIndex)     --参考XGuild
	local red = GREEN_FONT_COLOR				-- 1.0, 0.10, 0.1
	local yellow = NORMAL_FONT_COLOR	-- 1.0, 0.82, 0.0
	local green = RED_FONT_COLOR		-- 0.1, 1.00, 0.1
	local nRanks = BattleInfo_BMax()*2-1
	local pct = ((rankIndex*100)/nRanks)/100

	if (rankIndex == 0) then
		r = red.r g = red.g b = red.b
	elseif (rankIndex == (nRanks/2)) then
		r = yellow.r g = yellow.g b = yellow.b
	elseif (rankIndex == nRanks) then
		r = green.r g = green.g b = green.b
	elseif (rankIndex > (nRanks/2)) then
		local pctmod = (1.0 - pct) * 2
		r = (yellow.r - green.r)*pctmod + green.r
		g = (yellow.g - green.g)*pctmod + green.g
		b = (yellow.b - green.b)*pctmod + green.b
	elseif (rankIndex < (nRanks/2)) then
		local pctmod = (0.5 - pct) * 2	
		r = (red.r - yellow.r)*pctmod + yellow.r
		g = (red.g - yellow.g)*pctmod + yellow.g
		b = (red.b - yellow.b)*pctmod + yellow.b
	end

	return r, g, b
end

BattleInfo_Server={}

function BattleInfo_Server:Report()

	if BattleInfo_SafeZone()=="DEFAULF" then
		local s=""
		if AlwaysUpFrame1Text then
			s=s..AlwaysUpFrame1Text:GetText()
		end
		if AlwaysUpFrame2Text then
			s=s.."*"..AlwaysUpFrame2Text:GetText()
		end
		
		return s
	end
	
	if self.enemy==nil then
		return nil
	end
	
	local n=self.enemy.num
	local c=self.enemy.class
	local ms=self.enemy:MaxServer()
	local sn=self.enemy:ServerNum() 

--[[
	REPORT_1="%s共有%d人（来自%d个服务器）参与%s的战斗"
	REPORT_2="%s可能为%s国家队，".."共%d人来自%s服务器"
	REPORT_3="一看%s就是野队"
	]]
	
	local s=string.format(L.REPORT_1.."*",self.enemyname,n,sn,BattleInfo_SafeZone())
	 
	for i in pairs(c) do
			if (c[i]>0) then
				s=s..L.CLASSNAME[i].."("..c[i].."),"
			end
	end
	
	if ms==nil then
		return s 
	end  
	
	if ms.num>BattleInfo_BMax()/2 then
		--s=s.."*".."可能为"..ms.name.."国家队，".."共"..ms.num.."人来自"..ms.name.."服务器"
		s=s.."*"..string.format(L.REPORT_2,self.enemyname,ms.name,ms.num,ms.name)
	elseif n<BattleInfo_BMax()/2 then
		s=s.."*"..string.format(L.REPORT_4,self.enemyname)
	else
		s=s.."*"..string.format(L.REPORT_3,self.enemyname)
	end 
	
	return s
end

function BattleInfo_Server:Update()

	if AlwaysUpFrame1Text and AlwaysUpFrame2Text then
	
		self.data[0]:Clear()
		self.data[1]:Clear()
		--Battlegrounds: Horde = 0, Alliance =1
		for i=1,80 do
			local name, _, _, _, _, faction, _, _, _, filename, _, _ = GetBattlefieldScore(i)
			if name and faction and filename and self.data[faction] then
				self.data[faction].num=self.data[faction].num+1
				local _,server = strsplit("-", name)
				server=server or GetRealmName()
				self.data[faction]:AddServer(server)
				self.data[faction].class[filename]=self.data[faction].class[filename]+1
			end	

		end
		
		self.data[0]:UpdateColor()
		self.data[1]:UpdateColor()

	end  

end

function BattleInfo_Server:GetAreaSpiritHealerTime()
	if self.timesh then
		c=30015
		x=mod(c -mod(((GetTime()-self.timesh)-self.sh)*1000,c),c)/1000+1
		if x>30 then
			return L.SPIRITHEAL_ING
		end 
		return string.format(L.SPIRITHEAL,x)	
	else
		return nil
	end
end

function BattleInfo_Server:New()
	local x={}
	x.data=
	{
		[0]=ServerData:New(),
		[1]=ServerData:New(),	
	}
	
	if UnitFactionGroup("player")=="Alliance" then
		x.enemy=x.data[0]
		x.enemyname=L.HORDE
	else	
		x.enemy=x.data[1]
		x.enemyname=L.ALLIANCE
	end
	
	x.f= CreateFrame("Frame", nil)
	x.callback=nil
	x.sh=0
	x.timesh=nil
	self.__index = self
	setmetatable(x, self)
	return x
end



function BattleInfo_Server:Hook(callback)
	WorldStateAlwaysUpFrame:SetParent("BattleInfoParent")
	WorldStateAlwaysUpFrame:SetPoint("TOPLEFT","BattleInfoParent","TOPLEFT",0,0)
	
	self.callback=callback
	
	self.f:SetScript("OnEvent", function()
			self:Update()
		end)
	self.f:SetScript("OnUpdate", function()
			RequestBattlefieldScoreData()
			self.callback()
			if GetAreaSpiritHealerTime()>0 then 
				self.timesh=GetTime()
				self.sh=GetAreaSpiritHealerTime()
			end
		end)
	self.f:RegisterEvent("UPDATE_BATTLEFIELD_SCORE")
end


