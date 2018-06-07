--[[

	MBB Author: Tunhadil, Fixed by Pericles for patch 2.23 onwards
	Addon to reduces minimap buttons and makes them accessible through a menu!

]]

--[[

v0.50 - Fixed a few loose button issues, and child/parent frame issues that were causing stack overflows

v0.51 - Changed bar strata to HIGH from LOW to put it in front of things like GRID.

v0.52 - Changed TOC for patch 2.3

v0.60 - Fixed SecureStateAnchor bug for WotLK

v0.61 - Added exclusion for DAGAssist

v0.62 - Fixed stack overflow at line 438

v0.63 - Move button strata from high to medium

--]]


MBB_Version = "0.63";
MBB_DebugFlag = 0;
MBB_DragFlag = 0;
MBB_ShowTimeout = -1;
MBB_CheckTime = 0;
MBB_IsShown = 0;
MBB_FuBar_MinimapContainer = "FuBarPlugin-MinimapContainer-2.0";
MBB_Buttons = {};
DuowanAddon_MBB_Exclude = {};
MBB_DebugInfo = {};
MBB_DefaultOptions = {
	["ButtonPos"] = {-18, -100},
	["AttachToMinimap"] = 1,
	["CollapseTimeout"] = 1,
	["ExpandDirection"] = 1,
	["MaxButtonsPerLine"] = 0,
	["AltExpandDirection"] = 4
};

if(not DuowanAddon_MBB_Options) then
	DuowanAddon_MBB_Options = {};
	DuowanAddon_MBB_Options = MBB_DefaultOptions;
end
	
MBB_Include = {
	[1] = "WIM_IconFrame",
	[2] = "CTMod2_MinimapButton",
	[3] = "PoisonerMinimapButton",
};

MBB_Ignore = {
	[1] = "MiniMapTrackingFrame",
	[2] = "MiniMapMeetingStoneFrame",
	[3] = "MiniMapMailFrame",
	[4] = "MiniMapBattlefieldFrame",
	[5] = "MiniMapWorldMapButton",
	[6] = "MiniMapPing",
	[7] = "MinimapBackdrop",
	[8] = "MinimapZoomIn",
	[9] = "MinimapZoomOut",
	[10] = "BookOfTracksFrame",
	[11] = "GatherNote",
	[12] = "FishingExtravaganzaMini",
	[13] = "MiniNotePOI",
	[14] = "RecipeRadarMinimapIcon",
	[15] = "FWGMinimapPOI",
	[16] = "CartographerNotesPOI",
	[17] = "DuowanMinimapButton",
	[18] = "EnhancedFrameMinimapButton",
	[19] = "GFW_TrackMenuFrame",
	[20] = "GFW_TrackMenuButton",
	[21] = "TDial_TrackingIcon",
	[22] = "TDial_TrackButton",
	[23] = "MiniMapTracking",
	[24] = "GatherMatePin",
	[25] = "HandyNotesPin",
	[26] = "TimeManagerClockButton",
	[27] = "GameTimeFrame",
	[28] = "DA_Minimap",

	[29] = "DuowanMinimapButton",
	[30] = "BigFootMinimapButton",	
	[31] = "WoWShellMiniButton",
	[32] = "MiniMapVoiceChatFrame",
	[33] = "SexyMapCoordFrame",
	[34] = "MiniMapLFGFrame",
};

MBB_IgnoreSize = {
	[1] = "AM_MinimapButton",
	[2] = "STC_HealthstoneButton",
	[3] = "STC_ShardButton",
	[4] = "STC_SoulstoneButton",
	[5] = "STC_SpellstoneButton",
	[6] = "STC_FirestoneButton"
};

MBB_ExtraSize = {
	["GathererMinimapButton"] = function()
		GathererMinimapButton.mask:SetHeight(31);
		GathererMinimapButton.mask:SetWidth(31);
	end
};

