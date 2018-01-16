local _G = getfenv(0)

CreateFrame("Frame", "zBagBar", UIParent, "SecureHandlerStateTemplate")
zBar3:AddPlugin(zBagBar, zMainBar)
zBar3:AddBar(zBagBar)

function zBagBar:Load()
	self:SetID(13)
	self:SetFrameStrata("LOW")
	self:SetClampedToScreen(true)
	self:SetWidth(37); self:SetHeight(37);

	-- bag packs
	MainMenuBarBackpackButton:SetParent(self)
	MainMenuBarBackpackButton:SetWidth(36)
	MainMenuBarBackpackButton:SetHeight(36)
	zBar3.buttons["zBagBar1"] = "MainMenuBarBackpackButton"
	MainMenuBarBackpackButtonNormalTexture:SetWidth(60)
	MainMenuBarBackpackButtonNormalTexture:SetHeight(60)
	MainMenuBarBackpackButton:ClearAllPoints()
	MainMenuBarBackpackButton:SetPoint("CENTER")

	for i=0,3 do
		_G["CharacterBag"..i.."Slot"]:SetParent(self)
		_G["CharacterBag"..i.."Slot"]:SetWidth(36)
		_G["CharacterBag"..i.."Slot"]:SetHeight(36)
		zBar3.buttons["zBagBar"..(2+i)] = "CharacterBag"..i.."Slot"
		_G["CharacterBag"..i.."SlotNormalTexture"]:SetWidth(60)
		_G["CharacterBag"..i.."SlotNormalTexture"]:SetHeight(60)
	end

	-- keyring and performance bar
	CreateFrame("Frame","zBagBarButton6",self,"SecureFrameTemplate")
	zBagBarButton6:SetWidth(36); zBagBarButton6:SetHeight(36);
	zBagBarButton6:SetPoint("RIGHT",zBar3.buttons["zBagBar5"],"LEFT")
	zBar3.buttons["zBagBar6"] = "zBagBarButton6"

	KeyRingButton:SetParent(zBagBarButton6)
	KeyRingButton:SetFrameLevel(1)
	KeyRingButton:SetHeight(36)
	KeyRingButton:ClearAllPoints()
	KeyRingButton:SetPoint("RIGHT",zBagBarButton6)
	KeyRingButton:Show()

	self:GetTab():GetNormalTexture():SetWidth(60)
	self:GetTab():GetHighlightTexture():SetWidth(60)

	self:Hook()
end

function zBagBar:Hook()
--	MainMenuBarPerformanceBarFrame.SetPoint = zBar3.NOOP
end

function zBagBar:UpdateButtons()
	zBarT.UpdateButtons(self)
	if zBar3Data[self:GetName()].num == 1 then
		zBagBarButton6:Show()
		zBagBarButton6:SetAttribute("showstates", nil)
		zBagBarButton6:SetAttribute("statehidden", nil)
		zBagBarButton6:ClearAllPoints()
		zBagBarButton6:SetPoint("RIGHT",zBar3.buttons["zBagBar1"],"LEFT")
	end
end