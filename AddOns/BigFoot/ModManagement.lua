ModManagement_e96fdf71c0db12f9c3b4f119267ff1d2 = 12;
BigFoot_ModOptionConfig = {};
ModManagement_7a9eaaf93ef7c8a058d8e7841b726add = {};
ModManagement_cfc783244a9eae5ed2bb32c69f139618 = nil;
ModManagement_bdf5390627ce5a4b3179bab176fd094f = nil;
ModManagement_2f354dd9ac8608b8fc606ddd4cb20bdc = nil;
ModManagement_6953b2e4d6710c36e11df69825d6ce1f = 20;
ModManagement_ad818bb9abe7b43f57d2f1a930c812d7 = 10;
ModManagement_29ab8a01af486ec717579377ead3adb2 = 10;
ModManagement_c0f398ee197de9cd7285479985e22494 = 6;
ModManagement_37ba969bc87af9e4ef8a83555ac7897d = {};

if (GetLocale() == "zhCN") then
    MOD_MANAGEMENT_FRAME_TITLE = "大脚设置";
    MOD_MANAGEMENT_CLOSE_TEXT = "关闭";
    MOD_MANAGEMENT_PREV_TEXT = "上一页";
    MOD_MANAGEMENT_NEXT_TEXT = "下一页";
    MOD_MANAGEMENT_WELCOME_TEXT = "http://bigfoot.178.com\nhttp://wow.178.com\n\n\n欢迎使用大脚(BigFoot)插件，这是大脚插件的设置界面，您可以通过选择左侧的按钮来设定相关模块的参数。"
    MOD_MANAGEMENT_FONT = "Fonts\\ZYKai_T.TTF";
elseif (GetLocale() == "zhTW") then
    MOD_MANAGEMENT_FRAME_TITLE = "大腳設置";
    MOD_MANAGEMENT_CLOSE_TEXT = "關閉";
    MOD_MANAGEMENT_PREV_TEXT = "上一頁";
    MOD_MANAGEMENT_NEXT_TEXT = "下一頁";
    MOD_MANAGEMENT_WELCOME_TEXT = "http://bigfoot.178.com\nhttp://wow.178.com\n\n\歡迎使用大腳(BigFoot)插件，這是大腳插件的設置界面，您可以透過選擇左側的按鈕來設定相關模塊的參數。"
    MOD_MANAGEMENT_FONT = "Fonts\\bLEI00D.TTF";
else
    MOD_MANAGEMENT_FRAME_TITLE = "BigFoot Setup";
    MOD_MANAGEMENT_CLOSE_TEXT = "Close";
    MOD_MANAGEMENT_PREV_TEXT = "Prev";
    MOD_MANAGEMENT_NEXT_TEXT = "Next";
    MOD_MANAGEMENT_WELCOME_TEXT = "http://bigfoot.178.com\nhttp://wow.178.com\n\n\Welcome to using \"BigFoot\" interface. This page you see is setting window, you can modify some options by click left side button."
    MOD_MANAGEMENT_FONT = "Fonts\\ARIALN.TTF";
end

local ModManagement_492cd416987e0d92457bfeb0e6c1d6ea = 24;
local ModManagement_31064ed6053563897041665f34248604 = {};

function ModManagementFrame_OnLoad(self)
end

function ModManagementFrame_OnEvent(self, event)
end

function ModManagementFrame_OnShow(self)
    ModManagementFrameHeaderText:SetText(MOD_MANAGEMENT_FRAME_TITLE);
    ModManagementFrameCloseButton:SetText(MOD_MANAGEMENT_CLOSE_TEXT);
    ModPrevPageButtonText:SetText(MOD_MANAGEMENT_PREV_TEXT);
    ModNextPageButtonText:SetText(MOD_MANAGEMENT_NEXT_TEXT);
    if (ModManagementFrame.current_custom_frame) then
        local ModManagement_5f0240af34351ab55c84ca442e6d7a80 = getglobal(ModManagementFrame.current_custom_frame);
        if (ModManagement_5f0240af34351ab55c84ca442e6d7a80) then
            ModManagement_5f0240af34351ab55c84ca442e6d7a80:Hide();
            ModManagementFrame.current_custom_frame = nil;
        end
    end
    ModManagementFrameLogoFrame:SetAlpha(1.0);
    ModManagementWelcomeText:SetText(MOD_MANAGEMENT_WELCOME_TEXT);
    ModManagementLogo:Show(); ModManagementWatermark:Hide();
    ModManagementWelcomeText:Show();
    ModManagementLinkText:Hide();
    ModManagement_aaa0ba750c8452167f2ee5c7183b4aef();
    ModManagement_2f354dd9ac8608b8fc606ddd4cb20bdc = nil;
    ModManagement_bdf5390627ce5a4b3179bab176fd094f = nil;
    ModManagement_12a7f20fc74d7ad4ff92606ccc846037();
    ModManagement_dd43ceb26f2f853fcae22d9619912151();
    ModManagement_b23a59ea1e0dab21ca3d5e217861e62a(1);
end

function ModManagement_aabd1cf338e0d3a4dff8caa7f901a602()
    ModManagementFrame:Show();
end

function ModManagement_4d49ff675a7177dc17043da363b0888a(ModManagement_6a1080b3779c2c7583f231e8c6dfa9bd, ModManagement_d96ea4cb5b803524730b47b3dc53573c, ModManagement_f5948dc7f6c4a3da1d8af49fd8bb6d5d, ModManagement_a529bfc214cfa5f7a0b2f805abf0e737, ModManagement_6c162b1123a1eb57c1827271b32b6959)
    for ModManagement_e914904fab9d05d3f54d52bfc31a0f3f = 1, ModManagement_e96fdf71c0db12f9c3b4f119267ff1d2, 1 do
        local ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ModButton" .. ModManagement_e914904fab9d05d3f54d52bfc31a0f3f);
        local ModManagement_9248008bbb6d0ee7ce13f6ee45680051 = getglobal(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName() .. "IconTexture");
        local ModManagement_e6955c64cf39bdb23dc86de1a9ec2117 = getglobal(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName() .. "ModName");
        local ModManagement_1f8f756ad78ea47fd6befbe88ce49a67 = getglobal(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName() .. "SubModName");
        if (not ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.beingUsed) then
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Show();
            ModManagement_9248008bbb6d0ee7ce13f6ee45680051:SetTexture(ModManagement_d96ea4cb5b803524730b47b3dc53573c);
            ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:SetText(ModManagement_f5948dc7f6c4a3da1d8af49fd8bb6d5d);
            ModManagement_1f8f756ad78ea47fd6befbe88ce49a67:SetText(ModManagement_a529bfc214cfa5f7a0b2f805abf0e737);
            ModManagement_9248008bbb6d0ee7ce13f6ee45680051:Show(); ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:Show();
            ModManagement_1f8f756ad78ea47fd6befbe88ce49a67:Show(); ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.title = ModManagement_f5948dc7f6c4a3da1d8af49fd8bb6d5d;
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.tooltip = ModManagement_6c162b1123a1eb57c1827271b32b6959;
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.beingUsed = 1;
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.relativedMod = ModManagement_6a1080b3779c2c7583f231e8c6dfa9bd;
            return;
        end
    end
end

function ModManagement_b4d7b3f986c55f3f1f2b848d985c0029(ModManagement_d285ae0fc55c589ca8a11fede4ac2362, ModManagement_1ad0e6a4c91026007c0be948ef382073)
    local ModManagement_19bd98733d38d448ce9339a94b80ea1a = ModManagement_d285ae0fc55c589ca8a11fede4ac2362.sort or ModManagement_d285ae0fc55c589ca8a11fede4ac2362.text;
    local ModManagement_614ac8367e7a10142ccf2666a0d66e97 = ModManagement_1ad0e6a4c91026007c0be948ef382073.sort or ModManagement_1ad0e6a4c91026007c0be948ef382073.text;
    return (ModManagement_19bd98733d38d448ce9339a94b80ea1a < ModManagement_614ac8367e7a10142ccf2666a0d66e97);
end

function ModManagement_d645bf240a0ab0b1ccc6d69bbd460da5()
    local ModManagement_6a1080b3779c2c7583f231e8c6dfa9bd, ModManagement_3bb367e1f150a93c099e99df8d49e180;
    ModManagement_cfc783244a9eae5ed2bb32c69f139618 = {};
    for ModManagement_6a1080b3779c2c7583f231e8c6dfa9bd, ModManagement_3bb367e1f150a93c099e99df8d49e180 in pairs(ModManagement_7a9eaaf93ef7c8a058d8e7841b726add) do
        table.insert(ModManagement_cfc783244a9eae5ed2bb32c69f139618, ModManagement_3bb367e1f150a93c099e99df8d49e180);
    end
    table.sort(ModManagement_cfc783244a9eae5ed2bb32c69f139618, ModManagement_b4d7b3f986c55f3f1f2b848d985c0029);
end

function ModManagement_f716e79d0c15aecfcb7d55dbea94bc8c(ModManagement_7193346511e6cfd5aa01fac54f2cd168, ModManagement_3f50417fb16be9b1078eb68d24fa9c26)
    local ModManagement_56f04248423194aed6ab35b65fe74f1e = getglobal("ModPrevPageButton");
    local ModManagement_7b2dc422931bb841b195169d1d8c66fe = getglobal("ModNextPageButton");
    if (ModManagement_7193346511e6cfd5aa01fac54f2cd168 <= 1) then
        ModManagement_56f04248423194aed6ab35b65fe74f1e:Disable();
    else
        ModManagement_56f04248423194aed6ab35b65fe74f1e:Enable();
    end
    if (ModManagement_3f50417fb16be9b1078eb68d24fa9c26 <= ModManagement_e96fdf71c0db12f9c3b4f119267ff1d2 * ModManagement_7193346511e6cfd5aa01fac54f2cd168) then
        ModManagement_7b2dc422931bb841b195169d1d8c66fe:Disable();
    else
        ModManagement_7b2dc422931bb841b195169d1d8c66fe:Enable();
    end
