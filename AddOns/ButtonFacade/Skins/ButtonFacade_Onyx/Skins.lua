--[[ Onyx r60 ]]

local LBF = LibStub("LibButtonFacade", true)
if not LBF then return end

LBF:AddSkin("Onyx", {
	Backdrop = {
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
	},
	Pushed = {
		Width = 40,
		Height = 40,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Overlay]],
	},
	Flash = {
		Width = 40,
		Height = 40,
		Color = {1, 0, 0, 0.3},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Overlay]],
	},
	Cooldown = {
		Width = 36,
		Height = 36,
	},
	Normal = {
		Width = 40,
		Height = 40,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Classic]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 0.8, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Arrow]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 1, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Arrow]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 0.9, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Arrow]],
	},
	AutoCast = {
		Width = 24,
		Height = 24,
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Gloss = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Gloss]],
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

-- Onyx Redux
LBF:AddSkin("Onyx Redux", {
	Template = "Onyx",
	Normal = {
		Width = 40,
		Height = 40,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Redux]],
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 0.75, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Border]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 1, 0, 0.3},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Border]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Onyx\Textures\Highlight]],
	},
}, true)
