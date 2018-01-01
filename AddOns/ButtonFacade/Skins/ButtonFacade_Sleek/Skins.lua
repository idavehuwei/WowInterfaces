--[[ Sleek for ButtonFacade v2.4.0 ]]

local LibButtonFacade = LibStub("LibButtonFacade",true)
if not LibButtonFacade then
	return
end

LibButtonFacade:AddSkin("Sleek",{

	-- Skin data start.
	Backdrop = {
		Width = 28,
		Height = 28,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Sleek\Textures\Background]],

	},
	Icon = {
		Width = 28,
		Height = 28,
		TexCoords = {0.09,0.90,0.09,0.90}, -- Keeps the icon from showing its "silvery" edges.
	},
	Border = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Sleek\Textures\Border]],
		BlendMode = "ADD",
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Sleek\Textures\Flash]],
	},
	Cooldown = {
		Width = 34,
		Height = 34,
	},
	AutoCast = {
		Width = 30,
		Height = 30,
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
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Sleek\Textures\Normal]],
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Sleek\Textures\Checked]],
		BlendMode = "ADD",
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Sleek\Textures\Checked]],
		BlendMode = "ADD",
	},
	Gloss = {
		Height = 36,
		Width = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Sleek\Textures\Gloss]],
	},
	Highlight = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Sleek\Textures\Highlight]],
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
