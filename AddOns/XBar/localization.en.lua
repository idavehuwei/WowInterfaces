-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------

-- Bindings
BINDING_HEADER_XBAR_TITLE  = "XBar";
BINDING_NAME_XBAR_CONFIG   = "XBar Config";

XBAR_PROFILES              = "XBar Profiles";
XBAR_PROFILE               = "Profile:";

-- Gui Text
XBAR_CLOSEBTN              = "Close";
XBAR_REVERSE               = "Reverse";
XBAR_HORIZONTAL            = "Horizontal";
XBAR_SCALE                 = "Scale";
XBAR_VISIBLE               = "Visible";
XBAR_TOOLTIPS              = "Tooltips";
XBAR_TOGGLE                = "Toggle";
XBAR_WRAP                  = "Wrap";
XBAR_HIGHLIGHT             = "Highlight";
XBAR_SELMOD                = "<-- Select Bar";
XBAR_SELOPTION             = "<-- More Options";
XBAR_NOMOD                 = "NO BARS INSTALLED";
XBAR_SORTDISABLE           = "Sorting is not available for this bar.";
XBAR_HEADER                = "HEADER";
XBAR_SPACER                = "SPACER";
XBAR_OPTION                = "OPTION";
XBAR_BINDBTN               = "Bind";
XBAR_BINDWAIT              = "<press a key or click>";
XBAR_BINDERR               = "Binding already used in ";
XBAR_BTNNEW                = "New";
XBAR_BTNDEL                = "Del";
XBAR_BTNUSE                = "Use";
XBAR_TOGGLETEXT            = "Click to show or hide this bar.";

XBAR_HELP_TITLE            = "Help";
XBAR_HELP_CONTEXT_nil      = "There is no help available for this topic.";
XBAR_HELP_STDOPS           = "\124cffffd200Standard Options:\124r\n"..
                             "Horizontal/Reverse - Control bar orientation.\n"..
                             "Visible - Show the bar\n"..
                             "Tooltips - Enable mouseover tooltips\n"..
                             "Toggle - Enables the +/- expander button\n"..
                             "Highlight - Show active spell highlights (this does not work for all bars)\n"..
                             "Scale - Controls the size of the buttons\n\n"..
                             "Use the sort list shown and the +/- buttons to rearrange the spells, if sorting is available for the bar you have selected.\n\n"..
                             "More options may be shown below the sort list, click the + buttons to view them.  "..
                             "The first one lets you show or hide individual buttons, or change other true/false options.  "..
                             "The second lets you adjust special options via slider control.  These are not available on all bars.";
XBAR_HELP_CONTEXT_CONFIG   = "\124cffff7f7fXBar\124r Configuration Window\n\124cffffd200=====================\124r\n\n"..
                             "To begin, click the + button and select a bar for which you want to modify the options.\n\n"..XBAR_HELP_STDOPS;
XBAR_HELP_CONTEXT_MAIN     = "Click the Bar Settings section to the left to select individual bars, or type '/xbar config'.\n\n\124cffffd200First Run:\124r\n"..
                             "  The first time you install XBar you will see all the bars grouped up together, just move them around where you want, and adjust how they look in the options window.\n\n"..
                             "\124cffffd200General:\124r\n"..
                             "  To move a bar, hold down the CTRL key and right+click to drag them.  If a bar gets stuck on the cursor, type '/xbar stopmoving <bar>'"..
                             " or '/reloadui' if you can't remember the name of the bar you are moving.  The name of the bar is shown if you mouseover the toggle"..
                             " (+/-) button next to the bar, by which you can also move it.\n"..
                             "Type '/xbar' for a full list of commands\n\n"..
                             "\124cffffd200Profiles:\124r\n"..
                             "  See the Profiles section to the left.\n\n"..
                             "\124cffffd200Commands Line Options:\124r\n"..
                             "  See the Commands section to the left.\n\n"..
                             "\124cffffd200Key Bindings:\124r\n"..
                             "Keys may be bound to buttons by selecting the bar in the settings window, clicking on the buttons, and clicking on the Bind button that appears.";

XBAR_HELP_CONTEXT_CMDLINE  = "\124cffffd200Commands Line Options:\124r\n"..
                             "  /xbar config                    -- Open the bar configuration window\n"..
                             "  /xbar show <bar>            -- Show a bar\n"..
                             "  /xbar hide <bar>              -- Hide a bar\n"..
                             "  /xbar showhide <bar>      -- Change the visible state of a bar\n"..
                             "  /xbar resetpos <bar>       -- Reset a bar's position (do this if you can't see it)\n"..
                             "  /xbar resetmod <bar>      -- Reset all UI options for a particular bar\n"..
                             "  /xbar toggle <bar>           -- Show/Hide the toggle [+] button.\n"..
                             "  /xbar stopmoving <bar>  -- Unstick a bar from the cursor\n"..
                             "  /xbar profile                     -- Open the profile configuration window\n\n"..
                             "  <bar> - You have to type the full name of the bar here as it appears in the dropdown box in the config menu (case insensitive)";

XBAR_HELP_CONTEXT_PROFILES = "All characters initially use the 'default' profile (#1).\n\n\124cffffd200Commands Line Functions:\124r\n"..
                             "* To see all profiles, type '/xbar profiles view'\n"..
                             "* To add a new profile, type '/xbar profiles new <name>'\n"..
                             "* To switch the current character to another profile, type\n"..
                             "   '/xbar profiles set #', where # corresponds to the number\n"..
                             "   in the list.\n"..
                             "* To reset (clear) options for a profile, type\n"..
                             "   '/xbar profiles reset #'\n"..
                             "* To delete a profile, type '/xbar profiles delete #'\n"..
                             "   (you may not delete your current profile)\n\n"..
                             "\124cffffd200GUI Interface (below):\124r\n"..
                             "* To see all profiles, click the + button\n"..
                             "* To add a new profile, type the name and click New\n"..
                             "* To switch the current character to another profile, select\n"..
                             "   it in the list and click Use.\n"..
                             "* To delete a profile, select it in the list and click Del";

-- Messages
XBAR_MSG1                  = ": Showing/hiding window.";
XBAR_MSG2                  = ": No version information found, switching to default settings.";
XBAR_MSG3                  = ": Version change detected, switching to default settings.";
XBAR_MSG4                  = "XBar: Initialized with optionset ";
XBAR_MSG5                  = ": Addon failed to register.";
XBAR_MSG6                  = ": Resetting position.";
XBAR_MSG7                  = "XBar: Invalid option set: ";
XBAR_MSG8                  = "XBar: New option set '";
XBAR_MSG9                  = "' stored in slot #";
XBAR_MSG10                 = "XBar: Deleting option set: ";
XBAR_MSG11                 = ": Unsticking window.";
XBAR_MSG12                 = "XBar: LibQueue failed to load.";
XBAR_MSG13                 = "XBar: Action queue could not be initialized.";
