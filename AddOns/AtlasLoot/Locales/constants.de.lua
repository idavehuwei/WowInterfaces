local AceLocale = LibStub:GetLibrary("AceLocale-3.0");

local AL = AceLocale:NewLocale("AtlasLoot", "deDE", false);

if AL then
    --Text strings for UI objects
    AL["AtlasLoot"] = "AtlasLoot";
    AL["No match found for"] = "Kein Eintrag gefunden für";
    AL["Search"] = "Suchen";
    AL["Clear"] = "Löschen";
    AL["Select Loot Table"] = "Wähle Loot Rubrik";
    AL["Select Sub-Table"] = "Wähle Unter-Rubrik";
    AL["Drop Rate: "] = "Droprate: ";
    --- AL["DKP"] = "DKP";
    AL["Priority:"] = "Priorität:";
    AL["Click boss name to view loot."] = "Klicke Boss um den Loot zu sehen.";
    AL["Various Locations"] = "Verschiedene Orte";
    AL["This is a loot browser only.  To view maps as well, install either Atlas or Alphamap."] = "Atlasloot zeigt nur Loot an. Falls du Karten möchtest, installiere bitte 'Atlas' oder 'Alphamap'.";
    AL["Toggle AL Panel"] = "AL-Leiste ein/aus";
    AL[" is safe."] = " ist sicher.";
    AL["Server queried for "] = "Fragt den Server nach ";
    AL[".  Right click on any other item to refresh the loot page."] = ".  Rechtsklicke auf ein beliebiges anderes Item um den Loot auf der Seite zu aktualisieren.";
    AL["Back"] = "Zurück";
    AL["Level 60"] = "Level 60";
    AL["Level 70"] = "Level 70";
    AL["|cffff0000(unsafe)"] = " |cffff0000(unsicher)";
    AL["Misc"] = "Sonstiges";
    AL["Rewards"] = "Belohnungen";
    AL["Heroic Mode"] = "Heroisch";
    AL["Normal Mode"] = "Normal";
    AL["Show 10 Man Loot"] = "Zeige 10 Man Loot";
    AL["Show 25 Man Loot"] = "Zeige 25 Man Loot";
    --- AL["Raid"] = true;
    AL["Factions - Original WoW"] = "Classic Fraktionen";
    AL["Factions - Burning Crusade"] = "Burning Crusade Fraktionen";
    AL["Factions - Wrath of the Lich King"] = "Wrath of the Lich King Fraktionen";
    AL["Choose Table ..."] = "Wähle Tabelle ...";
    AL["Close Menu"] = "Schließe Menü";
    AL["Unknown"] = "Unknown";
    AL["Skill Required:"] = "Benötigt Fertigkeit:";
    --- AL["QuickLook"] = true,
    AL["Add to QuickLooks:"] = "Zu QuickLook hinzufügen";
    ---AL["Query Server"] = true,
    AL["Classic Instances"] = "Classic Instanzen";
    AL["BC Instances"] = "BC Instanzen";
    AL["WotLK Instances"] = "WotLK Instanzen";
    --- AL["Burning Crusade"] = true;
    AL["Entrance"] = "Eingang";
    ---AL["Original Factions"] = true;
    ---AL["BC Factions"] = true;
    ---AL["WotLK Factions"] = true;
    ---AL["Reset Frames"] = true;
    ---AL["Reset Wishlist"] = true;
    ---AL["Reset Quicklooks"] = true;
    ---AL["Select a Loot Table..."] = true;
    ---AL["OR"] = "true";
    ---AL["Wrath of the Lich King"] = true;
    ---AL["FuBar Options"] = true;
    ---AL["Attach to Minimap"] = true;
    ---AL["Hide FuBar Plugin"] = true;
    ---AL["Position:"] = true;
    AL["Left"] = "Links";
    AL["Center"] = "Mitte";
    AL["Right"] = "Rechts";
    AL["Hide Text"] = "Verstecke Text";
    AL["Hide Icon"] = "Verstecke Icon";
    --- AL["Minimap Button Options"] = true;

    --Text for Options Panel
    AL["Atlasloot Options"] = "AtlasLoot Optionen";
    AL["Safe Chat Links"] = "Sichere Chatlinks";
    AL["Default Tooltips"] = "Standard Tooltips";
    AL["Lootlink Tooltips"] = "Lootlink Tooltips";
    AL["|cff9d9d9dLootlink Tooltips|r"] = "|cff9d9d9dLootlink Tooltips|r";
    AL["ItemSync Tooltips"] = "ItemSync Tooltpis";
    AL["|cff9d9d9dItemSync Tooltips|r"] = "|cff9d9d9dItemSync Tooltips|r";
    AL["Use EquipCompare"] = "Benutze EquipCompare";
    AL["|cff9d9d9dUse EquipCompare|r"] = "|cff9d9d9dBenutze EquipCompare|r";
    AL["Show Comparison Tooltips"] = "Zeige eigenes Item zum Vergleich";
    AL["Make Loot Table Opaque"] = "Hintergrund undurchsichtig";
    AL["Show itemIDs at all times"] = "Zeige Item-IDs immer an";
    AL["Hide AtlasLoot Panel"] = "Blende die AtlasLoot-Leiste aus";
    AL["Show Minimap Button"] = "Blende Button an der Minimap ein";
    AL["Set Minimap Button Position"] = "Setze die Position des Buttons an der Minimap";
    AL["Done"] = "OK";
    AL["Search Result: %s"] = "Suchtext";
    AL["Last Result"] = "Letzte Suche";
    AL["Search on"] = "Suchen in";
    AL["All modules"] = "Alle Module";
    AL["If checked, AtlasLoot will load and search across all the modules."] = "Falls gewählt, sucht Atlasloot in allen Modulen";
    AL["Search options"] = "Suchoptionen";
    ---AL["Partial matching"] = true,
    ---AL["If checked, AtlasLoot search item names for a partial match."] = true,
    AL["You don't have any module selected to search on!"] = "Du hast kein Modul zur Suche ausgewählt";
    --The next 4 lines are the tooltip for the Server Query Button
    --The translation doesn't have to be literal, just re-write the
    --sentences as you would naturally and break them up into 4 roughly
    --equal lines.
    AL["Queries the server for all items"] = "Fragt den Server nach allen Items";
   	AL["on this page. The items will be"] = "auf dieser Seite. Die Items werden";
    AL["refreshed when you next mouse"] = "geladen, sobald ihr das nächste Mal";
    AL["over them."] = "mit der Maus drüber fahrt.";

    --Slash commands
	--    AL["reset"] = true,
	--    AL["options"] = true,
	--    AL["Reset complete!"] = true,

    --Error Messages and warnings
    AL["AtlasLoot Error!"] = "AtlasLoot Fehler!";
    AL["WishList Full!"] = "Wunschzettel voll!";
    AL[" added to the WishList."] = " zum Wunschzettel hinzugefügt";
    AL[" already in the WishList!"] = " bereits auf dem Wunschzettel!";
    AL[" deleted from the WishList."] = " vom Wunschzettel gelöscht";

    --Incomplete Table Registry error message
    AL[" not listed in loot table registry, please report this message to the AtlasLoot forums at http://www.atlasloot.net"] = " nicht im Loot-Tabellen Register gelistet, bitte melde diese Nachricht im AtlasLoot Forum unter http://www.atlasloot.net";

    --LoD Module disabled or missing
    AL[" is unavailable, the following load on demand module is required: "] = " ist nicht verfügbar, das folgende Modul wird benötigt: ";

    --LoD Module load sequence could not be completed
    AL["Status of the following module could not be determined: "] = "Status von folgendem Modul konnte nicht festgestellt werden: ";

    --LoD Module required has loaded, but loot table is missing
    AL[" could not be accessed, the following module may be out of date: "] = " konnte nicht erreicht werden, das folgende Modul könnte veraltet sein: ";

    --LoD module loaded successfully
    AL["sucessfully loaded."] = "erfogreich geladen.";

    --Need a big dataset for searching
    AL["Loading available tables for searching"] = "Lade verfügbare Module zum Suchen";

    --All Available modules loaded
    AL["All Available Modules Loaded"] = "Alle verfügbaren Module geladen";

    --Minimap Button
    AL["|cff1eff00Left-Click|r Browse Loot Tables"] = "|cff1eff00Linksklick|r Loot-Tabellen durchsuchen";
    AL["|cffff0000Right-Click|r View Options"] = "|cffff0000Rechtsklick|r Optionen anzeigen";
    AL["|cffff0000Shift-Click|r View Options"] = "|cffff0000Shift-Klick|r Optionen anzeigen";
    AL["|cffccccccLeft-Click + Drag|r Move Minimap Button"] = "|cffccccccLinksklick + Ziehen|r Minimap-Button bewegen";

    --AtlasLoot Panel
    AL["Options"] = "Optionen";
    AL["Collections"] = "Sammlungen";
    AL["Factions"] = "Fraktionen";
    AL["World Events"] = "Welt-Events";
    AL["Load Modules"] = "Module laden";
	--- AL["Crafting"] = true,

    --First time user
    AL["Welcome to Atlasloot Enhanced.  Please take a moment to set your preferences."] = "Willkommen zu Atlasloot Enhanced!  Bitte nimm dir einen Moment Zeit, um die Einstellungen festzulegen";
    AL["Welcome to Atlasloot Enhanced.  Please take a moment to set your preferences for tooltips and links in the chat window.\n\n  This options screen can be reached again at any later time by typing '/atlasloot'."] = "Willkommen zu Atlasloot Enhanced!  Bitte nimm dir einen Moment Zeit, um die Einstellungen für Tooltips und Chatlinks festzulegen.\nWenn du später etwas ändern willst, kannst du den Optionsbildschirm mit /atlasloot aufrufen.";
    AL["Setup"] = "Optionen";

    --Old Atlas Detected
    AL["It has been detected that your version of Atlas does not match the version that Atlasloot is tuned for ("] = "Atlasloot hat festgestellt, dass die Version von Atlas, die du benutzt, nicht der Version entspricht für die Atlasloot konzipiert ist(";
    AL[").  Depending on changes, there may be the occasional error, so please visit http://www.atlasmod.com as soon as possible to update."] = "). Dadurch können (schwere) Fehler auftreten! Bitte besuch so schnell wie möglich http://www.atlasmod.com und lad dir die neuste Atlas Version runter.";
    --- AL["OK"] = "OK";
    AL["Incompatible Atlas Detected"] = "Nicht kompatibles Atlas gefunden";

    --Unsafe item tooltip
    AL["Unsafe Item"] = "Unsicheres Item";
    AL["Item Unavailable"] = "Item nicht verfügbar";
	---	AL["ItemID:"] = true,
    AL["This item is not available on your server or your battlegroup yet."] = "Dieses Item ist auf deinem Server bzw. deinem Realmpool nicht verfügbar";
    AL["This item is unsafe.  To view this item without the risk of disconnection, you need to have first seen it in the game world. This is a restriction enforced by Blizzard since Patch 1.10."] = "Diese Item ist unsicher.\nSobald du dieses Item ingame gesehen hast,\nbesteht nicht mehr die Gefahr eines Verbindungsabbruch\n(Es ist dann nicht mehr unsicher). Diese\nBestimmung wurde von Blizzard mit\nPatch 1.10 festgelegt.";
    AL["You can right-click to attempt to query the server.  You may be disconnected."] = "Mit einem Rechtsklick wird der\nServer nach dem Item abgefragt, dabei\nkönnte die Verbindung unterbrochen werden.";

    --Misc Inventory related words
    AL["Enchant"] = "Verzauberung";
    AL["Scope"] = "Zielfernrohr";
    AL["Darkmoon Faire Card"] = "Dunkelmond-Karte";
	--- AL["Banner"] = true,
	--- AL["Set"] = true,
    AL["Token"] = "Gutschein";
    AL["Skinning Knife"] = "Kürschnermesser";
    AL["Herbalism Knife"] = "Kräuterkundemesser";
    AL["Fish"] = "Fisch";
    AL["Combat Pet"] = "Haustier (Kampf)";
    AL["Fireworks"] = "Feuerwerk";

    --Extra inventory stuff
    AL["Cloak"] = "Umhang";
    AL["Weapons"] = "Waffen";

    --Labels for loot descriptions
    AL["Classes:"] = "Klassen:";
    AL["This Item Begins a Quest"] = "Dieser Gegenstand startet eine Quest";
    AL["Quest Item"] = "Questgegenstand";
    AL["Quest Reward"] = "Questbelohnung";
    AL["Shared"] = "geteilter Loot";
    AL["Unique"] = "Einzigartig";
    AL["Right Half"] = "Rechte Hälfte";
    AL["Left Half"] = "Linke Hälfte";
    AL["28 Slot Soul Shard"] = "28er-Behälter Seelensplitter";
    AL["20 Slot"] = "20 Platz";
    AL["18 Slot"] = "18 Platz";
    AL["16 Slot"] = "16 Platz";
    AL["10 Slot"] = "10 Platz";
    AL["(has random enchantment)"] = "(zufällige Verzauberung)";
    AL["Use to purchase rewards"] = "Zum Kaufen von Belohnungen";
    AL["Use to purchase rewards (Horde)"] = "Zum Kaufen von Belohnungen (Horde)";
    AL["Use to purchase rewards (Alliance)"] = "Zum Kaufen von Belohnungen (Allianz)";
    AL["World Bosses"] = "Weltbosse";
    AL["Reputation Factions"] = "Ruf-Fraktionen";
    AL["Sets/Collections"] = "Sets/Sammlungen";
    AL["Card Game Item"] = "Kartenspiel Item";
	--    AL["Tier 4"] = true,
	--    AL["Tier 5"] = true,
	--    AL["Tier 6"] = true,
    AL["Arena Reward"] = "Arena Belohnung";
    AL["Conjured Item"] = "Verbrauchbar";
    AL["Used to summon boss"] = "Zur Beschwörung benötigt (Boss)";
	--    AL["Phase 1"] = true,
	--    AL["Phase 2"] = true,
	--    AL["Phase 3"] = true,
    AL["Fire"] = "Feuer";
    AL["Water"] = "Wasser";
    AL["Wind"] = "Wind";
    AL["Earth"] = "Erde";
    AL["Master Angler"] = "Anglermeister";
    AL["First Prize"] = "Hauptpreis";
    AL["Rare Fish Rewards"] = "Besonderer Fisch - Belohnungen";
    AL["Rare Fish"] = "Besondere Fische";
	AL["Tradable against sunmote + item above"] = "Tausch:obiges Item + Sonnenpartikel";
	AL["Rare"] = "Rare";
	AL["Heroic"] = "Heroic";
	AL["Summon"] = "Summon";
	AL["Random"] = "Random";
    AL["Weapons"] = "Waffen";

	--Darkmoon Faire
