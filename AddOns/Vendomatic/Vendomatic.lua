sellframestartindex = 1;
stockframestartindex = 1;

function Vendomatic_OnLoad(frame)
    frame:RegisterEvent("MERCHANT_SHOW");
    frame:RegisterEvent("ADDON_LOADED");
end

SLASH_VENDOMATIC1 = "/vm"
SLASH_VENDOMATIC2 = "/vendomatic"

SlashCmdList["VENDOMATIC"] = function(msg)
    if (msg == "config") then
        VendomaticFrame:Show();
    elseif (msg == "reset") then
        VendomaticFrame:Hide();
        Vendomatic_FirstRun();
        print("|cffffd200Vend-o-matic|r: 全部重置.");
    elseif (msg == "help" or msg == "") then
        print("|cffffd200Vend-o-matic|r Commands");
        print("/vm config - 配置");
        print("/vm reset - 重置所有配置");
        print("/vm help -  命令列表");
        print("/vm hide - 隐藏小地图按钮");
        print("/vm show - 显示小地图按钮");
    elseif (msg == "hide") then
        VendomaticButtonFrame:Hide();
        VendomaticOptions.hideminimapicon = 1;
        print("|cffffd200Vend-o-matic|r: Minimap Button is now hidden");
    elseif (msg == "show") then
        VendomaticButtonFrame:Show();
        VendomaticOptions.hideminimapicon = 0;
    else
        print("|cffffd200Vend-o-matic|r: Minimap Button is now visible");
    end
end

function Vendomatic_OnEvent(frame, event, ...)
    if event == "ADDON_LOADED" then
        if (VendomaticOptions == nil) then
            print("这是你第一次运行 |cffffd200Vend-o-matic|r. 请花一点时间配置一下这个插件.");
            VendomaticOptions = {};
            Vendomatic_FirstRun();
            VendomaticFrame:Show();
        end
        if VendomaticOptions.hideminimapicon == 1 then
            VendomaticButtonFrame:Hide();
        else
            VendomaticButtonFrame:Show();
        end
        startindex = 1;
        if VendomaticOptions.listtype == 0 then
            Vendomatic_OptionsSellFrameToggleButtonText:SetText("|cffff0000保留|r 这些物品");
        else
            Vendomatic_OptionsSellFrameToggleButtonText:SetText("|cff00ff00出售|r 这些物品");
        end
    end
    if event == "MERCHANT_SHOW" then
        if CanMerchantRepair() then
            if (VendomaticOptions.autorepair == 1) then
                Vendomatic_AutoRepair();
            end
        end
        if (VendomaticOptions.autosell == 1) then
            Vendomatic_AutoSell();
        end
        if (VendomaticOptions.autorestock == 1) then
            Vendomatic_AutoRestock();
        end
    end
end

function VendomaticButton_OnEnter(frame)
    GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT", 120, 4);
    GameTooltip:SetText("Vendomatic");
    GameTooltip:AddLine("双击: 显示/隐藏选项框体\n左键点击: 拖动这个图标\n右键点击: 显示装备耐久度信息", 1, 1, 1);
    GameTooltip:Show();
end

function Vendomatic_GreenSellHelp(frame)
    GameTooltip:SetOwner(this, "ANHOR_CURSOR");
    GameTooltip:SetText("Vendomatic");
    GameTooltip:AddLine("自动出售背包中 |cff00ff00绿色|r 的可装备物品.\n使用排除列表来防止一些特殊的物品被卖掉", 1, 1, 1);
    GameTooltip:Show();
end

