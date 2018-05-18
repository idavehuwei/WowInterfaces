--> Copy from Details! Damage Meter framework

local gump = {}
local Loc = LibStub ("AceLocale-3.0"):GetLocale ( "AddonCpuUsage" )
local _
--> lua locals
local _rawset = rawset --> lua local
local _rawget = rawget --> lua local
local _setmetatable = setmetatable --> lua local
local _unpack = unpack --> lua local
local _type = type --> lua local
local _math_floor = math.floor --> lua local
local loadstring = loadstring --> lua local

local cleanfunction = function() end
local PanelMetaFunctions = {}
local APIFrameFunctions
local simple_panel_counter = 1

------------------------------------------------------------------------------------------------------------
--> metatables

    PanelMetaFunctions.__call = function (_table, value)
        --> nothing to do
        return true
    end

------------------------------------------------------------------------------------------------------------
--> members

    --> tooltip
    local gmember_tooltip = function (_object)
        return _object:GetTooltip()
    end
    --> shown
    local gmember_shown = function (_object)
        return _object:IsShown()
    end
    --> backdrop color
    local gmember_color = function (_object)
        return _object.frame:GetBackdropColor()
    end
    --> backdrop table
    local gmember_backdrop = function (_object)
        return _object.frame:GetBackdrop()
    end
    --> frame width
    local gmember_width = function (_object)
        return _object.frame:GetWidth()
    end
    --> frame height
    local gmember_height = function (_object)
        return _object.frame:GetHeight()
    end
    --> locked
    local gmember_locked = function (_object)
        return _rawget (_object, "is_locked")
    end

    local get_members_function_index = {
        ["tooltip"] = gmember_tooltip,
        ["shown"] = gmember_shown,
        ["color"] = gmember_color,
        ["backdrop"] = gmember_backdrop,
        ["width"] = gmember_width,
        ["height"] = gmember_height,
        ["locked"] = gmember_locked,
    }

    PanelMetaFunctions.__index = function (_table, _member_requested)

        local func = get_members_function_index [_member_requested]
        if (func) then
            return func (_table, _member_requested)
        end

        local fromMe = _rawget (_table, _member_requested)
        if (fromMe) then
            return fromMe
        end

        return PanelMetaFunctions [_member_requested]
    end


    --> tooltip
    local smember_tooltip = function (_object, _value)
        return _object:SetTooltip (_value)
    end
    --> show
    local smember_show = function (_object, _value)
        if (_value) then
            return _object:Show()
        else
            return _object:Hide()
        end
    end
    --> hide
    local smember_hide = function (_object, _value)
        if (not _value) then
            return _object:Show()
        else
            return _object:Hide()
        end
    end
    --> backdrop color
    local smember_color = function (_object, _value)
        local _value1, _value2, _value3, _value4 = gump:ParseColors (_value)
        return _object:SetBackdropColor (_value1, _value2, _value3, _value4)
    end
    --> frame width
    local smember_width = function (_object, _value)
        return _object.frame:SetWidth (_value)
    end
    --> frame height
    local smember_height = function (_object, _value)
        return _object.frame:SetHeight (_value)
    end

    --> locked
    local smember_locked = function (_object, _value)
        if (_value) then
            _object.frame:SetMovable (false)
            return _rawset (_object, "is_locked", true)
        else
            _object.frame:SetMovable (true)
            _rawset (_object, "is_locked", false)
            return
        end
    end

    --> backdrop
    local smember_backdrop = function (_object, _value)
        return _object.frame:SetBackdrop (_value)
    end

    --> close with right button
    local smember_right_close = function (_object, _value)
        return _rawset (_object, "rightButtonClose", _value)
    end

    local set_members_function_index = {
        ["tooltip"] = smember_tooltip,
        ["show"] = smember_show,
        ["hide"] = smember_hide,
        ["color"] = smember_color,
        ["backdrop"] = smember_backdrop,
        ["width"] = smember_width,
        ["height"] = smember_height,
        ["locked"] = smember_locked,
        ["close_with_right"] = smember_right_close,
    }

    PanelMetaFunctions.__newindex = function (_table, _key, _value)
        local func = set_members_function_index [_key]
        if (func) then
            return func (_table, _value)
        else
            return _rawset (_table, _key, _value)
        end
    end

