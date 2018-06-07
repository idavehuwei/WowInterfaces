--local L=BATTLEINFO_LOACALE
	--[[
function BIOption:Hook(callback)

	self.name= "BattleInfo"
	BIOption.okay= function(self)
		if self.showing then
			DuowanAddon_BattleInfoDB.showhelp=BIOptionCheckButton1:GetChecked()
			DuowanAddon_BattleInfoDB.autorelease=BIOptionCheckButton2:GetChecked()
			DuowanAddon_BattleInfoDB.autoleave=BIOptionCheckButton3:GetChecked()
			DuowanAddon_BattleInfoDB.selfsay=BIOptionCheckButton4:GetChecked()
			DuowanAddon_BattleInfoDB.showstat=BIOptionCheckButton5:GetChecked()
			DuowanAddon_BattleInfoDB.igleft=BIOptionCheckButton6:GetChecked()
			DuowanAddon_BattleInfoDB.sayto=BIOptionSayToText:GetText()
			DuowanAddon_BattleInfoDB.leavetime=BIOptionSliderCheckButton3:GetValue()
			
			BattleInfo_Print(L.OPTIONSAVE)
			callback()
		end	
	end
	BIOptionCheckButton1Text:SetText(L.SHOWHELP)
	BIOptionCheckButton2Text:SetText(L.AUTOREL)

	BIOptionCheckButton4Text:SetText(L.AUTOSAYTO)
	BIOptionCheckButton5Text:SetText(L.GAINSPEED)
	BIOptionCheckButton6Text:SetText(L.IGLEFT)
	
	BIOptionResetText:SetText(L.RESETBUTTON)
	BIOptionSayToLabel:SetText(L.SAYTO)
	
	BIQuickSortText:SetText(L.QUICKJOINTEXT)
	BIQuickSortScanText:SetText(L.SEARCHBUTTON)
	
	BIOptionSliderCheckButton3Low:SetText("1")
	BIOptionSliderCheckButton3High:SetText("120")
	
	
	UIDropDownMenu_SetWidth(BIOptionSayTo,110,0)
	UIDropDownMenu_Initialize(BIOptionSayTo,function()
	
		local info
		local Channels={L.SELF,L.CURRENT,L.SAY,L.YELL,L.RAID,L.CHATBOX}
		for i = 1, 6 do
			info = {
				text = Channels[i],
				func = function() UIDropDownMenu_SetSelectedID(BIOptionSayTo, this:GetID()) end
			}
			UIDropDownMenu_AddButton(info)
		end
	
	end)
	
	
	--InterfaceOptions_AddCategory(BIOption)
end 

function BIOption:LoadOption()
	BIOptionCheckButton1:SetChecked(DuowanAddon_BattleInfoDB.showhelp)
	BIOptionCheckButton2:SetChecked(DuowanAddon_BattleInfoDB.autorelease)
	BIOptionCheckButton3:SetChecked(DuowanAddon_BattleInfoDB.autoleave)
	BIOptionCheckButton4:SetChecked(DuowanAddon_BattleInfoDB.selfsay)
	BIOptionCheckButton5:SetChecked(DuowanAddon_BattleInfoDB.showstat)
	BIOptionCheckButton6:SetChecked(DuowanAddon_BattleInfoDB.igleft)
	BIOptionSayToText:SetText(DuowanAddon_BattleInfoDB.sayto)
	BIOptionSliderCheckButton3:SetValue(DuowanAddon_BattleInfoDB.leavetime)	
end 
]]