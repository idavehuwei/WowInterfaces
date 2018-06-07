local L=BATTLEINFO_LOACALE

local biS=BattleInfo_Server:New()
local biNF=BattleInfo_NewBattleFinder:New()
local biQ=BattleInfo_Quest:New()
local biA=BattleInfo_AutoExeC:New()

function BattleInfo_ReportTo(tostr)
	if BattleInfo_InBattle() then
		local tstr={strsplit("*", biS:Report())}
		
		for i in pairs(tstr) do  
			SendChatMessage(tstr[i],tostr)
		end
	end
end

--国家队分析Hook的callbak 
function BattleInfo_Update()
	BattleInfo1Text:SetText("")
	BattleInfo0Text:SetText("")
	BattleInfoSHText:SetText("")
	
	if AlwaysUpFrame1Text then
		BattleInfo1:SetParent("AlwaysUpFrame1")
		BattleInfo1:SetPoint("RIGHT", "AlwaysUpFrame1Text", "LEFT", -8, 0)
		BattleInfo1:Show()
		
		BattleInfoSH:SetParent("AlwaysUpFrame1")
		BattleInfoSH:SetPoint("RIGHT", "AlwaysUpFrame1Text", "LEFT", -8, 20)
		
		BattleInfoSH:Hide()
		
		if BattleInfo_InBattle() then
			BattleInfo1Text:SetText(biS.data[1].num)
			BattleInfo1Text:SetTextColor(biS.data[1].color.r,biS.data[1].color.g,biS.data[1].color.b)
			AlwaysUpFrame1.tooltip=biS.data[1]:GetTooltip()
			x=biS:GetAreaSpiritHealerTime()
			if x then
				BattleInfoSHText:SetText(x)
				BattleInfoSH:Show()				
			end
		else
			biS.timesh=nil
		end
	end

	if AlwaysUpFrame2Text then
		BattleInfo0:SetParent("AlwaysUpFrame2")
		BattleInfo0:SetPoint("RIGHT", "AlwaysUpFrame2Text", "LEFT", -8, 0)
		BattleInfo0:Show()
		
		if BattleInfo_InBattle() then
			BattleInfo0Text:SetText(biS.data[0].num)
			BattleInfo0Text:SetTextColor(biS.data[0].color.r,biS.data[0].color.g,biS.data[0].color.b)
			AlwaysUpFrame2.tooltip=biS.data[0]:GetTooltip()
		end
	end
	

end

local Keyin=""

function BattleInfo_OnKey(k)
		if k=="ENTER" then
			BattleInfo_QS()
		--elseif k=="LCTRL" or k=="RCTRL" then
		--	BattlefieldFrameJoinButton_OnClick()
		elseif k==nil then
			Keyin=""
		elseif k=="BACKSPACE" or k=="NUMPADMINUS" then
			Keyin=string.sub(Keyin,1,-2) or ""				
		elseif k=="NUMPADPLUS" then
			Keyin=Keyin=="" and "0" or Keyin
			BattleInfo_QS(CanJoinBattlefieldAsGroup() and IsPartyLeader())	
		elseif k=="DELETE" or k=="NUMPADDECIMAL" then
			Keyin=""
		elseif k=="ESCAPE" then
			HideUIPanel(BattlefieldFrame)
		else
			local _,_,x,_ =strfind(k,".*(%d+)")
			if x and string.len(Keyin)<3 then
				Keyin=Keyin..x
			else
			end
		end
			
		BIQuickSortTip:SetOwner(BIQuickSort, "ANCHOR_RIGHT",-50);
		BIQuickSortTip:AddLine(string.format(L.QUICKJOINTIP,Keyin))
		BIQuickSortTip:Show()
end

function BattleInfo_QS(t)
	if Keyin=="" then
		return
	elseif Keyin=="0" then
		JoinBattlefield(0,t)
		BattleInfo_Print(string.format(L.QUICKJOIN,L.QUICKJOIN_FIRST))
		BattleInfo_OnKey()
		return
	else
		for i=1, GetNumBattlefields()  do
			if Keyin == GetBattlefieldInstanceInfo(i) .."" then
				JoinBattlefield(i,t)
				BattleInfo_Print(string.format(L.QUICKJOIN,Keyin))
				BattleInfo_OnKey()
				return
			end
		end
	end
	BattleInfo_Print(string.format(L.QUICKJOIN_CANTFIND,Keyin))
	BattleInfo_OnKey()
end

local QsShow=nil;
local keyupf=function() BattleInfo_OnKey(arg1) end
local eventf=function() BattleInfo_OnKey() end

function BattleInfo_QsShowHide(force,fv)

	if force then
		QsShow= fv
	else
	 QsShow=not QsShow
	end
	
	if QsShow then
		BIQuickSortShowHide:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up")
		BIQuickSortShowHide:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down")
		BIQuickSortShowHide:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled")
		BIQuickSort:SetScript("OnKeyUp",keyupf)
		BIQuickSort:SetScript("OnEvent",eventf)
		BattleInfo_OnKey()		
	else
		BIQuickSortShowHide:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
		BIQuickSortShowHide:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
		BIQuickSortShowHide:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
		BIQuickSort:SetScript("OnKeyUp",nil)
		BIQuickSort:SetScript("OnEvent",nil)
		BIQuickSortTip:Hide()
	end
end