------------------------------------------------------------------------------------------------------------
--> methods

--> show & hide
    function PanelMetaFunctions:Show()
        self.frame:Show()

    end
    function PanelMetaFunctions:Hide()
        self.frame:Hide()

    end

-- setpoint
    function PanelMetaFunctions:SetPoint (v1, v2, v3, v4, v5)
        v1, v2, v3, v4, v5 = gump:CheckPoints (v1, v2, v3, v4, v5, self)
        if (not v1) then
            print ("Invalid parameter for SetPoint")
            return
        end
        return self.widget:SetPoint (v1, v2, v3, v4, v5)
    end

-- sizes
    function PanelMetaFunctions:SetSize (w, h)
        if (w) then
            self.frame:SetWidth (w)
        end
        if (h) then
            self.frame:SetHeight (h)
        end
    end

-- clear
    function PanelMetaFunctions:HideWidgets()
        for widgetName, widgetSelf in pairs (self) do
            if (type (widgetSelf) == "table" and widgetSelf.dframework) then
                widgetSelf:Hide()
            end
        end
    end

-- backdrop
    function PanelMetaFunctions:SetBackdrop (background, edge, tilesize, edgesize, tile, left, right, top, bottom)

        if (_type (background) == "boolean" and not background) then
            return self.frame:SetBackdrop (nil)

        elseif (_type (background) == "table") then
            self.frame:SetBackdrop (background)

        else
            local currentBackdrop = self.frame:GetBackdrop() or {edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border", bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", tile=true, tileSize=16, edgeSize=16, insets={left=1, right=0, top=0, bottom=0}}
            currentBackdrop.bgFile = background or currentBackdrop.bgFile
            currentBackdrop.edgeFile = edgeFile or currentBackdrop.edgeFile
            currentBackdrop.tileSize = tilesize or currentBackdrop.tileSize
            currentBackdrop.edgeSize = edgesize or currentBackdrop.edgeSize
            currentBackdrop.tile = tile or currentBackdrop.tile
            currentBackdrop.insets.left = left or currentBackdrop.insets.left
            currentBackdrop.insets.right = left or currentBackdrop.insets.right
            currentBackdrop.insets.top = left or currentBackdrop.insets.top
            currentBackdrop.insets.bottom = left or currentBackdrop.insets.bottom
            self.frame:SetBackdrop (currentBackdrop)
        end
    end

-- backdropcolor
    function PanelMetaFunctions:SetBackdropColor (color, arg2, arg3, arg4)
        if (arg2) then
            self.frame:SetBackdropColor (color, arg2, arg3, arg4 or 1)
        else
            local _value1, _value2, _value3, _value4 = gump:ParseColors (color)
            self.frame:SetBackdropColor (_value1, _value2, _value3, _value4)
        end
    end

-- border color
    function PanelMetaFunctions:SetBackdropBorderColor (color, arg2, arg3, arg4)
        if (arg2) then
            return self.frame:SetBackdropBorderColor (color, arg2, arg3, arg4)
        end
        local _value1, _value2, _value3, _value4 = gump:ParseColors (color)
        self.frame:SetBackdropBorderColor (_value1, _value2, _value3, _value4)
    end

-- frame levels
    function PanelMetaFunctions:GetFrameLevel()
        return self.widget:GetFrameLevel()
    end
    function PanelMetaFunctions:SetFrameLevel (level, frame)
        if (not frame) then
            return self.widget:SetFrameLevel (level)
        else
            local framelevel = frame:GetFrameLevel (frame) + level
            return self.widget:SetFrameLevel (framelevel)
        end
    end

-- frame stratas
    function PanelMetaFunctions:SetFrameStrata()
        return self.widget:GetFrameStrata()
    end
    function PanelMetaFunctions:SetFrameStrata (strata)
        if (_type (strata) == "table") then
            self.widget:SetFrameStrata (strata:GetFrameStrata())
        else
            self.widget:SetFrameStrata (strata)
        end
    end

--> hooks
    function PanelMetaFunctions:SetHook (hookType, func)
        if (func) then
            _rawset (self, hookType.."Hook", func)
        else
            _rawset (self, hookType.."Hook", nil)
        end
    end