function MBB_OnLoad()
	if( AceLibrary ) then
		if( AceLibrary:HasInstance(MBB_FuBar_MinimapContainer) ) then
			AceLibrary(MBB_FuBar_MinimapContainer).oldAddPlugin = AceLibrary(MBB_FuBar_MinimapContainer).AddPlugin;
			AceLibrary(MBB_FuBar_MinimapContainer).AddPlugin = function(...)
				local plugin = select(2, ...);
				local value = AceLibrary(MBB_FuBar_MinimapContainer):oldAddPlugin(plugin);
				local button = plugin.minimapFrame:GetName();
				local frame = dwGetglobal(button);
				
				if( not frame.oshow ) then
					MBB_PrepareButton(button);
					--if( not MBB_IsExcluded(button) ) then
					if( not MBB_IsInArray(DuowanAddon_MBB_Exclude, button) ) then
						MBB_AddButton(button);
						MBB_SetPositions();
					end
				end
				
				return value;
			end
			
			AceLibrary(MBB_FuBar_MinimapContainer).oldRemovePlugin = AceLibrary(MBB_FuBar_MinimapContainer).RemovePlugin;
			AceLibrary(MBB_FuBar_MinimapContainer).RemovePlugin = function(...)
				local plugin = select(2, ...);
				local button = plugin.minimapFrame:GetName();
				local frame = dwGetglobal(button);
				
				if( not frame.oshow ) then
					MBB_PrepareButton(button);
				end
				
				local value = AceLibrary(MBB_FuBar_MinimapContainer):oldRemovePlugin(plugin);
				return value;
			end
		end
	end
	
	this:RegisterEvent("VARIABLES_LOADED");
	SLASH_MBB1 = "/mmbb";
	SLASH_MBB2 = "/minimapbuttonbag";
	SlashCmdList["MBB"] = MBB_SlashHandler;
end

function MBB_SlashHandler(cmd)
	if( cmd == "buttons" ) then
		MBB_Print("MBB Buttons:");
		for i,name in ipairs(MBB_Buttons) do
			MBB_Print("  " .. name);
		end
	elseif( string.sub(cmd, 1, 6) == "debug " ) then
		local iStart, iEnd, sFrame = string.find(cmd, "debug (.+)");
		
		local hasClick, hasMouseUp, hasMouseDown, hasEnter, hasLeave = MBB_TestFrame(sFrame);
		
		MBB_Debug("Frame: " .. sFrame);
		if( hasClick ) then
			MBB_Debug("  has OnClick script");
		else
			MBB_Debug("  has no OnClick script");
		end
		if( hasMouseUp ) then
			MBB_Debug("  has OnMouseUp script");
		else
			MBB_Debug("  has no OnMouseUp script");
		end
		if( hasMouseDown ) then
			MBB_Debug("  has OnMouseDown script");
		else
			MBB_Debug("  has no OnMouseDown script");
		end
		if( hasEnter ) then
			MBB_Debug("  has OnEnter script");
		else
			MBB_Debug("  has no OnEnter script");
		end
		if( hasLeave ) then
			MBB_Debug("  has OnLeave script");
		else
			MBB_Debug("  has no OnLeave script");
		end
	elseif( cmd == "reset position" ) then
		DuowanAddon_MBB_Options.AttachToMinimap = MBB_DefaultOptions.AttachToMinimap;
		DuowanAddon_MBB_Options.ButtonPos = MBB_DefaultOptions.ButtonPos;
		MBB_SetButtonPosition();
	elseif( cmd == "reset all" ) then
		DuowanAddon_MBB_Options = MBB_DefaultOptions;
		for i=1,table.maxn(DuowanAddon_MBB_Exclude) do
			MBB_AddButton(DuowanAddon_MBB_Exclude[i]);
		end
		MBB_SetPositions();
		MBB_SetButtonPosition();
	elseif( cmd == "errors" ) then
		if( table.maxn(MBB_DebugInfo) > 0 ) then
			for name, arr in pairs(MBB_DebugInfo) do
				MBB_Print(name);
				for _, error in pairs(arr) do
					MBB_Print("  " .. error);
				end
			end
		else
			MBB_Print(MBB_NOERRORS);
		end
	else
		MBB_Print("MBB v" .. MBB_Version .. ":");
		MBB_Print(MBB_HELP1);
		MBB_Print(MBB_HELP2);
		MBB_Print(MBB_HELP3);
		MBB_Print(MBB_HELP4);
	end
end

local Object = {};
function BLibrary(name)
	return Object;
