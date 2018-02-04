BigFoot_Error = {};
BigFootError_16e6206302d8896e04f5bd663100b77c = {};
BigFootError_63e245f7328a7e8754e1841db6520090 = {};
BigFootError_7a1998304aafd4840dea34476ceba5ba = _ERRORMESSAGE;
BigFootError_49d7a8b20e14855b6ca8bcddc62894e1 = message;
_ERRORMESSAGE = nil;
message = nil;
BigFootError_191f3a41d718a666285988b6afeadb70 = nil;
BigFootError_583a67a343c6e44cce084cddd4b7bd29 = nil;
BigFootError_54456e0759e21b05a338afba884cc512 = 1;

if (GetLocale() == "zhCN") then
    BFE_HIDE = "屏蔽错误";
    BFE_DISABLE = "禁止相关插件";
    BFE_HEADER = "脚本错误 (版本 %s)";
    BFE_PREFIX_FILE = "文件名：";
    BFE_PREFIX_LINE = "行　号：";
    BFE_NOTE = "如果您发现弹出该脚本错误对话框，请使用Ctrl+C键将下方的调用堆栈的内容复制下来，粘贴到大脚论坛。网址是：\n\"http://bbs.bigfoot.net.cn\"，谢谢您支持大脚插件！"
    BFE_NON_NOTE = "您的插件触发了脚本错误，可能导致错误的插件有：\n\n";
    BFE_SYSTEM_ERROR = "您的宏或者标准界面触发了脚本错误，请检查您的宏设置或者WOW的完整性。";
    BFE_CLOSE_TITLE = "关闭窗口";
    BFE_CLOSE_COMMENT = "关闭当前的脚本错误提示窗口。";
    BFE_HIDE_TITLE = "屏蔽错误";
    BFE_HIDE_COMMENT = "当一些错误信息重复出现的时候，你可以通过“屏蔽错误”来达到禁止同样的错误重复弹出的目的。";
    BFE_DISABLE_TITLE = "禁止相关插件";
    BFE_DISABLE_COMMENT = "当该按钮是激活的状态时，说明你可以通过关闭造成错误的插件以防止同类错误重复发生。当该按钮是非激活状态时，说明无法找到相关联的插件。";
elseif (GetLocale() == "zhTW") then
    BFE_HIDE = "隱藏錯誤";
    BFE_DISABLE = "禁止相關插件";
    BFE_HEADER = "腳本錯誤 (版本 %s)";
    BFE_PREFIX_FILE = "文件名：";
    BFE_PREFIX_LINE = "行　號：";
    BFE_NOTE = "如果您發現彈出該腳本錯誤對話方塊，請使用Ctrl+C鍵將下方的調用堆疊的內容複製下來，粘貼到大腳論壇。網址是：\n\"http://bbs.bigfoot.net.cn\"，謝謝您支持大腳外掛程式！"
    BFE_NON_NOTE = "您的外掛程式觸發了腳本錯誤，可能導致錯誤的外掛程式有：\n\n";
    BFE_SYSTEM_ERROR = "您的巨集或者標準介面觸發了腳本錯誤，請檢查您的宏設置或者WOW的完整性。";
    BFE_CLOSE_TITLE = "關閉視窗";
    BFE_CLOSE_COMMENT = "關閉目前的腳本錯誤提示視窗。";
    BFE_HIDE_TITLE = "隱藏錯誤";
    BFE_HIDE_COMMENT = "當一些錯誤訊息重複出現的時候，你可以透過「隱藏錯誤」來達到禁止同樣的錯誤重複彈出的目的。";
    BFE_DISABLE_TITLE = "禁止相關插件";
    BFE_DISABLE_COMMENT = "當該按鈕是啟動的狀態時，說明你可以透過關閉造成錯誤的插件以防止同類錯誤重複發生。當該按鈕是非啟動狀態時，說明無法找到相關的插件。";
