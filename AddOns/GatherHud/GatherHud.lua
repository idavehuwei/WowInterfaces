-- Because Blizzard broke Optdep and Reqdep so much that I don't trust them anymore.
-- Especially if GatherMate turns from non-lod to lod via AddOnLoader as a LoadManager.
-- See http://forums.worldofwarcraft.com/thread.html?topicId=10971929880&sid=1 for details.
LoadAddOn("GatherMate")
LoadAddOn("Routes")

GatherHud = LibStub("AceAddon-3.0"):NewAddon("GatherHud", "AceConsole-3.0", "AceEvent-3.0")
local GatherHud = GatherHud
local L = LibStub("AceLocale-3.0"):GetLocale("GatherHud", false)

-- setup keybinds
BINDING_HEADER_GatherHud = L["GatherHud"]
BINDING_NAME_TOGGLEGATHERHUD = L["Enable or disable GatherHud"]

local db
local defaults = {
    global = {
        settings = {
            enabled       = false,

            self_color    = { 1, 1, 1, 1 }, -- r,g,b,a
            hud_scale     = 1,
            hud_width     = 800,
            hud_x         = 0,
            hud_y         = 0,
            hud_alpha     = 1,
            use_min_pitch = true,
            min_pitch     = 10,
            use_char_pitch = true,

            y_compression = 20, -- 0-90 degrees (2d topview to flat line side view)
            radius        = 1000,
            icon_size     = 13,
            icon_alpha    = 0.5,
            icon_depth    = 0.5,

            --[[
            runspeed = 100% = ~7yards per second, max clocked speedd 550% (Flightpoint)
            look_ahead should provide 2 seconds cache with some (10%) slack:
                7 * 2 * 5.50 * 1.10 = 85 yards
            ]]
            look_ahead    = 85,
            show_circle   = true,
            show_north    = true,
            show_routes   = true,
        }
    }
}

-- Setting up
-- * Setup GatherHud frame
local hud = CreateFrame("Frame", nil, UIParent)
hud:SetWidth(1)
hud:SetHeight(1)
hud:SetPoint( "CENTER", UIParent, "CENTER", 0, 0 )
hud:SetFrameStrata("LOW")
hud:EnableMouse(nil)
hud:Hide()
GatherHud.hud = hud

-- * Setup self
local selficon = hud:CreateTexture(nil, "ARTWORK")
selficon:SetTexture( "Interface\\AddOns\\GatherHud\\Artwork\\hud_circle.tga" )
selficon:SetWidth( 32 )
selficon:SetHeight( 32 )
selficon:SetPoint( "CENTER", hud, "CENTER" )
GatherHud.selficon = selficon

local visual_border = hud:CreateTexture(nil, "ARTWORK")
visual_border:SetTexture( "Interface\\AddOns\\GatherHud\\Artwork\\hud_border.tga" )
visual_border:SetWidth( 32 )
visual_border:SetHeight( 32 )
visual_border:SetAlpha( 0.5 )
visual_border:SetPoint( "CENTER", hud, "CENTER" )
GatherHud.visual_border = visual_border

local N_indicator = hud:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
N_indicator:SetText("N")

local RoutesHud

-- local calls
local math_sin = math.sin
local math_cos = math.cos
local math_abs = math.abs
local math_max = math.max
local rad_to_deg = math.pi/180
local GetRealZoneText = GetRealZoneText
local GetPlayerMapPosition = GetPlayerMapPosition
local IsInInstance, IsResting, InCombatLockDown = IsInInstance, IsResting, InCombatLockDown
local GetCVar = GetCVar
local GetUnitPitch = GetUnitPitch
local pairs, type, tonumber = pairs, type, tonumber

-- local storate
local sin, cos
local active_pins   = {} -- pins in use
local inactive_pins = {} -- recyclepins

local last_update = 0
local force_fullupdate = false
local cx, cy, facing, last_facing = 0/0, 0/0, 0/0, 0/0
local last_x, last_y = 0/0, 0/0
local pitch, last_pitch
local zone, zone_w, zone_h, in_instance, last_zone, is_resting, in_combat
local node_textures = GatherMate.nodeTextures