end
function Object:RegisterEvent() end
function Object:UnregisterEvent() end
function MBB_TestFrame(name)
	local hasClick = false;
	local hasMouseUp = false;
	local hasMouseDown = false;
	local hasEnter = false;
	local hasLeave = false;
	local testframe = dwGetglobal(name);
	
	if( testframe ) then
		if( not testframe.HasScript ) then
			if( testframe:GetName() ) then
				if( not MBB_DebugInfo[testframe:GetName()] ) then
					MBB_DebugInfo[testframe:GetName()] = {};
				end
				if( not MBB_IsInArray(MBB_DebugInfo[testframe:GetName()], "No HasScript") ) then
					table.insert(MBB_DebugInfo[testframe:GetName()], "No HasScript");
				end
			end
		else
			if( testframe:HasScript("OnClick") ) then
				local test = testframe:GetScript("OnClick");
				if( test ) then
					hasClick = true;
				end
			end
			if( testframe:HasScript("OnMouseUp") ) then
				local test = testframe:GetScript("OnMouseUp");
				if( test ) then
					hasMouseUp = true;
				end
			end
			if( testframe:HasScript("OnMouseDown") ) then
				local test = testframe:GetScript("OnMouseDown");
				if( test ) then
					hasMouseDown = true;
				end
			end
			if( testframe:HasScript("OnEnter") ) then
				local test = testframe:GetScript("OnEnter");
				if( test ) then
					hasEnter = true;
				end
			end
			if( testframe:HasScript("OnLeave") ) then
				local test = testframe:GetScript("OnLeave");
				if( test ) then
					hasLeave = true;
				end
			end
		end
	end
	
	return hasClick, hasMouseUp, hasMouseDown, hasEnter, hasLeave;
end

function MBB_OnEvent()
	if ( event == "VARIABLES_LOADED" ) then
		if( DuowanAddon_MBB_Options ) then
			for opt,val in pairs(MBB_DefaultOptions) do
				if( not DuowanAddon_MBB_Options[opt] ) then
					MBB_Debug(opt .. " option set to default: " .. tostring(val));
					DuowanAddon_MBB_Options[opt] = val;
				else
					MBB_Debug(opt .. " option exists: " .. tostring(DuowanAddon_MBB_Options[opt]));
				end
			end
		else
			DuowanAddon_MBB_Options = MBB_DefaultOptions;
		end
		
		MBB_SetButtonPosition();
		
		local children = {Minimap:GetChildren()};
		local additional = {MinimapBackdrop:GetChildren()};
		for _,child in ipairs(additional) do
			--print("1 "..child:GetName());
			
				table.insert(children, child);
			
		end
		for _,child in ipairs(MBB_Include) do
			--print("2 "..child);
			
				local childframe = dwGetglobal(child);
				if( childframe ) then
					table.insert(children, childframe);
				end
			
		end
		
		for _,child in ipairs(children) do
		--print("3 "..child:GetName());
		
			if( child:GetName() ) then
			
				local ignore = false;
				local exclude = false;
				for i,needle in ipairs(MBB_Ignore) do
					if( string.find(child:GetName(), needle) ) then
						ignore = true;
					end
				end
				if (string.find(child:GetName(), "^QuestPointerPOI")) then
					ignore = true;
				end
				if( not ignore ) then
					if( not child:HasScript("OnClick") ) then
						for _,subchild in ipairs({child:GetChildren()}) do
							if( subchild:HasScript("OnClick") ) then
								child = subchild;
								child.hasParentFrame = true;
								break;
							end
						end
					end
					
					local hasClick, hasMouseUp, hasMouseDown, hasEnter, hasLeave = MBB_TestFrame(child:GetName());
					
					if( hasClick or hasMouseUp or hasMouseDown ) then
						local name = child:GetName();
						
						MBB_PrepareButton(name);
						if( not MBB_IsInArray(DuowanAddon_MBB_Exclude, name) ) then
							if( child:IsVisible() ) then
								MBB_Debug("Button is visible: " .. name);
							else
								MBB_Debug("Button is not visible: " .. name);
							end
							MBB_Debug("Button added: " .. name);
							MBB_AddButton(name);
						else
							MBB_Debug("Button excluded: " .. name);
						end
					else
						MBB_Debug("Frame is no button: " .. child:GetName());
					end
				else
					MBB_Debug("Frame ignored: " .. child:GetName());
				end
			end	
		end
		
		MBB_SetPositions();
	end
end

