TITAN_PANEL_PLACE_TOP = 1;
TITAN_PANEL_PLACE_BOTTOM = 2;

local TitanMovableModule = LibStub("AceAddon-3.0"):NewAddon("TitanMovable", "AceHook-3.0", "AceTimer-3.0")
local _G = getfenv(0);
local InCombatLockdown = _G.InCombatLockdown;

--Determines the optimal magic number based on resolution
local menuBarTop = 55;
local width, height = string.match((({ GetScreenResolutions() })[GetCurrentResolution()] or ""), "(%d+).-(%d+)");
if (tonumber(width) / tonumber(height) > 4 / 3) then
    --Widescreen resolution
    menuBarTop = 75;
end


local TitanMovable = {};
local TitanMovableData = {
    PlayerFrame = { frameName = "PlayerFrame", frameArchor = "TOPLEFT", xArchor = "LEFT", y = -4, position = TITAN_PANEL_PLACE_TOP },
    TargetFrame = { frameName = "TargetFrame", frameArchor = "TOPLEFT", xArchor = "LEFT", y = -4, position = TITAN_PANEL_PLACE_TOP },
    PartyMemberFrame1 = { frameName = "PartyMemberFrame1", frameArchor = "TOPLEFT", xArchor = "LEFT", y = -180, position = TITAN_PANEL_PLACE_TOP },
    TicketStatusFrame = { frameName = "TicketStatusFrame", frameArchor = "TOPRIGHT", xArchor = "RIGHT", y = 0, position = TITAN_PANEL_PLACE_TOP },
    --TemporaryEnchantFrame = {frameName = "TemporaryEnchantFrame", frameArchor = "TOPRIGHT", xArchor = "RIGHT", y = -13, position = TITAN_PANEL_PLACE_TOP},
    ConsolidatedBuffs = { frameName = "ConsolidatedBuffs", frameArchor = "TOPRIGHT", xArchor = "RIGHT", y = -13, position = TITAN_PANEL_PLACE_TOP },
    BuffFrame = { frameName = "BuffFrame", frameArchor = "TOPRIGHT", xArchor = "RIGHT", y = -13, position = TITAN_PANEL_PLACE_TOP },
    MinimapCluster = { frameName = "MinimapCluster", frameArchor = "TOPRIGHT", xArchor = "RIGHT", y = -10, position = TITAN_PANEL_PLACE_TOP },
    WorldStateAlwaysUpFrame = { frameName = "WorldStateAlwaysUpFrame", frameArchor = "TOP", xArchor = "CENTER", y = -15, position = TITAN_PANEL_PLACE_TOP },
    MainMenuBar = { frameName = "MainMenuBar", frameArchor = "BOTTOM", xArchor = "CENTER", y = 0, position = TITAN_PANEL_PLACE_BOTTOM },
    MultiBarRight = { frameName = "MultiBarRight", frameArchor = "BOTTOMRIGHT", xArchor = "RIGHT", y = 98, position = TITAN_PANEL_PLACE_BOTTOM },
    VehicleMenuBar = { frameName = "VehicleMenuBar", frameArchor = "BOTTOM", xArchor = "CENTER", y = 0, position = TITAN_PANEL_PLACE_BOTTOM },
}

function TitanMovableFrame_AdjustBlizzardFrames()
    if not InCombatLockdown() then
        Titan_FCF_UpdateDockPosition();
        Titan_FCF_UpdateCombatLogPosition();
        Titan_CastingBarFrame_UpdatePosition();
        Titan_ContainerFrames_Relocate();
    end
end

