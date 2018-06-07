-- BlizzMmove, move the blizzard frames by yess
db = nil
local frame = CreateFrame("Frame")
local optionPanel = nil
local enable = false;
local loaded = false;
local defaultDB = { 
	AchievementFrame = {save = true},
	CalendarFrame = {save = true},
	AuctionFrame = {save = true},
	GuildBankFrame = {save = true},
}

local Blizzard_LoadOnDemand = {
	["Blizzard_InspectUI"] = {"InspectFrame"},
	["Blizzard_GuildBankUI"] = {"GuildBankFrame"},
	["Blizzard_TradeSkillUI"] = {"TradeSkillFrame"},
	["Blizzard_ItemSocketingUI"] = {"ItemSocketingFrame"},
	["Blizzard_BarbershopUI"] = {"BarberShopFrame"},
	["Blizzard_GlyphUI"] = {"SpellBookFrame", "GlyphFrame"},
	["Blizzard_MacroUI"] = {"MacroFrame"},
	["Blizzard_AchievementUI"] = {"AchievementFrame", "AchievementFrameHeader"},
	["Blizzard_TalentUI"] = {"PlayerTalentFrame"},
	["Blizzard_Calendar"] = {"CalendarFrame"},
	["Blizzard_TrainerUI"] = {"ClassTrainerFrame"},
	["Blizzard_BindingUI"] = {"KeyBindingFrame"},
	["Blizzard_AuctionUI"] = {"AuctionFrame"},
	["Blizzard_TimeManager"] = {"TimeManagerFrame"},
};

local function Print(...)
	local s = "BlizzMove:"
	for i=1,select("#", ...) do
		local x = select(i, ...)
		s = strjoin(" ",s,tostring(x))
	end
	--DEFAULT_CHAT_FRAME:AddMessage(s)
end

local debug = false
local function Debug(...)
	if debug then
		Print(...)
	end
end

local function OnShow(self, ...)
	if (enable) then	
		local settings = self.settings
		if settings and settings.point and settings.save then
			self:ClearAllPoints()
			self:SetPoint(settings.point,settings.relativeTo, settings.relativePoint, settings.xOfs,settings.yOfs)
			local scale = settings.scale
			if scale then 
				self:SetScale(scale)
			end
		end
	end
end

local function OnDragStart(self)
	if (enable) then	
		local frameToMove = self.frameToMove
		local settings = frameToMove.settings
		if settings and not settings.default then -- set defaults 
			settings.default = {}
			local def = settings.default
			def.point, def.relativeTo , def.relativePoint, def.xOfs, def.yOfs = frameToMove:GetPoint()
			if def.relativeTo then
				def.relativeTo = def.relativeTo:GetName()
			end
		end
		frameToMove:StartMoving()
		frameToMove.isMoving = true
	end
end

local function OnDragStop(self)
	local frameToMove = self.frameToMove
	local settings = frameToMove.settings
	frameToMove:StopMovingOrSizing()
	frameToMove.isMoving = false
	if settings then
		settings.point, settings.relativeTo, settings.relativePoint, settings.xOfs, settings.yOfs = frameToMove:GetPoint()
	end
end

local function OnMouseUp(self, ...)
	local frameToMove = self.frameToMove
	if IsControlKeyDown() then
		local settings = frameToMove.settings
		--toggle save
		if settings then
			settings.save = not settings.save
			if settings.save then
				Print("Frame: ",frameToMove:GetName()," will be saved.")
			else
				Print("Frame: ",frameToMove:GetName()," will be not saved.")
			end
		else
			Print("Frame: ",frameToMove:GetName()," will be saved.")
			db[frameToMove:GetName()] = {}
			settings = db[frameToMove:GetName()]
			settings.save = true
			settings.point, settings.relativeTo, settings.relativePoint, settings.xOfs, settings.yOfs = frameToMove:GetPoint()
			if settings.relativeTo then
			settings.relativeTo = settings.relativeTo:GetName()
			end
			frameToMove.settings = settings
		end
	end
end

local function SetMoveHandler(frameToMove, handler)	
	if not frameToMove then
		return
	end
	if not handler then
		handler = frameToMove
	end
	
	local settings = db[frameToMove:GetName()]
	if not settings then
		settings = defaultDB[frameToMove:GetName()] or {}
		db[frameToMove:GetName()] = settings
	end
	frameToMove.settings = settings
	handler.frameToMove = frameToMove
	
	
	frameToMove:EnableMouse(true)
	frameToMove:SetMovable(true) 
		
	handler:RegisterForDrag("LeftButton");
		
	handler:SetScript("OnDragStart", OnDragStart)
	handler:SetScript("OnDragStop", OnDragStop)
		
	--override frame position according to settings when shown
	if (frameToMove:HasScript("OnShow")) then
		frameToMove:HookScript("OnShow", OnShow)	;
	else
		frameToMove:SetScript("OnShow", OnShow)	;
	end	
		
	--hook OnMouseUp 
	if (handler:HasScript("OnMouseUp")) then
		handler:HookScript("OnMouseUp", OnMouseUp)
	else
		handler:SetScript("OnMouseUp", OnMouseUp)
	end	
