-- -------------------------------------------------------------------------- --
-- GridIndicatorSideIcons DEFAULT (english) Localization                      --
-- Please make sure to save this file as UTF-8. ¶                             --
-- -------------------------------------------------------------------------- --

GridIndicatorSideIcons_Locales =

{
	["Icon (Sides)"] = true,
	["Options for Icon (Sides) indicators."] = true,

	["Top Icon"] = true,
	["Icon Size Top"] = true,
	["Adjust the size of the top icon."] = true,

	["Bottom Icon"] = true,
	["Icon Size Bottom"] = true,
	["Adjust the size of the bottom icon."] = true,

	["Left Icon"] = true,
	["Icon Size Left"] = true,
	["Adjust the size of the left icon."] = true,

	["Right Icon"] = true,
	["Icon Size Right"] = true,
	["Adjust the size of the right icon."] = true,

	["Offset X-axis (top/bottom)"] = true,
	["Adjust the offset of the X-axis for the top and bottom icon."] = true,
	["Offset Y-axis (top/bottom)"] = true,
	["Adjust the offset of the Y-axis for the top and bottom icon."] = true,

	["Offset X-axis (left/right)"] = true,
	["Adjust the offset of the X-axis for the left and right icon."] = true,
	["Offset Y-axis (left/right)"] = true,
	["Adjust the offset of the Y-axis for the left and right icon."] = true,

	["Icon Border Size"] = true,
	["Adjust the size of the icon's border."] = true,
	["Enable Icon Stack Text"] = true,
	["Toggle icon's stack count text."] = true,
	["Enable Icon Cooldown Frame"] = true,
	["Toggle icon's cooldown frame."] = true,
}

function GridIndicatorSideIcons_Locales:CreateLocaleTable(t)
	for k,v in pairs(t) do
		self[k] = (v == true and k) or v
	end
end

GridIndicatorSideIcons_Locales:CreateLocaleTable(GridIndicatorSideIcons_Locales)