else
    BFE_HIDE = "Hide Error";
    BFE_DISABLE = "Disable Mod";
    BFE_HEADER = "Script Error (Version %s)";
    BFE_PREFIX_FILE = "Filename: ";
    BFE_PREFIX_LINE = "Line: ";
    BFE_NOTE = "If you find this message, please press Ctrl+C to copy the following call stack and paste it on forum. The URL is\n\"http://bbs.bigfoot.net.cn\", Thanks for your help!"
    BFE_NON_NOTE = "There is an script error occcurred in your addons:\n\n";
    BFE_SYSTEM_ERROR = "There is an scrpt error in your macro or standard interface, please check your macroes and interface.";
    BFE_CLOSE_TITLE = "Close Window";
    BFE_CLOSE_COMMENT = "Close current script error window.";
    BFE_HIDE_TITLE = "Hide Error";
    BFE_HIDE_COMMENT = "You can \"hide error\" to prevent from always showing the same error window.";
    BFE_DISABLE_TITLE = "Disable Mod";
    BFE_DISABLE_COMMENT = "You can close error related mod to prevent from always showing the errors from same mod. It's active once it can be disabled.";
end

function BigFootError_49d8e76b2a95d9c2fbe526fe69bf4710()
    BigFootError_54456e0759e21b05a338afba884cc512 = 1;
end

