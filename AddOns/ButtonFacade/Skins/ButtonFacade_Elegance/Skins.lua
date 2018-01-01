--[[ Elegance for ButtonFacade v2.4.0 ]]

local LibButtonFacade = LibStub("LibButtonFacade",true)
if not LibButtonFacade then
	return
end

LibButtonFacade:AddSkin("Elegance: Light",{

	-- Skin data start.
	Backdrop = {
		Width = 28,
		Height = 28,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Elegance\Textures\Background]],

	},
	Icon = {
		Width = 30,
		Height = 30,
		TexCoords = {0.07,0.93,0.07,0.93}, -- Keeps the icon from showing its "silvery" edges.
	},
	Border = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Elegance\Textures\Border]],
		BlendMode = "ADD",
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Elegance\Textures\Flash]],
	},
	Cooldown = {
		Width = 36,
		Height = 36,
	},
	AutoCast = {
		Width = 38,
		Height = 38,
	},
	AutoCastable = {
		Width = 58,
		Height = 58,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Static = true,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Elegance\Textures\Normal]],
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Elegance\Textures\Checked]],
		BlendMode = "ADD",
		Color = {1.0, 0.99, 0.86, 1.0},
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Elegance\Textures\Checked]],
		BlendMode = "ADD",
		Color = {0.42, 0.17, 0.71, 1.0}
	},
	Gloss = {
		Height = 36,
		Width = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Elegance\Textures\Gloss]],
	},
	Highlight = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Elegance\Textures\Highlight]],
		BlendMode = "ADD",
	},
	HotKey = {
		Width = 36,
		Height = 10,
		OffsetX = -1,
		OffsetY = 18,
	},
	Count = {
		Width = 36,
		Height = 10,
		OffsetX = -2,
		OffsetY = -11,
	},
	Name = {
		Width = 36,
		Height = 10,
		OffsetY = -11,
	},
	-- Skin data end.

},true)

LibButtonFacade:AddSkin("Elegance: Dark",{

	Template = "Elegance: Light",
	Normal = {
		Width = 36,
		Height = 36,
		Static = true,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Elegance\Textures\Normal]],
		Color = {0.0, 0.0, 0.0, 1}
	},

},true)
