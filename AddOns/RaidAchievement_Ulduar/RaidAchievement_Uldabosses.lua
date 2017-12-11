function pseaignis1()
if pseatime1==0 then pseatime1=arg1 else
psearex1=arg1-pseatime1
if psearex1<4.8 then
--АЧИВ СДЕЛАН!
pseamakeachlink(1)
pseareportallok()
pseaachdone1=false
else
pseatime1=arg1
end

end
end

function psearazor1()
pseatime1=pseatime1+1
if pseatime1>2 then
pseaachdone1=false
pseamakeachlink(2)
pseareportfailnoreason()
end
end

function pseakologarn1()
pseatime1=pseatime1+5
if(pseatime1>19 and pseatime2==0) then
pseamakeachlink(5)
pseareportallok()
pseatime2=1
end
end

function pseakologarn2()
pseatime1=pseatime1-1
if (pseatime2==1 and pseatime1<20)then
pseamakeachlink(5)
if(wherereportraidach=="sebe" or (IsRaidOfficer()==nil and (wherereportraidach=="raid" or wherereportraidach=="raid_warning")))then
DEFAULT_CHAT_FRAME:AddMessage("- "..pseaulduarkolf1.." "..achlinnk.." "..pseaulduarkolf2)
else
razapuskanonsa(wherereportraidach, "{"..psskull.."} "..pseaulduarkolf1.." "..achlinnk.." "..pseaulduarkolf2)
end
pseatime2=0
end
end


--общий для выполненого с 1 события
function pseaachcompl(pseanrach)
pseaachdone2=false
pseamakeachlink(pseanrach)
pseareportallok()
end



--общий для фейлов с 1 удара
function pseafailnoreason(pseanrach, prichina)
pseaachdone1=false
pseamakeachlink(pseanrach)
pseareportfailnoreason(prichina)
end

--общий для фейлов с 1 удара но откл 2 ачив лист
function pseafailnoreason2(pseanrach, prichina)
pseaachdone2=false
pseamakeachlink(pseanrach)
pseareportfailnoreason(prichina)
end

--общий для фейлов с 1 удара но откл 3 ачив лист
function pseafailnoreason3(pseanrach, prichina)
pseaachdone3=false
pseamakeachlink(pseanrach)
pseareportfailnoreason(prichina)
end

function pseamakeachlink(pseaidboss)
if GetInstanceDifficulty()==1 or GetInstanceDifficulty()==3 then
achlinnk=GetAchievementLink(pseaspisokach10[pseaidboss])
end
if GetInstanceDifficulty()==2 or GetInstanceDifficulty()==4 then
achlinnk=GetAchievementLink(pseaspisokach25[pseaidboss])
end
end



function pseafailmimiron1(ktofail)
pseaachdone1=false
pseamakeachlink(13)
pseareportfailmimi(pseamimifailloc1, ktofail)
end
function pseafailmimiron2(ktofail)
pseaachdone2=false
pseamakeachlink(13)
pseareportfailmimi(pseamimifailloc2, ktofail)
end
function pseafailmimiron3(ktofail)
pseaachdone3=false
pseamakeachlink(13)
pseareportfailmimi(pseamimifailloc3, ktofail)
end

function pseareportfailmimi(pseaotdamag, ktofail2)
if(wherereportraidach=="sebe" or (IsRaidOfficer()==nil and (wherereportraidach=="raid" or wherereportraidach=="raid_warning")))then
DEFAULT_CHAT_FRAME:AddMessage("- "..pseaotdamag.." "..achlinnk.." "..pseamimifailloc5.." ("..ktofail2..")")
else
razapuskanonsa(wherereportraidach, "{"..psskull.."} "..pseaotdamag.." "..achlinnk.." "..pseamimifailloc5.." ("..ktofail2..")")
end
end