function TitanMovableFrame_CheckFrames(position)
    local top, bottom, panelYOffset, frameTop;

    TitanMovable = {};

    if (position == TITAN_PANEL_PLACE_TOP) then

        panelYOffset = TitanMovable_GetPanelYOffset(TITAN_PANEL_PLACE_TOP, TitanPanelGetVar("BothBars"));

        -- Move PlayerFrame
        frameTop = TitanMovableFrame_GetOffset(PlayerFrame, "TOP");
        top = -4 + panelYOffset;
        TitanMovableFrame_CheckTopFrame(frameTop, top, PlayerFrame:GetName())

        -- Move TargetFrame
        frameTop = TitanMovableFrame_GetOffset(TargetFrame, "TOP");
        top = -4 + panelYOffset;
        TitanMovableFrame_CheckTopFrame(frameTop, top, TargetFrame:GetName())

        -- Move PartyMemberFrame
        frameTop = TitanMovableFrame_GetOffset(PartyMemberFrame1, "TOP");
        top = -128 + panelYOffset;
        TitanMovableFrame_CheckTopFrame(frameTop, top, PartyMemberFrame1:GetName())

        -- Move TicketStatusFrame
        frameTop = TitanMovableFrame_GetOffset(TicketStatusFrame, "TOP");
        top = 0 + panelYOffset;
        TitanMovableFrame_CheckTopFrame(frameTop, top, TicketStatusFrame:GetName())

        -- Move TemporaryEnchantFrame. Seems this will be deprecated in the future in favor of BuffFrame ...
        --[[
        frameTop = TitanMovableFrame_GetOffset(TemporaryEnchantFrame, "TOP");
        if TicketStatusFrame:IsVisible() then
            top = 0 - TicketStatusFrame:GetHeight() + panelYOffset;
        else
            top = -13 + panelYOffset;
        end
        TitanMovableFrame_CheckTopFrame(frameTop, top, TemporaryEnchantFrame:GetName())
        ]]
        -- Move MinimapCluster
        if (not CleanMinimap) then
            if not TitanPanelGetVar("MinimapAdjust") then
                frameTop = TitanMovableFrame_GetOffset(MinimapCluster, "TOP");
                top = 0 + panelYOffset;
                TitanMovableFrame_CheckTopFrame(frameTop, top, MinimapCluster:GetName())
            end
        end
        -- Move BuffFrame
        frameTop = TitanMovableFrame_GetOffset(BuffFrame, "TOP");
        if BuffFrame:IsVisible() then
            top = 0 - BuffFrame:GetHeight() + panelYOffset;
        else
            top = -13 + panelYOffset;
        end
        TitanMovableFrame_CheckTopFrame(frameTop, top, BuffFrame:GetName())
        TitanMovableFrame_CheckTopFrame(frameTop, top, ConsolidatedBuffs:GetName())

        -- Move WorldStateAlwaysUpFrame
        local check = WorldFrame:IsProtected() -- check to ensure that the WorldFrame can be moved by insecure code
        if not check then
            frameTop = TitanMovableFrame_GetOffset(WorldStateAlwaysUpFrame, "TOP");
            top = -15 + panelYOffset;
            TitanMovableFrame_CheckTopFrame(frameTop, top, WorldStateAlwaysUpFrame:GetName());
        end

    elseif (position == TITAN_PANEL_PLACE_BOTTOM) then

        panelYOffset = TitanMovable_GetPanelYOffset(TITAN_PANEL_PLACE_BOTTOM, TitanPanelGetVar("BothBars"));

        -- Move MainMenuBar
        bottom = 0 + panelYOffset;
        frameBottom = TitanMovableFrame_GetOffset(MainMenuBar, "BOTTOM");
        TitanMovableFrame_CheckBottomFrame(frameBottom, bottom, MainMenuBar:GetName());

        -- Move MultiBarRight
        bottom = 98 + panelYOffset;
        frameBottom = TitanMovableFrame_GetOffset(MultiBarRight, "BOTTOM");
        TitanMovableFrame_CheckBottomFrame(frameBottom, bottom, MultiBarRight:GetName());

        -- Move VehicleMenuBar
        TitanMovableFrame_CheckBottomFrame(_, _, VehicleMenuBar:GetName());
    end
end