-- used in the icon - int > string index
local X, Y, DEPTH, KEEP, TEXTURE = 1, 2, 3, 4, 5

-- Code 'stolen' from GatherMate with permissions of authors :)
local function getArrowDirection(...)
    if GetPlayerFacing then
        return GetPlayerFacing()
    else
        if(GetCVar("rotateMinimap") == "1") then return -MiniMapCompassRing:GetFacing() end
        for i=select("#",...),1,-1 do
            local model=select(i,...)
            if model:IsObjectType("Model") and not model:GetName() then return model and model:GetFacing() end
        end
        return nil
    end
end

local update = CreateFrame("Frame")
update:Hide()
update:SetScript("OnUpdate", function(self, elapsed)
    last_update = last_update + elapsed

    -- Don't do anything if we're in an instance or resting
    in_instance = IsInInstance()
    is_resting = IsResting()
    in_combat = InCombatLockdown()
    if in_instance or is_resting or in_combat then
        hud:Hide()
        return
    else
        hud:Show()
    end

    -- facing - setup sin/cos variables
    facing = getArrowDirection(Minimap:GetChildren())
    sin = math_sin( facing )
    cos = math_cos( facing )

    -- pitch
    if db.settings.use_char_pitch then
        pitch = -GetUnitPitch("player") / rad_to_deg
    end

    -- record location
    cx, cy = GetPlayerMapPosition("player")

    -- zone size
    zone = GetRealZoneText()

    local zone_data = GatherMate.zoneData[ zone ]
    zone_w, zone_h = zone_data[1], zone_data[2]

    -- recycle all pins if we switch zone
    if zone ~= last_zone then
        for unique_id, pin in pairs( active_pins ) do
            active_pins[unique_id] = nil
            pin:Hide()
            inactive_pins[pin] = true
        end
        last_zone = zone
        force_fullupdate = true
    end

    --[[
     Every 2 seconds do a full update, it caches a bit more than
     2 second of maximum traveldistance ahead.

     Every other time - do the iterative update - move icons about
    --]]
    if last_update > 2 or force_fullupdate then
        -- Make it last only for 2 seconds
        if visual_border:IsVisible() and not db.settings.show_circle then visual_border:Hide() end

        GatherHud:FullUpdate(force_fullupdate)
        last_update = 0
        force_fullupdate = false
    else
        GatherHud:IterativeUpdate()
    end
end)

function GatherHud:GetOrCreatePin( unique_id, coord, texture_string )
    local pin = active_pins[unique_id]

    -- If we have it - return it
    if pin then return pin end

    -- try to get a cached pin
    pin = next(inactive_pins)

    -- If we found one - delete it from cache - else create one
    if pin then
        inactive_pins[pin] = nil
    else
        pin = CreateFrame("Frame", nil, hud)
        pin:SetParent( hud )
        pin:SetFrameStrata("LOW")
        pin:EnableMouse(nil)
        local texture = pin:CreateTexture(nil, "OVERLAY")
        texture:SetAllPoints( pin )
        pin[TEXTURE] = texture
    end

    -- Fix the texture and store data
    local texture = pin[TEXTURE]
    texture:SetTexture( texture_string )
    pin[X], pin[Y] = GatherMate:getXY( coord )

    -- Store with the active pins
    active_pins[ unique_id ] = pin

    return pin
end

local unique_offset = {
    ["Herb Gathering"] = 1e9,
    ["Fishing"]        = 2e9,
    ["Mining"]         = 3e9,
    ["Extract Gas"]    = 4e9,
    ["Treasure"]       = 5e9,
}

