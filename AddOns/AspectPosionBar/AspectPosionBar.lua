------------------------------------------------------------------------------------------
-- AspectPosionBar ver 3.0
-- 日期: 2010-4-30 (2010-6-15)
-- 作者: dugu@bgifoot
-- 描述: 猎人守护动作条\盗贼的姿态条 + 毒药条\法师传送条
-- 版权所有 (c) duowan@com
------------------------------------------------------------------------------------------
AspectPosionBarFrame = LibStub("AceAddon-3.0"):NewAddon("AspectPosionBarFrame", "AceEvent-3.0", "AceHook-3.0");
local L = {};
local A = AspectPosionBarFrame;
A._DEBUG = false;
A.name = "AspectPosionBar";
A.class = select(2, UnitClass("player"));
A.enable = true;
if (GetLocale() == "zhCN") then
    L["左键 - 上毒主手"] = "左键 - 主手上毒";
    L["右键 - 上毒副手"] = "右键 - 副手上毒";
    L["麻醉药膏"] = "麻醉药膏";
    L["速效药膏"] = "速效药膏";
    L["致伤药膏"] = "致伤药膏";
    L["致命药膏"] = "致命药膏";
    L["麻痹药膏"] = "麻痹药膏";
    L["减速药膏"] = "减速药膏";

    L["埃索达"] = "埃索达";
    L["塞拉摩"] = "塞拉摩";
    L["奥格瑞玛"] = "奥格瑞玛";
    L["幽暗城"] = "幽暗城";
    L["斯通纳德"] = "斯通纳德";
    L["暴风城"] = "暴风城";
    L["沙塔斯"] = "沙塔斯";
    L["达拉然"] = "达拉然";
    L["达纳苏斯"] = "达纳苏斯";
    L["铁炉堡"] = "铁炉堡";
    L["银月城"] = "银月城";
    L["雷霆崖"] = "雷霆崖";
    L["传送门: "] = "传送门：";
    L["传送: "] = "传送：";
    L["左键 - 传送: "] = "左键 - 传送: ";
    L["右键 - 传送门: "] = "右键 - 传送门: ";
elseif (GetLocale() == "zhTW") then
    L["左键 - 上毒主手"] = "左鍵 - 主手上毒";
    L["右键 - 上毒副手"] = "右鍵 - 副手上毒";
    L["麻醉药膏"] = "麻醉毒藥";
    L["速效药膏"] = "速效毒藥";
    L["致伤药膏"] = "致傷毒藥";
    L["致命药膏"] = "致命毒藥";
    L["麻痹药膏"] = "麻痹毒藥";
    L["减速药膏"] = "致殘毒藥";

    L["埃索达"] = "艾克索達";
    L["塞拉摩"] = "塞拉摩";
    L["奥格瑞玛"] = "奧格瑪";
    L["幽暗城"] = "幽暗城";
    L["斯通纳德"] = "斯通納德";
    L["暴风城"] = "暴風城";
    L["沙塔斯"] = "撒塔斯";
    L["达拉然"] = "達拉然";
    L["达纳苏斯"] = "達納蘇斯";
    L["铁炉堡"] = "鐵爐堡";
    L["银月城"] = "銀月城";
    L["雷霆崖"] = "雷霆崖";
    L["传送门: "] = "傳送門:";
    L["传送: "] = "傳送:";
    L["左键 - 传送: "] = "左鍵 - 傳送:";
    L["右键 - 传送门: "] = "右鍵 - 傳送門:";
else
    L["左键 - 上毒主手"] = "左键 - 主手上毒";
    L["右键 - 上毒副手"] = "右键 - 副手上毒";
    L["麻醉药膏"] = "Anesthetic Poison";
    L["速效药膏"] = "Instant Poison";
    L["致伤药膏"] = "Wound Poison";
    L["致命药膏"] = "Deadly Poison";
    L["麻痹药膏"] = "Mind-numbing Poison";
    L["减速药膏"] = "Crippling Poison";

    L["埃索达"] = "埃索达";
    L["塞拉摩"] = "塞拉摩";
    L["奥格瑞玛"] = "奥格瑞玛";
    L["幽暗城"] = "幽暗城";
    L["斯通纳德"] = "斯通纳德";
    L["暴风城"] = "暴风城";
    L["沙塔斯"] = "撒塔斯";
    L["达拉然"] = "達拉然";
    L["达纳苏斯"] = "达纳苏斯";
    L["铁炉堡"] = "铁炉堡";
    L["银月城"] = "银月城";
    L["雷霆崖"] = "雷霆崖";
    L["传送门: "] = "传送门：";
    L["传送: "] = "传送：";
    L["左键 - 传送: "] = "左键 - 传送: ";
    L["右键 - 传送门: "] = "右键 - 传送门: ";
