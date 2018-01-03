local MAJOR, MINOR = "LibFail-1.0", tonumber("67") or 999

assert(LibStub, MAJOR.." requires LibStub")

local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

local callbacks = LibStub("CallbackHandler-1.0"):New(lib)

lib.frame = lib.frame or CreateFrame("Frame")

local frame = lib.frame
frame:RegisterEvent("PLAYER_ENTERING_WORLD")


--- Fail Events.
--@description The list of supported events
--@class table
--@name fail_events
--@field 1  Fail_Deconstructor_Light
--@field 2  Fail_Deconstructor_Void
--@field 3  Fail_Frogger
--@field 4  Fail_Heigan_Dance
--@field 5  Fail_KelThuzad_VoidZone
--@field 6  Fail_Mimiron_BombBots
--@field 7  Fail_Mimiron_Rocket
--@field 8  Fail_Mimiron_Shock
--@field 9  Fail_Sapphiron_Breath
--@field 10 Fail_Sartharion_LavaWaves
--@field 11 Fail_Sartharion_VoidZone
--@field 12 Fail_Thaddius_Jump
--@field 13 Fail_Thaddius_PolaritySwitch
--@field 14 Fail_Thorim_LightningChain
--@field 15 Fail_Thorim_LightningCharge
--@field 16 Fail_Thorim_Smash
--@field 17 Fail_Vezax_ShadowCrash
--@field 18 Fail_Vezax_Saronite
--@field 19 Fail_Hodir_FlashFreeze
--@field 20 Fail_Vezax_Leech
--@field 21 Fail_Mimiron_LaserBarrage
--@field 22 Fail_Mimiron_Flames
--@field 23 Fail_Council_Overload
--@field 24 Fail_Hodir_Icicle
--@field 25 Fail_Freya_Sunbeam
--@field 26 Fail_Freya_NatureBomb
--@field 27 Fail_Thorim_Blizzard
--@field 28 Fail_Yogg_Sanity
--@field 29 Fail_Yogg_DeathRay
--@field 30 Fail_Racorscale_Flame
--@field 31 Fail_Kologarn_Eyebeam
--@field 32 Fail_Auriaya_Voidzone
--@field 33 Fail_Hodir_BitingCold
--@field 34 Fail_Malygos_Dot
local fail_events = {
    "Fail_Deconstructor_Light",
    "Fail_Deconstructor_Void",
    "Fail_Frogger",
    "Fail_Heigan_Dance",
    "Fail_KelThuzad_VoidZone",
    "Fail_Mimiron_BombBots",
    "Fail_Mimiron_Rocket",
    "Fail_Mimiron_Shock",
    "Fail_Sapphiron_Breath",
    "Fail_Sartharion_LavaWaves",
    "Fail_Sartharion_VoidZone",
    "Fail_Thaddius_Jump",
    "Fail_Thaddius_PolaritySwitch",
    "Fail_Thorim_LightningChain",
    "Fail_Thorim_LightningCharge",
    "Fail_Thorim_Smash",
    "Fail_Vezax_ShadowCrash",
    "Fail_Vezax_Saronite",
    "Fail_Vezax_Leech",
    "Fail_Hodir_FlashFreeze",
    "Fail_Mimiron_LaserBarrage",
    "Fail_Mimiron_Flames",
    "Fail_Council_Overload",
    "Fail_Hodir_Icicle",
    "Fail_Freya_Sunbeam",
    "Fail_Freya_NatureBomb",
    "Fail_Thorim_Blizzard",
    "Fail_Yogg_Sanity",
    "Fail_Yogg_DeathRay",
    "Fail_Racorscale_Flame",
    "Fail_Kologarn_Eyebeam",
    "Fail_Auriaya_Voidzone",
    "Fail_Hodir_BitingCold",
    "Fail_Malygos_Dot",
}

