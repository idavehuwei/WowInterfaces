local _G = getfenv(0)
--[[
    < Arrangements >
    All functions in this part is for arrangement changing,
    funny arrangement function is too big, so put it at the EOF
--]]
-- [[ arrangement ]] --
function zBarT:UpdateLayouts()
    local name = self:GetName()
    -- get the button spacing
    if not zBar3Data[name].inset then
        zBar3Data[name].inset = 6
    end
    local value = zBar3Data[name]
    if not value.num or value.num < 2 then return end
    -- check free style first
    if value.layout == "free" then
        self:SetFree()
        return
    end
    -- if not free style then reset and release
    zBar3Data[self:GetName()].buttons = {}
    self:ResetButtonScales(value.num)
    -- call function for arrangement changing
    if value.layout == "line" then
        self:SetLineNum()
    elseif value.layout == "suite1" then
        self:SetSuite(value.layout)
    elseif value.layout == "suite2" then
        self:SetSuite(value.layout)
    elseif value.layout == "circle" then
        self:SetCircle()
    end
end

function zBarT:ResetButtonScales(num)
    for i = 2, num do
        _G[zBar3.buttons[self:GetName()..i]]:SetScale(1)
    end
end

-- local func, for points settings
local function SetButtonPoint(bar,index,point,referIndex,relativePoint,offx,offy)
    local button = _G[zBar3.buttons[bar:GetName()..index]]
    button:ClearAllPoints()
    button:SetPoint(point,zBar3.buttons[bar:GetName()..referIndex],relativePoint,offx,offy)
end

--~ line arrangement
function zBarT:SetLineNum()
    local value = zBar3Data[self:GetName()]
    local inset = value.inset

    if not value.linenum or value.linenum == 0 then
        zBar3Data[self:GetName()].linenum = 1
    end
    if self == zMicroBar then
        inset = inset - 2
    end

    -- loop to settle every button
    local cur_id
    -- row
    for i = 1, ceil(value.num/value.linenum) do
        -- column
        for j = 1, value.linenum do
            -- get current button id first
            cur_id = (i-1)*value.linenum + j
            -- break when loop out of index
            if cur_id > value.num then break end

            -- place them one by one
            if cur_id > 1 then -- skip the first button
                if j == 1 then -- first button in each line should be placed to left edge
                    if self == zMicroBar then -- MicroButtons should adjust buttons y-inset
                        SetButtonPoint( self, cur_id, "TOP", cur_id - value.linenum, "BOTTOM", 0, -inset+20)
                    else
                        SetButtonPoint( self, cur_id, "TOP", cur_id - value.linenum, "BOTTOM", 0, -inset)
                    end
                else -- siblings goes my right side
                    if value.invert then -- reverse if is bag bar
                        SetButtonPoint( self, cur_id, "RIGHT", cur_id - 1, "LEFT", -inset, 0)
                    else
                        SetButtonPoint( self, cur_id, "LEFT", cur_id - 1, "RIGHT", inset, 0)
                    end
                end
            end
        end
    end
end

function zBarT:SetCircle()
    local r = 6*zBar3Data[self:GetName()].num + 5*zBar3Data[self:GetName()].inset
    if self:GetID() > 10 then r = r - 16 end
    local n = zBar3Data[self:GetName()].num
    local pai = 3.1415926
    local x, y = 0, 0
    for i = 2, n do
        x = r * math.sin((i-1)*2*pai/n)
        y = x * math.tan((i-1)*pai/n)
        SetButtonPoint(self, i, "CENTER", 1, "CENTER", x, y)
    end
end

function zBarT:SetFree()
    local saves = zBar3Data[self:GetName()]
    local name
    for i = 2, saves.num do
        name = zBar3.buttons[self:GetName()..i]
        if saves.buttons and saves.buttons[name] then
            _G[name]:SetScale(saves.buttons[name].scale or 1)
            if saves.buttons[name].pos then
                SetButtonPoint(self,i,"CENTER",1,"CENTER",saves.buttons[name].pos[1],saves.buttons[name].pos[2])
            end
        end
    end
end

-- invert a point(for suites)
local function Invert(point, k)
    if k > 0 then return point end
    local s = string.gsub(point,"LEFT","RIGHT")
    if s == point then
        s = string.gsub(point,"RIGHT","LEFT")
    end
    return s
end
function zBarT:SetSuite(suitename)
    local inset = zBar3Data[self:GetName()].inset
    local num = zBar3Data[self:GetName()].num
    if num == 1 then return end
    local k = 1
    if zBar3Data[self:GetName()].invert then k = -1 end

    local offX, offY = 0, 0
    if self == zMicroBar then offX, offY = -3, -23 end

    for id, pos in pairs(self[suitename][num]) do
        SetButtonPoint(self, id, Invert(pos[1],k), pos[2], Invert(pos[3],k), k*(inset+offX)*pos[4], (inset+offY)*pos[5])
    end
end