end

function ModManagement_61beeb4a5cb9901dd878bbead4555a4d()
    for ModManagement_e914904fab9d05d3f54d52bfc31a0f3f = 1, ModManagement_e96fdf71c0db12f9c3b4f119267ff1d2, 1 do
        local ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ModButton" .. ModManagement_e914904fab9d05d3f54d52bfc31a0f3f);
        local ModManagement_9248008bbb6d0ee7ce13f6ee45680051 = getglobal(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName() .. "IconTexture");
        local ModManagement_e6955c64cf39bdb23dc86de1a9ec2117 = getglobal(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName() .. "ModName");
        local ModManagement_1f8f756ad78ea47fd6befbe88ce49a67 = getglobal(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName() .. "SubModName");
        if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5) then
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.tooltip = nil;
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.beingUsed = nil;
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.relativedMod = nil;
            ModManagement_9248008bbb6d0ee7ce13f6ee45680051:Hide();
            ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:Hide();
            ModManagement_1f8f756ad78ea47fd6befbe88ce49a67:Hide();
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Hide();
        end
    end
end

function ModManagement_b23a59ea1e0dab21ca3d5e217861e62a(ModManagement_7193346511e6cfd5aa01fac54f2cd168)
    if (not ModManagement_cfc783244a9eae5ed2bb32c69f139618) then
        ModManagement_d645bf240a0ab0b1ccc6d69bbd460da5();
    end
    if (ModManagement_bdf5390627ce5a4b3179bab176fd094f == ModManagement_7193346511e6cfd5aa01fac54f2cd168) then
        return;
    end
    local ModManagement_ed2434aa06196eb0764ccd3c3a8414be = table.maxn(ModManagement_cfc783244a9eae5ed2bb32c69f139618);
    if (ModManagement_ed2434aa06196eb0764ccd3c3a8414be < ModManagement_e96fdf71c0db12f9c3b4f119267ff1d2 * (ModManagement_7193346511e6cfd5aa01fac54f2cd168 - 1)) then
        return;
    end
    ModManagement_61beeb4a5cb9901dd878bbead4555a4d();
    local __index = ModManagement_e96fdf71c0db12f9c3b4f119267ff1d2 * (ModManagement_7193346511e6cfd5aa01fac54f2cd168 - 1) + 1;
    for ModManagement_e914904fab9d05d3f54d52bfc31a0f3f = __index, __index + ModManagement_e96fdf71c0db12f9c3b4f119267ff1d2, 1 do
        if (ModManagement_cfc783244a9eae5ed2bb32c69f139618[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f]) then
            local ModManagement_6a1080b3779c2c7583f231e8c6dfa9bd = ModManagement_cfc783244a9eae5ed2bb32c69f139618[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f].name;
            if (ModManagement_6a1080b3779c2c7583f231e8c6dfa9bd) then
                local ModManagement_3bb367e1f150a93c099e99df8d49e180 = ModManagement_7a9eaaf93ef7c8a058d8e7841b726add[ModManagement_6a1080b3779c2c7583f231e8c6dfa9bd];
                ModManagement_4d49ff675a7177dc17043da363b0888a(ModManagement_6a1080b3779c2c7583f231e8c6dfa9bd, ModManagement_3bb367e1f150a93c099e99df8d49e180.texture, ModManagement_3bb367e1f150a93c099e99df8d49e180.text, ModManagement_3bb367e1f150a93c099e99df8d49e180.subText, ModManagement_3bb367e1f150a93c099e99df8d49e180.tooltip);
            end
        end
    end
    for ModManagement_e914904fab9d05d3f54d52bfc31a0f3f = 1, ModManagement_e96fdf71c0db12f9c3b4f119267ff1d2, 1 do
        local ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ModButton" .. ModManagement_e914904fab9d05d3f54d52bfc31a0f3f);
        local ModManagement_30b6f278098f3fa7bf562ea6d5620a66 = ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetChecked();
        if (ModManagement_30b6f278098f3fa7bf562ea6d5620a66 and ModManagement_30b6f278098f3fa7bf562ea6d5620a66 ~= 0) then
            if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.relativedMod ~= ModManagement_2f354dd9ac8608b8fc606ddd4cb20bdc) then
                ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetChecked(0);
            end
        else
            if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.relativedMod and ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.relativedMod == ModManagement_2f354dd9ac8608b8fc606ddd4cb20bdc) then
                ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetChecked(1);
            end
        end
    end
    ModManagement_bdf5390627ce5a4b3179bab176fd094f = ModManagement_7193346511e6cfd5aa01fac54f2cd168;
    ModManagementPageText:SetText(ModManagement_7193346511e6cfd5aa01fac54f2cd168);
    ModManagement_f716e79d0c15aecfcb7d55dbea94bc8c(ModManagement_7193346511e6cfd5aa01fac54f2cd168, ModManagement_ed2434aa06196eb0764ccd3c3a8414be);
end

function ModManagementFrame_OnHide()
    PlaySound("gsTitleOptionExit");
end

function ModButton_OnLoad()
end

function ModManagement_dd43ceb26f2f853fcae22d9619912151()
end

function ModManagement_12a7f20fc74d7ad4ff92606ccc846037()
    for ModManagement_75c9af9f6623fc55d5d5fa34b493e3bb = 1, ModManagement_6953b2e4d6710c36e11df69825d6ce1f, 1 do
        local ModManagement_e200ab3f235cf525764c5da4fd03b36d = getglobal("ModOptionCheckButton" .. ModManagement_75c9af9f6623fc55d5d5fa34b493e3bb);
        if (ModManagement_e200ab3f235cf525764c5da4fd03b36d) then
            ModManagement_e200ab3f235cf525764c5da4fd03b36d:Hide();
        end
    end
    for ModManagement_db73d30f1db62e80f097a2677025f04b = 1, ModManagement_29ab8a01af486ec717579377ead3adb2, 1 do
        local ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ModOptionCommandButton" .. ModManagement_db73d30f1db62e80f097a2677025f04b);
        if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5) then
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Hide();
        end
    end
    ModManagement_cd914ae5622723b7e545a1b9e66ccc0b();
end

function ModManagement_Refresh()
    ModManagement_a4f54dcbb0efcead0035ed62a5eebdc6(ModManagement_2f354dd9ac8608b8fc606ddd4cb20bdc);
end

function ModManagement_SetPos(ModManagement_7e7860987b220bb966092ef46f8a8f44, ModManagement_d7383de8409225d06a0cedfd4031edf0)
    if (ModManagement_d7383de8409225d06a0cedfd4031edf0 == nil) then
        ModManagement_7e7860987b220bb966092ef46f8a8f44:SetPoint("TOPLEFT", "ModManagementFrame", "TOPLEFT", 300, -70);
    else
        local ModManagement_9f652eff74f4ab85c92761b518a48a56 = 0;
        local ModManagement_ce7eff166556c4f00b1655de0278b678 = 0;
        if (ModManagement_d7383de8409225d06a0cedfd4031edf0.type == "BUTTON") then
            ModManagement_9f652eff74f4ab85c92761b518a48a56 = 0;
            ModManagement_ce7eff166556c4f00b1655de0278b678 = 10;
        end
        ModManagement_7e7860987b220bb966092ef46f8a8f44:SetPoint("TOPLEFT", ModManagement_d7383de8409225d06a0cedfd4031edf0, "BOTTOMLEFT", 0 - ModManagement_9f652eff74f4ab85c92761b518a48a56 + (ModManagement_7e7860987b220bb966092ef46f8a8f44.indent - ModManagement_d7383de8409225d06a0cedfd4031edf0.indent) * ModManagement_492cd416987e0d92457bfeb0e6c1d6ea, 2 - ModManagement_ce7eff166556c4f00b1655de0278b678);
    end
end

function ModManagement_cd914ae5622723b7e545a1b9e66ccc0b()
    local __index = 1;
    local ModManagement_6298f44b9ef6828905d277c87f5e1bbd;
    ModManagement_6298f44b9ef6828905d277c87f5e1bbd = getglobal("ModOptionSpinBox" .. __index);
    while (ModManagement_6298f44b9ef6828905d277c87f5e1bbd) do
        __index = __index + 1;
        ModManagement_6298f44b9ef6828905d277c87f5e1bbd.used = nil;
        ModManagement_6298f44b9ef6828905d277c87f5e1bbd:Hide();
        ModManagement_6298f44b9ef6828905d277c87f5e1bbd = getglobal("ModOptionSpinBox" .. __index);
    end
end