function Vendomatic_AutoRepair()
    local repaircost = select(1, GetRepairAllCost());
    if (repaircost > 0) then
        if (VendomaticOptions.repairtype == 1) then
            if CanGuildBankRepair() and (VendomaticOptions.guildbankrepair == 1) then
                RepairAllItems(1);
                repaircost = select(1, GetRepairAllCost());
                if (repaircost > 0) then
                    RepairAllItems();
                    print("|cffffd200Vend-o-matic|r: 修理所有物品: " .. GetCoinTextureString(repaircost));
                else
                    print("|cffffd200Vend-o-matic|r: 使用公会资金修理所有物品: " .. GetCoinTextureString(repaircost));
                end
            else
                RepairAllItems();
                print("|cffffd200Vend-o-matic|r: 修理所有物品: " .. GetCoinTextureString(repaircost));
            end
        elseif (VendomaticOptions.repairtype == 2) then
            Vendomatic_RepairConfirmationTextGold:SetText(GetCoinTextureString(repaircost));
            Vendomatic_RepairConfirmation:Show();
        elseif (VendomaticOptions.repairtype == 3) then
            local repairdivide = (repaircost / GetMoney()) * 100;
            if repairdivide > VendomaticOptions.repairthreshold then
                Vendomatic_RepairConfirmationTextGold:SetText(GetCoinTextureString(repaircost));
                Vendomatic_RepairConfirmation:Show();
            else
                if CanGuildBankRepair() and (VendomaticOptions.guildbankrepair == 1) then
                    RepairAllItems(1);
                    repaircost = select(1, GetRepairAllCost());
                    if (repaircost > 0) then
                        RepairAllItems();
                        print("|cffffd200Vend-o-matic|r: 修理所有物品: " .. GetCoinTextureString(repaircost));
                    else
                        print("|cffffd200Vend-o-matic|r: 使用公会资金修理所有物品: " .. GetCoinTextureString(repaircost));
                    end
                else
                    RepairAllItems();
                    print("|cffffd200Vend-o-matic|r: 修理所有物品: " .. GetCoinTextureString(repaircost));
                end
            end
        end
    end
end

function VendoMatic_FrameDragSell()
    local typeinfo, datainfo, secondaryinfo = GetCursorInfo();
    -- Item out of the bag:
    if (typeinfo == "item") then
        local itemtexture = select(10, GetItemInfo(datainfo));
        local itemname = select(1, GetItemInfo(datainfo));
        local frametexture = getglobal("Vendomatic_OptionsSellFrame_DropBoxIconTexture");
        local framename = getglobal("Vendomatic_OptionsSellFrame_DropBoxText");
        frametexture:SetTexture(itemtexture);
        framename:SetWidth(180);
        framename:SetJustifyH("LEFT");
        framename:SetText(itemname);
        ClearCursor();
        -- Item from merchant window
    elseif (typeinfo == "merchant") then
        local itemtexture = select(2, GetMerchantItemInfo(datainfo));
        local itemname = select(1, GetMerchantItemInfo(datainfo));
        local frametexture = getglobal("Vendomatic_OptionsSellFrame_DropBoxIconTexture");
        local framename = getglobal("Vendomatic_OptionsSellFrame_DropBoxText");
        frametexture:SetTexture(itemtexture);
        framename:SetWidth(180);
        framename:SetJustifyH("LEFT");
        framename:SetText(itemname);
        ClearCursor();
    else
        print("|cffffd200Vend-o-matic|r: 不可用的物品");
        ClearCursor();
    end
end

function VendoMatic_FrameDragStock()
    local typeinfo, datainfo, secondaryinfo = GetCursorInfo();
    -- Item out of the bag:
    if (typeinfo == "item") then
        local itemtexture = select(10, GetItemInfo(datainfo));
        local itemname = select(1, GetItemInfo(datainfo));
        local frametexture = getglobal("Vendomatic_OptionsStockFrame_DropBoxIconTexture");
        local framename = getglobal("Vendomatic_OptionsStockFrame_DropBoxText");
        frametexture:SetTexture(itemtexture);
        framename:SetWidth(180);
        framename:SetJustifyH("LEFT");
        framename:SetText(itemname);
        ClearCursor();
        -- Item from merchant window
    elseif (typeinfo == "merchant") then
        local itemtexture = select(2, GetMerchantItemInfo(datainfo));
        local itemname = select(1, GetMerchantItemInfo(datainfo));
        local frametexture = getglobal("Vendomatic_OptionsStockFrame_DropBoxIconTexture");
        local framename = getglobal("Vendomatic_OptionsStockFrame_DropBoxText");
        frametexture:SetTexture(itemtexture);
        framename:SetWidth(180);
        framename:SetJustifyH("LEFT");
        framename:SetText(itemname);
        ClearCursor();
    else
        print("|cffffd200Vend-o-matic|r: 不可用的物品");
        ClearCursor();
    end