function TitanMovableFrame_MoveFrames(position, override)
    local frameData, frame, frameName, frameArchor, xArchor, y, xOffset, yOffset, panelYOffset;

    if not InCombatLockdown() then
        for index, value in pairs(TitanMovable) do
            frameData = TitanMovableData[value];

            if frameData then
                frame = _G[frameData.frameName];
                frameName = frameData.frameName;
                frameArchor = frameData.frameArchor;
            end

            if frame and (not frame:IsUserPlaced()) then
                xArchor = frameData.xArchor;
                y = frameData.y;

                panelYOffset = TitanMovable_GetPanelYOffset(frameData.position, TitanPanelGetVar("BothBars"), override);
                xOffset = TitanMovableFrame_GetOffset(frame, xArchor);

                -- properly adjust TemporaryEnchantFrame (buff frame) if GM Ticket is visible
                if (frameName == "ConsolidatedBuffs" and TicketStatusFrame:IsVisible()) then
                    yOffset = (-TicketStatusFrame:GetHeight()) + panelYOffset;
                else
                    yOffset = y + panelYOffset;
                end

                -- properly adjust MinimapCluster if its border is hidden
                if frameName == "MinimapCluster" and MinimapBorderTop and not MinimapBorderTop:IsShown() then
                    yOffset = yOffset + (MinimapBorderTop:GetHeight() * 3 / 5) - 5
                end

                -- adjust the MainMenuBar according to its scale
                if (frameName == "MainMenuBar" and MainMenuBar:IsVisible()) then
                    local framescale = MainMenuBar:GetScale() or 1;
                    yOffset = yOffset / framescale;
                end

                -- account for Reputation Status Bar (doh)
                local playerlevel = UnitLevel("player");
                if (frameName == "MultiBarRight" and ReputationWatchStatusBar:IsVisible() and playerlevel < MAX_PLAYER_LEVEL) then
                    yOffset = yOffset + 8;
                end

                frame:ClearAllPoints();
                frame:SetPoint(frameArchor, "UIParent", frameArchor, xOffset, yOffset);
            else
                --Leave frame where it is as it has been moved by a user
            end
            updateContainerFrameAnchors();
        end
    else
        dwSecureCall(TitanMovableFrame_MoveFrames, position, override);
    end
end

function TitanMovableFrame_GetOffset(frame, point)
    if (frame and point) then
        if (point == "LEFT" and frame:GetLeft() and UIParent:GetLeft()) then
            return frame:GetLeft() - UIParent:GetLeft();
        elseif (point == "RIGHT" and frame:GetRight() and UIParent:GetRight()) then
            return frame:GetRight() - UIParent:GetRight();
        elseif (point == "TOP" and frame:GetTop() and UIParent:GetTop()) then
            return frame:GetTop() - UIParent:GetTop();
        elseif (point == "BOTTOM" and frame:GetBottom() and UIParent:GetBottom()) then
            return frame:GetBottom() - UIParent:GetBottom();
        elseif (point == "CENTER" and frame:GetLeft() and frame:GetRight() and UIParent:GetLeft() and UIParent:GetRight()) then
            local framescale = frame and frame.GetScale and frame:GetScale() or 1;
            return (frame:GetLeft() * framescale + frame:GetRight() * framescale - UIParent:GetLeft() - UIParent:GetRight()) / 2;
        end
    end
    return 0;
end

function TitanMovable_GetPanelYOffset(framePosition, bothbars, override)
    local barPosition = TitanPanelGetVar("Position");
    local barnumber = 0;

    if override then
        if framePosition == TITAN_PANEL_PLACE_TOP then
            if TitanPanelGetVar("ScreenAdjust") then
                return 0;
            end
        elseif framePosition == TITAN_PANEL_PLACE_BOTTOM and bothbars == nil then
            if TitanPanelGetVar("ScreenAdjust") then
                return 0;
            end
        elseif framePosition == TITAN_PANEL_PLACE_BOTTOM and bothbars == 1 then
            if TitanPanelGetVar("AuxScreenAdjust") then
                return 0;
            end
        else
            return 0;
        end
    end

    if bothbars ~= nil then
        barPosition = framePosition;
    else
        barPosition = TitanPanelGetVar("Position");
    end

    barnumber = TitanUtils_GetDoubleBar(bothbars, framePosition);

    local scale = TitanPanelGetVar("Scale");
    if (scale and framePosition and barPosition and framePosition == barPosition) then
        if (framePosition == TITAN_PANEL_PLACE_TOP) then
            return (-24 * scale) * (barnumber);
        elseif (framePosition == TITAN_PANEL_PLACE_BOTTOM) then
            return (24 * scale) * (barnumber);
        end
    end
    return 0;
end

function TitanMovableFrame_CheckTopFrame(frameTop, top, frameName)
    table.insert(TitanMovable, frameName)
end

function TitanMovableFrame_CheckBottomFrame(frameBottom, bottom, frameName)
    table.insert(TitanMovable, frameName)
end

