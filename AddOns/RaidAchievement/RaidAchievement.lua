-- Author: Shurshik
-- version: 1
-- http://phoenix-wow.ru

function PhoenixStyleEA_OnLoad()

psealocale()
psealocaleui()
psealocalezone()


	if(thisaddonworkea==nil) then thisaddonworkea=true end
	if(wherereportraidach==nil) then wherereportraidach="raid" end
	if(wherereportpartyach==nil) then wherereportpartyach="party" end

	arg9 = "text"
	arg10 = "text"
	ramsgupdate=0
	ramsgtimestart=0
	ramsgwaiting=0
	ramsgmychat=""
	racanannouncetable={}
	raannouncewait={}
	SLASH_PHOENIXSTYLEEASYACH1 = "/RaidAchievement"
	SLASH_PHOENIXSTYLEEASYACH2 = "/raidach"
	SLASH_PHOENIXSTYLEEASYACH3 = "/rach"
	SLASH_PHOENIXSTYLEEASYACH4 = "/fena"
	SLASH_PHOENIXSTYLEEASYACH5 = "/фена"
	SLASH_PHOENIXSTYLEEASYACH6 = "/фениксач"
	SLASH_PHOENIXSTYLEEASYACH7 = "/рейдач"
	SLASH_PHOENIXSTYLEEASYACH8 = "/рач"
	SlashCmdList["PHOENIXSTYLEEASYACH"] = PHOENIXSTYLEEASYACH_Command




	this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	this:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	this:RegisterEvent("CHAT_MSG_ADDON")


end



function ramain_OnUpdate()

local racurrenttime = GetTime()

if ramsgtimestart>0 and racurrenttime>ramsgtimestart+0.4 then
ramsgtimestart=0
--тут отправда в аддон канал инфы
SendAddonMessage("RaidAchievement", "myname:"..ranamemsgsend.."++mychat:"..ramsgmychat.."++", "RAID")
end

if ramsgwaiting>0 and racurrenttime>ramsgwaiting+1.5 then
ramsgwaiting=0
table.sort(racanannouncetable)
--тут аннонс и обнуление всех таблиц
if racanannouncetable[1]==ranamemsgsend then
for i=1,#raannouncewait do
SendChatMessage(raannouncewait[i], ramsgmychat)
end

end
table.wipe(raannouncewait)
table.wipe(racanannouncetable)


end



end




function PhoenixStyleEA_OnEvent()



if event == "CHAT_MSG_ADDON" then

if arg1=="RaidAchievement" and ramsgwaiting>0 then

local _,rastriniz1=string.find(arg2, "mychat:")
if rastriniz1==nil then else
local rastrfine1=string.find(arg2, "++", rastriniz1)
if string.sub(arg2, rastriniz1+1, rastrfine1-1)==ramsgmychat then

--вырезаем ник
local _,rastriniz2=string.find(arg2, "myname:")
if rastriniz2==nil then else
local rastrfine2=string.find(arg2, "++", rastriniz2)

rabililinet=0
for i,getcrash in ipairs(racanannouncetable) do 
if getcrash == string.sub(arg2, rastriniz2+1, rastrfine2-1) then rabililinet=1
end end
if(rabililinet==0)then
table.insert(racanannouncetable,string.sub(arg2, rastriniz2+1, rastrfine2-1))
end


end
end
end
end




end



if event == "ZONE_CHANGED_NEW_AREA" then

chechtekzoneea()

end




if(lalaproverkaea==nil)then
chechtekzoneea()
lalaproverkaea=1
end






if GetNumRaidMembers() > 0 and event == "COMBAT_LOG_EVENT_UNFILTERED" then








end
end --конец основной функции аддона





--==========МЕНЮ==


function PHOENIXSTYLEEASYACH_Command(msg)


PSFeamain1:Hide()
PSFeamain2:Hide()
PSFea_closeallpr()

PSFea_showoptions()
PSFeamain1:Show()
PSFeamain2:Show()
PSFeamain3:Show()

end


function PSFea_closeallpr()
if IsAddOnLoaded("RaidAchievement_Ulduar") then PSFea_closeallprUlduar() end
if IsAddOnLoaded("RaidAchievement_WotlkHeroics") then whra_closeallpr() end
if IsAddOnLoaded("RaidAchievement_Naxxramas") then nxra_closeallpr() end
PSFeamain3:Hide()
PSFeamain10:Hide()
PSFeamain11:Hide()
PSFeamain12:Hide()
end

--НАСТРОЙКА данных при загрузке окна настроек
function PSFea_showoptions()
bigmenuchatlistea = {
   pseachatlist1,
   pseachatlist2,
   pseachatlist3,
   pseachatlist4,
   pseachatlist5,
   pseachatlist6,
   pseachatlist7,
   pseachatlist8,
}
lowmenuchatlistea = {
   pseachatlist4,
   pseachatlist3,
   pseachatlist5,
   pseachatlist6,
   pseachatlist7,
   pseachatlist8,
}