end

A.spellsDB = {
    ["HUNTER"] = {
        [1] = 13163, -- 灵猴守护
        [2] = 13165, -- 雄鹰守护
        [3] = 61846, -- 龙鹰守护(灵猴+雄鹰)
        [4] = 5118, -- 猎豹守护
        [5] = 13159, -- 豹群守护
        [6] = 13161, -- 野兽守护
        [7] = 20043, -- 野性守护
        [8] = 34074, -- 蝰蛇守护
    },
    ["ROGUE"] = {
        [1] = 51713, -- 潜行
        [2] = 1787, -- 暗影之舞
        -- 毒药(itemID可能获取不到信息...)
        [3] = { t = "p", name = L["麻醉药膏"] },
        [4] = { t = "p", name = L["速效药膏"] },
        [5] = { t = "p", name = L["致伤药膏"] },
        [6] = { t = "p", name = L["致命药膏"] },
        [7] = { t = "p", name = L["麻痹药膏"] },
        [8] = { t = "p", name = L["减速药膏"] },
    },
    ["MAGE"] = {
        [1] = { t = "d", name = L["埃索达"] },
        [2] = { t = "d", name = L["塞拉摩"] },
        [3] = { t = "d", name = L["奥格瑞玛"] },
        [4] = { t = "d", name = L["幽暗城"] },
        [5] = { t = "d", name = L["斯通纳德"] },
        [6] = { t = "d", name = L["暴风城"] },
        [7] = { t = "d", name = L["沙塔斯"] },
        [8] = { t = "d", name = L["达拉然"] },
        [9] = { t = "d", name = L["达纳苏斯"] },
        [10] = { t = "d", name = L["铁炉堡"] },
        [11] = { t = "d", name = L["银月城"] },
        [12] = { t = "d", name = L["雷霆崖"] },
    },
};
A.ROMAN = { " IX", " VIII", " VII", " V", " IV", " III", " II", "" };
A.order = { "spells", "teleport", "items" };
A.actions = {
    spells = {};
    teleport = {};
    items = {};
};
A.tmp = {
    spells = {};
    teleport = {};
    items = {};
};
A.buttons = {};
A.hooks = {};
A.hooked = false;
A.loaded = false;

function A:debug(fmt, ...)
    if (self._DEBUG) then
        print(format(fmt, ...));
    end
end

function AspectPosionButton_OnLoad(self)
    self:SetNormalTexture("");
    self:RegisterForClicks("AnyUp");
    self.cooldown = _G[self:GetName() .. "Cooldown"];
    self.icon = _G[self:GetName() .. "Icon"];
    self.spellID = -1;
end

function AspectPosionButton_OnEnter(self)
    if (GetCVar("UberTooltips") == "1") then
        GameTooltip_SetDefaultAnchor(GameTooltip, self);
    else
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
    end
    local link, isItem;
    if (self:GetAttribute("type") == "spell") then
        if (self.teleportID) then
            isteleport = true;
        elseif (self.spellID) then
            link = GetSpellLink(self.spellID);
        end
    elseif (self:GetAttribute("type") == "item" and self.itemID) then
        -- _, link = GetItemInfo(self.itemID);
        isItem = true;
    end
    if (link) then
        GameTooltip:SetHyperlink(link);
    else
        GameTooltip:SetText(self.spellName);
        if (isItem) then
            GameTooltip:AddLine(L["左键 - 上毒主手"], 0.7, 0.7, 0.7);
            GameTooltip:AddLine(L["右键 - 上毒副手"], 0.7, 0.7, 0.7);
        elseif (isteleport) then
            GameTooltip:AddLine(L["左键 - 传送: "] .. self.spellName, 0.7, 0.7, 0.7);
            GameTooltip:AddLine(L["右键 - 传送门: "] .. self.spellName, 0.7, 0.7, 0.7);
        end
    end

    GameTooltip:Show();
end

