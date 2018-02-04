local BigFootScale_dbdf11f5b07258936fb1c5a31eaa969c = 1
local BigFootScale_1b5523f0adb45c4b8ee51f89ebf6f2b2 = 0
local BScale = {}

local function BigFootScale_391d78be8cd75f94fdabb3c3607320f6(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a, BigFootScale_1346009d8936868590c1d007e3efcfae)
    assert(type(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetFrameType()) == "string", "Invalid <BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a>, the type of BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a must be userdata.")
    BigFootScale_1346009d8936868590c1d007e3efcfae = BigFootScale_1346009d8936868590c1d007e3efcfae or UIParent
    local BigFootScale_4e0a062a388e29d4bf2e9c2dba5d6d18 = BigFootScale_1346009d8936868590c1d007e3efcfae:GetRight() / BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetScale()
    local BigFootScale_4845dcb186992213ddd66d11d248ca10 = BigFootScale_1346009d8936868590c1d007e3efcfae:GetTop() / BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetScale()
    local BigFootScale_0273923d6c5c6a7963a964a97885cb41 = BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetRight()
    local BigFootScale_4d1cba81a5f3aaeb91e0bbb6dd482b32 = BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetTop()
    local BigFootScale_05046f3bd52e7289c52881d983bc7179 = BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetLeft()
    local BigFootScale_79af1dd4b579612573bca88bd9393bca = BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetBottom()
    if (BigFootScale_0273923d6c5c6a7963a964a97885cb41 and BigFootScale_4d1cba81a5f3aaeb91e0bbb6dd482b32 and BigFootScale_05046f3bd52e7289c52881d983bc7179 and BigFootScale_79af1dd4b579612573bca88bd9393bca) then
        local BigFootScale_b254e387cf58e982ba24fcb3e8a63995 = (BigFootScale_0273923d6c5c6a7963a964a97885cb41 > BigFootScale_4e0a062a388e29d4bf2e9c2dba5d6d18 and (BigFootScale_4e0a062a388e29d4bf2e9c2dba5d6d18 - BigFootScale_0273923d6c5c6a7963a964a97885cb41)) or (BigFootScale_05046f3bd52e7289c52881d983bc7179 < 0 and (0 - BigFootScale_05046f3bd52e7289c52881d983bc7179)) or 0
        local BigFootScale_a0f453fd098c0b0fda780f69cda6ffbf = (BigFootScale_4d1cba81a5f3aaeb91e0bbb6dd482b32 > BigFootScale_4845dcb186992213ddd66d11d248ca10 and (BigFootScale_4845dcb186992213ddd66d11d248ca10 - BigFootScale_4d1cba81a5f3aaeb91e0bbb6dd482b32)) or (BigFootScale_79af1dd4b579612573bca88bd9393bca < 0 and (0 - BigFootScale_79af1dd4b579612573bca88bd9393bca)) or 0
        BigFootScale_b254e387cf58e982ba24fcb3e8a63995 = (BigFootScale_b254e387cf58e982ba24fcb3e8a63995 + BigFootScale_05046f3bd52e7289c52881d983bc7179)
        BigFootScale_a0f453fd098c0b0fda780f69cda6ffbf = (BigFootScale_a0f453fd098c0b0fda780f69cda6ffbf + BigFootScale_4d1cba81a5f3aaeb91e0bbb6dd482b32)
        if (BigFootScale_b254e387cf58e982ba24fcb3e8a63995 ~= 0 or BigFootScale_a0f453fd098c0b0fda780f69cda6ffbf ~= 0) then
            BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT", BigFootScale_1346009d8936868590c1d007e3efcfae, "BOTTOMLEFT", BigFootScale_b254e387cf58e982ba24fcb3e8a63995, BigFootScale_a0f453fd098c0b0fda780f69cda6ffbf)
        end
    end
end

function BScale:SetPoint(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a, BigFootScale_7dce5c33f0d4836b30c14f18b2fc43f7, BigFootScale_ca419ffef1b6a70d3765ee23720dcdb7, relativePoint, BigFootScale_b0e97041a98efeaf027801ac5f63b882, BigFootScale_fc1a2e8123dbe055ed6fd6d145898303)
    assert(type(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetFrameType()) == "string", "Invalid <BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a>, the type of BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a must be userdata.")
    local BigFootScale_1346009d8936868590c1d007e3efcfae = BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetParent() or UIParent
    BigFootScale_b0e97041a98efeaf027801ac5f63b882 = BigFootScale_b0e97041a98efeaf027801ac5f63b882 / BigFootScale_1346009d8936868590c1d007e3efcfae:GetScale()
    BigFootScale_fc1a2e8123dbe055ed6fd6d145898303 = BigFootScale_fc1a2e8123dbe055ed6fd6d145898303 / Parnet:GetScale()
    BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint(BigFootScale_7dce5c33f0d4836b30c14f18b2fc43f7, BigFootScale_ca419ffef1b6a70d3765ee23720dcdb7, relativePoint, BigFootScale_b0e97041a98efeaf027801ac5f63b882, BigFootScale_fc1a2e8123dbe055ed6fd6d145898303)
    BigFootScale_391d78be8cd75f94fdabb3c3607320f6(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a, BigFootScale_1346009d8936868590c1d007e3efcfae)
end

local function BigFootScale_e850d39c00b42c6c8a2873ebee73e4a5(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a, BigFootScale_6188847d8059cc6f73041de255401a71)
    if (not (BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetTop() and BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetLeft())) then
        return nil
    end
    local BigFootScale_b254e387cf58e982ba24fcb3e8a63995 = BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetLeft() * BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetScale() / BigFootScale_6188847d8059cc6f73041de255401a71
    local BigFootScale_a0f453fd098c0b0fda780f69cda6ffbf = BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetTop() * BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetScale() / BigFootScale_6188847d8059cc6f73041de255401a71
    return BigFootScale_b254e387cf58e982ba24fcb3e8a63995, BigFootScale_a0f453fd098c0b0fda780f69cda6ffbf
end

function BScale:SetScale(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a, BigFootScale_6188847d8059cc6f73041de255401a71)
    assert(type(BigFootScale_6188847d8059cc6f73041de255401a71) == "number", "Invalid <scale>, the type of scale must be number.")
    assert(type(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:GetFrameType()) == "string", "Invalid <BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a>, the type of BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a must be userdata.")
    local BigFootScale_b254e387cf58e982ba24fcb3e8a63995, BigFootScale_a0f453fd098c0b0fda780f69cda6ffbf = BigFootScale_e850d39c00b42c6c8a2873ebee73e4a5(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a, BigFootScale_6188847d8059cc6f73041de255401a71)
    BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:SetScale(BigFootScale_6188847d8059cc6f73041de255401a71)
    BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:ClearAllPoints() BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", BigFootScale_b254e387cf58e982ba24fcb3e8a63995, BigFootScale_a0f453fd098c0b0fda780f69cda6ffbf)
    BigFootScale_391d78be8cd75f94fdabb3c3607320f6(BigFootScale_411b8aa6d5954c6020f0b9c9e80e847a)
end

function BScale:constructor()
end

BLibrary:Register(BScale, "BScale", BigFootScale_dbdf11f5b07258936fb1c5a31eaa969c, BigFootScale_1b5523f0adb45c4b8ee51f89ebf6f2b2)