end

function Vendomatic_AutoSell()
    local grey_counter = 0;
    local grey_sellprice = 0;
    local grey_totalsale = 0;
    local grey_stackcount = 1;
    local green_sellprice = 0;
    local green_totalsale = 0;
    local green_counter = 0;
    for i = 0, 4 do
        local MaxSlots = GetContainerNumSlots(i);
        for n = 0, MaxSlots do
            local itemid = GetContainerItemID(i, n);
            if (itemid) then
                local quality = select(3, GetItemInfo(itemid));
                if (quality == 0) then
                    local itemname = select(1, GetItemInfo(itemid));
                    if VendomaticOptions["listtype"] == 0 then
                        if not Vendomatic_CheckExceptions(itemname) then
                            grey_stackcount = select(2, GetContainerItemInfo(i, n));
                            grey_sellprice = select(11, GetItemInfo(itemid)) * grey_stackcount;
                            ShowContainerSellCursor(i, n);
                            UseContainerItem(i, n);
                            grey_counter = grey_counter + grey_stackcount;
                            grey_totalsale = grey_totalsale + grey_sellprice;
                        end
                    else
                        if Vendomatic_CheckExceptions(itemname) then
                            grey_stackcount = select(2, GetContainerItemInfo(i, n));
                            grey_sellprice = select(11, GetItemInfo(itemid)) * grey_stackcount;
                            ShowContainerSellCursor(i, n);
                            UseContainerItem(i, n);
                            grey_counter = grey_counter + grey_stackcount;
                            grey_totalsale = grey_totalsale + grey_sellprice;
                        end
                    end
                end
                if (VendomaticOptions.sellgreens == 1) then
                    if ((quality == 2) and IsEquippableItem(itemid)) then
                        local itemname = GetItemInfo(itemid);
                        if VendomaticOptions["listtype"] == 0 then
                            if not Vendomatic_CheckExceptions(itemname) then
                                _, _, _, _, _, _, _, _, _, _, green_sellprice = GetItemInfo(itemid);
                                ShowContainerSellCursor(i, n);
                                UseContainerItem(i, n);
                                green_counter = green_counter + 1;
                                green_totalsale = green_totalsale + green_sellprice;
                            end
                        elseif VendomaticOptions["listtype"] == 1 then
                            if Vendomatic_CheckExceptions(itemname) then
                                _, _, _, _, _, _, _, _, _, _, green_sellprice = GetItemInfo(itemid);
                                ShowContainerSellCursor(i, n);
                                UseContainerItem(i, n);
                                green_counter = green_counter + 1;
                                green_totalsale = green_totalsale + green_sellprice;
                            end
                        end
                    end
                end
            end
        end
    end
    if grey_totalsale > 0 then
        print("|cffffd200Vend-o-matic|r: 出售 " .. grey_counter .. " |cff808080grey|r 物品获得: " .. GetCoinTextureString(grey_totalsale));
    end
    if green_totalsale > 0 then
        print("|cffffd200Vend-o-matic|r: 出售 " .. green_counter .. " |cff00ff00green|r 物品获得: " .. GetCoinTextureString(green_totalsale));
    end
end

