--[[****************************************************************************
  * _NPCScan.Overlay by Saiket                                                 *
  * Locales/Locale-enUS.lua - Localized string constants (en-US).              *
  ****************************************************************************]]


do
	_NPCScanLocalization.OVERLAY = setmetatable( {
		CONFIG_TITLE = "Overlay";
		CONFIG_ENABLE = ENABLE;
		CONFIG_ALPHA = "Alpha";
		CONFIG_DESC = "Control which maps will show mob path overlays.  Most map-modifying addons are controlled with the World Map option.";
		CONFIG_ZONE = "Zone:";
		CONFIG_IMAGE_FORMAT = "|T%s:%d:%d|t"; -- Path, Height, Width
		CONFIG_LEVEL_TYPE_FORMAT = UNIT_TYPE_LEVEL_TEMPLATE; -- Level, Type

		MODULE_BATTLEFIELDMINIMAP = "Battlefield-Minimap Popout";
		MODULE_WORLDMAP = "Main World Map";
		MODULE_WORLDMAP_KEY = "_|cffCCCC88NPCScan|r.Overlay";
		MODULE_WORLDMAP_KEY_FORMAT = "\226\128\162 %s";
		MODULE_MINIMAP = "Minimap";
		MODULE_RANGERING_FORMAT = "Show %dyd ring for approximate detection range";
		MODULE_RANGERING_DESC = "Note: The range ring only appears in zones with tracked rares.";
		MODULE_ALPHAMAP = "AlphaMap AddOn";
	}, getmetatable( _NPCScanLocalization ) );
end