------------------------------------------------------------------------------------------------------------
--> scripts

    local OnEnter = function (frame)

    end

    local OnLeave = function (frame)

    end

    local OnHide = function (frame)

    end

    local OnShow = function (frame)

    end

    local OnMouseDown = function (frame, button)
        if (frame.MyObject.OnMouseDownHook) then
            local interrupt = frame.MyObject.OnMouseDownHook (frame, button, frame.MyObject)
            if (interrupt) then
                return
            end
        end

        if (frame.MyObject.container == UIParent) then
            if (not frame.isLocked and frame:IsMovable()) then
                frame.isMoving = true
                frame:StartMoving()
            end

        elseif (not frame.MyObject.container.isLocked and frame.MyObject.container:IsMovable()) then
            if (not frame.isLocked and frame:IsMovable()) then
                frame.MyObject.container.isMoving = true
                frame.MyObject.container:StartMoving()
            end
        end
    end

    local OnMouseUp = function (frame, button)
        if (frame.MyObject.OnMouseUpHook) then
            local interrupt = frame.MyObject.OnMouseUpHook (frame, button, frame.MyObject)
            if (interrupt) then
                return
            end
        end

        if (button == "RightButton" and frame.MyObject.rightButtonClose) then
            frame.MyObject:Hide()
        end

        if (frame.MyObject.container == UIParent) then
            if (frame.isMoving) then
                frame:StopMovingOrSizing()
                frame.isMoving = false
            end
        else
            if (frame.MyObject.container.isMoving) then
                frame.MyObject.container:StopMovingOrSizing()
                frame.MyObject.container.isMoving = false
            end
        end
    end

------------------------------------------------------------------------------------------------------------
--> object constructor
function ACUCreateFrame (parent, w, h, backdrop, backdropcolor, bordercolor, member, name)
    return gump:NewPanel (parent, parent, name, member, w, h, backdrop, backdropcolor, bordercolor)
end

function gump:NewPanel (parent, container, name, member, w, h, backdrop, backdropcolor, bordercolor)

    if (not name) then
        return

    elseif (not parent) then
        parent = UIParent
    end
    if (not container) then
        container = parent
    end

    if (name:find ("$parent")) then
        name = name:gsub ("$parent", parent:GetName())
    end

    local PanelObject = {type = "panel", dframework = true}

    if (member) then
        parent [member] = PanelObject
    end

    if (parent.dframework) then
        parent = parent.widget
    end
    if (container.dframework) then
        container = container.widget
    end

    --> default members:
        --> hooks
        PanelObject.OnEnterHook = nil
        PanelObject.OnLeaveHook = nil
        PanelObject.OnHideHook = nil
        PanelObject.OnShowHook = nil
        PanelObject.OnMouseDownHook = nil
        PanelObject.OnMouseUpHook = nil
        --> misc
        PanelObject.is_locked = true
        PanelObject.container = container
        PanelObject.rightButtonClose = false

    PanelObject.frame = CreateFrame ("frame", name, parent, "ACUPanelTemplate")
    PanelObject.widget = PanelObject.frame

    if (not APIFrameFunctions) then
        APIFrameFunctions = {}
        local idx = getmetatable (PanelObject.frame).__index
        for funcName, funcAddress in pairs (idx) do
            if (not PanelMetaFunctions [funcName]) then
                PanelMetaFunctions [funcName] = function (object, ...)
                    local x = loadstring ( "return _G."..object.frame:GetName()..":"..funcName.."(...)")
                    return x (...)
                end
            end
        end
    end

    PanelObject.frame:SetWidth (w or 100)
    PanelObject.frame:SetHeight (h or 100)

    PanelObject.frame.MyObject = PanelObject

    --> hooks
        PanelObject.frame:SetScript ("OnEnter", OnEnter)
        PanelObject.frame:SetScript ("OnLeave", OnLeave)
        PanelObject.frame:SetScript ("OnHide", OnHide)
        PanelObject.frame:SetScript ("OnShow", OnShow)
        PanelObject.frame:SetScript ("OnMouseDown", OnMouseDown)
        PanelObject.frame:SetScript ("OnMouseUp", OnMouseUp)

    _setmetatable (PanelObject, PanelMetaFunctions)

    if (backdrop) then
        PanelObject:SetBackdrop (backdrop)
    elseif (_type (backdrop) == "boolean") then
        PanelObject.frame:SetBackdrop (nil)
    end

    if (backdropcolor) then
        PanelObject:SetBackdropColor (backdropcolor)
    end

    if (bordercolor) then
        PanelObject:SetBackdropBorderColor (bordercolor)
    end

    return PanelObject
