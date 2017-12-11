-- Author: Shurshik
-- http://phoenix-wow.ru

function psfeaUlduar()

psealocaleulduar()
psealocaleulduarui()
psealocaleuldaboss()



	psbilresnut=0
	pseaachdone1=true
	pseaachdone2=true
	pseaachdone3=true
	pseatime1=0
	pseatime2=0
	pseahodirlook=false


	this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	this:RegisterEvent("PLAYER_REGEN_DISABLED")
	this:RegisterEvent("PLAYER_ALIVE")




pseaspisokach25={
"2926",
"2921",
"2932",
"2948",
"2960",
"2956",
"3007",
"3077",
"2968",
"2962",
"2965",
"2972",
"3237",
"2997",
"3010"
}
pseaspisokach10={
"2925",
"2919",
"2931",
"2947",
"2959",
"2955",
"3006",
"3076",
"2967",
"2961",
"2963",
"2971",
"2989",
"2996",
"3008"
}


if (preaspisokon==nil) then
preaspisokon={}
end


pseaspislun= # pseaspisokach25
for i=1,pseaspislun do
if preaspisokon[i]==nil or preaspisokon[i]=="" then preaspisokon[i]="yes" end
end

end


function PSFea_OnUpdate(elapsedps)

local pseaCurrentTimepull = GetTime()

	if (pseaDelayTimepull == nil)then
		pseaDelayTimepull = GetTime()+0.5
	end


if (pseahodirlook)then
if (pseaCurrentTimepull >= pseaDelayTimepull) then
pseaDelayTimepull = pseaCurrentTimepull+0.15

--ходир по таймеру чекаем

if (pseaspellname1==nil) then else
for i,playernr in ipairs(thisraidtableea) do

local _, _, _, stack = UnitDebuff(playernr, pseaspellname1)
if stack==nil then else
if stack>2 then
pseafailnoreason(9, playernr)
pseahodirlook=false
end
end


end --конец таблицы
end --nil
end
end --pseahodirlook


end




function psfeaUlduaronevent()

if event == "PLAYER_ALIVE" then
psbilresnut=1
end


if event == "PLAYER_REGEN_DISABLED" then
if psbilresnut==1 then

else
--обнулять все данные при начале боя тут:

pseaachdone1=true
pseaachdone2=true
pseaachdone3=true
pseatime1=0
pseatime2=0
pseahodirlook=false




end
end





if GetNumRaidMembers() > 0 and event == "COMBAT_LOG_EVENT_UNFILTERED" then
--обнуление после реса
if psbilresnut==1 then
if pstimeresnut==nil then
pstimeresnut=arg1+2
end
if arg1>pstimeresnut then psbilresnut=0 pstimeresnut=nil end
end



if preaspisokon[1]=="yes" and pseaachdone1 then
if arg2=="SPELL_AURA_APPLIED" and arg9==62383 then
pseaignis1()
end
end

if preaspisokon[2]=="yes" and pseaachdone1 then
if arg2=="SPELL_CAST_START" and arg9==62666 then
psearazor1()
end
end

if preaspisokon[3]=="yes" and pseaachdone1 then
if arg2=="SPELL_HEAL" and arg9==62832 then
pseafailnoreason(3)
end
end

if preaspisokon[4]=="yes" and pseaachdone1 then
if arg2=="SPELL_DAMAGE" and (arg9==61916 or arg9==63482 or arg9==61879 or arg9==63479) then
pseafailnoreason(4)
end
end

if preaspisokon[5]=="yes" and pseaachdone2 then
if arg2=="SPELL_CAST_SUCCESS" and (arg9==63821 or arg9==64001) then
pseakologarn1()
end
if arg2=="UNIT_DIED" and arg7==pseakologarnadd then
pseakologarn2()
end
end

if preaspisokon[6]=="yes" and pseaachdone1 then
if arg2=="SPELL_DAMAGE" and (arg9==63346 or arg9==63976) then
pseafailnoreason(6, arg7)
end
end

if preaspisokon[7]=="yes" and pseaachdone1 then
if arg2=="UNIT_DIED" and arg7==pseaauriayaadd then
pseafailnoreason(7)
end
end