local function ModManagement_c73c5453800fba9b946326d2826e4429(self)
    local ModManagement_7e7860987b220bb966092ef46f8a8f44 = self:GetParent();
    local ModManagement_e6955c64cf39bdb23dc86de1a9ec2117 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text");
    local ModManagement_1dc850a376f9ba5d68ff11c1285409f0 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "EditBox");
    local ModManagement_2361bab8b48b1041ad740bb561b21aee = ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:GetText();
    local ModManagement_e914904fab9d05d3f54d52bfc31a0f3f;
    if (ModManagement_7e7860987b220bb966092ef46f8a8f44.list) then
        local ModManagement_3f50417fb16be9b1078eb68d24fa9c26 = table.maxn(ModManagement_7e7860987b220bb966092ef46f8a8f44.list);
        for ModManagement_e914904fab9d05d3f54d52bfc31a0f3f = 1, ModManagement_3f50417fb16be9b1078eb68d24fa9c26, 1 do
            if (ModManagement_2361bab8b48b1041ad740bb561b21aee == ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f]) then
                if (ModManagement_e914904fab9d05d3f54d52bfc31a0f3f - 1 < 1) then
                    ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:SetText(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_3f50417fb16be9b1078eb68d24fa9c26]);
                    BigFoot_SetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable, ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_3f50417fb16be9b1078eb68d24fa9c26]);
                    ModManagement_7e7860987b220bb966092ef46f8a8f44.callback(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_3f50417fb16be9b1078eb68d24fa9c26]);
                    return;
                else
                    ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:SetText(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f - 1]);
                    BigFoot_SetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable, ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f - 1]);
                    ModManagement_7e7860987b220bb966092ef46f8a8f44.callback(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f - 1]);
                    return;
                end
            end
        end
        ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:SetText(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[1]);
        BigFoot_SetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable, ModManagement_7e7860987b220bb966092ef46f8a8f44.list[1]);
        ModManagement_7e7860987b220bb966092ef46f8a8f44.callback(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[1]);
    elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.range and ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1] and ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2]) then
        local ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = tonumber(BigFoot_GetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable) - (ModManagement_7e7860987b220bb966092ef46f8a8f44.range[3] or 1));
        if (ModManagement_be741bd2030ad8ad70d14fb34b673ab8 > ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2]) then
            ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2];
        elseif (ModManagement_be741bd2030ad8ad70d14fb34b673ab8 < ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1]) then
            ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1];
        end
        ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetNumber(ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
        ModManagement_7e7860987b220bb966092ef46f8a8f44.callback(ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
        BigFoot_SetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable, ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
        return;
    end
end

local function ModManagement_1b899c0a0b83d0a20ad02a215ef30716(self)
    local ModManagement_7e7860987b220bb966092ef46f8a8f44 = self:GetParent();
    local ModManagement_e6955c64cf39bdb23dc86de1a9ec2117 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text");
    local ModManagement_1dc850a376f9ba5d68ff11c1285409f0 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "EditBox");
    local ModManagement_2361bab8b48b1041ad740bb561b21aee = ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:GetText();
    local ModManagement_e914904fab9d05d3f54d52bfc31a0f3f;
    if (ModManagement_7e7860987b220bb966092ef46f8a8f44.list) then
        local ModManagement_3f50417fb16be9b1078eb68d24fa9c26 = table.maxn(ModManagement_7e7860987b220bb966092ef46f8a8f44.list);
        for ModManagement_e914904fab9d05d3f54d52bfc31a0f3f = 1, ModManagement_3f50417fb16be9b1078eb68d24fa9c26, 1 do
            if (ModManagement_2361bab8b48b1041ad740bb561b21aee == ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f]) then
                if (ModManagement_e914904fab9d05d3f54d52bfc31a0f3f + 1 > ModManagement_3f50417fb16be9b1078eb68d24fa9c26) then
                    ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:SetText(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[1]);
                    BigFoot_SetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable, ModManagement_7e7860987b220bb966092ef46f8a8f44.list[1]);
                    ModManagement_7e7860987b220bb966092ef46f8a8f44.callback(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[1]);
                    return;
                else
                    ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:SetText(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f + 1]);
                    BigFoot_SetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable, ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f + 1]);
                    ModManagement_7e7860987b220bb966092ef46f8a8f44.callback(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[ModManagement_e914904fab9d05d3f54d52bfc31a0f3f + 1]);
                    return;
                end
            end
        end
        ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:SetText(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[1]);
        BigFoot_SetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable, ModManagement_7e7860987b220bb966092ef46f8a8f44.list[1]);
        ModManagement_7e7860987b220bb966092ef46f8a8f44.callback(ModManagement_7e7860987b220bb966092ef46f8a8f44.list[1]);
    elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.range and ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1] and ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2]) then
        local ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = tonumber(BigFoot_GetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable) + (ModManagement_7e7860987b220bb966092ef46f8a8f44.range[3] or 1));
        if (ModManagement_be741bd2030ad8ad70d14fb34b673ab8 > ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2]) then
            ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2];
        elseif (ModManagement_be741bd2030ad8ad70d14fb34b673ab8 < ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1]) then
            ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1];
        end
        ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetNumber(ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
        ModManagement_7e7860987b220bb966092ef46f8a8f44.callback(ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
        BigFoot_SetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable, ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
        return;
    end
end

function ModManagement_2156a3936bcaecf6c9fe7778ad1bad2b(self)
    local ModManagement_7e7860987b220bb966092ef46f8a8f44 = self:GetParent();
    local ModManagement_1dc850a376f9ba5d68ff11c1285409f0 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "EditBox");
    if (ModManagement_7e7860987b220bb966092ef46f8a8f44.range and ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1] and ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2]) then
        local ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = tonumber(BigFoot_GetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable));
        local ModManagement_2361bab8b48b1041ad740bb561b21aee = ModManagement_1dc850a376f9ba5d68ff11c1285409f0:GetNumber() or ModManagement_be741bd2030ad8ad70d14fb34b673ab8;
        if (type(ModManagement_2361bab8b48b1041ad740bb561b21aee) == "number" and ModManagement_2361bab8b48b1041ad740bb561b21aee ~= ModManagement_be741bd2030ad8ad70d14fb34b673ab8) then
            if (ModManagement_2361bab8b48b1041ad740bb561b21aee < ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1]) then
                ModManagement_2361bab8b48b1041ad740bb561b21aee = ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1];
            elseif (ModManagement_2361bab8b48b1041ad740bb561b21aee > ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2]) then
                ModManagement_2361bab8b48b1041ad740bb561b21aee = ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2];
            end
            ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetNumber(ModManagement_2361bab8b48b1041ad740bb561b21aee);
            ModManagement_7e7860987b220bb966092ef46f8a8f44.callback(ModManagement_2361bab8b48b1041ad740bb561b21aee);
            BigFoot_SetModVariable(ModManagement_7e7860987b220bb966092ef46f8a8f44.mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable, ModManagement_2361bab8b48b1041ad740bb561b21aee);
        end
    end
end

