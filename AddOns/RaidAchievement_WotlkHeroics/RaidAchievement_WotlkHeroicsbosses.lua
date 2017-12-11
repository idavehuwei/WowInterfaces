--общий для выполненого с 1 события
function whraachcompl(whranrach)
whraachdone1=false
whramakeachlink(whranrach)
whrareportallok()
end



--общий для фейлов с 1 удара
function whrafailnoreason(whranrach, prichina)
whraachdone1=false
whramakeachlink(whranrach)
whrareportfailnoreason(prichina)
end

--мой фейл
function whramyfail(whranrach)
whraachdone1=false
whramakeachlink(whranrach)
out(achlinnk.." |cffff0000"..pseatreb4.."|r")
end


function whramakeachlink(whraidboss)
achlinnk=GetAchievementLink(whraspisokach5[whraidboss])
end

function whrareportfailnoreason(prichina2)
	if prichina2==nil then
if(wherereportraidach=="sebe" or (GetNumPartyMembers()==0 and wherereportpartyach=="party"))then
DEFAULT_CHAT_FRAME:AddMessage("- "..achlinnk.." "..pseatreb4)
else
razapuskanonsa(wherereportpartyach, "{"..psskull.."} "..achlinnk.." "..pseatreb4)
end
	else
if(wherereportraidach=="sebe" or (GetNumPartyMembers()==0 and wherereportpartyach=="party"))then
DEFAULT_CHAT_FRAME:AddMessage("- "..achlinnk.." "..pseatreb4.." ("..prichina2..")")
else
razapuskanonsa(wherereportpartyach, "{"..psskull.."} "..achlinnk.." "..pseatreb4.." ("..prichina2..")")
end
	end

end

function whrareportallok()
if(wherereportraidach=="sebe" or (GetNumPartyMembers()==0 and wherereportpartyach=="party"))then
DEFAULT_CHAT_FRAME:AddMessage("- "..achlinnk.." "..pseatreb2)
else
razapuskanonsa(wherereportpartyach, "{"..psstar.."} "..achlinnk.." "..pseatreb2)
end
end