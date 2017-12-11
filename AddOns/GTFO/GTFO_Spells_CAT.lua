--------------------------------------------------------------------------
-- GTFO_Spells_CAT.lua 
--------------------------------------------------------------------------
--[[
GTFO Spell List - Cataclysm (New areas)
Author: Zensunim of Malygos

Change Log:
	v2.3
		- Added Core Puppy's Lava Drool
		- Added Zin'jatar Pearlbender's Foul Waters
		- Added Naz'jar Sentinel's Noxious Mire
		- Added Commander Ulthok's Dark Fissure (Residual)
		- Added Facelace Watcher's Ground Pound
		- Added Erunak Stonespeaker's Earth Shards
		- Added Mindbender Ghur'sha's Mind Fog
		- Added Blight Beast's Aura of Dread
		- Added Ozumat's Blight of Ozumat
	v2.4
		- Added Corborus's Crystal Barrage
		- Added Stonecore Berserker's Spinning Slash
		- Added Stonecore Flayer's Flay
		- Added Slabhide's Lava Pool
		- Added High Priestess Azil's Gravity Well
	v2.5
		- Split spell files into sections
		- Added Twilight Flame Caller's Fire Strike 
		- Added Core Puppy's Little Big Flame Breath
		- Added Twilight Element Warden's Frostbomb
		- Added Asaad's Supremacy of the Storm
		- Added Armored Mistral's Whirlwind
		- Added Cloud Prince's Starfall
		- Added Turbulent Squall's Hurricane
		- Added Titanic Guardian's Burning Gaze
	v2.5.1
		- Added Twilight Drake's Twilight Flames
		- Added Forgemaster Throngus's Cave In
		- Added Ascended Rockbreaker's Fissure
		- Added Erudax's Shadow Gale
	v2.5.2
		- Added Temple Guardian Anhuur's Burning Light
		- Added Fire Warden's Raging Inferno
		- Added Anraphet's Alpha Beams
		- Added Earthrager Ptah's Quicksand
		- Added Isisit's Energy Flux
		- Added Budding Spores' Noxious Spores
		- Added Setesh's Chaos Burn
		- Added Setesh's Reign of Chaos
		- Added Core Puppy's Lava Drool (Heroic)
		- Added Naz'jar Sentinel's Noxious Mire (Heroic)
		- Added Commander Ulthok's Dark Fissure (Residual, Heroic)
		- Added Facelace Watcher's Ground Pound (Heroic)
		- Added Erunak Stonespeaker's Earth Shards (Heroic)
		- Added Ozumat's Blight of Ozumat (Heroic)
		- Added Corborus's Crystal Barrage (Heroic)
		- Added Stonecore Berserker's Spinning Slash (Heroic)
		- Added Slabhide's Lava Pool (Heroic)
		- Added Twilight Flame Caller's Fire Strike (Heroic)
		- Added Core Puppy's Little Big Flame Breath (Heroic)
		- Added Twilight Element Warden's Frostbomb (Heroic)
		- Updated Armored Mistral's Storm Surge
		- Added Asaad's Supremacy of the Storm (Heroic)
		- Added Cloud Prince's Starfall (Heroic)
		- Added Turbulent Squall's Hurricane (Heroic)
		- Added Twilight Drake's Twilight Flames (Heroic)
		- Added Forgemaster Throngus's Cave In (Heroic)
		- Added Ascended Rockbreaker's Fissure (Heroic)
		- Added Erudax's Shadow Gale (Heroic)
		- Added Oathsworn Captain's Earthquake
		- Added High Prophet Barim's Heaven's Fury
		- Added High Prophet Barim's Hallowed Ground
	v2.5.3
		- Added Drahga Shadowburner's Seeping Twilight
		- Updated Setesh's Chaos Burn
		- Added Vanessa VanCleef's Spark
		- Added Captain Cookie's Rotten Aura (Heroic)
		- Added Foe Reaper 5000's Overdrive (Heroic)
		- Added Glubtok's Fire Wall (Heroic)
		- Added Commander Springvale's Desecration (Heroic)
		- Added Commander Springvale's Shield of the Perfidious (Heroic)
		- Added Grand Vizier Ertan's Storm's Edge
	v3.0.1
		- Updated Foe Reaper 5000's Overdrive (Heroic)
		- Added Defias Shadowguard's Whirling Blades (Heroic)
		- Added Nightmare Flames (Heroic)
		- Added Molten Slag's Molten Shield (Heroic)
	v3.0.2
		- Added Argaloth's Fel Flames
		- Added Valiona's Devouring Flames
		- Added Theralion's Fabulous Flames
		- Added Theralion's Engulfing Magic (Friendly Fire)
		- Added Theralion's Twilight Flames (Residual)
		- Added Ignacious's Flame Torrent
		- Added Ignacious's Inferno Rush
		- Added Elementium Monstrosity's Liquid Ice	
	v3.1
		- Updated Theralion's Engulfing Magic (Friendly Fire)
		- Added Electron's Lightning Conductor
		- Added Toxitron's Poison Cloud
		- Added Toxitron's Poison Puddle
		- Added Maloriak's Biting Chill
		- Added Maloriak's Magma Jets
		- Added Atramedes's Sonar Pulse
		- Added Atramedes's Roaring Flame Breath
		- Added Atramedes's Roaring Flame 
		- Added Atramedes's Roaring Flame - DoT
		- Added Atramedes's Sonic Breath
		- Added Nezir's Ice Patch
		- Added Nezir's Permafrost
		- Added Anshal's Soothing Breeze
		- Added Al'Akir's Ice Storm
		- Added Al'Akir's Stormling
		- Added Al'Akir's Lightning Rod
		- Added Shadowy Attendant's Shadow Vortex
		- Added Fetid Ghoul's Fetid Cloud
		- Added Lord Godfrey's Pistol Barrage
		- Added Lord Walden's Ice Shards
		- Added Lord Walden's Toxic Coagulant
	v3.2.5
		- Updated Cloud Prince's Starfall
		- Updated Corborus's Crystal Barrage
		- Added Ick'thys the Unfathomable's Consumption
	v3.2.6
		- Added Cadaver Collage's Poison
		- Added Emberscar the Devourer's Lava Pool
		- Added Siamat's Tempest Storm
		- Added Obsidian Colossus's Focused Laser
		- Removed Armored Mistral's Storm Surge
		- Added Aeosera's Searing Breath
		- Added Darkwood Broodmother's Venom Splash
		- Added Augh's Whirlwind
		- Added Lockjaw's Dust Flail
		- Added High Prophet Barim's Blaze of the Heavens (Heroic)
		- Added Baron Geddon's Inferno
	v3.2.7
		- Added Temple Guardian Anhuur's Burning Light (Heroic)
		- Added Void Lord's Void Infusion (Heroic)
		- Added Rajh's Solar Fire (Heroic)
		- Added Corla's Evolution
		- Added Karsh Steelbender's Lava Pool (Heroic)
		- Added Slabhide's Crystal Storm (Heroic)
		- Added Forgemaster Throngus's Flaming Shield (Heroic)
		- Added Forgemaster Throngus's Lava Patch (Heroic)
		- Added Twilight Enforcer's Meat Grinder (Heroic)
	v3.3
		- Added Forgemaster Throngus's Cave In (Heroic)
		- Added Vermillion Sentinel's Vermillion Strafe
		- Added Forgotten Ghoul's Corpse Rot
		- Added Vanessa VanCleef's Fiery Blaze (Heroic)
		- Added Setesh's Reign of Chaos
		- Added Unyielding Behemoth's Blight Spray
		- Updated Al'Akir's Ice Storm
		- Added Al'Akir's Lightning Clouds
	v3.3.1
		- Added Nefarian's Magma
		- Updated Commander Springvale's Shield of the Perfidious (Heroic)
		- Added Golem Sentry's Laser Strike
		- Added Toxitron's Chemical Cloud
	v3.3.2
		- Added Drakonid Drudge's Whirlwind
		- Added Twilight Soul Blade's Dark Pool
		- Added Twilight Brute's Whirling Blades
		- Added Crimsonborne Firestarter's Burning Twilight		
		- Added Earth Ravager's Tremors
	v3.4
		- Updated Toxitron's Chemical Cloud
		- Added Ivoroc/Maimgor/Pyrecraw's Shadowflame
		- Added Pyrecraw's Flame Breath
		- Added Spirit of Burningeye's Whirlwind
		- Updated Atramedes's Sonar Pulse (Normal)
	v3.4.2
		- Removed Theralion's Twilight Flames (Residual)
		
]]--