function Vendomatic_CheckExceptions(name)
    if VendomaticOptions["exceptions"] then
        for i, v in ipairs(VendomaticOptions["exceptions"]) do
            if v == name then
                return true;
            end
        end
    end
    return false;
end

function Vendomatic_AutoRestock() -- Extremely clean auto restock function that WORKS BEAUTIFULLY!!
    for i = 1, GetMerchantNumItems() do
        local m_name = select(1, GetMerchantItemInfo(i));
        if Vendomatic_ReagentCountList(m_name) then
            local threshold = VendomaticOptions.reagentcount[m_name];
            local playercount = GetItemCount(m_name);
            local itemcost = select(3, GetMerchantItemInfo(i));
            local lotsold = select(4, GetMerchantItemInfo(i));
            if threshold < lotsold then
                print("|cffffd200Vend-o-matic|r: 请提高 " .. m_name .. " 的价格阀值高于 " .. lotsold .. ".");
            else
                if playercount < threshold then
                    local buyrepeat = 1;
                    local remainder = 0;
                    local buyamount = threshold - playercount;
                    local itemstack = GetMerchantItemMaxStack(i);
                    if itemstack > 1 then
                        if threshold < itemstack then
                            itemstack = threshold;
                        else
                            buyrepeat = buyamount / itemstack;
                            remainder = mod(buyamount, itemstack);
                        end
                    else
                        buyrepeat = buyamount / lotsold;
                        itemstack = 1;
                    end
                    if lotsold == 1 then
                        if remainder > 0 then
                            buyrepeat = floor(buyrepeat);
                            BuyMerchantItem(i, remainder);
                        end
                    else
                        if VendomaticOptions["overstock"] == 1 then
                            buyrepeat = ceil(buyrepeat);
                        else
                            buyrepeat = floor(buyrepeat);
                        end
                    end
                    for n = 1, buyrepeat do -- Surprisingly the most important part of this whole function, everything else defines what gets put here :P
                        BuyMerchantItem(i, itemstack);
                    end
                end
            end
        end
    end
end

function Vendomatic_FirstRun()
    VendomaticOptions["autorepair"] = 1;
    VendomaticOptions["autosell"] = 0;
    VendomaticOptions["autorestock"] = 1;
    VendomaticOptions["overstock"] = 1;
    VendomaticOptions["repairtype"] = 1;
    VendomaticOptions["hideminimapicon"] = 0;
    VendomaticOptions["guildbankrepair"] = 1;
    VendomaticOptions["repairthreshold"] = 99;
    VendomaticOptions["reagents"] = {};
    VendomaticOptions["reagentcount"] = {};
    VendomaticOptions["exceptions"] = {};
    VendomaticOptions["sellgreens"] = 0;
    VendomaticOptions["listtype"] = 0;
end

function Vendomatic_ReagentCountList(item)
    if VendomaticOptions.reagentcount ~= nil then
        if VendomaticOptions.reagentcount[item] then
            return true;
        else
            return false;
        end
    end
end

function ExceptionDelete(name)
    for i, v in ipairs(VendomaticOptions.exceptions) do
        if v == name then
            tremove(VendomaticOptions.exceptions, i);
        end
    end
end

function ReagentDelete(name)
    for i, v in ipairs(VendomaticOptions.reagents) do
        if v == name then
            tremove(VendomaticOptions.reagents, i);
            VendomaticOptions.reagentcount[name] = nil;
        end
    end
end

function Vendomatic_SellFrameUpdate(index)
    Vendomatic_sellstart = 1;
    if index ~= nil then
        Vendomatic_sellstart = index;
    end
    local counter = 1;
    local Vendomatic_sellend = Vendomatic_sellstart + 4;
    for i = Vendomatic_sellstart, Vendomatic_sellend do
        local button = getglobal("SellItemButton" .. counter);
        local buttontext = VendomaticOptions.exceptions[i];
        button:SetText(buttontext);
        button:Show();
        counter = counter + 1;
    end
    for n = 1, 5 do
        local button = getglobal("SellItemButton" .. n);
        local gettext = button:GetText();
        if gettext == nil then
            button:Hide();
        end
    end
