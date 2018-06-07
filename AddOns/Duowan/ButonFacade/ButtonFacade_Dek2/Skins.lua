--[[ Dek2 3.1.47 ]]

local LBF = LibStub("LibButtonFacade", true)
if not LBF then
	return
end

-- Dek2
LBF:AddSkin("Dek2", {

	-- Skin data start.
	Backdrop = {
		Width = 42,
		Height = 42,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Dek2\Textures\Backdrop]],
	},
	Icon = {
		Width = 36,
		Height = 36,
	},
	Flash = {
		Width = 42,
		Height = 42,
		Color = {1, 0, 0, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Dek2\Textures\Normal]],
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
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Dek2\Textures\Normal]],
	},
	Pushed = {
		Width = 42,
		Height = 42,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Dek2\Textures\Normal]],
	},
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Dek2\Textures\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 42,
		Height = 42,
		BlendMode = "Blend",
		Color = {0, 0.75, 1, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Dek2\Textures\Normal]],
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
		BlendMode = "Blend",
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Dek2\Textures\Normal]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Dek2\Textures\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		OffsetX = -4,
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
