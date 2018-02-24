--------------------------------------------------------------------------
-- GTFO_Fail_CAT.lua 
--------------------------------------------------------------------------
--[[
GTFO Fail List - Cataclysm (New areas)
Author: Zensunim of Malygos

Change Log:
	v2.3
		- Added Lady Naz'jar's Fungal Spores
		- Added Commander Ulthok's Dark Fissure (Impact)
		- Added Erunak Stonespeaker's Magma Splash
		- Added Stonecore's Stalactite
	v2.4
		- Added Slabhide's Sand Blast
		- Added Stonecore Bruiser's Shockwave
		- Added Ozruk's Ground Slam
		- Added High Priestess Azil's Seismic Shard
	v2.5
		- Split spell files into sections
		- Added Rom'ogg Bonecrusher's Skullcracker
		- Added Rom'ogg Bonecrusher's Ground Rupture
		- Added Karsh Steelbender's Lava Spout
		- Added Young Storm Dragon's Chilling Blast
		- Added Titanic Guardian's Meteor Blast
		- Added Titanic Guardian's Blazing Eruption
	v2.5.1
		- Added Highbank's Artillery Barrage
		- Added Dragonmaw Hold's Blade Strike
		- Added Servias Windterror's Static Flux Detonation
		- Added Obsidian Stoneslave's Rupture Line
		- Added Bloodgorged Ettin's Log Smash
		- Added General Umbriss's Ground Siege
		- Added Twilight Drake's Twilight Breath
		- Added Erudax's Binding Shadows
		- Fixed Young Strom Dragon's Chilling Blast
		- Added Karsh Steelbender's Lava Spout (Heroic)
		- Added Young Storm Dragon's Chilling Blast (Heroic)
	v2.5.2
		- Added Water Warden's Aqua Bomb
		- Added Air Warden's Whirling Winds
		- Added Earth Warden's Rockwave
		- Added Rajh's Solar Winds
		- Added Lady Naz'jar's Fungal Spores (Heroic)
		- Added Stonecore's Stalactite (Heroic)
		- Added Stonecore's Crystal Shards (Heroic)
		- Added Stonecore's Magma Eruption (Heroic)
		- Added Slabhide's Sand Blast (Heroic)
		- Added Stonecore Bruiser's Shockwave (Heroic)
		- Added Ozruk's Ground Slam (Heroic)
		- Added High Priestess Azil's Seismic Shard (Heroic)
		- Added General Husam's Shockwave
		- Added General Husam's Mystic Trap
		- Added Siamat's Cloud Burst
	v2.5.3
		- Added Invoked Flaming Spirit's Supernova
		- Added Foe Reaper 5000's Reaper Strike (Heroic)
		- Added Defias Watcher's Cleave (Heroic)
	v3.0.1
		- Updated Foe Reaper 5000's Reaper Strike (Heroic)
		- Added Foe Reaper 5000's Harvest Sweep (Heroic)
		- Added Defias Watcher's Cleave (Heroic)
		- Added Defias Cannon's Cannonball (Heroic)
		- Added Collapsing Icicle's Ice Shards (Heroic)
		- Added Helix Gearbreaker's Chest Bomb (Heroic)
		- Added Sticky Bomb's Explode (Heroic)
	v3.0.2
		- Added Theralion's Dazzling Destruction (Twilight)
		- Added Theralion's Twilight Flames (Twilight)
		- Added Elementium Monstrosity's Lava Plume
	v3.1
		- Added Toxitron's Poison Bomb
		- Added Maloriak's Absolute Zero
		- Added Atramedes's Sonar Bomb
		- Added Rohash's Wind Blast
		- Added Rohash's Tornado
		- Added Al'Akir's Squall Line
		- Added Al'Akir's Lightning Clouds		
		- Added Sorcerous Skeleton's Living Bomb Explosion
	v3.2.5
		- Removed Rom'ogg Bonecrusher's Ground Rupture
		- Added Obsidian Colossus's Shadow Storm
		- Added Obsidian Colossus's Sweeping Attack
		- Added Executor of the Caliph's Shockwave
		- Added Lady Naz'jar's Geyser
		- Added Lady Naz'jar Honor Guard's Arc Slash
	v3.2.6
		- Added Hurp'Derp's Overhead Smash
		- Added Torg Drakeflayer's Liquid Flame
		- Added Cadaver Collage's Belch
		- Added Emberscar the Devourer's Magmatic Fault
		- Added Altairus's Twisting Winds 
		- Added Falling Boulder's Searing Stone
	v3.2.7
		- Added Earthrager Ptah's Earth Spike (Heroic)
		- Added Earthrager Ptah's Consume (Heroic)
		- Added Isiset's Supernova
		- Added Ragnaros's Flame Tsunami
		- Added Ragnaros's Lava Strike
	v3.3
		- Added Ozruk's Shatter (Heroic)
		- Added Lady Naz'jar's Waterspout (Heroic)
		- Added Ozruk's Rupture (Heroic)
		- Added Crystalspawn Giant's Quake (Heroic)
		- Added Corborus's Thrashing Charge
		- Moved Al'Akir's Lightning Clouds
	v3.3.1
		- Added Magmaw's Infectious Vomit
		- Added Magmaw's Pillar of Flame
		- Added Onyxia and Nefarian's Tail Lash
		- Added Onyxia and Nefarian's Shadowflame Breath
		- Added Asaad's Static Cling
		- Added Grand Vizier Ertan's Cyclone Shield 		
		- Added Magmaw's Massive Crash
	v3.3.2
		- Added Drakonid Chainwielder's Overhead Smash
		- Added Halfus Wyrmbreaker's Fireball Barrage
		- Added Shadow Lord's Gripping Shadow
		- Added Fire Elemental's Concussive Blast
	v3.4
		- Added General Umbriss's Blitz
		- Added Maimgor's Tail Lash
		- Added Drakonid Slayer's Cleave
		- Fixed Erunak Stonespeaker's Magma Splash
	v3.4.1
		- Fixed Halfus Wyrmbreaker's Fireball Barrage
		
]]--