local function ModManagement_0b1ad7411c6b9fd859ad1f8714d35adc(ModManagement_230883bbc69c983c732642d8c7ec50cb, ModManagement_f4e13e8ecf20422833dd2d694a22bf40)
    local __index = 1;
    local ModManagement_6298f44b9ef6828905d277c87f5e1bbd;
    ModManagement_6298f44b9ef6828905d277c87f5e1bbd = getglobal("ModOptionSpinBox" .. __index);
    while (ModManagement_6298f44b9ef6828905d277c87f5e1bbd and ModManagement_6298f44b9ef6828905d277c87f5e1bbd.used) do
        __index = __index + 1; ModManagement_6298f44b9ef6828905d277c87f5e1bbd = getglobal("ModOptionSpinBox" .. __index);
    end
    if (not ModManagement_6298f44b9ef6828905d277c87f5e1bbd) then
        ModManagement_6298f44b9ef6828905d277c87f5e1bbd = CreateFrame("Frame", "ModOptionSpinBox" .. __index, ModManagementFrame);
        ModManagement_6298f44b9ef6828905d277c87f5e1bbd:SetWidth(200);
        ModManagement_6298f44b9ef6828905d277c87f5e1bbd:SetHeight(28);
        local ModManagement_8e3871d69d44135433f03817d7f4d33c = ModManagement_6298f44b9ef6828905d277c87f5e1bbd:CreateFontString("ModOptionSpinBox" .. __index .. "Title", "OVERLAY");
        ModManagement_8e3871d69d44135433f03817d7f4d33c:SetFont(MOD_MANAGEMENT_FONT, 14);
        ModManagement_8e3871d69d44135433f03817d7f4d33c:SetTextColor(1.0, 0.82, 0);
        ModManagement_8e3871d69d44135433f03817d7f4d33c:SetPoint("LEFT", ModManagement_6298f44b9ef6828905d277c87f5e1bbd, "LEFT", 5, 0);
        ModManagement_8e3871d69d44135433f03817d7f4d33c:SetWidth(80); ModManagement_8e3871d69d44135433f03817d7f4d33c:SetHeight(24);
        ModManagement_8e3871d69d44135433f03817d7f4d33c:SetJustifyH("LEFT"); ModManagement_8e3871d69d44135433f03817d7f4d33c:SetJustifyV("CENTER");
        ModManagement_8e3871d69d44135433f03817d7f4d33c:SetNonSpaceWrap(true); ModManagement_8e3871d69d44135433f03817d7f4d33c:SetText(ModManagement_230883bbc69c983c732642d8c7ec50cb);
        local ModManagement_f5b2b4c6f1cb19f168e421abe6e02642 = CreateFrame("Button", "ModOptionSpinBox" .. __index .. "PrevButton", ModManagement_6298f44b9ef6828905d277c87f5e1bbd);
        ModManagement_f5b2b4c6f1cb19f168e421abe6e02642:SetWidth(20);
        ModManagement_f5b2b4c6f1cb19f168e421abe6e02642:SetHeight(20);
        ModManagement_f5b2b4c6f1cb19f168e421abe6e02642:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Up");
        ModManagement_f5b2b4c6f1cb19f168e421abe6e02642:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Down");
        ModManagement_f5b2b4c6f1cb19f168e421abe6e02642:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-PrevPage-Disabled");
        ModManagement_f5b2b4c6f1cb19f168e421abe6e02642:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight");
        ModManagement_f5b2b4c6f1cb19f168e421abe6e02642:SetPoint("LEFT", ModManagement_8e3871d69d44135433f03817d7f4d33c, "RIGHT", 0, 0);
        ModManagement_f5b2b4c6f1cb19f168e421abe6e02642:RegisterForClicks("LeftButtonUp", "RightButtonUp");
        ModManagement_f5b2b4c6f1cb19f168e421abe6e02642:SetScript("OnClick", ModManagement_c73c5453800fba9b946326d2826e4429);
        local ModManagement_1189e83102564b7039e5896816b192a9 = CreateFrame("Button", "ModOptionSpinBox" .. __index .. "NextButton", ModManagement_6298f44b9ef6828905d277c87f5e1bbd);
        ModManagement_1189e83102564b7039e5896816b192a9:SetWidth(20);
        ModManagement_1189e83102564b7039e5896816b192a9:SetHeight(20);
        ModManagement_1189e83102564b7039e5896816b192a9:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up");
        ModManagement_1189e83102564b7039e5896816b192a9:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down");
        ModManagement_1189e83102564b7039e5896816b192a9:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled");
        ModManagement_1189e83102564b7039e5896816b192a9:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight");
        ModManagement_1189e83102564b7039e5896816b192a9:SetPoint("RIGHT", ModManagement_6298f44b9ef6828905d277c87f5e1bbd, "RIGHT", 0, 0);
        ModManagement_1189e83102564b7039e5896816b192a9:RegisterForClicks("LeftButtonUp", "RightButtonUp");
        ModManagement_1189e83102564b7039e5896816b192a9:SetScript("OnClick", ModManagement_1b899c0a0b83d0a20ad02a215ef30716);
        local ModManagement_1dc850a376f9ba5d68ff11c1285409f0 = CreateFrame("EditBox", "ModOptionSpinBox" .. __index .. "EditBox", ModManagement_6298f44b9ef6828905d277c87f5e1bbd, "InputBoxTemplate");
        ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetJustifyH("CENTER");
        ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetWidth(70);
        ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetHeight(24);
        ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetPoint("LEFT", ModManagement_f5b2b4c6f1cb19f168e421abe6e02642, "RIGHT", 4, 0);
        ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetScript("OnTextChanged", ModManagement_2156a3936bcaecf6c9fe7778ad1bad2b);
        ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetScript("OnTabPressed", function(self)
            EditBox_HandleTabbing(ModManagement_31064ed6053563897041665f34248604[ModManagement_6298f44b9ef6828905d277c87f5e1bbd.mod]);
        end);
        local ModManagement_2361bab8b48b1041ad740bb561b21aee = ModManagement_6298f44b9ef6828905d277c87f5e1bbd:CreateFontString("ModOptionSpinBox" .. __index .. "Text", "OVERLAY");
        ModManagement_2361bab8b48b1041ad740bb561b21aee:SetFont(MOD_MANAGEMENT_FONT, 14);
        ModManagement_2361bab8b48b1041ad740bb561b21aee:SetTextColor(1.0, 0.82, 0);
        ModManagement_2361bab8b48b1041ad740bb561b21aee:ClearAllPoints();
        ModManagement_2361bab8b48b1041ad740bb561b21aee:SetPoint("LEFT", ModManagement_f5b2b4c6f1cb19f168e421abe6e02642, "RIGHT", 0, 0);
        ModManagement_2361bab8b48b1041ad740bb561b21aee:SetPoint("RIGHT", ModManagement_1189e83102564b7039e5896816b192a9, "LEFT", 0, 0);
        ModManagement_2361bab8b48b1041ad740bb561b21aee:SetHeight(24); ModManagement_2361bab8b48b1041ad740bb561b21aee:SetJustifyH("CENTER");
        ModManagement_2361bab8b48b1041ad740bb561b21aee:SetJustifyV("CENTER"); ModManagement_2361bab8b48b1041ad740bb561b21aee:SetNonSpaceWrap(true);
        ModManagement_6298f44b9ef6828905d277c87f5e1bbd.used = true;
    else
        ModManagement_6298f44b9ef6828905d277c87f5e1bbd.used = true;
        getglobal(ModManagement_6298f44b9ef6828905d277c87f5e1bbd:GetName() .. "Title"):SetText(ModManagement_230883bbc69c983c732642d8c7ec50cb);
    end
    if (ModManagement_f4e13e8ecf20422833dd2d694a22bf40) then
        getglobal(ModManagement_6298f44b9ef6828905d277c87f5e1bbd:GetName() .. "EditBox"):Show();
        getglobal(ModManagement_6298f44b9ef6828905d277c87f5e1bbd:GetName() .. "Text"):Hide();
    else
        getglobal(ModManagement_6298f44b9ef6828905d277c87f5e1bbd:GetName() .. "Text"):Show();
        getglobal(ModManagement_6298f44b9ef6828905d277c87f5e1bbd:GetName() .. "EditBox"):Hide();
    end
    return ModManagement_6298f44b9ef6828905d277c87f5e1bbd;
end

