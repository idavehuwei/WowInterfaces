
function dwGetglobal(name)
    if (type(name) == "string") then
        return _G[name];
    end
    return nil;
end

getglobal = getglobal;
if (getglobal == nil) then
    function getglobal(name)
        if (type(name) == "string") then
            return _G[name];
        end
        return nil;
    end
end