BLBag_dbdf11f5b07258936fb1c5a31eaa969c = 1;
BLBag_1b5523f0adb45c4b8ee51f89ebf6f2b2 = 0;
BBagClass = {};
BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd = {};
BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933 = {};
BBagClass.BLBag_805a9734c44d6b2d0e1f802812148fb6 = { n = 0 };
BBagClass.BLBag_1d10ffc99e6f0c5b8f70c21b0b307a4a = function(BLBag_d0708241b607c9a9dd1953c812fadfb7)
    BBagClass.BLBag_769fdea28b126ad4dc32d014471ee445();
end
BBagClass.BLBag_411b8aa6d5954c6020f0b9c9e80e847a = CreateFrame("Frame");
BBagClass.BLBag_411b8aa6d5954c6020f0b9c9e80e847a:RegisterEvent("BAG_UPDATE");
BBagClass.BLBag_411b8aa6d5954c6020f0b9c9e80e847a:SetScript("OnEvent", function()
    BBagClass.BLBag_1d10ffc99e6f0c5b8f70c21b0b307a4a(event);
end);

function BBagClass:GetContainerItemInfo(BLBag_96ec47e10d09a5d0491fe767488c7fab, BLBag_5690c3a7efc9d7d57a9a8567658fcf5d)
    if (not BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab]) then
        return;
    end
    local BLBag_2e00ffac12aadb3a1fd865993ec505b9 = BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d];
    if (BLBag_2e00ffac12aadb3a1fd865993ec505b9) then
        return BLBag_2e00ffac12aadb3a1fd865993ec505b9.BLBag_9248008bbb6d0ee7ce13f6ee45680051, BLBag_2e00ffac12aadb3a1fd865993ec505b9.BLBag_3f50417fb16be9b1078eb68d24fa9c26, BLBag_2e00ffac12aadb3a1fd865993ec505b9.BLBag_f60965c86fccd81e8c42e13f66ae86cd, BLBag_2e00ffac12aadb3a1fd865993ec505b9.BLBag_5fb35c5c169c804bc82bd7f93ad8e32f, BLBag_2e00ffac12aadb3a1fd865993ec505b9.BLBag_b6c604ae624e6b0ac0bd07b9fc3a0d40;
    end
end

function BBagClass:GetContainerItemLink(BLBag_96ec47e10d09a5d0491fe767488c7fab, BLBag_5690c3a7efc9d7d57a9a8567658fcf5d)
    local BLBag_2e00ffac12aadb3a1fd865993ec505b9 = BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d];
    if (BLBag_2e00ffac12aadb3a1fd865993ec505b9) then
        return BLBag_2e00ffac12aadb3a1fd865993ec505b9.BLBag_15ad1e501e228eb80be1cc7800ab967d;
    end
end

function BBagClass:GetContainerItemInfoByName(BLBag_1f194f793e9150819d886c66d5bc23b5)
end

