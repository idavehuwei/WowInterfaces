-------------------------------------------------------------------------------
-- Simplified Chinese localization (竹笙姬@暴風祭壇 http://tw.myblog.yahoo.com/norova.tw/)
-------------------------------------------------------------------------------
if (GetLocale() == "zhCN") then
-- Bindings
BINDING_HEADER_XBAR_TITLE   = "XBar";
BINDING_NAME_XBAR_CONFIG    = "XBar设置";

XBAR_PROFILES               = "XBar配置";
XBAR_PROFILE                = "配置:";

-- Gui Text
XBAR_CLOSEBTN               = "关闭";
XBAR_REVERSE                = "反向";
XBAR_HORIZONTAL             = "水平方向";
XBAR_SCALE                  = "大小";
XBAR_VISIBLE                = "显示";
XBAR_TOOLTIPS               = "提示";
XBAR_TOGGLE                 = "Toggle";
XBAR_WRAP                   = "Wrap";
XBAR_HIGHLIGHT              = "高亮";
XBAR_SELMOD                 = "<-- 选择 Bar";
XBAR_SELOPTION              = "<-- 选项(如果有的话)";
XBAR_NOMOD                  = "沒有安裝任何的 BARS";
XBAR_SORTDISABLE            = "Sorting is not available for this bar.";
XBAR_HEADER                 = "HEADER";
XBAR_SPACER                 = "SPACER";
XBAR_OPTION                 = "OPTION";
XBAR_BINDBTN                = "Bind";
XBAR_BINDWAIT               = "<press a key or click>";
XBAR_BINDERR                = "Binding already used in ";
XBAR_BTNNEW                 = "新建";
XBAR_BTNDEL                 = "删除";
XBAR_BTNUSE                 = "使用";
XBAR_TOGGLETEXT             = "Click to show or hide this bar.";

-- Help text
XBAR_HELPTEXT1              = "快速指令:";
XBAR_HELPTEXT7              = "移动: 按住Ctrl键不放,使用鼠标右键拖拽曳";
XBAR_HELPTEXT8              = "选项:";

XBAR_HELP_TITLE             = "帮助";
XBAR_HELP_CONTEXT_nil       = "There is no help available for this topic.";
XBAR_HELP_STDOPS            = "\124cffffd200Standard Options:\124r\n"..
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
XBAR_HELP_CONTEXT_CONFIG    = "\124cffff7f7fXBar\124r Configuration Window\n\124cffffd200=====================\124r\n\n"..
                              "To begin, click the + button and select a bar for which you want to modify the options.\n\n"..XBAR_HELP_STDOPS;
XBAR_HELP_CONTEXT_MAIN      = "Click the Bar Settings section to the left to select individual bars, or type '/xbar config'.\n\n\124cffffd200First Run:\124r\n"..
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

XBAR_HELP_CONTEXT_CMDLINE   = "\124cffffd200Commands Line Options:\124r\n"..
                              "  /xbar config           -- Open the bar configuration window\n"..
                              "  /xbar show <bar>       -- Show a bar\n"..
                              "  /xbar hide <bar>       -- Hide a bar\n"..
                              "  /xbar showhide <bar>   -- Change the visible state of a bar\n"..
                              "  /xbar resetpos <bar>   -- Reset a bar's position (do this if you can't see it)\n"..
                              "  /xbar resetmod <bar>   -- Reset all UI options for a particular bar\n"..
                              "  /xbar toggle <bar>     -- Show/Hide the toggle [+] button.\n"..
                              "  /xbar stopmoving <bar> -- Unstick a bar from the cursor\n"..
                              "  /xbar profile          -- Open the profile configuration window\n\n"..
                              "  <bar> - You have to type the full name of the bar here as it appears in the dropdown box in the config menu (case insensitive)";

XBAR_HELP_CONTEXT_PROFILES  = "All characters initially use the 'default' profile (#1).\n\n\124cffffd200Commands Line Functions:\124r\n"..
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
XBAR_MSG1                   = ": 显示/隐藏.";
XBAR_MSG2                   = ": 未找到版本信息, 使用默认设置.";
XBAR_MSG3                   = ": 检测到版本变更, 使用默认设置.";
XBAR_MSG4                   = "XBar: 载入设置 ";
XBAR_MSG5                   = ": 插件无法使用";
XBAR_MSG6                   = ": 重置位置.";
XBAR_MSG7                   = "XBar: 无效的设置: ";
XBAR_MSG8                   = "XBar: 新设置 '";
XBAR_MSG9                   = "' 已存储在 #";
XBAR_MSG10                  = "XBar: 删除设置: ";
XBAR_MSG11                  = ": Unsticking window.";
XBAR_MSG12                  = "XBar: LibQueue 库加载失败.";
XBAR_MSG13                  = "XBar: Action queue could not be initialized.";
end;