function MBB_PrepareButton(name)
	local buttonframe = dwGetglobal(name);
	local hasHeader;
	if( buttonframe.GetAttribute ) then
		hasHeader = buttonframe:GetAttribute("anchorchild");
		if( hasHeader and hasHeader == "$parent" and not buttonframe.hasParentFrame ) then
			MBB_Debug("buttonframe has header parent");
			buttonframe.hasParentFrame = true;
		end
	else
		if( buttonframe:GetName() ) then
			if( not MBB_DebugInfo[buttonframe:GetName()] ) then
				MBB_DebugInfo[buttonframe:GetName()] = {};
			end
			if( not MBB_IsInArray(MBB_DebugInfo[buttonframe:GetName()], "No GetAttribute") ) then
				table.insert(MBB_DebugInfo[buttonframe:GetName()], "No GetAttribute");
			end
		end
	end
	
	if( buttonframe ) then
		if( buttonframe.RegisterForClicks ) then
			buttonframe:RegisterForClicks("LeftButtonDown","RightButtonDown");
		end
		
		buttonframe.isvisible = buttonframe:IsVisible();
		
		if( buttonframe.hasParentFrame ) then
			local parent = buttonframe:GetParent();
			parent.MBBChild = buttonframe:GetName();
			buttonframe.parentisvisible = parent:IsVisible();
			parent.oshow = parent.Show;
			parent.Show = function(...)
				local parent = select(1, ...);
				MBB_Debug("Parent Frame: " .. parent:GetName());
				local child = dwGetglobal(parent.MBBChild);
				MBB_Debug("Child Frame: " .. child:GetName());
				child.parentisvisible = true;
				MBB_Debug("Showing frame: " .. parent:GetName());
				if( not MBB_IsInArray(DuowanAddon_MBB_Exclude, child:GetName()) ) then
					MBB_SetPositions();
				end
				if( MBB_IsInArray(DuowanAddon_MBB_Exclude, child:GetName()) or MBB_IsShown == 1 ) then
					parent.oshow(select(1, ...));
					--child.oshow(child);
				end
			end
			parent.ohide = parent.Hide;
			parent.Hide = function(...)
				local parent = select(1, ...);
				MBB_Debug("Parent Frame: " .. parent:GetName());
				local child = dwGetglobal(parent.MBBChild);
				MBB_Debug("Child Frame: " .. child:GetName());
				child.parentisvisible = false;
				MBB_Debug("Hiding frame: " .. parent:GetName());
				parent.ohide(select(1, ...));
				if( not MBB_IsInArray(DuowanAddon_MBB_Exclude, child:GetName()) ) then
					MBB_SetPositions();
				end
			end
		end
		
		buttonframe.oshow = buttonframe.Show;
		buttonframe.Show = function(...)
			local innerframe = select(1, ...);
			innerframe.isvisible = true;
			MBB_Debug("Showing innerframe: " .. innerframe:GetName());
			if( not MBB_IsInArray(DuowanAddon_MBB_Exclude, innerframe:GetName()) ) then
				MBB_SetPositions();
			end
			if( MBB_IsInArray(DuowanAddon_MBB_Exclude, innerframe:GetName()) or MBB_IsShown == 1 ) then
				--[[if( innerframe.hasParentFrame ) then
					local parent = innerframe:GetParent();
					parent.oshow(parent);
				else]]
					innerframe.oshow(select(1, ...));
				--end
			end
		end
		buttonframe.ohide = buttonframe.Hide;
		buttonframe.Hide = function(...)
			local innerframe = select(1, ...);
			MBB_Debug("Hiding innerframe: " .. innerframe:GetName());
			if( innerframe ~= buttonframe ) then
				innerframe.isvisible = false;
				innerframe.ohide(innerframe);
			end
			if( not MBB_IsInArray(DuowanAddon_MBB_Exclude, innerframe:GetName()) ) then
				MBB_SetPositions();
			end
		end
		
		if( buttonframe:HasScript("OnClick") and not hasHeader ) then
			buttonframe.oclick = buttonframe:GetScript("OnClick");
			buttonframe:SetScript("OnClick", function(...)
				if( arg1 and arg1 == "RightButton" and IsControlKeyDown() ) then
					local name = this:GetName();
					if( MBB_IsInArray(DuowanAddon_MBB_Exclude, name) ) then
						MBB_AddButton(name);
					else
						MBB_RestoreButton(name);
					end
					MBB_SetPositions();
				elseif( this.oclick ) then
					this.oclick(select(1, ...));
				end
			end);
		elseif( buttonframe:HasScript("OnMouseUp") and not hasHeader ) then
			buttonframe.omouseup = buttonframe:GetScript("OnMouseUp");
			buttonframe:SetScript("OnMouseUp", function(...)
				if( arg1 and arg1 == "RightButton" and IsControlKeyDown() ) then
					local name = this:GetName();
					if( MBB_IsInArray(DuowanAddon_MBB_Exclude, name) ) then
						MBB_AddButton(name);
					else
						MBB_RestoreButton(name);
					end
					MBB_SetPositions();
				elseif( this.omouseup ) then
					this.omouseup(select(1, ...));
				end
			end);
		elseif( buttonframe:HasScript("OnMouseDown") and not hasHeader ) then
			buttonframe.omousedown = buttonframe:GetScript("OnMouseDown");
			buttonframe:SetScript("OnMouseDown", function(...)
				if( arg1 and arg1 == "RightButton" and IsControlKeyDown() ) then
					local name = this:GetName();
					if( MBB_IsInArray(DuowanAddon_MBB_Exclude, name) ) then
						MBB_AddButton(name);
					else
						MBB_RestoreButton(name);
					end
					MBB_SetPositions();
				elseif( this.omousedown ) then
					this.omousedown(select(1, ...));
				end
			end);
		end
		if( buttonframe:HasScript("OnEnter") and not hasHeader ) then
			buttonframe.oenter = buttonframe:GetScript("OnEnter");
			buttonframe:SetScript("OnEnter", function(...)
				if( IsControlKeyDown() ) then
					local button;
					if( MBB_IsInArray(DuowanAddon_MBB_Exclude, this:GetName()) ) then
						button = dwGetglobal("MBB_ButtonAdd");
					else
						button = dwGetglobal("MBB_ButtonRemove");
					end
					button.MBBButtonName = this:GetName();
					button:ClearAllPoints();
					button:SetPoint("BOTTOM", this, "TOP", 0, 0);
					button:Show();
				end
				if( not MBB_IsInArray(DuowanAddon_MBB_Exclude, this:GetName()) ) then
					MBB_ShowTimeout = -1;
				end
				if( this.oenter ) then
					this.oenter(select(1, ...));
				end
			end);
		end
		if( buttonframe:HasScript("OnLeave") and not hasHeader ) then
			buttonframe.oleave = buttonframe:GetScript("OnLeave");
			buttonframe:SetScript("OnLeave", function(...)
				if( not MBB_IsInArray(DuowanAddon_MBB_Exclude, this:GetName()) ) then
					MBB_ShowTimeout = 0;
				end
				if( this.oleave ) then
					this.oleave(select(1, ...));
				end
			end);
		end
	end
