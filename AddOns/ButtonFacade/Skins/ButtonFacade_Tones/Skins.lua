--[[ Tones for ButtonFacade v2.4.0 ]]

local LibButtonFacade = LibStub("LibButtonFacade",true)
if not LibButtonFacade then
	return
end

LibButtonFacade:AddSkin("Tones: Grey",{

	-- Skin data start.
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Background]],

	},
	Icon = {
		Width = 22,
		Height = 22,
		TexCoords = {0.07,0.93,0.07,0.93}, -- Keeps the icon from showing its "silvery" edges.
	},
	Border = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Border]],
		BlendMode = "ADD",
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Flash]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	AutoCast = {
		Width = 34,
		Height = 34,
	},
	AutoCastable = {
		Width = 58,
		Height = 58,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Normal]],
		Red = 255,
		Green = 255,
		Blue = 255,
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Pushed]],
		Red = 255,
		Green = 255,
		Blue = 255,
	},
	Disabled = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Disabled]],
		Red = 0,
		Green = 0,
		Blue = 0,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Checked]],
		Red = 255,
		Green = 255,
		Blue = 140,
	},
	Gloss = {
		Height = 36,
		Width = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Gloss]],
	},
	Highlight = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Highlight]],
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

--Blues

LibButtonFacade:AddSkin("Tones: Blue",{
	--Skin Data Begin
	Template = "Tones: Grey",
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Normal]],
		Color = {0.22, 0.25, 0.71, 1},
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Pushed]],
		Color = {0.22, 0.25, 0.71, 1},
	},
	Disabled = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Disabled]],
		Color = {0.22, 0.25, 0.71, 0.5},
	},
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Background]],
		Color = {0.22, 0.25, 0.51, 1},
	},
	--Skin Data Ends

},true)

--Reds

LibButtonFacade:AddSkin("Tones: Red",{
	--Skin Data Begin
	Template = "Tones: Grey",
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Normal]],
		Color = {0.71, 0.02, 0.13, 1},
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Pushed]],
		Color = {0.71, 0.02, 0.13, 1},
	},
	Disabled = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Disabled]],
		Color = {0.71, 0.02, 0.13, 0.5},
	},
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Background]],
		Color = {0.9, 0.31, 0.34, 1},
	},
	--Skin Data Ends

},true)

--Greens

LibButtonFacade:AddSkin("Tones: Green",{
	--Skin Data Begin
	Template = "Tones: Grey",
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Normal]],
		Color = {0.0, 0.63, 0.13, 1},
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Pushed]],
		Color = {0.0, 0.63, 0.13, 1},
	},
	Disabled = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Disabled]],
		Color = {0.0, 0.63, 0.13, 1},
	},
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Tones\Textures\Background]],
		Color = {0.3, 0.63, 0.35, 1},
	},
	--Skin Data Ends

},true)