if (thisaddonworkea) then PSFeamain3_CheckButton1:SetChecked() else PSFeamain3_CheckButton1:SetChecked(false) end


end



function PSFeavkladdon()
	if (PSFeamain3_CheckButton1:GetChecked()) then
		if(thisaddonworkea)then
			else
			thisaddonworkea=true
			out("|cff99ffffRaidAchievement|r - "..pseaaddonmy.." |cff00ff00"..pseaaddonon2.."|r.")
			end
			else
			if(thisaddonworkea)then
			out("|cff99ffffRaidAchievement|r - "..pseaaddonmy.." |cffff0000"..pseaaddonoff.."|r.")
			thisaddonworkea=false
		end
end end


function PSFea_buttonaddon()
PSFea_closeallpr()
PSFeamain3:Show()
end

function PSFea_buttonulda()
PSFea_closeallpr()
if(thisaddonworkea)then
if IsAddOnLoaded("RaidAchievement_Ulduar")==nil then
LoadAddOn("RaidAchievement_Ulduar")
if IsAddOnLoaded("RaidAchievement_Ulduar") then
print("|cff99ffffRaidAchievement|r - "..pseamoduleload.." "..psealeftmenu5.."!")
end
end
if IsAddOnLoaded("RaidAchievement_Ulduar") then
PSFea_buttonulda2()
else
PSFeamain12:Show()
end
else
PSFeamain10:Show()
end
end

function whra_button()
PSFea_closeallpr()
if(thisaddonworkea)then
if IsAddOnLoaded("RaidAchievement_WotlkHeroics")==nil then
LoadAddOn("RaidAchievement_WotlkHeroics")
if IsAddOnLoaded("RaidAchievement_WotlkHeroics") then
print("|cff99ffffRaidAchievement|r - "..pseamoduleload.." "..psealeftmenu4.."!")
end
end
if IsAddOnLoaded("RaidAchievement_WotlkHeroics") then
whra_button2()
else
PSFeamain12:Show()
end
else
PSFeamain10:Show()
end
end

function nxra_button()
PSFea_closeallpr()
if(thisaddonworkea)then
if IsAddOnLoaded("RaidAchievement_Naxxramas")==nil then
LoadAddOn("RaidAchievement_Naxxramas")
if IsAddOnLoaded("RaidAchievement_Naxxramas") then
print("|cff99ffffRaidAchievement|r - "..pseamoduleload.." "..psealeftmenu31.."!")
end
end
if IsAddOnLoaded("RaidAchievement_Naxxramas") then
nxra_button2()
else
PSFeamain12:Show()
end
else
PSFeamain10:Show()
end
end


function PSFea_buttonclose()
PSFea_closeallpr()
PSFeamain1:Hide()
PSFeamain2:Hide()
end

function PSFea_buttonsaveexit()
PSFea_closeallpr()
PSFeamain1:Hide()
PSFeamain2:Hide()
end


function bigmenuchatea(bigma)
if(bigma==1)then wherereporttempbigma="raid"
	elseif(bigma==2) then wherereporttempbigma="raid_warning"
	elseif(bigma==3) then wherereporttempbigma="officer"
	elseif(bigma==4) then wherereporttempbigma="party"
	elseif(bigma==5) then wherereporttempbigma="guild"
	elseif(bigma==6) then wherereporttempbigma="say"
	elseif(bigma==7) then wherereporttempbigma="yell"
	elseif(bigma==8) then wherereporttempbigma="sebe"
end
end

function bigmenuchatea2(bigma2)
if (bigma2=="raid") then bigma2num=1
elseif (bigma2=="raid_warning") then bigma2num=2
elseif (bigma2=="officer") then bigma2num=3
elseif (bigma2=="party") then bigma2num=4
elseif (bigma2=="guild") then bigma2num=5
elseif (bigma2=="say") then bigma2num=6
elseif (bigma2=="yell") then bigma2num=7
elseif (bigma2=="sebe") then bigma2num=8
end
end

function lowmenuchatea(bigma)
if(bigma==1)then wherereporttempbigma="party"
	elseif(bigma==2) then wherereporttempbigma="officer"
	elseif(bigma==3) then wherereporttempbigma="guild"
	elseif(bigma==4) then wherereporttempbigma="say"
	elseif(bigma==5) then wherereporttempbigma="yell"
	elseif(bigma==6) then wherereporttempbigma="sebe"
end
end

