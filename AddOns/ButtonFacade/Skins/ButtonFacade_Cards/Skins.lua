--[[ Cards for ButtonFacade v2.4.0 ]]

local LibButtonFacade = LibStub("LibButtonFacade",true)
if not LibButtonFacade then
	return
end

LibButtonFacade:AddSkin("Cards: Hearts",{

	-- Skin data start.
	Backdrop = {
		Width = 25,
		Height = 25,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\HeartsBackdrop]],

	},
	Icon = {
		Width = 25,
		Height = 25,
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
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\HeartsNormal]],
		Static = true,
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
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\Gloss]],
	},
	Highlight = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\Highlight]],
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

--Clubs

LibButtonFacade:AddSkin("Cards: Clubs",{
	-- Skin Data Begin
	Template = "Cards: Hearts",
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\ClubsBackdrop]],
	},
	Normal = {
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\ClubsNormal]],
		Static = true,
	},
	-- Skin Data End
},true)

--Spades

LibButtonFacade:AddSkin("Cards: Spades",{
	-- Skin Data Begin
	Template = "Cards: Hearts",
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\SpadesBackdrop]],
	},
	Normal = {
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\SpadesNormal]],
		Static = true,
	},
	-- Skin Data End
},true)

--Diamonds

LibButtonFacade:AddSkin("Cards: Diamonds",{
	-- Skin Data Begin
	Template = "Cards: Hearts",
	Backdrop = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\DiamondsBackdrop]],
	},
	Normal = {
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Cards\Textures\DiamondsNormal]],
		Static = true,
	},
	-- Skin Data End
},true)