function ModManagement_a4f54dcbb0efcead0035ed62a5eebdc6(__mod)
    if (not ModManagement_7a9eaaf93ef7c8a058d8e7841b726add[__mod]) then
        return;
    end
    ModManagement_31064ed6053563897041665f34248604[__mod] = {};
    if (not ModManagementWatermark:IsVisible()) then
        ModManagementWatermark:Show();
        ModManagementWelcomeText:Hide();
        ModManagementLinkText:Hide();
        ModManagementLogo:Show();
        ModManagementFrameLogoFrame:SetAlpha(0.2);
        ModManagement_6b01347d503462d225d8a47ed2b14af4();
    end
    local ModManagement_2c3bbe3ead1f0327c923570fe1d21cbd = 1;
    local ModManagement_3a8b5e464751a955ba4c6d2e5a20ec89 = 1;
    local ModManagement_d7383de8409225d06a0cedfd4031edf0 = nil;
    local ModManagement_aa3cf7c4797f1b0a36fde66430e99b5a = nil;
    local ModManagement_bc560b97f6b91d16c35286f4bfd94ad9 = ModManagement_7a9eaaf93ef7c8a058d8e7841b726add[__mod];
    ModManagement_cd914ae5622723b7e545a1b9e66ccc0b();
    if (type(ModManagement_bc560b97f6b91d16c35286f4bfd94ad9.custom_frame) == "string") then
        if (ModManagementFrame.current_custom_frame) then
            local ModManagement_5f0240af34351ab55c84ca442e6d7a80 = getglobal(ModManagementFrame.current_custom_frame);
            if (ModManagement_5f0240af34351ab55c84ca442e6d7a80) then
                ModManagement_5f0240af34351ab55c84ca442e6d7a80:Hide();
            end
        end
        local ModManagement_411b8aa6d5954c6020f0b9c9e80e847a = getglobal(ModManagement_bc560b97f6b91d16c35286f4bfd94ad9.custom_frame);
        if (ModManagement_411b8aa6d5954c6020f0b9c9e80e847a) then
            ModManagement_411b8aa6d5954c6020f0b9c9e80e847a:SetParent("ModManagementFrame");
            ModManagement_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT", "ModManagementFrame", "TOPLEFT", 300, -70);
            ModManagement_411b8aa6d5954c6020f0b9c9e80e847a:Show();
        end
        ModManagementFrame.current_custom_frame = ModManagement_bc560b97f6b91d16c35286f4bfd94ad9.custom_frame;
    else
        if (ModManagementFrame.current_custom_frame) then
            local ModManagement_5f0240af34351ab55c84ca442e6d7a80 = getglobal(ModManagementFrame.current_custom_frame);
            if (ModManagement_5f0240af34351ab55c84ca442e6d7a80) then
                ModManagement_5f0240af34351ab55c84ca442e6d7a80:Hide();
            end
            ModManagementFrame.current_custom_frame = nil;
        end
        if (type(ModManagement_bc560b97f6b91d16c35286f4bfd94ad9.custom_frame) == "table") then
            local ModManagement_411b8aa6d5954c6020f0b9c9e80e847a = getglobal(ModManagement_bc560b97f6b91d16c35286f4bfd94ad9.custom_frame.frame);
            if (ModManagement_411b8aa6d5954c6020f0b9c9e80e847a) then
                ModManagement_411b8aa6d5954c6020f0b9c9e80e847a:SetParent("ModManagementFrame");
                ModManagement_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT", "ModManagementFrame", "TOPLEFT", ModManagement_bc560b97f6b91d16c35286f4bfd94ad9.custom_frame.offsetx, ModManagement_bc560b97f6b91d16c35286f4bfd94ad9.custom_frame.offsety);
                ModManagement_411b8aa6d5954c6020f0b9c9e80e847a:Show();
                ModManagementFrame.current_custom_frame = ModManagement_bc560b97f6b91d16c35286f4bfd94ad9.custom_frame.frame;
            end
        end
        ModManagement_d7383de8409225d06a0cedfd4031edf0 = nil;
        ModManagement_8ada1e5f1cf8232461562168fef4081a = nil;
        for ModManagement_e914904fab9d05d3f54d52bfc31a0f3f, ModManagement_7e7860987b220bb966092ef46f8a8f44 in pairs(BigFoot_ModOptionConfig[__mod]) do
            ModManagement_2b996266ed1edcb97cd09299f15c1b01 = getglobal("ModOptionCheckButton" .. ModManagement_2c3bbe3ead1f0327c923570fe1d21cbd);
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ModOptionCommandButton" .. ModManagement_3a8b5e464751a955ba4c6d2e5a20ec89);
            if (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "CHECKBOX" and ModManagement_7e7860987b220bb966092ef46f8a8f44.page == ModManagement_7193346511e6cfd5aa01fac54f2cd168) then
                if (ModManagement_2b996266ed1edcb97cd09299f15c1b01) then
                    ModManagement_2b996266ed1edcb97cd09299f15c1b01.mod = __mod;
                    ModManagement_2b996266ed1edcb97cd09299f15c1b01.variable = ModManagement_7e7860987b220bb966092ef46f8a8f44.variable;
                    ModManagement_2b996266ed1edcb97cd09299f15c1b01.callback = ModManagement_7e7860987b220bb966092ef46f8a8f44.callback;
                    ModManagement_2b996266ed1edcb97cd09299f15c1b01.tooltip = ModManagement_7e7860987b220bb966092ef46f8a8f44.tooltip;
                    ModManagement_2b996266ed1edcb97cd09299f15c1b01.caption = ModManagement_7e7860987b220bb966092ef46f8a8f44.caption;
                    ModManagement_2b996266ed1edcb97cd09299f15c1b01.indent = ModManagement_7e7860987b220bb966092ef46f8a8f44.indent;
                    ModManagement_2b996266ed1edcb97cd09299f15c1b01.type = "CHECKBOX";
                    ModManagement_2b996266ed1edcb97cd09299f15c1b01.children = {};
                    local ModManagement_00ea32ca95b1c71b3fad120c7d1c9386 = getglobal(ModManagement_2b996266ed1edcb97cd09299f15c1b01:GetName() .. "Text");
                    local ModManagement_be741bd2030ad8ad70d14fb34b673ab8;
                    if (type(ModManagement_7e7860987b220bb966092ef46f8a8f44.variable) == "function") then
                        ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = ModManagement_7e7860987b220bb966092ef46f8a8f44.variable();
                    else
                        ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = BigFoot_GetModVariable(__mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable);
                    end
                    if (ModManagement_7e7860987b220bb966092ef46f8a8f44.filter) then
                        ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = ModManagement_7e7860987b220bb966092ef46f8a8f44.filter(ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
                    end ModManagement_SetElementActivated(ModManagement_2b996266ed1edcb97cd09299f15c1b01, ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
                    ModManagement_SetElementText(ModManagement_2b996266ed1edcb97cd09299f15c1b01, ModManagement_7e7860987b220bb966092ef46f8a8f44.caption);
                    ModManagement_SetPos(ModManagement_2b996266ed1edcb97cd09299f15c1b01, ModManagement_d7383de8409225d06a0cedfd4031edf0);
                    ModManagement_2b996266ed1edcb97cd09299f15c1b01:Show();
                    ModManagement_2c3bbe3ead1f0327c923570fe1d21cbd = ModManagement_2c3bbe3ead1f0327c923570fe1d21cbd + 1;
                    if (ModManagement_2b996266ed1edcb97cd09299f15c1b01.indent >= 1) then
                        if (ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_2b996266ed1edcb97cd09299f15c1b01.indent - 1]) then
                            table.insert(ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_2b996266ed1edcb97cd09299f15c1b01.indent - 1].children, ModManagement_2b996266ed1edcb97cd09299f15c1b01);
                        end
                        if (ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_2b996266ed1edcb97cd09299f15c1b01.indent - 1] and ModManagement_IsElementActivated(ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_2b996266ed1edcb97cd09299f15c1b01.indent - 1]) and ModManagement_IsElementEnabled(ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_2b996266ed1edcb97cd09299f15c1b01.indent - 1])) then
                            ModManagement_SetElementEnabled(ModManagement_2b996266ed1edcb97cd09299f15c1b01, true);
                        else
                            ModManagement_SetElementEnabled(ModManagement_2b996266ed1edcb97cd09299f15c1b01, false);
                        end
                    else
                        ModManagement_SetElementEnabled(ModManagement_2b996266ed1edcb97cd09299f15c1b01, true);
                    end
                    ModManagement_d7383de8409225d06a0cedfd4031edf0 = ModManagement_2b996266ed1edcb97cd09299f15c1b01;
                    if (not ModManagement_8ada1e5f1cf8232461562168fef4081a) then
                        ModManagement_8ada1e5f1cf8232461562168fef4081a = {};
                    end
                    ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_2b996266ed1edcb97cd09299f15c1b01.indent] = ModManagement_2b996266ed1edcb97cd09299f15c1b01;
                end
            elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "SPINBOX" and ModManagement_7e7860987b220bb966092ef46f8a8f44.page == ModManagement_7193346511e6cfd5aa01fac54f2cd168) then
                local ModManagement_6298f44b9ef6828905d277c87f5e1bbd = ModManagement_0b1ad7411c6b9fd859ad1f8714d35adc(ModManagement_7e7860987b220bb966092ef46f8a8f44.caption, ModManagement_7e7860987b220bb966092ef46f8a8f44.range);
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.mod = __mod;
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.variable = ModManagement_7e7860987b220bb966092ef46f8a8f44.variable;
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.callback = ModManagement_7e7860987b220bb966092ef46f8a8f44.callback;
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.list = ModManagement_7e7860987b220bb966092ef46f8a8f44.list;
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.default = ModManagement_7e7860987b220bb966092ef46f8a8f44.default;
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.caption = ModManagement_7e7860987b220bb966092ef46f8a8f44.caption;
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.indent = ModManagement_7e7860987b220bb966092ef46f8a8f44.indent;
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.filter = ModManagement_7e7860987b220bb966092ef46f8a8f44.filter;
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.type = "SPINBOX";
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.children = {};
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd.range = ModManagement_7e7860987b220bb966092ef46f8a8f44.range;
                local ModManagement_1dc850a376f9ba5d68ff11c1285409f0 = getglobal(ModManagement_6298f44b9ef6828905d277c87f5e1bbd:GetName() .. "EditBox");
                local ModManagement_be741bd2030ad8ad70d14fb34b673ab8;
                if (type(ModManagement_7e7860987b220bb966092ef46f8a8f44.variable) == "function") then
                    ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = ModManagement_7e7860987b220bb966092ef46f8a8f44.variable();
                else
                    ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = BigFoot_GetModVariable(__mod, ModManagement_7e7860987b220bb966092ef46f8a8f44.variable);
                end
                if (ModManagement_7e7860987b220bb966092ef46f8a8f44.filter) then
                    ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = ModManagement_7e7860987b220bb966092ef46f8a8f44.filter(ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
                end
                local ModManagement_65e9560969006f78eac65995592e2849;
                if (ModManagement_7e7860987b220bb966092ef46f8a8f44.list) then
                    for i, v in ipairs(ModManagement_7e7860987b220bb966092ef46f8a8f44.list) do
                        if (v == ModManagement_be741bd2030ad8ad70d14fb34b673ab8) then
                            ModManagement_65e9560969006f78eac65995592e2849 = true;
                        end
                    end
                elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.range) then
                    if (type(ModManagement_be741bd2030ad8ad70d14fb34b673ab8) == "number" and ModManagement_be741bd2030ad8ad70d14fb34b673ab8 >= ModManagement_7e7860987b220bb966092ef46f8a8f44.range[1] and ModManagement_be741bd2030ad8ad70d14fb34b673ab8 <= ModManagement_7e7860987b220bb966092ef46f8a8f44.range[2]) then
                        ModManagement_65e9560969006f78eac65995592e2849 = true;
                    end
                end
                if (not ModManagement_65e9560969006f78eac65995592e2849) then
                    ModManagement_be741bd2030ad8ad70d14fb34b673ab8 = ModManagement_6298f44b9ef6828905d277c87f5e1bbd.default;
                end
                ModManagement_SetElementText(ModManagement_6298f44b9ef6828905d277c87f5e1bbd, ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
                if (ModManagement_7e7860987b220bb966092ef46f8a8f44.range) then
                    ModManagement_1dc850a376f9ba5d68ff11c1285409f0:SetNumber(ModManagement_be741bd2030ad8ad70d14fb34b673ab8);
                    tinsert(ModManagement_31064ed6053563897041665f34248604[__mod], ModManagement_1dc850a376f9ba5d68ff11c1285409f0:GetName());
                end
                ModManagement_SetPos(ModManagement_6298f44b9ef6828905d277c87f5e1bbd, ModManagement_d7383de8409225d06a0cedfd4031edf0);
                ModManagement_6298f44b9ef6828905d277c87f5e1bbd:Show();
                if (ModManagement_6298f44b9ef6828905d277c87f5e1bbd.indent >= 1) then
                    if (ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_6298f44b9ef6828905d277c87f5e1bbd.indent - 1]) then
                        table.insert(ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_6298f44b9ef6828905d277c87f5e1bbd.indent - 1].children, ModManagement_6298f44b9ef6828905d277c87f5e1bbd);
                    end
                    if (ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_6298f44b9ef6828905d277c87f5e1bbd.indent - 1] and ModManagement_IsElementActivated(ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_6298f44b9ef6828905d277c87f5e1bbd.indent - 1]) and ModManagement_IsElementEnabled(ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_6298f44b9ef6828905d277c87f5e1bbd.indent - 1])) then
                        ModManagement_SetElementEnabled(ModManagement_6298f44b9ef6828905d277c87f5e1bbd, true);
                    else
                        ModManagement_SetElementEnabled(ModManagement_6298f44b9ef6828905d277c87f5e1bbd, false);
                    end
                else
                    ModManagement_SetElementEnabled(ModManagement_6298f44b9ef6828905d277c87f5e1bbd, true);
                end
                ModManagement_d7383de8409225d06a0cedfd4031edf0 = ModManagement_6298f44b9ef6828905d277c87f5e1bbd;
                if (not ModManagement_8ada1e5f1cf8232461562168fef4081a) then
                    ModManagement_8ada1e5f1cf8232461562168fef4081a = {};
                end
                ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_6298f44b9ef6828905d277c87f5e1bbd.indent] = ModManagement_6298f44b9ef6828905d277c87f5e1bbd;
            elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "BUTTON" and ModManagement_7e7860987b220bb966092ef46f8a8f44.page == ModManagement_7193346511e6cfd5aa01fac54f2cd168) then
                if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5) then
                    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.mod = __mod;
                    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.callback = ModManagement_7e7860987b220bb966092ef46f8a8f44.callback;
                    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.caption = ModManagement_7e7860987b220bb966092ef46f8a8f44.caption;
                    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.indent = ModManagement_7e7860987b220bb966092ef46f8a8f44.indent;
                    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.type = "BUTTON";
                    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.children = {};
                    ModManagement_SetElementText(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5, ModManagement_7e7860987b220bb966092ef46f8a8f44.caption);
                    ModManagement_SetPos(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5, ModManagement_d7383de8409225d06a0cedfd4031edf0);
                    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Show();
                    ModManagement_3a8b5e464751a955ba4c6d2e5a20ec89 = ModManagement_3a8b5e464751a955ba4c6d2e5a20ec89 + 1;
                    if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.indent >= 1) then
                        if (ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.indent - 1]) then
                            table.insert(ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.indent - 1].children, ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5);
                        end
                        if (ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.indent - 1] and ModManagement_IsElementActivated(ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.indent - 1]) and ModManagement_IsElementEnabled(ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.indent - 1])) then
                            ModManagement_SetElementEnabled(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5, true);
                        else
                            ModManagement_SetElementEnabled(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5, false);
                        end
                    else
                        ModManagement_SetElementEnabled(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5, true);
                    end
                    ModManagement_d7383de8409225d06a0cedfd4031edf0 = ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5;
                    if (not ModManagement_8ada1e5f1cf8232461562168fef4081a) then
                        ModManagement_8ada1e5f1cf8232461562168fef4081a = {};
                    end
                    ModManagement_8ada1e5f1cf8232461562168fef4081a[ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.indent] = ModManagement_6298f44b9ef6828905d277c87f5e1bbd;
                end
            end
        end
    end
    local ModManagement_75c9af9f6623fc55d5d5fa34b493e3bb, ModManagement_41edba67019224a34b3ca10ac4c10663, ModManagement_db73d30f1db62e80f097a2677025f04b;
    for ModManagement_75c9af9f6623fc55d5d5fa34b493e3bb = ModManagement_2c3bbe3ead1f0327c923570fe1d21cbd, ModManagement_6953b2e4d6710c36e11df69825d6ce1f, 1 do
        local ModManagement_e200ab3f235cf525764c5da4fd03b36d = getglobal("ModOptionCheckButton" .. ModManagement_75c9af9f6623fc55d5d5fa34b493e3bb);
        if (ModManagement_e200ab3f235cf525764c5da4fd03b36d) then
            ModManagement_e200ab3f235cf525764c5da4fd03b36d:SetPoint("TOPLEFT", "ModManagementFrame", "TOPLEFT", 0, 0);
            ModManagement_e200ab3f235cf525764c5da4fd03b36d:Hide();
        end
    end
    for ModManagement_db73d30f1db62e80f097a2677025f04b = ModManagement_3a8b5e464751a955ba4c6d2e5a20ec89, ModManagement_29ab8a01af486ec717579377ead3adb2, 1 do
        local ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ModOptionCommandButton" .. ModManagement_db73d30f1db62e80f097a2677025f04b);
        if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5) then
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetPoint("TOPLEFT", "ModManagementFrame", "TOPLEFT", 0, 0);
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Hide();
        end
    end
