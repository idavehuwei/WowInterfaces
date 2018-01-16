local SelectedError = 1;
local ErrorList = {};
local SoundTime = 0;
local QueueError = {};
local Config;
local SoundEditBox;
local ClearFocus = CreateFrame("EditBox");
ClearFocus:SetAutoFocus(nil);
ClearFocus:SetScript("OnEditFocusGained", function(self)
    self:ClearFocus();
end);


local DefaultSound = "Sound\\Character\\PlayerExertions\\GnomeMaleFinal\\GnomeMaleMainDeathA.wav";

local CheckButtons = {
    {Text="Show Chat Message", SavedVar="Messages", Default=true},
    {Text="Show \"Action Blocked\" Errors (Taint)", SavedVar="Taint", Default=true},
    {Text="Play Sound", SavedVar="PlaySound", Default=true},
};

local EventFuncs;
EventFuncs = {
    VARIABLES_LOADED = function()
        EventFuncs.VARIABLES_LOADED = nil;
        Config = BaudErrorFrameConfig;
        if(type(Config)~="table")then
            Config = {};
            BaudErrorFrameConfig = Config;
        end
        if(Config.Sound == nil)then
            --Backwards compatability
            Config.Sound = BaudErrorFrameSound or DefaultSound;
        end
        SoundEditBox:SetText(Config.Sound);
        SoundEditBox:SetCursorPosition(0);
        SoundEditBox:SetScript("OnChar", function(self)
            Config.Sound = self:GetText();
        end);

        for Key, Value in ipairs(CheckButtons)do
            if(Config[Value.SavedVar]==nil)then
                Config[Value.SavedVar] = Value.Default;
            end
            Value.Button:SetChecked(Config[Value.SavedVar]);
        end

        for Key, Value in ipairs(QueueError)do
            BaudErrorFrameShowError(Value);
        end
        QueueError = nil;
    end,

    ADDON_ACTION_BLOCKED = function(AddOn, FuncName)
        if Config.Taint then
            BaudErrorFrameAdd(arg1.." blocked from using "..FuncName,4);
        end
    end,

    MACRO_ACTION_BLOCKED = function(FuncName)
        if Config.Taint then
            BaudErrorFrameAdd("Macro blocked from using "..FuncName,4);
        end
    end,

    ADDON_ACTION_FORBIDDEN = function(AddOn,FuncName)
        if Config.Taint then
            BaudErrorFrameAdd(AddOn.." forbidden from using "..FuncName.." (Only usable by Blizzard)",4);
        end
    end,

    MACRO_ACTION_FORBIDDEN = function(FuncName)
        if Config.Taint then
            BaudErrorFrameAdd("Macro forbidden from using "..FuncName.." (Only usable by Blizzard)",4);
        end
    end,
};


function BaudErrorFrame_OnLoad(self)
    tinsert(UISpecialFrames, self:GetName());
    self:RegisterForDrag("LeftButton");
    self:RegisterForClicks("LeftButtonUp","RightButtonUp");
    self:SetScript("OnClick", function()
        ClearFocus:SetFocus();
    end);

    for Key, Value in pairs(EventFuncs)do
        self:RegisterEvent(Key);
    end
    self:SetScript("OnEvent", function(self, event, ...)
        EventFuncs[event](...);
    end);
    seterrorhandler(BaudErrorFrameHandler);
end


function BaudErrorFrameMinimapButton_OnLoad(self)
    self:RegisterForClicks("LeftButtonUp","RightButtonUp");
    self:RegisterForDrag("LeftButton");
    self:SetFrameLevel(self:GetFrameLevel()+1);
    self:SetScript("OnClick", BaudErrorFrameMinimapButton_OnClick);
    self:SetScript("OnEnter", BaudErrorFrameMinimapButton_OnEnter);
    self:SetScript("OnLeave", BaudErrorFrameMinimapButton_OnLeave);
    self:SetScript("OnDragStart", BaudErrorFrameMinimapButton_OnDragStart);
    self:SetScript("OnDragStop", BaudErrorFrameMinimapButton_OnDragStop);
end


function BaudErrorFrameMinimapButton_OnClick(self, button)
    if(button=="LeftButton")then
        BaudErrorFrame:Show();
    else
        InterfaceOptionsFrame_OpenToCategory("Baud Error Frame");
    end
