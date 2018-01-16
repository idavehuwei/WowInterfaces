local _G = getfenv(0)
--[[
    Usage: zBar3:GetDefault("zMainBar")
    or : zBar3:GetDefault("zMainBar", "pos")
--]]
function zBar3:GetDefault(name, key, subkey)
    local k,v,m,n

    if type(name) == "table" then
        name = name:GetName()
    end

    -- copy
    local set = {}
    for k,v in pairs(zBar3.defaults[name]) do
        if type(v) == "table" then
            set[k] = {}
            for m,n in pairs(v) do
                set[k][m] = n
            end
        else
            set[k] = v
        end
    end

    -- common values
    for k,v in pairs(zBar3.defaults["*"]) do
        if set[k] then
            for m,n in pairs(v) do
                if set[k][m] == nil then set[k][m] = n end
            end
        end
    end

    if key then
        set = set[key]
        if subkey then set = set[subkey] end
    end

    return set
end

-- zBar3 defaults
zBar3.defaults = {
    ["*"] = {saves = {num = 12, inset = 0, layout = "line", linenum = 2, alpha = 1,},},
    ["zExBar1"] = { saves = { num=12,linenum=4,inset=5},pos = {"CENTER",36,72},},
    ["zShadow1"] = { saves = {num=0,linenum=1, max=6,hideTab=true,},pos = {"CENTER",72,72},},
    ["zExBar2"] = { saves = { num=12,linenum=1,inset=5},pos = {"CENTER",-36,72},},
    ["zShadow2"] = { saves = {num=0,linenum=1, max=6,hideTab=true,},pos = {"CENTER",0,72},},

    ["zExBar3"] = { saves = { num=12,linenum=1,inset=5},pos = {"CENTER",108,72},},
    ["zShadow3"] = { saves = {num=0,linenum=1, max=6,hideTab=true,},pos = {"CENTER",144,72},},
    ["zExBar4"] = { saves = { num=12,linenum=1,inset=5},pos = {"CENTER",-108,72},},
    ["zShadow4"] = { saves = {num=0,linenum=1, max=6,hideTab=true,},pos = {"CENTER",-72,72},},

    ["zCastBar"] = {
     saves = {num = 2, max = 2, hideTab=true,},
     pos={"BOTTOM",0,205-24},
    },
}