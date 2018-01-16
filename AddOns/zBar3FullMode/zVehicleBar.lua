local _G = getfenv(0)

CreateFrame("Frame","zVehicleBar",UIParent,"SecureFrameTemplate")
zBar3:AddPlugin(zVehicleBar, zMainBar)

local OnMainMenuBarHide = function(self)
	if MainMenuBar.state == "vehicle" then
		zMicroBar:UnHook()
	end
end

local OnVehicleMenuBarHide = function(self)
	if zVehicleBar.state == "vehicle" then
		zVehicleBar.state = "player"
		zMicroBar:UpdateButtons()
		zMicroBar:UpdateLayouts()
	end
end

local postVehicleArt = function(self)
	zVehicleBar.state = "vehicle"
	zMicroBar:Hook()
end

local postPlayerArt = function(self)
	--zMicroBar:Hook()
end

function zVehicleBar:Load()
	if zMicroBar then
		hooksecurefunc(MainMenuBar, "Hide", OnMainMenuBarHide)
		hooksecurefunc(VehicleMenuBar, "Hide", OnVehicleMenuBarHide)
		hooksecurefunc("MainMenuBar_ToVehicleArt",postVehicleArt)
		hooksecurefunc("MainMenuBar_ToPlayerArt",postPlayerArt)
	end
	for name,bar in pairs(zBar3.bars) do
		if (bar:GetID() > 4) then -- not extra bars
			bar:SetParent(zBar3)
		end
	end
	RegisterStateDriver(zBar3, "visibility", "[target=vehicle,exists]hide;show")
end

function zVehicleBar:Test()
	if MainMenuBar.state == "vehicle" then
		MainMenuBar_ToPlayerArt(MainMenuBar)
	else
		MainMenuBar_ToVehicleArt(MainMenuBar)
	end
end