function Titan_TicketStatusFrame_OnEvent(self, event, ...)
    local panelYOffset = TitanMovable_GetPanelYOffset(TITAN_PANEL_PLACE_TOP, TitanPanelGetVar("BothBars"));
    if (event == "PLAYER_ENTERING_WORLD") then
    elseif (event == "UPDATE_TICKET") then
        local category = ...;
        if (category and (not GMChatStatusFrame or not GMChatStatusFrame:IsShown())) then
            -- Compensate for firing an UPDATE_TICKET event
            if not InCombatLockdown() then
                if not TitanPanelGetVar("ScreenAdjust") then
                    --TemporaryEnchantFrame:SetPoint("TOPRIGHT", self:GetParent():GetName(), "TOPRIGHT", -205, 0 - self:GetHeight() + panelYOffset); -- ATTN
                    ConsolidatedBuffs:SetPoint("TOPRIGHT", self:GetParent():GetName(), "TOPRIGHT", -205, 0 - self:GetHeight() + panelYOffset); -- ATTN
                else
                    ConsolidatedBuffs:SetPoint("TOPRIGHT", self:GetParent():GetName(), "TOPRIGHT", -205, 0 - self:GetHeight()); -- ATTN
                end
            end
        else
            if not InCombatLockdown() then
                if not TitanPanelGetVar("ScreenAdjust") then
                    ConsolidatedBuffs:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT", -205, -13 + panelYOffset); -- ATTN
                else
                    ConsolidatedBuffs:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT", -205, -13); -- ATTN
                end
            end
        end
    end
end

function Titan_FCF_UpdateDockPosition()
    if TitanPanelGetVar("LogAdjust") then
        if not InCombatLockdown() or (InCombatLockdown() and not DEFAULT_CHAT_FRAME:IsProtected()) then
            local panelYOffset = TitanMovable_GetPanelYOffset(TITAN_PANEL_PLACE_BOTTOM, TitanPanelGetVar("BothBars"));

            if (DEFAULT_CHAT_FRAME:IsUserPlaced()) then
                if (SIMPLE_CHAT ~= "1") then
                    return;
                end
            end

            local chatOffset = 85 + panelYOffset;
            if (GetNumShapeshiftForms() > 0 or HasPetUI() or PetHasActionBar()) then
                if (MultiBarBottomLeft:IsVisible()) then
                    chatOffset = chatOffset + 55;
                else
                    chatOffset = chatOffset + 15;
                end
            elseif (MultiBarBottomLeft:IsVisible()) then
                chatOffset = chatOffset + 15;
            end
            DEFAULT_CHAT_FRAME:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 32, chatOffset);
            FCF_DockUpdate();
        end
    end
end

function Titan_FCF_UpdateCombatLogPosition()
    if TitanPanelGetVar("LogAdjust") then
        if not InCombatLockdown() or (InCombatLockdown() and not ChatFrame1:IsProtected() and not ChatFrame2:IsProtected()) then
            local panelYOffset = TitanMovable_GetPanelYOffset(TITAN_PANEL_PLACE_BOTTOM, TitanPanelGetVar("BothBars"));

            local point1, _, relativePoint1, xOfs1, _ = ChatFrame1:GetPoint()
            local point2, relativeTo, relativePoint2, xOfs2, yOfs2 = ChatFrame2:GetPoint()

            local xOffset = 0;
            local yOffset = 85 + panelYOffset;
            local yOffset2 = 85 + panelYOffset;
            if MultiBarBottomLeft:IsShown() then
                yOffset = yOffset + 20;
                yOffset2 = yOffset2 + 50;
                if GetNumShapeshiftForms() > 0 or HasPetUI() or PetHasActionBar() then
                else
                    yOffset2 = yOffset2 - 50;
                    yOffset2 = yOffset2 + 15;
                end
            elseif MultiBarBottomRight:IsShown() then
                yOffset = yOffset + 20;
                yOffset2 = yOffset2 + 50;
                if GetNumShapeshiftForms() > 0 or HasPetUI() or PetHasActionBar() then
                else
                    yOffset2 = yOffset2 - 50;
                    yOffset2 = yOffset2 + 15;
                end
            else
                yOffset = yOffset + 5;
                yOffset2 = yOffset2 + 15;
            end
            -- account for Reputation Status Bar (doh)
            local playerlevel = UnitLevel("player");
            if ReputationWatchStatusBar:IsVisible() and playerlevel < MAX_PLAYER_LEVEL then
                yOffset = yOffset + 8;
                yOffset2 = yOffset2 + 8;
            end

            --[[if ( MultiBarLeft:IsVisible() ) then
                xOffset = xOffset - 88;
            elseif ( MultiBarRight:IsVisible() ) then
                xOffset = xOffset - 43;
            end]] --
            --ChatFrame1:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 32, yOffset2);
            --ChatFrame2:SetPoint("BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", xOffset, yOffset);
            if point1 == "BOTTOMLEFT" and relativePoint1 == "BOTTOMLEFT" then
                ChatFrame1:SetPoint(point1, "UIParent", relativePoint1, xOfs1, yOffset2);
            end
            if relativeTo == nil and point2 == "BOTTOMRIGHT" and relativePoint2 == "BOTTOMRIGHT" then
                ChatFrame2:SetPoint(point2, "UIParent", relativePoint2, xOfs2, yOffset);
            end
        end
    end
