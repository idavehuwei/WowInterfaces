local _G = getfenv(0)
local format = string.format

CreateFrame("Frame", "zMainBar", UIParent, "SecureHandlerStateTemplate")
zBar3:AddPlugin(zMainBar, zBar3FullMode)
zBar3:AddBar(zMainBar)

--[[
	functional
--]]
function zMainBar:Load()
	self:SetID(10)
	self:SetFrameStrata("HIGH")
	self:SetClampedToScreen(true)
	self:SetWidth(36) self:SetHeight(36)

	for id=1,NUM_ACTIONBAR_BUTTONS do
		_G["ActionButton"..id]:SetParent(self)
		zBar3.buttons["zMainBar"..id] = "ActionButton"..id
		_G["ActionButton"..id.."NormalTexture"]:SetWidth(60)
		_G["ActionButton"..id.."NormalTexture"]:SetHeight(60)
	end
	ActionButton1:ClearAllPoints()
	ActionButton1:SetPoint("CENTER")

	self:Execute([[ActionButtons = table.new(self:GetChildren())]])
	self:SetAttribute('_onstate-actionpage',[[
		self:SetAttribute('actionpage', newstate)
		for i, button in ipairs(ActionButtons) do
			button:SetAttribute('refresh', nil)
		end
	]])

	self:UpdateStateHeader()
	
	self:Hook()

	-- grid stuff
	zBar3:RegisterGridUpdater(self)
end

--[[ Hooks ]]
function zMainBar:Hook()
	BonusActionBarFrame:UnregisterAllEvents()
	BonusActionBarFrame:Hide()

	MainMenuBar:SetParent(zBar3.hiddenFrame)

	if VehicleMenuBar then
		VehicleMenuBar:SetFrameStrata("HIGH")
		VehicleMenuBar:SetFrameLevel(zMainBar:GetFrameLevel() + 5)
		RegisterStateDriver(BonusActionBarFrame, "visibility", "[target=vehicle,exists]show;hide")
	end
end

--[[ Page Mapping ]]
function zMainBar:GetStateCommand()
	local header = "[bonusbar:5]11;"

	if zBar3Data["pageTrigger"] then
		header = header .. '[mod:SELFCAST]2;[help]2;'
	end

	for i=2,6 do
		header = header .. format("[bar:%d]%d;", i, i)
	end

	if zBar3Data["catStealth"] then
		header = header .. "[bonusbar:1,stealth]10;"
	end

	for i=1,4 do
		header = header .. format('[bonusbar:%d]%d;', i, i+6)
	end

	return header .. "1"
end

function zMainBar:UpdateStateHeader()
	UnregisterStateDriver(zMainBar, "actionpage")
	RegisterStateDriver(zMainBar, "actionpage", zMainBar:GetStateCommand())
end