--[[ Data ]]
zBarT.suite1 = {
    [2] = {
        [2] = {"TOPLEFT", 1, "BOTTOMRIGHT", 1, -1},
    },
    [3] = {
        [2] = {"TOPRIGHT", 1, "BOTTOM", -0.5, -1},
        [3] = {"TOPLEFT", 1, "BOTTOM", 0.5, -1},
    },
    [4] = {
        [2] = {"TOP", 1, "BOTTOM", 0, -1},
        [3] = {"RIGHT", 2, "LEFT", -1, 0},
        [4] = {"LEFT", 2, "RIGHT", 1, 0}
    },
    [5] = {
        [2] = {"TOP", 1, "BOTTOM", 0, -1},
        [3] = {"RIGHT", 2, "LEFT", -1, 0},
        [4] = {"LEFT", 2, "RIGHT", 1, 0},
        [5] = {"TOP", 2, "BOTTOM", 0, -1},
    },
    [6] = {
        [2] = {"LEFT", 1, "RIGHT", 1, 0},
        [3] = {"LEFT", 2, "RIGHT", 1, 0},
        [4] = {"TOP", 1, "BOTTOMLEFT", -0.5, -1},
        [5] = {"LEFT", 4, "RIGHT", 1, 0},
        [6] = {"LEFT", 5, "RIGHT", 1, 0},
    },
    [7] = {
        [2] = {"LEFT", 1, "RIGHT", 1, 0},
        [3] = {"TOPRIGHT", 1, "BOTTOM", -0.5, -1},
        [4] = {"LEFT", 3, "RIGHT", 1, 0},
        [5] = {"LEFT", 4, "RIGHT", 1, 0},
        [6] = {"TOPLEFT", 3, "BOTTOM", 0.5, -1},
        [7] = {"LEFT", 6, "RIGHT", 1, 0},
    },
    [8] = {
        [2] = {"LEFT", 1, "RIGHT", 1, 0},
        [3] = {"RIGHT", 1, "BOTTOMLEFT", -1, -0.5},
        [4] = {"TOP", 3, "BOTTOMLEFT", -0.5, -1},
        [5] = {"TOPLEFT", 3, "BOTTOMRIGHT", 1, -1},
        [6] = {"LEFT", 2, "BOTTOMRIGHT", 1, -0.5},
        [7] = {"TOP", 6, "BOTTOMRIGHT", 0.5, -1},
        [8] = {"TOPRIGHT", 6, "BOTTOMLEFT", -1, -1},
    },
    [9] = {
        [2] = {"LEFT", 1, "RIGHT", 1, 0},
        [3] = {"LEFT", 2, "RIGHT", 1, 0},
        [4] = {"TOP", 1, "BOTTOMLEFT", -0.5, -1},
        [5] = {"TOP", 2, "BOTTOM", 0, -1},
        [6] = {"TOP", 3, "BOTTOMRIGHT", 0.5, -1},
        [7] = {"TOPRIGHT", 5, "BOTTOMLEFT", -1, -1},
        [8] = {"LEFT", 7, "RIGHT", 1, 0},
        [9] = {"LEFT", 8, "RIGHT", 1, 0},
    },
    [10] = {
        [2] = {"LEFT", 1, "RIGHT", 1, 0},
        [3] = {"LEFT", 2, "RIGHT", 1, 0},
        [4] = {"TOPRIGHT", 1, "BOTTOM", -0.5, -1},
        [5] = {"LEFT", 4, "RIGHT", 1, 0},
        [6] = {"LEFT", 5, "RIGHT", 1, 0},
        [7] = {"LEFT", 6, "RIGHT", 1, 0},
        [8] = {"TOPLEFT", 4, "BOTTOM", 0.5, -1},
        [9] = {"LEFT", 8, "RIGHT", 1, 0},
        [10] = {"LEFT", 9, "RIGHT", 1, 0},
    },
    [11] = {
        [2] = {"LEFT", 1, "RIGHT", 1, 0},
        [3] = {"LEFT", 2, "RIGHT", 1, 0},
        [4] = {"LEFT", 3, "RIGHT", 1, 0},
        [5] = {"TOPLEFT", 1, "BOTTOM", 0.5, -1},
        [6] = {"LEFT", 5, "RIGHT", 1, 0},
        [7] = {"LEFT", 6, "RIGHT", 1, 0},
        [8] = {"TOPRIGHT", 5, "BOTTOM", -0.5, -1},
        [9] = {"LEFT", 8, "RIGHT", 1, 0},
        [10] = {"LEFT", 9, "RIGHT", 1, 0},
        [11] = {"LEFT", 10, "RIGHT", 1, 0},
    },
    [12] = {},
}
for i = 2, 12 do
    table.insert(zBarT.suite1[12], i, {"LEFT",i-1,"RIGHT",0, i*0.1 * math.pow(1.05,i-1) })