end

function Titan_CastingBarFrame_UpdatePosition()
    if TitanPanelGetVar("CastingBar") then
        if not InCombatLockdown() then
            local panelYOffset = TitanMovable_GetPanelYOffset(TITAN_PANEL_PLACE_BOTTOM, TitanPanelGetVar("BothBars"));

            local castingBarPosition = 60 + panelYOffset;
            if (PetActionBarFrame:IsVisible() or ShapeshiftBarFrame:IsVisible()) then
                castingBarPosition = castingBarPosition + 40;
            end
            if (MultiBarBottomLeft:IsShown() or MultiBarBottomRight:IsShown()) then
                castingBarPosition = castingBarPosition + 40;
            end
            -- account for Reputation Status Bar (doh)
            local playerlevel = UnitLevel("player");
            if ReputationWatchStatusBar:IsVisible() and playerlevel < MAX_PLAYER_LEVEL then
                castingBarPosition = castingBarPosition + 10;
            end
            CastingBarFrame:ClearAllPoints();
            CastingBarFrame:SetPoint("BOTTOM", "UIParent", "BOTTOM", 0, castingBarPosition);
        end
    end
end


function Titan_ContainerFrames_Relocate()
    local panelYOffset = TitanMovable_GetPanelYOffset(TITAN_PANEL_PLACE_BOTTOM, TitanPanelGetVar("BothBars"), 1);
    -- Get the Blizzard offsets from the relevant table
    local BlizzContainerYoffs, BlizzContainerYoffsABoffs = 0, 0
    if UIPARENT_MANAGED_FRAME_POSITIONS["CONTAINER_OFFSET_Y"].yOffset then
        BlizzContainerYoffs = UIPARENT_MANAGED_FRAME_POSITIONS["CONTAINER_OFFSET_Y"].yOffset
    end
    if UIPARENT_MANAGED_FRAME_POSITIONS["CONTAINER_OFFSET_Y"].bottomEither then
        BlizzContainerYoffsABoffs = UIPARENT_MANAGED_FRAME_POSITIONS["CONTAINER_OFFSET_Y"].bottomEither
    end
    -- experimental fixes
    -- Update bag anchor
    if MultiBarBottomRight:IsShown() or MultiBarBottomLeft:IsShown() then
        CONTAINER_OFFSET_Y = menuBarTop + BlizzContainerYoffs + BlizzContainerYoffsABoffs + panelYOffset;
        --CONTAINER_OFFSET_Y = 110 + panelYOffset;
    elseif not MultiBarBottomRight:IsVisible() and not MultiBarBottomLeft:IsVisible() then
        CONTAINER_OFFSET_Y = menuBarTop + BlizzContainerYoffs + panelYOffset;
        --CONTAINER_OFFSET_Y = 65 + panelYOffset;
    else
        CONTAINER_OFFSET_Y = 70 + panelYOffset;
    end

    -- account for Reputation Status Bar (doh)
    local playerlevel = UnitLevel("player");
    if ReputationWatchStatusBar:IsVisible() and playerlevel < MAX_PLAYER_LEVEL then
        CONTAINER_OFFSET_Y = CONTAINER_OFFSET_Y + 9;
    end

    if (MultiBarLeft:IsShown()) then
        CONTAINER_OFFSET_X = 93;
    elseif (MultiBarRight:IsShown()) then
        CONTAINER_OFFSET_X = 48;
        --45
    else
        CONTAINER_OFFSET_X = 0;
    end