end

function MBB_AddButton(name)
	local child = dwGetglobal(name);
	
	child.opoint = {child:GetPoint()};
	if( not child.opoint[1] ) then
		child.opoint = {"TOP", Minimap, "BOTTOM", 0, 0};
	end
	child.osize = {child:GetHeight(),child:GetWidth()};
	child.oclearallpoints = child.ClearAllPoints;
	child.ClearAllPoints = function() end;
	child.osetpoint = child.SetPoint;
	child.SetPoint = function() end;
	if( MBB_IsShown == 0 ) then
		if( child.hasParentFrame ) then
			local parent = child:GetParent();
			child.oshow(child);
			parent.ohide(parent);
		else
			child.ohide(child);
		end
	end
	table.insert(MBB_Buttons, name);
	local i = MBB_IsInArray(DuowanAddon_MBB_Exclude, name);
	if( i ) then
		table.remove(DuowanAddon_MBB_Exclude, i);
	end
end

function MBB_RestoreButton(name)
	local button = dwGetglobal(name);
	
	button.oclearallpoints(button);
	button.osetpoint(button, button.opoint[1], button.opoint[2], button.opoint[3], button.opoint[4], button.opoint[5]);
	button:SetHeight(button.osize[1]);
	button:SetWidth(button.osize[1]);
	button.ClearAllPoints = button.oclearallpoints;
	button.SetPoint = button.osetpoint;
	MBB_Debug("EVENT Restoring Button");
	if( button.hasParentFrame ) then
		local parent = button:GetParent();
		parent.oshow(parent);
	else
		button.oshow(button);
	end
	
	table.insert(DuowanAddon_MBB_Exclude, name);
	local i = MBB_IsInArray(MBB_Buttons, button:GetName());
	if( i ) then
		table.remove(MBB_Buttons, i);
	end
end