function BIGFOOT_ERRORMESSAGE(BigFootError_eed0be1c2d5f65980b06b5094460c3c5)
    if (not BigFootError_eed0be1c2d5f65980b06b5094460c3c5 or type(BigFootError_eed0be1c2d5f65980b06b5094460c3c5) ~= "string") then
        return;
    end
    local BigFootError_71ac8c04e9eae3efc1f0b8abcf51fc4c = BigFoot_Hash(BigFootError_eed0be1c2d5f65980b06b5094460c3c5);
    if (BigFootError_16e6206302d8896e04f5bd663100b77c[BigFootError_71ac8c04e9eae3efc1f0b8abcf51fc4c]) then
        return;
    end
    local BigFootError_f622c4931a4714cc787b533eaaab65e7, BigFootError_8c87884c91c1797de5f7b99689b0976a, BigFootError_37ca8bb4456f9eb609d66a9c8d290c55, BigFootError_d19c45ccfeb67ac4ec8851203c94e263;
    local BigFootError_baa13c21288f98e62afb9d36f9f9c1f6 = BigFootError_eed0be1c2d5f65980b06b5094460c3c5;
    local BigFootError_6e4d0db7491d6883f86de390d20dbe5b, BigFootError_a2f3972c23a0aa3bd7fb0e9823d918f2, BigFootError_8c87884c91c1797de5f7b99689b0976a, BigFootError_37ca8bb4456f9eb609d66a9c8d290c55, BigFootError_507d6681fcdef58d30abee282846db75 = string.find(BigFootError_eed0be1c2d5f65980b06b5094460c3c5, "(.-):%s*(%d+):%s*(.+)");
    local BigFootError_97ab390b8ce710da12b2b3aa0de0090b = debugstack();
    if (not BigFootError_6e4d0db7491d6883f86de390d20dbe5b or not BigFootError_a2f3972c23a0aa3bd7fb0e9823d918f2) then
        BigFootError_8c87884c91c1797de5f7b99689b0976a = "";
        BigFootError_37ca8bb4456f9eb609d66a9c8d290c55 = "";
        BigFootError_507d6681fcdef58d30abee282846db75 = BigFootError_eed0be1c2d5f65980b06b5094460c3c5;
    end
    BigFootError_d19c45ccfeb67ac4ec8851203c94e263 = string.upper(string.sub(BigFootError_507d6681fcdef58d30abee282846db75, 1, 1)) .. string.sub(BigFootError_507d6681fcdef58d30abee282846db75, 2);
    if (BigFootError_8c87884c91c1797de5f7b99689b0976a and BigFootError_8c87884c91c1797de5f7b99689b0976a ~= "" and BigFootError_63e245f7328a7e8754e1841db6520090[BigFootError_8c87884c91c1797de5f7b99689b0976a]) then
        return;
    end
    if (BigFootError_54456e0759e21b05a338afba884cc512) then
        BigFoot_Error[BigFootError_71ac8c04e9eae3efc1f0b8abcf51fc4c] = {};
        BigFoot_Error[BigFootError_71ac8c04e9eae3efc1f0b8abcf51fc4c].file = BigFootError_8c87884c91c1797de5f7b99689b0976a;
        BigFoot_Error[BigFootError_71ac8c04e9eae3efc1f0b8abcf51fc4c].line = BigFootError_37ca8bb4456f9eb609d66a9c8d290c55;
        BigFoot_Error[BigFootError_71ac8c04e9eae3efc1f0b8abcf51fc4c].desc = BigFootError_d19c45ccfeb67ac4ec8851203c94e263;
        BigFoot_Error[BigFootError_71ac8c04e9eae3efc1f0b8abcf51fc4c].trace = BigFootError_97ab390b8ce710da12b2b3aa0de0090b;
        BigFootError_54456e0759e21b05a338afba884cc512 = nil;
        BigFoot_DelayCall(BigFootError_49d8e76b2a95d9c2fbe526fe69bf4710, 120);
    end
    BigFootError_191f3a41d718a666285988b6afeadb70 = debugstack();
    BigFootError_583a67a343c6e44cce084cddd4b7bd29 = BigFootError_eed0be1c2d5f65980b06b5094460c3c5;
    local BigFootError_901a5d19153b2c3fc63a6eccd6b5217c, BigFootError_c5438d0fe080373cae6b21f4a9342162 = BigFootError_03fb031674c2f59798281c1c1fa6ac3f(BigFootError_191f3a41d718a666285988b6afeadb70);
    if (BigFootError_901a5d19153b2c3fc63a6eccd6b5217c) then
        BFE_Note:SetText(BFE_NOTE);
        BFE_ScrollFrame:Show();
        BFE_CallStackBackground:Show();
        BigFootError_0b128a0a54ea3865c4bf96bab3747d76(BigFootError_baa13c21288f98e62afb9d36f9f9c1f6, BigFootError_8c87884c91c1797de5f7b99689b0976a, BigFootError_37ca8bb4456f9eb609d66a9c8d290c55, BigFootError_d19c45ccfeb67ac4ec8851203c94e263, BigFootError_97ab390b8ce710da12b2b3aa0de0090b);
    else
        local BigFootError_eed0be1c2d5f65980b06b5094460c3c5 = BFE_NON_NOTE;
        local BigFootError_1d83cdc1e308ccedc1274eff3148e471;
        for BigFootError_1652701c940a7445a6e43b954d36ec9b, _ in pairs(BigFootError_c5438d0fe080373cae6b21f4a9342162) do
            if (BigFootError_1652701c940a7445a6e43b954d36ec9b ~= "BigFoot") then
                local BigFootError_8983c60d66c8593ec7165ea9dbedb584, BigFootError_12e49080c26b8b9fdea4fa8965254f05 = GetAddOnInfo(BigFootError_1652701c940a7445a6e43b954d36ec9b);
                if (BigFootError_12e49080c26b8b9fdea4fa8965254f05) then
                    BigFootError_eed0be1c2d5f65980b06b5094460c3c5 = BigFootError_eed0be1c2d5f65980b06b5094460c3c5 .. " |cffff8000" .. BigFootError_1652701c940a7445a6e43b954d36ec9b .. "|r |cffffffff-|r |cffe0e0e0" .. BigFootError_12e49080c26b8b9fdea4fa8965254f05 .. "|r\n";
                else
                    BigFootError_eed0be1c2d5f65980b06b5094460c3c5 = BigFootError_eed0be1c2d5f65980b06b5094460c3c5 .. " |cffff8000" .. BigFootError_1652701c940a7445a6e43b954d36ec9b .. "|r\n";
                end
                BigFootError_1d83cdc1e308ccedc1274eff3148e471 = true;
            end
        end
        if (not BigFootError_1d83cdc1e308ccedc1274eff3148e471) then
            BFE_Note:SetText(BFE_SYSTEM_ERROR);
        else
            BFE_Note:SetText(BigFootError_eed0be1c2d5f65980b06b5094460c3c5);
        end
        BFE_ScrollFrame:Hide();
        BFE_CallStackBackground:Hide();
        BigFootError_0b128a0a54ea3865c4bf96bab3747d76(BigFootError_baa13c21288f98e62afb9d36f9f9c1f6, BigFootError_8c87884c91c1797de5f7b99689b0976a, BigFootError_37ca8bb4456f9eb609d66a9c8d290c55, BigFootError_d19c45ccfeb67ac4ec8851203c94e263, BigFootError_97ab390b8ce710da12b2b3aa0de0090b);
    end
end

