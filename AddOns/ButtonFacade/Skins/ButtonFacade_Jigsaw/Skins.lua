--[[ Jigsaw for ButtonFacade v2.4.0 ]]

local LibButtonFacade = LibStub("LibButtonFacade",true)
if not LibButtonFacade then
	return
end

LibButtonFacade:AddSkin("Jigsaw: Plain",{

	-- Skin data start.
	Backdrop = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Jigsaw\Textures\PlainBackdrop]],
	},
	Icon = {
		Width = 30,
		Height = 30,
		TexCoords = {0.07,0.93,0.07,0.93}, -- Keeps the icon from showing its "silvery" edges.
	},
	Border = {
		Width = 62,
		Height = 62,
		Texture = [[Interface\Buttons\UI-ActionButton-Border]],
		BlendMode = "ADD",
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\Buttons\UI-QuickslotRed]],
	},
	Cooldown = {
		Width = 36,
		Height = 36,
	},
	AutoCast = {
		Width = 36,
		Height = 36,
	},
	AutoCastable = {
		Width = 58,
		Height = 58,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Jigsaw\Textures\Normal]],
	},
	Pushed = {
		Hide = true,
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\Buttons\CheckButtonHilight]],
		BlendMode = "ADD",
	},
	Gloss = {
		Width = 34,
		Height = 34,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Jigsaw\Textures\Gloss]],
	},
	Highlight = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Jigsaw\Textures\Highlight]],
		BlendMode = "ADD",
	},
	HotKey = {
		Width = 36,
		Height = 10,
		OffsetX = -2,
		OffsetY = 11,
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
LibButtonFacade:AddSkin("Jigsaw: Puzzle",{
	-- Skin Data Begin
	Template = "Jigsaw: Plain",
	Backdrop = {
		Height = 50,
		Width = 50,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Jigsaw\Textures\Backdrop]],
	},
	-- Skin Data End
},true)