function BBagClass.BLBag_769fdea28b126ad4dc32d014471ee445()
    local BLBag_96ec47e10d09a5d0491fe767488c7fab;
    BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd = {};
    BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933 = {};
    for BLBag_96ec47e10d09a5d0491fe767488c7fab = 0, 4, 1 do
        local BLBag_38d60a0d553c27e15d73d894af67ef30 = GetContainerNumSlots(BLBag_96ec47e10d09a5d0491fe767488c7fab);
        local BLBag_5690c3a7efc9d7d57a9a8567658fcf5d;
        for BLBag_5690c3a7efc9d7d57a9a8567658fcf5d = 1, BLBag_38d60a0d553c27e15d73d894af67ef30, 1 do
            local BLBag_9248008bbb6d0ee7ce13f6ee45680051, BLBag_3f50417fb16be9b1078eb68d24fa9c26, locked, BLBag_5fb35c5c169c804bc82bd7f93ad8e32f, BLBag_b6c604ae624e6b0ac0bd07b9fc3a0d40 = GetContainerItemInfo(BLBag_96ec47e10d09a5d0491fe767488c7fab, BLBag_5690c3a7efc9d7d57a9a8567658fcf5d);
            local BLBag_15ad1e501e228eb80be1cc7800ab967d = GetContainerItemLink(BLBag_96ec47e10d09a5d0491fe767488c7fab, BLBag_5690c3a7efc9d7d57a9a8567658fcf5d);
            if (BLBag_9248008bbb6d0ee7ce13f6ee45680051 and BLBag_15ad1e501e228eb80be1cc7800ab967d) then
                if (not BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab]) then
                    BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab] = {};
                end
                if (not BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d]) then
                    BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d] = {};
                end
                BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d].BLBag_a4e435952d7906b01358c3f8f9ff67e8 = BLBag_96ec47e10d09a5d0491fe767488c7fab;
                BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d].BLBag_f5cb07751fccdf339be4192634943a73 = BLBag_5690c3a7efc9d7d57a9a8567658fcf5d;
                BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d].BLBag_9248008bbb6d0ee7ce13f6ee45680051 = BLBag_9248008bbb6d0ee7ce13f6ee45680051;
                BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d].BLBag_3f50417fb16be9b1078eb68d24fa9c26 = BLBag_3f50417fb16be9b1078eb68d24fa9c26;
                BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d].BLBag_f60965c86fccd81e8c42e13f66ae86cd = BLBag_f60965c86fccd81e8c42e13f66ae86cd;
                BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d].BLBag_5fb35c5c169c804bc82bd7f93ad8e32f = BLBag_5fb35c5c169c804bc82bd7f93ad8e32f;
                BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d].BLBag_b6c604ae624e6b0ac0bd07b9fc3a0d40 = BLBag_b6c604ae624e6b0ac0bd07b9fc3a0d40;
                BBagClass.BLBag_2b5e021a23a99f33218554e7ad4a98dd[BLBag_96ec47e10d09a5d0491fe767488c7fab][BLBag_5690c3a7efc9d7d57a9a8567658fcf5d].BLBag_15ad1e501e228eb80be1cc7800ab967d = BLBag_15ad1e501e228eb80be1cc7800ab967d;
                local BLBag_6e4d0db7491d6883f86de390d20dbe5b, BLBag_a2f3972c23a0aa3bd7fb0e9823d918f2, BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5 = string.find(BLBag_15ad1e501e228eb80be1cc7800ab967d, "|c%x+|Hitem:%d+:%d+:%d+:%d+|h%[(.-)%]|h|r");
                if (BLBag_6e4d0db7491d6883f86de390d20dbe5b and BLBag_a2f3972c23a0aa3bd7fb0e9823d918f2) then
                    if (not BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933[BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5]) then
                        BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933[BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5] = {};
                        BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933[BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5].BLBag_824bcdc4b0da422b295c76b3081a2c77 = {};
                        BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933[BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5].BLBag_3f50417fb16be9b1078eb68d24fa9c26 = 0;
                        BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933[BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5].BLBag_9248008bbb6d0ee7ce13f6ee45680051 = BLBag_9248008bbb6d0ee7ce13f6ee45680051;
                        BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933[BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5].BLBag_b6c604ae624e6b0ac0bd07b9fc3a0d40 = BLBag_b6c604ae624e6b0ac0bd07b9fc3a0d40;
                    end
                    local BLBag_fd724fd3c5e25aaf3b4226e1dae5257c = {};
                    BLBag_fd724fd3c5e25aaf3b4226e1dae5257c.BLBag_a4e435952d7906b01358c3f8f9ff67e8 = BLBag_96ec47e10d09a5d0491fe767488c7fab;
                    BLBag_fd724fd3c5e25aaf3b4226e1dae5257c.BLBag_f5cb07751fccdf339be4192634943a73 = BLBag_5690c3a7efc9d7d57a9a8567658fcf5d;
                    BLBag_fd724fd3c5e25aaf3b4226e1dae5257c.BLBag_3f50417fb16be9b1078eb68d24fa9c26 = BLBag_3f50417fb16be9b1078eb68d24fa9c26;
                    BLBag_fd724fd3c5e25aaf3b4226e1dae5257c.BLBag_f60965c86fccd81e8c42e13f66ae86cd = BLBag_f60965c86fccd81e8c42e13f66ae86cd;
                    BLBag_fd724fd3c5e25aaf3b4226e1dae5257c.BLBag_15ad1e501e228eb80be1cc7800ab967d = BLBag_15ad1e501e228eb80be1cc7800ab967d;
                    table.insert(BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933[BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5].BLBag_824bcdc4b0da422b295c76b3081a2c77, BLBag_fd724fd3c5e25aaf3b4226e1dae5257c);
                    BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933[BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5].BLBag_3f50417fb16be9b1078eb68d24fa9c26 = BBagClass.BLBag_f01ad5791b6b784196dc784ee5fb6933[BLBag_74ee062e5ca486b3cb3e6adeb3a08cd5].BLBag_3f50417fb16be9b1078eb68d24fa9c26 + BLBag_3f50417fb16be9b1078eb68d24fa9c26;
                end
            end
        end
    end
end

function BBagClass:constructor()
end

