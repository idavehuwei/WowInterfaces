if Fence then return end

local MAJOR_VERSION = "1.0"
local MINOR_VERSION = tonumber((string.gsub("$Revision: 100 $", "^.-(%d+).-$", "%1")))

local L = AceLibrary("AceLocale-2.2"):new("Fence")

Fence = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0", "AceDB-2.0", "AceModuleCore-2.0", "AceHook-2.1")
Fence:SetModuleMixins("AceEvent-2.0", "AceHook-2.1", "AceConsole-2.0", "AceDebug-2.0")

Fence.version = MAJOR_VERSION .. "." .. MINOR_VERSION
Fence.date = string.gsub("$Date: 2007-08-13 03:43:37 +0100 (Mon, 13 Aug 2007) $", "^.-(%d%d%d%d%-%d%d%-%d%d).-$", "%1")

Fence.options = {
	type = 'group',
	args = {},
}

Fence:RegisterChatCommand({"/Fence"}, Fence.options)
Fence:RegisterDB("FenceDB")
Fence:RegisterDefaults('profile', {
	Version = {}
})

function Fence:OnInitialize()
	self:RegisterEvent("AUCTION_HOUSE_SHOW", function() 
		if IsAddOnLoaded("Blizzard_AuctionUI") then
			self:TriggerEvent("AH_LOADED")
		end 
	end)

	-- we have to delete saved variables, because we can! Only will happen for this or older versions
	if not self.db.profile.Version.Minor or self.db.profile.Version.Minor < MINOR_VERSION then
		if self.db.profile.Version.Update then 
			if self.db.profile.Version.Minor <= 24112 then
				Fence:AcquireDBNamespace("AutoFill").profile.Prices = {}
			end
		self.db.profile.Version.Minor = MINOR_VERSION
		return 
	end
	--self:Print(L["All settings have been reset! Sorry, it was absolutely necessary."])
	self:ResetDB('profile')
	self.db.profile.Version = {
		Minor = MINOR_VERSION,
		Update = true
	}
	end
end
