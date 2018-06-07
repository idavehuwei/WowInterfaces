--[[ Entropy r59 ]]

local LBF = LibStub("LibButtonFacade", true)
if not LBF then
	return
end

-- Silver
LBF:AddSkin("Entropy: Silver", {

	-- Skin data start.
	Backdrop = {
		Width = 32,
		Height = 32,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Backdrop]],
	},
	Icon = {
		Width = 28,
		Height = 28,
	},
	Flash = {
		Width = 32,
		Height = 32,
		Color = {1, 0, 0, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Overlay]],
	},
	Cooldown = {
		Width = 28,
		Height = 28,
	},
	AutoCast = {
		Width = 26,
		Height = 26,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Normal]],
	},
	Pushed = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Overlay]],
	},
	Border = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 1, 0, 0.3},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Border]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 0.75, 1, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Border]],
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Highlight]],
	},
	Gloss = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Gloss]],
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetX = 2,
		OffsetY = 12,
	},
	Count = {
		Width = 32,
		Height = 10,
		OffsetX = -2,
		OffsetY = -6,
	},
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = -6,
	},
	-- Skin data end.

}, true)

-- Adamantite
LBF:AddSkin("Entropy: Adamantite", {

	-- Skin data start.
	Template = "Entropy: Silver",
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {0.7, 0.8, 0.9, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Normal]],
	},
	-- Skin data end.

}, true)

-- Bronze
LBF:AddSkin("Entropy: Bronze", {

	-- Skin data start.
	Template = "Entropy: Silver",
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {1, 0.75, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Normal]],
	},
	-- Skin data end.

}, true)

-- Copper
LBF:AddSkin("Entropy: Copper", {

	-- Skin data start.
	Template = "Entropy: Silver",
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {0.75, 0.5, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Normal]],
	},
	-- Skin data end.

}, true)

-- Fel Iron
LBF:AddSkin("Entropy: Fel Iron", {

	-- Skin data start.
	Template = "Entropy: Silver",
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {0.75, 1, 0.75, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Normal]],
	},
	-- Skin data end.

}, true)

-- Gold
LBF:AddSkin("Entropy: Gold", {

	-- Skin data start.
	Template = "Entropy: Silver",
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {1, 0.85, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Normal]],
	},
	-- Skin data end.

}, true)

-- Iron
LBF:AddSkin("Entropy: Iron", {

	-- Skin data start.
	Template = "Entropy: Silver",
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {0.5, 0.5, 0.5, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Normal]],
	},
	-- Skin data end.

}, true)

-- Khorium
LBF:AddSkin("Entropy: Khorium", {

	-- Skin data start.
	Template = "Entropy: Silver",
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {1, 0.8, 0.9, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Entropy\Textures\Normal]],
	},
	-- Skin data end.

}, true)