function BLBag_7d1b39aeb4a72b6aadb40ad7b30a276d(self, event, ...)
    if (event == "BAG_UPDATE" or event == "ITEM_LOCK_CHANGED") then
        return;
    end
    if (self.BLBag_db285cef54ab9af4974dd4f4beaa04f3) then
        self.BLBag_db285cef54ab9af4974dd4f4beaa04f3(unpack(arg));
    end
end

function BLBag_773a146def0a4621a8581f012cacc89a(BLBag_411b8aa6d5954c6020f0b9c9e80e847a)
    local BLBag_db285cef54ab9af4974dd4f4beaa04f3 = BLBag_411b8aa6d5954c6020f0b9c9e80e847a:GetScript("OnEvent");
    if (BLBag_db285cef54ab9af4974dd4f4beaa04f3) then
        BLBag_411b8aa6d5954c6020f0b9c9e80e847a.BLBag_db285cef54ab9af4974dd4f4beaa04f3 = BLBag_db285cef54ab9af4974dd4f4beaa04f3;
        BLBag_411b8aa6d5954c6020f0b9c9e80e847a:SetScript("OnEvent", BLBag_7d1b39aeb4a72b6aadb40ad7b30a276d);
    end
end

function BLBag_b483df19e7cc7bfc5cb46a1164a1ef9f(BLBag_411b8aa6d5954c6020f0b9c9e80e847a)
    if (BLBag_411b8aa6d5954c6020f0b9c9e80e847a.BLBag_db285cef54ab9af4974dd4f4beaa04f3) then
        BLBag_411b8aa6d5954c6020f0b9c9e80e847a:SetScript("OnEvent", BLBag_411b8aa6d5954c6020f0b9c9e80e847a.BLBag_db285cef54ab9af4974dd4f4beaa04f3);
        BLBag_411b8aa6d5954c6020f0b9c9e80e847a.BLBag_db285cef54ab9af4974dd4f4beaa04f3 = nil;
    end
end

function BBagClass:BeginBatchPickupItem()
    local BLBag_411b8aa6d5954c6020f0b9c9e80e847a = EnumerateFrames();
    while (BLBag_411b8aa6d5954c6020f0b9c9e80e847a) do
        BLBag_773a146def0a4621a8581f012cacc89a(BLBag_411b8aa6d5954c6020f0b9c9e80e847a);
        BLBag_411b8aa6d5954c6020f0b9c9e80e847a = EnumerateFrames(BLBag_411b8aa6d5954c6020f0b9c9e80e847a);
    end
end

function BBagClass:EndBatchPickupItem()
    local BLBag_411b8aa6d5954c6020f0b9c9e80e847a = EnumerateFrames();
    while (BLBag_411b8aa6d5954c6020f0b9c9e80e847a) do
        BLBag_b483df19e7cc7bfc5cb46a1164a1ef9f(BLBag_411b8aa6d5954c6020f0b9c9e80e847a);
        BLBag_411b8aa6d5954c6020f0b9c9e80e847a = EnumerateFrames(BLBag_411b8aa6d5954c6020f0b9c9e80e847a);
    end
end

function BBagClass:Register(BLBag_5476aae70c60601a68cb69bb64b745fd, BLBag_6aec56fd400c2ff60374decd93586868)
    local BLBag_2c4d7ba2b469535058b6fb0a2afcb303 = {};
    BLBag_2c4d7ba2b469535058b6fb0a2afcb303.object = BLBag_5476aae70c60601a68cb69bb64b745fd;
    BLBag_2c4d7ba2b469535058b6fb0a2afcb303.callback = BLBag_6aec56fd400c2ff60374decd93586868;
    BBagClass.Unregister(self, BLBag_5476aae70c60601a68cb69bb64b745fd);
    table.insert(BBagClass.BLBag_805a9734c44d6b2d0e1f802812148fb6, BLBag_2c4d7ba2b469535058b6fb0a2afcb303);
end

function BBagClass:Unregister(BLBag_5476aae70c60601a68cb69bb64b745fd)
    local __index, BLBag_2c4d7ba2b469535058b6fb0a2afcb303;
    for __index, BLBag_2c4d7ba2b469535058b6fb0a2afcb303 in ipairs(BBagClass.BLBag_805a9734c44d6b2d0e1f802812148fb6) do
        if (BLBag_2c4d7ba2b469535058b6fb0a2afcb303.object == BLBag_5476aae70c60601a68cb69bb64b745fd) then
            table.remove(BBagClass.BLBag_805a9734c44d6b2d0e1f802812148fb6, __index);
            return;
        end
    end
end

BLibrary:Register(BBagClass, "BBagClass", BLBag_dbdf11f5b07258936fb1c5a31eaa969c, BLBag_1b5523f0adb45c4b8ee51f89ebf6f2b2);
BBag = BLibrary:CreateInstance("BBagClass");