-- 参考 Talented 
local function getChatWrite(tostr)
	local edit = DEFAULT_CHAT_FRAME.editBox
	local SendChatMessage = SendChatMessage
	local type = edit:GetAttribute("chatType")
	local lang = edit.language
	
	if tostr~=nil then
		return function (text, ...)
			SendChatMessage(text, tostr, lang, channel)
		end
	end
	
	if type == "WHISPER" then
		local target = edit:GetAttribute("tellTarget")
		return function (text, ...)
			if text:find("%", 1, true) then text = text:format(...) end
			SendChatMessage(text, type, lang, target)
		end
	elseif type == "CHANNEL" then
		local channel = edit:GetAttribute("channelTarget")
		return function (text, ...)
			if text:find("%", 1, true) then text = text:format(...) end
			SendChatMessage(text, type, lang, channel)
		end
	else
		return function (text, ...)
			if text:find("%", 1, true) then text = text:format(...) end
			SendChatMessage(text, type, lang)
		end
	end
end

function BattleInfo_SCan()
	local mapName= GetBattlefieldInfo()
	local t={}
	for i=1, GetNumBattlefields()  do
		instanceID = GetBattlefieldInstanceInfo(i)
		table.insert(t,instanceID)
	end
	
	table.sort(t)	
	
	local write=getChatWrite("SAY")
	
	if biNF.sayto==L.SELF then
		BattleInfo_Print(string.format(L.HINT3,mapName))
		BattleInfo_Print("|CFF00FF00"..biNF:FindNew(t).."|r")
		--BattleInfo_Print(L.HINT1,1)
	elseif biNF.sayto==L.CHATBOX then
		DEFAULT_CHAT_FRAME.editBox:SetText(DEFAULT_CHAT_FRAME.editBox:GetText()..biNF:FindNew(t))
		DEFAULT_CHAT_FRAME.editBox:Show()
	else
		if biNF.sayto==L.YELL  then
			write=getChatWrite("YELL")
		elseif biNF.sayto==L.RAID or biNF.sayto==L.PARTY then
			if UnitInRaid("player") then
				write=getChatWrite("RAID")
			elseif UnitInParty("player") then
				write=getChatWrite("PARTY")
			else
				BattleInfo_Print(L.HINT2,1)
			end			
		elseif biNF.sayto==L.CURRENT then
			write = getChatWrite()
		end
		
		write(string.format(L.HINT3,mapName))
		write(biNF:FindNew(t))
	end
end

function BattleInfo_Reset()
		BattleInfoParent:ClearAllPoints()
		BattleInfoParent:SetPoint("TOP", "UIParent", "TOP",-5,-15)
		WorldStateAlwaysUpFrame:ClearAllPoints()
		WorldStateAlwaysUpFrame:SetPoint("TOPLEFT","BattleInfoParent","TOPLEFT",0,0)
end

function BattleInfo_Command(msg) 
--[[
		local _,_,x,_ =strfind(msg,"x=(%d+)")
		x=tonumber(x)
		if x then
			if x>=0 and x<=100 then
				BattleInfo_Print(string.format(L.MARKINIT,x))
				biQ.pMax=x
			else
				BattleInfo_Print(L.MARKERR)
			end
		elseif msg=="titan" then
			DuowanAddon_BattleInfoDB.titanpatch=not DuowanAddon_BattleInfoDB.titanpatch
			BattleInfo_Print("Moving patch is now "..(DuowanAddon_BattleInfoDB.titanpatch and "on" or "off").." Reload UI (/console reloadui)")
		else
			InterfaceOptionsFrame_OpenToCategory("BattleInfo")
		end
		]]
end

local function BattleInfo_Apply()
	biNF.selfsay=DuowanAddon_BattleInfoDB.selfsay
	biNF.sayto=DuowanAddon_BattleInfoDB.sayto
	biA.autorelease=DuowanAddon_BattleInfoDB.autorelease
	biA.autoleave=DuowanAddon_BattleInfoDB.autoleave
	biA.leavetime=DuowanAddon_BattleInfoDB.leavetime
	biA.stat=DuowanAddon_BattleInfoDB.showstat
	biA.igleft=DuowanAddon_BattleInfoDB.igleft
end

function BattleInfo_SetValue(name, value)
	if(DuowanAddon_BattleInfoDB)then
		DuowanAddon_BattleInfoDB[name] = value;
	end
	BattleInfo_Apply();
end

function BattleInfo_OnLoad(self)	
	biS:Hook(BattleInfo_Update)
	biNF:Hook(BattleInfo_SCan)
	if not IsAddOnLoaded("QuestRepeat") then
  		biQ:Hook()
	end
	
	biA:Hook()
	
	BattleInfoDBDefault= 
	{
		sayto=L.SELF,
		leavetime=3,		
	}
	
	DuowanAddon_BattleInfoDB=DuowanAddon_BattleInfoDB or {
		showhelp=1,
		selfsay=1,
		autorelease=0,
		autoleave=0,
		showstat=1,
		igleft=nil,
	}
	
	for i,v in pairs(BattleInfoDBDefault) do
		DuowanAddon_BattleInfoDB[i]= DuowanAddon_BattleInfoDB[i] or v
	end 
	
	--BIOption:Hook(BattleInfo_Apply)
	BattleInfo_Apply()

	BattleInfo_QsShowHide(1)
	SlashCmdList["BATTLEINFO"] = BattleInfo_Command; 
	SLASH_BATTLEINFO1 = "/BATTLEINFO"; 
	SLASH_BATTLEINFO2 = "/BI"; 
	
	--titan and other WorldStateAlwaysUpFrame moving ui patch
	if DuowanAddon_BattleInfoDB.titanpatch then
		hooksecurefunc(WorldStateAlwaysUpFrame,"SetPoint",function(...)
			local _,_,l=...;
			if l~="BattleInfoParent" then
				WorldStateAlwaysUpFrame:SetPoint("TOPLEFT","BattleInfoParent","TOPLEFT",0,0)
			end
		end)
	end
end