end

function ModButton_OnClick(self)
    if (not self.beingUsed) then
        local ModManagement_30b6f278098f3fa7bf562ea6d5620a66 = self:GetChecked();
        if (ModManagement_30b6f278098f3fa7bf562ea6d5620a66 and ModManagement_30b6f278098f3fa7bf562ea6d5620a66 ~= 0) then
            self:SetChecked(0);
        end
        return;
    end
    for ModManagement_e914904fab9d05d3f54d52bfc31a0f3f = 1, ModManagement_e96fdf71c0db12f9c3b4f119267ff1d2, 1 do
        local ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ModButton" .. ModManagement_e914904fab9d05d3f54d52bfc31a0f3f);
        if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 and ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetChecked() and ModManagement_e914904fab9d05d3f54d52bfc31a0f3f ~= self:GetID()) then
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetChecked(0);
        end
    end
    local ModManagement_30b6f278098f3fa7bf562ea6d5620a66 = self:GetChecked();
    if (ModManagement_30b6f278098f3fa7bf562ea6d5620a66 and ModManagement_30b6f278098f3fa7bf562ea6d5620a66 ~= 0) then
        self:SetChecked(ModManagement_30b6f278098f3fa7bf562ea6d5620a66);
        PlaySound("igMainMenuOptionCheckBoxOn");
        ModManagement_a4f54dcbb0efcead0035ed62a5eebdc6(self.relativedMod);
        ModManagement_2f354dd9ac8608b8fc606ddd4cb20bdc = self.relativedMod;
    else
        self:SetChecked(1);
    end
end

