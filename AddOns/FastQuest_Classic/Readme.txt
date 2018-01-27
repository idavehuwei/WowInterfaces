=========
 Summary
=========
FastQuest Classic is an addon to enhance quest log displaying, quest 
tracking, and notification. This is an alternative to heavy duty add-ons 
like MonkeyQuest, Quest-I-On, etc. The difference is that the code is 
much smaller and faster, since it uses Blizzard's build-in components 
enhancing and improving them. But it does not have full set of features 
those addons offer, so try them and decide what is best for you! 

==============================
 History of FastQuest Classic
==============================
FastQuest Classic is originally called "FastQuest" and is written by Vashen. 
Vashen had left WoW after he released the great FastQuest 2.11. Since then, 
FastQuest has some minor udpated by some fans including the WoWBox* Alfred. 
While I am trying to contact Vashen and also Alfred to seek for some other 
minor update for FastQuest, I did not get any response from them at that 
time. Then I decide to picked it up and try to fixed some minor issues, I 
then register an continued addon on Curse. Since that, FastQuest is released 
with version number like 2.11.1, 2.11.2, 2.11.3, etc.

When the TBC was going to be released in US and Europe, Vashen was back and 
he decided to continue the implementation. Vashen started the new FastQuest 
with version number 3.x and was supported with Titan and Fubar. I saw Vashen's 
messages and actions, I was thinking it's about the time to turn back this 
great addon to Vashen and also the credits.

However, there are some players still love the classic and standalone 
FastQuest, including me. So I decide to rename the addon name to 
"FastQuest Classic" and started from version 2.11.207.

* WoWBox: http://wowbox.tw/ 

==============
 Installation
==============
Unpack the ZIP file to WoW\Interface\AddOns\

For example, if your WoW is installed under 
"C:\Program Files\Blizzard\World of WarCraft"
you should see below structure once you have correctly unzip the addon:
    C:\Program Files\Blizzard\World of Warcraft\Interface\AddOns\FastQuest_Classic\Images\
    C:\Program Files\Blizzard\World of Warcraft\Interface\AddOns\FastQuest_Classic\Bindings.xml
    C:\Program Files\Blizzard\World of Warcraft\Interface\AddOns\FastQuest_Classic\FastQuest.lua
    C:\Program Files\Blizzard\World of Warcraft\Interface\AddOns\FastQuest_Classic\FasuQuest.xml
    C:\Program Files\Blizzard\World of Warcraft\Interface\AddOns\FastQuest_Classic\FastQuest_Classic.toc
....

==========
 Features
==========
    * Enhances Blizzard's Quest WatchFrame! Automatically add current quests 
      to WatchFrame and removes them when they are completed. This option
      is ON by default and can be toggled by /fq autoadd.
    * Easy quest tracking. You can use RightClick or Shift+click quest names 
      in QuestLog window to Add/Remove quests manually. (/fq clear will
      remove all quest from the tracker)
    * Adds formatting options for Shift+LeftClick / Crtl+LeftClick / 
      Ctrl+RightClick into chat use /fq format to cycle through them. Allows
      "[10+] QuestName", "[10] QuestName (Elite)", etc.
    * Use Ctrl+RightClick on the quest to send not only quest title but also 
      quest objective to chat frame, it makes things easier when you are going
      to tell people what quest you are investigating without typing quest
      detail by your self.
    * Quests in WatchFrame are displayed in color that is based on difficulty. 
      There are now over 20 shades of colors from bright green to bright red
      that are used to denote quest and monster difficulty. Quest that would
      be come trivial next level is highlighted giving you chance to complete
      it while it still yields exp.
    * Automatically notify your party/guild/raid/near-by people of your quest 
      progress (example: Thistle Boar Slain 5/7), this option is off by
      default and can be toggled by /fq autonotify
    * Notify your party/guild/raid or near-by people for your level-up or new 
      area/zone discovered is configurable. Sometimes you may want to enable
      this feature so that your partners may now your recent status when you
      all are looking for some place together or s/he is farming together with
      you for your leveling-up.
    * Allows you to insert quest objectives of the selected quest into the 
      chat. Open the chatbox and right click on the quest name. (check the
      screenshot above.) Control click on the quest name also lists objectives
      but in the shorter form, the way they are displayed in quest tracker.
    * Allows WatchFrame to be draged anywhere on the screen (use "/fq unlock" 
      to enable draging and you can "/fq lock" to lock it in place).
    * Automatically complete turn-in quests such as the once in AV that you 
      have to turn in one by one. When you right click on the NPC to turn in
      quest, FQ will click "Continue" and "Complete Quest" buttons for you,
      but will stop to let you pick reward if choice is given. The down side
      is that you will not be able to read what NPC's replies to you when you
      turn in your quest, but that's only to those who actually read it :)
      This feature is off by default and can be toggled by /fq autocomplete
    * Configurable options are now supported with slash command "/fq options", 
      or simply click on the minimap icon or Quest Log's "FQ" button.

================
 Slash Commands
================
/fq notifyparty    - Toggle automatic notification of party members.
/fq notifyguild    - Toggle automatic notification of guild members.
/fq notifyraid     - Toggle automatic notification of raid members.
/fq notifynearby   - Toggle automatic notification for non-party channel.
/fq autoadd        - Toggle automatic addition of changed quests to QuestTracker.
/fq autocomplete   - Toggle automatic completion of quests when turning them in. (You will not see the quest 
                     completion information from NPC.)
/fq autonotify     - Toggle automatic notification of party members.
/fq clear          - Clear QuestTracker window from all quests.
/fq color          - Toggle colorful quest title in QuestTracker window.
/fq detail         - Toggle quest notification in brief or in detail.
/fq format         - Toggle quest notification output format.
/fq lock(unlock)   - Locks/Unlocks quest tracker window.
/fq memberinfo     - Toggle quest's suggested to go with group info to be displayed or not.
/fq notifydiscover - Toggle automatic notification of the new zone you discovered.
/fq notifyexp      - Toggle automatic notification of experience gained from a quest.
/fq notifylevelup  - Notify the level-up information
/fq options        - Toggle option frame.
/fq reset          - Resets QuestTracker window's position
/fq status         - Display all the FastQuest Classic configuration status.
/fq tag            - Toggle display of quest tags (elite, raid, etc)

==============
 Localization
==============
    * English
    * French (oXid_FoX, Ksys)
    * Traditional Chinese (Arith)
    * Simplified Chinese (Arith)
    * German (Killekille of Blackrock)
    * Korean (gygabyte) 
