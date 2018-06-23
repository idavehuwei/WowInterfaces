-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------

-- Bindings
getfenv()["BINDING_NAME_CLICK XTrackBarButtonToggle:LeftButton"] = "Show/hide XTrackBar";

XBAR_HELP_CONTEXT_XTrackBar = XBarHelpGUI.ContextHeader("XTrackBar").."Check a tracking type to show or uncheck to hide it.  "..
  "Sorting is not available for this bar since the tracking abilities are derived from the user interface.";
