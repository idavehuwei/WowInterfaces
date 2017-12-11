-- Author: Shurshik
-- http://phoenix-wow.ru

function nxraonload()

nxralocale()
nxralocaleui()
nxralocaleboss()



	nxrabilresnut=0
	nxraachdone1=true
	nxratime1=0
	nxrabattlev=0
	nxramexna=0
	nxratimer1=0
	nxrabosskilled=0

	this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	this:RegisterEvent("PLAYER_REGEN_DISABLED")
	this:RegisterEvent("PLAYER_REGEN_ENABLED")
	this:RegisterEvent("PLAYER_ALIVE")
	this:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")
	this:RegisterEvent("ZONE_CHANGED_NEW_AREA")




nxraspisokach25={
"1859",
"2140",
"2183",
"2179",
"2185",
"2048",
"4407"
}

nxraspisokach10={
"1858",
"1997",
"2182",
"2178",
"2184",
"2047",
"4404"
}


if (nxraspisokon==nil) then
nxraspisokon={}
end


nxraspislun= # nxraspisokach25
for i=1,nxraspislun do
if nxraspisokon[i]==nil or nxraspisokon[i]=="" then nxraspisokon[i]="yes" end
end

end

--онапдейт
function nxra_OnUpdate(elapsedps)

if GetTime()>nxrafobiaend then
nxramexna=0
nxramakeachlink(1)
pseareportfailnoreason()
end

end




function nxraonevent()

if event == "PLAYER_ALIVE" then
nxrabilresnut=1
end


if event == "PLAYER_REGEN_DISABLED" then
if nxrabilresnut==1 then
else
--обнулять все данные при начале боя тут:

nxraachdone1=true
nxratime1=0
nxrabattlev=1
nxratimer1=0



end

end

if event == "PLAYER_REGEN_ENABLED" then

	nxrabattlev=0


end

if event == "ZONE_CHANGED_NEW_AREA" then

nxrabosskilled=0

end

if event == "CHAT_MSG_RAID_BOSS_EMOTE" then

if string.find(arg1, nxraonyemote)==nil then else
if arg2==nxraonyxiab then
nxratime1=GetTime()

end end



end

if GetNumRaidMembers() > 0 and event == "COMBAT_LOG_EVENT_UNFILTERED" then
--обнуление после реса
if nxrabilresnut==1 then
if nxratimeresnut==nil then
nxratimeresnut=arg1+3
end
if arg1>nxratimeresnut then nxrabilresnut=0 nxratimeresnut=nil end
end

--ТУТ АЧИВЫ


--по 2 ачиву таймер
if nxratimer1>0 then
if arg1>nxratimer1+1.5 then
nxratimer1=0
nxrafailnoreason(2)
end end


if nxraspisokon[1]=="yes" then
if arg2=="UNIT_DIED" and arg7==nxraanubrekan then
nxrafobiaend=GetTime()+1200
nxramexna=1
end
end

if nxraspisokon[1]=="yes" then
if arg2=="UNIT_DIED" and arg7==nxrameksna then
nxramexna=0
end
end

if nxraspisokon[2]=="yes" and nxraachdone1 then
if arg2=="SPELL_AURA_REMOVED" and arg9==54100 then
nxraachdone1=false
nxratimer1=arg1
end
end

if nxraspisokon[2]=="yes" then
if arg2=="UNIT_DIED" and arg7==nxrafaerlin then
nxratimer1=0
end
end

if nxraspisokon[3]=="yes" and nxraachdone1 then
if arg2=="UNIT_DIED" and arg7==nxraloatheb then
nxraachdone1=false
nxrabosskilled=1
end
end

if nxraspisokon[3]=="yes" and nxraachdone1 and nxrabosskilled==0 then
if arg2=="UNIT_DIED" and arg7==nxraspore then
nxrafailnoreason(3)
end
end

if nxraspisokon[4]=="yes" and nxraachdone1 then
if arg2=="SPELL_DAMAGE" and (arg9==28085 or arg==28059) then
nxrafailnoreason(4)
end
end

if nxraspisokon[5]=="yes" and nxraachdone1 then
if arg2=="UNIT_DIED" and arg7==nxrakeladd then
nxratime1=nxratime1+1
if nxratime1>17 then
nxraachdone1=false
nxraachcompl(5)
end
end
end

if nxraspisokon[6]=="yes" and nxraachdone1 then
if arg2=="SPELL_DAMAGE" and arg9==57591 and GetRaidRosterInfo(GetNumRaidMembers())==arg7 and nxrabattlev==1 then
--проверка на ачивку у себя!
if GetInstanceDifficulty()==1 or GetInstanceDifficulty()==3 then
_, _, _, nxrasarto = GetAchievementInfo(2047)
elseif GetInstanceDifficulty()==2 or GetInstanceDifficulty()==4 then
_, _, _, nxrasarto = GetAchievementInfo(2048)
end
nxraachdone1=false
if (nxrasarto) then else
nxramyfail(6)
end
end
end

