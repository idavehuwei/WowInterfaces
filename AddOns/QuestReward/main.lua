--[[
    Quest Reward
    v1.2.5
]]

local TempSell = nil; --Watto_Version, Watto_TempSell
local BuyNowItems = {
    45724, -- Argent Tournament Champion's Purse
}

function QuestReward_Load(self)
    self:RegisterEvent("QUEST_COMPLETE");
    self:RegisterEvent("QUEST_FINISHED");

    hooksecurefunc("QuestInfoItem_OnClick", QuestReward_PressButton);
end

function QuestReward_Events(self, event, ...)
    if event == "QUEST_COMPLETE" then
        QuestReward_ChooseItem(self);
    elseif event == "QUEST_FINISHED" then
        if (TempSell ~= nil) and (Watto_Version) and (Watto_Version >= "1.2") then
            Watto_TempSell[TempSell] = 1;
        end
    end
end

function QuestReward_ChooseItem(self)
    local items = {};
    local num = GetNumQuestChoices();
    local sel, selp = 1, 0; -- default to first button in case none of the items have sell values.

    if num <= 0 then
        return;
    end

    for x=1,num do
        local link = GetQuestItemLink("choice", x);
        if (not link) then
            link = QuestReward_Timer("GetLink",1,function(x) return GetQuestItemLink("choice", x) end)
        end
        local _, _, _, _, _, _, _, _, _, _, ISP = GetItemInfo(link);
        for k,v in pairs(BuyNowItems) do
            local a = tonumber(QuestReward_ItemID(link));
            if (a == v) then
                QuestReward_SelectItem(self, x);
                return;
            end
        end
        items[x] = ISP;
    end

    for x=1,num do
        if items[x] > selp then
            sel = x;
            selp = items[x];
        end
    end

    QuestReward_SelectItem(self, sel);
end

function QuestReward_SelectItem(self,index)
    local btn = getglobal("QuestInfoItem"..index);
    if (btn.type == "choice") then
        QuestInfoItemHighlight:SetPoint("TOPLEFT", btn, "TOPLEFT", -8, 7);
        QuestInfoItemHighlight:Show();
        QuestInfoFrame.itemChoice = btn:GetID();

        local id = QuestReward_ItemID(GetQuestItemLink("choice", btn:GetID()));

        while (id == nil) do
            id = QuestReward_Timer("WaitforID", 2, QuestReward_ReturnId, btn)
        end

        local bad = false;
        for k,v in pairs(BuyNowItems) do
            if (id == v) then
                bad = true;
                break;
            end
        end
        if (bad ~= true) then
            TempSell = id;
        end
    end
end

function QuestReward_PressButton(self)
    TempSell = nil;
end

function QuestReward_ItemID(link)
    if (strfind(link,":") == nil) then
        return;
    end

    local justItemId = string.gsub(link,".-\124H([^\124]*)\124h.*", "%1");
    local _, itemid = strsplit(":",justItemId);

    return tostring(itemid);
end

function QuestReward_ReturnId(btn)
    return QuestReward_ItemID(GetQuestItemLink("choice", btn:GetID()));
end

-- Timer function
function QuestReward_Timer(name,targettime,functiontodo, ...)
    local framename = "QuestRewardFrame"..name;
    if getglobal(framename) and (getglobal(framename):GetScript("OnUpdate") ~= nil) then
        return;
    end

    local funcvar1, funcvar2, funcvar3, funcvar4 = ...;

    local frame = CreateFrame("Frame", framename);

    local totalElapsed = 0.0;
    local tickcount = 0;

    local function QuestReward_onUpdate(self, elapsed)
        totalElapsed = totalElapsed + elapsed;
        if (totalElapsed < 1) then return; end
        totalElapsed = totalElapsed - floor(totalElapsed);
        tickcount = tickcount + 1;

        if (tickcount == targettime) then
            local result = functiontodo(funcvar1, funcvar2, funcvar3, funcvar4);
            frame:SetScript("OnUpdate", nil);
            return result;
        end
        -- Enable for timing debugging
        -- ChatFrame1:AddMessage("tick... "..tickcount);
    end
    frame:SetScript("OnUpdate", QuestReward_onUpdate);
    frame:Show();
end