GTFO.SpellID["80564"] = {
	--desc = "Fungal Spores (Throne of the Tides)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["91470"] = {
	--desc = "Fungal Spores (Throne of the Tides Heroic)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["76047"] = {
	--desc = "Dark Fissure (Impact, Throne of the Tides)";
	sound = 3;
};

GTFO.SpellID["76170"] = {
	--desc = "Magma Splash (Throne of the Tides)";
	tankSound = 0;
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["80643"] = {
	--desc = "Stalactite (Stonecore)";
	sound = 3;
};

GTFO.SpellID["92653"] = {
	--desc = "Stalactite (Stonecore, Heroic)";
	sound = 3;
};

GTFO.SpellID["80913"] = {
	--desc = "Crystal Shards (Stonecore)";
	sound = 3;
};

GTFO.SpellID["92122"] = {
	--desc = "Crystal Shards (Stonecore, Heroic)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["80052"] = {
	--desc = "Magma Eruption (Stonecore)";
	sound = 3;
};

GTFO.SpellID["92634"] = {
	--desc = "Magma Eruption (Stonecore, Heroic)";
	sound = 3;
};

GTFO.SpellID["80807"] = {
	--desc = "Sand Blast (Stonecore)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["92656"] = {
	--desc = "Sand Blast (Stonecore, Heroic)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["80195"] = {
	--desc = "Shockwave (Stonecore)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["92640"] = {
	--desc = "Shockwave (Stonecore, Heroic)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["78903"] = {
	--desc = "Ground Slam (Stonecore)";
	sound = 3;
};

GTFO.SpellID["92410"] = {
	--desc = "Ground Slam (Stonecore, Heroic)";
	sound = 3;
};

GTFO.SpellID["79021"] = {
	--desc = "Seismic Shard (Stonecore)";
	sound = 3;
};

GTFO.SpellID["92665"] = {
	--desc = "Seismic Shard (Stonecore, Heroic)";
	sound = 3;
};

GTFO.SpellID["75428"] = {
	--desc = "The Skullcracker (Rom'ogg Bonecrusher, Blackrock Caverns)";
	sound = 3;
};

GTFO.SpellID["93454"] = {
	--desc = "The Skullcracker (Rom'ogg Bonecrusher, Blackrock Caverns Heroic)";
	sound = 3;
};

GTFO.SpellID["76007"] = {
	--desc = "Lava Spout (Karsh Steelbender, Blackrock Caverns)";
	sound = 3;
};

GTFO.SpellID["93565"] = {
	--desc = "Lava Spout (Karsh Steelbender, Blackrock Caverns Heroic)";
	sound = 3;
};

GTFO.SpellID["88194"] = {
	--desc = "Chilling Blast (Young Storm Dragon, Vortex Pinnacle)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["92759"] = {
	--desc = "Chilling Blast (Young Storm Dragon, Vortex Pinnacle Heroic)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["87701"] = {
	--desc = "Meteor Blast (Titanic Guardian, Uldum)";
	sound = 3;
};

GTFO.SpellID["87755"] = {
	--desc = "Blazing Eruption (Titanic Guardian, Uldum)";
	sound = 3;
};

GTFO.SpellID["84864"] = {
	--desc = "Artillery Barrage (Highbank, Twilight Highlands)";
	sound = 3;
};

GTFO.SpellID["84834"] = {
	--desc = "Blade Strike (Dragonmaw Hold, Twilight Highlands)";
	sound = 3;
};

GTFO.SpellID["88208"] = {
	--desc = "Static Flux Detonation (Servias Windterror, Twilight Highlands)";
	sound = 3;
};

GTFO.SpellID["89936"] = {
	--desc = "Rupture Line (Obsidian Stoneslave, Twilight Highlands)";
	sound = 3;
};

GTFO.SpellID["88421"] = {
	--desc = "Log Smash (Bloodgorged Ettin, Twilight Highlands)";
	sound = 3;
};

GTFO.SpellID["74634"] = {
	--desc = "Ground Siege (General Umbriss, Grim Batol)";
	sound = 3;
};

GTFO.SpellID["90249"] = {
	--desc = "Ground Siege (General Umbriss, Grim Batol Heroic)";
	sound = 3;
};

GTFO.SpellID["76817"] = {
	--desc = "Twilight Breath (Twilight Drake, Grim Batol)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["90875"] = {
	--desc = "Twilight Breath (Twilight Drake, Grim Batol Heroic)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["75861"] = {
	--desc = "Binding Shadows (Erudax, Grim Batol)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["91079"] = {
	--desc = "Binding Shadows (Erudax, Grim Batol Heroic)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["77351"] = {
	--desc = "Aqua Bomb (Water Warden, Halls of Origination)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["91157"] = {
	--desc = "Aqua Bomb (Water Warden, Halls of Origination Heroic)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["77333"] = {
	--desc = "Whirling Winds (Air Warden, Halls of Origination)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["91153"] = {
	--desc = "Whirling Winds (Air Warden, Halls of Origination Heroic)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["77234"] = {
	--desc = "Rockwave (Earth Warden, Halls of Origination)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["91162"] = {
	--desc = "Rockwave (Earth Warden, Halls of Origination Heroic)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["74108"] = {
	--desc = "Solar Winds (Rajh, Halls of Origination)";
	sound = 3;
};

GTFO.SpellID["89130"] = {
	--desc = "Solar Winds (Rajh, Halls of Origination Heroic)";
	sound = 3;
};

GTFO.SpellID["83454"] = {
	--desc = "Shockwave (General Husam, Lost City)";
	sound = 3;
};

GTFO.SpellID["83454"] = {
	--desc = "Shockwave (General Husam, Lost City)";
	sound = 3;
};

GTFO.SpellID["90029"] = {
	--desc = "Shockwave (General Husam, Lost City Heroic)";
	sound = 3;
};

GTFO.SpellID["83171"] = {
	--desc = "Mystic Trap (General Husam, Lost City)";
	sound = 3;
};

GTFO.SpellID["91259"] = {
	--desc = "Mystic Trap (General Husam, Lost City Heroic)";
	sound = 3;
};

GTFO.SpellID["83051"] = {
	--desc = "Cloud Burst (Siamat, Lost City)";
	sound = 3;
};

GTFO.SpellID["90032"] = {
	--desc = "Cloud Burst (Siamat, Lost City Heroic)";
	sound = 3;
};

GTFO.SpellID["75238"] = {
	--desc = "Supernova (Invoked Flaming Spirit, Grim Batol)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["90972"] = {
	--desc = "Supernova (Invoked Flaming Spirit, Grim Batol Heroic)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["91717"] = {
	--desc = "Reaper Strike (Foe Reaper 5000, Deadmines Heroic)";
	tankSound = 0;
	sound = 3;
	vehicle = true;
};

GTFO.SpellID["91718"] = {
	--desc = "Harvest Sweep (Foe Reaper 5000, Deadmines Heroic)";
	sound = 3;
	vehicle = true;
};

GTFO.SpellID["90981"] = {
	--desc = "Cleave (Defias Watcher, Deadmines Heroic)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["95496"] = {
	--desc = "Cannonball (Defias Cannon, Deadmines Heroic)";
	sound = 3;
};

GTFO.SpellID["92203"] = {
	--desc = "Ice Shards (Collapsing Icicle, Deadmines Heroic)";
	sound = 3;
};

GTFO.SpellID["88250"] = {
	--desc = "Chest Bomb (Helix Gearbreaker, Deadmines Heroic)";
	sound = 3;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["91567"] = {
	--desc = "Explode (Sticky Bomb, Deadmines Heroic)";
	sound = 3;
};

GTFO.SpellID["93063"] = {
	--desc = "Dazzling Destruction - Twilight (Theralion, BoT)";
	sound = 3;
};

GTFO.SpellID["86228"] = {
	--desc = "Twilight Flames - Twilight (Theralion, BoT 10)";
	sound = 3;
};

GTFO.SpellID["92867"] = {
	--desc = "Twilight Flames - Twilight (Theralion, BoT 25)";
	sound = 3;
};

GTFO.SpellID["84912"] = {
	--desc = "Lava Plume (Elementium Monstrosity, BoT 10)";
	sound = 3;
};

GTFO.SpellID["92491"] = {
	--desc = "Lava Plume (Elementium Monstrosity, BoT 25)";
	sound = 3;
};

GTFO.SpellID["92492"] = {
	--desc = "Lava Plume (Elementium Monstrosity, BoT 10H)";
	sound = 3;
};

GTFO.SpellID["92493"] = {
	--desc = "Lava Plume (Elementium Monstrosity, BoT 25H)";
	sound = 3;
};

GTFO.SpellID["80092"] = {
	--desc = "Poison Bomb (Toxitron, BWD 10)";
	sound = 3;
};

GTFO.SpellID["91498"] = {
	--desc = "Poison Bomb (Toxitron, BWD 25)";
	sound = 3;
};

GTFO.SpellID["91499"] = {
	--desc = "Poison Bomb (Toxitron, BWD 10H)";
	sound = 3;
};

GTFO.SpellID["91500"] = {
	--desc = "Poison Bomb (Toxitron, BWD 25H)";
	sound = 3;
};

GTFO.SpellID["78208"] = {
	--desc = "Absolute Zero (Maloriak, BWD 10)";
	sound = 3;
};

GTFO.SpellID["93041"] = {
	--desc = "Absolute Zero (Maloriak, BWD 25)";
	sound = 3;
};

GTFO.SpellID["93042"] = {
	--desc = "Absolute Zero (Maloriak, BWD 10H)";
	sound = 3;
};

GTFO.SpellID["93043"] = {
	--desc = "Absolute Zero (Maloriak, BWD 25H)";
	sound = 3;
};

GTFO.SpellID["92553"] = {
	--desc = "Sonar Bomb (Atramedes, BWD 10)";
	sound = 3;
};

GTFO.SpellID["92554"] = {
	--desc = "Sonar Bomb (Atramedes, BWD 25)";
	sound = 3;
};

GTFO.SpellID["92555"] = {
	--desc = "Sonar Bomb (Atramedes, BWD 10H)";
	sound = 3;
};

GTFO.SpellID["92556"] = {
	--desc = "Sonar Bomb (Atramedes, BWD 25H)";
	sound = 3;
};

GTFO.SpellID["85483"] = {
	--desc = "Wind Blast (Rohash, T4W 10)";
	sound = 3;
};

GTFO.SpellID["93138"] = {
	--desc = "Wind Blast (Rohash, T4W 25)";
	sound = 3;
};

GTFO.SpellID["93139"] = {
	--desc = "Wind Blast (Rohash, T4W 10H)";
	sound = 3;
};

GTFO.SpellID["93140"] = {
	--desc = "Wind Blast (Rohash, T4W 25H)";
	sound = 3;
};

GTFO.SpellID["85483"] = {
	--desc = "Tornado (Rohash, T4W 10)";
	sound = 3;
};

GTFO.SpellID["93138"] = {
	--desc = "Tornado (Rohash, T4W 25)";
	sound = 3;
};

GTFO.SpellID["93139"] = {
	--desc = "Tornado (Rohash, T4W 10H)";
	sound = 3;
};

GTFO.SpellID["93140"] = {
	--desc = "Tornado (Rohash, T4W 25H)";
	sound = 3;
};

GTFO.SpellID["87856"] = {
	--desc = "Squall Line (Al'Akir, T4W 10)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["93283"] = {
	--desc = "Squall Line (Al'Akir, T4W 25)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["93284"] = {
	--desc = "Squall Line (Al'Akir, T4W 10H)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["93285"] = {
	--desc = "Squall Line (Al'Akir, T4W 25H)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["91564"] = {
	--desc = "Living Bomb Explosion (Sorcerous Skeleton, Shadowfang Keep Heroic)";
	sound = 3;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["87991"] = {
	--desc = "Shadow Storm (Obsidian Colossus, Uldum)";
	sound = 3;
};

GTFO.SpellID["88102"] = {
	--desc = "Sweeping Attack (Obsidian Colossus, Uldum)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["80195"] = {
	--desc = "Shockwave (Executor of the Caliph, Vortex Pinnacle)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["92782"] = {
	--desc = "Shockwave (Executor of the Caliph, Vortex Pinnacle Heroic)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["75700"] = {
	--desc = "Geyser (Lady Naz'jar, TToT)";
	sound = 3;
};

GTFO.SpellID["91469"] = {
	--desc = "Geyser (Lady Naz'jar, TToT Heroic)";
	sound = 3;
};

GTFO.SpellID["91469"] = {
	--desc = "Arc Slash (Naz'jar Honor Guard, TToT)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["91469"] = {
	--desc = "Overhead Smash (Hurp'Derp, Twilight Highlands)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["88524"] = {
	--desc = "Liquid Flame (Torg Drakeflayer, Twilight Highlands)";
	sound = 3;
};

GTFO.SpellID["88524"] = {
	--desc = "Liquid Flame (Torg Drakeflayer, Twilight Highlands)";
	sound = 3;
};

GTFO.SpellID["88609"] = {
	--desc = "Belch (Cadaver Collage, Twilight Highlands)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["90335"] = {
	--desc = "Magmatic Fault (Emberscar the Devourer, Twilight Highlands)";
	sound = 3;
};

GTFO.SpellID["88314"] = {
	--desc = "Twisting Winds (Altairus, Vortex Pinnacle Heroic)";
	sound = 3;
	alwaysAlert = true;
};

GTFO.SpellID["75922"] = {
	--desc = "Searing Stone (Falling Boulder, Hyjal)";
	sound = 3;
};

GTFO.SpellID["89882"] = {
	--desc = "Earth Spike (Earthrager Ptah, Halls of Origination Heroic)";
	sound = 3;
};

GTFO.SpellID["75369"] = {
	--desc = "Consume (Earthrager Ptah, Halls of Origination Heroic)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["74137"] = {
	--desc = "Supernova (Isiset, Halls of Origination)";
	sound = 3;
};

GTFO.SpellID["76430"] = {
	--desc = "Flame Tsunami (Ragnaros, Hyjal)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["76134"] = {
	--desc = "Lava Strike (Ragnaros, Hyjal)";
	sound = 3;
};

GTFO.SpellID["92662"] = {
	--desc = "Shatter (Ozruk, Stonecore Heroic)";
	sound = 3;
};

GTFO.SpellID["92381"] = {
	--desc = "Rupture (Ozruk, Stonecore Heroic)";
	sound = 3;
};

GTFO.SpellID["90479"] = {
	--desc = "Waterspout (Lady Naz'jar, Throne of the Tides Heroic)";
	sound = 3;
	applicationOnly = true;
};

GTFO.SpellID["92631"] = {
	--desc = "Quake (Crystalspawn Giant, Stonecore Heroic)";
	sound = 3;
};

GTFO.SpellID["83981"] = {
	--desc = "Shadow Blast (Unyielding Behemoth, Throne of the Tides)";
	sound = 3;
};

GTFO.SpellID["91510"] = {
	--desc = "Shadow Blast (Unyielding Behemoth, Throne of the Tides Heroic)";
	sound = 3;
};

GTFO.SpellID["81828"] = {
	--desc = "Thrashing Charge (Corborus, Stonecore)";
	sound = 3;
};

GTFO.SpellID["92651"] = {
	--desc = "Thrashing Charge (Corborus, Stonecore Heroic)";
	sound = 3;
};

GTFO.SpellID["78937"] = {
	--desc = "Infectious Vomit (Magmaw, BWD 10)";
	sound = 3;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["91915"] = {
	--desc = "Infectious Vomit (Magmaw, BWD 25)";
	sound = 3;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["91923"] = {
	--desc = "Infectious Vomit (Magmaw, BWD 10H)";
	sound = 3;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["91924"] = {
	--desc = "Infectious Vomit (Magmaw, BWD 25H)";
	sound = 3;
	ignoreSelfInflicted = true;
};

GTFO.SpellID["77971"] = {
	--desc = "Pillar of Flame (Magmaw, BWD 10)";
	sound = 3;
};

GTFO.SpellID["91918"] = {
	--desc = "Pillar of Flame (Magmaw, BWD 25)";
	sound = 3;
};

GTFO.SpellID["91929"] = {
	--desc = "Pillar of Flame (Magmaw, BWD 10H)";
	sound = 3;
};

GTFO.SpellID["91930"] = {
	--desc = "Pillar of Flame (Magmaw, BWD 25H)";
	sound = 3;
};

GTFO.SpellID["77827"] = {
	--desc = "Tail Lash (Onyxia and Nefarian, BWD 10)";
	sound = 3;
};

GTFO.SpellID["94128"] = {
	--desc = "Tail Lash (Onyxia and Nefarian, BWD 25)";
	sound = 3;
};

GTFO.SpellID["94129"] = {
	--desc = "Tail Lash (Onyxia and Nefarian, BWD 10H)";
	sound = 3;
};

GTFO.SpellID["94130"] = {
	--desc = "Tail Lash (Onyxia and Nefarian, BWD 25H)";
	sound = 3;
};

GTFO.SpellID["77826"] = {
	--desc = "Shadowflame Breath (Onyxia and Nefarian, BWD 10)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["94124"] = {
	--desc = "Shadowflame Breath (Onyxia and Nefarian, BWD 25)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["94125"] = {
	--desc = "Shadowflame Breath (Onyxia and Nefarian, BWD 10H)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["94126"] = {
	--desc = "Shadowflame Breath (Onyxia and Nefarian, BWD 25H)";
	sound = 3;
	tankSound = 0;
};

GTFO.SpellID["87618"] = {
	--desc = "Static Cling (Asaad, Vortex Pinnacle Heroic)";
	sound = 3;
};

GTFO.SpellID["86292"] = {
	--desc = "Cyclone Shield (Grand Vizier Ertan, Vortex Pinnacle)";
	sound = 3;
};

GTFO.SpellID["88287"] = {
	--desc = "Massive Crash (Magmaw, BWD 10)";
	sound = 3;
};

GTFO.SpellID["91914"] = {
	--desc = "Massive Crash (Magmaw, BWD 25)";
	sound = 3;
};

GTFO.SpellID["91921"] = {
	--desc = "Massive Crash (Magmaw, BWD 10H)";
	sound = 3;
};

GTFO.SpellID["91922"] = {
	--desc = "Massive Crash (Magmaw, BWD 25H)";
	sound = 3;
};

GTFO.SpellID["91906"] = {
	--desc = "Overhead Smash (Drakonid Chainwielder, BWD)";
	sound = 3;
};

GTFO.SpellID["79580"] = {
	--desc = "Overhead Smash (Drakonid Chainwielder, BWD Heroic)";
	sound = 3;
};

GTFO.SpellID["83734"] = {
	--desc = "Fireball Barrage (Halfus Wyrmbreaker, BoT 10)";
	sound = 3;
};

GTFO.SpellID["86154"] = {
	--desc = "Fireball Barrage (Halfus Wyrmbreaker, BoT 25)";
	sound = 3;
};

GTFO.SpellID["86152"] = {
	--desc = "Fireball Barrage (Halfus Wyrmbreaker, BoT 10H)";
	sound = 3;
};

GTFO.SpellID["86153"] = {
	--desc = "Fireball Barrage (Halfus Wyrmbreaker, BoT 25H)";
	sound = 3;
};

GTFO.SpellID["87629"] = {
	--desc = "Gripping Shadows (Shadow Lord, BoT)";
	sound = 3;
};

GTFO.SpellID["87638"] = {
	--desc = "Concussive Blast (Fire Elemental, BoT)";
	sound = 3;
};

GTFO.SpellID["74670"] = {
	--desc = "Blitz (General Umbriss, Grim Batol)";
	sound = 3;
};

GTFO.SpellID["90250"] = {
	--desc = "Blitz (General Umbriss, Grim Batol Heroic)";
	sound = 3;
};

GTFO.SpellID["80130"] = {
	--desc = "Tail Lash (Maimgor, BWD 10)";
	sound = 3;
};

GTFO.SpellID["91901"] = {
	--desc = "Tail Lash (Maimgor, BWD 25)";
	sound = 3;
};

GTFO.SpellID["80392"] = {
	--desc = "Cleave (Drakonid Slayer, BWD)";
	tankSound = 0;
	sound = 3;
};