end

------------------------------------------------------------------------------------------------------------------------------------------------
--> chart panel
--f, nil, "$parentTitle", "chart_title", "Chart!", nil, 20, "yellow"
function gump:NewLabel (frame, _, name, member, text, _, size, color)
    local s = frame:CreateFontString (name, "overlay", "GameFontNormal")
    if (color) then
        s:SetTextColor (unpack (color))
    end
    if (member) then
        frame [member] = s
    end
    return s
end

function gump:NewImage (frame, _, w, h, layer, _, _, name)
    local i = frame:CreateTexture (name, layer or "overlay")
    i:SetSize (w or 1, h or 1)
    return i
end

local chart_panel_backdrop = {bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 32, insets = {left = 5, right = 5, top = 5, bottom = 5}}

local chart_panel_align_timelabels = function (self, elapsed_time)

    self.TimeScale = elapsed_time

    local linha = self.TimeLabels [17]
    local minutos, segundos = math.floor (elapsed_time / 60), math.floor (elapsed_time % 60)
    if (segundos < 10) then
        segundos = "0" .. segundos
    end

    if (minutos > 0) then
        if (minutos < 10) then
            minutos = "0" .. minutos
        end
        linha:SetText (minutos .. ":" .. segundos)
    else
        linha:SetText ("00:" .. segundos)
    end

    local time_div = elapsed_time / 16 --786 -- 49.125

    for i = 2, 16 do

        local linha = self.TimeLabels [i]

        local this_time = time_div * (i-1)
        local minutos, segundos = math.floor (this_time / 60), math.floor (this_time % 60)

        if (segundos < 10) then
            segundos = "0" .. segundos
        end

        if (minutos > 0) then
            if (minutos < 10) then
                minutos = "0" .. minutos
            end
            linha:SetText (minutos .. ":" .. segundos)
        else
            linha:SetText ("00:" .. segundos)
        end

    end

end

local chart_panel_set_scale = function (self, amt, func, text)
    if (type (amt) ~= "number") then
        return
    end

    local piece = amt / 1000 / 8

    for i = 1, 8 do
        if (func) then
            self ["dpsamt" .. math.abs (i-9)]:SetText ( func (piece*i) .. (text or ""))
        else
            if (piece*i > 1) then
                self ["dpsamt" .. math.abs (i-9)]:SetText ( floor (piece*i) .. (text or ""))
            else
                self ["dpsamt" .. math.abs (i-9)]:SetText ( format ("%.3f", piece*i) .. (text or ""))
            end
        end
    end
end

local chart_panel_can_move = function (self, can)
    self.can_move = can
end

local chart_panel_overlay_reset = function (self)
    self.OverlaysAmount = 1
    for index, pack in ipairs (self.Overlays) do
        for index2, texture in ipairs (pack) do
            texture:Hide()
        end
    end
end

local chart_panel_reset = function (self)

    self.Graphic:ResetData()
    self.Graphic.max_value = 0

    self.TimeScale = nil
    self.BoxLabelsAmount = 1
    table.wipe (self.GData)
    table.wipe (self.OData)

    for index, box in ipairs (self.BoxLabels) do
        box.check:Hide()
        box.button:Hide()
        box.box:Hide()
        box.text:Hide()
        box.border:Hide()
        box.showing = false
    end

    chart_panel_overlay_reset (self)
end

local chart_panel_enable_line = function (f, thisbox)

    local index = thisbox.index
    local type = thisbox.type

    if (thisbox.enabled) then
        --disable
        thisbox.check:Hide()
        thisbox.enabled = false
    else
        --enable
        thisbox.check:Show()
        thisbox.enabled = true
    end

    if (type == "graphic") then

        f.Graphic:ResetData()
        f.Graphic.max_value = 0

        local max = 0
        local max_time = 0

        for index, box in ipairs (f.BoxLabels) do
            if (box.type == type and box.showing and box.enabled) then
                local data = f.GData [index]

                f.Graphic:AddDataSeries (data[1], data[2], nil, data[3])

                if (data[4] > max) then
                    max = data[4]
                end
                if (data [5] > max_time) then
                    max_time = data [5]
                end
            end
        end

        f:SetScale (max)
        f:SetTime (max_time)

    elseif (type == "overlay") then

        chart_panel_overlay_reset (f)

        for index, box in ipairs (f.BoxLabels) do
            if (box.type == type and box.showing and box.enabled) then

                f:AddOverlay (box.index)

            end
        end

    end
