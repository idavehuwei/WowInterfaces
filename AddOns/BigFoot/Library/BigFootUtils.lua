local BUtils_dbdf11f5b07258936fb1c5a31eaa969c = 1
local BUtils_1b5523f0adb45c4b8ee51f89ebf6f2b2 = 0

local function BUtils_6c928cfe25fd7d61ea6c6a5a74d3dbab(self, BUtils_6c5560108ad7aaf47e811081394a00b4)
    local BUtils_6c5560108ad7aaf47e811081394a00b4 = BUtils_6c5560108ad7aaf47e811081394a00b4 or self
    for BUtils_63a9ce6f1eeac72ef41293b7d0303335, BUtils_8d0644c92128c1ff68223fd74ba63b56 in pairs(BUtils_6c5560108ad7aaf47e811081394a00b4) do
        if (type(BUtils_8d0644c92128c1ff68223fd74ba63b56) == "table" and BUtils_8d0644c92128c1ff68223fd74ba63b56 ~= {}) then
            BUtils_6c928cfe25fd7d61ea6c6a5a74d3dbab(self, BUtils_8d0644c92128c1ff68223fd74ba63b56)
        else
            BUtils_6c5560108ad7aaf47e811081394a00b4[BUtils_63a9ce6f1eeac72ef41293b7d0303335] = nil
        end
    end
end

local function BUtils_af50f8226fc9f10691ea4a55c721279b(self, BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_536473f22dedf9f29b94b1004a62b8a0)
    local BUtils_b4d3314490a868cf61f5fbd057900b0b = BUtils_b4d3314490a868cf61f5fbd057900b0b or self
    for BUtils_63a9ce6f1eeac72ef41293b7d0303335, BUtils_8d0644c92128c1ff68223fd74ba63b56 in pairs(BUtils_b4d3314490a868cf61f5fbd057900b0b) do
        if (BUtils_8d0644c92128c1ff68223fd74ba63b56 == BUtils_536473f22dedf9f29b94b1004a62b8a0) then
            table.remove(BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_63a9ce6f1eeac72ef41293b7d0303335)
            return true
        end
    end
    return false
end

local function BUtils_4910621608469538298406410c4cf5db(self, BUtils_6c5560108ad7aaf47e811081394a00b4)
    local BUtils_6c5560108ad7aaf47e811081394a00b4 = BUtils_6c5560108ad7aaf47e811081394a00b4 or self
    local new = {}
    local BUtils_e914904fab9d05d3f54d52bfc31a0f3f, BUtils_8d0644c92128c1ff68223fd74ba63b56 = next(BUtils_6c5560108ad7aaf47e811081394a00b4, nil)
    while BUtils_e914904fab9d05d3f54d52bfc31a0f3f do
        if type(BUtils_8d0644c92128c1ff68223fd74ba63b56) == "table" then
            BUtils_8d0644c92128c1ff68223fd74ba63b56 = BUtils_4910621608469538298406410c4cf5db(self, BUtils_8d0644c92128c1ff68223fd74ba63b56)
        end
        new[BUtils_e914904fab9d05d3f54d52bfc31a0f3f] = BUtils_8d0644c92128c1ff68223fd74ba63b56
        BUtils_e914904fab9d05d3f54d52bfc31a0f3f, BUtils_8d0644c92128c1ff68223fd74ba63b56 = next(BUtils_6c5560108ad7aaf47e811081394a00b4, BUtils_e914904fab9d05d3f54d52bfc31a0f3f)
    end
    return new
end

local function BUtils_04728128b0db839923d4f8e4c1e5b59c(self, BUtils_6c5560108ad7aaf47e811081394a00b4)
    local BUtils_6c5560108ad7aaf47e811081394a00b4 = BUtils_6c5560108ad7aaf47e811081394a00b4 or self
    local n = 0
    for _ in pairs(BUtils_6c5560108ad7aaf47e811081394a00b4) do
        n = n + 1
    end
    return n
end

local function BUtils_c4f83e9657cea77bf7cdeabfcb3c8735(self, BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_a779d9b7ab476e54171df57a19a144dc, BUtils_536473f22dedf9f29b94b1004a62b8a0)
    local BUtils_b4d3314490a868cf61f5fbd057900b0b = BUtils_b4d3314490a868cf61f5fbd057900b0b or self
    for BUtils_63a9ce6f1eeac72ef41293b7d0303335, BUtils_8d0644c92128c1ff68223fd74ba63b56 in ipairs(BUtils_b4d3314490a868cf61f5fbd057900b0b) do
        if (BUtils_8d0644c92128c1ff68223fd74ba63b56 == BUtils_a779d9b7ab476e54171df57a19a144dc) then
            table.insert(BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_63a9ce6f1eeac72ef41293b7d0303335, BUtils_536473f22dedf9f29b94b1004a62b8a0)
            return
        end
    end
    table.insert(BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_536473f22dedf9f29b94b1004a62b8a0)
end

local function BUtils_00fc101d4f1d62af16cc8ba937b2fd74(self, BUtils_3db6a6eba04325a148d9bb6efff2f6a1)
    local rhex, ghex, bhex = string.sub(BUtils_3db6a6eba04325a148d9bb6efff2f6a1, 1, 2), string.sub(BUtils_3db6a6eba04325a148d9bb6efff2f6a1, 3, 4), string.sub(BUtils_3db6a6eba04325a148d9bb6efff2f6a1, 5, 6)
    return tonumber(rhex, 16) / 255, tonumber(ghex, 16) / 255, tonumber(bhex, 16) / 255
end

local function BUtils_1239bf62c5c85eec9019dd060adf5501(BUtils_3ae1f2c4b38d5f7c356b4cdb7c6e4027, BUtils_0f402d7ba502a47a51c410aee99b1ff1, BUtils_a0a053cacf1c8c43346fdc3adb684cb7)
    return string.format("%02x%02x%02x", BUtils_3ae1f2c4b38d5f7c356b4cdb7c6e4027 * 255, BUtils_0f402d7ba502a47a51c410aee99b1ff1 * 255, BUtils_a0a053cacf1c8c43346fdc3adb684cb7 * 255)
end

BUtils = {
    Erase = BUtils_6c928cfe25fd7d61ea6c6a5a74d3dbab,
    Remove = BUtils_af50f8226fc9f10691ea4a55c721279b,
    Clone = BUtils_4910621608469538298406410c4cf5db,
    GetSize = BUtils_04728128b0db839923d4f8e4c1e5b59c,
    tInsert = BUtils_86ab14a84e987e6e268dbd6519808757,
    HexToRGBPerc = BUtils_00fc101d4f1d62af16cc8ba937b2fd74,
    RGBPercToHex = BUtils_1239bf62c5c85eec9019dd060adf5501,
}

function BUtils:constructor()
end

BLibrary:Register(BUtils, "BUtils", BUtils_dbdf11f5b07258936fb1c5a31eaa969c, BUtils_1b5523f0adb45c4b8ee51f89ebf6f2b2)