function BigFootError_03fb031674c2f59798281c1c1fa6ac3f(BigFootError_97ab390b8ce710da12b2b3aa0de0090b)
    local addons = {};
    local BigFootError_6e4d0db7491d6883f86de390d20dbe5b, BigFootError_a2f3972c23a0aa3bd7fb0e9823d918f2, BigFootError_1652701c940a7445a6e43b954d36ec9b; BigFootError_6e4d0db7491d6883f86de390d20dbe5b, BigFootError_a2f3972c23a0aa3bd7fb0e9823d918f2, BigFootError_1652701c940a7445a6e43b954d36ec9b = string.find(BigFootError_97ab390b8ce710da12b2b3aa0de0090b, "\\AddOns\\(%w+)\\");
    while (BigFootError_6e4d0db7491d6883f86de390d20dbe5b and BigFootError_a2f3972c23a0aa3bd7fb0e9823d918f2 and BigFootError_1652701c940a7445a6e43b954d36ec9b) do
        if (not addons[BigFootError_1652701c940a7445a6e43b954d36ec9b]) then
            addons[BigFootError_1652701c940a7445a6e43b954d36ec9b] = true;
        end
        BigFootError_6e4d0db7491d6883f86de390d20dbe5b, BigFootError_a2f3972c23a0aa3bd7fb0e9823d918f2, BigFootError_1652701c940a7445a6e43b954d36ec9b = string.find(BigFootError_97ab390b8ce710da12b2b3aa0de0090b, "\\AddOns\\(%w+)\\", BigFootError_a2f3972c23a0aa3bd7fb0e9823d918f2);
    end
    for BigFootError_1652701c940a7445a6e43b954d36ec9b, _ in pairs(addons) do
        if (BigFootError_1652701c940a7445a6e43b954d36ec9b ~= "BigFoot" and GetAddOnMetadata(BigFootError_1652701c940a7445a6e43b954d36ec9b, "X-Revision") == "BigFoot") then
            return true;
        end
    end
    return false, addons;
end

function BigFootError_0b128a0a54ea3865c4bf96bab3747d76(BigFootError_baa13c21288f98e62afb9d36f9f9c1f6, BigFootError_8c87884c91c1797de5f7b99689b0976a, BigFootError_37ca8bb4456f9eb609d66a9c8d290c55, BigFootError_d19c45ccfeb67ac4ec8851203c94e263, BigFootError_97ab390b8ce710da12b2b3aa0de0090b)
    BigFootErrorFrame.total = BigFootError_baa13c21288f98e62afb9d36f9f9c1f6;
    BigFootErrorFrame.file = BigFootError_8c87884c91c1797de5f7b99689b0976a;
    BigFootErrorFrame.line = BigFootError_37ca8bb4456f9eb609d66a9c8d290c55;
    BigFootErrorFrame.desc = BigFootError_d19c45ccfeb67ac4ec8851203c94e263;
    BigFootErrorFrame.callstack = BigFootError_97ab390b8ce710da12b2b3aa0de0090b;
    BigFootErrorFrame:Show();
end

function BigFootError_OnHideButtonClicked(self)
    local BigFootError_71ac8c04e9eae3efc1f0b8abcf51fc4c = BigFoot_Hash(self:GetParent().total);
    BigFootError_16e6206302d8896e04f5bd663100b77c[BigFootError_71ac8c04e9eae3efc1f0b8abcf51fc4c] = 1;
    self:GetParent():Hide();
end

function BigFootErrorFrame_OnLoad(self)
    self:SetBackdropBorderColor(1.0, 0.0, 0.0);
    self:SetBackdropColor(0.5, 0.0, 0.0);
    self:RegisterEvent("VARIABLES_LOADED");
    self:RegisterEvent("ADDON_ACTION_FORBIDDEN");
    SlashCmdList["DEBUGERROR"] = BigFootError_cd0c81104fda3f120aab6147478c7812;
    SLASH_DEBUGERROR1 = "/showstack";
    BigFootErrorFrameHeader:SetText(string.format(BFE_HEADER, BIGFOOT_VERSION))
    seterrorhandler(BigFootError_bcc5f2ac07a80c2cac32e6c594a30622);
end

function BigFootError_bcc5f2ac07a80c2cac32e6c594a30622(BigFootError_eed0be1c2d5f65980b06b5094460c3c5, BigFootError_411b8aa6d5954c6020f0b9c9e80e847a)
    BIGFOOT_ERRORMESSAGE(BigFootError_eed0be1c2d5f65980b06b5094460c3c5);
end

