local _G = getfenv(0)

CreateFrame("Frame", "zPetBar", UIParent, "SecureHandlerStateTemplate")
zBar3:AddPlugin(zPetBar, zMainBar)
zBar3:AddBar(zPetBar)

function zPetBar:Load()
	self:SetID(11)
	self:SetFrameStrata("LOW")
	self:SetClampedToScreen(true)
	self:SetWidth(30); self:SetHeight(30);

	for i = 1, NUM_PET_ACTION_SLOTS do
		_G["PetActionButton"..i]:SetParent(self)
		zBar3.buttons["zPetBar"..i] = "PetActionButton"..i
		--_G["PetActionButton"..i]:RegisterEvent("UPDATE_BINDINGS")
		_G["PetActionButton"..i]:RegisterEvent("PLAYER_ENTERING_WORLD")
		_G["PetActionButton"..i]:SetScript("OnEvent", function()
			local key = GetBindingKey("BONUSACTIONBUTTON"..this:GetID())
			_G[this:GetName().."HotKey"]:SetText(GetBindingText(key,1,1))
		end)
	end
	PetActionButton1:ClearAllPoints()
	PetActionButton1:SetPoint("CENTER")

	self:GetTab():GetNormalTexture():SetWidth(50)
	self:GetTab():GetHighlightTexture():SetWidth(50)
end

-- override
function zPetBar:UpdateAutoPop() end

function zPetBar:UpdateVisibility()
	if zBar3Data[self:GetName()].hide then
		UnregisterStateDriver(self, "visibility")
	else
		RegisterStateDriver(self, "visibility", '[target=pet,exists,nodead,help,nobonusbar:5]show;hide')
	end

	zBarT.UpdateVisibility(self)
end

function zPetBar:UpdateButtons()
	zBarT.UpdateButtons(self)
	local name = self:GetName()
	for i = 2, NUM_PET_ACTION_SLOTS do
		if _G[zBar3.buttons[name..i]]:GetAttribute("statehidden") then
			_G[zBar3.buttons[name..i]]:SetParent(zBar3.hiddenFrame)
		else
			_G[zBar3.buttons[name..i]]:SetParent(self)
			_G[zBar3.buttons[name..i]]:Show()
		end
	end
end