function MBB_SetPositions()
	local directions = {
		[1] = {"RIGHT", "LEFT"},
		[2] = {"BOTTOM", "TOP"},
		[3] = {"LEFT", "RIGHT"},
		[4] = {"TOP", "BOTTOM"}
	};
	local offsets = {
		[1] = {-5, 0},
		[2] = {0, 5},
		[3] = {5, 0},
		[4] = {0, -5}
	};
	
	local pos = {0, 0};
	local parentid = 0;
	local firstid = 1;
	local count = 1;
	for i,name in ipairs(MBB_Buttons) do		
			local positionframe = dwGetglobal(name);
			if( not positionframe.hasParentFrame ) then
				positionframe.parentisvisible = true;
			end
			if( positionframe.isvisible and positionframe.parentisvisible ) then
				local parent;
				if( parentid==0 ) then
					parent = DuowanMinimapButton;
				else
					parent = dwGetglobal(MBB_Buttons[parentid]);
				end
				
				if( not MBB_IsInArray(MBB_IgnoreSize, name) ) then
					if( MBB_ExtraSize[name] ) then
						local func = MBB_ExtraSize[name];
						func();
					else
						positionframe:SetHeight(31); -- 33
						positionframe:SetWidth(31);
					end
				end
				
				local direction;
				
				if( DuowanAddon_MBB_Options.MaxButtonsPerLine > 0 and count > DuowanAddon_MBB_Options.MaxButtonsPerLine ) then
					parent = dwGetglobal(MBB_Buttons[firstid]);
					direction = {directions[DuowanAddon_MBB_Options.AltExpandDirection][1], directions[DuowanAddon_MBB_Options.AltExpandDirection][2]};
					if( MBB_ExtraSize[name] or MBB_IsInArray(MBB_IgnoreSize, name) or MBB_ExtraSize[parent:GetName()] or MBB_IsInArray(MBB_IgnoreSize, parent:GetName()) ) then
						pos = offsets[DuowanAddon_MBB_Options.AltExpandDirection];
					else
						pos = {0, 0};
					end
					count = 2;
					firstid = i;
				else
					direction = {directions[DuowanAddon_MBB_Options.ExpandDirection][1], directions[DuowanAddon_MBB_Options.ExpandDirection][2]};
					if( MBB_ExtraSize[name] or MBB_IsInArray(MBB_IgnoreSize, name) or MBB_ExtraSize[parent:GetName()] or MBB_IsInArray(MBB_IgnoreSize, parent:GetName()) ) then
						pos = offsets[DuowanAddon_MBB_Options.ExpandDirection];
					else
						pos = {0, 0};
					end
					count = count + 1;
				end
				
				positionframe.oclearallpoints(positionframe);
				positionframe.osetpoint(positionframe, direction[1], parent, direction[2], pos[1], pos[2]);
				
				parentid = i;
			end		
	end
end

function MBB_OnClick(arg1)
	if( arg1 and arg1 == "RightButton" and IsControlKeyDown() ) then
		if( DuowanAddon_MBB_Options.AttachToMinimap == 1 ) then
			--[[local xpos,ypos = GetCursorPosition();
			local scale = GetCVar("uiScale");]]
			DuowanAddon_MBB_Options.AttachToMinimap = 0;
			DuowanAddon_MBB_Options.ButtonPos = {0, 0};	--{(xpos/scale)-10, (ypos/scale)-10};
			MBB_SetButtonPosition();
		else
			DuowanAddon_MBB_Options.AttachToMinimap = 1;
			DuowanAddon_MBB_Options.ButtonPos = MBB_DefaultOptions.ButtonPos;
			MBB_SetButtonPosition();
		end
	elseif( arg1 and arg1 == "RightButton" ) then
		MBB_OptionsFrame:Show();
	else
		if( MBB_IsShown == 1 ) then
			MBB_HideButtons();
		else
			MBB_Debug("EVENT OnClick");
			for i,name in ipairs(MBB_Buttons) do			
				local clickframe = dwGetglobal(name);
				if( not clickframe.hasParentFrame ) then
					clickframe.parentisvisible = true;
				end
				if( clickframe.isvisible and clickframe.parentisvisible ) then
					if( clickframe.hasParentFrame and clickframe.hasParentFrame ) then
						local parent = clickframe:GetParent();
						if( parent.oshow ) then
							parent.oshow(parent);
						else
							if( parent:GetName() ) then
								if( not MBB_DebugInfo[parent:GetName()] ) then
									MBB_DebugInfo[parent:GetName()] = {};
								end
								if( not MBB_IsInArray(MBB_DebugInfo[parent:GetName()], "No oshow") ) then
									table.insert(MBB_DebugInfo[parent:GetName()], "No oshow");
								end
							end
						end
					else
						clickframe.oshow(clickframe);
					end
				end			
			end
			MBB_IsShown = 1;
			MBB_ShowTimeout = 0;
		end
	end
end

