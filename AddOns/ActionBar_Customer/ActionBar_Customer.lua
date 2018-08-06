--
-- Created by IntelliJ IDEA.
-- User: WangHong
-- Date: 2018/8/6
-- Time: 17:16
--

local function ActionBar_Custom_ModKeys(modkeys)
    local modKeys = modkeys;
    modKeys = gsub(modKeys, "CTRL", "C");
    modKeys = gsub(modKeys, "SHIFT", "S");
    modKeys = gsub(modKeys, "ALT", "A");
    modKeys = gsub(modKeys, "STRG", "ST");
    return modKeys;
end

local function ActionBar_Custom_Mouse(tempname)
    local tempName = tempname;
    local localizedName;
    if (tempName == "LeftButton" or tempName == "BUTTON1") then
        tempName = "BUTTON1";
        localizedName = "M-L";
    elseif (tempName == "RightButton" or tempName == "BUTTON2") then
        tempName = "BUTTON2";
        localizedName = "M-R";
        --elseif (tempName == "MiddleButton" or tempName == "BUTTON3") then
        --    tempName = "BUTTON3";
        --    localizedName = "M-M";
    elseif (tempName == "MOUSEWHEELUP") then
        localizedName = "M-U";
    elseif (tempName == "MOUSEWHEELDOWN") then
        localizedName = "M-D";
    elseif (string.match(tempName, "Button%d+") or string.match(tempName, "BUTTON%d+")) then
        local d = string.match(tempName, "%d+");
        localizedName = string.format("M-%d", d);
        if (string.match(tempName, "Button%d+")) then
            tempName = gsub(tempName, "Button", "BUTTON");
        end
    elseif (tempName == "LALT") then
        localizedName = "LA";
    elseif (tempName == "RALT") then
        localizedName = "RA";
    elseif (tempName == "LCTRL") then
        localizedName = "LC";
    elseif (tempName == "RCTRL") then
        localizedName = "RC";
    elseif (tempName == "LSHIFT") then
        localizedName = "LS";
    elseif (tempName == "RSHIFT") then
        localizedName = "RS";
    end

    return localizedName, tempName;
end

local function GetBindingText_Hook(name, prefix, returnAbbr)
    if (not name) then
        return "";
    end
    local tempName = name;
    local i = strfind(name, "-");
    local dashIndex = nil;
    local count = 0;
    while (i) do
        if (not dashIndex) then
            dashIndex = i;
        else
            dashIndex = dashIndex + i;
        end
        count = count + 1;
        tempName = strsub(tempName, i + 1);
        i = strfind(tempName, "-");
    end

    local modKeys = '';
    if (not dashIndex) then
        dashIndex = 0;
    else
        modKeys = strsub(name, 1, dashIndex);

        if (tempName == "CAPSLOCK") then
            gsub(tempName, "CAPSLOCK", "Caps");
        end

        -- replace for all languages
        -- for the "push-to-talk" binding
        modKeys = gsub(modKeys, "LSHIFT", LSHIFT_KEY_TEXT);
        modKeys = gsub(modKeys, "RSHIFT", RSHIFT_KEY_TEXT);
        modKeys = gsub(modKeys, "LCTRL", LCTRL_KEY_TEXT);
        modKeys = gsub(modKeys, "RCTRL", RCTRL_KEY_TEXT);
        modKeys = gsub(modKeys, "LALT", LALT_KEY_TEXT);
        modKeys = gsub(modKeys, "RALT", RALT_KEY_TEXT);

        -- use the SHIFT code if they decide to localize the CTRL further. The token is CTRL_KEY_TEXT
        if (GetLocale() == "deDE") then
            modKeys = gsub(modKeys, "CTRL", "STRG");
        end
        -- Only doing French for now since all the other languages use SHIFT, remove the "if" if other languages localize it
        if (GetLocale() == "frFR") then
            modKeys = gsub(modKeys, "SHIFT", SHIFT_KEY_TEXT);
        end
    end

    if (returnAbbr) then
        if (count > 1) then
            return "·";
        else
            --- Mod-Keys Customer
            modKeys = ActionBar_Custom_ModKeys(modKeys)
        end
    end

    if (not prefix) then
        prefix = "";
    end

    local localizedName;
    --- Mouse Customer
    localizedName, tempName = ActionBar_Custom_Mouse(tempName);

    if (IsMacClient() and not localizedName) then
        -- see if there is a mac specific name for the key
        localizedName = _G[prefix .. tempName .. "_MAC"];
    end
    if (not localizedName) then
        localizedName = _G[prefix .. tempName];
    end
    -- for the "push-to-talk" binding it can be just a modifier key
    if (not localizedName) then
        localizedName = _G[tempName .. "_KEY_TEXT"];
    end
    if (not localizedName) then
        localizedName = tempName;
    end
    return modKeys .. localizedName;
end

local function ActionButton_UpdateHotkeys_Hook(self, actionButtonType)
    local id;
    if (not actionButtonType) then
        actionButtonType = "ACTIONBUTTON";
        id = self:GetID();
    else
        if (actionButtonType == "MULTICASTACTIONBUTTON") then
            id = self.buttonIndex;
        else
            id = self:GetID();
        end
    end

    local hotkey = _G[self:GetName() .. "HotKey"];
    local key = GetBindingKey(actionButtonType .. id) or GetBindingKey("CLICK " .. self:GetName() .. ":LeftButton");

    local text = GetBindingText_Hook(key, "KEY_", 1);
    if (text == "") then
        hotkey:SetText(RANGE_INDICATOR);
        hotkey:SetPoint("TOPLEFT", self, "TOPLEFT", 1, -2);
        hotkey:Hide();
    else
        hotkey:SetText(text);
        hotkey:SetPoint("TOPLEFT", self, "TOPLEFT", -2, -2);
        hotkey:Show();
    end
end

hooksecurefunc("ActionButton_UpdateHotkeys", ActionButton_UpdateHotkeys_Hook)