end


function BaudErrorFrameMinimapButton_OnEnter(self)
    if self.Dragging then
        return;
    end
    GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT");
    GameTooltip:AddLine("Baud Error Frame");
    GameTooltip:AddLine("Left-Click to view errors.",1,1,1);
    GameTooltip:AddLine("Right-Click for options.",1,1,1);
    GameTooltip:AddLine("Shift-drag to move button.",1,1,1);
    GameTooltip:Show();
end


function BaudErrorFrameMinimapButton_OnLeave()
    GameTooltip:Hide();
end


function BaudErrorFrameMinimapButton_OnDragStart(self)
    MinimapButton_OnMouseUp(self);
    if IsShiftKeyDown()then
        self:SetScript("OnUpdate", BaudErrorFrameMinimapButton_OnUpdate);
        self.Dragging = true;
        BaudErrorFrameMinimapButton_OnLeave(self);
    end
end


function BaudErrorFrameMinimapButton_OnDragStop(self)
    if self.Dragging then
        self:SetScript("OnUpdate", nil);
        self:StopMovingOrSizing();
        self.Dragging = nil;
        self.Moving = nil;
    end
end


function BaudErrorFrameMinimapButton_OnUpdate(self)
    local MapScale = Minimap:GetEffectiveScale();
    local CX, CY = GetCursorPosition();
    local X, Y = (Minimap:GetRight() - 70) * MapScale, (Minimap:GetTop() - 70) * MapScale;
    local Dist = sqrt(math.pow(X - CX, 2) + math.pow(Y - CY, 2)) / MapScale;
    local Scale = self:GetEffectiveScale();
    if(Dist <= 90)and Minimap:IsVisible()then
        if self.Moving then
            self:StopMovingOrSizing();
            self.Moving = nil;
        end
        local Angle = atan2(CY - Y, X - CX) - 90;
        self:ClearAllPoints();
        self:SetPoint("CENTER", Minimap, "TOPRIGHT", (sin(Angle) * 80 - 70) * MapScale / Scale, (cos(Angle) * 77 - 73) * MapScale / Scale);
    elseif not self.Moving then
        self:ClearAllPoints();
        self:SetPoint("CENTER", UIParent, "BOTTOMLEFT",CX / Scale, CY / Scale);
        self:StartMoving();
        self.Moving = true;
    end
end


function BaudErrorFrameHandler(Error)
    BaudErrorFrameAdd(Error,3);
end


function BaudErrorFrameShowError(Error)
    if Config.Messages then
        DEFAULT_CHAT_FRAME:AddMessage(Error,0.8,0.1,0.1);
    end
    if(GetTime() > SoundTime)and Config.PlaySound then
        PlaySoundFile(Config.Sound);
        SoundTime = GetTime() + 1;
    end
end