end

local create_box = function (self, next_box)

    local thisbox = {}
    self.BoxLabels [next_box] = thisbox

    local box = gump:NewImage (self.Graphic, nil, 16, 16, "border")

    local text = gump:NewLabel (self.Graphic)

    local border = gump:NewImage (self.Graphic, [[Interface\DialogFrame\UI-DialogBox-Gold-Corner]], 30, 30, "artwork")
    border:SetPoint ("center", box, "center", -3, -4)
    border:SetTexture ([[Interface\DialogFrame\UI-DialogBox-Gold-Corner]])

    local checktexture = gump:NewImage (self.Graphic, [[Interface\Buttons\UI-CheckBox-Check]], 18, 18, "overlay")
    checktexture:SetPoint ("center", box, "center", -1, -1)
    checktexture:SetTexture ([[Interface\Buttons\UI-CheckBox-Check]])

    thisbox.box = box
    thisbox.text = text
    thisbox.border = border
    thisbox.check = checktexture
    thisbox.enabled = true

    local button = CreateFrame ("button", nil, self.Graphic)
    button:SetSize (20, 20)
    button:SetScript ("OnClick", function()
        chart_panel_enable_line (self, thisbox)
    end)
    button:SetPoint ("center", box, "center")

    thisbox.button = button

    thisbox.box:SetPoint ("right", text, "left", -4, 0)

    if (next_box == 1) then
        thisbox.text:SetPoint ("topright", self, "topright", -35, -16)
    else
        thisbox.text:SetPoint ("right", self.BoxLabels [next_box-1].box, "left", -7, 0)
    end

    return thisbox

end

local realign_labels = function (self)

    local width = self:GetWidth() - 108

    local first_box = self.BoxLabels [1]
    first_box.text:SetPoint ("topright", self, "topright", -35, -16)

    local line_width = first_box.text:GetStringWidth() + 26

    for i = 2, #self.BoxLabels do

        local box = self.BoxLabels [i]

        if (box.box:IsShown()) then

            line_width = line_width + box.text:GetStringWidth() + 26

            if (line_width > width) then
                line_width = box.text:GetStringWidth() + 26
                box.text:SetPoint ("topright", self, "topright", -35, -40)
            else
                box.text:SetPoint ("right", self.BoxLabels [i-1].box, "left", -7, 0)
            end
        else
            break
        end
    end

end

local chart_panel_add_label = function (self, color, name, type, number)

    local next_box = self.BoxLabelsAmount
    local thisbox = self.BoxLabels [next_box]

    if (not thisbox) then
        thisbox = create_box (self, next_box)
    end

    self.BoxLabelsAmount = self.BoxLabelsAmount + 1

    thisbox.type = type
    thisbox.index = number

    thisbox.box:SetTexture (unpack (color))
    thisbox.text:SetText (name)

    thisbox.check:Show()
    thisbox.button:Show()
    thisbox.border:Show()
    thisbox.box:Show()
    thisbox.text:Show()

    thisbox.showing = true
    thisbox.enabled = true

    realign_labels (self)

end

local line_default_color = {1, 1, 1}
local draw_overlay = function (self, this_overlay, overlayData, color)

    local pixel = self.Graphic:GetWidth() / self.TimeScale
    local index = 1
    local r, g, b = unpack (color)

    for i = 1, #overlayData, 2 do
        local aura_start = overlayData [i]
        local aura_end = overlayData [i+1]

        local this_block = this_overlay [index]
        if (not this_block) then
            this_block = self.Graphic:CreateTexture (nil, "border")
            tinsert (this_overlay, this_block)
        end
        this_block:SetHeight (self.Graphic:GetHeight())

        this_block:SetPoint ("left", self.Graphic, "left", pixel * aura_start, 0)
        if (aura_end) then
            this_block:SetWidth ((aura_end-aura_start)*pixel)
        else
            --malformed table
            this_block:SetWidth (pixel*5)
        end

        this_block:SetTexture (r, g, b, 0.25)
        this_block:Show()

        index = index + 1
    end