if preaspisokon[8]=="yes" and pseaachdone2 then
if arg2=="SPELL_AURA_REMOVED" and arg9==64455 then
pseaachcompl(8)
end
end
--thisraidtableea
if preaspisokon[9]=="yes" and pseaachdone1 then
if arg2=="SPELL_CAST_SUCCESS" and (arg9==62038 or arg9==62039) then
thisraidtableea = {}
for i = 1,GetNumRaidMembers() do local name,subgroup = GetRaidRosterInfo(i) if subgroup <= 5 then table.insert(thisraidtableea,(GetRaidRosterInfo(i))) end end
pseahodirlook=true
if GetInstanceDifficulty()==1 or GetInstanceDifficulty()==3 then
pseaspellname1 = GetSpellInfo(62038)
end
if GetInstanceDifficulty()==2 or GetInstanceDifficulty()==4 then
pseaspellname1 = GetSpellInfo(62039)
end
end
if arg2=="SPELL_DAMAGE" and arg9==62188 then
pseahodirlook=true
pseaachdone1=false
if GetInstanceDifficulty()==1 or GetInstanceDifficulty()==3 then
pseaspellname1 = GetSpellInfo(62038)
end
if GetInstanceDifficulty()==2 or GetInstanceDifficulty()==4 then
pseaspellname1 = GetSpellInfo(62039)
end
end
end

if preaspisokon[10]=="yes" and pseaachdone2 then
if arg2=="SPELL_AURA_APPLIED" and (arg9==61990 or arg9==61969) then
if UnitInRaid(arg7) then
pseafailnoreason2(10, arg7)
end
end
end

if preaspisokon[11]=="yes" and pseaachdone3 then
if arg2=="UNIT_DIED" then
for i,whodead in ipairs(pseahodiradds) do if whodead == arg7 then pseafailnoreason3(11) end end
end
end

if preaspisokon[12]=="yes" and pseaachdone1 then
if arg2=="SPELL_DAMAGE" and arg9==62466 then
if UnitInRaid(arg7) then
pseafailnoreason(12, arg7)
end
end
end

if preaspisokon[13]=="yes" and pseaachdone1 then
if arg2=="SPELL_DAMAGE" and arg9==63801 and arg4==pseamimironadd then
if UnitInRaid(arg7) then
pseafailmimiron1(arg7)
end
end
end

if preaspisokon[13]=="yes" and pseaachdone2 then
if arg2=="SPELL_DAMAGE" and arg9==63041 then
if UnitInRaid(arg7) then
pseafailmimiron2(arg7)
end
end
end

if preaspisokon[13]=="yes" and pseaachdone3 then
if arg2=="SPELL_DAMAGE" and (arg9==63009 or agr9==66351) then
if UnitInRaid(arg7) then
pseafailmimiron3(arg7)
end
end
end

if preaspisokon[14]=="yes" and pseaachdone1 then
if arg2=="SPELL_DAMAGE" and arg9==62659 then
if UnitInRaid(arg7) then
pseafailnoreason(14, arg7)
end
end
end

if preaspisokon[15]=="yes" and pseaachdone1 then
if arg2=="SPELL_AURA_APPLIED" and arg9==63120 then
if UnitInRaid(arg7) then
pseafailnoreason(15, arg7)
end
end
end





end --ульды
end --КОНЕЦ ОНЕВЕНТ

function PSFea_closeallprUlduar()
PSFeamain7:Hide()
end


function PSFea_buttonulda2()
PSFea_closeallpr()
PSFeamain7:Show()
openmenureportra()



if (pseanespamit==nil) then

pseaspislun= # pseaspisokach25
for i=1,pseaspislun do
pseaIDNumber, pseaName, pseaPoints, pseaCompleted, pseaMonth, pseaDay, pseaYear, pseaDescription, pseaFlags, pseaImage, pseaRewardText = GetAchievementInfo(pseaspisokach25[i])

pseawheresk=string.find(pseaName, "25")
if pseawheresk==nil then pseawheresk=string.find(pseaName, "10") end
pseaName=string.sub(pseaName, 1, pseawheresk-3)

if i>10 then
l=280
j=i-10
else
l=0
j=i
end
--картинка
local f = CreateFrame("Frame",nil,PSFeamain7)
f:SetFrameStrata("DIALOG")
f:SetWidth(24)
f:SetHeight(24)

local t = f:CreateTexture(nil,"OVERLAY")
t:SetTexture(pseaImage)
t:SetAllPoints(f)
f.texture = t

f:SetPoint("TOPLEFT",l+45,-14-j*30)
f:Show()

--текст
local f = CreateFrame("Frame",nil,PSFeamain7)
f:SetFrameStrata("DIALOG")
f:SetWidth(250)
f:SetHeight(15)