--[===[@debug@
function lib:Test(overrideName)
    local e = math.floor(math.random() * #fail_events) + 1
    local p = math.floor(math.random() * 5) + 1

    self:FailEvent(fail_events[e], overrideName or "Test"..p)
end
--@end-debug@]===]

-- Not sure if this really gets used
local survivable_fails = {
    Fail_Sartharion_LavaWaves = true,
    Fail_Sartharion_VoidZone = true,
    Fail_Heigan_Dance = true,
    Fail_Thaddius_PolaritySwitch = true,
    Fail_Thaddius_Jump = true,
    Fail_Deconstructor_Light = true,
    Fail_Deconstructor_Void = true,
    Fail_Vezax_ShadowCrash = true,
    Fail_Hodir_FlashFreeze = true,
}

-- The distinction between the mass/group is there is 1 fail
-- for N people in a group fail. For mass fails, there are N fails
-- for N people.

-- NYI, fails which have a group component
-- that is *part* of the fail
-- eg. chain lightning
local group_fails = {
    Fail_Thorim_LightningChain = true,
}

-- NYI, fails which tend to happen to alot of
-- people at the same time - but are still individual fails
-- eg. lava waves (this info may be redundant)
--local mass_fails = {
--    Fail_Sartharion_LavaWaves = true,
--    Fail_Heigan_Dance = true,
--    Fail_Sartharion_VoidZone = true,
--    Fail_Vezax_ShadowCrash = true
--}

local zones_with_fails = {
    Ulduar = {
        "Fail_Deconstructor_Light",
        "Fail_Deconstructor_Void",
        "Fail_Hodir_FlashFreeze",
        "Fail_Hodir_BitingCold",
        "Fail_Hodir_Icicle",
        "Fail_Mimiron_BombBots",
        "Fail_Mimiron_Rocket",
        "Fail_Mimiron_Shock",
        "Fail_Mimiron_LaserBarrage",
        "Fail_Mimiron_Flames",
        "Fail_Thorim_LightningChain",
        "Fail_Thorim_LightningCharge",
        "Fail_Thorim_Smash",
        "Fail_Thorim_Blizzard",
        "Fail_Vezax_Leech",
        "Fail_Vezax_ShadowCrash",
        "Fail_Vezax_Saronite",
        "Fail_Council_Overload",
        "Fail_Freya_Sunbeam",
        "Fail_Freya_NatureBomb",
        "Fail_Yogg_Sanity",
        "Fail_Yogg_DeathRay",
        "Fail_Racorscale_Flame",
        "Fail_Kologarn_Eyebeam",
        "Fail_Auriaya_Voidzone",
    },
    Naxxramas = {
        "Fail_Frogger",
        "Fail_Heigan_Dance",
        "Fail_KelThuzad_VoidZone",
        "Fail_Sapphiron_Breath",
        "Fail_Thaddius_Jump",
        "Fail_Thaddius_PolaritySwitch",
    },
    ["The Obsidian Sanctum"] = {
        "Fail_Sartharion_LavaWaves",
        "Fail_Sartharion_VoidZone"
    },
    ["Eye of Eternity"] = {
        "Fail_Malygos_Dot",
    }
}

--- Get a list of supported events.
-- @see fail_events
-- @return a table of event names which can be fired
function lib:GetSupportedEvents() return fail_events end

--- Get a list of supported events in the current zone
-- @see fail_events
-- @return a table of event names which can be fired
function lib:GetSupportedZoneEvents(name) return zones_with_fails[name] end


--- Is the event survivable.
--@param event an event from the list of supported events
--@return true or nil
function lib:IsSurvivable(event) return survivable_fails[event] end

--- Is the event a failure by a group or an individual. Group failures
-- will come as several events in quick sucession, this gives the host a hint
-- as to how to group and display the events.
--@param event an event from the list of supported events
--@return true or nil
function lib:IsGroupFail(event) return group_fails[event] end


function lib:GoInactive()
    if not self.active then return end

    self.SquelchFail = {}
    self.FailThrottle = {}
    self.LastTsunami = {}
    self.ChargeCounter = {}
    self.LastCharge = {}
    self.ThaddiusAlive = true;
    self.MalygosAlive = true;
    self.DeathTime = 0
    self.LastSlime = {}
    self.FroggerTime = {}

    self.LastEvent = { }

    -- Last whatever
    for i=1,#fail_events do
        self.LastEvent[fail_events[i]] = {}
    end


    self.LastGravity, self.LastLight = {}, {}
    self.active = nil

    frame:RegisterEvent("RAID_ROSTER_UPDATE")
    frame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

    callbacks:Fire("Fail_Inactive")
end

lib.active = true
lib:GoInactive()

lib.THADDIUS_JUMP_WINDOW = 120
lib.THADDIUS_JUMP_RETRY_WINDOW = 5
lib.FROGGER_DEATH_WINDOW = 4

do
    local _, etype, f

    frame:SetScript("OnEvent", function (self, event, ...)
        if event == "COMBAT_LOG_EVENT_UNFILTERED" then
            _, etype = ...
            f = lib[etype]

            if f then
                f(lib, ...)
            end

            -- This needs to be moved elsewhere
            local timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName = ...
            if destName then
                if (destName=="Stalagg") or (destName=="Feugen") then
                    self.DeathTime = timestamp
                end
            end

            return
        end

        f = lib[event]

        if f then
            f(lib, ...)
        end
    end)
end


function lib:FailEvent(name, playername)
    callbacks:Fire(name, playername, survivable_fails[name])
end


function lib:GoActive()
    if self.active then return end

    --frame:UnregisterEvent("RAID_ROSTER_UPDATE")
    frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

    self.active = true

    callbacks:Fire("Fail_Active")
end


function lib:PLAYER_ENTERING_WORLD(...)
    if GetNumRaidMembers() > 0 then
        self:GoActive()
    else
        self:GoInactive()
    end
end

function lib:RAID_ROSTER_UPDATE(...)
    if GetNumRaidMembers() > 0 then
        self:GoActive()
    else
        self:GoInactive()
    end
end


function lib:SPELL_DAMAGE(timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName, spellSchool)
    -- Guardian activities ignored after this point
--5/7 21:13:33.865  SPELL_DAMAGE,0xF1300079F0003A98,"Mirror Image",0x2114,0xF130008092003842,"Elder Stonebark",0xa48,59637,"Fire Blast",0x4,139,0,4,0,0,0,nil,nil,nil
--5/7 21:13:36.092  SPELL_HEAL,0x01800000007C56B2,"Blackknite",0x512,0xF1300079F0003A97,"Mirror Image",0x2114,54968,"Glyph of Holy Light",0x2,1240,1240,nil
    if (bit.band(sourceFlags,COMBATLOG_OBJECT_TYPE_GUARDIAN)>0) or (bit.band(destFlags,COMBATLOG_OBJECT_TYPE_GUARDIAN)>0) then
        return
    end

    -- EnsidiaFails - Maat
    -- Hodir Biting Cold
    if spellId == 62038 or spellId == 62188 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            local cold = select(1,GetSpellInfo(62188))
            local _, _, _, stack = UnitDebuff(destName, cold)

            if stack ~= nil and stack > 2 then
                if self.LastEvent.Fail_Hodir_BitingCold.destName == nil or (timestamp - self.LastEvent.Fail_Hodir_BitingCold.destName) > 5 then
                    self:FailEvent("Fail_Hodir_BitingCold", destName)
                    self.LastEvent.Fail_Hodir_BitingCold.destName = timestamp
                end
            end
        end

        return
    end

    -- Kologarn Eyebeam
    if spellId == 63976 or spellId == 63346 or spellId == 63368 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastEvent.Fail_Kologarn_Eyebeam.destName ~= nil then
                if (timestamp - self.LastEvent.Fail_Kologarn_Eyebeam.destName) > 5 then
                    self:FailEvent("Fail_Kologarn_Eyebeam", destName)
                end
            else
               self:FailEvent("Fail_Kologarn_Eyebeam", destName)
            end

            self.LastEvent.Fail_Kologarn_Eyebeam.destName = timestamp
        end

        return
    end

    -- Auriaya Void Zone
    if spellId == 64459 or spellId == 64675 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastEvent.Fail_Auriaya_Voidzone.destName ~= nil then
                if (timestamp - self.LastEvent.Fail_Auriaya_Voidzone.destName) > 5 then
                    self:FailEvent("Fail_Auriaya_Voidzone", destName)
                end
            else
               self:FailEvent("Fail_Auriaya_Voidzone", destName)
            end

            self.LastEvent.Fail_Auriaya_Voidzone.destName = timestamp
        end

        return
    end

    -- Racorscale Flame
    if spellId == 64733 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastEvent.Fail_Racorscale_Flame.destName == nil then
               self.LastEvent.Fail_Racorscale_Flame.destName = 0
            end

            self.LastEvent.Fail_Racorscale_Flame.destName = self.LastEvent.Fail_Racorscale_Flame.destName + 1

            if self.LastEvent.Fail_Racorscale_Flame.destName == 2 then
               self:FailEvent("Fail_Racorscale_Flame", destName)
               self.LastEvent.Fail_Racorscale_Flame.destName = 0
            end
        end

        return
    end

    -- Yogg Saron Death Ray
    if spellId == 63884 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastEvent.Fail_Yogg_DeathRay.destName ~= nil then
                if (timestamp - self.LastEvent.Fail_Yogg_DeathRay.destName) > 5 then
                    self:FailEvent("Fail_Yogg_DeathRay", destName)
                end
            else
               self:FailEvent("Fail_Yogg_DeathRay", destName)
            end

            self.LastEvent.Fail_Yogg_DeathRay.destName = timestamp
        end

        return
    end

    -- Freya Nature Bomb
    if spellId ==64650 then
         if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Freya_NatureBomb", destName)
         end
         return
    end

    -- Hodir Icicle
    if spellId == 62457 then
         if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Hodir_Icicle", destName)
         end
         return
    end

    -- Council Overload
    if spellId == 61878 or spellId == 63480 then
         if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Council_Overload", destName)
         end
         return
    end

    -- Mimiron Flames
    if spellId == 64566 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastEvent.Fail_Mimiron_Flames.destName ~= nil then
                if (timestamp - self.LastEvent.Fail_Mimiron_Flames.destName) > 10 then
                    self:FailEvent("Fail_Mimiron_Flames", destName)
                end
            else
               self:FailEvent("Fail_Mimiron_Flames", destName)
            end

            self.LastEvent.Fail_Mimiron_Flames.destName = timestamp
        end

        return
    end

    -- Mimiron Laser Barrage
    if spellId == 63293 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastEvent.Fail_Mimiron_LaserBarrage.destName ~= nil then
                if (timestamp - self.LastEvent.Fail_Mimiron_LaserBarrage.destName) > 10 then
                    self:FailEvent("Fail_Mimiron_LaserBarrage", destName)
                end
            else
               self:FailEvent("Fail_Mimiron_LaserBarrage", destName)
            end

            self.LastEvent.Fail_Mimiron_LaserBarrage.destName = timestamp
        end

        return
    end

    -- Vezax Saronite Vapor Suicide
    if spellId == 63338 then
         if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self.LastEvent.Fail_Vezax_Saronite.destName = timestamp
         end
         return
    end

    -- Sartharion Lava Waves: Flame Tsunami
    if spellId == 57491 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastTsunami[destName] == nil then
                self.LastTsunami[destName] = timestamp

                self:FailEvent("Fail_Sartharion_LavaWaves", destName)
            else
                if (timestamp - lib.LastTsunami[destName]) > 10 then
                    self:FailEvent("Fail_Sartharion_LavaWaves", destName)
                end
                self.LastTsunami[destName] = timestamp
            end
        end

        return
    end

    -- Deconstructor: Light Bomb
    if spellId == 65120 and sourceGUID ~= destGUID then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastLight[sourceName] ~= nil then
                if (timestamp - lib.LastLight[sourceName]) > 3 then
                    self:FailEvent("Fail_Deconstructor_Light", sourceName)
                end
                self.LastLight[sourceName] = nil
            end
        end

        return
    end

    -- Deconstructor: Gravity Bomb (bomb part)
    if spellId == 64233 and sourceGUID ~= destGUID then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastGravity[sourceName] ~= nil then
                self:FailEvent("Fail_Deconstructor_Void", sourceName)
                self.LastGravity[sourceName] = nil
            end
        end

        return
    end

   -- Failbot - Viiv
   -- 4/16 18:50:56.578  SPELL_DAMAGE,0x0000000000000000,nil,0x80000000,0x05000000027ECB89,"Logicalness",0x514,64875,"Sapper Explosion",0x40,67542,45099,64,28421,0,0,nil,nil,nil
   -- Mimiron Trash - Sapper Explosion
    if spellId == 64875 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Boss_Sapper", destName)
        end
        return
    end


   -- Failbot - Viiv
   -- 4/16 21:10:24.039  SPELL_DAMAGE,0xF1300083EC02D966,"Faceless Horror",0x10a48,0x05000000027ECC71,"Boniface",0x514,63721,"Shadow Crash",0x20,8103,0,32,2457,0,0,nil,nil,nil
   -- 4/16 22:06:17.885  SPELL_DAMAGE,0xF1300081F702D928,"General Vezax",0x10a48,0x05000000027FCDFE,"Kosie",0x514,62659,"Shadow Crash",0x20,9413,0,32,2285,0,0,nil,nil,nil
   -- Vezax Shadow Crash
    if spellId == 62659 or spellId == 63721 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Vezax_ShadowCrash", destName)
        end
        return
    end

   -- Failbot - Viiv
   -- 4/16 18:20:24.295  SPELL_DAMAGE,0xF130008061018374,"Thorim",0x8010a48,0x0500000001E8AF39,"Thefeint",0x514,62466,"Lightning Charge",0x8,8977,0,8,3966,0,0,nil,nil,nil
   -- Thorim Lightning Charge
    if spellId == 62466 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Thorim_LightningCharge", destName)
        end
        return
    end

    -- Thorim Chain Lightning
    if spellId == 64390 then
        -- The event starts from the end of the chain and works back to the start. Who failed?
        -- Need a way of expressing group failures
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Thorim_LightningChain", destName)
        end
        return
    end

    -- Mimiron Rocket Strike
    if spellId == 63041 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Mimiron_Rocket", destName)
        end
        return
    end

   -- Failbot - Viiv
   -- 4/16 13:35:12.750  SPELL_DAMAGE,0xF13000842C0094E3,"Bomb Bot",0xa48,0x05000000027ECCA5,"Naddia",0x512,63801,"Bomb Bot",0x4,20216,4025,4,5054,0,0,nil,nil,nil
   -- Mimiron Bomb Bots
   if spellId == 63801 then
       if timestamp - (self.SquelchFail.Fail_Mimiron_BombBots or 0) <= 0 then
          return
       end
       if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
          self:FailEvent("Fail_Mimiron_BombBots", destName)
       end
       return
   end

   -- 4/16 01:06:26.414  SPELL_DAMAGE,0x0000000000000000,nil,0x80000000,0x05000000027ECA9C,"Cn",0x514,62465,"Runic Smash",0x4,6544,0,4,3116,0,0,nil,nil,nil
   -- Thorim Hallway Smash
   if spellId == 62465 then
       if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
           self:FailEvent("Fail_Thorim_Smash", destName)
       end
       return
   end

   -- 3/13 21:17:23.756  SPELL_DAMAGE,0xF150008298002210,"Leviathan Mk II",0x10a48,0xF1300007AC0025A9,"Treant",0x1114,63631,"Shock Blast",0x8,97000,92908,8,0,0,0,nil,nil,nil
   -- Mimiron Shock Blast
   if spellId == 63631 then
       if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
           self:FailEvent("Fail_Mimiron_Shock", destName)
       end
       return
   end



    -- Heigan Dance, Void Zones, Sapphiron's Breath, Frogger

    -- Frogger: Living Poision -> Explode 28433
    -- Heigan: Eruption 29371
    -- Sapphiron: Frost Breath 28524
    -- Void Blast 27812
    local FailType

    if spellId == 29371 then
        FailType = "Heigan_Dance"
    elseif (spellId == 57581) or (spellId == 59128) then
        FailType = "Sartharion_VoidZone"
    elseif spellId == 27812 then
        FailType = "KelThuzad_VoidZone"
    elseif spellId == 28524 then
        FailType = "Sapphiron_Breath"
    elseif spellId == 28433 then
        self.FroggerTime[destName] = timestamp
        return
    end


    if FailType and bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
        self:FailEvent("Fail_"..FailType, destName)
        return
    end

--      end
--  end

    -- Thaddius Polarity Switch
    -- 28062 Positive Charge
    -- 28085 Negative Charge
    if self.ThaddiusAlive then
        if spellId == 28062  or spellId == 28085 then
            if self.ChargeCounter[sourceName] == nil then
                self.ChargeCounter[sourceName] = 1
                self.LastCharge[sourceName] = timestamp
            elseif (timestamp - lib.LastCharge[sourceName]) < 2 then
                self.ChargeCounter[sourceName] = lib.ChargeCounter[sourceName] + 1
                self.LastCharge[sourceName] = timestamp
            else
                self.ChargeCounter[sourceName] = 1
                self.LastCharge[sourceName] = timestamp
            end

            if self.ChargeCounter[sourceName] == 3 then
                callbacks:Fire("Fail_Thaddius_PolaritySwitch", sourceName)
            end
        end
    end
end


function lib:ENVIRONMENTAL_DAMAGE(timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, dmgType)
    -- Thaddius Falling
    if (timestamp - self.DeathTime) < self.THADDIUS_JUMP_WINDOW and dmgType == "FALLING" then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self.LastSlime[destName] = timestamp
            self:FailEvent("Fail_Thaddius_Jump", destName)
        end
    end
end

-- Thaddius Polarity Shift
function lib:SPELL_CAST_START(timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName, spellSchool)
--  if sourceName=="Thaddius" then
        if spellId == 28089 then
            wipe(self.ChargeCounter)
            self.ThaddiusAlive = true;
        end
--  end
end

function lib:UNIT_DIED(timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags)
    if (destName=="Thaddius") then
        self.ThaddiusAlive = false
        return
    elseif self.FroggerTime[destName] then

        if (timestamp - self.FroggerTime[destName] < self.FROGGER_DEATH_WINDOW ) and bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0  then
           self:FailEvent("Fail_Frogger", destName)
        end

        self.FroggerTime[destName] = nil

    end

    if (destName == "Malygos") then
        self.MalygosAlive = false;
    end


    -- Saronite Vapor Suicide (Fail_Vezax_Saronite) death within 2sec of saronite damage
    if self.LastEvent.Fail_Vezax_Saronite.destName then
        if timestamp - self.LastEvent.Fail_Vezax_Saronite.destName < 2 then
            self:FailEvent("Fail_Vezax_Saronite", destName)
        end

        self.LastEvent.Fail_Vezax_Saronite.destName = nil

    end


end

function lib:SPELL_PERIODIC_DAMAGE(timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName, spellSchool)
	 -- Freya Sunbeam
    if spellId == 62865 or spellId == 62451 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastEvent.Fail_Freya_Sunbeam.destName == nil then
               self.LastEvent.Fail_Freya_Sunbeam.destName = 0
            end

            self.LastEvent.Fail_Freya_Sunbeam.destName = self.LastEvent.Fail_Freya_Sunbeam.destName + 1

            if self.LastEvent.Fail_Freya_Sunbeam.destName == 2 then
               self:FailEvent("Fail_Freya_Sunbeam", destName)
               self.LastEvent.Fail_Freya_Sunbeam.destName = 0
            end
        end

        return
    end

    -- Thorim Blizzard
    if spellId == 62602 then
        if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            if self.LastEvent.Fail_Thorim_Blizzard.destName == nil then
               self.LastEvent.Fail_Thorim_Blizzard.destName = 0
            end

            self.LastEvent.Fail_Thorim_Blizzard.destName = self.LastEvent.Fail_Thorim_Blizzard.destName + 1

            if self.LastEvent.Fail_Thorim_Blizzard.destName == 2 then
               self:FailEvent("Fail_Thorim_Blizzard", destName)
               self.LastEvent.Fail_Thorim_Blizzard.destName = 0
            end
        end

        return
    end
end

function lib:SPELL_HEAL(timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName, spellSchool)
   -- Vezax Mark of the Faceless
   if spellId == 63278 then
      if self.SquelchFail.Fail_Vezax_Leech > 2 then -- allow 2 healing ticks before it's a fail
         self:FailEvent("Fail_Vezax_Leech", self.LastEvent.Fail_Vezax_Leech)
      else
         self.SquelchFail.Fail_Vezax_Leech = self.SquelchFail.Fail_Vezax_Leech + 1
      end
   end
end

function lib:SPELL_AURA_APPLIED(timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName, spellSchool)
   -- Vezax Mark of the Faceless
   if spellId == 63276 then
      if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
         -- save the name of the player who gain mark of the faceless
         self.LastEvent.Fail_Vezax_Leech = destName

         -- reset the heal count
         self.SquelchFail.Fail_Vezax_Leech = 0
      end
   end

   -- Hodir Flash Freeze
	if spellId == 61969 or spellId == 61990 then
		if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Hodir_FlashFreeze")
		end
        return
	end

	-- Yogg Saron Sanity Lost
	if spellId == 63120 then
		if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
            self:FailEvent("Fail_Yogg_Sanity")
		end
        return
	end

 -- Thaddius Jump
 if spellId == 28801 then
        if (timestamp - self.DeathTime) < self.THADDIUS_JUMP_WINDOW then -- error
            if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
                if self.LastSlime[destName] == nil then
                    self:FailEvent("Fail_Thaddius_Jump", destName)
                elseif (timestamp - self.LastSlime[destName]) > self.THADDIUS_JUMP_RETRY_WINDOW then
                    self:FailEvent("Fail_Thaddius_Jump", destName)
                end
            end
        end
    end

    -- Light Bomb
    if spellId == 65120 then
        self.LastLight[destName] = timestamp
    end
end


function lib:SPELL_SUMMON(timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName)
    --SPELL_SUMMON,0xF15000838601084D,"Aerial Command Unit",0xa48,0xF13000842C010A24,"Bomb Bot",0xa28,63811,"Bomb Bot",0x1
    if spellId == 63811 then
        -- could add the GUID for each bot if this doesnt work.
        self.SquelchFail.Fail_Mimiron_BombBots = timestamp + 30
        return
    end
end




function lib:SPELL_AURA_REMOVED(timestamp, type, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellId, spellName, spellSchool)
    -- Malygos Phase3 Dot
    if (spellId == 56092 or spellId == 61621) and self.MalygosAlive then
        local guid = sourceGUID
        local failer = nil

        for c = 1, GetNumRaidMembers() do
        local pet = format("%s%d", "raidpet", c);
            if (UnitGUID(pet) == guid) then
                if UnitHealth(pet) > 0 then
                    local member = format("%s%d", "raid", c);
                    failer = UnitName(member);
                else
                    failer = nil;
                end
            end
        end

        if failer ~= nil then
            self:FailEvent("Fail_Malygos_Dot", failer)
        end
    end

    -- Thaddius Jump
    if spellId == 28801 then
        if (timestamp - self.DeathTime) < self.THADDIUS_JUMP_WINDOW then --error
            if bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
                self.LastSlime[destName] = timestamp
            end
        end
    end

    -- Light Bomb
    if spellId == 65120 then
        self.LastLight[destName] = nil
    end

    -- Gravity Bomb
    if spellId == 64233 then
        self.LastGravity[destName] = timestamp
    end
end
