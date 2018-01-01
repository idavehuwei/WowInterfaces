--[[ Svelte ]]

local LBF = LibStub("LibButtonFacade", true)
if not LBF then
	return
end

-- Svelte
LBF:AddSkin("Square Shadow", {

	-- Skin data start.
	Backdrop = {
		Width = 42,
		Height = 42,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Svelte\Textures\Backdrop]],
	},
	Icon = {
		Width = 36,
		Height = 36,
	},
	Flash = {
		Width = 42,
		Height = 42,
		Color = {1, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Svelte\Textures\Overlay]],
	},
	Cooldown = {
		Width = 36,
		Height = 36,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 42,
		Height = 42,
		Static = true,
		Color = {0.25, 0.25, 0.25, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Svelte\Textures\Square Shadow]],
	},
	Pushed = {
		Width = 42,
		Height = 42,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Svelte\Textures\Overlay]],
	},
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Svelte\Textures\Border]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {0, 0.75, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Svelte\Textures\Border]],
	},
	AutoCastable = {
		Width = 64,
		Height = 64,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Svelte\Textures\Highlight]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_Svelte\Textures\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		OffsetX = -2,
		OffsetY = 10,
	},
	Count = {
		Width = 42,
		Height = 10,
		OffsetX = -2,
		OffsetY = -10,
	},
	Name = {
		Width = 42,
		Height = 10,
		OffsetY = -10,
	},
	-- Skin data end.

}, true)