if nxraspisokon[7]=="yes" and nxraachdone1 then
if arg2=="SPELL_DAMAGE" and arg10==nxraonycast and GetTime()-nxratime1<14 then
if UnitInRaid(arg7) then
nxrafailnoreason(7, arg7)
end
end
end





end
end --КОНЕЦ ОНЕВЕНТ

function nxra_closeallpr()
nxramain6:Hide()
end


function nxra_button2()
PSFea_closeallpr()
nxramain6:Show()
openmenureportnxra()



if (nxranespamit==nil) then

nxraspislun= # nxraspisokach25
for i=1,nxraspislun do
nxraIDNumber, nxraName, nxraPoints, nxraCompleted, nxraMonth, nxraDay, nxraYear, nxraDescription, nxraFlags, nxraImage, nxraRewardText = GetAchievementInfo(nxraspisokach25[i])

nxrawheresk=string.find(nxraName, "25")
if nxrawheresk==nil then nxrawheresk=string.find(nxraName, "10") end
nxraName=string.sub(nxraName, 1, nxrawheresk-3)


if i>10 then
l=280
j=i-10
else
l=0
j=i
end
--картинка
local f = CreateFrame("Frame",nil,nxramain6)
f:SetFrameStrata("DIALOG")
f:SetWidth(24)
f:SetHeight(24)

local t = f:CreateTexture(nil,"OVERLAY")
t:SetTexture(nxraImage)
t:SetAllPoints(f)
f.texture = t

f:SetPoint("TOPLEFT",l+45,-14-j*30)
f:Show()

--текст
local f = CreateFrame("Frame",nil,nxramain6)
f:SetFrameStrata("DIALOG")
f:SetWidth(250)
f:SetHeight(15)

local t = f:CreateFontString(Name)
t:SetFont(GameFontNormal:GetFont(), 11)
t:SetAllPoints(f)
t:SetText(nxraName)
t:SetJustifyH("LEFT")
f.texture = t

f:SetPoint("TOPLEFT",l+73,-17-j*30)
f:Show()


end --for i
nxranespamit=1
end --nespam


nxragalochki()




end --конец бутон2


function nxragalochki()
if(nxraspisokon[1]=="yes")then nxramain6_CheckButton1:SetChecked() else nxramain6_CheckButton1:SetChecked(false) end
if(nxraspisokon[2]=="yes")then nxramain6_CheckButton2:SetChecked() else nxramain6_CheckButton2:SetChecked(false) end
if(nxraspisokon[3]=="yes")then nxramain6_CheckButton3:SetChecked() else nxramain6_CheckButton3:SetChecked(false) end
if(nxraspisokon[4]=="yes")then nxramain6_CheckButton4:SetChecked() else nxramain6_CheckButton4:SetChecked(false) end
if(nxraspisokon[5]=="yes")then nxramain6_CheckButton5:SetChecked() else nxramain6_CheckButton5:SetChecked(false) end
if(nxraspisokon[6]=="yes")then nxramain6_CheckButton6:SetChecked() else nxramain6_CheckButton6:SetChecked(false) end
if(nxraspisokon[7]=="yes")then nxramain6_CheckButton7:SetChecked() else nxramain6_CheckButton7:SetChecked(false) end
end

function nxragalka(nomersmeni)
if nxraspisokon[nomersmeni]=="yes" then nxraspisokon[nomersmeni]="no" else nxraspisokon[nomersmeni]="yes" end
end

function nxra_buttonchangeyn(yesno)
nxraspislun= # nxraspisokach25
for i=1,nxraspislun do
nxraspisokon[i]=yesno
end
nxragalochki()
end

function nxra_button1()
nxraspislun= # nxraspisokach25
for i=1,nxraspislun do
if nxraspisokon[i]=="yes" then nxraspisokon[i]="no" else nxraspisokon[i]="yes" end
end
nxragalochki()
end


function openmenureportnxra()
if not DropDownMenureportnxra then
CreateFrame("Frame", "DropDownMenureportnxra", nxramain6, "UIDropDownMenuTemplate")
end

DropDownMenureportnxra:ClearAllPoints()
DropDownMenureportnxra:SetPoint("BOTTOMLEFT", 5, 7)
DropDownMenureportnxra:Show()

local items = bigmenuchatlistea

local function OnClick(self)
UIDropDownMenu_SetSelectedID(DropDownMenureportnxra, self:GetID())

bigmenuchatea(self:GetID())
wherereportraidach=wherereporttempbigma
end

local function initialize(self, level)
local info = UIDropDownMenu_CreateInfo()
for k,v in pairs(items) do
	info = UIDropDownMenu_CreateInfo()
	info.text = v
	info.value = v
	info.func = OnClick
	UIDropDownMenu_AddButton(info, level)
end
end

bigmenuchatea2(wherereportraidach)

UIDropDownMenu_Initialize(DropDownMenureportnxra, initialize)
UIDropDownMenu_SetWidth(DropDownMenureportnxra, 70);
UIDropDownMenu_SetButtonWidth(DropDownMenureportnxra, 85)
UIDropDownMenu_SetSelectedID(DropDownMenureportnxra,bigma2num)
UIDropDownMenu_JustifyText(DropDownMenureportnxra, "LEFT")
end