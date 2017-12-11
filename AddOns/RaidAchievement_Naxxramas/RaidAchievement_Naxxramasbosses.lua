--личный фейл
function nxramyfail(nxranrach)
nxraachdone1=false
nxramakeachlink(nxranrach)
out(achlinnk.." |cffff0000"..pseatreb4.."|r")
end


function nxramakeachlink(nxraidboss)
if GetInstanceDifficulty()==1 or GetInstanceDifficulty()==3 then
achlinnk=GetAchievementLink(nxraspisokach10[nxraidboss])
end
if GetInstanceDifficulty()==2 or GetInstanceDifficulty()==4 then
achlinnk=GetAchievementLink(nxraspisokach25[nxraidboss])
end
end


--общий для выполненого с 1 события
function nxraachcompl(nxranrach)
nxraachdone1=false
nxramakeachlink(nxranrach)
pseareportallok()
end

--общий для фейлов с 1 удара
function nxrafailnoreason(nxranrach, prichina)
nxraachdone1=false
nxramakeachlink(nxranrach)
pseareportfailnoreason(prichina)
end