local t = f:CreateFontString(Name)
t:SetFont(GameFontNormal:GetFont(), 11)
t:SetAllPoints(f)
t:SetText(pseaName)
t:SetJustifyH("LEFT")
f.texture = t

f:SetPoint("TOPLEFT",l+73,-17-j*30)
f:Show()

pseawheresk=nil

end --for i
pseanespamit=1
end --nespam


pseauldagalochki()




end --конец бутоннульда2


function pseauldagalochki()
if(preaspisokon[1]=="yes")then PSFeamain7_CheckButton1:SetChecked() else PSFeamain7_CheckButton1:SetChecked(false) end
if(preaspisokon[2]=="yes")then PSFeamain7_CheckButton2:SetChecked() else PSFeamain7_CheckButton2:SetChecked(false) end
if(preaspisokon[3]=="yes")then PSFeamain7_CheckButton3:SetChecked() else PSFeamain7_CheckButton3:SetChecked(false) end
if(preaspisokon[4]=="yes")then PSFeamain7_CheckButton4:SetChecked() else PSFeamain7_CheckButton4:SetChecked(false) end
if(preaspisokon[5]=="yes")then PSFeamain7_CheckButton5:SetChecked() else PSFeamain7_CheckButton5:SetChecked(false) end
if(preaspisokon[6]=="yes")then PSFeamain7_CheckButton6:SetChecked() else PSFeamain7_CheckButton6:SetChecked(false) end
if(preaspisokon[7]=="yes")then PSFeamain7_CheckButton7:SetChecked() else PSFeamain7_CheckButton7:SetChecked(false) end
if(preaspisokon[8]=="yes")then PSFeamain7_CheckButton8:SetChecked() else PSFeamain7_CheckButton8:SetChecked(false) end
if(preaspisokon[9]=="yes")then PSFeamain7_CheckButton9:SetChecked() else PSFeamain7_CheckButton9:SetChecked(false) end
if(preaspisokon[10]=="yes")then PSFeamain7_CheckButton10:SetChecked() else PSFeamain7_CheckButton10:SetChecked(false) end
if(preaspisokon[11]=="yes")then PSFeamain7_CheckButton11:SetChecked() else PSFeamain7_CheckButton11:SetChecked(false) end
if(preaspisokon[12]=="yes")then PSFeamain7_CheckButton12:SetChecked() else PSFeamain7_CheckButton12:SetChecked(false) end
if(preaspisokon[13]=="yes")then PSFeamain7_CheckButton13:SetChecked() else PSFeamain7_CheckButton13:SetChecked(false) end
if(preaspisokon[14]=="yes")then PSFeamain7_CheckButton14:SetChecked() else PSFeamain7_CheckButton14:SetChecked(false) end
if(preaspisokon[15]=="yes")then PSFeamain7_CheckButton15:SetChecked() else PSFeamain7_CheckButton15:SetChecked(false) end
end

function PSFeauldagalka(nomersmeni)
if preaspisokon[nomersmeni]=="yes" then preaspisokon[nomersmeni]="no" else preaspisokon[nomersmeni]="yes" end
end

function PSFea_buttonuldachangeyn(yesno)
pseaspislun= # pseaspisokach25
for i=1,pseaspislun do
preaspisokon[i]=yesno
end
pseauldagalochki()
end

function PSFea_buttonulda1()
pseaspislun= # pseaspisokach25
for i=1,pseaspislun do
if preaspisokon[i]=="yes" then preaspisokon[i]="no" else preaspisokon[i]="yes" end
end
pseauldagalochki()
end


function openmenureportra()
if not DropDownMenureportra then
CreateFrame("Frame", "DropDownMenureportra", PSFeamain7, "UIDropDownMenuTemplate")
end

DropDownMenureportra:ClearAllPoints()
DropDownMenureportra:SetPoint("BOTTOMLEFT", 5, 7)
DropDownMenureportra:Show()

local items = bigmenuchatlistea

local function OnClick(self)
UIDropDownMenu_SetSelectedID(DropDownMenureportra, self:GetID())

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

UIDropDownMenu_Initialize(DropDownMenureportra, initialize)
UIDropDownMenu_SetWidth(DropDownMenureportra, 70);
UIDropDownMenu_SetButtonWidth(DropDownMenureportra, 85)
UIDropDownMenu_SetSelectedID(DropDownMenureportra,bigma2num)
UIDropDownMenu_JustifyText(DropDownMenureportra, "LEFT")
end