function MBB_HideButtons()
	MBB_ShowTimeout = -1;
	for i,name in ipairs(MBB_Buttons) do		
			local buttonhideframe = dwGetglobal(name);
			if( buttonhideframe.hasParentFrame ) then
				local parent = buttonhideframe:GetParent();
				if( parent.ohide ) then
					parent.ohide(parent);
				else
					if( parent:GetName() ) then
						if( not MBB_DebugInfo[parent:GetName()] ) then
							MBB_DebugInfo[parent:GetName()] = {};
						end
						if( not MBB_IsInArray(MBB_DebugInfo[parent:GetName()], "No ohide") ) then
							table.insert(MBB_DebugInfo[parent:GetName()], "No ohide");
						end
					end
					buttonhideframe.ohide(buttonhideframe);
				end
			else
				buttonhideframe.ohide(buttonhideframe);
			end		
	end
	MBB_IsShown = 0;
end

function MBB_IsKnownButton(name, opt)
	if( not opt ) then
		opt = 1;
	end
	
	if( opt <= 1 ) then
		for _, button in ipairs(MBB_Buttons) do
			if( button == name ) then
				return true;
			end
		end
	end
	if( opt <= 2 ) then
		for _, button in ipairs(DuowanAddon_MBB_Exclude) do
			if( button == name ) then
				return true;
			end
		end
	end
	if( opt <= 3 ) then
		for _, button in ipairs(MBB_Ignore) do
			if( string.find(name, button) ) then
				return true;
			end
		end
	end
	
	return false;
end

local frame = CreateFrame("Frame");
frame:SetScript("OnUpdate", function(self, elapsed)
	MBB_OnUpdate(elapsed);
end)

function MBB_OnUpdate(elapsed)
	if( MBB_CheckTime >= 3 ) then
		MBB_CheckTime = 0;
		local children = {Minimap:GetChildren()};
		for _, child in ipairs(children) do		
				if( child:HasScript("OnClick") and not child.oshow and child:GetName() and not MBB_IsKnownButton(child:GetName(), 3) ) then
					MBB_PrepareButton(child:GetName());
					if( not MBB_IsInArray(DuowanAddon_MBB_Exclude, child:GetName()) ) then
						MBB_AddButton(child:GetName());
						MBB_SetPositions();
					end
				end		
		end
	else
		MBB_CheckTime = MBB_CheckTime + elapsed;
	end

	if( DuowanAddon_MBB_Options.CollapseTimeout and DuowanAddon_MBB_Options.CollapseTimeout ~= 0 ) then
		if( MBB_ShowTimeout >= DuowanAddon_MBB_Options.CollapseTimeout and MBB_IsShown == 1 ) then
			MBB_HideButtons();
		end
		if( MBB_ShowTimeout ~= -1 ) then
			MBB_ShowTimeout = MBB_ShowTimeout + elapsed;
		end
	end
end

function MBB_ResetPosition()
	DuowanAddon_MBB_Options.ButtonPos = MBB_DefaultOptions.ButtonPos;
	DuowanAddon_MBB_Options.AttachToMinimap = MBB_DefaultOptions.AttachToMinimap;
	
	MBB_SetButtonPosition();
end

function MBB_SetButtonPosition()
	if( DuowanAddon_MBB_Options.AttachToMinimap == 1 ) then
		--DuowanMinimapButton:ClearAllPoints();
		--DuowanMinimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", DuowanAddon_MBB_Options.ButtonPos[1], DuowanAddon_MBB_Options.ButtonPos[2]);
	else
		--DuowanMinimapButton:ClearAllPoints();
		--DuowanMinimapButton:SetPoint("CENTER", UIParent, "CENTER", DuowanAddon_MBB_Options.ButtonPos[1], DuowanAddon_MBB_Options.ButtonPos[2]);
	end
end

function MBB_RadioButton_OnClick(id, alt)
	local substring;
	if( alt ) then
		substring = "Alt";
	else
		substring = "";
	end
	local buttons = {
		[1] = "Left",
		[2] = "Top",
		[3] = "Right",
		[4] = "Bottom"
	};
	
	for i,name in ipairs(buttons) do	
		if( i == id ) then
			dwGetglobal("MBB_OptionsFrame_" .. name .. substring .. "Radio"):SetChecked(true);
		else
			dwGetglobal("MBB_OptionsFrame_" .. name .. substring .. "Radio"):SetChecked(nil);
		end	
	end
end

