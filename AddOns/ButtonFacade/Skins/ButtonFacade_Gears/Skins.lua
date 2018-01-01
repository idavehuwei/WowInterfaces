--[[ Gears r50 ]]

local LBF = LibStub("LibButtonFacade", true)
if not LBF then return end

-- Gears
LBF:AddSkin("Gears", {
	Backdrop = {
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Gears\Textures\Backdrop]],
	},
	Icon = {
		Width = 24,
		Height = 24,
	},
	Pushed = {
		Width = 40,
		Height = 40,
		Color = {0, 0, 0, 0.8},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Gears\Textures\Overlay]],
	},
	Flash = {
		Width = 40,
		Height = 40,
		Color = {1, 0, 0, 0.8},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Gears\Textures\Overlay]],
	},
	Cooldown = {
		Width = 24,
		Height = 24,
	},
	Normal = {
		Width = 40,
		Height = 40,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Gears\Textures\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 0.8, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Gears\Textures\Border]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 1, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Gears\Textures\Border]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.8},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Gears\Textures\Highlight]],
	},
	AutoCast = {
		Width = 16,
		Height = 16,
	},
	AutoCastable = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Gloss = {
		Hide = true,
	},
	HotKey = {
		Width = 40,
		Height = 10,
		OffsetX = -2,
		OffsetY = 8,
	},
	Count = {
		Width = 40,
		Height = 10,
		OffsetX = -2,
		OffsetY = -8,
	},
	Name = {
		Width = 40,
		Height = 10,
		OffsetY = -8,
	},
}, true)

-- Gears: Black
LBF:AddSkin("Gears: Black", {
	Template = "Gears",
	Normal = {
		Width = 40,
		Height = 40,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Gears\Textures\Black]],
	},
}, true)

-- Gears: Spark
LBF:AddSkin("Gears: Spark", {
	Template = "Gears",
	Normal = {
		Width = 40,
		Height = 40,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Gears\Textures\Spark]],
	},
}, true)
