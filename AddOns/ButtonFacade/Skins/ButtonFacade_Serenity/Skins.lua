--[[ Serenity r61 ]]

local LBF = LibStub("LibButtonFacade", true)
if not LBF then return end

-- Serenity
LBF:AddSkin("Serenity", {
	Backdrop = {
		Width = 44,
		Height = 44,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Round\Backdrop]],
	},
	Icon = {
		Width = 26,
		Height = 26,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Pushed = {
		Width = 44,
		Height = 44,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Round\Overlay]],
	},
	Flash = {
		Width = 44,
		Height = 44,
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Round\Overlay]],
	},
	Cooldown = {
		Width = 26,
		Height = 26,
	},
	Normal = {
		Width = 44,
		Height = 44,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Round\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Color = {0, 0.8, 1, 0.8},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Round\Border]],
	},
	Border = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Color = {0, 1, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Round\Border]],
	},
	Highlight = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Round\Highlight]],
	},
	AutoCast = {
		Width = 24,
		Height = 24,
		OffsetX = 1,
		OffsetY = -1,
	},
	AutoCastable = {
		Width = 48,
		Height = 48,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Gloss = {
		Width = 44,
		Height = 44,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Round\Gloss]],
	},
	HotKey = {
		Width = 44,
		Height = 10,
		OffsetX = -12,
		OffsetY = 8,
	},
	Count = {
		Width = 44,
		Height = 10,
		OffsetX = -12,
		OffsetY = -6,
	},
	Name = {
		Width = 44,
		Height = 12,
		OffsetY = -6,
	},
}, true)

-- Serenity Redux
LBF:AddSkin("Serenity Redux", {
	Template = "Serenity",
	Border = {
		Width = 44,
		Height = 44,
		BlendMode = "ADD",
		Color = {0, 1, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Round\Highlight]],
	},
}, true)

-- Serenity: Square
LBF:AddSkin("Serenity: Square", {
	Backdrop = {
		Width = 40,
		Height = 40,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Square\Backdrop]],
	},
	Icon = {
		Width = 26,
		Height = 26,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Pushed = {
		Width = 40,
		Height = 40,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Square\Overlay]],
	},
	Flash = {
		Width = 40,
		Height = 40,
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Square\Overlay]],
	},
	Cooldown = {
		Width = 26,
		Height = 26,
	},
	Normal = {
		Width = 40,
		Height = 40,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Square\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 0.8, 1, 0.8},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Square\Border]],
	},
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 1, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Square\Border]],
	},
	Highlight = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Square\Highlight]],
	},
	AutoCast = {
		Width = 26,
		Height = 26,
		OffsetX = 1,
		OffsetY = -1,
	},
	AutoCastable = {
		Width = 48,
		Height = 48,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Gloss = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Square\Gloss]],
	},
	HotKey = {
		Width = 40,
		Height = 10,
		OffsetX = -6,
		OffsetY = 6,
	},
	Count = {
		Width = 40,
		Height = 10,
		OffsetX = -6,
		OffsetY = -6,
	},
	Name = {
		Width = 40,
		Height = 10,
		OffsetY = -6,
	},
}, true)

-- Serenity Redux
LBF:AddSkin("Serenity Redux: Square", {
	Template = "Serenity: Square",
	Border = {
		Width = 40,
		Height = 40,
		BlendMode = "ADD",
		Color = {0, 1, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Serenity\Textures\Square\Highlight]],
	},
}, true)