--	AL["Darkmoon Faire Rewards"] = true;
--	AL["Low Level Decks"] = true;
--	AL["Original and BC Trinkets"] = true;
--	AL["WotLK Trinkets"] = true;
    
	--Argent Tournament
--	AL["Argent Tournament"] = true;

	-- Daily Quest
--	AL["Jewelcrafting Daily"] = true;
--	AL["Cooking Daily"] = true;

    --Card Game Decks and descriptions
    AL["Upper Deck Card Game Items"] = "Upper Deck Kartenspiel Items";
    AL["Heroes of Azeroth"] = "Helden von Azeroth";
    AL["Through The Dark Portal"] = "Durch das Dunkle Portal";
    AL["Fires of Outland"] = "Feuer der Scherbenwelt";
    AL["Servants of the Betrayer"] = "Diener des Verräters";
    AL["Hunt for Illidan"] = "Die Jagd nach Illidan";
    AL["Drums of War"] = "Trommeln des Krieges";
	AL["Blood of Gladiators"] = "Blut der Gladiatoren";
    AL["Loot Card Items"] = "Beutekarten Gegenstände";
    AL["UDE Items"] = "UDE Gegenstände";
    AL["Landro Longshot"] = "Landro Fernblick";
    AL["Thunderhead Hippogryph"] = "Donnerkopfhippogryph";
    AL["Saltwater Snapjaw"] = "Salzwasserschnappkiefer";
    AL["King Mukla"] = "König Mukla";
    AL["Rest and Relaxation"] = "Ruhe und Entspannung";
    AL["Fortune Telling"] = "Wahrsagen";
    AL["Goblin Gumbo"] = "Goblineintopf";
    AL["Gone Fishin'"] = "Bin Angeln'";
    AL["Spectral Tiger"] = "Spektraltiger";
    AL["March of the Legion"] = "Marsch der Legion";
    AL["Kiting"] = "Papierdrachen";
    AL["Robotic Homing Chicken"] = "Raketenhühnchen";
    AL["Paper Airplane"] = "Papierflugmaschine";
    AL["Papa Hummel's Old-fashioned Pet Biscuit"] = "Papa Hummels altmodischer Tierkuchen";
    AL["Personal Weather Machine"] = "Persönlicher Wettermacher";
    AL["X-51 Nether-Rocket"] = "X-51 Netherrakete";
    AL["The Footsteps of Illidan"] = "Die Fußspuren von Illidan";
    AL["Disco Inferno!"] = "Disko-Inferno";
    AL["Ethereal Plunderer"] = "Astraler Brandschatzer";

    --Battleground Brackets
    AL["Misc. Rewards"] = "Diverses";
    AL["Superior Rewards"] = "Seltene Items";
    AL["Epic Rewards"] = "Epische Items";
    AL["Level 10-19 Rewards"] = "Belohnungen (Level 10-19)";
    AL["Level 20-29 Rewards"] = "Belohnungen (Level 20-29)";
    AL["Level 30-39 Rewards"] = "Belohnungen (Level 30-39)";
    AL["Level 40-49 Rewards"] = "Belohnungen (Level 40-49)";
    AL["Level 50-59 Rewards"] = "Belohnungen (Level 50-59)";
    AL["Level 60 Rewards"] = "Belohnungen (Level 60)";

    --Brood of Nozdormu Paths
    AL["Path of the Conqueror"] = "Der Pfad des Eroberers";
    AL["Path of the Invoker"] = "Der Pfad des Herbeirufers";
    AL["Path of the Protector"] = "Der Pfad des Beschützers";

    --Violet Eye Paths
    AL["Path of the Violet Protector"] = "Violetter Beschützer";
    AL["Path of the Violet Mage"] = "Violetter Magier";
    AL["Path of the Violet Assassin"] = "Violetter Auftragsmörder";
    AL["Path of the Violet Restorer"] = "Violetter Bewahrer";

    --AQ Opening Event
    AL["Red Scepter Shard"] = "Roter Szeptersplitter";
    AL["Blue Scepter Shard"] = "Blauer Szeptersplitter";
    AL["Green Scepter Shard"] = "Grüner Szeptersplitter";
    AL["Scepter of the Shifting Sands"] = "Das Szepter der Sandstürme";

    --World PvP
    AL["Hellfire Fortifications"] = "Befestigung des Höllenfeuers";
    AL["Twin Spire Ruins"] = "Ruinen der Zwillingsspitze";
    AL["Spirit Towers"] = "Geistertürme";
	--    AL["Halaa"] = true,

    --Karazhan Opera Event Headings
    AL["Shared Drops"] = "geteilter Loot";
	--    AL["Romulo & Julianne"] = true,
    AL["Wizard of Oz"] = "Zauberer von Oz";
    AL["Red Riding Hood"] = "Rotkäppchen";

    --Karazhan Animal Boss Types
    AL["Spider"] = "Spinne";
    AL["Darkhound"] = "Schattenhund";
    AL["Bat"] = "Fledermaus";

    --ZG Tokens
    AL["Primal Hakkari Kossack"] = "Hakkarikosak";
    AL["Primal Hakkari Shawl"] = "Hakkarischal";
    AL["Primal Hakkari Bindings"] = "Hakkaribindungen";
    AL["Primal Hakkari Sash"] = "Hakkarischärpe";
    AL["Primal Hakkari Stanchion"] = "Hakkaristütze";
    AL["Primal Hakkari Aegis"] = "Aegis der Hakkari";
    AL["Primal Hakkari Girdle"] = "Hakkarigurt";
    AL["Primal Hakkari Armsplint"] = "Hakkariarmsplintes";
    AL["Primal Hakkari Tabard"] = "Hakkariwappenrock";

    --AQ20 Tokens
    AL["Qiraji Ornate Hilt"] = "Verschnörkelter Griff";
    AL["Qiraji Martial Drape"] = "Kampftuch";
    AL["Qiraji Magisterial Ring"] = "Gebieterring";
    AL["Qiraji Ceremonial Ring"] = "Zeremonienring";
    AL["Qiraji Regal Drape"] = "Hoheitstuch";
    AL["Qiraji Spiked Hilt"] = "Stachelgriff";

    --AQ40 Tokens
    AL["Qiraji Bindings of Dominance"] = "Dominanzbindungen";
    AL["Qiraji Bindings of Command"] = "Befehlsbindungen";
    AL["Vek'nilash's Circlet"] = "Vek'nilashs Reif";
    AL["Vek'lor's Diadem"] = "Vek'lors Diadem";
    AL["Ouro's Intact Hide"] = "Ouros intakte Haut";
    AL["Skin of the Great Sandworm"] = "Haut des Sandwurms";
    AL["Husk of the Old God"] = "Hülle des Gottes";
    AL["Carapace of the Old God"] = "Knochenpanzer des Gottes";

    --Blacksmithing Crafted Sets
    AL["Imperial Plate"] = "Stolz des Imperiums";
    AL["The Darksoul"] = "Die dunkle Seele";
    AL["Fel Iron Plate"] = "Teufelseisenplattenrüstung";
    AL["Adamantite Battlegear"] = "Adamantitschlachtrüstung";
    AL["Flame Guard"] = "Flammenwächter";
    AL["Enchanted Adamantite Armor"] = "Verzauberte Adamantitrüstung";
    AL["Khorium Ward"] = "Khoriumschutz";
    AL["Faith in Felsteel"] = "Teufelsstählerner Wille";
    AL["Burning Rage"] = "Brennernder Zorn";
    AL["Bloodsoul Embrace"] = "Umarmung der Blutseele";
    AL["Fel Iron Chain"] = "Teufelseisenkettenrüstung";

    --Tailoring Crafted Sets
    AL["Bloodvine Garb"] = "Blutrebengewand";
    AL["Netherweave Vestments"] = "Netherstoffgewänder";
    AL["Imbued Netherweave"] = "Magieerfüllte Netherstoffroben";
    AL["Arcanoweave Vestments"] = "Arkanostoffgewänder";
    AL["The Unyielding"] = "Der Unerschütterliche";
    AL["Whitemend Wisdom"] = "Weisheit des weißen Heilers";
    AL["Spellstrike Infusion"] = "Insignien des Zauberschlags";
    AL["Battlecast Garb"] = "Gewand des Schlachtenzaubers";
    AL["Soulcloth Embrace"] = "Seelenstoffumarmung";
    AL["Primal Mooncloth"] = "Urmondroben";
    AL["Shadow's Embrace"] = "Umarmung der Schatten";
    AL["Wrath of Spellfire"] = "Zorn des Zauberfeuers";

    --Leatherworking Crafted Sets
    AL["Volcanic Armor"] = "Vulkanrüstung";
    AL["Ironfeather Armor"] = "Eisenfederrüstung";
    AL["Stormshroud Armor"] = "Sturmschleier";
    AL["Devilsaur Armor"] = "Teufelsaurierrüstung";
    AL["Blood Tiger Harness"] = "Harnisch des Bluttigers";
    AL["Primal Batskin"] = "Urzeitliche Fledermaushaut";
    AL["Wild Draenish Armor"] = "Wilde draenische Rüstung";
    AL["Thick Draenic Armor"] = "Dicke draenische Rüstung";
    AL["Fel Skin"] = "Teufelshaut";
    AL["Strength of the Clefthoof"] = "Macht der Grollhufe";
    AL["Green Dragon Mail"] = "Grüner Drachenschuppenpanzer";
    AL["Blue Dragon Mail"] = "Blauer Drachenschuppenpanzer";
    AL["Black Dragon Mail"] = "Schwarzer Drachenschuppenpanzer";
    AL["Scaled Draenic Armor"] = "Geschuppte draenische Rüstung";
    AL["Felscale Armor"] = "Teufelsschuppenrüstung";
    AL["Felstalker Armor"] = "Rüstung des Teufelspirschers";
    AL["Fury of the Nether"] = "Netherzorn";
    AL["Primal Intent"] = "Urinstinkt";
    AL["Windhawk Armor"] = "Rüstung des Windfalken";
    AL["Netherscale Armor"] = "Netherschuppenrüstung";
    AL["Netherstrike Armor"] = "Rüstung des Netherstoßes";

    --Vanilla WoW Sets
    AL["Defias Leather"] = "Defiasleder";
    AL["Embrace of the Viper"] = "Umarmung der Viper";
    AL["Chain of the Scarlet Crusade"] = "Kettenrüstung des Scharlachroten Kreuzzugs";
    AL["The Gladiator"] = "Der Gladiator";
    AL["Ironweave Battlesuit"] = "Eisengewebte Kampfrüstung";
    AL["Necropile Raiment"] = "Roben des Totenbeschwörers";
    AL["Cadaverous Garb"] = "Leichenhaftes Gewand";
    AL["Bloodmail Regalia"] = "Ornat des Blutpanzers";
    AL["Deathbone Guardian"] = "Wächter der Totengebeine";
    AL["The Postmaster"] = "Der Postmeister";
    AL["Shard of the Gods"] = "Scherbe der Götter";
    AL["Zul'Gurub Rings"] = "Zul'Gurub Ringe";
    AL["Major Mojo Infusion"] = "Kraft des Mojo";
    AL["Overlord's Resolution"] = "Erlass des Oberherren";
    AL["Prayer of the Primal"] = "Gebet der Uralten";
    AL["Zanzil's Concentration"] = "Zanzils Konzentration";
    AL["Spirit of Eskhandar"] = "Seele des Eskhandar";
    AL["The Twin Blades of Hakkari"] = "Die Zwillingsklingen von Hakkari";
    AL["Primal Blessing"] = "Ursegen";
    AL["Dal'Rend's Arms"] = "Dal'Rends Waffen";
    AL["Spider's Kiss"] = "Kuss der Spinne";

    --The Burning Crusade Sets
	AL["Latro's Flurry"] = "Latros Schlaghagel";
    AL["The Twin Stars"] = "Die Zwillingssterne";
    AL["The Twin Blades of Azzinoth"] = "Die Zwillingsklingen von Azzinoth";

    --Scourge Invasion
    AL["Scourge Invasion"] = "Invasion der Geißel";
    AL["Blessed Regalia of Undead Cleansing"] = "Gesegneter Orant der Untotenbekämpfung";
    AL["Undead Slayer's Blessed Armor"] = "Gesegnete Rüstung des Untotenschlachtens";
    AL["Blessed Garb of the Undead Slayer"] = "Gesegnetes Gewand des Untotenschlächters";
    AL["Blessed Battlegear of Undead Slaying"] = "Gesegnete Kampfrüstung des Untotenschlachtens";
    AL["Prince Tenris Mirkblood"] = "Prinz Tenris Mirkblut";

    --ZG Sets
    AL["Haruspex's Garb"] = "Gewand des Haruspex";
    AL["Predator's Armor"] = "Rüstung des Raubtiers";
    AL["Illusionist's Attire"] = "Roben des Illusionisten";
    AL["Freethinker's Armor"] = "Rüstung des Freidenkers";
    AL["Confessor's Raiment"] = "Gewand des Glaubenshüters";
    AL["Madcap's Outfit"] = "Rüstzeug des Wildfangs";
    AL["Augur's Regalia"] = "Ornat des Weissagers";
    AL["Demoniac's Threads"] = "Roben des Besessenen";
    AL["Vindicator's Battlegear"] = "Schlachtrüstung des Vollstreckers";

    --AQ20 Sets
    AL["Symbols of Unending Life"] = "Symbole des endlosen Lebens";
    AL["Trappings of the Unseen Path"] = "Zierat des unsichtbaren Pfades";
    AL["Trappings of Vaulted Secrets"] = "Zierat der behüteten Geheimnisse";
    AL["Battlegear of Eternal Justice"] = "Schlachtrüstung der ewigen Gerechtigkeit";
    AL["Finery of Infinite Wisdom"] = "Pracht der unendlichen Weisheit";
    AL["Emblems of Veiled Shadows"] = "Embleme der Schattenschleier";
    AL["Gift of the Gathering Storm"] = "Gabe der aufziehenden Stürme";
    AL["Implements of Unspoken Names"] = "Ritualroben des ungesagten Namens";
    AL["Battlegear of Unyielding Strength"] = "Schlachtrüstung der unnachgiebigen Stärke";

    --AQ40 Sets
    AL["Genesis Raiment"] = "Gewandung der Genesis";
    AL["Striker's Garb"] = "Gewand des Hetzers";
    AL["Enigma Vestments"] = "Gewänder des Mysteriums";
    AL["Avenger's Battlegear"] = "Schlachtrüstung des Rächers";
    AL["Garments of the Oracle"] = "Gewänder des Orakels";
    AL["Deathdealer's Embrace"] = "Umarmung des Todesboten";
    AL["Stormcaller's Garb"] = "Gewand des Sturmrufers";
    AL["Doomcaller's Attire"] = "Roben des Verdammnisrufers";
    AL["Conqueror's Battlegear"] = "Schlachtrüstung des Eroberers";

    --Dungeon 1 Sets
    AL["Wildheart Raiment"] = "Herz der Wildnis";
    AL["Beaststalker Armor"] = "Rüstung des Bestienjägers";
    AL["Magister's Regalia"] = "Ornat des Magisters";
    AL["Lightforge Armor"] = "Esse des Lichts";
    AL["Vestments of the Devout"] = "Gewänder des Gläubigen";
    AL["Shadowcraft Armor"] = "Rüstung der Schattenkunst";
    AL["The Elements"] = "Die Elemente";
    AL["Dreadmist Raiment"] = "Nebel der Furcht";
    AL["Battlegear of Valor"] = "Schlachtrüstung der Ehre";

    --Dungeon 2 Sets
    AL["Feralheart Raiment"] = "Ungezähmtes Herz";
    AL["Beastmaster Armor"] = "Rüstung der Tierherrschaft";
    AL["Sorcerer's Regalia"] = "Ornat der Zauberkünste";
    AL["Soulforge Armor"] = "Rüstung der Seelenschmiede";
    AL["Vestments of the Virtuous"] = "Gewänder des Tugendhaften";
    AL["Darkmantle Armor"] = "Rüstung der Finsternis";
    AL["The Five Thunders"] = "Die fünf Donner";
    AL["Deathmist Raiment"] = "Roben des Todesnebels";
    AL["Battlegear of Heroism"] = "Schlachtrüstung des Heldentums";

    --Dungeon 3 Sets
    AL["Hallowed Raiment"] = "Geheiligte Roben";
    AL["Incanter's Regalia"] = "Ornat des Beschwörens";
    AL["Mana-Etched Regalia"] = "Managetränktes Ornat";
    AL["Oblivion Raiment"] = "Gewandung des Vergessens";
    AL["Assassination Armor"] = "Rüstung des Meuchelmords";
    AL["Moonglade Raiment"] = "Gewandung der Mondlichtung";
    AL["Wastewalker Armor"] = "Ödniswandlerrüstung";
    AL["Beast Lord Armor"] = "Rüstung des Wildtierfürsten";
    AL["Desolation Battlegear"] = "Schlachtrüstung der Verwüstung";
    AL["Tidefury Raiment"] = "Gewandung des Gezeitensturms";
    AL["Bold Armor"] = "Rüstung des Wagemutigen";
    AL["Doomplate Battlegear"] = "Verdammnisplattenrüstung";
    AL["Righteous Armor"] = "Rüstung des Rechtschaffenen";

    --Tier 1 Sets
    AL["Cenarion Raiment"] = "Gewänder des Cenarius";
    AL["Giantstalker Armor"] = "Rüstung des Riesenjägers";
    AL["Arcanist Regalia"] = "Ornat des Arkanisten";
    AL["Lawbringer Armor"] = "Rüstung der Gerechtigkeit";
    AL["Vestments of Prophecy"] = "Gewänder der Prophezeihung";
    AL["Nightslayer Armor"] = "Der Nachtmeuchler";
    AL["The Earthfury"] = "Die Wut der Erde";
    AL["Felheart Raiment"] = "Teufelsherzroben";
    AL["Battlegear of Might"] = "Schlachtrüstung der Macht";

    --Tier 2 Sets
    AL["Stormrage Raiment"] = "Sturmgrimms Gewänder";
    AL["Dragonstalker Armor"] = "Rüstung des Drachenjägers";
    AL["Netherwind Regalia"] = "Ornat des Netherwinds";
    AL["Judgement Armor"] = "Rüstung des Richturteils";
    AL["Vestments of Transcendence"] = "Gewänder der Erhabenheit";
    AL["Bloodfang Armor"] = "Blutfangrüstung";
    AL["The Ten Storms"] = "Die zehn Stürme";
    AL["Nemesis Raiment"] = "Roben der Nemesis";
    AL["Battlegear of Wrath"] = "Schlachtrüstung des Zorns";

    --Tier 3 Sets
    AL["Dreamwalker Raiment"] = "Gewandung des Traumwandlers";
    AL["Cryptstalker Armor"] = "Rüstung des Gruftpirschers";
    AL["Frostfire Regalia"] = "Frostfeuerornat";
    AL["Redemption Armor"] = "Rüstung der Erlösung";
    AL["Vestments of Faith"] = "Gewänder des Glaubens";
    AL["Bonescythe Armor"] = "Rüstung der Knochensense";
    AL["The Earthshatterer"] = "Der Erdspalter";
    AL["Plagueheart Raiment"] = "Roben des verseuchten Herzens";
    AL["Dreadnaught's Battlegear"] = "Schlachtrüstung des Schreckenspanzers";

    --Tier 4 Sets
    AL["Malorne Harness"] = "Malornes Harnisch";
    AL["Malorne Raiment"] = "Malornes Gewandung";
    AL["Malorne Regalia"] = "Malornes Ornat";
    AL["Demon Stalker Armor"] = "Rüstung des Dämonenwandlers";
    AL["Aldor Regalia"] = "Ornat der Aldor";
    AL["Justicar Armor"] = "Rüstung des Rechtsprechers";
    AL["Justicar Battlegear"] = "Schlachtrüstung des Rechtsprechers";
    AL["Justicar Raiment"] = "Gewandung des Rechtsprechers";
    AL["Incarnate Raiment"] = "Gewandung des Leibhaftigen";
    AL["Incarnate Regalia"] = "Ornat des Leibhaftigen";
    AL["Netherblade Set"] = "Netherklinge";
    AL["Cyclone Harness"] = "Harnisch des Orkans";
    AL["Cyclone Raiment"] = "Gewandung des Orkans";
    AL["Cyclone Regalia"] = "Ornat des Orkans";
    AL["Voidheart Raiment"] = "Gewandung des Herzens der Leere";
    AL["Warbringer Armor"] = "Rüstung des Kriegshetzers";
    AL["Warbringer Battlegear"] = "Schlachtrüstung des Kriegshetzers";

    --Tier 5 Sets
    AL["Nordrassil Harness"] = "Harnisch von Nordrassil";
    AL["Nordrassil Raiment"] = "Gewandung von Nordrassil";
    AL["Nordrassil Regalia"] = "Ornat von Nordrassil";
    AL["Rift Stalker Armor"] = "Rüstung des Dimensionswandlers";
    AL["Tirisfal Regalia"] = "Ornat von Tirisfal";
    AL["Crystalforge Armor"] = "Kristallgeschmiedete Rüstung";
    AL["Crystalforge Battlegear"] = "Kristallgeschmiedete Schlachtrüstung";
    AL["Crystalforge Raiment"] = "Kristallgeschmiedete Gewandung";
    AL["Avatar Raiment"] = "Gewandung des Avatars";
    AL["Avatar Regalia"] = "Ornat des Avatars";
    AL["Deathmantle Set"] = "Todeshauch";
    AL["Cataclysm Harness"] = "Harnisch der Verheerung";
    AL["Cataclysm Raiment"] = "Gewandung der Verheerung";
    AL["Cataclysm Regalia"] = "Ornat der Verheerung";
    AL["Corruptor Raiment"] = "Gewandung des Verderbers";
    AL["Destroyer Armor"] = "Rüstung des Zerstörers";
    AL["Destroyer Battlegear"] = "Schlachtrüstung des Zerstörers";

    --Tier 6 Sets
    AL["Thunderheart Harness"] = "Harnisch des Donnerherzens";
    AL["Thunderheart Raiment"] = "Gewandung des Donnerherzens";
    AL["Thunderheart Regalia"] = "Ornat des Donnerherzens";
    AL["Gronnstalker's Armor"] = "Rüstung des Gronnpirschers";
    AL["Tempest Regalia"] = "Ornat des Gewittersturms";
    AL["Lightbringer Armor"] = "Rüstung des Lichtbringers";
    AL["Lightbringer Battlegear"] = "Schlachtrüstung des Lichtbringers";
    AL["Lightbringer Raiment"] = "Gewandung des Lichtbringers";
    AL["Vestments of Absolution"] = "Ornat der Absolution";
    AL["Absolution Regalia"] = "Gewänder der Absolution";
    AL["Slayer's Armor"] = "Rüstung des Schlächters";
    AL["Skyshatter Harness"] = "Harnisch des Himmelsdonners";
    AL["Skyshatter Raiment"] = "Gewandung des Himmelsdonners";
    AL["Skyshatter Regalia"] = "Ornat des Himmelsdonners";
    AL["Malefic Raiment"] = "Gewandung der Boshaftigkeit";
    AL["Onslaught Armor"] = "Rüstung des Ansturms";
    AL["Onslaught Battlegear"] = "Schlachtrüstung des Ansturms";

    --Tier 7 Sets
    AL["Scourgeborne Battlegear"] = "Schlachtrüstung der Geißelerben";
    AL["Scourgeborne Plate"] = "Plattenrüstung der Geißelerben";
    AL["Dreamwalker Garb"] = "Gewandung des Traumwandlers";
    AL["Dreamwalker Battlegear"] = "Schlachtrüstung des Traumwandlers";
    AL["Dreamwalker Regalia"] = "Ornat des Traumwandlers";
    AL["Cryptstalker Battlegear"] = "Schlachtrüstung des Gruftpirschers";
    AL["Frostfire Garb"] = "Frostfeuergewand";
    AL["Redemption Regalia"] = "Ornat der Erlösung";
    AL["Redemption Battlegear"] = "Schlachtrüstung der Erlösung";
    AL["Redemption Plate"] = "Plattenrüstung der Erlösung";
    AL["Regalia of Faith"] = "Ornat des Glaubens";
    AL["Garb of Faith"] = "Gewand des Glaubens";
    AL["Bonescythe Battlegear"] = "Schlachtrüstung der Knochensense";
    AL["Earthshatter Garb"] = "Erdspaltergewand";
    AL["Earthshatter Battlegear"] = "Erdspalterschlachtrüstung";
    AL["Earthshatter Regalia"] = "Erdspalterornat";
    AL["Plagueheart Garb"] = "Gewand des verseuchten Herzens";
    AL["Dreadnaught Battlegear"] = "Schreckenspanzerschlachtrüstung";
    AL["Dreadnaught Plate"] = "Schreckenspanzerschlachtrüstung";

    --Arathi Basin Sets - Alliance
    AL["The Highlander's Intent"] = "Brennender Eifer des Highlanders";
    AL["The Highlander's Purpose"] = "Schicksalsmacht des Highlanders";
    AL["The Highlander's Will"] = "Feuriger Wille des Highlanders";
    AL["The Highlander's Determination"] = "Inbrunst des Highlanders";
    AL["The Highlander's Resolution"] = "Unbeugsamkeit des Highlanders";
    AL["The Highlander's Resolve"] = "Entschlossenheit des Highlanders";

    --Arathi Basin Sets - Horde
    AL["The Defiler's Intent"] = "Brennender Eifer der Entweihten";
    AL["The Defiler's Purpose"] = "Schicksalsmacht der Entweihten";
    AL["The Defiler's Will"] = "Feuriger Wille der Entweihten";
    AL["The Defiler's Determination"] = "Inbrunst der Entweihten";
    AL["The Defiler's Fortitude"] = "Seelenkraft der Entweihten";
    AL["The Defiler's Resolution"] = "Unbeugsamkeit der Entweihten";

    --PvP Level 60 Rare Sets - Alliance
    AL["Lieutenant Commander's Refuge"] = "Haingewand des Feldkommandanten";
    AL["Lieutenant Commander's Pursuance"] = "Jagdrüstung des Feldkommandanten";
    AL["Lieutenant Commander's Arcanum"] = "Arkanum des Feldkommandanten";
    AL["Lieutenant Commander's Redoubt"] = "Zeremonienrüstung des Feldkommandanten";
    AL["Lieutenant Commander's Investiture"] = "Würdengewand des Feldkommandanten";
    AL["Lieutenant Commander's Guard"] = "Gewänder des Feldkommandanten";
    AL["Lieutenant Commander's Stormcaller"] = "Sturmornat des Feldkommandanten";
    AL["Lieutenant Commander's Dreadgear"] = "Schreckensrüstung des Feldkommandanten";
    AL["Lieutenant Commander's Battlearmor"] = "Sturmrüstung des Feldkommandanten";

    --PvP Level 60 Rare Sets - Horde
    AL["Champion's Refuge"] = "Haingewand des Feldherren";
    AL["Champion's Pursuance"] = "Jagdrüstung des Feldherren";
    AL["Champion's Arcanum"] = "Arkanum des Feldherren";
    AL["Champion's Redoubt"] = "Zeremonierüstung des Feldherren";
    AL["Champion's Investiture"] = "Würdengewand des Feldherren";
    AL["Champion's Guard"] = "Gewänder des Feldherren";
    AL["Champion's Stormcaller"] = "Sturmornat des Feldherren";
    AL["Champion's Dreadgear"] = "Schreckensrüstung des Feldherren";
    AL["Champion's Battlearmor"] = "Sturmrüstung des Feldherren";

    --PvP Level 60 Epic Sets - Alliance
    AL["Field Marshal's Sanctuary"] = "Zierat des Feldmarschalls";
    AL["Field Marshal's Pursuit"] = "Lohn des Feldmarschalls";
    AL["Field Marshal's Regalia"] = "Ornat des Feldmarschalls";
    AL["Field Marshal's Aegis"] = "Aegis des Feldmarschalls";
    AL["Field Marshal's Raiment"] = "Gewandung des Feldmarschalls";
    AL["Field Marshal's Vestments"] = "Gewänder des Feldmarschalls";
    AL["Field Marshal's Earthshaker"] = "Erderschütterer des Feldmarschalls";
    AL["Field Marshal's Threads"] = "Roben des Feldmarschalls";
    AL["Field Marshal's Battlegear"] = "Schlachtrüstung des Feldmarschalls";

    --PvP Level 60 Epic Sets - Horde
    AL["Warlord's Sanctuary"] = "Zierat des Kriegsfürsten";
    AL["Warlord's Pursuit"] = "Lohn des des Kriegsfürsten";
    AL["Warlord's Regalia"] = "Ornat des Kriegsfürsten";
    AL["Warlord's Aegis"] = "Aegis des Kriegsfürsten";
    AL["Warlord's Raiment"] = "Gewandung des Kriegsfürsten";
    AL["Warlord's Vestments"] = "Gewänder des Kriegsfürsten";
    AL["Warlord's Earthshaker"] = "Erderschütterer des Kriegsfürsten";
    AL["Warlord's Threads"] = "Roben des Kriegsfürsten";
    AL["Warlord's Battlegear"] = "Schlachtrüstung des Kriegsfürsten";

    --Outland Faction Reputation PvP Sets
	AL["Dragonhide Battlegear"] = "Schlachtrüstung aus Drachenleder";
	AL["Wyrmhide Battlegear"] = "Schlachtrüstung aus Wyrmbalg";
	AL["Kodohide Battlegear"] = "Schlachtrüstung aus Kodobalg";
	AL["Stalker's Chain Battlegear"] = "Kettenschlachtrüstung des Pirschers";
	AL["Evoker's Silk Battlegear"] = "Seidene Schlachtrüstung des Beschwörers";
	AL["Crusader's Scaled Battledgear"] = "Schuppenschlachtrüstung des Kreuzfahrers";
	AL["Crusader's Ornamented Battledgear"] = "Zieratschlachtrüstung des Kreuzfahrers";
	AL["Satin Battlegear"] = "Schlachtrüstung aus Satin";
	AL["Mooncloth Battlegear"] = "Schlachtrüstung aus Mondstoff";
	AL["Opportunist's Battlegear"] = "Schlachtrüstung des Heuchlers";
	AL["Seer's Linked Battlegear"] = "Gekettelte Schlachtrüstung des Sehers";
	AL["Seer's Mail Battlegear"] = "Schwere Schlachtrüstung des Sehers";
	AL["Seer's Ringmail Battlegear"] = "Ringpanzerschlachtrüstung des Sehers";
	AL["Dreadweave Battlegear"] = "Schlachtrüstung aus Schreckenszwirn";
	AL["Savage's Plate Battlegear"] = "Wilde Plattenschlachtrüstung";

    --Arena Epic Sets
    AL["Gladiator's Sanctuary"] = "Schutzgewandung des Gladiators";
    AL["Gladiator's Wildhide"] = "Wildfell des Gladiators";
    AL["Gladiator's Refuge"] = "Zuflucht des Gladiators";
    AL["Gladiator's Pursuit"] = "Jagdtracht des Gladiators";
    AL["Gladiator's Regalia"] = "Ornat des Gladiators";
    AL["Gladiator's Aegis"] = "Aegis des Gladiators";
    AL["Gladiator's Vindication"] = "Rechtschaffenheit des Gladiators";
    AL["Gladiator's Redemption"] = "Erlösung des Gladiators";
    AL["Gladiator's Raiment"] = "Gewandung des Gladiators";
    AL["Gladiator's Investiture"] = "Vereidigung des Gladiators";
    AL["Gladiator's Vestments"] = "Gewänder des Gladiators";
    AL["Gladiator's Earthshaker"] = "Erderschütterer des Gladiators";
    AL["Gladiator's Thunderfist"] = "Donnerfaust des Gladiators";
    AL["Gladiator's Wartide"] = "Kriegsrausch des Gladiators";
    AL["Gladiator's Dreadgear"] = "Schreckensrüstung des Gladiators";
    AL["Gladiator's Felshroud"] = "Teufelsschleier des Gladiators";
    AL["Gladiator's Battlegear"] = "Schlachtrüstung des Gladiators";
    AL["Gladiator's Desecration"] = "Entweihung des Gladiators";

    --Set Labels
    AL["Set: Embrace of the Viper"] = "Set: Umarmung der Viper (5 Teile)";
    AL["Set: Defias Leather"] = "Set: Defiasleder (5 Teile)";
    AL["Set: The Gladiator"] = "Set: Der Gladiator (5 Teile)";
    AL["Set: Chain of the Scarlet Crusade"] = "Set: Kettenrüstung des Scharlachroten Kreuzzugs";
    AL["Set: The Postmaster"] = "Der Postmeister (5 Teile)";
    AL["Set: Necropile Raiment"] = "Set: Roben des Totenbeschwörers (5 Teile)";
    AL["Set: Cadaverous Garb"] = "Set: Leichenhaftes Gewand (5 Teile)";
    AL["Set: Bloodmail Regalia"] = "Set: Ornat des Blutpanzers (5 Teile)";
    AL["Set: Deathbone Guardian"] = "Set: Wächter der Totengebeine (5 Teile)";
    AL["Set: Dal'Rend's Arms"] = "Set: Dal'Rends Waffen (2 Teile)";
    AL["Set: Spider's Kiss"] = "Set: Kuss der Spinne (2 Teile)";
    AL["Temple of Ahn'Qiraj Sets"] = "Tempel von Ahn'Qiraj Sets";
    AL["AQ40 Class Sets"] = "AQ40-Klassen-Sets";
    AL["Ruins of Ahn'Qiraj Sets"] = "Ruinen von Ahn'Qiraj Sets";
    AL["AQ20 Class Sets"] = "AQ20-Klassen-Sets";
    AL["AQ Enchants"] = "AQ-Verzauberungen";
    AL["AQ Opening Quest Chain"] = "AQ-Öffnungsquestreihe";
	--    AL["Misc Sets"] = true;
	--    AL["Classic Sets"] = true;
	--    AL["Burning Crusade Sets"] = true;
	--    AL["Wrath Of The Lich King Sets"] = true;
	--    AL["Scholomance Sets"] = true;
    AL["Crafted Sets"] = "Sets (Berufe)";
    AL["Crafted Epic Weapons"] = "Geschmiedete epische Waffen";
    AL["Zul'Gurub Sets"] = "Zul'Gurub Sets";
    AL["ZG Class Sets"] = "ZG-Klassen-Sets";
    AL["ZG Enchants"] = "ZG-Verzauberungen";
	--    AL["Dungeon 1/2 Sets"] = true,
	--    AL["Dungeon Set 1"] = true,
	--    AL["Dungeon Set 2"] = true,
	--    AL["Dungeon 3 Sets"] = true,
	--    AL["Tier 1/2 Sets"] = true,
	--    AL["Tier 3 Sets"] = true,
	--	  AL["Tier 4/5/6 Sets"] = true;
    AL["PvP Reputation Sets (Level 70)"] = "PvP Ruf Sets (Level 70)";
    AL["PvP Rewards (Level 60)"] = "PvP-Belohnungen (Level 60)";
    AL["PvP Rewards (Level 70)"] = "PvP-Belohnungen (Level 70)";
    AL["PvP Rewards (Level 80)"] = "PvP-Belohnungen (Level 80)";
    AL["PvP Accessories (Level 60)"] = "PvP-Zubehör (Level 60)";
	--    AL["PvP Accessories - Alliance (Level 60)"] = true,
	--    AL["PvP Accessories - Horde (Level 60)"] = true,
    AL["PvP Accessories (Level 70)"] = "PvP-Zubehör (Level 70)";
    AL["PvP Rewards"] = "PvP";
    AL["PvP Armor Sets"] = "PvP-Rüstungssets";
    AL["PvP Weapons"] = "PvP-Waffen";
	--    AL["PvP Weapons (Level 60)"] = true,
	--    AL["PvP Weapons (Level 70)"] = true,
    AL["PvP Accessories"] = "PvP-Zubehör";
    AL["PvP Non-Set Epics"] = "PvP Nicht-Set Epics";
	--    AL["PvP Reputation Sets"] = true,
	--    AL["Arena PvP Sets"] = true,
    AL["Arena PvP Weapons"] = "Arena PvP Waffen";
    AL["Season 2"] = "2. Saison";
    AL["Season 3"] = "3. Saison";
    AL["Season 4"] = "4. Saison";
    AL["Arathi Basin Sets"] = "Arathibecken Sets";
    AL["Class Books"] = "Klassenbücher";
    AL["Tribute Run"] = "Tribut Run";
    AL["Dire Maul Books"] = "Düsterbruch Bücher";
    AL["Random Boss Loot"] = "Zufälliger Boss Loot";
    AL["Epic Set"] = "Episches Set";
    AL["Rare Set"] = "Seltenes Set";
    AL["Legendary Items"] = "Legendäre Items";
    AL["Badge of Justice Rewards"] = "Abzeichen der Gerechtigkeit";
    AL["Emblem of Valor Rewards"] = "Emblem der Ehre";
    AL["Emblem of Heroism Rewards"] = "Emblem des Heldentums";
    AL["Accessories"] = "Zubehör";
    AL["Fire Resistance Gear"] = "Feuerresistenz";
    AL["Arcane Resistance Gear"] = "Arkanresistenz";
    AL["Nature Resistance Gear"] = "Naturresistenz";
    AL["Frost Resistance Gear"] = "Frostresistenz";
    AL["Shadow Resistance Gear"] = "Schattenresistenz";
    AL["Rare Mounts"] = "Seltene Reittiere";
    AL["Tabards"] = "Wappenröcke";
    AL["Legendary Items for Kael'thas Fight"] = "Legendäre Items für Kael'thas Kampf";
    AL["BoE World Epics"] = "Epische Weltdrops (BoE)";
	--    AL["Level 30-39"] = true,
	--    AL["Level 40-49"] = true,
	--    AL["Level 50-60"] = true,
    AL["BT Patterns/Plans"] = "BT Muster/Pläne";
	AL["Ulduar Formula/Patterns/Plans"] = "Ulduar Formeln/Muster/Pläne";
    AL["Hyjal Summit Designs"] = "Berg Hyjal Designs";
    AL["SP Patterns/Plans"] = "SP Muster/Pläne";
    
	--Specs
	AL["Balance"] = "Gleichgewicht";
	AL["Feral"] = "Wilder Kampf";
	AL["Restoration"] = "Wiederherstellung";
	AL["Holy"] = "Heilig";
	AL["Protection"] = "Schutz";
	AL["Retribution"] = "Vergeltung";
	AL["Shadow"] = "Schatten";
	AL["Elemental"] = "Elementar";
	AL["Enhancement"] = "Verstärkung";
	AL["Fury"] = "Furor";
	AL["Demonology"] = "Dämonologie";
	AL["Destruction"] = "Zerstörung";
    --- AL["Tanking"] = true;
    --- AL["DPS"] = true;

    --NPCs missing from BabbleBoss
	--    AL["Trash Mobs"] = true,
    AL["Dungeon Set 2 Summonable"] = "Beschworener Boss (DS2)";
    AL["Highlord Kruul"] = "Hochlord Kruul";
	--    AL["Theldren"] = true,
    AL["Sothos and Jarien"] = "Sothos und Jarien";
    AL["Druid of the Fang"] = "Druiden des Giftzahns";
    AL["Defias Strip Miner"] = "Akkordminenarbeiter der Defias";
    AL["Defias Overseer/Taskmaster"] = "Vorarbeiter/Zuchtmeister der Defias";
    AL["Scarlet Defender/Myrmidon"] = "Scharlachroter Myrmidone/Verteidiger";
    AL["Scarlet Champion"] = "Scharlachroter Held";
    AL["Scarlet Centurion"] = "Scharlachroter Zenturio";
    AL["Scarlet Trainee"] = "Scharlachroter Lehrling";
	--    AL["Herod/Mograine"] = true,
    AL["Scarlet Protector/Guardsman"] = "Scharlachroter Beschützer/Gardist";
    AL["Shadowforge Flame Keeper"] = "Flammenbewahrer der Schattenschmiede";
	--    AL["Olaf"] = true,
    AL["Eric 'The Swift'"] = "Eric 'Der Flinke'";
    AL["Shadow of Doom"] = "Schatten der Verdammnis";
    AL["Bone Witch"] = "Knochenhexe";
    AL["Lumbering Horror"] = "Schwerfälliger Horror";
    AL["Avatar of the Martyred"] = "Avatar des Gemarterten";
	--    AL["Yor"] = true,
    AL["Nexus Stalker"] = "Nexuswandler";
    AL["Auchenai Monk"] = "Mönch der Auchenai";
    AL["Cabal Fanatic"] = "Fanatiker der Kabale";
    AL["Unchained Doombringer"] = "Entfesselter Verdammnisbringer";
    AL["Crimson Sorcerer"] = "Purpurroter Zauberhexer";
    AL["Thuzadin Shadowcaster"] = "Thuzadinschattenzauberer";
    AL["Crimson Inquisitor"] = "Purpurroter Inquisitor";
    AL["Crimson Battle Mage"] = "Purpurroter Kampfmagier";
    AL["Ghoul Ravener"] = "Tobsüchtiger Ghul";
    AL["Spectral Citizen"] = "Spektraler Bürger";
    AL["Spectral Researcher"] = "Spektraler Forscher";
    AL["Scholomance Adept"] = "Adept aus Scholomance";
    AL["Scholomance Dark Summoner"] = "Dunkler Beschwörer aus Scholomance";
    AL["Blackhand Elite"] = "Elitesoldat der Schwarzfaustlegion";
    AL["Blackhand Assassin"] = "Auftragsmörder der Schwarzfaustlegion";
    AL["Firebrand Pyromancer"] = "Pyromant der Feuerbrand";
    AL["Firebrand Invoker"] = "Herbeirufer der Feuerbrand";
    AL["Firebrand Grunt"] = "Grunzer der Feuerbrand";
    AL["Firebrand Legionnaire"] = "Legionär der Feuerbrand";
    AL["Spirestone Warlord"] = "Kriegsherr der Felsspitzoger";
    AL["Spirestone Mystic"] = "Mystiker der Felsspitzoger";
    AL["Anvilrage Captain"] = "Hauptmann der Zorneshämmer";
    AL["Anvilrage Marshal"] = "Marschall der Zorneshämmer";
    AL["Doomforge Arcanasmith"] = "Schicksalsträchtiger Arkanaschmied";
    AL["Weapon Technician"] = "Waffentechniker";
    AL["Doomforge Craftsman"] = "Schicksalsträchtiger Handwerker";
    AL["Murk Worm"] = "Düsterwurm";
    AL["Atal'ai Witch Doctor"] = "Hexendoktor der Atal'ai";
    AL["Raging Skeleton"] = "Tobendes Skelett";
    AL["Ethereal Priest"] = "Astraler Priester";
    AL["Sethekk Ravenguard"] = "Rabenwächter der Sethekk";
    AL["Time-Lost Shadowmage"] = "Zeitverlorener Schattenmagier";
    AL["Coilfang Sorceress"] = "Zauberhexerin des Echsenkessels";
    AL["Coilfang Oracle"] = "Orakel des Echsenkessels";
    AL["Shattered Hand Centurion"] = "Zenturio der Zerschmetterten Hand";
    AL["Eredar Deathbringer"] = "Todesbringer der Eredar";
    AL["Arcatraz Sentinel"] = "Schildwache der Arkatraz";
    AL["Gargantuan Abyssal"] = "Riesengroßer Abyss";
    AL["Sunseeker Botanist"] = "Botaniker der Sonnensucher";
    AL["Sunseeker Astromage"] = "Astromagier der Sonnensucher";
    AL["Durnholde Rifleman"] = "Scharfschütze von Durnholde";
    AL["Rift Keeper/Rift Lord"] = "Bewahrerin/Fürst der Zeitenrisse";
    AL["Crimson Templar"] = "Purpurroter Templer";
    AL["Azure Templar"] = "Azurblauer Templer";
    AL["Hoary Templar"] = "Weißgrauer Templer";
    AL["Earthen Templar"] = "Irdener Templer";
    AL["The Duke of Cynders"] = "Der Fürst der Asche";
    AL["The Duke of Fathoms"] = "Der Fürst der Tiefen";
    AL["The Duke of Zephyrs"] = "Der Fürst der Stürme";
    AL["The Duke of Shards"] = "Der Fürst der Splitter";
    AL["Aether-tech Assistant"] = "Äthertechnikerassistent";
    AL["Aether-tech Adept"] = "Äthertechnikeradept";
    AL["Aether-tech Master"] = "Meisteräthertechniker";
	--    AL["Trelopades"] = true,
    AL["King Dorfbruiser"] = "König Dorfelberster";
    AL["Gorgolon the All-seeing"] = "Gorgolon der Allessehende";
	--    AL["Matron Li-sahar"] = true,
    AL["Solus the Eternal"] = "Solus der Ewige";
	--    AL["Balzaphon"] = true,
    AL["Lord Blackwood"] = "Fürst Schwarzstahl";
	--    AL["Revanchion"] = true,
    AL["Scorn"] = "Der Verächter";
    AL["Sever"] = "Häcksler";
	--    AL["Lady Falther'ess"] = true,
    AL["Smokywood Pastures Vendor"] = "Kokelwälder Händler";
	--    AL["Shartuul"] = true,
    AL["Darkscreecher Akkarai"] = "Dunkelkreischer Akkarai";
	--    AL["Karrog"] = true,
    AL["Gezzarak the Huntress"] = "Gezzarak die Jägerin";
    AL["Vakkiz the Windrager"] = "Vakkiz der Windzürner";
	--    AL["Terokk"] = true,
    AL["Armbreaker Huffaz"] = "Armbrecher Huffaz";
    AL["Fel Tinkerer Zortan"] = "Teufelstüftler Zortan";
	--    AL["Forgosh"] = true,
	--    AL["Gul'bor"] = true,
    AL["Malevus the Mad"] = "Malevus die Verrückte";
    AL["Porfus the Gem Gorger"] = "Porfus der Edelsteinschlinger";
    AL["Wrathbringer Laz-tarash"] = "Zornschaffer Laz-tarash";
    AL["Bash'ir Landing Stasis Chambers"] = "Stasiskammer des Landeplatz von Bash'ir";
    AL["Templars"] = "Templer";
    AL["Dukes"] = "Fürsten";
	--    AL["High Council"] = true,
    AL["Headless Horseman"] = "Kopfloser Reiter";
    AL["Barleybrew Brewery"] = "Gerstenbräu";
    AL["Thunderbrew Brewery"] = "Donnerbräu";
    AL["Gordok Brewery"] = "Gordokbrauerei";
    AL["Drohn's Distillery"] = "Brauerei Drohn";
    AL["T'chali's Voodoo Brewery"] = "T'chalis Voodoobrauerei";
    AL["Scarshield Quartermaster"] = "Rüstmeister der Schmetterschilde";
    AL["Overmaster Pyron"] = "Übermeister Pyron";
    AL["Father Flame"] = "Vater Flamme";
    AL["Thomas Yance"] = "Thomas Yance";
    AL["Knot Thimblejack"] = "Knot Zwingschraub";
    AL["Shen'dralar Provisioner"] = "Versorger der Shen'dralar";
    AL["Namdo Bizzfizzle"] = "Namdo Blitzzischel";
    AL["The Nameles Prophet"] = "The Nameles Prophet";
    AL["Zelemar the Wrathful"] = "Zelemar the Wrathful";
    AL["Henry Stern"] = "Henry Stern";
    AL["Aggem Thorncurse"] = "Aggem Dornfluch";
    AL["Roogug"] = "Roogug";
    AL["Rajaxx's Captains"] = "Rajaxx's Captains";
	AL["Razorfen Spearhide"] = "Speerträger der Klingenhauer";
	AL["Rethilgore"] = "Rotkralle";
    AL["Kalldan Felmoon"] = "Kalldan Teufelsmond";
	AL["Magregan Deepshadow"] = "Magregan Grubenschatten";
	AL["Lord Ahune"] = "Fürst Ahune";
	AL["Coren Direbrew"] = "Coren Düsterbräu";
    --  AL["Don Carlos"] = true,
    AL["Shattered Hand Executioner"] = "Henker der Zerschmetterten Hand";

    --Zones
    AL["World Drop"] = "Weltdrops";
	
	--Shortcuts for Bossname files
	--  AL["LBRS"] = true,
	--  AL["UBRS"] = true,
    AL["CoT1"] = "HdZ1";
    AL["CoT2"] = "HdZ2";
    --  AL["Scholo"] = true,
    --  AL["Strat"] = true,
    AL["Serpentshrine"] = "Schlangenschrein";

    --Chests, etc
    AL["Dark Coffer"] = "Dunkler Kasten";
    AL["The Secret Safe"] = "Geheimsafe";
    AL["The Vault"] = "Der Tresor";
    AL["Ogre Tannin Basket"] = "Gerbekorb der Oger";
    AL["Fengus's Chest"] = "Fengus Truhe";
    AL["The Prince's Chest"] = "Die Truhe des Prinzen";
    AL["Doan's Strongbox"] = "Doans Geldkassette";
    AL["Frostwhisper's Embalming Fluid"] = "Frostraunens Balsamierungsflüssigkeit";
    AL["Unforged Rune Covered Breastplate"] = "Ungeschmiedete runenverzierte Brustplatte";
    AL["Malor's Strongbox"] = "Malors Geldkassette";
    AL["Unfinished Painting"] = "Unvollendetes Gemälde";
    AL["Felvine Shard"] = "Teufelsrankensplitter";
    AL["Baelog's Chest"] = "Baelogs Truhe";
    AL["Lorgalis Manuscript"] = "Manuskript von Lorgalis";
    AL["Fathom Core"] = "Tiefenkern";
    AL["Conspicuous Urn"] = "Verdächtige Urne";
    AL["Gift of Adoration"] = "Geschenke der Verehrung";
    AL["Box of Chocolates"] = "Schokoladenschachtel";
    AL["Treat Bag"] = "Schlotterbeutel";
    AL["Gaily Wrapped Present"] = "Fröhlich verpacktes Geschenk";
    AL["Festive Gift"] = "Festtagsgeschenk";
    AL["Ticking Present"] = "Tickendes Geschenk";
    AL["Gently Shaken Gift"] = "Leicht geschütteltes Geschenk";
    AL["Carefully Wrapped Present"] = "Sorgfältig verpacktes Geschenk";
    AL["Winter Veil Gift"] = "Winterhauchgeschenk";
    AL["Smokywood Pastures Extra-Special Gift"] = "Kokelwälder Extraspezialgeschenk";
    AL["Brightly Colored Egg"] = "Osterei";
    AL["Lunar Festival Fireworks Pack"] = "Feuerwerkspaket des Mondfests";
    AL["Lucky Red Envelope"] = "Roter Glücksumschlag";
    AL["Small Rocket Recipes"] = "Rezepte für kleine Raketen";
    AL["Large Rocket Recipes"] = "Rezepte für große Raketen";
    AL["Cluster Rocket Recipes"] = "Rezepte für Raketenbündel";
    AL["Large Cluster Rocket Recipes"] = "Rezepte für große Raketenbündel";
	--    AL["Timed Reward Chest"] = true,
	--    AL["Timed Reward Chest 1"] = true,
	--    AL["Timed Reward Chest 2"] = true,
	--    AL["Timed Reward Chest 3"] = true,
	--    AL["Timed Reward Chest 4"] = true,
    AL["The Talon King's Coffer"] = "Der Kasten des Klauenkönigs";
    AL["Krom Stoutarm's Chest"] = "Krom Starkarms Truhe";
	AL["Garrett Family Chest"] = "Familientruhe der Garretts";
    AL["The Saga of Terokk"] = "Die Sage von Terokk";
    AL["First Fragment Guardian"] = "Wächter des ersten Teils";
    AL["Second Fragment Guardian"] = "Wächter des zweiten Teils";
    AL["Third Fragment Guardian"] = "Wächter des dritten Teils";
    AL["Overcharged Manacell"] = "Überladene Manazelle";
	AL["Mysterious Egg"] = "Mysteriöses Ei";
	AL["Hyldnir Spoils"] = "Hyldnirbeute";
	AL["Ripe Disgusting Jar"] = "Reife eklige Flasche";
	AL["Cracked Egg"] = "Zerbrochene Eierschale";

    --World Events
    AL["Abyssal Council"] = "Abyssischer Rat";
    AL["Bash'ir Landing Skyguard Raid"] = "Landeplatz von Bash'ir Himmelswache Raid";
	AL["Brewfest"] = "Braufest";
    AL["Children's Week"] = "Kinderwoche";
    AL["Elemental Invasion"] = "Invasion der Elementare";
    AL["Ethereum Prison"] = "Gefängnis des Astraleums";
    AL["Feast of Winter Veil"] = "Winterhauchfest";
    AL["Gurubashi Arena Booty Run"] = "Gurubashiarena";
    AL["Hallow's End"] = "Schlotternächte";
    AL["Harvest Festival"] = "Erntedankfest";
    AL["Love is in the Air"] = "Herzklopfen";
    AL["Lunar Festival"] = "Mondfest";
    AL["Midsummer Fire Festival"] = "Sonnenwendfest";
    AL["Noblegarden"] = "Nobelgarten";
	--    AL["Skettis"] = true,
    AL["Stranglethorn Fishing Extravaganza"] = "Anglerwettbewerb im Schlingendorntal";
	
	-- Filter
	--AL["Filter"] = true;
    --AL["Select All Loot"] = true;
	AL["Armor:"] = "Rüstung:";
	AL["Melee weapons:"] = "Nahkampfwaffen:";
	AL["Ranged weapons:"] = "Distanzwaffen:";
	AL["Relics:"] = "Relikte:";
	AL["Other:"] = "Sonstiges:";
	
	-- Wishlist
	AL["Close"] = "Schließen";
    AL["Wishlist"] = "Wunschzettel";
	AL["Delete"] = "Löschen";
	AL["Edit"] = "Bearbeiten";
	AL["Show all Wishlists"] = "Zeige alle Wunschzettel";
	AL["Show own Wishlists"] = "Zeige eigene Wunschzettel";
	
end