function lowmenuchatea2(bigma2)
if (bigma2=="party") then bigma2num=1
elseif (bigma2=="officer") then bigma2num=2
elseif (bigma2=="guild") then bigma2num=3
elseif (bigma2=="say") then bigma2num=4
elseif (bigma2=="yell") then bigma2num=5
elseif (bigma2=="sebe") then bigma2num=6
end
end



function chechtekzoneea()

--ульдуар

if GetRealZoneText()==pseazoneulduar then
if IsAddOnLoaded("RaidAchievement_Ulduar")==nil and wasuldatryloadea==nil then
wasuldatryloadea=1
local loaded, reason = LoadAddOn("RaidAchievement_Ulduar")
if loaded then
print("|cff99ffffRaidAchievement|r - "..pseamoduleload.." "..psealeftmenu5.."!")
else
print("|cff99ffffRaidAchievement|r - "..pseamodulenotload.." "..psealeftmenu5.."!")
end
end
end

--Накс Сарт
if GetRealZoneText()==pseazonenax or GetRealZoneText()==pseazonesart or GetRealZoneText()==pseazoneonya then
if IsAddOnLoaded("RaidAchievement_Naxxramas")==nil and wasnaxtryloadea==nil then
wasnaxtryloadea=1
local loaded, reason = LoadAddOn("RaidAchievement_Naxxramas")
if loaded then
print("|cff99ffffRaidAchievement|r - "..pseamoduleload.." "..psealeftmenu31.."!")
else
print("|cff99ffffRaidAchievement|r - "..pseamodulenotload.." "..psealeftmenu31.."!")
end
end
end


if GetNumRaidMembers()==0 and GetInstanceDifficulty()==2 then
if IsAddOnLoaded("RaidAchievement_WotlkHeroics")==nil and waswhtryloadea==nil then
waswhtryloadea=1
local loaded, reason = LoadAddOn("RaidAchievement_WotlkHeroics")
if loaded then
print("|cff99ffffRaidAchievement|r - "..pseamoduleload.." "..psealeftmenu4.."!")
else
print("|cff99ffffRaidAchievement|r - "..pseamodulenotload.." "..psealeftmenu4.."!")
end
end
end

end

function PSFea_PSaddon()
PSFea_closeallpr()
if IsAddOnLoaded("PhoenixStyle")==nil then
--нету аддона
PSFeamain11:Show()

else
--есть аддон
PSFeamain1:Hide()
PSFeamain2:Hide()

--загрузил
PSFmain1:Hide()
PSFmain2:Hide()
PSF_closeallpr()
PSF_showoptions()
PSFmain1:Show()
PSFmain2:Show()
PSFmain3:Show()

end
end




function out(text)
 DEFAULT_CHAT_FRAME:AddMessage(text)
 UIErrorsFrame:AddMessage(text, 1.0, 1.0, 0, 1, 10) 
end




function pseareportfailnoreason(prichina2)
	if prichina2==nil then
if(wherereportraidach=="sebe" or (IsRaidOfficer()==nil and (wherereportraidach=="raid" or wherereportraidach=="raid_warning")))then
DEFAULT_CHAT_FRAME:AddMessage("- "..achlinnk.." "..pseatreb4)
else
razapuskanonsa(wherereportraidach, "{"..psskull.."} "..achlinnk.." "..pseatreb4)
end
	else
if(wherereportraidach=="sebe" or (IsRaidOfficer()==nil and (wherereportraidach=="raid" or wherereportraidach=="raid_warning")))then
DEFAULT_CHAT_FRAME:AddMessage("- "..achlinnk.." "..pseatreb4.." ("..prichina2..")")
else
razapuskanonsa(wherereportraidach, "{"..psskull.."} "..achlinnk.." "..pseatreb4.." ("..prichina2..")")
end
	end

end

function pseareportallok()
if(wherereportraidach=="sebe" or (IsRaidOfficer()==nil and (wherereportraidach=="raid" or wherereportraidach=="raid_warning")))then
DEFAULT_CHAT_FRAME:AddMessage("- "..achlinnk.." "..pseatreb2)
else
razapuskanonsa(wherereportraidach, "{"..psstar.."} "..achlinnk.." "..pseatreb2)
end
end


function razapuskanonsa(kudarep, chtorep)

if ramsgwaiting==0 then
ramsgtimestart=GetTime()
ramsgwaiting=GetTime()
ramsgmychat=kudarep --мой чат в который идет аннонс
ramsgupdate=1 --запуск онапдейт таймера
ranamemsgsend=UnitName("player")
if UnitName("player")=="Шуршик" then ranamemsgsend="0"..ranamemsgsend end
if IsRaidOfficer()==1 then ranamemsgsend="0"..ranamemsgsend end
table.wipe(racanannouncetable)
table.insert(racanannouncetable, ranamemsgsend)
end

table.insert (raannouncewait, chtorep)

end