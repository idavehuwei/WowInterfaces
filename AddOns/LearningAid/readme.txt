Learning Aid version 1.07.2
Written by Jamash (Kil'jaeden US)
Email: mooninaut@gmail.com

If you would like to contribute to the development of Learning Aid, please
visit http://pledgie.com/campaigns/3581

To download the latest version of Learning Aid, please visit either
http://wow.curse.com/downloads/wow-addons/details/learningaid.aspx
or
http://www.wowinterface.com/downloads/info10622-LearningAid.html

Learning Aid helps you put new spells, abilities, tradeskills, mounts and
minipets on your action bars or in your macros when you learn them, without
having to page through your Spellbook or Pets tab.  When you learn something
new, Learning Aid pops up a window with an icon for the newly learned action.
You may then drag the icon to your action bar, or use it to paste a link into
chat or text into a macro.  You can also use the new action directly by
clicking on the icon.  When you're done, you can easily dismiss the window.


User Interface Reference

Learning Aid Window
  Left-click and drag the titlebar to move the window.
  Right-click on the titlebar to bring up the menu.
  Click the close box or middle-click on the titlebar to close the window.

Action Buttons
  Left- or right-click to perform the action.
  Middle-click to dismiss a button.  Dismissing the only button closes the
  window.
  Shift-click on a button to create a chat link or paste the ability name into
  the macro window.

Slash Command Reference

Type

/learningaid command [arguments]

or

/la command [arguments]


Slash Commands

/la
  Print help text to the default chat window.

/la config
  Open the Learning Aid configuration window.

/la restoreactions [on|off]
  Toggle whether to restore talent-based actions to action bars when they are
  relearned.

/la filter [0|1|2]
  Set whether to filter "You have learned" and "You have unlearned" chat messages.
    0 - Show All: Do not filter learning and unlearning messages.
    1 - Summarize: Reduce multiple lines of messages to a one or two line summary.
    2 - Show None: Filter out all learning and unlearning messages.
    Default: 1.

/la search
  Scan through your action bars to find any spells you have learned
  but not placed on an action bar.

/la close
  Close the window.

/la reset
  Reset the window's position to default.

/la lock on
  Lock the window's position so it cannot be dragged.

/la lock off
/la unlock
  Unlock the window's position so it can be dragged.

/la lock
  Toggle whether the window is locked.

/la tracking [on|off]
  Set whether /la missing searches for tracking abilities.

/la shapeshift [on|off]
  Set whether /la missing searches for shapeshift forms, stances, auras,
  presences, etc.

/la macros [on|off]
  Set whether /la missing searches inside macros for abilities in use.


Advanced Slash Commands

/la debug
  Turn debugging output on or off.

/la test
  /la test add TYPE INDEX [INDEX ...]
  /la test remove TYPE INDEX
    TYPE is "spell", "mount" or "critter".
    INDEX is the number of the spell, mount or minipet you wish to add or
    remove, counting from 1.
