--------------------------------------------
-- template - ver 1.0
-- 日期: 2010-4-10
-- 作者: dugu@bigfoot
-- 描述: 多玩移动中心模板
-- 版权所有 (c) Duowan.com
--------------------------------------------
local L = LibStub("AceLocale-3.0"):GetLocale("DuowanMove", true);

function DuowanMoveTab_OnLoad(self)
    self.lable = _G[self:GetName() .. "Lable"];
    self:RegisterForDrag("LeftButton");
    self:RegisterForClicks("LeftButtonUp", "RightButtonUp");

    self.ShowLabel = function(self, show)
        if show then
            UIFrameFadeIn(self.lable, 0.2, 0, 1);
        else
            UIFrameFadeOut(self.lable, 1, 1, 0);
        end
    end
    self:SetScript("OnEnter", function(self)
        self:ShowLabel(true);
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
        GameTooltip:SetText(L["多玩移动"], 1, 1, 1);
        GameTooltip:AddLine(L["右键打开菜单"]);
        GameTooltip:Show();
    end);
    self:SetScript("OnLeave", function()
        self:ShowLabel(false);
        GameTooltip:Hide();
    end);
end

function DuowanMoveTab_OnClick(self, button)
    self:GetParent():ShowMenu(self, button);
end

function DuowanMoveTab_OnDragStart(self, button)
    local p = self:GetParent();
    if (not p.lock) then
        p:StartMoving();
        self.ismoving = true;
    end
end

function DuowanMoveTab_OnDragStop(self, button)
    local p = self:GetParent();
    if (self.ismoving) then
        p:StopMovingOrSizing();
        self.ismoving = false;
        local pos = {p:GetPoint()};
        pos[2] = "UIParent";
        p:SaveInfo("pos", pos);
    end
end

function DuowanMoveFrame_OnLoad(self)
    self:SetClampedToScreen(true);
end