GTFO.SpellID["76628"] = {
	--desc = "Lava Drool (Blackrock Caverns)";
	sound = 1;
};

GTFO.SpellID["93666"] = {
	--desc = "Lava Drool (Blackrock Caverns, Heroic)";
	sound = 1;
};

GTFO.SpellID["79411"] = {
	--desc = "Foul Waters (Vashj'ir)";
	sound = 2;
};

GTFO.SpellID["76776"] = {
	--desc = "Noxious Mire (Throne of the Tides)";
	sound = 1;
};

GTFO.SpellID["91446"] = {
	--desc = "Noxious Mire (Throne of the Tides, Heroic)";
	sound = 1;
};

GTFO.SpellID["76085"] = {
	--desc = "Dark Fissure (Residual, Throne of the Tides)";
	sound = 1;
};

GTFO.SpellID["91375"] = {
	--desc = "Dark Fissure (Residual, Throne of the Tides Heroic)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["76593"] = {
	--desc = "Ground Pound (Throne of the Tides)";
	sound = 1;
};

GTFO.SpellID["91468"] = {
	--desc = "Ground Pound (Throne of the Tides, Heroic)";
	sound = 1;
};

GTFO.SpellID["84945"] = {
	--desc = "Earth Shards (Throne of the Tides)";
	sound = 1;
};

GTFO.SpellID["91491"] = {
	--desc = "Earth Shards (Throne of the Tides, Heroic)";
	sound = 1;
};

GTFO.SpellID["76230"] = {
	--desc = "Mind Fog (Throne of the Tides)";
	sound = 1;
};

