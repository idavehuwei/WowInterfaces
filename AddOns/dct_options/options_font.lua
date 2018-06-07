DCT_Opfont_CurFontID = 4



DCT_Opfont_ColorList = {
	{0,0,0},
	{0,0,0},
	{0,0,0},
	{0.4,0.4,0.9},
	{0,0,0},
	{0,0,0},
	{0,0,0},
	{0,0,0},
	{0,0,0},
	{0,0,0},
	{0,0,0},
	{0,0,0},
}

function DCT_Opfont_FontRefresh()
	DCTFontOption:Hide()
	DCTFontOption:Show()
end

function DCT_Opfont_OnShow()
	local obj
	for i = 1,12 do
		dwGetglobal("DCTFontOptionFontFrame"..i):SetPoint("TOPLEFT", "DCTFontOption", "TOPLEFT", 35, 20 - 30 * i )
		dwGetglobal("DCTFontOptionFontFrame"..i.."N"):SetBackdropColor(DCT_Opfont_ColorList[i][1],DCT_Opfont_ColorList[i][2],DCT_Opfont_ColorList[i][3])
		dwGetglobal("DCTFontOptionFontFrame"..i.."P"):SetBackdropColor(DCT_Opfont_ColorList[i][1],DCT_Opfont_ColorList[i][2],DCT_Opfont_ColorList[i][3])
		dwGetglobal("DCTFontOptionFontFrame"..i.."N_Text"):SetText(DCT_Font[i].name)
		dwGetglobal("DCTFontOptionFontFrame"..i.."P_Text"):SetText(DCT_Font[i].path)
		dwGetglobal("DCTFontOptionFontFrame"..i.."_Label"):SetText(i.."."..DCT_TEXT_OPFONT_NAME)
		dwGetglobal("DCTFontOptionFontFrame"..i.."_Path"):SetText(DCT_TEXT_OPFONT_PATH)
		if DCT_Font[i].active then
			dwGetglobal("DCTFontOptionFontFrame"..i.."N_Text"):SetTextColor(1,1,1)
			dwGetglobal("DCTFontOptionFontFrame"..i.."P_Text"):SetTextColor(1,1,1)
		else
			dwGetglobal("DCTFontOptionFontFrame"..i.."N_Text"):SetTextColor(0.4,0.4,0.4)
			dwGetglobal("DCTFontOptionFontFrame"..i.."P_Text"):SetTextColor(0.4,0.4,0.4)
		end
	end
	
	DCTFontOptionEditN.EnterPressFunc = DCT_Opfont_EditNPress
	DCTFontOptionEditN:SetText(DCT_Font[DCT_Opfont_CurFontID].name)
	DCTFontOptionEditNLabel:SetText(DCT_TEXT_OPFONT_NAME)
	
	DCTFontOptionEditP.EnterPressFunc = DCT_Opfont_EditPPress
	DCTFontOptionEditP:SetText(DCT_Font[DCT_Opfont_CurFontID].path)	
	DCTFontOptionEditPLabel:SetText(DCT_TEXT_OPFONT_PATH)
	
	DCTFontOption_EditTitle:SetText(DCT_TEXT_OPFONT_EDIT)
end

function DCT_Opfont_EditNPress()
	DCT_Font[DCT_Opfont_CurFontID].name = this:GetText()
	DCT_CheckAllFont()
	DCT_Opfont_FontRefresh()
end

function DCT_Opfont_EditPPress()
	DCT_Font[DCT_Opfont_CurFontID].path = this:GetText()
	DCT_CheckAllFont()
	DCT_Opfont_FontRefresh()
end

function DCT_Opfont_Frame_OnMouseDown(button)
	local objname = this:GetName()
	local c = string.len(objname)
	local key = tonumber(string.sub(objname,23,c))
	if key > 3 and key ~= DCT_Opfont_CurFontID then
		DCT_Opfont_ColorList[DCT_Opfont_CurFontID] = {0,0,0}

		dwGetglobal("DCTFontOptionFontFrame"..DCT_Opfont_CurFontID.."N"):SetBackdropColor(0,0,0)
		dwGetglobal("DCTFontOptionFontFrame"..DCT_Opfont_CurFontID.."P"):SetBackdropColor(0,0,0)
		
		DCT_Opfont_CurFontID = key
		DCT_Opfont_ColorList[DCT_Opfont_CurFontID][1] = 0.4
		DCT_Opfont_ColorList[DCT_Opfont_CurFontID][2] = 0.4
		DCT_Opfont_ColorList[DCT_Opfont_CurFontID][3] = 0.9
		DCTFontOptionEditN:SetText(DCT_Font[DCT_Opfont_CurFontID].name)
		DCTFontOptionEditP:SetText(DCT_Font[DCT_Opfont_CurFontID].path)	
	end
end