function ModButton_OnEnter(self)
    ModManagementTooltip:SetOwner(ModManagementFrame, "ANCHOR_TOPLEFT");
    local append_mode;
    if (self.tooltip) then
        if (self.title) then
            ModManagementTooltip:SetText(self.title, 1.0, 1.0, 1.0);
            append_mode = 1;
        end
        if (append_mode) then
            ModManagementTooltip:AddLine(self.tooltip, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
        else
            ModManagementTooltip:SetText(self.tooltip, 1.0, 1.0, 1.0, 1, 1);
        end
        ModManagementTooltip:Show();
    end
end

function ModButton_OnLeave(self)
    ModManagementTooltip:Hide();
end

function ModButton_OnUpdate(self)
end

function ModPrevPageButton_OnClick(self)
    ModManagement_b23a59ea1e0dab21ca3d5e217861e62a(ModManagement_bdf5390627ce5a4b3179bab176fd094f - 1);
    PlaySound("UChatScrollButton");
end

function ModNextPageButton_OnClick(self)
    ModManagement_b23a59ea1e0dab21ca3d5e217861e62a(ModManagement_bdf5390627ce5a4b3179bab176fd094f + 1);
    PlaySound("UChatScrollButton");
end

function ModManagement_RegisterMod(__mod, ModManagement_9248008bbb6d0ee7ce13f6ee45680051, ModManagement_e6955c64cf39bdb23dc86de1a9ec2117, ModManagement_1f8f756ad78ea47fd6befbe88ce49a67, ModManagement_6c162b1123a1eb57c1827271b32b6959, ModManagement_8564ebc5c223f37712c092cd808d9ec3)
    if (not ModManagement_7a9eaaf93ef7c8a058d8e7841b726add) then
        ModManagement_7a9eaaf93ef7c8a058d8e7841b726add = {};
    end
    local ModManagement_7e7860987b220bb966092ef46f8a8f44 = {};
    ModManagement_7e7860987b220bb966092ef46f8a8f44.name = __mod;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.texture = ModManagement_9248008bbb6d0ee7ce13f6ee45680051;
    if (type(ModManagement_e6955c64cf39bdb23dc86de1a9ec2117) == "table") then
        ModManagement_7e7860987b220bb966092ef46f8a8f44.text = ModManagement_e6955c64cf39bdb23dc86de1a9ec2117[1];
        ModManagement_7e7860987b220bb966092ef46f8a8f44.sort = ModManagement_e6955c64cf39bdb23dc86de1a9ec2117[2];
    else
        ModManagement_7e7860987b220bb966092ef46f8a8f44.text = ModManagement_e6955c64cf39bdb23dc86de1a9ec2117;
    end
    ModManagement_7e7860987b220bb966092ef46f8a8f44.subText = ModManagement_1f8f756ad78ea47fd6befbe88ce49a67;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.tooltip = ModManagement_6c162b1123a1eb57c1827271b32b6959;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.custom_frame = ModManagement_8564ebc5c223f37712c092cd808d9ec3
    ModManagement_7a9eaaf93ef7c8a058d8e7841b726add[__mod] = ModManagement_7e7860987b220bb966092ef46f8a8f44;
end

function ModManagement_RegisterStatic(__mod, ModManagement_8e3871d69d44135433f03817d7f4d33c)
    local ModManagement_7e7860987b220bb966092ef46f8a8f44 = {};
    ModManagement_7e7860987b220bb966092ef46f8a8f44.type = "STATIC";
    ModManagement_7e7860987b220bb966092ef46f8a8f44.caption = ModManagement_8e3871d69d44135433f03817d7f4d33c;
    if (not BigFoot_ModOptionConfig[__mod]) then
        BigFoot_ModOptionConfig[__mod] = {};
    end
    table.insert(BigFoot_ModOptionConfig[__mod], ModManagement_7e7860987b220bb966092ef46f8a8f44);
end

function ModManagement_RegisterCheckBox(__mod, ModManagement_8e3871d69d44135433f03817d7f4d33c, ModManagement_6c162b1123a1eb57c1827271b32b6959, ModManagement_be741bd2030ad8ad70d14fb34b673ab8, ModManagement_45843be1bc05f0297089e6a3e93d0ab0, ModManagement_6aec56fd400c2ff60374decd93586868, ModManagement_57a628991f5503e29f2de07253e1cfd2)
    local ModManagement_7e7860987b220bb966092ef46f8a8f44 = {};
    ModManagement_7e7860987b220bb966092ef46f8a8f44.type = "CHECKBOX";
    ModManagement_7e7860987b220bb966092ef46f8a8f44.caption = ModManagement_8e3871d69d44135433f03817d7f4d33c;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.tooltip = ModManagement_6c162b1123a1eb57c1827271b32b6959;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.variable = ModManagement_be741bd2030ad8ad70d14fb34b673ab8;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.default = ModManagement_45843be1bc05f0297089e6a3e93d0ab0;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.callback = ModManagement_6aec56fd400c2ff60374decd93586868;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.indent = ModManagement_57a628991f5503e29f2de07253e1cfd2 or 0;
    if (not BigFoot_ModOptionConfig[__mod]) then
        BigFoot_ModOptionConfig[__mod] = {};
    end
    table.insert(BigFoot_ModOptionConfig[__mod], ModManagement_7e7860987b220bb966092ef46f8a8f44);
end

function ModManagement_RegisterSpinBox(__mod, ModManagement_8e3871d69d44135433f03817d7f4d33c, ModManagement_6c162b1123a1eb57c1827271b32b6959, ModManagement_be741bd2030ad8ad70d14fb34b673ab8, ModManagement_6d5e7d83d8358745ae4dcf61d16bd1f3, ModManagement_8e6c2aaeb6b11f026ff5cb0a29aebe68, ModManagement_45843be1bc05f0297089e6a3e93d0ab0, ModManagement_6aec56fd400c2ff60374decd93586868, ModManagement_57a628991f5503e29f2de07253e1cfd2)
    local ModManagement_7e7860987b220bb966092ef46f8a8f44 = {};
    ModManagement_7e7860987b220bb966092ef46f8a8f44.type = "SPINBOX";
    ModManagement_7e7860987b220bb966092ef46f8a8f44.caption = ModManagement_8e3871d69d44135433f03817d7f4d33c;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.tooltip = ModManagement_6c162b1123a1eb57c1827271b32b6959;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.variable = ModManagement_be741bd2030ad8ad70d14fb34b673ab8;
    if (ModManagement_6d5e7d83d8358745ae4dcf61d16bd1f3 == "range") then
        ModManagement_7e7860987b220bb966092ef46f8a8f44.range = ModManagement_8e6c2aaeb6b11f026ff5cb0a29aebe68;
    elseif (ModManagement_6d5e7d83d8358745ae4dcf61d16bd1f3 == "list") then
        ModManagement_7e7860987b220bb966092ef46f8a8f44.list = ModManagement_8e6c2aaeb6b11f026ff5cb0a29aebe68;
    else
        assert("Invalid spinbox type.");
    end
    ModManagement_7e7860987b220bb966092ef46f8a8f44.default = ModManagement_45843be1bc05f0297089e6a3e93d0ab0;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.callback = ModManagement_6aec56fd400c2ff60374decd93586868;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.indent = ModManagement_57a628991f5503e29f2de07253e1cfd2 or 0;
    if (not BigFoot_ModOptionConfig[__mod]) then
        BigFoot_ModOptionConfig[__mod] = {};
    end
    table.insert(BigFoot_ModOptionConfig[__mod], ModManagement_7e7860987b220bb966092ef46f8a8f44);
end

function ModManagement_RegisterButton(__mod, ModManagement_8e3871d69d44135433f03817d7f4d33c, ModManagement_6aec56fd400c2ff60374decd93586868, ModManagement_6c162b1123a1eb57c1827271b32b6959, ModManagement_57a628991f5503e29f2de07253e1cfd2)
    local ModManagement_7e7860987b220bb966092ef46f8a8f44 = {};
    ModManagement_7e7860987b220bb966092ef46f8a8f44.type = "BUTTON";
    ModManagement_7e7860987b220bb966092ef46f8a8f44.caption = ModManagement_8e3871d69d44135433f03817d7f4d33c;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.callback = ModManagement_6aec56fd400c2ff60374decd93586868;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.tooltip = ModManagement_6c162b1123a1eb57c1827271b32b6959;
    ModManagement_7e7860987b220bb966092ef46f8a8f44.indent = ModManagement_57a628991f5503e29f2de07253e1cfd2 or 0;
    if (not BigFoot_ModOptionConfig[__mod]) then
        BigFoot_ModOptionConfig[__mod] = {};
    end
    table.insert(BigFoot_ModOptionConfig[__mod], ModManagement_7e7860987b220bb966092ef46f8a8f44);
end

function ModManagement_GetDefaultValue(__mod, ModManagement_be741bd2030ad8ad70d14fb34b673ab8)
    if (BigFoot_ModOptionConfig[__mod]) then
        local __index, ModManagement_2361bab8b48b1041ad740bb561b21aee;
        for __index, ModManagement_2361bab8b48b1041ad740bb561b21aee in pairs(BigFoot_ModOptionConfig[__mod]) do
            if (ModManagement_2361bab8b48b1041ad740bb561b21aee.variable == ModManagement_be741bd2030ad8ad70d14fb34b673ab8) then
                return ModManagement_2361bab8b48b1041ad740bb561b21aee.default;
            end
        end
    end
end

function ModOptionCheckButton_Refresh(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5)
    local ModManagement_30b6f278098f3fa7bf562ea6d5620a66 = ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetChecked();
    if (not ModManagement_30b6f278098f3fa7bf562ea6d5620a66) then
        ModManagement_30b6f278098f3fa7bf562ea6d5620a66 = 0;
    end
    if (type(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.variable) ~= "function") then
        BigFoot_SetModVariable(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.mod, ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.variable, ModManagement_30b6f278098f3fa7bf562ea6d5620a66);
    end
    if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.callback) then
        if (ModManagement_IsElementEnabled(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5)) then
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.callback(ModManagement_30b6f278098f3fa7bf562ea6d5620a66);
        else
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.callback(0);
        end
    end
    if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.children) then
        if (ModManagement_30b6f278098f3fa7bf562ea6d5620a66 == 1 and ModManagement_IsElementEnabled(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5)) then
            for __index, ModManagement_2361bab8b48b1041ad740bb561b21aee in pairs(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.children) do
                ModManagement_SetElementEnabled(ModManagement_2361bab8b48b1041ad740bb561b21aee, true);
                if (ModManagement_2361bab8b48b1041ad740bb561b21aee.type == "CHECKBOX" and ModManagement_2361bab8b48b1041ad740bb561b21aee.callback) then
                    ModManagement_2361bab8b48b1041ad740bb561b21aee.callback(ModManagement_IsElementActivated(ModManagement_2361bab8b48b1041ad740bb561b21aee));
                elseif (ModManagement_2361bab8b48b1041ad740bb561b21aee.type == "SPINBOX" and ModManagement_2361bab8b48b1041ad740bb561b21aee.callback) then
                    local ModManagement_65e9560969006f78eac65995592e2849;
                    if (ModManagement_2361bab8b48b1041ad740bb561b21aee.list) then
                        for i, v in ipairs(ModManagement_2361bab8b48b1041ad740bb561b21aee.list) do
                            if (v == ModManagement_be741bd2030ad8ad70d14fb34b673ab8) then
                                ModManagement_65e9560969006f78eac65995592e2849 = true;
                            end
                        end
                    end
                    if (ModManagement_65e9560969006f78eac65995592e2849) then
                        ModManagement_2361bab8b48b1041ad740bb561b21aee.callback(BigFoot_GetModVariable(ModManagement_2361bab8b48b1041ad740bb561b21aee.mod, ModManagement_2361bab8b48b1041ad740bb561b21aee.variable));
                    end
                end
                if (ModManagement_2361bab8b48b1041ad740bb561b21aee.type == "CHECKBOX") then
                    ModOptionCheckButton_Refresh(ModManagement_2361bab8b48b1041ad740bb561b21aee);
                end
            end
        else
            for __index, ModManagement_2361bab8b48b1041ad740bb561b21aee in pairs(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.children) do
                ModManagement_SetElementEnabled(ModManagement_2361bab8b48b1041ad740bb561b21aee, false);
                if (ModManagement_2361bab8b48b1041ad740bb561b21aee.type == "CHECKBOX" and ModManagement_2361bab8b48b1041ad740bb561b21aee.callback) then
                    ModManagement_2361bab8b48b1041ad740bb561b21aee.callback(0);
                elseif (ModManagement_2361bab8b48b1041ad740bb561b21aee.type == "SPINBOX" and ModManagement_2361bab8b48b1041ad740bb561b21aee.callback) then
                    ModManagement_2361bab8b48b1041ad740bb561b21aee.callback(nil);
                end
                if (ModManagement_2361bab8b48b1041ad740bb561b21aee.type == "CHECKBOX") then
                    ModOptionCheckButton_Refresh(ModManagement_2361bab8b48b1041ad740bb561b21aee);
                end
            end
        end
    end
end

function ModOptionCheckButton_OnClick(self)
    ModOptionCheckButton_Refresh(self);