function BaudErrorFrameAdd(Error, Retrace)
    for Key, Value in pairs(ErrorList)do
        if(Value.Error==Error)then
            if(Value.Count < 99)then
                Value.Count = Value.Count + 1;
                BaudErrorFrameEditBoxUpdate();
            end
            return;
        end
    end
    if Config then
        BaudErrorFrameShowError(Error);
    else
        tinsert(QueueError, Error);
    end
    tinsert(ErrorList,{Error=Error,Count=1,Stack=debugstack(Retrace)});
    BaudErrorFrameMinimapCount:SetText(#ErrorList);
    BaudErrorFrameMinimapButton:Show();
    BaudErrorFrameScrollBar_Update();
end


function BaudErrorFrame_Select(Index)
    SelectedError = Index;
    BaudErrorFrameScrollBar_Update();
    BaudErrorFrameDetailScrollFrameScrollBar:SetValue(0);
end


function BaudErrorFrame_OnShow(self)
    PlaySound("gsTitleOptionExit");
    self:SetPoint("CENTER");
    BaudErrorFrameScrollBar_Update();
end


function BaudErrorFrame_OnHide()
    PlaySound("gsTitleOptionExit");
end


function BaudErrorFrameEntry_OnClick(self)
    BaudErrorFrame_Select(self:GetID());
end


function BaudErrorFrameClearButton_OnClick(self)
    ErrorList = {};
    BaudErrorFrameMinimapButton:Hide();
    self:GetParent():Hide();
end


function BaudErrorFrameScrollBar_Update()
    if not BaudErrorFrame:IsShown()then
        return;
    end
    local Index, Button, ButtonText, Text;

    local Frame = BaudErrorFrameListScrollBox;
    local FrameName = Frame:GetName();
    local ScrollBar = getglobal(FrameName.."ScrollBar");
    local Highlight = getglobal(FrameName.."Highlight");
    local Total = #ErrorList;
    FauxScrollFrame_Update(ScrollBar,Total,Frame.Entries,16);
    Highlight:Hide();
    for Line = 1, Frame.Entries do
        Index = Line + FauxScrollFrame_GetOffset(ScrollBar);
        Button = getglobal(FrameName.."Entry"..Line);
        ButtonText = getglobal(FrameName.."Entry"..Line.."Text");
        if(Index <= Total)then
            Button:SetID(Index);
            ButtonText:SetText(ErrorList[Index].Error);
            Button:Show();
            if(Index==SelectedError)then
                Highlight:SetPoint("TOP",Button);
                Highlight:Show();
            end
        else
            Button:Hide();
        end
    end
    BaudErrorFrameEditBoxUpdate();
end


function BaudErrorFrameEditBoxUpdate()
    if ErrorList[SelectedError]then
        BaudErrorFrameEditBox.TextShown = ErrorList[SelectedError].Error.."\nCount: "..ErrorList[SelectedError].Count.."\n\nCall Stack:\n"..ErrorList[SelectedError].Stack;
    else
        BaudErrorFrameEditBox.TextShown = "";
    end
    BaudErrorFrameEditBox:SetText(BaudErrorFrameEditBox.TextShown);
    -- BaudErrorFrameDetailScrollFrame:UpdateScrollChildRect();
end


function BaudErrorFrameEditBox_OnTextChanged(self)
    if(self:GetText()~=self.TextShown)then
        self:SetText(self.TextShown);
        self:ClearFocus();
        return;
    end
    BaudErrorFrameDetailScrollFrame:UpdateScrollChildRect();
end


function BaudErrorFrameOptions_OnLoad(self)
    local Text = self:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall");
    Text:SetPoint("BOTTOMRIGHT",-13,13);
    Text:SetText("Version "..GetAddOnMetadata("!BaudErrorFrame","Version"));

    self.name = "Baud Error Frame";
    self.default = function()
        for Key, Value in ipairs(CheckButtons)do
            Config[Value.SavedVar] = Value.Default;
            Value.Button:SetChecked(Value.Default);
        end
        Config.Sound = DefaultSound;
        ClearFocus:SetFocus();
        SoundEditBox:SetText(Config.Sound);
        SoundEditBox:SetCursorPosition(0);
    end
    --self.refresh = BaudManifestOptions_OnShow;
    InterfaceOptions_AddCategory(self);

    SlashCmdList["BaudErrorFrame"] = function()
        InterfaceOptionsFrame_OpenToCategory("Baud Error Frame");
    end
    SLASH_BaudErrorFrame1 = "/bauderrorframe";
    SLASH_BaudErrorFrame2 = "/bauderror";

    SoundEditBox = BaudErrorFrameSoundEditBox;

    local Func = function(self)
        Config[self.SavedVar] = self:GetChecked()and true or false;
        if self:GetChecked()then
            PlaySound("igMainMenuOptionCheckBoxOn");
        else
            PlaySound("igMainMenuOptionCheckBoxOff");
        end
        ClearFocus:SetFocus();
    end
    for Key, Value in ipairs(CheckButtons)do
        Button = CreateFrame("CheckButton", "BaudErrorFrameCheck"..Key, self, "OptionsCheckButtonTemplate");
        Value.Button = Button;
        Button.SavedVar = Value.SavedVar;
        getglobal(Button:GetName().."Text"):SetText(Value.Text);
        Button:SetPoint("TOPLEFT", 25, -25 * Key);
        Button:SetScript("OnClick", Func);
    end
end


function BaudErrorFrameTestSound()
    PlaySoundFile(Config.Sound);
    ClearFocus:SetFocus();
end