function GatherHud:FullUpdate(force)
    if not force then
        if not GatherHud.hud:IsVisible() or in_instance or is_resting or in_combat or not zone or zone == "" then return end
        if cx == 0 and cy == 0 then return end
        if last_x == cx and last_y == cy then return end
    end
    if not cx or not cy then return end

    for unique_id, pin in pairs(active_pins) do
        pin[KEEP] = false
    end

    local settings = db.settings
    local pin, offset
    for i,db_type in pairs(GatherMate.db_types) do
        if GatherMate.Visible[db_type] then
            offset = unique_offset[ db_type ]
            for coord, nodeID in GatherMate:FindNearbyNode(zone, cx, cy, db_type, settings.radius+settings.look_ahead) do
                pin = GatherHud:GetOrCreatePin( coord+offset, coord, node_textures[ db_type ][ nodeID ] )
                pin[KEEP] = true
            end
        end
    end

    -- Clean up all of the pins that we have marked inactive
    for unique_id, pin in pairs(active_pins) do
        if pin[KEEP] then -- do nothing, we're keeping it
            pin[KEEP] = false
        else -- recyclepin
            active_pins[unique_id] = nil
            inactive_pins[pin] = true
            pin:Hide()
        end
    end

    GatherHud:IterativeUpdate(true)
end