function MBB_UpdateAltRadioButtons()
	local buttons = {
		[1] = "Left",
		[2] = "Top",
		[3] = "Right",
		[4] = "Bottom"
	};
	
	local exchecked = 1;
	
	for i,name in pairs(buttons) do	
		if( dwGetglobal("MBB_OptionsFrame_" .. name .. "Radio"):GetChecked() ) then
			exchecked = i;
			break;
		end	
	end
	
	local checked = false;
	local textbox = dwGetglobal("MBB_OptionsFrame_MaxButtonsTextBox");
	
	for i,name in pairs(buttons) do
	
		local radio = dwGetglobal("MBB_OptionsFrame_" .. name .. "AltRadio");
		local label = dwGetglobal("MBB_OptionsFrame_" .. name .. "AltRadioLabel");
		if( textbox:GetText() == "" or tonumber(textbox:GetText()) == 0 ) then
			radio:Disable();
			radio:SetChecked(nil);
			label:SetTextColor(0.5, 0.5, 0.5);
		else
			if( exchecked % 2 == i % 2 ) then
				if( radio:GetChecked() ) then
					checked = true;
					if( i == 4 ) then
						dwGetglobal("MBB_OptionsFrame_LeftAltRadio"):SetChecked(true);
					else
						dwGetglobal("MBB_OptionsFrame_" .. buttons[i+1] .. "AltRadio"):SetChecked(true);
					end
				end
				radio:Disable();
				radio:SetChecked(nil);
				label:SetTextColor(0.5, 0.5, 0.5);
			else
				if( radio:GetChecked() ) then
					checked = true;
				end
				radio:Enable();
				label:SetTextColor(1, 1, 1);
			end
		end
	end
	
	if( not checked and tonumber(textbox:GetText()) ~= 0 and textbox:GetText() ~= "" ) then
		if( exchecked % 2 == 1 ) then
			dwGetglobal("MBB_OptionsFrame_TopAltRadio"):SetChecked(true);
		else
			dwGetglobal("MBB_OptionsFrame_LeftAltRadio"):SetChecked(true);
		end
	end
end

function MBB_Debug(msg)
	if (MBB_DebugFlag == 1) then
		MBB_Print("MBB Debug : " .. tostring(msg));
	end
end

function MBB_Test()
	local children = {Minimap:GetChildren()};
	for _, child in ipairs(children) do	
		if( child:GetName() and not MBB_IsKnownButton(child:GetName()) ) then
			ChatFrame1:AddMessage(child:GetName());
		end	
	end
end

function MBB_IsInArray(array, needle)
	if(type(array) == "table") then
		--MBB_Debug("Looking for " .. tostring(needle) .. " in " .. tostring(array));
		for i, element in pairs(array) do
			if(type(element) ==  type(needle) and element == needle) then
				return i;
			end
		end
	end
	return nil;
end

function MBB_SecureOnClick(self, button, down)
	local name = self:GetName();
	if(name) then -- trap to check for nils
		MBB_Debug("Name: " .. name);
		MBB_Debug("Button: " .. button);
		if( MBB_IsInArray(MBB_Buttons, name) ) then
			if( button == "RightButton" and IsControlKeyDown() ) then
				MBB_Debug("Restoring button: " .. name);
				MBB_RestoreButton(name);
				MBB_SetPositions();
			end
		elseif( MBB_IsInArray(DuowanAddon_MBB_Exclude, name) ) then
			if( button == "RightButton" and IsControlKeyDown() ) then
				MBB_Debug("Adding button: " .. name);
				MBB_AddButton(name);
				MBB_SetPositions();
			end
		end
	end
end

function MBB_SecureOnEnter(self)
	local name = self:GetName();
	if(name) then -- trap to check for nils
		MBB_Debug("Name: " .. name);
		if( MBB_IsInArray(MBB_Buttons, name) ) then
			if( IsControlKeyDown() ) then
				local button = dwGetglobal("MBB_ButtonRemove");
				button.MBBButtonName = name;
				button:ClearAllPoints();
				button:SetPoint("BOTTOM", this, "TOP", 0, 0);
				button:Show();
			end
			MBB_ShowTimeout = -1;
		elseif( MBB_IsInArray(DuowanAddon_MBB_Exclude, name) ) then
			if( IsControlKeyDown() ) then
				local button = dwGetglobal("MBB_ButtonAdd");
				button.MBBButtonName = name;
				button:ClearAllPoints();
				button:SetPoint("BOTTOM", this, "TOP", 0, 0);
				button:Show();
			end
		end
	end
end

function MBB_SecureOnLeave(self)
	local name = self:GetName();
	if(name) then -- trap to check for nils
		MBB_Debug("Name: " .. name);
		if( MBB_IsInArray(MBB_Buttons, name) ) then
			MBB_ShowTimeout = 0;
		elseif( MBB_IsInArray(DuowanAddon_MBB_Exclude, name) ) then
		
		end
	end
end

function MBB_Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg, 0.2, 0.8, 0.8);
end