end

function Vendomatic_StockFrameUpdate(index)
    Vendomatic_stockstart = 1;
    if index ~= nil then
        Vendomatic_stockstart = index;
    end
    local counter = 1;
    local Vendomatic_stockend = Vendomatic_stockstart + 4;
    for i = Vendomatic_stockstart, Vendomatic_stockend do
        local button = getglobal("StockItemButton" .. counter);
        local buttontext = VendomaticOptions.reagents[i];
        button:SetText(buttontext);
        button:Show();
        counter = counter + 1;
    end
    for n = 1, 5 do
        local button = getglobal("StockItemButton" .. n);
        local gettext = button:GetText();
        if gettext == nil then
            button:Hide();
        end
    end
end

function Vendomatic_HighlightFrame(name)
    VendomaticHighlightFrame:SetPoint("TOPLEFT", name, "TOPLEFT", -5, -3);
    VendomaticHighlightFrame:Show();
end

function Vendomatic_Getsellrows()
    Vendomatic_Exceptions_MaxRows = 0;
    for i, v in ipairs(VendomaticOptions.exceptions) do
        Vendomatic_Exceptions_MaxRows = Vendomatic_Exceptions_MaxRows + 1;
    end
    return Vendomatic_Exceptions_MaxRows - 4;
end

function Vendomatic_Getstockrows()
    Vendomatic_Reagents_MaxRows = 0;
    for i, v in ipairs(VendomaticOptions.reagents) do
        Vendomatic_Reagents_MaxRows = Vendomatic_Reagents_MaxRows + 1;
    end
    return Vendomatic_Reagents_MaxRows - 4;
end

function Vendomatic_SellFrameMoveDown()
    local maxrows = Vendomatic_Getsellrows();
    if ((sellframestartindex < maxrows) and (maxrows > 0)) then
        sellframestartindex = sellframestartindex + 1;
        Vendomatic_SellFrameUpdate(sellframestartindex);
    end
end

function Vendomatic_SellFrameMoveUp()
    if (sellframestartindex > 1) then
        sellframestartindex = sellframestartindex - 1;
        Vendomatic_SellFrameUpdate(sellframestartindex);
    end
end

function Vendomatic_StockFrameMoveDown()
    local maxrows = Vendomatic_Getstockrows();
    if ((stockframestartindex < maxrows) and (maxrows > 0)) then
        stockframestartindex = stockframestartindex + 1;
        Vendomatic_StockFrameUpdate(stockframestartindex);
    end
end

function Vendomatic_StockFrameMoveUp()
    if (stockframestartindex > 1) then
        stockframestartindex = stockframestartindex - 1;
        Vendomatic_StockFrameUpdate(stockframestartindex);
    end
end

function Vendomatic_Durability()
    local mydurability = 0;
    local mymaxdurability = 0;
    local percentdurabilitystring;
    for i = 1, 24 do
        itemdurability, itemmaxdurability = GetInventoryItemDurability(i);
        if (itemdurability) and (itemmaxdurability) then
            mydurability = mydurability + itemdurability;
            mymaxdurability = mymaxdurability + itemmaxdurability;
        end
    end
    local percentdurability = floor((100 * (mydurability / mymaxdurability)));
    if percentdurability >= 66 then
        percentdurabilitystring = "|cff00ff00" .. percentdurability .. "% 剩余耐久度|r";
    elseif percentdurability < 66 and percentdurability > 33 then
        percentdurabilitystring = "|cffffff00" .. percentdurability .. "% 剩余耐久度|r";
    elseif percentdurability <= 33 then
        percentdurabilitystring = "|cffff0000" .. percentdurability .. "% 剩余耐久度|r";
    end
    print("|cffffd200Vend-o-matic|r: " .. percentdurabilitystring);
end
