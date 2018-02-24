-- Color = {[RED]0, [GREEN]0, [Blue]0, [ALPHA]0.5},
local LBF = LibStub("LibButtonFacade", true)
if not LBF then
	return
end

-- Sion
LBF:AddSkin("Sion", {

-- Back Ground
	Backdrop = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Sion\Backdrop]],
	},
	Icon = {
		Width = 28,
		Height = 28,
	},
-- Flash
	Flash = {
		Width = 32,
		Height = 32,
		Color = {1, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Sion\Overlay]],
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
-- Top Layer
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Sion\Normal]],
	},
-- Pushed
	Pushed = {
		Width = 32,
		Height = 32,
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Sion\Overlay]],
	},
-- Equipped
	Border = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Sion\Border]],
	},
	Disabled = {
		Hide = true,
	},
-- Active
	Checked = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 0, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Sion\Border]],
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
-- Mouseover
	Highlight = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Sion\Highlight]],
	},
	Gloss = {
		Width = 32,
		Height = 32,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Sion\Gloss]],
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
-- Macro
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = -6,
	},
	-- Skin data end.

}, true)

-- Darkage
LBF:AddSkin("Darkage", {

-- Back Ground
	Backdrop = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\darkage\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
	},
-- Flash
	Flash = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\darkage\Overlay]],
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
-- Top Layer
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\darkage\Normal]],
	},
-- Pushed
	Pushed = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\darkage\Overlay]],
	},
-- Equipped
	Border = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 1, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\darkage\Border]],
	},
	Disabled = {
		Hide = true,
	},
-- Active
	Checked = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\darkage\Border]],
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
-- Mouseover
	Highlight = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\darkage\Highlight]],
	},
	Gloss = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\darkage\Gloss]],
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
-- Macro
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = -6,
	},
	-- Skin data end.

}, true)

-- Glas
LBF:AddSkin("Glas", {

-- BackGround
	Backdrop = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Glas\Backdrop]],
	},
	Icon = {
		Width = 28,
		Height = 28,
		OffsetX = 0,
		OffsetY = 0,
	},
-- Flash
	Flash = {
		Width = 32,
		Height = 32,
		OffsetX = 0,
		OffsetY = 0,
		Color = {1, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Glas\overlay]],
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
-- Top Layer
	Normal = {
		Static = true,
		Width = 32,
		Height = 32,
		OffsetX = 0,
		OffsetY = 0,
		Color = {1, 1, 1, 0},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Glas\Normal]],
	},
-- Pushed
	Pushed = {
		Width = 32,
		Height = 32,
		OffsetX = 0,
		OffsetY = 0,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Glas\Overlay]],
	},
-- Equipped
	Border = {
		Width = 32,
		Height = 32,
		OffsetX = 0,
		OffsetY = 0,
		BlendMode = "ADD",
		Color = {0, 1, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Glas\Border]],
	},
	Disabled = {
		Hide = true,
	},
-- Active
	Checked = {
		Width = 32,
		Height = 32,
		OffsetX = 0,
		OffsetY = 0,
		BlendMode = "ADD",
		Color = {0, 0, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Glas\Overlay]],
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
-- Mouseover
	Highlight = {
		Width = 32,
		Height = 32,
		OffsetX = 0,
		OffsetY = 0,
		BlendMode = "ADD",
		Color = {1, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Glas\Highlight]],
	},
	Gloss = {
		Width = 32,
		Height = 32,
		OffsetX = 0,
		OffsetY = 0,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Glas\Gloss]],
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetX = -3,
		OffsetY = 13,
	},
	Count = {
		Width = 32,
		Height = 10,
		OffsetX = 0,
		OffsetY = -8,
	},
-- Macro
	Name = {
		Width = 32,
		Height = 8,
		OffsetX = -1,
		OffsetY = -8,
	},
	-- Skin data end.

}, true)

-- Center
LBF:AddSkin("Center", {

	-- Skin data start.
-- BackGround
	Backdrop = {
		Width = 32,
		Height = 32,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Center\Backdrop]],
	},
	Icon = {
		Width = 25,
		Height = 25,
	},
-- Flash
	Flash = {
		Width = 32,
		Height = 32,
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Center\Overlay]],
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
-- Top Layer
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Center\Normal]],
	},
-- Pushed
	Pushed = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Center\Overlay]],
	},
-- Equipped
	Border = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 1, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Center\Border]],
	},
	Disabled = {
		Hide = true,
	},
-- Active
	Checked = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 0, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Center\Border]],
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
-- Mouseover
	Highlight = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {1, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Center\Highlight]],
	},
	Gloss = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Center\Gloss]],
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
		OffsetX = 0,
		OffsetY = -10,
	},
-- Macro
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = -12,
	},
	-- Skin data end.

}, true)

-- Simple
LBF:AddSkin("Simple", {

-- Back Ground
	Backdrop = {
		Width = 32,
		Height = 32,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Simple\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
	},
-- Flash
	Flash = {
		Width = 32,
		Height = 32,
		Color = {1, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Simple\Overlay]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
-- Top Layer
	Normal = {
		Width = 32,
		Height = 32,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Simple\Normal]],
	},
-- Pushed
	Pushed = {
		Width = 32,
		Height = 32,
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Simple\Overlay]],
	},
-- Equipped
	Border = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Simple\Border]],
	},
	Disabled = {
		Hide = true,
	},
-- Active
	Checked = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 0, 1, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Simple\Border]],
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
-- Mouseover
	Highlight = {
		Width = 32,
		Height = 32,
		BlendMode = "ADD",
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Simple\Highlight]],
	},
	Gloss = {
		Width = 32,
		Height = 32,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\ButtonFacade\Skins\ButtonFacade_sion\Simple\Gloss]],
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
-- Macro
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = -6,
	},
	-- Skin data end.

}, true)