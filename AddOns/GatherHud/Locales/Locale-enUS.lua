-- GatherHud
-- enUS and enGB Localization file

local L = LibStub("AceLocale-3.0"):NewLocale("GatherHud", "enUS", true)


L["GatherHud"] = true
L["gatherhud"] = true -- slash command

-- Top level options
L["GATHERHUD_DESC"] = "GatherHud is a highly configurable hud that allows you to quickly see where the nearby nodes are. GatherHud optionally supports Routes.\n\nNote that you can scroll your mouse wheel while over the sliders to step by 1."
L["Enable GatherHud"] = true
L["Enable or disable GatherHud"] = true
L["Keybind to toggle GatherHud"] = true

-- GatherHud options
L["GatherHud Options"] = true
L["Hud X-Position"] = true
L["The X offset coordinate of the hud from the center of the screen"] = true
L["Hud Y-Position"] = true
L["The Y offset coordinate of the hud from the center of the screen"] = true
L["Hud Width"] = true
L["The pixel width of the hud. In effect, this controls the scaling of the entire hud"] = true
L["Hud Alpha"] = true
L["The alpha transparency of the hud"] = true
L["Angle of view"] = true
L["The angle of elevation from the horizontal plane to view the hud at"] = true
L["Hud map radius"] = true
L["The radius in yards the hud will draw nodes for from your position"] = true
L["Show Hud circle"] = true
L["Displays a circle border representing the drawing area of the hud"] = true
L["Show North indicator"] = true
L["Displays a letter N on the border of the hud circle to indicate the North direction"] = true
L["Use Minimum Pitch"] = true
L["Minimum Pitch"] = true
L["Do not allow the GatherHud camera pitch to go below this angle"] = true
L["Use Character Pitch"] = true
L["Use the Character pitch instead of a user-specified angle"] = true

-- GatherHud Icon Options
L["GatherHud Icon Options"] = true
L["Icon size"] = true
L["The size of the icons displayed in the hud"] = true
L["Icon depth effect"] = true
L["A depth effect that controls how much the size of the icons changes for nodes in the near and far distance"] = true
L["Icon alpha"] = true
L["The alpha transparency of the icons"] = true
L["Self color"] = true
L["The color of the small circle that represents yourself in the center of the hud"] = true

 -- GatherHud Routes Support
L["GatherHud Routes Support"] = true
L["Show Routes in the hud"] = true

L["Gather HUD: "] = true;
L["Enabled"] = true;
L["Disabled"] = true;
-- vim: ts=4 noexpandtab
