
local Mapster = LibStub("AceAddon-3.0"):GetAddon("Mapster")
local L = LibStub("AceLocale-3.0"):GetLocale("Mapster")

local MODNAME = "Minimap";
local addon = Mapster:NewModule(MODNAME)

local db
local default = {
	profile = {
	}
}

function addon:OnInitialize()
	--self.db = Mapster.db:RegisterNamespace(MODNAME, defaults)
	--db = self.db.profile
	
	--self:SetEnabledState(Mapster:GetModuleEnabled(MODNAME))
end

function addon:OnEnable()
	--self:DisableBlzMinimap()
end

function addon:OnDisable()
	
end

function addon:DisableBlzMinimap()
	MinimapZoomIn:Hide();
	MinimapZoomOut:Hide();

	MiniMapTrackingBackground:Hide()
	MiniMapTrackingButton:SetHighlightTexture('')
	MiniMapTrackingButtonBorder:SetTexture('')
	MiniMapTrackingIcon:SetTexCoord(0.065, 0.935, 0.065, 0.935)
	MiniMapTrackingIconOverlay:SetTexture('')
	MiniMapTracking:SetParent(Minimap)
	MiniMapTracking:ClearAllPoints()
	MiniMapTracking:SetPoint('TOPLEFT', -2, 2)

	BattlegroundShine:Hide()
	MiniMapBattlefieldBorder:SetTexture('')
	MiniMapBattlefieldFrame:SetParent(Minimap)
	MiniMapBattlefieldFrame:ClearAllPoints()
	MiniMapBattlefieldFrame:SetPoint('TOPRIGHT', -2, -2)

	MiniMapMailBorder:SetTexture('')
	MiniMapMailFrame:SetParent(Minimap)
	MiniMapMailFrame:ClearAllPoints()
	MiniMapMailFrame:SetPoint('TOP', 0, -4)
	MiniMapMailFrame:SetHeight(8)

	--MiniMapMailText = MiniMapMailFrame:CreateFontString(nil, 'OVERLAY')
	---MiniMapMailText:SetFont(LSM:Fetch('font', pMinimapDB.smfont), pMinimapDB.fontsize, pMinimapDB.fontflag)
	--MiniMapMailText:SetPoint('BOTTOM', 0, 2)
	--MiniMapMailText:SetText('New Mail!')
	--MiniMapMailText:SetTextColor(1, 1, 1)

	--[[MinimapZoneTextButton:SetParent(Minimap)
	MinimapZoneTextButton:ClearAllPoints()
	MinimapZoneTextButton:SetPoint(pMinimapDB.zonePoint == 'BOTTOM' and 'TOP' or 'BOTTOM', Minimap, pMinimapDB.zonePoint, 0, pMinimapDB.zoneOffset)
	MinimapZoneTextButton:SetWidth(Minimap:GetWidth() * 1.5)

	MinimapZoneText:ClearAllPoints()
	MinimapZoneText:SetAllPoints(MinimapZoneTextButton)
	MinimapZoneText:SetFont(LSM:Fetch('font', pMinimapDB.smfont), pMinimapDB.fontsize, pMinimapDB.fontflag)
	MinimapZoneText:SetShadowOffset(0, 0)

	MinimapBorder:SetTexture('')
	MinimapBorderTop:Hide()
	MinimapToggleButton:Hide()

	GameTimeFrame:Hide()
	MiniMapWorldMapButton:Hide()
	MiniMapMeetingStoneFrame:SetAlpha(0)
	MiniMapVoiceChatFrame:Hide()
	MiniMapVoiceChatFrame.Show = MiniMapVoiceChatFrame.Hide
	MinimapNorthTag:SetAlpha(0)

	Minimap:EnableMouseWheel()
	Minimap:SetScript('OnMouseWheel', onMouseWheel)
	Minimap:SetScale(pMinimapDB.scale)
	Minimap:SetFrameLevel(pMinimapDB.level)
	Minimap:SetFrameStrata(pMinimapDB.strata)
	Minimap:SetMaskTexture([=[Interface\ChatFrame\ChatFrameBackground]=])
	Minimap:SetBackdrop({bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=], insets = {top = - pMinimapDB.offset, left = - pMinimapDB.offset, bottom = - pMinimapDB.offset, right = - pMinimapDB.offset}})
	Minimap:SetBackdropColor(unpack(pMinimapDB.colors))]]
end