end

local function checkBlizzLoaded()
	for a, t in pairs(Blizzard_LoadOnDemand) do
		if (IsAddOnLoaded(a)) then
			SetMoveHandler(_G[t[1]], _G[t[2]]);
		end
	end
end


local function resetDB()
	for k, v in pairs(db) do
		local f = _G[k]
		if f and f.settings then
			f.settings.save = false
			local def = f.settings.default
			if def then
				f:ClearAllPoints()
				f:SetPoint(def.point,def.relativeTo, def.relativePoint, def.xOfs,def.yOfs)
			end
		end
	end
end
	
local function OnEvent(self, event, name)
	if (event == "ADDON_LOADED") then		
		if (Blizzard_LoadOnDemand[name]) then				
			SetMoveHandler(_G[Blizzard_LoadOnDemand[name][1]], Blizzard_LoadOnDemand[name][2] and _G[Blizzard_LoadOnDemand[name][2]] or nil);
		end
	end
end

frame:SetScript("OnEvent", OnEvent);
----------------------------------------------------------
-- User function to move/lock a frame with a handler
-- handler, the frame the user has clicked on
-- frameToMove, the handler itself, a parent frame of handler 
--              that has UIParent as Parent or nil  
----------------------------------------------------------
BlizzMove = {}
function BlizzMove:Toggle(handler)
	if not handler then
		handler = GetMouseFocus()
	end
	
	if handler:GetName() == "WorldFrame" then
		return
	end
	
	local lastParent = handler
	local frameToMove = handler
	local i=0
	--get the parent attached to UIParent from handler
	while lastParent and lastParent ~= UIParent and i < 100 do
			frameToMove = lastParent --set to last parent
			lastParent = lastParent:GetParent()
			i = i +1
	end
	if handler and frameToMove then
		if handler:GetScript("OnDragStart") then
			handler:SetScript("OnDragStart", nil)
			--Print("Frame: ",frameToMove:GetName()," locked.")
		else
			--Print("Frame: ",frameToMove:GetName()," to move with handler ",handler:GetName())
			SetMoveHandler(frameToMove, handler)
		end
	
	else
		Print("Error parent not found.")
	end	
end

BINDING_HEADER_BLIZZMOVE = "BlizzMove";
BINDING_NAME_MOVEFRAME = "Move/Lock a Frame";

-- Interface
function BlizzMove_Toggle(switch)
	enable = switch;
	if (switch and not loaded) then			
		db = BlizzMoveDB or defaultDB
		BlizzMoveDB = db
		--SetMoveHandler(frameToMove, handlerFrame)
		SetMoveHandler(CharacterFrame,PaperDollFrame)
		SetMoveHandler(CharacterFrame,TokenFrame)
		SetMoveHandler(CharacterFrame,SkillFrame)
		SetMoveHandler(CharacterFrame,ReputationFrame)
		SetMoveHandler(CharacterFrame,PetPaperDollFrameCompanionFrame)
		SetMoveHandler(PVPParentFrame, PVPFrame)
		SetMoveHandler(PVPParentFrame, PVPBattlegroundFrame)
		SetMoveHandler(SpellBookFrame)
		SetMoveHandler(QuestLogFrame)
		SetMoveHandler(FriendsFrame)
		SetMoveHandler(LFGParentFrame)
		SetMoveHandler(GameMenuFrame)
		SetMoveHandler(GossipFrame)
		SetMoveHandler(DressUpFrame)
		SetMoveHandler(QuestFrame)
		SetMoveHandler(MerchantFrame)
		SetMoveHandler(HelpFrame)
		SetMoveHandler(PlayerTalentFrame)
		SetMoveHandler(ClassTrainerFrame)
		SetMoveHandler(MailFrame)
		SetMoveHandler(BankFrame)
		SetMoveHandler(VideoOptionsFrame)
		SetMoveHandler(InterfaceOptionsFrame)
		SetMoveHandler(LootFrame)
		
		checkBlizzLoaded()
		frame:RegisterEvent("ADDON_LOADED") --for blizz lod addons
		loaded = true;
	end
end

function BlizzMove_ResetDB()
	resetDB();
end