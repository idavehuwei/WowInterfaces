--------------------------------------------
-- ButtonFacade supports
--------------------------------------------

local function ButtonFacadeSupport(title, db)
	if not IsAddOnLoaded("ButtonFacade") or not LibStub then return end
	local BF = LibStub("AceAddon-3.0"):GetAddon("ButtonFacade")
	local LBF = LibStub("LibButtonFacade", true)
	if not BF or not LBF then return end

	if type(title) ~= "string" then return end
	local module = BF:NewModule(title)
	if not module then return end
	module.libButtonFacade = LBF
	module.title = title
	module.db = {}

	if type(db) == "table" then
		if type(db["ButtonFacade Groups"]) ~= "table" then
			db["ButtonFacade Groups"] = {}
		end
		module.db = db["ButtonFacade Groups"]
	elseif type(db) == "string" then
		local frame = CreateFrame("Frame")		
		frame.module, frame.db = module, db
		frame:Hide()
		frame:RegisterEvent("VARIABLES_LOADED")
		frame:SetScript("OnEvent", function(self)
			local db = getglobal(self.db)
			if type(db) == "table" then
				if type(db["ButtonFacade Groups"]) ~= "table" then
					db["ButtonFacade Groups"] = {}
				end
				self.module.db = db["ButtonFacade Groups"]
			end
		end)
	end	

	LBF:RegisterSkinCallback(title, function(self, skin, gloss, backdrop, group, button, colors)		
		if group then
			local db = self.db
			if type(db[group]) ~= "table" then
				db[group] = {}
			end
			db = db[group]
			db.skin, db.gloss, db.backdrop, db.colors = skin, gloss, backdrop, colors
		end

		if type(self.OnSkinChanged) == "function" then
			self:OnSkinChanged(skin, gloss, backdrop, group, button, colors)
		end
	end, module)

	module.AddGroup = function(self, name, prefix, count, ...)
		if type(name) ~= "string" then return end
		local group = self.libButtonFacade:Group(self.title, name)	
		if not group then return end

		if type(prefix) == "string" and type(count) == "number" then
			local i
			for i = 1, count do
				local button = getglobal(prefix..i)
				if button then
					group:AddButton(button)				
				end
			end
		else
			local list = { prefix, count, ... }
			local button
			for _, button in ipairs(list) do
				if button then
					group:AddButton(button)
				end
			end
		end

		local db = self.db
		if db then
			if type(db[name]) ~= "table" then
				db[name] = {}
			end
			db = db[name]
			group:Skin(db.skin, db.gloss, db.backdrop, db.colors)
		end
		
		return group
	end

	return module
end

local L = EASYTRINKET_LOCALE;
local BFModule = ButtonFacadeSupport(L["title"], "DuowanAddon_EasyTrinketDB")
if not BFModule then return end

function BFModule:OnEnable()
	self:AddGroup(L["main buttons"], "EasyTrinket_Trinket", 2);
	self:AddGroup(L["menu buttons"], "EasyTrinket_MenuTrinket", EASYTRINKET_MENUBUTTON_NUM);
end