end
zBarT.suite2 = {
    [2] = {
        [2] = {"TOPRIGHT", 1, "BOTTOMLEFT", -1, -1},
    },
    [3] = {
        [2] = {"LEFT", 1, "RIGHT", 1, 0},
        [3] = {"TOP", 1, "BOTTOMRIGHT", 0.5, -1},
    },
    [4] = {
        [2] = {"TOP", 1, "BOTTOM", 0, -1},
        [3] = {"RIGHT", 1, "LEFT", -1, 0},
        [4] = {"LEFT", 1, "RIGHT", 1, 0},
    },
    [5] = {
        [3] = {"RIGHT", 1, "TOPLEFT", -1, 0.5},
        [2] = {"RIGHT", 1, "BOTTOMLEFT", -1, -0.5},
        [4] = {"LEFT", 1, "TOPRIGHT", 1, 0.5},
        [5] = {"LEFT", 1, "BOTTOMRIGHT", 1, -0.5},
    },
    [6] = {
        [2] = {"TOP", 1, "BOTTOM", 0, -1},
        [3] = {"TOP", 2, "BOTTOM", 0, -1},
        [4] = {"LEFT", 1, "BOTTOMRIGHT", 1, -0.5},
        [5] = {"TOP", 4, "BOTTOM", 0, -1},
        [6] = {"TOP", 5, "BOTTOM", 0, -1},
    },
    [7] = {
        [2] = {"TOPRIGHT", 1, "LEFT", -1, -0.5},
        [3] = {"TOPLEFT", 1, "RIGHT", 1, -0.5},
        [4] = {"TOP", 1, "BOTTOM", 0, -1},
        [5] = {"TOPRIGHT", 4, "LEFT", -1, -0.5},
        [6] = {"TOPLEFT", 4, "RIGHT", 1, -0.5},
        [7] = {"TOP", 4, "BOTTOM", 0, -1},
    },
    [8] = {
        [2] = {"LEFT", 1, "RIGHT", 1, 0},
        [3] = {"RIGHT", 1, "TOPLEFT", -1, 0.5},
        [4] = {"BOTTOM", 3, "TOPLEFT", -0.5, 1},
        [5] = {"BOTTOMLEFT", 3, "TOPRIGHT", 1, 1},
        [6] = {"LEFT", 2, "TOPRIGHT", 1, 0.5},
        [7] = {"BOTTOM", 6, "TOPRIGHT", 0.5, 1},
        [8] = {"BOTTOMRIGHT", 6, "TOPLEFT", -1, 1},
    },
    [9] = {
        [2] = {"TOP", 1, "BOTTOM", 0, -1},
        [3] = {"TOP", 2, "BOTTOM", 0, -1},
        [4] = {"RIGHT", 1, "BOTTOMLEFT", -1, -0.5},
        [5] = {"TOP", 4, "BOTTOM", 0, -1},
        [6] = {"RIGHT", 4, "BOTTOMLEFT", -1, -0.5},
        [7] = {"LEFT", 1, "BOTTOMRIGHT", 1, -0.5},
        [8] = {"TOP", 7, "BOTTOM", 0, -1},
        [9] = {"LEFT", 7, "BOTTOMRIGHT", 1, -0.5},
    },
    [10] = {
        [2] = {"RIGHT", 1, "LEFT", -1, 0},
        [3] = {"LEFT", 1, "RIGHT", 1, 0},
        [4] = {"TOP", 1, "BOTTOMLEFT", -0.5, -1},
        [5] = {"TOP", 1, "BOTTOMRIGHT", 0.5, -1},
        [6] = {"TOP", 4, "BOTTOM", 0, -1},
        [7] = {"TOP", 5, "BOTTOM", 0, -1},
        [8] = {"TOPRIGHT", 6, "BOTTOM", -0.5, -1},
        [9] = {"LEFT", 8, "RIGHT", 1, 0},
        [10] = {"LEFT", 9, "RIGHT", 1, 0},
    },
    [11] = {
        [2] = {"BOTTOMRIGHT", 1, "LEFT", -1, 0.5},
        [3] = {"BOTTOMRIGHT", 2, "LEFT", -1, 0.5},
        [4] = {"BOTTOMRIGHT", 3, "TOP", -0.5, 1},
        [5] = {"BOTTOMRIGHT", 4, "TOP", -0.5, 1},
        [6] = {"BOTTOMLEFT", 5, "TOP", 0.5, 1},
        [7] = {"BOTTOMLEFT", 1, "RIGHT", 1, 0.5},
        [8] = {"BOTTOMLEFT", 7, "RIGHT", 1, 0.5},
        [9] = {"BOTTOMLEFT", 8, "TOP", 0.5, 1},
        [10] = {"BOTTOMLEFT", 9, "TOP", 0.5, 1},
        [11] = {"BOTTOMRIGHT", 10, "TOP", -0.5, 1},
    },
    [12] = {},
}
for i = 2, 12 do
    table.insert(zBarT.suite2[12], i, {"LEFT",i-1,"RIGHT",0, - i*0.1 * math.pow(1.05,i-1) })
end