end

local chart_panel_add_overlay = function (self, overlayData, color, name, icon)

    if (not self.TimeScale) then
        error ("Use SetTime (time) before adding an overlay.")
    end

    if (type (overlayData) == "number") then
        local overlay_index = overlayData
        draw_overlay (self, self.Overlays [self.OverlaysAmount], self.OData [overlay_index][1], self.OData [overlay_index][2])
    else
        local this_overlay = self.Overlays [self.OverlaysAmount]
        if (not this_overlay) then
            this_overlay = {}
            tinsert (self.Overlays, this_overlay)
        end

        draw_overlay (self, this_overlay, overlayData, color)

        tinsert (self.OData, {overlayData, color or line_default_color})
        if (name) then
            self:AddLabel (color or line_default_color, name, "overlay", #self.OData)
        end
    end

    self.OverlaysAmount = self.OverlaysAmount + 1
end

local SMA_table = {}
local SMA_max = 0
local reset_SMA = function()
    table.wipe (SMA_table)
    SMA_max = 0
end

local calc_SMA
calc_SMA = function (a, b, ...)
    if (b) then
        return calc_SMA (a + b, ...)
    else
        return a
    end
end

local do_SMA = function (value, max_value)

    if (#SMA_table == 10) then
        tremove (SMA_table, 1)
    end

    SMA_table [#SMA_table + 1] = value

    local new_value = calc_SMA (unpack (SMA_table)) / #SMA_table

    if (new_value > SMA_max) then
        SMA_max = new_value
        return new_value, SMA_max
    else
        return new_value
    end

end

local chart_panel_add_data = function (self, graphicData, color, name, elapsed_time, lineTexture, smoothLevel, firstIndex)

    local f = self
    self = self.Graphic

    local _data = {}
    local max_value = graphicData.max_value
    local amount = #graphicData

    local scaleW = 1/self:GetWidth()

    local content = graphicData
    tinsert (content, 1, 0)
    tinsert (content, 1, 0)
    tinsert (content, #content+1, 0)
    tinsert (content, #content+1, 0)

    local _i = 3

    local graphMaxDps = math.max (self.max_value, max_value)

    if (not smoothLevel) then
        while (_i <= #content-2) do
            local v = (content[_i-2]+content[_i-1]+content[_i]+content[_i+1]+content[_i+2])/5 --> normalize
            _data [#_data+1] = {scaleW*(_i-2), v/graphMaxDps} --> x and y coords
            _i = _i + 1
        end

    elseif (smoothLevel == "SHORT") then
        while (_i <= #content-2) do
            local value = (content[_i] + content[_i+1]) / 2
            _data [#_data+1] = {scaleW*(_i-2), value}
            _data [#_data+1] = {scaleW*(_i-2), value}
            _i = _i + 2
        end

    elseif (smoothLevel == "SMA") then
        reset_SMA()
        while (_i <= #content-2) do
            local value, is_new_max_value = do_SMA (content[_i], max_value)
            if (is_new_max_value) then
                max_value = is_new_max_value
            end
            _data [#_data+1] = {scaleW*(_i-2), value} --> x and y coords
            _i = _i + 1
        end

    elseif (smoothLevel == -1) then
        while (_i <= #content-2) do
            local current = content[_i]

            local minus_2 = content[_i-2] * 0.6
            local minus_1 = content[_i-1] * 0.8
            local plus_1 = content[_i+1] * 0.8
            local plus_2 = content[_i+2] * 0.6

            local v = (current + minus_2 + minus_1 + plus_1 + plus_2)/5 --> normalize
            _data [#_data+1] = {scaleW*(_i-2), v/graphMaxDps} --> x and y coords
            _i = _i + 1
        end

    elseif (smoothLevel == 1) then
        _i = 2
        while (_i <= #content-1) do
            local v = (content[_i-1]+content[_i]+content[_i+1])/3 --> normalize
            _data [#_data+1] = {scaleW*(_i-1), v/graphMaxDps} --> x and y coords
            _i = _i + 1
        end

    elseif (smoothLevel == 2) then
        _i = 1
        while (_i <= #content) do
            local v = content[_i] --> do not normalize
            _data [#_data+1] = {scaleW*(_i), v/graphMaxDps} --> x and y coords
            _i = _i + 1
        end

    end

    tremove (content, 1)
    tremove (content, 1)
    tremove (content, #graphicData)
    tremove (content, #graphicData)

    if (max_value > self.max_value) then
        --> normalize previous data
        if (self.max_value > 0) then
            local normalizePercent = self.max_value / max_value
            for dataIndex, Data in ipairs (self.Data) do
                local Points = Data.Points
                for i = 1, #Points do
                    Points[i][2] = Points[i][2]*normalizePercent
                end
            end
        end

        self.max_value = max_value
        f:SetScale (max_value)

    end

    tinsert (f.GData, {_data, color or line_default_color, lineTexture, max_value, elapsed_time})
    if (name) then
        f:AddLabel (color or line_default_color, name, "graphic", #f.GData)
    end

    if (firstIndex) then
        if (lineTexture) then
            if (not lineTexture:find ("\\") and not lineTexture:find ("//")) then
                local path = string.match (debugstack (1, 1, 0), "AddOns\\(.+)LibGraph%-2%.0%.lua")
                if path then
                    lineTexture = "Interface\\AddOns\\" .. path .. lineTexture
                else
                    lineTexture = nil
                end
            end
        end

        table.insert (self.Data, 1, {Points = _data, Color = color or line_default_color, lineTexture = lineTexture, ElapsedTime = elapsed_time})
        self.NeedsUpdate = true
    else
        self:AddDataSeries (_data, color or line_default_color, nil, lineTexture)
        self.Data [#self.Data].ElapsedTime = elapsed_time
    end

    local max_time = 0
    for _, data in ipairs (self.Data) do
        if (data.ElapsedTime > max_time) then
            max_time = data.ElapsedTime
        end
    end

    f:SetTime (max_time)

end

local chart_panel_onresize = function (self)
    local width, height = self:GetSize()
    local spacement = width - 78 - 60
    spacement = spacement / 16

    for i = 1, 17 do
        local label = self.TimeLabels [i]
        label:SetPoint ("bottomleft", self, "bottomleft", 78 + ((i-1)*spacement), 13)
        label.line:SetHeight (height - 45)
    end

    local spacement = (self.Graphic:GetHeight()) / 8
    for i = 1, 8 do
        self ["dpsamt"..i]:SetPoint ("TOPLEFT", self, "TOPLEFT", 27, -25 + (-(spacement* (i-1))) )
        self ["dpsamt"..i].line:SetWidth (width-20)
    end

    self.Graphic:SetSize (width - 135, height - 67)
    self.Graphic:SetPoint ("topleft", self, "topleft", 108, -35)
end

local chart_panel_vlines_on = function (self)
    for i = 1, 17 do
        local label = self.TimeLabels [i]
        label.line:Show()
    end
end

local chart_panel_vlines_off = function (self)
    for i = 1, 17 do
        local label = self.TimeLabels [i]
        label.line:Hide()
    end
end

local chart_panel_set_title = function (self, title)
    self.chart_title.text = title
end

local chart_panel_mousedown = function (self, button)
    if (button == "LeftButton" and self.can_move) then
        if (not self.isMoving) then
            self:StartMoving()
            self.isMoving = true
        end
    elseif (button == "RightButton" and not self.no_right_click_close) then
        if (not self.isMoving) then
            self:Hide()
        end
    end
end
local chart_panel_mouseup = function (self, button)
    if (button == "LeftButton" and self.isMoving) then
        self:StopMovingOrSizing()
        self.isMoving = nil
    end
end

local chart_panel_hide_close_button = function (self)
    self.CloseButton:Hide()
end

local chart_panel_right_click_close = function (self, value)
    if (type (value) == "boolean") then
        if (value) then
            self.no_right_click_close = nil
        else
            self.no_right_click_close = true
        end
    end
end

function CreateACUChartPanel (parent, w, h, name)

    if (not name) then
        name = "ACUPanelNumber" .. gump.PanelCounter
        gump.PanelCounter = gump.PanelCounter + 1
    end

    parent = parent or UIParent
    w = w or 800
    h = h or 500

    local f = CreateFrame ("frame", name, parent)
    f:SetSize (w or 500, h or 400)
    f:EnableMouse (true)
    f:SetMovable (true)

    f:SetScript ("OnMouseDown", chart_panel_mousedown)
    f:SetScript ("OnMouseUp", chart_panel_mouseup)

    f:SetBackdrop (chart_panel_backdrop)
    f:SetBackdropColor (.3, .3, .3, .3)

    local c = CreateFrame ("Button", nil, f, "UIPanelCloseButton")
    c:SetWidth (32)
    c:SetHeight (32)
    c:SetPoint ("TOPRIGHT",  f, "TOPRIGHT", -3, -7)
    c:SetFrameLevel (f:GetFrameLevel()+1)
    c:SetAlpha (0.9)
    f.CloseButton = c

    local title = gump:NewLabel (f, nil, "$parentTitle", "chart_title", "Chart!", nil, 20, {1, 1, 0})
    title:SetPoint ("topleft", f, "topleft", 110, -13)
    --_detalhes:SetFontOutline (title, true)

    local bottom_texture = gump:NewImage (f, nil, 702, 25, "background", nil, nil, "$parentBottomTexture")
    bottom_texture:SetTexture (0, 0, 0, .6)
    bottom_texture:SetPoint ("bottomleft", f, "bottomleft", 8, 7)
    bottom_texture:SetPoint ("bottomright", f, "bottomright", -8, 7)

    f.Overlays = {}
    f.OverlaysAmount = 1

    f.BoxLabels = {}
    f.BoxLabelsAmount = 1

    f.TimeLabels = {}
    for i = 1, 17 do
        local time = f:CreateFontString (nil, "overlay", "GameFontHighlightSmall")
        time:SetText ("00:00")
        time:SetPoint ("bottomleft", f, "bottomleft", 78 + ((i-1)*36), 13)
        f.TimeLabels [i] = time

        local line = f:CreateTexture (nil, "border")
        line:SetSize (1, h-45)
        line:SetTexture (1, 1, 1, .1)
        line:SetPoint ("bottomleft", time, "topright", 0, -10)
        line:Hide()
        time.line = line
    end

    --graphic
        local g = LibStub:GetLibrary("LibGraph-2.0"):CreateGraphLine (name .. "Graphic", f, "topleft","topleft", 108, -35, w - 120, h - 67)
        g:SetXAxis (-1,1)
        g:SetYAxis (-1,1)
        g:SetGridSpacing (false, false)
        g:SetGridColor ({0.5,0.5,0.5,0.3})
        g:SetAxisDrawing (false,false)
        g:SetAxisColor({1.0,1.0,1.0,1.0})
        g:SetAutoScale (true)
        g:SetLineTexture ("smallline")
        g:SetBorderSize ("right", 0.001)
        g:SetBorderSize ("left", 0.000)
        g:SetBorderSize ("top", 0.002)
        g:SetBorderSize ("bottom", 0.001)
        g.VerticalLines = {}
        g.max_value = 0

        g:SetLineTexture ("line")

        f.Graphic = g
        f.GData = {}
        f.OData = {}

    --div lines
        for i = 1, 8, 1 do
            local line = g:CreateTexture (nil, "overlay")
            line:SetTexture (1, 1, 1, .2)
            line:SetWidth (670)
            line:SetHeight (1.1)

            local s = f:CreateFontString (nil, "overlay", "GameFontHighlightSmall")
            f ["dpsamt"..i] = s
            s:SetText ("100k")
            s:SetPoint ("topleft", f, "topleft", 27, -61 + (-(24.6*i)))

            line:SetPoint ("topleft", s, "bottom", -27, 0)
            s.line = line
        end

    f.SetTime = chart_panel_align_timelabels
    f.EnableVerticalLines = chart_panel_vlines_on
    f.DisableVerticalLines = chart_panel_vlines_off
    f.SetTitle = chart_panel_set_title
    f.SetScale = chart_panel_set_scale
    f.Reset = chart_panel_reset
    f.AddLine = chart_panel_add_data
    f.CanMove = chart_panel_can_move
    f.AddLabel = chart_panel_add_label
    f.AddOverlay = chart_panel_add_overlay
    f.HideCloseButton = chart_panel_hide_close_button
    f.RightClickClose = chart_panel_right_click_close

    f:SetScript ("OnSizeChanged", chart_panel_onresize)
    chart_panel_onresize (f)

    return f
end

