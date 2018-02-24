--[[ LiteFlat skin for ButtonFacade ]]

local LibButtonFacade = LibStub("LibButtonFacade",true)
if not LibButtonFacade then
	return
end

-- LiteFlat
LibButtonFacade:AddSkin("LiteFlat",{

	-- Skin data start.
	Backdrop = {
		Width = 36,
		Height = 36,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_LiteFlat\Textures\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 36,
		Height = 36,
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_LiteFlat\Textures\Overlay]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		ModelScale = 1.0,
	},
	Normal = {
		Width = 36,
		Height = 36,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_LiteFlat\Textures\Lite]],
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_LiteFlat\Textures\Overlay]],
	},
	Border = {
		Width = 36,
		Height = 36,
		BlendMode = "ADD",
		Color = {0, 1, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_LiteFlat\Textures\Border]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		BlendMode = "ADD",
		Color = {0, 0.75, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_LiteFlat\Textures\Border]],
	},
	AutoCastable = {
		Width = 64,
		Height = 64,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 36,
		Height = 36,
		BlendMode = "ADD",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_LiteFlat\Textures\Border]],
	},
	Gloss = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_LiteFlat\Textures\Gloss]],
	},
	HotKey = {
		Width = 36,
		Height = 10,
		OffsetX = -2,
		OffsetY = 10,
	},
	Count = {
		Width = 36,
		Height = 10,
		OffsetX = -2,
		OffsetY = -10,
	},
	Name = {
		Width = 36,
		Height = 10,
		OffsetY = -10,
	},
	-- Skin data end.

},true)