function BigFoot_RegisterErrorResponse(BigFootError_a019f6453754082f25da769f4d991898, BigFootError_6aec56fd400c2ff60374decd93586868)
    if (BigFootError_a019f6453754082f25da769f4d991898 and type(BigFootError_a019f6453754082f25da769f4d991898) == "string") then
        BigFootError_63e245f7328a7e8754e1841db6520090[BigFootError_a019f6453754082f25da769f4d991898] = {};
        BigFootError_63e245f7328a7e8754e1841db6520090[BigFootError_a019f6453754082f25da769f4d991898].callback = BigFootError_6aec56fd400c2ff60374decd93586868;
    end
end

function BigFootErrorFrame_OnEvent(BigFootError_d0708241b607c9a9dd1953c812fadfb7)
    if (BigFootError_d0708241b607c9a9dd1953c812fadfb7 == "VARIABLES_LOADED") then
        BigFoot_Error = {};
    elseif (BigFootError_d0708241b607c9a9dd1953c812fadfb7 == "ADDON_ACTION_FORBIDDEN") then
        BigFootError_191f3a41d718a666285988b6afeadb70 = debugstack();
        BigFootError_583a67a343c6e44cce084cddd4b7bd29 = "The addon action is forbidden.";
    end
end

function BigFootError_OnDisableButtonClicked(self)
    local BigFootError_8c87884c91c1797de5f7b99689b0976a = self:GetParent().file;
    if (BigFootError_8c87884c91c1797de5f7b99689b0976a and type(BigFootError_8c87884c91c1797de5f7b99689b0976a) == "string") then
        if (BigFootError_63e245f7328a7e8754e1841db6520090[BigFootError_8c87884c91c1797de5f7b99689b0976a] and BigFootError_63e245f7328a7e8754e1841db6520090[BigFootError_8c87884c91c1797de5f7b99689b0976a].callback) then
            BigFootError_63e245f7328a7e8754e1841db6520090[BigFootError_8c87884c91c1797de5f7b99689b0976a].callback();
        end
    end
end

function BigFootError_CheckButtons(self)
    local BigFootError_8c87884c91c1797de5f7b99689b0976a = self.file;
    if (BigFootError_8c87884c91c1797de5f7b99689b0976a and type(BigFootError_8c87884c91c1797de5f7b99689b0976a) == "string") then
        if (BigFootError_63e245f7328a7e8754e1841db6520090[BigFootError_8c87884c91c1797de5f7b99689b0976a] and BigFootError_63e245f7328a7e8754e1841db6520090[BigFootError_8c87884c91c1797de5f7b99689b0976a].callback) then
            BigFootErrorFrameDisableButton:Enable();
            return;
        end
    end
    BigFootErrorFrameDisableButton:Disable();
end

function BigFootErrorFrame_OnHide(self)
    self.total = nil;
    self.file = nil;
    self.line = nil;
    self.desc = nil;
end

function BigFootError_OnCloseButtonEnter(self)
    GameTooltip_SetDefaultAnchor(GameTooltip, self);
    GameTooltip:ClearLines();
    GameTooltip_AddNewbieTip(self, BFE_CLOSE_TITLE, 1.0, 1.0, 1.0, BFE_CLOSE_COMMENT, 1);
end

function BigFootError_OnCloseButtonLeave(self)
    GameTooltip:Hide();
end

function BigFootError_OnHideButtonEnter(self)
    GameTooltip_SetDefaultAnchor(GameTooltip, self);
    GameTooltip:ClearLines();
    GameTooltip_AddNewbieTip(self, BFE_HIDE_TITLE, 1.0, 1.0, 1.0, BFE_HIDE_COMMENT, 1);
end

function BigFootError_OnHideButtonLeave()
    GameTooltip:Hide();
end

function BigFootError_OnDisableButtonEnter(self)
    GameTooltip_SetDefaultAnchor(GameTooltip, self);
    GameTooltip:ClearLines();
    GameTooltip_AddNewbieTip(self, BFE_DISABLE_TITLE, 1.0, 1.0, 1.0, BFE_DISABLE_COMMENT, 1);
end

function BigFootError_OnDisableButtonLeave(self)
    GameTooltip:Hide();
end

function BigFootError_cd0c81104fda3f120aab6147478c7812()
    BigFoot_Print("The last message is:");
    BigFoot_Print(BigFootError_583a67a343c6e44cce084cddd4b7bd29);
    BigFoot_Print("CallStack ==>");
    BigFoot_Print(BigFootError_191f3a41d718a666285988b6afeadb70);
end