local depth_table = {}
local depth_sort = function(a,b) return a[DEPTH] > b[DEPTH] end
function GatherHud:IterativeUpdate(force)
    -- only do it when needed
    if not force then
        if not GatherHud.hud:IsVisible() or in_instance or is_resting or in_combat or not zone or zone == "" then return end
        if cx == 0 and cy == 0 then return end
        if ((last_x-cx)*zone_w)^2+((last_y-cy)*zone_h)^2 < 2^2 and facing == last_facing then
            if not (db.settings.use_char_pitch) or pitch == last_pitch then
                return
            end
        end
    end
    last_x, last_y, last_facing = cx, cy, facing
    last_pitch = pitch
    if not cx or not cy then return end

    local settings      = db.settings
    local hud_width     = settings.hud_width
    local y_compression
    if settings.use_char_pitch then
        if settings.use_min_pitch then
            y_compression = math_sin(math_max(pitch, settings.min_pitch) * rad_to_deg)
        else
            y_compression = math_sin(pitch * rad_to_deg)
        end
        visual_border:SetHeight( math_abs(hud_width * y_compression) + 1 )
    else
        y_compression = math_sin(settings.y_compression * rad_to_deg)
    end
    local hud_height    = hud_width * y_compression + 1
    local radius        = settings.radius
    local icon_size     = settings.icon_size
    local icon_depth    = settings.icon_depth * (1 - math_abs(y_compression))
    local icon_alpha    = settings.icon_alpha

    local scale = hud_width / (radius*2)

    local x = cx * zone_w
    local y = cy * zone_h
    local radius2 = radius*radius

    -- reuse table
    for i in pairs(depth_table) do depth_table[i] = nil end

    for unique_id, pin in pairs( active_pins ) do
        -- delta + offset rotation
        local dx = (pin[X] * zone_w) - x
        local dy = (pin[Y] * zone_h) - y

        local pin_x =  dx*cos - dy*sin
        local pin_y = -dx*sin - dy*cos

        local size = icon_size * (1 - pin_y/radius * icon_depth)
        pin:SetWidth( size )
        pin:SetHeight( size )
        pin:SetPoint( "BOTTOM", hud, "CENTER", pin_x*scale, pin_y*y_compression*scale )
        pin[TEXTURE]:SetAlpha( icon_alpha )

        if pin_x*pin_x+pin_y*pin_y < radius2 then
            pin:Show()
            pin[KEEP] = true
            -- for depth
            pin[DEPTH] = pin_y
            tinsert( depth_table, pin )
        else
            pin:Hide()
            pin[KEEP] = false
        end
    end

    -- sort by depth and apply framelevels from 1-#visible nodes
    table.sort( depth_table, depth_sort )
    for i = 1, #depth_table do depth_table[i]:SetFrameLevel( i ) end

    N_indicator:SetPoint( "BOTTOM", hud, "CENTER", radius*sin*scale, radius*cos*y_compression*scale)

    -- Start Routes support code
    if Routes and RoutesHud and settings.show_routes and zone then
        Routes.G:HideLines(RoutesHud)
        RoutesHud:SetWidth(hud_width)
        RoutesHud:SetHeight(hud_height)
        for route_name, route_data in pairs( Routes.db.global.routes[ Routes.zoneData[zone][4] ] ) do
            if type(route_data) == "table" and type(route_data.route) == "table" and #route_data.route > 1 then
                -- store color/width
                local defaults = Routes.db.global.defaults
                local width = route_data.width_minimap or defaults.width_minimap
                local color = route_data.color or defaults.color

                -- unless we show hidden
                if (not route_data.hidden and (route_data.visible or not defaults.use_auto_showhide)) or defaults.show_hidden then
                    -- use this special color
                    if route_data.hidden then
                        color = defaults.hidden_color
                    end

                    -- some state data
                    local last_x = nil
                    local last_y = nil
                    local last_x2, last_y2
                    local last_inside = nil

                    -- if we loop - make sure the 'last' gets filled with the right info
                    if route_data.looped and route_data.route[ #route_data.route ] ~= defaults.fake_point then
                        local coord = route_data.route[ #route_data.route ]
                        last_x, last_y = floor(coord / 10000) / 10000, (coord % 10000) / 10000
                        -- scale to zone and adjust coordinate
                        last_x = (last_x * zone_w) - x
                        last_y = (last_y * zone_h) - y
                        -- rotate coordinate
                        last_x, last_y = last_x*cos - last_y*sin, -(last_x*sin + last_y*cos)
                        -- check inside/outside Hud
                        last_x2, last_y2 = last_x*last_x, last_y*last_y
                        last_inside = last_x2 + last_y2 < radius2
                    end
                    for i = 1, #route_data.route do
                        local point = route_data.route[i]
                        local cur_x, cur_y, cur_inside
                        local cur_x2, cur_y2

                        -- if we have a 'fake point' (gap) - clear current values
                        if point == defaults.fake_point then
                            cur_x, cur_y = nil, nil
                            cur_inside = false
                        else
                            cur_x, cur_y = floor(point / 10000) / 10000, (point % 10000) / 10000
                            -- scale to zone and adjust coordinate
                            cur_x = (cur_x * zone_w) - x
                            cur_y = (cur_y * zone_h) - y
                            -- rotate coordinate
                            cur_x, cur_y = cur_x*cos - cur_y*sin, -(cur_x*sin + cur_y*cos)
                            -- check inside/outside Hud
                            cur_x2, cur_y2 = cur_x*cur_x, cur_y*cur_y
                            cur_inside = cur_x2 + cur_y2 < radius2

                            local draw_sx, draw_sy = last_x, last_y
                            local draw_ex, draw_ey = cur_x, cur_y
                            -- Find intersection point of line and circle if necessary
                            if cur_inside and not last_inside then
                                local a, b, c, t
                                local dx = last_x - cur_x
                                local dy = last_y - cur_y
                                a = dx*dx + dy*dy -- a, b and c are the coefficients of a quadratic equation
                                b = 2*last_x*dx + 2*last_y*dy
                                c = last_x2 + last_y2 - radius2
                                t = (-b + (b*b - 4*a*c)^0.5) / (2*a) -- positive answer of the quadratic equation
                                draw_sx = last_x + dx*t -- apply the value of t to the parametric equation of the line
                                draw_sy = last_y + dy*t -- (last_x, last_y)-(cur_x, cur_y) to get the intersection point
                            elseif last_inside and not cur_inside then
                                local a, b, c, t
                                local dx = cur_x - last_x
                                local dy = cur_y - last_y
                                a = dx*dx + dy*dy
                                b = 2*last_x*dx + 2*last_y*dy
                                c = last_x2 + last_y2 - radius2
                                t = (-b + (b*b - 4*a*c)^0.5) / (2*a)
                                draw_ex = last_x + dx*t
                                draw_ey = last_y + dy*t
                            elseif not last_inside and not cur_inside then
                                -- This checks for the possible case where both points are outside
                                -- the circle, but the line cuts through the circle.
                                draw_sx = nil -- assume we don't need to draw the line first
                                local a, b, c, d, t, t2
                                local dx = cur_x - last_x
                                local dy = cur_y - last_y
                                a = dx*dx + dy*dy
                                b = 2*last_x*dx + 2*last_y*dy
                                c = last_x2 + last_y2 - radius2
                                d = b*b - 4*a*c -- discriminant
                                if d >= 0 then
                                    t = (-b + (d)^0.5) / (2*a)
                                    t2 = (-b - (d)^0.5) / (2*a)
                                    if t >=0 and t <= 1 and t2 >= 0 and t2 <= 1 then
                                        -- we need to draw this line as the parametric equation
                                        -- satisfies t = [0,1] range to be between the line segments
                                        draw_ex = last_x + dx*t
                                        draw_ey = last_y + dy*t
                                        draw_sx = last_x + dx*t2
                                        draw_sy = last_y + dy*t2
                                    end
                                end
                            end

                            if draw_sx then
                                -- apply Hud Scaling + linear translation to transform coord to DrawLines coordinate system
                                draw_sx = draw_sx*scale + hud_width / 2
                                draw_sy = draw_sy*y_compression*scale + hud_height / 2
                                draw_ex = draw_ex*scale + hud_width / 2
                                draw_ey = draw_ey*y_compression*scale + hud_height / 2
                                Routes.G:DrawLine(RoutesHud, draw_sx, draw_sy, draw_ex, draw_ey, width, color, "ARTWORK")
                            end
                        end

                        -- store last point
                        last_x, last_y = cur_x, cur_y
                        last_x2, last_y2 = cur_x2, cur_y2
                        last_inside = cur_inside
                    end
                end
            end
        end
    end
    -- End Routes support code

end

function GatherHud.UpdateVisibility()
    if db.settings.enabled then
        force_fullupdate = true
    end
end


--------------------------------------------------------------------------
-- options table

local KeybindHelper = {}
do
    local t = {}
    function KeybindHelper:MakeKeyBindingTable(...)
        for k in pairs(t) do t[k] = nil end
        for i = 1, select("#", ...) do
            local key = select(i, ...)
            if key ~= "" then
                tinsert(t, key)
            end
        end
        return t
    end
end

local options = {
    type = "group",
    name = L["GatherHud"],
    desc = L["GatherHud"],
    order = 190,
    get = function(k) return db.settings[k.arg] end,
    set = function(k, v) db.settings[k.arg] = v; GatherHud:IterativeUpdate(true) end,
    args = {
        desc = {
            name = L["GATHERHUD_DESC"],
            type = "description",
            order = 0,
        },
        enabled = {
            name = L["Enable GatherHud"],
            desc = L["Enable or disable GatherHud"],
            type = "toggle",
            arg = "enabled",
            order = 1,
            set = function(info, v)
                db.settings.enabled = v
                if v then GatherHud:Enable() else GatherHud:Disable() end
            end,
            disabled = false,
        },
        togglekey = {
            name = L["Keybind to toggle GatherHud"],
            desc = L["Keybind to toggle GatherHud"],
            type = "keybinding",
            get = function(info)
                return table.concat(KeybindHelper:MakeKeyBindingTable(GetBindingKey("TOGGLEGATHERHUD")), ", ")
            end,
            set = function(info, key)
                if key == "" then
                    local t = KeybindHelper:MakeKeyBindingTable(GetBindingKey("TOGGLEGATHERHUD"))
                    for i = 1, #t do
                        SetBinding(t[i])
                    end
                else
                    local oldAction = GetBindingAction(key)
                    local frame = LibStub("AceConfigDialog-3.0").OpenFrames["GatherMate"] or LibStub("AceConfigDialog-3.0").OpenFrames["GatherHud"]
                    if frame then
                        if ( oldAction ~= "" and oldAction ~= "TOGGLEGATHERHUD" ) then
                            frame:SetStatusText(KEY_UNBOUND_ERROR:format(GetBindingText(oldAction, "BINDING_NAME_")))
                        else
                            frame:SetStatusText(KEY_BOUND)
                        end
                    end
                    SetBinding(key, "TOGGLEGATHERHUD")
                end
                SaveBindings(GetCurrentBindingSet())
            end,
            order = 2,
        },
        hud_group = {
            name = L["GatherHud Options"], type = "group",
            desc = L["GatherHud Options"],
            disabled = function(info) return not GatherHud:IsEnabled() end,
            inline = true,
            order = 10,
            args = {
                hud_x = {
                    name = L["Hud X-Position"], type = "range",
                    desc = L["The X offset coordinate of the hud from the center of the screen"],
                    min = -800, max = 800, step = 1,
                    arg = "hud_x",
                    set = function(info, v)
                        db.settings.hud_x = v
                        hud:SetPoint("CENTER", UIParent, db.settings.hud_x, db.settings.hud_y )
                        GatherHud:DrawVisualBorder()
                    end,
                    order = 10,
                },
                hud_y = {
                    name = L["Hud Y-Position"], type = "range",
                    desc = L["The Y offset coordinate of the hud from the center of the screen"],
                    min = -600, max = 600, step = 1,
                    arg = "hud_y",
                    set = function(info, v)
                        db.settings.hud_y = v
                        hud:SetPoint("CENTER", UIParent, db.settings.hud_x, db.settings.hud_y )
                        GatherHud:DrawVisualBorder()
                    end,
                    order = 20,
                },
                hud_width = {
                    name = L["Hud Width"], type = "range",
                    desc = L["The pixel width of the hud. In effect, this controls the scaling of the entire hud"],
                    min = 1, max = 1600, step = 1,
                    arg = "hud_width",
                    set = function(info, v)
                        db.settings.hud_width = v
                        GatherHud:IterativeUpdate(true)
                        GatherHud:DrawVisualBorder()
                    end,
                    order = 30,
                },
                hud_alpha = {
                    name = L["Hud Alpha"], type = "range",
                    desc = L["The alpha transparency of the hud"],
                    min = 0.25, max = 1, step = 0.01,
                    arg = "hud_alpha",
                    set = function(info, v)
                        db.settings.hud_alpha = v
                        hud:SetAlpha(v)
                    end,
                    order = 40,
                },
                radius = {
                    name = L["Hud map radius"], type = "range",
                    desc = L["The radius in yards the hud will draw nodes for from your position"],
                    min = 1, max = 3600, step = 1,
                    arg = "radius",
                    order = 60,
                    set = function(info, v)
                        db.settings.radius = v
                        GatherHud:FullUpdate(true)
                        GatherHud:DrawVisualBorder()
                    end,
                },
                linebreak = {
                    name = "",
                    type = "description",
                    order = 70,
                },
                show_circle = {
                    name = L["Show Hud circle"], type = "toggle",
                    desc = L["Displays a circle border representing the drawing area of the hud"],
                    arg = "show_circle",
                    set = function(info, v)
                        db.settings.show_circle = v
                        if v and not in_instance then
                            visual_border:Show()
                        else
                            visual_border:Hide()
                        end
                    end,
                    order = 110,
                },
                show_north = {
                    name = L["Show North indicator"], type = "toggle",
                    desc = L["Displays a letter N on the border of the hud circle to indicate the North direction"],
                    arg = "show_north",
                    set = function(info, v)
                        db.settings.show_north = v
                        if v and not in_instance then
                            N_indicator:Show()
                        else
                            N_indicator:Hide()
                        end
                    end,
                    order = 120,
                },
                use_char_pitch = {
                    name = L["Use Character Pitch"], type = "toggle",
                    desc = L["Use the Character pitch instead of a user-specified angle"],
                    arg = "use_char_pitch",
                    set = function(info, v)
                        db.settings.use_char_pitch = v
                        GatherHud:IterativeUpdate(true)
                        GatherHud:DrawVisualBorder()
                        GatherHud:DrawSelf()
                    end,
                    order = 135,
                },
                angleofview = {
                    name = L["Angle of view"], type = "group",
                    desc = L["Angle of view"],
                    inline = true,
                    order = 140,
                    args = {
                        use_min_pitch = {
                            name = L["Use Minimum Pitch"], type = "toggle",
                            desc = L["Use Minimum Pitch"],
                            arg = "use_min_pitch",
                            set = function(info, v)
                                db.settings.use_min_pitch = v
                                GatherHud:IterativeUpdate(true)
                                GatherHud:DrawVisualBorder()
                                GatherHud:DrawSelf()
                            end,
                            disabled = function() return not GatherHud:IsEnabled() end,
                            order = 1,
                        },
                        min_pitch = {
                            name = L["Minimum Pitch"], type = "range",
                            desc = L["Do not allow the GatherHud camera pitch to go below this angle"],
                            min = -90, max = 90, step = 1,
                            arg = "min_pitch",
                            set = function(info, v)
                                db.settings.min_pitch = v
                                GatherHud:IterativeUpdate(true)
                                GatherHud:DrawVisualBorder()
                                GatherHud:DrawSelf()
                            end,
                            disabled = function() return not db.settings.use_min_pitch or not GatherHud:IsEnabled() end,
                            order = 2,
                        },
                        y_compression = {
                            name = L["Angle of view"], type = "range",
                            desc = L["The angle of elevation from the horizontal plane to view the hud at"],
                            min = 0, max = 90, step = 1,
                            arg = "y_compression",
                            set = function(info, v)
                                db.settings.y_compression = v
                                GatherHud:IterativeUpdate(true)
                                GatherHud:DrawVisualBorder()
                                GatherHud:DrawSelf()
                            end,
                            disabled = function() return not GatherHud:IsEnabled() end,
                            order = 3,
                        },
                    },
                },
            },
        },
        icons_group = {
            name = L["GatherHud Icon Options"], type = "group",
            desc = L["GatherHud Icon Options"],
            disabled = function(info) return not GatherHud:IsEnabled() end,
            inline = true,
            order = 20,
            args = {
                icon_size = {
                    name = L["Icon size"], type = "range",
                    desc = L["The size of the icons displayed in the hud"],
                    min = 1, max = 32, step = 1,
                    arg = "icon_size",
                    set = function(info, v)
                        db.settings.icon_size = v
                        GatherHud:DrawSelf()
                        GatherHud:IterativeUpdate(true)
                    end,
                    order = 70,
                },
                icon_depth = {
                    name = L["Icon depth effect"], type = "range",
                    desc = L["A depth effect that controls how much the size of the icons changes for nodes in the near and far distance"],
                    min = 0, max = 1, step = 0.01,
                    arg = "icon_depth",
                    order = 80,
                },
                icon_alpha = {
                    name = L["Icon alpha"], type = "range",
                    desc = L["The alpha transparency of the icons"],
                    min = 0, max = 1, step = 0.01,
                    arg = "icon_alpha",
                    order = 90,
                },
                self_color = {
                    name = L["Self color"], type = "color",
                    desc = L["The color of the small circle that represents yourself in the center of the hud"],
                    hasAlpha = true,
                    set = function( info, r, g, b, a )
                        local c = db.settings.self_color
                        c[1] = r; c[2] = g; c[3] = b; c[4] = a
                        GatherHud:DrawSelf()
                    end,
                    get = function( info ) return unpack( db.settings.self_color ) end,
                    order = 100,
                },
            },
        },
        routes_group = {
            name = L["GatherHud Routes Support"], type = "group",
            desc = L["GatherHud Routes Support"],
            disabled = function(info) return not (GatherHud:IsEnabled() and Routes and RoutesHud) end,
            inline = true,
            order = 30,
            args = {
                show_routes = {
                    name = L["Show Routes in the hud"], type = "toggle",
                    desc = L["Show Routes in the hud"],
                    arg = "show_routes",
                    set = function(info, v)
                        db.settings.show_routes = v
                        if Routes and RoutesHud then
                            if v then RoutesHud:Show() else RoutesHud:Hide() end
                        end
                    end,
                    order = 10,
                },
            },
        },
    },
}

function GatherHud:DrawSelf()
    selficon:SetWidth( db.settings.icon_size )
    selficon:SetHeight( db.settings.icon_size * math_sin(db.settings.y_compression * rad_to_deg) + 1 )
    selficon:SetPoint( "CENTER", hud, "CENTER", 0, 0 )
    selficon:SetVertexColor( unpack( db.settings.self_color ))
    selficon:Show()
end

function GatherHud:DrawVisualBorder()
    visual_border:SetWidth( db.settings.hud_width )
    visual_border:SetHeight( db.settings.hud_width * math_sin(db.settings.y_compression * rad_to_deg) + 1 )
    visual_border:Show()

    -- ignore updates for 2 seconds - after that hide it again
    last_update = 0
end

function GatherHud:ConfigChanged()
    -- force a full update pin redrawing update by changing the last_zone to nil and setting elapsed to larger than 2
    last_zone = nil
    last_update = 2
end

function GatherHud:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("GatherHudDB", defaults)
    db = self.db.global

    LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("GatherHud", options)
    self:RegisterChatCommand(L["gatherhud"], function() LibStub("AceConfigDialog-3.0"):Open("GatherHud") end)

    -- Register our options table with GatherMate's Config
    local Config = GatherMate:GetModule("Config")
    Config:RegisterModule("GatherHud", options)

    self:RegisterMessage("GatherMateConfigChanged", "ConfigChanged")
    self:RegisterEvent("ADDON_LOADED")
end

-- Workaround for IsAddOnLoaded(), OptDep, ReqDep and LoadAddOn() bugs
function GatherHud:ADDON_LOADED(event, addon)
    if addon == "Routes" then
        if not RoutesHud then
            RoutesHud = CreateFrame("Frame", nil, hud)
            RoutesHud:SetPoint( "CENTER", hud, "CENTER", 0, 0 )
            RoutesHud:SetFrameStrata("LOW")
            RoutesHud:EnableMouse(nil)
        end
    end
end

function GatherHud:OnEnable()
    hud:SetPoint( "CENTER", UIParent, "CENTER", db.settings.hud_x, db.settings.hud_y )
    hud:SetScale( db.settings.hud_scale )
    hud:SetAlpha( db.settings.hud_alpha )
    visual_border:SetWidth( db.settings.hud_width )
    visual_border:SetHeight( db.settings.hud_width * math_sin(db.settings.y_compression * rad_to_deg) + 1 )
    if db.settings.show_circle then visual_border:Show() else visual_border:Hide() end
    if db.settings.show_north then N_indicator:Show() else N_indicator:Hide() end
    if Routes then
        self:ADDON_LOADED(nil, "Routes")
        if db.settings.show_routes then RoutesHud:Show() else RoutesHud:Hide() end
    end
    if db.settings.enabled then
        force_fullupdate = true
        if not self.hooked then
            hooksecurefunc(GatherMate:GetModule("Display"), "UpdateVisibility", GatherHud.UpdateVisibility)
            self.hooked = true
        end
        hud:Show()
        update:Show()
        self:DrawSelf()
        DEFAULT_CHAT_FRAME:AddMessage(L["Gather HUD: "] .. "|c0033FF33" .. L["Enabled"] .. "|r", 0.25, 1.0, 0.75);
    else
        self:Disable()
        DEFAULT_CHAT_FRAME:AddMessage(L["Gather HUD: "] .. "|c00FF3333" .. L["Disabled"] .. "|r", 0.25, 1.0, 0.75);
    end
end

function GatherHud:OnDisable()
    hud:Hide()
    update:Hide()
    DEFAULT_CHAT_FRAME:AddMessage(L["Gather HUD: "] .. "|c00FF3333" .. L["Disabled"] .. "|r", 0.25, 1.0, 0.75);
end

-- vim: ts=4 noexpandtab