end

function ModOptionCommandButton_OnClick(self)
    if (self.callback) then
        self.callback();
    end
end

function ModLinkButton_OnClick(self)
    local index;
    local id;
    id = self:GetID();
    if (self:GetChecked() == 0 or self:GetChecked() == nil) then
        self:SetChecked(1);
        return;
    end
    for index = 1, ModManagement_c0f398ee197de9cd7285479985e22494, 1 do
        local button = getglobal("ModLinkButton" .. index);
        if (button and index ~= id) then
            button:SetChecked(0);
        end
    end
    PlaySound("igMainMenuOptionCheckBoxOn");
    ModManagementWelcomeText:Hide();
    ModManagementLogo:Hide();
    ModManagementWatermark:Hide();
    index = tonumber(id);
    ModManagementLinkText:SetText(ModManagement_37ba969bc87af9e4ef8a83555ac7897d[index]["text"]);
    ModManagementLinkText:Show();
end

function ModLinkButton_OnLoad(self)
    local ModManagement_9248008bbb6d0ee7ce13f6ee45680051 = getglobal(self:GetName() .. "NormalTexture");
    local ModManagement_8d0febf2348ea712b2b375ae95601d5f = self:GetID();
    local __index = tonumber(ModManagement_8d0febf2348ea712b2b375ae95601d5f);
    if (ModManagement_9248008bbb6d0ee7ce13f6ee45680051 and ModManagement_37ba969bc87af9e4ef8a83555ac7897d[__index]) then
        ModManagement_9248008bbb6d0ee7ce13f6ee45680051:SetTexture(ModManagement_37ba969bc87af9e4ef8a83555ac7897d[__index]["logo"]);
    end
end

function ModLinkButton_OnEnter(self)
end

function ModLinkButton_OnLeave(self)
end

function ModLink_ShowLinkPage(__index)
end

function ModManagement_6b01347d503462d225d8a47ed2b14af4()
    local __index;
    for __index = 1, ModManagement_c0f398ee197de9cd7285479985e22494, 1 do
        local ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ModLinkButton" .. __index);
        if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5) then
            ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Hide();
        end
    end
end

function ModManagement_aaa0ba750c8452167f2ee5c7183b4aef()
    local __index;
    for __index = 1, ModManagement_c0f398ee197de9cd7285479985e22494, 1 do
        local ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("ModLinkButton" .. __index);
        if (ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5) then
            if (ModManagement_37ba969bc87af9e4ef8a83555ac7897d[__index]) then
                ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Show();
                ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetChecked(nil);
            else
                ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Hide();
            end
        end
    end
end

function MobElement_Disable(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5)
    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Disable();
    local textOb = getglobal(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName() .. "Text");
    if (textOb) then
        textOb:SetTextColor(0.5, 0.5, 0.5);
    end
    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.enabled = false;
end

function MobElement_Enable(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5)
    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:Enable();
    local textOb = getglobal(ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetName() .. "Text");
    if (textOb) then
        textOb:SetTextColor(1.0, 0.82, 0);
    end
    ModManagement_99f3cf2c6f1fdfadb0fd4ab6e0843bf5.enabled = true;
end

function ModManagement_SetElementText(ModManagement_7e7860987b220bb966092ef46f8a8f44, ModManagement_e6955c64cf39bdb23dc86de1a9ec2117)
    if (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "BUTTON") then
        ModManagement_7e7860987b220bb966092ef46f8a8f44:SetText(ModManagement_e6955c64cf39bdb23dc86de1a9ec2117);
    elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "CHECKBOX") then
        getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text"):SetText(ModManagement_e6955c64cf39bdb23dc86de1a9ec2117);
    elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "SPINBOX") then
        getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text"):SetText(ModManagement_e6955c64cf39bdb23dc86de1a9ec2117);
    end
end

function ModManagement_SetElementActivated(ModManagement_7e7860987b220bb966092ef46f8a8f44, ModManagement_b3d613c3bf1d0980ce6cef3bfaa1125e)
    if (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "CHECKBOX") then
        ModManagement_7e7860987b220bb966092ef46f8a8f44:SetChecked(ModManagement_b3d613c3bf1d0980ce6cef3bfaa1125e);
    end
end

function ModManagement_SetElementEnabled(ModManagement_7e7860987b220bb966092ef46f8a8f44, ModManagement_98a5dc0296fddcc9b5b804f038f1994c)
    if (ModManagement_98a5dc0296fddcc9b5b804f038f1994c) then
        if (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "BUTTON") then
            ModManagement_7e7860987b220bb966092ef46f8a8f44:Enable();
            ModManagement_8e3871d69d44135433f03817d7f4d33c = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text");
            if (ModManagement_8e3871d69d44135433f03817d7f4d33c) then
                ModManagement_8e3871d69d44135433f03817d7f4d33c:SetTextColor(1.0, 0.82, 0);
            end
        elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "CHECKBOX") then
            ModManagement_7e7860987b220bb966092ef46f8a8f44:Enable();
            ModManagement_8e3871d69d44135433f03817d7f4d33c = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text");
            if (ModManagement_8e3871d69d44135433f03817d7f4d33c) then
                ModManagement_8e3871d69d44135433f03817d7f4d33c:SetTextColor(1.0, 0.82, 0);
            end
        elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "SPINBOX") then
            local ModManagement_12e49080c26b8b9fdea4fa8965254f05 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Title");
            local ModManagement_a3c41e6cc8b79e0a0af9a804dcf31ac7 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "PrevButton");
            local ModManagement_7363386aabdb3c193c107a03673fdd6f = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "NextButton");
            local ModManagement_e6955c64cf39bdb23dc86de1a9ec2117 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text");
            ModManagement_12e49080c26b8b9fdea4fa8965254f05:SetTextColor(1.0, 0.82, 0);
            ModManagement_a3c41e6cc8b79e0a0af9a804dcf31ac7:Enable();
            ModManagement_7363386aabdb3c193c107a03673fdd6f:Enable();
            ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:SetTextColor(1.0, 0.82, 0);
        end
        ModManagement_7e7860987b220bb966092ef46f8a8f44.enabled = true;
    else
        if (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "BUTTON") then
            ModManagement_7e7860987b220bb966092ef46f8a8f44:Disable();
            ModManagement_8e3871d69d44135433f03817d7f4d33c = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text");
            if (ModManagement_8e3871d69d44135433f03817d7f4d33c) then
                ModManagement_8e3871d69d44135433f03817d7f4d33c:SetTextColor(0.5, 0.5, 0.5);
            end
        elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "CHECKBOX") then
            ModManagement_7e7860987b220bb966092ef46f8a8f44:Disable();
            ModManagement_8e3871d69d44135433f03817d7f4d33c = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text");
            if (ModManagement_8e3871d69d44135433f03817d7f4d33c) then
                ModManagement_8e3871d69d44135433f03817d7f4d33c:SetTextColor(0.5, 0.5, 0.5);
            end
        elseif (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "SPINBOX") then
            local ModManagement_12e49080c26b8b9fdea4fa8965254f05 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Title");
            local ModManagement_a3c41e6cc8b79e0a0af9a804dcf31ac7 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "PrevButton");
            local ModManagement_7363386aabdb3c193c107a03673fdd6f = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "NextButton");
            local ModManagement_e6955c64cf39bdb23dc86de1a9ec2117 = getglobal(ModManagement_7e7860987b220bb966092ef46f8a8f44:GetName() .. "Text");
            ModManagement_12e49080c26b8b9fdea4fa8965254f05:SetTextColor(0.5, 0.5, 0.5);
            ModManagement_a3c41e6cc8b79e0a0af9a804dcf31ac7:Disable();
            ModManagement_7363386aabdb3c193c107a03673fdd6f:Disable();
            ModManagement_e6955c64cf39bdb23dc86de1a9ec2117:SetTextColor(0.5, 0.5, 0.5);
        end
        ModManagement_7e7860987b220bb966092ef46f8a8f44.enabled = false;
    end
end

function ModManagement_IsElementEnabled(ModManagement_7e7860987b220bb966092ef46f8a8f44)
    return ModManagement_7e7860987b220bb966092ef46f8a8f44.enabled;
end

function ModManagement_IsElementActivated(ModManagement_7e7860987b220bb966092ef46f8a8f44)
    if (ModManagement_7e7860987b220bb966092ef46f8a8f44.type == "CHECKBOX") then
        return ModManagement_7e7860987b220bb966092ef46f8a8f44:GetChecked();
    else
        return false;
    end
end

function ModElement_OnEnter(self)
    if (self.disabled) then
        return;
    end
    local textOb = getglobal(self:GetName() .. "Text");
    textOb:SetTextColor(1.0, 1.0, 1.0);
    ModManagementTooltip:SetOwner(ModManagementFrame, "ANCHOR_TOPLEFT");
    local append_mode;
    if (self.tooltip) then
        if (self.caption) then
            ModManagementTooltip:SetText(self.caption, 1.0, 1.0, 1.0);
            append_mode = 1;
        end
        if (append_mode) then
            ModManagementTooltip:AddLine(self.tooltip, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
        else
            ModManagementTooltip:SetText(self.tooltip, 1.0, 1.0, 1.0, 1, 1);
        end
        ModManagementTooltip:Show();
    end
end

function ModElement_OnLeave(self)
    if (self.diabled) then
        return;
    end
    local textOb = getglobal(self:GetName() .. "Text");
    textOb:SetTextColor(1.0, 0.82, 0);
    ModManagementTooltip:Hide();
end
