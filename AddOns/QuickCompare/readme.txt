Quick Compare by Aquendyn

Compare equipped inventory items against items in any other frames, including but not limited to quest and log, bags and bank, crafts, chat hyperlinks, and even other mods.

Features:
- Mouseover any equippable item button (eg. in containers, banks, quests, etc.) or chat hyperlink (GameTooltip will popup) to compare your current equipment.
- Tooltips will try to stay within screen boundaries.
- Icons accompany tooltips.
- Scales properly (such as with TipBuddy).
- Lightweight (only about 10kB) and no dependencies nor extraneous code.

Commands:
- If you want to hide comparisons unless Control key is down, then type this into chat
/script QuickCompare_VARS.hidecompare=1
- To undo that, type this
/script QuickCompare_VARS.hidecompare=nil

- If you want to hide icons unless Alt key is down, type this
/script QuickCompare_VARS.hideicon=1
- To undo that, type this
/script QuickCompare_VARS.hideicon=nil

- If you want to hide tooltips when mousing over chat hyperlinks, type this
/script QuickCompare_VARS.hidelinkenter=1
- To undo that, type this
/script QuickCompare_VARS.hidelinkenter=nil

Version History
03
- updated toc 20000
- replaced gfind with gmatch

02
- Move GameTooltip to left of owner if it's in right half of screen
- Keep old GameTooltip OnShow script (for mods such as Cooltip)
- Added sticky compare tooltips for ItemRefTooltip
- Added Saved Variables
- Option to hide comparison unless Control key is down
- Option to hide icons unless Alt key is down
- Option to hide hyperlink mouseover
- Compatibility for LootLink (other addons maybe later)
- Fixed: button HitRectInsets, causing blinking tooltips

01
First release
- Mouseover any equippable item button (eg. in containers, banks, quests, etc.) or chat hyperlink (GameTooltip will popup) to compare your current equipment.
- Tooltips will try to stay within screen boundaries.
- Icons accompany tooltips.
- Scales properly (such as with TipBuddy).
- Lightweight (only about 7kB) and no dependencies nor extraneous code.