end

function Titan_ManageFramesNew()
    -- Move frames
    Titan_CastingBarFrame_UpdatePosition();
    Titan_FCF_UpdateCombatLogPosition();

    if (TitanPanelGetVar("BothBars") and not TitanPanelGetVar("AuxScreenAdjust")) or (TitanPanelGetVar("Position") == 2 and not TitanPanelGetVar("ScreenAdjust")) then
        TitanMovableFrame_CheckFrames(TITAN_PANEL_PLACE_BOTTOM);
        TitanMovableFrame_MoveFrames(TITAN_PANEL_PLACE_BOTTOM, TitanPanelGetVar("AuxScreenAdjust"));
        Titan_ContainerFrames_Relocate();
        Titan_CastingBarFrame_UpdatePosition();
    end
end

local function Titan_ManageTopFramesVehicle()
    TitanMovableFrame_CheckFrames(1);
    TitanMovableFrame_MoveFrames(1, TitanPanelGetVar("ScreenAdjust"));
end

local function Titan_ManageVehicles()
    TitanMovableModule:CancelAllTimers()
    TitanMovableModule:ScheduleTimer(Titan_ManageTopFramesVehicle, 1.5)
    TitanMovableModule:ScheduleTimer(Titan_ManageFramesNew, 1)
end

local function Titan_AdjustUIScale()
    -- Refresh panel scale and buttons
    TitanPanel_SetScale();

    TitanPanel_ClearAllBarTextures()
    TitanPanel_CreateBarTextures()

    TitanPanel_SetPosition("TitanPanelBarButton", TitanPanelGetVar("Position"));
    TitanPanel_SetTexture("TitanPanelBarButton", TitanPanelGetVar("Position"));
    TitanPanel_CreateBarTextures()
    TitanPanel_SetTexture("TitanPanelAuxBarButton", TITAN_PANEL_PLACE_BOTTOM);
    -- Handle AutoHide
    if (TitanPanelGetVar("AutoHide")) then TitanPanelBarButton_Hide("TitanPanelBarButton", TitanPanelGetVar("Position")) end
    if (TitanPanelGetVar("AuxAutoHide")) then TitanPanelBarButton_Hide("TitanPanelAuxBarButton", TITAN_PANEL_PLACE_BOTTOM) end
    TitanPanel_RefreshPanelButtons();
end


-- Titan Hooks
-- Overwrite Blizzard Frame positioning functions
TitanMovableModule:SecureHook("TicketStatusFrame_OnEvent", Titan_TicketStatusFrame_OnEvent)
--TitanMovableModule:SecureHook("FCF_UpdateDockPosition", Titan_FCF_UpdateDockPosition)
--TitanMovableModule:SecureHook("FCF_UpdateCombatLogPosition", Titan_FCF_UpdateCombatLogPosition)
TitanMovableModule:SecureHook("updateContainerFrameAnchors", Titan_ContainerFrames_Relocate)
TitanMovableModule:SecureHook(WorldMapFrame, "Hide", Titan_ManageFramesNew)
TitanMovableModule:SecureHook("UIParent_ManageFramePositions", Titan_ManageFramesNew)
TitanMovableModule:SecureHook("VehicleSeatIndicator_SetUpVehicle", Titan_ManageVehicles)
TitanMovableModule:SecureHook("VehicleSeatIndicator_UnloadTextures", Titan_ManageVehicles)
-- Properly Adjust UI Scale if set
-- Note: These are the least intrusive hooks we could think of, to properly adjust the Titan Bar(s)
-- without having to resort to a SetCvar secure hook. Any addon using SetCvar should make sure to use the 3rd
-- argument in the API call and trigger the CVAR_UPDATE event with an appropriate argument so that other addons
-- can detect this behavior and fire their own functions (where applicable).
TitanMovableModule:SecureHook("VideoOptionsFrameOkay_OnClick", Titan_AdjustUIScale)
TitanMovableModule:SecureHook(VideoOptionsFrame, "Hide", Titan_AdjustUIScale)