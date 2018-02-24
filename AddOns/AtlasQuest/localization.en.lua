--[[

	AtlasQuest, a World of Warcraft addon.
	Email me at mystery8@gmail.com

	This file is part of AtlasQuest.

	AtlasQuest is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	AtlasQuest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


---------------
--- COLOURS ---
---------------

local GREY = "|cff999999";
local RED = "|cffff0000";
local REDA = "|cffcc6666";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";
local YELLOW = "|cffFFd200";   -- Ingame Yellow


---------------
--- OPTIONS ---
---------------

AQHelpText = ""..WHITE.."type /aq or atlasquest "..YELLOW.."[command]"..WHITE.."\ncommands: help; option/config; show/hide; left/right; colour; autoshow"..RED.."(only Atlas)"
--
AQOptionsCaptionTEXT = ""..YELLOW.."AtlasQuest Options";
AQ_OK = "OK"

-- Autoshow
AQOptionsAutoshowTEXT = ""..WHITE.."Show AtlasQuest panel with "..RED.."Atlas"..WHITE..".";
AQAtlasAutoON = "The AtlasQuest panel will be automatically displayed when atlas is opened."..GREEN.."(default)"
AQAtlasAutoOFF = "The AtlasQuest panel "..RED.."will not"..WHITE.." be displayed when you open atlas."

-- Right/Left
AQOptionsLEFTTEXT = ""..WHITE.."Show the AtlasQuest panel "..RED.."left"..WHITE..".";
AQOptionsRIGHTTEXT = ""..WHITE.."Show the AtlasQuest panel "..RED.."right"..WHITE..".";
AQShowRight = "Now shows the AtlasQuest Panel on the "..RED.."right"..WHITE.." side.";
AQShowLeft = "Now shows the AtlasQuest Panel on the "..RED.."left"..WHITE.." side "..GREEN.."(default)";

-- Colour Check
AQOptionsCCTEXT = ""..WHITE.."Recolour the quests depending on their levels."
AQCCON = "AtlasQuest will now recolour quests depending on their levels."
AQCCOFF = "AtlasQuest will not recolour quests."

-- QuestLog Colour Check
AQQLColourChange = ""..WHITE.."Colours all quest, you have in your Questlog "..BLUE.."blue."

-- AutoQuery Quest Rewards
AQOptionsAutoQueryTEXT = ""..WHITE.."Automatically query the server for items you haven't seen."

-- Suppress Server Query text
AQOptionsNoQuerySpamTEXT = ""..WHITE.."Suppress Server Query spam."

-- Use Comparison Tooltips
AQOptionsCompareTooltipTEXT = ""..WHITE.."Compare rewards to currently equipped items."


AQAbilities = BLUE .. "Abilities:" .. WHITE;
AQSERVERASKInformation = " Please click right until you see the Item frame."
AQSERVERASKAuto = " Try moving the cursor over the item in a second."
AQSERVERASK = "AtlasQuest is querying the server for: "
AQERRORNOTSHOWN = "This item is not safe!"
AQERRORASKSERVER = "Right-click to query the server for \nthis item. You may be disconnected."
AQOptionB = "Options"
AQStoryB = "Story"
AQNoReward = ""..BLUE.." No Rewards"
AQDiscription_OR = ""..GREY.." or "..WHITE..""
AQDiscription_AND = ""..GREY.." and "..WHITE..""
AQDiscription_REWARD = ""..BLUE.." Reward: "
AQDiscription_ATTAIN = "Attain: "
AQDiscription_LEVEL = "Level: "
AQDiscription_START = "Starts at: \n"
AQDiscription_AIM = "Objective: \n"
AQDiscription_NOTE = "Note: \n"
AQDiscription_PREQUEST= "Prequest: "
AQDiscription_FOLGEQUEST = "Followup: "
AQFinishedTEXT = "Finished: ";


------------------
--- ITEM TYPES ---
------------------

AQITEM_DAGGER = " Dagger"
AQITEM_POLEARM = " Polearm"
AQITEM_SWORD = " Sword"
AQITEM_AXE = " Axe"
AQITEM_WAND = "Wand"
AQITEM_STAFF = "Staff"
AQITEM_MACE = " Mace"
AQITEM_SHIELD = "Shield"
AQITEM_GUN = "Gun"
AQITEM_BOW = "Bow"
AQITEM_CROSSBOW = "Crossbow"
AQITEM_THROWN = "Thrown"

AQITEM_WAIST = "Waist,"
AQITEM_SHOULDER = "Shoulder,"
AQITEM_CHEST = "Chest,"
AQITEM_LEGS = "Legs,"
AQITEM_HANDS = "Hands,"
AQITEM_FEET = "Feet,"
AQITEM_WRIST = "Wrist,"
AQITEM_HEAD = "Head,"
AQITEM_BACK = "Back"
AQITEM_TABARD = "Tabard"

AQITEM_CLOTH = " Cloth"
AQITEM_LEATHER = " Leather"
AQITEM_MAIL = " Mail"
AQITEM_PLATE = " Plate"

AQITEM_OFFHAND = "Offhand"
AQITEM_MAINHAND = "Main Hand,"
AQITEM_ONEHAND = "One-Hand,"
AQITEM_TWOHAND = "Two-Hand,"

AQITEM_ITEM = "Item" -- Use this for those oddball rewards which aren't really anything else.
AQITEM_TRINKET = "Trinket"
AQITEM_RELIC = "Relic"
AQITEM_POTION = "Potion"
AQITEM_OFFHAND = "Held In Hand"
AQITEM_NECK = "Neck"
AQITEM_PATTERN = "Pattern"
AQITEM_BAG = "Bag"
AQITEM_RING = "Ring"
AQITEM_KEY = "Key"
AQITEM_GEM = "Gem"
AQITEM_QUIVER = "Quiver"
AQITEM_AMMOPOUCH = "Ammo Pouch"
AQITEM_ENCHANT = "Enchant"
AQITEM_EMBLEM = "Emblem"



----------------------------------------------
---------------- DUNGEONS --------------------
----------------------------------------------



--------------- INST36 - No Instance ---------------

-- Just to display "No Quests" when the map is set to something AtlasQuest does not support. I'll probably find a better way of doing this later.
Inst36Story = ""
Inst36Caption = "No Information Available"
Inst36QAA = "No Quests"
Inst36QAH = "No Quests"



--------------- INST1 - Deadmines (VC) ---------------

Inst1Story = "Once the greatest gold production center in the human lands, the Dead Mines were abandoned when the Horde razed Stormwind city during the First War. Now the Defias Brotherhood has taken up residence and turned the dark tunnels into their private sanctum. It is rumored that the thieves have conscripted the clever goblins to help them build something terrible at the bottom of the mines - but what that may be is still uncertain. Rumor has it that the way into the Deadmines lies through the quiet, unassuming village of Moonbrook."
Inst1Caption = "Deadmines"
Inst1QAA = "7 Quests" -- how many quests for alliance
Inst1QAH = "No Quests" -- for horde

--Quest 1 Alliance
Inst1Quest1 = "1. Red Silk Bandanas"
Inst1Quest1_Level = "17"
Inst1Quest1_Attain = "14"
Inst1Quest1_Aim = "Scout Riell at the Sentinel Hill Tower wants you to bring her 10 Red Silk Bandanas."
Inst1Quest1_Location = "Scout Riell (Westfall - Sentinel Hill; "..YELLOW.."56, 47"..WHITE..")"
Inst1Quest1_Note = "You can get the Red Silk Bandanas from miners in the Deadmines or the in the town where the instance is located. The quest becomes available after you complete the The Defias Brotherhood questline up to the part where you have to kill Edwin VanCleef."
Inst1Quest1_Prequest = "Yes (see Note)"
Inst1Quest1_Folgequest = "None"
Inst1Quest1PreQuest = "true"
--
Inst1Quest1name1 = "Solid Shortblade"
Inst1Quest1name2 = "Scrimshaw Dagger"
Inst1Quest1name3 = "Piercing Axe"

--Quest 2 Alliance
Inst1Quest2 = "2. Collecting Memories"
Inst1Quest2_Level = "18"
Inst1Quest2_Attain = "14"
Inst1Quest2_Aim = "Retrieve 4 Miners' Union Cards and return them to Wilder Thistlenettle in Stormwind."
Inst1Quest2_Location = "Wilder Thistlenettle (Stormwind - Dwarven District; "..YELLOW.."70.3, 40.8"..WHITE..")"
Inst1Quest2_Note = "The cards drop off undead mobs outside the instance in the area near "..YELLOW.."[3]"..WHITE.." on the Entrance map."
Inst1Quest2_Prequest = "None"
Inst1Quest2_Folgequest = "None"
--
Inst1Quest2name1 = "Tunneler's Boots"
Inst1Quest2name2 = "Dusty Mining Gloves"

--Quest 3 Alliance
Inst1Quest3 = "3. Oh Brother. . ."
Inst1Quest3_Level = "20"
Inst1Quest3_Attain = "15"
Inst1Quest3_Aim = "Bring Foreman Thistlenettle's Explorers' League Badge to Wilder Thistlenettle in Stormwind."
Inst1Quest3_Location = "Wilder Thistlenettle (Stormwind - Dwarven District; "..YELLOW.."70.3, 40.8"..WHITE..")"
Inst1Quest3_Note = "Foreman Thistlenettle is found outside the instance in the undead area at "..YELLOW.."[3]"..WHITE.." on the Entrance map."
Inst1Quest3_Prequest = "None"
Inst1Quest3_Folgequest = "None"
--
Inst1Quest3name1 = "Miner's Revenge"

--Quest 4 Alliance
Inst1Quest4 = "4. Underground Assault"
Inst1Quest4_Level = "20"
Inst1Quest4_Attain = "15"
Inst1Quest4_Aim = "Retrieve the Gnoam Sprecklesprocket from the Deadmines and return it to Shoni the Shilent in Stormwind."
Inst1Quest4_Location = "Shoni the Silent (Stormwind - Dwarven District; "..YELLOW.."62.6, 34.1"..WHITE..")"
Inst1Quest4_Note = "The prequest can be obtained from Gnoarn (Ironforge - Tinkertown; "..YELLOW.."69,50"..WHITE..").\nSneed's Shredder drops the Sprecklesprocket "..YELLOW.."[3]"..WHITE.."."
Inst1Quest4_Prequest = "Speak with Shoni"
Inst1Quest4_Folgequest = "None"
Inst1Quest4PreQuest = "true"
--
Inst1Quest4name1 = "Polar Gauntlets"
Inst1Quest4name2 = "Sable Wand"

--Quest 5 Alliance
Inst1Quest5 = "5. The Defias Brotherhood"
Inst1Quest5_Level = "22"
Inst1Quest5_Attain = "14"
Inst1Quest5_Aim = "Kill Edwin VanCleef and bring his head to Gryan Stoutmantle."
Inst1Quest5_Location = "Gryan Stoutmantle (Westfall - Sentinel Hill; "..YELLOW.."56,47"..WHITE..")"
Inst1Quest5_Note = "You start this Questline at Gryan Stoutmantle (Westfall - Sentinel Hill; "..YELLOW.."56,47"..WHITE..").\nEdwin VanCleef is the last boss of The Deadmines. You can find him at the top of his ship "..YELLOW.."[6]"..WHITE.."."
Inst1Quest5_Prequest = "The Defias Brotherhood."
Inst1Quest5_Folgequest = "None"
Inst1Quest5PreQuest = "true"
--
Inst1Quest5name1 = "Chausses of Westfall"
Inst1Quest5name2 = "Tunic of Westfall"
Inst1Quest5name3 = "Staff of Westfall"

--Quest 6 Alliance
Inst1Quest6 = "6. The Test of Righteousness (Paladin)"
Inst1Quest6_Level = "22"
Inst1Quest6_Attain = "20"
Inst1Quest6_Aim = "Using Jordan's Weapon Notes, find some Whitestone Oak Lumber, Bailor's Refined Ore Shipment, Jordan's Smithing Hammer, and a Kor Gem, and return them to Jordan Stilwell in Ironforge."
Inst1Quest6_Location = "Jordan Stilwell (Dun Morogh - Ironforge Entrance; "..YELLOW.."52,36"..WHITE..")"
Inst1Quest6_Note = "To see the note click on "..YELLOW.."[The Test of Righteousness Information]"..WHITE.."."
Inst1Quest6_Page = {2, "Only Paladins can get this quest!\n\n1. You get the  Whitestone Oak Lumber from Goblin Woodcarvers in "..YELLOW.."[Deadmines]"..WHITE.." near "..YELLOW.."[3]"..WHITE..".\n\n2. To get the Bailor's Refined Ore Shipment you must talk to Bailor Stonehand (Loch Modan - Thelsamar; "..YELLOW.."35,44"..WHITE.."). He gives you the 'Bailor's Ore Shipment' quest. You find the Jordan's Ore Shipment behind a tree at "..YELLOW.."71,21"..WHITE.."\n\n3. You get Jordan's Smithing Hammer in "..YELLOW.."[Shadowfang Keep]"..WHITE.." at "..YELLOW.."[3]"..WHITE..".\n\n4. To get a Kor Gem you have to go to Thundris Windweaver (Darkshore - Auberdine; "..YELLOW.."37,40"..WHITE..") and do the 'Seeking the Kor Gem' quest. For this quest, you must kill Blackfathom oracles or priestesses before "..YELLOW.."[Blackfathom Deeps]"..WHITE..". They drop a corrupted Kor Gem. Thundris Windweaver will clean it for you.", };
Inst1Quest6_Prequest = "The Tome of Valor -> The Test of Righteousness"
Inst1Quest6_Folgequest = "The Test of Righteousness"
Inst1Quest6PreQuest = "true"
--
Inst1Quest6name1 = "Verigan's Fist"

--Quest 7 Alliance
Inst1Quest7 = "7. The Unsent Letter"
Inst1Quest7_Level = "22"
Inst1Quest7_Attain = "16"
Inst1Quest7_Aim = "Deliver the Letter to the City Architect to Baros Alexston in Stormwind."
Inst1Quest7_Location = "An Unsent Letter (drops from Edwin VanCleef; "..YELLOW.."[6]"..WHITE..")"
Inst1Quest7_Note = "Baros Alexston is in Stormwind City, next to the Cathedral of Light at "..YELLOW.."57.7, 47.9"..WHITE.."."
Inst1Quest7_Prequest = "None"
Inst1Quest7_Folgequest = "Bazil Thredd"
-- No Rewards for this quest



--------------- INST2 - Wailing Caverns (WC) ---------------

Inst2Story = "Recently, a night elf druid named Naralex discovered a network of underground caverns within the heart of the Barrens. Dubbed the 'Wailing Caverns', these natural caves were filled with steam fissures which produced long, mournful wails as they vented. Naralex believed he could use the caverns' underground springs to restore lushness and fertility to the Barrens - but to do so would require siphoning the energies of the fabled Emerald Dream. Once connected to the Dream however, the druid's vision somehow became a nightmare. Soon the Wailing Caverns began to change - the waters turned foul and the once-docile creatures inside metamorphosed into vicious, deadly predators. It is said that Naralex himself still resides somewhere inside the heart of the labyrinth, trapped beyond the edges of the Emerald Dream. Even his former acolytes have been corrupted by their master's waking nightmare - transformed into the wicked Druids of the Fang."
Inst2Caption = "Wailing Caverns"
Inst2QAA = "5 Quests"
Inst2QAH = "7 Quests"

--Quest 1 Alliance
Inst2Quest1 = "1. Deviate Hides"
Inst2Quest1_Level = "17"
Inst2Quest1_Attain = "13"
Inst2Quest1_Aim = "Nalpak in the Wailing Caverns wants 20 Deviate Hides."
Inst2Quest1_Location = "Nalpak (Barrens - Wailing Caverns; "..YELLOW.."47,36"..WHITE..")"
Inst2Quest1_Note = "All deviate mobs inside of and right before the entrance to the instance can drop hides.\nNalpak can be found in a hidden cave above the actual cave entrance. Easiest way to him seems to be to run up the hill outside and behind the entrance and drop down the slight ledge above the cave entrance."
Inst2Quest1_Prequest = "None"
Inst2Quest1_Folgequest = "None"
--
Inst2Quest1name1 = "Slick Deviate Leggings"
Inst2Quest1name2 = "Deviate Hide Pack"

--Quest 2 Alliance
Inst2Quest2 = "2. Trouble at the Docks"
Inst2Quest2_Level = "18"
Inst2Quest2_Attain = "14"
Inst2Quest2_Aim = "Crane Operator Bigglefuzz in Ratchet wants you to retrieve the bottle of 99-Year-Old Port from Mad Magglish who is hiding in the Wailing Caverns."
Inst2Quest2_Location = "Crane Operator Bigglefuzz (Barrens - Ratchet; "..YELLOW.."63,37"..WHITE..")"
Inst2Quest2_Note = "You get the bottle right before you go into the instance by killing Mad Magglish. When you first enter the cave make an immediate right to find him at the end of the passage. He is stealthed by the wall at "..YELLOW.."[2] on the Entrance Map"..WHITE.."."
Inst2Quest2_Prequest = "None"
Inst2Quest2_Folgequest = "None"
-- No Rewards for this quest

--Quest 3 Alliance
Inst2Quest3 = "3. Smart Drinks"
Inst2Quest3_Level = "18"
Inst2Quest3_Attain = "14"
Inst2Quest3_Aim = "Bring 6 portions of Wailing Essence to Mebok Mizzyrix in Ratchet."
Inst2Quest3_Location = "Mebok Mizzyrix (Barrens - Ratchet; "..YELLOW.."62,37"..WHITE..")"
Inst2Quest3_Note = "The prequest can be obtained from Mebok Mizzyrix too.\nAll Ectoplasm enemies in and before the instance drop the Essence."
Inst2Quest3_Prequest = "Raptor Horns"
Inst2Quest3_Folgequest = "None"
Inst2Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst2Quest4 = "4. Deviate Eradication"
Inst2Quest4_Level = "21"
Inst2Quest4_Attain = "15"
Inst2Quest4_Aim = "Ebru in the Wailing Caverns wants you to kill 7 Deviate Ravagers, 7 Deviate Vipers, 7 Deviate Shamblers and 7 Deviate Dreadfangs."
Inst2Quest4_Location = "Ebru (Barrens - Wailing Caverns; "..YELLOW.."47,36"..WHITE..")"
Inst2Quest4_Note = "Ebru is in a hidden cave above the cave entrance. Easiest way to him seems to be to run up the hill outside and behind the entrance and drop down the slight ledge above the cave entrance."
Inst2Quest4_Prequest = "None"
Inst2Quest4_Folgequest = "None"
--
Inst2Quest4name1 = "Pattern: Deviate Scale Belt"
Inst2Quest4name2 = "Sizzle Stick"
Inst2Quest4name3 = "Dagmire Gauntlets"

--Quest 5 Alliance
Inst2Quest5 = "5. The Glowing Shard"
Inst2Quest5_Level = "25"
Inst2Quest5_Attain = "21"
Inst2Quest5_Aim = "Travel to Ratchet to find the meaning behind the Nightmare Shard."
Inst2Quest5_Location = "The Glowing Shard (drops from Mutanus the Devourer; "..YELLOW.."[9]"..WHITE..")"
Inst2Quest5_Note = "Mutanus the Devourer will only appear if you kill the four leader druids of the fang and escort the tauren druid at the entrance.\nWhen you have the Shard, you must bring it to the Bank at Ratchet, and then back to the top of the hill over Wailing Caverns to Falla Sagewind."
Inst2Quest5_Prequest = "None"
Inst2Quest5_Folgequest = "In Nightmares"
--
Inst2Quest5name1 = "Talbar Mantle"
Inst2Quest5name2 = "Quagmire Galoshes"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst2Quest1_HORDE = Inst2Quest1
Inst2Quest1_HORDE_Level = Inst2Quest1_Level
Inst2Quest1_HORDE_Attain = Inst2Quest1_Attain
Inst2Quest1_HORDE_Aim = Inst2Quest1_Aim
Inst2Quest1_HORDE_Location = Inst2Quest1_Location
Inst2Quest1_HORDE_Note = Inst2Quest1_Note
Inst2Quest1_HORDE_Prequest = Inst2Quest1_Prequest
Inst2Quest1_HORDE_Folgequest = Inst2Quest1_Folgequest
--
Inst2Quest1name1_HORDE = Inst2Quest1name1
Inst2Quest1name2_HORDE = Inst2Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst2Quest2_HORDE = Inst2Quest2
Inst2Quest2_HORDE_Level = Inst2Quest2_Level
Inst2Quest2_HORDE_Attain = Inst2Quest2_Attain
Inst2Quest2_HORDE_Aim = Inst2Quest2_Aim
Inst2Quest2_HORDE_Location = Inst2Quest2_Location
Inst2Quest2_HORDE_Note = Inst2Quest2_Note
Inst2Quest2_HORDE_Prequest = Inst2Quest2_Prequest
Inst2Quest2_HORDE_Folgequest = Inst2Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde
Inst2Quest3_HORDE = "3. Serpentbloom"
Inst2Quest3_HORDE_Level = "18"
Inst2Quest3_HORDE_Attain = "14"
Inst2Quest3_HORDE_Aim = "Apothecary Zamah in Thunder Bluff wants you to collect 10 Serpentbloom."
Inst2Quest3_HORDE_Location = "Apothecary Zamah (Thunder Bluff - Spirit Rise; "..YELLOW.."22,20"..WHITE..")"
Inst2Quest3_HORDE_Note = "Apothecary Zamah is in a cave under the Spirit Rise.  You get the prequest from Apothecary Helbrim (Barrens - Crossroads; "..YELLOW.."51,30"..WHITE..").\nYou get the Serpentbloom inside the cave in front of the instance and inside the instance. Players with Herbalism can see the plants on their minimap."
Inst2Quest3_HORDE_Prequest = "Fungal Spores -> Apothecary Zamah"
Inst2Quest3_HORDE_Folgequest = "None"
Inst2Quest3PreQuest_HORDE = "true"
--
Inst2Quest3name1_HORDE = "Apothecary Gloves"

--Quest 4 Horde  (same as Quest 3 Alliance)
Inst2Quest4_HORDE = "4. Smart Drinks"
Inst2Quest4_HORDE_Level = Inst2Quest3_Level
Inst2Quest4_HORDE_Attain = Inst2Quest3_Attain
Inst2Quest4_HORDE_Aim = Inst2Quest3_Aim
Inst2Quest4_HORDE_Location = Inst2Quest3_Location
Inst2Quest4_HORDE_Note = Inst2Quest3_Note
Inst2Quest4_HORDE_Prequest = Inst2Quest3_Prequest
Inst2Quest4_HORDE_Folgequest = Inst2Quest3_Folgequest
Inst2Quest4PreQuest_HORDE = Inst2Quest3PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 4 Alliance)
Inst2Quest5_HORDE = "5. Deviate Eradication"
Inst2Quest5_HORDE_Level = Inst2Quest4_Level
Inst2Quest5_HORDE_Attain = Inst2Quest4_Attain
Inst2Quest5_HORDE_Aim = Inst2Quest4_Aim
Inst2Quest5_HORDE_Location = Inst2Quest4_Location
Inst2Quest5_HORDE_Note = Inst2Quest4_Note
Inst2Quest5_HORDE_Prequest = Inst2Quest4_Prequest
Inst2Quest5_HORDE_Folgequest = Inst2Quest4_Folgequest
--
Inst2Quest5name1_HORDE = Inst2Quest4name1
Inst2Quest5name2_HORDE = Inst2Quest4name2
Inst2Quest5name3_HORDE = Inst2Quest4name3

--Quest 6 Horde
Inst2Quest6_HORDE = "6. Leaders of the Fang"
Inst2Quest6_HORDE_Level = "22"
Inst2Quest6_HORDE_Attain = "18"
Inst2Quest6_HORDE_Aim = "Bring the Gems of Cobrahn, Anacondra, Pythas and Serpentis to Nara Wildmane in Thunder Bluff."
Inst2Quest6_HORDE_Location = "Nara Wildmane (Thunder Bluff - Elder Rise; "..YELLOW.."75,31"..WHITE..")"
Inst2Quest6_HORDE_Note = "The Questline starts at Hamuul Runetotem (Thunderbluff - Elder Rise; "..YELLOW.."78,28"..WHITE..")\nThe 4 druids drop the gems "..YELLOW.."[2]"..WHITE..", "..YELLOW.."[3]"..WHITE..", "..YELLOW.."[5]"..WHITE..", "..YELLOW.."[7]"..WHITE.."."
Inst2Quest6_HORDE_Prequest = "The Barrens Oases -> Nara Wildmane"
Inst2Quest6_HORDE_Folgequest = "None"
Inst2Quest6PreQuest_HORDE = "true"
--
Inst2Quest6name1_HORDE = "Crescent Staff"
Inst2Quest6name2_HORDE = "Wingblade"

--Quest 7 Horde  (same as Quest 5 Alliance)
Inst2Quest7_HORDE = "7. The Glowing Shard"
Inst2Quest7_HORDE_Level = Inst2Quest5_Level
Inst2Quest7_HORDE_Attain = Inst2Quest5_Attain
Inst2Quest7_HORDE_Aim = Inst2Quest5_Aim
Inst2Quest7_HORDE_Location = Inst2Quest5_Location
Inst2Quest7_HORDE_Note = Inst2Quest5_Note
Inst2Quest7_HORDE_Prequest = Inst2Quest5_Prequest
Inst2Quest7_HORDE_Folgequest = Inst2Quest5_Folgequest
--
Inst2Quest7name1_HORDE = Inst2Quest5name1
Inst2Quest7name2_HORDE = Inst2Quest5name2



--------------- INST3 - Ragefire Chasm (RFC) ---------------

Inst3Story = "Ragefire Chasm consists of a network of volcanic caverns that lie below the orcs' new capital city of Orgrimmar. Recently, rumors have spread that a cult loyal to the demonic Shadow Council has taken up residence within the Chasm's fiery depths. This cult, known as the Burning Blade, threatens the very sovereignty of Durotar. Many believe that the orc Warchief, Thrall, is aware of the Blade's existence and has chosen not to destroy it in the hopes that its members might lead him straight to the Shadow Council. Either way, the dark powers emanating from Ragefire Chasm could undo all that the orcs have fought to attain."
Inst3Caption = "Ragefire Chasm"
Inst3QAA = "No Quests"
Inst3QAH = "5 Quests"

--Quest 1 Horde
Inst3Quest1_HORDE = "1. Testing an Enemy's Strength"
Inst3Quest1_HORDE_Level = "15"
Inst3Quest1_HORDE_Attain = "9"
Inst3Quest1_HORDE_Aim = "Search Orgrimmar for Ragefire Chasm, then kill 8 Ragefire Troggs and 8 Ragefire Shaman before returning to Rahauro in Thunder Bluff."
Inst3Quest1_HORDE_Location = "Rahauro (Thunder Bluff - Elder Rise; "..YELLOW.."70,29"..WHITE..")"
Inst3Quest1_HORDE_Note = "You find the troggs at the beginning."
Inst3Quest1_HORDE_Prequest = "None"
Inst3Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Horde
Inst3Quest2_HORDE = "2. The Power to Destroy..."
Inst3Quest2_HORDE_Level = "16"
Inst3Quest2_HORDE_Attain = "9"
Inst3Quest2_HORDE_Aim = "Bring the books Spells of Shadow and Incantations from the Nether to Varimathras in Undercity."
Inst3Quest2_HORDE_Location = "Varimathras (Undercity - Royal Quarter; "..YELLOW.."56,92"..WHITE..")"
Inst3Quest2_HORDE_Note = "Searing Blade Cultists and Warlocks drop the books"
Inst3Quest2_HORDE_Prequest = "None"
Inst3Quest2_HORDE_Folgequest = "None"
--
Inst3Quest2name1_HORDE = "Ghastly Trousers"
Inst3Quest2name2_HORDE = "Dredgemire Leggings"
Inst3Quest2name3_HORDE = "Gargoyle Leggings"

--Quest 3 Horde
Inst3Quest3_HORDE = "3. Searching for the Lost Satchel"
Inst3Quest3_HORDE_Level = "16"
Inst3Quest3_HORDE_Attain = "9"
Inst3Quest3_HORDE_Aim = "Search Ragefire Chasm for Maur Grimtotem's corpse and search it for any items of interest."
Inst3Quest3_HORDE_Location = "Rahauro (Thunder Bluff - Elder Rise; "..YELLOW.."70,29"..WHITE..")"
Inst3Quest3_HORDE_Note = "You find Maur Grimtotem at "..YELLOW.."[1]"..WHITE..". After getting the satchel you must bring it back to Rahauro in Thunder Bluff"
Inst3Quest3_HORDE_Prequest = "None"
Inst3Quest3_HORDE_Folgequest = "Returning the Lost Satchel"
--
Inst3Quest3name1_HORDE = "Featherbead Bracers"
Inst3Quest3name2_HORDE = "Savannah Bracers"

--Quest 4 Horde
Inst3Quest4_HORDE = "4. Hidden Enemies"
Inst3Quest4_HORDE_Level = "16"
Inst3Quest4_HORDE_Attain = "9"
Inst3Quest4_HORDE_Aim = "Kill Bazzalan and Jergosh the Invoker before returning to Thrall in Orgrimmar."
Inst3Quest4_HORDE_Location = "Thrall (Orgrimmar - Valley of Wisdom; "..YELLOW.."31,37"..WHITE..")"
Inst3Quest4_HORDE_Note = "You find Bazzalan at  "..YELLOW.."[4]"..WHITE.." and Jergosh at "..YELLOW.."[3]"..WHITE..". The questline starts at Warchief Thrall in Orgrimmar."
Inst3Quest4_HORDE_Prequest = "Hidden Enemies"
Inst3Quest4_HORDE_Folgequest = "Hidden Enemies"
Inst3Quest4PreQuest_HORDE = "true"
--
Inst3Quest4name1_HORDE = "Kris of Orgrimmar"
Inst3Quest4name2_HORDE = "Hammer of Orgrimmar"
Inst3Quest4name3_HORDE = "Axe of Orgrimmar"
Inst3Quest4name4_HORDE = "Staff of Orgrimmar"

--Quest 5 Horde
Inst3Quest5_HORDE = "5. Slaying the Beast"
Inst3Quest5_HORDE_Level = "16"
Inst3Quest5_HORDE_Attain = "9"
Inst3Quest5_HORDE_Aim = "Enter Ragefire Chasm and slay Taragaman the Hungerer, then bring his heart back to Neeru Fireblade in Orgrimmar."
Inst3Quest5_HORDE_Location = "Neeru Fireblade (Orgrimmar - Cleft of Shadow; "..YELLOW.."49,50"..WHITE..")"
Inst3Quest5_HORDE_Note = "You find Taragaman at "..YELLOW.."[2]"..WHITE.."."
Inst3Quest5_HORDE_Prequest = "None"
Inst3Quest5_HORDE_Folgequest = "None"
-- No Rewards for this quest



--------------- INST4 - Uldaman (Ulda) ---------------

Inst4Story = "Uldaman is an ancient Titan vault that has laid buried deep within the earth since the world's creation. Dwarven excavations have recently penetrated this forgotten city, releasing the Titans' first failed creations: the troggs. Legends say that the Titans created troggs from stone. When they deemed the experiment a failure, the Titans locked the troggs away and tried again - resulting in the creation of the dwarven race. The secrets of the dwarves' creation are recorded on the fabled Discs of Norgannon - massive Titan artifacts that lie at the very bottom of the ancient city. Recently, the Dark Iron dwarves have launched a series of incursions into Uldaman, hoping to claim the discs for their fiery master, Ragnaros. However, protecting the buried city are several guardians - giant constructs of living stone that crush any hapless intruders they find. The Discs themselves are guarded by a massive, sentient Stonekeeper called Archaedas. Some rumors even suggest that the dwarves' stone-skinned ancestors, the earthen, still dwell deep within the city's hidden recesses."
Inst4Caption = "Uldaman"
Inst4QAA = "17 Quests"
Inst4QAH = "11 Quests"

--Quest 1 Alliance
Inst4Quest1 = "1. A Sign of Hope"
Inst4Quest1_Level = "35"
Inst4Quest1_Attain = "35"
Inst4Quest1_Aim = "Find Hammertoe Grez in Uldaman."
Inst4Quest1_Location = "Prospector Ryedol (Badlands; "..YELLOW.."53,43"..WHITE..")"
Inst4Quest1_Note = "The Prequest starts at the Crumpled Map (Badlands; "..YELLOW.."53,33"..WHITE..").\nYou find Hammertoe Grez before you enter the instance, at "..YELLOW.."[1]"..WHITE.." on the Entrance map."
Inst4Quest1_Prequest = "A Sign of Hope"
Inst4Quest1_Folgequest = "Amulet of Secrets"
Inst4Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst4Quest2 = "2. Amulet of Secrets"
Inst4Quest2_Level = "40"
Inst4Quest2_Attain = "35"
Inst4Quest2_Aim = "Find Hammertoe's Amulet and return it to him in Uldaman."
Inst4Quest2_Location = "Hammertoe Grez (Uldaman; "..YELLOW.."[1] on Entrance Map"..WHITE..")."
Inst4Quest2_Note = "The Amulet drops from Magregan Deepshadow at "..YELLOW.."[2] on the Entrance Map"..WHITE.."."
Inst4Quest2_Prequest = "A Sign of Hope"
Inst4Quest2_Folgequest = "Prospect of Faith"
Inst4Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst4Quest3 = "3. The Lost Tablets of Will"
Inst4Quest3_Level = "45"
Inst4Quest3_Attain = "35"
Inst4Quest3_Aim = "Find the Tablet of Will, and return them to Advisor Belgrum in Ironforge."
Inst4Quest3_Location = "Advisor Belgrum (Ironforge - Hall of Explorers; "..YELLOW.."77,10"..WHITE..")"
Inst4Quest3_Note = "The tablet is at "..YELLOW.."[8]"..WHITE.."."
Inst4Quest3_Prequest = "Amulet of Secrets -> An Ambassador of Evil"
Inst4Quest3_Folgequest = "None"
Inst4Quest3FQuest = "true"
--
Inst4Quest3name1 = "Medal of Courage"

--Quest 4 Alliance
Inst4Quest4 = "4. Power Stones"
Inst4Quest4_Level = "36"
Inst4Quest4_Attain = "30"
Inst4Quest4_Aim = "Bring 8 Dentrium Power Stones and 8 An'Alleum Power Stones to Rigglefuzz in the Badlands."
Inst4Quest4_Location = "Rigglefuzz (Badlands; "..YELLOW.."42,52"..WHITE..")"
Inst4Quest4_Note = "The stones can be found on any Shadowforge enemies before and in the instance."
Inst4Quest4_Prequest = "None"
Inst4Quest4_Folgequest = "None"
--
Inst4Quest4name1 = "Energized Stone Circle"
Inst4Quest4name2 = "Duracin Bracers"
Inst4Quest4name3 = "Everlast Boots"

--Quest 5 Alliance
Inst4Quest5 = "5. Agmond's Fate"
Inst4Quest5_Level = "38"
Inst4Quest5_Attain = "30"
Inst4Quest5_Aim = "Bring 4 Carved Stone Urns to Prospector Ironband in Loch Modan."
Inst4Quest5_Location = "Prospector Ironband (Loch Modan - Ironband's Excavation Site; "..YELLOW.."65,65"..WHITE..")"
Inst4Quest5_Note = "The Prequest starts at Prospector Stormpike (Ironforge - Hall of Explorers; "..YELLOW.."74,12"..WHITE..").\nThe Urns are scattered throughout the caves before the instance."
Inst4Quest5_Prequest = "Ironband Wants You! -> Murdaloc"
Inst4Quest5_Folgequest = "None"
Inst4Quest5PreQuest = "true"
--
Inst4Quest5name1 = "Prospector Gloves"

--Quest 6 Alliance
Inst4Quest6 = "6. Solution to Doom"
Inst4Quest6_Level = "40"
Inst4Quest6_Attain = "30"
Inst4Quest6_Aim = "Bring the Tablet of Ryun'eh to Theldurin the Lost."
Inst4Quest6_Location = "Theldurin the Lost (Badlands; "..YELLOW.."51,76"..WHITE..")"
Inst4Quest6_Note = "The tablet is north of the caves, at the east end of a tunnel, before the instance. On the Entrance map, it's at "..YELLOW.."[3]"..WHITE.."."
Inst4Quest6_Prequest = "None"
Inst4Quest6_Folgequest = "To Ironforge for Yagyin's Digest"
--
Inst4Quest6name1 = "Doomsayer's Robe"

--Quest 7 Alliance
Inst4Quest7 = "7. The Lost Dwarves"
Inst4Quest7_Level = "40"
Inst4Quest7_Attain = "35"
Inst4Quest7_Aim = "Find Baelog in Uldaman."
Inst4Quest7_Location = "Prospector Stormpike (Ironforge - Hall of Explorers; "..YELLOW.."75,12"..WHITE..")"
Inst4Quest7_Note = "Baelog is at "..YELLOW.."[1]"..WHITE.."."
Inst4Quest7_Prequest = "None"
Inst4Quest7_Folgequest = "The Hidden Chamber"
-- No Rewards for this quest

--Quest 8 Alliance
Inst4Quest8 = "8. The Hidden Chamber"
Inst4Quest8_Level = "40"
Inst4Quest8_Attain = "35"
Inst4Quest8_Aim = "Read Baelog's Journal, explore the hidden chamber, then report to Prospector Stormpike."
Inst4Quest8_Location = "Baelog (Uldaman; "..YELLOW.."[1]"..WHITE..")"
Inst4Quest8_Note = "The Hidden Chamber is at "..YELLOW.."[4]"..WHITE..". To open the Hidden Chamber you need The Shaft of Tsol from Revelosh "..YELLOW.."[3]"..WHITE.." and the Gni'kiv Medallion from Baelog's Chest "..YELLOW.."[1]"..WHITE..". Combine these two items to form Staff of Prehistoria. The Staff is used in the Map Room between "..YELLOW.."[3] and [4]"..WHITE.." to summon Ironaya. After killing her, run inside the room she came from to get quest credit."
Inst4Quest8_Prequest = "The Lost Dwarves"
Inst4Quest8_Folgequest = "None"
Inst4Quest8FQuest = "true"
--
Inst4Quest8name1 = "Dwarven Charge"
Inst4Quest8name2 = "Explorer's League Lodestar"

--Quest 9 Alliance
Inst4Quest9 = "9. The Shattered Necklace"
Inst4Quest9_Level = "41"
Inst4Quest9_Attain = "37"
Inst4Quest9_Aim = "Search for the original creator of the shattered necklace to learn of its potential value."
Inst4Quest9_Location = "Shattered Necklace (random drop from Uldaman)"
Inst4Quest9_Note = "Bring the necklace to Talvash del Kissel (Ironforge - The Mystic Ward; "..YELLOW.."36,3"..WHITE..")."
Inst4Quest9_Prequest = "None"
Inst4Quest9_Folgequest = "Lore for a Price"
-- No Rewards for this quest

--Quest 10 Alliance
Inst4Quest10 = "10. Back to Uldaman"
Inst4Quest10_Level = "42"
Inst4Quest10_Attain = "37"
Inst4Quest10_Aim = "Search for clues as to the current disposition of Talvash's necklace within Uldaman. The slain paladin he mentioned was the person who has it last."
Inst4Quest10_Location = "Talvash del Kissel (Ironforge - The Mystic Ward; "..YELLOW.."36,3"..WHITE..")"
Inst4Quest10_Note = "The Paladin is at "..YELLOW.."[2]"..WHITE.."."
Inst4Quest10_Prequest = "Lore for a Price"
Inst4Quest10_Folgequest = "Find the Gems"
Inst4Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst4Quest11 = "11. Find the Gems"
Inst4Quest11_Level = "43"
Inst4Quest11_Attain = "37"
Inst4Quest11_Aim = "Find the ruby, sapphire, and topaz that are scattered throughout Uldaman. Once acquired, contact Talvash del Kissel remotely by using the Phial of Scrying he previously gave you."
Inst4Quest11_Location = "Remains of a Paladin (Uldaman; "..YELLOW.."[2]"..WHITE..")"
Inst4Quest11_Note = "The gems are at "..YELLOW.."[1]"..WHITE.." in a Conspicous Urn, "..YELLOW.."[8]"..WHITE.." from the Shadowforge Cache, and "..YELLOW.."[9]"..WHITE.." off Grimlok. Note that when openning the Shadowforge Cache, a few mobs will spawn an aggro you.\nUse Talvash's Scrying Bowl to turn the quest in and get the followup."
Inst4Quest11_Prequest = "Back to Uldaman"
Inst4Quest11_Folgequest = "Restoring the Necklace"
Inst4Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst4Quest12 = "12. Restoring the Necklace"
Inst4Quest12_Level = "44"
Inst4Quest12_Attain = "37"
Inst4Quest12_Aim = "Obtain a power source from the most powerful construct you can find in Uldaman, and deliver it to Talvash del Kissel in Ironforge."
Inst4Quest12_Location = "Talvash's Scrying Bowl"
Inst4Quest12_Note = "The Shattered Necklace Power Source drops from Archaedas "..YELLOW.."[10]"..WHITE.."."
Inst4Quest12_Prequest = "Find the Gems."
Inst4Quest12_Folgequest = "None"
--
Inst4Quest12name1 = "Talvash's Enhancing Necklace"
Inst4Quest12FQuest = "true"

--Quest 13 Alliance
Inst4Quest13 = "13. Uldaman Reagent Run"
Inst4Quest13_Level = "42"
Inst4Quest13_Attain = "38"
Inst4Quest13_Aim = "Bring 12 Magenta Fungus Caps to Ghak Healtouch in Thelsamar."
Inst4Quest13_Location = "Ghak Healtouch (Loch Modan - Thelsamar; "..YELLOW.."37,49"..WHITE..")"
Inst4Quest13_Note = "The caps are scattered throughout the instance. Herbalists can see them on their minimap if Track Herbs is on and they have the quest. The prequest is obtained from the same NPC."
Inst4Quest13_Prequest = "Badlands Reagent Run"
Inst4Quest13_Folgequest = "None"
Inst4Quest13PreQuest = "true"
--
Inst4Quest13name1 = "Restorative Potion"

--Quest 14 Alliance
Inst4Quest14 = "14. Reclaimed Treasures"
Inst4Quest14_Level = "43"
Inst4Quest14_Attain = "33"
Inst4Quest14_Aim = "Get Krom Stoutarm's treasured possession from his chest in the North Common Hall of Uldaman, and bring it to him in Ironforge."
Inst4Quest14_Location = "Krom Stoutarm (Ironforge - Hall of Explorers; "..YELLOW.."74,9"..WHITE..")"
Inst4Quest14_Note = "You find the treasure before you enter the instance. It is in the north of the caves, at the southeast end of the first tunnel. On the entrance map, it's at "..YELLOW.."[4]"..WHITE.."."
Inst4Quest14_Prequest = "None"
Inst4Quest14_Folgequest = "None"
-- No Rewards for this quest

--Quest 15 Alliance
Inst4Quest15 = "15. The Platinum Discs"
Inst4Quest15_Level = "47"
Inst4Quest15_Attain = "40"
Inst4Quest15_Aim = "Speak with stone watcher and learn what ancient lore it keeps. Once you have learned what lore it has to offer, activate the Discs of Norgannon. -> Take the miniature version of the Discs of Norgannon to the Explorers' League in Ironforge."
Inst4Quest15_Location = "The Discs of Norgannon (Uldaman; "..YELLOW.."[11]"..WHITE..")"
Inst4Quest15_Note = "After you receive the quest, speak to the stone watcher to the left of the discs.  Then use the platinum discs again to recieve miniature discs, which you'll have to take to High Explorer Magellas in Ironforge - Hall of Explorers ("..YELLOW.."69,18"..WHITE.."). The followup starts another NPC who is nearby."
Inst4Quest15_Prequest = "None"
Inst4Quest15_Folgequest = "Portents of Uldum"
--
Inst4Quest15name1 = "Thawpelt Sack"
Inst4Quest15name2 = "Superior Healing Potion"
Inst4Quest15name3 = "Greater Mana Potion"

--Quest 16 Alliance
Inst4Quest16 = "16. Power in Uldaman (Mage)"
Inst4Quest16_Level = "40"
Inst4Quest16_Attain = "35"
Inst4Quest16_Aim = "Retrieve an Obsidian Power Source and bring it to Tabetha in Dustwallow Marsh."
Inst4Quest16_Location = "Tabetha (Dustwallow Marsh; "..YELLOW.."46,57"..WHITE..")"
Inst4Quest16_Note = "This quest is only available to Mages!\nThe Obsidian Power Source drops from the Obsidian Sentinel at "..YELLOW.."[5]"..WHITE.."."
Inst4Quest16_Prequest = "The Exorcism"
Inst4Quest16_Folgequest = "Mana Surges"
Inst4Quest16PreQuest = "true"
-- No Rewards for this quest

--Quest 17 Alliance
Inst4Quest17 = "17. Indurium Ore"
Inst4Quest17_Level = "42"
Inst4Quest17_Attain = "29"
Inst4Quest17_Aim = "Bring 4 Indurium Ore to Pozzik in Thousand Needles."
Inst4Quest17_Location = "Pozzik (Thousand Needles - Mirage Raceway; "..YELLOW.."80.1, 75.9"..WHITE..")"
Inst4Quest17_Note = "This is a repeatable quest after the prequests are complete. It gives no reputation or experience, just a small amount of money. Indurium Ore can be mined inside Uldaman or purchased from other players."
Inst4Quest17_Prequest = "Keeping Pace -> Rizzle's Schematics"
Inst4Quest17_Folgequest = "None"
Inst4Quest17PreQuest = "true"
-- No Rewards for this quest



--Quest 1 Horde  (same as Quest 4 Alliance)
Inst4Quest1_HORDE = "1. Power Stones"
Inst4Quest1_HORDE_Level = Inst4Quest4_Level
Inst4Quest1_HORDE_Attain = Inst4Quest4_Attain
Inst4Quest1_HORDE_Aim = Inst4Quest4_Aim
Inst4Quest1_HORDE_Location = Inst4Quest4_Location
Inst4Quest1_HORDE_Note = Inst4Quest4_Note
Inst4Quest1_HORDE_Prequest = Inst4Quest4_Prequest
Inst4Quest1_HORDE_Folgequest = Inst4Quest4_Folgequest
--
Inst4Quest1name1_HORDE = Inst4Quest4name1
Inst4Quest1name2_HORDE = Inst4Quest4name2
Inst4Quest1name3_HORDE = Inst4Quest4name3

--Quest 2 Horde  (same as Quest 6 Alliance - different followup)
Inst4Quest2_HORDE = "2. Solution to Doom"
Inst4Quest2_HORDE_Level = Inst4Quest6_Level
Inst4Quest2_HORDE_Attain = Inst4Quest6_Attain
Inst4Quest2_HORDE_Aim = Inst4Quest6_Aim
Inst4Quest2_HORDE_Location = Inst4Quest6_Location
Inst4Quest2_HORDE_Note = Inst4Quest6_Note
Inst4Quest2_HORDE_Prequest = Inst4Quest6_Prequest
Inst4Quest2_HORDE_Folgequest = "To the Undercity for Yagyin's Digest"
--
Inst4Quest2name1_HORDE = Inst4Quest6name1

--Quest 3 Horde
Inst4Quest3_HORDE = "3. Necklace Recovery"
Inst4Quest3_HORDE_Level = "41"
Inst4Quest3_HORDE_Attain = "37"
Inst4Quest3_HORDE_Aim = "Look for a valuable necklace within the Uldaman dig site and bring it back to Dran Droffers in Orgrimmar. The necklace may be damaged."
Inst4Quest3_HORDE_Location = "Dran Droffers (Orgrimmar - The Drag; "..YELLOW.."59,36"..WHITE..")"
Inst4Quest3_HORDE_Note = "The necklace is a random drop in the instance."
Inst4Quest3_HORDE_Prequest = "None"
Inst4Quest3_HORDE_Folgequest = "Necklace Recovery, Take 2"
-- No Rewards for this quest

--Quest 4 Horde
Inst4Quest4_HORDE = "4. Necklace Recovery, Take 2"
Inst4Quest4_HORDE_Level = "41"
Inst4Quest4_HORDE_Attain = "37"
Inst4Quest4_HORDE_Aim = "Find a clue as to the gems' whereabouts in the depths of Uldaman."
Inst4Quest4_HORDE_Location = "Dran Droffers (Orgrimmar - The Drag; "..YELLOW.."59,36"..WHITE..")"
Inst4Quest4_HORDE_Note = "The Paladin is at "..YELLOW.."[2]"..WHITE.."."
Inst4Quest4_HORDE_Prequest = "Necklace Recovery"
Inst4Quest4_HORDE_Folgequest = "Translating the Journal"
Inst4Quest4FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 5 Horde
Inst4Quest5_HORDE = "5. Translating the Journal"
Inst4Quest5_HORDE_Level = "42"
Inst4Quest5_HORDE_Attain = "37"
Inst4Quest5_HORDE_Aim = "Find someone who can translate the paladin's journal. The closest location that might have someone is Kargath, in the Badlands."
Inst4Quest5_HORDE_Location = "Remains of a Paladin (Uldaman; "..YELLOW.."[2]"..WHITE..")"
Inst4Quest5_HORDE_Note = "The translator Jarkal Mossmeld is in Kargath (Badlands; "..YELLOW.."2,46"..WHITE..")."
Inst4Quest5_HORDE_Prequest = "Necklace Recovery, Take 2"
Inst4Quest5_HORDE_Folgequest = "Find the Gems and Power Source"
Inst4Quest5FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 6 Horde
Inst4Quest6_HORDE = "6. Find the Gems and Power Source"
Inst4Quest6_HORDE_Level = "44"
Inst4Quest6_HORDE_Attain = "37"
Inst4Quest6_HORDE_Aim = "Recover all three gems and a power source for the necklace from Uldaman, and then bring them to Jarkal Mossmeld in Kargath. Jarkal believes a power source might be found on the strongest construct present in Uldaman."
Inst4Quest6_HORDE_Location = "Jarkal Mossmeld (Badlands - Kargath; "..YELLOW.."2,46"..WHITE..")"
Inst4Quest6_HORDE_Note = "The gems are at "..YELLOW.."[1]"..WHITE.." in a Conspicous Urn, "..YELLOW.."[8]"..WHITE.." from the Shadowforge Cache, and "..YELLOW.."[9]"..WHITE.." off Grimlok. Note that when openning the Shadowforge Cache, a few mobs will spawn an aggro you. The Shattered Necklace Power Source drops from Archaedas "..YELLOW.."[10]"..WHITE.."."
Inst4Quest6_HORDE_Prequest = "Translating the Journal"
Inst4Quest6_HORDE_Folgequest = "Deliver the Gems"
Inst4Quest6FQuest_HORDE = "true"
--
Inst4Quest6name1_HORDE = "Jarkal's Enhancing Necklace"

--Quest 7 Horde
Inst4Quest7_HORDE = "7. Uldaman Reagent Run"
Inst4Quest7_HORDE_Level = "42"
Inst4Quest7_HORDE_Attain = "36"
Inst4Quest7_HORDE_Aim = "Bring 12 Magenta Fungus Caps to Jarkal Mossmeld in Kargath."
Inst4Quest7_HORDE_Location = "Jarkal Mossmeld (Badlands - Kargath; "..YELLOW.."2,69"..WHITE..")"
Inst4Quest7_HORDE_Note = "You get the Prequest from Jarkal Mossmeld, too.\nThe caps are scattered throughout the instance. Herbalists can see them on their minimap if Track Herbs is on and they have the quest. The prequest is obtained from the same NPC."
Inst4Quest7_HORDE_Prequest = "Badlands Reagent Run"
Inst4Quest7_HORDE_Folgequest = "Badlands Reagent Run II"
Inst4Quest7PreQuest_HORDE = "true"
--
Inst4Quest7name1_HORDE = "Restorative Potion"

--Quest 8 Horde
Inst4Quest8_HORDE = "8. Reclaimed Treasures"
Inst4Quest8_HORDE_Level = "43"
Inst4Quest8_HORDE_Attain = "33"
Inst4Quest8_HORDE_Aim = "Get Patrick Garrett's family treasure from their family chest in the South Common Hall of Uldaman, and bring it to him in the Undercity."
Inst4Quest8_HORDE_Location = "Patrick Garrett (Undercity; "..YELLOW.."72,48"..WHITE..")"
Inst4Quest8_HORDE_Note = "You find the treasure before you enter the instance. It is at the end of the south tunnel. On the entrance map, it's at "..YELLOW.."[5]"..WHITE.."."
Inst4Quest8_HORDE_Prequest = "None"
Inst4Quest8_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 9 Horde
Inst4Quest9_HORDE = "9. The Platinum Discs"
Inst4Quest9_HORDE_Level = "47"
Inst4Quest9_HORDE_Attain = "40"
Inst4Quest9_HORDE_Aim = "Speak with stone watcher and learn what ancient lore it keeps. Once you have learned what lore it has to offer, activate the Discs of Norgannon. -> Take the miniature version of the Discs of Norgannon to the one of the sages in Thunder Bluff."
Inst4Quest9_HORDE_Location = "The Discs of Norgannon (Uldaman; "..YELLOW.."[11]"..WHITE..")"
Inst4Quest9_HORDE_Note = "After you receive the quest, speak to the stone watcher to the left of the discs.  Then use the platinum discs again to recieve miniature discs, which you'll have to take to Sage Truthseeker in Thunder Bluff ("..YELLOW.."34,46"..WHITE.."). The followup starts another NPC who is nearby."
Inst4Quest9_HORDE_Prequest = "None"
Inst4Quest9_HORDE_Folgequest = "Portents of Uldum"
--
Inst4Quest9name1_HORDE = "Thawpelt Sack"
Inst4Quest9name2_HORDE = "Superior Healing Potion"
Inst4Quest9name3_HORDE = "Greater Mana Potion"

--Quest 10 Horde  (same as Quest 4 Alliance)
Inst4Quest10_HORDE = "10. Power in Uldaman (Mage)"
Inst4Quest10_HORDE_Level = Inst4Quest16_Level
Inst4Quest10_HORDE_Attain = Inst4Quest16_Attain
Inst4Quest10_HORDE_Aim = Inst4Quest16_Aim
Inst4Quest10_HORDE_Location = Inst4Quest16_Location
Inst4Quest10_HORDE_Note = Inst4Quest16_Note
Inst4Quest10_HORDE_Prequest = Inst4Quest16_Prequest
Inst4Quest10_HORDE_Folgequest = Inst4Quest16_Folgequest
Inst4Quest10PreQuest_HORDE = Inst4Quest16PreQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 17 Alliance)
Inst4Quest11_HORDE = "11. Indurium Ore"
Inst4Quest11_HORDE_Level = Inst4Quest17_Level
Inst4Quest11_HORDE_Attain = Inst4Quest17_Attain
Inst4Quest11_HORDE_Aim = Inst4Quest17_Aim
Inst4Quest11_HORDE_Location = Inst4Quest17_Location
Inst4Quest11_HORDE_Note = Inst4Quest17_Note
Inst4Quest11_HORDE_Prequest = Inst4Quest17_Prequest
Inst4Quest11_HORDE_Folgequest = Inst4Quest17_Folgequest
Inst4Quest11PreQuest_HORDE = Inst4Quest17PreQuest
-- No Rewards for this quest



--------------- INST5 - Blackrock Depths (BRD) ---------------

Inst5Story = "Once the capital city of the Dark Iron dwarves, this volcanic labyrinth now serves as the seat of power for Ragnaros the Firelord. Ragnaros has uncovered the secret to creating life from stone and plans to build an army of unstoppable golems to aid him in conquering the whole of Blackrock Mountain. Obsessed with defeating Nefarian and his draconic minions, Ragnaros will go to any extreme to achieve final victory."
Inst5Caption = "Blackrock Depths"
Inst5QAA = "15 Quests"
Inst5QAH = "19 Quests"

--Quest 1 Alliance
Inst5Quest1 = "1. Dark Iron Legacy"
Inst5Quest1_Level = "52"
Inst5Quest1_Attain = "48"
Inst5Quest1_Aim = "Slay Fineous Darkvire and recover the great hammer, Ironfel. Take Ironfel to the Shrine of Thaurissan and place it on the statue of Franclorn Forgewright."
Inst5Quest1_Location = "Franclorn Forgewright (Blackrock Mountain; "..YELLOW.."[3] on Entrance map"..WHITE..")"
Inst5Quest1_Note = "Franclorn Forgewright is in the middle of the floating island in Blackrock Mountain, outside the instance near the Summoning Stone. You have to be dead to see him. He also gives you the prequest which just requires you listen to his story.\nFineous Darkvire is at "..YELLOW.."[9]"..WHITE..". The Shrine next to the arena at "..YELLOW.."[7]"..WHITE.."."
Inst5Quest1_Prequest = "Dark Iron Legacy"
Inst5Quest1_Folgequest = "None"
--
Inst5Quest1name1 = "Shadowforge Key"

--Quest 2 Alliance
Inst5Quest2 = "2. Ribbly Screwspigot"
Inst5Quest2_Level = "53"
Inst5Quest2_Attain = "48"
Inst5Quest2_Aim = "Bring Ribbly's Head to Yuka Screwspigot in the Burning Steppes."
Inst5Quest2_Location = "Yuka Screwspigot (Burning Steppes - Flame Crest; "..YELLOW.."65,22"..WHITE..")"
Inst5Quest2_Note = "You get the prequest from Yorba Screwspigot (Tanaris - Steamwheedle Port; "..YELLOW.."67,23"..WHITE..").\nRibbly is at "..YELLOW.."[15]"..WHITE.."."
Inst5Quest2_Prequest = "Yuka Screwspigot"
Inst5Quest2_Folgequest = "None"
Inst5Quest2PreQuest = "true"
--
Inst5Quest2name1 = "Rancor Boots"
Inst5Quest2name2 = "Penance Spaulders"
Inst5Quest2name3 = "Splintsteel Armor"

--Quest 3 Alliance
Inst5Quest3 = "3. The Love Potion"
Inst5Quest3_Level = "54"
Inst5Quest3_Attain = "50"
Inst5Quest3_Aim = "Bring 4 Gromsblood, 10 Giant Silver Veins and Nagmara's Filled Vial to Mistress Nagmara in Blackrock Depths."
Inst5Quest3_Location = "Mistress Nagmara (Blackrock Depths; "..YELLOW.."[15]"..WHITE..")"
Inst5Quest3_Note = "You get the Giant Silver Veins from Giants in Azshara. Gromsblood can be most easily acquired from either an herbalist or at the Auction House. Lastly, the vial can be filled at the Go-Lakka crater (Un'Goro Crater; "..YELLOW.."31,50"..WHITE..").\nAfter completing the quest, you can use the backdoor instead of killing Phalanx."
Inst5Quest3_Prequest = "None"
Inst5Quest3_Folgequest = "None"
--
Inst5Quest3name1 = "Manacle Cuffs"
Inst5Quest3name2 = "Nagmara's Whipping Belt"

--Quest 4 Alliance
Inst5Quest4 = "4. Hurley Blackbreath"
Inst5Quest4_Level = "55"
Inst5Quest4_Attain = "50"
Inst5Quest4_Aim = "Bring the Lost Thunderbrew Recipe to Ragnar Thunderbrew in Kharanos."
Inst5Quest4_Location = "Ragnar Thunderbrew  (Dun Morogh - Kharanos; "..YELLOW.."46,52"..WHITE..")"
Inst5Quest4_Note = "You get the prequest from Enohar Thunderbrew (Blasted Lands - Nethergarde Keep; "..YELLOW.."61,18"..WHITE..").\nYou get the recipe from one of the guards who appear if you destroy the ale "..YELLOW.."[15]"..WHITE.."."
Inst5Quest4_Prequest = "Ragnar Thunderbrew"
Inst5Quest4_Folgequest = "None"
Inst5Quest4PreQuest = "true"
--
Inst5Quest4name1 = "Dark Dwarven Lager"
Inst5Quest4name2 = "Swiftstrike Cudgel"
Inst5Quest4name3 = "Limb Cleaver"

--Quest 5 Alliance  
Inst5Quest5 = "5. Overmaster Pyron"
Inst5Quest5_Level = "52"
Inst5Quest5_Attain = "48"
Inst5Quest5_Aim = "Slay Overmaster Pyron and return to Jalinda Sprig."
Inst5Quest5_Location = "Jalinda Sprig (Burning Steppes - Morgan's Vigil; "..YELLOW.."85,69"..WHITE..")"
Inst5Quest5_Note = "Overmaster Pyron is a fire elemental outside the instance. He's at "..YELLOW.."[24]"..WHITE.." on the Blackrock Depths map and at "..YELLOW.."[1]"..WHITE.." on the Blackrock Mountain entrance map."
Inst5Quest5_Prequest = "None"
Inst5Quest5_Folgequest = "Incendius!"
-- No Rewards for this quest

--Quest 6 Alliance
Inst5Quest6 = "6. Incendius!"
Inst5Quest6_Level = "56"
Inst5Quest6_Attain = "48"
Inst5Quest6_Aim = "Find Lord Incendius in Blackrock Depths and destroy him!"
Inst5Quest6_Location = "Jalinda Sprig (Burning Steppes - Morgan's Vigil; "..YELLOW.."85,69"..WHITE..")"
Inst5Quest6_Note = "You get the prequest from Jalinda Sprig, too. You find Lord Incendius at "..YELLOW.."[10]"..WHITE.."."
Inst5Quest6_Prequest = "Overmaster Pyron"
Inst5Quest6_Folgequest = "None"
Inst5Quest6FQuest = "true"
--
Inst5Quest6name1 = "Sunborne Cape"
Inst5Quest6name2 = "Nightfall Gloves"
Inst5Quest6name3 = "Crypt Demon Bracers"
Inst5Quest6name4 = "Stalwart Clutch"

--Quest 7 Alliance
Inst5Quest7 = "7. The Heart of the Mountain"
Inst5Quest7_Level = "55"
Inst5Quest7_Attain = "50"
Inst5Quest7_Aim = "Bring the Heart of the Mountain to Maxwort Uberglint in the Burning Steppes."
Inst5Quest7_Location = "Maxwort Uberglint (Burning Steppes - Flame Crest; "..YELLOW.."65,23"..WHITE..")"
Inst5Quest7_Note = "You find the Heart at "..YELLOW.."[8]"..WHITE.." in a safe. You get the key for the safe from Warder Stillgiss. He appears after opening all small safes."
Inst5Quest7_Prequest = "None"
Inst5Quest7_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Alliance
Inst5Quest8 = "8. The Good Stuff"
Inst5Quest8_Level = "56"
Inst5Quest8_Attain = "50"
Inst5Quest8_Aim = "Travel to Blackrock Depths and recover 20 Dark Iron Fanny Packs. Return to Oralius when you have completed this task. You assume that the Dark Iron dwarves inside Blackrock Depths carry these 'fanny pack' contraptions."
Inst5Quest8_Location = "Oralius (Burning Steppes - Morgan's Vigil; "..YELLOW.."84,68"..WHITE..")"
Inst5Quest8_Note = "All dwarves can drop the packs."
Inst5Quest8_Prequest = "None"
Inst5Quest8_Folgequest = "None"
--
Inst5Quest8name1 = "A Dingy Fanny Pack"

--Quest 9 Alliance
Inst5Quest9 = "9. A Taste of Flame"
Inst5Quest9_Level = "58"
Inst5Quest9_Attain = "52"
Inst5Quest9_Aim = "Travel to Blackrock Depths and slay Bael'Gar. "..YELLOW.."[...]"..WHITE.." Return the Encased Fiery Essence to Cyrus Therepentous."
Inst5Quest9_Location = "Cyrus Therepentous (Burning Steppes; "..YELLOW.."95,31"..WHITE..")"
Inst5Quest9_Note = "The questline starts at Kalaran Windblade (Searing Gorge; "..YELLOW.."39,38"..WHITE..").\nBael'Gar is at "..YELLOW.."[11]"..WHITE.."."
Inst5Quest9_Prequest = "The Flawless Flame -> A Taste of Flame"
Inst5Quest9_Folgequest = "None"
Inst5Quest9PreQuest = "true"
--
Inst5Quest9name1 = "Shaleskin Cape"
Inst5Quest9name2 = "Wyrmhide Spaulders"
Inst5Quest9name3 = "Valconian Sash"

--Quest 10 Alliance
Inst5Quest10 = "10. Kharan Mighthammer"
Inst5Quest10_Level = "59"
Inst5Quest10_Attain = "50"
Inst5Quest10_Aim = "Travel to Blackrock Depths and find Kharan Mighthammer.\nThe King mentioned that Kharan was being held prisoner there - perhaps you should try looking for a prison."
Inst5Quest10_Location = "King Magni Bronzebeard (Ironforge; "..YELLOW.."39,55"..WHITE..")"
Inst5Quest10_Note = "The prequest starts at Royal Historian Archesonus (Ironforge; "..YELLOW.."38,55"..WHITE.."). Kharan Mighthammer is at "..YELLOW.."[2]"..WHITE.."."
Inst5Quest10_Prequest = "The Smoldering Ruins of Thaurissan"
Inst5Quest10_Folgequest = "The Bearer of Bad News"
Inst5Quest10PreQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst5Quest11 = "11. The Fate of the Kingdom"
Inst5Quest11_Level = "59"
Inst5Quest11_Attain = "51"
Inst5Quest11_Aim = "Return to Blackrock Depths and rescue Princess Moira Bronzebeard from the evil clutches of Emperor Dagran Thaurissan."
Inst5Quest11_Location = "King Magni Bronzebeard (Ironforge; "..YELLOW.."39,55"..WHITE..")"
Inst5Quest11_Note = "Princess Moira Bronzebeard is at "..YELLOW.."[21]"..WHITE..". During the fight she might heal Dagran. Try to interrupt her as often as possible, but hurry as she must not die or you can't complete the quest! After talking to her you have to return to Magni Bronzebeard."
Inst5Quest11_Prequest = "The Bearer of Bad News"
Inst5Quest11_Folgequest = "The Princess's Surprise"
Inst5Quest11FQuest = "true"
--
Inst5Quest11name1 = "Magni's Will"
Inst5Quest11name2 = "Songstone of Ironforge"

--Quest 12 Alliance
Inst5Quest12 = "12. Attunement to the Core"
Inst5Quest12_Level = "60"
Inst5Quest12_Attain = "55"
Inst5Quest12_Aim = "Venture to the Molten Core entry portal in Blackrock Depths and recover a Core Fragment. Return to Lothos Riftwaker in Blackrock Mountain when you have recovered the Core Fragment."
Inst5Quest12_Location = "Lothos Riftwaker (Blackrock Mountain; "..YELLOW.."[2] on Entrance Map"..WHITE..")"
Inst5Quest12_Note = "After comleting this quest, you can use the stone next to Lothos Riftwaker to enter the Molten Core.\nYou find the Core Fragment near "..YELLOW.."[23]"..WHITE..", very close to the Molten Core portal."
Inst5Quest12_Prequest = "None"
Inst5Quest12_Folgequest = "None"
-- No Rewards for this quest

--Quest 13 Alliance
Inst5Quest13 = "13. The Challenge"
Inst5Quest13_Level = "60"
Inst5Quest13_Attain = "60"
Inst5Quest13_Aim = "Travel to the Ring of the Law in Blackrock Depths and place the Banner of Provocation in its center as you are sentenced by High Justice Grimstone. Slay Theldren and his gladiators and return to Anthion Harmon in the Eastern Plaguelands with the first piece of Lord Valthalak's amulet."
Inst5Quest13_Location = "Falrin Treeshaper (Dire Maul West; "..YELLOW.."[1] Library"..WHITE..")"
Inst5Quest13_Note = "Followup quest is different for each class."
Inst5Quest13_Prequest = "None"
Inst5Quest13_Folgequest = "Varies for each class"
-- No Rewards for this quest

--Quest 14 Alliance
Inst5Quest14 = "14. The Spectral Chalice"
Inst5Quest14_Level = "55"
Inst5Quest14_Attain = "55"
Inst5Quest14_Aim = "Place the materials Gloom'Rel wants in the The Spectral Chalice."
Inst5Quest14_Location = "Gloom'Rel (Blackrock Depths; "..YELLOW.."[18]"..WHITE..")"
Inst5Quest14_Note = "Only Miners with skill 230 or higher can get this quest to learn Smelt Dark Iron. Materials for the Chalice: 2 [Star Ruby], 20 [Gold Bar], 10 [Truesilver Bar]. Afterwards, if you have [Dark Iron Ore] you can take it to The Black Forge at "..YELLOW.."[22]"..WHITE.." and Smelt it."
Inst5Quest14_Prequest = "None"
Inst5Quest14_Folgequest = "None"
-- No Rewards for this quest

--Quest 15 Alliance
Inst5Quest15 = "15. Direbrew's Dire Brew"
Inst5Quest15_Level = "80"
Inst5Quest15_Attain = "75"
Inst5Quest15_Aim = "Give Direbrew's Dire Brew to Ipfelkofer Ironkeg at the Brewfest camp near Ironforge."
Inst5Quest15_Location = "Direbrew's Dire Brew (drops from Coren Direbrew at "..YELLOW.."[15]"..WHITE..")"
Inst5Quest15_Note = "Coren Direbrew is only available during the Brewfest seasonal event. This quest item will drop only once per character.\n\nIpfelkofer Ironkeg is at the Brewfest Camp at (Dun Morogh; "..YELLOW.."47,39"..WHITE..")."
Inst5Quest15_Prequest = "None"
Inst5Quest15_Folgequest = "None"
--
Inst5Quest15name1 = "Brewfest Prize Token"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst5Quest1_HORDE = Inst5Quest1
Inst5Quest1_HORDE_Level = Inst5Quest1_Level
Inst5Quest1_HORDE_Attain = Inst5Quest1_Attain
Inst5Quest1_HORDE_Aim = Inst5Quest1_Aim
Inst5Quest1_HORDE_Location = Inst5Quest1_Location
Inst5Quest1_HORDE_Note = Inst5Quest1_Note
Inst5Quest1_HORDE_Prequest = Inst5Quest1_Prequest
Inst5Quest1_HORDE_Folgequest = Inst5Quest1_Folgequest
--
Inst5Quest1name1_HORDE = Inst5Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst5Quest2_HORDE = Inst5Quest2
Inst5Quest2_HORDE_Level = Inst5Quest2_Level
Inst5Quest2_HORDE_Attain = Inst5Quest2_Attain
Inst5Quest2_HORDE_Aim = Inst5Quest2_Aim
Inst5Quest2_HORDE_Location = Inst5Quest2_Location
Inst5Quest2_HORDE_Note = Inst5Quest2_Note
Inst5Quest2_HORDE_Prequest = Inst5Quest2_Prequest
Inst5Quest2_HORDE_Folgequest = Inst5Quest2_Folgequest
Inst5Quest2PreQuest_HORDE = Inst5Quest2PreQuest
--
Inst5Quest2name1_HORDE = Inst5Quest2name1
Inst5Quest2name2_HORDE = Inst5Quest2name2
Inst5Quest2name3_HORDE = Inst5Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst5Quest3_HORDE = Inst5Quest3
Inst5Quest3_HORDE_Level = Inst5Quest3_Level
Inst5Quest3_HORDE_Attain = Inst5Quest3_Attain
Inst5Quest3_HORDE_Aim = Inst5Quest3_Aim
Inst5Quest3_HORDE_Location = Inst5Quest3_Location
Inst5Quest3_HORDE_Note = Inst5Quest3_Note
Inst5Quest3_HORDE_Prequest = Inst5Quest3_Prequest
Inst5Quest3_HORDE_Folgequest = Inst5Quest3_Folgequest
--
Inst5Quest3name1_HORDE = Inst5Quest3name1
Inst5Quest3name2_HORDE = Inst5Quest3name2

--Quest 4 Horde
Inst5Quest4_HORDE = "4. Lost Thunderbrew Recipe"
Inst5Quest4_HORDE_Level = "55"
Inst5Quest4_HORDE_Attain = "50"
Inst5Quest4_HORDE_Aim = "Bring the Lost Thunderbrew Recipe to Vivian Lagrave in Kargath."
Inst5Quest4_HORDE_Location = "Shadowmage Vivian Lagrave (Badlands - Kargath; "..YELLOW.."2,47"..WHITE..")"
Inst5Quest4_HORDE_Note = "You get the prequest from Apothecary Zinge in Undercity - The Apothecarium ("..YELLOW.."50,68"..WHITE..").\nYou get the recipe from one of the guards who appear if you destroy the ale "..YELLOW.."[15]"..WHITE.."."
Inst5Quest4_HORDE_Prequest = "Vivian Lagrave"
Inst5Quest4_HORDE_Folgequest = "None"
Inst5Quest4PreQuest_HORDE = "true"
--
Inst5Quest4name1_HORDE = "Superior Healing Potion"
Inst5Quest4name2_HORDE = "Greater Mana Potion"
Inst5Quest4name3_HORDE = "Swiftstrike Cudgel"
Inst5Quest4name4_HORDE = "Limb Cleaver"

--Quest 5 Horde  (same as Quest 7 Alliance)
Inst5Quest5_HORDE = "5. The Heart of the Mountain"
Inst5Quest5_HORDE_Level = Inst5Quest7_Level
Inst5Quest5_HORDE_Attain = Inst5Quest7_Attain
Inst5Quest5_HORDE_Aim = Inst5Quest7_Aim
Inst5Quest5_HORDE_Location = Inst5Quest7_Location
Inst5Quest5_HORDE_Note = Inst5Quest7_Note
Inst5Quest5_HORDE_Prequest = Inst5Quest7_Prequest
Inst5Quest5_HORDE_Folgequest = Inst5Quest7_Folgequest
-- No Rewards for this quest

--Quest 6 Horde
Inst5Quest6_HORDE = "6. KILL ON SIGHT: Dark Iron Dwarves"
Inst5Quest6_HORDE_Level = "52"
Inst5Quest6_HORDE_Attain = "48"
Inst5Quest6_HORDE_Aim = "Venture to Blackrock Depths and destroy the vile aggressors! Warlord Goretooth wants you to kill 15 Anvilrage Guardsmen, 10 Anvilrage Wardens and 5 Anvilrage Footmen. Return to him once your task is complete."
Inst5Quest6_HORDE_Location = "Sign Post (Badlands - Kargath; "..YELLOW.."3,47"..WHITE..")"
Inst5Quest6_HORDE_Note = "You find the dwarves in the first part of Blackrock Depths.\nYou find Warlord Goretooth in Kargath at the top of the tower (Badlands, "..YELLOW.."5,47"..WHITE..")."
Inst5Quest6_HORDE_Prequest = "None"
Inst5Quest6_HORDE_Folgequest = "KILL ON SIGHT: High Ranking Dark Iron Officials"
-- No Rewards for this quest

--Quest 7 Horde
Inst5Quest7_HORDE = "7. KILL ON SIGHT: High Ranking Dark Iron Officials"
Inst5Quest7_HORDE_Level = "54"
Inst5Quest7_HORDE_Attain = "49"
Inst5Quest7_HORDE_Aim = "Venture to Blackrock Depths and destroy the vile aggressors! Warlord Goretooth wants you to kill 10 Anvilrage Medics, 10 Anvilrage Soldiers and 10 Anvilrage Officers. Return to him once your task is complete."
Inst5Quest7_HORDE_Location = "Sign Post (Badlands - Kargath; "..YELLOW.."3,47"..WHITE..")"
Inst5Quest7_HORDE_Note = "You find the dwarves near Bael'Gar "..YELLOW.."[11]"..WHITE..". You find Warlord Goretooth in Kargath at the top of the tower (Badlands, "..YELLOW.."5,47"..WHITE..").\n The followup quest starts at Lexlort (Badlands - Kargath; "..YELLOW.."5,47"..WHITE.."). You find Grark Lorkrub in the Burning Steppes ("..YELLOW.."38,35"..WHITE.."). You have to reduce his life below 50% to bind him and start a Escort quest."
Inst5Quest7_HORDE_Prequest = "KILL ON SIGHT: Dark Iron Dwarves"
Inst5Quest7_HORDE_Folgequest = "Grark Lorkrub -> Precarious Predicament (Escort quest)"
Inst5Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 8 Horde
Inst5Quest8_HORDE = "8. Operation: Death to Angerforge"
Inst5Quest8_HORDE_Level = "58"
Inst5Quest8_HORDE_Attain = "54"
Inst5Quest8_HORDE_Aim = "Travel to Blackrock Depths and slay General Angerforge! Return to Warlord Goretooth when the task is complete."
Inst5Quest8_HORDE_Location = "Warlord Goretooth (Badlands - Kargath; "..YELLOW.."5,47"..WHITE..")"
Inst5Quest8_HORDE_Note = "You find General Angerforge at "..YELLOW.."[13]"..WHITE..". He calls help below 30%!"
Inst5Quest8_HORDE_Prequest = "Precarious Predicament"
Inst5Quest8_HORDE_Folgequest = "None"
Inst5Quest8FQuest_HORDE = "true"
--
Inst5Quest8name1_HORDE = "Conqueror's Medallion"

--Quest 9 Horde
Inst5Quest9_HORDE = "9. The Rise of the Machines"
Inst5Quest9_HORDE_Level = "58"
Inst5Quest9_HORDE_Attain = "52"
Inst5Quest9_HORDE_Aim = "Find and slay Golem Lord Argelmach. Return his head to Lotwil. You will also need to collect 10 Intact Elemental Cores from the Ragereaver Golems and Warbringer Constructs protecting Argelmach. You know this because you are psychic."
Inst5Quest9_HORDE_Location = "Lotwil Veriatus (Badlands; "..YELLOW.."25,44"..WHITE..")"
Inst5Quest9_HORDE_Note = "You get the prequest from Hierophant Theodora Mulvadania (Badlands - Kargath; "..YELLOW.."3,47"..WHITE..").\nYou find Argelmach at "..YELLOW.."[14]"..WHITE.."."
Inst5Quest9_HORDE_Prequest = "The Rise of the Machines"
Inst5Quest9_HORDE_Folgequest = "None"
Inst5Quest9PreQuest_HORDE = "true"
--
Inst5Quest9name1_HORDE = "Azure Moon Amice"
Inst5Quest9name2_HORDE = "Raincaster Drape"
Inst5Quest9name3_HORDE = "Basaltscale Armor"
Inst5Quest9name4_HORDE = "Lavaplate Gauntlets"

--Quest 10 Horde  (same as Quest 9 Alliance)
Inst5Quest10_HORDE = "10. A Taste of Flame"
Inst5Quest10_HORDE_Level = Inst5Quest9_Level
Inst5Quest10_HORDE_Attain = Inst5Quest9_Attain
Inst5Quest10_HORDE_Aim = Inst5Quest9_Aim
Inst5Quest10_HORDE_Location = Inst5Quest9_Location
Inst5Quest10_HORDE_Note = Inst5Quest9_Note
Inst5Quest10_HORDE_Prequest = Inst5Quest9_Prequest
Inst5Quest10_HORDE_Folgequest = Inst5Quest9_Folgequest
Inst5Quest10PreQuest_HORDE = Inst5Quest9PreQuest
--
Inst5Quest10name1_HORDE = Inst5Quest9name1
Inst5Quest10name2_HORDE = Inst5Quest9name2
Inst5Quest10name3_HORDE = Inst5Quest9name3

--Quest 11 Horde
Inst5Quest11_HORDE = "11. Disharmony of Flame"
Inst5Quest11_HORDE_Level = "52"
Inst5Quest11_HORDE_Attain = "48"
Inst5Quest11_HORDE_Aim = "Travel to the quarry in Blackrock Mountain and slay Overmaster Pyron. Return to Thunderheart when you have completed this assignment."
Inst5Quest11_HORDE_Location = "Thunderheart (Badlands - Kargath; "..YELLOW.."3,48"..WHITE..")"
Inst5Quest11_HORDE_Note = "Overmaster Pyron is a fire elemental outside the instance. He's at "..YELLOW.."[24]"..WHITE.." on the Blackrock Depths map and at "..YELLOW.."[1]"..WHITE.." on the Blackrock Mountain entrance map."
Inst5Quest11_HORDE_Prequest = "None"
Inst5Quest11_HORDE_Folgequest = "Disharmony of Fire"
-- No Rewards for this quest

--Quest 12 Horde
Inst5Quest12_HORDE = "12. Disharmony of Fire"
Inst5Quest12_HORDE_Level = "56"
Inst5Quest12_HORDE_Attain = "48"
Inst5Quest12_HORDE_Aim = "Enter Blackrock Depths and track down Lord Incendius. Slay him and return any source of information you may find to Thunderheart."
Inst5Quest12_HORDE_Location = "Thunderheart (Badlands - Kargath; "..YELLOW.."3,48"..WHITE..")"
Inst5Quest12_HORDE_Note = "You get the prequest from Thunderheart, too.\nYou find Lord Incendius at "..YELLOW.."[10]"..WHITE.."."
Inst5Quest12_HORDE_Prequest = "Disharmony of Flame"
Inst5Quest12_HORDE_Folgequest = "None"
Inst5Quest12FQuest_HORDE = "true"
--
Inst5Quest12name1_HORDE = "Sunborne Cape"
Inst5Quest12name2_HORDE = "Nightfall Gloves"
Inst5Quest12name3_HORDE = "Crypt Demon Bracers"
Inst5Quest12name4_HORDE = "Stalwart Clutch"

--Quest 13 Horde
Inst5Quest13_HORDE = "13. The Last Element"
Inst5Quest13_HORDE_Level = "54"
Inst5Quest13_HORDE_Attain = "48"
Inst5Quest13_HORDE_Aim = "Travel to Blackrock Depths and recover 10 Essence of the Elements. Your first inclination is to search the golems and golem makers. You remember Vivian Lagrave also muttering something about elementals."
Inst5Quest13_HORDE_Location = "Shadowmage Vivian Lagrave (Badlands - Kargath; "..YELLOW.."2,47"..WHITE..")"
Inst5Quest13_HORDE_Note = "You get the prequest from Thunderheart (Badlands - Kargath; "..YELLOW.."3,48"..WHITE..").\n Every elemental can drop the Essence"
Inst5Quest13_HORDE_Prequest = "Disharmony of Flame"
Inst5Quest13_HORDE_Folgequest = "None"
Inst5Quest13PreQuest_HORDE = "true"
--
Inst5Quest13name1_HORDE = "Lagrave's Seal"

--Quest 14 Horde
Inst5Quest14_HORDE = "14. Commander Gor'shak"
Inst5Quest14_HORDE_Level = "52"
Inst5Quest14_HORDE_Attain = "48"
Inst5Quest14_HORDE_Aim = "Find Commander Gor'shak in Blackrock Depths.\nYou recall that the crudely drawn picture of the orc included bars drawn over the portrait. Perhaps you should search for a prison of some sort."
Inst5Quest14_HORDE_Location = "Galamav the Marksman (Badlands - Kargath; "..YELLOW.."5,47"..WHITE..")"
Inst5Quest14_HORDE_Note = "You get the prequest from Thunderheart (Badlands - Kargath; "..YELLOW.."3,48"..WHITE..").\nYou find Commander Gor'shak at "..YELLOW.."[3]"..WHITE..". The key to open the prison drops from High Interrogator Gerstahn "..YELLOW.."[5]"..WHITE..". If you talk to him and start the next Quest enemys appears."
Inst5Quest14_HORDE_Prequest = "Disharmony of Flame"
Inst5Quest14_HORDE_Folgequest = "What Is Going On?"
Inst5Quest14PreQuest_HORDE = "true"

--Quest 15 Horde
Inst5Quest15_HORDE = "15. The Royal Rescue"
Inst5Quest15_HORDE_Level = "59"
Inst5Quest15_HORDE_Attain = "50"
Inst5Quest15_HORDE_Aim = "Slay Emperor Dagran Thaurissan and free Princess Moira Bronzebeard from his evil spell."
Inst5Quest15_HORDE_Location = "Thrall (Orgrimmar; "..YELLOW.."31,37"..WHITE..")"
Inst5Quest15_HORDE_Note = "After talking a with Kharan Mighthammer and Thrall you get this quest.\nYou find Emperor Dagran Thaurissan at "..YELLOW.."[21]"..WHITE..". The Princess heals Dagran but you must not kill her to complete the quest! Try to interrupt her healing spells. (Rewards are for The Princess Saved?)"
Inst5Quest15_HORDE_Prequest = "Commander Gor'shak"
Inst5Quest15_HORDE_Folgequest = "The Princess Saved?"
Inst5Quest15FQuest_HORDE = "true"
--
Inst5Quest15name1_HORDE = "Thrall's Resolve"
Inst5Quest15name2_HORDE = "Eye of Orgrimmar"

--Quest 16 Horde  (same as Quest 12 Alliance)
Inst5Quest16_HORDE = "16. Attunement to the Core"
Inst5Quest16_HORDE_Level = Inst5Quest12_Level
Inst5Quest16_HORDE_Attain = Inst5Quest12_Attain
Inst5Quest16_HORDE_Aim = Inst5Quest12_Aim
Inst5Quest16_HORDE_Location = Inst5Quest12_Location
Inst5Quest16_HORDE_Note = Inst5Quest12_Note
Inst5Quest16_HORDE_Prequest = Inst5Quest12_Prequest
Inst5Quest16_HORDE_Folgequest = Inst5Quest12_Folgequest
-- No Rewards for this quest

--Quest 17 Horde  (same as Quest 13 Alliance)
Inst5Quest17_HORDE = "17. The Challenge"
Inst5Quest17_HORDE_Level = Inst5Quest13_Level
Inst5Quest17_HORDE_Attain = Inst5Quest13_Attain
Inst5Quest17_HORDE_Aim = Inst5Quest13_Aim
Inst5Quest17_HORDE_Location = Inst5Quest13_Location
Inst5Quest17_HORDE_Note = Inst5Quest13_Note
Inst5Quest17_HORDE_Prequest = Inst5Quest13_Prequest
Inst5Quest17_HORDE_Folgequest = Inst5Quest13_Folgequest
-- No Rewards for this quest

--Quest 18 Horde  (same as Quest 14 Alliance)
Inst5Quest18_HORDE = "18. The Spectral Chalice"
Inst5Quest18_HORDE_Level = Inst5Quest14_Level
Inst5Quest18_HORDE_Attain = Inst5Quest14_Attain
Inst5Quest18_HORDE_Aim = Inst5Quest14_Aim
Inst5Quest18_HORDE_Location = Inst5Quest14_Location
Inst5Quest18_HORDE_Note = Inst5Quest14_Note
Inst5Quest18_HORDE_Prequest = Inst5Quest14_Prequest
Inst5Quest18_HORDE_Folgequest = Inst5Quest14_Folgequest
-- No Rewards for this quest

--Quest 19 Horde
Inst5Quest19_HORDE = "19. Direbrew's Dire Brew"
Inst5Quest19_HORDE_Level = "80"
Inst5Quest19_HORDE_Attain = "75"
Inst5Quest19_HORDE_Aim = "Give Direbrew's Dire Brew to Tapper Swindlekeg at the Brewfest camp near Orgrimmar."
Inst5Quest19_HORDE_Location = "Direbrew's Dire Brew (drops from Coren Direbrew at "..YELLOW.."[15]"..WHITE..")"
Inst5Quest19_HORDE_Note = "Coren Direbrew is only available during the Brewfest seasonal event. This quest item will drop only once per character.\n\nTapper Swindlekeg is at the Brewfest Camp at (Durotar; "..YELLOW.."45,17"..WHITE..")."
Inst5Quest19_HORDE_Prequest = "None"
Inst5Quest19_HORDE_Folgequest = "None"
--
Inst5Quest19name1_HORDE = "Brewfest Prize Token"



--------------- INST6 - Blackwing Lair (BWL) ---------------

Inst6Story = {
  ["Page1"] = "Blackwing Lair can be found at the very height of Blackrock Spire. It is there in the dark recesses of the mountain's peak that Nefarian has begun to unfold the final stages of his plan to destroy Ragnaros once and for all and lead his army to undisputed supremacy over all the races of Azeroth.",
  ["Page2"] = "The mighty fortress carved within the fiery bowels of Blackrock Mountain was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths, which serve as the seat of power for Ragnaros the Firelord. Ragnaros has uncovered the secret to creating life from stone and plans to build an army of unstoppable golems to aid him in conquering the whole of Blackrock Mountain.",
  ["Page3"] = "Nefarian has vowed to crush Ragnaros. To this end, he has recently begun efforts to bolster his forces, much as his father Deathwing had attempted to do in ages past. However, where Deathwing failed, it now seems the scheming Nefarian may be succeeding. Nefarian's mad bid for dominance has even attracted the ire of the Red Dragon Flight, which has always been the Black Flight's greatest foe. Though Nefarian's intentions are known, the methods he is using to achieve them remain a mystery. It is believed, however that Nefarian has been experimenting with the blood of all of the various Dragon Flights to produce unstoppable warriors.\n \nNefarian's sanctum, Blackwing Lair, can be found at the very height of Blackrock Spire. It is there in the dark recesses of the mountain's peak that Nefarian has begun to unfold the final stages of his plan to destroy Ragnaros once and for all and lead his army to undisputed supremacy over all the races of Azeroth.";
  ["MaxPages"] = "3",
};
Inst6Caption = "Blackwing Lair"
Inst6Caption2 = "Blackwing Lair (Story Part 1)"
Inst6Caption3 = "Blackwing Lair (Story Part 2)"

Inst6QAA = "3 Quests"
Inst6QAH = "3 Quests"

--Quest 1 Alliance
Inst6Quest1 = "1. Nefarius's Corruption"
Inst6Quest1_Level = "60"
Inst6Quest1_Attain = "60"
Inst6Quest1_Aim = "Slay Nefarian and recover the Red Scepter Shard. Return the Red Scepter Shard to Anachronos at the Caverns of Time in Tanaris. You have 5 hours to complete this task."
Inst6Quest1_Location = "Vaelastrasz the Corrupt (Blackwing Lair; "..YELLOW.."[2]"..WHITE..")"
Inst6Quest1_Note = "Only one person can loot the Shard. Anachronos (Tanaris - Caverns of Time; "..YELLOW.."65,49"..WHITE..")"
Inst6Quest1_Prequest = "None"
Inst6Quest1_Folgequest = "None"
--
Inst6Quest1name1 = "Onyx Embedded Leggings"
Inst6Quest1name2 = "Amulet of Shadow Shielding"

--Quest 2 Alliance
Inst6Quest2 = "2. The Lord of Blackrock"
Inst6Quest2_Level = "60"
Inst6Quest2_Attain = "60"
Inst6Quest2_Aim = "Return the Head of Nefarian to King Varian Wrynn in Stormwind."
Inst6Quest2_Location = "Head of Nefarian (drops from Nefarian; "..YELLOW.."[10]"..WHITE..")"
Inst6Quest2_Note = "King Varian Wrynn is at (Stormwind City - Stormwind Keep; "..YELLOW.."80.0, 38.5"..WHITE.."). The follow up sends you to Field Marshal Afrasiabi (Stormwind - Valley of Heroes; "..YELLOW.."71.5, 80.5"..WHITE..") for the reward."
Inst6Quest2_Prequest = "None"
Inst6Quest2_Folgequest = "The Lord of Blackrock"
--
Inst6Quest2name1 = "Master Dragonslayer's Medallion"
Inst6Quest2name2 = "Master Dragonslayer's Orb"
Inst6Quest2name3 = "Master Dragonslayer's Ring"

--Quest 3 Alliance
Inst6Quest3 = "3. Only One May Rise"
Inst6Quest3_Level = "60"
Inst6Quest3_Attain = "60"
Inst6Quest3_Aim = "Return the Head of the Broodlord Lashlayer to Baristolth of the Shifting Sands at Cenarion Hold in Silithus."
Inst6Quest3_Location = "Head of the Broodlord Lashlayer (drops from Broodlord Lashlayer; "..YELLOW.."[3]"..WHITE..")"
Inst6Quest3_Note = "Only one person can pick up the head."
Inst6Quest3_Prequest = "None"
Inst6Quest3_Folgequest = "The Path of the Righteous"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst6Quest1_HORDE = Inst6Quest1
Inst6Quest1_HORDE_Level = Inst6Quest1_Level
Inst6Quest1_HORDE_Attain = Inst6Quest1_Attain
Inst6Quest1_HORDE_Aim = Inst6Quest1_Aim
Inst6Quest1_HORDE_Location = Inst6Quest1_Location
Inst6Quest1_HORDE_Note = Inst6Quest1_Note
Inst6Quest1_HORDE_Prequest = Inst6Quest1_Prequest
Inst6Quest1_HORDE_Folgequest = Inst6Quest1_Folgequest
--
Inst6Quest1name1_HORDE = Inst6Quest1name1
Inst6Quest1name2_HORDE = Inst6Quest1name2

--Quest 2 Horde
Inst6Quest2_HORDE = "2. The Lord of Blackrock"
Inst6Quest2_HORDE_Level = "60"
Inst6Quest2_HORDE_Attain = "60"
Inst6Quest2_HORDE_Aim = "Return the Head of Nefarian to Thrall in Orgrimmar."
Inst6Quest2_HORDE_Location = "Head of Nefarian (drops from Nefarian; "..YELLOW.."[9]"..WHITE..")"
Inst6Quest2_HORDE_Note = "The follow up sends you to High Overlord Saurfang (Orgrimmar - Valley of Strength; "..YELLOW.."51,76"..WHITE..") for the reward."
Inst6Quest2_HORDE_Prequest = "None"
Inst6Quest2_HORDE_Folgequest = "The Lord of Blackrock"
--
Inst6Quest2name1_HORDE = "Master Dragonslayer's Medallion"
Inst6Quest2name2_HORDE = "Master Dragonslayer's Orb"
Inst6Quest2name3_HORDE = "Master Dragonslayer's Ring"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst6Quest3_HORDE = Inst6Quest3
Inst6Quest3_HORDE_Level = Inst6Quest3_Level
Inst6Quest3_HORDE_Attain = Inst6Quest3_Attain
Inst6Quest3_HORDE_Aim = Inst6Quest3_Aim
Inst6Quest3_HORDE_Location = Inst6Quest3_Location
Inst6Quest3_HORDE_Note = Inst6Quest3_Note
Inst6Quest3_HORDE_Prequest = Inst6Quest3_Prequest
Inst6Quest3_HORDE_Folgequest = Inst6Quest3_Folgequest
-- No Rewards for this quest



--------------- INST7 - Blackfathom Deeps (BFD) ---------------

Inst7Story = "Situated along the Zoram Strand of Ashenvale, Blackfathom Deeps was once a glorious temple dedicated to the night elves' moon-goddess, Elune. However, the great Sundering shattered the temple - sinking it beneath the waves of the Veiled Sea. There it remained untouched - until, drawn by its ancient power - the naga and satyr emerged to plumb its secrets. Legends hold that the ancient beast, Aku'mai, has taken up residence within the temple's ruins. Aku'mai, a favored pet of the primordial Old Gods, has preyed upon the area ever since. Drawn to Aku'mai's presence, the cult known as the Twilight's Hammer has also come to bask in the Old Gods' evil presence."
Inst7Caption = "Blackfathom Deeps"
Inst7QAA = "6 Quests"
Inst7QAH = "5 Quests"

--Quest 1 Alliance
Inst7Quest1 = "1. Knowledge in the Deeps"
Inst7Quest1_Level = "23"
Inst7Quest1_Attain = "19"
Inst7Quest1_Aim = "Bring the Lorgalis Manuscript to Gerrig Bonegrip in the Forlorn Cavern in Ironforge."
Inst7Quest1_Location = "Gerrig Bonegrip (Ironforge - The Forlorn Cavern; "..YELLOW.."50,5"..WHITE..")"
Inst7Quest1_Note = "You find the Manuscript at "..YELLOW.."[2]"..WHITE.." in the water."
Inst7Quest1_Prequest = "None"
Inst7Quest1_Folgequest = "None"
--
Inst7Quest1name1 = "Sustaining Ring"

--Quest 2 Alliance
Inst7Quest2 = "2. Researching the Corruption"
Inst7Quest2_Level = "24"
Inst7Quest2_Attain = "18"
Inst7Quest2_Aim = "Gershala Nightwhisper in Auberdine wants 8 Corrupt Brain stems."
Inst7Quest2_Location = "Gershala Nightwhisper (Darkshore - Auberdine; "..YELLOW.."38,43"..WHITE..")"
Inst7Quest2_Note = "The prequest is optional. You get it from Argos Nightwhisper at (Stormwind - The Park; "..YELLOW.."35.9, 67.3"..WHITE.."). \n\nAll the Nagas before and in Blackfathom Deeps drop the brains."
Inst7Quest2_Prequest = "The Corruption Abroad"
Inst7Quest2_Folgequest = "None"
Inst7Quest2PreQuest = "true"
--
Inst7Quest2name1 = "Beetle Clasps"
Inst7Quest2name2 = "Prelacy Cape"

--Quest 3 Alliance
Inst7Quest3 = "3. In Search of Thaelrid"
Inst7Quest3_Level = "24"
Inst7Quest3_Attain = "18"
Inst7Quest3_Aim = "Seek out Argent Guard Thaelrid in Blackfathom Deeps."
Inst7Quest3_Location = "Dawnwatcher Shaedlass (Darnassus - Craftsmen's Terrace; "..YELLOW.."55,24"..WHITE..")"
Inst7Quest3_Note = "You find Argent Guard Thaelrid at "..YELLOW.."[4]"..WHITE.."."
Inst7Quest3_Prequest = "None"
Inst7Quest3_Folgequest = "Blackfathom Villainy"
-- No Rewards for this quest

--Quest 4 Alliance
Inst7Quest4 = "4. Blackfathom Villainy"
Inst7Quest4_Level = "27"
Inst7Quest4_Attain = "18"
Inst7Quest4_Aim = "Bring the head of Twilight Lord Kelris to Dawnwatcher Selgorm in Darnassus."
Inst7Quest4_Location = "Argent Guard Thaelrid (Blackfathom Deeps; "..YELLOW.."[4]"..WHITE..")"
Inst7Quest4_Note = "Twilight Lord Kelris is at "..YELLOW.."[8]"..WHITE..". You find Dawnwatcher Selgorm in Darnassus - Craftsmen's Terrace ("..YELLOW.."55,24"..WHITE.."). \n\nATTENTION! If you turn on the flames beside Lord Kelris, enemies appear and attack you."
Inst7Quest4_Prequest = "In Search of Thaelrid"
Inst7Quest4_Folgequest = "None"
Inst7Quest4FQuest = "true"
--
Inst7Quest4name1 = "Gravestone Scepter"
Inst7Quest4name2 = "Arctic Buckler"

--Quest 5 Alliance
Inst7Quest5 = "5. Twilight Falls"
Inst7Quest5_Level = "25"
Inst7Quest5_Attain = "20"
Inst7Quest5_Aim = "Bring 10 Twilight Pendants to Argent Guard Manados in Darnassus."
Inst7Quest5_Location = "Argent Guard Manados (Darnassus - Craftsmen's Terrace; "..YELLOW.."55,23"..WHITE..")"
Inst7Quest5_Note = "Every Twilight mob can drop the pendants."
Inst7Quest5_Prequest = "None"
Inst7Quest5_Folgequest = "None"
--
Inst7Quest5name1 = "Nimbus Boots"
Inst7Quest5name2 = "Heartwood Girdle"

--Quest 6 Alliance
Inst7Quest6 = "6. The Orb of Soran'ruk (Warlock)"
Inst7Quest6_Level = "25"
Inst7Quest6_Attain = "20"
Inst7Quest6_Aim = "Find 3 Soran'ruk Fragments and 1 Large Soran'ruk Fragment and return them to Doan Karhan in the Barrens."
Inst7Quest6_Location = "Doan Karhan (Barrens; "..YELLOW.."49,57"..WHITE..")"
Inst7Quest6_Note = "Only Warlocks can get this Quest! You get the 3 Soran'ruk Fragments from Twilight Accolytes in "..YELLOW.."[Blackfathom Deeps]"..WHITE..". You get the Large Soran'ruk Fragment in "..YELLOW.."[Shadowfang Keep]"..WHITE.." from Shadowfang Darksouls."
Inst7Quest6_Prequest = "None"
Inst7Quest6_Folgequest = "None"
--
Inst7Quest6name1 = "Orb of Soran'ruk"
Inst7Quest6name2 = "Staff of Soran'ruk"


--Quest 1 Horde
Inst7Quest1_HORDE = "1. The Essence of Aku'Mai"
Inst7Quest1_HORDE_Level = "22"
Inst7Quest1_HORDE_Attain = "17"
Inst7Quest1_HORDE_Aim = "Bring 20 Sapphires of Aku'Mai to Je'neu Sancrea in Ashenvale."
Inst7Quest1_HORDE_Location = "Je'neu Sancrea (Ashenvale - Zoram'gar Outpost; "..YELLOW.."11,33"..WHITE..")"
Inst7Quest1_HORDE_Note = "You get the prequest Trouble in the Deeps from Tsunaman (Stonetalon Mountains - Sun Rock Retreat; "..YELLOW.."47,64"..WHITE.."). The crystals can be found in the tunnels before the instance."
Inst7Quest1_HORDE_Prequest = "Trouble in the Deeps"
Inst7Quest1_HORDE_Folgequest = "None"
Inst7Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst7Quest2_HORDE = "2. Allegiance to the Old Gods"
Inst7Quest2_HORDE_Level = "22"
Inst7Quest2_HORDE_Attain = "17"
Inst7Quest2_HORDE_Aim = "Bring the Damp Note to Je'neu Sancrea in Ashenvale -> Kill Lorgus Jett in Blackfathom Deeps and then return to Je'neu Sancrea in Ashenvale."
Inst7Quest2_HORDE_Location = "Damp Note (drop - see note)"
Inst7Quest2_HORDE_Note = "You get the Damp Note from Blackfathom Tide Priestess (5% drop rate). Then take it to Je'neu Sancrea (Ashenvale - Zoram'gar Outpost; "..YELLOW.."11,33"..WHITE.."). Lorgus Jett is at "..YELLOW.."[6]"..WHITE.."."
Inst7Quest2_HORDE_Prequest = "None"
Inst7Quest2_HORDE_Folgequest = "None"
--
Inst7Quest2name1_HORDE = "Band of the Fist"
Inst7Quest2name2_HORDE = "Chestnut Mantle"

--Quest 3 Horde
Inst7Quest3_HORDE = "3. Amongst the Ruins"
Inst7Quest3_HORDE_Level = "27"
Inst7Quest3_HORDE_Attain = "21"
Inst7Quest3_HORDE_Aim = "Bring the Fathom Core to Je'neu Sancrea at Zoram'gar Outpost, Ashenvale."
Inst7Quest3_HORDE_Location = "Je'neu Sancrea (Ashenvale - Zoram'gar Outpost; "..YELLOW.."11,33"..WHITE..")"
Inst7Quest3_HORDE_Note = "You find the Fathom Core at "..YELLOW.."[7]"..WHITE.." in the water. When you get the core Baron Aquanis appears and attacks you. He drops a quest item which you have to take back to Je'neu Sancrea."
Inst7Quest3_HORDE_Prequest = "None"
Inst7Quest3_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Horde
Inst7Quest4_HORDE = "4. Blackfathom Villainy"
Inst7Quest4_HORDE_Level = "27"
Inst7Quest4_HORDE_Attain = "18"
Inst7Quest4_HORDE_Aim = "Bring the head of Twilight Lord Kelris to Bashana Runetotem in Thunder Bluff."
Inst7Quest4_HORDE_Location = "Argent guard Thaelrid (Blackfathom Deeps; "..YELLOW.."[4]"..WHITE..")"
Inst7Quest4_HORDE_Note = "Twilight Lord Kelris is at "..YELLOW.."[8]"..WHITE..". You find Bashana Runetotem in Thunderbluff - The Elder Rise ("..YELLOW.."70,33"..WHITE.."). \n\nATTENTION! If you turn on the flames beside Lord Kelris, enemies appear and attack you."
Inst7Quest4_HORDE_Prequest = "None"
Inst7Quest4_HORDE_Folgequest = "None"
--
Inst7Quest4name1_HORDE = "Gravestone Scepter"
Inst7Quest4name2_HORDE = "Arctic Buckler"

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst7Quest5_HORDE = "5. The Orb of Soran'ruk (Warlock)"
Inst7Quest5_HORDE_Level = Inst7Quest6_Level
Inst7Quest5_HORDE_Attain = Inst7Quest6_Attain
Inst7Quest5_HORDE_Aim = Inst7Quest6_Aim
Inst7Quest5_HORDE_Location = Inst7Quest6_Location
Inst7Quest5_HORDE_Note = Inst7Quest6_Note
Inst7Quest5_HORDE_Prequest = Inst7Quest6_Prequest
Inst7Quest5_HORDE_Folgequest = Inst7Quest6_Folgequest
--
Inst7Quest5name1_HORDE = Inst7Quest6name1
Inst7Quest5name2_HORDE = Inst7Quest6name2



--------------- INST8 - Lower Blackrock Spire (LBRS) ---------------

Inst8Story = "The mighty fortress carved within the fiery bowels of Blackrock Mountain was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths. Realizing that the dwarves were led by the mighty fire elemental, Ragnaros - Nefarian vowed to crush his enemies and claim the whole of Blackrock mountain for himself."
Inst8Caption = "Blackrock Spire (Lower)"
Inst8QAA = "14 Quests"
Inst8QAH = "14 Quests"

--Quest 1 Alliance
Inst8Quest1 = "1. The Final Tablets"
Inst8Quest1_Level = "58"
Inst8Quest1_Attain = "40"
Inst8Quest1_Aim = "Bring the Fifth and Sixth Mosh'aru Tablets to Prospector Ironboot in Tanaris."
Inst8Quest1_Location = "Prospector Ironboot (Tanaris - Steamwheedle Port; "..YELLOW.."66,23"..WHITE..")"
Inst8Quest1_Note = "You find the tablets near "..YELLOW.."[7]"..WHITE.." and "..YELLOW.."[9]"..WHITE..".\nThe Rewards belong to 'Confront Yeh'kinya'. You find Yeh'kinya near Prospector Ironboot."
Inst8Quest1_Prequest = "The Lost Tablets of Mosh'aru"
Inst8Quest1_Folgequest = "Confront Yeh'kinya"
Inst8Quest1PreQuest = "true"
--
Inst8Quest1name1 = "Faded Hakkari Cloak"
Inst8Quest1name2 = "Tattered Hakkari Cape"

--Quest 2 Alliance
Inst8Quest2 = "2. Kibler's Exotic Pets"
Inst8Quest2_Level = "59"
Inst8Quest2_Attain = "55"
Inst8Quest2_Aim = "Travel to Blackrock Spire and find Bloodaxe Worg Pups. Use the cage to carry the ferocious little beasts. Bring back a Caged Worg Pup to Kibler."
Inst8Quest2_Location = "Kibler (Burning Steppes - Flame Crest; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest2_Note = "You find the Worg Pup at "..YELLOW.."[17]"..WHITE.." by Halcyon."
Inst8Quest2_Prequest = "None"
Inst8Quest2_Folgequest = "None"
--
Inst8Quest2name1 = "Worg Carrier"

--Quest 3 Alliance
Inst8Quest3 = "3. En-Ay-Es-Tee-Why"
Inst8Quest3_Level = "59"
Inst8Quest3_Attain = "55"
Inst8Quest3_Aim = "Travel to Blackrock Spire and collect 15 Spire Spider Eggs for Kibler."
Inst8Quest3_Location = "Kibler (Burning Steppes - Flame Crest; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest3_Note = "You find the spider eggs near "..YELLOW.."[13]"..WHITE.."."
Inst8Quest3_Prequest = "None"
Inst8Quest3_Folgequest = "None"
--
Inst8Quest3name1 = "Smolderweb Carrier"

--Quest 4 Alliance
Inst8Quest4 = "4. Mother's Milk"
Inst8Quest4_Level = "60"
Inst8Quest4_Attain = "55"
Inst8Quest4_Aim = "In the heart of Blackrock Spire you will find Mother Smolderweb. Engage her and get her to poison you. Chances are good that you will have to kill her as well. Return to Ragged John when you are poisoned so that he can 'milk' you."
Inst8Quest4_Location = "Ragged John (Burning Steppes - Flame Crest; "..YELLOW.."65,23"..WHITE..")"
Inst8Quest4_Note = "Mother Smolderweb is at "..YELLOW.."[13]"..WHITE..". The poison effect snares nearby players as well. If it is removed or dispelled, you fail the quest."
Inst8Quest4_Prequest = "None"
Inst8Quest4_Folgequest = "None"
--
Inst8Quest4name1 = "Ragged John's Neverending Cup"

--Quest 5 Alliance
Inst8Quest5 = "5. Put Her Down"
Inst8Quest5_Level = "59"
Inst8Quest5_Attain = "55"
Inst8Quest5_Aim = "Travel to Blackrock Spire and destroy the source of the worg menace. As you left Helendis, he shouted a name: Halycon. It is what the orcs refer to in regards to the worg."
Inst8Quest5_Location = "Helendis Riverhorn (Burning Steppes - Morgan's Vigil; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest5_Note = "You find Halycon at "..YELLOW.."[17]"..WHITE.."."
Inst8Quest5_Prequest = "None"
Inst8Quest5_Folgequest = "None"
--
Inst8Quest5name1 = "Astoria Robes"
Inst8Quest5name2 = "Traphook Jerkin"
Inst8Quest5name3 = "Jadescale Breastplate"

--Quest 6 Alliance
Inst8Quest6 = "6. Urok Doomhowl"
Inst8Quest6_Level = "60"
Inst8Quest6_Attain = "55"
Inst8Quest6_Aim = "Read Warosh's Scroll. Bring Warosh's Mojo to Warosh."
Inst8Quest6_Location = "Warosh (Blackrock Spire; "..YELLOW.."[2]"..WHITE..")"
Inst8Quest6_Note = "To get Warosh's Mojo you have to evoke and kill Urok Doomhowl "..YELLOW.."[15]"..WHITE..". For his Evocation you need a Spear and Highlord Omokk's Head "..YELLOW.."[5]"..WHITE..". The Spear is at "..YELLOW.."[3]"..WHITE..". During the Evocation a few waves of ogres appear before Urok Doomhowl attacks you. You can use the Spear during the fight to damage the ogres."
Inst8Quest6_Prequest = "None"
Inst8Quest6_Folgequest = "None"
--
Inst8Quest6name1 = "Prismcharm"

--Quest 7 Alliance
Inst8Quest7 = "7. Bijou's Belongings"
Inst8Quest7_Level = "59"
Inst8Quest7_Attain = "55"
Inst8Quest7_Aim = "Find Bijou's Belongings and return them to her. Good luck!"
Inst8Quest7_Location = "Bijou (Blackrock Spire; "..YELLOW.."[3]"..WHITE..")"
Inst8Quest7_Note = "You find Bijou's Belongings on the way to Mother Smolderweb at "..YELLOW.."[13]"..WHITE..".\nMaxwell is at (Burning Steppes - Morgan's Vigil; "..YELLOW.."84,58"..WHITE..")."
Inst8Quest7_Prequest = "None"
Inst8Quest7_Folgequest = "Message to Maxwell"
-- No Rewards for this quest

--Quest 8 Alliance
Inst8Quest8 = "8. Maxwell's Mission"
Inst8Quest8_Level = "60"
Inst8Quest8_Attain = "55"
Inst8Quest8_Aim = "Travel to Blackrock Spire and destroy War Master Voone, Highlord Omokk, and Overlord Wyrmthalak. Return to Marshal Maxwell when the job is done."
Inst8Quest8_Location = "Marshal Maxwell (Burning Steppes - Morgan's Vigil; "..YELLOW.."84,58"..WHITE..")"
Inst8Quest8_Note = "You find War Master Voone at "..YELLOW.."[9]"..WHITE..", Highlord Omokk at "..YELLOW.."[5]"..WHITE.." and Overlord Wyrmthalak at "..YELLOW.."[19]"..WHITE.."."
Inst8Quest8_Prequest = "Message to Maxwell"
Inst8Quest8_Folgequest = "None"
Inst8Quest8FQuest = "true"
--
Inst8Quest8name1 = "Wyrmthalak's Shackles"
Inst8Quest8name2 = "Omokk's Girth Restrainer"
Inst8Quest8name3 = "Halycon's Muzzle"
Inst8Quest8name4 = "Vosh'gajin's Strand"
Inst8Quest8name5 = "Voone's Vice Grips"

--Quest 9 Alliance
Inst8Quest9 = "9. Seal of Ascension"
Inst8Quest9_Level = "60"
Inst8Quest9_Attain = "57"
Inst8Quest9_Aim = "Find the three gemstones of command: The Gemstone of Smolderthorn, Gemstone of Spirestone, and Gemstone of Bloodaxe. Return them, along with the Unadorned Seal of Ascension, to Vaelan."
Inst8Quest9_Location = "Vaelan (Blackrock Spire; "..YELLOW.."[1]"..WHITE..")"
Inst8Quest9_Note = "You get the Gemstone of Spirestone from Highlord Omokk at "..YELLOW.."[5]"..WHITE..", the Gemstone of Smolderthorn from War Master Voone at "..YELLOW.."[9]"..WHITE.." and the Gemstone of Bloodaxe from Overlord Wyrmthalak at "..YELLOW.."[19]"..WHITE..". The Unadorned Seal of Ascension can drop from near all mobs in Lower Blackrock Spire or outside the instance. The reward for completing this questline is the a Ring which used to be needed to open the doors to Upper Blackrock Spire."
Inst8Quest9_Prequest = "None"
Inst8Quest9_Folgequest = "Seal of Ascension"
-- No Rewards for this quest

--Quest 10 Alliance
Inst8Quest10 = "10. General Drakkisath's Command"
Inst8Quest10_Level = "60"
Inst8Quest10_Attain = "55"
Inst8Quest10_Aim = "Take General Drakkisath's Command to Marshal Maxwell in Burning Steppes."
Inst8Quest10_Location = "General Drakkisath's Command (drops from Overlord Wyrmthalak; "..YELLOW.."[19]"..WHITE..")"
Inst8Quest10_Note = "Marshal Maxwell is in the Burning Steppes - Morgan's Vigil; ("..YELLOW.."84,58"..WHITE..")."
Inst8Quest10_Prequest = "None"
Inst8Quest10_Folgequest = "General Drakkisath's Demise ("..YELLOW.."Upper Blackrock Spire"..WHITE..")"
-- No Rewards for this quest

--Quest 11 Alliance
Inst8Quest11 = "11. The Left Piece of Lord Valthalak's Amulet"
Inst8Quest11_Level = "60"
Inst8Quest11_Attain = "58"
Inst8Quest11_Aim = "Use the Brazier of Beckoning to summon forth the spirit of Mor Grayhoof and slay him. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning."
Inst8Quest11_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst8Quest11_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nMor Grayhoof is summoned at "..YELLOW.."[9]"..WHITE.."."
Inst8Quest11_Prequest = "Components of Importance"
Inst8Quest11_Folgequest = "I See Alcaz Island In Your Future..."
Inst8Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst8Quest12 = "12. The Right Piece of Lord Valthalak's Amulet"
Inst8Quest12_Level = "60"
Inst8Quest12_Attain = "58"
Inst8Quest12_Aim = "Use the Brazier of Beckoning to summon forth the spirit of Mor Grayhoof and slay him. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning."
Inst8Quest12_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst8Quest12_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nMor Grayhoof is summoned at "..YELLOW.."[9]"..WHITE.."."
Inst8Quest12_Prequest = "More Components of Importance"
Inst8Quest12_Folgequest = "Final Preparations ("..YELLOW.."Upper Blackrock Spire"..WHITE..")"
Inst8Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst8Quest13 = "13. Snakestone of the Shadow Huntress"
Inst8Quest13_Level = "60"
Inst8Quest13_Attain = "50"
Inst8Quest13_Aim = "Travel to Blackrock Spire and slay Shadow Hunter Vosh'gajin. Recover Vosh'gajin's Snakestone and return to Kilram."
Inst8Quest13_Location = "Kilram (Winterspring - Everlook; "..YELLOW.."61,37"..WHITE..")"
Inst8Quest13_Note = "Blacksmith quest. Shadow Hunter Vosh'gajin is at "..YELLOW.."[7]"..WHITE.."."
Inst8Quest13_Prequest = "None"
Inst8Quest13_Folgequest = "None"
--
Inst8Quest13name1 = "Plans: Dawn's Edge"

--Quest 14 Alliance
Inst8Quest14 = "14. Hot Fiery Death"
Inst8Quest14_Level = "60"
Inst8Quest14_Attain = "56"
Inst8Quest14_Aim = "Someone in this world must know what to do with these gauntlets. Good luck!"
Inst8Quest14_Location = "Human Remains (Lower Blackrock Spire; "..YELLOW.."[9]"..WHITE..")"
Inst8Quest14_Note = "Blacksmith quest. Be sure to pick up the Unfired Plate Gauntlets near the Human Remains at "..YELLOW.."[11]"..WHITE..". Turns in to Malyfous Darkhammer (Winterspring - Everlook; "..YELLOW.."61,39"..WHITE.."). Rewards listed are for the followup."
Inst8Quest14_Prequest = "None"
Inst8Quest14_Folgequest = "Fiery Plate Gauntlets"
--
Inst8Quest14name1 = "Plans: Fiery Plate Gauntlets"
Inst8Quest14name2 = "Fiery Plate Gauntlets"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst8Quest1_HORDE = Inst8Quest1
Inst8Quest1_HORDE_Level = Inst8Quest1_Level
Inst8Quest1_HORDE_Attain = Inst8Quest1_Attain
Inst8Quest1_HORDE_Aim = Inst8Quest1_Aim
Inst8Quest1_HORDE_Location = Inst8Quest1_Location
Inst8Quest1_HORDE_Note = Inst8Quest1_Note
Inst8Quest1_HORDE_Prequest = Inst8Quest1_Prequest
Inst8Quest1_HORDE_Folgequest = Inst8Quest1_Folgequest
Inst8Quest1PreQuest_HORDE = Inst8Quest1PreQuest
--
Inst8Quest1name1_HORDE = Inst8Quest1name1
Inst8Quest1name2_HORDE = Inst8Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst8Quest2_HORDE = Inst8Quest2
Inst8Quest2_HORDE_Level = Inst8Quest2_Level
Inst8Quest2_HORDE_Attain = Inst8Quest2_Attain
Inst8Quest2_HORDE_Aim = Inst8Quest2_Aim
Inst8Quest2_HORDE_Location = Inst8Quest2_Location
Inst8Quest2_HORDE_Note = Inst8Quest2_Note
Inst8Quest2_HORDE_Prequest = Inst8Quest2_Prequest
Inst8Quest2_HORDE_Folgequest = Inst8Quest2_Folgequest
--
Inst8Quest2name1_HORDE = Inst8Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst8Quest3_HORDE = Inst8Quest3
Inst8Quest3_HORDE_Level = Inst8Quest3_Level
Inst8Quest3_HORDE_Attain = Inst8Quest3_Attain
Inst8Quest3_HORDE_Aim = Inst8Quest3_Aim
Inst8Quest3_HORDE_Location = Inst8Quest3_Location
Inst8Quest3_HORDE_Note = Inst8Quest3_Note
Inst8Quest3_HORDE_Prequest = Inst8Quest3_Prequest
Inst8Quest3_HORDE_Folgequest = Inst8Quest3_Folgequest
--
Inst8Quest3name1_HORDE = Inst8Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst8Quest4_HORDE = Inst8Quest4
Inst8Quest4_HORDE_Level = Inst8Quest4_Level
Inst8Quest4_HORDE_Attain = Inst8Quest4_Attain
Inst8Quest4_HORDE_Aim = Inst8Quest4_Aim
Inst8Quest4_HORDE_Location = Inst8Quest4_Location
Inst8Quest4_HORDE_Note = Inst8Quest4_Note
Inst8Quest4_HORDE_Prequest = Inst8Quest4_Prequest
Inst8Quest4_HORDE_Folgequest = Inst8Quest4_Folgequest
--
Inst8Quest4name1_HORDE = Inst8Quest4name1

--Quest 5 Horde
Inst8Quest5_HORDE = "5. The Pack Mistress"
Inst8Quest5_HORDE_Level = "59"
Inst8Quest5_HORDE_Attain = "55"
Inst8Quest5_HORDE_Aim = "Slay Halycon, pack mistress of the Bloodaxe worg."
Inst8Quest5_HORDE_Location = "Galamav the Marksman (Badlands - Kargath; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest5_HORDE_Note = "You find Halycon at "..YELLOW.."[17]"..WHITE.."."
Inst8Quest5_HORDE_Prequest = "None"
Inst8Quest5_HORDE_Folgequest = "None"
--
Inst8Quest5name1_HORDE = "Astoria Robes"
Inst8Quest5name2_HORDE = "Traphook Jerkin"
Inst8Quest5name3_HORDE = "Jadescale Breastplate"

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst8Quest6_HORDE = Inst8Quest6
Inst8Quest6_HORDE_Level = Inst8Quest6_Level
Inst8Quest6_HORDE_Attain = Inst8Quest6_Attain
Inst8Quest6_HORDE_Aim = Inst8Quest6_Aim
Inst8Quest6_HORDE_Location = Inst8Quest6_Location
Inst8Quest6_HORDE_Note = Inst8Quest6_Note
Inst8Quest6_HORDE_Prequest = Inst8Quest6_Prequest
Inst8Quest6_HORDE_Folgequest = Inst8Quest6_Folgequest
--
Inst8Quest6name1_HORDE = Inst8Quest6name1

--Quest 7 Horde
Inst8Quest7_HORDE = "7. Operative Bijou"
Inst8Quest7_HORDE_Level = "59"
Inst8Quest7_HORDE_Attain = "55"
Inst8Quest7_HORDE_Aim = "Travel to Blackrock Spire and find out what happened to Bijou."
Inst8Quest7_HORDE_Location = "Lexlort (Badlands - Kargath; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest7_HORDE_Note = "You find Bijou at "..YELLOW.."[8]"..WHITE.."."
Inst8Quest7_HORDE_Prequest = "None"
Inst8Quest7_HORDE_Folgequest = "Bijou's Belongings"
-- No Rewards for this quest

--Quest 8 Horde
Inst8Quest8_HORDE = "8. Bijou's Belongings"
Inst8Quest8_HORDE_Level = "59"
Inst8Quest8_HORDE_Attain = "55"
Inst8Quest8_HORDE_Aim = "Find Bijou's Belongings and return them to her. You recall her mentioning that she stashed them on the bottom floor of the city."
Inst8Quest8_HORDE_Location = "Bijou (Blackrock Spire; "..YELLOW.."[3]"..WHITE..")"
Inst8Quest8_HORDE_Note = "You find Bijou's Belongings on the way to Mother Smolderweb at "..YELLOW.."[13]"..WHITE..".\nThe Rewards belong to 'Bijou's Reconnaissance Report'."
Inst8Quest8_HORDE_Prequest = "Operative Bijou"
Inst8Quest8_HORDE_Folgequest = "Bijou's Reconnaissance Report"
Inst8Quest8FQuest_HORDE = "true"
--
Inst8Quest8name1_HORDE = "Freewind Gloves"
Inst8Quest8name2_HORDE = "Seapost Girdle"

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst8Quest9_HORDE = Inst8Quest9
Inst8Quest9_HORDE_Level = Inst8Quest9_Level
Inst8Quest9_HORDE_Attain = Inst8Quest9_Attain
Inst8Quest9_HORDE_Aim = Inst8Quest9_Aim
Inst8Quest9_HORDE_Location = Inst8Quest9_Location
Inst8Quest9_HORDE_Note = Inst8Quest9_Note
Inst8Quest9_HORDE_Prequest = Inst8Quest9_Prequest
Inst8Quest9_HORDE_Folgequest = Inst8Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde
Inst8Quest10_HORDE = "10. Warlord's Command"
Inst8Quest10_HORDE_Level = "60"
Inst8Quest10_HORDE_Attain = "55"
Inst8Quest10_HORDE_Aim = "Slay Highlord Omokk, War Master Voone, and Overlord Wyrmthalak. Recover Important Blackrock Documents. Return to Warlord Goretooth in Kargath when the mission has been accomplished."
Inst8Quest10_HORDE_Location = "Warlord Goretooth (Badlands - Kargath; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest10_HORDE_Note = "You find Highlord Omokk at "..YELLOW.."[5]"..WHITE..", War Master Voone at "..YELLOW.."[9]"..WHITE.." and Overlord Wyrmthalak at "..YELLOW.."[19]"..WHITE..". The Blackrock Documents could appear next to one of these 3 bosses."
Inst8Quest10_HORDE_Prequest = "None"
Inst8Quest10_HORDE_Folgequest = "Eitrigg's Wisdom -> For the Horde! ("..YELLOW.."Upper Blackrock Spire"..WHITE..")"
--
Inst8Quest10name1_HORDE = "Wyrmthalak's Shackles"
Inst8Quest10name2_HORDE = "Omokk's Girth Restrainer"
Inst8Quest10name3_HORDE = "Halycon's Muzzle"
Inst8Quest10name4_HORDE = "Vosh'gajin's Strand"
Inst8Quest10name5_HORDE = "Voone's Vice Grips"

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst8Quest11_HORDE = Inst8Quest11
Inst8Quest11_HORDE_Level = Inst8Quest11_Level
Inst8Quest11_HORDE_Attain = Inst8Quest11_Attain
Inst8Quest11_HORDE_Aim = Inst8Quest11_Aim
Inst8Quest11_HORDE_Location = Inst8Quest11_Location
Inst8Quest11_HORDE_Note = Inst8Quest11_Note
Inst8Quest11_HORDE_Prequest = Inst8Quest11_Prequest
Inst8Quest11_HORDE_Folgequest = Inst8Quest11_Folgequest
Inst8Quest11PreQuest_HORDE = Inst8Quest11PreQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst8Quest12_HORDE = Inst8Quest12
Inst8Quest12_HORDE_Level = Inst8Quest12_Level
Inst8Quest12_HORDE_Attain = Inst8Quest12_Attain
Inst8Quest12_HORDE_Aim = Inst8Quest12_Aim
Inst8Quest12_HORDE_Location = Inst8Quest12_Location
Inst8Quest12_HORDE_Note = Inst8Quest12_Note
Inst8Quest12_HORDE_Prequest = Inst8Quest12_Prequest
Inst8Quest12_HORDE_Folgequest = Inst8Quest12_Folgequest
Inst8Quest12PreQuest_HORDE = Inst8Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst8Quest13_HORDE = Inst8Quest13
Inst8Quest13_HORDE_Level = Inst8Quest13_Level
Inst8Quest13_HORDE_Attain = Inst8Quest13_Attain
Inst8Quest13_HORDE_Aim = Inst8Quest13_Aim
Inst8Quest13_HORDE_Location = Inst8Quest13_Location
Inst8Quest13_HORDE_Note = Inst8Quest13_Note
Inst8Quest13_HORDE_Prequest = Inst8Quest13_Prequest
Inst8Quest13_HORDE_Folgequest = Inst8Quest13_Folgequest
--
Inst8Quest13name1_HORDE = Inst8Quest13name1

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst8Quest14_HORDE = Inst8Quest14
Inst8Quest14_HORDE_Level = Inst8Quest14_Level
Inst8Quest14_HORDE_Attain = Inst8Quest14_Attain
Inst8Quest14_HORDE_Aim = Inst8Quest14_Aim
Inst8Quest14_HORDE_Location = Inst8Quest14_Location
Inst8Quest14_HORDE_Note = Inst8Quest14_Note
Inst8Quest14_HORDE_Prequest = Inst8Quest14_Prequest
Inst8Quest14_HORDE_Folgequest = Inst8Quest14_Folgequest
--
Inst8Quest14name1_HORDE = Inst8Quest14name1
Inst8Quest14name2_HORDE = Inst8Quest14name2


--------------- INST9 - Upper Blackrock Spire (UBRS) ---------------

Inst9Story = "The mighty fortress carved within the fiery bowels of Blackrock Mountain was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths. Realizing that the dwarves were led by the mighty fire elemental, Ragnaros - Nefarian vowed to crush his enemies and claim the whole of Blackrock mountain for himself."
Inst9Caption = "Blackrock Spire (Upper)"
Inst9QAA = "11 Quests"
Inst9QAH = "13 Quests"

--Quest 1 Alliance
Inst9Quest1 = "1. The Matron Protectorate"
Inst9Quest1_Level = "60"
Inst9Quest1_Attain = "57"
Inst9Quest1_Aim = "Travel to Winterspring and find Haleh. Give her Awbee's scale."
Inst9Quest1_Location = "Awbee (Blackrock Spire; "..YELLOW.."[7]"..WHITE..")"
Inst9Quest1_Note = "You find Awbee in the room after the Arena at "..YELLOW.."[7]"..WHITE..". She stands on a jutty.\nHaleh is in Winterspring ("..YELLOW.."54,51"..WHITE.."). Use the portal-sign in the end of the cave to get to her."
Inst9Quest1_Prequest = "None"
Inst9Quest1_Folgequest = "Wrath of the Blue Flight"
-- No Rewards for this quest

--Quest 2 Alliance
Inst9Quest2 = "2. Finkle Einhorn, At Your Service!"
Inst9Quest2_Level = "60"
Inst9Quest2_Attain = "57"
Inst9Quest2_Aim = "Talk to Malyfous Darkhammer in Everlook."
Inst9Quest2_Location = "Finkle Einhorn (Blackrock Spire; "..YELLOW.."[8]"..WHITE..")"
Inst9Quest2_Note = "Finkle Einhorn spawns after skinning The Beast. You find Malyfous at (Winterspring - Everlook; "..YELLOW.."61,38"..WHITE..")."
Inst9Quest2_Prequest = "None"
Inst9Quest2_Folgequest = "Leggings of Arcana, Cap of the Scarlet Savant, Breastplate of Bloodthirst"
-- No Rewards for this quest

--Quest 3 Alliance
Inst9Quest3 = "3. Egg Freezing"
Inst9Quest3_Level = "60"
Inst9Quest3_Attain = "57"
Inst9Quest3_Aim = "Use the Eggscilloscope Prototype on an egg in the Rookery."
Inst9Quest3_Location = "Tinkee Steamboil (Burning Steppes - Flame Crest; "..YELLOW.."65,24"..WHITE..")"
Inst9Quest3_Note = "You find the eggs in the room of Father Flame at "..YELLOW.."[2]"..WHITE.."."
Inst9Quest3_Prequest = "Broodling Essence -> Tinkee Steamboil"
Inst9Quest3_Folgequest = "Egg Collection"
Inst9Quest3PreQuest = "true"
--
Inst9Quest3name1 = "Eggscilloscope"

--Quest 4 Alliance
Inst9Quest4 = "4. Eye of the Emberseer"
Inst9Quest4_Level = "60"
Inst9Quest4_Attain = "55"
Inst9Quest4_Aim = "Bring the Eye of the Emberseer to Duke Hydraxis in Azshara."
Inst9Quest4_Location = "Duke Hydraxis (Azshara; "..YELLOW.."79,73"..WHITE..")"
Inst9Quest4_Note = "You can find Pyroguard Emberseer at "..YELLOW.."[1]"..WHITE..".\n\nAfter patch 3.0.8, you can no longer start this questline. If you already have the quest though, you can complete it."
Inst9Quest4_Prequest = "Poisoned Water"
Inst9Quest4_Folgequest = "The Molten Core"
Inst9Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst9Quest5 = "5. General Drakkisath's Demise"
Inst9Quest5_Level = "60"
Inst9Quest5_Attain = "55"
Inst9Quest5_Aim = "Travel to Blackrock Spire and destroy General Drakkisath. Return to Marshal Maxwell when the job is done."
Inst9Quest5_Location = "Marshal Maxwell (Burning Steppes - Morgan's Vigil; "..YELLOW.."82,68"..WHITE..")"
Inst9Quest5_Note = "You find General Drakkisath at "..YELLOW.."[9]"..WHITE.."."
Inst9Quest5_Prequest = "General Drakkisath's Command ("..YELLOW.."Lower Blackrock Spire"..WHITE..")"
Inst9Quest5_Folgequest = "None"
Inst9Quest5PreQuest = "true"
--
Inst9Quest5name1 = "Mark of Tyranny"
Inst9Quest5name2 = "Eye of the Beast"
Inst9Quest5name3 = "Blackhand's Breadth"

--Quest 6 Alliance
Inst9Quest6 = "6. Doomrigger's Clasp"
Inst9Quest6_Level = "60"
Inst9Quest6_Attain = "57"
Inst9Quest6_Aim = "Bring Doomrigger's Clasp to Mayara Brightwing in the Burning Steppes."
Inst9Quest6_Location = "Mayara Brightwing (Burning Steppes - Morgan's Vigil; "..YELLOW.."84,69"..WHITE..")"
Inst9Quest6_Note = "You get the prequest from Count Remington Ridgewell (Stormwind - Stormwind Keep; "..YELLOW.."76.9, 47.4"..WHITE..").\n\nDoomrigger's Clasp is at "..YELLOW.."[3]"..WHITE.." in a chest."
Inst9Quest6_Prequest = "Mayara Brightwing"
Inst9Quest6_Folgequest = "Delivery to Ridgewell"
Inst9Quest6PreQuest = "true"
--
Inst9Quest6name1 = "Swiftfoot Treads"
Inst9Quest6name2 = "Blinkstrike Armguards"

--Quest 7 Alliance
Inst9Quest7 = "7. Blackhand's Command"
Inst9Quest7_Level = "60"
Inst9Quest7_Attain = "55"
Inst9Quest7_Aim = "The letter indicates that General Drakkisath guards the brand. Perhaps you should investigate."
Inst9Quest7_Location = "Blackhand's Command (drops from Scarshield Quartermaster; "..YELLOW.."[7] on Entrance Map"..WHITE..")"
Inst9Quest7_Note = "Blackwing Lair attunement quest. Scarshield Quartermaster is found if you turn right before the LBRS/UBRS portal.\n\nGeneral Drakkisath is at "..YELLOW.."[9]"..WHITE..". The brand is behind him."
Inst9Quest7_Prequest = "None"
Inst9Quest7_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Alliance
Inst9Quest8 = "8. Final Preparations"
Inst9Quest8_Level = "60"
Inst9Quest8_Attain = "58"
Inst9Quest8_Aim = "Gather 40 Blackrock Bracers and acquire a Flask of Supreme Power. Return them to Bodley inside Blackrock Mountain."
Inst9Quest8_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst9Quest8_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest. Blackrock Bracers drop off mobs in Upper and Lower Blackrock Spire and outside the instance. Mobs with 'Blackhand' in the name have a higher chance to drop the bracers. The Flask of Supreme Power is made by an Alchemist."
Inst9Quest8_Prequest = "The Right Piece of Lord Valthalak's Amulet ("..YELLOW.."Upper Blackrock Spire"..WHITE..")"
Inst9Quest8_Folgequest = "Mea Culpa, Lord Valthalak"
Inst9Quest8PreQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst9Quest9 = "9. Mea Culpa, Lord Valthalak"
Inst9Quest9_Level = "60"
Inst9Quest9_Attain = "58"
Inst9Quest9_Aim = "Use the Brazier of Beckoning to summon Lord Valthalak. Dispatch him, and use Lord Valthalak's Amulet on the corpse. Then, return Lord Valthalak's Amulet to the Spirit of Lord Valthalak."
Inst9Quest9_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst9Quest9_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest. Lord Valthalak is summoned at "..YELLOW.."[8]"..WHITE..". Rewards listed are for Return to Bodley."
Inst9Quest9_Prequest = "Final Preparations"
Inst9Quest9_Folgequest = "Return to Bodley"
Inst9Quest9FQuest = "true"
--
Inst9Quest9name1 = "Brazier of Invocation"
Inst9Quest9name2 = "Brazier of Invocation: User's Manual"

--Quest 10 Alliance
Inst9Quest10 = "10. The Demon Forge (Blacksmith)"
Inst9Quest10_Level = "60"
Inst9Quest10_Attain = "55"
Inst9Quest10_Aim = "Travel to Blackrock Spire and find Goraluk Anvilcrack. Slay him and then use the Blood Stained Pike upon his corpse. After his soul has been siphoned, the pike will be Soul Stained. You must also find the Unforged Rune Covered Breastplate. Return both the Soul Stained Pike and the Unforged Rune Covered Breastplate to Lorax in Winterspring."
Inst9Quest10_Location = "Lorax (Winterspring; "..YELLOW.."64,74"..WHITE..")"
Inst9Quest10_Note = "Blacksmith quest. Goraluk Anvilcrack is at "..YELLOW.."[5]"..WHITE.."."
Inst9Quest10_Prequest = "None"
Inst9Quest10_Folgequest = "None"
--
Inst9Quest10name1 = "Plans: Demon Forged Breastplate"
Inst9Quest10name2 = "Elixir of Demonslaying"
Inst9Quest10name3 = "Demon Kissed Sack"

--Quest 11 Alliance
Inst9Quest11 = "11. Egg Collection"
Inst9Quest11_Level = "60"
Inst9Quest11_Attain = "57"
Inst9Quest11_Aim = "Bring 8 Collected Dragon Eggs and the Collectronic Module to Tinkee Steamboil at Flame Crest in the Burning Steppes."
Inst9Quest11_Location = "Tinkee Steamboil (Burning Steppes - Flame Crest; "..YELLOW.."65,24"..WHITE..")"
Inst9Quest11_Note = "You find the eggs in the room of Father Flame at "..YELLOW.."[2]"..WHITE.."."
Inst9Quest11_Prequest = "Egg Freezing"
Inst9Quest11_Folgequest = "Leonid Barthalomew -> Dawn's Gambit ("..YELLOW.."Scholomance"..WHITE..")"
Inst9Quest11PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst9Quest1_HORDE = Inst9Quest1
Inst9Quest1_HORDE_Level = Inst9Quest1_Level
Inst9Quest1_HORDE_Attain = Inst9Quest1_Attain
Inst9Quest1_HORDE_Aim = Inst9Quest1_Aim
Inst9Quest1_HORDE_Location = Inst9Quest1_Location
Inst9Quest1_HORDE_Note = Inst9Quest1_Note
Inst9Quest1_HORDE_Prequest = Inst9Quest1_Prequest
Inst9Quest1_HORDE_Folgequest = Inst9Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst9Quest2_HORDE = Inst9Quest2
Inst9Quest2_HORDE_Level = Inst9Quest2_Level
Inst9Quest2_HORDE_Attain = Inst9Quest2_Attain
Inst9Quest2_HORDE_Aim = Inst9Quest2_Aim
Inst9Quest2_HORDE_Location = Inst9Quest2_Location
Inst9Quest2_HORDE_Note = Inst9Quest2_Note
Inst9Quest2_HORDE_Prequest = Inst9Quest2_Prequest
Inst9Quest2_HORDE_Folgequest = Inst9Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst9Quest3_HORDE = Inst9Quest3
Inst9Quest3_HORDE_Level = Inst9Quest3_Level
Inst9Quest3_HORDE_Attain = Inst9Quest3_Attain
Inst9Quest3_HORDE_Aim = Inst9Quest3_Aim
Inst9Quest3_HORDE_Location = Inst9Quest3_Location
Inst9Quest3_HORDE_Note = Inst9Quest3_Note
Inst9Quest3_HORDE_Prequest = Inst9Quest3_Prequest
Inst9Quest3_HORDE_Folgequest = Inst9Quest3_Folgequest
Inst9Quest3PreQuest_HORDE = Inst9Quest3PreQuest
--
Inst9Quest3name1_HORDE = Inst9Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst9Quest4_HORDE = Inst9Quest4
Inst9Quest4_HORDE_Level = Inst9Quest4_Level
Inst9Quest4_HORDE_Attain = Inst9Quest4_Attain
Inst9Quest4_HORDE_Aim = Inst9Quest4_Aim
Inst9Quest4_HORDE_Location = Inst9Quest4_Location
Inst9Quest4_HORDE_Note = Inst9Quest4_Note
Inst9Quest4_HORDE_Prequest = Inst9Quest4_Prequest
Inst9Quest4_HORDE_Folgequest = Inst9Quest4_Folgequest
Inst9Quest4PreQuest_HORDE = Inst9Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde
Inst9Quest5_HORDE = "5. The Darkstone Tablet"
Inst9Quest5_HORDE_Level = "60"
Inst9Quest5_HORDE_Attain = "57"
Inst9Quest5_HORDE_Aim = "Bring the Darkstone Tablet to Shadow Mage Vivian Lagrave in Kargath.."
Inst9Quest5_HORDE_Location = "Vivian Lagrave (Badlands - Kargath; "..YELLOW.."2,47"..WHITE..")"
Inst9Quest5_HORDE_Note = "You get the prequest from Apothecary Zinge in Undercity - The Apothecarium ("..YELLOW.."50,68"..WHITE..").\n\nThe Darkstone Tablet is at "..YELLOW.."[3]"..WHITE.." in a chest."
Inst9Quest5_HORDE_Prequest = "Vivian Lagrave and the Darkstone Tablet"
Inst9Quest5_HORDE_Folgequest = "None"
Inst9Quest5PreQuest_HORDE = "true"
--
Inst9Quest5name1_HORDE = "Swiftfoot Treads"
Inst9Quest5name2_HORDE = "Blinkstrike Armguards"

--Quest 6 Horde
Inst9Quest6_HORDE = "6. For The Horde!"
Inst9Quest6_HORDE_Level = "60"
Inst9Quest6_HORDE_Attain = "55"
Inst9Quest6_HORDE_Aim = "Travel to Blackrock Spire and slay Warchief Rend Blackhand. Take his head and return to Orgrimmar."
Inst9Quest6_HORDE_Location = "Thrall (Orgrimmar; "..YELLOW.."31,38"..WHITE..")"
Inst9Quest6_HORDE_Note = "You find Warchief Rend Blackhand at "..YELLOW.."[6]"..WHITE.."."
Inst9Quest6_HORDE_Prequest = "Warlord's Command -> Eitrigg's Wisdom"
Inst9Quest6_HORDE_Folgequest = "What the Wind Carries"
Inst9Quest6PreQuest_HORDE = "true"
--
Inst9Quest6name1_HORDE = "Mark of Tyranny"
Inst9Quest6name2_HORDE = "Eye of the Beast"
Inst9Quest6name3_HORDE = "Blackhand's Breadth"

--Quest 7 Horde
Inst9Quest7_HORDE = "7. Oculus Illusions"
Inst9Quest7_HORDE_Level = "60"
Inst9Quest7_HORDE_Attain = "55"
Inst9Quest7_HORDE_Aim = "Travel to Blackrock Spire and collect 20 Black Dragonspawn Eyes. Return to Myranda the Hag when the task is complete."
Inst9Quest7_HORDE_Location = "Myranda the Hag (Western Plaguelands; "..YELLOW.."50,77"..WHITE..")"
Inst9Quest7_HORDE_Note = "Dragonkin drop the eyes."
Inst9Quest7_HORDE_Prequest = "What the Wind Carries -> Mistress of Deception"
Inst9Quest7_HORDE_Folgequest = "Emberstrife"
Inst9Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 8 Horde
Inst9Quest8_HORDE = "8. Blood of the Black Dragon Champion"
Inst9Quest8_HORDE_Level = "60"
Inst9Quest8_HORDE_Attain = "55"
Inst9Quest8_HORDE_Aim = "Travel to Blackrock Spire and slay General Drakkisath. Gather his blood and return it to Rokaro."
Inst9Quest8_HORDE_Location = "Rokaro (Desolace - Shadowprey Village; "..YELLOW.."25,71"..WHITE..")"
Inst9Quest8_HORDE_Note = "Last part of the Onyxia prequest. You find General Drakkisath at "..YELLOW.."[9]"..WHITE.."."
Inst9Quest8_HORDE_Prequest = "Emberstrife -> Ascension..."
Inst9Quest8_HORDE_Folgequest = "None"
Inst9Quest8FQuest_HORDE = "true"
--
Inst9Quest8name1_HORDE = "Drakefire Amulet"

--Quest 9 Horde  (same as Quest 7 Alliance)
Inst9Quest9_HORDE = "9. Blackhand's Command"
Inst9Quest9_HORDE_Level = Inst9Quest7_Level
Inst9Quest9_HORDE_Attain = Inst9Quest7_Attain
Inst9Quest9_HORDE_Aim = Inst9Quest7_Aim
Inst9Quest9_HORDE_Location = Inst9Quest7_Location
Inst9Quest9_HORDE_Note = Inst9Quest7_Note
Inst9Quest9_HORDE_Prequest = Inst9Quest7_Prequest
Inst9Quest9_HORDE_Folgequest = Inst9Quest7_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 8 Alliance)
Inst9Quest10_HORDE = "10. Final Preparations"
Inst9Quest10_HORDE_Level = Inst9Quest8_Level
Inst9Quest10_HORDE_Attain = Inst9Quest8_Attain
Inst9Quest10_HORDE_Aim = Inst9Quest8_Aim
Inst9Quest10_HORDE_Location = Inst9Quest8_Location
Inst9Quest10_HORDE_Note = Inst9Quest8_Note
Inst9Quest10_HORDE_Prequest = Inst9Quest8_Prequest
Inst9Quest10_HORDE_Folgequest = Inst9Quest8_Folgequest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 9 Alliance)
Inst9Quest11_HORDE = "11. Mea Culpa, Lord Valthalak"
Inst9Quest11_HORDE_Level = Inst9Quest9_Level
Inst9Quest11_HORDE_Attain = Inst9Quest9_Attain
Inst9Quest11_HORDE_Aim = Inst9Quest9_Aim
Inst9Quest11_HORDE_Location = Inst9Quest9_Location
Inst9Quest11_HORDE_Note = Inst9Quest9_Note
Inst9Quest11_HORDE_Prequest = Inst9Quest9_Prequest
Inst9Quest11_HORDE_Folgequest = Inst9Quest9_Folgequest
--
Inst9Quest11name1_HORDE = Inst9Quest9name1
Inst9Quest11name2_HORDE = Inst9Quest9name2

--Quest 12 Horde  (same as Quest 10 Alliance)
Inst9Quest12_HORDE = "12. The Demon Forge"
Inst9Quest12_HORDE_Level = Inst9Quest10_Level
Inst9Quest12_HORDE_Attain = Inst9Quest10_Attain
Inst9Quest12_HORDE_Aim = Inst9Quest10_Aim
Inst9Quest12_HORDE_Location = Inst9Quest10_Location
Inst9Quest12_HORDE_Note = Inst9Quest10_Note
Inst9Quest12_HORDE_Prequest = Inst9Quest10_Prequest
Inst9Quest12_HORDE_Folgequest = Inst9Quest10_Folgequest
--
Inst9Quest12name1_HORDE = Inst9Quest10name1
Inst9Quest12name2_HORDE = Inst9Quest10name2
Inst9Quest12name3_HORDE = Inst9Quest10name3

--Quest 13 Horde  (same as Quest 11 Alliance)
Inst9Quest13_HORDE = "13. Egg Collection"
Inst9Quest13_HORDE_Level = Inst9Quest11_Level
Inst9Quest13_HORDE_Attain = Inst9Quest11_Attain
Inst9Quest13_HORDE_Aim = Inst9Quest11_Aim
Inst9Quest13_HORDE_Location = Inst9Quest11_Location
Inst9Quest13_HORDE_Note = Inst9Quest11_Note
Inst9Quest13_HORDE_Prequest = Inst9Quest11_Prequest
Inst9Quest13_HORDE_Folgequest = Inst9Quest11_Folgequest
Inst9Quest13PreQuest_HORDE = Inst9Quest11PreQuest
-- No Rewards for this quest



--------------- INST10 - Dire Maul East (DM) ---------------

Inst10Story = "Built twelve thousand years ago by a covert sect of night elf sorcerers, the ancient city of Eldre'Thalas was used to protect Queen Azshara's most prized arcane secrets. Though it was ravaged by the Great Sundering of the world, much of the wondrous city still stands as the imposing Dire Maul. The ruins' three distinct districts have been overrun by all manner of creatures - especially the spectral highborne, foul satyr and brutish ogres. Only the most daring party of adventurers can enter this broken city and face the ancient evils locked within its ancient vaults."
Inst10Caption = "Dire Maul (East)"
Inst10QAA = "6 Quests"
Inst10QAH = "6 Quests"

--Quest 1 Alliance
Inst10Quest1 = "1. Pusillin and the Elder Azj'Tordin"
Inst10Quest1_Level = "58"
Inst10Quest1_Attain = "54"
Inst10Quest1_Aim = "Travel to Dire Maul and locate the Imp, Pusillin. Convince Pusillin to give you Azj'Tordin's Book of Incantations through any means necessary.\nReturn to Azj'Tordin at the Lariss Pavilion in Feralas should you recover the Book of Incantations."
Inst10Quest1_Location = "Azj'Tordin (Feralas - Lariss Pavillion; "..YELLOW.."76,37"..WHITE..")"
Inst10Quest1_Note = "Pusillin is in Dire Maul "..YELLOW.."East"..WHITE.." at "..YELLOW.."[1]"..WHITE..". He runs when you talk to him, but stops and fights at "..YELLOW.."[2]"..WHITE..". He'll drop the Crescent Key which is used for Dire Maul North and West."
Inst10Quest1_Prequest = "None"
Inst10Quest1_Folgequest = "None"
--
Inst10Quest1name1 = "Spry Boots"
Inst10Quest1name2 = "Sprinter's Sword"

--Quest 2 Alliance
Inst10Quest2 = "2. Lethtendris's Web"
Inst10Quest2_Level = "57"
Inst10Quest2_Attain = "54"
Inst10Quest2_Aim = "Bring Lethtendris' Web to Latronicus Moonspear at the Feathermoon Stronghold in Feralas."
Inst10Quest2_Location = "Latronicus Moonspear (Feralas - Feathermoon Stronghold; "..YELLOW.."30,46"..WHITE..")"
Inst10Quest2_Note = "Lethtendris is in Dire Maul "..YELLOW.."East"..WHITE.." at "..YELLOW.."[3]"..WHITE..". The prequest comes from Courier Hammerfall in Ironforge. He roams the entire city."
Inst10Quest2_Prequest = "Feathermoon Stronghold"
Inst10Quest2_Folgequest = "None"
Inst10Quest2PreQuest = "true"
--
Inst10Quest2name1 = "Lorespinner"

--Quest 3 Alliance
Inst10Quest3 = "3. Shards of the Felvine"
Inst10Quest3_Level = "60"
Inst10Quest3_Attain = "56"
Inst10Quest3_Aim = "Find the Felvine in Dire Maul and acquire a shard from it. Chances are you'll only be able to procure one with the demise of Alzzin the Wildshaper. Use the Reliquary of Purity to securely seal the shard inside, and return it to Rabine Saturna in Nighthaven, Moonglade."
Inst10Quest3_Location = "Rabine Saturna (Moonglade - Nighthaven; "..YELLOW.."51,44"..WHITE..")"
Inst10Quest3_Note = "You find Alliz the Wildshaper in the "..YELLOW.."East"..WHITE.." part of Dire Maul at "..YELLOW.."[5]"..WHITE..". The relict is in Silithius at "..YELLOW.."62,54"..WHITE..". The prequest comes from Rabine Saturna as well."
Inst10Quest3_Prequest = "A Reliquary of Purity"
Inst10Quest3_Folgequest = "None"
Inst10Quest3PreQuest = "true"
--
Inst10Quest3name1 = "Milli's Shield"
Inst10Quest3name2 = "Milli's Lexicon"

--Quest 4 Alliance
Inst10Quest4 = "4. The Left Piece of Lord Valthalak's Amulet"
Inst10Quest4_Level = "60"
Inst10Quest4_Attain = "58"
Inst10Quest4_Aim = "Use the Brazier of Beckoning to summon forth the spirit of Isalien and slay her. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning."
Inst10Quest4_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst10Quest4_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nIsalien is summoned at "..YELLOW.."[5]"..WHITE.."."
Inst10Quest4_Prequest = "Components of Importance"
Inst10Quest4_Folgequest = "I See Alcaz Island In Your Future..."
Inst10Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst10Quest5 = "5. The Right Piece of Lord Valthalak's Amulet"
Inst10Quest5_Level = "60"
Inst10Quest5_Attain = "58"
Inst10Quest5_Aim = "Use the Brazier of Beckoning to summon forth the spirit of Isalien and slay him. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning."
Inst10Quest5_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst10Quest5_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nIsalien is summoned at "..YELLOW.."[5]"..WHITE.."."
Inst10Quest5_Prequest = "More Components of Importance"
Inst10Quest5_Folgequest = "Final Preparations ("..YELLOW.."Upper Blackrock Spire"..WHITE..")"
Inst10Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst10Quest6 = "6. The Prison's Bindings (Warlock)"
Inst10Quest6_Level = "60"
Inst10Quest6_Attain = "60"
Inst10Quest6_Aim = "Travel to Dire Maul in Feralas and recover 15 Satyr Blood from the Wildspawn Satyr that inhabit the Warpwood Quarter. Return to Daio in the Tainted Scar when this is done."
Inst10Quest6_Location = "Daio the Decrepit (Blasted Lands - The Tainted Scar; "..YELLOW.."34,50"..WHITE..")"
Inst10Quest6_Note = "This along with another quest given by Daio the Decrepit are Warlock only quests for the Ritual of Doom spell. The easiest way to get to the Wildspawn Satyr is to enter Dire Maul East through the 'back door' at the Lariss Pavilion (Feralas; "..YELLOW.."77,37"..WHITE.."). You'll need the Crescent Key, however."
Inst10Quest6_Prequest = "None"
Inst10Quest6_Folgequest = "None"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst10Quest1_HORDE = Inst10Quest1
Inst10Quest1_HORDE_Level = Inst10Quest1_Level
Inst10Quest1_HORDE_Attain = Inst10Quest1_Attain
Inst10Quest1_HORDE_Aim = Inst10Quest1_Aim
Inst10Quest1_HORDE_Location = Inst10Quest1_Location
Inst10Quest1_HORDE_Note = Inst10Quest1_Note
Inst10Quest1_HORDE_Prequest = Inst10Quest1_Prequest
Inst10Quest1_HORDE_Folgequest = Inst10Quest1_Folgequest
--
Inst10Quest1name1_HORDE = Inst10Quest1name1
Inst10Quest1name2_HORDE = Inst10Quest1name2

--Quest 2 Horde
Inst10Quest2_HORDE = "2. Lethtendris's Web"
Inst10Quest2_HORDE_Level = "57"
Inst10Quest2_HORDE_Attain = "54"
Inst10Quest2_HORDE_Aim = "Bring Lethtendris's Web to Talo Thornhoof at Camp Mojache in Feralas."
Inst10Quest2_HORDE_Location = "Talo Thornhoof (Feralas - Camp Mojache; "..YELLOW.."76,43"..WHITE..")"
Inst10Quest2_HORDE_Note = "Lethtendris is in Dire Maul "..YELLOW.."East"..WHITE.." at "..YELLOW.."[3]"..WHITE..". The prequest comes from Warcaller Gorlach in Orgrimmar. He roams the entire city."
Inst10Quest2_HORDE_Prequest = "Camp Mojache"
Inst10Quest2_HORDE_Folgequest = "None"
Inst10Quest2PreQuest_HORDE = "true"
--
Inst10Quest2name1_HORDE = "Lorespinner"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst10Quest3_HORDE = Inst10Quest3
Inst10Quest3_HORDE_Level = Inst10Quest3_Level
Inst10Quest3_HORDE_Attain = Inst10Quest3_Attain
Inst10Quest3_HORDE_Aim = Inst10Quest3_Aim
Inst10Quest3_HORDE_Location = Inst10Quest3_Location
Inst10Quest3_HORDE_Note = Inst10Quest3_Note
Inst10Quest3_HORDE_Prequest = Inst10Quest3_Prequest
Inst10Quest3_HORDE_Folgequest = Inst10Quest3_Folgequest
--
Inst10Quest3name1_HORDE = Inst10Quest3name1
Inst10Quest3name2_HORDE = Inst10Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst10Quest4_HORDE = Inst10Quest4
Inst10Quest4_HORDE_Level = Inst10Quest4_Level
Inst10Quest4_HORDE_Attain = Inst10Quest4_Attain
Inst10Quest4_HORDE_Aim = Inst10Quest4_Aim
Inst10Quest4_HORDE_Location = Inst10Quest4_Location
Inst10Quest4_HORDE_Note = Inst10Quest4_Note
Inst10Quest4_HORDE_Prequest = Inst10Quest4_Prequest
Inst10Quest4_HORDE_Folgequest = Inst10Quest4_Folgequest
Inst10Quest4PreQuest_HORDE = Inst10Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst10Quest5_HORDE = Inst10Quest5
Inst10Quest5_HORDE_Level = Inst10Quest5_Level
Inst10Quest5_HORDE_Attain = Inst10Quest5_Attain
Inst10Quest5_HORDE_Aim = Inst10Quest5_Aim
Inst10Quest5_HORDE_Location = Inst10Quest5_Location
Inst10Quest5_HORDE_Note = Inst10Quest5_Note
Inst10Quest5_HORDE_Prequest = Inst10Quest5_Prequest
Inst10Quest5_HORDE_Folgequest = Inst10Quest5_Folgequest
Inst10Quest5PreQuest_HORDE = Inst10Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst10Quest6_HORDE = Inst10Quest6
Inst10Quest6_HORDE_Level = Inst10Quest6_Level
Inst10Quest6_HORDE_Attain = Inst10Quest6_Attain
Inst10Quest6_HORDE_Aim = Inst10Quest6_Aim
Inst10Quest6_HORDE_Location = Inst10Quest6_Location
Inst10Quest6_HORDE_Note = Inst10Quest6_Note
Inst10Quest6_HORDE_Prequest = Inst10Quest6_Prequest
Inst10Quest6_HORDE_Folgequest = Inst10Quest6_Folgequest
-- No Rewards for this quest



--------------- INST11 - Dire Maul North (DM) ---------------

Inst11Story = "Built twelve thousand years ago by a covert sect of night elf sorcerers, the ancient city of Eldre'Thalas was used to protect Queen Azshara's most prized arcane secrets. Though it was ravaged by the Great Sundering of the world, much of the wondrous city still stands as the imposing Dire Maul. The ruins' three distinct districts have been overrun by all manner of creatures - especially the spectral highborne, foul satyr and brutish ogres. Only the most daring party of adventurers can enter this broken city and face the ancient evils locked within its ancient vaults."
Inst11Caption = "Dire Maul (North)"
Inst11QAA = "5 Quests"
Inst11QAH = "5 Quests"

--Quest 1 Alliance
Inst11Quest1 = "1. A Broken Trap"
Inst11Quest1_Level = "60"
Inst11Quest1_Attain = "56"
Inst11Quest1_Aim = "Repair the trap."
Inst11Quest1_Location = "A Broken Trap (Dire Maul; "..YELLOW.."North"..WHITE..")"
Inst11Quest1_Note = "Repeatable quest. To repair the trap you have to use a [Thorium Widget] and a [Frost Oil]."
Inst11Quest1_Prequest = "None"
Inst11Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst11Quest2 = "2. The Gordok Ogre Suit"
Inst11Quest2_Level = "60"
Inst11Quest2_Attain = "56"
Inst11Quest2_Aim = "Bring 4 Bolts of Runecloth, 8 Rugged Leather, 2 Rune Threads, and Ogre Tannin to Knot Thimblejack. He is currently chained inside the Gordok wing of Dire Maul."
Inst11Quest2_Location = "Knot Thimblejack (Dire Maul; "..YELLOW.."North, [4]"..WHITE..")"
Inst11Quest2_Note = "Repeatable quest. You get the Ogre Tannin near "..YELLOW.."[4] (above)"..WHITE.."."
Inst11Quest2_Prequest = "None"
Inst11Quest2_Folgequest = "None"
--
Inst11Quest2name1 = "Gordok Ogre Suit"

--Quest 3 Alliance
Inst11Quest3 = "3. Free Knot!"
Inst11Quest3_Level = "60"
Inst11Quest3_Attain = "60"
Inst11Quest3_Aim = "Collect a Gordok Shackle Key for Knot Thimblejack."
Inst11Quest3_Location = "Knot Thimblejack (Dire Maul; "..YELLOW.."North, [4]"..WHITE..")"
Inst11Quest3_Note = "Repeatable quest. Every warden can drop the key."
Inst11Quest3_Prequest = "None"
Inst11Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst11Quest4 = "4. Unfinished Gordok Business"
Inst11Quest4_Level = "60"
Inst11Quest4_Attain = "56"
Inst11Quest4_Aim = "Find the Gauntlet of Gordok Might and return it to Captain Kromcrush in Dire Maul.\nAccording to Kromcrush, the 'old timey story' says that Tortheldrin - a 'creepy' elf who called himself a prince - stole it from one of the Gordok kings."
Inst11Quest4_Location = "Captain Kromcrush (Dire Maul; "..YELLOW.."North, [5]"..WHITE..")"
Inst11Quest4_Note = "Prince is in Dire Maul "..YELLOW.."West"..WHITE.." at "..YELLOW.."[7]"..WHITE..". The Gauntlet is near him in a chest. You can only get this quest after a Tribute run and have the It's Good to be King! buff."
Inst11Quest4_Prequest = "None"
Inst11Quest4_Folgequest = "None"
--
Inst11Quest4name1 = "Gordok's Handwraps"
Inst11Quest4name2 = "Gordok's Gloves"
Inst11Quest4name3 = "Gordok's Gauntlets"
Inst11Quest4name4 = "Gordok's Handguards"

--Quest 5 Alliance
Inst11Quest5 = "5. The Gordok Taste Test"
Inst11Quest5_Level = "60"
Inst11Quest5_Attain = "60"
Inst11Quest5_Aim = "Free Booze."
Inst11Quest5_Location = "Stomper Kreeg (Dire Maul; "..YELLOW.."North, [2]"..WHITE..")"
Inst11Quest5_Note = "Just talk to the NPC to accept and complete the quest at the same time."
Inst11Quest5_Prequest = "No"
Inst11Quest5_Folgequest = "No"
--
Inst11Quest5name1 = "Gordok Green Grog"
Inst11Quest5name2 = "Kreeg's Stout Beatdown"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst11Quest1_HORDE = Inst11Quest1
Inst11Quest1_HORDE_Level = Inst11Quest1_Level
Inst11Quest1_HORDE_Attain = Inst11Quest1_Attain
Inst11Quest1_HORDE_Aim = Inst11Quest1_Aim
Inst11Quest1_HORDE_Location = Inst11Quest1_Location
Inst11Quest1_HORDE_Note = Inst11Quest1_Note
Inst11Quest1_HORDE_Prequest = Inst11Quest1_Prequest
Inst11Quest1_HORDE_Folgequest = Inst11Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst11Quest2_HORDE = Inst11Quest2
Inst11Quest2_HORDE_Level = Inst11Quest2_Level
Inst11Quest2_HORDE_Attain = Inst11Quest2_Attain
Inst11Quest2_HORDE_Aim = Inst11Quest2_Aim
Inst11Quest2_HORDE_Location = Inst11Quest2_Location
Inst11Quest2_HORDE_Note = Inst11Quest2_Note
Inst11Quest2_HORDE_Prequest = Inst11Quest2_Prequest
Inst11Quest2_HORDE_Folgequest = Inst11Quest2_Folgequest
--
Inst11Quest2name1_HORDE = Inst11Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst11Quest3_HORDE = Inst11Quest3
Inst11Quest3_HORDE_Level = Inst11Quest3_Level
Inst11Quest3_HORDE_Attain = Inst11Quest3_Attain
Inst11Quest3_HORDE_Aim = Inst11Quest3_Aim
Inst11Quest3_HORDE_Location = Inst11Quest3_Location
Inst11Quest3_HORDE_Note = Inst11Quest3_Note
Inst11Quest3_HORDE_Prequest = Inst11Quest3_Prequest
Inst11Quest3_HORDE_Folgequest = Inst11Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst11Quest4_HORDE = Inst11Quest4
Inst11Quest4_HORDE_Level = Inst11Quest4_Level
Inst11Quest4_HORDE_Attain = Inst11Quest4_Attain
Inst11Quest4_HORDE_Aim = Inst11Quest4_Aim
Inst11Quest4_HORDE_Location = Inst11Quest4_Location
Inst11Quest4_HORDE_Note = Inst11Quest4_Note
Inst11Quest4_HORDE_Prequest = Inst11Quest4_Prequest
Inst11Quest4_HORDE_Folgequest = Inst11Quest4_Folgequest
--
Inst11Quest4name1_HORDE = Inst11Quest4name1
Inst11Quest4name2_HORDE = Inst11Quest4name2
Inst11Quest4name3_HORDE = Inst11Quest4name3
Inst11Quest4name4_HORDE = Inst11Quest4name4

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst11Quest5_HORDE = Inst11Quest5
Inst11Quest5_HORDE_Level = Inst11Quest5_Level
Inst11Quest5_HORDE_Attain = Inst11Quest5_Attain
Inst11Quest5_HORDE_Aim = Inst11Quest5_Aim
Inst11Quest5_HORDE_Location = Inst11Quest5_Location
Inst11Quest5_HORDE_Note = Inst11Quest5_Note
Inst11Quest5_HORDE_Prequest = Inst11Quest5_Prequest
Inst11Quest5_HORDE_Folgequest = Inst11Quest5_Folgequest
--
Inst11Quest5name1_HORDE = Inst11Quest5name1
Inst11Quest5name2_HORDE = Inst11Quest5name2



--------------- INST12 - Dire Maul West (DM) ---------------

Inst12Story = "Built twelve thousand years ago by a covert sect of night elf sorcerers, the ancient city of Eldre'Thalas was used to protect Queen Azshara's most prized arcane secrets. Though it was ravaged by the Great Sundering of the world, much of the wondrous city still stands as the imposing Dire Maul. The ruins' three distinct districts have been overrun by all manner of creatures - especially the spectral highborne, foul satyr and brutish ogres. Only the most daring party of adventurers can enter this broken city and face the ancient evils locked within its ancient vaults."
Inst12Caption = "Dire Maul (West)"
Inst12QAA = "17 Quests"
Inst12QAH = "17 Quests"

--Quest 1 Alliance
Inst12Quest1 = "1. Elven Legends"
Inst12Quest1_Level = "60"
Inst12Quest1_Attain = "54"
Inst12Quest1_Aim = "Search Dire Maul for Kariel Winthalus. Report back to Scholar Runethorn at Feathermoon with whatever information that you may find."
Inst12Quest1_Location = "Scholar Runethorn (Feralas - Feathermoon Stronghold; "..YELLOW.."31,43"..WHITE..")"
Inst12Quest1_Note = "You find Kariel Winthalus in the "..YELLOW.."Library (West)"..WHITE.."."
Inst12Quest1_Prequest = "None"
Inst12Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst12Quest2 = "2. The Madness Within"
Inst12Quest2_Level = "60"
Inst12Quest2_Attain = "56"
Inst12Quest2_Aim = "You must destroy the guardians surrounding the 5 Pylons that power the Prison of Immol'thar. Once the Pylons have powered down, the force field surrounding Immol'thar will have dissipated.\nEnter the Prison of Immol'thar and eradicate the foul demon that stands at its heart. Finally, confront Prince Tortheldrin in Athenaeum."
Inst12Quest2_Location = "Shen'dralar Ancient (Dire Maul; "..YELLOW.."West, [1] (above)"..WHITE..")"
Inst12Quest2_Note = "The Pylons are marked as "..BLUE.."[B]"..WHITE..". Immol'thar is at "..YELLOW.."[6]"..WHITE..", Prince Tortheldrin at "..YELLOW.."[7]"..WHITE.."."
Inst12Quest2_Prequest = "None"
Inst12Quest2_Folgequest = "The Treasure of the Shen'dralar"
-- No Rewards for this quest

--Quest 3 Alliance
Inst12Quest3 = "3. The Treasure of the Shen'dralar"
Inst12Quest3_Level = "60"
Inst12Quest3_Attain = "56"
Inst12Quest3_Aim = "Return to the Athenaeum and find the Treasure of the Shen'dralar. Claim your reward!"
Inst12Quest3_Location = "Shen'dralar Ancient (Dire Maul; "..YELLOW.."West, [1]"..WHITE..")"
Inst12Quest3_Note = "You can find the Treasure under the stairs "..YELLOW.."[7]"..WHITE.."."
Inst12Quest3_Prequest = "The Madness Within"
Inst12Quest3_Folgequest = "None"
Inst12Quest3FQuest = "true"
--
Inst12Quest3name1 = "Sedge Boots"
Inst12Quest3name2 = "Backwood Helm"
Inst12Quest3name3 = "Bonecrusher"

--Quest 4 Alliance
Inst12Quest4 = "4. Dreadsteed of Xoroth (Warlock)"
Inst12Quest4_Level = "60"
Inst12Quest4_Attain = "60"
Inst12Quest4_Aim = "Read Mor'zul's Instructions. Summon a Xorothian Dreadsteed, defeat it, then bind its spirit to you."
Inst12Quest4_Location = "Mor'zul Bloodbringer (Burning Steppes; "..YELLOW.."12,31"..WHITE..")"
Inst12Quest4_Note = "Final Quest in the Warlock Epic mount questline. First you must shut down all Pylons marked with "..BLUE.."[B]"..WHITE.." and then kill Immol'thar at "..YELLOW.."[6]"..WHITE..". After that, you can begin the Summoning Ritual. Be sure to have upwards of 20 Soul Shards ready and have one Warlock specifically assigned to keeping the Bell, Candle and Wheel up. The Doomguards that come can be enslaved. After completion, talk to the Dreadsteed ghost to complete the quest."
Inst12Quest4_Prequest = "Imp Delivery ("..YELLOW.."Scholomance"..WHITE..")"
Inst12Quest4_Folgequest = "None"
Inst12Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst12Quest5 = "5. The Emerald Dream... (Druid)"
Inst12Quest5_Level = "60"
Inst12Quest5_Attain = "54"
Inst12Quest5_Aim = "Return the book to its rightful owners."
Inst12Quest5_Location = "The Emerald Dream (randomly drops off bosses in all Dire Maul wings)"
Inst12Quest5_Note = "The reward is for Druids. You turn the book in to Lorekeeper Javon at the "..YELLOW.."1' Library"..WHITE.."."
Inst12Quest5_Prequest = "None"
Inst12Quest5_Folgequest = "None"
--
Inst12Quest5name1 = "Royal Seal of Eldre'Thalas"

--Quest 6 Alliance
Inst12Quest6 = "6. The Greatest Race of Hunters (Hunter)"
Inst12Quest6_Level = "60"
Inst12Quest6_Attain = "54"
Inst12Quest6_Aim = "Return the book to its rightful owners."
Inst12Quest6_Location = "The Greatest Race of Hunters (randomly drops off bosses in all Dire Maul wings)"
Inst12Quest6_Note = "The reward is for Hunters. You turn the book in to Lorekeeper Mykos at the "..YELLOW.."1' Library"..WHITE.."."
Inst12Quest6_Prequest = "None"
Inst12Quest6_Folgequest = "None"
--
Inst12Quest6name1 = "Royal Seal of Eldre'Thalas"

--Quest 7 Alliance
Inst12Quest7 = "7. The Arcanist's Cookbook (Mage)"
Inst12Quest7_Level = "60"
Inst12Quest7_Attain = "54"
Inst12Quest7_Aim = "Return the book to its rightful owners."
Inst12Quest7_Location = "The Arcanist's Cookbook (randomly drops off bosses in all Dire Maul wings)"
Inst12Quest7_Note = "The reward is for Mages. You turn the book in to Lorekeeper Kildrath at the "..YELLOW.."1' Library"..WHITE.."."
Inst12Quest7_Prequest = "None"
Inst12Quest7_Folgequest = "None"
--
Inst12Quest7name1 = "Royal Seal of Eldre'Thalas"

--Quest 8 Alliance
Inst12Quest8 = "8. The Light and How To Swing It (Paladin)"
Inst12Quest8_Level = "60"
Inst12Quest8_Attain = "54"
Inst12Quest8_Aim = "Return the book to its rightful owners."
Inst12Quest8_Location = "The Light and How To Swing It (randomly drops off bosses in all Dire Maul wings)"
Inst12Quest8_Note = "The reward is for Paladins. You turn the book in to Lorekeeper Mykos at the "..YELLOW.."1' Library"..WHITE.."."
Inst12Quest8_Prequest = "None"
Inst12Quest8_Folgequest = "None"
--
Inst12Quest8name1 = "Royal Seal of Eldre'Thalas"

--Quest 9 Alliance
Inst12Quest9 = "9. Holy Bologna: What the Light Won't Tell You (Priest)"
Inst12Quest9_Level = "60"
Inst12Quest9_Attain = "54"
Inst12Quest9_Aim = "Return the book to its rightful owners."
Inst12Quest9_Location = "Holy Bologna: What the Light Won't Tell You (randomly drops off bosses in all Dire Maul wings)"
Inst12Quest9_Note = "The reward is for Priests. You turn the book in to Lorekeeper Javon at the "..YELLOW.."1' Library"..WHITE.."."
Inst12Quest9_Prequest = "None"
Inst12Quest9_Folgequest = "None"
--
Inst12Quest9name1 = "Royal Seal of Eldre'Thalas"

--Quest 10 Alliance
Inst12Quest10 = "10. Garona: A Study on Stealth and Treachery (Rogue)"
Inst12Quest10_Level = "60"
Inst12Quest10_Attain = "54"
Inst12Quest10_Aim = "Return the book to its rightful owners."
Inst12Quest10_Location = "Garona: A Study on Stealth and Treachery (randomly drops off bosses in all Dire Maul wings)"
Inst12Quest10_Note = "The reward is for Rogues. You turn the book in to Lorekeeper Kildrath at the "..YELLOW.."1' Library"..WHITE.."."
Inst12Quest10_Prequest = "None"
Inst12Quest10_Folgequest = "None"
--
Inst12Quest10name1 = "Royal Seal of Eldre'Thalas"

--Quest 11 Alliance
Inst12Quest11 = "11. Frost Shock and You (Shaman)"
Inst12Quest11_Level = "60"
Inst12Quest11_Attain = "54"
Inst12Quest11_Aim = "Return the book to its rightful owners."
Inst12Quest11_Location = "Frost Shock and You (randomly drops off bosses in all Dire Maul wings)"
Inst12Quest11_Note = "Shaman quest. You turn the book in to Lorekeeper Javon at the "..YELLOW.."1' Library"..WHITE.."."
Inst12Quest11_Prequest = "None"
Inst12Quest11_Folgequest = "None"
--
Inst12Quest11name1 = "Royal Seal of Eldre'Thalas"

--Quest 12 Alliance
Inst12Quest12 = "12. Harnessing Shadows (Warlock)"
Inst12Quest12_Level = "60"
Inst12Quest12_Attain = "54"
Inst12Quest12_Aim = "Return the book to its rightful owners."
Inst12Quest12_Location = "Harnessing Shadows (randomly drops off bosses in all Dire Maul wings)"
Inst12Quest12_Note = "Warlock quest. You turn the book in to Lorekeeper Mykos at the "..YELLOW.."1' Library"..WHITE.."."
Inst12Quest12_Prequest = "None"
Inst12Quest12_Folgequest = "None"
--
Inst12Quest12name1 = "Royal Seal of Eldre'Thalas"

--Quest 13 Alliance
Inst12Quest13 = "13. Codex of Defense (Warrior)"
Inst12Quest13_Level = "60"
Inst12Quest13_Attain = "54"
Inst12Quest13_Aim = "Return the book to its rightful owners."
Inst12Quest13_Location = "Codex of Defense (randomly drops off bosses in all Dire Maul wings)"
Inst12Quest13_Note = "Warrior quest. You turn the book in to Lorekeeper Kildrath at the "..YELLOW.."1' Library"..WHITE.."."
Inst12Quest13_Prequest = "None"
Inst12Quest13_Folgequest = "None"
--
Inst12Quest13name1 = "Royal Seal of Eldre'Thalas"

--Quest 14 Alliance
Inst12Quest14 = "14. Libram of Focus"
Inst12Quest14_Level = "60"
Inst12Quest14_Attain = "54"
Inst12Quest14_Aim = "Bring a Libram of Focus, 1 Pristine Black Diamond, 4 Large Brilliant Shards, and 2 Skin of Shadow to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Focus."
Inst12Quest14_Location = "Lorekeeper Lydros (Dire Maul West; "..YELLOW.."[1'] Library"..WHITE..")"
Inst12Quest14_Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\n\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Skin of Shadow is Soulbound and can drop off some bosses, Risen Constructs and Risen Bonewarder in "..YELLOW.."Scholomance"..WHITE.."."
Inst12Quest14_Prequest = "None"
Inst12Quest14_Folgequest = "None"
--
Inst12Quest14name1 = "Arcanum of Focus"

--Quest 15 Alliance
Inst12Quest15 = "15. Libram of Protection"
Inst12Quest15_Level = "60"
Inst12Quest15_Attain = "54"
Inst12Quest15_Aim = "Bring a Libram of Protection, 1 Pristine Black Diamond, 2 Large Brilliant Shards, and 1 Frayed Abomination Stitching to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Protection."
Inst12Quest15_Location = "Lorekeeper Lydros (Dire Maul West; "..YELLOW.."[1'] Library"..WHITE..")"
Inst12Quest15_Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\n\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Frayed Abomination Stitching is Soulbound and can drop off Ramstein the Gorger, Venom Belchers, Bile Spewer and Patchwork Horror in "..YELLOW.."Stratholme"..WHITE.."."
Inst12Quest15_Prequest = "None"
Inst12Quest15_Folgequest = "None"
--
Inst12Quest15name1 = "Arcanum of Protection"

--Quest 16 Alliance
Inst12Quest16 = "16. Libram of Rapidity"
Inst12Quest16_Level = "60"
Inst12Quest16_Attain = "54"
Inst12Quest16_Aim = "Bring a Libram of Rapidity, 1 Pristine Black Diamond, 2 Large Brilliant Shards, and 2 Blood of Heroes to Lorekeeper Lydros in Dire Maul to receive an Arcanum of Rapidity."
Inst12Quest16_Location = "Lorekeeper Lydros (Dire Maul West; "..YELLOW.."[1'] Library"..WHITE..")"
Inst12Quest16_Note = "It's not a prequest, but Elven Legends must be completed before this quest can be started.\n\nThe Libram is a random drop in Dire Maul and is tradeable, so it may be found on the Auction House. Blood of Heroes is Soulbound and can be found on the ground in random places in the Western and Eastern Plaguelands."
Inst12Quest16_Prequest = "None"
Inst12Quest16_Folgequest = "None"
--
Inst12Quest16name1 = "Arcanum of Rapidity"

--Quest 17 Alliance
Inst12Quest17 = "17. Foror's Compendium (Warrior, Paladin)"
Inst12Quest17_Level = "60"
Inst12Quest17_Attain = "60"
Inst12Quest17_Aim = "Return Foror's Compendium of Dragon Slaying to the Athenaeum."
Inst12Quest17_Location = "Foror's Compendium of Dragon Slaying (random boss drop in "..YELLOW.."Dire Maul"..WHITE..")"
Inst12Quest17_Note = "Warrior or Paladin quest. It turns in to Lorekeeper Lydros at (Dire Maul West; "..YELLOW.."[1'] Library"..WHITE.."). Turning this in allows you to start the quest for Quel'Serrar.\n\nAs of patch 3.2.2, you can no longer complete this questline unless you've already started it."
Inst12Quest17_Prequest = "None"
Inst12Quest17_Folgequest = "The Forging of Quel'Serrar"
-- No Rewards for this quest


--Quest 1 Horde
Inst12Quest1_HORDE = "1. Elven Legends"
Inst12Quest1_HORDE_Level = "60"
Inst12Quest1_HORDE_Attain = "54"
Inst12Quest1_HORDE_Aim = "Search Dire Maul for Kariel Winthalus. Report back to Sage Korolusk at Camp Mojache with whatever information that you may find."
Inst12Quest1_HORDE_Location = "Sage Korolusk (Feralas - Camp Mojache; "..YELLOW.."74,43"..WHITE..")"
Inst12Quest1_HORDE_Note = "You find Kariel Winthalus in the "..YELLOW.."Library (West)"..WHITE.."."
Inst12Quest1_HORDE_Prequest = "None"
Inst12Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst12Quest2_HORDE = Inst12Quest2
Inst12Quest2_HORDE_Level = Inst12Quest2_Level
Inst12Quest2_HORDE_Attain = Inst12Quest2_Attain
Inst12Quest2_HORDE_Aim = Inst12Quest2_Aim
Inst12Quest2_HORDE_Location = Inst12Quest2_Location
Inst12Quest2_HORDE_Note = Inst12Quest2_Note
Inst12Quest2_HORDE_Prequest = Inst12Quest2_Prequest
Inst12Quest2_HORDE_Folgequest = Inst12Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst12Quest3_HORDE = Inst12Quest3
Inst12Quest3_HORDE_Level = Inst12Quest3_Level
Inst12Quest3_HORDE_Attain = Inst12Quest3_Attain
Inst12Quest3_HORDE_Aim = Inst12Quest3_Aim
Inst12Quest3_HORDE_Location = Inst12Quest3_Location
Inst12Quest3_HORDE_Note = Inst12Quest3_Note
Inst12Quest3_HORDE_Prequest = Inst12Quest3_Prequest
Inst12Quest3_HORDE_Folgequest = Inst12Quest3_Folgequest
Inst12Quest3FQuest_HORDE = "true"
--
Inst12Quest3name1_HORDE = Inst12Quest3name1
Inst12Quest3name2_HORDE = Inst12Quest3name2
Inst12Quest3name3_HORDE = Inst12Quest3name3

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst12Quest4_HORDE = Inst12Quest4
Inst12Quest4_HORDE_Level = Inst12Quest4_Level
Inst12Quest4_HORDE_Attain = Inst12Quest4_Attain
Inst12Quest4_HORDE_Aim = Inst12Quest4_Aim
Inst12Quest4_HORDE_Location = Inst12Quest4_Location
Inst12Quest4_HORDE_Note = Inst12Quest4_Note
Inst12Quest4_HORDE_Prequest = Inst12Quest4_Prequest
Inst12Quest4_HORDE_Folgequest = Inst12Quest4_Folgequest
Inst12Quest4PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst12Quest5_HORDE = Inst12Quest5
Inst12Quest5_HORDE_Level = Inst12Quest5_Level
Inst12Quest5_HORDE_Attain = Inst12Quest5_Attain
Inst12Quest5_HORDE_Aim = Inst12Quest5_Aim
Inst12Quest5_HORDE_Location = Inst12Quest5_Location
Inst12Quest5_HORDE_Note = Inst12Quest5_Note
Inst12Quest5_HORDE_Prequest = Inst12Quest5_Prequest
Inst12Quest5_HORDE_Folgequest = Inst12Quest5_Folgequest
--
Inst12Quest5name1_HORDE = Inst12Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst12Quest6_HORDE = Inst12Quest6
Inst12Quest6_HORDE_Level = Inst12Quest6_Level
Inst12Quest6_HORDE_Attain = Inst12Quest6_Attain
Inst12Quest6_HORDE_Aim = Inst12Quest6_Aim
Inst12Quest6_HORDE_Location = Inst12Quest6_Location
Inst12Quest6_HORDE_Note = Inst12Quest6_Note
Inst12Quest6_HORDE_Prequest = Inst12Quest6_Prequest
Inst12Quest6_HORDE_Folgequest = Inst12Quest6_Folgequest
--
Inst12Quest6name1_HORDE = Inst12Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst12Quest7_HORDE = Inst12Quest7
Inst12Quest7_HORDE_Level = Inst12Quest7_Level
Inst12Quest7_HORDE_Attain = Inst12Quest7_Attain
Inst12Quest7_HORDE_Aim = Inst12Quest7_Aim
Inst12Quest7_HORDE_Location = Inst12Quest7_Location
Inst12Quest7_HORDE_Note = Inst12Quest7_Note
Inst12Quest7_HORDE_Prequest = Inst12Quest7_Prequest
Inst12Quest7_HORDE_Folgequest = Inst12Quest7_Folgequest
--
Inst12Quest7name1_HORDE = Inst12Quest7name1

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst12Quest8_HORDE = Inst12Quest8
Inst12Quest8_HORDE_Level = Inst12Quest8_Level
Inst12Quest8_HORDE_Attain = Inst12Quest8_Attain
Inst12Quest8_HORDE_Aim = Inst12Quest8_Aim
Inst12Quest8_HORDE_Location = Inst12Quest8_Location
Inst12Quest8_HORDE_Note = Inst12Quest8_Note
Inst12Quest8_HORDE_Prequest = Inst12Quest8_Prequest
Inst12Quest8_HORDE_Folgequest = Inst12Quest8_Folgequest
--
Inst12Quest8name1_HORDE = Inst12Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst12Quest9_HORDE = Inst12Quest9
Inst12Quest9_HORDE_Level = Inst12Quest9_Level
Inst12Quest9_HORDE_Attain = Inst12Quest9_Attain
Inst12Quest9_HORDE_Aim = Inst12Quest9_Aim
Inst12Quest9_HORDE_Location = Inst12Quest9_Location
Inst12Quest9_HORDE_Note = Inst12Quest9_Note
Inst12Quest9_HORDE_Prequest = Inst12Quest9_Prequest
Inst12Quest9_HORDE_Folgequest = Inst12Quest9_Folgequest
--
Inst12Quest9name1_HORDE = Inst12Quest9name1

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst12Quest10_HORDE = Inst12Quest10
Inst12Quest10_HORDE_Level = Inst12Quest10_Level
Inst12Quest10_HORDE_Attain = Inst12Quest10_Attain
Inst12Quest10_HORDE_Aim = Inst12Quest10_Aim
Inst12Quest10_HORDE_Location = Inst12Quest10_Location
Inst12Quest10_HORDE_Note = Inst12Quest10_Note
Inst12Quest10_HORDE_Prequest = Inst12Quest10_Prequest
Inst12Quest10_HORDE_Folgequest = Inst12Quest10_Folgequest
--
Inst12Quest10name1_HORDE = Inst12Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst12Quest11_HORDE = Inst12Quest11
Inst12Quest11_HORDE_Level = Inst12Quest11_Level
Inst12Quest11_HORDE_Attain = Inst12Quest11_Attain
Inst12Quest11_HORDE_Aim = Inst12Quest11_Aim
Inst12Quest11_HORDE_Location = Inst12Quest11_Location
Inst12Quest11_HORDE_Note = Inst12Quest11_Note
Inst12Quest11_HORDE_Prequest = Inst12Quest11_Prequest
Inst12Quest11_HORDE_Folgequest = Inst12Quest11_Folgequest
--
Inst12Quest11name1_HORDE = Inst12Quest11name1

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst12Quest12_HORDE = Inst12Quest12
Inst12Quest12_HORDE_Level = Inst12Quest12_Level
Inst12Quest12_HORDE_Attain = Inst12Quest12_Attain
Inst12Quest12_HORDE_Aim = Inst12Quest12_Aim
Inst12Quest12_HORDE_Location = Inst12Quest12_Location
Inst12Quest12_HORDE_Note = Inst12Quest12_Note
Inst12Quest12_HORDE_Prequest = Inst12Quest12_Prequest
Inst12Quest12_HORDE_Folgequest = Inst12Quest12_Folgequest
--
Inst12Quest12name1_HORDE = Inst12Quest12name1

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst12Quest13_HORDE = Inst12Quest13
Inst12Quest13_HORDE_Level = Inst12Quest13_Level
Inst12Quest13_HORDE_Attain = Inst12Quest13_Attain
Inst12Quest13_HORDE_Aim = Inst12Quest13_Aim
Inst12Quest13_HORDE_Location = Inst12Quest13_Location
Inst12Quest13_HORDE_Note = Inst12Quest13_Note
Inst12Quest13_HORDE_Prequest = Inst12Quest13_Prequest
Inst12Quest13_HORDE_Folgequest = Inst12Quest13_Folgequest
--
Inst12Quest13name1_HORDE = Inst12Quest13name1

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst12Quest14_HORDE = Inst12Quest14
Inst12Quest14_HORDE_Level = Inst12Quest14_Level
Inst12Quest14_HORDE_Attain = Inst12Quest14_Attain
Inst12Quest14_HORDE_Aim = Inst12Quest14_Aim
Inst12Quest14_HORDE_Location = Inst12Quest14_Location
Inst12Quest14_HORDE_Note = Inst12Quest14_Note
Inst12Quest14_HORDE_Prequest = Inst12Quest14_Prequest
Inst12Quest14_HORDE_Folgequest = Inst12Quest14_Folgequest
--
Inst12Quest14name1_HORDE = Inst12Quest14name1

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst12Quest15_HORDE = Inst12Quest15
Inst12Quest15_HORDE_Level = Inst12Quest15_Level
Inst12Quest15_HORDE_Attain = Inst12Quest15_Attain
Inst12Quest15_HORDE_Aim = Inst12Quest15_Aim
Inst12Quest15_HORDE_Location = Inst12Quest15_Location
Inst12Quest15_HORDE_Note = Inst12Quest15_Note
Inst12Quest15_HORDE_Prequest = Inst12Quest15_Prequest
Inst12Quest15_HORDE_Folgequest = Inst12Quest15_Folgequest
--
Inst12Quest15name1_HORDE = Inst12Quest15name1

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst12Quest16_HORDE = Inst12Quest16
Inst12Quest16_HORDE_Level = Inst12Quest16_Level
Inst12Quest16_HORDE_Attain = Inst12Quest16_Attain
Inst12Quest16_HORDE_Aim = Inst12Quest16_Aim
Inst12Quest16_HORDE_Location = Inst12Quest16_Location
Inst12Quest16_HORDE_Note = Inst12Quest16_Note
Inst12Quest16_HORDE_Prequest = Inst12Quest16_Prequest
Inst12Quest16_HORDE_Folgequest = Inst12Quest16_Folgequest
--
Inst12Quest16name1_HORDE = Inst12Quest16name1

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst12Quest17_HORDE = Inst12Quest17
Inst12Quest17_HORDE_Level = Inst12Quest17_Level
Inst12Quest17_HORDE_Attain = Inst12Quest17_Attain
Inst12Quest17_HORDE_Aim = Inst12Quest17_Aim
Inst12Quest17_HORDE_Location = Inst12Quest17_Location
Inst12Quest17_HORDE_Note = Inst12Quest17_Note
Inst12Quest17_HORDE_Prequest = Inst12Quest17_Prequest
Inst12Quest17_HORDE_Folgequest = Inst12Quest17_Folgequest
-- No Rewards for this quest



--------------- INST13 - Maraudon (Mara) ---------------

Inst13Story = "Protected by the fierce Maraudine centaur, Maraudon is one of the most sacred sites within Desolace. The great temple/cavern is the burial place of Zaetar, one of two immortal sons born to the demigod, Cenarius. Legend holds that Zaetar and the earth elemental princess, Theradras, sired the misbegotten centaur race. It is said that upon their emergence, the barbaric centaur turned on their father and killed him. Some believe that Theradras, in her grief, trapped Zaetar's spirit within the winding cavern - used its energies for some malign purpose. The subterranean tunnels are populated by the vicious, long-dead ghosts of the Centaur Khans, as well as Theradras' own raging, elemental minions."
Inst13Caption = "Maraudon"
Inst13QAA = "8 Quests"
Inst13QAH = "8 Quests"

--Quest 1 Alliance
Inst13Quest1 = "1. Shadowshard Fragments"
Inst13Quest1_Level = "42"
Inst13Quest1_Attain = "39"
Inst13Quest1_Aim = "Collect 10 Shadowshard Fragments from Maraudon and return them to Archmage Tervosh in Theramore on the coast of Dustwallow Marsh."
Inst13Quest1_Location = "Archmage Tervosh (Dustwallow Marsh - Theramore Isle; "..YELLOW.."66,49"..WHITE..")"
Inst13Quest1_Note = "You get the Shadowshard Fragments from 'Shadowshard Rumbler' or 'Shadowshard Smasher' outside the instance on the Purple side."
Inst13Quest1_Prequest = "None"
Inst13Quest1_Folgequest = "None"
--
Inst13Quest1name1 = "Zealous Shadowshard Pendant"
Inst13Quest1name2 = "Prodigious Shadowshard Pendant"

--Quest 2 Alliance
Inst13Quest2 = "2. Vyletongue Corruption"
Inst13Quest2_Level = "47"
Inst13Quest2_Attain = "41"
Inst13Quest2_Aim = "Fill the Coated Cerulean Vial at the orange crystal pool in Maraudon.\nUse the Filled Cerulean Vial on the Vylestem Vines to force the corrupted Noxxious Scion to emerge.\nHeal 8 plants by killing these Noxxious Scion, then return to Talendria in Nijel's Point."
Inst13Quest2_Location = "Talendria (Desolace - Nijel's Point; "..YELLOW.."68,8"..WHITE..")"
Inst13Quest2_Note = "You can fill the Vial at any pool outside the instance on the Orange side. The plants are in the orange and purple areas inside the instance."
Inst13Quest2_Prequest = "None"
Inst13Quest2_Folgequest = "None"
--
Inst13Quest2name1 = "Woodseed Hoop"
Inst13Quest2name2 = "Sagebrush Girdle"
Inst13Quest2name3 = "Branchclaw Gauntlets"

--Quest 3 Alliance
Inst13Quest3 = "3. Twisted Evils"
Inst13Quest3_Level = "47"
Inst13Quest3_Attain = "41"
Inst13Quest3_Aim = "Collect 25 Theradric Crystal Carvings for Willow in Desolace."
Inst13Quest3_Location = "Willow (Desolace; "..YELLOW.."62,39"..WHITE..")"
Inst13Quest3_Note = "Most mobs in Maraudon drop the Carvings."
Inst13Quest3_Prequest = "None"
Inst13Quest3_Folgequest = "None"
--
Inst13Quest3name1 = "Acumen Robes"
Inst13Quest3name2 = "Sprightring Helm"
Inst13Quest3name3 = "Relentless Chain"
Inst13Quest3name4 = "Hulkstone Pauldrons"

--Quest 4 Alliance
Inst13Quest4 = "4. The Pariah's Instructions"
Inst13Quest4_Level = "48"
Inst13Quest4_Attain = "39"
Inst13Quest4_Aim = "Read the Pariah's Instructions. Afterwards, obtain the Amulet of Union from Maraudon and return it to the Centaur Pariah in southern Desolace."
Inst13Quest4_Location = "Centaur Pariah (Desolace; "..YELLOW.."45,86"..WHITE..")"
Inst13Quest4_Note = "The 5 Kahns (Description for The Pariah's Instructions)"
Inst13Quest4_Page = {2, "You find the Centaur Pariah in the south of desolace. He walks between "..YELLOW.."44,85"..WHITE.." and "..YELLOW.."50,87"..WHITE..".\nFirst, you have to kill the The Nameless Prophet ("..YELLOW.."[A] on Entrance Map"..WHITE.."). You find him before you enter the instance, before the point where you can choose whether you take the purple or the orange entrance. After killing him you must kill the 5 Kahns. You find the first if you choose the way in the middle ("..YELLOW.."[1] on Entrance Map"..WHITE.."). The second is in the purple part of Maraudon but before you enter the instance ("..YELLOW.."[2] on Entrance Map"..WHITE.."). The third is in the orange part before you enter the instance ("..YELLOW.."[3] on Entrance Map"..WHITE.."). The fourth is near "..YELLOW.."[4]"..WHITE.." and the fifth is near  "..YELLOW.."[1]"..WHITE..".", };
Inst13Quest4_Prequest = "None"
Inst13Quest4_Folgequest = "None"
--
Inst13Quest4name1 = "Mark of the Chosen"

--Quest 5 Alliance
Inst13Quest5 = "5. Legends of Maraudon"
Inst13Quest5_Level = "49"
Inst13Quest5_Attain = "41"
Inst13Quest5_Aim = "Recover the two parts of the Scepter of Celebras: the Celebrian Rod and the Celebrian Diamond.\nFind a way to speak with Celebras."
Inst13Quest5_Location = "Cavindra (Desolace - Maraudon; "..YELLOW.."[4] on Entrance Map"..WHITE..")"
Inst13Quest5_Note = "You find Cavindra at the beginning  of the orange part before you enter the instance.\nYou get the Celebrian Rod from Noxxion at "..YELLOW.."[2]"..WHITE..", the Celebrian Diamond from Lord Vyletongue at  "..YELLOW.."[5]"..WHITE..". Celebras is at "..YELLOW.."[7]"..WHITE..". You have to defeat him to be able to talk to him."
Inst13Quest5_Prequest = "None"
Inst13Quest5_Folgequest = "The Scepter of Celebras"
-- No Rewards for this quest

--Quest 6 Alliance
Inst13Quest6 = "6. The Scepter of Celebras"
Inst13Quest6_Level = "49"
Inst13Quest6_Attain = "41"
Inst13Quest6_Aim = "Assist Celebras the Redeemed while he creates the Scepter of Celebras.\nSpeak with him when the ritual is complete."
Inst13Quest6_Location = "Celebras the Redeemed (Maraudon; "..YELLOW.."[7]"..WHITE..")"
Inst13Quest6_Note = "Celebras creates the Scepter. Speak with him after he is finished."
Inst13Quest6_Prequest = "Legends of Maraudon"
Inst13Quest6_Folgequest = "None"
Inst13Quest6FQuest = "true"
--
Inst13Quest6name1 = "Scepter of Celebras"

--Quest 7 Alliance
Inst13Quest7 = "7. Corruption of Earth and Seed"
Inst13Quest7_Level = "51"
Inst13Quest7_Attain = "45"
Inst13Quest7_Aim = "Slay Princess Theradras and return to Keeper Marandis at Nijel's Point in Desolace."
Inst13Quest7_Location = "Keeper Marandis (Desolace - Nijel's Point; "..YELLOW.."63,10"..WHITE..")"
Inst13Quest7_Note = "You find Princess Theradras at "..YELLOW.."[11]"..WHITE.."."
Inst13Quest7_Prequest = "None"
Inst13Quest7_Folgequest = "Seed of Life"
--
Inst13Quest7name1 = "Thrash Blade"
Inst13Quest7name2 = "Resurgence Rod"
Inst13Quest7name3 = "Verdant Keeper's Aim"

--Quest 8 Alliance
Inst13Quest8 = "8. Seed of Life"
Inst13Quest8_Level = "51"
Inst13Quest8_Attain = "39"
Inst13Quest8_Aim = "Seek out Remulos in Moonglade and give him the Seed of Life."
Inst13Quest8_Location = "Zaetar's Spirit (Maraudon; "..YELLOW.."[11]"..WHITE..")"
Inst13Quest8_Note = "Zaetars Ghost appears after killing Princess Theradras "..YELLOW.."[11]"..WHITE..". You find Keeper Remulos at (Moonglade - Shrine of Remulos; "..YELLOW.."36,41"..WHITE..")."
Inst13Quest8_Prequest = "Corruption of Earth and Seed"
Inst13Quest8_Folgequest = "None"
Inst13Quest8FQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst13Quest1_HORDE = "1. Shadowshard Fragments"
Inst13Quest1_HORDE_Level = "42"
Inst13Quest1_HORDE_Attain = "39"
Inst13Quest1_HORDE_Aim = "Collect 10 Shadowshard Fragments from Maraudon and return them to Uthel'nay in Orgrimmar"
Inst13Quest1_HORDE_Location = "Uthel'nay (Orgrimmar - Valley of Spirits; "..YELLOW.."39,86"..WHITE..")"
Inst13Quest1_HORDE_Note = "You get the Shadowshard Fragments from 'Shadowshard Rumbler' or 'Shadowshard Smasher' outside the instance on the Purple side."
Inst13Quest1_HORDE_Prequest = "None"
Inst13Quest1_HORDE_Folgequest = "None"
--
Inst13Quest1name1_HORDE = "Zealous Shadowshard Pendant"
Inst13Quest1name2_HORDE = "Prodigious Shadowshard Pendant"

--Quest 2 Horde
Inst13Quest2_HORDE = "2. Vyletongue Corruption"
Inst13Quest2_HORDE_Level = "47"
Inst13Quest2_HORDE_Attain = "41"
Inst13Quest2_HORDE_Aim = "Fill the Coated Cerulean Vial at the orange crystal pool in Maraudon.\nUse the Filled Cerulean Vial on the Vylestem Vines to force the corrupted Noxxious Scion to emerge.\nHeal 8 plants by killing these Noxxious Scion, then return to Vark Battlescar in Shadowprey Village."
Inst13Quest2_HORDE_Location = "Vark Battlescar (Desolace - Shadowprey Village; "..YELLOW.."23,70"..WHITE..")"
Inst13Quest2_HORDE_Note = "You can fill the Vial at any pool outside the instance on the Orange side. The plants are in the orange and purple areas inside the instance."
Inst13Quest2_HORDE_Prequest = "None"
Inst13Quest2_HORDE_Folgequest = "None"
--
Inst13Quest2name1_HORDE = "Woodseed Hoop"
Inst13Quest2name2_HORDE = "Sagebrush Girdle"
Inst13Quest2name3_HORDE = "Branchclaw Gauntlets"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst13Quest3_HORDE = Inst13Quest3
Inst13Quest3_HORDE_Level = Inst13Quest3_Level
Inst13Quest3_HORDE_Attain = Inst13Quest3_Attain
Inst13Quest3_HORDE_Aim = Inst13Quest3_Aim
Inst13Quest3_HORDE_Location = Inst13Quest3_Location
Inst13Quest3_HORDE_Note = Inst13Quest3_Note
Inst13Quest3_HORDE_Prequest = Inst13Quest3_Prequest
Inst13Quest3_HORDE_Folgequest = Inst13Quest3_Folgequest
--
Inst13Quest3name1_HORDE = Inst13Quest3name1
Inst13Quest3name2_HORDE = Inst13Quest3name2
Inst13Quest3name3_HORDE = Inst13Quest3name3
Inst13Quest3name4_HORDE = Inst13Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst13Quest4_HORDE = Inst13Quest4
Inst13Quest4_HORDE_Level = Inst13Quest4_Level
Inst13Quest4_HORDE_Attain = Inst13Quest4_Attain
Inst13Quest4_HORDE_Aim = Inst13Quest4_Aim
Inst13Quest4_HORDE_Location = Inst13Quest4_Location
Inst13Quest4_HORDE_Note = Inst13Quest4_Note
Inst13Quest4_HORDE_Page = Inst13Quest4_Page
Inst13Quest4_HORDE_Prequest = Inst13Quest4_Prequest
Inst13Quest4_HORDE_Folgequest = Inst13Quest4_Folgequest
--
Inst13Quest4name1_HORDE = Inst13Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst13Quest5_HORDE = Inst13Quest5
Inst13Quest5_HORDE_Level = Inst13Quest5_Level
Inst13Quest5_HORDE_Attain = Inst13Quest5_Attain
Inst13Quest5_HORDE_Aim = Inst13Quest5_Aim
Inst13Quest5_HORDE_Location = Inst13Quest5_Location
Inst13Quest5_HORDE_Note = Inst13Quest5_Note
Inst13Quest5_HORDE_Prequest = Inst13Quest5_Prequest
Inst13Quest5_HORDE_Folgequest = Inst13Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst13Quest6_HORDE = Inst13Quest6
Inst13Quest6_HORDE_Level = Inst13Quest6_Level
Inst13Quest6_HORDE_Attain = Inst13Quest6_Attain
Inst13Quest6_HORDE_Aim = Inst13Quest6_Aim
Inst13Quest6_HORDE_Location = Inst13Quest6_Location
Inst13Quest6_HORDE_Note = Inst13Quest6_Note
Inst13Quest6_HORDE_Prequest = Inst13Quest6_Prequest
Inst13Quest6_HORDE_Folgequest = Inst13Quest6_Folgequest
Inst13Quest6FQuest_HORDE = Inst13Quest6FQuest
--
Inst13Quest6name1_HORDE = Inst13Quest6name1

--Quest 7 Horde
Inst13Quest7_HORDE = "7. Corruption of Earth and Seed"
Inst13Quest7_HORDE_Level = "51"
Inst13Quest7_HORDE_Attain = "45"
Inst13Quest7_HORDE_Aim = "Slay Princess Theradras and return to Selendra near Shadowprey Village in Desolace."
Inst13Quest7_HORDE_Location = "Selendra (Desolace; "..YELLOW.."27,77"..WHITE..")"
Inst13Quest7_HORDE_Note = "You find Princess Theradras at "..YELLOW.."[11]"..WHITE.."."
Inst13Quest7_HORDE_Prequest = "None"
Inst13Quest7_HORDE_Folgequest = "Seed of Life"
--
Inst13Quest7name1_HORDE = "Thrash Blade"
Inst13Quest7name2_HORDE = "Resurgence Rod"
Inst13Quest7name3_HORDE = "Verdant Keeper's Aim"

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst13Quest8_HORDE = Inst13Quest8
Inst13Quest8_HORDE_Level = Inst13Quest8_Level
Inst13Quest8_HORDE_Attain = Inst13Quest8_Attain
Inst13Quest8_HORDE_Aim = Inst13Quest8_Aim
Inst13Quest8_HORDE_Location = Inst13Quest8_Location
Inst13Quest8_HORDE_Note = Inst13Quest8_Note
Inst13Quest8_HORDE_Prequest = Inst13Quest8_Prequest
Inst13Quest8_HORDE_Folgequest = Inst13Quest8_Folgequest
Inst13Quest8FQuest_HORDE = Inst13Quest8FQuest
-- No Rewards for this quest



--------------- INST14 - Molten Core (MC) ---------------

Inst14Story = "The Molten Core lies at the very bottom of Blackrock Depths. It is the heart of Blackrock Mountain and the exact spot where, long ago in a desperate bid to turn the tide of the dwarven civil war, Emperor Thaurissan summoned the elemental Firelord, Ragnaros, into the world. Though the fire lord is incapable of straying far from the blazing Core, it is believed that his elemental minions command the Dark Iron dwarves, who are in the midst of creating armies out of living stone. The burning lake where Ragnaros lies sleeping acts as a rift connecting to the plane of fire, allowing the malicious elementals to pass through. Chief among Ragnaros' agents is Majordomo Executus - for this cunning elemental is the only one capable of calling the Firelord from his slumber."
Inst14Caption = "Molten Core"
Inst14QAA = "6 Quests"
Inst14QAH = "6 Quests"

--Quest 1 Alliance
Inst14Quest1 = "1. The Molten Core"
Inst14Quest1_Level = "60"
Inst14Quest1_Attain = "58"
Inst14Quest1_Aim = "Kill 1 Fire Lord, 1 Molten Giant, 1 Ancient Core Hound and 1 Lava Surger, then return to Duke Hydraxis in Azshara."
Inst14Quest1_Location = "Duke Hydraxis (Azshara; "..YELLOW.."79,73"..WHITE..")"
Inst14Quest1_Note = "These are non-bosses inside Molten Core.\n\nAfter patch 3.0.8, you can no longer start this questline. If you already have the quest though, you can complete it."
Inst14Quest1_Prequest = "Eye of the Emberseer ("..YELLOW.."Upper Blackrock Spire"..WHITE..")"
Inst14Quest1_Folgequest = "Agent of Hydraxis"
Inst14Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst14Quest2 = "2. Hands of the Enemy"
Inst14Quest2_Level = "60"
Inst14Quest2_Attain = "55"
Inst14Quest2_Aim = "Bring the Hands of Lucifron, Sulfuron, Gehennas and Shazzrah to Duke Hydraxis in Azshara."
Inst14Quest2_Location = "Duke Hydraxis (Azshara; "..YELLOW.."79,73"..WHITE..")"
Inst14Quest2_Note = "Lucifron is at "..YELLOW.."[1]"..WHITE..", Sulfuron is at "..YELLOW.."[8]"..WHITE..", Gehennas is at "..YELLOW.."[3]"..WHITE.." and Shazzrah is at "..YELLOW.."[5]"..WHITE..".\nRewards listed are for the followup, 'A Hero's Reward'. After patch 3.0.8, you can no longer start this questline. If you already have the quest though, you can complete it."
Inst14Quest2_Prequest = "Eye of the Emberseer -> Agent of Hydraxis"
Inst14Quest2_Folgequest = "A Hero's Reward"
Inst14Quest2FQuest = "true"
--
Inst14Quest2name1 = "Ocean's Breeze"
Inst14Quest2name2 = "Tidal Loop"

--Quest 3 Alliance
Inst14Quest3 = "3. Thunderaan the Windseeker"
Inst14Quest3_Level = "60"
Inst14Quest3_Attain = "60"
Inst14Quest3_Aim = "To free Thunderaan the Windseeker from his prison, you must present the right and left halves of the Bindings of the Windseeker, 10 bars of Elementium, and the Essence of the Firelord to Highlord Demitrian in Silithus."
Inst14Quest3_Location = "Highlord Demitrian (Silithus; "..YELLOW.."22,9"..WHITE..")"
Inst14Quest3_Note = "Part of the Thunderfury, Blessed Blade of the Windseeker questline. It starts after obtaining either the left or right Bindings of the Windseeker from Garr at "..YELLOW.."[4]"..WHITE.." or Baron Geddon at "..YELLOW.."[6]"..WHITE..". Then talk to Highlord Demitrian to start the questline. Essence of the Firelord drops from Ragnaros at "..YELLOW.."[10]"..WHITE..". After turning this part in, Prince Thunderaan is summoned and you must kill him. He's a 40-man raid boss."
Inst14Quest3_Prequest = "Examine the Vessel"
Inst14Quest3_Folgequest = "Rise, Thunderfury!"
Inst14Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst14Quest4 = "4. A Binding Contract"
Inst14Quest4_Level = "60"
Inst14Quest4_Attain = "60"
Inst14Quest4_Aim = "Turn the Thorium Brotherhood Contract in to Lokhtos Darkbargainer if you would like to receive the plans for Sulfuron."
Inst14Quest4_Location = "Lokhtos Darkbargainer (Blackrock Depths; "..YELLOW.."[15]"..WHITE..")"
Inst14Quest4_Note = "You need a Sulfuron Ingot to get the contract from Lokhtos. They drop from Golemagg the Incinerator in Molten Core at "..YELLOW.."[7]"..WHITE.."."
Inst14Quest4_Prequest = "None"
Inst14Quest4_Folgequest = "None"
--
Inst14Quest4name1 = "Plans: Sulfuron Hammer"

--Quest 5 Alliance
Inst14Quest5 = "5. The Ancient Leaf"
Inst14Quest5_Level = "60"
Inst14Quest5_Attain = "60"
Inst14Quest5_Aim = "Find the owner of the Ancient Petrified Leaf."
Inst14Quest5_Location = "Ancient Petrified Leaf (drops from Cache of the Firelord; "..YELLOW.."[9]"..WHITE..")"
Inst14Quest5_Note = "Turns in to Vartrus the Ancient at (Felwood - Irontree Woods; "..YELLOW.."49,24"..WHITE..")."
Inst14Quest5_Prequest = "None"
Inst14Quest5_Folgequest = "Ancient Sinew Wrapped Lamina ("..YELLOW.."Azuregos"..WHITE..")"
-- No Rewards for this quest

--Quest 6 Alliance
Inst14Quest6 = "6. Scrying Goggles? No Problem!"
Inst14Quest6_Level = "60"
Inst14Quest6_Attain = "60"
Inst14Quest6_Aim = "Find Narain's Scrying Goggles and return them to Narain Soothfancy in Tanaris."
Inst14Quest6_Location = "Inconspicuous Crate (Silverpine Forest - Greymane Wall; "..YELLOW.."46.2, 86.6"..WHITE..")"
Inst14Quest6_Note = "As of Patch 3.0.2, the Goggles will drop off any mob in Molten Core. The quest turns in to Narain Soothfancy (Tanaris; "..YELLOW.."65.3, 18.6"..WHITE.."), which is also where the pre-quest is obtained."
Inst14Quest6_Prequest = "Stewvul, Ex-B.F.F."
Inst14Quest6_Folgequest = "None"
Inst14Quest6PreQuest = "true"
--
Inst14Quest6name1 = "Major Rejuvenation Potion"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst14Quest1_HORDE = Inst14Quest1
Inst14Quest1_HORDE_Level = Inst14Quest1_Level
Inst14Quest1_HORDE_Attain = Inst14Quest1_Attain
Inst14Quest1_HORDE_Aim = Inst14Quest1_Aim
Inst14Quest1_HORDE_Location = Inst14Quest1_Location
Inst14Quest1_HORDE_Note = Inst14Quest1_Note
Inst14Quest1_HORDE_Prequest = Inst14Quest1_Prequest
Inst14Quest1_HORDE_Folgequest = Inst14Quest1_Folgequest
Inst14Quest1PreQuest_HORDE = Inst14Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst14Quest2_HORDE = Inst14Quest2
Inst14Quest2_HORDE_Level = Inst14Quest2_Level
Inst14Quest2_HORDE_Attain = Inst14Quest2_Attain
Inst14Quest2_HORDE_Aim = Inst14Quest2_Aim
Inst14Quest2_HORDE_Location = Inst14Quest2_Location
Inst14Quest2_HORDE_Note = Inst14Quest2_Note
Inst14Quest2_HORDE_Prequest = Inst14Quest2_Prequest
Inst14Quest2_HORDE_Folgequest = Inst14Quest2_Folgequest
Inst14Quest2FQuest_HORDE = Inst14Quest2FQuest
--
Inst14Quest2name1_HORDE = Inst14Quest2name1
Inst14Quest2name2_HORDE = Inst14Quest2name2

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst14Quest3_HORDE = Inst14Quest3
Inst14Quest3_HORDE_Level = Inst14Quest3_Level
Inst14Quest3_HORDE_Attain = Inst14Quest3_Attain
Inst14Quest3_HORDE_Aim = Inst14Quest3_Aim
Inst14Quest3_HORDE_Location = Inst14Quest3_Location
Inst14Quest3_HORDE_Note = Inst14Quest3_Note
Inst14Quest3_HORDE_Prequest = Inst14Quest3_Prequest
Inst14Quest3_HORDE_Folgequest = Inst14Quest3_Folgequest
Inst14Quest3PreQuest_HORDE = Inst14Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst14Quest4_HORDE = Inst14Quest4
Inst14Quest4_HORDE_Level = Inst14Quest4_Level
Inst14Quest4_HORDE_Attain = Inst14Quest4_Attain
Inst14Quest4_HORDE_Aim = Inst14Quest4_Aim
Inst14Quest4_HORDE_Location = Inst14Quest4_Location
Inst14Quest4_HORDE_Note = Inst14Quest4_Note
Inst14Quest4_HORDE_Prequest = Inst14Quest4_Prequest
Inst14Quest4_HORDE_Folgequest = Inst14Quest4_Folgequest
--
Inst14Quest4name1_HORDE = Inst14Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst14Quest5_HORDE = Inst14Quest5
Inst14Quest5_HORDE_Level = Inst14Quest5_Level
Inst14Quest5_HORDE_Attain = Inst14Quest5_Attain
Inst14Quest5_HORDE_Aim = Inst14Quest5_Aim
Inst14Quest5_HORDE_Location = Inst14Quest5_Location
Inst14Quest5_HORDE_Note = Inst14Quest5_Note
Inst14Quest5_HORDE_Prequest = Inst14Quest5_Prequest
Inst14Quest5_HORDE_Folgequest = Inst14Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst14Quest6_HORDE = Inst14Quest6
Inst14Quest6_HORDE_Level = Inst14Quest6_Level
Inst14Quest6_HORDE_Attain = Inst14Quest6_Attain
Inst14Quest6_HORDE_Aim = Inst14Quest6_Aim
Inst14Quest6_HORDE_Location = Inst14Quest6_Location
Inst14Quest6_HORDE_Note = Inst14Quest6_Note
Inst14Quest6_HORDE_Prequest = Inst14Quest6_Prequest
Inst14Quest6_HORDE_Folgequest = Inst14Quest6_Folgequest
Inst14Quest6PreQuest_HORDE = Inst14Quest6PreQuest
--
Inst14Quest6name1_HORDE = Inst14Quest6name1



--------------- INST15 - Old Naxxramas ---------------

-- Old Naxxramas (Before Wrath of the Lich King)
-- Now using Inst84 for the new one.



--------------- INST16 - Onyxia's Lair (Ony) ---------------

Inst16Story = "Onyxia is the daughter of the mighty dragon Deathwing, and sister of the scheming Nefarion Lord of Blackrock Spire. It is said that Onyxia delights in corrupting the mortal races by meddling in their political affairs. To this end it is believed that she takes on various humanoid forms and uses her charm and power to influence delicate matters between the different races. Some believe that Onyxia has even assumed an alias once used by her father - the title of the royal House Prestor. When not meddling in mortal concerns, Onyxia resides in a fiery cave below the Dragonmurk, a dismal swamp located within Dustwallow Marsh. There she is guarded by her kin, the remaining members of the insidious Black Dragon Flight."
Inst16Caption = "Onyxias Lair"
Inst16QAA = "3 Quests"
Inst16QAH = "3 Quests"

--Quest 1 Alliance
Inst16Quest1 = "1. The Forging of Quel'Serrar"
Inst16Quest1_Level = "60"
Inst16Quest1_Attain = "60"
Inst16Quest1_Aim = "You must get Onyxia to breathe fire on the Unfired Ancient Blade. Once this is done, pick up the now Heated Ancient Blade. Be warned, a Heated Ancient Blade will not remain heated forever - time is of the essence."
Inst16Quest1_Location = "Lorekeeper Lydros (Dire Maul West; "..YELLOW.."[1] Library"..WHITE..")"
Inst16Quest1_Note = "Drop the Sword in front of Onyxia when she's at 10% to 15% health. She'll have to breathe on and heat it. When Onyxia dies, pick the sword back up, click her corpse and use the sword. Then you're ready to turn in the quest.\n\nAs of patch 3.2.2, you can no longer complete this questline unless you've already started it."
Inst16Quest1_Prequest = "Foror's Compendium ("..YELLOW.."Dire Maul West"..WHITE..") -> The Forging of Quel'Serrar"
Inst16Quest1_Folgequest = "None"
Inst16Quest1PreQuest = "true"
--
Inst16Quest1name1 = "Quel'Serrar"

--Quest 2 Alliance
Inst16Quest2 = "2. Victory for the Alliance"
Inst16Quest2_Level = "60"
Inst16Quest2_Attain = "60"
Inst16Quest2_Aim = "Take the Head of Onyxia to King Varian Wrynn in Stormwind."
Inst16Quest2_Location = "Head of Onyxia (drops from Onyxia; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest2_Note = "King Varian Wrynn is at (Stormwind City - Stormwind Keep; "..YELLOW.."80.0, 38.5"..WHITE.."). Only one person in the raid can loot this item and the quest can be done once per character.\n\nRewards listed are for the followup. As of patch 3.2.2, Onyxia is a level 80 raid and the head for this quest no longer drops."
Inst16Quest2_Prequest = "None"
Inst16Quest2_Folgequest = "Celebrating Good Times"
--
Inst16Quest2name1 = "Onyxia Blood Talisman"
Inst16Quest2name2 = "Dragonslayer's Signet"
Inst16Quest2name3 = "Onyxia Tooth Pendant"

--Quest 3 Alliance
Inst16Quest3 = "3. A Most Puzzling Circumstance"
Inst16Quest3_Level = "80"
Inst16Quest3_Attain = "80"
Inst16Quest3_Aim = "Take the Head of Onyxia to Zardeth of the Black Claw in the basement of the Slaughtered Lamb."
Inst16Quest3_Location = "Head of Onyxia (drops from Onyxia; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest3_Note = "Zardeth of the Black Claw is at (Stormwind City - The Slaughtered Lamb; "..YELLOW.."40.1, 85.1"..WHITE.."). Only one person in the raid can loot this item and the quest can be done once per character."
Inst16Quest3_Prequest = "None"
Inst16Quest3_Folgequest = "None"
--
Inst16Quest3name1 = "Polished Dragonslayer's Signet"
Inst16Quest3name2 = "Sparkling Onyxia Tooth Pendant"
Inst16Quest3name3 = "Purified Onyxia Blood Talisman"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst16Quest1_HORDE = Inst16Quest1
Inst16Quest1_HORDE_Attain = Inst16Quest1_Attain
Inst16Quest1_HORDE_Level = Inst16Quest1_Level
Inst16Quest1_HORDE_Aim = Inst16Quest1_Aim
Inst16Quest1_HORDE_Location = Inst16Quest1_Location
Inst16Quest1_HORDE_Note = Inst16Quest1_Note
Inst16Quest1_HORDE_Prequest = Inst16Quest1_Prequest
Inst16Quest1_HORDE_Folgequest = Inst16Quest1_Folgequest
Inst16Quest1PreQuest_HORDE = Inst16Quest1PreQuest
--
Inst16Quest1name1_HORDE = Inst16Quest1name1

--Quest 2 Horde
Inst16Quest2_HORDE = "2. Victory for the Horde"
Inst16Quest2_HORDE_Level = "60"
Inst16Quest2_HORDE_Attain = "60"
Inst16Quest2_HORDE_Aim = "Take the Head of Onyxia to Thrall in Orgrimmar."
Inst16Quest2_HORDE_Location = "Head of Onyxia (drops from Onyxia; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest2_HORDE_Note = "Thrall is at (Orgrimmar - Valley of Wisdom; "..YELLOW.."31,37"..WHITE.."). Only one person in the raid can loot this item and the quest can be done once per character.\n\nRewards listed are for the followup. As of patch 3.2.2, Onyxia is a level 80 raid and the head for this quest no longer drops."
Inst16Quest2_HORDE_Prequest = "None"
Inst16Quest2_HORDE_Folgequest = "For All To See"
--
Inst16Quest2name1_HORDE = "Onyxia Blood Talisman"
Inst16Quest2name2_HORDE = "Dragonslayer's Signet"
Inst16Quest2name3_HORDE = "Onyxia Tooth Pendant"

--Quest 3 Horde
Inst16Quest3_HORDE = "3. A Most Puzzling Circumstance"
Inst16Quest3_HORDE_Level = "80"
Inst16Quest3_HORDE_Attain = "80"
Inst16Quest3_HORDE_Aim = "Take the Head of Onyxia to Neeru Fireblade in the Cleft of Shadow."
Inst16Quest3_HORDE_Location = "Head of Onyxia (drops from Onyxia; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest3_HORDE_Note = "Neeru Fireblade is at (Orgrimmar - Cleft of Shadow; "..YELLOW.."49.7, 50.5"..WHITE.."). Only one person in the raid can loot this item and the quest can be done once per character."
Inst16Quest3_HORDE_Prequest = "None"
Inst16Quest3_HORDE_Folgequest = "None"
--
Inst16Quest3name1_HORDE = "Polished Dragonslayer's Signet"
Inst16Quest3name2_HORDE = "Sparkling Onyxia Tooth Pendant"
Inst16Quest3name3_HORDE = "Purified Onyxia Blood Talisman"



--------------- INST17 - Razorfen Downs (RFD) ---------------

Inst17Story = "Crafted  from the same mighty vines as Razorfen Kraul, Razorfen Downs is the traditional capital city of the quillboar race. The sprawling, thorn-ridden labyrinth houses a veritable army of loyal quillboar as well as their high priests - the Death's Head tribe. Recently, however, a looming shadow has fallen over the crude den. Agents of the undead Scourge - led by the lich, Amnennar the Coldbringer - have taken control over the quillboar race and turned the maze of thorns into a bastion of undead might. Now the quillboar fight a desperate battle to reclaim their beloved city before Amnennar spreads his control across the Barrens."
Inst17Caption = "Razorfen Downs"
Inst17QAA = "3 Quests"
Inst17QAH = "4 Quests"

--Quest 1 Alliance
Inst17Quest1 = "1. A Host of Evil"
Inst17Quest1_Level = "35"
Inst17Quest1_Attain = "28"
Inst17Quest1_Aim = "Kill 8 Razorfen Battleguard, 8 Razorfen Thornweavers, and 8 Death's Head Cultists and return to Myriam Moonsinger near the entrance to Razorfen Downs."
Inst17Quest1_Location = "Myriam Moonsinger (The Barrens; "..YELLOW.."49,94"..WHITE..")"
Inst17Quest1_Note = "You can find the mobs and the quest giver in the area just before the instance entrance."
Inst17Quest1_Prequest = "None"
Inst17Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst17Quest2 = "2. Extinguishing the Idol"
Inst17Quest2_Level = "37"
Inst17Quest2_Attain = "32"
Inst17Quest2_Aim = "Escort Belnistrasz to the Quilboar's idol in Razorfen Downs. Protect Belnistrasz while he performs the ritual to shut down the idol."
Inst17Quest2_Location = "Belnistrasz (Razorfen Downs; "..YELLOW.."[2]"..WHITE..")"
Inst17Quest2_Note = "The prequest is just you agreeing to help him. Several mobs spawn and attack Belnistrasz as he attempts to shut down the idol. After completing the quest, you can turn the quest in at the brazier in front of the idol."
Inst17Quest2_Prequest = "Scourge of the Downs"
Inst17Quest2_Folgequest = "None"
Inst17Quest2PreQuest = "true"
--
Inst17Quest2name1 = "Dragonclaw Ring"

--Quest 3 Alliance
Inst17Quest3 = "3. Bring the Light"
Inst17Quest3_Level = "37"
Inst17Quest3_Attain = "32"
Inst17Quest3_Aim = "Archbishop Benedictus wants you to slay Amnennar the Coldbringer in Razorfen Downs."
Inst17Quest3_Location = "Archbishop Benedictus (Stormwind - Cathedral of Light; "..YELLOW.."50.0, 45.4"..WHITE..")"
Inst17Quest3_Note = "Amnennar the Coldbringer is the last boss in Razorfen Downs. You can find him at "..YELLOW.."[6]"..WHITE.."."
Inst17Quest3_Prequest = "None"
Inst17Quest3_Folgequest = "None"
--
Inst17Quest3name1 = "Vanquisher's Sword"
Inst17Quest3name2 = "Amberglow Talisman"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst17Quest1_HORDE = Inst17Quest1
Inst17Quest1_HORDE_Level = Inst17Quest1_Level
Inst17Quest1_HORDE_Attain = Inst17Quest1_Attain
Inst17Quest1_HORDE_Aim = Inst17Quest1_Aim
Inst17Quest1_HORDE_Location = Inst17Quest1_Location
Inst17Quest1_HORDE_Note = Inst17Quest1_Note
Inst17Quest1_HORDE_Prequest = Inst17Quest1_Prequest
Inst17Quest1_HORDE_Folgequest = Inst17Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst17Quest2_HORDE = "2. An Unholy Alliance"
Inst17Quest2_HORDE_Level = "36"
Inst17Quest2_HORDE_Attain = "28"
Inst17Quest2_HORDE_Aim = "Bring Ambassador Malcin's Head to Varimathras in the Undercity."
Inst17Quest2_HORDE_Location = "Varimathras (Undercity - Royal Quarter; "..YELLOW.."56,92"..WHITE..")"
Inst17Quest2_HORDE_Note = "The preceding quest can be obtained from the last Boss in Razorfen Kraul. You find Malcin outside (The Barrens; "..YELLOW.."48,92"..WHITE..")."
Inst17Quest2_HORDE_Prequest = "An Unholy Alliance"
Inst17Quest2_HORDE_Folgequest = "None"
Inst17Quest2PreQuest_HORDE = "true"
--
Inst17Quest2name1_HORDE = "Skullbreaker"
Inst17Quest2name2_HORDE = "Nail Spitter"
Inst17Quest2name3_HORDE = "Zealot's Robe"

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst17Quest3_HORDE = "3. Extinguishing the Idol"
Inst17Quest3_HORDE_Level = Inst17Quest2_Level
Inst17Quest3_HORDE_Attain = Inst17Quest2_Attain
Inst17Quest3_HORDE_Aim = Inst17Quest2_Aim
Inst17Quest3_HORDE_Location = Inst17Quest2_Location
Inst17Quest3_HORDE_Note = Inst17Quest2_Note
Inst17Quest3_HORDE_Prequest = Inst17Quest2_Prequest
Inst17Quest3_HORDE_Folgequest = Inst17Quest2_Folgequest
Inst17Quest3PreQuest_HORDE = Inst17Quest2PreQuest
--
Inst17Quest3name1_HORDE = Inst17Quest2name1

--Quest 4 Horde
Inst17Quest4_HORDE = "4. Bring the End"
Inst17Quest4_HORDE_Level = "42"
Inst17Quest4_HORDE_Attain = "37"
Inst17Quest4_HORDE_Aim = "Andrew Brownell wants you to kill Amnennar the Coldbringer and return his skull."
Inst17Quest4_HORDE_Location = "Andrew Brownell (Undercity - The Magic Quarter; "..YELLOW.."72,32"..WHITE..")"
Inst17Quest4_HORDE_Note = "Amnennar the Coldbringer is the last Boss at Razorfen Downs. You can find him at "..YELLOW.."[6]"..WHITE.."."
Inst17Quest4_HORDE_Prequest = "None"
Inst17Quest4_HORDE_Folgequest = "None"
--
Inst17Quest4name1_HORDE = "Vanquisher's Sword"
Inst17Quest4name2_HORDE = "Amberglow Talisman"



--------------- INST18 - Razorfen Kraul (RFK) ---------------

Inst18Story = "Ten thousand years ago - during the War of the Ancients, the mighty demigod, Agamaggan, came forth to battle the Burning Legion. Though the colossal boar fell in combat, his actions helped save Azeroth from ruin. Yet over time, in the areas where his blood fell, massive thorn-ridden vines sprouted from the earth. The quillboar - believed to be the mortal offspring of the mighty god, came to occupy these regions and hold them sacred. The heart of these thorn-colonies was known as the Razorfen. The great mass of Razorfen Kraul was conquered by the old crone, Charlga Razorflank. Under her rule, the shamanistic quillboar stage attacks on rival tribes as well as Horde villages. Some speculate that Charlga has even been negotiating with agents of the Scourge - aligning her unsuspecting tribe with the ranks of the Undead for some insidious purpose."
Inst18Caption = "Razorfen Kraul"
Inst18QAA = "5 Quests"
Inst18QAH = "5 Quests"

--Quest 1 Alliance
Inst18Quest1 = "1. Blueleaf Tubers"
Inst18Quest1_Level = "26"
Inst18Quest1_Attain = "20"
Inst18Quest1_Aim = "In Razorfen Kraul, use the Crate with Holes to summon a Snufflenose Gopher, and use the Command Stick on the gopher to make it search for Tubers. Bring 6 Blueleaf Tubers, the Snufflenose Command Stick and the Crate with Holes to Mebok Mizzyrix in Ratchet."
Inst18Quest1_Location = "Mebok Mizzyrix (The Barrens - Ratchet; "..YELLOW.."62,37"..WHITE..")"
Inst18Quest1_Note = "The Crate, the Stick and the Manual can all be found near Mebok Mizzyrix."
Inst18Quest1_Prequest = "None"
Inst18Quest1_Folgequest = "None"
--
Inst18Quest1name1 = "A Small Container of Gems"

--Quest 2 Alliance
Inst18Quest2 = "2. Mortality Wanes"
Inst18Quest2_Level = "30"
Inst18Quest2_Attain = "25"
Inst18Quest2_Aim = "Find and return Treshala's Pendant to Treshala Fallowbrook in Darnassus."
Inst18Quest2_Location = "Heraltha Fallowbrook (Razorfen Kraul; "..YELLOW.."[8]"..WHITE..")"
Inst18Quest2_Note = "The pendant is a random drop. You must bring back the pendant to Treshala Fallowbrook in Darnassus - Tradesmen Terrace ("..YELLOW.."69,67"..WHITE..")."
Inst18Quest2_Prequest = "None"
Inst18Quest2_Folgequest = "None"
--
Inst18Quest2name1 = "Mourning Shawl"
Inst18Quest2name2 = "Lancer Boots"

--Quest 3 Alliance
Inst18Quest3 = "3. Willix the Importer"
Inst18Quest3_Level = "30"
Inst18Quest3_Attain = "22"
Inst18Quest3_Aim = "Escort Willix the Importer out of Razorfen Kraul."
Inst18Quest3_Location = "Willix the Importer (Razorfen Kraul; "..YELLOW.."[8]"..WHITE..")"
Inst18Quest3_Note = "Willix the Importer must be escorted to the entrance of the instance. The quest is turned in to him when completed."
Inst18Quest3_Prequest = "None"
Inst18Quest3_Folgequest = "None"
--
Inst18Quest3name1 = "Monkey Ring"
Inst18Quest3name2 = "Snake Hoop"
Inst18Quest3name3 = "Tiger Band"

--Quest 4 Alliance
Inst18Quest4 = "4. The Crone of the Kraul"
Inst18Quest4_Level = "27"
Inst18Quest4_Attain = "23"
Inst18Quest4_Aim = "Bring Razorflank's Medallion to Falfindel Waywarder in Thalanaar."
Inst18Quest4_Location = "Falfindel Waywarder (Feralas - Thalanaar; "..YELLOW.."89,46"..WHITE..")"
Inst18Quest4_Note = "Charlga Razorflank "..YELLOW.."[7]"..WHITE.." drops the Medallion required for this quest."
Inst18Quest4_Prequest = "Lonebrow's Journal"
Inst18Quest4_Folgequest = "None"
Inst18Quest4PreQuest = "true"
--
Inst18Quest4name1 = "Falfindel's Blaster"
Inst18Quest4name2 = "Berylline Pads"
Inst18Quest4name3 = "Stonefist Girdle"
Inst18Quest4name4 = "Marbled Buckler"

--Quest 5 Alliance
Inst18Quest5 = "5. Fire Hardened Mail (Warrior)"
Inst18Quest5_Level = "28"
Inst18Quest5_Attain = "20"
Inst18Quest5_Aim = "Gather the materials Furen Longbeard requires, and bring them to him in Stormwind."
Inst18Quest5_Location = "Furen Longbeard (Stormwind - Dwarven District; "..YELLOW.."64.4, 37.3"..WHITE..")"
Inst18Quest5_Note = "This quest can only be obtained by warriors. You get the Vial of Phlogiston from Roogug at "..YELLOW.."[1]"..WHITE..".\n\nThe followup quest is different for each race. Burning Blood for Humans, Iron Coral for Dwarves and Gnomes and Sunscorched Shells for Night Elves."
Inst18Quest5_Prequest = "The Shieldsmith"
Inst18Quest5_Folgequest = "(See Note)"
Inst18Quest5PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst18Quest1_HORDE = Inst18Quest1
Inst18Quest1_HORDE_Level = Inst18Quest1_Level
Inst18Quest1_HORDE_Attain = Inst18Quest1_Attain
Inst18Quest1_HORDE_Aim = Inst18Quest1_Aim
Inst18Quest1_HORDE_Location = Inst18Quest1_Location
Inst18Quest1_HORDE_Note = Inst18Quest1_Note
Inst18Quest1_HORDE_Prequest = Inst18Quest1_Prequest
Inst18Quest1_HORDE_Folgequest = Inst18Quest1_Folgequest
--
Inst18Quest1name1_HORDE = Inst18Quest1name1

--Quest 2 Horde  (same as Quest 3 Alliance)
Inst18Quest2_HORDE = "2. Willix the Importer"
Inst18Quest2_HORDE_Level = Inst18Quest3_Level
Inst18Quest2_HORDE_Attain = Inst18Quest3_Attain
Inst18Quest2_HORDE_Aim = Inst18Quest3_Aim
Inst18Quest2_HORDE_Location = Inst18Quest3_Location
Inst18Quest2_HORDE_Note = Inst18Quest3_Note
Inst18Quest2_HORDE_Prequest = Inst18Quest3_Prequest
Inst18Quest2_HORDE_Folgequest = Inst18Quest3_Folgequest
--
Inst18Quest2name1_HORDE = Inst18Quest3name1
Inst18Quest2name2_HORDE = Inst18Quest3name2
Inst18Quest2name3_HORDE = Inst18Quest3name3

-- Quest 3 Horde
Inst18Quest3_HORDE = "3. Going, Going, Guano!"
Inst18Quest3_HORDE_Level = "26"
Inst18Quest3_HORDE_Attain = "22"
Inst18Quest3_HORDE_Aim = "Bring 1 pile of Kraul Guano to Master Apothecary Faranell in the Undercity."
Inst18Quest3_HORDE_Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..YELLOW.."48,69 "..WHITE..")"
Inst18Quest3_HORDE_Note = "Kraul Guano is dropped by any of the bats found within the instance."
Inst18Quest3_HORDE_Prequest = "None"
Inst18Quest3_HORDE_Folgequest = "Hearts of Zeal ("..YELLOW.."[Scarlet Monastery]"..WHITE..")"
-- No Rewards for this quest

--Quest 4 Horde
Inst18Quest4_HORDE = "4. A Vengeful Fate"
Inst18Quest4_HORDE_Level = "27"
Inst18Quest4_HORDE_Attain = "23"
Inst18Quest4_HORDE_Aim = "Bring Razorflank's Heart to Auld Stonespire in Thunder Bluff."
Inst18Quest4_HORDE_Location = "Auld Stonespire (Thunderbluff; "..YELLOW.."36,59"..WHITE..")"
Inst18Quest4_HORDE_Note = "You can find Charlga Razorflank at "..YELLOW.."[7]"..WHITE.."."
Inst18Quest4_HORDE_Prequest = "None"
Inst18Quest4_HORDE_Folgequest = "None"
--
Inst18Quest4name1_HORDE = "Berylline Pads"
Inst18Quest4name2_HORDE = "Stonefist Girdle"
Inst18Quest4name3_HORDE = "Marbled Buckler"

--Quest 5 Horde
Inst18Quest5_HORDE = "5. Brutal Armor (Warrior)"
Inst18Quest5_HORDE_Level = "30"
Inst18Quest5_HORDE_Attain = "20"
Inst18Quest5_HORDE_Aim = "Bring to Thun'grim Firegaze 15 Smoky Iron Ingots, 10 Powdered Azurite, 10 Iron Bars and a Vial of Phlogiston."
Inst18Quest5_HORDE_Location = "Thun'grim Firegaze (The Barrens; "..YELLOW.."57,30"..WHITE..")"
Inst18Quest5_HORDE_Note = "This quest can only be obtained by warriors. You get the Vial of Phlogiston from Roogug at "..YELLOW.."[1]"..WHITE..".\n\nCompleting this quest allows you to start four new quests from the same NPC."
Inst18Quest5_HORDE_Prequest = "Speak with Thun'grim"
Inst18Quest5_HORDE_Folgequest = "(See Note)"
Inst18Quest5PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST19 - SM: Library (SM Lib) ---------------

Inst19Story = "The Monastery was once a proud bastion of Lordaeron's priesthood - a center for learning and enlightenment. With the rise of the undead Scourge during the Third War, the peaceful Monastery was converted into a stronghold of the fanatical Scarlet Crusade. The Crusaders are intolerant of all non-human races, regardless of alliance or affiliation. They believe that any and all outsiders are potential carriers of the undead plague - and must be destroyed. Reports indicate that adventurers who enter the monastery are forced to contend with Scarlet Commander Mograine - who commands a large garrison of fanatically devoted warriors. However, the monastery's true master is High Inquisitor Whitemane - a fearsome priestess who possesses the ability to resurrect fallen warriors to do battle in her name."
Inst19Caption = "SM: Library"
Inst19QAA = "3 Quests"
Inst19QAH = "5 Quests"

--Quest 1 Alliance
Inst19Quest1 = "1. Mythology of the Titans"
Inst19Quest1_Level = "38"
Inst19Quest1_Attain = "28"
Inst19Quest1_Aim = "Retrieve Mythology of the Titans from the Monastery and bring it to Librarian Mae Paledust in Ironforge."
Inst19Quest1_Location = "Librarian Mae Paledust (Ironforge - Hall of Explorers; "..YELLOW.."74,12"..WHITE..")"
Inst19Quest1_Note = "The book is on the floor on the left side of one of the corridors leading to Arcanist Doan ("..YELLOW.."[2]"..WHITE..")."
Inst19Quest1_Prequest = "None"
Inst19Quest1_Folgequest = "None"
--
Inst19Quest1name1 = "Explorers' League Commendation"

--Quest 2 Alliance
Inst19Quest2 = "2. Rituals of Power (Mage)"
Inst19Quest2_Level = "40"
Inst19Quest2_Attain = "30"
Inst19Quest2_Aim = "Bring the book Rituals of Power to Tabetha in Dustwallow Marsh."
Inst19Quest2_Location = "Tabetha (Dustwallow Marsh; "..YELLOW.."43,57"..WHITE..")"
Inst19Quest2_Note = "This quest can only be obtained by mages. You can find the book in the last corridor leading to Arcanist Doan ("..YELLOW.."[2]"..WHITE..").\n\nThe rewards listed are for the followup."
Inst19Quest2_Prequest = "Journey to the Marsh -> Get the Scoop"
Inst19Quest2_Folgequest = "Mage's Wand"
Inst19Quest2PreQuest = "true"
--
Inst19Quest2name1 = "Icefury Wand"
Inst19Quest2name2 = "Nether Force Wand"
Inst19Quest2name3 = "Ragefire Wand"

--Quest 3 Alliance
Inst19Quest3 = "3. In the Name of the Light"
Inst19Quest3_Level = "40"
Inst19Quest3_Attain = "34"
Inst19Quest3_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore."
Inst19Quest3_Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; "..YELLOW.."51,58"..WHITE..")"
Inst19Quest3_Note = "This quest line starts at Brother Crowley in Stormwind - Cathedral of Light ("..YELLOW.."52.3, 43.1"..WHITE..").\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
Inst19Quest3_Prequest = "Brother Anton -> Down the Scarlet Path"
Inst19Quest3_Folgequest = "None"
Inst19Quest3PreQuest = "true"
--
Inst19Quest3name1 = "Sword of Serenity"
Inst19Quest3name2 = "Bonebiter"
Inst19Quest3name3 = "Black Menace"
Inst19Quest3name4 = "Orb of Lorica"


--Quest 1 Horde
Inst19Quest1_HORDE = "1. Hearts of Zeal"
Inst19Quest1_HORDE_Level = "33"
Inst19Quest1_HORDE_Attain = "30"
Inst19Quest1_HORDE_Aim = "Master Apothecary Faranell in the Undercity wants 20 Hearts of Zeal."
Inst19Quest1_HORDE_Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..YELLOW.."48,69"..WHITE..")"
Inst19Quest1_HORDE_Note = "All mobs inside the Scarlet Monastery drop Hearts of Zeal. This includes the mobs outside the instance by the portals."
Inst19Quest1_HORDE_Prequest = "Going, Going, Guano! ("..YELLOW.."[Razorfen Kraul]"..WHITE..")"
Inst19Quest1_HORDE_Folgequest = "None"
Inst19Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst19Quest2_HORDE = "2. Test of Lore"
Inst19Quest2_HORDE_Level = "36"
Inst19Quest2_HORDE_Attain = "25"
Inst19Quest2_HORDE_Aim = "Find The Beginnings of the Undead Threat, and return it to Parqual Fintallas in Undercity."
Inst19Quest2_HORDE_Location = "Parqual Fintallas (Undercity - The Apothecarium; "..YELLOW.."57,65"..WHITE..")"
Inst19Quest2_HORDE_Note = "Questline starts at Dorn Plainstalker (Thousand Needles; "..YELLOW.."53,41"..WHITE.."). You can find the book in the Library of Scarlet Monastary.\n\nThe rewards listed are for the followup, which just involves talking to the NPC."
Inst19Quest2_HORDE_Prequest = "Test of Faith -> Test of Lore"
Inst19Quest2_HORDE_Folgequest = "Test of Lore"
Inst19Quest2PreQuest_HORDE = "true"
--
Inst19Quest2name1_HORDE = "Windstorm Hammer"
Inst19Quest2name2_HORDE = "Dancing Flame"

--Quest 3 Horde
Inst19Quest3_HORDE = "3. Compendium of the Fallen"
Inst19Quest3_HORDE_Level = "38"
Inst19Quest3_HORDE_Attain = "28"
Inst19Quest3_HORDE_Aim = "Retrieve the Compendium of the Fallen from the Monastery in Tirisfal Glades and return to Sage Truthseeker in Thunder Bluff."
Inst19Quest3_HORDE_Location = "Sage Truthseeker (Thunderbluff; "..YELLOW.."34,47"..WHITE..")"
Inst19Quest3_HORDE_Note = "You can find the book in the Library section of the Scarlet Monastery. For lore reasons, Undead cannot do this quest."
Inst19Quest3_HORDE_Prequest = "None"
Inst19Quest3_HORDE_Folgequest = "None"
--
Inst19Quest3name1_HORDE = "Vile Protector"
Inst19Quest3name2_HORDE = "Forcestone Buckler"
Inst19Quest3name3_HORDE = "Omega Orb"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst19Quest4_HORDE = "4. Rituals of Power (Mage)"
Inst19Quest4_HORDE_Level = Inst19Quest2_Level
Inst19Quest4_HORDE_Attain = Inst19Quest2_Attain
Inst19Quest4_HORDE_Aim = Inst19Quest2_Aim
Inst19Quest4_HORDE_Location = Inst19Quest2_Location
Inst19Quest4_HORDE_Note = Inst19Quest2_Note
Inst19Quest4_HORDE_Prequest = Inst19Quest2_Prequest
Inst19Quest4_HORDE_Folgequest = Inst19Quest2_Folgequest
Inst19Quest4PreQuest_HORDE = Inst19Quest2_PreQuest
--
Inst19Quest4name1_HORDE = Inst19Quest2name1
Inst19Quest4name2_HORDE = Inst19Quest2name2
Inst19Quest4name3_HORDE = Inst19Quest2name3

--Quest 5 Horde
Inst19Quest5_HORDE = "5. Into The Scarlet Monastery"
Inst19Quest5_HORDE_Level = "42"
Inst19Quest5_HORDE_Attain = "33"
Inst19Quest5_HORDE_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Varimathras in the Undercity."
Inst19Quest5_HORDE_Location = "Varimathras (Undercity - Royal Quarter; "..YELLOW.."56,92"..WHITE..")"
Inst19Quest5_HORDE_Note = "You can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
Inst19Quest5_HORDE_Prequest = "None"
Inst19Quest5_HORDE_Folgequest = "None"
--
Inst19Quest5name1_HORDE = "Sword of Omen"
Inst19Quest5name2_HORDE = "Prophetic Cane"
Inst19Quest5name3_HORDE = "Dragon's Blood Necklace"



--------------- INST57 - SM: Armory (SM Arm) ---------------

Inst57Story = "The Monastery was once a proud bastion of Lordaeron's priesthood - a center for learning and enlightenment. With the rise of the undead Scourge during the Third War, the peaceful Monastery was converted into a stronghold of the fanatical Scarlet Crusade. The Crusaders are intolerant of all non-human races, regardless of alliance or affiliation. They believe that any and all outsiders are potential carriers of the undead plague - and must be destroyed. Reports indicate that adventurers who enter the monastery are forced to contend with Scarlet Commander Mograine - who commands a large garrison of fanatically devoted warriors. However, the monastery's true master is High Inquisitor Whitemane - a fearsome priestess who possesses the ability to resurrect fallen warriors to do battle in her name."
Inst57Caption = "SM: Armory"
Inst57QAA = "1 Quest"
Inst57QAH = "2 Quests"

--Quest 1 Alliance
Inst57Quest1 = "1. In the Name of the Light"
Inst57Quest1_Level = "40"
Inst57Quest1_Attain = "34"
Inst57Quest1_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore."
Inst57Quest1_Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; "..YELLOW.."51,58"..WHITE..")"
Inst57Quest1_Note = "This quest line starts at Brother Crowley in Stormwind - Cathedral of Light ("..YELLOW.."52.1, 43.1"..WHITE..").\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
Inst57Quest1_Prequest = "Brother Anton -> Down the Scarlet Path"
Inst57Quest1_Folgequest = "None"
Inst57Quest1PreQuest = "true"
--
Inst57Quest1name1 = "Sword of Serenity"
Inst57Quest1name2 = "Bonebiter"
Inst57Quest1name3 = "Black Menace"
Inst57Quest1name4 = "Orb of Lorica"


--Quest 1 Horde
Inst57Quest1_HORDE = "1. Hearts of Zeal"
Inst57Quest1_HORDE_Level = "33"
Inst57Quest1_HORDE_Attain = "30"
Inst57Quest1_HORDE_Aim = "Master Apothecary Faranell in the Undercity wants 20 Hearts of Zeal."
Inst57Quest1_HORDE_Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..YELLOW.."48,69"..WHITE..")"
Inst57Quest1_HORDE_Note = "All mobs in the Scarlet Monastery drop Hearts of Zeal. This includes the mobs outside the instance by the portals."
Inst57Quest1_HORDE_Prequest = "Going, Going, Guano! ("..YELLOW.."Razorfen Kraul"..WHITE..")"
Inst57Quest1_HORDE_Folgequest = "None"
Inst57Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst57Quest2_HORDE = "2. Into The Scarlet Monastery"
Inst57Quest2_HORDE_Level = "42"
Inst57Quest2_HORDE_Attain = "33"
Inst57Quest2_HORDE_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Varimathras in the Undercity."
Inst57Quest2_HORDE_Location = "Varimathras (Undercity - Royal Quarter; "..YELLOW.."56,92"..WHITE..")"
Inst57Quest2_HORDE_Note = "You can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
Inst57Quest2_HORDE_Prequest = "None"
Inst57Quest2_HORDE_Folgequest = "None"
--
Inst57Quest2name1_HORDE = "Sword of Omen"
Inst57Quest2name2_HORDE = "Prophetic Cane"
Inst57Quest2name3_HORDE = "Dragon's Blood Necklace"



--------------- INST58 - SM: Cathedral (SM Cath) ---------------

Inst58Story = "The Monastery was once a proud bastion of Lordaeron's priesthood - a center for learning and enlightenment. With the rise of the undead Scourge during the Third War, the peaceful Monastery was converted into a stronghold of the fanatical Scarlet Crusade. The Crusaders are intolerant of all non-human races, regardless of alliance or affiliation. They believe that any and all outsiders are potential carriers of the undead plague - and must be destroyed. Reports indicate that adventurers who enter the monastery are forced to contend with Scarlet Commander Mograine - who commands a large garrison of fanatically devoted warriors. However, the monastery's true master is High Inquisitor Whitemane - a fearsome priestess who possesses the ability to resurrect fallen warriors to do battle in her name."
Inst58Caption = "SM: Cathedral"
Inst58QAA = "1 Quest"
Inst58QAH = "2 Quests"

--Quest 1 Alliance
Inst58Quest1 = "1. In the Name of the Light"
Inst58Quest1_Level = "40"
Inst58Quest1_Attain = "34"
Inst58Quest1_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Raleigh the Devout in Southshore."
Inst58Quest1_Location = "Raleigh the Devout (Hillsbrad Foothills - Southshore; "..YELLOW.."51,58"..WHITE..")"
Inst58Quest1_Note = "This quest line starts at Brother Crowley in Stormwind - Cathedral of Light ("..YELLOW.."52.1, 43.1"..WHITE..").\nYou can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
Inst58Quest1_Prequest = "Brother Anton -> Down the Scarlet Path"
Inst58Quest1_Folgequest = "None"
Inst58Quest1PreQuest = "true"
--
Inst58Quest1name1 = "Sword of Serenity"
Inst58Quest1name2 = "Bonebiter"
Inst58Quest1name3 = "Black Menace"
Inst58Quest1name4 = "Orb of Lorica"


--Quest 1 Horde
Inst58Quest1_HORDE = "1. Hearts of Zeal"
Inst58Quest1_HORDE_Level = "33"
Inst58Quest1_HORDE_Attain = "30"
Inst58Quest1_HORDE_Aim = "Master Apothecary Faranell in the Undercity wants 20 Hearts of Zeal."
Inst58Quest1_HORDE_Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..YELLOW.."48,69"..WHITE..")"
Inst58Quest1_HORDE_Note = "All mobs in the Scarlet Monastery drop Hearts of Zeal. This includes the mobs outside the instance by the portals."
Inst58Quest1_HORDE_Prequest = "Going, Going, Guano! ("..YELLOW.."Razorfen Kraul"..WHITE..")"
Inst58Quest1_HORDE_Folgequest = "None"
Inst58Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst58Quest2_HORDE = "2. Into The Scarlet Monastery"
Inst58Quest2_HORDE_Level = "42"
Inst58Quest2_HORDE_Attain = "33"
Inst58Quest2_HORDE_Aim = "Kill High Inquisitor Whitemane, Scarlet Commander Mograine, Herod, the Scarlet Champion and Houndmaster Loksey and then report back to Varimathras in the Undercity."
Inst58Quest2_HORDE_Location = "Varimathras (Undercity - Royal Quarter; "..YELLOW.."56,92"..WHITE..")"
Inst58Quest2_HORDE_Note = "You can find High Inquisitor Whitemane and Scarlet Commander Mograine at "..YELLOW.."SM: Cathedral [2]"..WHITE..", Herod at "..YELLOW.."SM: Armory [1]"..WHITE.." and Houndmaster Loksey at "..YELLOW.."SM: Library [1]"..WHITE.."."
Inst58Quest2_HORDE_Prequest = "None"
Inst58Quest2_HORDE_Folgequest = "None"
--
Inst58Quest2name1_HORDE = "Sword of Omen"
Inst58Quest2name2_HORDE = "Prophetic Cane"
Inst58Quest2name3_HORDE = "Dragon's Blood Necklace"



--------------- INST59 - SM: Graveyard (SM GY) ---------------

Inst59Story = "The Monastery was once a proud bastion of Lordaeron's priesthood - a center for learning and enlightenment. With the rise of the undead Scourge during the Third War, the peaceful Monastery was converted into a stronghold of the fanatical Scarlet Crusade. The Crusaders are intolerant of all non-human races, regardless of alliance or affiliation. They believe that any and all outsiders are potential carriers of the undead plague - and must be destroyed. Reports indicate that adventurers who enter the monastery are forced to contend with Scarlet Commander Mograine - who commands a large garrison of fanatically devoted warriors. However, the monastery's true master is High Inquisitor Whitemane - a fearsome priestess who possesses the ability to resurrect fallen warriors to do battle in her name."
Inst59Caption = "SM: Graveyard"
Inst59QAA = "1 Quest"
Inst59QAH = "3 Quests"

--Quest 1 Alliance
Inst59Quest1 = "1. Call the Headless Horseman (Daily - Seasonal)"
Inst59Quest1_Level = "80"
Inst59Quest1_Attain = "75"
Inst59Quest1_Aim = "Take a Dreary Candle to the Loosely Turned Soil."
Inst59Quest1_Location = "Pumpkin Shrine (Scarlet Monastery - Graveyard; "..YELLOW.."[2]"..WHITE..")"
Inst59Quest1_Note = "The Soil is just a few steps from the Pumpkin Shrine. This quest is only available during the Hallow's End event and can be done once a day per character during that event.\n\nCompleting it summons the Headless Horseman, a level 80 boss."
Inst59Quest1_Prequest = "None"
Inst59Quest1_Folgequest = "None"
-- No Rewards for this quest


--Quest 1 Horde
Inst59Quest1_HORDE = "1. Vorrel's Revenge"
Inst59Quest1_HORDE_Level = "33"
Inst59Quest1_HORDE_Attain = "25"
Inst59Quest1_HORDE_Aim = "Return Vorrel Sengutz's wedding ring to Monika Sengutz in Tarren Mill."
Inst59Quest1_HORDE_Location = "Vorrel Sengutz (Scarlet Monastery - Graveyard; "..YELLOW.."[1]"..WHITE..")"
Inst59Quest1_HORDE_Note = "You can find Vorrel Sengutz at the beginning of the Graveyard section of the Scarlet Monastery. Nancy Vishas, who drops the ring needed for this quest, can be found in a house in the Alterac Mountains ("..YELLOW.."31,32"..WHITE..")."
Inst59Quest1_HORDE_Prequest = "None"
Inst59Quest1_HORDE_Folgequest = "None"
--
Inst59Quest1name1_HORDE = "Vorrel's Boots"
Inst59Quest1name2_HORDE = "Mantle of Woe"
Inst59Quest1name3_HORDE = "Grimsteel Cape"

--Quest 2 Horde
Inst59Quest2_HORDE = "2. Hearts of Zeal"
Inst59Quest2_HORDE_Level = "33"
Inst59Quest2_HORDE_Attain = "30"
Inst59Quest2_HORDE_Aim = "Master Apothecary Faranell in the Undercity wants 20 Hearts of Zeal."
Inst59Quest2_HORDE_Location = "Master Apothecary Faranell (Undercity - The Apothecarium; "..YELLOW.."48,69"..WHITE..")"
Inst59Quest2_HORDE_Note = "All mobs in the Scarlet Monastery drop Hearts of Zeal. This includes the mobs outside the instance by the portals."
Inst59Quest2_HORDE_Prequest = "Going, Going, Guano! ("..YELLOW.."Razorfen Kraul"..WHITE..")"
Inst59Quest2_HORDE_Folgequest = "None"
Inst59Quest2PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst59Quest3_HORDE = "3. Call the Headless Horseman (Daily - Seasonal)"
Inst59Quest3_HORDE_Level = Inst59Quest1_Level
Inst59Quest3_HORDE_Attain = Inst59Quest1_Attain
Inst59Quest3_HORDE_Aim = Inst59Quest1_Aim
Inst59Quest3_HORDE_Location = Inst59Quest1_Location
Inst59Quest3_HORDE_Note = Inst59Quest1_Note
Inst59Quest3_HORDE_Prequest = Inst59Quest1_Prequest
Inst59Quest3_HORDE_Folgequest = Inst59Quest1_Folgequest
-- No Rewards for this quest



--------------- INST20 - Scholomance (Scholo) ---------------

Inst20Story = "The Scholomance is housed within a series of crypts that lie beneath the ruined keep of Caer Darrow. Once owned by the noble Barov family, Caer Darrow fell to ruin following the Second War. As the wizard Kel'thuzad enlisted followers for his Cult of the Damned he would often promise immortality in exchange for serving his Lich King. The Barov family fell to Kel'thuzad's charismatic influence and donated the keep and its crypts to the Scourge. The cultists then killed the Barovs and turned the ancient crypts into a school for necromancy known as the Scholomance. Though Kel'thuzad no longer resides in the crypts, devoted cultists and instructors still remain. The powerful lich, Ras Frostwhisper, rules over the site and guards it in the Scourge's name - while the mortal necromancer, Darkmaster Gandling, serves as the school's insidious headmaster."
Inst20Caption = "Scholomance"
Inst20QAA = "11 Quests"
Inst20QAH = "12 Quests"

--Quest 1 Alliance
Inst20Quest1 = "1. Plagued Hatchlings"
Inst20Quest1_Level = "58"
Inst20Quest1_Attain = "55"
Inst20Quest1_Aim = "Kill 20 Plagued Hatchlings, then return to Betina Bigglezink at the Light's Hope Chapel."
Inst20Quest1_Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."75.6, 53.6"..WHITE..")"
Inst20Quest1_Note = "The Plagued Hatchlings are on the way to Rattlegore in a large room."
Inst20Quest1_Prequest = "None"
Inst20Quest1_Folgequest = "Healthy Dragon Scale"
-- No Rewards for this quest

--Quest 2 Alliance
Inst20Quest2 = "2. Healthy Dragon Scale"
Inst20Quest2_Level = "58"
Inst20Quest2_Attain = "55"
Inst20Quest2_Aim = "Bring the Healthy Dragon Scale to Betina Bigglezink at the Light's Hope Chapel in Eastern Plaguelands."
Inst20Quest2_Location = "Healthy Dragon Scale (random drop in Scholomance)"
Inst20Quest2_Note = "Plagued Hatchlings drop the Healthy Dragon Scales (8% chance to drop). You can find Betina Bigglezink at Eastern Plaguelands - Light's Hope Chapel ("..YELLOW.."75.6, 53.6"..WHITE..")."
Inst20Quest2_Prequest = "Plagued Hatchlings "
Inst20Quest2_Folgequest = "None"
Inst20Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst20Quest3 = "3. Doctor Theolen Krastinov, the Butcher"
Inst20Quest3_Level = "60"
Inst20Quest3_Attain = "55"
Inst20Quest3_Aim = "Find Doctor Theolen Krastinov inside the Scholomance. Destroy him, then burn the Remains of Eva Sarkhoff and the Remains of Lucien Sarkhoff. Return to Eva Sarkhoff when the task is complete."
Inst20Quest3_Location = "Eva Sarkhoff (Western Plaguelands - Caer Darrow; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest3_Note = "You find Doctor Theolen Krastinov, the remains of Eva Sarkhoff and the remains of Lucien Sarkhoff at "..YELLOW.."[9]"..WHITE.."."
Inst20Quest3_Prequest = "None"
Inst20Quest3_Folgequest = "Krastinov's Bag of Horrors"
-- No Rewards for this quest

--Quest 4 Alliance
Inst20Quest4 = "4. Krastinov's Bag of Horrors"
Inst20Quest4_Level = "60"
Inst20Quest4_Attain = "55"
Inst20Quest4_Aim = "Locate Jandice Barov in the Scholomance and destroy her. From her corpse recover Krastinov's Bag of Horrors. Return the bag to Eva Sarkhoff."
Inst20Quest4_Location = "Eva Sarkhoff (Western Plaguelands - Caer Darrow; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest4_Note = "You can find Jandice Barov at "..YELLOW.."[3]"..WHITE.."."
Inst20Quest4_Prequest = "Doctor Theolen Krastinov, the Butcher"
Inst20Quest4_Folgequest = "Kirtonos the Herald"
Inst20Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst20Quest5 = "5. Kirtonos the Herald"
Inst20Quest5_Level = "60"
Inst20Quest5_Attain = "55"
Inst20Quest5_Aim = "Return to the Scholomance with the Blood of Innocents. Find the porch and place the Blood of Innocents in the brazier. Kirtonos will come to feast upon your soul. Fight valiantly, do not give an inch! Destroy Kirtonos and return to Eva Sarkhoff."
Inst20Quest5_Location = "Eva Sarkhoff (Western Plaguelands - Caer Darrow; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest5_Note = "The porch is at "..YELLOW.."[2]"..WHITE.."."
Inst20Quest5_Prequest = "Krastinov's Bag of Horrors"
Inst20Quest5_Folgequest = "The Human, Ras Frostwhisper"
Inst20Quest5FQuest = "true"
--
Inst20Quest5name1 = "Spectral Essence"
Inst20Quest5name2 = "Penelope's Rose"
Inst20Quest5name3 = "Mirah's Song"

--Quest 6 Alliance
Inst20Quest6 = "6. The Lich, Ras Frostwhisper"
Inst20Quest6_Level = "60"
Inst20Quest6_Attain = "57"
Inst20Quest6_Aim = "Find Ras Frostwhisper in the Scholomance. When you have found him, use the Soulbound Keepsake on his undead visage. Should you succeed in reverting him to a mortal, strike him down and recover the Human Head of Ras Frostwhisper. Take the head back to Magistrate Marduke."
Inst20Quest6_Location = "Magistrate Marduke (Western Plaguelands - Caer Darrow; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest6_Note = "You can find Ras Frostwhisper at "..YELLOW.."[7]"..WHITE.."."
Inst20Quest6_Prequest = "The Human, Ras Frostwhisper - > Soulbound Keepsake"
Inst20Quest6_Folgequest = "None"
Inst20Quest6PreQuest = "true"
--
Inst20Quest6name1 = "Darrowshire Strongguard"
Inst20Quest6name2 = "Warblade of Caer Darrow"
Inst20Quest6name3 = "Crown of Caer Darrow"
Inst20Quest6name4 = "Darrowspike"

--Quest 7 Alliance
Inst20Quest7 = "7. Barov Family Fortune"
Inst20Quest7_Level = "60"
Inst20Quest7_Attain = "52"
Inst20Quest7_Aim = "Venture to the Scholomance and recover the Barov family fortune. Four deeds make up this fortune: The Deed to Caer Darrow; The Deed to Brill; The Deed to Tarren Mill; and The Deed to Southshore. Return to Weldon Barov when you have completed this task."
Inst20Quest7_Location = "Weldon Barov (Western Plaguelands - Chillwind Camp; "..YELLOW.."43,83"..WHITE..")"
Inst20Quest7_Note = "You can find The Deed to Caer Darrow at "..YELLOW.."[12]"..WHITE..", The Deed to Brill at "..YELLOW.."[7]"..WHITE..", The Deed to Tarren Mill at "..YELLOW.."[4]"..WHITE.." and The Deed to Southshore at "..YELLOW.."[1]"..WHITE..".\nThe reward listed is for the followup."
Inst20Quest7_Prequest = "None"
Inst20Quest7_Folgequest = "The Last Barov"
--
Inst20Quest7name1 = "Barov Peasant Caller"

--Quest 8 Alliance
Inst20Quest8 = "8. Dawn's Gambit"
Inst20Quest8_Level = "60"
Inst20Quest8_Attain = "57"
Inst20Quest8_Aim = "Place Dawn's Gambit in the Viewing Room of the Scholomance. Defeat Vectus, then return to Betina Bigglezink."
Inst20Quest8_Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."75.6, 53.6"..WHITE..")"
Inst20Quest8_Note = "Broodling Essence begins at Tinkee Steamboil (Burning Steppes - Flame Crest; "..YELLOW.."65,23"..WHITE.."). The Viewing Room is at "..YELLOW.."[6]"..WHITE.."."
Inst20Quest8_Prequest = "Broodling Essence - > Betina Bigglezink"
Inst20Quest8_Folgequest = "None"
Inst20Quest8PreQuest = "true"
--
Inst20Quest8name1 = "Windreaper"
Inst20Quest8name2 = "Dancing Sliver"

--Quest 9 Alliance
Inst20Quest9 = "9. Imp Delivery (Warlock)"
Inst20Quest9_Level = "60"
Inst20Quest9_Attain = "60"
Inst20Quest9_Aim = "Bring the Imp in a Yesr to the alchemy lab in the Scholomance. After the parchment is created, return the jar to Gorzeeki Wildeyes."
Inst20Quest9_Location = "Gorzeeki Wildeyes (Burning Steppes; "..YELLOW.."12,31"..WHITE..")"
Inst20Quest9_Note = "Only Warlocks can get this Quest! You find the alchemy lab at "..YELLOW.."[7]"..WHITE.."."
Inst20Quest9_Prequest = "Mor'zul Bloodbringer - > Xorothian Stardust"
Inst20Quest9_Folgequest = "Dreadsteed of Xoroth ("..YELLOW.."Dire Maul West"..WHITE..")"
Inst20Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst20Quest10 = "10. The Left Piece of Lord Valthalak's Amulet"
Inst20Quest10_Level = "60"
Inst20Quest10_Attain = "58"
Inst20Quest10_Aim = "Use the Brazier of Beckoning to summon forth the spirit of Kormok and slay him. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning."
Inst20Quest10_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst20Quest10_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nKormok is summoned at "..YELLOW.."[7]"..WHITE.."."
Inst20Quest10_Prequest = "Components of Importance"
Inst20Quest10_Folgequest = "I See Alcaz Island In Your Future..."
Inst20Quest10PreQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst20Quest11 = "11. The Right Piece of Lord Valthalak's Amulet"
Inst20Quest11_Level = "60"
Inst20Quest11_Attain = "58"
Inst20Quest11_Aim = "Use the Brazier of Beckoning to summon forth the spirit of Kormok and slay him. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning."
Inst20Quest11_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst20Quest11_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nKormok is summoned at "..YELLOW.."[7]"..WHITE.."."
Inst20Quest11_Prequest = "More Components of Importance"
Inst20Quest11_Folgequest = "Final Preparations ("..YELLOW.."Upper Blackrock Spire"..WHITE..")"
Inst20Quest11PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst20Quest1_HORDE = Inst20Quest1
Inst20Quest1_HORDE_Level = Inst20Quest1_Level
Inst20Quest1_HORDE_Attain = Inst20Quest1_Attain
Inst20Quest1_HORDE_Aim = Inst20Quest1_Aim
Inst20Quest1_HORDE_Location = Inst20Quest1_Location
Inst20Quest1_HORDE_Note = Inst20Quest1_Note
Inst20Quest1_HORDE_Prequest = Inst20Quest1_Prequest
Inst20Quest1_HORDE_Folgequest = Inst20Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst20Quest2_HORDE = Inst20Quest2
Inst20Quest2_HORDE_Level = Inst20Quest2_Level
Inst20Quest2_HORDE_Attain = Inst20Quest2_Attain
Inst20Quest2_HORDE_Aim = Inst20Quest2_Aim
Inst20Quest2_HORDE_Location = Inst20Quest2_Location
Inst20Quest2_HORDE_Note = Inst20Quest2_Note
Inst20Quest2_HORDE_Prequest = Inst20Quest2_Prequest
Inst20Quest2_HORDE_Folgequest = Inst20Quest2_Folgequest
Inst20Quest2FQuest_HORDE = Inst20Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst20Quest3_HORDE = Inst20Quest3
Inst20Quest3_HORDE_Level = Inst20Quest3_Level
Inst20Quest3_HORDE_Attain = Inst20Quest3_Attain
Inst20Quest3_HORDE_Aim = Inst20Quest3_Aim
Inst20Quest3_HORDE_Location = Inst20Quest3_Location
Inst20Quest3_HORDE_Note = Inst20Quest3_Note
Inst20Quest3_HORDE_Prequest = Inst20Quest3_Prequest
Inst20Quest3_HORDE_Folgequest = Inst20Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst20Quest4_HORDE = Inst20Quest4
Inst20Quest4_HORDE_Level = Inst20Quest4_Level
Inst20Quest4_HORDE_Attain = Inst20Quest4_Attain
Inst20Quest4_HORDE_Aim = Inst20Quest4_Aim
Inst20Quest4_HORDE_Location = Inst20Quest4_Location
Inst20Quest4_HORDE_Note = Inst20Quest4_Note
Inst20Quest4_HORDE_Prequest = Inst20Quest4_Prequest
Inst20Quest4_HORDE_Folgequest = Inst20Quest4_Folgequest
Inst20Quest4FQuest_HORDE = Inst20Quest4FQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst20Quest5_HORDE = Inst20Quest5
Inst20Quest5_HORDE_Level = Inst20Quest5_Level
Inst20Quest5_HORDE_Attain = Inst20Quest5_Attain
Inst20Quest5_HORDE_Aim = Inst20Quest5_Aim
Inst20Quest5_HORDE_Location = Inst20Quest5_Location
Inst20Quest5_HORDE_Note = Inst20Quest5_Note
Inst20Quest5_HORDE_Prequest = Inst20Quest5_Prequest
Inst20Quest5_HORDE_Folgequest = Inst20Quest5_Folgequest
Inst20Quest5FQuest_HORDE = Inst20Quest5FQuest
--
Inst20Quest5name1_HORDE = Inst20Quest5name1
Inst20Quest5name2_HORDE = Inst20Quest5name2
Inst20Quest5name3_HORDE = Inst20Quest5name3

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst20Quest6_HORDE = Inst20Quest6
Inst20Quest6_HORDE_Level = Inst20Quest6_Level
Inst20Quest6_HORDE_Attain = Inst20Quest6_Attain
Inst20Quest6_HORDE_Aim = Inst20Quest6_Aim
Inst20Quest6_HORDE_Location = Inst20Quest6_Location
Inst20Quest6_HORDE_Note = Inst20Quest6_Note
Inst20Quest6_HORDE_Prequest = Inst20Quest6_Prequest
Inst20Quest6_HORDE_Folgequest = Inst20Quest6_Folgequest
Inst20Quest6PreQuest_HORDE = Inst20Quest6PreQuest
--
Inst20Quest6name1_HORDE = Inst20Quest6name1
Inst20Quest6name2_HORDE = Inst20Quest6name2
Inst20Quest6name3_HORDE = Inst20Quest6name3
Inst20Quest6name4_HORDE = Inst20Quest6name4

--Quest 7 Horde
Inst20Quest7_HORDE = "7. Barov Family Fortune"
Inst20Quest7_HORDE_Level = "60"
Inst20Quest7_HORDE_Attain = "52"
Inst20Quest7_HORDE_Aim = "Venture to the Scholomance and recover the Barov family fortune. Four deeds make up this fortune: The Deed to Caer Darrow; The Deed to Brill; The Deed to Tarren Mill; and The Deed to Southshore. Return to Alexi Barov when you have completed this task."
Inst20Quest7_HORDE_Location = "Alexi Barov (Tirisfal Glades - The Bulwark; "..YELLOW.."80,73"..WHITE..")"
Inst20Quest7_HORDE_Note = "You can find The Deed to Caer Darrow at "..YELLOW.."[12]"..WHITE..", The Deed to Brill at "..YELLOW.."[7]"..WHITE..", The Deed to Tarren Mill at "..YELLOW.."[4]"..WHITE.." and The Deed to Southshore at "..YELLOW.."[1]"..WHITE..".\nThe reward listed is for the followup."
Inst20Quest7_HORDE_Prequest = "None"
Inst20Quest7_HORDE_Folgequest = "The Last Barov"
--
Inst20Quest7name1_HORDE = "Barov Peasant Caller"

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst20Quest8_HORDE = Inst20Quest8
Inst20Quest8_HORDE_Level = Inst20Quest8_Level
Inst20Quest8_HORDE_Attain = Inst20Quest8_Attain
Inst20Quest8_HORDE_Aim = Inst20Quest8_Aim
Inst20Quest8_HORDE_Location = Inst20Quest8_Location
Inst20Quest8_HORDE_Note = Inst20Quest8_Note
Inst20Quest8_HORDE_Prequest = Inst20Quest8_Prequest
Inst20Quest8_HORDE_Folgequest = Inst20Quest8_Folgequest
Inst20Quest8PreQuest_HORDE = Inst20Quest8PreQuest
--
Inst20Quest8name1_HORDE = Inst20Quest8name1
Inst20Quest8name2_HORDE = Inst20Quest8name2

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst20Quest9_HORDE = Inst20Quest9
Inst20Quest9_HORDE_Level = Inst20Quest9_Level
Inst20Quest9_HORDE_Attain = Inst20Quest9_Attain
Inst20Quest9_HORDE_Aim = Inst20Quest9_Aim
Inst20Quest9_HORDE_Location = Inst20Quest9_Location
Inst20Quest9_HORDE_Note = Inst20Quest9_Note
Inst20Quest9_HORDE_Prequest = Inst20Quest9_Prequest
Inst20Quest9_HORDE_Folgequest = Inst20Quest9_Folgequest
Inst20Quest9PreQuest_HORDE = Inst20Quest9PreQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst20Quest10_HORDE = Inst20Quest10
Inst20Quest10_HORDE_Level = Inst20Quest10_Level
Inst20Quest10_HORDE_Attain = Inst20Quest10_Attain
Inst20Quest10_HORDE_Aim = Inst20Quest10_Aim
Inst20Quest10_HORDE_Location = Inst20Quest10_Location
Inst20Quest10_HORDE_Note = Inst20Quest10_Note
Inst20Quest10_HORDE_Prequest = Inst20Quest10_Prequest
Inst20Quest10_HORDE_Folgequest = Inst20Quest10_Folgequest
Inst20Quest10PreQuest_HORDE = Inst20Quest10PreQuest
-- No Rewards for this quest

--Quest 11 Horde
Inst20Quest11_HORDE = "11. The Darkreaver Menace (Shaman)"
Inst20Quest11_HORDE_Level = "60"
Inst20Quest11_HORDE_Attain = "58"
Inst20Quest11_HORDE_Aim = "Use the Divination Scryer in the heart of the Great Ossuary's basement in the Scholomance.\n\nBring Darkreaver's Head to Sagorne Creststrider in the Valley of Wisdom, Orgrimmar."
Inst20Quest11_HORDE_Location = "Sagorne Creststrider (Orgrimmar - Valley of Wisdom; "..YELLOW.."38.6, 36.2"..WHITE..")"
Inst20Quest11_HORDE_Note = "This quest is only available for Shamans. The prequest is obtained from the same NPC.\n\nDeath Knight Darkreaver is summoned at "..YELLOW.."[5]"..WHITE.."."
Inst20Quest11_HORDE_Prequest = "Material Assistance"
Inst20Quest11_HORDE_Folgequest = "None"
Inst20Quest11PreQuest_HORDE = "true"
--
Inst20Quest11name1_HORDE = "Skyfury Helm"

--Quest 12 Horde  (same as Quest 11 Alliance)
Inst20Quest12_HORDE = "12. The Right Piece of Lord Valthalak's Amulet"
Inst20Quest12_HORDE_Level = Inst20Quest11_Level
Inst20Quest12_HORDE_Attain = Inst20Quest11_Attain
Inst20Quest12_HORDE_Aim = Inst20Quest11_Aim
Inst20Quest12_HORDE_Location = Inst20Quest11_Location
Inst20Quest12_HORDE_Note = Inst20Quest11_Note
Inst20Quest12_HORDE_Prequest = Inst20Quest11_Prequest
Inst20Quest12_HORDE_Folgequest = Inst20Quest11_Folgequest
Inst20Quest12PreQuest_HORDE = Inst20Quest11PreQuest
-- No Rewards for this quest



--------------- INST21 - Shadowfang Keep (SFK) ---------------

Inst21Story = "During the Third War, the wizards of the Kirin Tor battled against the undead armies of the Scourge. When the wizards of Dalaran died in battle, they would rise soon after - adding their former might to the growing Scourge. Frustrated by their lack of progress (and against the advice of his peers) the Archmage, Arugal elected to summon extra-dimensional entities to bolster Dalaran's diminishing ranks. Arugal's summoning brought the ravenous worgen into the world of Azeroth. The feral wolf-men slaughtered not only the Scourge, but quickly turned on the wizards themselves. The worgen laid siege to the keep of the noble, Baron Silverlaine. Situated above the tiny hamlet of Pyrewood, the keep quickly fell into shadow and ruin. Driven mad with guilt, Arugal adopted the worgen as his children and retreated to the newly dubbed 'Shadowfang Keep'. It's said he still resides there, protected by his massive pet, Fenrus - and haunted by the vengeful ghost of Baron Silverlaine."
Inst21Caption = "Shadowfang Keep"
Inst21QAA = "3 Quests"
Inst21QAH = "5 Quests"

--Quest 1 Alliance
Inst21Quest1 = "1. The Test of Righteousness (Paladin)"
Inst21Quest1_Level = "22"
Inst21Quest1_Attain = "20"
Inst21Quest1_Aim = "Using Jordan's Weapon Notes, find some Whitestone Oak Lumber, Bailor's Refined Ore Shipment, Jordan's Smithing Hammer, and a Kor Gem, and return them to Jordan Stilwell in Ironforge."
Inst21Quest1_Location = "Jordan Stilwell (Dun Morogh - Ironforge Entrance; "..YELLOW.."52,36"..WHITE..")"
Inst21Quest1_Note = "To see the note click on  "..YELLOW.."[The Test of Righteousness Information]"..WHITE.."."
Inst21Quest1_Page = {2, "Only Paladins can get this quest!\n\n1. You get the  Whitestone Oak Lumber from Goblin Woodcarvers in "..YELLOW.."[Deadmines]"..WHITE..".\n\n2. To get the Bailor's Refined Ore Shipment you must talk to Bailor Stonehand (Loch Modan - Thelsamar; "..YELLOW.."35,44"..WHITE.."). He gives you the 'Bailor's Ore Shipment' quest. You find the Jordan's Ore Shipment behind a tree at "..YELLOW.."71,21"..WHITE.."\n\n3. You get Jordan's Smithing Hammer in "..YELLOW.."[Shadowfang Keep]"..WHITE.." at "..YELLOW.."[5]"..WHITE..".\n\n4. To get a Kor Gem you have to go to Thundris Windweaver (Darkshore - Auberdine; "..YELLOW.."37,40"..WHITE..") and do the 'Seeking the Kor Gem' quest. For this quest, you must kill Blackfathom oracles or priestesses before "..YELLOW.."[Blackfathom Deeps]"..WHITE..". They drop a corrupted Kor Gem. Thundris Windweaver will clean it for you.", };
Inst21Quest1_Prequest = "The Tome of Valor -> The Test of Righteousness"
Inst21Quest1_Folgequest = "The Test of Righteousness"
Inst21Quest1PreQuest = "true"
--
Inst21Quest1name1 = "Verigan's Fist"

--Quest 2 Alliance
Inst21Quest2 = "2. The Orb of Soran'ruk (Warlock)"
Inst21Quest2_Level = "25"
Inst21Quest2_Attain = "20"
Inst21Quest2_Aim = "Find 3 Soran'ruk Fragments and 1 Large Soran'ruk Fragment and return them to Doan Karhan in the Barrens."
Inst21Quest2_Location = "Doan Karhan (Barrens; "..YELLOW.."49,57"..WHITE..")"
Inst21Quest2_Note = "Only Warlocks can get this Quest! You get the 3 Soran'ruk Fragments from Twilight Accolytes in "..YELLOW.."[Blackfathom Deeps]"..WHITE..". You get the Large Soran'ruk Fragment in "..YELLOW.."[Shadowfang Keep]"..WHITE.." from Shadowfang Darksouls."
Inst21Quest2_Prequest = "None"
Inst21Quest2_Folgequest = "None"
--
Inst21Quest2name1 = "Orb of Soran'ruk"
Inst21Quest2name2 = "Staff of Soran'ruk"

--Quest 3 Alliance
Inst21Quest3 = "3. Something is in the Air (and it Ain't Love)"
Inst21Quest3_Level = "80"
Inst21Quest3_Attain = "75"
Inst21Quest3_Aim = "Bring the Faded Lovely Greeting Card to Inspector Snip Snagglebolt in Stormwind."
Inst21Quest3_Location = "Drops from Apothecary Hummel in Shadowfang Keep once per character."
Inst21Quest3_Note = "This quest is for the Love is in the Air seasonal event.\n\nInspector Snip Snagglebolt is at (Stormwind City - Trade District; "..YELLOW.."61.7, 75.5"..WHITE..")."
Inst21Quest3_Prequest = "None"
Inst21Quest3_Folgequest = "None"
-- No Rewards for this quest



--Quest 1 Horde
Inst21Quest1_HORDE = "1. Deathstalkers in Shadowfang"
Inst21Quest1_HORDE_Level = "25"
Inst21Quest1_HORDE_Attain = "18"
Inst21Quest1_HORDE_Aim = "Find the Deathstalker Adamant and Deathstalker Vincent."
Inst21Quest1_HORDE_Location = "High Executor Hadrec (Silverpine Forest - The Sepulcher; "..YELLOW.."43,40"..WHITE..")"
Inst21Quest1_HORDE_Note = "You find Deathstalker Adamant at "..YELLOW.."[1]"..WHITE..". Deathstalker Vincent is on the right side when you go into the courtyard at "..YELLOW.."[3]"..WHITE.."."
Inst21Quest1_HORDE_Prequest = "None"
Inst21Quest1_HORDE_Folgequest = "None"
--
Inst21Quest1name1_HORDE = "Ghostly Mantle"

--Quest 2 Horde
Inst21Quest2_HORDE = "2. The Book of Ur"
Inst21Quest2_HORDE_Level = "26"
Inst21Quest2_HORDE_Attain = "16"
Inst21Quest2_HORDE_Aim = "Bring the Book of Ur to Keeper Bel'dugur at the Apothecarium in the Undercity."
Inst21Quest2_HORDE_Location = "Keeper Bel'dugur (Undercity - The Apothecarium; "..YELLOW.."53,54"..WHITE..")"
Inst21Quest2_HORDE_Note = "You find the book at "..YELLOW.."[11]"..WHITE.." on the left side when you enter the room."
Inst21Quest2_HORDE_Prequest = "None"
Inst21Quest2_HORDE_Folgequest = "None"
--
Inst21Quest2name1_HORDE = "Grizzled Boots"
Inst21Quest2name2_HORDE = "Steel-clasped Bracers"

--Quest 3 Horde
Inst21Quest3_HORDE = "3. Arugal Must Die"
Inst21Quest3_HORDE_Level = "27"
Inst21Quest3_HORDE_Attain = "18"
Inst21Quest3_HORDE_Aim = "Kill Arugal and bring his head to Dalar Dawnweaver at the Sepulcher."
Inst21Quest3_HORDE_Location = "Dalar Dawnweaver (Silverpine Forest - The Sepulcher; "..YELLOW.."44,39"..WHITE..")"
Inst21Quest3_HORDE_Note = "You find Archmage Arugal at "..YELLOW.."[13]"..WHITE.."."
Inst21Quest3_HORDE_Prequest = "None"
Inst21Quest3_HORDE_Folgequest = "None"
--
Inst21Quest3name1_HORDE = "Seal of Sylvanas"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst21Quest4_HORDE = "4. The Orb of Soran'ruk (Warlock)"
Inst21Quest4_HORDE_Level = Inst21Quest2_Level
Inst21Quest4_HORDE_Attain = Inst21Quest2_Attain
Inst21Quest4_HORDE_Aim = Inst21Quest2_Aim
Inst21Quest4_HORDE_Location = Inst21Quest2_Location
Inst21Quest4_HORDE_Note = Inst21Quest2_Note
Inst21Quest4_HORDE_Prequest = Inst21Quest2_Prequest
Inst21Quest4_HORDE_Folgequest = Inst21Quest2_Folgequest
--
Inst21Quest4name1_HORDE = Inst21Quest2name1
Inst21Quest4name2_HORDE = Inst21Quest2name1

--Quest 5 Horde
Inst21Quest5_HORDE = "5. Something is in the Air (and it Ain't Love)"
Inst21Quest5_HORDE_Level = "80"
Inst21Quest5_HORDE_Attain = "75"
Inst21Quest5_HORDE_Aim = "Bring the Faded Lovely Greeting Card to Detective Snap Snagglebolt in Orgrimmar."
Inst21Quest5_HORDE_Location = "Drops from Apothecary Hummel in Shadowfang Keep once per character."
Inst21Quest5_HORDE_Note = "This quest is for the Love is in the Air seasonal event.\n\nDetective Snap Snagglebol is at (Orgrimmar - Valley of Strength; "..YELLOW.."50.8, 65.6"..WHITE..")."
Inst21Quest5_HORDE_Prequest = "None"
Inst21Quest5_HORDE_Folgequest = "None"
-- No Rewards for this quest



--------------- INST22 - Stratholme (Strat) ---------------

Inst22Story = "Once the jewel of northern Lordaeron, the city of Stratholme is where Prince Arthas turned against his mentor, Uther Lightbringer, and slaughtered hundreds of his own subjects who were believed to have contracted the dreaded plague of undeath. Arthas' downward spiral and ultimate surrender to the Lich King soon followed. The broken city is now inhabited by the undead Scourge - led by the powerful lich, Kel'thuzad. A contingent of Scarlet Crusaders, led by Grand Crusader Dathrohan, also holds a portion of the ravaged city. The two sides are locked in constant, violent combat. Those adventurers brave (or foolish) enough to enter Stratholme will be forced to contend with both factions before long. It is said that the city is guarded by three massive watchtowers, as well as powerful necromancers, banshees and abominations. There have also been reports of a malefic Death Knight riding atop an unholy steed - dispensing indiscriminate wrath on all those who venture within the realm of the Scourge."
Inst22Caption = "Stratholme"
Inst22QAA = "18 Quests"
Inst22QAH = "20 Quests"

--Quest 1 Alliance
Inst22Quest1 = "1. The Flesh Does Not Lie"
Inst22Quest1_Level = "60"
Inst22Quest1_Attain = "55"
Inst22Quest1_Aim = "Recover 10 Plagued Flesh Samples from Stratholme and return them to Betina Bigglezink. You suspect that any creature in Stratholme would have said flesh sample."
Inst22Quest1_Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."75.6, 53.6"..WHITE..")"
Inst22Quest1_Note = "Most mobs in Stratholme can drop the Plagued Flesh Samples, but the drop rate seems low."
Inst22Quest1_Prequest = "None"
Inst22Quest1_Folgequest = "The Active Agent"
-- No Rewards for this quest

--Quest 2 Alliance
Inst22Quest2 = "2. The Active Agent"
Inst22Quest2_Level = "60"
Inst22Quest2_Attain = "55"
Inst22Quest2_Aim = "Travel to Stratholme and search the ziggurats. Find and return new Scourge Data to Betina Bigglezink."
Inst22Quest2_Location = "Betina Bigglezink (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."75.6, 53.6"..WHITE..")"
Inst22Quest2_Note = "The Scourge Data is in one of the 3 Towers, you find near "..YELLOW.."[15]"..WHITE..", "..YELLOW.."[16]"..WHITE.." and "..YELLOW.."[17]"..WHITE.."."
Inst22Quest2_Prequest = "The Flesh Does Not Lie"
Inst22Quest2_Folgequest = "None"
Inst22Quest2FQuest = "true"
--
Inst22Quest2name1 = "Seal of the Dawn"
Inst22Quest2name2 = "Rune of the Dawn"

--Quest 3 Alliance
Inst22Quest3 = "3. Houses of the Holy"
Inst22Quest3_Level = "60"
Inst22Quest3_Attain = "55"
Inst22Quest3_Aim = "Travel to Stratholme, in the north. Search the supply crates that litter the city and recover 5 Stratholme Holy Water. Return to Leonid Barthalomew the Revered when you have collected enough of the blessed fluid."
Inst22Quest3_Location = "Leonid Barthalomew the Revered (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."75.8, 52.0"..WHITE..")"
Inst22Quest3_Note = "You can find the Holy Water in crates everywhere in Stratholme. Some of the crates will spawn bugs that attack you."
Inst22Quest3_Prequest = "None"
Inst22Quest3_Folgequest = "None"
--
Inst22Quest3name1 = "Superior Healing Potion"
Inst22Quest3name2 = "Greater Mana Potion"
Inst22Quest3name3 = "Crown of the Penitent"
Inst22Quest3name4 = "Band of the Penitent"

--Quest 4 Alliance
Inst22Quest4 = "4. The Great Fras Siabi"
Inst22Quest4_Level = "60"
Inst22Quest4_Attain = "55"
Inst22Quest4_Aim = "Find Fras Siabi's smoke shop in Stratholme and recover a box of Siabi's Premium Tobacco. Return to Smokey LaRue when the job is done."
Inst22Quest4_Location = "Smokey LaRue (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."74.8, 52.0"..WHITE..")"
Inst22Quest4_Note = "You find the smoke shop near "..YELLOW.."[1]"..WHITE..". Fras Siabi spawns when you open box."
Inst22Quest4_Prequest = "None"
Inst22Quest4_Folgequest = "None"
--
Inst22Quest4name1 = "Smokey's Lighter"

--Quest 5 Alliance
Inst22Quest5 = "5. The Restless Souls"
Inst22Quest5_Level = "60"
Inst22Quest5_Attain = "55"
Inst22Quest5_Aim = "Use Egan's Blaster on the ghostly and spectral citizens of Stratholme. When the restless souls break free from their ghostly shells, use the blaster again - freedom will be theirs!\nFree 15 Restless Souls and return to Egan."
Inst22Quest5_Location = "Egan (Eastern Plaguelands; "..YELLOW.."11.3, 28.7"..WHITE..")"
Inst22Quest5_Note = "You get the prequest from Caretaker Alen (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."74,58"..WHITE.."). The Spectral Citizens walk through the streets of Stratholme."
Inst22Quest5_Prequest = "The Restless Souls"
Inst22Quest5_Folgequest = "None"
Inst22Quest5PreQuest = "true"
--
Inst22Quest5name1 = "Testament of Hope"

--Quest 6 Alliance
Inst22Quest6 = "6. Of Love and Family"
Inst22Quest6_Level = "60"
Inst22Quest6_Attain = "52"
Inst22Quest6_Aim = "Travel to Stratholme, in the northern part of the Plaguelands. It is in the Scarlet Bastion that you will find the painting 'Of Love and Family,' hidden behind another painting depicting the twin moons of our world.\nReturn the painting to Tirion Fordring."
Inst22Quest6_Location = "Artist Renfray (Western Plaguelands - Caer Darrow; "..YELLOW.."65,75"..WHITE..")"
Inst22Quest6_Note = "You get the prequest from Tirion Fordring (Western Plaguelands; "..YELLOW.."7,43"..WHITE.."). You can find the picture near "..YELLOW.."[10]"..WHITE.."."
Inst22Quest6_Prequest = "Redemption - > Of Love and Family"
Inst22Quest6_Folgequest = "Find Myranda"
Inst22Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst22Quest7 = "7. Menethil's Gift"
Inst22Quest7_Level = "60"
Inst22Quest7_Attain = "57"
Inst22Quest7_Aim = "Travel to Stratholme and find Menethil's Gift. Place the Keepsake of Remembrance upon the unholy ground."
Inst22Quest7_Location = "Leonid Barthalomew the Revered (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."75.8, 52.0"..WHITE..")"
Inst22Quest7_Note = "You get the prequest from Magistrate Marduke (Western Plaguelands - Caer Darrow; "..YELLOW.."70,73"..WHITE.."). You find the sign near "..YELLOW.."[19]"..WHITE..". See also: "..YELLOW.."[The Lich, Ras Frostwhisper]"..WHITE.." in Scholomance."
Inst22Quest7_Prequest = "The Human, Ras Frostwhisper - > The Dying, Ras Frostwhisper"
Inst22Quest7_Folgequest = "Menethil's Gift"
Inst22Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst22Quest8 = "8. Aurius' Reckoning"
Inst22Quest8_Level = "60"
Inst22Quest8_Attain = "56"
Inst22Quest8_Aim = "Kill the Baron."
Inst22Quest8_Location = "Aurius (Stratholme; "..YELLOW.."[13]"..WHITE..")"
Inst22Quest8_Note = "You get the Medallion from a chest (Malor's Strongbox "..YELLOW.."[7]"..WHITE..") in the first chamber of the bastion (before the ways split). It is not bound so you can trade it from another player or get it in a separate run.\n\nAfter giving Aurius the Medallion he'll help you when you fight Baron Rivendare "..YELLOW.."[19]"..WHITE..". After the Baron dies, Aurius will also die. Talk to his corpse to receive the reward."
Inst22Quest8_Prequest = "None"
Inst22Quest8_Folgequest = "None"
--
Inst22Quest8name1 = "Will of the Martyr"
Inst22Quest8name2 = "Blood of the Martyr"

--Quest 9 Alliance
Inst22Quest9 = "9. The Archivist"
Inst22Quest9_Level = "60"
Inst22Quest9_Attain = "55"
Inst22Quest9_Aim = "Travel to Stratholme and find Archivist Galford of the Scarlet Crusade. Destroy him and burn down the Scarlet Archive."
Inst22Quest9_Location = "Duke Nicholas Zverenhoff (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."76,52"..WHITE..")"
Inst22Quest9_Note = "You can find the Archive and the Achivist at "..YELLOW.."[10]"..WHITE.."."
Inst22Quest9_Prequest = "None"
Inst22Quest9_Folgequest = "The Truth Comes Crashing Down"
-- No Rewards for this quest

--Quest 10 Alliance
Inst22Quest10 = "10. The Truth Comes Crashing Down"
Inst22Quest10_Level = "60"
Inst22Quest10_Attain = "55"
Inst22Quest10_Aim = "Take the Head of Balnazzar to Duke Nicholas Zverenhoff in the Eastern Plaguelands."
Inst22Quest10_Location = "Balnazzar (Stratholme; "..YELLOW.."[11]"..WHITE..")"
Inst22Quest10_Note = "You find Duke Nicholas Zverenhoff in the Eastern Plaguelands - Light's Hope Chapel ("..YELLOW.."76,52"..WHITE..")."
Inst22Quest10_Prequest = "The Archivist"
Inst22Quest10_Folgequest = "Above and Beyond"
Inst22Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst22Quest11 = "11. Above and Beyond"
Inst22Quest11_Level = "60"
Inst22Quest11_Attain = "55"
Inst22Quest11_Aim = "Venture to Stratholme and destroy Baron Rivendare. Take his head and return to Duke Nicholas Zverenhoff."
Inst22Quest11_Location = "Duke Nicholas Zverenhoff (Eastern Plaguelands - Light's Hope Chapel; "..YELLOW.."76,52"..WHITE..")"
Inst22Quest11_Note = "You can find the Baron at "..YELLOW.."[19]"..WHITE..".\n\nThe rewards listed are for the followup."
Inst22Quest11_Prequest = "The Truth Comes Crashing Down"
Inst22Quest11_Folgequest = "Lord Maxwell Tyrosus -> The Argent Hold"
Inst22Quest11FQuest = "true"
--
Inst22Quest11name1 = "Argent Defender"
Inst22Quest11name2 = "Argent Crusader"
Inst22Quest11name3 = "Argent Avenger"

--Quest 12 Alliance
Inst22Quest12 = "12. Dead Man's Plea"
Inst22Quest12_Level = "60"
Inst22Quest12_Attain = "58"
Inst22Quest12_Aim = "Go into Stratholme and rescue Ysida Harmon from Baron Rivendare."
Inst22Quest12_Location = "Anthion Harmon (Eastern Plaguelands - Stratholme)"
Inst22Quest12_Note = "Anthion stands just outside the Stratholme portal. You need the Extra-Dimensional Ghost Revealer to see him. It comes from the pre-quest. The questline starts with Just Compensation. Deliana in Ironforge ("..YELLOW.."43,52"..WHITE..") for Alliance, Mokvar in Orgrimmar ("..YELLOW.."38,37"..WHITE..") for Horde.\nThis is the infamous '45 minute' Baron run."
Inst22Quest12_Prequest = "In Search of Anthion"
Inst22Quest12_Folgequest = "Proof of Life"
Inst22Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst22Quest13 = "13. The Left Piece of Lord Valthalak's Amulet"
Inst22Quest13_Level = "60"
Inst22Quest13_Attain = "58"
Inst22Quest13_Aim = "Use the Brazier of Beckoning to summon forth Jarien and Sothos and slay them. Return to Bodley inside Blackrock Mountain with the Left Piece of Lord Valthalak's Amulet and the Brazier of Beckoning."
Inst22Quest13_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst22Quest13_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nJarien and Sothos are summoned at "..YELLOW.."[11]"..WHITE.."."
Inst22Quest13_Prequest = "Components of Importance"
Inst22Quest13_Folgequest = "I See Alcaz Island In Your Future..."
Inst22Quest13PreQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst22Quest14 = "14. The Right Piece of Lord Valthalak's Amulet"
Inst22Quest14_Level = "60"
Inst22Quest14_Attain = "58"
Inst22Quest14_Aim = "Use the Brazier of Beckoning to summon forth Jarien and Sothos and slay them. Return to Bodley inside Blackrock Mountain with the recombined Lord Valthalak's Amulet and the Brazier of Beckoning."
Inst22Quest14_Location = "Bodley (Blackrock Mountain; "..YELLOW.."[D] on Entrance Map"..WHITE..")"
Inst22Quest14_Note = "Extra-Dimensional Ghost Revealer is needed to see Bodley. You get it from the 'In Search of Anthion' quest.\n\nJarien and Sothos are summoned at "..YELLOW.."[11]"..WHITE.."."
Inst22Quest14_Prequest = "More Components of Importance"
Inst22Quest14_Folgequest = "Final Preparations ("..YELLOW.."Upper Blackrock Spire"..WHITE..")"
Inst22Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst22Quest15 = "15. Atiesh, Greatstaff of the Guardian"
Inst22Quest15_Level = "60"
Inst22Quest15_Attain = "60"
Inst22Quest15_Aim = "Anachronos at the Caverns of Time in Tanaris wants you to take Atiesh, Greatstaff of the Guardian to Stratholme and use it on Consecrated Earth. Defeat the entity that is exorcised from the staff and return to him."
Inst22Quest15_Location = "Anachronos (Tanaris - Caverns of Time; "..YELLOW.."65,49"..WHITE..")"
Inst22Quest15_Note = "Atiesh is summoned at "..YELLOW.."[2]"..WHITE..".\n\nAs of the Wrath of the Lich King expansion, this quest can no longer be obtained. Only those on the last step of the quest, who have the quest item to summon Atiesh can complete it."
Inst22Quest15_Prequest = "Yes"
Inst22Quest15_Folgequest = "None"
Inst22Quest15PreQuest = "true"
--
Inst22Quest15name1 = "Atiesh, Greatstaff of the Guardian"
Inst22Quest15name2 = "Atiesh, Greatstaff of the Guardian"
Inst22Quest15name3 = "Atiesh, Greatstaff of the Guardian"
Inst22Quest15name4 = "Atiesh, Greatstaff of the Guardian"

--Quest 16 Alliance
Inst22Quest16 = "16. Corruption (Blacksmith)"
Inst22Quest16_Level = "60"
Inst22Quest16_Attain = "50"
Inst22Quest16_Aim = "Find the Black Guard Swordsmith in Stratholme and destroy him. Recover the Insignia of the Black Guard and return to Seril Scourgebane."
Inst22Quest16_Location = "Seril Scourgebane (Winterspring - Everlook; "..YELLOW.."61,37"..WHITE..")"
Inst22Quest16_Note = "The Black Guard Swordsmith is summoned near "..YELLOW.."[15]"..WHITE.."."
Inst22Quest16_Prequest = "None"
Inst22Quest16_Folgequest = "None"
--
Inst22Quest16name1 = "Plans: Blazing Rapier"

--Quest 17 Alliance
Inst22Quest17 = "17. Sweet Serenity (Blacksmith)"
Inst22Quest17_Level = "60"
Inst22Quest17_Attain = "50"
Inst22Quest17_Aim = "Travel to Stratholme and kill the Crimson Hammersmith. Recover the Crimson Hammersmith's Apron and return to Lilith."
Inst22Quest17_Location = "Lilith the Lithe (Winterspring - Everlook; "..YELLOW.."61,37"..WHITE..")"
Inst22Quest17_Note = "The Crimson Hammersmith is summoned at "..YELLOW.."[8]"..WHITE.."."
Inst22Quest17_Prequest = "None"
Inst22Quest17_Folgequest = "None"
--
Inst22Quest17name1 = "Plans: Enchanted Battlehammer"

--Quest 18 Alliance
Inst22Quest18 = "18. The Balance of Light and Shadow (Priest)"
Inst22Quest18_Level = "60"
Inst22Quest18_Attain = "60"
Inst22Quest18_Aim = "Save 50 Peasants before 15 are slain. Speak with Eris Havenfire should you accomplish this task."
Inst22Quest18_Location = "Eris Havenfire (Eastern Plaguelands; "..YELLOW.."17.6, 14.0"..WHITE..")"
Inst22Quest18_Note = "In order to see Eris Havenfire and get this quest and the prequest, you need the Eye of Divinity (comes from Cache of the Firelord in "..YELLOW.."[Molten Core]"..WHITE..").\n\nThis quest's reward, when combined with Eye of Divinity and The Eye of Shadow (drops from demons in Winterspring or Blasted Lands) form Benediction, an epic priest's staff."
Inst22Quest18_Prequest = "A Warning"
Inst22Quest18_Folgequest = "None"
Inst22Quest18PreQuest = "true"
--
Inst22Quest18name1 = "Splinter of Nordrassil"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst22Quest1_HORDE = Inst22Quest1
Inst22Quest1_HORDE_Level = Inst22Quest1_Level
Inst22Quest1_HORDE_Attain = Inst22Quest1_Attain
Inst22Quest1_HORDE_Aim = Inst22Quest1_Aim
Inst22Quest1_HORDE_Location = Inst22Quest1_Location
Inst22Quest1_HORDE_Note = Inst22Quest1_Note
Inst22Quest1_HORDE_Prequest = Inst22Quest1_Prequest
Inst22Quest1_HORDE_Folgequest = Inst22Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst22Quest2_HORDE = Inst22Quest2
Inst22Quest2_HORDE_Level = Inst22Quest2_Level
Inst22Quest2_HORDE_Attain = Inst22Quest2_Attain
Inst22Quest2_HORDE_Aim = Inst22Quest2_Aim
Inst22Quest2_HORDE_Location = Inst22Quest2_Location
Inst22Quest2_HORDE_Note = Inst22Quest2_Note
Inst22Quest2_HORDE_Prequest = Inst22Quest2_Prequest
Inst22Quest2_HORDE_Folgequest = Inst22Quest2_Folgequest
Inst22Quest2FQuest_HORDE = Inst22Quest2FQuest
--
Inst22Quest2name1_HORDE = Inst22Quest2name1
Inst22Quest2name2_HORDE = Inst22Quest2name2

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst22Quest3_HORDE = Inst22Quest3
Inst22Quest3_HORDE_Level = Inst22Quest3_Level
Inst22Quest3_HORDE_Attain = Inst22Quest3_Attain
Inst22Quest3_HORDE_Aim = Inst22Quest3_Aim
Inst22Quest3_HORDE_Location = Inst22Quest3_Location
Inst22Quest3_HORDE_Note = Inst22Quest3_Note
Inst22Quest3_HORDE_Prequest = Inst22Quest3_Prequest
Inst22Quest3_HORDE_Folgequest = Inst22Quest3_Folgequest
--
Inst22Quest3name1_HORDE = Inst22Quest3name1
Inst22Quest3name2_HORDE = Inst22Quest3name2
Inst22Quest3name3_HORDE = Inst22Quest3name3
Inst22Quest3name4_HORDE = Inst22Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst22Quest4_HORDE = Inst22Quest4
Inst22Quest4_HORDE_Level = Inst22Quest4_Level
Inst22Quest4_HORDE_Attain = Inst22Quest4_Attain
Inst22Quest4_HORDE_Aim = Inst22Quest4_Aim
Inst22Quest4_HORDE_Location = Inst22Quest4_Location
Inst22Quest4_HORDE_Note = Inst22Quest4_Note
Inst22Quest4_HORDE_Prequest = Inst22Quest4_Prequest
Inst22Quest4_HORDE_Folgequest = Inst22Quest4_Folgequest
--
Inst22Quest4name1_HORDE = Inst22Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst22Quest5_HORDE = Inst22Quest5
Inst22Quest5_HORDE_Level = Inst22Quest5_Level
Inst22Quest5_HORDE_Attain = Inst22Quest5_Attain
Inst22Quest5_HORDE_Aim = Inst22Quest5_Aim
Inst22Quest5_HORDE_Location = Inst22Quest5_Location
Inst22Quest5_HORDE_Note = Inst22Quest5_Note
Inst22Quest5_HORDE_Prequest = Inst22Quest5_Prequest
Inst22Quest5_HORDE_Folgequest = Inst22Quest5_Folgequest
Inst22Quest5PreQuest_HORDE = Inst22Quest5PreQuest
--
Inst22Quest5name1_HORDE = Inst22Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst22Quest6_HORDE = Inst22Quest6
Inst22Quest6_HORDE_Level = Inst22Quest6_Level
Inst22Quest6_HORDE_Attain = Inst22Quest6_Attain
Inst22Quest6_HORDE_Aim = Inst22Quest6_Aim
Inst22Quest6_HORDE_Location = Inst22Quest6_Location
Inst22Quest6_HORDE_Note = Inst22Quest6_Note
Inst22Quest6_HORDE_Prequest = Inst22Quest6_Prequest
Inst22Quest6_HORDE_Folgequest = Inst22Quest6_Folgequest
Inst22Quest6PreQuest_HORDE = Inst22Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst22Quest7_HORDE = Inst22Quest7
Inst22Quest7_HORDE_Level = Inst22Quest7_Level
Inst22Quest7_HORDE_Attain = Inst22Quest7_Attain
Inst22Quest7_HORDE_Aim = Inst22Quest7_Aim
Inst22Quest7_HORDE_Location = Inst22Quest7_Location
Inst22Quest7_HORDE_Note = Inst22Quest7_Note
Inst22Quest7_HORDE_Prequest = Inst22Quest7_Prequest
Inst22Quest7_HORDE_Folgequest = Inst22Quest7_Folgequest
Inst22Quest7PreQuest_HORDE = Inst22Quest7PreQuest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst22Quest8_HORDE = Inst22Quest8
Inst22Quest8_HORDE_Level = Inst22Quest8_Level
Inst22Quest8_HORDE_Attain = Inst22Quest8_Attain
Inst22Quest8_HORDE_Aim = Inst22Quest8_Aim
Inst22Quest8_HORDE_Location = Inst22Quest8_Location
Inst22Quest8_HORDE_Note = Inst22Quest8_Note
Inst22Quest8_HORDE_Prequest = Inst22Quest8_Prequest
Inst22Quest8_HORDE_Folgequest = Inst22Quest8_Folgequest
--
Inst22Quest8name1_HORDE = Inst22Quest8name1
Inst22Quest8name2_HORDE = Inst22Quest8name2

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst22Quest9_HORDE = Inst22Quest9
Inst22Quest9_HORDE_Level = Inst22Quest9_Level
Inst22Quest9_HORDE_Attain = Inst22Quest9_Attain
Inst22Quest9_HORDE_Aim = Inst22Quest9_Aim
Inst22Quest9_HORDE_Location = Inst22Quest9_Location
Inst22Quest9_HORDE_Note = Inst22Quest9_Note
Inst22Quest9_HORDE_Prequest = Inst22Quest9_Prequest
Inst22Quest9_HORDE_Folgequest = Inst22Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst22Quest10_HORDE = Inst22Quest10
Inst22Quest10_HORDE_Level = Inst22Quest10_Level
Inst22Quest10_HORDE_Attain = Inst22Quest10_Attain
Inst22Quest10_HORDE_Aim = Inst22Quest10_Aim
Inst22Quest10_HORDE_Location = Inst22Quest10_Location
Inst22Quest10_HORDE_Note = Inst22Quest10_Note
Inst22Quest10_HORDE_Prequest = Inst22Quest10_Prequest
Inst22Quest10_HORDE_Folgequest = Inst22Quest10_Folgequest
Inst22Quest10FQuest_HORDE = Inst22Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst22Quest11_HORDE = Inst22Quest11
Inst22Quest11_HORDE_Level = Inst22Quest11_Level
Inst22Quest11_HORDE_Attain = Inst22Quest11_Attain
Inst22Quest11_HORDE_Aim = Inst22Quest11_Aim
Inst22Quest11_HORDE_Location = Inst22Quest11_Location
Inst22Quest11_HORDE_Note = Inst22Quest11_Note
Inst22Quest11_HORDE_Prequest = Inst22Quest11_Prequest
Inst22Quest11_HORDE_Folgequest = Inst22Quest11_Folgequest
Inst22Quest11FQuest_HORDE = Inst22Quest11FQuest
--
Inst22Quest11name1_HORDE = Inst22Quest11name1
Inst22Quest11name2_HORDE = Inst22Quest11name2
Inst22Quest11name3_HORDE = Inst22Quest11name3

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst22Quest12_HORDE = Inst22Quest12
Inst22Quest12_HORDE_Level = Inst22Quest12_Level
Inst22Quest12_HORDE_Attain = Inst22Quest12_Attain
Inst22Quest12_HORDE_Aim = Inst22Quest12_Aim
Inst22Quest12_HORDE_Location = Inst22Quest12_Location
Inst22Quest12_HORDE_Note = Inst22Quest12_Note
Inst22Quest12_HORDE_Prequest = Inst22Quest12_Prequest
Inst22Quest12_HORDE_Folgequest = Inst22Quest12_Folgequest
Inst22Quest12PreQuest_HORDE = Inst22Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst22Quest13_HORDE = Inst22Quest13
Inst22Quest13_HORDE_Level = Inst22Quest13_Level
Inst22Quest13_HORDE_Attain = Inst22Quest13_Attain
Inst22Quest13_HORDE_Aim = Inst22Quest13_Aim
Inst22Quest13_HORDE_Location = Inst22Quest13_Location
Inst22Quest13_HORDE_Note = Inst22Quest13_Note
Inst22Quest13_HORDE_Prequest = Inst22Quest13_Prequest
Inst22Quest13_HORDE_Folgequest = Inst22Quest13_Folgequest
Inst22Quest13PreQuest_HORDE = Inst22Quest13PreQuest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst22Quest14_HORDE = Inst22Quest14
Inst22Quest14_HORDE_Level = Inst22Quest14_Level
Inst22Quest14_HORDE_Attain = Inst22Quest14_Attain
Inst22Quest14_HORDE_Aim = Inst22Quest14_Aim
Inst22Quest14_HORDE_Location = Inst22Quest14_Location
Inst22Quest14_HORDE_Note = Inst22Quest14_Note
Inst22Quest14_HORDE_Prequest = Inst22Quest14_Prequest
Inst22Quest14_HORDE_Folgequest = Inst22Quest14_Folgequest
Inst22Quest14PreQuest_HORDE = Inst22Quest14PreQuest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst22Quest15_HORDE = Inst22Quest15
Inst22Quest15_HORDE_Level = Inst22Quest15_Level
Inst22Quest15_HORDE_Attain = Inst22Quest15_Attain
Inst22Quest15_HORDE_Aim = Inst22Quest15_Aim
Inst22Quest15_HORDE_Location = Inst22Quest15_Location
Inst22Quest15_HORDE_Note = Inst22Quest15_Note
Inst22Quest15_HORDE_Prequest = Inst22Quest15_Prequest
Inst22Quest15_HORDE_Folgequest = Inst22Quest15_Folgequest
Inst22Quest15PreQuest_HORDE = Inst22Quest15PreQuest
--
Inst22Quest15name1_HORDE = Inst22Quest15name1
Inst22Quest15name2_HORDE = Inst22Quest15name2
Inst22Quest15name3_HORDE = Inst22Quest15name3
Inst22Quest15name4_HORDE = Inst22Quest15name4

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst22Quest16_HORDE = Inst22Quest16
Inst22Quest16_HORDE_Level = Inst22Quest16_Level
Inst22Quest16_HORDE_Attain = Inst22Quest16_Attain
Inst22Quest16_HORDE_Aim = Inst22Quest16_Aim
Inst22Quest16_HORDE_Location = Inst22Quest16_Location
Inst22Quest16_HORDE_Note = Inst22Quest16_Note
Inst22Quest16_HORDE_Prequest = Inst22Quest16_Prequest
Inst22Quest16_HORDE_Folgequest = Inst22Quest16_Folgequest
--
Inst22Quest16name1_HORDE = Inst22Quest16name1

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst22Quest17_HORDE = Inst22Quest17
Inst22Quest17_HORDE_Level = Inst22Quest17_Level
Inst22Quest17_HORDE_Attain = Inst22Quest17_Attain
Inst22Quest17_HORDE_Aim = Inst22Quest17_Aim
Inst22Quest17_HORDE_Location = Inst22Quest17_Location
Inst22Quest17_HORDE_Note = Inst22Quest17_Note
Inst22Quest17_HORDE_Prequest = Inst22Quest17_Prequest
Inst22Quest17_HORDE_Folgequest = Inst22Quest17_Folgequest
--
Inst22Quest17name1_HORDE = Inst22Quest17name1

--Quest 18 Horde
Inst22Quest18_HORDE = "18. Ramstein"
Inst22Quest18_HORDE_Level = "60"
Inst22Quest18_HORDE_Attain = "56"
Inst22Quest18_HORDE_Aim = "Travel to Stratholme and slay Ramstein the Gorger. Take his head as a souvenir for Nathanos."
Inst22Quest18_HORDE_Location = "Nathanos Blightcaller (Eastern Plaguelands; "..YELLOW.."22.8, 68.0"..WHITE..")"
Inst22Quest18_HORDE_Note = "You get the prequest from Nathanos Blightcaller, too. You can find Ramstein at "..YELLOW.."[18]"..WHITE.."."
Inst22Quest18_HORDE_Prequest = "The Ranger Lord's Behest -> Duskwing, Oh How I Hate Thee..."
Inst22Quest18_HORDE_Folgequest = "None"
Inst22Quest18PreQuest_HORDE = "true"
--
Inst22Quest18name1_HORDE = "Royal Seal of Alexis"
Inst22Quest18name2_HORDE = "Elemental Circle"

--Quest 19 Horde  (same as Quest 18 Alliance)
Inst22Quest19_HORDE = "19. The Balance of Light and Shadow (Priest)"
Inst22Quest19_HORDE_Level = Inst22Quest18_Level
Inst22Quest19_HORDE_Attain = Inst22Quest18_Attain
Inst22Quest19_HORDE_Aim = Inst22Quest18_Aim
Inst22Quest19_HORDE_Location = Inst22Quest18_Location
Inst22Quest19_HORDE_Note = Inst22Quest18_Note
Inst22Quest19_HORDE_Prequest = Inst22Quest18_Prequest
Inst22Quest19_HORDE_Folgequest = Inst22Quest18_Folgequest
Inst22Quest19PreQuest_HORDE = Inst22Quest18PreQuest
--
Inst22Quest19name1_HORDE = Inst22Quest18name1

--Quest 20 Horde
Inst22Quest20_HORDE = "20. True Masters of the Light (Paladin)"
Inst22Quest20_HORDE_Level = "60"
Inst22Quest20_HORDE_Attain = "60"
Inst22Quest20_HORDE_Aim = "Use the Extinguishing Mixture near the eternal flame in the Alonsus Chapel to remove the Light's protection. Be prepared to fight anyone who may attempt to defend the chapel."
Inst22Quest20_HORDE_Location = "Lord Solanar Bloodwrath (Silvermoon City - Farstriders Square; "..YELLOW.."92.2, 38.7"..WHITE..")"
Inst22Quest20_HORDE_Note = "The Alonsus Chapel is at "..YELLOW.."[13]"..WHITE..". Completing this quest gives you the Paladin Epic mount. You cannot start this quest if you've already obtained the mount from the trainer."
Inst22Quest20_HORDE_Prequest = "A Summons from Lord Solanar -> True Masters of the Light"
Inst22Quest20_HORDE_Folgequest = "None"
Inst22Quest20PreQuest_HORDE = "true"
--
Inst22Quest20name1_HORDE = "Blood Knight Tabard"



--------------- INST23 - The Ruins of Ahn'Qiraj (AQ20) ---------------

Inst23Story = "During the final hours of the War of the Shifting Sands, the combined forces of the night elves and the four dragonflights drove the battle to the very heart of the qiraji empire, to the fortress city of Ahn'Qiraj. Yet at the city gates, the armies of Kalimdor encountered a concentration of silithid war drones more massive than any they had encountered before. Ultimately the silithid and their qiraji masters were not defeated, but merely imprisoned inside a magical barrier, and the war left the cursed city in ruins. A thousand years have passed since that day, but the qiraji forces have not been idle. A new and terrible army has been spawned from the hives, and the ruins of Ahn'Qiraj are teeming once again with swarming masses of silithid and qiraji. This threat must be eliminated, or else all of Azeroth may fall before the terrifying might of the new qiraji army."
Inst23Caption = "Ruins of Ahn'Qiraj"
Inst23QAA = "2 Quests"
Inst23QAH = "2 Quests"

--Quest 1 Alliance
Inst23Quest1 = "1. The Fall of Ossirian"
Inst23Quest1_Level = "60"
Inst23Quest1_Attain = "60"
Inst23Quest1_Aim = "Deliver the Head of Ossirian the Unscarred to Commander Mar'alith at Cenarion Hold in Silithus."
Inst23Quest1_Location = "Head of Ossirian the Unscarred (drops from Ossirian the Unscarred; "..YELLOW.."[6]"..WHITE..")"
Inst23Quest1_Note = "Commander Mar'alith (Silithus - Cenarion Hold; "..YELLOW.."49,34"..WHITE..")"
Inst23Quest1_Prequest = "None"
Inst23Quest1_Folgequest = "None"
--
Inst23Quest1name1 = "Charm of the Shifting Sands"
Inst23Quest1name2 = "Amulet of the Shifting Sands"
Inst23Quest1name3 = "Choker of the Shifting Sands"
Inst23Quest1name4 = "Pendant of the Shifting Sands"

--Quest 2 Alliance
Inst23Quest2 = "2. The Perfect Poison"
Inst23Quest2_Level = "60"
Inst23Quest2_Attain = "60"
Inst23Quest2_Aim = "Dirk Thunderwood at Cenarion Hold wants you to bring him Venoxis's Venom Sac and Kurinnaxx's Venom Sac."
Inst23Quest2_Location = "Dirk Thunderwood (Silithus - Cenarion Hold; "..YELLOW.."52,39"..WHITE..")"
Inst23Quest2_Note = "Venoxis's Venom Sac drops from High priest Venoxis in "..YELLOW.."Zul'Gurub"..WHITE..". Kurinnaxx's Venom Sac drops in the "..YELLOW.."Ruins of Ahn'Qiraj"..WHITE.." at "..YELLOW.."[1]"..WHITE.."."
Inst23Quest2_Prequest = "None"
Inst23Quest2_Folgequest = "None"
--
Inst23Quest2name1 = "Ravenholdt Slicer"
Inst23Quest2name2 = "Shivsprocket's Shiv"
Inst23Quest2name3 = "The Thunderwood Poker"
Inst23Quest2name4 = "Doomulus Prime"
Inst23Quest2name5 = "Fahrad's Reloading Repeater"
Inst23Quest2name6 = "Simone's Cultivating Hammer"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst23Quest1_HORDE = Inst23Quest1
Inst23Quest1_HORDE_Level = Inst23Quest1_Level
Inst23Quest1_HORDE_Attain = Inst23Quest1_Attain
Inst23Quest1_HORDE_Aim = Inst23Quest1_Aim
Inst23Quest1_HORDE_Location = Inst23Quest1_Location
Inst23Quest1_HORDE_Note = Inst23Quest1_Note
Inst23Quest1_HORDE_Prequest = Inst23Quest1_Prequest
Inst23Quest1_HORDE_Folgequest = Inst23Quest1_Folgequest
--
Inst23Quest1name1_HORDE = Inst23Quest1name1
Inst23Quest1name2_HORDE = Inst23Quest1name2
Inst23Quest1name3_HORDE = Inst23Quest1name3
Inst23Quest1name4_HORDE = Inst23Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst23Quest2_HORDE = Inst23Quest2
Inst23Quest2_HORDE_Level = Inst23Quest2_Level
Inst23Quest2_HORDE_Attain = Inst23Quest2_Attain
Inst23Quest2_HORDE_Aim = Inst23Quest2_Aim
Inst23Quest2_HORDE_Location = Inst23Quest2_Location
Inst23Quest2_HORDE_Note = Inst23Quest2_Note
Inst23Quest2_HORDE_Prequest = Inst23Quest2_Prequest
Inst23Quest2_HORDE_Folgequest = Inst23Quest2_Folgequest
--
Inst23Quest2name1_HORDE = Inst23Quest2name1
Inst23Quest2name2_HORDE = Inst23Quest2name2
Inst23Quest2name3_HORDE = Inst23Quest2name3
Inst23Quest2name4_HORDE = Inst23Quest2name4
Inst23Quest2name5_HORDE = Inst23Quest2name5
Inst23Quest2name6_HORDE = Inst23Quest2name6



--------------- INST24 - The Stockade (Stocks) ---------------

Inst24Story = "The Stockades are a high-security prison complex, hidden beneath the canal district of Stormwind City. Presided over by Warden Thelwater, the Stockades are home to petty crooks, political insurgents, murderers and a score of the most dangerous criminals in the land. Recently, a prisoner-led revolt has resulted in a state of pandemonium within the Stockades - where the guards have been driven out and the convicts roam free. Warden Thelwater has managed to escape the holding area and is currently enlisting brave thrill-seekers to venture into the prison and kill the uprising's mastermind - the cunning felon, Bazil Thredd."
Inst24Caption = "The Stockade"
Inst24QAA = "6 Quests"
Inst24QAH = "No Quests"

--Quest 1 Alliance
Inst24Quest1 = "1. What Comes Around..."
Inst24Quest1_Level = "25"
Inst24Quest1_Attain = "22"
Inst24Quest1_Aim = "Bring the head of Targorr the Dread to Guard Berton in Lakeshire."
Inst24Quest1_Location = "Guard Berton (Redridge Mountains - Lakeshire; "..YELLOW.."26,46"..WHITE..")"
Inst24Quest1_Note = "You can find Targorr at "..YELLOW.."[1]"..WHITE.."."
Inst24Quest1_Prequest = "None"
Inst24Quest1_Folgequest = "None"
--
Inst24Quest1name1 = "Lucine Longsword"
Inst24Quest1name2 = "Hardened Root Staff"

--Quest 2 Alliance
Inst24Quest2 = "2. Crime and Punishment"
Inst24Quest2_Level = "26"
Inst24Quest2_Attain = "22"
Inst24Quest2_Aim = "Councilman Millstipe of Darkshire wants you to bring him the hand of Dextren Ward."
Inst24Quest2_Location = "Millstipe (Duskwood - Darkshire; "..YELLOW.."72,47"..WHITE..")"
Inst24Quest2_Note = "You can find Dextren at "..YELLOW.."[5]"..WHITE.."."
Inst24Quest2_Prequest = "None"
Inst24Quest2_Folgequest = "None"
--
Inst24Quest2name1 = "Ambassador's Boots"
Inst24Quest2name2 = "Darkshire Mail Leggings"

--Quest 3 Alliance
Inst24Quest3 = "3. Quell The Uprising"
Inst24Quest3_Level = "26"
Inst24Quest3_Attain = "22"
Inst24Quest3_Aim = "Warden Thelwater of Stormwind wants you to kill 10 Defias Prisoners, 8 Defias Convicts, and 8 Defias Insurgents in The Stockade."
Inst24Quest3_Location = "Warden Thelwater (Stormwind - The Stockade; "..YELLOW.."51.4, 68.8"..WHITE..")"
Inst24Quest3_Note = ""
Inst24Quest3_Prequest = "None"
Inst24Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst24Quest4 = "4. The Color of Blood"
Inst24Quest4_Level = "26"
Inst24Quest4_Attain = "22"
Inst24Quest4_Aim = "Nikova Raskol of Stormwind wants you to collect 10 Red Wool Bandanas."
Inst24Quest4_Location = "Nikova Raskol (Stormwind - Old Town; "..YELLOW.."75.6, 62.9"..WHITE..")"
Inst24Quest4_Note = "Nikova Raskol walks around Old Town. All mobs found inside the instance drops Red Wool Bandanas."
Inst24Quest4_Prequest = "None"
Inst24Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst24Quest5 = "5. The Fury Runs Deep"
Inst24Quest5_Level = "27"
Inst24Quest5_Attain = "22"
Inst24Quest5_Aim = "Motley Garmason wants Kam Deepfury's head brought to him at Dun Modr."
Inst24Quest5_Location = "Motley Garmason (Wetlands - Dun Modr; "..YELLOW.."49,18"..WHITE..")"
Inst24Quest5_Note = "The preceding quest can be obtained from Motley too. You can find Kam Deepfury at "..YELLOW.."[2]"..WHITE.."."
Inst24Quest5_Prequest = "The Dark Iron War"
Inst24Quest5_Folgequest = "None"
Inst24Quest5PreQuest = "true"
--
Inst24Quest5name1 = "Belt of Vindication"
Inst24Quest5name2 = "Headbasher"

--Quest 6 Alliance
Inst24Quest6 = "6. The Stockade Riots"
Inst24Quest6_Level = "29"
Inst24Quest6_Attain = "16"
Inst24Quest6_Aim = "Kill Bazil Thredd and bring his head back to Warden Thelwater at the Stockade."
Inst24Quest6_Location = "Warden Thelwater (Stormwind - The Stockade; "..YELLOW.."51.4, 68.8"..WHITE..")"
Inst24Quest6_Note = "For more details about the preceding quest see "..YELLOW.."[Deadmines, The Defias Brotherhood]"..WHITE..".\nYou can find Bazil Thredd at "..YELLOW.."[4]"..WHITE.."."
Inst24Quest6_Prequest = "The Defias Brotherhood -> Bazil Thredd"
Inst24Quest6_Folgequest = "The Curious Visitor"
Inst24Quest6PreQuest = "true"
-- No Rewards for this quest



--------------- INST25 - Sunken Temple (ST) ---------------

Inst25Story = "Over a thousand years ago, the powerful Gurubashi Empire was torn apart by a massive civil war. An influential group of troll priests, known as the Atal'ai, attempted to bring back an ancient blood god named Hakkar the Soulflayer. Though the priests were defeated and ultimately exiled, the great troll empire buckled in upon itself. The exiled priests fled far to the north, into the Swamp of Sorrows. There they erected a great temple to Hakkar - where they could prepare for his arrival into the physical world. The great dragon Aspect, Ysera, learned of the Atal'ai's plans and smashed the temple beneath the marshes. To this day, the temple's drowned ruins are guarded by the green dragons who prevent anyone from getting in or out. However, it is believed that some of the fanatical Atal'ai may have survived Ysera's wrath - and recommitted themselves to the dark service of Hakkar."
Inst25Caption = "The Sunken Temple"
Inst25QAA = "17 Quests"
Inst25QAH = "17 Quests"

--Quest 1 Alliance
Inst25Quest1 = "1. Into The Temple of Atal'Hakkar"
Inst25Quest1_Level = "50"
Inst25Quest1_Attain = "38"
Inst25Quest1_Aim = "Gather 10 Atal'ai Tablets for Brohann Caskbelly in Stormwind."
Inst25Quest1_Location = "Brohann Caskbelly (Stormwind - Dwarven District; "..YELLOW.."69.5, 40.4"..WHITE..")"
Inst25Quest1_Note = "The prequest line comes from the same NPC and has quite a few steps.\n\nYou can find the Tablets everywhere in the Temple, both outside and inside the instance."
Inst25Quest1_Prequest = "In Search of The Temple -> Rhapsody's Tale"
Inst25Quest1_Folgequest = "None"
Inst25Quest1PreQuest = "true"
--
Inst25Quest1name1 = "Guardian Talisman"

--Quest 2 Alliance
Inst25Quest2 = "2. The Sunken Temple"
Inst25Quest2_Level = "51"
Inst25Quest2_Attain = "46"
Inst25Quest2_Aim = "Find Marvon Rivetseeker in Tanaris."
Inst25Quest2_Location = "Angelas Moonbreeze (Feralas - Feathermoon Stronghold; "..YELLOW.."31,45"..WHITE..")"
Inst25Quest2_Note = "You find Marvon Rivetseeker at "..YELLOW.."52,45"..WHITE.."."
Inst25Quest2_Prequest = "None"
Inst25Quest2_Folgequest = "The Stone Circle"
-- No Rewards for this quest

--Quest 3 Alliance
Inst25Quest3 = "3. Into the Depths"
Inst25Quest3_Level = "51"
Inst25Quest3_Attain = "46"
Inst25Quest3_Aim = "Find the Altar of Hakkar in the Sunken Temple in Swamp of Sorrows."
Inst25Quest3_Location = "Marvon Rivetseeker (Tanaris; "..YELLOW.."52,45"..WHITE..")"
Inst25Quest3_Note = "The Altar is at "..YELLOW.."[1]"..WHITE.."."
Inst25Quest3_Prequest = "The Stone Circle"
Inst25Quest3_Folgequest = "None"
Inst25Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst25Quest4 = "4. Secret of the Circle"
Inst25Quest4_Level = "51"
Inst25Quest4_Attain = "46"
Inst25Quest4_Aim = "Travel into the Sunken Temple and discover the secret hidden in the circle of statues."
Inst25Quest4_Location = "Marvon Rivetseeker (Tanaris; "..YELLOW.."52,45"..WHITE..")"
Inst25Quest4_Note = "You find the statues at "..YELLOW.."[1]"..WHITE..". See map for order to activate them."
Inst25Quest4_Prequest = "The Stone Circle"
Inst25Quest4_Folgequest = "None"
Inst25Quest4PreQuest = "true"
--
Inst25Quest4name1 = "Hakkari Urn"

--Quest 5 Alliance
Inst25Quest5 = "5. Haze of Evil"
Inst25Quest5_Level = "52"
Inst25Quest5_Attain = "47"
Inst25Quest5_Aim = "Collect 5 samples of Atal'ai Haze, then return to Muigin in Un'Goro Crater."
Inst25Quest5_Location = "Gregan Brewspewer (Feralas; "..YELLOW.."45,25"..WHITE..")"
Inst25Quest5_Note = "The Prequest 'Muigin and Larion' starts at Muigin (Un'Goro Crater - Marshal's Refuge; "..YELLOW.."42,9"..WHITE.."). You get the Haze from Deep Lurkers, Murk Worms or Oozes in the Temple."
Inst25Quest5_Prequest = "Muigin and Larion -> A Visit to Gregan "
Inst25Quest5_Folgequest = "None"
Inst25Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst25Quest6 = "6. The God Hakkar"
Inst25Quest6_Level = "53"
Inst25Quest6_Attain = "40"
Inst25Quest6_Aim = "Bring the Filled Egg of Hakkar to Yeh'kinya in Tanaris."
Inst25Quest6_Location = "Yeh'kinya (Tanaris - Steamwheedle Port; "..YELLOW.."66,22"..WHITE..")"
Inst25Quest6_Note = "The Questline starts with 'Screecher Spirits' at the same NPC (See "..YELLOW.."[Zul'Farrak]"..WHITE..").\nYou have to use the Egg at "..YELLOW.."[3]"..WHITE.." to start the Event. Once it starts enemies spawn and attack you. Some of them drop the blood of Hakkar. With this blood you can put out the torch around the circle. After this the Avatar of Hakkar spawns. You kill him and loot the 'Essence of Hakkar' which you use to fill the egg."
Inst25Quest6_Prequest = "Screecher Spirits -> The Ancient Egg"
Inst25Quest6_Folgequest = "None"
Inst25Quest6PreQuest = "true"
--
Inst25Quest6name1 = "Avenguard Helm"
Inst25Quest6name2 = "Lifeforce Dirk"
Inst25Quest6name3 = "Gemburst Circlet"

--Quest 7 Alliance
Inst25Quest7 = "7. Jammal'an the Prophet"
Inst25Quest7_Level = "53"
Inst25Quest7_Attain = "38"
Inst25Quest7_Aim = "The Atal'ai Exile in The Hinterlands wants the Head of Jammal'an."
Inst25Quest7_Location = "The Atal'ai Exile (The Hinterlands; "..YELLOW.."33,75"..WHITE..")"
Inst25Quest7_Note = "You find Jammal'an at "..YELLOW.."[4]"..WHITE.."."
Inst25Quest7_Prequest = "None"
Inst25Quest7_Folgequest = "None"
--
Inst25Quest7name1 = "Rainstrider Leggings"
Inst25Quest7name2 = "Helm of Exile"

--Quest 8 Alliance
Inst25Quest8 = "8. The Essence of Eranikus"
Inst25Quest8_Level = "55"
Inst25Quest8_Attain = "48"
Inst25Quest8_Aim = "Place the Essence of Eranikus in the Essence Font located in this lair in the Sunken Temple."
Inst25Quest8_Location = "The Essence of Eranikus (drops from Shade of Eranikus; "..YELLOW.."[6]"..WHITE..")"
Inst25Quest8_Note = "You find the Essence Font next to where Shade of Eranikus is at "..YELLOW.."[6]"..WHITE.."."
Inst25Quest8_Prequest = "None"
Inst25Quest8_Folgequest = "None"
--
Inst25Quest8name1 = "Chained Essence of Eranikus"

--Quest 9 Alliance
Inst25Quest9 = "9. Trolls of a Feather (Warlock)"
Inst25Quest9_Level = "52"
Inst25Quest9_Attain = "50"
Inst25Quest9_Aim = "Bring a total of 6 Voodoo Feathers from the trolls in sunken temple."
Inst25Quest9_Location = "Impsy (Felwood; "..YELLOW.."42,45"..WHITE..")"
Inst25Quest9_Note = "Warlock quest. 1 Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center."
Inst25Quest9_Prequest = "An Imp's Request -> The Wrong Stuff"
Inst25Quest9_Folgequest = "None"
Inst25Quest9PreQuest = "true"
--
Inst25Quest9name1 = "Soul Harvester"
Inst25Quest9name2 = "Abyss Shard"
Inst25Quest9name3 = "Robes of Servitude"

--Quest 10 Alliance
Inst25Quest10 = "10. Voodoo Feathers (Warrior)"
Inst25Quest10_Level = "52"
Inst25Quest10_Attain = "50"
Inst25Quest10_Aim = "Bring the Voodoo Feathers from the trolls in the Sunken Temple to the Fallen Hero of the Horde."
Inst25Quest10_Location = "Fallen Hero of the Horde (Swamp of Sorrows; "..YELLOW.."34,66"..WHITE..")"
Inst25Quest10_Note = "Warrior quest. 1 Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center."
Inst25Quest10_Prequest = "A Troubled Spirit -> War on the Shadowsworn"
Inst25Quest10_Folgequest = "None"
Inst25Quest10PreQuest = "true"
--
Inst25Quest10name1 = "Fury Visor"
Inst25Quest10name2 = "Diamond Flask"
Inst25Quest10name3 = "Razorsteel Shoulders"

--Quest 11 Alliance
Inst25Quest11 = "11. Da Voodoo (Shaman)"
Inst25Quest11_Level = "52"
Inst25Quest11_Attain = "50"
Inst25Quest11_Aim = "Bring the voodoo feathers to Bath'rah the Windwatcher."
Inst25Quest11_Location = "Bath'rah the Windwatcher (Alterac Mountains; "..YELLOW.."80,67"..WHITE..")"
Inst25Quest11_Note = "Shaman quest. 1 Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center."
Inst25Quest11_Prequest = "Spirit Totem"
Inst25Quest11_Folgequest = "None"
Inst25Quest11PreQuest = "true"
--
Inst25Quest11name1 = "Azurite Fists"
Inst25Quest11name2 = "Enamored Water Spirit"
Inst25Quest11name3 = "Wildstaff"

--Quest 12 Alliance
Inst25Quest12 = "12. A Better Ingredient (Druid)"
Inst25Quest12_Level = "52"
Inst25Quest12_Attain = "50"
Inst25Quest12_Aim = "Retrieve a Putrid Vine from the guardian at the bottom of the Sunken Temple and return to Torwa Pathfinder."
Inst25Quest12_Location = "Torwa Pathfinder (Un'Goro Crater; "..YELLOW.."72,76"..WHITE..")"
Inst25Quest12_Note = "Druid quest. The Putrid Vine drops from Atal'alarion who is summoned at "..YELLOW.."[1]"..WHITE.." by activating the statues in the order listed on the map."
Inst25Quest12_Prequest = "Torwa Pathfinder -> Toxic Test"
Inst25Quest12_Folgequest = "None"
Inst25Quest12PreQuest = "true"
--
Inst25Quest12name1 = "Grizzled Pelt"
Inst25Quest12name2 = "Forest's Embrace"
Inst25Quest12name3 = "Moonshadow Stave"

--Quest 13 Alliance
Inst25Quest13 = "13. The Green Drake (Hunter)"
Inst25Quest13_Level = "52"
Inst25Quest13_Attain = "50"
Inst25Quest13_Aim = "Bring the Tooth of Morphaz to Ogtinc in Azshara. Ogtinc resides atop the cliffs northeast the Ruins of Eldarath."
Inst25Quest13_Location = "Ogtinc (Azshara; "..YELLOW.."42,43"..WHITE..")"
Inst25Quest13_Note = "Hunter quest. Morphaz is at "..YELLOW.."[5]"..WHITE.."."
Inst25Quest13_Prequest = "The Hunter's Charm -> Wavethrashing"
Inst25Quest13_Folgequest = "None"
Inst25Quest13PreQuest = "true"
--
Inst25Quest13name1 = "Hunting Spear"
Inst25Quest13name2 = "Devilsaur Eye"
Inst25Quest13name3 = "Devilsaur Tooth"

--Quest 14 Alliance
Inst25Quest14 = "14. Destroy Morphaz (Mage)"
Inst25Quest14_Level = "52"
Inst25Quest14_Attain = "50"
Inst25Quest14_Aim = "Retrieve the Arcane Shard from Morphaz and return to Archmage Xylem."
Inst25Quest14_Location = "Archmage Xylem (Azshara; "..YELLOW.."29,40"..WHITE..")"
Inst25Quest14_Note = "Mage quest. Morphaz is at "..YELLOW.."[5]"..WHITE.."."
Inst25Quest14_Prequest = "Magic Dust -> The Siren's Coral"
Inst25Quest14_Folgequest = "None"
Inst25Quest14PreQuest = "true"
--
Inst25Quest14name1 = "Glacial Spike"
Inst25Quest14name2 = "Arcane Crystal Pendant"
Inst25Quest14name3 = "Fire Ruby"

--Quest 15 Alliance
Inst25Quest15 = "15. Blood of Morphaz (Priest)"
Inst25Quest15_Level = "52"
Inst25Quest15_Attain = "50"
Inst25Quest15_Aim = "Kill Morphaz in the sunken temple of Atal'Hakkar, and return his blood to Greta Mosshoof in Felwood. The entrance to the sunken temple can be found in the Swamp of Sorrows."
Inst25Quest15_Location = "Ogtinc (Azshara; "..YELLOW.."42,43"..WHITE..")"
Inst25Quest15_Note = "Priest quest. Morphaz is at "..YELLOW.."[5]"..WHITE..". Greta Mosshoof is at Felwood - Emerald Sanctuary ("..YELLOW.."51,82"..WHITE..")."
Inst25Quest15_Prequest = "Cenarion Aid -> The Ichor of Undeath"
Inst25Quest15_Folgequest = "None"
Inst25Quest15PreQuest = "true"
--
Inst25Quest15name1 = "Blessed Prayer Beads"
Inst25Quest15name2 = "Woestave"
Inst25Quest15name3 = "Circle of Hope"

--Quest 16 Alliance
Inst25Quest16 = "16. The Azure Key (Rogue)"
Inst25Quest16_Level = "52"
Inst25Quest16_Attain = "50"
Inst25Quest16_Aim = "Return the Azure Key to Lord Jorach Ravenholdt."
Inst25Quest16_Location = "Archmage Xylem (Azshara; "..YELLOW.."29,40"..WHITE..")"
Inst25Quest16_Note = "Rogue quest. The Azure Key drops from Morphaz at "..YELLOW.."[5]"..WHITE..". Lord Jorach Ravenholdt is at Alterac Mountains - Ravenholdt ("..YELLOW.."86,79"..WHITE..")."
Inst25Quest16_Prequest = "A Simple Request -> Encoded Fragments"
Inst25Quest16_Folgequest = "None"
Inst25Quest16PreQuest = "true"
--
Inst25Quest16name1 = "Ebon Mask"
Inst25Quest16name2 = "Whisperwalk Boots"
Inst25Quest16name3 = "Duskbat Drape"

--Quest 17 Alliance
Inst25Quest17 = "17. Forging the Mightstone (Paladin)"
Inst25Quest17_Level = "52"
Inst25Quest17_Attain = "50"
Inst25Quest17_Aim = "Bring the voodoo feathers to Ashlam Valorfist."
Inst25Quest17_Location = "Commander Ashlam Valorfist (Western Plaguelands - Chillwind Camp; "..YELLOW.."43,85"..WHITE..")"
Inst25Quest17_Note = "Paladin quest. 1 Feather drops from each of the named trolls on the ledges overlooking the big room with the hole in the center."
Inst25Quest17_Prequest = "Inert Scourgestones"
Inst25Quest17_Folgequest = "None"
Inst25Quest17PreQuest = "true"
--
Inst25Quest17name1 = "Holy Mightstone"
Inst25Quest17name2 = "Lightforged Blade"
Inst25Quest17name3 = "Sanctified Orb"
Inst25Quest17name4 = "Chivalrous Signet"


--Quest 1 Horde
Inst25Quest1_HORDE = "1. The Temple of Atal'Hakkar"
Inst25Quest1_HORDE_Level = "50"
Inst25Quest1_HORDE_Attain = "38"
Inst25Quest1_HORDE_Aim = "Collect 20 Fetishes of Hakkar and bring them to Fel'Zerul in Stonard."
Inst25Quest1_HORDE_Location = "Fel'Zerul (Swamp of Sorrows - Stonard; "..YELLOW.."47,54"..WHITE..")"
Inst25Quest1_HORDE_Note = "All Enemys in the Temple drop Fetishes."
Inst25Quest1_HORDE_Prequest = "Pool of Tears -> Return to Fel'Zerul"
Inst25Quest1_HORDE_Folgequest = "None"
Inst25Quest1PreQuest_HORDE = "true"
--
Inst25Quest1name1_HORDE = "Guardian Talisman"

--Quest 2 Horde
Inst25Quest2_HORDE = "2. The Sunken Temple"
Inst25Quest2_HORDE_Level = "51"
Inst25Quest2_HORDE_Attain = "46"
Inst25Quest2_HORDE_Aim = "Find Marvon Rivetseeker in Tanaris."
Inst25Quest2_HORDE_Location = "Witch Doctor Uzer'i (Feralas; "..YELLOW.."74,43"..WHITE..")"
Inst25Quest2_HORDE_Note = "You find Marvon Rivetseeker at "..YELLOW.."52,45"..WHITE.."."
Inst25Quest2_HORDE_Prequest = "None"
Inst25Quest2_HORDE_Folgequest = "The Stone Circle"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst25Quest3_HORDE = Inst25Quest3
Inst25Quest3_HORDE_Level = Inst25Quest3_Level
Inst25Quest3_HORDE_Attain = Inst25Quest3_Attain
Inst25Quest3_HORDE_Aim = Inst25Quest3_Aim
Inst25Quest3_HORDE_Location = Inst25Quest3_Location
Inst25Quest3_HORDE_Note = Inst25Quest3_Note
Inst25Quest3_HORDE_Prequest = Inst25Quest3_Prequest
Inst25Quest3_HORDE_Folgequest = Inst25Quest3_Folgequest
Inst25Quest3PreQuest_HORDE = Inst25Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst25Quest4_HORDE = Inst25Quest4
Inst25Quest4_HORDE_Level = Inst25Quest4_Level
Inst25Quest4_HORDE_Attain = Inst25Quest4_Attain
Inst25Quest4_HORDE_Aim = Inst25Quest4_Aim
Inst25Quest4_HORDE_Location = Inst25Quest4_Location
Inst25Quest4_HORDE_Note = Inst25Quest4_Note
Inst25Quest4_HORDE_Prequest = Inst25Quest4_Prequest
Inst25Quest4_HORDE_Folgequest = Inst25Quest4_Folgequest
Inst25Quest4PreQuest_HORDE = Inst25Quest4PreQuest
--
Inst25Quest4name1_HORDE = Inst25Quest4name1

--Quest 5 Horde
Inst25Quest5_HORDE = "5. Zapper Fuel"
Inst25Quest5_HORDE_Level = "52"
Inst25Quest5_HORDE_Attain = "47"
Inst25Quest5_HORDE_Aim = "Deliver the Unloaded Zapper and 5 samples of Atal'ai Haze to Larion in Marshal's Refuge."
Inst25Quest5_HORDE_Location = "Liv Rizzlefix (Barrens; "..YELLOW.."62,38"..WHITE..")"
Inst25Quest5_HORDE_Note = "The Prequest 'Larion and Muigin' starts at Larion (Un'Goro Crater; "..YELLOW.."45,8"..WHITE.."). You get the Haze from Deep Lurkers, Murk Worms or Oozes in the Temple."
Inst25Quest5_HORDE_Prequest = "Larion and Muigin -> Marvon's Workshop"
Inst25Quest5_HORDE_Folgequest = "None"
Inst25Quest5PreQuest_HORDE = "true"

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst25Quest6_HORDE = Inst25Quest6
Inst25Quest6_HORDE_Level = Inst25Quest6_Level
Inst25Quest6_HORDE_Attain = Inst25Quest6_Attain
Inst25Quest6_HORDE_Aim = Inst25Quest6_Aim
Inst25Quest6_HORDE_Location = Inst25Quest6_Location
Inst25Quest6_HORDE_Note = Inst25Quest6_Note
Inst25Quest6_HORDE_Prequest = Inst25Quest6_Prequest
Inst25Quest6_HORDE_Folgequest = Inst25Quest6_Folgequest
Inst25Quest6PreQuest_HORDE = Inst25Quest6PreQuest
--
Inst25Quest6name1_HORDE = Inst25Quest6name1
Inst25Quest6name2_HORDE = Inst25Quest6name2
Inst25Quest6name3_HORDE = Inst25Quest6name3

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst25Quest7_HORDE = Inst25Quest7
Inst25Quest7_HORDE_Level = Inst25Quest7_Level
Inst25Quest7_HORDE_Attain = Inst25Quest7_Attain
Inst25Quest7_HORDE_Aim = Inst25Quest7_Aim
Inst25Quest7_HORDE_Location = Inst25Quest7_Location
Inst25Quest7_HORDE_Note = Inst25Quest7_Note
Inst25Quest7_HORDE_Prequest = Inst25Quest7_Prequest
Inst25Quest7_HORDE_Folgequest = Inst25Quest7_Folgequest
--
Inst25Quest7name1_HORDE = Inst25Quest7name1
Inst25Quest7name2_HORDE = Inst25Quest7name2

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst25Quest8_HORDE = Inst25Quest8
Inst25Quest8_HORDE_Level = Inst25Quest8_Level
Inst25Quest8_HORDE_Attain = Inst25Quest8_Attain
Inst25Quest8_HORDE_Aim = Inst25Quest8_Aim
Inst25Quest8_HORDE_Location = Inst25Quest8_Location
Inst25Quest8_HORDE_Note = Inst25Quest8_Note
Inst25Quest8_HORDE_Prequest = Inst25Quest8_Prequest
Inst25Quest8_HORDE_Folgequest = Inst25Quest8_Folgequest
--
Inst25Quest8name1_HORDE = Inst25Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst25Quest9_HORDE = Inst25Quest9
Inst25Quest9_HORDE_Level = Inst25Quest9_Level
Inst25Quest9_HORDE_Attain = Inst25Quest9_Attain
Inst25Quest9_HORDE_Aim = Inst25Quest9_Aim
Inst25Quest9_HORDE_Location = Inst25Quest9_Location
Inst25Quest9_HORDE_Note = Inst25Quest9_Note
Inst25Quest9_HORDE_Prequest = Inst25Quest9_Prequest
Inst25Quest9_HORDE_Folgequest = Inst25Quest9_Folgequest
Inst25Quest9PreQuest_HORDE = Inst25Quest9PreQuest
--
Inst25Quest9name1_HORDE = Inst25Quest9name1
Inst25Quest9name2_HORDE = Inst25Quest9name2
Inst25Quest9name3_HORDE = Inst25Quest9name3

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst25Quest10_HORDE = Inst25Quest10
Inst25Quest10_HORDE_Level = Inst25Quest10_Level
Inst25Quest10_HORDE_Attain = Inst25Quest10_Attain
Inst25Quest10_HORDE_Aim = Inst25Quest10_Aim
Inst25Quest10_HORDE_Location = Inst25Quest10_Location
Inst25Quest10_HORDE_Note = Inst25Quest10_Note
Inst25Quest10_HORDE_Prequest = Inst25Quest10_Prequest
Inst25Quest10_HORDE_Folgequest = Inst25Quest10_Folgequest
Inst25Quest10PreQuest_HORDE = Inst25Quest10PreQuest
--
Inst25Quest10name1_HORDE = Inst25Quest10name1
Inst25Quest10name2_HORDE = Inst25Quest10name2
Inst25Quest10name3_HORDE = Inst25Quest10name3

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst25Quest11_HORDE = Inst25Quest11
Inst25Quest11_HORDE_Level = Inst25Quest11_Level
Inst25Quest11_HORDE_Attain = Inst25Quest11_Attain
Inst25Quest11_HORDE_Aim = Inst25Quest11_Aim
Inst25Quest11_HORDE_Location = Inst25Quest11_Location
Inst25Quest11_HORDE_Note = Inst25Quest11_Note
Inst25Quest11_HORDE_Prequest = Inst25Quest11_Prequest
Inst25Quest11_HORDE_Folgequest = Inst25Quest11_Folgequest
Inst25Quest11PreQuest_HORDE = Inst25Quest11PreQuest
--
Inst25Quest11name1_HORDE = Inst25Quest11name1
Inst25Quest11name2_HORDE = Inst25Quest11name2
Inst25Quest11name3_HORDE = Inst25Quest11name3

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst25Quest12_HORDE = Inst25Quest12
Inst25Quest12_HORDE_Level = Inst25Quest12_Level
Inst25Quest12_HORDE_Attain = Inst25Quest12_Attain
Inst25Quest12_HORDE_Aim = Inst25Quest12_Aim
Inst25Quest12_HORDE_Location = Inst25Quest12_Location
Inst25Quest12_HORDE_Note = Inst25Quest12_Note
Inst25Quest12_HORDE_Prequest = Inst25Quest12_Prequest
Inst25Quest12_HORDE_Folgequest = Inst25Quest12_Folgequest
Inst25Quest12PreQuest_HORDE = Inst25Quest12PreQuest
--
Inst25Quest12name1_HORDE = Inst25Quest12name1
Inst25Quest12name2_HORDE = Inst25Quest12name2
Inst25Quest12name3_HORDE = Inst25Quest12name3

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst25Quest13_HORDE = Inst25Quest13
Inst25Quest13_HORDE_Level = Inst25Quest13_Level
Inst25Quest13_HORDE_Attain = Inst25Quest13_Attain
Inst25Quest13_HORDE_Aim = Inst25Quest13_Aim
Inst25Quest13_HORDE_Location = Inst25Quest13_Location
Inst25Quest13_HORDE_Note = Inst25Quest13_Note
Inst25Quest13_HORDE_Prequest = Inst25Quest13_Prequest
Inst25Quest13_HORDE_Folgequest = Inst25Quest13_Folgequest
Inst25Quest13PreQuest_HORDE = Inst25Quest13PreQuest
--
Inst25Quest13name1_HORDE = Inst25Quest13name1
Inst25Quest13name2_HORDE = Inst25Quest13name2
Inst25Quest13name3_HORDE = Inst25Quest13name3

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst25Quest14_HORDE = Inst25Quest14
Inst25Quest14_HORDE_Level = Inst25Quest14_Level
Inst25Quest14_HORDE_Attain = Inst25Quest14_Attain
Inst25Quest14_HORDE_Aim = Inst25Quest14_Aim
Inst25Quest14_HORDE_Location = Inst25Quest14_Location
Inst25Quest14_HORDE_Note = Inst25Quest14_Note
Inst25Quest14_HORDE_Prequest = Inst25Quest14_Prequest
Inst25Quest14_HORDE_Folgequest = Inst25Quest14_Folgequest
Inst25Quest14PreQuest_HORDE = Inst25Quest14PreQuest
--
Inst25Quest14name1_HORDE = Inst25Quest14name1
Inst25Quest14name2_HORDE = Inst25Quest14name2
Inst25Quest14name3_HORDE = Inst25Quest14name3

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst25Quest15_HORDE = Inst25Quest15
Inst25Quest15_HORDE_Level = Inst25Quest15_Level
Inst25Quest15_HORDE_Attain = Inst25Quest15_Attain
Inst25Quest15_HORDE_Aim = Inst25Quest15_Aim
Inst25Quest15_HORDE_Location = Inst25Quest15_Location
Inst25Quest15_HORDE_Note = Inst25Quest15_Note
Inst25Quest15_HORDE_Prequest = Inst25Quest15_Prequest
Inst25Quest15_HORDE_Folgequest = Inst25Quest15_Folgequest
Inst25Quest15PreQuest_HORDE = Inst25Quest15PreQuest
--
Inst25Quest15name1_HORDE = Inst25Quest15name1
Inst25Quest15name2_HORDE = Inst25Quest15name2
Inst25Quest15name3_HORDE = Inst25Quest15name3

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst25Quest16_HORDE = Inst25Quest16
Inst25Quest16_HORDE_Level = Inst25Quest16_Level
Inst25Quest16_HORDE_Attain = Inst25Quest16_Attain
Inst25Quest16_HORDE_Aim = Inst25Quest16_Aim
Inst25Quest16_HORDE_Location = Inst25Quest16_Location
Inst25Quest16_HORDE_Note = Inst25Quest16_Note
Inst25Quest16_HORDE_Prequest = Inst25Quest16_Prequest
Inst25Quest16_HORDE_Folgequest = Inst25Quest16_Folgequest
Inst25Quest16PreQuest_HORDE = Inst25Quest16PreQuest
--
Inst25Quest16name1_HORDE = Inst25Quest16name1
Inst25Quest16name2_HORDE = Inst25Quest16name2
Inst25Quest16name3_HORDE = Inst25Quest16name3

--Quest 17 Horde
Inst25Quest17_HORDE = "17. Ancient Evil (Paladin)"
Inst25Quest17_HORDE_Level = "52"
Inst25Quest17_HORDE_Attain = "50"
Inst25Quest17_HORDE_Aim = "Unlock the secrets of the Temple of Atal'Hakkar to release Atal'alarion and recover the Putrid Vine from his flesh. Return to Mehlar at the Bulwark when you have done this."
Inst25Quest17_HORDE_Location = "Lady Sylvanas Windrunner (Undercity - Royal Quarter; "..YELLOW.."59,94"..WHITE..")"
Inst25Quest17_HORDE_Note = "Paladin quest. The Putrid Vine drops from Atal'alarion who is summoned at "..YELLOW.."[1]"..WHITE.." by activating the statues in the order listed on the map. Mehlar is at Tirisfal Glades - The Bulwark ("..YELLOW.."83,71"..WHITE..")."
Inst25Quest17_HORDE_Prequest = "To The Bulwark -> Wisdom of the Banshee Queen"
Inst25Quest17_HORDE_Folgequest = "None"
Inst25Quest17PreQuest_HORDE = "true"
--
Inst25Quest17name1_HORDE = "Scourgebane"



--------------- INST26 - The Temple of Ahn'Qiraj (AQ40) ---------------

Inst26Story = "At the heart of Ahn'Qiraj lies an ancient temple complex. Built in the time before recorded history, it is both a monument to unspeakable gods and a massive breeding ground for the qiraji army. Since the War of the Shifting Sands ended a thousand years ago, the Twin Emperors of the qiraji empire have been trapped inside their temple, barely contained behind the magical barrier erected by the bronze dragon Anachronos and the night elves. Now that the Scepter of the Shifting Sands has been reassembled and the seal has been broken, the way into the inner sanctum of Ahn'Qiraj is open. Beyond the crawling madness of the hives, beneath the Temple of Ahn'Qiraj, legions of qiraji prepare for invasion. They must be stopped at all costs before they can unleash their voracious insectoid armies on Kalimdor once again, and a second War of the Shifting Sands breaks loose!"
Inst26Caption = "Temple of Ahn'Qiraj"
Inst26QAA = "4 Quests"
Inst26QAH = "4 Quests"

--Quest 1 Alliance
Inst26Quest1 = "1. C'Thun's Legacy"
Inst26Quest1_Level = "60"
Inst26Quest1_Attain = "60"
Inst26Quest1_Aim = "Take the Eye of C'Thun to Caelastrasz in the Temple of Ahn'Qiraj."
Inst26Quest1_Location = "Eye of C'Thun (drops from C'Thun; "..YELLOW.."[9]"..WHITE..")"
Inst26Quest1_Note = "Caelestrasz (Temple of Ahn'Qiraj; "..YELLOW.."2'"..WHITE..")"
Inst26Quest1_Prequest = "None"
Inst26Quest1_Folgequest = "The Savior of Kalimdor"
-- No Rewards for this quest

--Quest 2 Alliance
Inst26Quest2 = "2. The Savior of Kalimdor"
Inst26Quest2_Level = "60"
Inst26Quest2_Attain = "60"
Inst26Quest2_Aim = "Take the Eye of C'Thun to Anachronos at the Caverns of Time."
Inst26Quest2_Location = "Eye of C'Thun (drops from C'Thun; "..YELLOW.."[9]"..WHITE..")"
Inst26Quest2_Note = "Anachronos (Tanaris - Caverns of Time; "..YELLOW.."65,49"..WHITE..")"
Inst26Quest2_Prequest = "C'Thun's Legacy"
Inst26Quest2_Folgequest = "None"
Inst26Quest2FQuest = "true"
--
Inst26Quest2name1 = "Amulet of the Fallen God"
Inst26Quest2name2 = "Cloak of the Fallen God"
Inst26Quest2name3 = "Ring of the Fallen God"

--Quest 3 Alliance
Inst26Quest3 = "3. Secrets of the Qiraji"
Inst26Quest3_Level = "60"
Inst26Quest3_Attain = "60"
Inst26Quest3_Aim = "Take the Ancient Qiraji Artifact to the dragons hiding near the entrance of the temple."
Inst26Quest3_Location = "Ancient Qiraji Artifact (random drop in Temple of Ahn'Qiraj)"
Inst26Quest3_Note = "Turns in to Andorgos (Temple of Ahn'Qiraj; "..YELLOW.."1'"..WHITE..")."
Inst26Quest3_Prequest = "None"
Inst26Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst26Quest4 = "4. Mortal Champions"
Inst26Quest4_Level = "60"
Inst26Quest4_Attain = "60"
Inst26Quest4_Aim = "Turn in a Qiraji Lord's Insignia to Kandrostrasz in the Temple of Ahn'Qiraj."
Inst26Quest4_Location = "Kandrostrasz (Temple of Ahn'Qiraj; "..YELLOW.."[1']"..WHITE..")"
Inst26Quest4_Note = "This is a repeatable quest which yields Cenarion Circle reputation. The Qiraji Lord's Insignia drop from all bosses inside the instance. Kandrostrasz is found in the rooms behind the first boss."
Inst26Quest4_Prequest = "None"
Inst26Quest4_Folgequest = "None"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst26Quest1_HORDE = Inst26Quest1
Inst26Quest1_HORDE_Level = Inst26Quest1_Level
Inst26Quest1_HORDE_Attain = Inst26Quest1_Attain
Inst26Quest1_HORDE_Aim = Inst26Quest1_Aim
Inst26Quest1_HORDE_Location = Inst26Quest1_Location
Inst26Quest1_HORDE_Note = Inst26Quest1_Note
Inst26Quest1_HORDE_Prequest = Inst26Quest1_Prequest
Inst26Quest1_HORDE_Folgequest = Inst26Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst26Quest2_HORDE = Inst26Quest2
Inst26Quest2_HORDE_Level = Inst26Quest2_Level
Inst26Quest2_HORDE_Attain = Inst26Quest2_Attain
Inst26Quest2_HORDE_Aim = Inst26Quest2_Aim
Inst26Quest2_HORDE_Location = Inst26Quest2_Location
Inst26Quest2_HORDE_Note = Inst26Quest2_Note
Inst26Quest2_HORDE_Prequest = Inst26Quest2_Prequest
Inst26Quest2_HORDE_Folgequest = Inst26Quest2_Folgequest
Inst26Quest2FQuest_HORDE = Inst26Quest2FQuest
--
Inst26Quest2name1_HORDE = Inst26Quest2name1
Inst26Quest2name2_HORDE = Inst26Quest2name2
Inst26Quest2name3_HORDE = Inst26Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst26Quest3_HORDE = Inst26Quest3
Inst26Quest3_HORDE_Level = Inst26Quest3_Level
Inst26Quest3_HORDE_Attain = Inst26Quest3_Attain
Inst26Quest3_HORDE_Aim = Inst26Quest3_Aim
Inst26Quest3_HORDE_Location = Inst26Quest3_Location
Inst26Quest3_HORDE_Note = Inst26Quest3_Note
Inst26Quest3_HORDE_Prequest = Inst26Quest3_Prequest
Inst26Quest3_HORDE_Folgequest = Inst26Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst26Quest4_HORDE = Inst26Quest4
Inst26Quest4_HORDE_Level = Inst26Quest4_Level
Inst26Quest4_HORDE_Attain = Inst26Quest4_Attain
Inst26Quest4_HORDE_Aim = Inst26Quest4_Aim
Inst26Quest4_HORDE_Location = Inst26Quest4_Location
Inst26Quest4_HORDE_Note = Inst26Quest4_Note
Inst26Quest4_HORDE_Prequest = Inst26Quest4_Prequest
Inst26Quest4_HORDE_Folgequest = Inst26Quest4_Folgequest
-- No Rewards for this quest



--------------- INST27 - Zul'Farrak (ZF) ---------------

Inst27Story = "This sun-blasted city is home to the Sandfury trolls, known for their particular ruthlessness and dark mysticism. Troll legends tell of a powerful sword called Sul'thraze the Lasher, a weapon capable of instilling fear and weakness in even the most formidable of foes. Long ago, the weapon was split in half. However, rumors have circulated that the two halves may be found somewhere within Zul'Farrak's walls. Reports have also suggested that a band of mercenaries fleeing Gadgetzan wandered into the city and became trapped. Their fate remains unknown. But perhaps most disturbing of all are the hushed whispers of an ancient creature sleeping within a sacred pool at the city's heart - a mighty demigod who will wreak untold destruction upon any adventurer foolish enough to awaken him."
Inst27Caption = "Zul'Farrak"
Inst27QAA = "7 Quests"
Inst27QAH = "7 Quests"

--Quest 1 Alliance
Inst27Quest1 = "1. Troll Temper"
Inst27Quest1_Level = "45"
Inst27Quest1_Attain = "40"
Inst27Quest1_Aim = "Bring 20 Vials of Troll Temper to Trenton Lighthammer in Gadgetzan."
Inst27Quest1_Location = "Trenton Lighthammer (Tanaris - Gadgetzan; "..YELLOW.."51,28"..WHITE..")"
Inst27Quest1_Note = "Every Troll can drop the Tempers."
Inst27Quest1_Prequest = "None"
Inst27Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst27Quest2 = "2. Scarab Shells"
Inst27Quest2_Level = "45"
Inst27Quest2_Attain = "40"
Inst27Quest2_Aim = "Bring 5 Uncracked Scarab Shells to Tran'rek in Gadgetzan."
Inst27Quest2_Location = "Tran'rek (Tanaris - Gadgetzan; "..YELLOW.."51,26"..WHITE..")"
Inst27Quest2_Note = "The prequest starts at Krazek (Stranglethorn Vale - Booty Bay; "..YELLOW.."25,77"..WHITE..").\nEvery Scarab can drop the Shells. A lot of Scarabs are at "..YELLOW.."[2]"..WHITE.."."
Inst27Quest2_Prequest = "Tran'rek"
Inst27Quest2_Folgequest = "None"
Inst27Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst27Quest3 = "3. Tiara of the Deep"
Inst27Quest3_Level = "46"
Inst27Quest3_Attain = "40"
Inst27Quest3_Aim = "Bring the Tiara of the Deep to Tabetha in Dustwallow Marsh."
Inst27Quest3_Location = "Tabetha (Dustwallow Marsh; "..YELLOW.."46,57"..WHITE..")"
Inst27Quest3_Note = "You get the prequest from Bink (Ironforge; "..YELLOW.."25,8"..WHITE..").\nHydromancer Velratha drops the Tiara of the Deep at "..YELLOW.."[6]"..WHITE.."."
Inst27Quest3_Prequest = "Tabetha's Task"
Inst27Quest3_Folgequest = "None"
Inst27Quest3PreQuest = "true"
--
Inst27Quest3name1 = "Spellshifter Rod"
Inst27Quest3name2 = "Gemshale Pauldrons"

--Quest 4 Alliance
Inst27Quest4 = "4. Nekrum's Medallion"
Inst27Quest4_Level = "47"
Inst27Quest4_Attain = "40"
Inst27Quest4_Aim = "Bring Nekrum's Medallion to Thadius Grimshade in the Blasted Lands."
Inst27Quest4_Location = "Thadius Grimshade (The Blasted Lands - Nethergarde Keep; "..YELLOW.."66,19"..WHITE..")"
Inst27Quest4_Note = "The Questline starts at Gryphon Master Talonaxe (The Hinterlands - Wildhammer Stronghold; "..YELLOW.."9,44"..WHITE..").\nNekrum spawns at "..YELLOW.."[4]"..WHITE.." with the final crowd you fight for the Temple event."
Inst27Quest4_Prequest = "Witherbark Cages -> Thadius Grimshade"
Inst27Quest4_Folgequest = "The Divination"
Inst27Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst27Quest5 = "5. The Prophecy of Mosh'aru"
Inst27Quest5_Level = "47"
Inst27Quest5_Attain = "40"
Inst27Quest5_Aim = "Bring the First and Second Mosh'aru Tablets to Yeh'kinya in Tanaris."
Inst27Quest5_Location = "Yeh'kinya (Tanaris - Steamwheedle Port; "..YELLOW.."66,22"..WHITE..")"
Inst27Quest5_Note = "You get the prequest from the same NPC.\nThe Tablets drop from Theka the Martyr at "..YELLOW.."[2]"..WHITE.." and Hydromancer Velratha at "..YELLOW.."[6]"..WHITE.."."
Inst27Quest5_Prequest = "Screecher Spirits"
Inst27Quest5_Folgequest = "The Ancient Egg"
Inst27Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst27Quest6 = "6. Divino-matic Rod"
Inst27Quest6_Level = "47"
Inst27Quest6_Attain = "40"
Inst27Quest6_Aim = "Bring the Divino-matic Rod to Chief Engineer Bilgewhizzle in Gadgetzan."
Inst27Quest6_Location = "Chief Engineer Bilgewhizzle (Tanaris - Gadgetzan; "..YELLOW.."52,28"..WHITE..")"
Inst27Quest6_Note = "You get the Rod from Sergeant Bly. You can find him at "..YELLOW.."[4]"..WHITE.." after the Temple event."
Inst27Quest6_Prequest = "None"
Inst27Quest6_Folgequest = "None"
--
Inst27Quest6name1 = "Masons Fraternity Ring"
Inst27Quest6name2 = "Engineer's Guild Headpiece"

--Quest 7 Alliance
Inst27Quest7 = "7. Gahz'rilla"
Inst27Quest7_Level = "50"
Inst27Quest7_Attain = "40"
Inst27Quest7_Aim = "Bring Gahz'rilla's Electrified Scale to Wizzle Brassbolts in the Shimmering Flats."
Inst27Quest7_Location = "Wizzle Brassbolts (Thousands Needles - Mirage Raceway; "..YELLOW.."78,77"..WHITE..")"
Inst27Quest7_Note = "You get the prequest from Klockmort Spannerspan (Ironforge - Tinkertown; "..YELLOW.."68,46"..WHITE.."). It is not necessary to have the prequest to get the Gahz'rilla quest.\nYou summon Gahz'rilla at "..YELLOW.."[6]"..WHITE.." by banging the gong. The Mallet of Zul'Farrak is no longer required."
Inst27Quest7_Prequest = "The Brassbolts Brothers"
Inst27Quest7_Folgequest = "None"
Inst27Quest7PreQuest = "true"
--
Inst27Quest7name1 = "Carrot on a Stick"


--Quest 1 Horde
Inst27Quest1_HORDE = "1. The Spider God"
Inst27Quest1_HORDE_Level = "45"
Inst27Quest1_HORDE_Attain = "40"
Inst27Quest1_HORDE_Aim = "Read from the Tablet of Theka to learn the name of the Witherbark spider god, then return to Master Gadrin."
Inst27Quest1_HORDE_Location = "Meister Gadrin (Durotar - Sen'jin Village; "..YELLOW.."55,74"..WHITE..")"
Inst27Quest1_HORDE_Note = "The Questline starts at a Venom Bottle, which is found on tables in Troll Villages in The Hinterlands.\nYou find the Tablet at "..YELLOW.."[2]"..WHITE.."."
Inst27Quest1_HORDE_Prequest = "Venom Bottles -> Consult Master Gadrin"
Inst27Quest1_HORDE_Folgequest = "Summoning Shadra"
Inst27Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 1 Alliance)
Inst27Quest2_HORDE = "2. Troll Temper"
Inst27Quest2_HORDE_Level = Inst27Quest1_Level
Inst27Quest2_HORDE_Attain = Inst27Quest1_Attain
Inst27Quest2_HORDE_Aim = Inst27Quest1_Aim
Inst27Quest2_HORDE_Location = Inst27Quest1_Location
Inst27Quest2_HORDE_Note = Inst27Quest1_Note
Inst27Quest2_HORDE_Prequest = Inst27Quest1_Prequest
Inst27Quest2_HORDE_Folgequest = Inst27Quest1_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst27Quest3_HORDE = "3. Scarab Shells"
Inst27Quest3_HORDE_Level = Inst27Quest2_Level
Inst27Quest3_HORDE_Attain = Inst27Quest2_Attain
Inst27Quest3_HORDE_Aim = Inst27Quest2_Aim
Inst27Quest3_HORDE_Location = Inst27Quest2_Location
Inst27Quest3_HORDE_Note = Inst27Quest2_Note
Inst27Quest3_HORDE_Prequest = Inst27Quest2_Prequest
Inst27Quest3_HORDE_Folgequest = Inst27Quest2_Folgequest
Inst27Quest3PreQuest_HORDE = Inst27Quest2PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 3 Alliance - no prequest)
Inst27Quest4_HORDE = "4. Tiara of the Deep"
Inst27Quest4_HORDE_Level = Inst27Quest3_Level
Inst27Quest4_HORDE_Attain = Inst27Quest3_Attain
Inst27Quest4_HORDE_Aim = Inst27Quest3_Aim
Inst27Quest4_HORDE_Location = Inst27Quest3_Location
Inst27Quest4_HORDE_Note = "Hydromancer Velratha drops the Tiara of the Deep at "..YELLOW.."[6]"..WHITE.."."
Inst27Quest4_HORDE_Prequest = "None"
Inst27Quest4_HORDE_Folgequest = Inst27Quest3_Folgequest
--
Inst27Quest4name1_HORDE = Inst27Quest3name1
Inst27Quest4name2_HORDE = Inst27Quest3name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst27Quest5_HORDE = Inst27Quest5
Inst27Quest5_HORDE_Level = Inst27Quest5_Level
Inst27Quest5_HORDE_Attain = Inst27Quest5_Attain
Inst27Quest5_HORDE_Aim = Inst27Quest5_Aim
Inst27Quest5_HORDE_Location = Inst27Quest5_Location
Inst27Quest5_HORDE_Note = Inst27Quest5_Note
Inst27Quest5_HORDE_Prequest = Inst27Quest5_Prequest
Inst27Quest5_HORDE_Folgequest = Inst27Quest5_Folgequest
Inst27Quest5PreQuest_HORDE = Inst27Quest5Prequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst27Quest6_HORDE = Inst27Quest6
Inst27Quest6_HORDE_Level = Inst27Quest6_Level
Inst27Quest6_HORDE_Attain = Inst27Quest6_Attain
Inst27Quest6_HORDE_Aim = Inst27Quest6_Aim
Inst27Quest6_HORDE_Location = Inst27Quest6_Location
Inst27Quest6_HORDE_Note = Inst27Quest6_Note
Inst27Quest6_HORDE_Prequest = Inst27Quest6_Prequest
Inst27Quest6_HORDE_Folgequest = Inst27Quest6_Folgequest
--
Inst27Quest6name1_HORDE = Inst27Quest6name1
Inst27Quest6name2_HORDE = Inst27Quest6name2

--Quest 7 Horde  (same as Quest 7 Alliance - no prequest)
Inst27Quest7_HORDE = Inst27Quest7
Inst27Quest7_HORDE_Level = Inst27Quest7_Level
Inst27Quest7_HORDE_Attain = Inst27Quest7_Attain
Inst27Quest7_HORDE_Aim = Inst27Quest7_Aim
Inst27Quest7_HORDE_Location = Inst27Quest7_Location
Inst27Quest7_HORDE_Note = "You summon Gahz'rilla at "..YELLOW.."[6]"..WHITE.." by banging the gong. The Mallet of Zul'Farrak is no longer required."
Inst27Quest7_HORDE_Prequest = "None"
Inst27Quest7_HORDE_Folgequest = Inst27Quest7_Folgequest
--
Inst27Quest7name1_HORDE = Inst27Quest7name1



--------------- INST28 - Zul'Gurub (ZG) ---------------

Inst28Story = {
  ["Page1"] = "Over a thousand years ago the powerful Gurubashi Empire was torn apart by a massive civil war. An influential group of troll priests, known as the Atal'ai, called forth the avatar of an ancient and terrible blood god named Hakkar the Soulflayer. Though the priests were defeated and ultimately exiled, the great troll empire collapsed upon itself. The exiled priests fled far to the north, into the Swamp of Sorrows, where they erected a great temple to Hakkar in order to prepare for his arrival into the physical world.",
  ["Page2"] = "In time, the Atal'ai priests discovered that Hakkar's physical form could only be summoned within the ancient capital of the Gurubashi Empire, Zul'Gurub. Unfortunately, the priests have met with recent success in their quest to call forth Hakkar - reports confirm the presence of the dreaded Soulflayer in the heart of the Gurubashi ruins.\n\nIn order to quell the blood god, the trolls of the land banded together and sent a contingent of High Priests into the ancient city. Each priest was a powerful champion of the Primal Gods - Bat, Panther, Tiger, Spider, and Snake - but despite their best efforts, they fell under the sway of Hakkar. Now the champions and their Primal God aspects feed the awesome power of the Soulflayer. Any adventurers brave enough to venture into the foreboding ruins must overcome the High Priests if they are to have any hope of confronting the mighty blood god.",
  ["MaxPages"] = "2",
};
Inst28Caption = "Zul'Gurub"
Inst28QAA = "4 Quests"
Inst28QAH = "4 Quests"

--Quest 1 Alliance
Inst28Quest1 = "1. A Collection of Heads"
Inst28Quest1_Level = "60"
Inst28Quest1_Attain = "58"
Inst28Quest1_Aim = "String 5 Channeler's Heads, then return the Collection of Troll Heads to Exzhal on Yojamba Isle."
Inst28Quest1_Location = "Exzhal (Stranglethorn Vale - Yojamba Isle; "..YELLOW.."15,15"..WHITE..")"
Inst28Quest1_Note = "Make sure you loot all the priests."
Inst28Quest1_Prequest = "None"
Inst28Quest1_Folgequest = "None"
--
Inst28Quest1name1 = "Belt of Shrunken Heads"
Inst28Quest1name2 = "Belt of Shriveled Heads"
Inst28Quest1name3 = "Belt of Preserved Heads"
Inst28Quest1name4 = "Belt of Tiny Heads"

--Quest 2 Alliance
Inst28Quest2 = "2. The Heart of Hakkar"
Inst28Quest2_Level = "60"
Inst28Quest2_Attain = "58"
Inst28Quest2_Aim = "Bring the Heart of Hakkar to Molthor on Yojamba Isle."
Inst28Quest2_Location = "Heart of Hakkar (drops from Hakkar; "..YELLOW.."[11]"..WHITE..")"
Inst28Quest2_Note = "Molthor (Stranglethorn Vale - Yojamba Isle; "..YELLOW.."15,15"..WHITE..")"
Inst28Quest2_Prequest = "None"
Inst28Quest2_Folgequest = "None"
--
Inst28Quest2name1 = "Zandalarian Hero Badge"
Inst28Quest2name2 = "Zandalarian Hero Charm"
Inst28Quest2name3 = "Zandalarian Hero Medallion"

--Quest 3 Alliance
Inst28Quest3 = "3. Nat's Measuring Tape"
Inst28Quest3_Level = "60"
Inst28Quest3_Attain = "59"
Inst28Quest3_Aim = "Return Nat's Measuring Tape to Nat Pagle in Dustwallow Marsh."
Inst28Quest3_Location = "Battered Tackle Box (Zul'Gurub - Northeast by water from Hakkar's Island)"
Inst28Quest3_Note = "Nat Pagle is at Dustwallow Marsh ("..YELLOW.."59,60"..WHITE.."). Turning the quest in allows you to buy Mudskunk Lures from Nat Pagle to summon Gahz'ranka in Zul'Gurub."
Inst28Quest3_Prequest = "None"
Inst28Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst28Quest4 = "4. The Perfect Poison"
Inst28Quest4_Level = "60"
Inst28Quest4_Attain = "60"
Inst28Quest4_Aim = "Dirk Thunderwood at Cenarion Hold wants you to bring him Venoxis's Venom Sac and Kurinnaxx's Venom Sac."
Inst28Quest4_Location = "Dirk Thunderwood (Silithus - Cenarion Hold; "..YELLOW.."52,39"..WHITE..")"
Inst28Quest4_Note = "Venoxis's Venom Sac drops from High priest Venoxis in "..YELLOW.."Zul'Gurub"..WHITE.." at "..YELLOW.."[2]"..WHITE..". Kurinnaxx's Venom Sac drops in the "..YELLOW.."Ruins of Ahn'Qiraj"..WHITE.." at "..YELLOW.."[1]"..WHITE.."."
Inst28Quest4_Prequest = "None"
Inst28Quest4_Folgequest = "None"
--
Inst28Quest4name1 = "Ravenholdt Slicer"
Inst28Quest4name2 = "Shivsprocket's Shiv"
Inst28Quest4name3 = "The Thunderwood Poker"
Inst28Quest4name4 = "Doomulus Prime"
Inst28Quest4name5 = "Fahrad's Reloading Repeater"
Inst28Quest4name6 = "Simone's Cultivating Hammer"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst28Quest1_HORDE = Inst28Quest1
Inst28Quest1_HORDE_Level = Inst28Quest1_Level
Inst28Quest1_HORDE_Attain = Inst28Quest1_Attain
Inst28Quest1_HORDE_Aim = Inst28Quest1_Aim
Inst28Quest1_HORDE_Location = Inst28Quest1_Location
Inst28Quest1_HORDE_Note = Inst28Quest1_Note
Inst28Quest1_HORDE_Prequest = Inst28Quest1_Prequest
Inst28Quest1_HORDE_Folgequest = Inst28Quest1_Folgequest
--
Inst28Quest1name1_HORDE = Inst28Quest1name1
Inst28Quest1name2_HORDE = Inst28Quest1name2
Inst28Quest1name3_HORDE = Inst28Quest1name3
Inst28Quest1name4_HORDE = Inst28Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst28Quest2_HORDE = Inst28Quest2
Inst28Quest2_HORDE_Level = Inst28Quest2_Level
Inst28Quest2_HORDE_Attain = Inst28Quest2_Attain
Inst28Quest2_HORDE_Aim = Inst28Quest2_Aim
Inst28Quest2_HORDE_Location = Inst28Quest2_Location
Inst28Quest2_HORDE_Note = Inst28Quest2_Note
Inst28Quest2_HORDE_Prequest = Inst28Quest2_Prequest
Inst28Quest2_HORDE_Folgequest = Inst28Quest2_Folgequest
--
Inst28Quest2name1_HORDE = Inst28Quest2name1
Inst28Quest2name2_HORDE = Inst28Quest2name2
Inst28Quest2name3_HORDE = Inst28Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst28Quest3_HORDE = Inst28Quest3
Inst28Quest3_HORDE_Level = Inst28Quest3_Level
Inst28Quest3_HORDE_Attain = Inst28Quest3_Attain
Inst28Quest3_HORDE_Aim = Inst28Quest3_Aim
Inst28Quest3_HORDE_Location = Inst28Quest3_Location
Inst28Quest3_HORDE_Note = Inst28Quest3_Note
Inst28Quest3_HORDE_Prequest = Inst28Quest3_Prequest
Inst28Quest3_HORDE_Folgequest = Inst28Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst28Quest4_HORDE = Inst28Quest4
Inst28Quest4_HORDE_Level = Inst28Quest4_Level
Inst28Quest4_HORDE_Attain = Inst28Quest4_Attain
Inst28Quest4_HORDE_Aim = Inst28Quest4_Aim
Inst28Quest4_HORDE_Location = Inst28Quest4_Location
Inst28Quest4_HORDE_Note = Inst28Quest4_Note
Inst28Quest4_HORDE_Prequest = Inst28Quest4_Prequest
Inst28Quest4_HORDE_Folgequest = Inst28Quest4_Folgequest
--
Inst28Quest4name1_HORDE = Inst28Quest4name1
Inst28Quest4name2_HORDE = Inst28Quest4name2
Inst28Quest4name3_HORDE = Inst28Quest4name3
Inst28Quest4name4_HORDE = Inst28Quest4name4
Inst28Quest4name5_HORDE = Inst28Quest4name5
Inst28Quest4name6_HORDE = Inst28Quest4name6



--------------- INST29 - Gnomeregan (Gnomer) ---------------

Inst29Story = "Located in Dun Morogh, the technological wonder known as Gnomeregan has been the gnomes' capital city for generations. Recently, a hostile race of mutant troggs infested several regions of Dun Morogh - including the great gnome city. In a desperate attempt to destroy the invading troggs, High Tinker Mekkatorque ordered the emergency venting of the city's radioactive waste tanks. Several gnomes sought shelter from the airborne pollutants as they waited for the troggs to die or flee. Unfortunately, though the troggs became irradiated from the toxic assault - their siege continued, unabated. Those gnomes who were not killed by noxious seepage were forced to flee, seeking refuge in the nearby dwarven city of Ironforge. There, High Tinker Mekkatorque set out to enlist brave souls to help his people reclaim their beloved city. It is rumored that Mekkatorque's once-trusted advisor, Mekgineer Thermaplugg, betrayed his people by allowing the invasion to happen. Now, his sanity shattered, Thermaplug remains in Gnomeregan - furthering his dark schemes and acting as the city's new techno-overlord."
Inst29Caption = "Gnomeregan"
Inst29QAA = "11 Quests"
Inst29QAH = "6 Quests"

--Quest 1 Alliance
Inst29Quest1 = "1. Save Techbot's Brain!"
Inst29Quest1_Level = "26"
Inst29Quest1_Attain = "20"
Inst29Quest1_Aim = "Bring Techbot's Memory Core to Tinkmaster Overspark in Ironforge."
Inst29Quest1_Location = "Tinkmaster Overspark (Ironforge - Tinkertown; "..YELLOW.."69,50"..WHITE..")"
Inst29Quest1_Note = "You get the prequest from Brother Sarno (Stormwind - Cathedral Square; "..YELLOW.."50.9, 47.8"..WHITE..").\nYou find Techbot before you enter the instance near the backdoor, at "..YELLOW.."[4] on Entrance Map"..WHITE.."."
Inst29Quest1_Prequest = "Tinkmaster Overspark"
Inst29Quest1_Folgequest = "None"
Inst29Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst29Quest2 = "2. Gnogaine"
Inst29Quest2_Level = "27"
Inst29Quest2_Attain = "20"
Inst29Quest2_Aim = "Use the Empty Leaden Collection Phial on Irradiated Invaders or Irradiated Pillagers to collect radioactive fallout. Once it is full, take it back to Ozzie Togglevolt in Kharanos."
Inst29Quest2_Location = "Ozzie Togglevolt (Dun Morogh - Kharanos; "..YELLOW.."45,49"..WHITE..")"
Inst29Quest2_Note = "You get the prequest from Gnoarn (Ironforge - Tinkertown; "..YELLOW.."69,50"..WHITE..").\nTo get fallout you musst use the Phial on "..RED.."alive"..WHITE.." Irradiated Invaders or Irradiated Pillagers."
Inst29Quest2_Prequest = "The Day After"
Inst29Quest2_Folgequest = "The Only Cure is More Green Glow"
Inst29Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst29Quest3 = "3. The Only Cure is More Green Glow"
Inst29Quest3_Level = "30"
Inst29Quest3_Attain = "20"
Inst29Quest3_Aim = "Travel to Gnomeregan and bring back High Potency Radioactive Fallout. Be warned, the fallout is unstable and will collapse rather quickly.\nOzzie will also require your Heavy Leaden Collection Phial when the task is complete."
Inst29Quest3_Location = "Ozzie Togglevolt (Dun Morogh - Kharanos; "..YELLOW.."45,49"..WHITE..")"
Inst29Quest3_Note = "To get fallout you must use the Phial on "..RED.."alive"..WHITE.." Irradiated Slimes or Horrors."
Inst29Quest3_Prequest = "Gnogaine"
Inst29Quest3_Folgequest = "None"
Inst29Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst29Quest4 = "4. Gyrodrillmatic Excavationators"
Inst29Quest4_Level = "30"
Inst29Quest4_Attain = "20"
Inst29Quest4_Aim = "Bring twenty-four Robo-mechanical Guts to Shoni in Stormwind."
Inst29Quest4_Location = "Shoni the Silent (Stormwind - Dwarven District; "..YELLOW.."62.6, 34.1"..WHITE..")"
Inst29Quest4_Note = "All Robots can drop the Robo-mechanical Guts."
Inst29Quest4_Prequest = "None"
Inst29Quest4_Folgequest = "None"
--
Inst29Quest4name1 = "Shoni's Disarming Tool"
Inst29Quest4name2 = "Shilly Mitts"

--Quest 5 Alliance
Inst29Quest5 = "5. Essential Artificials"
Inst29Quest5_Level = "30"
Inst29Quest5_Attain = "24"
Inst29Quest5_Aim = "Bring 12 Essential Artificials to Klockmort Spannerspan in Ironforge."
Inst29Quest5_Location = "Klockmort Spannerspan (Ironforge - Tinkertown; "..YELLOW.."68,46"..WHITE..")"
Inst29Quest5_Note = "You get the prequest from Mathiel (Darnassus - Warrior's Terrace; "..YELLOW.."59,45"..WHITE.."). The prequest is only a pointer quest and is not required to get this quest.\nThe Essential Artificials come from machines scattered around the instance."
Inst29Quest5_Prequest = "Klockmort's Essentials"
Inst29Quest5_Folgequest = "None"
Inst29Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst29Quest6 = "6. Data Rescue"
Inst29Quest6_Level = "30"
Inst29Quest6_Attain = "25"
Inst29Quest6_Aim = "Bring a Prismatic Punch Card to Master Mechanic Castpipe in Ironforge."
Inst29Quest6_Location = "Master Mechanic Castpipe (Ironforge - Tinkertown; "..YELLOW.."69,48"..WHITE..")"
Inst29Quest6_Note = "You get the prequest from Gaxim Rustfizzle (Stonetalon Mountains; "..YELLOW.."59,67"..WHITE.."). The prequest is only a pointer quest and is not required to get this quest.\nThe white card is a random drop. You find the first terminal next to the back entrance before you enter the instance at "..YELLOW.."[3] on Entrance Map"..WHITE..". The 3005-B is at "..YELLOW.."[3]"..WHITE..", the 3005-C at "..YELLOW.."[5]"..WHITE.." and the 3005-D is at "..YELLOW.."[6]"..WHITE.."."
Inst29Quest6_Prequest = "Castpipe's Task"
Inst29Quest6_Folgequest = "None"
Inst29Quest6PreQuest = "true"
--
Inst29Quest6name1 = "Repairman's Cape"
Inst29Quest6name2 = "Mechanic's Pipehammer"

--Quest 7 Alliance
Inst29Quest7 = "7. A Fine Mess"
Inst29Quest7_Level = "30"
Inst29Quest7_Attain = "20"
Inst29Quest7_Aim = "Escort Kernobee to the Clockwerk Run exit and then report to Scooty in Booty Bay."
Inst29Quest7_Location = "Kernobee (Gnomeregan; "..YELLOW.."[3]"..WHITE..")"
Inst29Quest7_Note = "Escort quest! You find Scooty in Stranglethorn Vale - Booty Bay ("..YELLOW.."27,77"..WHITE..")."
Inst29Quest7_Prequest = "None"
Inst29Quest7_Folgequest = "None"
--
Inst29Quest7name1 = "Fire-welded Bracers"
Inst29Quest7name2 = "Fairywing Mantle"

--Quest 8 Alliance
Inst29Quest8 = "8. The Grand Betrayal"
Inst29Quest8_Level = "35"
Inst29Quest8_Attain = "25"
Inst29Quest8_Aim = "Venture to Gnomeregan and kill Mekgineer Thermaplugg. Return to High Tinker Mekkatorque when the task is complete."
Inst29Quest8_Location = "High Tinker Mekkatorque (Ironforge - Tinkertown; "..YELLOW.."68,48"..WHITE..")"
Inst29Quest8_Note = "You find Thermaplugg at "..YELLOW.."[8]"..WHITE..". He is the last boss in Gnomeregan.\nDuring the fight you have to disable the columns through pushing the button on the side."
Inst29Quest8_Prequest = "None"
Inst29Quest8_Folgequest = "None"
--
Inst29Quest8name1 = "Civinad Robes"
Inst29Quest8name2 = "Triprunner Dungarees"
Inst29Quest8name3 = "Dual Reinforced Leggings"

--Quest 9 Alliance
Inst29Quest9 = "9. Grime-Encrusted Ring"
Inst29Quest9_Level = "34"
Inst29Quest9_Attain = "28"
Inst29Quest9_Aim = "Figure out a way to remove the grime from the Grime-Encrusted Ring."
Inst29Quest9_Location = "Grime-Encrusted Ring (random drop from Dark Iron Agents in Gnomeregan)"
Inst29Quest9_Note = "The Ring can be cleaned off at the Sparklematic 5200 in the Clean Room at "..YELLOW.."[2]"..WHITE.."."
Inst29Quest9_Prequest = "None"
Inst29Quest9_Folgequest = "Return of the Ring"
-- No Rewards for this quest

--Quest 10 Alliance
Inst29Quest10 = "10. Return of the Ring"
Inst29Quest10_Level = "34"
Inst29Quest10_Attain = "28"
Inst29Quest10_Aim = "You may either keep the ring, or you may find the person responsible for the imprint and engravings on the inside of the band."
Inst29Quest10_Location = "Brilliant Gold Ring (obtained from Grime-Encrusted Ring quest)"
Inst29Quest10_Note = "Turns in to Talvash del Kissel (Ironforge - Mystic Ward; "..YELLOW.."36,3"..WHITE.."). The followup to enhance the ring is optional."
Inst29Quest10_Prequest = "Grime-Encrusted Ring"
Inst29Quest10_Folgequest = "Gnome Improvement"
Inst29Quest10FQuest = "true"
--
Inst29Quest10name1 = "Brilliant Gold Ring"

--Quest 11 Alliance
Inst29Quest11 = "11. The Sparklematic 5200!"
Inst29Quest11_Level = "30"
Inst29Quest11_Attain = "25"
Inst29Quest11_Aim = "Insert a Grime-Encrusted Item into the Sparklematic 5200, and be sure to have three silver coins to start the machine."
Inst29Quest11_Location = "Sparklematic 5200 (Gnomeregan - The Clean Room; "..YELLOW.."[2]"..WHITE..")"
Inst29Quest11_Note = "You can repeat this quest for all the Grime-Encrusted Items you have."
Inst29Quest11_Prequest = "None"
Inst29Quest11_Folgequest = "None"
--
Inst29Quest11name1 = "Sparklematic-Wrapped Box"


--Quest 1 Horde
Inst29Quest1_HORDE = "1. Gnomer-gooooone!"
Inst29Quest1_HORDE_Level = "35"
Inst29Quest1_HORDE_Attain = "20"
Inst29Quest1_HORDE_Aim = "Wait for Scooty to calibrate the Goblin Transponder."
Inst29Quest1_HORDE_Location = "Scooty (Stranglethorn Vale - Booty Bay; "..YELLOW.."27,77"..WHITE..")"
Inst29Quest1_HORDE_Note = "You get the prequest from Sovik (Orgrimmar - Valley of Honor; "..YELLOW.."75,25"..WHITE..").\nWhen you complete this quest you can use the transponder in Booty Bay."
Inst29Quest1_HORDE_Prequest = "Chief Engineer Scooty"
Inst29Quest1_HORDE_Folgequest = "None"
Inst29Quest1PreQuest_HORDE = "true"
--
Inst29Quest1name1_HORDE = "Goblin Transponder"

--Quest 2 Horde  (same as Quest 7 Alliance)
Inst29Quest2_HORDE = "2. A Fine Mess"
Inst29Quest2_HORDE_Level = Inst29Quest7_Level
Inst29Quest2_HORDE_Attain = Inst29Quest7_Attain
Inst29Quest2_HORDE_Aim = Inst29Quest7_Aim
Inst29Quest2_HORDE_Location = Inst29Quest7_Location
Inst29Quest2_HORDE_Note = Inst29Quest7_Note
Inst29Quest2_HORDE_Prequest = Inst29Quest7_Prequest
Inst29Quest2_HORDE_Folgequest = Inst29Quest7_Folgequest
--
Inst29Quest2name1_HORDE = Inst29Quest7name1
Inst29Quest2name2_HORDE = Inst29Quest7name2

--Quest 3 Horde
Inst29Quest3_HORDE = "3. Rig Wars"
Inst29Quest3_HORDE_Level = "35"
Inst29Quest3_HORDE_Attain = "25"
Inst29Quest3_HORDE_Aim = "Retrieve the Rig Blueprints and Thermaplugg's Safe Combination from Gnomeregan and bring them to Nogg in Orgrimmar."
Inst29Quest3_HORDE_Location = "Nogg (Orgrimmar - Valley of Honor; "..YELLOW.."75,25"..WHITE..")"
Inst29Quest3_HORDE_Note = "You find Thermaplugg at "..YELLOW.."[8]"..WHITE..". He is the last boss in Gnomeregan.\nDuring the fight you have to disable the columns through pushing the button on the side."
Inst29Quest3_HORDE_Prequest = "None"
Inst29Quest3_HORDE_Folgequest = "None"
--
Inst29Quest3name1_HORDE = "Civinad Robes"
Inst29Quest3name2_HORDE = "Triprunner Dungarees"
Inst29Quest3name3_HORDE = "Dual Reinforced Leggings"

--Quest 4 Horde  (same as Quest 9 Alliance)
Inst29Quest4_HORDE = "4. Grime-Encrusted Ring"
Inst29Quest4_HORDE_Level = Inst29Quest9_Level
Inst29Quest4_HORDE_Attain = Inst29Quest9_Attain
Inst29Quest4_HORDE_Aim = Inst29Quest9_Aim
Inst29Quest4_HORDE_Location = Inst29Quest9_Location
Inst29Quest4_HORDE_Note = Inst29Quest9_Note
Inst29Quest4_HORDE_Prequest = Inst29Quest9_Prequest
Inst29Quest4_HORDE_Folgequest = Inst29Quest9_Folgequest
-- No Rewards for this quest

--Quest 5 Horde
Inst29Quest5_HORDE = "5. Return of the Ring"
Inst29Quest5_HORDE_Level = "34"
Inst29Quest5_HORDE_Attain = "28"
Inst29Quest5_HORDE_Aim = "You may either keep the ring, or you may find the person responsible for the imprint and engravings on the inside of the band."
Inst29Quest5_HORDE_Location = "Brilliant Gold Ring (obtained from Grime-Encrusted Ring quest)"
Inst29Quest5_HORDE_Note = "Turns in to Nogg (Orgrimmar - The Valley of Honor; "..YELLOW.."75,25"..WHITE.."). The followup to enhance the ring is optional."
Inst29Quest5_HORDE_Prequest = "Grime-Encrusted Ring"
Inst29Quest5_HORDE_Folgequest = "Nogg's Ring Redo"
Inst29Quest5FQuest_HORDE = "true"
--
Inst29Quest5name1_HORDE = "Brilliant Gold Ring"

--Quest 6 Horde
Inst29Quest6_HORDE = "6. The Sparklematic 5200!"
Inst29Quest6_HORDE_Level = "30"
Inst29Quest6_HORDE_Attain = "25"
Inst29Quest6_HORDE_Aim = "Insert a Grime-Encrusted Item into the Sparklematic 5200, and be sure to have three silver coins to start the machine."
Inst29Quest6_HORDE_Location = "Sparklematic 5200 (Gnomeregan - The Clean Room; "..YELLOW.."[2]"..WHITE..")"
Inst29Quest6_HORDE_Note = "You can repeat this quest for all the Grime-Encrusted Items you have."
Inst29Quest6_HORDE_Prequest = "None"
Inst29Quest6_HORDE_Folgequest = "None"
--
Inst29Quest6name1_HORDE = "Sparklematic-Wrapped Box"



--------------- INST37 - HFC: Ramparts (Ramp) ---------------

Inst37Story = {
  ["Page1"] = "On the blasted world of Outland, within the heart of Hellfire Peninsula stands Hellfire Citadel, a nearly impenetrable bastion that served as the Horde's base of operations throughout the First and Second Wars. For years this gargantuan fortress was thought to be abandoned...\n \nUntil recently.\n \nThough much of Draenor was shattered by the reckless Ner'zhul, the Hellfire Citadel remains intact– inhabited now by marauding bands of red, furious fel orcs. Though the presence of this new, savage breed presents something of a mystery, what's far more disconcerting is that the numbers of these fel orcs seem to be growing.\n \nDespite Thrall and Grom Hellscream's successful bid to end the Horde's corruption by slaying Mannoroth, reports indicate that the barbaric orcs of Hellfire Citadel have somehow managed to find a new source of corruption to fuel their primitive bloodlust.",
  ["Page2"] = "Whatever authority these orcs answer to is unknown, although it is a strongly held belief that they are not working for the Burning Legion.\n \nPerhaps the most unsettling news to come from Outland are the accounts of thunderous, savage cries issuing from somewhere deep beneath the citadel. Many have begun to wonder if these unearthly outbursts are somehow connected to the corrupted fel orcs and their growing numbers. Unfortunately those questions will have to remain unanswered.\n \nAt least for now.",
  ["MaxPages"] = "2",
};
Inst37Caption = "HFC: Ramparts"
Inst37QAA = "3 Quests"
Inst37QAH = "3 Quests"
Inst37General = {
    {
    "Watchkeeper Gargolmar",
    "He has 2 adds. Both are CCable and should be CC or killed before you focus Gargolmar. Gargolmar itself does decent melee damage",
    RED .. "Mortal Wound:" .. WHITE .. " Gargolmar gives the MT sometimes a stackable debuff which reduced healing by 10% per stack. Offtanking isn't nedded because normally it doesn't stack above 40%(he dies to fast).",
    },

    {
    "Omor the Unscarred",
    "Omor has an strong magic range attack, but his melle is week. He only use the magic, if someone who isn't in meele range, get the aggro.",
    RED .. "Summoning Hound" .. WHITE .. ": Every few seconds Omar summons a 'Fiendish Hound'. This Hounds hit strong, but has less HP. They should die/get fokused imidiatly.",
    },

    {
    "Vazruden and Nazan",
    "Vazruden lands when you kill the 2 guards before the stage. When Vazruden is at 20% Nazan lands and attack. Nazan is really strong and the hardest encounter in HFC: Ramparts",
    "Vazruden(): Nothing?\n" .. RED .. "Nazan(Dragonsbreath)" .. WHITE .. ": Nazan does strong firedamage in front of him. The tank has to turn the dragon away from the group.\n" .. RED .. "Nazan(Flamethrowing)" .. WHITE .. ": Nazan throws fireballs at you which do decent damage(-2k) and burn the ground(-600fire/sec). Everbody have to go out of the fire!",
    },
};

--Quest 1 Alliance
Inst37Quest1 = "1. Weaken the Ramparts"
Inst37Quest1_Level = "62"
Inst37Quest1_Attain = "59"
Inst37Quest1_Aim = "Slay Watchkeeper Gargolmar, Omor the Unscarred and the drake, Nazan. Return Gargolmar's Hand, Omor's Hoof and Nazan's Head to Gunny at Honor Hold in Hellfire Peninsula."
Inst37Quest1_Location = "Lieutenant Chadwick (Hellfire Peninsula - Honor Hold; "..YELLOW.."57,66"..WHITE..")"
Inst37Quest1_Note = "Gargolmar is at "..YELLOW.."[1]"..WHITE..", Omor is at "..YELLOW.."[2]"..WHITE.." and Nazan is at "..YELLOW.."[3]"..WHITE..". Gunny is at (Hellfire Peninsula - Honor Hold; "..YELLOW.."56,67"..WHITE.."). \n\nTo get this quest, you must complete the Ill Omens, which starts with Know your Enemy from Force Commander Dannath Trollbane (Hellfire Peninsula - Honor Hold; "..YELLOW.."57,67"..WHITE..")."
Inst37Quest1_Prequest = "Know your Enemy -> Ill Omens"
Inst37Quest1_Folgequest = "Heart of Rage ("..YELLOW.."HFC: Blood Furnace"..WHITE..")"
Inst37Quest1PreQuest = "true"
--
Inst37Quest1name1 = "Handguards of Precision"
Inst37Quest1name2 = "Jade Warrior Pauldrons"
Inst37Quest1name3 = "Mantle of Magical Might"
Inst37Quest1name4 = "Sure-Step Boots"

--Quest 2 Alliance
Inst37Quest2 = "2. Dark Tidings"
Inst37Quest2_Level = "62"
Inst37Quest2_Attain = "59"
Inst37Quest2_Aim = "Take the Ominous Letter to Force Commander Danath Trollbane at Honor Hold in Hellfire Peninsula."
Inst37Quest2_Location = "Ominous Letter (drops from Vazruden the Herald; "..YELLOW.."[3]"..WHITE..")"
Inst37Quest2_Note = "Force Commander Danath Trollbane is at "..YELLOW.."57,67"..WHITE.." in Honor Hold."
Inst37Quest2_Prequest = "None"
Inst37Quest2_Folgequest = "The Blood is Life ("..YELLOW.."HFC: Blood Furnace"..WHITE..")"
Inst37Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst37Quest3 = "3. Wanted: Nazan's Riding Crop (Heroic Daily)"
Inst37Quest3_Level = "70"
Inst37Quest3_Attain = "70"
Inst37Quest3_Aim = "Wind Trader Zhareem has asked you to obtain Nazan's Riding Crop. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst37Quest3_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst37Quest3_Note = "This daily quest can only be completed on Heroic difficulty.\n\nNazan is at "..YELLOW.."[3]"..WHITE.."."
Inst37Quest3_Prequest = "None"
Inst37Quest3_Folgequest = "None"
--
Inst37Quest3name1 = "Badge of Justice"


--Quest 1 Horde  (same as Quest 1 Alliance - different NPCs and pre-quest)
Inst37Quest1_HORDE = Inst37Quest1
Inst37Quest1_HORDE_Level = Inst37Quest1_Level
Inst37Quest1_HORDE_Attain = Inst37Quest1_Attain
Inst37Quest1_HORDE_Aim = "Slay Watchkeeper Gargolmar, Omor the Unscarred and the drake, Nazan. Return Gargolmar's Hand, Omor's Hoof and Nazan's Head to Caza'rez at Thrallmar in Hellfire Peninsula."
Inst37Quest1_HORDE_Location = "Stone Guard Stok'ton (Hellfire Peninsula - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst37Quest1_HORDE_Note = "Gargolmar is at "..YELLOW.."[1]"..WHITE..", Omor is at "..YELLOW.."[2]"..WHITE.." and Nazan is at "..YELLOW.."[3]"..WHITE..". Caza'rez is at (Hellfire Peninsula - Thrallmar; "..YELLOW.."55,36"..WHITE.."). \n\nTo get this quest, you must complete Forward Base: Reaver's Fall, which starts with the Through the Dark Portal quest you receive at the Dark Portal in Blasted Lands."
Inst37Quest1_HORDE_Prequest = "Through the Dark Portal -> Forward Base: Reaver's Fall"
Inst37Quest1_HORDE_Folgequest = Inst37Quest1_Folgequest
Inst37Quest1PreQuest_HORDE = Inst37Quest1PreQuest
--
Inst37Quest1name1_HORDE = Inst37Quest1name1
Inst37Quest1name2_HORDE = Inst37Quest1name2
Inst37Quest1name3_HORDE = Inst37Quest1name3
Inst37Quest1name4_HORDE = Inst37Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst37Quest2_HORDE = Inst37Quest2
Inst37Quest2_HORDE_Level = Inst37Quest2_Level
Inst37Quest2_HORDE_Attain = Inst37Quest2_Attain
Inst37Quest2_HORDE_Aim = "Take the Ominous Letter to Nazgrel at Thrallmar in Hellfire Peninsula."
Inst37Quest2_HORDE_Location = Inst37Quest2_Location
Inst37Quest2_HORDE_Note = "Nazgrel is at "..YELLOW.."55,36"..WHITE.." in Thrallmar."
Inst37Quest2_HORDE_Prequest = Inst37Quest2_Prequest
Inst37Quest2_HORDE_Folgequest = Inst37Quest2_Folgequest
Inst37Quest2FQuest_HORDE = Inst37Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst37Quest3_HORDE = Inst37Quest3
Inst37Quest3_HORDE_Level = Inst37Quest3_Level
Inst37Quest3_HORDE_Attain = Inst37Quest3_Attain
Inst37Quest3_HORDE_Aim = Inst37Quest3_Aim
Inst37Quest3_HORDE_Location = Inst37Quest3_Location
Inst37Quest3_HORDE_Note = Inst37Quest3_Note
Inst37Quest3_HORDE_Prequest = Inst37Quest3_Prequest
Inst37Quest3_HORDE_Folgequest = Inst37Quest3_Folgequest
--
Inst37Quest3name1_HORDE = Inst37Quest3name1



--------------- INST38 - HFC: Blood Furnace (BF) ---------------

Inst38Story = {
  ["Page1"] = "On the blasted world of Outland, within the heart of Hellfire Peninsula stands Hellfire Citadel, a nearly impenetrable bastion that served as the Horde's base of operations throughout the First and Second Wars. For years this gargantuan fortress was thought to be abandoned...\n \nUntil recently.\n \nThough much of Draenor was shattered by the reckless Ner'zhul, the Hellfire Citadel remains intact– inhabited now by marauding bands of red, furious fel orcs. Though the presence of this new, savage breed presents something of a mystery, what's far more disconcerting is that the numbers of these fel orcs seem to be growing.\n \nDespite Thrall and Grom Hellscream's successful bid to end the Horde's corruption by slaying Mannoroth, reports indicate that the barbaric orcs of Hellfire Citadel have somehow managed to find a new source of corruption to fuel their primitive bloodlust.",
  ["Page2"] = "Whatever authority these orcs answer to is unknown, although it is a strongly held belief that they are not working for the Burning Legion.\n \nPerhaps the most unsettling news to come from Outland are the accounts of thunderous, savage cries issuing from somewhere deep beneath the citadel. Many have begun to wonder if these unearthly outbursts are somehow connected to the corrupted fel orcs and their growing numbers. Unfortunately those questions will have to remain unanswered.\n \nAt least for now.",
  ["MaxPages"] = "2",
};
Inst38Caption = "HFC: The Blood Furnace"
Inst38QAA = "3 Quests"
Inst38QAH = "3 Quests"
Inst38General = {
    {
    "The Maker",
    "Easy fight. He does not really much melee damage. Just tank and kill",
    RED .. "Knockback" .. WHITE .. " He knocks everybody in the air(aggro wipe or lesser aggro).\n" .. RED .. "Mind Control" .. WHITE .. ": He controls randomly a player and increase its damage.",
    },

    {
    "Broggok",
    "Hard fight. The event starts when you push the lever in his room. Before you face the boss 4 waves of mobs attack you. Between the waves you can't drink so sheep(or mc) a mob of the last wave to get enough mana to kill the boss.",
   RED .. "4 Waves:" .. WHITE .. " First group is four normal mobs, second is 3 normal and an elite, third is 2 normal 2 elite, last is 1 normal 3 elite.\n" .. RED .. "Poisonbreath:" .. WHITE .. " He does damage to all player before him.\n" .. RED .. "Posionbomb:" .. WHITE .. " He throws randomly a bomb at a player. The bomb does less damage, but at this place a posion circle appear and damage(650/sec) everyone who stand in it.",
    },

    {
    "Keli'dan the Breaker",
    "Last Boss and not really hard. Fight starts if you attack one of the guys near him, when they are all dead he starts to attack you.",
   RED .. "The Adds:" .. WHITE .. " They cast shadowbolds and a debuff(magic) which increase shadowdamage by 1000. Clean it as fast as you can.\n" .. RED .. "Shadowvolly:" .. WHITE .. " 3 Shadowbolds, not much damage without the debuff.\n" .. RED .. "Fire Nova:" .. WHITE .. " Every few seconds he yells 'Come closer!' and stopp attacking. After 2-5(not sure) seconds he does a strong fire nova(great range). So if you see him yelling run away.",
    },
};

--Quest 1 Alliance
Inst38Quest1 = "1. The Blood is Life"
Inst38Quest1_Level = "63"
Inst38Quest1_Attain = "59"
Inst38Quest1_Aim = "Collect 10 Fel Orc Blood Vials and return them to Gunny at Honor Hold in Hellfire Peninsula."
Inst38Quest1_Location = "Gunny (Hellfire Peninsula - Honor Hold; "..YELLOW.."56,67"..WHITE..")"
Inst38Quest1_Note = "All Orcs in Blood Furnace can drop the Blood Vials."
Inst38Quest1_Prequest = "Dark Tidings ("..YELLOW.."HFC: Ramparts"..WHITE..")"
Inst38Quest1_Folgequest = "None"
Inst38Quest1PreQuest = "true"
--
Inst38Quest1name1 = "Breastplate of Retribution"
Inst38Quest1name2 = "Deadly Borer Leggings"
Inst38Quest1name3 = "Moonkin Headdress"
Inst38Quest1name4 = "Scaled Legs of Ruination"

--Quest 2 Alliance
Inst38Quest2 = "2. Heart of Rage"
Inst38Quest2_Level = "63"
Inst38Quest2_Attain = "59"
Inst38Quest2_Aim = "Fully investigate the Blood Furnace and then report to Force Commander Danath Trollbane at Honor Hold in Hellfire Peninsula."
Inst38Quest2_Location = "Gunny (Hellfire Peninsula - Honor Hold; "..YELLOW.."56,67"..WHITE..")."
Inst38Quest2_Note = "Quest completes in room with final boss.  Force Commander Danath Trollbane is at "..YELLOW.."57,67"..WHITE.." in Honor Hold."
Inst38Quest2_Prequest = "Weaken the Ramparts ("..YELLOW.."HFC: Ramparts"..WHITE..")"
Inst38Quest2_Folgequest = "None"
Inst38Quest2PreQuest = "true"
--
Inst38Quest2name1 = "Crimson Pendant of Clarity"
Inst38Quest2name2 = "Holy Healing Band"
Inst38Quest2name3 = "Perfectly Balanced Cape"

--Quest 3 Alliance
Inst38Quest3 = "3. Wanted: Keli'dan's Feathered Stave (Heroic Daily)"
Inst38Quest3_Level = "70"
Inst38Quest3_Attain = "70"
Inst38Quest3_Aim = "Wind Trader Zhareem has asked you to obtain Keli'dan's Feathered Stave. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst38Quest3_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst38Quest3_Note = "This daily quest can only be completed on Heroic difficulty.\n\nKeli'dan the Breaker is at "..YELLOW.."[3]"..WHITE.."."
Inst38Quest3_Prequest = "None"
Inst38Quest3_Folgequest = "None"
--
Inst38Quest3name1 = "Badge of Justice"


--Quest 1 Horde  (same as Quest 1 Alliance - different NPC to turn in)
Inst38Quest1_HORDE = Inst38Quest1
Inst38Quest1_HORDE_Level = Inst38Quest1_Level
Inst38Quest1_HORDE_Attain = Inst38Quest1_Attain
Inst38Quest1_HORDE_Aim = "Collect 10 Fel Orc Blood Vials and return them to Centurion Caza'rez at Thrallmar in Hellfire Peninsula."
Inst38Quest1_HORDE_Location = "Caza'rez (Hellfire Peninsula - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst38Quest1_HORDE_Note = Inst38Quest1_Note
Inst38Quest1_HORDE_Prequest = Inst38Quest1_Prequest
Inst38Quest1_HORDE_Folgequest = Inst38Quest1_Folgequest
Inst38Quest1PreQuest_HORDE = Inst38Quest1PreQuest
--
Inst38Quest1name1_HORDE = Inst38Quest1name1
Inst38Quest1name2_HORDE = Inst38Quest1name2
Inst38Quest1name3_HORDE = Inst38Quest1name3
Inst38Quest1name4_HORDE = Inst38Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst38Quest2_HORDE = Inst38Quest2
Inst38Quest2_HORDE_Level = Inst38Quest2_Level
Inst38Quest2_HORDE_Attain = Inst38Quest2_Attain
Inst38Quest2_HORDE_Aim = "Fully investigate the Blood Furnace and then report to Nazgrel at Thrallmar in Hellfire Peninsula."
Inst38Quest2_HORDE_Location = "Caza'rez (Hellfire Peninsula - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst38Quest2_HORDE_Note = "Quest completes in room with final boss. Nazgrel is at Hellfire Peninsula - Thrallmar ("..YELLOW.."55,36"..WHITE..")."
Inst38Quest2_HORDE_Prequest = Inst38Quest2_Prequest
Inst38Quest2_HORDE_Folgequest = Inst38Quest2_Folgequest
Inst38Quest2PreQuest_HORDE = Inst38Quest2PreQuest
--
Inst38Quest2name1_HORDE = Inst38Quest2name1
Inst38Quest2name2_HORDE = Inst38Quest2name2
Inst38Quest2name3_HORDE = Inst38Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst38Quest3_HORDE = Inst38Quest3
Inst38Quest3_HORDE_Level = Inst38Quest3_Level
Inst38Quest3_HORDE_Attain = Inst38Quest3_Attain
Inst38Quest3_HORDE_Aim = Inst38Quest3_Aim
Inst38Quest3_HORDE_Location = Inst38Quest3_Location
Inst38Quest3_HORDE_Note = Inst38Quest3_Note
Inst38Quest3_HORDE_Prequest = Inst38Quest3_Prequest
Inst38Quest3_HORDE_Folgequest = Inst38Quest3_Folgequest
--
Inst38Quest3name1_HORDE = Inst38Quest3name1



--------------- INST39 - HFC: Shattered Halls (SH) ---------------

Inst39Story = {
  ["Page1"] = "On the blasted world of Outland, within the heart of Hellfire Peninsula stands Hellfire Citadel, a nearly impenetrable bastion that served as the Horde's base of operations throughout the First and Second Wars. For years this gargantuan fortress was thought to be abandoned...\n \nUntil recently.\n \nThough much of Draenor was shattered by the reckless Ner'zhul, the Hellfire Citadel remains intact– inhabited now by marauding bands of red, furious fel orcs. Though the presence of this new, savage breed presents something of a mystery, what's far more disconcerting is that the numbers of these fel orcs seem to be growing.\n \nDespite Thrall and Grom Hellscream's successful bid to end the Horde's corruption by slaying Mannoroth, reports indicate that the barbaric orcs of Hellfire Citadel have somehow managed to find a new source of corruption to fuel their primitive bloodlust.",
  ["Page2"] = "Whatever authority these orcs answer to is unknown, although it is a strongly held belief that they are not working for the Burning Legion.\n \nPerhaps the most unsettling news to come from Outland are the accounts of thunderous, savage cries issuing from somewhere deep beneath the citadel. Many have begun to wonder if these unearthly outbursts are somehow connected to the corrupted fel orcs and their growing numbers. Unfortunately those questions will have to remain unanswered.\n \nAt least for now.",
  ["MaxPages"] = "2",
};
Inst39Caption = "HFC: Shattered Halls"
Inst39QAA = "10 Quests"
Inst39QAH = "9 Quests"

--Quest 1 Alliance
Inst39Quest1 = "1. Fel Embers"
Inst39Quest1_Level = "70"
Inst39Quest1_Attain = "67"
Inst39Quest1_Aim = "Magus Zabraxis at Honor Hold wants you to bring her a Fel Ember"
Inst39Quest1_Location = "Magus Zabraxis (Hellfire Peninsula - Honor Hold; "..YELLOW.."54,66"..WHITE..")"
Inst39Quest1_Note = "After killing Grand Warlock Netherkurse at "..YELLOW.."[2]"..WHITE..", he'll drop an Amulet. Use the amulet at one of the braziers near his throne to get the Fel Ember."
Inst39Quest1_Prequest = "None"
Inst39Quest1_Folgequest = "None"
--
Inst39Quest1name1 = "Curate's Boots"
Inst39Quest1name2 = "Rune-Engraved Belt"
Inst39Quest1name3 = "Gloves of Preservation"
Inst39Quest1name4 = "Expedition Scout's Epaulets"
Inst39Quest1name5 = "Dauntless Handguards"

--Quest 2 Alliance
Inst39Quest2 = "2. Pride of the Fel Horde"
Inst39Quest2_Level = "70"
Inst39Quest2_Attain = "66"
Inst39Quest2_Aim = "Field Commander Romus at Honor Hold wants you to kill 8 Shattered Hand Legionnaires, 4 Shattered Hand Centurions and 4 Shattered Hand Champions."
Inst39Quest2_Location = "Field Commander Romus (Hellfire Peninsula - Honor Hold; "..YELLOW.."57,63"..WHITE..")"
Inst39Quest2_Note = "You'll find the Centurion's in Sparring Hall."
Inst39Quest2_Prequest = "None"
Inst39Quest2_Folgequest = "None"
-- No Rewards for this quest

--Quest 3 Alliance
Inst39Quest3 = "3. Turning the Tide"
Inst39Quest3_Level = "70"
Inst39Quest3_Attain = "67"
Inst39Quest3_Aim = "Bring Warchief Kargath's Fist to Force Commander Danath Trollbane in Honor Hold."
Inst39Quest3_Location = "Force Commander Danath Trollbane (Hellfire Peninsula - Honor Hold; "..YELLOW.."57,67"..WHITE..")"
Inst39Quest3_Note = "Warchief Kargath Bladefist is at "..YELLOW.."[5]"..WHITE.."."
Inst39Quest3_Prequest = "None"
Inst39Quest3_Folgequest = "None"
--
Inst39Quest3name1 = "Nethekurse's Rod of Torment"
Inst39Quest3name2 = "Mantle of Vivification"
Inst39Quest3name3 = "Naliko's Revenge"
Inst39Quest3name4 = "Medallion of the Valiant Guardian"

--Quest 4 Alliance
Inst39Quest4 = "4. Imprisoned in the Citadel (Heroic)"
Inst39Quest4_Level = "70"
Inst39Quest4_Attain = "70"
Inst39Quest4_Aim = "Rescue Captain Alina inside Hellfire Citadel before she is executed."
Inst39Quest4_Location = "Randy Whizzlesprocket (Shattered Halls; "..YELLOW.."Heroic [1]"..WHITE..")"
Inst39Quest4_Note = "Requires Heroic Dungeon Difficulty.\n\nCaptain Alina is at "..YELLOW.."[5]"..WHITE..". Timer with 55 minutes starts at the beginning of the Archer event."
Inst39Quest4_Prequest = "None"
Inst39Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst39Quest5 = "5. Trial of the Naaru: Mercy (Heroic)"
Inst39Quest5_Level = "70"
Inst39Quest5_Attain = "70"
Inst39Quest5_Aim = "A'dal in Shattrath City wants you to recover the Unused Axe of the Executioner from the Shattered Halls of Hellfire Citadel."
Inst39Quest5_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst39Quest5_Note = "Requires Heroic Dungeon Difficulty.\n\nThis quest used to be required to enter Tempest Keep: The Eye, but is no longer necessary."
Inst39Quest5_Prequest = "None"
Inst39Quest5_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Alliance
Inst39Quest6 = "6. Tear of the Earthmother"
Inst39Quest6_Level = "70"
Inst39Quest6_Attain = "67"
Inst39Quest6_Aim = "Recover the Tear of the Earthmother from Warbringer O'mrogg and return it to David Wayne at Wayne's Refuge."
Inst39Quest6_Location = "David Wayne (Terokkar Forest - Wayne's Refuge; "..YELLOW.."78,39"..WHITE..")."
Inst39Quest6_Note = "Warbringer O'mrogg is at "..YELLOW.."[4]"..WHITE..".\n\nThe item will drop in both Normal and Heroic modes."
Inst39Quest6_Prequest = "Fresh From the Mechanar ("..YELLOW.."TK: Mechanar"..WHITE..") & The Lexicon Demonica ("..YELLOW.."Auch: Shadow Labyrinth"..WHITE..")"
Inst39Quest6_Folgequest = "Bane of the Illidari"
Inst39Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst39Quest7 = "7. Kalynna's Request (Heroic)"
Inst39Quest7_Level = "70"
Inst39Quest7_Attain = "70"
Inst39Quest7_Aim = "Kalynna Lathred wants you to retrieve the Tome of Dusk from Grand Warlock Nethekurse in the Shattered Halls of Hellfire Citadel and the Book of Forgotten Names from Darkweaver Syth in the Sethekk Halls in Auchindoun."
Inst39Quest7_Location = "Kalynna Lathred (Netherstorm - Area 52; "..YELLOW.."32,63"..WHITE..")"
Inst39Quest7_Note = "Requires Heroic Dungeon Difficulty.\n\nGrand Warlock Nethekurse is at "..YELLOW.."[2]"..WHITE..". The Book of Forgotten Names drops in Sethekk Halls."
Inst39Quest7_Prequest = "A Colleague's Aid ("..YELLOW.."Karazhan"..WHITE..")"
Inst39Quest7_Folgequest = "Nightbane ("..YELLOW.."Karazhan"..WHITE..")"
Inst39Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst39Quest8 = "8. Wanted: Bladefist's Seal (Heroic Daily)"
Inst39Quest8_Level = "70"
Inst39Quest8_Attain = "70"
Inst39Quest8_Aim = "Wind Trader Zhareem has asked you to obtain Bladefist's Seal. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst39Quest8_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst39Quest8_Note = "This daily quest can only be completed on Heroic difficulty.\n\nWarchief Kargath Bladefist is at "..YELLOW.."[5]"..WHITE.."."
Inst39Quest8_Prequest = "None"
Inst39Quest8_Folgequest = "None"
--
Inst39Quest8name1 = "Badge of Justice"

--Quest 9 Alliance
Inst39Quest9 = "9. Wanted: Shattered Hand Centurions (Daily)"
Inst39Quest9_Level = "70"
Inst39Quest9_Attain = "70"
Inst39Quest9_Aim = "Nether-Stalker Mah'duun has tasked you with the deaths of 4 Shattered Hand Centurions. Return to him in Shattrath's Lower City once they all lie dead in order to collect the bounty."
Inst39Quest9_Location = "Nether-Stalker Mah'duun (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst39Quest9_Note = "This is a daily quest."
Inst39Quest9_Prequest = "None"
Inst39Quest9_Folgequest = "None"
--
Inst39Quest9name1 = "Ethereum Prison Key"

--Quest 10 Alliance
Inst39Quest10 = "10. Entry Into the Citadel"
Inst39Quest10_Level = "70"
Inst39Quest10_Attain = "68"
Inst39Quest10_Aim = "Bring the Primed Key Mold to Force Commander Danath at Honor Hold in Hellfire Peninsula."
Inst39Quest10_Location = "Primed Key Mold  (drops from Smith Gorlunk in Shadowmoon Valley - Ata'mal Terrace; "..YELLOW.."68,36"..WHITE..")"
Inst39Quest10_Note = "The Smith that drops the Primed Key Mold is easily soloable and very easily reachable with a flying mount.\n\nForce Commander Danath is at (Hellfire Peninsula - Honor Hold; "..YELLOW.."57,67"..WHITE.."). He sends you to Grand Master Dumphry for the next part of the quest at (Hellfire Peninsula - Honor Hold; "..YELLOW.."51,60"..WHITE..")..."
Inst39Quest10_Page = {2, "Grand Master Dumphry will ask for 4 x [Fel Iron Bar], 2 x [Arcane Dust] and 4 x [Mote of Fire].\n\nAfter turning the materials in you need to use the Charred Key Mold he gives you at the corpse of a Fel Reaver. You do not need to kill the Fel Reaver yourself, just use the mold at it.\n\nReturn to Grand Master Dumphry at (Hellfire Peninsula - Honor Hold; "..YELLOW.."51,60"..WHITE..") for your reward.", };
Inst39Quest10_Prequest = "None"
Inst39Quest10_Folgequest = "Grand Master Dumphry -> Hotter than Hell"
--
Inst39Quest10name1 = "Shattered Halls Key"


--Quest 1 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst39Quest1_HORDE = "1. Pride of the Fel Horde"
Inst39Quest1_HORDE_Level = Inst39Quest2_Level
Inst39Quest1_HORDE_Attain = Inst39Quest2_Attain
Inst39Quest1_HORDE_Aim = "Shadow Hunter Ty'jin at Thrallmar wants you to kill 8 Shattered Hand Legionnaires, 4 Shattered Hand Centurions and 4 Shattered Hand Champions."
Inst39Quest1_HORDE_Location = "Shadow Hunter Ty'jin (Hellfire Peninsula - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst39Quest1_HORDE_Note = Inst39Quest2_Note
Inst39Quest1_HORDE_Prequest = Inst39Quest2_Prequest
Inst39Quest1_HORDE_Folgequest = Inst39Quest2_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst39Quest2_HORDE = "2. The Will of the Warchief"
Inst39Quest2_HORDE_Level = "70"
Inst39Quest2_HORDE_Attain = "67"
Inst39Quest2_HORDE_Aim = "Bring Warchief Kargath's Fist to Nazgrel in Thrallmar."
Inst39Quest2_HORDE_Location = "Nazgrel (Hellfire Peninsula - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst39Quest2_HORDE_Note = "Warchief Kargath Bladefist is Located at "..YELLOW.."[5]"..WHITE.."."
Inst39Quest2_HORDE_Prequest = "None"
Inst39Quest2_HORDE_Folgequest = "None"
--
Inst39Quest2name1_HORDE = "Rod of Dire Shadows"
Inst39Quest2name2_HORDE = "Vicar's Cloak"
Inst39Quest2name3_HORDE = "Conquerer's Band"
Inst39Quest2name4_HORDE = "Maimfist's Choker"

--Quest 3 Horde
Inst39Quest3_HORDE = "3. Imprisoned in the Citadel (Heroic)"
Inst39Quest3_HORDE_Level = "70"
Inst39Quest3_HORDE_Attain = "70"
Inst39Quest3_HORDE_Aim = "Rescue Captain Boneshatter inside Hellfire Citadel before he is executed."
Inst39Quest3_HORDE_Location = "Drisella (Shattered Halls; "..YELLOW.."Heroic [1]"..WHITE..")"
Inst39Quest3_HORDE_Note = "Requires Heroic Dungeon Difficulty.\n\nDrisella is at "..YELLOW.."[5]"..WHITE..". Timer with 55 minutes starts at the beginning of the Archer event."
Inst39Quest3_HORDE_Prequest = "None"
Inst39Quest3_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 5 Alliance)
Inst39Quest4_HORDE = "4. Trial of the Naaru: Mercy (Heroic)"
Inst39Quest4_HORDE_Level = Inst39Quest5_Level
Inst39Quest4_HORDE_Attain = Inst39Quest5_Attain
Inst39Quest4_HORDE_Aim = Inst39Quest5_Aim
Inst39Quest4_HORDE_Location = Inst39Quest5_Location
Inst39Quest4_HORDE_Note = Inst39Quest5_Note
Inst39Quest4_HORDE_Prequest = Inst39Quest5_Prequest
Inst39Quest4_HORDE_Folgequest = Inst39Quest5_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst39Quest5_HORDE = "5. Tear of the Earthmother"
Inst39Quest5_HORDE_Level = Inst39Quest6_Level
Inst39Quest5_HORDE_Attain = Inst39Quest6_Attain
Inst39Quest5_HORDE_Aim = Inst39Quest6_Aim
Inst39Quest5_HORDE_Location = Inst39Quest6_Location
Inst39Quest5_HORDE_Note = Inst39Quest6_Note
Inst39Quest5_HORDE_Prequest = Inst39Quest6_Prequest
Inst39Quest5_HORDE_Folgequest = Inst39Quest6_Folgequest
Inst39Quest5PreQuest_HORDE = Inst39Quest6Prequest
-- No Rewards for this quest

--Quest 6 Alliance  (same as Quest 7 Alliance)
Inst39Quest6_HORDE = "6. Kalynna's Request (Heroic)"
Inst39Quest6_HORDE_Level = Inst39Quest7_Level
Inst39Quest6_HORDE_Attain = Inst39Quest7_Attain
Inst39Quest6_HORDE_Aim = Inst39Quest7_Aim
Inst39Quest6_HORDE_Location = Inst39Quest7_Location
Inst39Quest6_HORDE_Note = Inst39Quest7_Note
Inst39Quest6_HORDE_Prequest = Inst39Quest7_Prequest
Inst39Quest6_HORDE_Folgequest = Inst39Quest7_Folgequest
Inst39Quest6PreQuest_HORDE = Inst39Quest7PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 8 Alliance)
Inst39Quest7_HORDE = "7. Wanted: Bladefist's Seal (Heroic Daily)"
Inst39Quest7_HORDE_Level = Inst39Quest8_Level
Inst39Quest7_HORDE_Attain = Inst39Quest8_Attain
Inst39Quest7_HORDE_Aim = Inst39Quest8_Aim
Inst39Quest7_HORDE_Location = Inst39Quest8_Location
Inst39Quest7_HORDE_Note = Inst39Quest8_Note
Inst39Quest7_HORDE_Prequest = Inst39Quest8_Prequest
Inst39Quest7_HORDE_Folgequest = Inst39Quest8_Folgequest
--
Inst39Quest7name1_HORDE = Inst39Quest8name1

--Quest 8 Horde  (same as Quest 9 Alliance)
Inst39Quest8_HORDE = "8. Wanted: Shattered Hand Centurions (Daily)"
Inst39Quest8_HORDE_Level = Inst39Quest9_Level
Inst39Quest8_HORDE_Attain = Inst39Quest9_Attain
Inst39Quest8_HORDE_Aim = Inst39Quest9_Aim
Inst39Quest8_HORDE_Location = Inst39Quest9_Location
Inst39Quest8_HORDE_Note = Inst39Quest9_Note
Inst39Quest8_HORDE_Prequest = Inst39Quest9_Prequest
Inst39Quest8_HORDE_Folgequest = Inst39Quest9_Folgequest
--
Inst39Quest8name1_HORDE = Inst39Quest9name1

--Quest 9 Horde
Inst39Quest9_HORDE = "9. Entry Into the Citadel"
Inst39Quest9_HORDE_Level = "70"
Inst39Quest9_HORDE_Attain = "68"
Inst39Quest9_HORDE_Aim = "Bring the Primed Key Mold to Nazgrel at Thrallmar in Hellfire Peninsula."
Inst39Quest9_HORDE_Location = "Primed Key Mold  (drops from Smith Gorlunk in Shadowmoon Valley - Ata'mal Terrace; "..YELLOW.."68,36"..WHITE..")"
Inst39Quest9_HORDE_Note = "The Smith that drops the Primed Key Mold is easily soloable and very easily reachable with a flying mount.\n\nNazgrel is at (Hellfire Peninsula - Thrallmar; "..YELLOW.."55,36"..WHITE.."). He sends you to Grand Master Rohok for the next part of the quest at (Hellfire Peninsula - Thrallmar; "..YELLOW.."53,38"..WHITE..")..."
Inst39Quest9_HORDE_Page = {2, "Grand Master Rohok will ask for 4 x [Fel Iron Bar], 2 x [Arcane Dust] and 4 x [Mote of Fire].\n\nAfter turning the materials in you need to use the Charred Key Mold he gives you at the corpse of a Fel Reaver. You do not need to kill the Fel Reaver yourself, just use the mold at it.\n\nReturn to Grand Master Rohok at (Hellfire Peninsula - Thrallmar; "..YELLOW.."53,38"..WHITE..") for your reward.", };
Inst39Quest9_HORDE_Prequest = "None"
Inst39Quest9_HORDE_Folgequest = "Grand Master Rohok -> Hotter than Hell"
--
Inst39Quest9name1_HORDE = "Shattered Halls Key"



--------------- INST40 - HFC: Magtheridon's Lair ---------------

Inst40Story = {
  ["Page1"] = "On the blasted world of Outland, within the heart of Hellfire Peninsula stands Hellfire Citadel, a nearly impenetrable bastion that served as the Horde's base of operations throughout the First and Second Wars. For years this gargantuan fortress was thought to be abandoned...\n \nUntil recently.\n \nThough much of Draenor was shattered by the reckless Ner'zhul, the Hellfire Citadel remains intact– inhabited now by marauding bands of red, furious fel orcs. Though the presence of this new, savage breed presents something of a mystery, what's far more disconcerting is that the numbers of these fel orcs seem to be growing.\n \nDespite Thrall and Grom Hellscream's successful bid to end the Horde's corruption by slaying Mannoroth, reports indicate that the barbaric orcs of Hellfire Citadel have somehow managed to find a new source of corruption to fuel their primitive bloodlust.",
  ["Page2"] = "Whatever authority these orcs answer to is unknown, although it is a strongly held belief that they are not working for the Burning Legion.\n \nPerhaps the most unsettling news to come from Outland are the accounts of thunderous, savage cries issuing from somewhere deep beneath the citadel. Many have begun to wonder if these unearthly outbursts are somehow connected to the corrupted fel orcs and their growing numbers. Unfortunately those questions will have to remain unanswered.\n \nAt least for now.",
  ["MaxPages"] = "2",
};
Inst40Caption = "HFC: Magtheridon's Lair"
Inst40QAA = "2 Quests"
Inst40QAH = "2 Quests"

--Quest 1 Alliance
Inst40Quest1 = "1. Trial of the Naaru: Magtheridon"
Inst40Quest1_Level = "70"
Inst40Quest1_Attain = "70"
Inst40Quest1_Aim = "A'dal in Shattrath City wants you to slay Magtheridon."
Inst40Quest1_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst40Quest1_Note = "Must have completed Trial of the Naaru Mercy, Trial of the Naaru Strength and Trial of the Naaru Tenacity all available from A'dal.\n\nThis quest used to be required to enter Tempest Keep: The Eye, but is no longer necessary."
Inst40Quest1_Prequest = "Trial of the Naaru: Tenacity, Mercy & Strength quests."
Inst40Quest1_Folgequest = "None"
Inst40Quest1PreQuest = "true"
--
Inst40Quest1name1 = "Phoenix-fire Band"

--Quest 2 Alliance
Inst40Quest2 = "2. The Fall of Magtheridon"
Inst40Quest2_Level = "70"
Inst40Quest2_Attain = "70"
Inst40Quest2_Aim = "Return Magtheridon's Head to Force Commander Danath Trollbane at Honor Hold in Hellfire Peninsula."
Inst40Quest2_Location = "Magtheridon's Head (drops from Magtheridon; "..YELLOW.."[1]"..WHITE..")"
Inst40Quest2_Note = "Only one person in the raid can win the head to start this quest. Force Commander Danath Trollbane is at "..YELLOW.."57,67"..WHITE.."."
Inst40Quest2_Prequest = "No."
Inst40Quest2_Folgequest = "None"
--
Inst40Quest2name1 = "A'dal's Signet of Defense"
Inst40Quest2name2 = "Band of Crimson Fury"
Inst40Quest2name3 = "Naaru Lightwarden's Band"
Inst40Quest2name4 = "Ring of the Recalcitrant"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst40Quest1_HORDE = Inst40Quest1
Inst40Quest1_HORDE_Level = Inst40Quest1_Level
Inst40Quest1_HORDE_Attain = Inst40Quest1_Attain
Inst40Quest1_HORDE_Aim = Inst40Quest1_Aim
Inst40Quest1_HORDE_Location = Inst40Quest1_Location
Inst40Quest1_HORDE_Note = Inst40Quest1_Note
Inst40Quest1_HORDE_Prequest = Inst40Quest1_Prequest
Inst40Quest1_HORDE_Folgequest = Inst40Quest1_Folgequest
Inst40Quest1PreQuest_HORDE = Inst40Quest1PreQuest
--
Inst40Quest1name1_HORDE = Inst40Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst40Quest2_HORDE = Inst40Quest2
Inst40Quest2_HORDE_Level = Inst40Quest2_Level
Inst40Quest2_HORDE_Attain = Inst40Quest2_Attain
Inst40Quest2_HORDE_Aim = "Return Magtheridon's Head to Nazgrel at Thrallmar in Hellfire Peninsula."
Inst40Quest2_HORDE_Location = Inst40Quest2_Location
Inst40Quest2_HORDE_Note = "Only one person in the raid can win the head to start this quest. Nazgrel is at "..YELLOW.."55,36"..WHITE.."."
Inst40Quest2_HORDE_Prequest = Inst40Quest2_Prequest
Inst40Quest2_HORDE_Folgequest = Inst40Quest2_Folgequest
--
Inst40Quest2name1_HORDE = Inst40Quest2name1
Inst40Quest2name2_HORDE = Inst40Quest2name2
Inst40Quest2name3_HORDE = Inst40Quest2name3
Inst40Quest2name4_HORDE = Inst40Quest2name4



--------------- INST41 - CR: The Slave Pens (SP) ---------------

Inst41Story = "The delicate ecology of Zangarmarsh has been thrown out of balance.\n\nUnnatural phenomena are corrupting and destroying the marsh's native flora and fauna.\n\nThis disturbance has been traced to the foreboding Coilfang Reservoir.\n\nIt is rumored that the leader of this mysterious edifice is none other than the infamous Lady Vashj.\n\nOnly you can discover her nefarious plans and stop them before it's too late.\n\nCoilfang Reservoir is divided into four areas, three of which are five-man dungeons (the Slave Pens, the Underbog, and the Steamvault), in addition to the 25-man raid dungeon, Serpentshrine Cavern. "
Inst41Caption = "CR: The Slave Pens"
Inst41QAA = "4 Quests"
Inst41QAH = "4 Quests"

--Quest 1 Alliance
Inst41Quest1 = "1. Lost in Action"
Inst41Quest1_Level = "65"
Inst41Quest1_Attain = "62"
Inst41Quest1_Aim = "Discover what happened to Earthbinder Rayge, Naturalist Bite, Weeder Greenthumb, and Windcaller Claw. Then, return to Watcher Jhang at Coilfang Reservoir in Zangarmarsh."
Inst41Quest1_Location = "Watcher Jhang (Coilfang Reservoir; "..YELLOW.."52,36"..WHITE..")"
Inst41Quest1_Note = "Watcher Jhang is in the underwater cavern at the summoning stone. Weeder Greenthumb is at "..YELLOW.."[3]"..WHITE.." and Naturalist Bite is at "..YELLOW.."[6]"..WHITE..". This quest continues in Underbog. The prequests are optional."
Inst41Quest1_Prequest = "Drain Schematics -> Failed Incursion"
Inst41Quest1_Folgequest = "None"
Inst41Quest1PreQuest = "true"
--
Inst41Quest1name1 = "Cenarion Ring of Casting"
Inst41Quest1name2 = "Goldenvine Wraps"
Inst41Quest1name3 = "Dark Cloak of the Marsh"

--Quest 2 Alliance
Inst41Quest2 = "2. Wanted: The Heart of Quagmirran (Heroic Daily)"
Inst41Quest2_Level = "70"
Inst41Quest2_Attain = "70"
Inst41Quest2_Aim = "Wind Trader Zhareem has asked you to obtain The Heart of Quagmirran. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst41Quest2_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst41Quest2_Note = "This daily quest can only be completed on Heroic difficulty.\n\nQuagmirran is at "..YELLOW.."[7]"..WHITE.."."
Inst41Quest2_Prequest = "None"
Inst41Quest2_Folgequest = "None"
--
Inst41Quest2name1 = "Badge of Justice"

--Quest 3 Alliance
Inst41Quest3 = "3. The Cudgel of Kar'desh (Heroic)"
Inst41Quest3_Level = "70"
Inst41Quest3_Attain = "70"
Inst41Quest3_Aim = "Skar'this the Heretic in the heroic Slave Pens of Coilfang Reservoir wants you to bring him the Earthen Signet and the Blazing Signet."
Inst41Quest3_Location = "Skar'this the Heretic (Slave Pens; "..YELLOW.."Heroic [4]"..WHITE..")"
Inst41Quest3_Note = "The Earthen Signet drops off Gruul in "..YELLOW.."Gruul's Lair"..WHITE.." and the Blazing Signet drops off Nightbane in "..YELLOW.."Karazhan"..WHITE..".\n\nThis quest used to be required to enter Serpentshrine Cavern, but is no longer necessary."
Inst41Quest3_Prequest = "None"
Inst41Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst41Quest4 = "4. Shards of Ahune (Seasonal)"
Inst41Quest4_Level = "80"
Inst41Quest4_Attain = "75"
Inst41Quest4_Aim = "Bring the Ice Shards to Luma Skymother."
Inst41Quest4_Location = "Shards of Ahune (drops from Ice Chest after Ahune, The Frost Lord is killed)"
Inst41Quest4_Note = "Luma Skymother is at (Slave Pens; "..YELLOW.."Near [1]"..WHITE.."). This item will only drop once per character."
Inst41Quest4_Prequest = "None"
Inst41Quest4_Folgequest = "None"
--
Inst41Quest4name1 = "Tabard of Summer Skies"
Inst41Quest4name2 = "Tabard of Summer Flames"
Inst41Quest4name3 = "Burning Blossom"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst41Quest1_HORDE = Inst41Quest1
Inst41Quest1_HORDE_Level = Inst41Quest1_Level
Inst41Quest1_HORDE_Attain = Inst41Quest1_Attain
Inst41Quest1_HORDE_Aim = Inst41Quest1_Aim
Inst41Quest1_HORDE_Location = Inst41Quest1_Location
Inst41Quest1_HORDE_Note = Inst41Quest1_Note
Inst41Quest1_HORDE_Prequest = Inst41Quest1_Prequest
Inst41Quest1_HORDE_Folgequest = Inst41Quest1_Folgequest
Inst41Quest1PreQuest_HORDE = Inst41Quest1PreQuest
--
Inst41Quest1name1_HORDE = Inst41Quest1name1
Inst41Quest1name2_HORDE = Inst41Quest1name2
Inst41Quest1name3_HORDE = Inst41Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst41Quest2_HORDE = Inst41Quest2
Inst41Quest2_HORDE_Level = Inst41Quest2_Level
Inst41Quest2_HORDE_Attain = Inst41Quest2_Attain
Inst41Quest2_HORDE_Aim = Inst41Quest2_Aim
Inst41Quest2_HORDE_Location = Inst41Quest2_Location
Inst41Quest2_HORDE_Note = Inst41Quest2_Note
Inst41Quest2_HORDE_Prequest = Inst41Quest2_Prequest
Inst41Quest2_HORDE_Folgequest = Inst41Quest2_Folgequest
--
Inst41Quest2name1_HORDE = Inst41Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst41Quest3_HORDE = Inst41Quest3
Inst41Quest3_HORDE_Level = Inst41Quest3_Level
Inst41Quest3_HORDE_Attain = Inst41Quest3_Attain
Inst41Quest3_HORDE_Aim = Inst41Quest3_Aim
Inst41Quest3_HORDE_Location = Inst41Quest3_Location
Inst41Quest3_HORDE_Note = Inst41Quest3_Note
Inst41Quest3_HORDE_Prequest = Inst41Quest3_Prequest
Inst41Quest3_HORDE_Folgequest = Inst41Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst41Quest4_HORDE = Inst41Quest4
Inst41Quest4_HORDE_Level = Inst41Quest4_Level
Inst41Quest4_HORDE_Attain = Inst41Quest4_Attain
Inst41Quest4_HORDE_Aim = Inst41Quest4_Aim
Inst41Quest4_HORDE_Location = Inst41Quest4_Location
Inst41Quest4_HORDE_Note = Inst41Quest4_Note
Inst41Quest4_HORDE_Prequest = Inst41Quest4_Prequest
Inst41Quest4_HORDE_Folgequest = Inst41Quest4_Folgequest
--
Inst41Quest4name1_HORDE = Inst41Quest4name1
Inst41Quest4name2_HORDE = Inst41Quest4name2
Inst41Quest4name3_HORDE = Inst41Quest4name3



--------------- INST42 - CR: The Steamvault (SV) ---------------

Inst42Story = "The delicate ecology of Zangarmarsh has been thrown out of balance.\n\nUnnatural phenomena are corrupting and destroying the marsh's native flora and fauna.\n\nThis disturbance has been traced to the foreboding Coilfang Reservoir.\n\nIt is rumored that the leader of this mysterious edifice is none other than the infamous Lady Vashj.\n\nOnly you can discover her nefarious plans and stop them before it's too late.\n\nCoilfang Reservoir is divided into four areas, three of which are five-man dungeons (the Slave Pens, the Underbog, and the Steamvault), in addition to the 25-man raid dungeon, Serpentshrine Cavern. "
Inst42Caption = "CR: The Steamvault"
Inst42QAA = "7 Quests"
Inst42QAH = "7 Quests"

--Quest 1 Alliance
Inst42Quest1 = "1. The Warlord's Hideout"
Inst42Quest1_Level = "70"
Inst42Quest1_Attain = "67"
Inst42Quest1_Aim = "Watcher Jhang wants you to find and slay Warlord Kalithresh inside Coilfang Reservoir."
Inst42Quest1_Location = "Watcher Jhang (Coilfang Reservoir; "..YELLOW.."52,36"..WHITE..")"
Inst42Quest1_Note = "Watcher Jhang is in the underwater cavern at the summoning stone. Warlord Kalithresh is at "..YELLOW.."[4]"..WHITE..". Make sure to destroy the Tanks when Kalithresh uses them."
Inst42Quest1_Prequest = "None"
Inst42Quest1_Folgequest = "None"
--
Inst42Quest1name1 = "Hydromancer's Headwrap"
Inst42Quest1name2 = "Helm of the Claw"
Inst42Quest1name3 = "Earthwarden's Coif"
Inst42Quest1name4 = "Myrmidon's Headdress"

--Quest 2 Alliance
Inst42Quest2 = "2. Orders from Lady Vashj"
Inst42Quest2_Level = "70"
Inst42Quest2_Attain = "67"
Inst42Quest2_Aim = "Deliver the Orders from Lady Vashj to Ysiel Windsinger at the Cenarion Refuge in Zangarmarsh."
Inst42Quest2_Location = "Orders from Lady Vashj (random drop from Steamvaults)"
Inst42Quest2_Note = "Ysiel Windsinger is at Terrokar Forest - Cenarion Refuge; ("..YELLOW.."78,62"..WHITE.."). The followup quest enables you to turn in Coilfang Armaments for Cenarion Expedition reputation. Coilfang Armaments are randomly dropped from Steamvaults and Serpentshrine Cavern and can be collected (but not turned in) before you do this quest. They do not bind, so they can be traded or bought from other players."
Inst42Quest2_Prequest = "None"
Inst42Quest2_Folgequest = "Preparing for War"
-- No Rewards for this quest

--Quest 3 Alliance
Inst42Quest3 = "3. Trial of the Naaru: Strength (Heroic)"
Inst42Quest3_Level = "70"
Inst42Quest3_Attain = "70"
Inst42Quest3_Aim = "A'dal in Shattrath City wants you to recover Kalithresh's Trident and Murmur's Essence."
Inst42Quest3_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst42Quest3_Note = "Requires Heroic Dungeon Difficulty. Warlord Kalithresh is at "..YELLOW.."[4]"..WHITE..". Murmur's Essence comes from Shadow Labyrinth.\n\nThis quest used to be required to enter Tempest Keep: The Eye, but is no longer necessary."
Inst42Quest3_Prequest = "None"
Inst42Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst42Quest4 = "4. Underworld Loam"
Inst42Quest4_Level = "70"
Inst42Quest4_Attain = "67"
Inst42Quest4_Aim = "Get a Vial of Underworld Loam from Hydromancer Thespia and bring it to David Wayne at Wayne's Refuge."
Inst42Quest4_Location = "David Wayne (Terokkar Forest - Wayne's Refuge; "..YELLOW.."78,39"..WHITE..")"
Inst42Quest4_Note = "Hydromancer Thespia is at "..YELLOW.."[1]"..WHITE..".\n\nThe item will drop in both Normal and Heroic modes."
Inst42Quest4_Prequest = "Fresh From the Mechanar ("..YELLOW.."TK: Mechanar"..WHITE..") & The Lexicon Demonica ("..YELLOW.."Auch: Shadow Labyrinth"..WHITE..")"
Inst42Quest4_Folgequest = "Bane of the Illidari"
Inst42Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst42Quest5 = "5. The Second and Third Fragments"
Inst42Quest5_Level = "70"
Inst42Quest5_Attain = "68"
Inst42Quest5_Aim = "Obtain the Second Key Fragment from an Arcane Container inside Coilfang Reservoir and the Third Key Fragment from an Arcane Container inside Tempest Keep. Return to Khadgar in Shattrath City after you've completed this task."
Inst42Quest5_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst42Quest5_Note = "Part of the Karazhan attunement line. The Arcane Container is at "..YELLOW.."[2]"..WHITE..", at the bottom of a pool of water. Opening it will spawn an elemental that must be killed to get the fragment. The Third Key Fragment is in the Arcatraz."
Inst42Quest5_Prequest = "Entry Into Karazhan ("..YELLOW.."Auch: Shadow Labyrinth"..WHITE..")"
Inst42Quest5_Folgequest = "The Master's Touch ("..YELLOW.."CoT: Black Morass"..WHITE..")"
Inst42Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst42Quest6 = "6. Wanted: Coilfang Myrmidons (Daily)"
Inst42Quest6_Level = "70"
Inst42Quest6_Attain = "70"
Inst42Quest6_Aim = "Nether-Stalker Mah'duun has asked you to slay 14 Coilfang Myrmidons. Return to him in Shattrath's Lower City once they all lie dead in order to collect the bounty."
Inst42Quest6_Location = "Nether-Stalker Mah'duun (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst42Quest6_Note = "This is a daily quest."
Inst42Quest6_Prequest = "None"
Inst42Quest6_Folgequest = "None"
--
Inst42Quest6name1 = "Ethereum Prison Key"

--Quest 7 Alliance
Inst42Quest7 = "7. Wanted: The Warlord's Treatise (Heroic Daily)"
Inst42Quest7_Level = "70"
Inst42Quest7_Attain = "70"
Inst42Quest7_Aim = "Wind Trader Zhareem has asked you to acquire The Warlord's Treatise. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst42Quest7_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst42Quest7_Note = "This daily quest can only be completed on Heroic difficulty.\n\nWarlord Kalithresh is at "..YELLOW.."[4]"..WHITE.."."
Inst42Quest7_Prequest = "None"
Inst42Quest7_Folgequest = "None"
--
Inst42Quest7name1 = "Badge of Justice"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst42Quest1_HORDE = Inst42Quest1
Inst42Quest1_HORDE_Level = Inst42Quest1_Level
Inst42Quest1_HORDE_Attain = Inst42Quest1_Attain
Inst42Quest1_HORDE_Aim = Inst42Quest1_Aim
Inst42Quest1_HORDE_Location = Inst42Quest1_Location
Inst42Quest1_HORDE_Note = Inst42Quest1_Note
Inst42Quest1_HORDE_Prequest = Inst42Quest1_Prequest
Inst42Quest1_HORDE_Folgequest = Inst42Quest1_Folgequest
--
Inst42Quest1name1_HORDE = Inst42Quest1name1
Inst42Quest1name2_HORDE = Inst42Quest1name2
Inst42Quest1name3_HORDE = Inst42Quest1name3
Inst42Quest1name4_HORDE = Inst42Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst42Quest2_HORDE = Inst42Quest2
Inst42Quest2_HORDE_Level = Inst42Quest2_Level
Inst42Quest2_HORDE_Attain = Inst42Quest2_Attain
Inst42Quest2_HORDE_Aim = Inst42Quest2_Aim
Inst42Quest2_HORDE_Location = Inst42Quest2_Location
Inst42Quest2_HORDE_Note = Inst42Quest2_Note
Inst42Quest2_HORDE_Prequest = Inst42Quest2_Prequest
Inst42Quest2_HORDE_Folgequest = Inst42Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst42Quest3_HORDE = Inst42Quest3
Inst42Quest3_HORDE_Level = Inst42Quest3_Level
Inst42Quest3_HORDE_Attain = Inst42Quest3_Attain
Inst42Quest3_HORDE_Aim = Inst42Quest3_Aim
Inst42Quest3_HORDE_Location = Inst42Quest3_Location
Inst42Quest3_HORDE_Note = Inst42Quest3_Note
Inst42Quest3_HORDE_Prequest = Inst42Quest3_Prequest
Inst42Quest3_HORDE_Folgequest = Inst42Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst42Quest4_HORDE = Inst42Quest4
Inst42Quest4_HORDE_Level = Inst42Quest4_Level
Inst42Quest4_HORDE_Attain = Inst42Quest4_Attain
Inst42Quest4_HORDE_Aim = Inst42Quest4_Aim
Inst42Quest4_HORDE_Location = Inst42Quest4_Location
Inst42Quest4_HORDE_Note = Inst42Quest4_Note
Inst42Quest4_HORDE_Prequest = Inst42Quest4_Prequest
Inst42Quest4_HORDE_Folgequest = Inst42Quest4_Folgequest
Inst42Quest4PreQuest_HORDE = Inst42Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst42Quest5_HORDE = Inst42Quest5
Inst42Quest5_HORDE_Level = Inst42Quest5_Level
Inst42Quest5_HORDE_Attain = Inst42Quest5_Attain
Inst42Quest5_HORDE_Aim = Inst42Quest5_Aim
Inst42Quest5_HORDE_Location = Inst42Quest5_Location
Inst42Quest5_HORDE_Note = Inst42Quest5_Note
Inst42Quest5_HORDE_Prequest = Inst42Quest5_Prequest
Inst42Quest5_HORDE_Folgequest = Inst42Quest5_Folgequest
Inst42Quest5PreQuest_HORDE = Inst42Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst42Quest6_HORDE = Inst42Quest6
Inst42Quest6_HORDE_Level = Inst42Quest6_Level
Inst42Quest6_HORDE_Attain = Inst42Quest6_Attain
Inst42Quest6_HORDE_Aim = Inst42Quest6_Aim
Inst42Quest6_HORDE_Location = Inst42Quest6_Location
Inst42Quest6_HORDE_Note = Inst42Quest6_Note
Inst42Quest6_HORDE_Prequest = Inst42Quest6_Prequest
Inst42Quest6_HORDE_Folgequest = Inst42Quest6_Folgequest
--
Inst42Quest6name1_HORDE = Inst42Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst42Quest7_HORDE = Inst42Quest7
Inst42Quest7_HORDE_Level = Inst42Quest7_Level
Inst42Quest7_HORDE_Attain = Inst42Quest7_Attain
Inst42Quest7_HORDE_Aim = Inst42Quest7_Aim
Inst42Quest7_HORDE_Location = Inst42Quest7_Location
Inst42Quest7_HORDE_Note = Inst42Quest7_Note
Inst42Quest7_HORDE_Prequest = Inst42Quest7_Prequest
Inst42Quest7_HORDE_Folgequest = Inst42Quest7_Folgequest
--
Inst42Quest7name1_HORDE = Inst42Quest7name1



--------------- INST43 - CR: The Underbog (UB) ---------------

Inst43Story = "The delicate ecology of Zangarmarsh has been thrown out of balance.\n\nUnnatural phenomena are corrupting and destroying the marsh's native flora and fauna.\n\nThis disturbance has been traced to the foreboding Coilfang Reservoir.\n\nIt is rumored that the leader of this mysterious edifice is none other than the infamous Lady Vashj.\n\nOnly you can discover her nefarious plans and stop them before it's too late.\n\nCoilfang Reservoir is divided into four areas, three of which are five-man dungeons (the Slave Pens, the Underbog, and the Steamvault), in addition to the 25-man raid dungeon, Serpentshrine Cavern. "
Inst43Caption = "CR: The Underbog"
Inst43QAA = "5 Quests"
Inst43QAH = "5 Quests"

--Quest 1 Alliance
Inst43Quest1 = "1. Lost in Action"
Inst43Quest1_Level = "65"
Inst43Quest1_Attain = "62"
Inst43Quest1_Aim = "Discover what happened to Earthbinder Rayge, Naturalist Bite, Weeder Greenthumb, and Windcaller Claw. Then, return to Watcer Jhang at Coilfang Reservoir in Zangarmarsh."
Inst43Quest1_Location = "Watcher Jhang (Coilfang Reservoir; "..YELLOW.."52,36"..WHITE..")"
Inst43Quest1_Note = "Watcher Jhang is in the underwater cavern at the summoning stone. Earthbinder Rayge is at "..YELLOW.."[3]"..WHITE..", Windcaller Claw is at "..YELLOW.."[4]"..WHITE..". The prequests do not appear to be necessary to obtain this quest."
Inst43Quest1_Prequest = "Drain Schematics -> Failed Incursion"
Inst43Quest1_Folgequest = "None"
Inst43Quest1PreQuest = "true"
--
Inst43Quest1name1 = "Cenarion Ring of Casting"
Inst43Quest1name2 = "Goldenvine Wraps"
Inst43Quest1name3 = "Dark Cloak of the Marsh"

--Quest 2 Alliance
Inst43Quest2 = "2. Oh, It's On!"
Inst43Quest2_Level = "65"
Inst43Quest2_Attain = "63"
Inst43Quest2_Aim = "Gather an Underspore Frond and return it to T'shu at Sporeggar in Zangarmarsh."
Inst43Quest2_Location = "T'shu (Zangarmarsh - Sporeggar; "..YELLOW.."19,49"..WHITE..")"
Inst43Quest2_Note = "You must be Neutral with Sporeggar to pick up this quest. The Underspore Frond is just behind Hungarfen, located at "..YELLOW.."[1]"..WHITE.."."
Inst43Quest2_Prequest = "None"
Inst43Quest2_Folgequest = "None"
--
Inst43Quest2name1 = "Everlasting Underspore Frond"

--Quest 3 Alliance
Inst43Quest3 = "3. Stalk the Stalker"
Inst43Quest3_Level = "65"
Inst43Quest3_Attain = "63"
Inst43Quest3_Aim = "Bring the Brain of the Black Stalker to Khn'nix at Sporeggar in Zangarmarsh."
Inst43Quest3_Location = "Khn'nix (Zangarmarsh - Sporeggar; "..YELLOW.."19,49"..WHITE..")"
Inst43Quest3_Note = "You must be Neutral with Sporeggar to pick up this quest. The Black Stalker is located at "..YELLOW.."[5]"..WHITE.."."
Inst43Quest3_Prequest = "None"
Inst43Quest3_Folgequest = "None"
--
Inst43Quest3name1 = "Essence Infused Mushroom"
Inst43Quest3name2 = "Power Infused Mushroom"

--Quest 4 Alliance
Inst43Quest4 = "4. Wanted: A Black Stalker Egg (Heroic Daily)"
Inst43Quest4_Level = "70"
Inst43Quest4_Attain = "70"
Inst43Quest4_Aim = "Wind Trader Zhareem wants you to obtain a Black Stalker Egg. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst43Quest4_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst43Quest4_Note = "This daily quest can only be completed on Heroic difficulty.\n\nThe Black Stalker is at "..YELLOW.."[5]"..WHITE.."."
Inst43Quest4_Prequest = "None"
Inst43Quest4_Folgequest = "None"
--
Inst43Quest4name1 = "Badge of Justice"

--Quest 5 Alliance
Inst43Quest5 = "5. Bring Me A Shrubbery!"
Inst43Quest5_Level = "65"
Inst43Quest5_Attain = "63"
Inst43Quest5_Aim = "Collect 5 Sanguine Hibiscus and return them to Gzhun'tt at Sporeggar in Zangarmarsh."
Inst43Quest5_Location = "Gzhun'tt (Zangarmarsh - Sporeggar; "..YELLOW.."19,50"..WHITE..")"
Inst43Quest5_Note = "You must be Neutral with Sporeggar to pick up this quest. The followup is just a repeatable quest that gives 750 Sporeggar Reputation with each turn-in. The Sanguine Hibiscus are scattered throughout Underbog near plants and also drop off of Bog mobs, including those in Steamvault. They are also tradeable and can be found on the Auction House."
Inst43Quest5_Prequest = "None"
Inst43Quest5_Folgequest = "Bring Me Another Shrubbery!"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst43Quest1_HORDE = Inst43Quest1
Inst43Quest1_HORDE_Level = Inst43Quest1_Level
Inst43Quest1_HORDE_Attain = Inst43Quest1_Attain
Inst43Quest1_HORDE_Aim = Inst43Quest1_Aim
Inst43Quest1_HORDE_Location = Inst43Quest1_Location
Inst43Quest1_HORDE_Note = Inst43Quest1_Note
Inst43Quest1_HORDE_Prequest = Inst43Quest1_Prequest
Inst43Quest1_HORDE_Folgequest = Inst43Quest1_Folgequest
Inst43Quest1PreQuest_HORDE = Inst43Quest1PreQuest
--
Inst43Quest1name1_HORDE = Inst43Quest1name1
Inst43Quest1name2_HORDE = Inst43Quest1name2
Inst43Quest1name3_HORDE = Inst43Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst43Quest2_HORDE = Inst43Quest2
Inst43Quest2_HORDE_Level = Inst43Quest2_Level
Inst43Quest2_HORDE_Attain = Inst43Quest2_Attain
Inst43Quest2_HORDE_Aim = Inst43Quest2_Aim
Inst43Quest2_HORDE_Location = Inst43Quest2_Location
Inst43Quest2_HORDE_Note = Inst43Quest2_Note
Inst43Quest2_HORDE_Prequest = Inst43Quest2_Prequest
Inst43Quest2_HORDE_Folgequest = Inst43Quest2_Folgequest
--
Inst43Quest2name1_HORDE = Inst43Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst43Quest3_HORDE = Inst43Quest3
Inst43Quest3_HORDE_Level = Inst43Quest3_Level
Inst43Quest3_HORDE_Attain = Inst43Quest3_Attain
Inst43Quest3_HORDE_Aim = Inst43Quest3_Aim
Inst43Quest3_HORDE_Location = Inst43Quest3_Location
Inst43Quest3_HORDE_Note = Inst43Quest3_Note
Inst43Quest3_HORDE_Prequest = Inst43Quest3_Prequest
Inst43Quest3_HORDE_Folgequest = Inst43Quest3_Folgequest
--
Inst43Quest3name1_HORDE = Inst43Quest3name1
Inst43Quest3name2_HORDE = Inst43Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst43Quest4_HORDE = Inst43Quest4
Inst43Quest4_HORDE_Level = Inst43Quest4_Level
Inst43Quest4_HORDE_Attain = Inst43Quest4_Attain
Inst43Quest4_HORDE_Aim = Inst43Quest4_Aim
Inst43Quest4_HORDE_Location = Inst43Quest4_Location
Inst43Quest4_HORDE_Note = Inst43Quest4_Note
Inst43Quest4_HORDE_Prequest = Inst43Quest4_Prequest
Inst43Quest4_HORDE_Folgequest = Inst43Quest4_Folgequest
--
Inst43Quest4name1_HORDE = Inst43Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst43Quest5_HORDE = Inst43Quest5
Inst43Quest5_HORDE_Level = Inst43Quest5_Level
Inst43Quest5_HORDE_Attain = Inst43Quest5_Attain
Inst43Quest5_HORDE_Aim = Inst43Quest5_Aim
Inst43Quest5_HORDE_Location = Inst43Quest5_Location
Inst43Quest5_HORDE_Note = Inst43Quest5_Note
Inst43Quest5_HORDE_Prequest = Inst43Quest5_Prequest
Inst43Quest5_HORDE_Folgequest = Inst43Quest5_Folgequest
-- No Rewards for this quest



--------------- INST44 - Auchindoun: Auchenai Crypts (AC) ---------------

Inst44Story = "For thousands of years, the draenei have been interring their dead in Auchindoun, their most sacred temple.\n\nHowever, it was infiltrated by agents of the Shadow Council bent on summoning a horrifying creature of immense evil.\n\nTheir vile act of magic resulted in a massive explosion that blew the temple apart and reduced the surrounding area into a charred wasteland.\n\nThe blast also caused a rift in the Nether itself, drawing the otherworldly Ethereals into Outland.\n\nThe interred draenei now walk the ruins as restless spirits.\n\nMeanwhile, the horrific entity summoned by the Shadow Council threatens to overwhelm their efforts to contain it.\n\nYou must prevent this evil from being unleashed upon an unsuspecting world.\n\nAuchindoun is divided into four wings, and is designed for a party of five characters levels 64-70."
Inst44Caption = "Auch: Auchenai Crypts"
Inst44QAA = "2 Quests"
Inst44QAH = "4 Quests"

--Quest 1 Alliance
Inst44Quest1 = "1. Everything Will Be Alright"
Inst44Quest1_Level = "67"
Inst44Quest1_Attain = "64"
Inst44Quest1_Aim = "Enter the Auchenai Crypts and destroy Exarch Maladaar so that the spirits trapped inside can finally rest in peace."
Inst44Quest1_Location = "Greatfather Aldrimus (Terokkar Forest; "..YELLOW.."35,65"..WHITE..")"
Inst44Quest1_Note = "Exarch Maladarr is Located at "..YELLOW.."[2]"..WHITE..". The prequest line starts from Ha'lei (Terokkar Forest - Auchindoun; "..YELLOW.."35,65"..WHITE..")."
Inst44Quest1_Prequest = "I See Dead Draenei -> Levixus the Soul Caller"
Inst44Quest1_Folgequest = "None"
Inst44Quest1PreQuest = "true"
--
Inst44Quest1name1 = "Auchenai Anchorite's Robe"
Inst44Quest1name2 = "Auchenai Monk's Tunic"
Inst44Quest1name3 = "Auchenai Tracker's Hauberk"
Inst44Quest1name4 = "The Exarch's Protector"

--Quest 2 Alliance
Inst44Quest2 = "2. Wanted: The Exarch's Soul Gem (Heroic Daily)"
Inst44Quest2_Level = "70"
Inst44Quest2_Attain = "70"
Inst44Quest2_Aim = "Wind Trader Zhareem has asked you to recover The Exarch's Soul Gem. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst44Quest2_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst44Quest2_Note = "This daily quest can only be completed on Heroic difficulty.\n\nExarch Maladaar is at "..YELLOW.."[2]"..WHITE.."."
Inst44Quest2_Prequest = "None"
Inst44Quest2_Folgequest = "None"
--
Inst44Quest2name1 = "Badge of Justice"


--Quest 1 Horde
Inst44Quest1_HORDE = "1. Auchindoun..."
Inst44Quest1_HORDE_Level = "68"
Inst44Quest1_HORDE_Attain = "66"
Inst44Quest1_HORDE_Aim = "Travel to the Auchenai Crypts in the Bone Wastes of Terokkar Forest and slay Exarch Maladaar to free the spirit of D'ore."
Inst44Quest1_HORDE_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst44Quest1_HORDE_Note = "Exarch Maladarr is Located at "..YELLOW.."[2]"..WHITE..". D'ore appears after Exarch Maladarr has been killed."
Inst44Quest1_HORDE_Prequest = "A Visit With the Greatmother -> A Secret Revealed"
Inst44Quest1_HORDE_Folgequest = "What The Soul Sees"
Inst44Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst44Quest2_HORDE = "2. What the Soul Sees"
Inst44Quest2_HORDE_Level = "68"
Inst44Quest2_HORDE_Attain = "66"
Inst44Quest2_HORDE_Aim = "Locate a Soul Mirror somewhere in the Auchenai Crypts and use it to call forth a Darkened Spirit from Ancient Orc Ancestors in Nagrand. Destroy 15 Darkened Spirits so that the ancestors may rest in peace."
Inst44Quest2_HORDE_Location = "D'ore (Auchenai Crypts; "..YELLOW.."[2]"..WHITE..")."
Inst44Quest2_HORDE_Note = "D'ore appears after Exarch Maladarr has been killed. Mother Kashur is at (Nagrand; "..YELLOW.."26,61"..WHITE.."). Get a group of 3 or more people before taking on the Ancient Orc Spirits."
Inst44Quest2_HORDE_Prequest = "Auchindoun"
Inst44Quest2_HORDE_Folgequest = "Return to the Greatmother"
Inst44Quest2FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst44Quest3_HORDE = "3. Everything Will Be Alright"
Inst44Quest3_HORDE_Level = Inst44Quest1_Level
Inst44Quest3_HORDE_Attain = Inst44Quest1_Attain
Inst44Quest3_HORDE_Aim = Inst44Quest1_Aim
Inst44Quest3_HORDE_Location = Inst44Quest1_Location
Inst44Quest3_HORDE_Note = Inst44Quest1_Note
Inst44Quest3_HORDE_Prequest = Inst44Quest1_Prequest
Inst44Quest3_HORDE_Folgequest = Inst44Quest1_Folgequest
Inst44Quest3PreQuest_HORDE = Inst44Quest1PreQuest
--
Inst44Quest3name1_HORDE = Inst44Quest1name1
Inst44Quest3name2_HORDE = Inst44Quest1name2
Inst44Quest3name3_HORDE = Inst44Quest1name3
Inst44Quest3name4_HORDE = Inst44Quest1name4

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst44Quest4_HORDE = "4. Wanted: The Exarch's Soul Gem (Heroic Daily)"
Inst44Quest4_HORDE_Level = Inst44Quest2_Level
Inst44Quest4_HORDE_Attain = Inst44Quest2_Attain
Inst44Quest4_HORDE_Aim = Inst44Quest2_Aim
Inst44Quest4_HORDE_Location = Inst44Quest2_Location
Inst44Quest4_HORDE_Note = Inst44Quest2_Note
Inst44Quest4_HORDE_Prequest = Inst44Quest2_Prequest
Inst44Quest4_HORDE_Folgequest = Inst44Quest2_Folgequest
--
Inst44Quest4name1_HORDE = Inst44Quest2name1



--------------- INST45 - Auchindoun: Mana Tombs (MT) ---------------

Inst45Story = "For thousands of years, the draenei have been interring their dead in Auchindoun, their most sacred temple.\n\nHowever, it was infiltrated by agents of the Shadow Council bent on summoning a horrifying creature of immense evil.\n\nTheir vile act of magic resulted in a massive explosion that blew the temple apart and reduced the surrounding area into a charred wasteland.\n\nThe blast also caused a rift in the Nether itself, drawing the otherworldly Ethereals into Outland.\n\nThe interred draenei now walk the ruins as restless spirits.\n\nMeanwhile, the horrific entity summoned by the Shadow Council threatens to overwhelm their efforts to contain it.\n\nYou must prevent this evil from being unleashed upon an unsuspecting world.\n\nAuchindoun is divided into four wings, and is designed for a party of five characters levels 64-70."
Inst45Caption = "Auch: Mana Tombs"
Inst45QAA = "5 Quests"
Inst45QAH = "5 Quests"

--Quest 1 Alliance
Inst45Quest1 = "1. Safety Is Job One"
Inst45Quest1_Level = "66"
Inst45Quest1_Attain = "64"
Inst45Quest1_Aim = "Artificer Morphalius wants you to kill 10 Ethereal Crypt Raiders, 5 Ethereal Sorcerers, 5 Nexus Stalkers and 5 Ethereal Spellbinders."
Inst45Quest1_Location = "Artificer Morphalius (Terokkar Forest - Auchindoun; "..YELLOW.."39,58"..WHITE..")"
Inst45Quest1_Note = "Ethereal Transporter Control Panel is at "..YELLOW.."[4]"..WHITE.."."
Inst45Quest1_Prequest = "None"
Inst45Quest1_Folgequest = "Someone Else's Hard Work Pays Off"
-- No Rewards for this quest

--Quest 2 Alliance
Inst45Quest2 = "2. Someone Else's Hard Work Pays Off"
Inst45Quest2_Level = "66"
Inst45Quest2_Attain = "64"
Inst45Quest2_Aim = "Escort Cryo-Engineer Sha'heen safely through the Mana-Tombs so that he can gather the ether held inside Shaffar's ether collectors."
Inst45Quest2_Location = "Cryo-Engineer Sha'heen (Mana Tombs; "..YELLOW.."[4]"..WHITE..")"
Inst45Quest2_Note = "To summon Cryo-Engineer Sha'heen, click on the Ethereal Transporter Control Panel at "..YELLOW.."[4]"..WHITE..". He'll spawn along with several other friendly Consortium NPCs.  The entire instance should be cleared before hand. Leave nothing alive. The escort can only be attempted once per instance."
Inst45Quest2_Prequest = "Safety Is Job One"
Inst45Quest2_Folgequest = "None"
Inst45Quest2FQuest = "true"
--
Inst45Quest2name1 = "Consortium Prince's Wrap"
Inst45Quest2name2 = "Cryo-mitts"
Inst45Quest2name3 = "Consortium Mantle of Phasing"
Inst45Quest2name4 = "Flesh Beast's Metal Greaves"

--Quest 3 Alliance
Inst45Quest3 = "3. Undercutting the Competition"
Inst45Quest3_Level = "66"
Inst45Quest3_Attain = "64"
Inst45Quest3_Aim = "Nexus-Prince Haramad located outside of the Mana-Tombs wants you to kill Nexus-Prince Shaffar and bring Shaffar's Wrappings back to him."
Inst45Quest3_Location = "Nexus-Prince Haramand (Terrokar Forest - Auchindoun; "..YELLOW.."39,58"..WHITE..")."
Inst45Quest3_Note = "Nexus-Prince Shaffar is at "..YELLOW.."[5]"..WHITE.."."
Inst45Quest3_Prequest = "None"
Inst45Quest3_Folgequest = "None"
--
Inst45Quest3name1 = "Haramad's Leggings of the Third Coin"
Inst45Quest3name2 = "Consortium Plated Legguards"
Inst45Quest3name3 = "Haramad's Leg Wraps"
Inst45Quest3name4 = "Haramad's Linked Chain Pantaloons"

--Quest 4 Alliance
Inst45Quest4 = "4. Stasis Chambers of the Mana-Tombs (Heroic)"
Inst45Quest4_Level = "70"
Inst45Quest4_Attain = "70"
Inst45Quest4_Aim = "The Image of Commander Ameer at Bash'ir's Landing in the Blade's Edge Mountains wants you to use the Mana-Tombs Stasis Chamber Key on the Stasis Chamber inside the Mana-Tombs of Auchindoun."
Inst45Quest4_Location = "Image of Commander Ameer (Blade's Edge Mountains - Bash'ir's Landing; "..YELLOW.."52,15"..WHITE..")."
Inst45Quest4_Note = "Requires Heroic Dungeon Difficulty. There are two Stasis Chambers. The first is just beyond Pandemonius "..YELLOW.."[1]"..WHITE..". The second is in Nexus-Prince Shaffar's room "..YELLOW.."[5]"..WHITE..". You'll need a Mark of the Nexus-King for each."
Inst45Quest4_Prequest = "The Mark of the Nexus-King"
Inst45Quest4_Folgequest = "None"
Inst45Quest4PreQuest = "true"
--
Inst45Quest4name1 = "Badge of Justice"

--Quest 5 Alliance
Inst45Quest5 = "5. Wanted: Shaffar's Wondrous Pendant (Heroic Daily)"
Inst45Quest5_Level = "70"
Inst45Quest5_Attain = "70"
Inst45Quest5_Aim = "Wind Trader Zhareem wants you to obtain Shaffar's Wondrous Amulet. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst45Quest5_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst45Quest5_Note = "This daily quest can only be completed on Heroic difficulty.\n\nNexus-Prince Shaffar is at "..YELLOW.."[5]"..WHITE.."."
Inst45Quest5_Prequest = "None"
Inst45Quest5_Folgequest = "None"
--
Inst45Quest5name1 = "Badge of Justice"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst45Quest1_HORDE = Inst45Quest1
Inst45Quest1_HORDE_Level = Inst45Quest1_Level
Inst45Quest1_HORDE_Attain = Inst45Quest1_Attain
Inst45Quest1_HORDE_Aim = Inst45Quest1_Aim
Inst45Quest1_HORDE_Location = Inst45Quest1_Location
Inst45Quest1_HORDE_Note = Inst45Quest1_Note
Inst45Quest1_HORDE_Prequest = Inst45Quest1_Prequest
Inst45Quest1_HORDE_Folgequest = Inst45Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst45Quest2_HORDE = Inst45Quest2
Inst45Quest2_HORDE_Level = Inst45Quest2_Level
Inst45Quest2_HORDE_Attain = Inst45Quest2_Attain
Inst45Quest2_HORDE_Aim = Inst45Quest2_Aim
Inst45Quest2_HORDE_Location = Inst45Quest2_Location
Inst45Quest2_HORDE_Note = Inst45Quest2_Note
Inst45Quest2_HORDE_Prequest = Inst45Quest2_Prequest
Inst45Quest2_HORDE_Folgequest = Inst45Quest2_Folgequest
Inst45Quest2FQuest_HORDE = Inst45Quest2FQuest
--
Inst45Quest2name1_HORDE = Inst45Quest2name1
Inst45Quest2name2_HORDE = Inst45Quest2name2
Inst45Quest2name3_HORDE = Inst45Quest2name3
Inst45Quest2name4_HORDE = Inst45Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst45Quest3_HORDE = Inst45Quest3
Inst45Quest3_HORDE_Level = Inst45Quest3_Level
Inst45Quest3_HORDE_Attain = Inst45Quest3_Attain
Inst45Quest3_HORDE_Aim = Inst45Quest3_Aim
Inst45Quest3_HORDE_Location = Inst45Quest3_Location
Inst45Quest3_HORDE_Note = Inst45Quest3_Note
Inst45Quest3_HORDE_Prequest = Inst45Quest3_Prequest
Inst45Quest3_HORDE_Folgequest = Inst45Quest3_Folgequest
--
Inst45Quest3name1_HORDE = Inst45Quest3name1
Inst45Quest3name2_HORDE = Inst45Quest3name2
Inst45Quest3name3_HORDE = Inst45Quest3name3
Inst45Quest3name4_HORDE = Inst45Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst45Quest4_HORDE = Inst45Quest4
Inst45Quest4_HORDE_Level = Inst45Quest4_Level
Inst45Quest4_HORDE_Attain = Inst45Quest4_Attain
Inst45Quest4_HORDE_Aim = Inst45Quest4_Aim
Inst45Quest4_HORDE_Location = Inst45Quest4_Location
Inst45Quest4_HORDE_Note = Inst45Quest4_Note
Inst45Quest4_HORDE_Prequest = Inst45Quest4_Prequest
Inst45Quest4_HORDE_Folgequest = Inst45Quest4_Folgequest
Inst45Quest4PreQuest_HORDE = Inst45Quest4PreQuest
--
Inst45Quest4name1_HORDE = Inst45Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst45Quest5_HORDE = Inst45Quest5
Inst45Quest5_HORDE_Level = Inst45Quest5_Level
Inst45Quest5_HORDE_Attain = Inst45Quest5_Attain
Inst45Quest5_HORDE_Aim = Inst45Quest5_Aim
Inst45Quest5_HORDE_Location = Inst45Quest5_Location
Inst45Quest5_HORDE_Note = Inst45Quest5_Note
Inst45Quest5_HORDE_Prequest = Inst45Quest5_Prequest
Inst45Quest5_HORDE_Folgequest = Inst45Quest5_Folgequest
--
Inst45Quest5name1_HORDE = Inst45Quest5name1



--------------- INST46 - Auchindoun: Sethekk Halls (Seth) ---------------

Inst46Story = "For thousands of years, the draenei have been interring their dead in Auchindoun, their most sacred temple.\n\nHowever, it was infiltrated by agents of the Shadow Council bent on summoning a horrifying creature of immense evil.\n\nTheir vile act of magic resulted in a massive explosion that blew the temple apart and reduced the surrounding area into a charred wasteland.\n\nThe blast also caused a rift in the Nether itself, drawing the otherworldly Ethereals into Outland.\n\nThe interred draenei now walk the ruins as restless spirits.\n\nMeanwhile, the horrific entity summoned by the Shadow Council threatens to overwhelm their efforts to contain it.\n\nYou must prevent this evil from being unleashed upon an unsuspecting world.\n\nAuchindoun is divided into four wings, and is designed for a party of five characters levels 64-70."
Inst46Caption = "Auch: Sethekk Halls"
Inst46QAA = "5 Quests"
Inst46QAH = "5 Quests"

--Quest 1 Alliance
Inst46Quest1 = "1. Brother Against Brother"
Inst46Quest1_Level = "69"
Inst46Quest1_Attain = "65"
Inst46Quest1_Aim = "Kill Darkweaver Syth in the Sethekk halls, then free Lakka from captivity. Return to Isfar outside the Sethekk Halls when you've completed the rescue."
Inst46Quest1_Location = "Isfar (Terokkar Forest - Auchindoun; "..YELLOW.."44,65"..WHITE..")"
Inst46Quest1_Note = "Darkweaver Syth is at "..YELLOW.."[1]"..WHITE..". Lakka is in a cage in the same room. Openning her cage does not spawn enemies."
Inst46Quest1_Prequest = "None"
Inst46Quest1_Folgequest = "None"
--
Inst46Quest1name1 = "Torc of the Sethekk Prophet"
Inst46Quest1name2 = "Sethekk Oracle's Focus"
Inst46Quest1name3 = "Talon Lord's Collar"
Inst46Quest1name4 = "Mark of the Ravenguard"

--Quest 2 Alliance
Inst46Quest2 = "2. Terokk's Legacy"
Inst46Quest2_Level = "69"
Inst46Quest2_Attain = "65"
Inst46Quest2_Aim = "Bring Terokk's Mask, Terokk's Quill, and the Saga of Terokk to Isfar outside the Sethekk Halls."
Inst46Quest2_Location = "Isfar (Terokkar Forest - Auchindoun; "..YELLOW.."44,65"..WHITE..")"
Inst46Quest2_Note = "Terokk's Mask drops off Darkweaver Syth at "..YELLOW.."[1]"..WHITE..", the Saga of Terokk is found at "..YELLOW.."[2]"..WHITE.." and Terokk's Quill drops from Talon King Ikiss at "..YELLOW.."[3]"..WHITE.."."
Inst46Quest2_Prequest = "None"
Inst46Quest2_Folgequest = "None"
--
Inst46Quest2name1 = "The Saga of Terokk"
Inst46Quest2name2 = "Terokk's Mask"
Inst46Quest2name3 = "Terokk's Quill"

--Quest 3 Alliance
Inst46Quest3 = "3. Vanquish the Raven God (Druid - Heroic)"
Inst46Quest3_Level = "70"
Inst46Quest3_Attain = "70"
Inst46Quest3_Aim = "Slay the Raven God and return to Morthis Whisperwing at Cenarion Refuge."
Inst46Quest3_Location = "Morthis Whisperwing (Zangarmarsh - Cenarion Refuge; "..YELLOW.."80,65"..WHITE..")"
Inst46Quest3_Note = "Requires Heroic Dungeon Difficulty. This is the last quest in the Druid Swift Flight Form questline. The Raven God Anzu is summoned at "..YELLOW.."[2]"..WHITE.." with materials provided by the quest giver."
Inst46Quest3_Prequest = "The Eagle's Essence -> Chasing the Moonstone"
Inst46Quest3_Folgequest = "None"
Inst46Quest3PreQuest = "true"
--
Inst46Quest3name1 = "Idol of the Raven Goddess"

--Quest 4 Alliance
Inst46Quest4 = "4. Kalynna's Request (Heroic)"
Inst46Quest4_Level = "70"
Inst46Quest4_Attain = "70"
Inst46Quest4_Aim = "Kalynna Lathred wants you to retrieve the Tome of Dusk from Grand Warlock Nethekurse in the Shattered Halls of Hellfire Citadel and the Book of Forgotten Names from Darkweaver Syth in the Sethekk Halls in Auchindoun."
Inst46Quest4_Location = "Kalynna Lathred (Netherstorm - Area 52; "..YELLOW.."32,63"..WHITE..")"
Inst46Quest4_Note = "Requires Heroic Dungeon Difficulty.\n\nDarkweaver Syth is at "..YELLOW.."[1]"..WHITE..". The Tome of Dusk drops in Shattered Halls."
Inst46Quest4_Prequest = "A Colleague's Aid ("..YELLOW.."Karazhan"..WHITE..")"
Inst46Quest4_Folgequest = "Nightbane ("..YELLOW.."Karazhan"..WHITE..")"
Inst46Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst46Quest5 = "5. Wanted: The Headfeathers of Ikiss (Heroic Daily)"
Inst46Quest5_Level = "70"
Inst46Quest5_Attain = "70"
Inst46Quest5_Aim = "Wind Trader Zhareem has asked you to acquire The Headfeathers of Ikiss. Deliver them to him in Shattrath's Lower City to collect the reward."
Inst46Quest5_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst46Quest5_Note = "This daily quest can only be completed on Heroic difficulty.\n\nTalon King Ikiss is at "..YELLOW.."[3]"..WHITE.."."
Inst46Quest5_Prequest = "None"
Inst46Quest5_Folgequest = "None"
--
Inst46Quest5name1 = "Badge of Justice"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst46Quest1_HORDE = Inst46Quest1
Inst46Quest1_HORDE_Level = Inst46Quest1_Level
Inst46Quest1_HORDE_Attain = Inst46Quest1_Attain
Inst46Quest1_HORDE_Aim = Inst46Quest1_Aim
Inst46Quest1_HORDE_Location = Inst46Quest1_Location
Inst46Quest1_HORDE_Note = Inst46Quest1_Note
Inst46Quest1_HORDE_Prequest = Inst46Quest1_Prequest
Inst46Quest1_HORDE_Folgequest = Inst46Quest1_Folgequest
--
Inst46Quest1name1_HORDE = Inst46Quest1name1
Inst46Quest1name2_HORDE = Inst46Quest1name2
Inst46Quest1name3_HORDE = Inst46Quest1name3
Inst46Quest1name4_HORDE = Inst46Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst46Quest2_HORDE = Inst46Quest2
Inst46Quest2_HORDE_Level = Inst46Quest2_Level
Inst46Quest2_HORDE_Attain = Inst46Quest2_Attain
Inst46Quest2_HORDE_Aim = Inst46Quest2_Aim
Inst46Quest2_HORDE_Location = Inst46Quest2_Location
Inst46Quest2_HORDE_Note = Inst46Quest2_Note
Inst46Quest2_HORDE_Prequest = Inst46Quest2_Prequest
Inst46Quest2_HORDE_Folgequest = Inst46Quest2_Folgequest
--
Inst46Quest2name1_HORDE = Inst46Quest2name1
Inst46Quest2name2_HORDE = Inst46Quest2name2
Inst46Quest2name3_HORDE = Inst46Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst46Quest3_HORDE = Inst46Quest3
Inst46Quest3_HORDE_Level = Inst46Quest3_Level
Inst46Quest3_HORDE_Attain = Inst46Quest3_Attain
Inst46Quest3_HORDE_Aim = Inst46Quest3_Aim
Inst46Quest3_HORDE_Location = Inst46Quest3_Location
Inst46Quest3_HORDE_Note = Inst46Quest3_Note
Inst46Quest3_HORDE_Prequest = Inst46Quest3_Prequest
Inst46Quest3_HORDE_Folgequest = Inst46Quest3_Folgequest
Inst46Quest3PreQuest_HORDE = Inst46Quest3PreQuest
--
Inst46Quest3name1_HORDE = Inst46Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst46Quest4_HORDE = Inst46Quest4
Inst46Quest4_HORDE_Level = Inst46Quest4_Level
Inst46Quest4_HORDE_Attain = Inst46Quest4_Attain
Inst46Quest4_HORDE_Aim = Inst46Quest4_Aim
Inst46Quest4_HORDE_Location = Inst46Quest4_Location
Inst46Quest4_HORDE_Note = Inst46Quest4_Note
Inst46Quest4_HORDE_Prequest = Inst46Quest4_Prequest
Inst46Quest4_HORDE_Folgequest = Inst46Quest4_Folgequest
Inst46Quest4PreQuest_HORDE = Inst46Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst46Quest5_HORDE = Inst46Quest5
Inst46Quest5_HORDE_Level = Inst46Quest5_Level
Inst46Quest5_HORDE_Attain = Inst46Quest5_Attain
Inst46Quest5_HORDE_Aim = Inst46Quest5_Aim
Inst46Quest5_HORDE_Location = Inst46Quest5_Location
Inst46Quest5_HORDE_Note = Inst46Quest5_Note
Inst46Quest5_HORDE_Prequest = Inst46Quest5_Prequest
Inst46Quest5_HORDE_Folgequest = Inst46Quest5_Folgequest
--
Inst46Quest5name1_HORDE = Inst46Quest5name1



--------------- INST47 - Auchindoun: Shadow Labyrinth (SLabs) ---------------

Inst47Story = "For thousands of years, the draenei have been interring their dead in Auchindoun, their most sacred temple.\n\nHowever, it was infiltrated by agents of the Shadow Council bent on summoning a horrifying creature of immense evil.\n\nTheir vile act of magic resulted in a massive explosion that blew the temple apart and reduced the surrounding area into a charred wasteland.\n\nThe blast also caused a rift in the Nether itself, drawing the otherworldly Ethereals into Outland.\n\nThe interred draenei now walk the ruins as restless spirits.\n\nMeanwhile, the horrific entity summoned by the Shadow Council threatens to overwhelm their efforts to contain it.\n\nYou must prevent this evil from being unleashed upon an unsuspecting world.\n\nAuchindoun is divided into four wings, and is designed for a party of five characters levels 64-70."
Inst47Caption = "Auch: Shadow Labyrinth"
Inst47QAA = "11 Quests"
Inst47QAH = "11 Quests"

--Quest 1 Alliance
Inst47Quest1 = "1. Find Spy To'gun"
Inst47Quest1_Level = "70"
Inst47Quest1_Attain = "68"
Inst47Quest1_Aim = "Locate Spy To'gun in the Shadow Labyrinth of Auchindoun."
Inst47Quest1_Location = "Spy Grik'tha (Terokkar Forest - Auchindoun; "..YELLOW.."40,72"..WHITE..")"
Inst47Quest1_Note = "To'gun is at "..YELLOW.."[1]"..WHITE..", and also shows on minimap"
Inst47Quest1_Prequest = "None"
Inst47Quest1_Folgequest = "The Soul Devices"
-- No Rewards for this quest

--Quest 2 Alliance
Inst47Quest2 = "2. The Soul Devices"
Inst47Quest2_Level = "70"
Inst47Quest2_Attain = "68"
Inst47Quest2_Aim = "Steal 5 Soul Devices and deliver them to Spymistress Mehlisah Highcrown at the Terrace of the Light in Shattrath City."
Inst47Quest2_Location = "Spy To'gun (Shadow Labyrinth; "..YELLOW.."[1]"..WHITE..")"
Inst47Quest2_Note = "Soul Devices are the dark purple orbs that can be found scattered around the instance. Spymistress Mehlisah Highcrown is at (Shattrath City - Terrace of Light; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest2_Prequest = "Find Spy To'gun"
Inst47Quest2_Folgequest = "None"
Inst47Quest2FQuest = "true"
--
Inst47Quest2name1 = "Shattrath Wraps"
Inst47Quest2name2 = "Spymistress's Wristguards"
Inst47Quest2name3 = "Auchenai Bracers"
Inst47Quest2name4 = "Sha'tari Wrought Armguards"

--Quest 3 Alliance
Inst47Quest3 = "3. The Book of Fel Names"
Inst47Quest3_Level = "70"
Inst47Quest3_Attain = "68"
Inst47Quest3_Aim = "Venture inside the Shadow Labyrinth in Auchindoun and obtain the Book of Fel Names from Blackheart the Inciter. Return to Altruis in Nagrand once you've completed this task."
Inst47Quest3_Location = "Altruis the Sufferer (Nagrand; "..YELLOW.."27,43"..WHITE..")"
Inst47Quest3_Note = "Blackheart the Inciter is at "..YELLOW.."[3]"..WHITE..". This is the last part of a chain quest that starts in Shadowmoon Valley at "..YELLOW.."61,28"..WHITE.." for Aldor and "..YELLOW.."55,58"..WHITE.." for Scryer"
Inst47Quest3_Prequest = "Illidan's Pupil"
Inst47Quest3_Folgequest = "Return to the Aldor or Return to the Scryers"
-- No Rewards for this quest

--Quest 4 Alliance
Inst47Quest4 = "4. Trouble at Auchindoun"
Inst47Quest4_Level = "70"
Inst47Quest4_Attain = "68"
Inst47Quest4_Aim = "Report to Field Commander Mahfuun at the entrance to the Shadow Labyrinth at Auchindoun in Terokkar Forest."
Inst47Quest4_Location = "Spymistress Mehlisah Highcrown (Shattrath City - Terrace of Light; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest4_Note = "Field Commander Mahfuun is at (Terrokar Forest - Auchindoun; "..YELLOW.."40,72"..WHITE.."), just out the Shadow Labyrinth entrance."
Inst47Quest4_Prequest = "None"
Inst47Quest4_Folgequest = "The Codex of Blood"
-- No Rewards for this quest

--Quest 5 Alliance
Inst47Quest5 = "5. The Codex of Blood"
Inst47Quest5_Level = "70"
Inst47Quest5_Attain = "68"
Inst47Quest5_Aim = "Read from the Codex of Blood in the Shadow Labyrinth of Auchindoun."
Inst47Quest5_Location = "Field Commander Mahfuun (Terrokar Forest - Auchindoun; "..YELLOW.."40,72"..WHITE..")"
Inst47Quest5_Note = "The Codex of Blood is just in front of Grandmaster Vorpil at "..YELLOW.."[4]"..WHITE.."."
Inst47Quest5_Prequest = "Trouble at Auchindoun"
Inst47Quest5_Folgequest = "Into the Heart of the Labyrinth"
Inst47Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst47Quest6 = "6. Into the Heart of the Labyrinth"
Inst47Quest6_Level = "70"
Inst47Quest6_Attain = "68"
Inst47Quest6_Aim = "Destroy Murmur and inform Spymistress Mehlisah Highcrown at the Terrace of Light in Shattrath City of the events that have transpired inside the Shadow Labyrinth."
Inst47Quest6_Location = "The Codex of Blood (Shadow Labyrinth; "..YELLOW.."[4]"..WHITE..")"
Inst47Quest6_Note = "Murmur is at "..YELLOW.."[5]"..WHITE..". Spymistress Mehlisah Highcrown is at (Shattrath City - Terrace of Light; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest6_Prequest = "The Codex of Blood"
Inst47Quest6_Folgequest = "None"
Inst47Quest6FQuest = "true"
--
Inst47Quest6name1 = "Shattrath Jumpers"
Inst47Quest6name2 = "Spymistress's Boots"
Inst47Quest6name3 = "Auchenai Boots"
Inst47Quest6name4 = "Sha'tari Wrought Greaves"

--Quest 7 Alliance
Inst47Quest7 = "7. Trial of the Naaru: Strength (Heroic)"
Inst47Quest7_Level = "70"
Inst47Quest7_Attain = "70"
Inst47Quest7_Aim = "A'dal in Shattrath City wants you to recover Kalithresh's Trident and Murmur's Essence."
Inst47Quest7_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst47Quest7_Note = "Requires Heroic Dungeon Difficulty. Murmur is at "..YELLOW.."[5]"..WHITE..". Kalithresh's Trident comes from The Steamvault.\n\nThis quest used to be required to enter Tempest Keep: The Eye, but is no longer necessary."
Inst47Quest7_Prequest = "None"
Inst47Quest7_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Alliance
Inst47Quest8 = "8. Entry Into Karazhan"
Inst47Quest8_Level = "70"
Inst47Quest8_Attain = "68"
Inst47Quest8_Aim = "Khadgar wants you to enter the Shadow Labyrinth at Auchindoun and retrieve the First Key Fragment from an Arcane Container hidden there. Return to Khadgar with the fragment."
Inst47Quest8_Location = "Khadgar (Shattrath City - Terrace of Light; "..YELLOW.."54,44"..WHITE..")"
Inst47Quest8_Note = "Part of the Karazhan attunement line. The Arcane Container is next to Murmur at "..YELLOW.."[5]"..WHITE..". Opening it will spawn an elemental that must be killed to get the fragment."
Inst47Quest8_Prequest = "Khadgar"
Inst47Quest8_Folgequest = "Entry into Karazhan"
Inst47Quest8PreQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst47Quest9 = "9. The Lexicon Demonica"
Inst47Quest9_Level = "69"
Inst47Quest9_Attain = "67"
Inst47Quest9_Aim = "Obtain the Lexicon Demonica from Grandmaster Vorpil and bring it to David Wayne at Wayne's Refuge."
Inst47Quest9_Location = "David Wayne (Terokkar Forest - Wayne's Refuge; "..YELLOW.."78,39"..WHITE..")."
Inst47Quest9_Note = "Grandmaster Vorpil is at "..YELLOW.."[4]"..WHITE..". Completing this quest along with Fresh from the Mechanar ("..YELLOW.."TK: The Mechanar"..WHITE..") will open up two new quests from David Wayne.\n\nThe item will not drop in Heroic mode."
Inst47Quest9_Prequest = "Additional Materials"
Inst47Quest9_Folgequest = "None"
Inst47Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst47Quest10 = "10. Wanted: Murmur's Whisper (Heroic Daily)"
Inst47Quest10_Level = "70"
Inst47Quest10_Attain = "70"
Inst47Quest10_Aim = "Wind Trader Zhareem has asked you to obtain Murmur's Whisper. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst47Quest10_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst47Quest10_Note = "This daily quest can only be completed on Heroic difficulty.\n\nMurmur is at "..YELLOW.."[5]"..WHITE.."."
Inst47Quest10_Prequest = "None"
Inst47Quest10_Folgequest = "None"
--
Inst47Quest10name1 = "Badge of Justice"

--Quest 11 Alliance
Inst47Quest11 = "11. Wanted: Malicious Instructors (Daily)"
Inst47Quest11_Level = "70"
Inst47Quest11_Attain = "70"
Inst47Quest11_Aim = "Nether-Stalker Mah'duun wants you to kill 3 Malicious Instructors. Return to him in Shattrath's Lower City once they all lie dead in order to collect the bounty."
Inst47Quest11_Location = "Nether-Stalker Mah'duun (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst47Quest11_Note = "This is a daily quest."
Inst47Quest11_Prequest = "None"
Inst47Quest11_Folgequest = "None"
--
Inst47Quest11name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst47Quest1_HORDE = Inst47Quest1
Inst47Quest1_HORDE_Level = Inst47Quest1_Level
Inst47Quest1_HORDE_Attain = Inst47Quest1_Attain
Inst47Quest1_HORDE_Aim = Inst47Quest1_Aim
Inst47Quest1_HORDE_Location = Inst47Quest1_Location
Inst47Quest1_HORDE_Note = Inst47Quest1_Note
Inst47Quest1_HORDE_Prequest = Inst47Quest1_Prequest
Inst47Quest1_HORDE_Folgequest = Inst47Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst47Quest2_HORDE = Inst47Quest2
Inst47Quest2_HORDE_Level = Inst47Quest2_Level
Inst47Quest2_HORDE_Attain = Inst47Quest2_Attain
Inst47Quest2_HORDE_Aim = Inst47Quest2_Aim
Inst47Quest2_HORDE_Location = Inst47Quest2_Location
Inst47Quest2_HORDE_Note = Inst47Quest2_Note
Inst47Quest2_HORDE_Prequest = Inst47Quest2_Prequest
Inst47Quest2_HORDE_Folgequest = Inst47Quest2_Folgequest
Inst47Quest2FQuest_HORDE = Inst47Quest2FQuest
--
Inst47Quest2name1_HORDE = Inst47Quest2name1
Inst47Quest2name2_HORDE = Inst47Quest2name2
Inst47Quest2name3_HORDE = Inst47Quest2name3
Inst47Quest2name4_HORDE = Inst47Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst47Quest3_HORDE = Inst47Quest3
Inst47Quest3_HORDE_Level = Inst47Quest3_Level
Inst47Quest3_HORDE_Attain = Inst47Quest3_Attain
Inst47Quest3_HORDE_Aim = Inst47Quest3_Aim
Inst47Quest3_HORDE_Location = Inst47Quest3_Location
Inst47Quest3_HORDE_Note = Inst47Quest3_Note
Inst47Quest3_HORDE_Prequest = Inst47Quest3_Prequest
Inst47Quest3_HORDE_Folgequest = Inst47Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst47Quest4_HORDE = Inst47Quest4
Inst47Quest4_HORDE_Level = Inst47Quest4_Level
Inst47Quest4_HORDE_Attain = Inst47Quest4_Attain
Inst47Quest4_HORDE_Aim = Inst47Quest4_Aim
Inst47Quest4_HORDE_Location = Inst47Quest4_Location
Inst47Quest4_HORDE_Note = Inst47Quest4_Note
Inst47Quest4_HORDE_Prequest = Inst47Quest4_Prequest
Inst47Quest4_HORDE_Folgequest = Inst47Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst47Quest5_HORDE = Inst47Quest5
Inst47Quest5_HORDE_Level = Inst47Quest5_Level
Inst47Quest5_HORDE_Attain = Inst47Quest5_Attain
Inst47Quest5_HORDE_Aim = Inst47Quest5_Aim
Inst47Quest5_HORDE_Location = Inst47Quest5_Location
Inst47Quest5_HORDE_Note = Inst47Quest5_Note
Inst47Quest5_HORDE_Prequest = Inst47Quest5_Prequest
Inst47Quest5_HORDE_Folgequest = Inst47Quest5_Folgequest
Inst47Quest5FQuest_HORDE = Inst47Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst47Quest6_HORDE = Inst47Quest6
Inst47Quest6_HORDE_Level = Inst47Quest6_Level
Inst47Quest6_HORDE_Attain = Inst47Quest6_Attain
Inst47Quest6_HORDE_Aim = Inst47Quest6_Aim
Inst47Quest6_HORDE_Location = Inst47Quest6_Location
Inst47Quest6_HORDE_Note = Inst47Quest6_Note
Inst47Quest6_HORDE_Prequest = Inst47Quest6_Prequest
Inst47Quest6_HORDE_Folgequest = Inst47Quest6_Folgequest
Inst47Quest6FQuest_HORDE = Inst47Quest6FQuest
--
Inst47Quest6name1_HORDE = Inst47Quest6name1
Inst47Quest6name2_HORDE = Inst47Quest6name2
Inst47Quest6name3_HORDE = Inst47Quest6name3
Inst47Quest6name4_HORDE = Inst47Quest6name4

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst47Quest7_HORDE = Inst47Quest7
Inst47Quest7_HORDE_Level = Inst47Quest7_Level
Inst47Quest7_HORDE_Attain = Inst47Quest7_Attain
Inst47Quest7_HORDE_Aim = Inst47Quest7_Aim
Inst47Quest7_HORDE_Location = Inst47Quest7_Location
Inst47Quest7_HORDE_Note = Inst47Quest7_Note
Inst47Quest7_HORDE_Prequest = Inst47Quest7_Prequest
Inst47Quest7_HORDE_Folgequest = Inst47Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst47Quest8_HORDE = Inst47Quest8
Inst47Quest8_HORDE_Level = Inst47Quest8_Level
Inst47Quest8_HORDE_Attain = Inst47Quest8_Attain
Inst47Quest8_HORDE_Aim = Inst47Quest8_Aim
Inst47Quest8_HORDE_Location = Inst47Quest8_Location
Inst47Quest8_HORDE_Note = Inst47Quest8_Note
Inst47Quest8_HORDE_Prequest = Inst47Quest8_Prequest
Inst47Quest8_HORDE_Folgequest = Inst47Quest8_Folgequest
Inst47Quest8PreQuest_HORDE = Inst47Quest8PreQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst47Quest9_HORDE = Inst47Quest9
Inst47Quest9_HORDE_Level = Inst47Quest9_Level
Inst47Quest9_HORDE_Attain = Inst47Quest9_Attain
Inst47Quest9_HORDE_Aim = Inst47Quest9_Aim
Inst47Quest9_HORDE_Location = Inst47Quest9_Location
Inst47Quest9_HORDE_Note = Inst47Quest9_Note
Inst47Quest9_HORDE_Prequest = Inst47Quest9_Prequest
Inst47Quest9_HORDE_Folgequest = Inst47Quest9_Folgequest
Inst47Quest9PreQuest_HORDE = Inst47Quest8PreQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst47Quest10_HORDE = Inst47Quest10
Inst47Quest10_HORDE_Level = Inst47Quest10_Level
Inst47Quest10_HORDE_Attain = Inst47Quest10_Attain
Inst47Quest10_HORDE_Aim = Inst47Quest10_Aim
Inst47Quest10_HORDE_Location = Inst47Quest10_Location
Inst47Quest10_HORDE_Note = Inst47Quest10_Note
Inst47Quest10_HORDE_Prequest = Inst47Quest10_Prequest
Inst47Quest10_HORDE_Folgequest = Inst47Quest10_Folgequest
--
Inst47Quest10name1_HORDE = Inst47Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst47Quest11_HORDE = Inst47Quest11
Inst47Quest11_HORDE_Level = Inst47Quest11_Level
Inst47Quest11_HORDE_Attain = Inst47Quest11_Attain
Inst47Quest11_HORDE_Aim = Inst47Quest11_Aim
Inst47Quest11_HORDE_Location = Inst47Quest11_Location
Inst47Quest11_HORDE_Note = Inst47Quest11_Note
Inst47Quest11_HORDE_Prequest = Inst47Quest11_Prequest
Inst47Quest11_HORDE_Folgequest = Inst47Quest11_Folgequest
--
Inst47Quest11name1_HORDE = Inst47Quest11name1



--------------- INST48 - CR: Serpentshrine Cavern (SSC) ---------------

Inst48Story = "The delicate ecology of Zangarmarsh has been thrown out of balance.\n\nUnnatural phenomena are corrupting and destroying the marsh's native flora and fauna.\n\nThis disturbance has been traced to the foreboding Coilfang Reservoir.\n\nIt is rumored that the leader of this mysterious edifice is none other than the infamous Lady Vashj.\n\nOnly you can discover her nefarious plans and stop them before it's too late.\n\nCoilfang Reservoir is divided into four areas, three of which are five-man dungeons (the Slave Pens, the Underbog, and the Steamvault), in addition to the 25-man raid dungeon, Serpentshrine Cavern. "
Inst48Caption = "CR: Serpentshrine Cavern"
Inst48QAA = "2 Quests"
Inst48QAH = "2 Quests"

--Quest 1 Alliance
Inst48Quest1 = "1. The Vials of Eternity"
Inst48Quest1_Level = "70"
Inst48Quest1_Attain = "70"
Inst48Quest1_Aim = "Soridormi at Caverns of Time wants you to retrieve Vashj's Vial Remnant from Lady Vashj at Coilfang Reservoir and Kael's Vial Remnant from Kael'thas Sunstrider at Tempest Keep."
Inst48Quest1_Location = "Soridormi (Tanaris - Caverns of Time; "..YELLOW.."58,57"..WHITE.."). NPC walks around the area."
Inst48Quest1_Note = "This quest is needed for attunement for Battle of Mount Hyjal. Lady Vashj is at "..YELLOW.."[6]"..WHITE.."."
Inst48Quest1_Prequest = "None"
Inst48Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst48Quest2 = "2. The Secret Compromised"
Inst48Quest2_Level = "70"
Inst48Quest2_Attain = "70"
Inst48Quest2_Aim = "Travel to the Warden's Cage in Shadowmoon Valley and speak to Akama."
Inst48Quest2_Location = "Seer Olum (Serpentshrine Cavern; "..YELLOW.."[4]"..WHITE..")"
Inst48Quest2_Note = "Akama is at (Shadowmoon Valley - Warden's Cage; "..YELLOW.."58,48"..WHITE..").\n\nThis is part of the Black Temple attunement questline that starts from Anchorite Ceyla (Shadowmoon Valley - Altar of Sha'tar; "..YELLOW.."62,38"..WHITE..") for Aldor and Arcanist Thelis (Shadowmoon Valley - Sanctum of the Stars; "..YELLOW.."56,59"..WHITE..") for Scryers."
Inst48Quest2_Prequest = "Tablets of Baa'ri -> Akama's Promise"
Inst48Quest2_Folgequest = "Ruse of the Ashtongue ("..YELLOW.."TK: The Eye"..WHITE..")"
Inst48Quest2PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst48Quest1_HORDE = Inst48Quest1
Inst48Quest1_HORDE_Level = Inst48Quest1_Level
Inst48Quest1_HORDE_Attain = Inst48Quest1_Attain
Inst48Quest1_HORDE_Aim = Inst48Quest1_Aim
Inst48Quest1_HORDE_Location = Inst48Quest1_Location
Inst48Quest1_HORDE_Note = Inst48Quest1_Note
Inst48Quest1_HORDE_Prequest = Inst48Quest1_Prequest
Inst48Quest1_HORDE_Folgequest = Inst48Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst48Quest2_HORDE = Inst48Quest2
Inst48Quest2_HORDE_Level = Inst48Quest2_Level
Inst48Quest2_HORDE_Attain = Inst48Quest2_Attain
Inst48Quest2_HORDE_Aim = Inst48Quest2_Aim
Inst48Quest2_HORDE_Location = Inst48Quest2_Location
Inst48Quest2_HORDE_Note = Inst48Quest2_Note
Inst48Quest2_HORDE_Prequest = Inst48Quest2_Prequest
Inst48Quest2_HORDE_Folgequest = Inst48Quest2_Folgequest
Inst48Quest2PreQuest_HORDE = Inst48Quest2PreQuest
-- No Rewards for this quest



--------------- INST49 - CoT: Black Morass (BM) ---------------

Inst49Story = "Medivh, the last of the magical Guardians of Tirisfal, was possessed at birth by the evil Titan, Sargeras.\n\nIt was Medivh who first contacted the corrupt orc sorcerer Gul'dan, also in the service of the Burning Legion.\n\nTogether they sought to bridge the dimensional gap between Azeroth and Draenor, homeworld of the orcs, to facilitate the destruction of Azeroth.\n\nOn the appointed day both Medivh and Gul'dan concentrated their considerable magic energies, forcing the collapse of the dimensional barrier.\n\nThe setting of this event is the Black Morass, now known as the Blasted Lands.\n\nPlayers will reportedly defend Medivh as he opens the portal."
Inst49Caption = "CoT: Black Morass"
Inst49QAA = "7 Quests"
Inst49QAH = "7 Quests"

--Quest 1 Alliance
Inst49Quest1 = "1. The Black Morass"
Inst49Quest1_Level = "70"
Inst49Quest1_Attain = "66"
Inst49Quest1_Aim = "Travel through the Caverns of Time to the Black Morass during the opening of the Dark Portal and speak with Sa'at."
Inst49Quest1_Location = "Andormu (Tanaris - Caverns of Time; "..YELLOW.."58,54"..WHITE..")"
Inst49Quest1_Note = "Must have completed Escape from Durnholde Keep to be attuned for Black Morass. Sa'at is just a little bit inside the instance."
Inst49Quest1_Prequest = "None"
Inst49Quest1_Folgequest = "The Opening of the Dark Portal"
-- No Rewards for this quest

--Quest 2 Alliance
Inst49Quest2 = "2. The Opening of the Dark Portal"
Inst49Quest2_Level = "70"
Inst49Quest2_Attain = "66"
Inst49Quest2_Aim = "Sa'at inside the Black Morass of the Caverns of Time has tasked you with defending Medivh until he succeeds in opening the Dark Portal. Return to Sa'at should you succeed in your task."
Inst49Quest2_Location = "Sa'at (Black Morass; "..YELLOW.."Entrance"..WHITE..")"
Inst49Quest2_Note = "If you fail, you'll have to start the event over from the beginning."
Inst49Quest2_Prequest = "The Black Morass"
Inst49Quest2_Folgequest = "Hero of the Brood"
Inst49Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst49Quest3 = "3. Hero of the Brood"
Inst49Quest3_Level = "70"
Inst49Quest3_Attain = "66"
Inst49Quest3_Aim = "Return to the child, Andormu, at the Caverns of Time in the Tanaris desert."
Inst49Quest3_Location = "Andormu (Tanaris - Caverns of Time; "..YELLOW.."58,54"..WHITE..")"
Inst49Quest3_Note = ""
Inst49Quest3_Prequest = "The Opening of the Dark Portal"
Inst49Quest3_Folgequest = "None"
Inst49Quest3FQuest = "true"
--
Inst49Quest3name1 = "Band of the Guardian"
Inst49Quest3name2 = "Keeper's Ring of Piety"
Inst49Quest3name3 = "Time-bending Gem"
Inst49Quest3name4 = "Andormu's Tear"

--Quest 4 Alliance
Inst49Quest4 = "4. The Master's Touch"
Inst49Quest4_Level = "70"
Inst49Quest4_Attain = "68"
Inst49Quest4_Aim = "Go into the Caverns of Time and convince Medivh to enable your Restored Apprentice's Key"
Inst49Quest4_Location = "Khadgar (Shatrath City - Terrace of Light; "..YELLOW.."54,44"..WHITE..")"
Inst49Quest4_Note = "Part of the Karazhan attunement line. You must be inside the instance when Aeonus dies in order to talk to Medivh."
Inst49Quest4_Prequest = "The Second and Third Fragments"
Inst49Quest4_Folgequest = "Return to Khadgar"
Inst49Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst49Quest5 = "5. Master of Elixirs (Alchemy)"
Inst49Quest5_Level = "70"
Inst49Quest5_Attain = "68"
Inst49Quest5_Aim = "Go to the Black Morass in the Caverns of Time and obtain 10 Essences of Infinity from Rift Lords and Rift Keepers. Bring these along with 5 Elixirs of Major Defense, 5 Elixirs of Mastery and 5 Elixirs of Major Agility to Lorokeem in Shattrath's Lower City."
Inst49Quest5_Location = "Lorokeem (Shattrath City - Lower City; "..YELLOW.."46,23"..WHITE..")"
Inst49Quest5_Note = "Alchemy quest. Lorokeem roams the coordinates listed."
Inst49Quest5_Prequest = "Master of Elixirs"
Inst49Quest5_Folgequest = "None"
Inst49Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst49Quest6 = "6. Wanted: Aeonus's Hourglass (Heroic Daily)"
Inst49Quest6_Level = "70"
Inst49Quest6_Attain = "70"
Inst49Quest6_Aim = "Wind Trader Zhareem has asked you to acquire Aeonus's Hourglass. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst49Quest6_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst49Quest6_Note = "This daily quest can only be completed on Heroic difficulty.\n\nAeonus spawns in the last wave."
Inst49Quest6_Prequest = "None"
Inst49Quest6_Folgequest = "None"
--
Inst49Quest6name1 = "Badge of Justice"

--Quest 7 Alliance
Inst49Quest7 = "7. Wanted: Rift Lords (Daily)"
Inst49Quest7_Level = "70"
Inst49Quest7_Attain = "70"
Inst49Quest7_Aim = "Nether-Stalker Mah'duun wants you to kill 4 Rift Lords. Return to him in Shattrath's Lower City once they all lie dead in order to collect the bounty."
Inst49Quest7_Location = "Nether-Stalker Mah'duun (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst49Quest7_Note = "This is a daily quest."
Inst49Quest7_Prequest = "None"
Inst49Quest7_Folgequest = "None"
--
Inst49Quest7name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst49Quest1_HORDE = Inst49Quest1
Inst49Quest1_HORDE_Level = Inst49Quest1_Level
Inst49Quest1_HORDE_Attain = Inst49Quest1_Attain
Inst49Quest1_HORDE_Aim = Inst49Quest1_Aim
Inst49Quest1_HORDE_Location = Inst49Quest1_Location
Inst49Quest1_HORDE_Note = Inst49Quest1_Note
Inst49Quest1_HORDE_Prequest = Inst49Quest1_Prequest
Inst49Quest1_HORDE_Folgequest = Inst49Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst49Quest2_HORDE = Inst49Quest2
Inst49Quest2_HORDE_Level = Inst49Quest2_Level
Inst49Quest2_HORDE_Attain = Inst49Quest2_Attain
Inst49Quest2_HORDE_Aim = Inst49Quest2_Aim
Inst49Quest2_HORDE_Location = Inst49Quest2_Location
Inst49Quest2_HORDE_Note = Inst49Quest2_Note
Inst49Quest2_HORDE_Prequest = Inst49Quest2_Prequest
Inst49Quest2_HORDE_Folgequest = Inst49Quest2_Folgequest
Inst49Quest2FQuest_HORDE = Inst49Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst49Quest3_HORDE = Inst49Quest3
Inst49Quest3_HORDE_Level = Inst49Quest3_Level
Inst49Quest3_HORDE_Attain = Inst49Quest3_Attain
Inst49Quest3_HORDE_Aim = Inst49Quest3_Aim
Inst49Quest3_HORDE_Location = Inst49Quest3_Location
Inst49Quest3_HORDE_Note = Inst49Quest3_Note
Inst49Quest3_HORDE_Prequest = Inst49Quest3_Prequest
Inst49Quest3_HORDE_Folgequest = Inst49Quest3_Folgequest
Inst49Quest3FQuest_HORDE = Inst49Quest3FQuest
--
Inst49Quest3name1_HORDE = Inst49Quest3name1
Inst49Quest3name2_HORDE = Inst49Quest3name2
Inst49Quest3name3_HORDE = Inst49Quest3name3
Inst49Quest3name4_HORDE = Inst49Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst49Quest4_HORDE = Inst49Quest4
Inst49Quest4_HORDE_Level = Inst49Quest4_Level
Inst49Quest4_HORDE_Attain = Inst49Quest4_Attain
Inst49Quest4_HORDE_Aim = Inst49Quest4_Aim
Inst49Quest4_HORDE_Location = Inst49Quest4_Location
Inst49Quest4_HORDE_Note = Inst49Quest4_Note
Inst49Quest4_HORDE_Prequest = Inst49Quest4_Prequest
Inst49Quest4_HORDE_Folgequest = Inst49Quest4_Folgequest
Inst49Quest4PreQuest_HORDE = Inst49Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst49Quest5_HORDE = Inst49Quest5
Inst49Quest5_HORDE_Level = Inst49Quest5_Level
Inst49Quest5_HORDE_Attain = Inst49Quest5_Attain
Inst49Quest5_HORDE_Aim = Inst49Quest5_Aim
Inst49Quest5_HORDE_Location = Inst49Quest5_Location
Inst49Quest5_HORDE_Note = Inst49Quest5_Note
Inst49Quest5_HORDE_Prequest = Inst49Quest5_Prequest
Inst49Quest5_HORDE_Folgequest = Inst49Quest5_Folgequest
Inst49Quest5PreQuest_HORDE = Inst49Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst49Quest6_HORDE = Inst49Quest6
Inst49Quest6_HORDE_Level = Inst49Quest6_Level
Inst49Quest6_HORDE_Attain = Inst49Quest6_Attain
Inst49Quest6_HORDE_Aim = Inst49Quest6_Aim
Inst49Quest6_HORDE_Location = Inst49Quest6_Location
Inst49Quest6_HORDE_Note = Inst49Quest6_Note
Inst49Quest6_HORDE_Prequest = Inst49Quest6_Prequest
Inst49Quest6_HORDE_Folgequest = Inst49Quest6_Folgequest
--
Inst49Quest6name1_HORDE = Inst49Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst49Quest7_HORDE = Inst49Quest7
Inst49Quest7_HORDE_Level = Inst49Quest7_Level
Inst49Quest7_HORDE_Attain = Inst49Quest7_Attain
Inst49Quest7_HORDE_Aim = Inst49Quest7_Aim
Inst49Quest7_HORDE_Location = Inst49Quest7_Location
Inst49Quest7_HORDE_Note = Inst49Quest7_Note
Inst49Quest7_HORDE_Prequest = Inst49Quest7_Prequest
Inst49Quest7_HORDE_Folgequest = Inst49Quest7_Folgequest
--
Inst49Quest7name1_HORDE = Inst49Quest7name1



--------------- INST50 - CoT: Battle of Mount Hyjal ---------------

Inst50Story = "At the pinnacle of the second battle against the Burning Legion it was clear to the races of Azeroth that the only way to achieve victory would be to unite their forces in a final, desperate push for victory.\n\nThis battle took place at the peak of Mount Hyjal, at the foot of Nordrassil, the World Tree.\n\nThe night elves, led by Malfurion Stormrage and Tyrande Whisperwind, the new Horde, led by Thrall and Cairne Bloodhoof, and the remnants of the Alliance of Lordaeron, led by Jaina Proudmoore, united their forces against Archimonde and the demonic forces of the Burning Legion in a massive, epic battle to defend Azeroth.\n\nVictory was narrowly achieved, even as Archimonde reached the World Tree and attempted to drain it of its energy."
Inst50Caption = "CoT: Mount Hyjal"
Inst50QAA = "1 Quest"
Inst50QAH = "1 Quest"

--Quest 1 Alliance
Inst50Quest1 = "1. An Artifact From the Past"
Inst50Quest1_Level = "70"
Inst50Quest1_Attain = "70"
Inst50Quest1_Aim = "Go to the Caverns of Time in Tanaris and gain access to the Battle of Mount Hyjal. Once inside, defeat Rage Winterchill and bring the Time-Phased Phylactery to Akama in Shadowmoon Valley."
Inst50Quest1_Location = "Akama (Shadowmoon Valley - Warden's Cage; "..YELLOW.."58,48"..WHITE..")"
Inst50Quest1_Note = "Part of the Black Temple attunement line. Rage Winterchill is at "..YELLOW.."[1]"..WHITE.."."
Inst50Quest1_Prequest = "Ruse of the Ashtongue ("..YELLOW.."TK: The Eye"..WHITE..")"
Inst50Quest1_Folgequest = "The Hostage Soul"
Inst50Quest1PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst50Quest1_HORDE = Inst50Quest1
Inst50Quest1_HORDE_Level = Inst50Quest1_Level
Inst50Quest1_HORDE_Attain = Inst50Quest1_Attain
Inst50Quest1_HORDE_Aim = Inst50Quest1_Aim
Inst50Quest1_HORDE_Location = Inst50Quest1_Location
Inst50Quest1_HORDE_Note = Inst50Quest1_Note
Inst50Quest1_HORDE_Prequest = Inst50Quest1_Prequest
Inst50Quest1_HORDE_Folgequest = Inst50Quest1_Folgequest
Inst50Quest1PreQuest_HORDE = Inst50Quest1PreQuest
-- No Rewards for this quest



--------------- INST51 - CoT: Old Hillsbrad ---------------

Inst51Story = "Durnholde Keep was the headquarters of the orcish internment camps in southern Lordaeron following the Horde's defeat in the Second War.\n\nAt this time, Thrall was a 19-year-old slave to human officer Aedelas Blackmoore, who intended to use Thrall as a puppet Warchief to control the orcish Horde and thus gain power over his fellow humans.\n\nHowever, Thrall knew that he was destined for more, and so he made his escape from Durnholde to find others of his kind, eventually discovering the Frostwolf Clan and his place as Warchief.\n\nThis instance will contain the entire Hillsbrad area as it appeared 10 years ago, before the Horde destroyed Durnholde and Tarren Mill fell to the undead"
Inst51Caption = "CoT: Old Hillsbrad"
Inst51QAA = "6 Quests"
Inst51QAH = "6 Quests"

--Quest 1 Alliance
Inst51Quest1 = "1. Old Hillsbrad"
Inst51Quest1_Level = "68"
Inst51Quest1_Attain = "66"
Inst51Quest1_Aim = "Andormu at the Caverns of Time has asked that you venture to Old Hillsbrad and speak with Erozion."
Inst51Quest1_Location = "Andormu (Tanaris - Caverns of Time; "..YELLOW.."58,54"..WHITE..")"
Inst51Quest1_Note = "Must have done the attunement quest that starts from the dragon at the entrance to Caverns of Time."
Inst51Quest1_Prequest = "The Caverns of Time"
Inst51Quest1_Folgequest = "Tareth's Diversion"
Inst51Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst51Quest2 = "2. Taretha's Diversion"
Inst51Quest2_Level = "68"
Inst51Quest2_Attain = "66"
Inst51Quest2_Aim = "Travel to Durnholde Keep and set 5 incendiary charges at the barrels located inside each of the internment lodges using the Pack of Incendiary Bombs given to you by Erozion. Then speak to Thrall in the basement prison of Durnholde Keep."
Inst51Quest2_Location = "Erozion (Old Hillsbrad; "..YELLOW.."Entrance"..WHITE..")"
Inst51Quest2_Note = "Thrall is at "..YELLOW.."[2]"..WHITE..". Go to Southshore to hear the story of Ashbringer and see some people with familiar names like Kel'Thuzad and Herod the Bully."
Inst51Quest2_Prequest = "Old Hillsbrad"
Inst51Quest2_Folgequest = "Escape from Durnholde"
Inst51Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst51Quest3 = "3. Escape from Durnholde"
Inst51Quest3_Level = "68"
Inst51Quest3_Attain = "66"
Inst51Quest3_Aim = "When you are ready to proceed, let Thrall know. Follow Thrall out of Durnholde Keep and help him free Taretha and fulfill his destiny. Speak with Erozion in Old Hillsbrad should you complete this task."
Inst51Quest3_Location = "Thrall (Old Hillsbrad; "..YELLOW.."[2]"..WHITE..")"
Inst51Quest3_Note = "Make sure everyone accepts the quest before anyone tells Thrall to start. Reportedly, the quest can be shared and successfully completed, though. You get 20 tries at rescuing Thrall after that you'll have to reset the instance and you can't kill the last boss without him as Thrall has to make the final blow."
Inst51Quest3_Prequest = "Taretha's Diversion"
Inst51Quest3_Folgequest = "Return to Andormu"
Inst51Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst51Quest4 = "4. Return to Andormu"
Inst51Quest4_Level = "68"
Inst51Quest4_Attain = "66"
Inst51Quest4_Aim = "Return to the child Andormu at the Caverns of Time in the Tanaris desert."
Inst51Quest4_Location = "Erozion (Old Hillsbrad; "..YELLOW.."Entrance"..WHITE..")"
Inst51Quest4_Note = "Andormu is at (Tanaris - Caverns of Time; "..YELLOW.."58,54"..WHITE.."). Completing this quest allows you to enter Black Morass."
Inst51Quest4_Prequest = "Escape from Durnholde"
Inst51Quest4_Folgequest = "None"
Inst51Quest4FQuest = "true"
--
Inst51Quest4name1 = "Tempest's Touch"
Inst51Quest4name2 = "Southshore Sneakers"
Inst51Quest4name3 = "Tarren Mill Defender's Cinch"
Inst51Quest4name4 = "Warchief's Mantle"

--Quest 5 Alliance
Inst51Quest5 = "5. Wanted: The Epoch Hunter's Head (Heroic Daily)"
Inst51Quest5_Level = "70"
Inst51Quest5_Attain = "70"
Inst51Quest5_Aim = "Wind Trader Zhareem has asked you to obtain the Epoch Hunter's Head. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst51Quest5_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst51Quest5_Note = "This daily quest can only be completed on Heroic difficulty.\n\nEpoch Hunter is at "..YELLOW.."[5]"..WHITE.."."
Inst51Quest5_Prequest = "None"
Inst51Quest5_Folgequest = "None"
--
Inst51Quest5name1 = "Badge of Justice"

--Quest 6 Alliance
Inst51Quest6 = "6. Nice Hat..."
Inst51Quest6_Level = "68"
Inst51Quest6_Attain = "66"
Inst51Quest6_Aim = "Don Carlos has inadvertently challenged you to defeat his younger self in Old Hillsbrad. Afterwards, bring Don Carlos' Hat to him in Tanaris as proof."
Inst51Quest6_Location = "Don Carlos (Tanaris; "..YELLOW.."54,29"..WHITE..")"
Inst51Quest6_Note = "Don Carlos patrols the road near "..YELLOW.."[??]"..WHITE.."."
Inst51Quest6_Prequest = "None"
Inst51Quest6_Folgequest = "None"
--
Inst51Quest6name1 = "Haliscan Brimmed Hat"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst51Quest1_HORDE = Inst51Quest1
Inst51Quest1_HORDE_Level = Inst51Quest1_Level
Inst51Quest1_HORDE_Attain = Inst51Quest1_Attain
Inst51Quest1_HORDE_Aim = Inst51Quest1_Aim
Inst51Quest1_HORDE_Location = Inst51Quest1_Location
Inst51Quest1_HORDE_Note = Inst51Quest1_Note
Inst51Quest1_HORDE_Prequest = Inst51Quest1_Prequest
Inst51Quest1_HORDE_Folgequest = Inst51Quest1_Folgequest
Inst51Quest1PreQuest_HORDE = Inst51Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst51Quest2_HORDE = Inst51Quest2
Inst51Quest2_HORDE_Level = Inst51Quest2_Level
Inst51Quest2_HORDE_Attain = Inst51Quest2_Attain
Inst51Quest2_HORDE_Aim = Inst51Quest2_Aim
Inst51Quest2_HORDE_Location = Inst51Quest2_Location
Inst51Quest2_HORDE_Note = Inst51Quest2_Note
Inst51Quest2_HORDE_Prequest = Inst51Quest2_Prequest
Inst51Quest2_HORDE_Folgequest = Inst51Quest2_Folgequest
Inst51Quest2FQuest_HORDE = Inst51Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst51Quest3_HORDE = Inst51Quest3
Inst51Quest3_HORDE_Level = Inst51Quest3_Level
Inst51Quest3_HORDE_Attain = Inst51Quest3_Attain
Inst51Quest3_HORDE_Aim = Inst51Quest3_Aim
Inst51Quest3_HORDE_Location = Inst51Quest3_Location
Inst51Quest3_HORDE_Note = Inst51Quest3_Note
Inst51Quest3_HORDE_Prequest = Inst51Quest3_Prequest
Inst51Quest3_HORDE_Folgequest = Inst51Quest3_Folgequest
Inst51Quest3FQuest_HORDE = Inst51Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst51Quest4_HORDE = Inst51Quest4
Inst51Quest4_HORDE_Level = Inst51Quest4_Level
Inst51Quest4_HORDE_Attain = Inst51Quest4_Attain
Inst51Quest4_HORDE_Aim = Inst51Quest4_Aim
Inst51Quest4_HORDE_Location = Inst51Quest4_Location
Inst51Quest4_HORDE_Note = Inst51Quest4_Note
Inst51Quest4_HORDE_Prequest = Inst51Quest4_Prequest
Inst51Quest4_HORDE_Folgequest = Inst51Quest4_Folgequest
Inst51Quest4FQuest_HORDE = Inst51Quest4FQuest
--
Inst51Quest4name1_HORDE = Inst51Quest4name1
Inst51Quest4name2_HORDE = Inst51Quest4name2
Inst51Quest4name3_HORDE = Inst51Quest4name3
Inst51Quest4name4_HORDE = Inst51Quest4name4

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst51Quest5_HORDE = Inst51Quest5
Inst51Quest5_HORDE_Level = Inst51Quest5_Level
Inst51Quest5_HORDE_Attain = Inst51Quest5_Attain
Inst51Quest5_HORDE_Aim = Inst51Quest5_Aim
Inst51Quest5_HORDE_Location = Inst51Quest5_Location
Inst51Quest5_HORDE_Note = Inst51Quest5_Note
Inst51Quest5_HORDE_Prequest = Inst51Quest5_Prequest
Inst51Quest5_HORDE_Folgequest = Inst51Quest5_Folgequest
--
Inst51Quest5name1_HORDE = Inst51Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst51Quest6_HORDE = Inst51Quest6
Inst51Quest6_HORDE_Level = Inst51Quest6_Level
Inst51Quest6_HORDE_Attain = Inst51Quest6_Attain
Inst51Quest6_HORDE_Aim = Inst51Quest6_Aim
Inst51Quest6_HORDE_Location = Inst51Quest6_Location
Inst51Quest6_HORDE_Note = Inst51Quest6_Note
Inst51Quest6_HORDE_Prequest = Inst51Quest6_Prequest
Inst51Quest6_HORDE_Folgequest = Inst51Quest6_Folgequest
--
Inst51Quest6name1_HORDE = Inst51Quest6name1



--------------- INST52 - Gruul's Lair (GL) ---------------

Inst52Story = "Gruul the Dragonkiller is, as his name implies, a famous dragon-slaying Gronn as well as the final boss of the raid dungeon Gruul's Lair in the Blade's Edge Mountains.\n\nHe drops the Tier 4 Leggings tokens.\n\nHe is the father of 7 Gronn, including Goc, Gorgrom the Dragon-Eater, Grulloc, Maggoc, and Durn the Hungerer.\n\nSummary of the fight: Rocks fall down. People die. "
Inst52Caption = "Gruul's Lair"
Inst52QAA = "1 Quest"
Inst52QAH = "1 Quest"

--Quest 1 Alliance
Inst52Quest1 = "1. The Cudgel of Kar'desh"
Inst52Quest1_Level = "70"
Inst52Quest1_Attain = "70"
Inst52Quest1_Aim = "Skar'this the Heretic in the heroic Slave Pens of Coilfang Reservoir wants you to bring him the Earthen Signet and the Blazing Signet."
Inst52Quest1_Location = "Skar'this the Heretic  (Slave Pens; "..YELLOW.."Heroic [3]"..WHITE..")"
Inst52Quest1_Note = "The Earthen Signet drops off Gruul at "..YELLOW.."[2]"..WHITE.." and the Blazing Signet drops off Nightbane in "..YELLOW.."Karazhan"..WHITE..".\n\nThis quest used to be required to enter Serpentshrine Cavern, but is no longer necessary."
Inst52Quest1_Prequest = "None"
Inst52Quest1_Folgequest = "None"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst52Quest1_HORDE = Inst52Quest1
Inst52Quest1_HORDE_Level = Inst52Quest1_Level
Inst52Quest1_HORDE_Attain = Inst52Quest1_Attain
Inst52Quest1_HORDE_Aim = Inst52Quest1_Aim
Inst52Quest1_HORDE_Location = Inst52Quest1_Location
Inst52Quest1_HORDE_Note = Inst52Quest1_Note
Inst52Quest1_HORDE_Prequest = Inst52Quest1_Prequest
Inst52Quest1_HORDE_Folgequest = Inst52Quest1_Folgequest
-- No Rewards for this quest



--------------- INST53 - Karazhan (Kara) ---------------

Inst53Story = "The decrepit tower of Karazhan once housed one of the greatest powers Azeroth has ever known: the sorcerer Medivh.\n\nSince his death, a terrible curse has pervaded the tower and the surrounding lands.\n\nThe spirits of nobles from nearby Darkshire reportedly walk its halls, suffering a fate worse than death for their curiosity.\n\nMore dangerous spirits wait within Medivh's study, for it was there that he summoned demonic entities to do his bidding.\n\nHowever, the brave and foolish are still relentlessly drawn to Karazhan, tempted by rumors of unspeakable secrets and powerful treasures.\n\nForge a group of ten stalwart heroes, and journey to the tower in Deadwind Pass - but be warned that only those who have achieved level 70 should dare enter."
Inst53Caption = "Karazhan"
Inst53QAA = "15 Quests"
Inst53QAH = "15 Quests"

--Quest 1 Alliance
Inst53Quest1 = "1. Assessing the Situation"
Inst53Quest1_Level = "70"
Inst53Quest1_Attain = "68"
Inst53Quest1_Aim = "Find Koren inside Karazhan."
Inst53Quest1_Location = "Archmage Alturus (Deadwind Pass - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest1_Note = "Koren is located inside Karazhan, just past Attumen the Huntsman at "..YELLOW.."[6]"..WHITE.."."
Inst53Quest1_Prequest = "Arcane Disturbances -> The Violet Eye"
Inst53Quest1_Folgequest = "Keanna's Log"
Inst53Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst53Quest2 = "2. Keanna's Log"
Inst53Quest2_Level = "70"
Inst53Quest2_Attain = "68"
Inst53Quest2_Aim = "Search the Guest Chambers inside Karazhan for Keanna's Log and bring it to Archmage Alturus outside Karazhan."
Inst53Quest2_Location = "Koren (Karazhan; "..YELLOW.."[6]"..WHITE..")"
Inst53Quest2_Note = "The log is in the second room in the hall leading to Maiden of Virtue at "..YELLOW.."[10]"..WHITE..", on a table. Archmage Alturus is at (Deadwind Pass - Karazhan; "..YELLOW.."47,75"..WHITE..")."
Inst53Quest2_Prequest = "Assessing the Situation"
Inst53Quest2_Folgequest = "A Demonic Presence"
Inst53Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst53Quest3 = "3. A Demonic Presence"
Inst53Quest3_Level = "70"
Inst53Quest3_Attain = "68"
Inst53Quest3_Aim = "Archmage Alturus wants you to destroy the Demonic Presence at the top of Karazhan."
Inst53Quest3_Location = "Archmage Alturus (Deadwind Pass - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest3_Note = "Prince Malchezaar is at "..YELLOW.."[26]"..WHITE.."."
Inst53Quest3_Prequest = "Keanna's Log"
Inst53Quest3_Folgequest = "The New Directive"
Inst53Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst53Quest4 = "4. The New Directive"
Inst53Quest4_Level = "70"
Inst53Quest4_Attain = "68"
Inst53Quest4_Aim = "Speak to Archmage Cedric in the Outskirts of Dalaran."
Inst53Quest4_Location = "Archmage Alturus (Deadwind Pass - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest4_Note = "Archmage Cedric is at (Alterac Mountains - Dalaran; "..YELLOW.."15,54"..WHITE..")"
Inst53Quest4_Prequest = "A Demonic Presence"
Inst53Quest4_Folgequest = "None"
Inst53Quest4FQuest = "true"
--
Inst53Quest4name1 = "Violet Badge"

--Quest 5 Alliance
Inst53Quest5 = "5. Medivh's Journal"
Inst53Quest5_Level = "70"
Inst53Quest5_Attain = "70"
Inst53Quest5_Aim = "Archmage Alturus at Deadwind Pass wants you go into Karazhan and speak to Wravien."
Inst53Quest5_Location = "Archmage Alturus (Deadwind Pass - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest5_Note = "Requires Honored with The Violet Eye. Wravien is located in the Guardians Library beyond The Curator at "..YELLOW.."[17]"..WHITE.."."
Inst53Quest5_Prequest = "None"
Inst53Quest5_Folgequest = "In Good Hands"
-- No Rewards for this quest

--Quest 6 Alliance
Inst53Quest6 = "6. In Good Hands"
Inst53Quest6_Level = "70"
Inst53Quest6_Attain = "70"
Inst53Quest6_Aim = "Speak to Gradav at the Guardian's Library in Karazhan."
Inst53Quest6_Location = "Wravien (Karazhan; "..YELLOW.."[17]"..WHITE..")"
Inst53Quest6_Note = "Gradav is in the same room as Wravien at "..YELLOW.."[18]"..WHITE.."."
Inst53Quest6_Prequest = "Medivh's Journal"
Inst53Quest6_Folgequest = "Kamsis"
Inst53Quest6FQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst53Quest7 = "7. Kamsis"
Inst53Quest7_Level = "70"
Inst53Quest7_Attain = "70"
Inst53Quest7_Aim = "Speak to Kamsis at the Guardian's Library in Karazhan."
Inst53Quest7_Location = "Gradav (Karazhan; "..YELLOW.."[18]"..WHITE..")"
Inst53Quest7_Note = "Kamsis is in the same room as Gradav at "..YELLOW.."[19]"..WHITE.."."
Inst53Quest7_Prequest = "In Good Hands"
Inst53Quest7_Folgequest = "The Shade of Aran"
Inst53Quest7FQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst53Quest8 = "8. The Shade of Aran"
Inst53Quest8_Level = "70"
Inst53Quest8_Attain = "70"
Inst53Quest8_Aim = "Obtain Medivh's Journal and return to Kamsis at the Guardian's Library in Karazhan."
Inst53Quest8_Location = "Kamsis (Karazhan; "..YELLOW.."[19]"..WHITE..")"
Inst53Quest8_Note = "Shade of Aran drops the journal at "..YELLOW.."[21]"..WHITE.."."
Inst53Quest8_Prequest = "Kamsis"
Inst53Quest8_Folgequest = "The Master's Terrace"
Inst53Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst53Quest9 = "9. The Master's Terrace"
Inst53Quest9_Level = "70"
Inst53Quest9_Attain = "70"
Inst53Quest9_Aim = "Go to the Master's Terrace in Karazhan and read Medivh's Journal. Return to Archmage Alturus with Medivh's Journal after completing this task."
Inst53Quest9_Location = "Kamsis (Karazhan; "..YELLOW.."[19]"..WHITE..")"
Inst53Quest9_Note = "Archmage Alturus is at (Deadwind Pass; "..YELLOW.."47,75"..WHITE.."). No combat involved. Enjoy the show."
Inst53Quest9_Prequest = "The Shade of Aran"
Inst53Quest9_Folgequest = "Digging Up the Past"
Inst53Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst53Quest10 = "10. Digging Up the Past"
Inst53Quest10_Level = "70"
Inst53Quest10_Attain = "70"
Inst53Quest10_Aim = "Archmage Alturus wants you to go to the mountains south of Karazhan in Deadwind Pass and retrieve a Charred Bone Fragment."
Inst53Quest10_Location = "Archmage Alturus (Deadwind Pass - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest10_Note = "The Charred Bone Fragment is located at "..YELLOW.."44,78"..WHITE.." in Deadwind Pass"
Inst53Quest10_Prequest = "The Master's Terrace"
Inst53Quest10_Folgequest = "A Colleague's Aid"
Inst53Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst53Quest11 = "11. A Colleague's Aid"
Inst53Quest11_Level = "70"
Inst53Quest11_Attain = "70"
Inst53Quest11_Aim = "Take the Charred Bone Fragment to Kalynna Lathred at Area 52 in Netherstorm."
Inst53Quest11_Location = "Archmage Alturus (Deadwind Pass - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest11_Note = "Kalynna Lathred is at (Netherstorm - Area 52; "..YELLOW.."32,63"..WHITE..")."
Inst53Quest11_Prequest = "Digging up the Past"
Inst53Quest11_Folgequest = "Kalynna's Request"
Inst53Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst53Quest12 = "12. Kalynna's Request"
Inst53Quest12_Level = "70"
Inst53Quest12_Attain = "70"
Inst53Quest12_Aim = "Kalynna Lathred wants you to retrieve the Tome of Dusk from Grand Warlock Nethekurse in the Shattered Halls of Hellfire Citadel and the Book of Forgotten Names from Darkweaver Syth in the Sethekk Halls in Auchindoun."
Inst53Quest12_Location = "Kalynna Lathred (Netherstorm - Area 52; "..YELLOW.."32,63"..WHITE..")"
Inst53Quest12_Note = "This quest requires you to run Heroic Shattered Halls and Heroic Sethekk Halls"
Inst53Quest12_Prequest = "A Colleague's Aid"
Inst53Quest12_Folgequest = "Nightbane"
Inst53Quest12FQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst53Quest13 = "13. Nightbane"
Inst53Quest13_Level = "70"
Inst53Quest13_Attain = "70"
Inst53Quest13_Aim = "Go to the Master's Terrace in Karazhan and use Kalynna's Urn to summon Nightbane. Retrieve the Faint Arcane Essence from Nightbane's corpse and bring it to Archmage Alturus"
Inst53Quest13_Location = "Kalynna Lathred (Netherstorm - Area 52; "..YELLOW.."32,63"..WHITE..")"
Inst53Quest13_Note = "Nightbane is summoned at "..YELLOW.."[15]"..WHITE..". Return to Archmage Alturus at (Deadwind Pass - Karazhan; "..YELLOW.."47,75"..WHITE..") to turn in."
Inst53Quest13_Prequest = "Kalynna's Request"
Inst53Quest13_Folgequest = "None"
Inst53Quest13FQuest = "true"
--
Inst53Quest13name1 = "Pulsing Amethyst"
Inst53Quest13name2 = "Soothing Amethyst"
Inst53Quest13name3 = "Infused Amethyst"

--Quest 14 Alliance
Inst53Quest14 = "14. The Cudgel of Kar'desh"
Inst53Quest14_Level = "70"
Inst53Quest14_Attain = "70"
Inst53Quest14_Aim = "Skar'this the Heretic in the heroic Slave Pens of Coilfang Reservoir wants you to bring him the Earthen Signet and the Blazing Signet."
Inst53Quest14_Location = "Skar'this the Heretic  (Slave Pens; "..YELLOW.."Heroic [3]"..WHITE..")"
Inst53Quest14_Note = "The Earthen Signet drops off Gruul in "..YELLOW.."Gruul's Lair"..WHITE.." and the Blazing Signet drops off Nightbane at "..YELLOW.."[15]"..WHITE..".\n\nThis quest used to be required to enter Serpentshrine Cavern, but is no longer necessary."
Inst53Quest14_Prequest = "None"
Inst53Quest14_Folgequest = "None"
-- No Rewards for this quest

--Quest 15 Alliance
Inst53Quest15 = "15. Chamber of Secrets"
Inst53Quest15_Level = "70"
Inst53Quest15_Attain = "70"
Inst53Quest15_Aim = "The Argent Dawn Emissary wants you to search the chamber of Tenris Mirkblood within the Servant's Quarters of Karazhan."
Inst53Quest15_Location = "Argent Dawn Emissary  (Capital Cities and Eastern Plaguelands - Light's Hope Chapel)"
Inst53Quest15_Note = "This quest was only available during the Scourge Invasion Event in Late October and Early November of 2008.\n\nTo complete the quest, use the scrolls behind Prince Tenris Mirkblood, who is in the Servants Chambers above Attumen the Huntsmen ("..YELLOW.."[5]"..WHITE.."). As with opening a chest, if another player is using the scrolls your quest might not complete. Try again until it does."
Inst53Quest15_Prequest = "None"
Inst53Quest15_Folgequest = "None"
--
Inst53Quest15name1 = "Monster Slayer's Kit"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst53Quest1_HORDE = Inst53Quest1
Inst53Quest1_HORDE_Level = Inst53Quest1_Level
Inst53Quest1_HORDE_Attain = Inst53Quest1_Attain
Inst53Quest1_HORDE_Aim = Inst53Quest1_Aim
Inst53Quest1_HORDE_Location = Inst53Quest1_Location
Inst53Quest1_HORDE_Note = Inst53Quest1_Note
Inst53Quest1_HORDE_Prequest = Inst53Quest1_Prequest
Inst53Quest1_HORDE_Folgequest = Inst53Quest1_Folgequest
Inst53Quest1PreQuest_HORDE = Inst53Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst53Quest2_HORDE = Inst53Quest2
Inst53Quest2_HORDE_Level = Inst53Quest2_Level
Inst53Quest2_HORDE_Attain = Inst53Quest2_Attain
Inst53Quest2_HORDE_Aim = Inst53Quest2_Aim
Inst53Quest2_HORDE_Location = Inst53Quest2_Location
Inst53Quest2_HORDE_Note = Inst53Quest2_Note
Inst53Quest2_HORDE_Prequest = Inst53Quest2_Prequest
Inst53Quest2_HORDE_Folgequest = Inst53Quest2_Folgequest
Inst53Quest2FQuest_HORDE = Inst53Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst53Quest3_HORDE = Inst53Quest3
Inst53Quest3_HORDE_Level = Inst53Quest3_Level
Inst53Quest3_HORDE_Attain = Inst53Quest3_Attain
Inst53Quest3_HORDE_Aim = Inst53Quest3_Aim
Inst53Quest3_HORDE_Location = Inst53Quest3_Location
Inst53Quest3_HORDE_Note = Inst53Quest3_Note
Inst53Quest3_HORDE_Prequest = Inst53Quest3_Prequest
Inst53Quest3_HORDE_Folgequest = Inst53Quest3_Folgequest
Inst53Quest3FQuest_HORDE = Inst53Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst53Quest4_HORDE = Inst53Quest4
Inst53Quest4_HORDE_Level = Inst53Quest4_Level
Inst53Quest4_HORDE_Attain = Inst53Quest4_Attain
Inst53Quest4_HORDE_Aim = Inst53Quest4_Aim
Inst53Quest4_HORDE_Location = Inst53Quest4_Location
Inst53Quest4_HORDE_Note = Inst53Quest4_Note
Inst53Quest4_HORDE_Prequest = Inst53Quest4_Prequest
Inst53Quest4_HORDE_Folgequest = Inst53Quest4_Folgequest
Inst53Quest4FQuest_HORDE = Inst53Quest4FQuest
--
Inst53Quest4name1_HORDE = Inst53Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst53Quest5_HORDE = Inst53Quest5
Inst53Quest5_HORDE_Level = Inst53Quest5_Level
Inst53Quest5_HORDE_Attain = Inst53Quest5_Attain
Inst53Quest5_HORDE_Aim = Inst53Quest5_Aim
Inst53Quest5_HORDE_Location = Inst53Quest5_Location
Inst53Quest5_HORDE_Note = Inst53Quest5_Note
Inst53Quest5_HORDE_Prequest = Inst53Quest5_Prequest
Inst53Quest5_HORDE_Folgequest = Inst53Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst53Quest6_HORDE = Inst53Quest6
Inst53Quest6_HORDE_Level = Inst53Quest6_Level
Inst53Quest6_HORDE_Attain = Inst53Quest6_Attain
Inst53Quest6_HORDE_Aim = Inst53Quest6_Aim
Inst53Quest6_HORDE_Location = Inst53Quest6_Location
Inst53Quest6_HORDE_Note = Inst53Quest6_Note
Inst53Quest6_HORDE_Prequest = Inst53Quest6_Prequest
Inst53Quest6_HORDE_Folgequest = Inst53Quest6_Folgequest
Inst53Quest6FQuest_HORDE = Inst53Quest6FQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst53Quest7_HORDE = Inst53Quest7
Inst53Quest7_HORDE_Level = Inst53Quest7_Level
Inst53Quest7_HORDE_Attain = Inst53Quest7_Attain
Inst53Quest7_HORDE_Aim = Inst53Quest7_Aim
Inst53Quest7_HORDE_Location = Inst53Quest7_Location
Inst53Quest7_HORDE_Note = Inst53Quest7_Note
Inst53Quest7_HORDE_Prequest = Inst53Quest7_Prequest
Inst53Quest7_HORDE_Folgequest = Inst53Quest7_Folgequest
Inst53Quest7FQuest_HORDE = Inst53Quest7FQuest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst53Quest8_HORDE = Inst53Quest8
Inst53Quest8_HORDE_Level = Inst53Quest8_Level
Inst53Quest8_HORDE_Attain = Inst53Quest8_Attain
Inst53Quest8_HORDE_Aim = Inst53Quest8_Aim
Inst53Quest8_HORDE_Location = Inst53Quest8_Location
Inst53Quest8_HORDE_Note = Inst53Quest8_Note
Inst53Quest8_HORDE_Prequest = Inst53Quest8_Prequest
Inst53Quest8_HORDE_Folgequest = Inst53Quest8_Folgequest
Inst53Quest8FQuest_HORDE = Inst53Quest8FQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst53Quest9_HORDE = Inst53Quest9
Inst53Quest9_HORDE_Level = Inst53Quest9_Level
Inst53Quest9_HORDE_Attain = Inst53Quest9_Attain
Inst53Quest9_HORDE_Aim = Inst53Quest9_Aim
Inst53Quest9_HORDE_Location = Inst53Quest9_Location
Inst53Quest9_HORDE_Note = Inst53Quest9_Note
Inst53Quest9_HORDE_Prequest = Inst53Quest9_Prequest
Inst53Quest9_HORDE_Folgequest = Inst53Quest9_Folgequest
Inst53Quest9FQuest_HORDE = Inst53Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst53Quest10_HORDE = Inst53Quest10
Inst53Quest10_HORDE_Level = Inst53Quest10_Level
Inst53Quest10_HORDE_Attain = Inst53Quest10_Attain
Inst53Quest10_HORDE_Aim = Inst53Quest10_Aim
Inst53Quest10_HORDE_Location = Inst53Quest10_Location
Inst53Quest10_HORDE_Note = Inst53Quest10_Note
Inst53Quest10_HORDE_Prequest = Inst53Quest10_Prequest
Inst53Quest10_HORDE_Folgequest = Inst53Quest10_Folgequest
Inst53Quest10FQuest_HORDE = Inst53Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst53Quest11_HORDE = Inst53Quest11
Inst53Quest11_HORDE_Level = Inst53Quest11_Level
Inst53Quest11_HORDE_Attain = Inst53Quest11_Attain
Inst53Quest11_HORDE_Aim = Inst53Quest11_Aim
Inst53Quest11_HORDE_Location = Inst53Quest11_Location
Inst53Quest11_HORDE_Note = Inst53Quest11_Note
Inst53Quest11_HORDE_Prequest = Inst53Quest11_Prequest
Inst53Quest11_HORDE_Folgequest = Inst53Quest11_Folgequest
Inst53Quest11FQuest_HORDE = Inst53Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst53Quest12_HORDE = Inst53Quest12
Inst53Quest12_HORDE_Level = Inst53Quest12_Level
Inst53Quest12_HORDE_Attain = Inst53Quest12_Attain
Inst53Quest12_HORDE_Aim = Inst53Quest12_Aim
Inst53Quest12_HORDE_Location = Inst53Quest12_Location
Inst53Quest12_HORDE_Note = Inst53Quest12_Note
Inst53Quest12_HORDE_Prequest = Inst53Quest12_Prequest
Inst53Quest12_HORDE_Folgequest = Inst53Quest12_Folgequest
Inst53Quest12FQuest_HORDE = Inst53Quest12FQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst53Quest13_HORDE = Inst53Quest13
Inst53Quest13_HORDE_Level = Inst53Quest13_Level
Inst53Quest13_HORDE_Attain = Inst53Quest13_Attain
Inst53Quest13_HORDE_Aim = Inst53Quest13_Aim
Inst53Quest13_HORDE_Location = Inst53Quest13_Location
Inst53Quest13_HORDE_Note = Inst53Quest13_Note
Inst53Quest13_HORDE_Prequest = Inst53Quest13_Prequest
Inst53Quest13_HORDE_Folgequest = Inst53Quest13_Folgequest
Inst53Quest13FQuest_HORDE = Inst53Quest13FQuest
--
Inst53Quest13name1_HORDE = Inst53Quest13name1
Inst53Quest13name2_HORDE = Inst53Quest13name2
Inst53Quest13name3_HORDE = Inst53Quest13name3

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst53Quest14_HORDE = Inst53Quest14
Inst53Quest14_HORDE_Level = Inst53Quest14_Level
Inst53Quest14_HORDE_Attain = Inst53Quest14_Attain
Inst53Quest14_HORDE_Aim = Inst53Quest14_Aim
Inst53Quest14_HORDE_Location = Inst53Quest14_Location
Inst53Quest14_HORDE_Note = Inst53Quest14_Note
Inst53Quest14_HORDE_Prequest = Inst53Quest14_Prequest
Inst53Quest14_HORDE_Folgequest = Inst53Quest14_Folgequest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst53Quest15_HORDE = Inst53Quest15
Inst53Quest15_HORDE_Level = Inst53Quest15_Level
Inst53Quest15_HORDE_Attain = Inst53Quest15_Attain
Inst53Quest15_HORDE_Aim = Inst53Quest15_Aim
Inst53Quest15_HORDE_Location = Inst53Quest15_Location
Inst53Quest15_HORDE_Note = Inst53Quest15_Note
Inst53Quest15_HORDE_Prequest = Inst53Quest15_Prequest
Inst53Quest15_HORDE_Folgequest = Inst53Quest15_Folgequest
--
Inst53Quest15name1_HORDE = Inst53Quest15name1



--------------- INST54 - TK: Arcatraz (Arc) ---------------

Inst54Story = "Tempest Keep is a former naaru fortress in the Netherstorm in Outland.\n\nThis crystaline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren.\n\nThe structure is divided into three wings - satellites of the gigantic structure - with the fourth wing, the Exodar, now in the world of Azeroth as the Draenei capital.\n\nThe Arcatraz is the third wing of the Tempest Keep instance.\n\nThe Arcatraz is accessible either through a quest chain for the key that requires you to complete both Mechanar and Botanica, that begins with a long quest chain called (A Heap of Ethereals) from Nether-Stalker Khay'ji in Area 52, or be picked by a lvl 70 Rogue (with 350 LP).\n\nOnly one member of your group must have the key. The entrance portal is high above the other Tempest Keep instances.\n\nOne full run yields about 1750 reputation with the Sha'tar."
Inst54Caption = "TK: The Arcatraz"
Inst54QAA = "6 Quests"
Inst54QAH = "6 Quests"

--Quest 1 Alliance
Inst54Quest1 = "1. Harbinger of Doom"
Inst54Quest1_Level = "70"
Inst54Quest1_Attain = "67"
Inst54Quest1_Aim = "You have been tasked to go to Tempest Keep's Arcatraz satellite and slay Harbinger Skyriss. Return to A'dal at the Terace of Light in Shattrath City after you have done so."
Inst54Quest1_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest1_Note = "There is a chain quest that starts in Netherstorm from Nether-Stalker Khay'ji located at (Netherstorm - Area 52; "..YELLOW.."32,64"..WHITE..")."
Inst54Quest1_Prequest = "Warp-Raider Nesaad -> How to Break Into the Arcatraz"
Inst54Quest1_Folgequest = "None"
Inst54Quest1PreQuest = "true"
--
Inst54Quest1name1 = "Potent Sha'tari Pendant"
Inst54Quest1name2 = "A'dal's Recovery Necklace"
Inst54Quest1name3 = "Shattrath Choker of Power"

--Quest 2 Alliance
Inst54Quest2 = "2. Seer Udalo"
Inst54Quest2_Level = "70"
Inst54Quest2_Attain = "68"
Inst54Quest2_Aim = "Find Seer Udalo inside the Arcatraz in Tempest Keep."
Inst54Quest2_Location = "Akama (Shadowmoon Valley - Warden's Cage; "..YELLOW.."58,48"..WHITE..")"
Inst54Quest2_Note = "Seer Udalo is at "..YELLOW.."[5]"..WHITE..", just before the room with the final boss.\n\nThis is part of the Black Temple attunement questline that starts from Anchorite Ceyla (Shadowmoon Valley - Altar of Sha'tar; "..YELLOW.."62,38"..WHITE..") for Aldor and Arcanist Thelis (Shadowmoon Valley - Sanctum of the Stars; "..YELLOW.."56,59"..WHITE..") for Scryers."
Inst54Quest2_Prequest = "Tablets of Baa'ri -> Akama"
Inst54Quest2_Folgequest = "A Mysterious Portent"
Inst54Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst54Quest3 = "3. Trial of the Naaru: Tenacity (Heroic)"
Inst54Quest3_Level = "70"
Inst54Quest3_Attain = "70"
Inst54Quest3_Aim = "A'dal in Shattrath City wants you to rescue Millhouse Manastorm from the Arcatraz of Tempest Keep."
Inst54Quest3_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest3_Note = "This quest must be completed in Heroic dungeon difficulty. Millhouse Manastorm is in the room with Warden Mellichar at "..YELLOW.."[6]"..WHITE..".\n\nThis quest used to be required to enter Tempest Keep: The Eye, but is no longer necessary."
Inst54Quest3_Prequest = "None"
Inst54Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst54Quest4 = "4. The Second and Third Fragments"
Inst54Quest4_Level = "70"
Inst54Quest4_Attain = "68"
Inst54Quest4_Aim = "Obtain the Second Key Fragment from an Arcane Container inside Coilfang Reservoir and the Third Key Fragment from an Arcane Container inside Tempest Keep. Return to Khadgar in Shattrath City after you've completed this task."
Inst54Quest4_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest4_Note = "Part of the Karazhan attunement line. The Arcane Container is at "..YELLOW.."[2]"..WHITE..". Opening it will spawn an elemental that must be killed to get the fragment. The Second Key Fragment is in The Steamvault."
Inst54Quest4_Prequest = "Entry Into Karazhan ("..YELLOW.."Auch: Shadow Labyrinth"..WHITE..")"
Inst54Quest4_Folgequest = "The Master's Touch ("..YELLOW.."CoT: Black Morass"..WHITE..")"
Inst54Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst54Quest5 = "5. Wanted: The Scroll of Skyriss (Heroic Daily)"
Inst54Quest5_Level = "70"
Inst54Quest5_Attain = "70"
Inst54Quest5_Aim = "Wind Trader Zhareem has asked you to obtain The Scroll of Skyriss. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst54Quest5_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst54Quest5_Note = "This daily quest can only be completed on Heroic difficulty.\n\nHarbinger Skyriss is at "..YELLOW.."[6]"..WHITE.."."
Inst54Quest5_Prequest = "None"
Inst54Quest5_Folgequest = "None"
--
Inst54Quest5name1 = "Badge of Justice"

--Quest 6 Alliance
Inst54Quest6 = "6. Wanted: Arcatraz Sentinels (Daily)"
Inst54Quest6_Level = "70"
Inst54Quest6_Attain = "70"
Inst54Quest6_Aim = "Nether-Stalker Mah'duun wants you to dismantle 5 Arcatraz Sentinels. Return to him in Shattrath's Lower City once that has been accomplished in order to collect the bounty."
Inst54Quest6_Location = "Nether-Stalker Mah'duun (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst54Quest6_Note = "This is a daily quest."
Inst54Quest6_Prequest = "None"
Inst54Quest6_Folgequest = "None"
--
Inst54Quest6name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst54Quest1_HORDE = Inst54Quest1
Inst54Quest1_HORDE_Level = Inst54Quest1_Level
Inst54Quest1_HORDE_Attain = Inst54Quest1_Attain
Inst54Quest1_HORDE_Aim = Inst54Quest1_Aim
Inst54Quest1_HORDE_Location = Inst54Quest1_Location
Inst54Quest1_HORDE_Note = Inst54Quest1_Note
Inst54Quest1_HORDE_Prequest = Inst54Quest1_Prequest
Inst54Quest1_HORDE_Folgequest = Inst54Quest1_Folgequest
Inst54Quest1PreQuest_HORDE = Inst54Quest1PreQuest
--
Inst54Quest1name1_HORDE = Inst54Quest1name1
Inst54Quest1name2_HORDE = Inst54Quest1name2
Inst54Quest1name3_HORDE = Inst54Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst54Quest2_HORDE = Inst54Quest2
Inst54Quest2_HORDE_Level = Inst54Quest2_Level
Inst54Quest2_HORDE_Attain = Inst54Quest2_Attain
Inst54Quest2_HORDE_Aim = Inst54Quest2_Aim
Inst54Quest2_HORDE_Location = Inst54Quest2_Location
Inst54Quest2_HORDE_Note = Inst54Quest2_Note
Inst54Quest2_HORDE_Prequest = Inst54Quest2_Prequest
Inst54Quest2_HORDE_Folgequest = Inst54Quest2_Folgequest
Inst54Quest2PreQuest_HORDE = Inst54Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst54Quest3_HORDE = Inst54Quest3
Inst54Quest3_HORDE_Level = Inst54Quest3_Level
Inst54Quest3_HORDE_Attain = Inst54Quest3_Attain
Inst54Quest3_HORDE_Aim = Inst54Quest3_Aim
Inst54Quest3_HORDE_Location = Inst54Quest3_Location
Inst54Quest3_HORDE_Note = Inst54Quest3_Note
Inst54Quest3_HORDE_Prequest = Inst54Quest3_Prequest
Inst54Quest3_HORDE_Folgequest = Inst54Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst54Quest4_HORDE = Inst54Quest4
Inst54Quest4_HORDE_Level = Inst54Quest4_Level
Inst54Quest4_HORDE_Attain = Inst54Quest4_Attain
Inst54Quest4_HORDE_Aim = Inst54Quest4_Aim
Inst54Quest4_HORDE_Location = Inst54Quest4_Location
Inst54Quest4_HORDE_Note = Inst54Quest4_Note
Inst54Quest4_HORDE_Prequest = Inst54Quest4_Prequest
Inst54Quest4_HORDE_Folgequest = Inst54Quest4_Folgequest
Inst54Quest4PreQuest_HORDE = Inst54Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst54Quest5_HORDE = Inst54Quest5
Inst54Quest5_HORDE_Level = Inst54Quest5_Level
Inst54Quest5_HORDE_Attain = Inst54Quest5_Attain
Inst54Quest5_HORDE_Aim = Inst54Quest5_Aim
Inst54Quest5_HORDE_Location = Inst54Quest5_Location
Inst54Quest5_HORDE_Note = Inst54Quest5_Note
Inst54Quest5_HORDE_Prequest = Inst54Quest5_Prequest
Inst54Quest5_HORDE_Folgequest = Inst54Quest5_Folgequest
--
Inst54Quest5name1_HORDE = Inst54Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst54Quest6_HORDE = Inst54Quest6
Inst54Quest6_HORDE_Level = Inst54Quest6_Level
Inst54Quest6_HORDE_Attain = Inst54Quest6_Attain
Inst54Quest6_HORDE_Aim = Inst54Quest6_Aim
Inst54Quest6_HORDE_Location = Inst54Quest6_Location
Inst54Quest6_HORDE_Note = Inst54Quest6_Note
Inst54Quest6_HORDE_Prequest = Inst54Quest6_Prequest
Inst54Quest6_HORDE_Folgequest = Inst54Quest6_Folgequest
--
Inst54Quest6name1_HORDE = Inst54Quest6name1



--------------- INST55 - TK: Botanica (Bot) ---------------

Inst55Story = "Tempest Keep is a former naaru fortress in the Netherstorm in Outland.\n\nThis crystaline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren.\n\nThe structure is divided into three wings - satellites of the gigantic structure - with the fourth wing, the Exodar, now in the world of Azeroth as the Draenei capital.\n\nThe Botanica is the second wing of the Tempest Keep instance located directly north of the main palace (The blue crystal building).\n\nThis is also the place of Kael'thas commander: Commander Sarannis."
Inst55Caption = "TK: The Botanica"
Inst55QAA = "5 Quests"
Inst55QAH = "5 Quests"

--Quest 1 Alliance
Inst55Quest1 = "1. How to Break Into the Arcatraz"
Inst55Quest1_Level = "70"
Inst55Quest1_Attain = "67"
Inst55Quest1_Aim = "A'dal has tasked you with the recovery of the Top and Bottom Shards of the Arcatraz Key. Return them to him, and he will fashion them into the Key to the Arcatraz for you."
Inst55Quest1_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst55Quest1_Note = "The Bottom Piece drops off Warp Splinter located at "..YELLOW.."[5]"..WHITE..". The Top piece drops in Mechanar."
Inst55Quest1_Prequest = "Warp-Raider Nesaad -> Special Delivery to Shattrath City"
Inst55Quest1_Folgequest = "Harbinger of Doom ("..YELLOW.."TK: Arcatraz"..WHITE..")"
Inst55Quest1PreQuest = "true"
--
Inst55Quest1name1 = "Sha'tari Anchorite's Cloak"
Inst55Quest1name2 = "A'dal's Gift"
Inst55Quest1name3 = "Naaru Belt of Precision"
Inst55Quest1name4 = "Shattrath's Champion Belt"
Inst55Quest1name5 = "Sha'tari Vindicator's Waistguard"
Inst55Quest1name6 = "Key to the Arcatraz"

--Quest 2 Alliance
Inst55Quest2 = "2. Capturing the Keystone"
Inst55Quest2_Level = "70"
Inst55Quest2_Attain = "67"
Inst55Quest2_Aim = "Venture into Tempest Keep's Botanica and retrieve the Keystone from Commander Sarannis. Bring it to Archmage Vargoth at the Violet Tower."
Inst55Quest2_Location = "Archmage Vargoth (Netherstorm - Kirin'Var Village; "..YELLOW.."58,86"..WHITE..")"
Inst55Quest2_Note = "Commander Sarannis is at "..YELLOW.."[1]"..WHITE..". The keystone will drop on Normal and Heroic."
Inst55Quest2_Prequest = "Finding the Keymaster"
Inst55Quest2_Folgequest = "None"
Inst55Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst55Quest3 = "3. Master of Potions (Alchemy)"
Inst55Quest3_Level = "70"
Inst55Quest3_Attain = "68"
Inst55Quest3_Aim = "Lauranna Thar'well wants you to go to the Botanica in Tempest Keep and retrieve the Botanist's Field Guide from High Botanist Freywinn. In addition she also wants you to bring her 5 Super Healing Potions, 5 Super Mana Potions and 5 Major Dreamless Sleep Potions."
Inst55Quest3_Location = "Lauranna Thar'well (Zangarmarsh - Cenarion Refuge; "..YELLOW.."80,64"..WHITE..")"
Inst55Quest3_Note = "Alchemist quest. High Botanist Freywinn is at "..YELLOW.."[2]"..WHITE.."."
Inst55Quest3_Prequest = "Master of Potions"
Inst55Quest3_Folgequest = "None"
Inst55Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst55Quest4 = "4. Wanted: A Warp Splinter Clipping (Heroic Daily)"
Inst55Quest4_Level = "70"
Inst55Quest4_Attain = "70"
Inst55Quest4_Aim = "Wind Trader Zhareem has asked you to obtain a Warp Splinter Clipping. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst55Quest4_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst55Quest4_Note = "This daily quest can only be completed on Heroic difficulty.\n\nWarp Splinter is at "..YELLOW.."[5]"..WHITE.."."
Inst55Quest4_Prequest = "None"
Inst55Quest4_Folgequest = "None"
--
Inst55Quest4name1 = "Badge of Justice"

--Quest 5 Alliance
Inst55Quest5 = "5. Wanted: Sunseeker Channelers (Daily)"
Inst55Quest5_Level = "70"
Inst55Quest5_Attain = "70"
Inst55Quest5_Aim = "Nether-Stalker Mah'duun wants you to kill 6 Sunseeker Channelers. Return to him in Shattrath's Lower City once they all lie dead in order to collect the bounty."
Inst55Quest5_Location = "Nether-Stalker Mah'duun (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst55Quest5_Note = "This is a daily quest."
Inst55Quest5_Prequest = "None"
Inst55Quest5_Folgequest = "None"
--
Inst55Quest5name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst55Quest1_HORDE = Inst55Quest1
Inst55Quest1_HORDE_Level = Inst55Quest1_Level
Inst55Quest1_HORDE_Attain = Inst55Quest1_Attain
Inst55Quest1_HORDE_Aim = Inst55Quest1_Aim
Inst55Quest1_HORDE_Location = Inst55Quest1_Location
Inst55Quest1_HORDE_Note = Inst55Quest1_Note
Inst55Quest1_HORDE_Prequest = Inst55Quest1_Prequest
Inst55Quest1_HORDE_Folgequest = Inst55Quest1_Folgequest
Inst55Quest1PreQuest_HORDE = Inst55Quest1PreQuest
--
Inst55Quest1name1_HORDE = Inst55Quest1name1
Inst55Quest1name2_HORDE = Inst55Quest1name2
Inst55Quest1name3_HORDE = Inst55Quest1name3
Inst55Quest1name4_HORDE = Inst55Quest1name4
Inst55Quest1name5_HORDE = Inst55Quest1name5
Inst55Quest1name6_HORDE = Inst55Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst55Quest2_HORDE = Inst55Quest2
Inst55Quest2_HORDE_Level = Inst55Quest2_Level
Inst55Quest2_HORDE_Attain = Inst55Quest2_Attain
Inst55Quest2_HORDE_Aim = Inst55Quest2_Aim
Inst55Quest2_HORDE_Location = Inst55Quest2_Location
Inst55Quest2_HORDE_Note = Inst55Quest2_Note
Inst55Quest2_HORDE_Prequest = Inst55Quest2_Prequest
Inst55Quest2_HORDE_Folgequest = Inst55Quest2_Folgequest
Inst55Quest2PreQuest_HORDE = Inst55Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst55Quest3_HORDE = Inst55Quest3
Inst55Quest3_HORDE_Level = Inst55Quest3_Level
Inst55Quest3_HORDE_Attain = Inst55Quest3_Attain
Inst55Quest3_HORDE_Aim = Inst55Quest3_Aim
Inst55Quest3_HORDE_Location = Inst55Quest3_Location
Inst55Quest3_HORDE_Note = Inst55Quest3_Note
Inst55Quest3_HORDE_Prequest = Inst55Quest3_Prequest
Inst55Quest3_HORDE_Folgequest = Inst55Quest3_Folgequest
Inst55Quest3PreQuest_HORDE = Inst55Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst55Quest4_HORDE = Inst55Quest4
Inst55Quest4_HORDE_Level = Inst55Quest4_Level
Inst55Quest4_HORDE_Attain = Inst55Quest4_Attain
Inst55Quest4_HORDE_Aim = Inst55Quest4_Aim
Inst55Quest4_HORDE_Location = Inst55Quest4_Location
Inst55Quest4_HORDE_Note = Inst55Quest4_Note
Inst55Quest4_HORDE_Prequest = Inst55Quest4_Prequest
Inst55Quest4_HORDE_Folgequest = Inst55Quest4_Folgequest
--
Inst55Quest4name1_HORDE = Inst55Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst55Quest5_HORDE = Inst55Quest5
Inst55Quest5_HORDE_Level = Inst55Quest5_Level
Inst55Quest5_HORDE_Attain = Inst55Quest5_Attain
Inst55Quest5_HORDE_Aim = Inst55Quest5_Aim
Inst55Quest5_HORDE_Location = Inst55Quest5_Location
Inst55Quest5_HORDE_Note = Inst55Quest5_Note
Inst55Quest5_HORDE_Prequest = Inst55Quest5_Prequest
Inst55Quest5_HORDE_Folgequest = Inst55Quest5_Folgequest
--
Inst55Quest5name1_HORDE = Inst55Quest5name1



--------------- INST56 - TK: Mechanar (Mech) ---------------

Inst56Story = "Tempest Keep is a former naaru fortress in the Netherstorm in Outland.\n\nThis crystaline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren.\n\nThe structure is divided into three wings - satellites of the gigantic structure - with the fourth wing, the Exodar, now in the world of Azeroth as the Draenei capital.\n\nThe Mechanar is the first wing of the Tempest Keep instance.\n\nThis is the purple crystal building south of the main palace.\n\nRecommended level is 70. One full run yields about 1500 reputation with the Sha'tar."
Inst56Caption = "TK: The Mechanar"
Inst56QAA = "4 Quests"
Inst56QAH = "4 Quests"

--Quest 1 Alliance
Inst56Quest1 = "1. How to Break Into the Arcatraz"
Inst56Quest1_Level = "70"
Inst56Quest1_Attain = "67"
Inst56Quest1_Aim = "A'dal has tasked you with the recovery of the Top and Bottom Shards of the Arcatraz Key. Return them to him, and he will fashion them into the Key to the Arcatraz for you."
Inst56Quest1_Location = "A'dal (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")"
Inst56Quest1_Note = "The Top Piece drops off Pathaleon the Calculator located at "..YELLOW.."[5]"..WHITE..". The Bottom piece drops in Botanica."
Inst56Quest1_Prequest = "Warp-Raider Nesaad -> Special Delivery to Shattrath City"
Inst56Quest1_Folgequest = "Harbinger of Doom ("..YELLOW.."TK: Arcatraz"..WHITE..")"
Inst56Quest1PreQuest = "true"
--
Inst56Quest1name1 = "Sha'tari Anchorite's Cloak"
Inst56Quest1name2 = "A'dal's Gift"
Inst56Quest1name3 = "Naaru Belt of Precision"
Inst56Quest1name4 = "Shattrath's Champion Belt"
Inst56Quest1name5 = "Sha'tari Vindicator's Waistguard"
Inst56Quest1name6 = "Key to the Arcatraz"

--Quest 2 Alliance
Inst56Quest2 = "2. Fresh from the Mechanar"
Inst56Quest2_Level = "69"
Inst56Quest2_Attain = "67"
Inst56Quest2_Aim = "David Wayne at Wayne's Retreat wants you to bring him an Overcharged Manacell."
Inst56Quest2_Location = "David Wayne (Terokkar Forest - Wayne's Refuge; "..YELLOW.."78,39"..WHITE..")."
Inst56Quest2_Note = "The cell is before Mechano-Lord Capacitus at "..YELLOW.."[3]"..WHITE.." in a box near the wall.\n\nCompleting this quest along with The Lexicon Demonica ("..YELLOW.."Auch: Shadow Labyrinth"..WHITE..") will open up two new quests from David Wayne.\n\nThis quest works in both Normal and Heroic mode."
Inst56Quest2_Prequest = "Additional Materials"
Inst56Quest2_Folgequest = "None"
Inst56Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst56Quest3 = "3. Wanted: Pathaleon's Projector (Heroic Daily)"
Inst56Quest3_Level = "70"
Inst56Quest3_Attain = "70"
Inst56Quest3_Aim = "Wind Trader Zhareem has asked you to acquire Pathaleon's Projector. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst56Quest3_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst56Quest3_Note = "This daily quest can only be completed on Heroic difficulty.\n\nPathaleon the Calculator is at "..YELLOW.."[5]"..WHITE.."."
Inst56Quest3_Prequest = "None"
Inst56Quest3_Folgequest = "None"
--
Inst56Quest3name1 = "Badge of Justice"

--Quest 4 Alliance
Inst56Quest4 = "4. Wanted: Tempest-Forge Destroyers (Daily)"
Inst56Quest4_Level = "70"
Inst56Quest4_Attain = "70"
Inst56Quest4_Aim = "Nether-Stalker Mah'duun wants you to destroy 5 Tempest-Forge Destroyers. Return to him in Shattrath's Lower City once they all lie dead in order to collect the bounty."
Inst56Quest4_Location = "Nether-Stalker Mah'duun (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst56Quest4_Note = "This is a daily quest."
Inst56Quest4_Prequest = "None"
Inst56Quest4_Folgequest = "None"
--
Inst56Quest4name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst56Quest1_HORDE = Inst56Quest1
Inst56Quest1_HORDE_Level = Inst56Quest1_Level
Inst56Quest1_HORDE_Attain = Inst56Quest1_Attain
Inst56Quest1_HORDE_Aim = Inst56Quest1_Aim
Inst56Quest1_HORDE_Location = Inst56Quest1_Location
Inst56Quest1_HORDE_Note = Inst56Quest1_Note
Inst56Quest1_HORDE_Prequest = Inst56Quest1_Prequest
Inst56Quest1_HORDE_Folgequest = Inst56Quest1_Folgequest
Inst56Quest1PreQuest_HORDE = Inst56Quest1PreQuest
--
Inst56Quest1name1_HORDE = Inst56Quest1name1
Inst56Quest1name2_HORDE = Inst56Quest1name2
Inst56Quest1name3_HORDE = Inst56Quest1name3
Inst56Quest1name4_HORDE = Inst56Quest1name4
Inst56Quest1name5_HORDE = Inst56Quest1name5
Inst56Quest1name6_HORDE = Inst56Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst56Quest2_HORDE = Inst56Quest2
Inst56Quest2_HORDE_Level = Inst56Quest2_Level
Inst56Quest2_HORDE_Attain = Inst56Quest2_Attain
Inst56Quest2_HORDE_Aim = Inst56Quest2_Aim
Inst56Quest2_HORDE_Location = Inst56Quest2_Location
Inst56Quest2_HORDE_Note = Inst56Quest2_Note
Inst56Quest2_HORDE_Prequest = Inst56Quest2_Prequest
Inst56Quest2_HORDE_Folgequest = Inst56Quest2_Folgequest
Inst56Quest2PreQuest_HORDE = Inst56Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst56Quest3_HORDE = Inst56Quest3
Inst56Quest3_HORDE_Level = Inst56Quest3_Level
Inst56Quest3_HORDE_Attain = Inst56Quest3_Attain
Inst56Quest3_HORDE_Aim = Inst56Quest3_Aim
Inst56Quest3_HORDE_Location = Inst56Quest3_Location
Inst56Quest3_HORDE_Note = Inst56Quest3_Note
Inst56Quest3_HORDE_Prequest = Inst56Quest3_Prequest
Inst56Quest3_HORDE_Folgequest = Inst56Quest3_Folgequest
--
Inst56Quest3name1_HORDE = Inst56Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst56Quest4_HORDE = Inst56Quest4
Inst56Quest4_HORDE_Level = Inst56Quest4_Level
Inst56Quest4_HORDE_Attain = Inst56Quest4_Attain
Inst56Quest4_HORDE_Aim = Inst56Quest4_Aim
Inst56Quest4_HORDE_Location = Inst56Quest4_Location
Inst56Quest4_HORDE_Note = Inst56Quest4_Note
Inst56Quest4_HORDE_Prequest = Inst56Quest4_Prequest
Inst56Quest4_HORDE_Folgequest = Inst56Quest4_Folgequest
--
Inst56Quest4name1_HORDE = Inst56Quest4name1



--------------- INST61 - TK: The Eye ---------------

Inst61Story = "Tempest Keep is a former naaru fortress in the Netherstorm in Outland.\n\nThis crystaline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren.\n\nThe structure is divided into three wings - satellites of the gigantic structure - with the fourth wing, the Exodar, now in the world of Azeroth as the Draenei capital.\n\nThe Mechanar is the first wing of the Tempest Keep instance.\n\nThis is the purple crystal building south of the main palace.\n\nRecommended level is 70. One full run yields about 1500 reputation with the Sha'tar."
Inst61Caption = "TK: The Eye"
Inst61QAA = "3 Quests"
Inst61QAH = "3 Quests"

--Quest 1 Alliance
Inst61Quest1 = "1. Ruse of the Ashtongue"
Inst61Quest1_Level = "70"
Inst61Quest1_Attain = "70"
Inst61Quest1_Aim = "Travel into Tempest Keep and slay Al'ar while wearing the Ashtongue Cowl. Return to Akama in Shadowmoon Valley once you've completed this task."
Inst61Quest1_Location = "Akama (Shadowmoon Valley - Warden's Cage; "..YELLOW.."58,48"..WHITE..")"
Inst61Quest1_Note = "This is part of the Black Temple attunement line."
Inst61Quest1_Prequest = "The Secret Compromised ("..YELLOW.."Serpentshrine Cavern"..WHITE..")"
Inst61Quest1_Folgequest = "An Artifact From the Past ("..YELLOW.."Battle of Mount Hyjal"..WHITE..")"
Inst61Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst61Quest2 = "2. Kael'thas and the Verdant Sphere"
Inst61Quest2_Level = "70"
Inst61Quest2_Attain = "70"
Inst61Quest2_Aim = "Take the Verdant Sphere to A'dal in Shattrath City."
Inst61Quest2_Location = "Verdant Sphere (drops from Kael'thas Sunstrider at "..YELLOW.."[4]"..WHITE..")"
Inst61Quest2_Note = "A'dal is at (Shattrath City - Terrace of Light; "..YELLOW.."53,43"..WHITE..")."
Inst61Quest2_Prequest = "None"
Inst61Quest2_Folgequest = "None"
--
Inst61Quest2name1 = "The Sun King's Talisman"
Inst61Quest2name2 = "The Darkener's Grasp"
Inst61Quest2name3 = "Lord Sanguinar's Claim"
Inst61Quest2name4 = "Telonicus's Pendant of Mayhem"

--Quest 3 Alliance
Inst61Quest3 = "3. The Vials of Eternity"
Inst61Quest3_Level = "70"
Inst61Quest3_Attain = "70"
Inst61Quest3_Aim = "Soridormi at Caverns of Time wants you to retrieve Vashj's Vial Remnant from Lady Vashj at Coilfang Reservoir and Kael's Vial Remnant from Kael'thas Sunstrider at Tempest Keep."
Inst61Quest3_Location = "Soridormi (Tanaris - Caverns of Time; "..YELLOW.."58,57"..WHITE.."). NPC walks around the area."
Inst61Quest3_Note = "This quest is needed for attunement for Battle of Mount Hyjal. Kael'thas Sunstrider is at "..YELLOW.."[4]"..WHITE.."."
Inst61Quest3_Prequest = "None"
Inst61Quest3_Folgequest = "None"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst61Quest1_HORDE = Inst61Quest1
Inst61Quest1_HORDE_Level = Inst61Quest1_Level
Inst61Quest1_HORDE_Attain = Inst61Quest1_Attain
Inst61Quest1_HORDE_Aim = Inst61Quest1_Aim
Inst61Quest1_HORDE_Location = Inst61Quest1_Location
Inst61Quest1_HORDE_Note = Inst61Quest1_Note
Inst61Quest1_HORDE_Prequest = Inst61Quest1_Prequest
Inst61Quest1_HORDE_Folgequest = Inst61Quest1_Folgequest
Inst61Quest1PreQuest_HORDE = Inst61Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst61Quest2_HORDE = Inst61Quest2
Inst61Quest2_HORDE_Level = Inst61Quest2_Level
Inst61Quest2_HORDE_Attain = Inst61Quest2_Attain
Inst61Quest2_HORDE_Aim = Inst61Quest2_Aim
Inst61Quest2_HORDE_Location = Inst61Quest2_Location
Inst61Quest2_HORDE_Note = Inst61Quest2_Note
Inst61Quest2_HORDE_Prequest = Inst61Quest2_Prequest
Inst61Quest2_HORDE_Folgequest = Inst61Quest2_Folgequest
--
Inst61Quest2name1_HORDE = Inst61Quest2name1
Inst61Quest2name2_HORDE = Inst61Quest2name2
Inst61Quest2name3_HORDE = Inst61Quest2name3
Inst61Quest2name4_HORDE = Inst61Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst61Quest3_HORDE = Inst61Quest3
Inst61Quest3_HORDE_Level = Inst61Quest3_Level
Inst61Quest3_HORDE_Attain = Inst61Quest3_Attain
Inst61Quest3_HORDE_Aim = Inst61Quest3_Aim
Inst61Quest3_HORDE_Location = Inst61Quest3_Location
Inst61Quest3_HORDE_Note = Inst61Quest3_Note
Inst61Quest3_HORDE_Prequest = Inst61Quest3_Prequest
Inst61Quest3_HORDE_Folgequest = Inst61Quest3_Folgequest
-- No Rewards for this quest



--------------- INST62 - Black Temple (BT) ---------------

Inst62Story = {
  ["Page1"] = "Long ago on Draenor, the Temple of Karabor was the center of draenei worship. But the devout priests who prayed there are long dead, slaughtered by marauding, demonically corrupted orcs. In the massacre's aftermath the warlocks of the Shadow Council seized the structure and bestowed upon it a new name: the Black Temple.\n\nFor years the Shadow Council bloodied the Black Temple with foul demonic rituals, but after the Second War the dark spellcasters fell to the Alliance's devastating invasion of Draenor. The shaman Ner'zhul hastily opened several dimensional portals in order to stage a retreat, and the resulting magical backlash ripped the world apart. In what had become the fractured realm of Outland, Ner'zhul's portals were a strategic advantage that appealed to the demon general Magtheridon, who quickly seized the Black Temple as his seat of power.",
  ["Page2"] = "Magtheridon commanded many of the orcs remaining in Outland and bolstered his army with Legion forces streaming in through the portals. The pit lord's might remained unchallenged until Illidan the Betrayer decided to claim the Black Temple for himself. Illidan and Magtheridon fought a desperate battle on the temple walls, but in the end the pit lord proved no match for the wielder of the Twin Blades of Azzinoth. Illidan battered Magtheridon to the point of death, but the thrill of victory was short-lived....",
  ["MaxPages"] = "2",
};
Inst62Caption = "Black Temple"
Inst62QAA = "3 Quests"
Inst62QAH = "3 Quests"

--Quest 1 Alliance
Inst62Quest1 = "1. Seek Out the Ashtongue"
Inst62Quest1_Level = "70"
Inst62Quest1_Attain = "70"
Inst62Quest1_Aim = "Find Akama's Deathsworn inside the Black Temple."
Inst62Quest1_Location = "Xi'ri (Shadowmoon Valley; "..YELLOW.."65,44"..WHITE..")."
Inst62Quest1_Note = "Spirit of Olum is up and to your left once you enter the Black Temple at "..YELLOW.."[1]"..WHITE..". He will teleport you to Seer Kanai once you've High Warlord Naj'entus at "..YELLOW.."[2]"..WHITE.." and Supremus at "..YELLOW.."[3]"..WHITE.."."
Inst62Quest1_Prequest = "The Secret Compromised -> A Distraction for Akama"
Inst62Quest1_Folgequest = "Redemption of the Ashtongue"
Inst62Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst62Quest2 = "2. Redemption of the Ashtongue"
Inst62Quest2_Level = "70"
Inst62Quest2_Attain = "70"
Inst62Quest2_Aim = "Help Akama wrest control back of his soul by defeating the Shade of Akama inside the Black Temple. Return to Seer Kanai when you've completed this task."
Inst62Quest2_Location = "Seer Kanai (Black Temple; "..YELLOW.."[5]"..WHITE..")."
Inst62Quest2_Note = "Shade of Akama is at "..YELLOW.."[4]"..WHITE.."."
Inst62Quest2_Prequest = "Seek Out the Ashtongue"
Inst62Quest2_Folgequest = "The Fall of the Betrayer"
Inst62Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst62Quest3 = "3. The Fall of the Betrayer"
Inst62Quest3_Level = "70"
Inst62Quest3_Attain = "70"
Inst62Quest3_Aim = "Seer Kanai wants you to defeat Illidan inside the Black Temple."
Inst62Quest3_Location = "Seer Kanai (Black Temple; "..YELLOW.."[5]"..WHITE..")."
Inst62Quest3_Note = "Illidan Stormrage is at "..YELLOW.."[11]"..WHITE.."."
Inst62Quest3_Prequest = "Redemption of the Ashtongue"
Inst62Quest3_Folgequest = "None"
Inst62Quest3FQuest = "true"
--
Inst62Quest3name1 = "Blessed Medallion of Karabor"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst62Quest1_HORDE = Inst62Quest1
Inst62Quest1_HORDE_Level = Inst62Quest1_Level
Inst62Quest1_HORDE_Attain = Inst62Quest1_Attain
Inst62Quest1_HORDE_Aim = Inst62Quest1_Aim
Inst62Quest1_HORDE_Location = Inst62Quest1_Location
Inst62Quest1_HORDE_Note = Inst62Quest1_Note
Inst62Quest1_HORDE_Prequest = Inst62Quest1_Prequest
Inst62Quest1_HORDE_Folgequest = Inst62Quest1_Folgequest
Inst62Quest1PreQuest_HORDE = Inst62Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst62Quest2_HORDE = Inst62Quest2
Inst62Quest2_HORDE_Level = Inst62Quest2_Level
Inst62Quest2_HORDE_Attain = Inst62Quest2_Attain
Inst62Quest2_HORDE_Aim = Inst62Quest2_Aim
Inst62Quest2_HORDE_Location = Inst62Quest2_Location
Inst62Quest2_HORDE_Note = Inst62Quest2_Note
Inst62Quest2_HORDE_Prequest = Inst62Quest2_Prequest
Inst62Quest2_HORDE_Folgequest = Inst62Quest2_Folgequest
Inst62Quest2FQuest_HORDE = Inst62Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst62Quest3_HORDE = Inst62Quest3
Inst62Quest3_HORDE_Level = Inst62Quest3_Level
Inst62Quest3_HORDE_Attain = Inst62Quest3_Attain
Inst62Quest3_HORDE_Aim = Inst62Quest3_Aim
Inst62Quest3_HORDE_Location = Inst62Quest3_Location
Inst62Quest3_HORDE_Note = Inst62Quest3_Note
Inst62Quest3_HORDE_Prequest = Inst62Quest3_Prequest
Inst62Quest3_HORDE_Folgequest = Inst62Quest3_Folgequest
Inst62Quest3FQuest_HORDE = Inst62Quest3FQuest
--
Inst62Quest3name1_HORDE = Inst62Quest3name1



--------------- INST63 - Zul'Aman (ZA) ---------------

Inst63Story = "The stronghold of Zul'Aman has stood for millennia as the Amani trolls' seat of power and bastion of the fearless, cunning warlord Zul'jin. \n\nZul'jin has spent several years plotting behind Zul'Aman's walls. Furious at the Horde for allowing his hated enemies, the blood elves, to join its ranks, he eagerly embraced a scheme that the witch doctor Malacrass recently proposed: to seal the power of the animal gods within the bodies of the Amani's strongest warriors. \n\nNow Zul'Aman's army grows more powerful by the day, hungry to exact vengeance in the name of its fearless leader, Zul'jin."
Inst63Caption = "Zul'Aman"
Inst63QAA = "8 Quests"
Inst63QAH = "8 Quests"

--Quest 1 Alliance
Inst63Quest1 = "1. Promises, Promises..."
Inst63Quest1_Level = "70"
Inst63Quest1_Attain = "70"
Inst63Quest1_Aim = "Budd Nedreck in Hatchet Hills wants you to retrieve his map from High Priest Nalorakk's terrace in Zul'Aman."
Inst63Quest1_Location = "Budd Nedreck (Ghostlands - Hatchet Hills; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest1_Note = "Found on the right ramp near High Priest Nalorakk at "..YELLOW.."[1]"..WHITE..". The prequest is optional and starts from Griftah at (Shattrath City - Lower City; "..YELLOW.."65,69"..WHITE..")."
Inst63Quest1_Prequest = "Oooh, Shinies!"
Inst63Quest1_Folgequest = "X Marks... Your Doom!"
Inst63Quest1PreQuest = "true"
--
Inst63Quest1name1 = "Tattered Hexcloth Sack"

--Quest 2 Alliance
Inst63Quest2 = "2. X Marks... Your Doom!"
Inst63Quest2_Level = "70"
Inst63Quest2_Attain = "70"
Inst63Quest2_Aim = "Enter Zul'Aman and visit Halazzi's Chamber, Jan'alai's Platform, and Akil'zon's Platform. Report the details of those areas to Budd, at his camp in the Ghostlands."
Inst63Quest2_Location = "Budd Nedreck (Ghostlands - Hatchet Hills; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest2_Note = "Halazzi's Chamber is at "..YELLOW.."[4]"..WHITE..", Jan'alai's Platform is at "..YELLOW.."[3]"..WHITE.." and Akil'zon's Platform is at "..YELLOW.."[2]"..WHITE..". \n\nReportedly, the bosses do not need to be faught in order to get quest credit. Just get near them without aggroing." 
Inst63Quest2_Prequest = "Promises, Promises..."
Inst63Quest2_Folgequest = "Hex Lord? Hah!"
Inst63Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst63Quest3 = "3. Hex Lord? Hah!"
Inst63Quest3_Level = "70"
Inst63Quest3_Attain = "70"
Inst63Quest3_Aim = "Budd Nedreck in Hatchet Hills wants you to kill Hex Lord Malacrass in Zul'Aman."
Inst63Quest3_Location = "Budd Nedreck (Ghostlands - Hatchet Hills; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest3_Note = "Hex Lord Malacrass is at "..YELLOW.."[6]"..WHITE.."."
Inst63Quest3_Prequest = "X Marks... Your Doom!"
Inst63Quest3_Folgequest = "None"
Inst63Quest3FQuest = "true"
--
Inst63Quest3name1 = "Badge of Justice"

--Quest 4 Alliance
Inst63Quest4 = "4. Tuskin' Raiders"
Inst63Quest4_Level = "70"
Inst63Quest4_Attain = "70"
Inst63Quest4_Aim = "Prigmon needs you to collect 10 Forest Troll Tusks from the trolls in Zul'Aman. Bring them to him at Budd's camp in the Ghostlands."
Inst63Quest4_Location = "Prigmon (Ghostlands - Hatchet Hills; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest4_Note = "The Forest Troll Tusks drop from Amani'shi mobs inside Zul'Aman. This quest becomes available after you complete Promises, Promises..."
Inst63Quest4_Prequest = "None"
Inst63Quest4_Folgequest = "A Troll Among Trolls"
-- No Rewards for this quest

--Quest 5 Alliance
Inst63Quest5 = "5. A Troll Among Trolls"
Inst63Quest5_Level = "70"
Inst63Quest5_Attain = "70"
Inst63Quest5_Aim = "Prigmon has tasked you with locating and assisting his cousin Zungam, somewhere within Zul'Aman."
Inst63Quest5_Location = "Prigmon (Ghostlands - Hatchet Hills; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest5_Note = "Zungam is in a hut at "..YELLOW.."[5]"..WHITE..". After you release him, he gives you the followup quest."
Inst63Quest5_Prequest = "Tuskin' Raiders"
Inst63Quest5_Folgequest = "Playin' With Dolls"
Inst63Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst63Quest6 = "6. Playin' With Dolls"
Inst63Quest6_Level = "70"
Inst63Quest6_Attain = "70"
Inst63Quest6_Aim = "Take the Tattered Voodoo Doll to Griftah in Shattrath City."
Inst63Quest6_Location = "Zungam (Zul'Aman; "..YELLOW.."[5]"..WHITE..")"
Inst63Quest6_Note = "Griftah is at (Shattrath City - Lower City; "..YELLOW.."65,69"..WHITE..")."
Inst63Quest6_Prequest = "A Troll Among Trolls"
Inst63Quest6_Folgequest = "None"
Inst63Quest6FQuest = "true"
--
Inst63Quest6name1 = "Charmed Amani Jewel"

--Quest 7 Alliance
Inst63Quest7 = "7. Blood of the Warlord"
Inst63Quest7_Level = "70"
Inst63Quest7_Attain = "70"
Inst63Quest7_Aim = "Bring the Blood of Zul'jin to Budd at his camp in the Ghostlands, outside Zul'Aman."
Inst63Quest7_Location = "Blood of Zul'jin (drops from Zul'jin; "..YELLOW.."[7]"..WHITE..")"
Inst63Quest7_Note = "Only one person in the raid can loot this item and the quest can only be done one time."
Inst63Quest7_Prequest = "None"
Inst63Quest7_Folgequest = "Undercover Sister"
-- No Rewards for this quest

--Quest 8 Alliance
Inst63Quest8 = "8. Undercover Sister"
Inst63Quest8_Level = "70"
Inst63Quest8_Attain = "70"
Inst63Quest8_Aim = "Report to Donna Brascoe to collect a reward for your heroism in Zul'Aman. Donna is currently stationed in the Ghostlands, just outside Zul'aman."
Inst63Quest8_Location = "Donna Brascoe (Ghostlands - Hatchet Hills; "..YELLOW.."70,68"..WHITE..")"
Inst63Quest8_Note = ""
Inst63Quest8_Prequest = "Blood of the Warlord"
Inst63Quest8_Folgequest = "None"
Inst63Quest8FQuest = "true"
--
Inst63Quest8name1 = "Badge of Justice"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst63Quest1_HORDE = Inst63Quest1
Inst63Quest1_HORDE_Level = Inst63Quest1_Level
Inst63Quest1_HORDE_Attain = Inst63Quest1_Attain
Inst63Quest1_HORDE_Aim = Inst63Quest1_Aim
Inst63Quest1_HORDE_Location = Inst63Quest1_Location
Inst63Quest1_HORDE_Note = Inst63Quest1_Note
Inst63Quest1_HORDE_Prequest = Inst63Quest1_Prequest
Inst63Quest1_HORDE_Folgequest = Inst63Quest1_Folgequest
Inst63Quest1PreQuest_HORDE = Inst63Quest1PreQuest
--
Inst63Quest1name1_HORDE = Inst63Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst63Quest2_HORDE = Inst63Quest2
Inst63Quest2_HORDE_Level = Inst63Quest2_Level
Inst63Quest2_HORDE_Attain = Inst63Quest2_Attain
Inst63Quest2_HORDE_Aim = Inst63Quest2_Aim
Inst63Quest2_HORDE_Location = Inst63Quest2_Location
Inst63Quest2_HORDE_Note = Inst63Quest2_Note
Inst63Quest2_HORDE_Prequest = Inst63Quest2_Prequest
Inst63Quest2_HORDE_Folgequest = Inst63Quest2_Folgequest
Inst63Quest2FQuest_HORDE = Inst63Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst63Quest3_HORDE = Inst63Quest3
Inst63Quest3_HORDE_Level = Inst63Quest3_Level
Inst63Quest3_HORDE_Attain = Inst63Quest3_Attain
Inst63Quest3_HORDE_Aim = Inst63Quest3_Aim
Inst63Quest3_HORDE_Location = Inst63Quest3_Location
Inst63Quest3_HORDE_Note = Inst63Quest3_Note
Inst63Quest3_HORDE_Prequest = Inst63Quest3_Prequest
Inst63Quest3_HORDE_Folgequest = Inst63Quest3_Folgequest
Inst63Quest3FQuest_HORDE = Inst63Quest3FQuest
--
Inst63Quest3name1_HORDE = Inst63Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst63Quest4_HORDE = Inst63Quest4
Inst63Quest4_HORDE_Level = Inst63Quest4_Level
Inst63Quest4_HORDE_Attain = Inst63Quest4_Attain
Inst63Quest4_HORDE_Aim = Inst63Quest4_Aim
Inst63Quest4_HORDE_Location = Inst63Quest4_Location
Inst63Quest4_HORDE_Note = Inst63Quest4_Note
Inst63Quest4_HORDE_Prequest = Inst63Quest4_Prequest
Inst63Quest4_HORDE_Folgequest = Inst63Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst63Quest5_HORDE = Inst63Quest5
Inst63Quest5_HORDE_Level = Inst63Quest5_Level
Inst63Quest5_HORDE_Attain = Inst63Quest5_Attain
Inst63Quest5_HORDE_Aim = Inst63Quest5_Aim
Inst63Quest5_HORDE_Location = Inst63Quest5_Location
Inst63Quest5_HORDE_Note = Inst63Quest5_Note
Inst63Quest5_HORDE_Prequest = Inst63Quest5_Prequest
Inst63Quest5_HORDE_Folgequest = Inst63Quest5_Folgequest
Inst63Quest5FQuest_HORDE = Inst63Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst63Quest6_HORDE = Inst63Quest6
Inst63Quest6_HORDE_Level = Inst63Quest6_Level
Inst63Quest6_HORDE_Attain = Inst63Quest6_Attain
Inst63Quest6_HORDE_Aim = Inst63Quest6_Aim
Inst63Quest6_HORDE_Location = Inst63Quest6_Location
Inst63Quest6_HORDE_Note = Inst63Quest6_Note
Inst63Quest6_HORDE_Prequest = Inst63Quest6_Prequest
Inst63Quest6_HORDE_Folgequest = Inst63Quest6_Folgequest
Inst63Quest6FQuest_HORDE = Inst63Quest6FQuest
--
Inst63Quest6name1_HORDE = Inst63Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst63Quest7_HORDE = Inst63Quest7
Inst63Quest7_HORDE_Level = Inst63Quest7_Level
Inst63Quest7_HORDE_Attain = Inst63Quest7_Attain
Inst63Quest7_HORDE_Aim = Inst63Quest7_Aim
Inst63Quest7_HORDE_Location = Inst63Quest7_Location
Inst63Quest7_HORDE_Note = Inst63Quest7_Note
Inst63Quest7_HORDE_Prequest = Inst63Quest7_Prequest
Inst63Quest7_HORDE_Folgequest = Inst63Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst63Quest8_HORDE = Inst63Quest8
Inst63Quest8_HORDE_Level = Inst63Quest8_Level
Inst63Quest8_HORDE_Attain = Inst63Quest8_Attain
Inst63Quest8_HORDE_Aim = Inst63Quest8_Aim
Inst63Quest8_HORDE_Location = Inst63Quest8_Location
Inst63Quest8_HORDE_Note = Inst63Quest8_Note
Inst63Quest8_HORDE_Prequest = Inst63Quest8_Prequest
Inst63Quest8_HORDE_Folgequest = Inst63Quest8_Folgequest
Inst63Quest8FQuest_HORDE = Inst63Quest8FQuest
--
Inst63Quest8name1_HORDE = Inst63Quest8name1



--------------- INST67 - Magisters' Terrace (MgT) ---------------

Inst67Story = "Magisters' Terrace is a 5-man instance located on the northeastern corner of the Isle of Quel'Danas, which will be released in Patch 2.4.0. The instance is mostly outdoors, uses the same architecture as Silvermoon and has a observatory where players can gaze at stars and look at the Sunwell to make sure everything went according to plan.\n\nThe final boss is none other than Kael'thas Sunstrider, who has survived his ordeal in Tempest Keep. However, some people believe he was indeed killed, but was resurrected by a greater power, which may explain the green crystal embedded in his chest.\n\nHalfway through the instance, a usable item known as the Scrying Orb begins a short cutscene unveiling the Sunwell Plateau raid. Following this, players meet with Kalec, the half-elf avatar of the Blue Dragon Kalecgos.\n\n"..GREEN.."Quoted from WoWWiki"
Inst67Caption = "Magisters' Terrace"
Inst67QAA = "5 Quests"
Inst67QAH = "5 Quests"

--Quest 1 Alliance
Inst67Quest1 = "1. Wanted: Sisters of Torment (Daily)"
Inst67Quest1_Level = "70"
Inst67Quest1_Attain = "70"
Inst67Quest1_Aim = "Nether-Stalker Mah'duun wants you to slay 4 Sisters of Torment. Return to him in Shattrath's Lower City once you have done so in order to collect the bounty."
Inst67Quest1_Location = "Nether-Stalker Mah'duun (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst67Quest1_Note = "This is a daily quest."
Inst67Quest1_Prequest = "None"
Inst67Quest1_Folgequest = "None"
--
Inst67Quest1name1 = "Ethereum Prison Key"

--Quest 2 Alliance
Inst67Quest2 = "2. Wanted: The Signet Ring of Prince Kael'thas (Heroic Daily)"
Inst67Quest2_Level = "70"
Inst67Quest2_Attain = "70"
Inst67Quest2_Aim = "Wind Trader Zhareem has asked you to obtain The Signet Ring of Prince Kael'thas. Deliver it to him in Shattrath's Lower City to collect the reward."
Inst67Quest2_Location = "Wind Trader Zhareem (Shattrath City - Lower City; "..YELLOW.."74,35"..WHITE..")"
Inst67Quest2_Note = "This daily quest can only be completed on Heroic difficulty.\n\nPrince Kael'thas Sunstrider is at "..YELLOW.."[6]"..WHITE.."."
Inst67Quest2_Prequest = "None"
Inst67Quest2_Folgequest = "None"
--
Inst67Quest2name1 = "Badge of Justice"

--Quest 3 Alliance
Inst67Quest3 = "3. Magisters' Terrace"
Inst67Quest3_Level = "70"
Inst67Quest3_Attain = "70"
Inst67Quest3_Aim = "Exarch Larethor at the Shattered Sun Staging Area wants you to search Magisters' Terrace and find Tyrith, a blood elf spy."
Inst67Quest3_Location = "Exarch Larethor (Isle of Quel'Danas - Shattered Sun Staging Area; "..YELLOW.."47,31"..WHITE..")"
Inst67Quest3_Note = "Tyrith is inside the instance at "..YELLOW.."[2]"..WHITE..". This questline unlocks heroic mode.\n\nThe prequest is available from either Adyen the Lightwarden (Shattrath City - Aldor Rise; "..YELLOW.."35,36"..WHITE..") or Dathris Sunstriker (Shattrath City - Scryers Tier; "..YELLOW.."55,80"..WHITE..")."
Inst67Quest3_Prequest = "Crisis at the Sunwell or Duty Calls"
Inst67Quest3_Folgequest = "The Scryer's Scryer"
Inst67Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst67Quest4 = "4. The Scryer's Scryer"
Inst67Quest4_Level = "70"
Inst67Quest4_Attain = "70"
Inst67Quest4_Aim = "Tyrith wants you to use the orb on the balcony in Magisters' Terrace."
Inst67Quest4_Location = "Tyrith (Magisters' Terrace; "..YELLOW.."[2]"..WHITE..")"
Inst67Quest4_Note = "The Scrying Orb is at "..YELLOW.."[4]"..WHITE..". After the 'movie' clip, Kalecgos will appear to start the next quest."
Inst67Quest4_Prequest = "Magisters' Terrace"
Inst67Quest4_Folgequest = "Hard to Kill"
Inst67Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst67Quest5 = "5. Hard to Kill"
Inst67Quest5_Level = "70"
Inst67Quest5_Attain = "70"
Inst67Quest5_Aim = "Kalecgos has asked you to defeat Kael'thas in Magisters' Terrace. You are to take Kael's head and report back to Larethor at the Shattered Sun Staging Area."
Inst67Quest5_Location = "Kalecgos (Magisters' Terrace; "..YELLOW.."[4]"..WHITE..")"
Inst67Quest5_Note = "Prince Kael'thas Sunstrider is at "..YELLOW.."[6]"..WHITE..". Completing this quest also enables you to do Magisters' Terrace on Heroic mode.\n\nLarethor is at (Isle of Quel'Danas - Shattered Sun Staging Area; "..YELLOW.."47,31"..WHITE..")."
Inst67Quest5_Prequest = "The Scryer's Scryer"
Inst67Quest5_Folgequest = "None"
Inst67Quest5FQuest = "true"
--
Inst67Quest5name1 = "Bright Crimson Spinel"
Inst67Quest5name2 = "Runed Crimson Spinel"
Inst67Quest5name3 = "Teardrop Crimson Spinel"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst67Quest1_HORDE = Inst67Quest1
Inst67Quest1_HORDE_Level = Inst67Quest1_Level
Inst67Quest1_HORDE_Attain = Inst67Quest1_Attain
Inst67Quest1_HORDE_Aim = Inst67Quest1_Aim
Inst67Quest1_HORDE_Location = Inst67Quest1_Location
Inst67Quest1_HORDE_Note = Inst67Quest1_Note
Inst67Quest1_HORDE_Prequest = Inst67Quest1_Prequest
Inst67Quest1_HORDE_Folgequest = Inst67Quest1_Folgequest
--
Inst67Quest1name1_HORDE = Inst67Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst67Quest2_HORDE = Inst67Quest2
Inst67Quest2_HORDE_Level = Inst67Quest2_Level
Inst67Quest2_HORDE_Attain = Inst67Quest2_Attain
Inst67Quest2_HORDE_Aim = Inst67Quest2_Aim
Inst67Quest2_HORDE_Location = Inst67Quest2_Location
Inst67Quest2_HORDE_Note = Inst67Quest2_Note
Inst67Quest2_HORDE_Prequest = Inst67Quest2_Prequest
Inst67Quest2_HORDE_Folgequest = Inst67Quest2_Folgequest
--
Inst67Quest2name1_HORDE = Inst67Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst67Quest3_HORDE = Inst67Quest3
Inst67Quest3_HORDE_Level = Inst67Quest3_Level
Inst67Quest3_HORDE_Attain = Inst67Quest3_Attain
Inst67Quest3_HORDE_Aim = Inst67Quest3_Aim
Inst67Quest3_HORDE_Location = Inst67Quest3_Location
Inst67Quest3_HORDE_Note = Inst67Quest3_Note
Inst67Quest3_HORDE_Prequest = Inst67Quest3_Prequest
Inst67Quest3_HORDE_Folgequest = Inst67Quest3_Folgequest
Inst67Quest3PreQuest_HORDE = Inst67Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst67Quest4_HORDE = Inst67Quest4
Inst67Quest4_HORDE_Level = Inst67Quest4_Level
Inst67Quest4_HORDE_Attain = Inst67Quest4_Attain
Inst67Quest4_HORDE_Aim = Inst67Quest4_Aim
Inst67Quest4_HORDE_Location = Inst67Quest4_Location
Inst67Quest4_HORDE_Note = Inst67Quest4_Note
Inst67Quest4_HORDE_Prequest = Inst67Quest4_Prequest
Inst67Quest4_HORDE_Folgequest = Inst67Quest4_Folgequest
Inst67Quest4FQuest_HORDE = Inst67Quest4FQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst67Quest5_HORDE = Inst67Quest5
Inst67Quest5_HORDE_Level = Inst67Quest5_Level
Inst67Quest5_HORDE_Attain = Inst67Quest5_Attain
Inst67Quest5_HORDE_Aim = Inst67Quest5_Aim
Inst67Quest5_HORDE_Location = Inst67Quest5_Location
Inst67Quest5_HORDE_Note = Inst67Quest5_Note
Inst67Quest5_HORDE_Prequest = Inst67Quest5_Prequest
Inst67Quest5_HORDE_Folgequest = Inst67Quest5_Folgequest
Inst67Quest5FQuest_HORDE = Inst67Quest5FQuest
--
Inst67Quest5name1_HORDE = Inst67Quest5name1
Inst67Quest5name2_HORDE = Inst67Quest5name2
Inst67Quest5name3_HORDE = Inst67Quest5name3



--------------- INST68 - Sunwell Plateau ---------------

Inst68Story = "The Sunwell Plateau is a raid instance located on the Isle of Quel'Danas north of Silvermoon City. Blizzard has planned for it to become the hardest raid instance in the game until the release of Wrath of the Lich King. The Sunwell Plateau is tuned for Tier 6-geared players and the gear that drops there will be additional Tier 6 items (boots, belt and bracers), and non-set epics as well. \n\nThe instance will contain both outdoor areas and building interiors, where players will find captured naaru which are the primary power source of the town, and inside the final building the Sunwell itself.\n\nThe architecture of the Sunwell Plateau will be comparable to that of Silvermoon City.\n\n"..GREEN.."Quoted from WoWWiki"
Inst68Caption = "Sunwell Plateau"
Inst68QAA = "1 Quest"
Inst68QAH = "1 Quest"

--Quest 1 Alliance
Inst68Quest1 = "1. The Purification of Quel'Delar"
Inst68Quest1_Level = "80"
Inst68Quest1_Attain = "80"
Inst68Quest1_Aim = "Immerse your Tempered Quel'Delar in the Sunwell. Speak to a Warden of the Sunwell when you are ready to enter the Sunwell Plateau."
Inst68Quest1_Location = "Halduron Brightwing (Isle of Quel'danas; "..YELLOW.."44.5, 45.5"..WHITE..")"
Inst68Quest1_Note = "When you enter Sunwell Plateau, you will be in a phased version and will not have to fight any mobs or bosses.  The Sunwell is at "..YELLOW.."[4]"..WHITE.."."
Inst68Quest1_Prequest = "Thalorien Dawnseeker"
Inst68Quest1_Folgequest = "A Victory For The Silver Covenant"
Inst68Quest1PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst68Quest1_HORDE = "1. The Purification of Quel'Delar"
Inst68Quest1_HORDE_Level = "80"
Inst68Quest1_HORDE_Attain = "80"
Inst68Quest1_HORDE_Aim = "Immerse your Tempered Quel'Delar in the Sunwell. Speak to a Warden of the Sunwell when you are ready to enter the Sunwell Plateau."
Inst68Quest1_HORDE_Location = "Halduron Brightwing (Isle of Quel'danas; "..YELLOW.."44.5, 45.5"..WHITE..")"
Inst68Quest1_HORDE_Note = "When you enter Sunwell Plateau, you will be in a phased version and will not have to fight any mobs or bosses.  The Sunwell is at "..YELLOW.."[4]"..WHITE.."."
Inst68Quest1_HORDE_Prequest = "Thalorien Dawnseeker"
Inst68Quest1_HORDE_Folgequest = "A Victory For The Sunreavers"
Inst68Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST69 - Caverns of Time: Stratholme Past ---------------

Inst69Story = "Prior to his unthinkable merger with the Lich King, Arthas waged war against the Scourge, bent on eradicating the plague of undeath that had spread throughout Lordaeron. After Arthas watched villages succumb to darkness and saw his fallen subjects transformed into hideous undead creatures, fear and hate engulfed his mind. Upon discovering signs of the plague within Stratholme, he knew it was only a matter of time before the residents of the city were reborn as Scourge agents. For Arthas, there was only one course of action: purge the city. Yet within the Caverns of Time, deceptive magic permeates Stratholme. The infinite dragons and their agents have targeted Arthas and his quest to cull the city, seeking to alter history. Fearing the temporal disruption might jeopardize Azeroth's very existence, the bronze dragonflight has called upon mortals to assist Arthas and ensure that the purge is carried out successfully. Regardless of how vile the event might seem, the keepers of time maintain that what was, must always be."
Inst69Caption = "CoT: Stratholme Past"
Inst69QAA = "2 Quests"
Inst69QAH = "2 Quests"

--Quest 1 Alliance
Inst69Quest1 = "1. Dispelling Illusions"
Inst69Quest1_Level = "80"
Inst69Quest1_Attain = "78"
Inst69Quest1_Aim = "Chromie wants you to use the Arcane Disruptor on the suspicious crates in Stratholme Past, then speak to her near the entrance to Stratholme."
Inst69Quest1_Location = "Chromie (Stratholme Past; "..YELLOW.."[1]"..WHITE..")"
Inst69Quest1_Note = "The crates are found near the houses along the road on the way to Stratholme. After completion, you can turn the quest in to another Chromie at "..YELLOW.."[2]"..WHITE.."."
Inst69Quest1_Prequest = "None"
Inst69Quest1_Folgequest = "A Royal Escort"
-- No Rewards for this quest

--Quest 2 Alliance
Inst69Quest2 = "2. A Royal Escort"
Inst69Quest2_Level = "80"
Inst69Quest2_Attain = "78"
Inst69Quest2_Aim = "Chromie has asked you to accompany Arthas in the Culling of Stratholme. You are to speak with her again after Mal'Ganis is defeated."
Inst69Quest2_Location = "Chromie (Stratholme Past; "..YELLOW.."[2]"..WHITE..")"
Inst69Quest2_Note = "Mal'Ganis is at "..YELLOW.."[5]"..WHITE..". Chromie will appear there after the event is over."
Inst69Quest2_Prequest = "Dispelling Illusions"
Inst69Quest2_Folgequest = "None"
Inst69Quest2FQuest = "true"
--
Inst69Quest2name1 = "Gloves of the Time Guardian"
Inst69Quest2name2 = "Handwraps of Preserved History"
Inst69Quest2name3 = "Grips of Chronological Events"
Inst69Quest2name4 = "Gauntlets of The Culling"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst69Quest1_HORDE = Inst69Quest1
Inst69Quest1_HORDE_Level = Inst69Quest1_Level
Inst69Quest1_HORDE_Attain = Inst69Quest1_Attain
Inst69Quest1_HORDE_Aim = Inst69Quest1_Aim
Inst69Quest1_HORDE_Location = Inst69Quest1_Location
Inst69Quest1_HORDE_Note = Inst69Quest1_Note
Inst69Quest1_HORDE_Prequest = Inst69Quest1_Prequest
Inst69Quest1_HORDE_Folgequest = Inst69Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst69Quest2_HORDE = Inst69Quest2
Inst69Quest2_HORDE_Level = Inst69Quest2_Level
Inst69Quest2_HORDE_Attain = Inst69Quest2_Attain
Inst69Quest2_HORDE_Aim = Inst69Quest2_Aim
Inst69Quest2_HORDE_Location = Inst69Quest2_Location
Inst69Quest2_HORDE_Note = Inst69Quest2_Note
Inst69Quest2_HORDE_Prequest = Inst69Quest2_Prequest
Inst69Quest2_HORDE_Folgequest = Inst69Quest2_Folgequest
Inst69Quest2FQuest_HORDE = Inst69Quest2FQuest
--
Inst69Quest2name1_HORDE = Inst69Quest2name1
Inst69Quest2name2_HORDE = Inst69Quest2name2
Inst69Quest2name3_HORDE = Inst69Quest2name3
Inst69Quest2name4_HORDE = Inst69Quest2name4



--------------- INST70 - Utgarde Keep: Utgarde Keep ---------------

Inst70Story = "Among the cliffs of the Daggercap Bay in the Howling Fjord stands Utgarde Keep, an impervious fortress occupied by the savage and enigmatic vrykul. With mysterious, foul magic and proto-dragons at their command, the vrykul of Utgarde Keep pose an imminent threat to both the Alliance and the Horde. Only the bravest would dare to strike against Ymiron's faithful and delve into the heart of the vrykul's primeval home."
Inst70Caption = "Utgarde Keep"
Inst70QAA = "2 Quests"
Inst70QAH = "3 Quests"

--Quest 1 Alliance
Inst70Quest1 = "1. Into Utgarde!"
Inst70Quest1_Level = "71"
Inst70Quest1_Attain = "68"
Inst70Quest1_Aim = "Defender Mordun has tasked you with the execution of Ingvar the Plunderer who resides deep in Utgarde. You are then to bring his head to Vice Admiral Keller."
Inst70Quest1_Location = "Defender Mordun (Howling Fjord - Wyrmskull Village; "..YELLOW.."59.3, 48.8"..WHITE..")"
Inst70Quest1_Note = "Ingvar the Plunderer is at "..YELLOW.."[3]"..WHITE..".\n\nThe prequest is optional. The quest turns in to Vice Admiral Keller at (Howling Fjord - Valgarde; "..YELLOW.."60.4, 61.0"..WHITE..")."
Inst70Quest1_Prequest = "Fresh Legs"
Inst70Quest1_Folgequest = "None"
--
Inst70Quest1name1 = "Executioner's Band"
Inst70Quest1name2 = "Ring of Decimation"
Inst70Quest1name3 = "Signet of Swift Judgment"

--Quest 2 Alliance
Inst70Quest2 = "2. Disarmament"
Inst70Quest2_Level = "71"
Inst70Quest2_Attain = "70"
Inst70Quest2_Aim = "Defender Mordun wants you to enter Utgarde Keep and steal 5 Vrykul Weapons"
Inst70Quest2_Location = "Defender Mordun (Howling Fjord - Wyrmskull Village; "..YELLOW.."59.3, 48.8"..WHITE..")"
Inst70Quest2_Note = "The Vrykul Weapons can be found along walls scattered around the instance. The prequest comes from Scout Valory (Howling Fjord - Wyrmskull Village; "..YELLOW.."56.0, 55.8"..WHITE..") and is optional."
Inst70Quest2_Prequest = "None"
Inst70Quest2_Folgequest = "None"
--
Inst70Quest2name1 = "Amulet of the Tranquil Mind"
Inst70Quest2name2 = "Razor-Blade Pendant"
Inst70Quest2name3 = "Necklace of Fragmented Light"
Inst70Quest2name4 = "Woven Steel Necklace"


--Quest 1 Horde
Inst70Quest1_HORDE = "1. A Score to Settle"
Inst70Quest1_HORDE_Level = "71"
Inst70Quest1_HORDE_Attain = "68"
Inst70Quest1_HORDE_Aim = "High Executor Anselm wants you to to go into Utgarde and slay Prince Keleseth."
Inst70Quest1_HORDE_Location = "High Executor Anselm (Howling Fjord - Vengeance Landing; "..YELLOW.."78.5, 31.1"..WHITE..")"
Inst70Quest1_HORDE_Note = "Prince Keleseth is at "..YELLOW.."[1]"..WHITE..".\n\nThe prequest line starts at the same NPC."
Inst70Quest1_HORDE_Prequest = "War is Hell -> Report to Anselm"
Inst70Quest1_HORDE_Folgequest = "None"
--
Inst70Quest1name1_HORDE = "Wraps of the San'layn"
Inst70Quest1name2_HORDE = "Vendetta Bindings"
Inst70Quest1name3_HORDE = "Runecaster's Bracers"
Inst70Quest1name4_HORDE = "Vambraces of the Vengeance Bringer"

--Quest 2 Horde
Inst70Quest2_HORDE = "2. Ingvar Must Die!"
Inst70Quest2_HORDE_Level = "71"
Inst70Quest2_HORDE_Attain = "70"
Inst70Quest2_HORDE_Aim = "Dark Ranger Marrah has asked you to kill Ingvar the Plunderer in Utgarde Keep, then bring his head to High Executor Anselm at Vengeance Landing."
Inst70Quest2_HORDE_Location = "Dark Ranger Marrah (Utgarde Keep; "..YELLOW.."[A] Entrance"..WHITE..")"
Inst70Quest2_HORDE_Note = "Dark Ranger Marrah will appear just inside the portal a few seconds after you enter the instance.\n\nIngvar the Plunderer is at "..YELLOW.."[3]"..WHITE..".\n\nThe quest turns in to High Executor Anselm at (Howling Fjord - Vengeance Landing; "..YELLOW.."78.5, 31.1"..WHITE..")."
Inst70Quest2_HORDE_Prequest = "None"
Inst70Quest2_HORDE_Folgequest = "None"
--
Inst70Quest2name1_HORDE = "Executioner's Band"
Inst70Quest2name2_HORDE = "Ring of Decimation"
Inst70Quest2name3_HORDE = "Signet of Swift Judgment"

--Quest 3 Horde
Inst70Quest3_HORDE = "3. Disarmament"
Inst70Quest3_HORDE_Level = "71"
Inst70Quest3_HORDE_Attain = "70"
Inst70Quest3_HORDE_Aim = "Dark Ranger Marrah wants you to steal 5 Vrykul Weapons from Utgarde Keep and bring them to High Executor Anselm in Vengeance Landing."
Inst70Quest3_HORDE_Location = "Dark Ranger Marrah (Utgarde Keep; "..YELLOW.."[A] Entrance"..WHITE..")"
Inst70Quest3_HORDE_Note = "Dark Ranger Marrah will appear just inside the portal a few seconds after you enter the instance.\n\nThe Vrykul Weapons can be found along walls scattered around the instance.\n\nThe quest turns in to High Executor Anselm at (Howling Fjord - Vengeance Landing; "..YELLOW.."78.5, 31.1"..WHITE..")."
Inst70Quest3_HORDE_Prequest = "None"
Inst70Quest3_HORDE_Folgequest = "None"
--
Inst70Quest3name1_HORDE = "Necklace of Calm Skies"
Inst70Quest3name2_HORDE = "Hundred Tooth Necklace"
Inst70Quest3name3_HORDE = "Amulet of Constrained Power"
Inst70Quest3name4_HORDE = "Tiled-Stone Pendant"



--------------- INST71 - Utgarde Keep: Utgarde Pinnacle ---------------

Inst71Story = "Among the cliffs of the Daggercap Bay in the Howling Fjord stands Utgarde Keep, an impervious fortress occupied by the savage and enigmatic vrykul. With mysterious, foul magic and proto-dragons at their command, the vrykul of Utgarde Keep pose an imminent threat to both the Alliance and the Horde. Only the bravest would dare to strike against Ymiron's faithful and delve into the heart of the vrykul's primeval home."
Inst71Caption = "Utgarde Pinnacle"
Inst71QAA = "2 Quests"
Inst71QAH = "2 Quests"

--Quest 1 Alliance
Inst71Quest1 = "1. Junk in My Trunk"
Inst71Quest1_Level = "80"
Inst71Quest1_Attain = "78"
Inst71Quest1_Aim = "Brigg in Utgarde Pinnacle wants you to find 5 Untarnished Silver Bars, 3 Shiny Baubles, 2 Golden Goblets, and a Jade Statue."
Inst71Quest1_Location = "Brigg Smallshanks (Utgarde Pinnacle; "..YELLOW.."[A]"..WHITE..")"
Inst71Quest1_Note = "The items can be found scattered around the instance, usually laying on the ground. The Shiny Baubles are not the same that are used as fishing lures."
Inst71Quest1_Prequest = "None"
Inst71Quest1_Folgequest = "None"
--
Inst71Quest1name1 = "Bauble-Woven Gown"
Inst71Quest1name2 = "Exotic Leather Tunic"
Inst71Quest1name3 = "Silver-Plated Battlechest"
Inst71Quest1name4 = "Gilded Ringmail Hauberk"

--Quest 2 Alliance
Inst71Quest2 = "2. Vengeance Be Mine!"
Inst71Quest2_Level = "80"
Inst71Quest2_Attain = "78"
Inst71Quest2_Aim = "Brigg in Utgarde Pinnacle wants you to kill King Ymiron."
Inst71Quest2_Location = "Brigg Smallshanks (Utgarde Pinnacle; "..YELLOW.."[A]"..WHITE..")"
Inst71Quest2_Note = "King Ymiron is at "..YELLOW.."[4]"..WHITE.."."
Inst71Quest2_Prequest = "None"
Inst71Quest2_Folgequest = "None"
--
Inst71Quest2name1 = "Cowl of the Vindictive Captain"
Inst71Quest2name2 = "Headguard of Retaliation"
Inst71Quest2name3 = "Helmet of Just Retribution"
Inst71Quest2name4 = "Faceguard of Punishment"
Inst71Quest2name5 = "Platehelm of Irate Revenge"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst71Quest1_HORDE = Inst71Quest1
Inst71Quest1_HORDE_Level = Inst71Quest1_Level
Inst71Quest1_HORDE_Attain = Inst71Quest1_Attain
Inst71Quest1_HORDE_Aim = Inst71Quest1_Aim
Inst71Quest1_HORDE_Location = Inst71Quest1_Location
Inst71Quest1_HORDE_Note = Inst71Quest1_Note
Inst71Quest1_HORDE_Prequest = Inst71Quest1_Prequest
Inst71Quest1_HORDE_Folgequest = Inst71Quest1_Folgequest
--
Inst71Quest1name1_HORDE = Inst71Quest1name1
Inst71Quest1name2_HORDE = Inst71Quest1name2
Inst71Quest1name3_HORDE = Inst71Quest1name3
Inst71Quest1name4_HORDE = Inst71Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst71Quest2_HORDE = Inst71Quest2
Inst71Quest2_HORDE_Level = Inst71Quest2_Level
Inst71Quest2_HORDE_Attain = Inst71Quest2_Attain
Inst71Quest2_HORDE_Aim = Inst71Quest2_Aim
Inst71Quest2_HORDE_Location = Inst71Quest2_Location
Inst71Quest2_HORDE_Note = Inst71Quest2_Note
Inst71Quest2_HORDE_Prequest = Inst71Quest2_Prequest
Inst71Quest2_HORDE_Folgequest = Inst71Quest2_Folgequest
--
Inst71Quest2name1_HORDE = Inst71Quest2name1
Inst71Quest2name2_HORDE = Inst71Quest2name2
Inst71Quest2name3_HORDE = Inst71Quest2name3
Inst71Quest2name4_HORDE = Inst71Quest2name4
Inst71Quest2name5_HORDE = Inst71Quest2name5



--------------- INST72 - The Nexus: The Nexus ---------------

Inst72Story = "The blue Dragon Aspect, Malygos, has created rifts with his manipulation of raw magical power: tears in the very fabric of the magical dimension. The Kirin Tor, the elite magi of Dalaran, have formed a council with the red dragonflight, who are charged with the preservation of life. To this end, the two groups have begun actively subverting Malygos's devastating campaign. The sides have been chosen; the battle lines have been drawn. The only question that remains now is...Who will win."
Inst72Caption = "The Nexus: The Nexus"
Inst72QAA = "4 Quests"
Inst72QAH = "4 Quests"

--Quest 1 Alliance
Inst72Quest1 = "1. Have They No Shame?"
Inst72Quest1_Level = "71"
Inst72Quest1_Attain = "70"
Inst72Quest1_Aim = "Librarian Serrah wants you to enter the Nexus and recover Berinand's Research."
Inst72Quest1_Location = "Librarian Serrah (Borean Tundra - Transitus Shield; "..YELLOW.."33.4, 34.3"..WHITE..")"
Inst72Quest1_Note = "The Research Book is on the ground in the hall with the frozen NPCs at "..YELLOW.."[4]"..WHITE.."."
Inst72Quest1_Prequest = "None"
Inst72Quest1_Folgequest = "None"
--
Inst72Quest1name1 = "Shoulders of the Northern Lights"
Inst72Quest1name2 = "Cured Mammoth Hide Mantle"
Inst72Quest1name3 = "Tundra Tracker's Shoulderguards"
Inst72Quest1name4 = "Tundra Pauldrons"

--Quest 2 Alliance
Inst72Quest2 = "2. Postponing the Inevitable"
Inst72Quest2_Level = "71"
Inst72Quest2_Attain = "70"
Inst72Quest2_Aim = "Archmage Berinand in the Transitus Shield wants you to use the Interdimensional Refabricator near the rift in the Nexus."
Inst72Quest2_Location = "Archmage Berinand (Borean Tundra - Transitus Shield; "..YELLOW.."32.9, 34.3"..WHITE..")"
Inst72Quest2_Note = "Use the Interdimensional Refabricator on the edge of the platform where Anomalus is, at "..YELLOW.."[2]"..WHITE.."."
Inst72Quest2_Prequest = "Reading the Meters"
Inst72Quest2_Folgequest = "None"
Inst72Quest2PreQuest = "true"
--
Inst72Quest2name1 = "Time-Twisted Wraps"
Inst72Quest2name2 = "Time-Stop Gloves"
Inst72Quest2name3 = "Bindings of Sabotage"
Inst72Quest2name4 = "Gauntlets of the Disturbed Giant"

--Quest 3 Alliance
Inst72Quest3 = "3. Prisoner of War"
Inst72Quest3_Level = "71"
Inst72Quest3_Attain = "70"
Inst72Quest3_Aim = "Raelorasz at the Transitus Shield wants you to enter the Nexus and release Keristrasza."
Inst72Quest3_Location = "Raelorasz (Borean Tundra - Transitus Shield; "..YELLOW.."33.2, 34.4"..WHITE..")"
Inst72Quest3_Note = "Keristrasza is at "..YELLOW.."[5]"..WHITE.."."
Inst72Quest3_Prequest = "Keristrasza -> Springing the Trap"
Inst72Quest3_Folgequest = "None"
Inst72Quest3PreQuest = "true"
--
Inst72Quest3name1 = "Cloak of Azure Lights"
Inst72Quest3name2 = "Mantle of Keristrasza"
Inst72Quest3name3 = "Shroud of Fluid Strikes"

--Quest 4 Alliance
Inst72Quest4 = "4. Quickening"
Inst72Quest4_Level = "71"
Inst72Quest4_Attain = "70"
Inst72Quest4_Aim = "Archmage Berinand in the Transitus Shield wants you to enter the Nexus and collect 5 Arcane Splinters from Crystalline Protectors."
Inst72Quest4_Location = "Archmage Berinand (Borean Tundra - Transitus Shield; "..YELLOW.."32.9, 34.3"..WHITE..")"
Inst72Quest4_Note = "Crystalline Protectors drop the Arcane Splinters. They are found on the way to Ormorok the Tree-Shaper."
Inst72Quest4_Prequest = "Secrets of the Ancients"
Inst72Quest4_Folgequest = "None"
Inst72Quest4PreQuest = "true"
--
Inst72Quest4name1 = "Sandals of Mystical Evolution"
Inst72Quest4name2 = "Treads of Torn Future"
Inst72Quest4name3 = "Spiked Treads of Mutation"
Inst72Quest4name4 = "Invigorating Sabatons"
Inst72Quest4name5 = "Boots of the Unbowed Protector"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst72Quest1_HORDE = Inst72Quest1
Inst72Quest1_HORDE_Level = Inst72Quest1_Level
Inst72Quest1_HORDE_Attain = Inst72Quest1_Attain
Inst72Quest1_HORDE_Aim = Inst72Quest1_Aim
Inst72Quest1_HORDE_Location = Inst72Quest1_Location
Inst72Quest1_HORDE_Note = Inst72Quest1_Note
Inst72Quest1_HORDE_Prequest = Inst72Quest1_Prequest
Inst72Quest1_HORDE_Folgequest = Inst72Quest1_Folgequest
--
Inst72Quest1name1_HORDE = Inst72Quest1name1
Inst72Quest1name2_HORDE = Inst72Quest1name2
Inst72Quest1name3_HORDE = Inst72Quest1name3
Inst72Quest1name4_HORDE = Inst72Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst72Quest2_HORDE = Inst72Quest2
Inst72Quest2_HORDE_Level = Inst72Quest2_Level
Inst72Quest2_HORDE_Attain = Inst72Quest2_Attain
Inst72Quest2_HORDE_Aim = Inst72Quest2_Aim
Inst72Quest2_HORDE_Location = Inst72Quest2_Location
Inst72Quest2_HORDE_Note = Inst72Quest2_Note
Inst72Quest2_HORDE_Prequest = Inst72Quest2_Prequest
Inst72Quest2_HORDE_Folgequest = Inst72Quest2_Folgequest
Inst72Quest2PreQuest_HORDE = Inst72Quest2PreQuest
--
Inst72Quest2name1_HORDE = Inst72Quest2name1
Inst72Quest2name2_HORDE = Inst72Quest2name2
Inst72Quest2name3_HORDE = Inst72Quest2name3
Inst72Quest2name4_HORDE = Inst72Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst72Quest3_HORDE = Inst72Quest3
Inst72Quest3_HORDE_Level = Inst72Quest3_Level
Inst72Quest3_HORDE_Attain = Inst72Quest3_Attain
Inst72Quest3_HORDE_Aim = Inst72Quest3_Aim
Inst72Quest3_HORDE_Location = Inst72Quest3_Location
Inst72Quest3_HORDE_Note = Inst72Quest3_Note
Inst72Quest3_HORDE_Prequest = Inst72Quest3_Prequest
Inst72Quest3_HORDE_Folgequest = Inst72Quest3_Folgequest
Inst72Quest3PreQuest_HORDE = Inst72Quest3PreQuest
--
Inst72Quest3name1_HORDE = Inst72Quest3name1
Inst72Quest3name2_HORDE = Inst72Quest3name2
Inst72Quest3name3_HORDE = Inst72Quest3name3

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst72Quest4_HORDE = Inst72Quest4
Inst72Quest4_HORDE_Level = Inst72Quest4_Level
Inst72Quest4_HORDE_Attain = Inst72Quest4_Attain
Inst72Quest4_HORDE_Aim = Inst72Quest4_Aim
Inst72Quest4_HORDE_Location = Inst72Quest4_Location
Inst72Quest4_HORDE_Note = Inst72Quest4_Note
Inst72Quest4_HORDE_Prequest = Inst72Quest4_Prequest
Inst72Quest4_HORDE_Folgequest = Inst72Quest4_Folgequest
Inst72Quest4PreQuest_HORDE = Inst72Quest4PreQuest
--
Inst72Quest4name1_HORDE = Inst72Quest4name1
Inst72Quest4name2_HORDE = Inst72Quest4name2
Inst72Quest4name3_HORDE = Inst72Quest4name3
Inst72Quest4name4_HORDE = Inst72Quest4name4
Inst72Quest4name5_HORDE = Inst72Quest4name5



--------------- INST73 - The Nexus: The Oculus ---------------

Inst73Story = "The blue Dragon Aspect, Malygos, has created rifts with his manipulation of raw magical power: tears in the very fabric of the magical dimension. The Kirin Tor, the elite magi of Dalaran, have formed a council with the red dragonflight, who are charged with the preservation of life. To this end, the two groups have begun actively subverting Malygos's devastating campaign. The sides have been chosen; the battle lines have been drawn. The only question that remains now is...Who will win."
Inst73Caption = "The Nexus: The Oculus"
Inst73QAA = "4 Quests"
Inst73QAH = "4 Quests"

--Quest 1 Alliance
Inst73Quest1 = "1. The Struggle Persists"
Inst73Quest1_Level = "80"
Inst73Quest1_Attain = "77"
Inst73Quest1_Aim = "Raelorasz wants you to enter the Oculus and rescue Belgaristrasz and his companions."
Inst73Quest1_Location = "Raelorasz (Borean Tundra - Transitus Shield; "..YELLOW.."33.2, 34.4"..WHITE..")"
Inst73Quest1_Note = "Belgaristrasz is released from his cage after you defeat Drakos the Interrogator at "..YELLOW.."[1]"..WHITE.."."
Inst73Quest1_Prequest = "None"
Inst73Quest1_Folgequest = "A Unified Front"
--
Inst73Quest1name1 = "Ring of Temerity"
Inst73Quest1name2 = "Flourishing Band"
Inst73Quest1name3 = "Band of Motivation"
Inst73Quest1name4 = "Staunch Signet"

--Quest 2 Alliance
Inst73Quest2 = "2. A Unified Front"
Inst73Quest2_Level = "80"
Inst73Quest2_Attain = "77"
Inst73Quest2_Aim = "Belgaristrasz wants you to destroy 10 Centrifuge Constructs to bring down Varos' shield. You then must defeat Varos Cloudstrider."
Inst73Quest2_Location = "Belgaristrasz (The Nexus: The Oculus; "..YELLOW.."[1]"..WHITE..")"
Inst73Quest2_Note = "Belgaristrasz will appear after you defeat Varos Cloudstrider at "..YELLOW.."[2]"..WHITE.."."
Inst73Quest2_Prequest = "The Struggle Persists"
Inst73Quest2_Folgequest = "Mage-Lord Urom"
Inst73Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst73Quest3 = "3. Mage-Lord Urom"
Inst73Quest3_Level = "80"
Inst73Quest3_Attain = "77"
Inst73Quest3_Aim = "Belgaristrasz wants you to defeat Mage-Lord Urom in the Oculus."
Inst73Quest3_Location = "Image of Belgaristrasz (The Nexus: The Oculus; "..YELLOW.."[2]"..WHITE..")"
Inst73Quest3_Note = "Belgaristrasz will appear after you defeat Mage-Lord Urom at "..YELLOW.."[3]"..WHITE.."."
Inst73Quest3_Prequest = "A Unified Front"
Inst73Quest3_Folgequest = "A Wing and a Prayer"
Inst73Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst73Quest4 = "4. A Wing and a Prayer"
Inst73Quest4_Level = "80"
Inst73Quest4_Attain = "77"
Inst73Quest4_Aim = "Belgaristrasz wants you to kill Eregos in the Oculus and then report to Raelorasz at the Transitus Shield in Coldarra."
Inst73Quest4_Location = "Image of Belgaristrasz (The Nexus: The Oculus; "..YELLOW.."[3]"..WHITE..")"
Inst73Quest4_Note = "Ley-Guardian Eregos is at "..YELLOW.."[4]"..WHITE..". Raelorasz is at (Borean Tundra - Transitus Shield; "..YELLOW.."33.2, 34.4"..WHITE..")."
Inst73Quest4_Prequest = "Mage-Lord Urom"
Inst73Quest4_Folgequest = "None"
Inst73Quest4FQuest = "true"
--
Inst73Quest4name1 = "Cuffs of Gratitude"
Inst73Quest4name2 = "Soaring Wristwraps"
Inst73Quest4name3 = "Bindings of Raelorasz"
Inst73Quest4name4 = "Bracers of Reverence"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst73Quest1_HORDE = Inst73Quest1
Inst73Quest1_HORDE_Level = Inst73Quest1_Level
Inst73Quest1_HORDE_Attain = Inst73Quest1_Attain
Inst73Quest1_HORDE_Aim = Inst73Quest1_Aim
Inst73Quest1_HORDE_Location = Inst73Quest1_Location
Inst73Quest1_HORDE_Note = Inst73Quest1_Note
Inst73Quest1_HORDE_Prequest = Inst73Quest1_Prequest
Inst73Quest1_HORDE_Folgequest = Inst73Quest1_Folgequest
--
Inst73Quest1name1_HORDE = Inst73Quest1name1
Inst73Quest1name2_HORDE = Inst73Quest1name2
Inst73Quest1name3_HORDE = Inst73Quest1name3
Inst73Quest1name4_HORDE = Inst73Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst73Quest2_HORDE = Inst73Quest2
Inst73Quest2_HORDE_Level = Inst73Quest2_Level
Inst73Quest2_HORDE_Attain = Inst73Quest2_Attain
Inst73Quest2_HORDE_Aim = Inst73Quest2_Aim
Inst73Quest2_HORDE_Location = Inst73Quest2_Location
Inst73Quest2_HORDE_Note = Inst73Quest2_Note
Inst73Quest2_HORDE_Prequest = Inst73Quest2_Prequest
Inst73Quest2_HORDE_Folgequest = Inst73Quest2_Folgequest
Inst73Quest2FQuest_HORDE = Inst73Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst73Quest3_HORDE = Inst73Quest3
Inst73Quest3_HORDE_Level = Inst73Quest3_Level
Inst73Quest3_HORDE_Attain = Inst73Quest3_Attain
Inst73Quest3_HORDE_Aim = Inst73Quest3_Aim
Inst73Quest3_HORDE_Location = Inst73Quest3_Location
Inst73Quest3_HORDE_Note = Inst73Quest3_Note
Inst73Quest3_HORDE_Prequest = Inst73Quest3_Prequest
Inst73Quest3_HORDE_Folgequest = Inst73Quest3_Folgequest
Inst73Quest3FQuest_HORDE = Inst73Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst73Quest4_HORDE = Inst73Quest4
Inst73Quest4_HORDE_Level = Inst73Quest4_Level
Inst73Quest4_HORDE_Attain = Inst73Quest4_Attain
Inst73Quest4_HORDE_Aim = Inst73Quest4_Aim
Inst73Quest4_HORDE_Location = Inst73Quest4_Location
Inst73Quest4_HORDE_Note = Inst73Quest4_Note
Inst73Quest4_HORDE_Prequest = Inst73Quest4_Prequest
Inst73Quest4_HORDE_Folgequest = Inst73Quest4_Folgequest
Inst73Quest4FQuest_HORDE = Inst73Quest4FQuest
--
Inst73Quest4name1_HORDE = Inst73Quest4name1
Inst73Quest4name2_HORDE = Inst73Quest4name2
Inst73Quest4name3_HORDE = Inst73Quest4name3
Inst73Quest4name4_HORDE = Inst73Quest4name4



--------------- INST74 - The Nexus: The Eye of Eternity ---------------

Inst74Story = "From within the safety of his personal domain, the Eye of Eternity, Malygos coordinates a crusade to reestablish his dominance over the arcane energies coursing through Azeroth. In his eyes, the foolish actions of the Kirin Tor and other mortal magi have plunged the world into chaos, and the abuse of their powers will no longer be tolerated. Threatened by the Spell-Weaver's brutal tactics, the Kirin Tor has allied itself with the red dragonflight. Together, the two groups closely observe Malygos, searching for a way to thwart his campaign and strike out at the Aspect of Magic, but thus far the elusive Spell-Weaver has proven difficult to engage.\n\nAt Wyrmrest Temple, the ancient meeting ground of the dragonflights, Alexstrasza and the ambassadors of other flights have discussed Malygos' recklessness and reluctantly concluded that he is beyond the point of salvation. With the red dragons' assistance, Azeroth's heroes may be able to accomplish what has formerly been unthinkable: challenging the Spell-Weaver from inside the Eye of Eternity. Sustaining the safety of Azeroth depends on Malygos' defeat, but his end will also herald a new age: a world of unguarded magic, absent of the Dragon Aspect powerful enough to watch over it."
Inst74Caption = "The Nexus: The Eye of Eternity"
Inst74QAA = "3 Quests"
Inst74QAH = "3 Quests"

--Quest 1 Alliance
Inst74Quest1 = "1. Judgment at the Eye of Eternity"
Inst74Quest1_Level = "80"
Inst74Quest1_Attain = "80"
Inst74Quest1_Aim = "Krasus atop Wyrmrest Temple in the Dragonblight wants you to return with the Heart of Magic."
Inst74Quest1_Location = "Krasus (Dragonblight - Wyrmrest Temple; "..YELLOW.."59.8, 54.6"..WHITE..")"
Inst74Quest1_Note = "After Malygos dies, his Heart of Magic can be found in a Red Heart floating near Alexstrasza's Gift."
Inst74Quest1_Prequest = "The Key to the Focusing Iris ("..YELLOW.."Naxxramas"..WHITE..")"
Inst74Quest1_Folgequest = "None"
Inst74Quest1PreQuest = "true"
--
Inst74Quest1name1 = "Chain of the Ancient Wyrm"
Inst74Quest1name2 = "Torque of the Red Dragonflight"
Inst74Quest1name3 = "Pendant of the Dragonsworn"
Inst74Quest1name4 = "Drakescale Collar"

--Quest 2 Alliance
Inst74Quest2 = "2. Heroic Judgment at the Eye of Eternity (Heroic)"
Inst74Quest2_Level = "80"
Inst74Quest2_Attain = "80"
Inst74Quest2_Aim = "Krasus atop Wyrmrest Temple in the Dragonblight wants you to return with the Heart of Magic."
Inst74Quest2_Location = "Krasus (Dragonblight - Wyrmrest Temple; "..YELLOW.."59.8, 54.6"..WHITE..")"
Inst74Quest2_Note = "After Malygos dies, his Heart of Magic can be found in a Red Heart floating near Alexstrasza's Gift."
Inst74Quest2_Prequest = "The Heroic Key to the Focusing Iris ("..YELLOW.."Naxxramas"..WHITE..")"
Inst74Quest2_Folgequest = "None"
Inst74Quest2PreQuest = "true"
--
Inst74Quest2name1 = "Wyrmrest Necklace of Power"
Inst74Quest2name2 = "Life-Binder's Locket"
Inst74Quest2name3 = "Favor of the Dragon Queen"
Inst74Quest2name4 = "Nexus War Champion Beads"

--Quest 3 Alliance
Inst74Quest3 = "3. Malygos Must Die! (Weekly)"
Inst74Quest3_Level = "80"
Inst74Quest3_Attain = "80"
Inst74Quest3_Aim = "Kill Malygos."
Inst74Quest3_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst74Quest3_Note = "Malygos is at "..YELLOW.." [1]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst74Quest3_Prequest = "None"
Inst74Quest3_Folgequest = "None"
--
Inst74Quest3name1 = "Emblem of Frost"
Inst74Quest3name2 = "Emblem of Triumph"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst74Quest1_HORDE = Inst74Quest1
Inst74Quest1_HORDE_Level = Inst74Quest1_Level
Inst74Quest1_HORDE_Attain = Inst74Quest1_Attain
Inst74Quest1_HORDE_Aim = Inst74Quest1_Aim
Inst74Quest1_HORDE_Location = Inst74Quest1_Location
Inst74Quest1_HORDE_Note = Inst74Quest1_Note
Inst74Quest1_HORDE_Prequest = Inst74Quest1_Prequest
Inst74Quest1_HORDE_Folgequest = Inst74Quest1_Folgequest
Inst74Quest1PreQuest_HORDE = Inst74Quest1PreQuest
--
Inst74Quest1name1_HORDE = Inst74Quest1name1
Inst74Quest1name2_HORDE = Inst74Quest1name2
Inst74Quest1name3_HORDE = Inst74Quest1name3
Inst74Quest1name4_HORDE = Inst74Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst74Quest2_HORDE = Inst74Quest2
Inst74Quest2_HORDE_Level = Inst74Quest2_Level
Inst74Quest2_HORDE_Attain = Inst74Quest2_Attain
Inst74Quest2_HORDE_Aim = Inst74Quest2_Aim
Inst74Quest2_HORDE_Location = Inst74Quest2_Location
Inst74Quest2_HORDE_Note = Inst74Quest2_Note
Inst74Quest2_HORDE_Prequest = Inst74Quest2_Prequest
Inst74Quest2_HORDE_Folgequest = Inst74Quest2_Folgequest
Inst74Quest2PreQuest_HORDE = Inst74Quest2PreQuest
--
Inst74Quest2name1_HORDE = Inst74Quest2name1
Inst74Quest2name2_HORDE = Inst74Quest2name2
Inst74Quest2name3_HORDE = Inst74Quest2name3
Inst74Quest2name4_HORDE = Inst74Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst74Quest3_HORDE = Inst74Quest3
Inst74Quest3_HORDE_Level = Inst74Quest3_Level
Inst74Quest3_HORDE_Attain = Inst74Quest3_Attain
Inst74Quest3_HORDE_Aim = Inst74Quest3_Aim
Inst74Quest3_HORDE_Location = Inst74Quest3_Location
Inst74Quest3_HORDE_Note = Inst74Quest3_Note
Inst74Quest3_HORDE_Prequest = Inst74Quest3_Prequest
Inst74Quest3_HORDE_Folgequest = Inst74Quest3_Folgequest
--
Inst74Quest3name1_HORDE = Inst74Quest3name1
Inst74Quest3name2_HORDE = Inst74Quest3name2



--------------- INST75 - Azjol-Nerub ---------------

Inst75Story = "Azjol-Nerub is a vast underground dungeon hub home to the arachnid-like nerubian. Located in icy Dragonblight, Azjol-Nerub can be divided into two sections: the Old Kingdom and the Upper Kingdom. Many of deepest areas in Azjol-Nerub are held by faceless ones.\n\nAzjol-Nerub: The Upper Kingdom is a mystery waiting to be explored. It once held a powerful and advanced civilization, and many of its treasures still rest here undamaged. Great riches litter the lower halls, not only gems and magic items but art and literature and scholarly tomes. The Scourge infest this place. Forgotten ones seethe below, eager to return to the world above.\n\n"..GREEN.."Quoted from WoWWiki"
Inst75Caption = "Azjol-Nerub"
Inst75QAA = "2 Quests"
Inst75QAH = "2 Quests"

--Quest 1 Alliance
Inst75Quest1 = "1. Don't Forget the Eggs!"
Inst75Quest1_Level = "74"
Inst75Quest1_Attain = "72"
Inst75Quest1_Aim = "Kilix the Unraveler in the Pit of Narjun wants you to enter Azjol-Nerub and destroy 6 Nerubian Scourge Eggs."
Inst75Quest1_Location = "Kilix the Unraveler (Dragonblight - Azjol-Nerub; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst75Quest1_Note = "The Nerubian Scourge Eggs are in the room of the first boss, Krik'thir the Gatewatcher at "..YELLOW.."[1]"..WHITE.."."
Inst75Quest1_Prequest = "None"
Inst75Quest1_Folgequest = "None"
--
Inst75Quest1name1 = "Expelling Gauntlets"
Inst75Quest1name2 = "Purging Handguards"
Inst75Quest1name3 = "Wraps of Quelled Bane"
Inst75Quest1name4 = "Gloves of Banished Infliction"

--Quest 2 Alliance
Inst75Quest2 = "2. Death to the Traitor King"
Inst75Quest2_Level = "74"
Inst75Quest2_Attain = "72"
Inst75Quest2_Aim = "Kilix the Unraveler in the Pit of Narjun has tasked you with defeating Anub'arak in Azjol-Nerub. You are to return to Kilix with Anub'arak's Broken Husk."
Inst75Quest2_Location = "Kilix the Unraveler (Dragonblight - Azjol-Nerub; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst75Quest2_Note = "Anub'arak is at "..YELLOW.."[3]"..WHITE.."."
Inst75Quest2_Prequest = "None"
Inst75Quest2_Folgequest = "None"
--
Inst75Quest2name1 = "Kilix's Silk Slippers"
Inst75Quest2name2 = "Don Soto's Boots"
Inst75Quest2name3 = "Husk Shard Sabatons"
Inst75Quest2name4 = "Greaves of the Traitor"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst75Quest1_HORDE = Inst75Quest1
Inst75Quest1_HORDE_Level = Inst75Quest1_Level
Inst75Quest1_HORDE_Attain = Inst75Quest1_Attain
Inst75Quest1_HORDE_Aim = Inst75Quest1_Aim
Inst75Quest1_HORDE_Location = Inst75Quest1_Location
Inst75Quest1_HORDE_Note = Inst75Quest1_Note
Inst75Quest1_HORDE_Prequest = Inst75Quest1_Prequest
Inst75Quest1_HORDE_Folgequest = Inst75Quest1_Folgequest
--
Inst75Quest1name1_HORDE = Inst75Quest1name1
Inst75Quest1name2_HORDE = Inst75Quest1name2
Inst75Quest1name3_HORDE = Inst75Quest1name3
Inst75Quest1name4_HORDE = Inst75Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst75Quest2_HORDE = Inst75Quest2
Inst75Quest2_HORDE_Level = Inst75Quest2_Level
Inst75Quest2_HORDE_Attain = Inst75Quest2_Attain
Inst75Quest2_HORDE_Aim = Inst75Quest2_Aim
Inst75Quest2_HORDE_Location = Inst75Quest2_Location
Inst75Quest2_HORDE_Note = Inst75Quest2_Note
Inst75Quest2_HORDE_Prequest = Inst75Quest2_Prequest
Inst75Quest2_HORDE_Folgequest = Inst75Quest2_Folgequest
--
Inst75Quest2name1_HORDE = Inst75Quest2name1
Inst75Quest2name2_HORDE = Inst75Quest2name2
Inst75Quest2name3_HORDE = Inst75Quest2name3
Inst75Quest2name4_HORDE = Inst75Quest2name4



--------------- INST76 - Ahn'kahet: The Old Kingdom ---------------

Inst76Story = "Azjol-Nerub is a vast underground dungeon hub home to the arachnid-like nerubian. Located in icy Dragonblight, Azjol-Nerub can be divided into two sections: the Old Kingdom and the Upper Kingdom. Many of deepest areas in Azjol-Nerub are held by faceless ones.\n\nAhn'kahet: The Old Kingdom is the second dungeon located within Azjol-Nerub and is controlled by nerubians.\n\n"..GREEN.."Quoted from WoWWiki"
Inst76Caption = "Ahn'kahet: The Old Kingdom"
Inst76QAA = "3 Quests"
Inst76QAH = "3 Quests"

--Quest 1 Alliance
Inst76Quest1 = "1. All Things in Good Time (Heroic Daily)"
Inst76Quest1_Level = "80"
Inst76Quest1_Attain = "80"
Inst76Quest1_Aim = "Kilix the Unraveler in the Pit of Narjun wants you to obtain an Ahn'kahar Watcher's Corpse and place it upon the Ahn'kahet Brazier in Ahn'kahet."
Inst76Quest1_Location = "Kilix the Unraveler (Dragonblight - Azjol-Nerub; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst76Quest1_Note = "This daily quest can only be completed on Heroic difficulty.\n\nThe Ahn'kahet Brazier is behind Herald Volazj at "..YELLOW.."[6]"..WHITE..". The corpse has a 1 hour duration timer and will disappear if you leave the instance while alive."
Inst76Quest1_Prequest = "None"
Inst76Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst76Quest2 = "2. Funky Fungi"
Inst76Quest2_Level = "76"
Inst76Quest2_Attain = "73"
Inst76Quest2_Aim = "You are to collect 6 Grotesque Fungus from Savage Cave Beasts in Ahn'kahet and deliver them to Kilix the Unraveler in The Pit of Narjun."
Inst76Quest2_Location = "Ooze-covered Fungus (drops from Savage Cave Beasts in Ahn'kahet)"
Inst76Quest2_Note = "The Savage Cave Beasts that drop the items for the quest are in the area of the heroic-only boss, Amanitar, at "..YELLOW.."[3]"..WHITE..".\n\nKilix the Unraveler is at (Dragonblight - Azjol-Nerub; "..YELLOW.."26.1, 50.0"..WHITE..")."
Inst76Quest2_Prequest = "None"
Inst76Quest2_Folgequest = "None"
-- No Rewards for this quest

--Quest 3 Alliance
Inst76Quest3 = "3. The Faceless Ones"
Inst76Quest3_Level = "76"
Inst76Quest3_Attain = "73"
Inst76Quest3_Aim = "Kilix the Unraveler in the Pit of Narjun wants you to kill Herald Volazj and the three Forgotten Ones that accompany him in Ahn'Kahet."
Inst76Quest3_Location = "Kilix the Unraveler (Dragonblight - Azjol-Nerub; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst76Quest3_Note = "The Forgotten Ones and Herald Volazj can be found at "..YELLOW.."[5]"..WHITE.."."
Inst76Quest3_Prequest = "None"
Inst76Quest3_Folgequest = "None"
--
Inst76Quest3name1 = "Mantle of Thwarted Evil"
Inst76Quest3name2 = "Shoulderpads of Abhorrence"
Inst76Quest3name3 = "Shoulderplates of the Abolished"
Inst76Quest3name4 = "Epaulets of the Faceless Ones"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst76Quest1_HORDE = Inst76Quest1
Inst76Quest1_HORDE_Level = Inst76Quest1_Level
Inst76Quest1_HORDE_Attain = Inst76Quest1_Attain
Inst76Quest1_HORDE_Aim = Inst76Quest1_Aim
Inst76Quest1_HORDE_Location = Inst76Quest1_Location
Inst76Quest1_HORDE_Note = Inst76Quest1_Note
Inst76Quest1_HORDE_Prequest = Inst76Quest1_Prequest
Inst76Quest1_HORDE_Folgequest = Inst76Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst76Quest2_HORDE = Inst76Quest2
Inst76Quest2_HORDE_Level = Inst76Quest2_Level
Inst76Quest2_HORDE_Attain = Inst76Quest2_Attain
Inst76Quest2_HORDE_Aim = Inst76Quest2_Aim
Inst76Quest2_HORDE_Location = Inst76Quest2_Location
Inst76Quest2_HORDE_Note = Inst76Quest2_Note
Inst76Quest2_HORDE_Prequest = Inst76Quest2_Prequest
Inst76Quest2_HORDE_Folgequest = Inst76Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst76Quest3_HORDE = Inst76Quest3
Inst76Quest3_HORDE_Level = Inst76Quest3_Level
Inst76Quest3_HORDE_Attain = Inst76Quest3_Attain
Inst76Quest3_HORDE_Aim = Inst76Quest3_Aim
Inst76Quest3_HORDE_Location = Inst76Quest3_Location
Inst76Quest3_HORDE_Note = Inst76Quest3_Note
Inst76Quest3_HORDE_Prequest = Inst76Quest3_Prequest
Inst76Quest3_HORDE_Folgequest = Inst76Quest3_Folgequest
--
Inst76Quest3name1_HORDE = Inst76Quest3name1
Inst76Quest3name2_HORDE = Inst76Quest3name2
Inst76Quest3name3_HORDE = Inst76Quest3name3
Inst76Quest3name4_HORDE = Inst76Quest3name4



--------------- INST77 - Ulduar: Halls of Stone ---------------

Inst77Story = "In the frigid cliffs of the Storm Peaks, legendary explorer Brann Bronzebeard spent countless hours piecing together clues about a recently discovered titan city known as Ulduar. But far from unearthing the mysteries of the titans, the explorer found the city overrun with iron dwarves. Eager to save the priceless information within the titan city before it was destroyed and lost forever, Brann feared that an even greater evil could be at work behind the fall of Ulduar...."
Inst77Caption = "Ulduar: Halls of Stone"
Inst77QAA = "1 Quest"
Inst77QAH = "1 Quest"

--Quest 1 Alliance
Inst77Quest1 = "1. Halls of Stone"
Inst77Quest1_Level = "78"
Inst77Quest1_Attain = "76"
Inst77Quest1_Aim = "Brann Bronzebeard wants you to accompany him as he uncovers the secrets that lie in the Halls of Stone."
Inst77Quest1_Location = "Brann Bronzebeard (Ulduar: Halls of Stone; "..YELLOW.."[3]"..WHITE..")"
Inst77Quest1_Note = "Follow Brann Bronzebeard into the nearby chamber at "..YELLOW.."[4]"..WHITE.." and protect him from waves of mobs while he works on the stone tablets there. Upon his success, the Tribunal Chest next to the tablets can be opened.\n\nTalk to him again and he'll run to the door outside "..YELLOW.."[5]"..WHITE..". You do not need to follow him, he'll wait for you there. Once defeating Sjonnir the Ironshaper, the quest can be turned into Brahn Bronzebeard."
Inst77Quest1_Prequest = "None"
Inst77Quest1_Folgequest = "None"
--
Inst77Quest1name1 = "Mantle of the Intrepid Explorer"
Inst77Quest1name2 = "Shoulderpads of the Adventurer"
Inst77Quest1name3 = "Spaulders of Lost Secrets"
Inst77Quest1name4 = "Pauldrons of Reconnaissance"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst77Quest1_HORDE = Inst77Quest1
Inst77Quest1_HORDE_Level = Inst77Quest1_Level
Inst77Quest1_HORDE_Attain = Inst77Quest1_Attain
Inst77Quest1_HORDE_Aim = Inst77Quest1_Aim
Inst77Quest1_HORDE_Location = Inst77Quest1_Location
Inst77Quest1_HORDE_Note = Inst77Quest1_Note
Inst77Quest1_HORDE_Prequest = Inst77Quest1_Prequest
Inst77Quest1_HORDE_Folgequest = Inst77Quest1_Folgequest
--
Inst77Quest1name1_HORDE = Inst77Quest1name1
Inst77Quest1name2_HORDE = Inst77Quest1name2
Inst77Quest1name3_HORDE = Inst77Quest1name3
Inst77Quest1name4_HORDE = Inst77Quest1name4



--------------- INST78 - Ulduar: Halls of Lightning ---------------

Inst78Story = "In the frigid cliffs of the Storm Peaks, legendary explorer Brann Bronzebeard spent countless hours piecing together clues about a recently discovered titan city known as Ulduar. But far from unearthing the mysteries of the titans, the explorer found the city overrun with iron dwarves. Eager to save the priceless information within the titan city before it was destroyed and lost forever, Brann feared that an even greater evil could be at work behind the fall of Ulduar...."
Inst78Caption = "Ulduar: Halls of Lightning"
Inst78QAA = "2 Quests"
Inst78QAH = "2 Quests"

--Quest 1 Alliance
Inst78Quest1 = "1. Whatever it Takes!"
Inst78Quest1_Level = "80"
Inst78Quest1_Attain = "80"
Inst78Quest1_Aim = "King Jokkum in Dun Niffelem wants you to enter the Halls of Lightning and defeat Loken. You are then to return to King Jokkum with Loken's Tongue."
Inst78Quest1_Location = "King Jokkum (The Storm Peaks - Dun Niffelem; "..YELLOW.."65.3, 60.1"..WHITE..")"
Inst78Quest1_Note = "Loken is at "..YELLOW.."[4]"..WHITE..".\n\nThis quest becomes available after an extremely long questline that starts from Gretchen Fizzlespark (Storm Peaks - K3; "..YELLOW.."41.1, 86.1"..WHITE..")."
Inst78Quest1_Prequest = "They Took Our Men! -> The Reckoning"
Inst78Quest1_Folgequest = "None"
Inst78Quest1PreQuest = "true"
--
Inst78Quest1name1 = "Robes of Lightning"
Inst78Quest1name2 = "Hardened Tongue Tunic"
Inst78Quest1name3 = "Lightningbringer's Hauberk"
Inst78Quest1name4 = "Breastplate of Jagged Stone"

--Quest 2 Alliance
Inst78Quest2 = "2. Diametrically Opposed"
Inst78Quest2_Level = "80"
Inst78Quest2_Attain = "80"
Inst78Quest2_Aim = "King Jokkum at Dun Niffelem wants you to enter the Halls of Lightning and defeat Volkhan."
Inst78Quest2_Location = "King Jokkum (The Storm Peaks - Dun Niffelem; "..YELLOW.."65.3, 60.1"..WHITE..")"
Inst78Quest2_Note = "Volkhan is at "..YELLOW.."[2]"..WHITE..".\n\nThis quest becomes available after an extremely long questline that starts from Gretchen Fizzlespark (Storm Peaks - K3; "..YELLOW.."41.1, 86.1"..WHITE..")."
Inst78Quest2_Prequest = "They Took Our Men! -> The Reckoning"
Inst78Quest2_Folgequest = "None"
Inst78Quest2PreQuest = "true"
--
Inst78Quest2name1 = "Lightning Infused Mantle"
Inst78Quest2name2 = "Charred Leather Shoulderguards"
Inst78Quest2name3 = "Stormforged Shoulders"
Inst78Quest2name4 = "Pauldrons of Extinguished Hatred"
Inst78Quest2name5 = "Mantle of Volkhan"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst78Quest1_HORDE = Inst78Quest1
Inst78Quest1_HORDE_Level = Inst78Quest1_Level
Inst78Quest1_HORDE_Attain = Inst78Quest1_Attain
Inst78Quest1_HORDE_Aim = Inst78Quest1_Aim
Inst78Quest1_HORDE_Location = Inst78Quest1_Location
Inst78Quest1_HORDE_Note = Inst78Quest1_Note
Inst78Quest1_HORDE_Prequest = Inst78Quest1_Prequest
Inst78Quest1_HORDE_Folgequest = Inst78Quest1_Folgequest
Inst78Quest1PreQuest_HORDE = Inst78Quest1PreQuest
--
Inst78Quest1name1_HORDE = Inst78Quest1name1
Inst78Quest1name2_HORDE = Inst78Quest1name2
Inst78Quest1name3_HORDE = Inst78Quest1name3
Inst78Quest1name4_HORDE = Inst78Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst78Quest2_HORDE = Inst78Quest2
Inst78Quest2_HORDE_Level = Inst78Quest2_Level
Inst78Quest2_HORDE_Attain = Inst78Quest2_Attain
Inst78Quest2_HORDE_Aim = Inst78Quest2_Aim
Inst78Quest2_HORDE_Location = Inst78Quest2_Location
Inst78Quest2_HORDE_Note = Inst78Quest2_Note
Inst78Quest2_HORDE_Prequest = Inst78Quest2_Prequest
Inst78Quest2_HORDE_Folgequest = Inst78Quest2_Folgequest
Inst78Quest2PreQuest_HORDE = Inst78Quest2PreQuest
--
Inst78Quest2name1_HORDE = Inst78Quest2name1
Inst78Quest2name2_HORDE = Inst78Quest2name2
Inst78Quest2name3_HORDE = Inst78Quest2name3
Inst78Quest2name4_HORDE = Inst78Quest2name4
Inst78Quest2name5_HORDE = Inst78Quest2name5



--------------- INST79 - The Obsidian Sanctum ---------------

Inst79Story = "No information."
Inst79Caption = "The Obsidian Sanctum"
Inst79QAA = "1 Quest"
Inst79QAH = "1 Quest"

--Quest 1 Alliance
Inst79Quest1 = "1. Sartharion Must Die! (Weekly)"
Inst79Quest1_Level = "80"
Inst79Quest1_Attain = "80"
Inst79Quest1_Aim = "Kill Sartharion."
Inst79Quest1_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst79Quest1_Note = "Sartharion is at "..YELLOW.."[4]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst79Quest1_Prequest = "None"
Inst79Quest1_Folgequest = "None"
--
Inst79Quest1name1 = "Emblem of Frost"
Inst79Quest1name2 = "Emblem of Triumph"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst79Quest1_HORDE = Inst79Quest1
Inst79Quest1_HORDE_Level = Inst79Quest1_Level
Inst79Quest1_HORDE_Attain = Inst79Quest1_Attain
Inst79Quest1_HORDE_Aim = Inst79Quest1_Aim
Inst79Quest1_HORDE_Location = Inst79Quest1_Location
Inst79Quest1_HORDE_Note = Inst79Quest1_Note
Inst79Quest1_HORDE_Prequest = Inst79Quest1_Prequest
Inst79Quest1_HORDE_Folgequest = Inst79Quest1_Folgequest
--
Inst79Quest1name1_HORDE = Inst79Quest1name1
Inst79Quest1name2_HORDE = Inst79Quest1name2



--------------- INST80 - Drak'Tharon Keep ---------------

Inst80Story = "Drak'Tharon Keep is located in the icy northlands of Northrend, in the northwestern part of the Grizzly Hills, and is an ancient ice troll stronghold. The Scourge drove the trolls out and took possession, and now the Scourge has a solid garrison there holding the mountain passes. The strange dungeon is filled with dinosaurs and lizards, while teeming with undead. You are sent in to discover the reasoning behind why the trolls are leaving their home of Zul'Drak.\n\n"..GREEN.."Quoted from WoWWiki"
Inst80Caption = "Drak'Tharon Keep"
Inst80QAA = "3 Quests"
Inst80QAH = "3 Quests"

--Quest 1 Alliance
Inst80Quest1 = "1. Cleansing Drak'Tharon"
Inst80Quest1_Level = "75"
Inst80Quest1_Attain = "73"
Inst80Quest1_Aim = "Drakuru wants you to use Drakuru's Elixir at his brazier inside Drak'Tharon. Using Drakuru's Elixir there will require 5 Enduring Mojo."
Inst80Quest1_Location = "Image of Drakuru"
Inst80Quest1_Note = "Drakuru's Brazier is behind The Prophet Tharon'ja at "..YELLOW.."[6]"..WHITE..". Enduring Mojo drops inside Drak'Tharon Keep."
Inst80Quest1_Prequest = "Truce? -> Voices From the Dust"
Inst80Quest1_Folgequest = "None"
Inst80Quest1PreQuest = "true"
--
Inst80Quest1name1 = "Shroud of Temptation"
Inst80Quest1name2 = "Enticing Sabatons"
Inst80Quest1name3 = "Shackles of Dark Whispers"
Inst80Quest1name4 = "Shoulders of the Seducer"

--Quest 2 Alliance
Inst80Quest2 = "2. Search and Rescue"
Inst80Quest2_Level = "74"
Inst80Quest2_Attain = "73"
Inst80Quest2_Aim = "Mack at Granite Springs wants you to go into Drak'Tharon and find out what became of Kurzel."
Inst80Quest2_Location = "Mack Fearsen (Grizzly Hills - Granite Springs; "..YELLOW.."16.6, 48.1"..WHITE..")"
Inst80Quest2_Note = "Kurzel is one of the webbed victims at "..YELLOW.."[2]"..WHITE..". Attack the webbed victims until you find her."
Inst80Quest2_Prequest = "Seared Scourge"
Inst80Quest2_Folgequest = "Head Games"
Inst80Quest2PreQuest = "true"
--
Inst80Quest2name1 = "Kurzel's Angst"
Inst80Quest2name2 = "Kurzel's Rage"
Inst80Quest2name3 = "Kurzel's Warband"

--Quest 3 Alliance
Inst80Quest3 = "3. Head Games"
Inst80Quest3_Level = "74"
Inst80Quest3_Attain = "73"
Inst80Quest3_Aim = "Kurzel wants you to use Kurzel's Blouse Scrap at the corpse of Novos the Summoner, then take the Ichor-Stained Cloth to Mack."
Inst80Quest3_Location = "Kurzel (Drak'Tharon Keep; "..YELLOW.."[2]"..WHITE..")"
Inst80Quest3_Note = "Novos the Summoner is at "..YELLOW.."[3]"..WHITE..". Mack Fearsen is at (Grizzly Hills - Granite Springs; "..YELLOW.."16.6, 48.1"..WHITE..")"
Inst80Quest3_Prequest = "Search and Rescue"
Inst80Quest3_Folgequest = "None"
Inst80Quest3FQuest = "true"
--
Inst80Quest3name1 = "Shameful Cuffs"
Inst80Quest3name2 = "Scorned Bands"
Inst80Quest3name3 = "Accused Wristguards"
Inst80Quest3name4 = "Disavowed Bracers"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst80Quest1_HORDE = Inst80Quest1
Inst80Quest1_HORDE_Level = Inst80Quest1_Level
Inst80Quest1_HORDE_Attain = Inst80Quest1_Attain
Inst80Quest1_HORDE_Aim = Inst80Quest1_Aim
Inst80Quest1_HORDE_Location = Inst80Quest1_Location
Inst80Quest1_HORDE_Note = Inst80Quest1_Note
Inst80Quest1_HORDE_Prequest = Inst80Quest1_Prequest
Inst80Quest1_HORDE_Folgequest = Inst80Quest1_Folgequest
Inst80Quest1PreQuest_HORDE = Inst80Quest1PreQuest
--
Inst80Quest1name1_HORDE = Inst80Quest1name1
Inst80Quest1name2_HORDE = Inst80Quest1name2
Inst80Quest1name3_HORDE = Inst80Quest1name3
Inst80Quest1name4_HORDE = Inst80Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst80Quest2_HORDE = Inst80Quest2
Inst80Quest2_HORDE_Level = Inst80Quest2_Level
Inst80Quest2_HORDE_Attain = Inst80Quest2_Attain
Inst80Quest2_HORDE_Aim = Inst80Quest2_Aim
Inst80Quest2_HORDE_Location = Inst80Quest2_Location
Inst80Quest2_HORDE_Note = Inst80Quest2_Note
Inst80Quest2_HORDE_Prequest = Inst80Quest2_Prequest
Inst80Quest2_HORDE_Folgequest = Inst80Quest2_Folgequest
Inst80Quest2PreQuest_HORDE = Inst80Quest2PreQuest
--
Inst80Quest2name1_HORDE = Inst80Quest2name1
Inst80Quest2name2_HORDE = Inst80Quest2name2
Inst80Quest2name3_HORDE = Inst80Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst80Quest3_HORDE = Inst80Quest3
Inst80Quest3_HORDE_Level = Inst80Quest3_Level
Inst80Quest3_HORDE_Attain = Inst80Quest3_Attain
Inst80Quest3_HORDE_Aim = Inst80Quest3_Aim
Inst80Quest3_HORDE_Location = Inst80Quest3_Location
Inst80Quest3_HORDE_Note = Inst80Quest3_Note
Inst80Quest3_HORDE_Prequest = Inst80Quest3_Prequest
Inst80Quest3_HORDE_Folgequest = Inst80Quest3_Folgequest
Inst80Quest3FQuest_HORDE = Inst80Quest3FQuest
--
Inst80Quest3name1_HORDE = Inst80Quest3name1
Inst80Quest3name2_HORDE = Inst80Quest3name2
Inst80Quest3name3_HORDE = Inst80Quest3name3
Inst80Quest3name4_HORDE = Inst80Quest3name4



--------------- INST81 - Gundrak ---------------

Inst81Story = "Gundrak is the capital of the Ice Trolls. Located in Zul'Drak, the instance contains three entrances which all lead into a main circle. The Drakkari tribe rule Zul'Drak from here, constantly battling the mighty forces of the Scourge. This dungeon shows the Ice Trolls in all their glory, including the opportunity to fight the Ice Troll leader, and teach us why they have been so successful against the Scourge.\n\n"..GREEN.."Quoted from WoWWiki"
Inst81Caption = "Gundrak"
Inst81QAA = "3 Quests"
Inst81QAH = "3 Quests"

--Quest 1 Alliance
Inst81Quest1 = "1. For Posterity"
Inst81Quest1_Level = "78"
Inst81Quest1_Attain = "76"
Inst81Quest1_Aim = "Chronicler Bah'Kini at Dubra'Jin wants you to enter Gundrak and collect 6 Drakkari History Tablets."
Inst81Quest1_Location = "Chronicler Bah'Kini (Zul'Drak - Dubra'Jin; "..YELLOW.."70.0, 20.9"..WHITE..")"
Inst81Quest1_Note = "The tablets are scattered around the instance. There are enough for a full party to complete the quest. The prequest is optional."
Inst81Quest1_Prequest = "Just Checkin'"
Inst81Quest1_Folgequest = "None"
Inst81Quest1PreQuest = "true"
--
Inst81Quest1name1 = "Lion's Head Ring"
Inst81Quest1name2 = "Ring of Foul Mojo"
Inst81Quest1name3 = "Solid Platinum Band"
Inst81Quest1name4 = "Voodoo Signet"

--Quest 2 Alliance
Inst81Quest2 = "2. Gal'darah Must Pay"
Inst81Quest2_Level = "78"
Inst81Quest2_Attain = "76"
Inst81Quest2_Aim = "Tol'mar at Dubra'Jin wants you to slay Gal'darah in Gundrak."
Inst81Quest2_Location = "Tol'mar (Zul'Drak - Dubra'Jin; "..YELLOW.."69.9, 22.8"..WHITE..")"
Inst81Quest2_Note = "Gal'darah is at "..YELLOW.."[5]"..WHITE.."."
Inst81Quest2_Prequest = "Unfinished Business"
Inst81Quest2_Folgequest = "None"
Inst81Quest2PreQuest = "true"
--
Inst81Quest2name1 = "Sly Mojo Sash"
Inst81Quest2name2 = "Strange Voodoo Belt"
Inst81Quest2name3 = "Ranger's Belt of the Fallen Empire"
Inst81Quest2name4 = "Clasp of the Fallen Demi-God"

--Quest 3 Alliance
Inst81Quest3 = "3. One of a Kind"
Inst81Quest3_Level = "78"
Inst81Quest3_Attain = "76"
Inst81Quest3_Aim = "Chronicler Bah'Kini at Dubra'Jin wants you to enter Gundrak and recover a piece of the Drakkari Colossus."
Inst81Quest3_Location = "Chronicler Bah'Kini (Zul'Drak - Dubra'Jin; "..YELLOW.."70.0, 20.9"..WHITE..")"
Inst81Quest3_Note = "The Drakkari Colossus Fragment drops from Drakkari Colossus at "..YELLOW.."[2]"..WHITE.."."
Inst81Quest3_Prequest = "None"
Inst81Quest3_Folgequest = "None"
--
Inst81Quest3name1 = "Fur-lined Moccasins"
Inst81Quest3name2 = "Rhino Hide Kneeboots"
Inst81Quest3name3 = "Scaled Boots of Fallen Hope"
Inst81Quest3name4 = "Slippers of the Mojo Dojo"
Inst81Quest3name5 = "Trollkickers"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst81Quest1_HORDE = Inst81Quest1
Inst81Quest1_HORDE_Level = Inst81Quest1_Level
Inst81Quest1_HORDE_Attain = Inst81Quest1_Attain
Inst81Quest1_HORDE_Aim = Inst81Quest1_Aim
Inst81Quest1_HORDE_Location = Inst81Quest1_Location
Inst81Quest1_HORDE_Note = Inst81Quest1_Note
Inst81Quest1_HORDE_Prequest = Inst81Quest1_Prequest
Inst81Quest1_HORDE_Folgequest = Inst81Quest1_Folgequest
Inst81Quest1PreQuest_HORDE = Inst81Quest1PreQuest
--
Inst81Quest1name1_HORDE = Inst81Quest1name1
Inst81Quest1name2_HORDE = Inst81Quest1name2
Inst81Quest1name3_HORDE = Inst81Quest1name3
Inst81Quest1name4_HORDE = Inst81Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst81Quest2_HORDE = Inst81Quest2
Inst81Quest2_HORDE_Level = Inst81Quest2_Level
Inst81Quest2_HORDE_Attain = Inst81Quest2_Attain
Inst81Quest2_HORDE_Aim = Inst81Quest2_Aim
Inst81Quest2_HORDE_Location = Inst81Quest2_Location
Inst81Quest2_HORDE_Note = Inst81Quest2_Note
Inst81Quest2_HORDE_Prequest = Inst81Quest2_Prequest
Inst81Quest2_HORDE_Folgequest = Inst81Quest2_Folgequest
Inst81Quest2PreQuest_HORDE = Inst81Quest2PreQuest
--
Inst81Quest2name1_HORDE = Inst81Quest2name1
Inst81Quest2name2_HORDE = Inst81Quest2name2
Inst81Quest2name3_HORDE = Inst81Quest2name3
Inst81Quest2name4_HORDE = Inst81Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst81Quest3_HORDE = Inst81Quest3
Inst81Quest3_HORDE_Level = Inst81Quest3_Level
Inst81Quest3_HORDE_Attain = Inst81Quest3_Attain
Inst81Quest3_HORDE_Aim = Inst81Quest3_Aim
Inst81Quest3_HORDE_Location = Inst81Quest3_Location
Inst81Quest3_HORDE_Note = Inst81Quest3_Note
Inst81Quest3_HORDE_Prequest = Inst81Quest3_Prequest
Inst81Quest3_HORDE_Folgequest = Inst81Quest3_Folgequest
--
Inst81Quest3name1_HORDE = Inst81Quest3name1
Inst81Quest3name2_HORDE = Inst81Quest3name2
Inst81Quest3name3_HORDE = Inst81Quest3name3
Inst81Quest3name4_HORDE = Inst81Quest3name4
Inst81Quest3name5_HORDE = Inst81Quest3name5



--------------- INST82 - The Violet Hold ---------------

Inst82Story = "Among the ornate spires and enchanted streets of Dalaran, a dark presence stirs within the mighty walls of the Violet Hold. Long used to restrain threats to the city, the tower holds row upon row of deadly inmates, and it has been diligently watched over by the Kirin Tor. However, a sudden assault has tested the integrity of the hold, putting at risk the safety of everyone outside the prison's walls. Using the dungeon as a means to breach the city, Malygos and his blue dragonflight have begun to chip away at the Violet Hold's defenses, hungry to reclaim arcane dominance over Azeroth. Only the brave souls of those protecting the prison stand between the continued existence of Dalaran and the city's utter annihilation."
Inst82Caption = "The Violet Hold"
Inst82QAA = "2 Quests"
Inst82QAH = "2 Quests"

--Quest 1 Alliance
Inst82Quest1 = "1. Discretion is Key"
Inst82Quest1_Level = "77"
Inst82Quest1_Attain = "75"
Inst82Quest1_Aim = "Rhonin wants you to go to the Violet Hold in Dalaran and speak with Warden Alturas."
Inst82Quest1_Location = "Rhonin (Dalaran - The Violet Citadel; "..YELLOW.."30.5, 48.4"..WHITE..")"
Inst82Quest1_Note = "Warden Alturas is at (Dalaran - The Violet Hold; "..YELLOW.."60.8, 62.7"..WHITE..")"
Inst82Quest1_Prequest = "None"
Inst82Quest1_Folgequest = "Containment"
-- No Rewards for this quest

--Quest 2 Alliance
Inst82Quest2 = "2. Containment"
Inst82Quest2_Level = "77"
Inst82Quest2_Attain = "75"
Inst82Quest2_Aim = "Warden Alturas wants you to enter the Violet Hold and put and end to the blue dragon invasion force. You are to report back to him once Cyanigosa is slain."
Inst82Quest2_Location = "Warden Alturas (Dalaran - The Violet Hold; "..YELLOW.."60.8, 62.7"..WHITE..")"
Inst82Quest2_Note = "Cyanigosa is at "..YELLOW.."[6]"..WHITE.."."
Inst82Quest2_Prequest = "Discretion is Key"
Inst82Quest2_Folgequest = "None"
Inst82Quest2FQuest = "true"
--
Inst82Quest2name1 = "Tattooed Deerskin Leggings"
Inst82Quest2name2 = "Conferred Pantaloons"
Inst82Quest2name3 = "Labyrinthine Legguards"
Inst82Quest2name4 = "Dalaran Warden's Legplates"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst82Quest1_HORDE = Inst82Quest1
Inst82Quest1_HORDE_Level = Inst82Quest1_Level
Inst82Quest1_HORDE_Attain = Inst82Quest1_Attain
Inst82Quest1_HORDE_Aim = Inst82Quest1_Aim
Inst82Quest1_HORDE_Location = Inst82Quest1_Location
Inst82Quest1_HORDE_Note = Inst82Quest1_Note
Inst82Quest1_HORDE_Prequest = Inst82Quest1_Prequest
Inst82Quest1_HORDE_Folgequest = Inst82Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst82Quest2_HORDE = Inst82Quest2
Inst82Quest2_HORDE_Level = Inst82Quest2_Level
Inst82Quest2_HORDE_Attain = Inst82Quest2_Attain
Inst82Quest2_HORDE_Aim = Inst82Quest2_Aim
Inst82Quest2_HORDE_Location = Inst82Quest2_Location
Inst82Quest2_HORDE_Note = Inst82Quest2_Note
Inst82Quest2_HORDE_Prequest = Inst82Quest2_Prequest
Inst82Quest2_HORDE_Folgequest = Inst82Quest2_Folgequest
Inst82Quest2FQuest_HORDE = Inst82Quest2FQuest
--
Inst82Quest2name1_HORDE = Inst82Quest2name1
Inst82Quest2name2_HORDE = Inst82Quest2name2
Inst82Quest2name3_HORDE = Inst82Quest2name3
Inst82Quest2name4_HORDE = Inst82Quest2name4



--------------- INST84 - Naxxramas (Naxx) ---------------

Inst84Story = {
  ["Page1"] = "Years ago, the crypt lord Anub'arak led an army of undead warriors into the ancient nerubian ziggurat now known as Naxxramas. The Scourge forces overran the citadel, and under the will of the Lich King its corridors were transformed into a potent war machine. Dark magic tore the fortress from its subterranean home and lifted it into the sky. Hidden behind a thick layer of clouds, Naxxramas grew in strength. At the Lich King's bidding, the burgeoning wrath within the necropolis was unleashed upon the world. Brave heroes breached the citadel and eventually overcame Naxxramas' vile commander, the lich Kel'Thuzad, but the victory was short-lived.",
  ["Page2"] = "Above the war-ravaged wastes of the Dragonblight, Naxxramas has returned with renewed fury. Kel'Thuzad, once again seated in the frigid heart of the necropolis, has laid siege to the Alliance fortress of Wintergarde Keep. As factions from around the world converge at the gate to Icecrown, the war against the Scourge enters its most pivotal hour. It is within Naxxramas that the tide of battle could turn against the Lich King... or irrevocably in his favor.",
  ["MaxPages"] = "2",
};
Inst84Caption = "Naxxramas"
Inst84QAA = "6 Quests"
Inst84QAH = "6 Quests"

--Quest 1 Alliance
Inst84Quest1 = "1. The Key to the Focusing Iris"
Inst84Quest1_Level = "80"
Inst84Quest1_Attain = "80"
Inst84Quest1_Aim = "Deliver the Key to the Focusing Iris to Alexstrasza the Life-Binder atop Wyrmrest Temple in the Dragonblight."
Inst84Quest1_Location = "Key to the Focusing Iris (drops from Sapphiron; "..YELLOW.."Frostwyrm Lair [1]"..WHITE..")"
Inst84Quest1_Note = "Alexstrasza is at (Dragonblight - Wyrmrest Temple; "..YELLOW.."59.8, 54.6"..WHITE.."). The reward is required to open up The Nexus: Eye of Eternity for Normal 10-man mode."
Inst84Quest1_Prequest = "None"
Inst84Quest1_Folgequest = "Judgment at the Eye of Eternity ("..YELLOW.."Eye of Eternity"..WHITE..")"
--
Inst84Quest1name1 = "Key to the Focusing Iris"

--Quest 2 Alliance
Inst84Quest2 = "2. The Heroic Key to the Focusing Iris (Heroic)"
Inst84Quest2_Level = "80"
Inst84Quest2_Attain = "80"
Inst84Quest2_Aim = "Deliver the Heroic Key to the Focusing Iris to Alexstrasza the Life-Binder atop Wyrmrest Temple in the Dragonblight."
Inst84Quest2_Location = "Heroic Key to the Focusing Iris (drops from Sapphiron; "..YELLOW.."Frostwyrm Lair [1]"..WHITE..")"
Inst84Quest2_Note = "Alexstrasza is at (Dragonblight - Wyrmrest Temple; "..YELLOW.."59.8, 54.6"..WHITE.."). The reward is required to open up The Nexus: Eye of Eternity for Heroic 25-man mode."
Inst84Quest2_Prequest = "None"
Inst84Quest2_Folgequest = "Judgment at the Eye of Eternity ("..YELLOW.."Eye of Eternity"..WHITE..")"
--
Inst84Quest2name1 = "Heroic Key to the Focusing Iris"

--Quest 3 Alliance
Inst84Quest3 = "3. Anub'Rekhan Must Die! (Weekly)"
Inst84Quest3_Level = "80"
Inst84Quest3_Attain = "80"
Inst84Quest3_Aim = "Kill Anub'Rekhan."
Inst84Quest3_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest3_Note = "Anub'Rekhan is at "..YELLOW.."Arachnid Quarter [1]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst84Quest3_Prequest = "None"
Inst84Quest3_Folgequest = "None"
--
Inst84Quest3name1 = "Emblem of Frost"
Inst84Quest3name2 = "Emblem of Triumph"

--Quest 4 Alliance
Inst84Quest4 = "4. Instructor Razuvious Must Die! (Weekly)"
Inst84Quest4_Level = "80"
Inst84Quest4_Attain = "80"
Inst84Quest4_Aim = "Kill Instructor Razuvious."
Inst84Quest4_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest4_Note = "Instructor Razuvious is at "..YELLOW.."Military Quarter [1]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst84Quest4_Prequest = "None"
Inst84Quest4_Folgequest = "None"
--
Inst84Quest4name1 = "Emblem of Frost"
Inst84Quest4name2 = "Emblem of Triumph"

--Quest 5 Alliance
Inst84Quest5 = "5. Noth the Plaguebringer Must Die! (Weekly)"
Inst84Quest5_Level = "80"
Inst84Quest5_Attain = "80"
Inst84Quest5_Aim = "Kill Noth the Plaguebringer."
Inst84Quest5_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest5_Note = "Noth the Plaguebringer is at "..YELLOW.."Plague Quarter [1]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst84Quest5_Prequest = "None"
Inst84Quest5_Folgequest = "None"
--
Inst84Quest5name1 = "Emblem of Frost"
Inst84Quest5name2 = "Emblem of Triumph"

--Quest 6 Alliance
Inst84Quest6 = "6. Patchwerk Must Die! (Weekly)"
Inst84Quest6_Level = "80"
Inst84Quest6_Attain = "80"
Inst84Quest6_Aim = "Kill Patchwerk."
Inst84Quest6_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest6_Note = "Patchwerk is at "..YELLOW.."Construct Quarter [1]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst84Quest6_Prequest = "None"
Inst84Quest6_Folgequest = "None"
--
Inst84Quest6name1 = "Emblem of Frost"
Inst84Quest6name2 = "Emblem of Triumph"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst84Quest1_HORDE = Inst84Quest1
Inst84Quest1_HORDE_Level = Inst84Quest1_Level
Inst84Quest1_HORDE_Attain = Inst84Quest1_Attain
Inst84Quest1_HORDE_Aim = Inst84Quest1_Aim
Inst84Quest1_HORDE_Location = Inst84Quest1_Location
Inst84Quest1_HORDE_Note = Inst84Quest1_Note
Inst84Quest1_HORDE_Prequest = Inst84Quest1_Prequest
Inst84Quest1_HORDE_Folgequest = Inst84Quest1_Folgequest
--
Inst84Quest1name1_HORDE = Inst84Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst84Quest2_HORDE = Inst84Quest2
Inst84Quest2_HORDE_Level = Inst84Quest2_Level
Inst84Quest2_HORDE_Attain = Inst84Quest2_Attain
Inst84Quest2_HORDE_Aim = Inst84Quest2_Aim
Inst84Quest2_HORDE_Location = Inst84Quest2_Location
Inst84Quest2_HORDE_Note = Inst84Quest2_Note
Inst84Quest2_HORDE_Prequest = Inst84Quest2_Prequest
Inst84Quest2_HORDE_Folgequest = Inst84Quest2_Folgequest
--
Inst84Quest2name1_HORDE = Inst84Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst84Quest3_HORDE = Inst84Quest3
Inst84Quest3_HORDE_Level = Inst84Quest3_Level
Inst84Quest3_HORDE_Attain = Inst84Quest3_Attain
Inst84Quest3_HORDE_Aim = Inst84Quest3_Aim
Inst84Quest3_HORDE_Location = Inst84Quest3_Location
Inst84Quest3_HORDE_Note = Inst84Quest3_Note
Inst84Quest3_HORDE_Prequest = Inst84Quest3_Prequest
Inst84Quest3_HORDE_Folgequest = Inst84Quest3_Folgequest
--
Inst84Quest3name1_HORDE = Inst84Quest3name1
Inst84Quest3name2_HORDE = Inst84Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst84Quest4_HORDE = Inst84Quest4
Inst84Quest4_HORDE_Level = Inst84Quest4_Level
Inst84Quest4_HORDE_Attain = Inst84Quest4_Attain
Inst84Quest4_HORDE_Aim = Inst84Quest4_Aim
Inst84Quest4_HORDE_Location = Inst84Quest4_Location
Inst84Quest4_HORDE_Note = Inst84Quest4_Note
Inst84Quest4_HORDE_Prequest = Inst84Quest4_Prequest
Inst84Quest4_HORDE_Folgequest = Inst84Quest4_Folgequest
--
Inst84Quest4name1_HORDE = Inst84Quest4name1
Inst84Quest4name2_HORDE = Inst84Quest4name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst84Quest5_HORDE = Inst84Quest5
Inst84Quest5_HORDE_Level = Inst84Quest5_Level
Inst84Quest5_HORDE_Attain = Inst84Quest5_Attain
Inst84Quest5_HORDE_Aim = Inst84Quest5_Aim
Inst84Quest5_HORDE_Location = Inst84Quest5_Location
Inst84Quest5_HORDE_Note = Inst84Quest5_Note
Inst84Quest5_HORDE_Prequest = Inst84Quest5_Prequest
Inst84Quest5_HORDE_Folgequest = Inst84Quest5_Folgequest
--
Inst84Quest5name1_HORDE = Inst84Quest5name1
Inst84Quest5name2_HORDE = Inst84Quest5name2

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst84Quest6_HORDE = Inst84Quest6
Inst84Quest6_HORDE_Level = Inst84Quest6_Level
Inst84Quest6_HORDE_Attain = Inst84Quest6_Attain
Inst84Quest6_HORDE_Aim = Inst84Quest6_Aim
Inst84Quest6_HORDE_Location = Inst84Quest6_Location
Inst84Quest6_HORDE_Note = Inst84Quest6_Note
Inst84Quest6_HORDE_Prequest = Inst84Quest6_Prequest
Inst84Quest6_HORDE_Folgequest = Inst84Quest6_Folgequest
--
Inst84Quest6name1_HORDE = Inst84Quest6name1
Inst84Quest6name2_HORDE = Inst84Quest6name2



--------------- INST85 - Vault of Archavon ---------------

Inst85Story = "Overlooking the frozen plains of the Great Dragonblight and the inhospitable wastes of Borean Tundra lies a region known to the denizens of Northrend as Wintergrasp. Seated atop a high plateau, Wintergrasp has remained undisturbed for ages, its icy winds howling unheard amongst the ancient titan fortifications that dot the landscape. However, an abundance of elemental materials and its strategically important titan fortifications are making Wintergrasp the focus of a vicious tug-of-war between the Horde and the Alliance. And then there are the persistent rumors of an ancient titan vault beneath Wintergrasp's keep. One can only marvel at the thought of what treasures may be waiting there...."
Inst85Caption = "Vault of Archavon"
Inst85QAA = "No Quests"
Inst85QAH = "No Quests"



--------------- INST86 - Ulduar ---------------

Inst86Story = "For millennia, Ulduar has remained undisturbed by mortals, far away from their concerns and their struggles. Yet since its recent discovery, many have wondered what the structure's original purpose may have been. Some thought it a city, built to herald the glory of its makers; some thought it a vault containing innumerable treasures, perhaps even relics of the mighty Titans themselves. Such speculations were wrong. Beyond Ulduar's gates lies no city, no treasure vault, no final answer to the Titan's mysteries. All that awaits those who dare set foot in Ulduar is a horror even the Titans could not, would not destroy, an evil they merely... contained. Beneath ancient Ulduar, the Old God of death lies, whispering.... Tread carefully, or its prison will become your tomb."
Inst86Caption = "Ulduar"
Inst86QAA = "20 Quests"
Inst86QAH = "20 Quests"

--Quest 1 Alliance
Inst86Quest1 = "1. Archivum Data Disc"
Inst86Quest1_Level = "80"
Inst86Quest1_Attain = "80"
Inst86Quest1_Aim = "Bring the Archivum Data Disc to the Archivum Console in Ulduar."
Inst86Quest1_Location = "Archivum Data Disc (drops from Assembly of Iron; "..YELLOW.."The Antechamber [5]"..WHITE..")"
Inst86Quest1_Note = "The Data Disc will only drop if you complete the Assembly of Iron encounter on hard mode.  Only one person in the raid will be able to pick up the Data Disc per raid.\n\nAfter the Assembly of Iron is killed, a door opens up.  Turn in the quest at the Archivum Console in the room beyond.  Prospector Doren will give you the following quest."
Inst86Quest1_Prequest = "None"
Inst86Quest1_Folgequest = "The Celestial Planetarium"
-- No Rewards for this quest

--Quest 2 Alliance
Inst86Quest2 = "2. The Celestial Planetarium"
Inst86Quest2_Level = "80"
Inst86Quest2_Attain = "80"
Inst86Quest2_Aim = "Prospector Doren at the Archivum in Ulduar wants you to locate the entrance to the Celestial Planetarium."
Inst86Quest2_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest2_Note = "The Celestial Planetarium is at (Ulduar - The Antechamber; "..YELLOW.."[8]"..WHITE..").\n\nAfter you turn the quest in to Prospector Doren, he will give you four more quests."
Inst86Quest2_Prequest = "Archivum Data Disc"
Inst86Quest2_Folgequest = "Four more quests"
Inst86Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst86Quest3 = "3. Hodir's Sigil"
Inst86Quest3_Level = "80"
Inst86Quest3_Attain = "80"
Inst86Quest3_Aim = "Prospector Doren at the Archivum in Ulduar wants you to obtain Hodir's Sigil."
Inst86Quest3_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest3_Note = "Hodir is at "..YELLOW.."The Keepers [10]"..WHITE..".  He must be killed on Hard Mode for the Sigil to drop."
Inst86Quest3_Prequest = "The Celestial Planetarium"
Inst86Quest3_Folgequest = "None"
Inst86Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst86Quest4 = "4. Thorim's Sigil"
Inst86Quest4_Level = "80"
Inst86Quest4_Attain = "80"
Inst86Quest4_Aim = "Prospector Doren at the Archivum in Ulduar wants you to obtain Thorim's Sigil."
Inst86Quest4_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest4_Note = "Thorim is at "..YELLOW.."The Keepers [11]"..WHITE..".  He must be killed on Hard Mode for the Sigil to drop."
Inst86Quest4_Prequest = "The Celestial Planetarium"
Inst86Quest4_Folgequest = "None"
Inst86Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst86Quest5 = "5. Freya's Sigil"
Inst86Quest5_Level = "80"
Inst86Quest5_Attain = "80"
Inst86Quest5_Aim = "Prospector Doren at the Archivum in Ulduar wants you to obtain Freya's Sigil."
Inst86Quest5_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest5_Note = "Freya is at "..YELLOW.."The Keepers [12]"..WHITE..".  She must be killed on Hard Mode for the Sigil to drop."
Inst86Quest5_Prequest = "The Celestial Planetarium"
Inst86Quest5_Folgequest = "None"
Inst86Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst86Quest6 = "6. Mimiron's Sigil"
Inst86Quest6_Level = "80"
Inst86Quest6_Attain = "80"
Inst86Quest6_Aim = "Prospector Doren at the Ulduar Archivum wants you to obtain Mimiron's Sigil."
Inst86Quest6_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest6_Note = "Mimiron is at "..YELLOW.."Spark of Imagination [13]"..WHITE..".  He must be killed on Hard Mode for the Sigil to drop."
Inst86Quest6_Prequest = "The Celestial Planetarium"
Inst86Quest6_Folgequest = "None"
Inst86Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst86Quest7 = "7. Algalon"
Inst86Quest7_Level = "80"
Inst86Quest7_Attain = "80"
Inst86Quest7_Aim = "Bring the Sigils of the Watchers to the Archivum Console in Ulduar."
Inst86Quest7_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest7_Note = "Completing this quest allows you to fight Algalon the Observer in the Celestial Planetarium."
Inst86Quest7_Prequest = "The four Sigil quests"
Inst86Quest7_Folgequest = "None"
Inst86Quest7PreQuest = "true"
--
Inst86Quest7name1 = "Celestial Planetarium Key"
Inst86Quest7name2 = "Sack of Ulduar Spoils"

--Quest 8 Alliance
Inst86Quest8 = "8. All Is Well That Ends Well"
Inst86Quest8_Level = "80"
Inst86Quest8_Attain = "80"
Inst86Quest8_Aim = "Take the Reply-Code Alpha to Rhonin in Dalaran."
Inst86Quest8_Location = "Reply-Code Alpha (drops from Algalon the Observer; "..YELLOW.."The Antechamber [7]"..WHITE..")"
Inst86Quest8_Note = "Only one raid member per raid can take the Reply-Code. Rhonin is at Dalaran - The Violet Citadel; "..YELLOW.."30.5, 48.4"..WHITE.."."
Inst86Quest8_Prequest = "None"
Inst86Quest8_Folgequest = "None"
--
Inst86Quest8name1 = "Drape of the Skyherald"
Inst86Quest8name2 = "Sunglimmer Drape"
Inst86Quest8name3 = "Brann's Sealing Ring"
Inst86Quest8name4 = "Starshine Signet"

--Quest 9 Alliance
Inst86Quest9 = "9. Heroic: Archivum Data Disc"
Inst86Quest9_Level = "80"
Inst86Quest9_Attain = "80"
Inst86Quest9_Aim = "Bring the Archivum Data Disc to the Archivum Console in Ulduar."
Inst86Quest9_Location = "Archivum Data Disc (drops from Assembly of Iron; "..YELLOW.."The Antechamber [5]"..WHITE..")"
Inst86Quest9_Note = "The Data Disc will only drop if you complete the Assembly of Iron encounter on Heroic Hard Mode.  Only one person in the raid will be able to pick up the Data Disc per raid.\n\nAfter the Assembly of Iron is killed, a door opens up.  Turn in the quest at the Archivum Console in the room beyond.  Prospector Doren will give you the following quest."
Inst86Quest9_Prequest = "None"
Inst86Quest9_Folgequest = "The Celestial Planetarium"
-- No Rewards for this quest

--Quest 10 Alliance
Inst86Quest10 = "10. Heroic: The Celestial Planetarium"
Inst86Quest10_Level = "80"
Inst86Quest10_Attain = "80"
Inst86Quest10_Aim = "Prospector Doren at the Archivum in Ulduar wants you to locate the entrance to the Celestial Planetarium."
Inst86Quest10_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest10_Note = "The Celestial Planetarium is at (Ulduar - The Antechamber; "..YELLOW.."[8]"..WHITE..").\n\nAfter you turn the quest in to Prospector Doren, he will give you four more quests."
Inst86Quest10_Prequest = "Archivum Data Disc"
Inst86Quest10_Folgequest = "Four more quests"
Inst86Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst86Quest11 = "11. Heroic: Hodir's Sigil"
Inst86Quest11_Level = "80"
Inst86Quest11_Attain = "80"
Inst86Quest11_Aim = "Prospector Doren at the Archivum in Ulduar wants you to obtain Hodir's Sigil."
Inst86Quest11_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest11_Note = "Hodir is at "..YELLOW.."The Keepers [10]"..WHITE..".  He must be killed on Heroic Hard Mode for the Sigil to drop."
Inst86Quest11_Prequest = "The Celestial Planetarium"
Inst86Quest11_Folgequest = "None"
Inst86Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst86Quest12 = "12. Heroic: Thorim's Sigil"
Inst86Quest12_Level = "80"
Inst86Quest12_Attain = "80"
Inst86Quest12_Aim = "Prospector Doren at the Archivum in Ulduar wants you to obtain Thorim's Sigil."
Inst86Quest12_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest12_Note = "Thorim is at "..YELLOW.."The Keepers [11]"..WHITE..".  He must be killed on Heroic Hard Mode for the Sigil to drop."
Inst86Quest12_Prequest = "The Celestial Planetarium"
Inst86Quest12_Folgequest = "None"
Inst86Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst86Quest13 = "13. Heroic: Freya's Sigil"
Inst86Quest13_Level = "80"
Inst86Quest13_Attain = "80"
Inst86Quest13_Aim = "Prospector Doren at the Archivum in Ulduar wants you to obtain Freya's Sigil."
Inst86Quest13_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest13_Note = "Freya is at "..YELLOW.."The Keepers [12]"..WHITE..".  She must be killed on Heroic Hard Mode for the Sigil to drop."
Inst86Quest13_Prequest = "The Celestial Planetarium"
Inst86Quest13_Folgequest = "None"
Inst86Quest13PreQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst86Quest14 = "14. Heroic: Mimiron's Sigil"
Inst86Quest14_Level = "80"
Inst86Quest14_Attain = "80"
Inst86Quest14_Aim = "Prospector Doren at the Ulduar Archivum wants you to obtain Mimiron's Sigil."
Inst86Quest14_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest14_Note = "Mimiron is at "..YELLOW.."Spark of Imagination [13]"..WHITE..".  He must be killed on Heroic Hard Mode for the Sigil to drop."
Inst86Quest14_Prequest = "The Celestial Planetarium"
Inst86Quest14_Folgequest = "None"
Inst86Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst86Quest15 = "15. Heroic: Algalon"
Inst86Quest15_Level = "80"
Inst86Quest15_Attain = "80"
Inst86Quest15_Aim = "Bring the Sigils of the Watchers to the Archivum Console in Ulduar."
Inst86Quest15_Location = "Prospector Doren (Ulduar - The Antechamber; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest15_Note = "Completing this quest allows you to fight Algalon the Observer in the Celestial Planetarium."
Inst86Quest15_Prequest = "The four Sigil quests"
Inst86Quest15_Folgequest = "None"
Inst86Quest15PreQuest = "true"
--
Inst86Quest15name1 = "Heroic Celestial Planetarium Key"
Inst86Quest15name2 = "Sack of Ulduar Spoils"

--Quest 16 Alliance
Inst86Quest16 = "16. Heroic: All Is Well That Ends Well"
Inst86Quest16_Level = "80"
Inst86Quest16_Attain = "80"
Inst86Quest16_Aim = "Take the Reply-Code Alpha to Rhonin in Dalaran."
Inst86Quest16_Location = "Reply-Code Alpha (drops from Algalon the Observer; "..YELLOW.."The Antechamber [7]"..WHITE..")"
Inst86Quest16_Note = "Only one raid member per raid can take the Reply-Code. Rhonin is at Dalaran - The Violet Citadel; "..YELLOW.."30.5, 48.4"..WHITE.."."
Inst86Quest16_Prequest = "None"
Inst86Quest16_Folgequest = "None"
--
Inst86Quest16name1 = "Drape of the Skyborn"
Inst86Quest16name2 = "Sunglimmer Cloak"
Inst86Quest16name3 = "Brann's Signet Ring"
Inst86Quest16name4 = "Starshine Circle"

--Quest 17 Alliance
Inst86Quest17 = "17. Flame Leviathan Must Die! (Weekly)"
Inst86Quest17_Level = "80"
Inst86Quest17_Attain = "80"
Inst86Quest17_Aim = "Kill Flame Leviathan."
Inst86Quest17_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest17_Note = "Flame Leviathan is at "..YELLOW.."The Siege [1]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst86Quest17_Prequest = "None"
Inst86Quest17_Folgequest = "None"
--
Inst86Quest17name1 = "Emblem of Frost"
Inst86Quest17name2 = "Emblem of Triumph"

--Quest 18 Alliance
Inst86Quest18 = "18. Ignis the Furnace Master Must Die! (Weekly)"
Inst86Quest18_Level = "80"
Inst86Quest18_Attain = "80"
Inst86Quest18_Aim = "Kill Ignis the Furnace Master."
Inst86Quest18_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest18_Note = "Ignis the Furnace Master is at "..YELLOW.."The Siege [2]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst86Quest18_Prequest = "None"
Inst86Quest18_Folgequest = "None"
--
Inst86Quest18name1 = "Emblem of Frost"
Inst86Quest18name2 = "Emblem of Triumph"

--Quest 19 Alliance
Inst86Quest19 = "19. Razorscale Must Die! (Weekly)"
Inst86Quest19_Level = "80"
Inst86Quest19_Attain = "80"
Inst86Quest19_Aim = "Kill Razorscale."
Inst86Quest19_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest19_Note = "Razorscale is at "..YELLOW.."The Siege [3]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst86Quest19_Prequest = "None"
Inst86Quest19_Folgequest = "None"
--
Inst86Quest19name1 = "Emblem of Frost"
Inst86Quest19name2 = "Emblem of Triumph"

--Quest 20 Alliance
Inst86Quest20 = "20. XT-002 Deconstructor Must Die! (Weekly)"
Inst86Quest20_Level = "80"
Inst86Quest20_Attain = "80"
Inst86Quest20_Aim = "Kill XT-002 Deconstructor."
Inst86Quest20_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest20_Note = "XT-002 Deconstructor is at "..YELLOW.."The Siege [4]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst86Quest20_Prequest = "None"
Inst86Quest20_Folgequest = "None"
--
Inst86Quest20name1 = "Emblem of Frost"
Inst86Quest20name2 = "Emblem of Triumph"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst86Quest1_HORDE = Inst86Quest1
Inst86Quest1_HORDE_Level = Inst86Quest1_Level
Inst86Quest1_HORDE_Attain = Inst86Quest1_Attain
Inst86Quest1_HORDE_Aim = Inst86Quest1_Aim
Inst86Quest1_HORDE_Location = Inst86Quest1_Location
Inst86Quest1_HORDE_Note = Inst86Quest1_Note
Inst86Quest1_HORDE_Prequest = Inst86Quest1_Prequest
Inst86Quest1_HORDE_Folgequest = Inst86Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst86Quest2_HORDE = Inst86Quest2
Inst86Quest2_HORDE_Level = Inst86Quest2_Level
Inst86Quest2_HORDE_Attain = Inst86Quest2_Attain
Inst86Quest2_HORDE_Aim = Inst86Quest2_Aim
Inst86Quest2_HORDE_Location = Inst86Quest2_Location
Inst86Quest2_HORDE_Note = Inst86Quest2_Note
Inst86Quest2_HORDE_Prequest = Inst86Quest2_Prequest
Inst86Quest2_HORDE_Folgequest = Inst86Quest2_Folgequest
Inst86Quest2FQuest_HORDE = Inst86Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst86Quest3_HORDE = Inst86Quest3
Inst86Quest3_HORDE_Level = Inst86Quest3_Level
Inst86Quest3_HORDE_Attain = Inst86Quest3_Attain
Inst86Quest3_HORDE_Aim = Inst86Quest3_Aim
Inst86Quest3_HORDE_Location = Inst86Quest3_Location
Inst86Quest3_HORDE_Note = Inst86Quest3_Note
Inst86Quest3_HORDE_Prequest = Inst86Quest3_Prequest
Inst86Quest3_HORDE_Folgequest = Inst86Quest3_Folgequest
Inst86Quest3PreQuest_HORDE = Inst86Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst86Quest4_HORDE = Inst86Quest4
Inst86Quest4_HORDE_Level = Inst86Quest4_Level
Inst86Quest4_HORDE_Attain = Inst86Quest4_Attain
Inst86Quest4_HORDE_Aim = Inst86Quest4_Aim
Inst86Quest4_HORDE_Location = Inst86Quest4_Location
Inst86Quest4_HORDE_Note = Inst86Quest4_Note
Inst86Quest4_HORDE_Prequest = Inst86Quest4_Prequest
Inst86Quest4_HORDE_Folgequest = Inst86Quest4_Folgequest
Inst86Quest4PreQuest_HORDE = Inst86Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst86Quest5_HORDE = Inst86Quest5
Inst86Quest5_HORDE_Level = Inst86Quest5_Level
Inst86Quest5_HORDE_Attain = Inst86Quest5_Attain
Inst86Quest5_HORDE_Aim = Inst86Quest5_Aim
Inst86Quest5_HORDE_Location = Inst86Quest5_Location
Inst86Quest5_HORDE_Note = Inst86Quest5_Note
Inst86Quest5_HORDE_Prequest = Inst86Quest5_Prequest
Inst86Quest5_HORDE_Folgequest = Inst86Quest5_Folgequest
Inst86Quest5PreQuest_HORDE = Inst86Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst86Quest6_HORDE = Inst86Quest6
Inst86Quest6_HORDE_Level = Inst86Quest6_Level
Inst86Quest6_HORDE_Attain = Inst86Quest6_Attain
Inst86Quest6_HORDE_Aim = Inst86Quest6_Aim
Inst86Quest6_HORDE_Location = Inst86Quest6_Location
Inst86Quest6_HORDE_Note = Inst86Quest6_Note
Inst86Quest6_HORDE_Prequest = Inst86Quest6_Prequest
Inst86Quest6_HORDE_Folgequest = Inst86Quest6_Folgequest
Inst86Quest6PreQuest_HORDE = Inst86Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst86Quest7_HORDE = Inst86Quest7
Inst86Quest7_HORDE_Level = Inst86Quest7_Level
Inst86Quest7_HORDE_Attain = Inst86Quest7_Attain
Inst86Quest7_HORDE_Aim = Inst86Quest7_Aim
Inst86Quest7_HORDE_Location = Inst86Quest7_Location
Inst86Quest7_HORDE_Note = Inst86Quest7_Note
Inst86Quest7_HORDE_Prequest = Inst86Quest7_Prequest
Inst86Quest7_HORDE_Folgequest = Inst86Quest7_Folgequest
Inst86Quest7PreQuest_HORDE = Inst86Quest7PreQuest
--
Inst86Quest7name1_HORDE = Inst86Quest7name1
Inst86Quest7name2_HORDE = Inst86Quest7name2

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst86Quest8_HORDE = Inst86Quest8
Inst86Quest8_HORDE_Level = Inst86Quest8_Level
Inst86Quest8_HORDE_Attain = Inst86Quest8_Attain
Inst86Quest8_HORDE_Aim = Inst86Quest8_Aim
Inst86Quest8_HORDE_Location = Inst86Quest8_Location
Inst86Quest8_HORDE_Note = Inst86Quest8_Note
Inst86Quest8_HORDE_Prequest = Inst86Quest8_Prequest
Inst86Quest8_HORDE_Folgequest = Inst86Quest8_Folgequest
--
Inst86Quest8name1_HORDE = Inst86Quest8name1
Inst86Quest8name2_HORDE = Inst86Quest8name2
Inst86Quest8name3_HORDE = Inst86Quest8name3
Inst86Quest8name4_HORDE = Inst86Quest8name4

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst86Quest9_HORDE = Inst86Quest9
Inst86Quest9_HORDE_Level = Inst86Quest9_Level
Inst86Quest9_HORDE_Attain = Inst86Quest9_Attain
Inst86Quest9_HORDE_Aim = Inst86Quest9_Aim
Inst86Quest9_HORDE_Location = Inst86Quest9_Location
Inst86Quest9_HORDE_Note = Inst86Quest9_Note
Inst86Quest9_HORDE_Prequest = Inst86Quest9_Prequest
Inst86Quest9_HORDE_Folgequest = Inst86Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst86Quest10_HORDE = Inst86Quest10
Inst86Quest10_HORDE_Level = Inst86Quest10_Level
Inst86Quest10_HORDE_Attain = Inst86Quest10_Attain
Inst86Quest10_HORDE_Aim = Inst86Quest10_Aim
Inst86Quest10_HORDE_Location = Inst86Quest10_Location
Inst86Quest10_HORDE_Note = Inst86Quest10_Note
Inst86Quest10_HORDE_Prequest = Inst86Quest10_Prequest
Inst86Quest10_HORDE_Folgequest = Inst86Quest10_Folgequest
Inst86Quest10FQuest_HORDE = Inst86Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst86Quest11_HORDE = Inst86Quest11
Inst86Quest11_HORDE_Level = Inst86Quest11_Level
Inst86Quest11_HORDE_Attain = Inst86Quest11_Attain
Inst86Quest11_HORDE_Aim = Inst86Quest11_Aim
Inst86Quest11_HORDE_Location = Inst86Quest11_Location
Inst86Quest11_HORDE_Note = Inst86Quest11_Note
Inst86Quest11_HORDE_Prequest = Inst86Quest11_Prequest
Inst86Quest11_HORDE_Folgequest = Inst86Quest11_Folgequest
Inst86Quest11PreQuest_HORDE = Inst86Quest11PreQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst86Quest12_HORDE = Inst86Quest12
Inst86Quest12_HORDE_Level = Inst86Quest12_Level
Inst86Quest12_HORDE_Attain = Inst86Quest12_Attain
Inst86Quest12_HORDE_Aim = Inst86Quest12_Aim
Inst86Quest12_HORDE_Location = Inst86Quest12_Location
Inst86Quest12_HORDE_Note = Inst86Quest12_Note
Inst86Quest12_HORDE_Prequest = Inst86Quest12_Prequest
Inst86Quest12_HORDE_Folgequest = Inst86Quest12_Folgequest
Inst86Quest12PreQuest_HORDE = Inst86Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst86Quest13_HORDE = Inst86Quest13
Inst86Quest13_HORDE_Level = Inst86Quest13_Level
Inst86Quest13_HORDE_Attain = Inst86Quest13_Attain
Inst86Quest13_HORDE_Aim = Inst86Quest13_Aim
Inst86Quest13_HORDE_Location = Inst86Quest13_Location
Inst86Quest13_HORDE_Note = Inst86Quest13_Note
Inst86Quest13_HORDE_Prequest = Inst86Quest13_Prequest
Inst86Quest13_HORDE_Folgequest = Inst86Quest13_Folgequest
Inst86Quest13PreQuest_HORDE = Inst86Quest13PreQuest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst86Quest14_HORDE = Inst86Quest14
Inst86Quest14_HORDE_Level = Inst86Quest14_Level
Inst86Quest14_HORDE_Attain = Inst86Quest14_Attain
Inst86Quest14_HORDE_Aim = Inst86Quest14_Aim
Inst86Quest14_HORDE_Location = Inst86Quest14_Location
Inst86Quest14_HORDE_Note = Inst86Quest14_Note
Inst86Quest14_HORDE_Prequest = Inst86Quest14_Prequest
Inst86Quest14_HORDE_Folgequest = Inst86Quest14_Folgequest
Inst86Quest14PreQuest_HORDE = Inst86Quest14PreQuest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst86Quest15_HORDE = Inst86Quest15
Inst86Quest15_HORDE_Level = Inst86Quest15_Level
Inst86Quest15_HORDE_Attain = Inst86Quest15_Attain
Inst86Quest15_HORDE_Aim = Inst86Quest15_Aim
Inst86Quest15_HORDE_Location = Inst86Quest15_Location
Inst86Quest15_HORDE_Note = Inst86Quest15_Note
Inst86Quest15_HORDE_Prequest = Inst86Quest15_Prequest
Inst86Quest15_HORDE_Folgequest = Inst86Quest15_Folgequest
Inst86Quest15PreQuest_HORDE = Inst86Quest15PreQuest
--
Inst86Quest15name1_HORDE = Inst86Quest15name1
Inst86Quest15name2_HORDE = Inst86Quest15name2

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst86Quest16_HORDE = Inst86Quest16
Inst86Quest16_HORDE_Level = Inst86Quest16_Level
Inst86Quest16_HORDE_Attain = Inst86Quest16_Attain
Inst86Quest16_HORDE_Aim = Inst86Quest16_Aim
Inst86Quest16_HORDE_Location = Inst86Quest16_Location
Inst86Quest16_HORDE_Note = Inst86Quest16_Note
Inst86Quest16_HORDE_Prequest = Inst86Quest16_Prequest
Inst86Quest16_HORDE_Folgequest = Inst86Quest16_Folgequest
--
Inst86Quest16name1_HORDE = Inst86Quest16name1
Inst86Quest16name2_HORDE = Inst86Quest16name2
Inst86Quest16name3_HORDE = Inst86Quest16name3
Inst86Quest16name4_HORDE = Inst86Quest16name4

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst86Quest17_HORDE = Inst86Quest17
Inst86Quest17_HORDE_Level = Inst86Quest17_Level
Inst86Quest17_HORDE_Attain = Inst86Quest17_Attain
Inst86Quest17_HORDE_Aim = Inst86Quest17_Aim
Inst86Quest17_HORDE_Location = Inst86Quest17_Location
Inst86Quest17_HORDE_Note = Inst86Quest17_Note
Inst86Quest17_HORDE_Prequest = Inst86Quest17_Prequest
Inst86Quest17_HORDE_Folgequest = Inst86Quest17_Folgequest
--
Inst86Quest17name1_HORDE = Inst86Quest17name1
Inst86Quest17name2_HORDE = Inst86Quest17name2

--Quest 18 Horde  (same as Quest 18 Alliance)
Inst86Quest18_HORDE = Inst86Quest18
Inst86Quest18_HORDE_Level = Inst86Quest18_Level
Inst86Quest18_HORDE_Attain = Inst86Quest18_Attain
Inst86Quest18_HORDE_Aim = Inst86Quest18_Aim
Inst86Quest18_HORDE_Location = Inst86Quest18_Location
Inst86Quest18_HORDE_Note = Inst86Quest18_Note
Inst86Quest18_HORDE_Prequest = Inst86Quest18_Prequest
Inst86Quest18_HORDE_Folgequest = Inst86Quest18_Folgequest
--
Inst86Quest18name1_HORDE = Inst86Quest18name1
Inst86Quest18name2_HORDE = Inst86Quest18name2

--Quest 19 Horde  (same as Quest 19 Alliance)
Inst86Quest19_HORDE = Inst86Quest19
Inst86Quest19_HORDE_Level = Inst86Quest19_Level
Inst86Quest19_HORDE_Attain = Inst86Quest19_Attain
Inst86Quest19_HORDE_Aim = Inst86Quest19_Aim
Inst86Quest19_HORDE_Location = Inst86Quest19_Location
Inst86Quest19_HORDE_Note = Inst86Quest19_Note
Inst86Quest19_HORDE_Prequest = Inst86Quest19_Prequest
Inst86Quest19_HORDE_Folgequest = Inst86Quest19_Folgequest
--
Inst86Quest19name1_HORDE = Inst86Quest19name1
Inst86Quest19name2_HORDE = Inst86Quest19name2

--Quest 20 Horde  (same as Quest 20 Alliance)
Inst86Quest20_HORDE = Inst86Quest20
Inst86Quest20_HORDE_Level = Inst86Quest20_Level
Inst86Quest20_HORDE_Attain = Inst86Quest20_Attain
Inst86Quest20_HORDE_Aim = Inst86Quest20_Aim
Inst86Quest20_HORDE_Location = Inst86Quest20_Location
Inst86Quest20_HORDE_Note = Inst86Quest20_Note
Inst86Quest20_HORDE_Prequest = Inst86Quest20_Prequest
Inst86Quest20_HORDE_Folgequest = Inst86Quest20_Folgequest
--
Inst86Quest20name1_HORDE = Inst86Quest20name1
Inst86Quest20name2_HORDE = Inst86Quest20name2


--------------- INST87 - Trial of the Champion ---------------

Inst87Story = "The time to strike at the heart of the Scourge is drawing close. Clouds blanket the skies of Azeroth and heroes gather beneath battle-worn banners in preparation for the coming storm. They say that even the darkest cloud has a silver lining. It is this hope that drives the men and women of the Argent Crusade: hope that the Light will see them through these trying times, hope that good will triumph over evil, hope that a hero blessed by the Light will come forth to put an end to the Lich King's dark reign. \n\nSo the Argent Crusade has sent out the call, a call to arms for all heroes far and wide, to meet at the very doorstep of the Lich King's domain and to prove their might in a tournament the likes of which Azeroth has never seen. Of course, a tournament such as this needs a fitting stage. A place where potential candidates are tested to the limits of exhaustion. A place where heroes... become champions. A place called the Crusaders' Coliseum."
Inst87Caption = "Trial of the Champion"
Inst87QAA = "No Quests"
Inst87QAH = "No Quests"



--------------- INST88 - Trial of the Crusader ---------------

Inst88Story = "The time to strike at the heart of the Scourge is drawing close. Clouds blanket the skies of Azeroth and heroes gather beneath battle-worn banners in preparation for the coming storm. They say that even the darkest cloud has a silver lining. It is this hope that drives the men and women of the Argent Crusade: hope that the Light will see them through these trying times, hope that good will triumph over evil, hope that a hero blessed by the Light will come forth to put an end to the Lich King's dark reign. \n\nSo the Argent Crusade has sent out the call, a call to arms for all heroes far and wide, to meet at the very doorstep of the Lich King's domain and to prove their might in a tournament the likes of which Azeroth has never seen. Of course, a tournament such as this needs a fitting stage. A place where potential candidates are tested to the limits of exhaustion. A place where heroes... become champions. A place called the Crusaders' Coliseum."
Inst88Caption = "Trial of the Crusader"
Inst88QAA = "1 Quest"
Inst88QAH = "1 Quest"

--Quest 1 Alliance
Inst88Quest1 = "1. Lord Jaraxxus Must Die! (Weekly)"
Inst88Quest1_Level = "80"
Inst88Quest1_Attain = "80"
Inst88Quest1_Aim = "Kill Lord Jaraxxus."
Inst88Quest1_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst88Quest1_Note = "Lord Jaraxxus is the second boss.\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst88Quest1_Prequest = "None"
Inst88Quest1_Folgequest = "None"
--
Inst88Quest1name1 = "Emblem of Frost"
Inst88Quest1name2 = "Emblem of Triumph"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst88Quest1_HORDE = Inst88Quest1
Inst88Quest1_HORDE_Level = Inst88Quest1_Level
Inst88Quest1_HORDE_Attain = Inst88Quest1_Attain
Inst88Quest1_HORDE_Aim = Inst88Quest1_Aim
Inst88Quest1_HORDE_Location = Inst88Quest1_Location
Inst88Quest1_HORDE_Note = Inst88Quest1_Note
Inst88Quest1_HORDE_Prequest = Inst88Quest1_Prequest
Inst88Quest1_HORDE_Folgequest = Inst88Quest1_Folgequest
--
Inst88Quest1name1_HORDE = Inst88Quest1name1
Inst88Quest1name2_HORDE = Inst88Quest1name2



--------------- INST90 - Forge of Souls (FoS)  ---------------

Inst90Story = "Serving as the first wing in this expansive dungeon, the Forge of Souls will quickly put players to the test of carving through the Scourge stronghold into deeper, more treacherous locations. Jaina will command Alliance forces, and Sylvanas will direct Horde forces. The goal is to ruin the twisted engines known as soul grinders found in this portion of the citadel, and then players can advance -- that is, if the Horde and Alliance forces can overcome the foes who confront them."
Inst90Caption = "Forge of Souls"
Inst90QAA = "3 Quests"
Inst90QAH = "3 Quests"

--Quest 1 Alliance
Inst90Quest1 = "1. Inside the Frozen Citadel"
Inst90Quest1_Level = "80"
Inst90Quest1_Attain = "80"
Inst90Quest1_Aim = "Enter The Forge of Souls from the side of Icecrown Citadel and find Lady Jaina Proudmoore."
Inst90Quest1_Location = "Apprentice Nelphi (Dalaran City - Roams outside South Bank)"
Inst90Quest1_Note = "Lady Jaina Proudmoore is just inside the instance."
Inst90Quest1_Prequest = "None"
Inst90Quest1_Folgequest = "Echoes of Tortured Souls"
-- No Rewards for this quest

--Quest 2 Alliance
Inst90Quest2 = "2. Echoes of Tortured Souls"
Inst90Quest2_Level = "80"
Inst90Quest2_Attain = "80"
Inst90Quest2_Aim = "Kill Bronjahm and the Devourer of Souls to secure access to the Pit of Saron."
Inst90Quest2_Location = "Lady Jaina Proudmoore (Forge of Souls; "..YELLOW.."Entrance"..WHITE..")"
Inst90Quest2_Note = "Turn the quest in to Lady Jaina Proudmoore before at "..YELLOW.."[3]"..WHITE.." before you leave the instance.\n\nCompleting this quest is required to enter the Pit of Saron."
Inst90Quest2_Prequest = "Inside the Frozen Citadel"
Inst90Quest2_Folgequest = "The Pit of Saron ("..YELLOW.."Pit of Saron"..WHITE..")"
Inst90Quest2FQuest = "true"
--
Inst90Quest2name1 = "Emblem of Frost"

--Quest 3 Alliance
Inst90Quest3 = "3. Tempering The Blade"
Inst90Quest3_Level = "80"
Inst90Quest3_Attain = "80"
Inst90Quest3_Aim = "Temper the Reforged Quel'Delar in the Crucible of Souls."
Inst90Quest3_Location = "Caladis Brightspear (Icecrown - Quel'Delar's Rest; "..YELLOW.."74.2, 31.3"..WHITE..")"
Inst90Quest3_Note = "The Crucible of Souls is at "..YELLOW.."[3]"..WHITE..", near the end of the instance."
Inst90Quest3_Prequest = "Reforging The Sword ("..YELLOW.."Pit of Saron"..WHITE..")"
Inst90Quest3_Folgequest = "The Halls Of Reflection ("..YELLOW.."Halls of Reflection"..WHITE..")"
Inst90Quest3PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst90Quest1_HORDE = "1. Inside the Frozen Citadel"
Inst90Quest1_HORDE_Level = "80"
Inst90Quest1_HORDE_Attain = "80"
Inst90Quest1_HORDE_Aim = "Enter The Forge of Souls from the side of Icecrown Citadel and locate Lady Sylvanas Windrunner."
Inst90Quest1_HORDE_Location = "Dark Ranger Vorel (Dalaran City - Roams outside North Bank)"
Inst90Quest1_HORDE_Note = "Lady Sylvanas Windrunner is just inside the instance."
Inst90Quest1_HORDE_Prequest = "None"
Inst90Quest1_HORDE_Folgequest = "Echoes of Tortured Souls"
-- No Rewards for this quest

--Quest 2 Horde
Inst90Quest2_HORDE = "2. Echoes of Tortured Souls"
Inst90Quest2_HORDE_Level = "80"
Inst90Quest2_HORDE_Attain = "80"
Inst90Quest2_HORDE_Aim = "Kill Bronjahm and the Devourer of Souls to secure access to the Pit of Saron."
Inst90Quest2_HORDE_Location = "Lady Sylvanas Windrunner (Forge of Souls; "..YELLOW.."Entrance"..WHITE..")"
Inst90Quest2_HORDE_Note = "Turn the quest in to Lady Sylvanas Windrunner before at "..YELLOW.."[3]"..WHITE.." before you leave the instance.\n\nCompleting this quest is required to enter the Pit of Saron."
Inst90Quest2_HORDE_Prequest = "Inside the Frozen Citadel"
Inst90Quest2_HORDE_Folgequest = "The Pit of Saron ("..YELLOW.."Pit of Saron"..WHITE..")"
Inst90Quest2FQuest_HORDE = "true"
--
Inst90Quest2name1_HORDE = "Emblem of Frost"

--Quest 3 Horde
Inst90Quest3_HORDE = "3. Tempering The Blade"
Inst90Quest3_HORDE_Level = "80"
Inst90Quest3_HORDE_Attain = "80"
Inst90Quest3_HORDE_Aim = "Temper the Reforged Quel'Delar in the Crucible of Souls."
Inst90Quest3_HORDE_Location = "Myralion Sunblaze (Icecrown - Quel'Delar's Rest; "..YELLOW.."74.5, 31.1"..WHITE..")"
Inst90Quest3_HORDE_Note = "The Crucible of Souls is at "..YELLOW.."[3]"..WHITE..", near the end of the instance."
Inst90Quest3_HORDE_Prequest = "Reforging The Sword ("..YELLOW.."Pit of Saron"..WHITE..")"
Inst90Quest3_HORDE_Folgequest = "The Halls Of Reflection ("..YELLOW.."Halls of Reflection"..WHITE..")"
Inst90Quest3PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST91 - Pit of Saron (PoS)  ---------------

Inst91Story = "Accessible only to those who have laid waste to the Forge of Souls' unholy operations, the Pit of Saron will bring Horde and Alliance forces deeper into the Lich King's domain. Players who venture here will immediately be confronted by the lord of this lair, Scourgelord Tyrannus. But defeating him will not be as easy as it seems. Before they can present a threat to Tyrannus, the adventurers, instructed by their leaders, will need to free enslaved allies who have been trapped by the Scourge. Until that happens, Tyrannus will leave all adversaries to his minions, workers of the citadel's mines. Perhaps the challenges here will lend clues as to the whereabouts of the Lich King's private chambers outside of the Frozen Throne, deep within the Halls of Reflection."
Inst91Caption = "Pit of Saron"
Inst91QAA = "4 Quests"
Inst91QAH = "4 Quests"

--Quest 1 Alliance
Inst91Quest1 = "1. The Pit of Saron"
Inst91Quest1_Level = "80"
Inst91Quest1_Attain = "80"
Inst91Quest1_Aim = "Meet Lady Jaina Proudmoore just inside the Pit of Saron."
Inst91Quest1_Location = "Lady Jaina Proudmoore (Forge of Souls; "..YELLOW.."[3]"..WHITE..")"
Inst91Quest1_Note = "Lady Jaina Proudmoore is just inside the instance."
Inst91Quest1_Prequest = "Echoes of Tortured Souls ("..YELLOW.."Forge of Souls"..WHITE..")"
Inst91Quest1_Folgequest = "The Path to the Citadel"
Inst91Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst91Quest2 = "2. The Path to the Citadel"
Inst91Quest2_Level = "80"
Inst91Quest2_Attain = "80"
Inst91Quest2_Aim = "Free 15 Alliance Slaves and kill Forgemaster Garfrost."
Inst91Quest2_Location = "Lady Jaina Proudmoore (Pit of Saron; "..YELLOW.."[1]"..WHITE..")"
Inst91Quest2_Note = "The slaves are all over the pit. The quest turns in to Martin Victus at "..YELLOW.."[2]"..WHITE.." after Forgemaster Garfrost is slain."
Inst91Quest2_Prequest = "The Pit of Saron"
Inst91Quest2_Folgequest = "Deliverance from the Pit"
Inst91Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst91Quest3 = "3. Deliverance from the Pit"
Inst91Quest3_Level = "80"
Inst91Quest3_Attain = "80"
Inst91Quest3_Aim = "Kill Scourgelord Tyrannus."
Inst91Quest3_Location = "Martin Victus (Pit of Saron; "..YELLOW.."[1]"..WHITE..")"
Inst91Quest3_Note = "Scourgelord Tyrannus is at the end of the instance. Completing this quest is required to enter the Halls of Reflection.\n\nRemember to turn the quest in to Lady Jaina Proudmoore before leaving."
Inst91Quest3_Prequest = "The Path to the Citadel"
Inst91Quest3_Folgequest = "Frostmourne ("..YELLOW.."Halls of Reflection"..WHITE..")"
Inst91Quest3FQuest = "true"
--
Inst91Quest3name1 = "Emblem of Frost"

--Quest 4 Alliance
Inst91Quest4 = "4. Reforging The Sword"
Inst91Quest4_Level = "80"
Inst91Quest4_Attain = "80"
Inst91Quest4_Aim = "Obtain 5 Infused Saronite Bars and the Forgemaster's Hammer and use them to make the Reforged Quel'Delar."
Inst91Quest4_Location = "Caladis Brightspear (Icecrown - Quel'Delar's Rest; "..YELLOW.."74.2, 31.3"..WHITE..")"
Inst91Quest4_Note = "The Infused Saronite Bars are spread out around the Pit.  Use the hammer that drops from Forgemaster Garfrost at the anvil near him."
Inst91Quest4_Prequest = "Return To Caladis Brightspear"
Inst91Quest4_Folgequest = "Tempering The Blade ("..YELLOW.."Forge of Souls"..WHITE..")"
Inst91Quest4PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst91Quest1_HORDE = "1. The Pit of Saron"
Inst91Quest1_HORDE_Level = "80"
Inst91Quest1_HORDE_Attain = "80"
Inst91Quest1_HORDE_Aim = "Meet Lady Sylvanas Windrunner inside the entrace to the Pit of Saron."
Inst91Quest1_HORDE_Location = "Lady Sylvanas Windrunner (Forge of Souls; "..YELLOW.."[3]"..WHITE..")"
Inst91Quest1_HORDE_Note = "Lady Sylvanas Windrunner is just inside the instance."
Inst91Quest1_HORDE_Prequest = "Echoes of Tortured Souls ("..YELLOW.."Forge of Souls"..WHITE..")"
Inst91Quest1_HORDE_Folgequest = "The Path to the Citadel"
Inst91Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst91Quest2_HORDE = "2. The Path to the Citadel"
Inst91Quest2_HORDE_Level = "80"
Inst91Quest2_HORDE_Attain = "80"
Inst91Quest2_HORDE_Aim = "Free 15 Horde Slaves and kill Forgemaster Garfrost."
Inst91Quest2_HORDE_Location = "Lady Sylvanas Windrunner (Pit of Saron; "..YELLOW.."[1]"..WHITE..")"
Inst91Quest2_HORDE_Note = "The slaves are all over the pit. The quest turns in to Gorkun Ironskull at "..YELLOW.."[2]"..WHITE.." after Forgemaster Garfrost is slain."
Inst91Quest2_HORDE_Prequest = "The Pit of Saron"
Inst91Quest2_HORDE_Folgequest = "Deliverance from the Pit"
Inst91Quest2FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde
Inst91Quest3_HORDE = "3. Deliverance from the Pit"
Inst91Quest3_HORDE_Level = "80"
Inst91Quest3_HORDE_Attain = "80"
Inst91Quest3_HORDE_Aim = "Kill Scourgelord Tyrannus."
Inst91Quest3_HORDE_Location = "Gorkun Ironskull (Pit of Saron; "..YELLOW.."[1]"..WHITE..")"
Inst91Quest3_HORDE_Note = "Scourgelord Tyrannus is at the end of the instance. Completing this quest is required to enter the Halls of Reflection.\n\nRemember to turn the quest in to Lady Sylvanas Windrunner before leaving."
Inst91Quest3_HORDE_Prequest = "The Path to the Citadel"
Inst91Quest3_HORDE_Folgequest = "Frostmourne ("..YELLOW.."Halls of Reflection"..WHITE..")"
Inst91Quest3FQuest_HORDE = "true"
--
Inst91Quest3name1_HORDE = "Emblem of Frost"

--Quest 4 Horde
Inst91Quest4_HORDE = "4. Reforging The Sword"
Inst91Quest4_HORDE_Level = "80"
Inst91Quest4_HORDE_Attain = "80"
Inst91Quest4_HORDE_Aim = "Obtain 5 Infused Saronite Bars and the Forgemaster's Hammer, then combine them with the Remnants of Quel'Delar to create the Reforged Quel'Delar."
Inst91Quest4_HORDE_Location = "Myralion Sunblaze (Icecrown - Quel'Delar's Rest; "..YELLOW.."74.5, 31.1"..WHITE..")"
Inst91Quest4_HORDE_Note = "The Infused Saronite Bars are spread out around the Pit.  Use the hammer that drops from Forgemaster Garfrost at the anvil near him."
Inst91Quest4_HORDE_Prequest = "Return To Myralion Sunblaze"
Inst91Quest4_HORDE_Folgequest = "Tempering The Blade ("..YELLOW.."Forge of Souls"..WHITE..")"
Inst91Quest4PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST92 - Halls of Reflection (HoR)  ---------------

Inst92Story = "With Jaina and Sylvanas leading the way, adventurers who make it as far as these frigid halls will quickly recognize the weapon that lies ahead: Frostmourne, the corruptive, legendary device of the Lich King himself. The Lich King's private chambers are within reach, although they may be the death of anyone who ventures there."
Inst92Caption = "Halls of Reflection"
Inst92QAA = "3 Quests"
Inst92QAH = "3 Quests"

--Quest 1 Alliance
Inst92Quest1 = "1. Frostmourne"
Inst92Quest1_Level = "80"
Inst92Quest1_Attain = "80"
Inst92Quest1_Aim = "Meet Lady Jaina Proudmoore at the entrance to the Halls of Reflection."
Inst92Quest1_Location = "Lady Jaina Proudmoore (Pit of Saron; "..YELLOW.."[3]"..WHITE..")"
Inst92Quest1_Note = "You get the quest from Lady Jaina Proudmoore at the end of Pit of Saron and then complete it by entering Halls of Reflection.  Be sure all party members have turned the quest in before proceeding. The followup will be given after the event is completed."
Inst92Quest1_Prequest = "Deliverance from the Pit ("..YELLOW.."Pit of Saron"..WHITE..")"
Inst92Quest1_Folgequest = "Wrath of the Lich King"
Inst92Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst92Quest2 = "2. Wrath of the Lich King"
Inst92Quest2_Level = "80"
Inst92Quest2_Attain = "80"
Inst92Quest2_Aim = "Find Lady Jaina Proudmoore and escape the Halls of Reflection."
Inst92Quest2_Location = "Halls of Reflection"
Inst92Quest2_Note = "Lady Jaina Proudmoore is up ahead. You turn the quest into her after the end of the super awesome event."
Inst92Quest2_Prequest = "Frostmourne"
Inst92Quest2_Folgequest = "None"
Inst92Quest2FQuest = "true"
--
Inst92Quest2name1 = "Emblem of Frost"

--Quest 3 Alliance
Inst92Quest3 = "3. The Halls Of Reflection"
Inst92Quest3_Level = "80"
Inst92Quest3_Attain = "80"
Inst92Quest3_Aim = "Bring your Tempered Quel'Delar to Sword's Rest inside the Halls of Reflection."
Inst92Quest3_Location = "Caladis Brightspear (Icecrown - Quel'Delar's Rest; "..YELLOW.."74.2, 31.3"..WHITE..")"
Inst92Quest3_Note = "You can complete the quest just inside the instance."
Inst92Quest3_Prequest = "Tempering The Blade ("..YELLOW.."Forge of Souls"..WHITE..")"
Inst92Quest3_Folgequest = "Journey To The Sunwell"
Inst92Quest3PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst92Quest1_HORDE = "1. Frostmourne"
Inst92Quest1_HORDE_Level = "80"
Inst92Quest1_HORDE_Attain = "80"
Inst92Quest1_HORDE_Aim = "Meet Lady Sylvanas Windrunner inside the entrance to the Halls of Reflection."
Inst92Quest1_HORDE_Location = "Lady Sylvanas Windrunner (Pit of Saron; "..YELLOW.."[3]"..WHITE..")"
Inst92Quest1_HORDE_Note = "You get the quest from Lady Sylvanas Windrunner at the end of Pit of Saron and then complete it by entering Halls of Reflection.  Be sure all party members have turned the quest in before proceeding. The followup will be given after the event is completed."
Inst92Quest1_HORDE_Prequest = "Deliverance from the Pit ("..YELLOW.."Pit of Saron"..WHITE..")"
Inst92Quest1_HORDE_Folgequest = "Wrath of the Lich King"
Inst92Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst92Quest2_HORDE = "2. Wrath of the Lich King"
Inst92Quest2_HORDE_Level = "80"
Inst92Quest2_HORDE_Attain = "80"
Inst92Quest2_HORDE_Aim = "Find Lady Sylvanas Windrunner and escape the Halls of Reflection."
Inst92Quest2_HORDE_Location = "Halls of Reflection"
Inst92Quest2_HORDE_Note = "Lady Sylvanas Windrunner is up ahead. You turn the quest into her after the end of the super awesome event."
Inst92Quest2_HORDE_Prequest = "Frostmourne"
Inst92Quest2_HORDE_Folgequest = "None"
Inst92Quest2FQuest_HORDE = "true"
--
Inst92Quest2name1_HORDE = "Emblem of Frost"

--Quest 3 Horde
Inst92Quest3_HORDE = "3. The Halls Of Reflection"
Inst92Quest3_HORDE_Level = "80"
Inst92Quest3_HORDE_Attain = "80"
Inst92Quest3_HORDE_Aim = "Bring your Tempered Quel'Delar to Sword's Rest inside the Halls of Reflection."
Inst92Quest3_HORDE_Location = "Myralion Sunblaze (Icecrown - Quel'Delar's Rest; "..YELLOW.."74.5, 31.1"..WHITE..")"
Inst92Quest3_HORDE_Note = "You can complete the quest just inside the instance."
Inst92Quest3_HORDE_Prequest = "Tempering The Blade ("..YELLOW.."Forge of Souls"..WHITE..")"
Inst92Quest3_HORDE_Folgequest = "Journey To The Sunwell"
Inst92Quest3PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST93 - Icecrown Citadel (ICC)  ---------------

Inst93Story = "After breaching the fortress, players will face a legion of undead guards directed to repel any invaders. Commanding the defenders is Lord Marrowgar, a monstrosity fused together from the bones of the undead. Supreme Overseer of the Cult of the Damned, Lady Deathwhisper is the next opponent. She bolsters the faith of her followers by promising them the opportunity to give eternal service in undeath.\n\nAs they continue their ascent, the Alliance and Horde heroes ultimately end up outside of the citadel where their hatred for one another erupts into a battle for dominance over the Rampart of Skulls. Players will join in battle alongside High Overlord Saurfang on the Orgrim's Hammer gunship or Muradin Bronzebeard on The Skybreaker in a unique encounter. Each faction will protect its gunship and try to destroy the other one in a back-and-forth battle to see who is truly worthy of facing the Lich King."
Inst93Caption = "Icecrown Citadel"
Inst93QAA = "15 Quests"
Inst93QAH = "15 Quests"

--Quest 1 Alliance
Inst93Quest1 = "1. Lord Marrowgar Must Die! (Weekly)"
Inst93Quest1_Level = "80"
Inst93Quest1_Attain = "80"
Inst93Quest1_Aim = "Kill Lord Marrowgar."
Inst93Quest1_Location = "Archmage Lan'dalock (Dalaran - The Violet Hold; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst93Quest1_Note = "Lord Marrowgar is at "..YELLOW.." [1]"..WHITE..".\n\nRaid Weekly quests can be completed once a week and done on either 10 or 25 man."
Inst93Quest1_Prequest = "None"
Inst93Quest1_Folgequest = "None"
--
Inst93Quest1name1 = "Emblem of Frost"
Inst93Quest1name2 = "Emblem of Triumph"

--Quest 2 Alliance
Inst93Quest2 = "2. Deprogramming (Random Weekly)"
Inst93Quest2_Level = "80"
Inst93Quest2_Attain = "80"
Inst93Quest2_Aim = "Defeat Lady Deathwhisper while ensuring that Darnavan survives."
Inst93Quest2_Location = "Infiltrator Minchar (Icecrown Citadel; "..YELLOW.."Near [1]"..WHITE..")"
Inst93Quest2_Note = "If this quest is available for your raid id, Infiltrator Minchar will appear after you slay Lord Marrowgar.\n\nDuring the Lady Deathwhisper encounter, Darnavan will spawn. He must be kept alive throughout the entire fight to complete the quest."
Inst93Quest2_Prequest = "None"
Inst93Quest2_Folgequest = "None"
--
Inst93Quest2name1 = "Sack of Frosty Treasures"

--Quest 3 Alliance
Inst93Quest3 = "3. Securing the Ramparts (Random Weekly)"
Inst93Quest3_Level = "80"
Inst93Quest3_Attain = "80"
Inst93Quest3_Aim = "Slay the Rotting Frost Giant."
Inst93Quest3_Location = "Skybreaker Lieutenant (Icecrown Citadel; "..GREEN.."[3']"..WHITE..")"
Inst93Quest3_Note = "If this quest is available for your raid id, the Skybreaker Lieutenant will appear when you kill the first trash pull after Lady Deathwhisper.\n\nThe Rotting Frost giant can be found patroling the rampart."
Inst93Quest3_Prequest = "None"
Inst93Quest3_Folgequest = "None"
--
Inst93Quest3name1 = "Sack of Frosty Treasures"

--Quest 4 Alliance
Inst93Quest4 = "4. Residue Rendezvous (Random Weekly)"
Inst93Quest4_Level = "80"
Inst93Quest4_Attain = "80"
Inst93Quest4_Aim = "Return to Alchemist Adrianna while infected with Orange and Green Blight."
Inst93Quest4_Location = "Alchemist Adrianna (Icecrown Citadel; "..GREEN.."[4']"..WHITE..")"
Inst93Quest4_Note = "If this quest is available for your raid id, Alchemist Adrianna will appear after you activate the teleporter past Deathbringer Saurfang.\n\nTo complete the quest at least one raid member must obtain the debuffs from both Festergut and Rotface and return to Alchemist Adrianna within 30 minutes of obtaining the first debuff. All raid members with the quest will receive credit."
Inst93Quest4_Page = {2, "The debuffs go away upon death, logging out, divine intervention and divine shield and possibly other abilities. Hunters who use feign death and survive will retain the debuffs.", };
Inst93Quest4_Prequest = "None"
Inst93Quest4_Folgequest = "None"
--
Inst93Quest4name1 = "Sack of Frosty Treasures"

--Quest 5 Alliance
Inst93Quest5 = "5. Blood Quickening (Random Weekly)"
Inst93Quest5_Level = "80"
Inst93Quest5_Attain = "80"
Inst93Quest5_Aim = "Rescue Infiltrator Minchar before he is executed."
Inst93Quest5_Location = "Alrin the Agile (Icecrown Citadel; Entrance to Crimson Halls)"
Inst93Quest5_Note = "If this quest is available for your raid id, Alrin the Agile will appear at the entrance to the Crimson Halls.\n\nThe 30 minute timer begins upon entering Crimson Halls. You must clear all trash, defeat the Blood Princes and Blood Queen Lana'thel before the timer runs out to complete the quest."
Inst93Quest5_Prequest = "None"
Inst93Quest5_Folgequest = "None"
--
Inst93Quest5name1 = "Sack of Frosty Treasures"

--Quest 6 Alliance
Inst93Quest6 = "6. Respite for a Tormented Soul (Random Weekly)"
Inst93Quest6_Level = "80"
Inst93Quest6_Attain = "80"
Inst93Quest6_Aim = "Use the Life Crystals to preserve Sindragosa's Essence."
Inst93Quest6_Location = "Valithria Dreamwalker (Icecrown Citadel; "..YELLOW.."[11]"..WHITE..")"
Inst93Quest6_Note = "If this quest is available for your raid id, Valithria Dreamwalker will give you the quest after you complete that encounter.\n\nTo complete the quest, raid members must use the provided item to stack debuffs (30 on 10 player, 75 on 25 player) on Sindragosa when she is at 20% health or lower. If successful and Sindragosa gets an aura of Soul Preservation before she dies, the quest is completed."
Inst93Quest6_Prequest = "None"
Inst93Quest6_Folgequest = "None"
--
Inst93Quest6name1 = "Sack of Frosty Treasures"

--Quest 7 Alliance
Inst93Quest7 = "7. The Sacred and the Corrupt"
Inst93Quest7_Level = "80"
Inst93Quest7_Attain = "80"
Inst93Quest7_Aim = "Place Light's Vengeance, 25 Primordial Saronite, Rotface's Acidic Blood, and Festergut's Acidic Blood in Highlord Mograine's runeforge in Icecrown Citadel."
Inst93Quest7_Location = "Highlord Darion Mograine (Icecrown Citadel; "..GREEN.."[1']"..WHITE..")"
Inst93Quest7_Note = "This questline is only available to Warriors, Paladins and Death Knights. Highlord Mograine's runeforge is in the entrance of Icecrown Citadel.\n\nRotface's Acidic Blood and Festergut's Acidic Blood only drop from the 25-player version and can only be looted by one player per raid lockout."
Inst93Quest7_Prequest = "None"
Inst93Quest7_Folgequest = "Shadow's Edge"
-- No Rewards for this quest

--Quest 8 Alliance
Inst93Quest8 = "8. Shadow's Edge"
Inst93Quest8_Level = "80"
Inst93Quest8_Attain = "80"
Inst93Quest8_Aim = "Wait for Mograine to forge your weapon."
Inst93Quest8_Location = "Highlord Darion Mograine (Icecrown Citadel; "..GREEN.."[1']"..WHITE..")"
Inst93Quest8_Note = "Watch as Mograine forges your weapon, and collect it when he's done."
Inst93Quest8_Prequest = "The Sacred and the Corrupt"
Inst93Quest8_Folgequest = "A Feast of Souls"
Inst93Quest8FQuest = "true"
--
Inst93Quest8name1 = "Shadow's Edge"

--Quest 9 Alliance
Inst93Quest9 = "9. A Feast of Souls"
Inst93Quest9_Level = "80"
Inst93Quest9_Attain = "80"
Inst93Quest9_Aim = "Highlord Darion Mograine wants you to use Shadow's Edge to slay 1000 of the Lich King's minions in Icecrown Citadel. Souls can be obtained in 10 or 25 person difficulty."
Inst93Quest9_Location = "Highlord Darion Mograine (Icecrown Citadel; "..GREEN.."[1']"..WHITE..")"
Inst93Quest9_Note = "You've got a lot of killing to do. Only kills in Icecrown Citadel count towards the 1000."
Inst93Quest9_Prequest = "Shadow's Edge"
Inst93Quest9_Folgequest = "Unholy Infusion"
Inst93Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst93Quest10 = "10. Unholy Infusion"
Inst93Quest10_Level = "80"
Inst93Quest10_Attain = "80"
Inst93Quest10_Aim = "Highlord Darion Mograine wants you to infuse Shadow's Edge with Unholy power and slay Professor Putricide."
Inst93Quest10_Location = "Highlord Darion Mograine (Icecrown Citadel; "..GREEN.."[1']"..WHITE..")"
Inst93Quest10_Note = "This quest can only be completed in 25-player mode.\n\nTo infuse Shadow's Edge you must take control of the Abomination during the Professor Putricide encounter and use the special ability called Shadow Infusion."
Inst93Quest10_Prequest = "A Feast of Souls"
Inst93Quest10_Folgequest = "Blood Infusion"
Inst93Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst93Quest11 = "11. Blood Infusion"
Inst93Quest11_Level = "80"
Inst93Quest11_Attain = "80"
Inst93Quest11_Aim = "Highlord Darion Mograine wants you to infuse Shadow's Edge with blood and defeat Queen Lana'thel."
Inst93Quest11_Location = "Highlord Darion Mograine (Icecrown Citadel; "..GREEN.."[1']"..WHITE..")"
Inst93Quest11_Note = "This quest can only be completed in 25-player mode.\n\nTo complete the quest, get the Blood Mirror debuff. Then, assuming you're not bitten first, have the first person bitten bite you. Bite three more people and survive the encounter to complete the quest. Info from hobbesmarcus on WoWhead.com"
Inst93Quest11_Prequest = "Unholy Infusion"
Inst93Quest11_Folgequest = "Frost Infusion"
Inst93Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst93Quest12 = "12. Frost Infusion"
Inst93Quest12_Level = "80"
Inst93Quest12_Attain = "80"
Inst93Quest12_Aim = "Highlord Darion Mograine has instructed you to slay Sindragosa after subjecting yourself to 4 of her breath attacks while wielding Shadow's Edge."
Inst93Quest12_Location = "Highlord Darion Mograine (Icecrown Citadel; "..GREEN.."[1']"..WHITE..")"
Inst93Quest12_Note = "This quest can only be completed in 25-player mode.\n\nAfter receiving the Frost-Imbued Blade buff from the 4 breath attacks, you must kill Sindragosa within 6 minutes to complete the quest. "
Inst93Quest12_Prequest = "Blood Infusion"
Inst93Quest12_Folgequest = "The Splintered Throne"
Inst93Quest12FQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst93Quest13 = "13. The Splintered Throne"
Inst93Quest13_Level = "80"
Inst93Quest13_Attain = "80"
Inst93Quest13_Aim = "Highlord Darion Mograine wants you to collect 50 Shadowfrost Shards."
Inst93Quest13_Location = "Highlord Darion Mograine (Icecrown Citadel; "..GREEN.."[1']"..WHITE..")"
Inst93Quest13_Note = "This quest can only be completed in 25-player mode.\n\nThe Shadowfrost Shards are rare drops from bosses."
Inst93Quest13_Prequest = "Frost Infusion"
Inst93Quest13_Folgequest = "Shadowmourne..."
Inst93Quest13FQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst93Quest14 = "14. Shadowmourne..."
Inst93Quest14_Level = "80"
Inst93Quest14_Attain = "80"
Inst93Quest14_Aim = "Highlord Darion Mograine wants you to bring him Shadow's Edge."
Inst93Quest14_Location = "Highlord Darion Mograine (Icecrown Citadel; "..GREEN.."[1']"..WHITE..")"
Inst93Quest14_Note = "This quest upgrades your Shadow's Edge to Shadowmourne."
Inst93Quest14_Prequest = "The Splintered Throne"
Inst93Quest14_Folgequest = "The Lich King's Last Stand"
Inst93Quest14FQuest = "true"
--
Inst93Quest14name1 = "Shadowmourne"

--Quest 15 Alliance
Inst93Quest15 = "15. The Lich King's Last Stand"
Inst93Quest15_Level = "80"
Inst93Quest15_Attain = "80"
Inst93Quest15_Aim = "Highlord Darion Mograine in Icecrown Citadel wants you to kill the Lich King."
Inst93Quest15_Location = "Highlord Darion Mograine (Icecrown Citadel; "..GREEN.."[1']"..WHITE..")"
Inst93Quest15_Note = "This quest can only be completed in 25-player mode."
Inst93Quest15_Prequest = "Shadowmourne..."
Inst93Quest15_Folgequest = "None"
Inst93Quest15FQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst93Quest1_HORDE = Inst93Quest1
Inst93Quest1_HORDE_Level = Inst93Quest1_Level
Inst93Quest1_HORDE_Attain = Inst93Quest1_Attain
Inst93Quest1_HORDE_Aim = Inst93Quest1_Aim
Inst93Quest1_HORDE_Location = Inst93Quest1_Location
Inst93Quest1_HORDE_Note = Inst93Quest1_Note
Inst93Quest1_HORDE_Prequest = Inst93Quest1_Prequest
Inst93Quest1_HORDE_Folgequest = Inst93Quest1_Folgequest
--
Inst93Quest1name1_HORDE = Inst93Quest1name1
Inst93Quest1name2_HORDE = Inst93Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst93Quest2_HORDE = Inst93Quest2
Inst93Quest2_HORDE_Level = Inst93Quest2_Level
Inst93Quest2_HORDE_Attain = Inst93Quest2_Attain
Inst93Quest2_HORDE_Aim = Inst93Quest2_Aim
Inst93Quest2_HORDE_Location = Inst93Quest2_Location
Inst93Quest2_HORDE_Note = Inst93Quest2_Note
Inst93Quest2_HORDE_Prequest = Inst93Quest2_Prequest
Inst93Quest2_HORDE_Folgequest = Inst93Quest2_Folgequest
--
Inst93Quest2name1_HORDE = Inst93Quest2name1

--Quest 3 Horde
Inst93Quest3_HORDE = "3. Securing the Ramparts (Weekly)"
Inst93Quest3_HORDE_Level = "80"
Inst93Quest3_HORDE_Attain = "80"
Inst93Quest3_HORDE_Aim = "Slay the Rotting Frost Giant."
Inst93Quest3_HORDE_Location = "Kor'kron Lieutenant (Icecrown Citadel; "..GREEN.."[3']"..WHITE..")"
Inst93Quest3_HORDE_Note = "This is one of five random quests that are available in Icecrown Citadel. If this is the quest for your raid id, the Kor'kron Lieutenant will appear when you kill the first trash pull after Lady Deathwhisper.\n\nThe Rotting Frost giant can be found patroling the rampart."
Inst93Quest3_HORDE_Prequest = "None"
Inst93Quest3_HORDE_Folgequest = "None"
--
Inst93Quest3name1_HORDE = "Sack of Frosty Treasures"

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst93Quest4_HORDE = Inst93Quest4
Inst93Quest4_HORDE_Level = Inst93Quest4_Level
Inst93Quest4_HORDE_Attain = Inst93Quest4_Attain
Inst93Quest4_HORDE_Aim = Inst93Quest4_Aim
Inst93Quest4_HORDE_Location = Inst93Quest4_Location
Inst93Quest4_HORDE_Note = Inst93Quest4_Note
Inst93Quest4_HORDE_Page = Inst93Quest4_Page
Inst93Quest4_HORDE_Prequest = Inst93Quest4_Prequest
Inst93Quest4_HORDE_Folgequest = Inst93Quest4_Folgequest
--
Inst93Quest4name1_HORDE = Inst93Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst93Quest5_HORDE = Inst93Quest5
Inst93Quest5_HORDE_Level = Inst93Quest5_Level
Inst93Quest5_HORDE_Attain = Inst93Quest5_Attain
Inst93Quest5_HORDE_Aim = Inst93Quest5_Aim
Inst93Quest5_HORDE_Location = Inst93Quest5_Location
Inst93Quest5_HORDE_Note = Inst93Quest5_Note
Inst93Quest5_HORDE_Prequest = Inst93Quest5_Prequest
Inst93Quest5_HORDE_Folgequest = Inst93Quest5_Folgequest
--
Inst93Quest5name1_HORDE = Inst93Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst93Quest6_HORDE = Inst93Quest6
Inst93Quest6_HORDE_Level = Inst93Quest6_Level
Inst93Quest6_HORDE_Attain = Inst93Quest6_Attain
Inst93Quest6_HORDE_Aim = Inst93Quest6_Aim
Inst93Quest6_HORDE_Location = Inst93Quest6_Location
Inst93Quest6_HORDE_Note = Inst93Quest6_Note
Inst93Quest6_HORDE_Prequest = Inst93Quest6_Prequest
Inst93Quest6_HORDE_Folgequest = Inst93Quest6_Folgequest
--
Inst93Quest6name1_HORDE = Inst93Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst93Quest7_HORDE = Inst93Quest7
Inst93Quest7_HORDE_Level = Inst93Quest7_Level
Inst93Quest7_HORDE_Attain = Inst93Quest7_Attain
Inst93Quest7_HORDE_Aim = Inst93Quest7_Aim
Inst93Quest7_HORDE_Location = Inst93Quest7_Location
Inst93Quest7_HORDE_Note = Inst93Quest7_Note
Inst93Quest7_HORDE_Prequest = Inst93Quest7_Prequest
Inst93Quest7_HORDE_Folgequest = Inst93Quest7_Folgequest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst93Quest8_HORDE = Inst93Quest8
Inst93Quest8_HORDE_Level = Inst93Quest8_Level
Inst93Quest8_HORDE_Attain = Inst93Quest8_Attain
Inst93Quest8_HORDE_Aim = Inst93Quest8_Aim
Inst93Quest8_HORDE_Location = Inst93Quest8_Location
Inst93Quest8_HORDE_Note = Inst93Quest8_Note
Inst93Quest8_HORDE_Prequest = Inst93Quest8_Prequest
Inst93Quest8_HORDE_Folgequest = Inst93Quest8_Folgequest
Inst93Quest8FQuest_HORDE = Inst93Quest8FQuest
--
Inst93Quest8name1_HORDE = Inst93Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst93Quest9_HORDE = Inst93Quest9
Inst93Quest9_HORDE_Level = Inst93Quest9_Level
Inst93Quest9_HORDE_Attain = Inst93Quest9_Attain
Inst93Quest9_HORDE_Aim = Inst93Quest9_Aim
Inst93Quest9_HORDE_Location = Inst93Quest9_Location
Inst93Quest9_HORDE_Note = Inst93Quest9_Note
Inst93Quest9_HORDE_Prequest = Inst93Quest9_Prequest
Inst93Quest9_HORDE_Folgequest = Inst93Quest9_Folgequest
Inst93Quest9FQuest_HORDE = Inst93Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst93Quest10_HORDE = Inst93Quest10
Inst93Quest10_HORDE_Level = Inst93Quest10_Level
Inst93Quest10_HORDE_Attain = Inst93Quest10_Attain
Inst93Quest10_HORDE_Aim = Inst93Quest10_Aim
Inst93Quest10_HORDE_Location = Inst93Quest10_Location
Inst93Quest10_HORDE_Note = Inst93Quest10_Note
Inst93Quest10_HORDE_Prequest = Inst93Quest10_Prequest
Inst93Quest10_HORDE_Folgequest = Inst93Quest10_Folgequest
Inst93Quest10FQuest_HORDE = Inst93Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst93Quest11_HORDE = Inst93Quest11
Inst93Quest11_HORDE_Level = Inst93Quest11_Level
Inst93Quest11_HORDE_Attain = Inst93Quest11_Attain
Inst93Quest11_HORDE_Aim = Inst93Quest11_Aim
Inst93Quest11_HORDE_Location = Inst93Quest11_Location
Inst93Quest11_HORDE_Note = Inst93Quest11_Note
Inst93Quest11_HORDE_Prequest = Inst93Quest11_Prequest
Inst93Quest11_HORDE_Folgequest = Inst93Quest11_Folgequest
Inst93Quest11FQuest_HORDE = Inst93Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst93Quest12_HORDE = Inst93Quest12
Inst93Quest12_HORDE_Level = Inst93Quest12_Level
Inst93Quest12_HORDE_Attain = Inst93Quest12_Attain
Inst93Quest12_HORDE_Aim = Inst93Quest12_Aim
Inst93Quest12_HORDE_Location = Inst93Quest12_Location
Inst93Quest12_HORDE_Note = Inst93Quest12_Note
Inst93Quest12_HORDE_Prequest = Inst93Quest12_Prequest
Inst93Quest12_HORDE_Folgequest = Inst93Quest12_Folgequest
Inst93Quest12FQuest_HORDE = Inst93Quest12FQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst93Quest13_HORDE = Inst93Quest13
Inst93Quest13_HORDE_Level = Inst93Quest13_Level
Inst93Quest13_HORDE_Attain = Inst93Quest13_Attain
Inst93Quest13_HORDE_Aim = Inst93Quest13_Aim
Inst93Quest13_HORDE_Location = Inst93Quest13_Location
Inst93Quest13_HORDE_Note = Inst93Quest13_Note
Inst93Quest13_HORDE_Prequest = Inst93Quest13_Prequest
Inst93Quest13_HORDE_Folgequest = Inst93Quest13_Folgequest
Inst93Quest13FQuest_HORDE = Inst93Quest13FQuest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst93Quest14_HORDE = Inst93Quest14
Inst93Quest14_HORDE_Level = Inst93Quest14_Level
Inst93Quest14_HORDE_Attain = Inst93Quest14_Attain
Inst93Quest14_HORDE_Aim = Inst93Quest14_Aim
Inst93Quest14_HORDE_Location = Inst93Quest14_Location
Inst93Quest14_HORDE_Note = Inst93Quest14_Note
Inst93Quest14_HORDE_Prequest = Inst93Quest14_Prequest
Inst93Quest14_HORDE_Folgequest = Inst93Quest14_Folgequest
Inst93Quest14FQuest_HORDE = Inst93Quest14FQuest
--
Inst93Quest14name1_HORDE = Inst93Quest14name1
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst93Quest15_HORDE = Inst93Quest15
Inst93Quest15_HORDE_Level = Inst93Quest15_Level
Inst93Quest15_HORDE_Attain = Inst93Quest15_Attain
Inst93Quest15_HORDE_Aim = Inst93Quest15_Aim
Inst93Quest15_HORDE_Location = Inst93Quest15_Location
Inst93Quest15_HORDE_Note = Inst93Quest15_Note
Inst93Quest15_HORDE_Prequest = Inst93Quest15_Prequest
Inst93Quest15_HORDE_Folgequest = Inst93Quest15_Folgequest
Inst93Quest15FQuest_HORDE = Inst93Quest15FQuest
-- No Rewards for this quest



--------------- INST94 - Ruby Sanctum (RS)  ---------------

Inst94Story = "A powerful war party of the Black Dragonflight, led by the fearsome Twilight dragon, Halion, have launched an assault upon the Ruby Sanctum beneath Wyrmrest Temple. By destroying the sanctum, the Black Dragonflight look to crush those that would stand in the way of their master’s reemergence into Azeroth and to ultimately shatter the Wyrmrest Accord – the sacred bond that unites the dragonflights.\n\nThe battle that is to come will surely deal a crippling blow to the Red Dragonflight, however, it is up to you to stop this unprecedented offensive and defend the Ruby Sanctum. First you must face the assault of Halion's servants, Saviana Ragefire, Baltharus the Warborn, and General Zarithrian, before squaring off against Halion the Twilight Destroyer, a new and deadly force in this realm."
Inst94Caption = "Ruby Sanctum"
Inst94QAA = "3 Quests"
Inst94QAH = "3 Quests"

--Quest 1 Alliance
Inst94Quest1 = "1. Trouble at Wyrmrest"
Inst94Quest1_Level = "80"
Inst94Quest1_Attain = "80"
Inst94Quest1_Aim = "Speak with Krasus at Wyrmrest Temple in Dragonblight."
Inst94Quest1_Location = "Rhonin (Dalaran - The Violet Citadel; "..YELLOW.."30.5, 48.4"..WHITE..")"
Inst94Quest1_Note = "Krasus is at (Dragonblight - Wyrmrest Temple; "..YELLOW.."59.8, 54.6"..WHITE..")."
Inst94Quest1_Prequest = "None"
Inst94Quest1_Folgequest = "Assault on the Sanctum"
-- No Rewards for this quest

--Quest 2 Alliance
Inst94Quest2 = "2. Assault on the Sanctum"
Inst94Quest2_Level = "80"
Inst94Quest2_Attain = "80"
Inst94Quest2_Aim = "Investigate the Ruby Sanctum beneath Wyrmrest Temple."
Inst94Quest2_Location = "Krasus (Dragonblight - Wyrmrest Temple; "..YELLOW.."59.8, 54.6"..WHITE..")"
Inst94Quest2_Note = "Sanctum Guardian Xerestrasza is inside the Ruby Sanctum and appears after you slay the second sub-boss, Baltharius the Warborn at "..YELLOW.."[4]"..WHITE.."."
Inst94Quest2_Prequest = "Trouble at Wyrmrest (optional)"
Inst94Quest2_Folgequest = "The Twilight Destroyer"
Inst94Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst94Quest3 = "3. The Twilight Destroyer"
Inst94Quest3_Level = "80"
Inst94Quest3_Attain = "80"
Inst94Quest3_Aim = "Defeat Halion and repel the invasion of the Ruby Sanctum."
Inst94Quest3_Location = "Sanctum Guardian Xerestrasza (Ruby Sanctum; "..YELLOW.."[A] Entrance"..WHITE..")"
Inst94Quest3_Note = "Halion is the main boss, located at "..YELLOW.."[1]"..WHITE.."."
Inst94Quest3_Prequest = "Trouble at Wyrmrest"
Inst94Quest3_Folgequest = "None"
Inst94Quest3FQuest = "true"
--
Inst94Quest3name1 = "Emblem of Frost"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst94Quest1_HORDE = Inst94Quest1
Inst94Quest1_HORDE_Level = Inst94Quest1_Level
Inst94Quest1_HORDE_Attain = Inst94Quest1_Attain
Inst94Quest1_HORDE_Aim = Inst94Quest1_Aim
Inst94Quest1_HORDE_Location = Inst94Quest1_Location
Inst94Quest1_HORDE_Note = Inst94Quest1_Note
Inst94Quest1_HORDE_Prequest = Inst94Quest1_Prequest
Inst94Quest1_HORDE_Folgequest = Inst94Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst94Quest2_HORDE = Inst94Quest2
Inst94Quest2_HORDE_Level = Inst94Quest2_Level
Inst94Quest2_HORDE_Attain = Inst94Quest2_Attain
Inst94Quest2_HORDE_Aim = Inst94Quest2_Aim
Inst94Quest2_HORDE_Location = Inst94Quest2_Location
Inst94Quest2_HORDE_Note = Inst94Quest2_Note
Inst94Quest2_HORDE_Prequest = Inst94Quest2_Prequest
Inst94Quest2_HORDE_Folgequest = Inst94Quest2_Folgequest
Inst94Quest2FQuest_HORDE = Inst94Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst94Quest3_HORDE = Inst94Quest3
Inst94Quest3_HORDE_Level = Inst94Quest3_Level
Inst94Quest3_HORDE_Attain = Inst94Quest3_Attain
Inst94Quest3_HORDE_Aim = Inst94Quest3_Aim
Inst94Quest3_HORDE_Location = Inst94Quest3_Location
Inst94Quest3_HORDE_Note = Inst94Quest3_Note
Inst94Quest3_HORDE_Prequest = Inst94Quest3_Prequest
Inst94Quest3_HORDE_Folgequest = Inst94Quest3_Folgequest
Inst94Quest3FQuest_HORDE = Inst94Quest3FQuest
--
Inst94Quest3name1_HORDE = Inst94Quest3name1




---------------------------------------------------
---------------- BATTLEGROUNDS --------------------
---------------------------------------------------



--------------- INST33 - Alterac Valley (AV) ---------------

Inst33Story = "Long ago, before the First War, the warlock Gul'dan exiled a clan of orcs called the Frostwolves to a hidden valley deep in the heart of the Alterac Mountains. It is here in the valley's southern reaches that the Frostwolves eked out a living until the coming of Thrall.\nAfter Thrall's triumphant uniting of the clans, the Frostwolves, now led by the Orc Shaman Drek'Thar, chose to remain in the valley they had for so long called their home. In recent times, however, the relative peace of the Frostwolves has been challenged by the arrival of the Dwarven Stormpike Expedition.\nThe Stormpikes have set up residence in the valley to search for natural resources and ancient relics. Despite their intentions, the Dwarven presence has sparked heated conflict with the Frostwolf Orcs to the south, who have vowed to drive the interlopers from their lands. "
Inst33Caption = "Alterac Valley"
Inst33QAA = "18 Quests"
Inst33QAH = "18 Quests"

--Quest 1 Alliance
Inst33Quest1 = "1. Call to Arms: Alterac Valley (Daily)"
Inst33Quest1_Level = "51"
Inst33Quest1_Attain = "51"
Inst33Quest1_Aim = "Win an Alterac Valley battleground match and return to an Alliance Brigadier General at any Alliance capital city, Wintergrasp, Dalaran or Shattrath."
Inst33Quest1_Location = "Alliance Brigadier General:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: The Silver Enclave - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Stormwind: Stormwind Keep - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Ironforge: Military Ward - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Darnassus: Warrior's Terrace - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Exodar: The Vault of Lights - "..YELLOW.."24.6, 55.4"
Inst33Quest1_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst33Quest1_Prequest = "None"
Inst33Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst33Quest2 = "2. The Sovereign Imperative"
Inst33Quest2_Level = "60"
Inst33Quest2_Attain = "51"
Inst33Quest2_Aim = "Travel to Alterac Valley in the Hillsbrad Foothills. Outside of the entrance tunnel, find and speak with Lieutenant Haggerdin."
Inst33Quest2_Location = "Lieutenant Rotimer (Ironforge - The Commons; "..YELLOW.."30,62"..WHITE..")"
Inst33Quest2_Note = "Lieutenant Haggerdin is at (Alterac Mountains; "..YELLOW.."39,81"..WHITE..")."
Inst33Quest2_Prequest = "None"
Inst33Quest2_Folgequest = "Proving Grounds"
-- No Rewards for this quest

--Quest 3 Alliance
Inst33Quest3 = "3. Proving Grounds"
Inst33Quest3_Level = "60"
Inst33Quest3_Attain = "51"
Inst33Quest3_Aim = "Travel to the Icewing Caverns located southwest of Dun Baldar in Alterac Valley and recover the Stormpike Banner. Return the Stormpike Banner to Lieutenant Haggerdin in the Alterac Mountains."
Inst33Quest3_Location = "Lieutenant Haggerdin (Alterac Mountains; "..YELLOW.."39,81"..WHITE..")"
Inst33Quest3_Note = "The Stormpike Banner is in the Icewing Cavern at "..YELLOW.."[11]"..WHITE.." on the Alterac Valley - North map. Talk to the same NPC each time you gain a new Reputation level for an upgraded Insignia.\n\nThe prequest is not necessary to obtain this quest."
Inst33Quest3_Prequest = "The Sovereign Imperative"
Inst33Quest3_Folgequest = "None"
Inst33Quest3FQuest = "true"
--
Inst33Quest3name1 = "Stormpike Insignia Rank 1"
Inst33Quest3name2 = "The Frostwolf Artichoke"

--Quest 4 Alliance
Inst33Quest4 = "4. The Battle of Alterac"
Inst33Quest4_Level = "60"
Inst33Quest4_Attain = "51"
Inst33Quest4_Aim = "Enter Alterac Valley, defeat the Horde general Drek'thar, and then return to Prospector Stonehewer in the Alterac Mountains."
Inst33Quest4_Location = "Prospector Stonehewer (Alterac Mountains; "..YELLOW.."41,80"..WHITE..") and\n(Alterac Valley - North; "..YELLOW.."[B]"..WHITE..")"
Inst33Quest4_Note = "Drek'thar is at (Alterac Valley - South; "..YELLOW.."[B]"..WHITE.."). He does not actually need to be killed to complete the quest. The battleground just has to be won by your side in any manner.\nAfter turning this quest in, talk to the NPC again for the reward."
Inst33Quest4_Prequest = "None"
Inst33Quest4_Folgequest = "Hero of the Stormpike"
--
Inst33Quest4name1 = "Bloodseeker"
Inst33Quest4name2 = "Ice Barbed Spear"
Inst33Quest4name3 = "Wand of Biting Cold"
Inst33Quest4name4 = "Cold Forged Hammer"

--Quest 5 Alliance
Inst33Quest5 = "5. The Quartermaster"
Inst33Quest5_Level = "60"
Inst33Quest5_Attain = "51"
Inst33Quest5_Aim = "Speak with the Stormpike Quartermaster."
Inst33Quest5_Location = "Mountaineer Boombellow (Alterac Valley - North; "..YELLOW.."Near [3] Before Bridge"..WHITE..")"
Inst33Quest5_Note = "The Stormpike Quartermaster is at (Alterac Valley - North; "..YELLOW.."[7]"..WHITE..") and provides more quests."
Inst33Quest5_Prequest = "None"
Inst33Quest5_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Alliance
Inst33Quest6 = "6. Coldtooth Supplies"
Inst33Quest6_Level = "60"
Inst33Quest6_Attain = "51"
Inst33Quest6_Aim = "Bring 10 Coldtooth Supplies to the Alliance Quartermaster in Dun Baldar."
Inst33Quest6_Location = "Stormpike Quartermaster (Alterac Valley - North; "..YELLOW.."[7]"..WHITE..")"
Inst33Quest6_Note = "The supplies can be found in the Coldtooth Mine at (Alterac Valley - South; "..YELLOW.."[6]"..WHITE..")."
Inst33Quest6_Prequest = "None"
Inst33Quest6_Folgequest = "None"
-- No Rewards for this quest

--Quest 7 Alliance
Inst33Quest7 = "7. Irondeep Supplies"
Inst33Quest7_Level = "60"
Inst33Quest7_Attain = "51"
Inst33Quest7_Aim = "Bring 10 Irondeep Supplies to the Alliance Quartermaster in Dun Baldar."
Inst33Quest7_Location = "Stormpike Quartermaster (Alterac Valley - North; "..YELLOW.."[7]"..WHITE..")"
Inst33Quest7_Note = "The supplies can be found in the Irondeep Mine at (Alterac Valley - North; "..YELLOW.."[1]"..WHITE..")."
Inst33Quest7_Prequest = "None"
Inst33Quest7_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Alliance
Inst33Quest8 = "8. Armor Scraps"
Inst33Quest8_Level = "60"
Inst33Quest8_Attain = "51"
Inst33Quest8_Aim = "Bring 20 Armor Scraps to Murgot Deepforge in Dun Baldar."
Inst33Quest8_Location = "Murgot Deepforge (Alterac Valley - North; "..YELLOW.."[4]"..WHITE..")"
Inst33Quest8_Note = "Loot the corpse of enemy players for scraps. The followup is just the same, quest, but repeatable."
Inst33Quest8_Prequest = "None"
Inst33Quest8_Folgequest = "More Armor Scraps"
-- No Rewards for this quest

--Quest 9 Alliance
Inst33Quest9 = "9. Capture a Mine"
Inst33Quest9_Level = "60"
Inst33Quest9_Attain = "51"
Inst33Quest9_Aim = "Capture a mine that the Stormpike does not control, then return to Sergeant Durgen Stormpike in the Alterac Mountains."
Inst33Quest9_Location = "Sergeant Durgen Stormpike (Alterac Mountains; "..YELLOW.."37,77"..WHITE..")"
Inst33Quest9_Note = "To complete the quest, you must kill either Morloch in the Irondeep Mine at (Alterac Valley - North; "..YELLOW.."[1]"..WHITE..") or Taskmaster Snivvle in the Coldtooth Mine at (Alterac Valley - South; "..YELLOW.."[6]"..WHITE..") while the Horde control it."
Inst33Quest9_Prequest = "None"
Inst33Quest9_Folgequest = "None"
-- No Rewards for this quest

--Quest 10 Alliance
Inst33Quest10 = "10. Towers and Bunkers"
Inst33Quest10_Level = "60"
Inst33Quest10_Attain = "51"
Inst33Quest10_Aim = "Destroy the banner at an enemy tower or bunker, then return to Sergeant Durgen Stormpike in the Alterac Mountains."
Inst33Quest10_Location = "Sergeant Durgen Stormpike (Alterac Mountains; "..YELLOW.."37,77"..WHITE..")"
Inst33Quest10_Note = "Reportedly, the Tower or Bunker need not actually be destroyed to complete the quest, just assaulted."
Inst33Quest10_Prequest = "None"
Inst33Quest10_Folgequest = "None"
-- No Rewards for this quest

--Quest 11 Alliance
Inst33Quest11 = "11. Alterac Valley Graveyards"
Inst33Quest11_Level = "60"
Inst33Quest11_Attain = "51"
Inst33Quest11_Aim = "Assault a graveyard, then return to Sergeant Durgen Stormpike in the Alterac Mountains."
Inst33Quest11_Location = "Sergeant Durgen Stormpike (Alterac Mountains; "..YELLOW.."37,77"..WHITE..")"
Inst33Quest11_Note = "Reportedly you do not need to do anything but be near a graveyard when the Alliance assaults it. It does not need to be captured, just assaulted."
Inst33Quest11_Prequest = "None"
Inst33Quest11_Folgequest = "None"
-- No Rewards for this quest

--Quest 12 Alliance
Inst33Quest12 = "12. Empty Stables"
Inst33Quest12_Level = "60"
Inst33Quest12_Attain = "51"
Inst33Quest12_Aim = "Locate an Alterac Ram in Alterac Valley. Use the Stormpike Training Collar when you are near the Alterac Ram to 'tame' the beast. Once tamed, the Alterac Ram will follow you back to the Stable Master. Speak with the Stable Master to earn credit for the capture."
Inst33Quest12_Location = "Stormpike Stable Master (Alterac Valley - North; "..YELLOW.."[6]"..WHITE..")"
Inst33Quest12_Note = "You can find a Ram outside the base. The taming process is just like that of a Hunter taming a pet. The quest is repeatable up to a total of 25 times per battleground by the same player or players. After 25 Rams have been tamed, the Stormpike Cavalry will arrive to assist in the battle."
Inst33Quest12_Prequest = "None"
Inst33Quest12_Folgequest = "None"
-- No Rewards for this quest

--Quest 13 Alliance
Inst33Quest13 = "13. Ram Riding Harnesses"
Inst33Quest13_Level = "60"
Inst33Quest13_Attain = "51"
Inst33Quest13_Aim = "You must strike at our enemy's base, slaying the frostwolves they use as mounts and taking their hides. Return their hides to me so that harnesses may be made for the cavalry. Go!"
Inst33Quest13_Location = "Stormpike Ram Rider Commander (Alterac Valley - North; "..YELLOW.."[6]"..WHITE..")"
Inst33Quest13_Note = "Frostwolves can be found in the southern area of Alterac Valley."
Inst33Quest13_Prequest = "None"
Inst33Quest13_Folgequest = "None"
-- No Rewards for this quest

--Quest 14 Alliance
Inst33Quest14 = "14. Crystal Cluster"
Inst33Quest14_Level = "60"
Inst33Quest14_Attain = "51"
Inst33Quest14_Aim = "There are times which you may be entrenched in battle for days or weeks on end. During those longer periods of activity you may end up collecting large clusters of the Frostwolf's storm crystals.\n\nThe Circle accepts such offerings."
Inst33Quest14_Location = "Arch Druid Renferal (Alterac Valley - North; "..YELLOW.."[2]"..WHITE..")"
Inst33Quest14_Note = "After turning in 200 or so crystals, Arch Druid Renferal will begin walking towards (Alterac Valley - North; "..YELLOW.."[19]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle."
Inst33Quest14_Prequest = "None"
Inst33Quest14_Folgequest = "None"
-- No Rewards for this quest

--Quest 15 Alliance
Inst33Quest15 = "15. Ivus the Forest Lord"
Inst33Quest15_Level = "60"
Inst33Quest15_Attain = "51"
Inst33Quest15_Aim = "The Frostwolf Clan is protected by a taint of elemental energy. Their shaman meddle in powers that will surely destroy us all if left unchecked.\n\nThe Frostwolf soldiers carry elemental charms called storm crystals. We can use the charms to conjure Ivus. Venture forth and claim the crystals."
Inst33Quest15_Location = "Arch Druid Renferal (Alterac Valley - North; "..YELLOW.."[2]"..WHITE..")"
Inst33Quest15_Note = "After turning in 200 or so crystals, Arch Druid Renferal will begin walking towards (Alterac Valley - North; "..YELLOW.."[19]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle."
Inst33Quest15_Prequest = "None"
Inst33Quest15_Folgequest = "None"
-- No Rewards for this quest

--Quest 16 Alliance
Inst33Quest16 = "16. Call of Air - Slidore's Fleet"
Inst33Quest16_Level = "60"
Inst33Quest16_Attain = "51"
Inst33Quest16_Aim = "My gryphons are poised to strike at the front lines but cannot make the attack until the lines are thinned out.\n\nThe Frostwolf warriors charged with holding the front lines wear medals of service proudly upon their chests. Rip those medals off their rotten corpses and bring them back here.\n\nOnce the front line is sufficiently thinned out, I will make the call to air! Death from above!"
Inst33Quest16_Location = "Wing Commander Slidore (Alterac Valley - North; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest16_Note = "Kill Horde NPCs for the Frostwolf Soldier's Medal."
Inst33Quest16_Prequest = "None"
Inst33Quest16_Folgequest = "None"
-- No Rewards for this quest

--Quest 17 Alliance
Inst33Quest17 = "17. Call of Air - Vipore's Fleet"
Inst33Quest17_Level = "60"
Inst33Quest17_Attain = "51"
Inst33Quest17_Aim = "The elite Frostwolf units that guard the lines must be dealt with, soldier! I'm tasking you with thinning out that herd of savages. Return to me with medals from their lieutenants and legionnaires. When I feel that enough of the riff-raff has been dealt with, I'll deploy the air strike."
Inst33Quest17_Location = "Wing Commander Vipore (Alterac Valley - North; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest17_Note = "Kill Horde NPCs for the Frostwolf Lieutenant's Medal."
Inst33Quest17_Prequest = "None"
Inst33Quest17_Folgequest = "None"
-- No Rewards for this quest

--Quest 18 Alliance
Inst33Quest18 = "18. Call of Air - Ichman's Fleet"
Inst33Quest18_Level = "60"
Inst33Quest18_Attain = "51"
Inst33Quest18_Aim = "Return to the battlefield and strike at the heart of the Frostwolf's command. Take down their commanders and guardians. Return to me with as many of their medals as you can stuff in your pack! I promise you, when my gryphons see the bounty and smell the blood of our enemies, they will fly again! Go now!"
Inst33Quest18_Location = "Wing Commander Ichman (Alterac Valley - North; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest18_Note = "Kill Horde NPCs for the Frostwolf Commander's Medals. After turning in 50, Wing Commander Ichman will either send a gryphon to attack the Horde base or give you a beacon to plant in the Snowfall Graveyard. If the beacon is protected long enough a gryphon will come to defend it."
Inst33Quest18_Prequest = "None"
Inst33Quest18_Folgequest = "None"
-- No Rewards for this quest


--Quest 1 Horde
Inst33Quest1_HORDE = "1. Call to Arms: Alterac Valley (Daily)"
Inst33Quest1_HORDE_Level = "51"
Inst33Quest1_HORDE_Attain = "51"
Inst33Quest1_HORDE_Aim = "Win an Alterac Valley battleground match and return to a Horde Warbringer at any Horde capital city, Wintergrasp, Dalaran or Shattrath."
Inst33Quest1_HORDE_Location = "Horde Warbringer:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: Sunreaver's Sanctuary - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Orgrimmar: Valley of Honor - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Thunder Bluff: The Hunter Rise - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Undercity: The Royal Quarter - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Silvermoon: Farstriders Square - "..YELLOW.."97.0, 38.3"
Inst33Quest1_HORDE_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst33Quest1_HORDE_Prequest = "None"
Inst33Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Horde
Inst33Quest2_HORDE = "2. In Defense of Frostwolf"
Inst33Quest2_HORDE_Level = "60"
Inst33Quest2_HORDE_Attain = "51"
Inst33Quest2_HORDE_Aim = "Venture to Alterac Valley, located in the Alterac Mountains. Find and speak with Warmaster Laggrond - who stands outside the tunnel entrance - to begin your career as a soldier of Frostwolf. You will find Alterac Valley north of Tarren Mill at the base of the Alterac Mountains."
Inst33Quest2_HORDE_Location = "Frostwolf Ambassador Rokhstrom (Orgrimmar - Valley of Strength "..YELLOW.."50,71"..WHITE..")"
Inst33Quest2_HORDE_Note = "Warmaster Laggrond is at (Alterac Mountains; "..YELLOW.."62,59"..WHITE..")."
Inst33Quest2_HORDE_Prequest = "None"
Inst33Quest2_HORDE_Folgequest = "Proving Grounds"
-- No Rewards for this quest

--Quest 3 Horde
Inst33Quest3_HORDE = "3. Proving Grounds"
Inst33Quest3_HORDE_Level = "60"
Inst33Quest3_HORDE_Attain = "51"
Inst33Quest3_HORDE_Aim = "Travel to the Wildpaw cavern located southeast of the main base in Alterac Valley and find the Frostwolf Banner. Return the Frostwolf Banner to Warmaster Laggrond."
Inst33Quest3_HORDE_Location = "Warmaster Laggrond (Alterac Mountains; "..YELLOW.."62,59"..WHITE..")"
Inst33Quest3_HORDE_Note = "The Frostwolf Banner is in the Wildpaw Cavern at (Alterac Valley - South; "..YELLOW.."[15]"..WHITE.."). Talk to the same NPC each time you gain a new Reputation level for an upgraded Insignia.\n\nThe prequest is not necessary to obtain this quest."
Inst33Quest3_HORDE_Prequest = "In Defense of Frostwolf"
Inst33Quest3_HORDE_Folgequest = "None"
Inst33Quest3FQuest_HORDE = "true"
--
Inst33Quest3name1_HORDE = "Frostwolf Insignia Rank 1"
Inst33Quest3name2_HORDE = "Peeling the Onion"

--Quest 4 Horde
Inst33Quest4_HORDE = "4. The Battle for Alterac"
Inst33Quest4_HORDE_Level = "60"
Inst33Quest4_HORDE_Attain = "51"
Inst33Quest4_HORDE_Aim = "Enter Alterac Valley and defeat the dwarven general, Vanndar Stormpike. Then, return to Voggah Deathgrip in the Alterac Mountains."
Inst33Quest4_HORDE_Location = "Voggah Deathgrip (Alterac Mountains; "..YELLOW.."64,60"..WHITE..")"
Inst33Quest4_HORDE_Note = "Vanndar Stormpike is at (Alterac Valley - North; "..YELLOW.."[B]"..WHITE.."). He does not actually need to be killed to complete the quest. The battleground just has to be won by your side in any manner.\nAfter turning this quest in, talk to the NPC again for the reward."
Inst33Quest4_HORDE_Prequest = "None"
Inst33Quest4_HORDE_Folgequest = "Hero of the Frostwolf"
--
Inst33Quest4name1_HORDE = "Bloodseeker"
Inst33Quest4name2_HORDE = "Ice Barbed Spear"
Inst33Quest4name3_HORDE = "Wand of Biting Cold"
Inst33Quest4name4_HORDE = "Cold Forged Hammer"

--Quest 5 Horde
Inst33Quest5_HORDE = "5. Speak with our Quartermaster"
Inst33Quest5_HORDE_Level = "60"
Inst33Quest5_HORDE_Attain = "51"
Inst33Quest5_HORDE_Aim = "Speak with the Frostwolf Quartermaster."
Inst33Quest5_HORDE_Location = "Jotek (Alterac Valley - South; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest5_HORDE_Note = "The Frostwolf Quartermaster is at "..YELLOW.."[10]"..WHITE.." and provides more quests."
Inst33Quest5_HORDE_Prequest = "None"
Inst33Quest5_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Horde
Inst33Quest6_HORDE = "6. Coldtooth Supplies"
Inst33Quest6_HORDE_Level = "60"
Inst33Quest6_HORDE_Attain = "51"
Inst33Quest6_HORDE_Aim = "Bring 10 Coldtooth Supplies to the Horde Quatermaster in Frostwolf Keep."
Inst33Quest6_HORDE_Location = "Frostwolf Quartermaster (Alterac Valley - South; "..YELLOW.."[10]"..WHITE..")"
Inst33Quest6_HORDE_Note = "The supplies can be found in the Coldtooth Mine at (Alterac Valley - South; "..YELLOW.."[6]"..WHITE..")."
Inst33Quest6_HORDE_Prequest = "None"
Inst33Quest6_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 7 Horde
Inst33Quest7_HORDE = "7. Irondeep Supplies"
Inst33Quest7_HORDE_Level = "60"
Inst33Quest7_HORDE_Attain = "51"
Inst33Quest7_HORDE_Aim = "Bring 10 Irondeep Supplies to the Horde Quartermaster in Frostwolf Keep."
Inst33Quest7_HORDE_Location = "Frostwolf Quartermaster (Alterac Valley - South; "..YELLOW.."[10]"..WHITE..")"
Inst33Quest7_HORDE_Note = "The supplies can be found in the Irondeep Mine at (Alterac Valley - North; "..YELLOW.."[1]"..WHITE..")."
Inst33Quest7_HORDE_Prequest = "None"
Inst33Quest7_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Horde
Inst33Quest8_HORDE = "8. Enemy Booty"
Inst33Quest8_HORDE_Level = "60"
Inst33Quest8_HORDE_Attain = "51"
Inst33Quest8_HORDE_Aim = "Bring 20 Armor Scraps to Smith Regzar in Frostwolf Village."
Inst33Quest8_HORDE_Location = "Smith Regzar (Alterac Valley - South; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest8_HORDE_Note = "Loot the corpse of enemy players for scraps. The followup is just the same, quest, but repeatable."
Inst33Quest8_HORDE_Prequest = "None"
Inst33Quest8_HORDE_Folgequest = "More Booty!"
-- No Rewards for this quest

--Quest 9 Horde
Inst33Quest9_HORDE = "9. Capture a Mine"
Inst33Quest9_HORDE_Level = "60"
Inst33Quest9_HORDE_Attain = "51"
Inst33Quest9_HORDE_Aim = "Capture a mine, then return to Corporal Teeka Bloodsnarl in the Alterac Mountains."
Inst33Quest9_HORDE_Location = "Corporal Teeka Bloodsnarl (Alterac Mountains; "..YELLOW.."66,55"..WHITE..")"
Inst33Quest9_HORDE_Note = "To complete the quest, you must kill either Morloch in the Irondeep Mine at (Alterac Valley - North; "..YELLOW.."[1]"..WHITE..") or Taskmaster Snivvle in the Coldtooth Mine at (Alterac Valley - South; "..YELLOW.."[6]"..WHITE..") while the Alliance control it."
Inst33Quest9_HORDE_Prequest = "None"
Inst33Quest9_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 10 Horde
Inst33Quest10_HORDE = "10. Towers and Bunkers"
Inst33Quest10_HORDE_Level = "60"
Inst33Quest10_HORDE_Attain = "51"
Inst33Quest10_HORDE_Aim = "Capture an enemy tower, then return to Corporal Teeka Bloodsnarl in the Alterac Mountains."
Inst33Quest10_HORDE_Location = "Corporal Teeka Bloodsnarl (Alterac Mountains; "..YELLOW.."66,55"..WHITE..")"
Inst33Quest10_HORDE_Note = "Reportedly, the Tower or Bunker need not actually be destroyed to complete the quest, just assaulted."
Inst33Quest10_HORDE_Prequest = "None"
Inst33Quest10_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 11 Horde
Inst33Quest11_HORDE = "11. The Graveyards of Alterac"
Inst33Quest11_HORDE_Level = "60"
Inst33Quest11_HORDE_Attain = "51"
Inst33Quest11_HORDE_Aim = "Assault a graveyard, then return to Corporal Teeka Bloodsnarl in the Alterac Mountains."
Inst33Quest11_HORDE_Location = "Corporal Teeka Bloodsnarl (Alterac Mountains; "..YELLOW.."66,55"..WHITE..")"
Inst33Quest11_HORDE_Note = "Reportedly you do not need to do anything but be near a graveyard when the Horde assaults it. It does not need to be captured, just assaulted."
Inst33Quest11_HORDE_Prequest = "None"
Inst33Quest11_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 12 Horde
Inst33Quest12_HORDE = "12. Empty Stables"
Inst33Quest12_HORDE_Level = "60"
Inst33Quest12_HORDE_Attain = "51"
Inst33Quest12_HORDE_Aim = "Locate a Frostwolf in Alterac Valley. Use the Frostwolf Muzzle when you are near the Frostwolf to 'tame' the beast. Once tamed, the Frostwolf will follow you back to the Frostwolf Stable Master. Speak with the Frostwolf Stable Master to earn credit for the capture."
Inst33Quest12_HORDE_Location = "Frostwolf Stable Master (Alterac Valley - South; "..YELLOW.."[9]"..WHITE..")"
Inst33Quest12_HORDE_Note = "You can find a Frostwolf outside the base. The taming process is just like that of a Hunter taming a pet. The quest is repeatable up to a total of 25 times per battleground by the same player or players. After 25 Rams have been tamed, the Frostwolf Cavalry will arrive to assist in the battle."
Inst33Quest12_HORDE_Prequest = "None"
Inst33Quest12_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 13 Horde
Inst33Quest13_HORDE = "13. Ram Hide Harnesses"
Inst33Quest13_HORDE_Level = "60"
Inst33Quest13_HORDE_Attain = "51"
Inst33Quest13_HORDE_Aim = "You must strike at the indigenous rams of the region. The very same rams that the Stormpike cavalry uses as mounts!\n\nSlay them and return to me with their hides. Once we have gathered enough hides, we will fashion harnesses for the riders. The Frostwolf Wolf Riders will ride once more!"
Inst33Quest13_HORDE_Location = "Frostwolf Wolf Rider Commander (Alterac Valley - South; "..YELLOW.."[9]"..WHITE..")"
Inst33Quest13_HORDE_Note = "The Rams can be found in the northern area of Alterac Valley."
Inst33Quest13_HORDE_Prequest = "None"
Inst33Quest13_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 14 Horde
Inst33Quest14_HORDE = "14. A Gallon of Blood"
Inst33Quest14_HORDE_Level = "60"
Inst33Quest14_HORDE_Attain = "51"
Inst33Quest14_HORDE_Aim = "You have the option of offering larger quantities of the blood taken from our enemies. I will be glad to accept gallon sized offerings."
Inst33Quest14_HORDE_Location = "Primalist Thurloga (Alterac Valley - South; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest14_HORDE_Note = "After turning in 150 or so Blood, Primalist Thurloga will begin walking towards (Alterac Valley - South; "..YELLOW.."[1]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Lokholar the Ice Lord will be summoned to kill Alliance players."
Inst33Quest14_HORDE_Prequest = "None"
Inst33Quest14_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 15 Horde
Inst33Quest15_HORDE = "15. Lokholar the Ice Lord"
Inst33Quest15_HORDE_Level = "60"
Inst33Quest15_HORDE_Attain = "51"
Inst33Quest15_HORDE_Aim = "You must strike down our enemies and bring to me their blood. Once enough blood has been gathered, the ritual of summoning may begin.\n\nVictory will be assured when the elemental lord is loosed upon the Stormpike army."
Inst33Quest15_HORDE_Location = "Primalist Thurloga (Alterac Valley - South; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest15_HORDE_Note = "After turning in 150 or so Blood, Primalist Thurloga will begin walking towards (Alterac Valley - South; "..YELLOW.."[1]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Lokholar the Ice Lord will be summoned to kill Alliance players."
Inst33Quest15_HORDE_Prequest = "None"
Inst33Quest15_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 16 Horde
Inst33Quest16_HORDE = "16. Call of Air - Guse's Fleet"
Inst33Quest16_HORDE_Level = "60"
Inst33Quest16_HORDE_Attain = "51"
Inst33Quest16_HORDE_Aim = "My riders are set to make a strike on the central battlefield; but first, I must wet their appetites - preparing them for the assault.\n\nI need enough Stormpike Soldier Flesh to feed a fleet! Hundreds of pounds! Surely you can handle that, yes? Get going!"
Inst33Quest16_HORDE_Location = "Wing Commander Guse (Alterac Valley - South; "..YELLOW.."[13]"..WHITE..")"
Inst33Quest16_HORDE_Note = "Kill Horde NPCs for the Stormpike Soldier's Flesh. Reportedly 90 flesh are needed to make the Wing Commander do whatever she does."
Inst33Quest16_HORDE_Prequest = "None"
Inst33Quest16_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 17 Horde
Inst33Quest17_HORDE = "17. Call of Air - Jeztor's Fleet"
Inst33Quest17_HORDE_Level = "60"
Inst33Quest17_HORDE_Attain = "51"
Inst33Quest17_HORDE_Aim = "My War Riders must taste in the flesh of their targets. This will ensure a surgical strike against our enemies!\n\nMy fleet is the second most powerful in our air command. Thusly, they will strike at the more powerful of our adversaries. For this, then, they need the flesh of the Stormpike Lieutenants."
Inst33Quest17_HORDE_Location = "Wing Commander Jeztor (Alterac Valley - South; "..YELLOW.."[13]"..WHITE..")"
Inst33Quest17_HORDE_Note = "Kill Alliance NPCs for the Stormpike Lieutenant's Flesh."
Inst33Quest17_HORDE_Prequest = "None"
Inst33Quest17_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 18 Horde
Inst33Quest18_HORDE = "18. Call of Air - Mulverick's Fleet"
Inst33Quest18_HORDE_Level = "60"
Inst33Quest18_HORDE_Attain = "51"
Inst33Quest18_HORDE_Aim = "First, my war riders need targets to gun for - high priority targets. I'm going to need to feed them the flesh of Stormpike Commanders. Unfortunately, those little buggers are entrenched deep behind enemy lines! You've definitely got your work cut out for you."
Inst33Quest18_HORDE_Location = "Wing Commander Mulverick (Alterac Valley - South; "..YELLOW.."[13]"..WHITE..")"
Inst33Quest18_HORDE_Note = "Kill Alliance NPCs for the Stormpike Commander's Flesh."
Inst33Quest18_HORDE_Prequest = "None"
Inst33Quest18_HORDE_Folgequest = "None"
-- No Rewards for this quest



--------------- INST34 - Arathi Basin (AB) ---------------

Inst34Story = "Arathi Basin, located in Arathi Highlands, is a fast and exciting Battleground. The Basin itself is rich with resources and coveted by both the Horde and the Alliance. The Forsaken Defilers and the League of Arathor have arrived at Arathi Basin to wage war over these natural resources and claim them on behalf of their respective sides."
Inst34Caption = "Arathi Basin"
Inst34QAA = "4 Quests"
Inst34QAH = "4 Quests"

--Quest 1 Alliance
Inst34Quest1 = "1. Call to Arms: Arathi Basin (Daily)"
Inst34Quest1_Level = "20"
Inst34Quest1_Attain = "20"
Inst34Quest1_Aim = "Win an Arathi Basin battleground match and return to an Alliance Brigadier General at any Alliance capital city, Wintergrasp, Dalaran or Shattrath."
Inst34Quest1_Location = "Alliance Brigadier General:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: The Silver Enclave - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Stormwind: Stormwind Keep - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Ironforge: Military Ward - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Darnassus: Warrior's Terrace - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Exodar: The Vault of Lights - "..YELLOW.."24.6, 55.4"
Inst34Quest1_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst34Quest1_Prequest = "None"
Inst34Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst34Quest2 = "2. The Battle for Arathi Basin!"
Inst34Quest2_Level = "25"
Inst34Quest2_Attain = "25"
Inst34Quest2_Aim = "Assault the mine, the lumber mill, the blacksmith and the farm, then return to Field Marshal Oslight in Refuge Pointe."
Inst34Quest2_Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest2_Note = "The locations to be assaulted are marked on the map as 2 through 5."
Inst34Quest2_Prequest = "None"
Inst34Quest2_Folgequest = "None"
-- No Rewards for this quest

--Quest 3 Alliance
Inst34Quest3 = "3. Control Four Bases"
Inst34Quest3_Level = "60"
Inst34Quest3_Attain = "60"
Inst34Quest3_Aim = "Enter Arathi Basin, capture and control four bases at the same time, and then return to Field Marshal Oslight at Refuge Pointe."
Inst34Quest3_Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest3_Note = "You need to be Friendly with the League of Arathor to get this quest."
Inst34Quest3_Prequest = "None"
Inst34Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst34Quest4 = "4. Control Five Bases"
Inst34Quest4_Level = "60"
Inst34Quest4_Attain = "60"
Inst34Quest4_Aim = "Control 5 bases in Arathi Basin at the same time, then return to Field Marshal Oslight at Refuge Pointe."
Inst34Quest4_Location = "Field Marshal Oslight (Arathi Highlands - Refuge Pointe; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest4_Note = "You need to be Exalted with the League of Arathor to get this quest."
Inst34Quest4_Prequest = "None"
Inst34Quest4_Folgequest = "None"
--
Inst34Quest4name1 = "Arathor Battle Tabard"


--Quest 1 Horde
Inst34Quest1_HORDE = "1. Call to Arms: Arathi Basin (Daily)"
Inst34Quest1_HORDE_Level = "20"
Inst34Quest1_HORDE_Attain = "20"
Inst34Quest1_HORDE_Aim = "Win an Arathi Basin battleground match and return to a Horde Warbringer at any Horde capital city, Wintergrasp, Dalaran or Shattrath."
Inst34Quest1_HORDE_Location = "Horde Warbringer:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: Sunreaver's Sanctuary - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Orgrimmar: Valley of Honor - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Thunder Bluff: The Hunter Rise - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Undercity: The Royal Quarter - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Silvermoon: Farstriders Square - "..YELLOW.."97.0, 38.3"
Inst34Quest1_HORDE_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst34Quest1_HORDE_Prequest = "None"
Inst34Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Horde
Inst34Quest2_HORDE = "2. The Battle for Arathi Basin!"
Inst34Quest2_HORDE_Level = "25"
Inst34Quest2_HORDE_Attain = "25"
Inst34Quest2_HORDE_Aim = "Assault the Arathi Basin mine, lumber mill, blacksmith and stable, and then return to Deathmaster Dwire in Hammerfall."
Inst34Quest2_HORDE_Location = "Deathmaster Dwire (Arathi Highlands - Hammerfall; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest2_HORDE_Note = "The locations to be assaulted are marked on the map as 1 through 4."
Inst34Quest2_HORDE_Prequest = "None"
Inst34Quest2_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 3 Horde
Inst34Quest3_HORDE = "3. Take Four Bases"
Inst34Quest3_HORDE_Level = "60"
Inst34Quest3_HORDE_Attain = "60"
Inst34Quest3_HORDE_Aim = "Hold four bases at the same time in Arathi Basin, and then return to Deathmaster Dwire in Hammerfall."
Inst34Quest3_HORDE_Location = "Deathmaster Dwire (Arathi Highlands - Hammerfall; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest3_HORDE_Note = "You need to be Friendly with The Defilers to get this quest."
Inst34Quest3_HORDE_Prequest = "None"
Inst34Quest3_HORDE_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Horde
Inst34Quest4_HORDE = "4. Take Five Bases"
Inst34Quest4_HORDE_Level = "60"
Inst34Quest4_HORDE_Attain = "60"
Inst34Quest4_HORDE_Aim = "Hold five bases in Arathi Basin at the same time, then return to Deathmaster Dwire in Hammerfall."
Inst34Quest4_HORDE_Location = "Deathmaster Dwire (Arathi Highlands - Hammerfall; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest4_HORDE_Note = "You need to be Exalted with The Defilers to get this quest."
Inst34Quest4_HORDE_Prequest = "None"
Inst34Quest4_HORDE_Folgequest = "None"
--
Inst34Quest4name1_HORDE = "Battle Tabard of the Defilers"



--------------- INST35 - Warsong Gulch (WSG) ---------------

Inst35Story = "Nestled in the southern region of Ashenvale forest, Warsong Gulch is near the area where Grom Hellscream and his Orcs chopped away huge swaths of forest during the events of the Third War. Some orcs have remained in the vicinity, continuing their deforestation to fuel the Horde's expansion. They call themselves the Warsong Outriders.\nThe Night Elves, who have begun a massive push to retake the forests of Ashenvale, are now focusing their attention on ridding their land of the Outriders once and for all. And so, the Silverwing Sentinels have answered the call and sworn that they will not rest until every last Orc is defeated and cast out of Warsong Gulch. "
Inst35Caption = "Warsong Gulch"
Inst35QAA = "1 Quest"
Inst35QAH = "1 Quest"

--Quest 1 Alliance
Inst35Quest1 = "1. Call to Arms: Warsong Gulch (Daily)"
Inst35Quest1_Level = "10"
Inst35Quest1_Attain = "10"
Inst35Quest1_Aim = "Win a Warsong Gulch battleground match and return to an Alliance Brigadier General at any Alliance capital city, Wintergrasp, Dalaran or Shattrath."
Inst35Quest1_Location = "Alliance Brigadier General:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: The Silver Enclave - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Stormwind: Stormwind Keep - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Ironforge: Military Ward - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Darnassus: Warrior's Terrace - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Exodar: The Vault of Lights - "..YELLOW.."24.6, 55.4"
Inst35Quest1_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst35Quest1_Prequest = "None"
Inst35Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 1 Horde
Inst35Quest1_HORDE = "1. Call to Arms: Warsong Gulch (Daily)"
Inst35Quest1_HORDE_Level = "10"
Inst35Quest1_HORDE_Attain = "10"
Inst35Quest1_HORDE_Aim = "Win a Warsong Gulch battleground match and return to an Horde Warbringer at any Horde capital city, Wintergrasp, Dalaran or Shattrath."
Inst35Quest1_HORDE_Location = "Horde Warbringer:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: Sunreaver's Sanctuary - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Orgrimmar: Valley of Honor - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Thunder Bluff: The Hunter Rise - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Undercity: The Royal Quarter - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Silvermoon: Farstriders Square - "..YELLOW.."97.0, 38.3"
Inst35Quest1_HORDE_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst35Quest1_HORDE_Prequest = "None"
Inst35Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest



--------------- INST60 - Eye of the Storm ---------------

Inst60Story = "Hovering high above the ravaged landscape of Netherstorm is the island known as Eye of the Storm. This battlefield is covted by the blood elves for its rich energy deposits - and the draenei seek to claim it due to its mysterious vessel - Tempest Keep."
Inst60Caption = "Eye of the Storm"
Inst60QAA = "1 Quest"
Inst60QAH = "1 Quest"

--Quest 1 Alliance
Inst60Quest1 = "1. Call to Arms: Eye of the Storm (Daily)"
Inst60Quest1_Level = "61"
Inst60Quest1_Attain = "61"
Inst60Quest1_Aim = "Win an Eye of the Storm battleground match and return to an Alliance Brigadier General at any Alliance capital city, Wintergrasp, Dalaran or Shattrath."
Inst60Quest1_Location = "Alliance Brigadier General:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: The Silver Enclave - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Stormwind: Stormwind Keep - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Ironforge: Military Ward - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Darnassus: Warrior's Terrace - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Exodar: The Vault of Lights - "..YELLOW.."24.6, 55.4"
Inst60Quest1_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst60Quest1_Prequest = "None"
Inst60Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 1 Horde
Inst60Quest1_HORDE = "1. Call to Arms: Eye of the Storm (Daily)"
Inst60Quest1_HORDE_Level = "61"
Inst60Quest1_HORDE_Attain = "61"
Inst60Quest1_HORDE_Aim = "Win an Eye of the Storm battleground match and return to a Horde Warbringer at any Horde capital capital city, Wintergrasp, Dalaran or Shattrath."
Inst60Quest1_HORDE_Location = "Horde Warbringer:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: Sunreaver's Sanctuary - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Orgrimmar: Valley of Honor - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Thunder Bluff: The Hunter Rise - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Undercity: The Royal Quarter - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Silvermoon: Farstriders Square - "..YELLOW.."97.0, 38.3"
Inst60Quest1_HORDE_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst60Quest1_HORDE_Prequest = "None"
Inst60Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest



--------------- INST83 - Strand of the Ancients (SotA)  ---------------

Inst83Story = "The Strand of the Ancients is a battleground located off the southern coast of the Dragonblight being introduced in Wrath of the Lich King. This battleground consists of 3 walls which have to be destroyed to continue, capture points and a graveyard after each wall. The overall goal is to be the first team to get through the last wall.\n\n"..GREEN.."Quoted from WoWWiki"
Inst83Caption = "Strand of the Ancients"
Inst83QAA = "1 Quest"
Inst83QAH = "1 Quest"

--Quest 1 Alliance
Inst83Quest1 = "1. Call to Arms: Strand of the Ancients (Daily)"
Inst83Quest1_Level = "71"
Inst83Quest1_Attain = "71"
Inst83Quest1_Aim = "Win a Strand of the Ancients battleground match and return to an Alliance Brigadier General at any Alliance capital city, Wintergrasp, Dalaran or Shattrath."
Inst83Quest1_Location = "Alliance Brigadier General:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: The Silver Enclave - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Stormwind: Stormwind Keep - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Ironforge: Military Ward - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Darnassus: Warrior's Terrace - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Exodar: The Vault of Lights - "..YELLOW.."24.6, 55.4"
Inst83Quest1_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst83Quest1_Prequest = "None"
Inst83Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 1 Horde
Inst83Quest1_HORDE = "1. Call to Arms: Strand of the Ancients (Daily)"
Inst83Quest1_HORDE_Level = "71"
Inst83Quest1_HORDE_Attain = "71"
Inst83Quest1_HORDE_Aim = "Win a Strand of the Ancients battleground match and return to a Horde Warbringer at any Horde capital city, Wintergrasp, Dalaran or Shattrath."
Inst83Quest1_HORDE_Location = "Horde Warbringer:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: Sunreaver's Sanctuary - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Orgrimmar: Valley of Honor - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Thunder Bluff: The Hunter Rise - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Undercity: The Royal Quarter - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Silvermoon: Farstriders Square - "..YELLOW.."97.0, 38.3"
Inst83Quest1_HORDE_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst83Quest1_HORDE_Prequest = "None"
Inst83Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest



--------------- INST89 - Isle of Conquest (IoC)  ---------------

Inst89Story = "An island somewhere off the shores of Northrend. A rock, hardly worth a second look. But as insignificant as it may seem, this is no ordinary place. A sound of thunder as waves crash endlessly against rocky cliffs; a sound of fury as swords clash on the blood-stained fields of this island on the edge of forever.\n\nWelcome to the Isle of Conquest."
Inst89Caption = "Isle of Conquest"
Inst89QAA = "1 Quest"
Inst89QAH = "1 Quest"

--Quest 1 Alliance
Inst89Quest1 = "1. Call to Arms: Isle of Conquest (Daily)"
Inst89Quest1_Level = "80"
Inst89Quest1_Attain = "80"
Inst89Quest1_Aim = "Win an Isle of Conquest battleground match and return to a Alliance Brigadier General at any Alliance capital city, Wintergrasp, Dalaran, or Shattrath."
Inst89Quest1_Location = "Alliance Brigadier General:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: The Silver Enclave - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Stormwind: Stormwind Keep - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Ironforge: Military Ward - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Darnassus: Warrior's Terrace - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Exodar: The Vault of Lights - "..YELLOW.."24.6, 55.4"
Inst89Quest1_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst89Quest1_Prequest = "None"
Inst89Quest1_Folgequest = "None"
-- No Rewards for this quest


--Quest 1 Horde
Inst89Quest1_HORDE = "1. Call to Arms: Isle of Conquest (Daily)"
Inst89Quest1_HORDE_Level = "80"
Inst89Quest1_HORDE_Attain = "80"
Inst89Quest1_HORDE_Aim = "Win an Isle of Conquest battleground match and return to a Horde Warbringer at any Horde capital city, Wintergrasp, Dalaran, or Shattrath."
Inst89Quest1_HORDE_Location = "Horde Warbringer:\n   Wintergrasp: Wintergrasp Fortress - "..YELLOW.."50.0, 14.0"..WHITE.." (patrols)\n   Dalaran: Sunreaver's Sanctuary - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Shattrath: Lower City - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Orgrimmar: Valley of Honor - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Thunder Bluff: The Hunter Rise - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Undercity: The Royal Quarter - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Silvermoon: Farstriders Square - "..YELLOW.."97.0, 38.3"
Inst89Quest1_HORDE_Note = "This quest can be done once a day when it is available. It yields varying amounts of experience and gold based on your level."
Inst89Quest1_HORDE_Prequest = "None"
Inst89Quest1_HORDE_Folgequest = "None"
-- No Rewards for this quest




---------------------------------------------------
---------------- OUTDOOR RAIDS --------------------
---------------------------------------------------



--------------- INST30 - Dragons of Nightmare ---------------

Inst30Story = {
  ["Page1"] = "There is a disturbance at the Great Trees. A new threat menaces these secluded areas found in Ashenvale, Duskwood, Feralas, and Hinterlands. Four great guardians of the Green Dragonflight have arrived from the Dream, but these once-proud protectors now seek only destruction and death. Take arms with your fellows and march to these hidden groves -- only you can defend Azeroth from the corruption they bring.",
  ["Page2"] = "Ysera, the great Dreaming dragon Aspect rules over the enigmatic green dragonflight. Her domain is the fantastic, mystical realm of the Emerald Dream - and it is said that from there she guides the evolutionary path of the world itself. She is the protector of nature and imagination, and it is the charge of her flight to guard all of the Great Trees across the world, which only druids use to enter the Dream itself. In recent times, Ysera's most trusted lieutenants have been warped by a dark new power within the Emerald Dream. Now these wayward sentinels have passed through the Great Trees into Azeroth, intending to spread madness and terror throughout the mortal kingdoms. Even the mightiest of adventurers would be well advised to give the dragons a wide berth, or suffer the consequences of their misguided wrath.",
  ["Page3"] = "Lethon's exposure to the aberration within the Emerald Dream not only darkened the hue of the mighty dragon's scales, but also empowered him with the ability to extract malevolent shades from his enemies. Once joined with their master, the shades imbue the dragon with healing energies. It should come as no surprise, then, that Lethon is considered to be among the most formidable of Ysera's wayward lieutenants",
  ["Page4"] = "A  mysterious dark power within the Emerald Dream has transformed the once-majestic Emeriss into a rotting, diseased monstrosity. Reports from the few who have survived encounters with the dragon have told horrifying tales of putrid mushrooms erupting from the corpses of their dead companions. Emeriss is truly the most gruesome and appalling of Ysera's estranged green dragons.",
  ["Page5"] = "Taerar was perhaps the most affected of Ysera's rogue lieutenants. His interaction with the dark force within the Emerald Dream shattered Taerar's sanity as well as his corporeal form. The dragon now exists as a specter with the ability to split into multiple entities, each of which possesses destructive magical powers. Taerar is a cunning and relentless foe who is intent on turning the madness of his existence into reality for the inhabitants of Azeroth.",
  ["Page6"] = "Once one of Ysera's most trusted lieutenants, Ysondre has now gone rogue, sewing terror and chaos across the land of Azeroth. Her formerly beneficent healing powers have given way to dark magics, enabling her to cast smoldering lightning waves and summon the aid of fiendish druids. Ysondre and her kin also possess the ability to induce sleep, sending her unfortunate mortal foes to the realm of their most terrifying nightmares.",
  ["MaxPages"] = "6",
};
Inst30Caption = "Dragons of Nightmare"
Inst30Caption2 = "Ysera and the Green Dragonflight"
Inst30Caption3 = "Lethon"
Inst30Caption4 = "Emeriss"
Inst30Caption5 = "Taerar"
Inst30Caption6 = "Ysondre"
Inst30QAA = "1 Quest"
Inst30QAH = "1 Quest"

--Quest 1 Alliance
Inst30Quest1 = "1. Shrouded in Nightmare"
Inst30Quest1_Level = "60"
Inst30Quest1_Attain = "60"
Inst30Quest1_Aim = "Find someone capable of deciphering the meaning behind the Nightmare Engulfed Object.\n\nPerhaps a druid of great power could assist you."
Inst30Quest1_Location = "Nightmare Engulfed Object (drops from Emeriss, Taerar, Lethon or Ysondre)"
Inst30Quest1_Note = "Quest turns in to Keeper Remulos at (Moonglade - Shrine of Remulos; "..YELLOW.."36,41"..WHITE.."). Reward listed is for the followup."
Inst30Quest1_Prequest = "None"
Inst30Quest1_Folgequest = "Waking Legends"
--
Inst30Quest1name1 = "Malfurion's Signet Ring"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst30Quest1_HORDE = Inst30Quest1
Inst30Quest1_HORDE_Level = Inst30Quest1_Level
Inst30Quest1_HORDE_Attain = Inst30Quest1_Attain
Inst30Quest1_HORDE_Aim = Inst30Quest1_Aim
Inst30Quest1_HORDE_Location = Inst30Quest1_Location
Inst30Quest1_HORDE_Note = Inst30Quest1_Note
Inst30Quest1_HORDE_Prequest = Inst30Quest1_Prequest
Inst30Quest1_HORDE_Folgequest = Inst30Quest1_Folgequest
--
Inst30Quest1name1_HORDE = Inst30Quest1name1



--------------- INST31 - Azuregos ---------------

Inst31Story = "Before the Great Sundering, the night elf city of Eldarath flourished in the land that is now known as Azshara. It is believed that many ancient and powerful Highborne artifacts may be found among the ruins of the once-mighty stronghold. For countless generations, the Blue Dragon Flight has safeguarded powerful artifacts and magical lore, ensuring that they do not fall into mortal hands. The presence of Azuregos, the blue dragon, seems to suggest that items of extreme significance, perhaps the fabled Vials of Eternity themselves, may be found in the wilderness of Azshara. Whatever Azuregos seeks, one thing is certain: he will fight to the death to defend Azshara's magical treasures."
Inst31Caption = "Azuregos"
Inst31QAA = "1 Quest"
Inst31QAH = "1 Quest"

--Quest 1 Alliance
Inst31Quest1 = "1. Ancient Sinew Wrapped Lamina (Hunter)"
Inst31Quest1_Level = "60"
Inst31Quest1_Attain = "60"
Inst31Quest1_Aim = "Hastat the Ancient has asked that you bring him a Mature Blue Dragon Sinew. Should you find this sinew, return it to Hastat in Felwood."
Inst31Quest1_Location = "Hastat the Ancient (Felwood - Irontree Woods; "..YELLOW.."48,24"..WHITE..")"
Inst31Quest1_Note = "Kill Azuregos to get the Mature Blue Dragon Sinew. He walks around the middle of the southern peninsula in Azshara near "..YELLOW.."[1]"..WHITE.."."
Inst31Quest1_Prequest = "The Ancient Leaf ("..YELLOW.."Molten Core"..WHITE..")"
Inst31Quest1_Folgequest = "None"
Inst31Quest1PreQuest = "true"
--
Inst31Quest1name1 = "Ancient Sinew Wrapped Lamina"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst31Quest1_HORDE = Inst31Quest1
Inst31Quest1_HORDE_Level = Inst31Quest1_Level
Inst31Quest1_HORDE_Attain = Inst31Quest1_Attain
Inst31Quest1_HORDE_Aim = Inst31Quest1_Aim
Inst31Quest1_HORDE_Location = Inst31Quest1_Location
Inst31Quest1_HORDE_Note = Inst31Quest1_Note
Inst31Quest1_HORDE_Prequest = Inst31Quest1_Prequest
Inst31Quest1_HORDE_Folgequest = Inst31Quest1_Folgequest
Inst31Quest1PreQuest_HORDE = Inst31Quest1PreQuest
--
Inst31Quest1name1_HORDE = Inst31Quest1name1



--------------- INST64 - Doom Lord Kazzak ---------------

Inst64Story = {
  ["Page1"] = "When the Burning Legion began its second invasion of Azeroth, Lord Kazzak served as one of the unholy army's greatest generals. At that time the Legion possessed a powerful weapon called the Glaive of the Aspects. Forged by demons during the War of the Ancients, the glaive was imbued with the forces of earth, time, dream, magic, and life: powers taken from the mighty dragons. Even so, Archimonde and his champions were defeated during the Battle of Mount Hyjal, and the glaive was shattered. Knowing the Third War had been decided, Kazzak was forced to withdraw. In the war's aftermath, the shards of the glaive were hidden away for safekeeping.",
  ["Page2"] = "Recently Kazzak and his minions reactivated the Dark Portal, and Kazzak went through the portal to take command of the Legion's forces in Outland. In his absence, he entrusted his most powerful lieutenant, Highlord Kruul, with retrieving the Aspect Shards. In time Kruul succeeded, and the mighty glaive was reforged.\n\nWith the Glaive of the Aspects and the raging desire to scour all life from the universe, the Legion may prove unstoppable.",
  ["MaxPages"] = "2",
};
Inst64Caption = "Doom Lord Kazzak"
Inst64QAA = "No Quests"
Inst64QAH = "No Quests"



--------------- INST65 - Doomwalker ---------------

Inst65Story = {
  ["Page1"] = "The cunning mo'arg engineers of the Burning Legion pushed their gan'arg workers for weeks in the construction of the first fel reaver, a massive construct that could easily raze fortified towers or tear the wings off an airborne gryphon. Though pleased by the success of their construct, the engineers quickly realized that they could improve upon the design. While the forge camps began to mass-produce these fel reavers to smash the mortal forces of Outland, all the manpower of the mighty Legion Hold in Shadowmoon Valley was dedicated to the creation of a superior machine.",
  ["Page2"] = "Now unleashed, Doomwalker rages throughout Shadowmoon Valley, annihilating everything in its path. Infused with the captured souls of martyred draenei, the Doomwalker is empowered with unparalleled fury and might. With the fortified strength of its gargantuan body and the unbridled power of countless tortured souls, this newest fel reaver is among the most powerful weapons of the Burning Legion.",
  ["MaxPages"] = "2",
};
Inst65Caption = "Doomwalker"
Inst65QAA = "No Quests"
Inst65QAH = "No Quests"



--------------- INST66 - Skettis ---------------

Inst66Story = "Skettis is the hidden capital of the Arakkoa, and one of the major secrets of Terokkar Forest. It is situated in Blackwind Valley in southeastern Terokkar Forest, only accessible to players who have a flying mount or Druids who have learned Flight Form. It is made up of four veils: Veil Ala'rak, Veil Harr'ik, Lower Veil Shil'ak, and Upper Veil Shil'ak. At its center is Terokk's Rest, the site where the arakkoa lord Terokk can be summoned back into the world.\n\n"..GREEN.."Quoted from WoWWiki"
Inst66Caption = "Skettis"
Inst66QAA = "13 Quests"
Inst66QAH = "13 Quests"

--Quest 1 Alliance
Inst66Quest1 = "1. To Skettis!"
Inst66Quest1_Level = "70"
Inst66Quest1_Attain = "70"
Inst66Quest1_Aim = "Take the Explosives Package to Sky Sergeant Doryn at Blackwind Landing outside Skettis."
Inst66Quest1_Location = "Yuula (Shattrath City; "..YELLOW.."65,42"..WHITE..")"
Inst66Quest1_Note = "The prequest is also obtained from the same NPC. Blackwind Landing is at "..YELLOW.."[1]"..WHITE.."."
Inst66Quest1_Prequest = "Threat from Above"
Inst66Quest1_Folgequest = "Fires Over Skettis"
Inst66Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst66Quest2 = "2. Fires Over Skettis (Daily)"
Inst66Quest2_Level = "70"
Inst66Quest2_Attain = "70"
Inst66Quest2_Aim = "Seek out Monstrous Kaliri Eggs on the tops of Skettis dwellings and use the Skyguard Blasting Charges on them. Return to Sky Sergeant Doryn."
Inst66Quest2_Location = "Sky Sergeant Doryn (Terrokar Forest - Blackwing Landing; "..YELLOW.."65,66"..WHITE..")"
Inst66Quest2_Note = "This quest can be completed once a day. The eggs can be bombed while on your flying mount from the air. Watch out for the Monstrous Kaliri birds flying around as they can dismount you if you aggro. The quest can be done as a group."
Inst66Quest2_Prequest = "To Skettis!"
Inst66Quest2_Folgequest = "None"
Inst66Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst66Quest3 = "3. Escape from Skettis (Daily)"
Inst66Quest3_Level = "70"
Inst66Quest3_Attain = "70"
Inst66Quest3_Aim = "Escort the Skyguard Prisoner to safety and report to Sky Sergeant Doryn."
Inst66Quest3_Location = "Skyguard Prisoner (Terrokar Forest - Skettis; "..YELLOW.."[4]"..WHITE..")"
Inst66Quest3_Note = "This quest can be completed once a day and will become available after completing 'To Skettis!'.\nThe Skyguard Prisoner randomly spawns at one of the three locations marked as "..YELLOW.."[4]"..WHITE..".  The quest can be done as a group."
Inst66Quest3_Prequest = "None"
Inst66Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst66Quest4 = "4. Hungry Nether Rays"
Inst66Quest4_Level = "70"
Inst66Quest4_Attain = "70"
Inst66Quest4_Aim = "Use the Nether Ray Cage in the woods south of Blackwind Landing and slay Blackwind Warp Chasers near the Hungry Nether Ray. Return to Skyguard Handler Deesak when you've completed your task."
Inst66Quest4_Location = "Skyguard Handler Deesak (Terrokar Forest - Blackwing Landing; "..YELLOW.."63,66"..WHITE..")"
Inst66Quest4_Note = "The Blackwing Warp Chasers (make sure you kill Chasers, not Stalkers) can be found along the southern edge of Skettis. The Hungry Nether Ray must be close to the Chaser when it is killed. Don't move away from the corpse until you get quest credit, it usually takes a few seconds."
Inst66Quest4_Prequest = "None"
Inst66Quest4_Folgequest = "None"
--
Inst66Quest4name1 = "Elixir of Major Agility"
Inst66Quest4name2 = "Adept's Elixir"

--Quest 5 Alliance
Inst66Quest5 = "5. World of Shadows"
Inst66Quest5_Level = "70"
Inst66Quest5_Attain = "70"
Inst66Quest5_Aim = "Severin wants you to venture into Skettis and retrieve 6 Shadow Dusts from the arakkoa that dwell there."
Inst66Quest5_Location = "Severin (Terrokar Forest - Blackwing Landing; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest5_Note = "This quest is repeatable. Any of the Arakkoa can drop the Shadow Dust."
Inst66Quest5_Prequest = "None"
Inst66Quest5_Folgequest = "None"
--
Inst66Quest5name1 = "Elixir of Shadows"

--Quest 6 Alliance
Inst66Quest6 = "6. Secrets of the Talonpriests"
Inst66Quest6_Level = "70"
Inst66Quest6_Attain = "70"
Inst66Quest6_Aim = "Obtain an Elixir of Shadows from Severin and use it to find and slay Talonpriest Ishaal, Talonpriest Skizzik and Talonpriest Zellek in Skettis. Return to Commander Adaris after completing this task."
Inst66Quest6_Location = "Sky Commander Adaris (Terrokar Forest - Blackwing Landing; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest6_Note = "You must complete World of Shadows to obtain the Elixir of Shadows before you can do this quest.\n\nTalonpriest Ishaal is at "..YELLOW.."[5]"..WHITE..", Talonpriest Skizzik is at "..YELLOW.."[6]"..WHITE.." and Talonpriest Zellek is at "..YELLOW.."[7]"..WHITE.."."
Inst66Quest6_Prequest = "World of Shadows"
Inst66Quest6_Folgequest = "None"
Inst66Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst66Quest7 = "7. Ishaal's Almanac"
Inst66Quest7_Level = "70"
Inst66Quest7_Attain = "70"
Inst66Quest7_Aim = "Bring Ishaal's Almanac to Sky Commander Adaris north of Skettis."
Inst66Quest7_Location = "Ishaal's Almanac (drops from Talonpriest Ishaal; "..YELLOW.."[5]"..WHITE..")"
Inst66Quest7_Note = "Sky Commander Adaris is at Terrokar Forest - Blackwing Landing ("..YELLOW.."64,66"..WHITE..")."
Inst66Quest7_Prequest = "None"
Inst66Quest7_Folgequest = "An Ally in Lower City"
-- No Rewards for this quest

--Quest 8 Alliance
Inst66Quest8 = "8. An Ally in Lower City"
Inst66Quest8_Level = "70"
Inst66Quest8_Attain = "70"
Inst66Quest8_Aim = "Bring Ishaal's Almanac to Rilak the Redeemed in Lower City inside Shattrath."
Inst66Quest8_Location = "Sky Commander Adaris (Terrokar Forest - Blackwing Landing; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest8_Note = "Rilak the Redeemed is at Shattrath City - Lower City ("..YELLOW.."52,20"..WHITE..")."
Inst66Quest8_Prequest = "Ishaal's Almanac"
Inst66Quest8_Folgequest = "Countdown to Doom"
Inst66Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst66Quest9 = "9. Countdown to Doom"
Inst66Quest9_Level = "70"
Inst66Quest9_Attain = "70"
Inst66Quest9_Aim = "Return to Sky Commander Adaris with the news about Terokk's return."
Inst66Quest9_Location = "Rilak the Redeemed (Shattrath City - Lower City; "..YELLOW.."52,20"..WHITE..")"
Inst66Quest9_Note = "Sky Commander Adaris is at Terrokar Forest - Blackwing Landing ("..YELLOW.."64,66"..WHITE.."). Hazzik, who is nearby, will give you the followup quest."
Inst66Quest9_Prequest = "An Ally in Lower City"
Inst66Quest9_Folgequest = "Hazzik's Bargain"
Inst66Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst66Quest10 = "10. Hazzik's Bargain"
Inst66Quest10_Level = "70"
Inst66Quest10_Attain = "70"
Inst66Quest10_Aim = "Obtain Hazzik's Package at his dwelling in eastern Skettis and return to him with it."
Inst66Quest10_Location = "Hazzik (Terrokar Forest - Blackwing Landing; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest10_Note = "Hazzik's Package is in a hut at "..YELLOW.."[8]"..WHITE.."."
Inst66Quest10_Prequest = "Countdown to Doom"
Inst66Quest10_Folgequest = "A Shabby Disguise"
Inst66Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst66Quest11 = "11. A Shabby Disguise"
Inst66Quest11_Level = "70"
Inst66Quest11_Attain = "70"
Inst66Quest11_Aim = "Use the Shabby Arakkoa Disguise to obtain the Adversarial Bloodlines from Sahaak and return to Hazzik."
Inst66Quest11_Location = "Hazzik (Terrokar Forest - Blackwing Landing; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest11_Note = "Sahaak is at "..YELLOW.."[3]"..WHITE..". If any Arakkoa other than Sahaak see you with the disguise, they will attack you."
Inst66Quest11_Prequest = "Hazzik's Bargain"
Inst66Quest11_Folgequest = "Adversarial Blood"
Inst66Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst66Quest12 = "12. Adversarial Blood"
Inst66Quest12_Level = "70"
Inst66Quest12_Attain = "70"
Inst66Quest12_Aim = "Find the Skull Piles in the middle of the summoning circles of Skettis. Summon and defeat each of the descendants by using 10 Time-Lost Scrolls at the Skull Pile. Return to Hazzik at Blackwind Landing with a token from each."
Inst66Quest12_Location = "Hazzik (Terrokar Forest - Blackwing Landing; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest12_Note = "The skull piles are at "..GREEN.."[1']"..WHITE..". Only one quest item per group drops for each kill. So each group member who needs the quest will need 10 Scrolls to summon the descendants for their item. The quest item is green quality, so it will have to be rolled for if group loot is on. This quest is repeatable."
Inst66Quest12_Prequest = "A Shabby Disguise"
Inst66Quest12_Folgequest = "None"
Inst66Quest12FQuest = "true"
--
Inst66Quest12name1 = "Time-Lost Offering"

--Quest 13 Alliance
Inst66Quest13 = "13. Terokk's Downfall"
Inst66Quest13_Level = "70"
Inst66Quest13_Attain = "70"
Inst66Quest13_Aim = "Take the Time-Lost Offering prepared by Hazzik to the Skull Pile at the center of Skettis and summon and defeat Terokk. Return to Sky Commander Adaris when you've completed this task."
Inst66Quest13_Location = "Sky Commander Adaris (Terrokar Forest - Blackwing Landing; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest13_Note = "Terokk is summoned at "..YELLOW.."[2]"..WHITE..". Tip from fissi0nx on Wowhead:\nAt 20% Terokk becomes immune to all attacks, and you'll see a blue flare shortly afterward, where a bomb will drop down. Drag Terokk into the flame to break his shield. He'll become enraged but you'll be able to kill him."
Inst66Quest13_Prequest = "Adversarial Blood"
Inst66Quest13_Folgequest = "None"
Inst66Quest13PreQuest = "true"
--
Inst66Quest13name1 = "Jeweled Rod"
Inst66Quest13name2 = "Scout's Throwing Knives"
Inst66Quest13name3 = "Severin's Cane"
Inst66Quest13name4 = "Windcharger's Lance"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst66Quest1_HORDE = Inst66Quest1
Inst66Quest1_HORDE_Level = Inst66Quest1_Level
Inst66Quest1_HORDE_Attain = Inst66Quest1_Attain
Inst66Quest1_HORDE_Aim = Inst66Quest1_Aim
Inst66Quest1_HORDE_Location = Inst66Quest1_Location
Inst66Quest1_HORDE_Note = Inst66Quest1_Note
Inst66Quest1_HORDE_Prequest = Inst66Quest1_Prequest
Inst66Quest1_HORDE_Folgequest = Inst66Quest1_Folgequest
Inst66Quest1PreQuest_HORDE = Inst66Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst66Quest2_HORDE = Inst66Quest2
Inst66Quest2_HORDE_Level = Inst66Quest2_Level
Inst66Quest2_HORDE_Attain = Inst66Quest2_Attain
Inst66Quest2_HORDE_Aim = Inst66Quest2_Aim
Inst66Quest2_HORDE_Location = Inst66Quest2_Location
Inst66Quest2_HORDE_Note = Inst66Quest2_Note
Inst66Quest2_HORDE_Prequest = Inst66Quest2_Prequest
Inst66Quest2_HORDE_Folgequest = Inst66Quest2_Folgequest
Inst66Quest2PreQuest_HORDE = Inst66Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst66Quest3_HORDE = Inst66Quest3
Inst66Quest3_HORDE_Level = Inst66Quest3_Level
Inst66Quest3_HORDE_Attain = Inst66Quest3_Attain
Inst66Quest3_HORDE_Aim = Inst66Quest3_Aim
Inst66Quest3_HORDE_Location = Inst66Quest3_Location
Inst66Quest3_HORDE_Note = Inst66Quest3_Note
Inst66Quest3_HORDE_Prequest = Inst66Quest3_Prequest
Inst66Quest3_HORDE_Folgequest = Inst66Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst66Quest4_HORDE = Inst66Quest4
Inst66Quest4_HORDE_Level = Inst66Quest4_Level
Inst66Quest4_HORDE_Attain = Inst66Quest4_Attain
Inst66Quest4_HORDE_Aim = Inst66Quest4_Aim
Inst66Quest4_HORDE_Location = Inst66Quest4_Location
Inst66Quest4_HORDE_Note = Inst66Quest4_Note
Inst66Quest4_HORDE_Prequest = Inst66Quest4_Prequest
Inst66Quest4_HORDE_Folgequest = Inst66Quest4_Folgequest
--
Inst66Quest4name1_HORDE = Inst66Quest4name1
Inst66Quest4name2_HORDE = Inst66Quest4name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst66Quest5_HORDE = Inst66Quest5
Inst66Quest5_HORDE_Level = Inst66Quest5_Level
Inst66Quest5_HORDE_Attain = Inst66Quest5_Attain
Inst66Quest5_HORDE_Aim = Inst66Quest5_Aim
Inst66Quest5_HORDE_Location = Inst66Quest5_Location
Inst66Quest5_HORDE_Note = Inst66Quest5_Note
Inst66Quest5_HORDE_Prequest = Inst66Quest5_Prequest
Inst66Quest5_HORDE_Folgequest = Inst66Quest5_Folgequest
--
Inst66Quest5name1_HORDE = Inst66Quest5name1
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst66Quest6_HORDE = Inst66Quest6
Inst66Quest6_HORDE_Level = Inst66Quest6_Level
Inst66Quest6_HORDE_Attain = Inst66Quest6_Attain
Inst66Quest6_HORDE_Aim = Inst66Quest6_Aim
Inst66Quest6_HORDE_Location = Inst66Quest6_Location
Inst66Quest6_HORDE_Note = Inst66Quest6_Note
Inst66Quest6_HORDE_Prequest = Inst66Quest6_Prequest
Inst66Quest6_HORDE_Folgequest = Inst66Quest6_Folgequest
Inst66Quest6PreQuest_HORDE = Inst66Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst66Quest7_HORDE = Inst66Quest7
Inst66Quest7_HORDE_Level = Inst66Quest7_Level
Inst66Quest7_HORDE_Attain = Inst66Quest7_Attain
Inst66Quest7_HORDE_Aim = Inst66Quest7_Aim
Inst66Quest7_HORDE_Location = Inst66Quest7_Location
Inst66Quest7_HORDE_Note = Inst66Quest7_Note
Inst66Quest7_HORDE_Prequest = Inst66Quest7_Prequest
Inst66Quest7_HORDE_Folgequest = Inst66Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst66Quest8_HORDE = Inst66Quest8
Inst66Quest8_HORDE_Level = Inst66Quest8_Level
Inst66Quest8_HORDE_Attain = Inst66Quest8_Attain
Inst66Quest8_HORDE_Aim = Inst66Quest8_Aim
Inst66Quest8_HORDE_Location = Inst66Quest8_Location
Inst66Quest8_HORDE_Note = Inst66Quest8_Note
Inst66Quest8_HORDE_Prequest = Inst66Quest8_Prequest
Inst66Quest8_HORDE_Folgequest = Inst66Quest8_Folgequest
Inst66Quest8FQuest_HORDE = Inst66Quest8FQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst66Quest9_HORDE = Inst66Quest9
Inst66Quest9_HORDE_Level = Inst66Quest9_Level
Inst66Quest9_HORDE_Attain = Inst66Quest9_Attain
Inst66Quest9_HORDE_Aim = Inst66Quest9_Aim
Inst66Quest9_HORDE_Location = Inst66Quest9_Location
Inst66Quest9_HORDE_Note = Inst66Quest9_Note
Inst66Quest9_HORDE_Prequest = Inst66Quest9_Prequest
Inst66Quest9_HORDE_Folgequest = Inst66Quest9_Folgequest
Inst66Quest9FQuest_HORDE = Inst66Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst66Quest10_HORDE = Inst66Quest10
Inst66Quest10_HORDE_Level = Inst66Quest10_Level
Inst66Quest10_HORDE_Attain = Inst66Quest10_Attain
Inst66Quest10_HORDE_Aim = Inst66Quest10_Aim
Inst66Quest10_HORDE_Location = Inst66Quest10_Location
Inst66Quest10_HORDE_Note = Inst66Quest10_Note
Inst66Quest10_HORDE_Prequest = Inst66Quest10_Prequest
Inst66Quest10_HORDE_Folgequest = Inst66Quest10_Folgequest
Inst66Quest10FQuest_HORDE = Inst66Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst66Quest11_HORDE = Inst66Quest11
Inst66Quest11_HORDE_Level = Inst66Quest11_Level
Inst66Quest11_HORDE_Attain = Inst66Quest11_Attain
Inst66Quest11_HORDE_Aim = Inst66Quest11_Aim
Inst66Quest11_HORDE_Location = Inst66Quest11_Location
Inst66Quest11_HORDE_Note = Inst66Quest11_Note
Inst66Quest11_HORDE_Prequest = Inst66Quest11_Prequest
Inst66Quest11_HORDE_Folgequest = Inst66Quest11_Folgequest
Inst66Quest11FQuest_HORDE = Inst66Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst66Quest12_HORDE = Inst66Quest12
Inst66Quest12_HORDE_Level = Inst66Quest12_Level
Inst66Quest12_HORDE_Attain = Inst66Quest12_Attain
Inst66Quest12_HORDE_Aim = Inst66Quest12_Aim
Inst66Quest12_HORDE_Location = Inst66Quest12_Location
Inst66Quest12_HORDE_Note = Inst66Quest12_Note
Inst66Quest12_HORDE_Prequest = Inst66Quest12_Prequest
Inst66Quest12_HORDE_Folgequest = Inst66Quest12_Folgequest
Inst66Quest12FQuest_HORDE = Inst66Quest12FQuest
--
Inst66Quest12name1_HORDE = Inst66Quest12name1

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst66Quest13_HORDE = Inst66Quest13
Inst66Quest13_HORDE_Level = Inst66Quest13_Level
Inst66Quest13_HORDE_Attain = Inst66Quest13_Attain
Inst66Quest13_HORDE_Aim = Inst66Quest13_Aim
Inst66Quest13_HORDE_Location = Inst66Quest13_Location
Inst66Quest13_HORDE_Note = Inst66Quest13_Note
Inst66Quest13_HORDE_Prequest = Inst66Quest13_Prequest
Inst66Quest13_HORDE_Folgequest = Inst66Quest13_Folgequest
Inst66Quest13PreQuest_HORDE = Inst66Quest13PreQuest
Inst66Quest13FQuest_HORDE = Inst66Quest13FQuest
--
Inst66Quest13name1_HORDE = Inst66Quest13name1
Inst66Quest13name2_HORDE = Inst66Quest13name2
Inst66Quest13name3_HORDE = Inst66Quest13name3
Inst66Quest13name4_HORDE = Inst66Quest13name4




---------------------------
--- AQ Instance Numbers ---
---------------------------

-- 1  = Deadmines (VC)
-- 2  = Wailing Caverns (WC)
-- 3  = Ragefire Chasm (RFC)
-- 4  = Uldaman (ULD)
-- 5  = Blackrock Depths (BRD)
-- 6  = Blackwing Lair (BWL)
-- 7  = Blackfathom Deeps (BFD)
-- 8  = Lower Blackrock Spire (LBRS)
-- 9  = Upper Blackrock Spire (UBRS)
-- 10 = Dire Maul East (DM)
-- 11 = Dire Maul North (DM)
-- 12 = Dire Maul West (DM)
-- 13 = Maraudon (Mara)
-- 14 = Molten Core (MC)
-- 15 = Old Naxxramas (removed)
-- 16 = Onyxia's Lair (Ony)
-- 17 = Razorfen Downs (RFD)
-- 18 = Razorfen Kraul (RFK)
-- 19 = SM: Library (SM Lib)
-- 20 = Scholomance (Scholo)
-- 21 = Shadowfang Keep (SFK)
-- 22 = Stratholme (Strat)
-- 23 = The Ruins of Ahn'Qiraj (AQ20)
-- 24 = The Stockade (Stocks)
-- 25 = Sunken Temple (ST)
-- 26 = The Temple of Ahn'Qiraj (AQ40)
-- 27 = Zul'Farrak (ZF)
-- 28 = Zul'Gurub (ZG)
-- 29 = Gnomeregan (Gnomer)
-- 30 = Four Dragons
-- 31 = Azuregos
-- 32 = Highlord Kruul (removed)
-- 33 = Alterac Valley (AV)
-- 34 = Arathi Basin (AB)
-- 35 = Warsong Gulch (WSG)
-- 36 =  default "rest"
-- 37 = HFC: Ramparts (Ramp)
-- 38 = HFC: Blood Furnace (BF)
-- 39 = HFC: Shattered Halls (SH)
-- 40 = HFC: Magtheridon's Lair
-- 41 = CR: The Slave Pens (SP)
-- 42 = CR: The Steamvault (SV)
-- 43 = CR: The Underbog (UB)
-- 44 = Auchindoun: Auchenai Crypts (AC)
-- 45 = Auchindoun: Mana Tombs (MT)
-- 46 = Auchindoun: Sethekk Halls (Seth)
-- 47 = Auchindoun: Shadow Labyrinth (SLabs)
-- 48 = CR: Serpentshrine Cavern (SSC)
-- 49 = CoT: Black Morass (BM)
-- 50 = CoT: Battle of Mount Hyjal
-- 51 = CoT: Old Hillsbrad
-- 52 = Gruul's Lair (GL)
-- 53 = Karazhan (Kara)
-- 54 = TK: Arcatraz (Arc)
-- 55 = TK: Botanica (Bot)
-- 56 = TK: Mechanar (Mech)
-- 57 = SM: Armory (SM Arm)
-- 58 = SM: Cathedral (SM Cath)
-- 59 = SM: Graveyard (SM GY)
-- 60 = Eye of the Storm
-- 61 = TK: The Eye
-- 62 = Black Temple (BT)
-- 63 = Zul'Aman (ZA)
-- 64 = Doom Lord Kazzak
-- 65 = Doomwalker
-- 66 = Skettis
-- 67 = Magisters' Terrace
-- 68 = Sunwell Plateau
-- 69 = Caverns of Time: Stratholme Past
-- 70 = Utgarde Keep: Utgarde Keep
-- 71 = Utgarde Keep: Utgarde Pinnacle
-- 72 = The Nexus: The Nexus
-- 73 = The Nexus: The Oculus
-- 74 = The Nexus: The Eye of Eternity
-- 75 = Azjol-Nerub: The Upper Kingdom
-- 76 = Azjol-Nerub: Ahn'kahet: The Old Kingdom
-- 77 = Ulduar: Halls of Stone
-- 78 = Ulduar: Halls of Lightning
-- 79 = The Obsidian Sanctum
-- 80 = Drak'Tharon Keep
-- 81 = Zul'Drak: Gundrak
-- 82 = The Violet Hold
-- 83 = Strand of the Ancients (SotA)
-- 84 = Naxxramas (Naxx)
-- 85 = Vault of Archavon (VoA)
-- 86 = Ulduar
-- 87 = Trial of the Champion (ToC)
-- 88 = Trial of the Crusader (ToC)
-- 89 = Isle of Conquest (IoC)
-- 90 = Forge of Souls (FoS)
-- 91 = Pit of Saron (PoS)
-- 92 = Halls of Reflection (HoR)
-- 93 = Icecrown Citadel (ICC)
-- 94 = Ruby Sanctum (RS)

