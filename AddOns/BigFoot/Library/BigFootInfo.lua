local BLInfo_dbdf11f5b07258936fb1c5a31eaa969c = 1;
local BLInfo_1b5523f0adb45c4b8ee51f89ebf6f2b2 = 0;
BInfo = {};
local function BLInfo_fbdc276aab70785831ced75c81d87eff(BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae)
    if (type(BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae) == "table" or type(BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae) == "function" or type(BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae) == "userdata") then
        return nil;
    else
        return true;
    end
end

local function BLInfo_70a5ca76ddc675cf9005c8676813a396(BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae)
    if (not BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae) then
        BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae = "(nil)";
    elseif (not BLInfo_fbdc276aab70785831ced75c81d87eff(BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae)) then
        BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae = "(" .. type(BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae) .. ")";
    end
    return BLInfo_7739b813d90aed43ab9d0eb84ec1c1ae;
end

local function BLInfo_4be49b12d1e293dc17270e7f7c487eb0(BLInfo_c933410cf37b41b19e2f71899bab1b9b, BLInfo_eed0be1c2d5f65980b06b5094460c3c5, ...)
    local BLInfo_e914904fab9d05d3f54d52bfc31a0f3f;
    local BLInfo_efbab3814cee45a006bb3bd137df4a9e;
    local arg = { ... };
    for BLInfo_e914904fab9d05d3f54d52bfc31a0f3f = 1, table.maxn(arg), 1 do
        arg[BLInfo_e914904fab9d05d3f54d52bfc31a0f3f] = BLInfo_70a5ca76ddc675cf9005c8676813a396(arg[BLInfo_e914904fab9d05d3f54d52bfc31a0f3f]);
    end
    if (table.maxn(arg) > 0) then
        BLInfo_efbab3814cee45a006bb3bd137df4a9e = string.format(BLInfo_eed0be1c2d5f65980b06b5094460c3c5, unpack(arg));
    else
        BLInfo_efbab3814cee45a006bb3bd137df4a9e = BLInfo_eed0be1c2d5f65980b06b5094460c3c5;
    end
    if (BLInfo_c933410cf37b41b19e2f71899bab1b9b.BLInfo_f77b0682927f1b0ab7760355cfc6b823) then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00c0c0<" .. BLInfo_c933410cf37b41b19e2f71899bab1b9b.BLInfo_f77b0682927f1b0ab7760355cfc6b823 .. ">|r " .. BLInfo_efbab3814cee45a006bb3bd137df4a9e, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    else
        DEFAULT_CHAT_FRAME:AddMessage(BLInfo_efbab3814cee45a006bb3bd137df4a9e, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    end
end

function BInfo:constructor(BLInfo_6d5e7d83d8358745ae4dcf61d16bd1f3, BLInfo_f77b0682927f1b0ab7760355cfc6b823)
    assert(BLInfo_6d5e7d83d8358745ae4dcf61d16bd1f3 and type(BLInfo_6d5e7d83d8358745ae4dcf61d16bd1f3) == "string", "You must specify a type for using BInfo.");
    assert(BLInfo_6d5e7d83d8358745ae4dcf61d16bd1f3 == "chat", "The type must be \"chat\".");
    self.BLInfo_6d5e7d83d8358745ae4dcf61d16bd1f3 = BLInfo_6d5e7d83d8358745ae4dcf61d16bd1f3;
    self.BLInfo_f77b0682927f1b0ab7760355cfc6b823 = BLInfo_f77b0682927f1b0ab7760355cfc6b823;
end

function BInfo:Print(BLInfo_eed0be1c2d5f65980b06b5094460c3c5, ...)
    local arg = { ... };
    if (self.BLInfo_6d5e7d83d8358745ae4dcf61d16bd1f3 == "chat") then
        BLInfo_4be49b12d1e293dc17270e7f7c487eb0(self, BLInfo_eed0be1c2d5f65980b06b5094460c3c5, unpack(arg));
    end
end

BLibrary:Register(BInfo, "BInfo", BLInfo_dbdf11f5b07258936fb1c5a31eaa969c, BLInfo_1b5523f0adb45c4b8ee51f89ebf6f2b2);