GTFO.SpellID["83971"] = {
	--desc = "Aura of Dread (Throne of the Tides)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["83561"] = {
	--desc = "Blight of Ozumat (Throne of the Tides)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["91495"] = {
	--desc = "Blight of Ozumat (Throne of the Tides, Heroic)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["86881"] = {
	--desc = "Crystal Barrage (Stonecore)";
	sound = 1;
	tankSound = 2;
};

GTFO.SpellID["92648"] = {
	--desc = "Crystal Barrage (Stonecore, Heroic)";
	sound = 1;
};

GTFO.SpellID["81569"] = {
	--desc = "Spinning Slash (Stonecore)";
	tankSound = 2;
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["92623"] = {
	--desc = "Spinning Slash (Stonecore, Heroic)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["79923"] = {
	--desc = "Flay (Stonecore)";
	tankSound = 0;
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["80801"] = {
	--desc = "Lava Pool (Stonecore)";
	sound = 1;
};

GTFO.SpellID["92658"] = {
	--desc = "Lava Pool (Stonecore, Heroic)";
	sound = 1;
};

GTFO.SpellID["79249"] = {
	--desc = "Gravity Well (Stonecore)";
	sound = 1;
};

GTFO.SpellID["76328"] = {
	--desc = "Fire Strike (Blackrock Caverns)";
	tankSound = 2;
	sound = 1;
};

GTFO.SpellID["93646"] = {
	--desc = "Fire Strike (Blackrock Caverns, Heroic)";
	sound = 1;
};

GTFO.SpellID["76665"] = {
	--desc = "Little Big Flame Breath (Blackrock Caverns)";
	tankSound = 0;
	sound = 1;
};

GTFO.SpellID["93667"] = {
	--desc = "Little Big Flame Breath (Blackrock Caverns, Heroic)";
	tankSound = 0;
	sound = 1;
};

GTFO.SpellID["76682"] = {
	--desc = "Frostbomb (Blackrock Caverns)";
	sound = 2;
};

GTFO.SpellID["93651"] = {
	--desc = "Frostbomb (Blackrock Caverns, Heroic)";
	sound = 2;
};

GTFO.SpellID["87553"] = {
	--desc = "Supremacy of the Storm (Asaad, Vortex Pinnacle)";
	sound = 1;
};

GTFO.SpellID["93994"] = {
	--desc = "Supremacy of the Storm (Asaad, Vortex Pinnacle Heroic)";
	sound = 1;
};

GTFO.SpellID["88073"] = {
	--desc = "Starfall (Cloud Prince, Vortex Pinnacle)";
	sound = 2;
};

GTFO.SpellID["92783"] = {
	--desc = "Starfall (Cloud Prince, Vortex Pinnacle Heroic)";
	sound = 2;
};

GTFO.SpellID["88171"] = {
	--desc = "Hurricane (Turbulent Squall, Vortex Pinnacle)";
	sound = 2;
};

GTFO.SpellID["92773"] = {
	--desc = "Hurricane (Turbulent Squall, Vortex Pinnacle Heroic)";
	sound = 2;
};

GTFO.SpellID["87660"] = {
	--desc = "Burning Gaze (Titanic Guardian, Uldum)";
	sound = 1;
};

GTFO.SpellID["75939"] = {
	--desc = "Twilight Flames (Twilight Drake, Grim Batol)";
	sound = 1;
};

GTFO.SpellID["90876"] = {
	--desc = "Twilight Flames (Twilight Drake, Grim Batol Heroic)";
	sound = 1;
};

GTFO.SpellID["74986"] = {
	--desc = "Cave In (Forgemaster Throngus, Grim Batol)";
	sound = 1;
};

GTFO.SpellID["90722"] = {
	--desc = "Cave In (Forgemaster Throngus, Grim Batol Heroic)";
	sound = 1;
};

GTFO.SpellID["76786"] = {
	--desc = "Fissure (Ascended Rockbreaker, Grim Batol)";
	sound = 1;
};

GTFO.SpellID["90863"] = {
	--desc = "Fissure (Ascended Rockbreaker, Grim Batol Heroic)";
	sound = 1;
};

GTFO.SpellID["75692"] = {
	--desc = "Shadow Gale (Erudax, Grim Batol)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["91087"] = {
	--desc = "Shadow Gale (Erudax, Grim Batol)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["75117"] = {
	--desc = "Burning Light (Temple Guardian Anhuur, Halls of Origination)";
	sound = 1;
};

GTFO.SpellID["94951"] = {
	--desc = "Burning Light (Temple Guardian Anhuur, Halls of Origination Heroic)";
	sound = 1;
};

GTFO.SpellID["77262"] = {
	--desc = "Raging Inferno (Fire Warden, Halls of Origination)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["91159"] = {
	--desc = "Raging Inferno (Fire Warden, Halls of Origination Heroic)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["76956"] = {
	--desc = "Alpha Beams (Anraphet, Halls of Origination)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["91177"] = {
	--desc = "Alpha Beams (Anraphet, Halls of Origination Heroic)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["75547"] = {
	--desc = "Quicksand (Earthrager Ptah, Halls of Origination)";
	sound = 1;
};

GTFO.SpellID["89880"] = {
	--desc = "Quicksand (Earthrager Ptah, Halls of Origination Heroic)";
	sound = 1;
};

GTFO.SpellID["74045"] = {
	--desc = "Energy Flux (Isisit, Halls of Origination)";
	sound = 1;
};

GTFO.SpellID["89861"] = {
	--desc = "Energy Flux (Isisit, Halls of Origination Heroic)";
	sound = 1;
};

GTFO.SpellID["75702"] = {
	--desc = "Noxious Spores (Budding Spore, Halls of Origination)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["89889"] = {
	--desc = "Noxious Spores (Budding Spore, Halls of Origination Heroic)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["76684"] = {
	--desc = "Chaos Burn (Setesh, Halls of Origination)";
	sound = 1;
};

GTFO.SpellID["89874"] = {
	--desc = "Chaos Burn (Setesh, Halls of Origination Heroic)";
	sound = 1;
};

GTFO.SpellID["77030"] = {
	--desc = "Reign of Chaos (Setesh, Halls of Origination)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["89872"] = {
	--desc = "Reign of Chaos (Setesh, Halls of Origination Heroic)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["84251"] = {
	--desc = "Earthquake (Oathsworn Captain, Lost City)";
	sound = 1;
};

GTFO.SpellID["90017"] = {
	--desc = "Earthquake (Oathsworn Captain, Lost City Heroic)";
	sound = 1;
};

GTFO.SpellID["81942"] = {
	--desc = "Heaven's Fury (High Prophet Barim, Lost City)";
	sound = 1;
};

GTFO.SpellID["90040"] = {
	--desc = "Heaven's Fury (High Prophet Barim, Lost City Heroic)";
	sound = 1;
};

GTFO.SpellID["88814"] = {
	--desc = "Hallowed Ground (High Prophet Barim, Lost City)";
	sound = 1;
};

GTFO.SpellID["90010"] = {
	--desc = "Hallowed Ground (High Prophet Barim, Lost City)";
	sound = 1;
};

GTFO.SpellID["75317"] = {
	--desc = "Seeping Twilight (Drahga Shadowburner, Grim Batol)";
	sound = 1;
};

GTFO.SpellID["90964"] = {
	--desc = "Seeping Twilight (Drahga Shadowburner, Grim Batol Heroic)";
	sound = 1;
};

GTFO.SpellID["92278"] = {
	--desc = "Spark (Vanessa VanCleef, Deadmines Heroic)";
	sound = 1;
};

GTFO.SpellID["92065"] = {
	--desc = "Rotten Aura (Captain Cookie, Deadmines Heroic)";
	sound = 1;
};

GTFO.SpellID["91716"] = {
	--desc = "Overdrive (Foe Reaper 5000, Deadmines Heroic)";
	sound = 1;
	vehicle = true;
};

GTFO.SpellID["91397"] = {
	--desc = "Fire Wall (Glubtok, Deadmines Heroic)";
	sound = 1;
};

GTFO.SpellID["94370"] = {
	--desc = "Desecration (Commander Springvale, Shadowfang Keep Heroic)";
	sound = 1;
};

GTFO.SpellID["93737"] = {
	--desc = "Shield of the Perfidious (Commander Springvale, Shadowfang Keep Heroic)";
	tankSound = 2;
	sound = 1;
};

GTFO.SpellID["90963"] = {
	--desc = "Whirling Blades (Defias Shadowguard, Deadmines Heroic)";
	sound = 2;
};

GTFO.SpellID["92171"] = {
	--desc = "Nightmare Flames (Vanessa VanCleef, Deadmines Heroic)";
	sound = 1;
};

GTFO.SpellID["91819"] = {
	--desc = "Molten Shield (Molten Slag, Deadmines Heroic)";
	sound = 1;
};

GTFO.SpellID["89000"] = {
	--desc = "Fel Flames (Argaloth, Baradin Hold 10)";
	sound = 1;
};

GTFO.SpellID["95177"] = {
	--desc = "Fel Flames (Argaloth, Baradin Hold 25)";
	sound = 1;
};

GTFO.SpellID["86844"] = {
	--desc = "Devouring Flames (Valiona, BoT - Twilight?)";
	sound = 1;
};

GTFO.SpellID["90949"] = {
	--desc = "Devouring Flames (Valiona, BoT 10)";
	sound = 1;
};

GTFO.SpellID["92872"] = {
	--desc = "Devouring Flames (Valiona, BoT 25)";
	sound = 1;
};

GTFO.SpellID["92873"] = {
	--desc = "Devouring Flames (Valiona, BoT 10H)";
	sound = 1;
};

GTFO.SpellID["92874"] = {
	--desc = "Devouring Flames (Valiona, BoT 25H)";
	sound = 1;
};

GTFO.SpellID["86505"] = {
	--desc = "Fabulous Flames (Theralion, BoT 10)";
	sound = 1;
};

GTFO.SpellID["92907"] = {
	--desc = "Fabulous Flames (Theralion, BoT 25)";
	sound = 1;
};

GTFO.SpellID["92908"] = {
	--desc = "Fabulous Flames (Theralion, BoT 10H)";
	sound = 1;
};

GTFO.SpellID["92909"] = {
	--desc = "Fabulous Flames (Theralion, BoT 25H)";
	sound = 1;
};

GTFO.SpellID["86631"] = {
	--desc = "Engulfing Magic - Friendly Fire (Theralion, BoT)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["88558"] = {
	--desc = "Flame Torrent (Ignacious, BoT 10)";
	sound = 1;
	tankSound = 0;
};

GTFO.SpellID["92516"] = {
	--desc = "Flame Torrent (Ignacious, BoT 25)";
	sound = 1;
	tankSound = 0;
};

GTFO.SpellID["92517"] = {
	--desc = "Flame Torrent (Ignacious, BoT 10H)";
	sound = 1;
	tankSound = 0;
};

GTFO.SpellID["92518"] = {
	--desc = "Flame Torrent (Ignacious, BoT 25H)";
	sound = 1;
	tankSound = 0;
};

GTFO.SpellID["82860"] = {
	--desc = "Inferno Rush (Ignacious, BoT 10)";
	sound = 1;
};

GTFO.SpellID["92523"] = {
	--desc = "Inferno Rush (Ignacious, BoT 25)";
	sound = 1;
};

GTFO.SpellID["92524"] = {
	--desc = "Inferno Rush (Ignacious, BoT 10H)";
	sound = 1;
};

GTFO.SpellID["92525"] = {
	--desc = "Inferno Rush (Ignacious, BoT 25H)";
	sound = 1;
};

GTFO.SpellID["84915"] = {
	--desc = "Liquid Ice (Elementium Monstrosity, BoT 10)";
	sound = 1;
};

GTFO.SpellID["92497"] = {
	--desc = "Liquid Ice (Elementium Monstrosity, BoT 25)";
	sound = 1;
};

GTFO.SpellID["92498"] = {
	--desc = "Liquid Ice (Elementium Monstrosity, BoT 10H)";
	sound = 1;
};

GTFO.SpellID["92499"] = {
	--desc = "Liquid Ice (Elementium Monstrosity, BoT 25H)";
	sound = 1;
};

GTFO.SpellID["79889"] = {
	--desc = "Lightning Conductor (Electron, BWD 10)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["91438"] = {
	--desc = "Lightning Conductor (Electron, BWD 25)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["91439"] = {
	--desc = "Lightning Conductor (Electron, BWD 10H)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["91440"] = {
	--desc = "Lightning Conductor (Electron, BWD 25H)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["91472"] = {
	--desc = "Poison Cloud (Toxitron, BWD 10)";
	sound = 1;
};

GTFO.SpellID["91473"] = {
	--desc = "Poison Cloud (Toxitron, BWD 25)";
	sound = 1;
};

GTFO.SpellID["80097"] = {
	--desc = "Poison Puddle (Toxitron, BWD 10)";
	sound = 1;
};

GTFO.SpellID["91488"] = {
	--desc = "Poison Puddle (Toxitron, BWD 25)";
	sound = 1;
};

GTFO.SpellID["91489"] = {
	--desc = "Poison Puddle (Toxitron, BWD 10H)";
	sound = 1;
};

GTFO.SpellID["91490"] = {
	--desc = "Poison Puddle (Toxitron, BWD 25H)";
	sound = 1;
};

GTFO.SpellID["77763"] = {
	--desc = "Biting Chill (Maloriak, BWD 10)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["92975"] = {
	--desc = "Biting Chill (Maloriak, BWD 25)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["92976"] = {
	--desc = "Biting Chill (Maloriak, BWD 10H)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["92977"] = {
	--desc = "Biting Chill (Maloriak, BWD 25H)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["78124"] = {
	--desc = "Magma Jets (Maloriak, BWD 10)";
	sound = 1;
};

GTFO.SpellID["93038"] = {
	--desc = "Magma Jets (Maloriak, BWD 25)";
	sound = 1;
};

GTFO.SpellID["93039"] = {
	--desc = "Magma Jets (Maloriak, BWD 10H)";
	sound = 1;
};

GTFO.SpellID["93040"] = {
	--desc = "Magma Jets (Maloriak, BWD 25H)";
	sound = 1;
};

GTFO.SpellID["77675"] = {
	--desc = "Sonar Pulse (Atramedes, BWD 10)";
	sound = 1;
};

GTFO.SpellID["92417"] = {
	--desc = "Sonar Pulse (Atramedes, BWD 25)";
	sound = 1;
};

GTFO.SpellID["92418"] = {
	--desc = "Sonar Pulse (Atramedes, BWD 10H)";
	sound = 1;
};

GTFO.SpellID["92419"] = {
	--desc = "Sonar Pulse (Atramedes, BWD 25H)";
	sound = 1;
};

GTFO.SpellID["78353"] = {
	--desc = "Roaring Flame Breath (Atramedes, BWD 10)";
	sound = 1;
};

GTFO.SpellID["92445"] = {
	--desc = "Roaring Flame Breath (Atramedes, BWD 25)";
	sound = 1;
};

GTFO.SpellID["92446"] = {
	--desc = "Roaring Flame Breath (Atramedes, BWD 10H)";
	sound = 1;
};

GTFO.SpellID["92447"] = {
	--desc = "Roaring Flame Breath (Atramedes, BWD 25H)";
	sound = 1;
};

GTFO.SpellID["78555"] = {
	--desc = "Roaring Flame (Atramedes, BWD 10)";
	sound = 1;
};

GTFO.SpellID["92472"] = {
	--desc = "Roaring Flame (Atramedes, BWD 25)";
	sound = 1;
};

GTFO.SpellID["92473"] = {
	--desc = "Roaring Flame (Atramedes, BWD 10H)";
	sound = 1;
};

GTFO.SpellID["92474"] = {
	--desc = "Roaring Flame (Atramedes, BWD 25H)";
	sound = 1;
};

GTFO.SpellID["78023"] = {
	--desc = "Roaring Flame - DoT (Atramedes, BWD 10)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["92483"] = {
	--desc = "Roaring Flame - DoT (Atramedes, BWD 25)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["92484"] = {
	--desc = "Roaring Flame - DoT (Atramedes, BWD 10H)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["92485"] = {
	--desc = "Roaring Flame - DoT (Atramedes, BWD 25H)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["78100"] = {
	--desc = "Sonic Breath (Atramedes, BWD 10)";
	sound = 1;
};

GTFO.SpellID["92407"] = {
	--desc = "Sonic Breath (Atramedes, BWD 25)";
	sound = 1;
};

GTFO.SpellID["92408"] = {
	--desc = "Sonic Breath (Atramedes, BWD 10H)";
	sound = 1;
};

GTFO.SpellID["92409"] = {
	--desc = "Sonic Breath (Atramedes, BWD 25H)";
	sound = 1;
};

GTFO.SpellID["86111"] = {
	--desc = "Ice Patch (Nezir, T4W 10)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["93129"] = {
	--desc = "Ice Patch (Nezir, T4W 25)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["93130"] = {
	--desc = "Ice Patch (Nezir, T4W 10H)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["93131"] = {
	--desc = "Ice Patch (Nezir, T4W 25H)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["86081"] = {
	--desc = "Permafrost (Nezir, T4W 10)";
	tankSound = 0;
	sound = 1;
};

GTFO.SpellID["86082"] = {
	--desc = "Permafrost (Nezir, T4W 25)";
	tankSound = 0;
	sound = 1;
};

GTFO.SpellID["95217"] = {
	--desc = "Soothing Breeze (Anshal, T4W)";
	sound = 1;
};

GTFO.SpellID["91020"] = {
	--desc = "Ice Storm (Al'Akir, T4W 10)";
	sound = 1;
};

GTFO.SpellID["93258"] = {
	--desc = "Ice Storm (Al'Akir, T4W 25)";
	sound = 1;
};

GTFO.SpellID["93259"] = {
	--desc = "Ice Storm (Al'Akir, T4W 10H)";
	sound = 1;
};

GTFO.SpellID["93260"] = {
	--desc = "Ice Storm (Al'Akir, T4W 25H)";
	sound = 1;
};

GTFO.SpellID["87908"] = {
	--desc = "Stormling (Al'Akir, T4W 10)";
	tankSound = 0;
	sound = 2;
	test = true;
};

GTFO.SpellID["93270"] = {
	--desc = "Stormling (Al'Akir, T4W 25)";
	tankSound = 0;
	sound = 2;
	test = true;
};

GTFO.SpellID["93271"] = {
	--desc = "Stormling (Al'Akir, T4W 10H)";
	tankSound = 0;
	sound = 2;
	test = true;
};

GTFO.SpellID["93272"] = {
	--desc = "Stormling (Al'Akir, T4W 25H)";
	tankSound = 0;
	sound = 2;
	test = true;
};

GTFO.SpellID["89667"] = {
	--desc = "Lightning Rod (Al'Akir, T4W 10)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["93293"] = {
	--desc = "Lightning Rod (Al'Akir, T4W 25)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["93294"] = {
	--desc = "Lightning Rod (Al'Akir, T4W 10H)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["93295"] = {
	--desc = "Lightning Rod (Al'Akir, T4W 25H)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["91325"] = {
	--desc = "Shadow Vortex (Shadowy Attendant, Shadowfang Keep Heroic)";
	sound = 1;
};

GTFO.SpellID["91554"] = {
	--desc = "Fetid Cloud (Fetid Ghoul, Shadowfang Keep Heroic)";
	sound = 1;
};

GTFO.SpellID["93784"] = {
	--desc = "Pistol Barrage (Lord Godfrey, Shadowfang Keep Heroic)";
	sound = 1;
};

GTFO.SpellID["93703"] = {
	--desc = "Ice Shards (Lord Walden, Shadowfang Keep Heroic)";
	sound = 1;
};

GTFO.SpellID["93617"] = {
	--desc = "Toxic Coagulant (Lord Walden, Shadowfang Keep Heroic)";
	sound = 1;
	applicationOnly = true;
	minimumStacks = 1;
};

GTFO.SpellID["93617"] = {
	--desc = "Consumption (Ick'thys the Unfathomable, Vashj'ir)";
	sound = 1;
};

GTFO.SpellID["90448"] = {
	--desc = "Poison (Cadaver Collage, Twilight Highlands)";
	sound = 1;
};

GTFO.SpellID["90406"] = {
	--desc = "Lava Pool (Emberscar the Devourer, Twilight Highlands)";
	sound = 1;
};

GTFO.SpellID["83446"] = {
	--desc = "Tempest Storm (Siamat, Lost City)";
	sound = 1;
};

GTFO.SpellID["90030"] = {
	--desc = "Tempest Storm (Siamat, Lost City Heroic)";
	sound = 1;
};

GTFO.SpellID["64683"] = {
	--desc = "Focused Laser (Obsidian Colossus, Uldum)";
	sound = 1;
};

GTFO.SpellID["84448"] = {
	--desc = "Searing Breath (Aeosera, Deepholm)";
	sound = 1;
};

GTFO.SpellID["79607"] = {
	--desc = "Venom Splash (Darkwood Broodmother, Tol Barad)";
	sound = 2;
};

GTFO.SpellID["84785"] = {
	--desc = "Whirlwind (Augh, Lost City)";
	sound = 1;
};

GTFO.SpellID["90012"] = {
	--desc = "Whirlwind (Augh, Lost City Heroic)";
	sound = 1;
};

GTFO.SpellID["81644"] = {
	--desc = "Dust Flail (Lockjaw, Lost City)";
	sound = 1;
};

GTFO.SpellID["90041"] = {
	--desc = "Dust Flail (Lockjaw, Lost City Heroic)";
	sound = 1;
};

GTFO.SpellID["95249"] = {
	--desc = "Blaze of the Heavens - Bird Proximity (High Prophet Barim, Lost City Heroic)";
	sound = 1;
};

GTFO.SpellID["91196"] = {
	--desc = "Blaze of the Heavens - Fire (High Prophet Barim, Lost City Heroic)";
	sound = 1;
};

GTFO.SpellID["74817"] = {
	--desc = "Inferno (Baron Geddon, Hyjal)";
	sound = 1;
};

GTFO.SpellID["89845"] = {
	--desc = "Void Infusion (Void Lord, Halls of Origination Heroic)";
	sound = 1;
};

GTFO.SpellID["89878"] = {
	--desc = "Solar Fire (Rajh, Halls of Origination Heroic)";
	sound = 1;
};

GTFO.SpellID["75697"] = {
	--desc = "Evolution (Corla, Blackrock Caverns)";
	sound = 1;
	applicationOnly = true;
	minimumStacks = 70;
};

GTFO.SpellID["87378"] = {
	--desc = "Evolution (Corla, Blackrock Caverns Heroic)";
	sound = 1;
	applicationOnly = true;
	minimumStacks = 70;
};

GTFO.SpellID["93519"] = {
	--desc = "Lava Pool (Karsh Steelbender, Blackrock Caverns Heroic)";
	sound = 1;
};

GTFO.SpellID["92300"] = {
	--desc = "Crystal Storm (Slabhide, Stonecore Heroic)";
	sound = 1;
};

GTFO.SpellID["90830"] = {
	--desc = "Flaming Shield (Forgemaster Throngus, Grim Batol Heroic)";
	sound = 1;
};

GTFO.SpellID["90754"] = {
	--desc = "Lava Patch (Forgemaster Throngus, Grim Batol Heroic)";
	sound = 1;
};

GTFO.SpellID["90664"] = {
	--desc = "Meat Grinder (Twilight Enforcer, Grim Batol Heroic)";
	sound = 2;
	tankSound = 0;
};

GTFO.SpellID["74987"] = {
	--desc = "Cave In (Forgemaster Throngus, Grim Batol Heroic)";
	sound = 1;
};

GTFO.SpellID["85506"] = {
	--desc = "Vermillion Strafe (Vermillion Sentinel, Twilight Highlands)";
	sound = 1;
};

GTFO.SpellID["85236"] = {
	--desc = "Corpse Rot (Forgotten Ghoul, Tol Barad)";
	sound = 2;
};

GTFO.SpellID["93485"] = {
	--desc = "Fiery Blaze (Vanessa VanCleef, Deadmines Heroic)";
	sound = 1;
};

GTFO.SpellID["77030"] = {
	--desc = "Reign of Chaos (Setesh, Halls of Origination)";
	sound = 1;
};

GTFO.SpellID["89872"] = {
	--desc = "Reign of Chaos (Setesh, Halls of Origination Heroic)";
	sound = 1;
};

GTFO.SpellID["83986"] = {
	--desc = "Blight Spray (Unyielding Behemoth, Throne of the Tides)";
	sound = 1;
	tankSound = 0;
};

GTFO.SpellID["91511"] = {
	--desc = "Blight Spray (Unyielding Behemoth, Throne of the Tides Heroic)";
	sound = 1;
	tankSound = 0;
};

GTFO.SpellID["89588"] = {
	--desc = "Lightning Clouds (Al'Akir, T4W 10)";
	sound = 1;
};

GTFO.SpellID["93297"] = {
	--desc = "Lightning Clouds (Al'Akir, T4W 25)";
	sound = 1;
};

GTFO.SpellID["93298"] = {
	--desc = "Lightning Clouds (Al'Akir, T4W 10H)";
	sound = 1;
};

GTFO.SpellID["93299"] = {
	--desc = "Lightning Clouds (Al'Akir, T4W 25H)";
	sound = 1;
};

GTFO.SpellID["81118"] = {
	--desc = "Magma (Nefarian, BWD 10)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["94073"] = {
	--desc = "Magma (Nefarian, BWD 25)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["94074"] = {
	--desc = "Magma (Nefarian, BWD 10H)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["94075"] = {
	--desc = "Magma (Nefarian, BWD 25H)";
	sound = 1;
	applicationOnly = true;
};

GTFO.SpellID["81007"] = {
	--desc = "Shadowblaze (Nefarian, BWD 10)";
	sound = 1;
};

GTFO.SpellID["94085"] = {
	--desc = "Shadowblaze (Nefarian, BWD 25)";
	sound = 1;
};

GTFO.SpellID["94086"] = {
	--desc = "Shadowblaze (Nefarian, BWD 10H)";
	sound = 1;
};

GTFO.SpellID["94087"] = {
	--desc = "Shadowblaze (Nefarian, BWD 25H)";
	sound = 1;
};

GTFO.SpellID["81067"] = {
	--desc = "Laser Strike (Golem Sentry, BWD)";
	sound = 1;
};

GTFO.SpellID["91884"] = {
	--desc = "Laser Strike (Golem Sentry, BWD Heroic)";
	sound = 1;
};

GTFO.SpellID["80161"] = {
	--desc = "Chemical Cloud (Toxitron, BWD 10)";
	sound = 1;
};

GTFO.SpellID["91471"] = {
	--desc = "Chemical Cloud (Toxitron, BWD 25)";
	sound = 1;
};

GTFO.SpellID["91472"] = {
	--desc = "Chemical Cloud (Toxitron, BWD 10H)";
	sound = 1;
};

GTFO.SpellID["91473"] = {
	--desc = "Chemical Cloud (Toxitron, BWD 25H)";
	sound = 1;
};

GTFO.SpellID["91903"] = {
	--desc = "Whirlwind (Drakonid Drudge, BWD)";
	sound = 1;
	tankSound = 0;
};

GTFO.SpellID["84853"] = {
	--desc = "Dark Pool (Twilight Soul Blade, BoT)";
	sound = 1;
};

GTFO.SpellID["88136"] = {
	--desc = "Whirling Blades (Twilight Brute, BoT 10)";
	sound = 1;
	tankSound = 2;
};

GTFO.SpellID["93358"] = {
	--desc = "Whirling Blades (Twilight Brute, BoT 25)";
	sound = 1;
	tankSound = 2;
};

GTFO.SpellID["88218"] = {
	--desc = "Burning Twilight (Crimsonborne Firestarter, BoT 10)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["93345"] = {
	--desc = "Burning Twilight (Crimsonborne Firestarter, BoT 25)";
	sound = 4;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["87931"] = {
	--desc = "Tremors (Earth Ravager, BoT 10)";
	sound = 1;
};

GTFO.SpellID["93351"] = {
	--desc = "Tremors (Earth Ravager, BoT 25)";
	sound = 1;
};

GTFO.SpellID["80270"] = {
	--desc = "Shadowflame DoT (Ivoroc/Maimgor/Pyrecraw, BWD 10)";
	sound = 1;
	tankSound = 0;
	applicationOnly = true;
};

GTFO.SpellID["80272"] = {
	--desc = "Shadowflame (Ivoroc/Maimgor/Pyrecraw, BWD 10)";
	sound = 1;
	tankSound = 0;
};

GTFO.SpellID["91908"] = {
	--desc = "Shadowflame DoT (Ivoroc/Maimgor/Pyrecraw, BWD 25)";
	sound = 1;
	tankSound = 0;
	applicationOnly = true;
};

GTFO.SpellID["91899"] = {
	--desc = "Shadowflame (Ivoroc/Maimgor/Pyrecraw, BWD 25)";
	sound = 1;
	tankSound = 0;
};

GTFO.SpellID["80411"] = {
	--desc = "Flame Breath (Pyrecraw, BWD 10)";
	sound = 1;
};

GTFO.SpellID["91892"] = {
	--desc = "Flame Breath (Pyrecraw, BWD 25)";
	sound = 1;
};

GTFO.SpellID["80651"] = {
	--desc = "Whirlwind (Spirit of Burningeye, BWD 10)";
	sound = 1;
	tankSound = 2;
};

GTFO.SpellID["91888"] = {
	--desc = "Whirlwind (Spirit of Burningeye, BWD 25)";
	sound = 1;
	tankSound = 2;
};
