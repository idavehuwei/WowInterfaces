--[[ Create ]]
zBar3 = CreateFrame("Frame",nil,UIParent,"SecureFrameTemplate")
zBar3:RegisterEvent("PLAYER_LOGIN")

--[[ Tables ]]
zBar3.plugins = {}
zBar3.bars    = {}
zBar3.buttons = {}

--[[ Common functions ]]
function zBar3:print(msg, r, g, b)
    DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b)
end

--[[ Event ]]
function zBar3:OnEvent()
    if event == "PLAYER_LOGIN" then
        -- self init
        self:Init()
        -- plugins init
        for k,v in ipairs(self.plugins) do
            if v.Load then v:Load() end
        end
        -- bars init
        for name, bar in pairs(self.bars) do
            bar:Reset()
        end
        -- buttonfacade support
        zButtonFacade:Load()
        -- init grid updater
        self:InitGridUpdater()
        -- hooks
        self:Hook()

        -- register slash command
        zBar3:RegisterSlash()
        -- welcome message
        self:print("zBar3 v"..self.version.." Loaded :: Author - "..self.author.. " :: type /zbar",0.0,1.0,0.0)
    else
        self:Update(event)
    end
end
zBar3:SetScript("OnEvent", zBar3.OnEvent)

--[[ Register Sub Addon ]]
-- the order of registeration will also effect when Initialize !
function zBar3:AddPlugin(obj, afterWho)
    -- insert behine the afterWho
    if afterWho then
        for k,v in ipairs(self.plugins) do
            if v == afterWho then
                table.insert(self.plugins, k+1, obj)
                return
            end
        end
    end
    -- otherwise just append it
    table.insert(self.plugins, obj)
end

--[[ Register a Bar ]]
function zBar3:AddBar(bar)
    self.bars[bar:GetName()] = bar

    -- inherit functions
    setmetatable(bar, {__index = zBarT})

    --bar:SetParent(zBarT)
end

--[[ Addon Init ]]
function zBar3:Init()
    -- version
    self.version = GetAddOnMetadata("zBar3", "Version")
    self.author  = GetAddOnMetadata("zBar3", "Author")

    -- data
    zBar3Data = zBar3Data or {
        version = zBar3.version,
        fullmode= nil,
    }

    -- Lite mode or Full mode
    if zBar3Data.fullmode then
        LoadAddOn("zBar3FullMode")
    end

    -- function that does nothing
    self.NOOP = function() end

    -- hidden frame
    self.hiddenFrame = CreateFrame("Frame")
    self.hiddenFrame:Hide()

    -- class
    self.class = select(2, UnitClass("player"))
end

function zBar3:Hook()
    -- remove that '?' thing
    for id, name in pairs(self.buttons) do
        local hotkey = _G[name.."HotKey"]
        if hotkey and hotkey:GetText() == RANGE_INDICATOR then
            hotkey:SetText("  ")
        end
    end
    -- RANGE_INDICATOR = "  "

    -- hook scripts for all action buttons
    local name, bar, button
    for name, bar in pairs(self.bars) do
        if bar:GetID() <= 10 then
            for id = 1, NUM_ACTIONBAR_BUTTONS do
                button = _G[self.buttons[bar:GetName()..id]]
                if button then
                    button:SetMovable(true)
                    -- set button scripts
                    button:SetScript("OnEnter",function(self)
                        if zTab:FreeOnEnter(self) then return end
                        self:GetParent():SetAlpha(1)
                        if zBar3Data.hideTip then return end
                        ActionButton_SetTooltip(self)
                    end)
                    button:SetScript("OnLeave",function(self)
                        local bar = self:GetParent()
                        bar:SetAlpha(zBar3Data[bar:GetName()].alpha)
                        if zBar3Data.hideTip then return end
                        GameTooltip:Hide()
                    end)
                end
            end
        end
        bar:InitHoverHandler()
    end
end

--[[ Grid Stuff ]]
-- this must after all action button (especially extra buttons) created,
-- cause action button will register events while creation
function zBar3:InitGridUpdater()
    self.showgrid = MultiBarLeftButton1:GetAttribute("showgrid")
    -- add events for grid, must after bars initial
    self:RegisterEvent("ACTIONBAR_SHOWGRID")
    self:RegisterEvent("ACTIONBAR_HIDEGRID")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    -- hooks for grid
    hooksecurefunc("MultiActionBar_ShowAllGrids",function()
        zBar3:IncGrid()
        zBar3:Update()
    end)
    hooksecurefunc("MultiActionBar_HideAllGrids",function()
        zBar3:DecGrid()
        zBar3:Update()
    end)
end

zBar3.gridUpdaters = {}
function zBar3:RegisterGridUpdater(bar)
    table.insert(self.gridUpdaters, bar)
end

function zBar3:IncGrid()
    self.showgrid = self.showgrid + 1
end

function zBar3:DecGrid()
    if self.showgrid > 0 then
        self.showgrid = self.showgrid - 1
    end
end

function zBar3:Update(event)
    -- event stuff
    if event == "ACTIONBAR_SHOWGRID" then
        self:IncGrid()
    elseif event == "ACTIONBAR_HIDEGRID" then
        self:DecGrid()
    else
        for i, bar in ipairs(self.gridUpdaters) do
            bar:UpdateGrid()
        end
    end
end

function zBar3:Config(bar)
    if not zBarOption then
        local name = 'zBar3Config'
        local loaded, reason = LoadAddOn(name)
        if ( not loaded ) then
            message(format(ADDON_LOAD_FAILED, name, _G["ADDON_"..reason]))
            return
        else
            zBarOption:Load()
        end
    end
    zBarOption:Openfor(bar)
end

function zBar3:RegisterSlash()
    SlashCmdList["ZBAR"] = function(msg)
        local offset = tonumber(msg)
        for name,bar in pairs(zBar3.bars) do
            if msg == "resetall" then
                bar:Reset(true)
            elseif offset then
                local pos = zBar3Data[bar:GetName()].pos or zBar3:GetDefault(bar, "pos")
                bar:GetTab():ClearAllPoints()
                if type(pos[2]) == "string" then
                    bar:GetTab():SetPoint(pos[1],UIParent,pos[2],pos[3],pos[4]+offset/ bar:GetScale())
                else
                    bar:GetTab():SetPoint(pos[1],UIParent,pos[1],pos[2],pos[3]+offset/ bar:GetScale())
                end
                zTab:SavePosition(bar:GetTab())
            else
                zBar3:Config(bar)
                return
            end
        end
    end
    SLASH_ZBAR1 = "/zbar"
end