function AspectPosionButton_PostClick(self)
    if (self.isActive) then
        self:SetChecked(1);
    else
        self:SetChecked(0);
    end
end

function A:CreateButton(index)
    if (index <= NUM_SHAPESHIFT_SLOTS) then
        local button = _G["AspectPosionBarButton" .. index];
        return button;
    end
    return false;
end

function A:CheckSpell(spellID)
    local i = 1;
    local spell = GetSpellInfo(spellID);
    local spellName = GetSpellName(i, BOOKTYPE_SPELL);
    while (spellName) do
        if (spellName == spell) then
            return true;
        end
        i = i + 1;
        spellName = GetSpellName(i, BOOKTYPE_SPELL);
    end
    return false;
end

function A:CheckItem(itemName)
    local id, name;
    if (itemName) then
        for _, i in ipairs(self.ROMAN) do
            name = format("%s%s", itemName, i);
            local count = GetItemCount(name);
            if (count and count > 0) then
                return true, name;
            end
        end
    end

    return false;
end

function A:hasNewSpell()
    if (#(self.actions) ~= #(self.tmp) or #(self.actions.spells) ~= #(self.tmp.spells) or #(self.actions.teleport) ~= #(self.tmp.teleport) or #(self.actions.items) ~= #(self.tmp.items)) then
        return true;
    end
    return false;
end

function A:CloneTable(t)
    assert(t and type(t) == "table", "CloneTable #! param must be a table value");
    local tmp = {};
    for k, v in pairs(t) do
        if (type(v) == "table") then
            tmp[k] = self:CloneTable(v);
        else
            tmp[k] = v;
        end
    end
    return tmp;
end

function A:UpdateAspect()
    self.tmp.spells = {};
    self.tmp.teleport = {};
    self.tmp.items = {};
    if (self.spellsDB[self.class]) then
        for i, spellID in ipairs(self.spellsDB[self.class]) do
            if (type(spellID) == "table") then
                if (spellID.t and spellID.t == "p") then -- 毒药
                    local hasItem, name = self:CheckItem(spellID.name)
                    if (hasItem) then
                        tinsert(self.tmp.items, name);
                    end
                elseif (spellID.t and spellID.t == "d") then -- 传送门
                    local check1, check2 = self:CheckSpell(L["传送门: "] .. spellID.name), self:CheckSpell(L["传送: "] .. spellID.name);
                    if (check1 or check2) then
                        tinsert(self.tmp.teleport, spellID.name);
                    end
                end
            else
                if (self:CheckSpell(spellID)) then
                    tinsert(self.tmp.spells, spellID);
                end
            end
        end
    end

    if (self:hasNewSpell()) then
        self.actions = self:CloneTable(self.tmp);
        return true;
    end
    return false;
end

function A:CreateBar()
    for i = 1, NUM_SHAPESHIFT_SLOTS do
        A.buttons[i] = self:CreateButton(i);
    end
end

function A:GetNumShapeshiftForms()
    local num = #(self.actions.spells) + #(self.actions.items) + #(self.actions.teleport);
    num = (num > 0 and num) or GetNumShapeshiftForms() or 0;
    if (num > NUM_SHAPESHIFT_SLOTS) then
        num = NUM_SHAPESHIFT_SLOTS; -- 猜测有错误
    end

    return tonumber(num);
end

function A:IsBuffActive(name)
    local i = 1;
    local buffName = UnitBuff("player", i);
    while (buffName) do
        if (buffName == name) then
            return i;
        end
        i = i + 1;
        buffName = UnitBuff("player", i);
    end

    return false;
end

function A:GetShapeshiftFormInfo(buttonId)
    local isActive, isCastable, name, _, texture, type;
    local sn = #(self.actions.spells)
    local tn = #(self.actions.teleport);

    if (self.actions["spells"][buttonId]) then
        name, _, texture = GetSpellInfo(self.actions.spells[buttonId]);
        isActive = self:IsBuffActive(name);
        isCastable = true;
        type = "spell";
    elseif (self.actions["teleport"][buttonId - sn]) then
        _, _, texture = GetSpellInfo(L["传送: "] .. self.actions.teleport[buttonId - sn]);
        name = self.actions.teleport[buttonId - sn];
        isActive = false;
        isCastable = true;
        type = "teleport";
    elseif (self.actions["items"][buttonId - sn - tn]) then
        name, _, _, _, _, _, _, _, _, texture = GetItemInfo(self.actions.items[buttonId - sn - tn]);
        isActive = false;
        isCastable = true;
        type = "item";
    end

    if (not texture) then
        texture, name, isActive, isCastable = GetShapeshiftFormInfo(buttonId);
    end

    self:debug("texture: %s name: %s", texture, name);
    return texture, name, isActive, isCastable, type;
end

function A:GetShapeshiftForm(var)
    local texture, name, isActive, isCastable;
    for i = 1, NUM_SHAPESHIFT_SLOTS, 1 do
        texture, name, isActive, isCastable = self:GetShapeshiftFormInfo(i);
        if (isActive) then
            return i;
        end
    end
end

function A:GetShapeshiftFormCooldown(buttonId)
    local sn = #(self.actions.spells);
    local tn = #(self.actions.teleport);
    if (self.actions.spells and self.actions.spells[buttonId]) then
        local name = GetSpellInfo(self.actions.spells[buttonId]);
        return GetSpellCooldown(name);
    elseif (self.actions.teleport and self.actions.teleport[buttonId - sn]) then
        local name = GetSpellInfo(self.actions.teleport[buttonId - sn]);
        return GetItemCooldown(name);
    elseif (self.actions.items and self.actions.items[buttonId - sn - tn]) then
        return GetItemCooldown(self.actions.items[buttonId - sn - tn]);
    end

    return GetShapeshiftFormCooldown(buttonId);
end

function A:UpdateAspectCooldown()
    local numForms = self:GetNumShapeshiftForms();
    local start, duration, enable, cooldown, button;
    for i = 1, numForms do
        button = self.buttons[i];
        cooldown = _G[button:GetName() .. "Cooldown"];
        start, duration, enable = self:GetShapeshiftFormCooldown(i);
        if (cooldown and start and duration) then
            CooldownFrame_SetTimer(cooldown, start, duration, enable);
        end
    end
end

function A:AspectBarUpdate()
    local numForms = self:GetNumShapeshiftForms();
    if (numForms > 0) then
        if (numForms == 1) then
            AspectPosionBarMiddle:Hide();
            AspectPosionBarRight:SetPoint("LEFT", "AspectPosionBarLeft", "LEFT", 12, 0);
--            SecureCall(AspectPosionBarButton1.ClearAllPoints, AspectPosionBarButton1);
--            SecureCall(AspectPosionBarButton1.SetPoint, AspectPosionBarButton1, "BOTTOMLEFT", "AspectPosionBar", "BOTTOMLEFT", 12, 3);
        elseif (numForms == 2) then
            AspectPosionBarMiddle:Hide();
            AspectPosionBarRight:SetPoint("LEFT", "AspectPosionBarLeft", "RIGHT", 0, 0);
        else
            AspectPosionBarMiddle:Show();
            AspectPosionBarMiddle:SetPoint("LEFT", "AspectPosionBarLeft", "RIGHT", 0, 0);
            AspectPosionBarMiddle:SetWidth(37 * (numForms - 2));
            AspectPosionBarMiddle:SetTexCoord(0, numForms - 2, 0, 1);
            AspectPosionBarRight:SetPoint("LEFT", "AspectPosionBarMiddle", "RIGHT", 0, 0);
        end
        SecureCall(AspectPosionBar.Show, AspectPosionBar);
    else
        SecureCall(AspectPosionBar.Hide, AspectPosionBar);
    end

    self:AspectBarUpdateState();
end

function A:AspectBarUpdateState()
    local numForms = self:GetNumShapeshiftForms();
    self:debug("number forms %d", numForms);
    local texture, name, isActive, isCastable, type;
    local button, icon, cooldown, ssb;
    local start, duration, enable;
    local sn = #(self.actions.spells);
    local tn = #(self.actions.teleport);
    for i = 1, NUM_SHAPESHIFT_SLOTS do
        button = self.buttons[i];
        if (button) then
            if (i <= numForms) then
                texture, name, isActive, isCastable, type = self:GetShapeshiftFormInfo(i);
                button.icon:SetTexture(texture);

                if (texture) then
                    button.cooldown:Show();
                else
                    button.cooldown:Hide();
                end
                self:UpdateAspectCooldown();

                if (isActive) then
                    button:SetChecked(1);
                    button.isActive = true;
                else
                    button:SetChecked(0);
                    button.isActive = false;
                end

                if (isCastable) then
                    button.icon:SetVertexColor(1.0, 1.0, 1.0);
                else
                    button.icon:SetVertexColor(0.4, 0.4, 0.4);
                end
                if (type == "spell") then
                    SecureCall(button.SetAttribute, button, "type", "spell");
                    SecureCall(button.SetAttribute, button, "spell", name);
                    button.spellID = self.actions.spells[i];
                elseif (type == "teleport") then
                    SecureCall(button.SetAttribute, button, "type", "spell");
                    SecureCall(button.SetAttribute, button, "spell1", L["传送: "] .. name);
                    SecureCall(button.SetAttribute, button, "spell2", L["传送门: "] .. name);
                    button.teleportID = true;
                elseif (type == "item") then
                    SecureCall(button.SetAttribute, button, "type", "item");
                    SecureCall(button.SetAttribute, button, "item", name);
                    SecureCall(button.SetAttribute, button, "target-slot1", "16");
                    SecureCall(button.SetAttribute, button, "target-slot2", "17");
                    button.itemID = self.actions.items[i - sn - tn];
                end

                button.spellName = name;
                SecureCall(button.Show, button);
            else
                SecureCall(button.Hide, button);
            end
        end
    end

    self:UpdateItemCount();
    SecureCall(UIParent_ManageFramePositions);
end

function A:UpdateItemCount()
    local button, count, label;
    for i = 1, NUM_SHAPESHIFT_SLOTS do
        button = self.buttons[i];
        if (button) then
            if (button:IsShown() and button:GetAttribute("type") == "item") then
                count = GetItemCount(button:GetAttribute("item"));
                label = _G[button:GetName() .. "Count"];
                label:SetText(count);
                if (count > 9) then
                    label:SetTextColor(0.0, 1.0, 0.0)
                elseif (count > 4) then
                    label:SetTextColor(1.0, 1.0, 0.0)
                elseif (count > 0) then
                    label:SetTextColor(1.0, 0.0, 0.0)
                end
            end
        end
    end
end

function A:UNIT_AURA(event, unit)
    if (unit == "player") then
        self:AspectBarUpdate();
    end
end

function A:LEARNED_SPELL_IN_TAB()
    if (self:UpdateAspect()) then
        self:AspectBarUpdate();
        RePositionPetActionBar();
    end
end

function A:ACTIONBAR_UPDATE_USABLE()
    self:AspectBarUpdate();
end

function A:ACTIONBAR_UPDATE_COOLDOWN()
    self:UpdateAspectCooldown();
end

function A:UPDATE_BINDINGS()
    local numForms = self:GetNumShapeshiftForms();
    --ClearOverrideBindings(ShapeshiftBarFrame);
    for i = 1, numForms do
        local buttonName = "AspectPosionBarButton" .. i;
        local key1, key2 = GetBindingKey("SHAPESHIFTBUTTON" .. i);
        if (key1) then
            --SetOverrideBindingClick(AspectPosionBar, true, key1, buttonName);
        end
        if (key2) then
            --SetOverrideBindingClick(AspectPosionBar, true, key2, buttonName);
        end
    end
end

function A:SPELLS_CHANGED()
    if (self:UpdateAspect()) then
        self:AspectBarUpdate();
        RePositionPetActionBar();
    end
    self:UnregisterEvent("SPELLS_CHANGED");
end

function A:BAG_UPDATE()
    if (self:UpdateAspect()) then
        self:AspectBarUpdate();
        RePositionPetActionBar();
    else
        self:UpdateItemCount();
    end
end

function A:PLAYER_ENTERING_WORLD()
    self:AspectBarUpdate();
end

function A:UIParent_ManageFramePositions()
    if (not self.enable) then return end

    local hasBottomLeft;

    if (MultiBarBottomLeft:IsShown()) then
        hasBottomLeft = 1;
    end
    local YOffset = hasBottomLeft and 45 or 0;
    if (ReputationWatchBar:IsShown() and MainMenuExpBar:IsShown()) then
        YOffset = YOffset + 1;
    end
    if (MainMenuBarMaxLevelBar:IsShown()) then
        YOffset = YOffset + 1;
    end
    if (hasBottomLeft) then
        if (AspectPosionBar) then
            AspectPosionBarLeft:SetAlpha(0);
            AspectPosionBarRight:SetAlpha(0);
            AspectPosionBarMiddle:SetAlpha(0);
        end
    else
        if (AspectPosionBar) then
            if (self:GetNumShapeshiftForms() > 2) then
                AspectPosionBarMiddle:SetAlpha(1);
            end
            AspectPosionBarLeft:SetAlpha(1);
            AspectPosionBarRight:SetAlpha(1);
        end
    end
    self:debug("UIParent_ManageFramePositions YOffset %d", YOffset);
    SecureCall(AspectPosionBar.ClearAllPoints, AspectPosionBar);
    SecureCall(AspectPosionBar.SetPoint, AspectPosionBar, "BOTTOMLEFT", "MainMenuBar", "TOPLEFT", 30, YOffset);
end

-----------------------------------------
-- OnX
-----------------------------------------
function A:OnModuleEnable()
    self:RegisterEvent("UNIT_AURA");
    self:RegisterEvent("SPELLS_CHANGED");
    self:RegisterEvent("LEARNED_SPELL_IN_TAB");
    self:RegisterEvent("ACTIONBAR_UPDATE_USABLE");
    self:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN");
    self:RegisterEvent("UPDATE_BINDINGS");
    self:RegisterEvent("BAG_UPDATE");
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    SecureCall(ShapeshiftBarFrame.Hide, ShapeshiftBarFrame);
    ShapeshiftBarFrame.orgShow = ShapeshiftBarFrame.Show;
    ShapeshiftBarFrame.Show = DUMMY_FUNC;
    ShapeshiftBarFrame.orgHide = ShapeshiftBarFrame.Hide;
    ShapeshiftBarFrame.Hide = DUMMY_FUNC;
    self:SecureHook("UIParent_ManageFramePositions");
    self:AspectBarUpdate();
end

function A:OnModuleDisable()
    self:UnregisterAllEvents();
    self:AspectBarUpdate();
    self:Unhook("UIParent_ManageFramePositions");
    ShapeshiftBarFrame.Show = ShapeshiftBarFrame.orgShow;
    ShapeshiftBarFrame.orgShow = nil;
    ShapeshiftBarFrame.Hide = ShapeshiftBarFrame.orgHide;
    ShapeshiftBarFrame.orgHide = nil;
    SecureCall(AspectPosionBar.Hide, AspectPosionBar);
    ShapeshiftBar_Update();
end

function A:ToggleManageFrame(switch)
    if (switch) then
        self.enable = true;
    else
        self.enable = false;
    end
end

function A:OnInitialize()
    if (not self.loaded) then
        self.loaded = true;
        self:UpdateAspect();
        self:CreateBar();

        AspectPosionBar_Toggle(true)
    end
end

function AspectPosionBar_OnLoad(self)
    AsynCall("AspectPosionBar", "AspectPosionBar_Jieguan", true);
end

function AspectPosionBar_OnEvent(self, event, arg1)
end

function AspectPosionBar_OnShow(self)
    SecureCall(UIParent_ManageFramePositions);
end

function AspectPosionBar_OnHide(self)
    SecureCall(UIParent_ManageFramePositions);
end

function AspectPosionBar_Toggle(switch)
    if (switch) then
        PetActionBarFrameRePosition_Toggle(true);
        A:OnModuleEnable();
    else
        PetActionBarFrameRePosition_Toggle(false);
        A:OnModuleDisable();
    end
end

function AspectPosionBar_Jieguan(switch)
    local apb, ssb, la;
    for i = 1, NUM_SHAPESHIFT_SLOTS do
        apb = _G["AspectPosionBarButton" .. i];
        ssb = _G["ShapeshiftButton" .. i];
        SecureCall(apb.ClearAllPoints, apb);
        if (switch) then
            SecureCall(apb.SetPoint, apb, "CENTER", ssb, "CENTER", 0, 0);
        else
            if (i == 1) then
                SecureCall(apb.SetPoint, apb, "BOTTOMLEFT", AspectPosionBar, "BOTTOMLEFT", 10, 3);
            else
                SecureCall(apb.SetPoint, apb, "LEFT", la, "RIGHT", 8, 0);
            end
            la = apb;
        end
    end
    if (switch) then
        AspectPosionBarFrame:ToggleManageFrame(true);
    else
        AspectPosionBarFrame:ToggleManageFrame(false);
    end
    SecureCall(UIParent_ManageFramePositions);
end
