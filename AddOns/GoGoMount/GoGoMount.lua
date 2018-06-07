---------
function GoGo_OnLoad()
---------
	SLASH_GOGOMOUNT1 = "/gogo"
	SlashCmdList["GOGOMOUNT"] = function(msg) GoGo_OnSlash(msg) end
	SLASH_GOGOID1 = "/id"
	SlashCmdList["GOGOID"] = function(msg) GoGo_Msg(GoGo_Id(msg)) end


	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("UPDATE_BINDINGS")
	this:RegisterEvent("TAXIMAP_OPENED")
	this:RegisterEvent("CHAT_MSG_ADDON")
	this:RegisterEvent("COMPANION_LEARNED")
	this:RegisterEvent("PLAYER_ENTERING_WORLD")
--	this:RegisterEvent("BAG_UPDATE")
end --function

---------
function GoGo_OnEvent(event)
---------
	if event == "VARIABLES_LOADED" then
		GoGo_DebugLog = {}
		if not GoGo_Prefs then
			GoGo_Prefs = {}
			GoGo_Settings_Default()
		end --if

--		GoGo_Localize()

--		GoGo_LoadMountDB()
		GoGo_Variables.TestVersion = false
		GoGo_Variables.Debug = false
		_, GoGo_Variables.Player.Class = UnitClass("player")
		if (GoGo_Variables.Player.Class == "DRUID") then
			GoGo_Variables.Druid = {}
			this:RegisterEvent("PLAYER_REGEN_DISABLED")
		elseif (GoGo_Variables.Player.Class == "SHAMAN") then
			GoGo_Variables.Shaman = {}
			this:RegisterEvent("PLAYER_REGEN_DISABLED")
		end --if
		GOGO_OUTLANDS = table.concat({GetMapZones(3)}, ":")..":"..GoGo_Variables.Localize.Zone.TwistingNether
		GOGO_NORTHREND = table.concat({GetMapZones(4)}, ":")..":"..GoGo_Variables.Localize.Zone.TheFrozenSea
		GoGoFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		if not GoGo_Prefs.version then
			GoGo_Settings_Default()
		elseif GoGo_Prefs.version ~= GetAddOnMetadata("GoGoMount", "Version") then
			GoGo_Settings_SetUpdates()
		end --if
		GoGo_Panel_Options()
		GoGo_Panel_UpdateViews()
--		GoGo_Panel_GlobalFavorites_Populate()
		
	elseif event == "PLAYER_REGEN_DISABLED" then
		for i, button in ipairs({GoGoButton, GoGoButton2, GoGoButton3}) do
			if GoGo_Variables.Player.Class == "SHAMAN" then
				GoGo_FillButton(button, GoGo_InBook(GOGO_SPELLS["SHAMAN"]))
			elseif GoGo_Variables.Player.Class == "DRUID" then
				GoGo_FillButton(button, GoGo_InBook(GOGO_SPELLS["DRUID"]))
			end --if
		end --for
	elseif event == "ZONE_CHANGED_NEW_AREA" then
		SetMapToCurrentZone()
		GoGo_Variables.Player.Zone = GetRealZoneText()
	elseif event == "TAXIMAP_OPENED" then
		GoGo_Dismount()
	elseif event == "UPDATE_BINDINGS" then
		if not InCombatLockdown() then  -- ticket 213
			GoGo_CheckBindings()
		end --if
	elseif event == "UI_ERROR_MESSAGE" then
		if GOGO_ERRORS[arg1] and not IsFlying() then
			GoGo_Dismount()
		end --if
	elseif (event == "PLAYER_ENTERING_WORLD") then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("EVENT: Player Entering World")
		end --if
		GoGo_BuildMountSpellList()
		GoGo_BuildMountItemList()
		GoGo_BuildMountList()
		GoGo_CheckFor310()
	elseif (event == "COMPANION_LEARNED") then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("EVENT: Companion Learned")
		end --if
		GoGo_BuildMountSpellList()
		GoGo_BuildMountList()
		GoGo_CheckFor310()
--	elseif (event == "BAG_UPDATE") then   -- currently causing a noticable lag when moving bag items around
--		if GoGo_Variables.Debug then
--			GoGo_DebugAddLine("EVENT: Bag Update")
--		end --if
--		GoGo_BuildMountItemList()
--		GoGo_BuildMountList()
	elseif (event == "CHAT_MSG_ADDON") and (arg1 == "GoGoMountVER") and not GoGo_Prefs.DisableUpdateNotice then
		if (arg2 > GetAddOnMetadata("GoGoMount", "Version")) and not GoGo_Variables.UpdateShown then
			GoGo_Variables.UpdateShown = true
			GoGo_Msg(GOGO_STRING_NEWVERSIONFOUND .. arg4)
		end --if
	end --if
end --function

---------
function GoGo_OnSlash(msg)
---------
	if GOGO_COMMANDS[string.lower(msg)] then
		GOGO_COMMANDS[string.lower(msg)]()
	elseif string.find(msg, "spell:%d+") or string.find(msg, "item:%d+") then
		local FItemID = string.gsub(msg,".-\124H([^\124]*)\124h.*", "%1");
		local idtype, itemid = strsplit(":",FItemID);
		GoGo_AddPrefMount(tonumber(itemid))
		GoGo_Msg("pref")
	else
		GoGo_Msg("optiongui")
		GoGo_Msg("auto")
		GoGo_Msg("genericfastflyer")
		GoGo_Msg("updatenotice")
		GoGo_Msg("mountnotice")
		if GoGo_Variables.Player.Class == "DRUID" then GoGo_Msg("druidclickform") end --if
		if GoGo_Variables.Player.Class == "DRUID" then GoGo_Msg("druidflightform") end --if
		GoGo_Msg("pref")
	end --if
end --function

---------
function GoGo_PreClick(button)
---------
	if GoGo_Variables.Debug then
		GoGo_DebugAddLine("GoGo_PreClick: Starts")
		GoGo_DebugAddLine("GoGo_PreClick: Location = " .. GetRealZoneText() .. " - " .. GetZoneText() .. " - " ..GetSubZoneText() .. " - " .. GetMinimapZoneText())
		GoGo_DebugAddLine("GoGo_PreClick: Current unit speed is " .. GetUnitSpeed("player"))
		local level = UnitLevel("player")
		GoGo_DebugAddLine("GoGo_PreClick: We are level " .. level)
		GoGo_DebugAddLine("GoGo_PreClick: We are a " .. GoGo_Variables.Player.Class)
		if GoGo_CanFly() then
			GoGo_DebugAddLine("GoGo_PreClick: We can fly here as per GoGo_CanFly()")
		else
			GoGo_DebugAddLine("GoGo_PreClick: We can not fly here as per GoGo_CanFly()")
		end --if
		if IsOutdoors() then
			GoGo_DebugAddLine("GoGo_PreClick: We are outdoors as per IsOutdoors()")
		else
			GoGo_DebugAddLine("GoGo_PreClick: We are not outdoors as per IsOutdoors()")
		end --if
		if IsIndoors() then
			GoGo_DebugAddLine("GoGo_PreClick: We are indoors as per IsIndoors()")
		else
			GoGo_DebugAddLine("GoGo_PreClick: We are not indoors as per IsIndoors()")
		end --if
		if IsFlyableArea() then
			GoGo_DebugAddLine("GoGo_PreClick: We can fly here as per IsFlyableArea()")
		else
			GoGo_DebugAddLine("GoGo_PreClick: We can not fly here as per IsFlyableArea()")
		end --if
		if IsFlying() then
			GoGo_DebugAddLine("GoGo_PreClick: We are flying as per IsFlying()")
		else
			GoGo_DebugAddLine("GoGo_PreClick: We are not flying as per IsFlying()")
		end --if
		if IsSwimming() then
			GoGo_DebugAddLine("GoGo_PreClick: We are swimming as per IsSwimming()")
		else
			GoGo_DebugAddLine("GoGo_PreClick: We are not swimming as per IsSwimming()")
		end --if
		if IsFalling() then
			GoGo_DebugAddLine("GoGo_PreClick: We are falling as per IsFalling()")
		else
			GoGo_DebugAddLine("GoGo_PreClick: We are not falling as per IsFalling()")
		end --if
		if GoGo_IsMoving() then
			GoGo_DebugAddLine("GoGo_PreClick: We are moving as per GoGo_IsMoving()")
		else
			GoGo_DebugAddLine("GoGo_PreClick: We are not moving as per GoGo_IsMoving()")
		end --if
		local posX, posY = GetPlayerMapPosition("Player")
		GoGo_DebugAddLine("GoGo_PreClick: Player location: X = ".. posX .. ", Y = " .. posY)
	end --if

	if not InCombatLockdown() then
		GoGo_FillButton(button)
	end --if

	if IsMounted() or CanExitVehicle() then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_PreClick: Player is mounted and is being dismounted.")
		end --if
		GoGo_Dismount()
	elseif GoGo_Variables.Player.Class == "DRUID" and GoGo_IsShifted() and not InCombatLockdown() then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_PreClick: Player is a druid, is shifted and not in combat.")
		end --if
		GoGo_Dismount(button)
	elseif GoGo_Variables.Player.Class == "SHAMAN" and UnitBuff("player", GoGo_Variables.Localize.GhostWolf) then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_PreClick: Player is a shaman and is in wolf form.")
		end --if
		GoGo_Dismount()
	elseif not InCombatLockdown() then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_PreClick: Player not in combat, button pressed, looking for a mount.")
		end --if
		GoGo_FillButton(button, GoGo_GetMount())
	end --if
	
	if not GoGo_Variables.TestVersion then
		if ( IsInGuild() ) then
			SendAddonMessage("GoGoMountVER", GetAddOnMetadata("GoGoMount", "Version"), "GUILD")
		end --if
--			SendAddonMessage("GoGoMountVER", GetAddOnMetadata("GoGoMount", "Version"), "BATTLEGROUND")
--			SendAddonMessage("GoGoMountVER", GetAddOnMetadata("GoGoMount", "Version"), "RAID")
	end --if
	GoGo_Variables.Debug = false
end --function

---------
function GoGo_GetMount()
---------

	local selectedmount = GoGo_ChooseMount()

--	if (GoGo_Variables.Player.Class == "PALADIN") and GoGo_Prefs.PaliUseCrusader and GoGo_InBook(GoGo_Variables.Localize.CrusaderAura) then
--		local modifier = GetSpellInfo(GoGo_Variables.Localize.CrusaderAura)
--		selectedmount = selectedmount .. "\n /stopcasting;\n /cast " .. modifier
--	end --if
	
	return selectedmount
	
end --function

---------
function GoGo_ChooseMount()
---------
	if (GoGo_Variables.Player.Class == "DRUID") then
		GoGo_Variables.Druid.FeralSwiftness, _ = GoGo_GetTalentInfo(GOGO_TALENT_FERALSWIFTNESS)
		if IsIndoors() then
			if IsSwimming() then
				return GoGo_InBook(GoGo_Variables.Localize.AquaForm)
			elseif GoGo_Variables.Druid.FeralSwiftness > 0 then
				return GoGo_InBook(GoGo_Variables.Localize.CatForm)
			end --if
			return
		end --if
		if (IsSwimming() or IsFalling() or GoGo_IsMoving()) then
			if GoGo_Variables.Debug then
				GoGo_DebugAddLine("GoGo_ChooseMount: We are a druid and we're falling, swimming or moving.  Changing shape form.")
			end --if
			return GoGo_InBook(GOGO_SPELLS["DRUID"])
		end --if
	elseif (GoGo_Variables.Player.Class == "SHAMAN") and GoGo_IsMoving() then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: We are a shaman and we're moving.  Changing shape form.")
		end --if
		GoGo_Variables.Shaman.ImprovedGhostWolf, _ = GoGo_GetTalentInfo(GOGO_TALENT_IMPROVEDGHOSTWOLF)
		if (GoGo_Variables.Shaman.ImprovedGhostWolf == 2) then return GoGo_InBook(GOGO_SPELLS["SHAMAN"]) end --if
	elseif (GoGo_Variables.Player.Class == "HUNTER") and GoGo_IsMoving() then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: We are a hunter and we're moving.  Checking for aspects.")
		end --if
--		if GoGo_InBook(GoGo_Variables.Localize.AspectPack) then
--			return GoGo_InBook(GoGo_Variables.Localize.AspectPack)
		if GoGo_InBook(GoGo_Variables.Localize.AspectCheetah) then
			return GoGo_InBook(GoGo_Variables.Localize.AspectCheetah)
		end --if
	end --if

	if GoGo_Variables.Debug then
		GoGo_DebugAddLine("GoGo_ChooseMount: Passed Druid / Shaman forms - nothing selected.")
	end --if

	local mounts = {}
	local GoGo_FilteredMounts = {}
	GoGo_Variables.Player.Zone = GetRealZoneText()
	GoGo_Variables.EngineeringLevel = GoGo_GetSkillLevel(GOGO_SKILL_ENGINEERING) or 0
	GoGo_Variables.TailoringLevel = GoGo_GetSkillLevel(GOGO_SKILL_TAILORING) or 0
	GoGo_Variables.RidingLevel = GoGo_GetSkillLevel(GOGO_SKILL_RIDING) or 0
	
	if GoGo_Variables.Debug then
		GoGo_DebugAddLine("GoGo_ChooseMount: " .. GOGO_SKILL_ENGINEERING .. " = "..GoGo_Variables.EngineeringLevel)
		GoGo_DebugAddLine("GoGo_ChooseMount: " .. GOGO_SKILL_TAILORING .. " = "..GoGo_Variables.TailoringLevel)
		GoGo_DebugAddLine("GoGo_ChooseMount: " .. GOGO_SKILL_RIDING .. " = "..GoGo_Variables.RidingLevel)
	end --if

	if (table.getn(mounts) == 0) then
		if GoGo_Prefs[GoGo_Variables.Player.Zone] then
			GoGo_FilteredMounts = GoGo_Prefs[GoGo_Variables.Player.Zone]
			GoGo_DisableUnknownMountNotice = true
		end --if
	end --if
	if GoGo_Variables.Debug then
		GoGo_DebugAddLine("GoGo_ChooseMount: Checked for zone favorites.")
	end --if

	if (table.getn(mounts) == 0) and not GoGo_FilteredMounts or (table.getn(GoGo_FilteredMounts) == 0) then
		if GoGo_Prefs.GlobalPrefMounts then
			GoGo_FilteredMounts = GoGo_Prefs.GlobalPrefMounts
			GoGo_DisableUnknownMountNotice = true
		end --if
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: Checked for global favorites.")
		end --if
	end --if

	if (table.getn(mounts) == 0) and not GoGo_FilteredMounts or (table.getn(GoGo_FilteredMounts) == 0) then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: Checking for spell and item mounts.")
		end --if
		-- Not updating bag items on bag changes right now so scan and update list
		GoGo_BuildMountItemList()
		GoGo_BuildMountList()
		GoGo_FilteredMounts = GoGo_Variables.MountList
		if not GoGo_FilteredMounts or (table.getn(GoGo_FilteredMounts) == 0) then
			if GoGo_Variables.Player.Class == "SHAMAN" then
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_ChooseMount: No mounts found. Forcing shaman shape form.")
				end --if
				return GoGo_InBook(GOGO_SPELLS["SHAMAN"])
			elseif GoGo_Variables.Player.Class == "DRUID" then
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_ChooseMount: No mounts found. Forcing druid shape form.")
				end --if
				return GoGo_InBook(GOGO_SPELLS["DRUID"])
			else
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_ChooseMount: No mounts found.  Giving up the search.")
				end --if
				return nil
			end --if
		end --if
	end --if
	
	local GoGo_TempMounts = {}
	if GoGo_Variables.EngineeringLevel <= 299 then
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 45)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 46)
	elseif GoGo_Variables.EngineeringLevel >= 300 and GoGo_Variables.EngineeringLevel <= 374 then
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 46)
	elseif GoGo_Variables.EngineeringLevel >= 375 then
		-- filter nothing
	else
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 45)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 46)
	end --if
	if GoGo_Variables.TailoringLevel <= 299 then
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 49)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 48)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 47)
	elseif GoGo_Variables.TailoringLevel >= 300 and GoGo_Variables.TailoringLevel <= 424 then
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 49)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 47)
	elseif GoGo_Variables.TailoringLevel >= 425 and GoGo_Variables.TailoringLevel <= 449 then
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 47)
	elseif GoGo_Variables.TailoringLevel >= 450 then
		-- filter nothing
	else
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 49)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 48)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 47)
	end --if

	if IsSwimming() then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: Forcing ground mounts because we're swimming.")
		end --if
		GoGo_Variables.SkipFlyingMount = true
	else
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 53)
	end --if
	
	if GoGo_Variables.Player.Zone ~= GoGo_Variables.Localize.Zone.AQ40 then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: Removing AQ40 mounts since we are not in AQ40.")
		end --if
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 50)
	end --if

	if GoGo_Variables.SelectPassengerMount then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: Filtering out all mounts except passenger mounts since passenger mount only was requested.")
		end --if
		GoGo_FilteredMounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 2) or {}
	end --if

	if (table.getn(mounts) == 0) and IsSwimming() then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: Looking for water speed increase mounts since we're in water.")
		end --if
		mounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 5) or {}
	end --if
	
	if (table.getn(mounts) == 0) and GoGo_CanFly() and not GoGo_Variables.SkipFlyingMount then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: Looking for flying mounts since we past flight checks.")
		end --if
		if GoGo_Variables.RidingLevel <= 224 then
			GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 36)
			GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 35)
		elseif GoGo_Variables.RidingLevel >= 225 and GoGo_Variables.RidingLevel <= 299 then
			GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 35)
		elseif GoGo_Variables.RidingLevel >= 300 then
			-- filter nothing
		else
			GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 36)
			GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 35)
		end --if

		-- Druid stuff... 
		-- Use flight forms if preferred
		if GoGo_Variables.Player.Class == "DRUID" and (GoGo_InBook(GoGo_Variables.Localize.FastFlightForm) or GoGo_InBook(GoGo_Variables.Localize.FlightForm)) and GoGo_Prefs.DruidFlightForm then
			if GoGo_Variables.Debug then
				GoGo_DebugAddLine("GoGo_ChooseMount: Druid with preferred flight forms option enabled.  Using flight form.")
			end --if
			return GoGo_InBook(GOGO_SPELLS["DRUID"])
		end --if
	
		if (table.getn(mounts) == 0) then
			GoGo_TempMounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 9)
			mounts = GoGo_FilterMountsIn(GoGo_TempMounts, 24)
		end --if
		if GoGo_Prefs.genericfastflyer then
			local GoGo_TempMountsA = GoGo_FilterMountsIn(GoGo_TempMounts, 23)
			if GoGo_Variables.RidingLevel <= 299 then
				GoGo_TempMountsA = GoGo_FilterMountsOut(GoGo_TempMountsA, 29)
			end --if
			if GoGo_TempMountsA then
				for counter = 1, table.getn(GoGo_TempMountsA) do
					table.insert(mounts, GoGo_TempMountsA[counter])
				end --for
			end --if
			local GoGo_TempMountsA = GoGo_FilterMountsIn(GoGo_TempMounts, 26)
			if GoGo_TempMountsA then
				for counter = 1, table.getn(GoGo_TempMountsA) do
					table.insert(mounts, GoGo_TempMountsA[counter])
				end --for
			end --if
		end --if
		if (table.getn(mounts) == 0) then
			GoGo_TempMountsA = GoGo_FilterMountsIn(GoGo_TempMounts, 23)
			if GoGo_Variables.RidingLevel <= 299 then
				mounts = GoGo_FilterMountsOut(GoGo_TempMountsA, 29)
			else
				mounts = GoGo_TempMountsA
			end --if
		end --if

		-- no epic flyers found - add druid swift flight if available
		if (table.getn(mounts) == 0 and (GoGo_Variables.Player.Class == "Druid") and (GoGo_InBook(GoGo_Variables.Localize.FastFlightForm))) then
			table.insert(mounts, GoGo_Variables.Localize.FastFlightForm)
		end --if

		if (table.getn(mounts) == 0) then
			GoGo_TempMounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 9)
			mounts = GoGo_FilterMountsIn(GoGo_TempMounts, 22)
		end --if

		-- no slow flying mounts found - add druid flight if available
		if (table.getn(mounts) == 0 and (GoGo_Variables.Player.Class == "Druid") and (GoGo_InBook(GoGo_Variables.Localize.FlightForm))) then
			table.insert(mounts, GoGo_Variables.Localize.FlightForm)
		end --if
	end --if
	
	if (table.getn(GoGo_FilteredMounts) >= 1) then
		--GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 1)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 36)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 35)
	end --if

	if (table.getn(mounts) == 0) and (table.getn(GoGo_FilteredMounts) >= 1) then  -- no flying mounts selected yet - try to use loaned mounts
		GoGo_TempMounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 52) or {}
		if (table.getn(GoGo_TempMounts) >= 1) and (GoGo_Variables.Player.Zone == GoGo_Variables.Localize.Zone.SholazarBasin or GoGo_Variables.Player.Zone == GoGo_Variables.Localize.Zone.TheStormPeaks or GoGo_Variables.Player.Zone == GOGO_ZONE_ICECROWN) then
			mounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 52)
		end --if
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 52)
	end --if
	
	-- Set the oculus mounts as the only mounts available if we're in the oculus, not skiping flying and have them in inventory
	if (table.getn(mounts) == 0) and (table.getn(GoGo_FilteredMounts) >= 1) and (GoGo_Variables.Player.Zone == GOGO_ZONE_THEOCULUS) and not GoGo_Variables.SkipFlyingMount then
		GoGo_TempMounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 54) or {}
		if (table.getn(GoGo_TempMounts) >= 1) then
			mounts = GoGo_TempMounts
			if GoGo_Variables.Debug then
				GoGo_DebugAddLine("GoGo_ChooseMount: In the Oculus, Oculus only mount found, using.")
			end --if
		else
			if GoGo_Variables.Debug then
				GoGo_DebugAddLine("GoGo_ChooseMount: In the Oculus, no oculus mount found in inventory.")
			end --if
		end --if
	else
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 54)
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: Not in Oculus or forced ground mount only.")
		end --if
	end --if
	
	-- Select ground mounts
	if (table.getn(mounts) == 0) and GoGo_CanRide() then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_ChooseMount: Looking for ground mounts since we can't fly.")
		end --if
		if GoGo_Variables.RidingLevel <= 74 then
			GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 37)
			GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 38)
		elseif GoGo_Variables.RidingLevel >= 75 and GoGo_Variables.RidingLevel <= 149 then
			GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 37)
		end --if
		GoGo_TempMounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 21)
		if GoGo_Variables.RidingLevel <= 149 then
			GoGo_TempMounts = GoGo_FilterMountsOut(GoGo_TempMounts, 29)
		end --if
		if GoGo_Variables.RidingLevel <= 225 and GoGo_CanFly() then
			mounts = GoGo_FilterMountsOut(GoGo_TempMounts, 3)
		else
			mounts = GoGo_TempMounts
		end --if
		if (table.getn(mounts) == 0) then
			mounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 20)
		end --if
		if (table.getn(mounts) == 0) then
			mounts = GoGo_FilterMountsIn(GoGo_FilteredMounts, 25)
		end --if
	end --if
	
	if table.getn(GoGo_FilteredMounts) >= 1 then
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 37)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 38)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 21)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 20)
		GoGo_FilteredMounts = GoGo_FilterMountsOut(GoGo_FilteredMounts, 25)
	end --if
	
	if (table.getn(mounts) == 0) then
		if (GoGo_Variables.Player.Class == "SHAMAN") and (GoGo_InBook(GoGo_Variables.Localize.GhostWolf)) then
			table.insert(mounts, GoGo_Variables.Localize.GhostWolf)
		end --if
	end --if

	if (table.getn(mounts) >= 1) then
		if GoGo_Variables.Debug then
			for a = 1, table.getn(mounts) do
				GoGo_DebugAddLine("GoGo_ChooseMount: Found mount " .. mounts[a] .. " - included in random pick.")
			end --for
		end --if
		selected = mounts[math.random(table.getn(mounts))]
		if type(selected) == "string" then
			if GoGo_Variables.Debug then
				GoGo_DebugAddLine("GoGo_ChooseMount: Selected string " .. selected)
			end --if
			return selected
		else
			selected = GoGo_GetIDName(selected)
			return selected
		end --if
	end --if
end --function

---------
function GoGo_FilterMountsOut(PlayerMounts, FilterID)
---------
	local GoGo_FilteringMounts = {}
	if table.getn(PlayerMounts) == 0 then
		return GoGo_FilteringMounts
	end --if
	for a = 1, table.getn(PlayerMounts) do
		local MountID = PlayerMounts[a]
		for DBMountID, DBMountData in pairs(GoGo_Variables.MountDB) do
			if (DBMountID == MountID) and not DBMountData[FilterID] then
				table.insert(GoGo_FilteringMounts, MountID)
			elseif not GoGo_Variables.MountDB[MountID] then
				GoGo_Prefs.UnknownMounts[MountID] = true
				if not GoGo_Prefs.DisableMountNotice and not GoGo_DisableUnknownMountNotice then
					GoGo_DisableUnknownMountNotice = true
					GoGo_Msg("UnknownMount")
				end --if
			end --if
		end --for
	end --for
	return GoGo_FilteringMounts
end --function

---------
function GoGo_FilterMountsIn(PlayerMounts, FilterID)
---------
	local GoGo_FilteringMounts = {}
	if table.getn(PlayerMounts) == 0 then
		return GoGo_FilteringMounts
	end --if
	for a = 1, table.getn(PlayerMounts) do
		local MountID = PlayerMounts[a]
		for DBMountID, DBMountData in pairs(GoGo_Variables.MountDB) do
			if (DBMountID == MountID) and DBMountData[FilterID] then
				table.insert(GoGo_FilteringMounts, MountID)
			elseif not GoGo_Variables.MountDB[MountID] then
				GoGo_Prefs.UnknownMounts[MountID] = true
				if not GoGo_Prefs.DisableMountNotice and not GoGo_DisableUnknownMountNotice then
					GoGo_DisableUnknownMountNotice = true
					GoGo_Msg("UnknownMount")
				end --if
			end --if
		end --for
	end --for
	return GoGo_FilteringMounts
end --function

---------
function GoGo_Dismount(button)
---------
	if IsMounted() then
		Dismount()
	elseif CanExitVehicle() then	
		VehicleExit()
	elseif GoGo_Variables.Player.Class == "DRUID" then
		if GoGo_IsShifted() and button then
			if GoGo_Prefs.DruidClickForm and not IsFlying() then
				GoGo_FillButton(button, GoGo_GetMount())
			else
--				CancelUnitBuff("player", GoGo_IsShifted())  -- protected by blizzard now
				GoGo_FillButton(button, GoGo_IsShifted())
			end --if
		end --if
	elseif GoGo_Variables.Player.Class == "SHAMAN" and UnitBuff("player", GoGo_InBook(GoGo_Variables.Localize.GhostWolf)) then
		CancelUnitBuff("player", GoGo_InBook(GoGo_Variables.Localize.GhostWolf))
	else
		return nil
	end --if
	return true
end --function

---------
function GoGo_InCompanions(item)
---------
	for slot = 1, GetNumCompanions("MOUNT") do
		local _, _, spellID = GetCompanionInfo("MOUNT", slot)
		if spellID and string.find(item, spellID) then
			if GoGo_Variables.Debug then 
				GoGo_DebugAddLine("GoGo_InCompanions: Found mount name  " .. GetSpellInfo(spellID) .. " in mount list.")
			end --if
			return GetSpellInfo(spellID)
		end --if
	end --for
end --function

---------
function GoGo_BuildMountList()
---------
	GoGo_Variables.MountList = {}
	if (table.getn(GoGo_Variables.MountSpellList) > 0) then
		for a=1, table.getn(GoGo_Variables.MountSpellList) do
			table.insert(GoGo_Variables.MountList, GoGo_Variables.MountSpellList[a])
		end --for
	end --if
	
	if (table.getn(GoGo_Variables.MountItemList) > 0) then
		for a=1, table.getn(GoGo_Variables.MountItemList) do
			table.insert(GoGo_Variables.MountList, GoGo_Variables.MountItemList[a])
		end --for
	end --if

	return GoGo_Variables.MountList
end  --function

---------
function GoGo_BuildMountSpellList()
---------
	GoGo_Variables.MountSpellList = {}
	if (GetNumCompanions("MOUNT") >= 1) then
		for slot = 1, GetNumCompanions("MOUNT"),1 do
			local _, _, SpellID = GetCompanionInfo("MOUNT", slot)
			if GoGo_Variables.Debug then 
				GoGo_DebugAddLine("GoGo_BuildMountSpellList: Found mount spell ID " .. SpellID .. " at slot " .. slot .. " and added to known mount list.")
			end --if
			table.insert(GoGo_Variables.MountSpellList, SpellID)
		end --for
	end --if
	return GoGo_Variables.MountSpellList
end  -- function

---------
function GoGo_BuildMountItemList()
---------
	GoGo_Variables.MountItemList = {}
	
	for a = 1, table.getn(GoGo_MountsItems) do
		local MountID = GoGo_MountsItems[a]
		if GoGo_InBags(MountID) then
			if GoGo_Variables.Debug then 
				GoGo_DebugAddLine("GoGo_BuildMountItemList: Found mount item ID " .. MountID .. " in a bag and added to known mount list.")
			end --if
			table.insert(GoGo_Variables.MountItemList, MountID)
		end --if
	end --for
	return GoGo_Variables.MountItemList
end --function

---------
function GoGo_InBags(item)
---------
	if GoGo_Variables.Debug then
		GoGo_DebugAddLine("GoGo_InBags: Searching for " .. item)
	end --if

	for bag = 0, NUM_BAG_FRAMES do
		for slot = 1, GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot)
			if link then
				local _, itemid, _ = strsplit(":",link,3)
				if tonumber(itemid) == item then
					if GoGo_Variables.Debug then 
						GoGo_DebugAddLine("GoGo_InBags: Found item ID " .. item .. " in bag " .. (bag+1) .. ", at slot " .. slot .. " and added to known mount list.")
					end --if
					return GetItemInfo(link)
				end --if
			end --if
		end --for
	end --for
end --function

---------
function GoGo_InBook(spell)
---------
	if GoGo_Variables.Debug then
		GoGo_DebugAddLine("GoGo_InBook: Searching for type " .. type(spell))
	end --if
	if type(spell) == "function" then
		return spell()
	else
		if type(spell) == "string" then
			if GoGo_Variables.Debug then
				GoGo_DebugAddLine("GoGo_InBook: Searching for " .. spell)
			end --if
			local slot = 1
			while GetSpellName(slot, "spell") do
				local name = GetSpellName(slot, "spell")
				if name == spell then
					return spell
				end --if
				slot = slot + 1
			end --while
		elseif type(spell) == "number" then
			local spellname = GetSpellInfo(spell)
			if GoGo_Variables.Debug then
				GoGo_DebugAddLine("GoGo_InBook: Searching for spell ID " .. spell)
			end --if
			local slot = 1
			while GetSpellName(slot, "spell") do
				local name = GetSpellName(slot, "spell")
				if name == spellname then
					return name
				end --if
				slot = slot + 1
			end --while
			-- blah
		end --if
	end --if
end --function

---------
function GoGo_IsShifted()
---------
	if GoGo_Variables.Debug then
		GoGo_DebugAddLine("GoGo_IsShifted:  GoGo_IsShifted starting")
	end --if
	for i = 1, GetNumShapeshiftForms() do
		local _, name, active = GetShapeshiftFormInfo(i)
		if active then
			if GoGo_Variables.Debug then
				GoGo_DebugAddLine("GoGo_IsShifted: Found " .. name)
			end --if
			return name
		end
	end --for
end --function

---------
function GoGo_InOutlands()
---------
	if string.find(GOGO_OUTLANDS, GoGo_Variables.Player.Zone, 1, true) then
		return true
	end --if
end --function

function GoGo_InNorthrend()
---------
	if string.find(GOGO_NORTHREND, GoGo_Variables.Player.Zone, 1, true) then
		return true
	end --if
end --function

---------
function GoGo_AddPrefMount(spell)
---------
	if GoGo_Variables.Debug then 
		GoGo_DebugAddLine("GoGo_AddPrefMount: Preference " .. spell)
	end --if

	if not GoGo_Prefs.GlobalPrefMount then
		GoGo_Variables.Player.Zone = GetRealZoneText()
		if not GoGo_Prefs[GoGo_Variables.Player.Zone] then GoGo_Prefs[GoGo_Variables.Player.Zone] = {} end
		table.insert(GoGo_Prefs[GoGo_Variables.Player.Zone], spell)
		if table.getn(GoGo_Prefs[GoGo_Variables.Player.Zone]) > 1 then
			local i = 2
			repeat
				if GoGo_Prefs[GoGo_Variables.Player.Zone][i] == GoGo_Prefs[GoGo_Variables.Player.Zone][i - 1] then
					table.remove(GoGo_Prefs[GoGo_Variables.Player.Zone], i)
				else
					i = i + 1
				end --if
			until i > table.getn(GoGo_Prefs[GoGo_Variables.Player.Zone])
		end --if
	else
		if not GoGo_Prefs.GlobalPrefMounts then GoGo_Prefs.GlobalPrefMounts = {} end
		table.insert(GoGo_Prefs.GlobalPrefMounts, spell)
		if table.getn(GoGo_Prefs.GlobalPrefMounts) > 1 then
			local i = 2
			repeat
				if GoGo_Prefs.GlobalPrefMounts[i] == GoGo_Prefs.GlobalPrefMounts[i - 1] then
					table.remove(GoGo_Prefs.GlobalPrefMounts, i)
				else
					i = i + 1
				end --if
			until i > table.getn(GoGo_Prefs.GlobalPrefMounts)
		end --if
	end --if
end --function

---------
function GoGo_GetIDName(itemid)
---------
	local tempname = ""
	local ItemName = ""
	if type(itemid) == "number" then
		local GoGo_TempMount = {}
		table.insert(GoGo_TempMount, itemid)
		if (table.getn(GoGo_FilterMountsIn(GoGo_TempMount, 4)) == 1) then
			return GetItemInfo(itemid) or "Unknown Mount"
		else
			return GetSpellInfo(itemid) or "Unknown Mount"
		end --if
	elseif type(itemid) == "table" then
		for a=1, table.getn(itemid) do
			tempname = itemid[a]
			local GoGo_TempTable = {}
			table.insert(GoGo_TempTable, tempname)
			if (table.getn(GoGo_FilterMountsIn(GoGo_TempTable, 4)) == 1) then
--				tempname = GetItemInfo(tempname)
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_GetIDName: GetItemID for " .. tempname .. GetItemInfo(tempname))
				end --if
				ItemName = ItemName .. (GetItemInfo(tempname) or "Unknown Mount") .. ", "
			else
--				tempname = GetSpellInfo(tempname)
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_GetIDName: GetSpellID for " .. tempname .. GetSpellInfo(tempname))
				end --if
				ItemName = ItemName .. (GetSpellInfo(tempname) or "Unknown Mount") .. ", "
			end --if
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_GetIDName: Itemname string is " .. ItemName)
				end --if
		end --for
		return ItemName
	end --if
end --function

---------
function GoGo_GetTalentInfo(talentname)
---------
	if GoGo_Variables.Debug then 
		GoGo_DebugAddLine("GoGo_GetTalentInfo: Searching talent tree for " .. talentname)
	end --if
	local numTabs = GetNumTalentTabs()
	for tab=1, numTabs do
		local numTalents = GetNumTalents(tab)
		for talent=1, numTalents do
			local name, _, _, _, rank, maxrank = GetTalentInfo(tab,talent)
			if (talentname == name) then
				if GoGo_Variables.Debug then 
					GoGo_DebugAddLine("GoGo_GetTalentInfo: Found " .. talentname .. " with rank " .. rank)
				end --if
				return rank, maxrank
			end --if
		end --for
	end --for
	return 0,0
end --function

---------
function GoGo_FillButton(button, mount)
---------
	if mount then
		if GoGo_Variables.Debug then 
			GoGo_DebugAddLine("GoGo_FillButton: Casting " .. mount)
		end --if
		button:SetAttribute("macrotext", "/use "..mount)
	else
		button:SetAttribute("macrotext", nil)
	end --if
end --function

---------
function GoGo_CheckBindings()
---------
	for binding, button in pairs({GOGOBINDING = GoGoButton, GOGOBINDING2 = GoGoButton2, GOGOBINDING3 = GoGoButton3}) do
		ClearOverrideBindings(button)
		local key1, key2 = GetBindingKey(binding)
		if key1 then
			SetOverrideBindingClick(button, true, key1, button:GetName())
		end --if
		if key2 then
			SetOverrideBindingClick(button, true, key2, button:GetName())
		end --if
	end --if
end --function

---------
function GoGo_CanFly()
---------
	GoGo_Variables.Player.Zone = GetRealZoneText()
	GoGo_Variables.Player.SubZone = GetSubZoneText()

	local level = UnitLevel("player")
--	if (level <= 69) and not (GoGo_Variables.Player.Class == "DRUID") then
--		return false
--	elseif (GoGo_Variables.Player.Class == "DRUID" and level <= 67) then
--		return false
--	end --if
	if (level < 60) then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_CanFly: Failed - Player under level 60")
		end --if
		return false
	end --if
	
	if GoGo_InOutlands() then
		-- we can fly here
	elseif (GoGo_InNorthrend() and (GoGo_InBook(GoGo_Variables.Localize.ColdWeatherFlying))) then
		if GoGo_Variables.Player.Zone == GoGo_Variables.Localize.Zone.Dalaran then
			if (GoGo_Variables.Player.SubZone == GOGO_SZONE_KRASUSLANDING) then
				if not IsFlyableArea() then
					if GoGo_Variables.Debug then
						GoGo_DebugAddLine("GoGo_CanFly: Failed - Player in " .. GOGO_SZONE_KRASUSLANDING .. " and not in flyable area.")
					end --if
					return false
				end --if
			elseif (GoGo_Variables.Player.SubZone == GOGO_SZONE_THEVIOLETCITADEL) then
				if not IsOutdoors() then
					if GoGo_Variables.Debug then
						GoGo_DebugAddLine("GoGo_CanFly: Failed - Player in " .. GOGO_SZONE_THEVIOLETCITADEL .. " and not outdoors area.")
					end --if
					return false
				end --if
--				if not GoGo_CheckCoOrds("Dalaran", "VioletCitadel") then
--					return false
--				end --if
				if not IsFlyableArea() then
					if GoGo_Variables.Debug then
						GoGo_DebugAddLine("GoGo_CanFly: Failed - Player in " .. GOGO_SZONE_THEVIOLETCITADEL .. " and not in flyable area.")
					end --if
					return false
				end --if
			elseif (GoGo_Variables.Player.SubZone == GOGO_SZONE_THEUNDERBELLY) then
--				if not GoGo_CheckCoOrds("Dalaran", "Underbelly") then
--					return false
--				end --if
				if not IsFlyableArea() then
					if GoGo_Variables.Debug then
						GoGo_DebugAddLine("GoGo_CanFly: Failed - Player in " .. GOGO_SZONE_THEUNDERBELLY .. " and not in flyable area.")
					end --if
					return false
				end --if
			elseif (GoGo_Variables.Player.SubZone == GoGo_Variables.Localize.Zone.Dalaran) then
--				if not GoGo_CheckCoOrds("Dalaran", "Dalaran") then
--					return false
--				end --if
				if not IsFlyableArea() then
					if GoGo_Variables.Debug then
						GoGo_DebugAddLine("GoGo_CanFly: Failed - Player in " .. GoGo_Variables.Localize.Zone.Dalaran .. " and not outdoors area.")
					end --if
					return false
				end --if
			else
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_CanFly: Failed - Player in " .. GoGo_Variables.Localize.Zone.Dalaran .. " and not in known flyable subzone.")
				end --if
				return false
			end --if
		end --if

		if GoGo_Variables.Player.Zone == GoGo_Variables.Localize.Zone.Wintergrasp then
			if GetWintergraspWaitTime() then
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_CanFly: Player in Wintergrasp and battle ground is not active.")
				end --if
				-- timer ticking to start wg.. we can mount
			else
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_CanFly: Failed - Player in Wintergrasp and battle ground is active.")
				end --if
				-- we should be in battle.. can't mount
				return false
			end --if
		end --if
	else
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_CanFly: Failed - Player does not meet any flyable conditions.")
		end --if
		return false  -- we can't fly anywhere else
	end --if
	
	return true
end --function

---------
function GoGo_CanRide()
---------
	local level = UnitLevel("player")
	if level >= 20 then
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_CanRide: Passed - Player is over level 20.")
		end --if
		return true
	end --if
end --function

---------
function GoGo_CheckFor310()  -- checks to see if any existing 310% mounts exist to increase the speed of [6] mounts
---------
	local loop
	local MountID
	if GoGo_Variables.Debug then
		GoGo_DebugAddLine("GoGo_CheckFor310: Function executed.")
	end --if

	local Find310Mounts = GoGo_FilterMountsIn(GoGo_Variables.MountList,24)
	for loop=1, table.getn(Find310Mounts) do
		MountID = Find310Mounts[loop]
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_CheckFor310: Mount ID " .. MountID .. " found as 310% flying.")
		end --if
	end --for
	if (table.getn(Find310Mounts) > 0) then
		Find310Mounts = GoGo_FilterMountsIn(GoGo_Variables.MountList,6)
		if table.getn(Find310Mounts) then
			for loop=1, table.getn(Find310Mounts) do
				MountID = Find310Mounts[loop]
				GoGo_Variables.MountDB[MountID][24] = true
				if GoGo_Variables.Debug then
					GoGo_DebugAddLine("GoGo_CheckFor310: Mount ID " .. MountID .. " added as 310% flying.")
				end --if

			end --for
		end --if
	end --if
end --function

---------
function GoGo_IsMoving()
---------
    if GetUnitSpeed("player") ~= 0 then
        return true
    else
        return false
    end --if
end --function

---------
function GoGo_GetSkillLevel(searchname)
---------
	for skillIndex = 1, GetNumSkillLines() do
		skillName, isHeader, isExpanded, skillRank = GetSkillLineInfo(skillIndex)
		if isHeader == nil then
			if skillName == searchname then
				return skillRank
			end --if
		end --if
	end --for
end --function

---------
function GoGo_CheckCoOrds(ZoneName, SubZoneName)
---------
	local posX, posY = GetPlayerMapPosition("Player")
	local CanFlyHere = false
	local ZoneName = GoGo_FlyCoOrds[ZoneName]
	local SubZoneName = ZoneName[SubZoneName]
	for a = 1, table.getn(SubZoneName) or 0 do
		if GoGo_Variables.Debug then
			GoGo_DebugAddLine("GoGo_CheckCoOrds: Checking CoOrds " .. a)
		end --if
		local PointAX, PointAY, PointBX, PointBY = SubZoneName[a][1], SubZoneName[a][2], SubZoneName[a][3], SubZoneName[a][4]
		if posX >= PointAX and posX <= PointBX and posY >= PointAY and posY <= PointBY then
			-- we are in the rectangle a
			return true
		end --if
	end --for
	return false
end --function

---------
function GoGo_Msg(msg)
---------
	if msg then
		if GOGO_MESSAGES[msg] then
			GoGo_Msg(GOGO_MESSAGES[msg]())
		else
			msg = string.gsub(msg, "<", LIGHTYELLOW_FONT_COLOR_CODE)
			msg = string.gsub(msg, ">", "|r")
			DEFAULT_CHAT_FRAME:AddMessage(GREEN_FONT_COLOR_CODE.."GoGo: |r"..msg)
		end --if
	end --if
end --function

---------
function GoGo_Id(itemstring)
---------
	local _, _, itemid = string.find(itemstring,"(item:%d+)")
	if itemid then
		return itemid.." - "..itemstring
	end --if
	local _, _, spellid = string.find(itemstring,"(spell:%d+)")
	if spellid then
		return spellid.." - "..itemstring
	end --if

end --function

GOGO_ERRORS = {
	[SPELL_FAILED_NOT_MOUNTED] = true,
	[SPELL_FAILED_NOT_SHAPESHIFT] = true,
	[ERR_ATTACK_MOUNTED] = true,
}

GOGO_SPELLS = {
	["DRUID"] = function()
		if GoGo_InBook(GoGo_Variables.Localize.AquaForm) then
			if not GoGo_Variables.SkipFlyingMount and GoGo_CanFly() and GoGo_InBook(GoGo_Variables.Localize.FastFlightForm) then
				return "[swimming] "..GoGo_InBook(GoGo_Variables.Localize.AquaForm).."; [combat]"..GoGo_InBook(GoGo_Variables.Localize.TravelForm).."; "..GoGo_InBook(GoGo_Variables.Localize.FastFlightForm)
			elseif not GoGo_Variables.SkipFlyingMount and GoGo_CanFly() and GoGo_InBook(GoGo_Variables.Localize.FlightForm) then
				return "[swimming] "..GoGo_InBook(GoGo_Variables.Localize.AquaForm).."; [combat]"..GoGo_InBook(GoGo_Variables.Localize.TravelForm).."; "..GoGo_InBook(GoGo_Variables.Localize.FlightForm)
			else
				return "[swimming] "..GoGo_InBook(GoGo_Variables.Localize.AquaForm).."; "..GoGo_InBook(GoGo_Variables.Localize.TravelForm)
			end --if
		end --if
	end, --function
	["SHAMAN"] = function()
		return GoGo_InBook(GoGo_Variables.Localize.GhostWolf)
	end, --function
}

GOGO_COMMANDS = {
	["auto"] = function()
		GoGo_Prefs.autodismount = not GoGo_Prefs.autodismount
		GoGo_Msg("auto")
		GoGo_Panel_UpdateViews()
	end, --function
	["genericfastflyer"] = function()
		if not GoGo_CanFly() then
			return
		else
			GoGo_Prefs.genericfastflyer = not GoGo_Prefs.genericfastflyer
			GoGo_Msg("genericfastflyer")
			GoGo_Panel_UpdateViews()
		end --if
	end, --function
	["clear"] = function()
		if GoGo_Prefs.GlobalPrefMount then
			GoGo_Prefs.GlobalPrefMounts = nil
			if not InCombatLockdown() then
				for i, button in ipairs({GoGoButton, GoGoButton2}) do
					GoGo_FillButton(button)
				end --for
			end --if
		else
			GoGo_Prefs[GoGo_Variables.Player.Zone] = nil
			if not InCombatLockdown() then
				for i, button in ipairs({GoGoButton, GoGoButton2}) do
					GoGo_FillButton(button)
				end --for
			end --if
		end --if
		GoGo_Msg("pref")
	end, --function
	["updatenotice"] = function()
		GoGo_Prefs.DisableUpdateNotice = not GoGo_Prefs.DisableUpdateNotice
		GoGo_Msg("updatenotice")
		GoGo_Panel_UpdateViews()
	end, --function
	["mountnotice"] = function()
		GoGo_Prefs.DisableMountNotice = not GoGo_Prefs.DisableMountNotice
		GoGo_Msg("mountnotice")
		GoGo_Panel_UpdateViews()
	end, --function
	["druidclickform"] = function()
		GoGo_Prefs.DruidClickForm = not GoGo_Prefs.DruidClickForm
		GoGo_Msg("druidclickform")
		GoGo_Panel_UpdateViews()
	end, --function
	["druidflightform"] = function()
		GoGo_Prefs.DruidFlightForm = not GoGo_Prefs.DruidFlightForm
		GoGo_Msg("druidflightform")
		GoGo_Panel_UpdateViews()
	end, --function
	["options"] = function()
		InterfaceOptionsFrame_OpenToCategory(GoGo_Panel)
	end, --function
}

GOGO_MESSAGES = {
	["auto"] = function()
		if GoGo_Prefs.autodismount then
			return "Autodismount active - </gogo auto> to toggle"
		else
			return "Autodismount inactive - </gogo auto> to toggle"
		end --if
	end, --function
	["genericfastflyer"] = function()
		if not GoGo_CanFly() then
			return
		elseif GoGo_Prefs.genericfastflyer then
			return "Considering epic flying mounts 310% - 280% speeds the same for random selection - </gogo genericfastflyer> to toggle"
		else
			return "Considering epic flying mounts 310% - 280% speeds different for random selection - </gogo genericfastflyer> to toggle"
		end --if
	end, --function
	["pref"] = function()
		local msg = ""
		if not GoGo_Prefs.GlobalPrefMount then
			local list = ""
			if GoGo_Prefs[GoGo_Variables.Player.Zone] then
				list = list .. GoGo_GetIDName(GoGo_Prefs[GoGo_Variables.Player.Zone])
				msg = GoGo_Variables.Player.Zone..": "..list.." - </gogo clear> to clear"
			else
				msg = GoGo_Variables.Player.Zone..": ?".." - </gogo ItemLink> or </gogo SpellName> to add"
			end --if
			if GoGo_Prefs.GlobalPrefMounts then
				list = list .. GoGo_GetIDName(GoGo_Prefs.GlobalPrefMounts)
				msg = msg .. "\nGlobal Preferred Mounts: "..list.." - Enable global mount preferences to change."
			end --if
			return msg
		else
			local list = ""
			if GoGo_Prefs.GlobalPrefMounts then
				list = list .. GoGo_GetIDName(GoGo_Prefs.GlobalPrefMounts)
				msg = "Global Preferred Mounts: "..list.." - </gogo clear> to clear"
			else
				msg =  "Global Preferred Mounts: ?".." - </gogo ItemLink> or </gogo SpellName> to add"
			end --if
			if GoGo_Prefs[GoGo_Variables.Player.Zone] then
				list = list .. GoGo_GetIDName(GoGo_Prefs[GoGo_Variables.Player.Zone])
				msg = msg .. "\n" .. GoGo_Variables.Player.Zone ..": "..list.." - Disable global mount preferences to change."
			end --if
			return msg
		end --if
	end, --function
	["updatenotice"] = function()
		if GoGo_Prefs.DisableUpdateNotice then
			return "Update notices from other players disabled - </gogo updatenotice> to toggle"
		else
			return "Update notices from other players enabled - </gogo updatenotice> to toggle"
		end --if
	end, --function
	["mountnotice"] = function()
		if GoGo_Prefs.DisableMountNotice then
			return "Update notices about unknown mounts are disabled - </gogo mountnotice> to toggle"
		else
			return "Update notices about unknown mounts are enabled - </gogo mountnotice> to toggle"
		end --if
	end, --function
	["druidclickform"] = function()
		if GoGo_Prefs.DruidClickForm then
			return "Single click form changes enabled - </gogo druidclickform> to toggle"
		else
			return "Single click form changes disabled - </gogo druidclickform> to toggle"
		end --if
	end, --function
	["druidflightform"] = function()
		if GoGo_Prefs.DruidFlightForm then
			return "Flight Forms always used over flying mounts - </gogo druidflightform> to toggle"
		else
			return "Flighing mounts selected, flight forms if moving - </gogo druidflightform> to toggle"
		end --if
	end, --function
	["UnknownMount"] = function() return GOGO_STRING_UNKNOWNMOUNTFOUND end, --function
	["optiongui"] = function() return "To open the GUI options window - </gogo options>" end, --function
}

---------
function GoGo_DebugAddLine(LogLine)
---------
	if not GoGo_Variables.DebugLine then GoGo_Variables.DebugLine = 1 end --if
	GoGo_DebugLog[GoGo_Variables.DebugLine] = LogLine
	GoGo_Msg(LogLine)
	GoGo_Variables.DebugLine = GoGo_Variables.DebugLine + 1
	
end --function

---------
function GoGo_Panel_OnLoad(GoGo_Panel)
---------
--	local GoGo_Panel = CreateFrame("FRAME", nil);
--	GoGo_Panel:SetScript("OnShow",function() GoGo_Panel_UpdateViews(); end);
	GoGo_Panel.name = "GoGoMount"
	GoGo_Panel.okay = function (self) GoGo_Panel_Okay(); end;
	GoGo_Panel.default = function (self) GoGo_Settings_Default(); GoGo_Panel_UpdateViews(); end;
	InterfaceOptions_AddCategory(GoGo_Panel)
	
end --function

---------
function GoGo_Panel_CurrentZoneFavorites_OnLoad(GoGo_Panel_CurrentZoneFavorites)
---------
	GoGo_Panel_CurrentZoneFavorites.name = GOGO_STRING_CURRENTZONEFAVORITES
	GoGo_Panel_CurrentZoneFavorites.parent = "GoGoMount"
	GoGo_Panel_CurrentZoneFavorites.okay = function (self) GoGo_Panel_Okay(); end;
	GoGo_Panel_CurrentZoneFavorites.default = function (self) GOGO_COMMANDS["clear"](); GoGo_UpdateFavoritesTabs(); end;  -- use clear command with default button
	InterfaceOptions_AddCategory(GoGo_Panel_CurrentZoneFavorites)
end --function

---------
function GoGo_Panel_GlobalFavorites_OnLoad(GoGo_Panel_GlobalFavorites)
---------
	GoGo_Panel_GlobalFavorites.name = GOGO_STRING_GLOBALFAVORITES
	GoGo_Panel_GlobalFavorites.parent = "GoGoMount"
	GoGo_Panel_GlobalFavorites.okay = function (self) GoGo_Panel_Okay(); end;
	GoGo_Panel_GlobalFavorites.default = function (self) GOGO_COMMANDS["clear"](); GoGo_UpdateFavoritesTabs(); end;  -- use clear command with default button
	InterfaceOptions_AddCategory(GoGo_Panel_GlobalFavorites)
end --function

--[[
---------
function GoGo_Panel_GlobalFavorites_Populate()
---------

	
	if getn(GoGo_Variables.MountList) > 0 then
		for numMounts = 1, getn(GoGo_Variables.MountList) do
			GoGo_CurrentMountID = CreateFrame("CheckButton", GoGo_Variables.MountList[numMounts], GoGo_Panel_GlobalFavorites, "OptionsCheckButtonTemplate")
			GoGo_CurrentMountID:SetPoint("TOPLEFT", numMounts * 16, -16)
			--GoGo_Panel_MountItem = getglobal(GoGo_Panel_MountItem[GoGo_CurrentMountID])
			GoGo_CurrentMountIDText:SetText(GoGo_Variables.MountList[numMounts])
	
		end --for
	end --if
	


end --function

]]
---------
function GoGo_Panel_Options()
---------
	GoGo_Panel_DruidClickForm = CreateFrame("CheckButton", "GoGo_Panel_DruidClickForm", GoGo_Panel, "OptionsCheckButtonTemplate")
	GoGo_Panel_DruidClickForm:SetPoint("TOPLEFT", 16, -16)
	GoGo_Panel_DruidClickFormText:SetText(GOGO_STRING_DRUIDSINGLECLICK)

	GoGo_Panel_DruidFlightForm = CreateFrame("CheckButton", "GoGo_Panel_DruidFlightForm", GoGo_Panel, "OptionsCheckButtonTemplate")
	GoGo_Panel_DruidFlightForm:SetPoint("TOPLEFT", "GoGo_Panel_DruidClickForm", "BOTTOMLEFT", 0, -4)
	GoGo_Panel_DruidFlightFormText:SetText(GoGo_Variables.Localize.String.DruidFlightPreference)

	GoGo_Panel_AutoDismount = CreateFrame("CheckButton", "GoGo_Panel_AutoDismount", GoGo_Panel, "OptionsCheckButtonTemplate")
	GoGo_Panel_AutoDismount:SetPoint("TOPLEFT", "GoGo_Panel_DruidFlightForm", "BOTTOMLEFT", 0, -4)
	GoGo_Panel_AutoDismountText:SetText(GOGO_STRING_ENABLEAUTODISMOUNT)

	GoGo_Panel_GenericFastFlyer = CreateFrame("CheckButton", "GoGo_Panel_GenericFastFlyer", GoGo_Panel, "OptionsCheckButtonTemplate")
	GoGo_Panel_GenericFastFlyer:SetPoint("TOPLEFT", "GoGo_Panel_AutoDismount", "BOTTOMLEFT", 0, -4)
	GoGo_Panel_GenericFastFlyerText:SetText(GOGO_STRING_SAMEEPICFLYSPEED)


	GoGo_Panel_GlobalPrefMount = CreateFrame("CheckButton", "GoGo_Panel_GlobalPrefMount", GoGo_Panel, "OptionsCheckButtonTemplate")
	GoGo_Panel_GlobalPrefMount:SetPoint("TOPLEFT", "GoGo_Panel_GenericFastFlyer", "BOTTOMLEFT", 0, -4)
	GoGo_Panel_GlobalPrefMountText:SetText("Preferred mount changes apply to global setting")

--	GoGo_Panel_PaliUseCrusader = CreateFrame("CheckButton", "GoGo_Panel_PaliUseCrusader", GoGo_Panel, "OptionsCheckButtonTemplate")
--	GoGo_Panel_PaliUseCrusader:SetPoint("TOPLEFT", "GoGo_Panel_GlobalPrefMount", "BOTTOMLEFT", 0, -4)
--	GoGo_Panel_PaliUseCrusaderText:SetText("Paladins:  Auto start Crusader Aura when mounting")

	GoGo_Panel_DisableUpdateNotice = CreateFrame("CheckButton", "GoGo_Panel_DisableUpdateNotice", GoGo_Panel, "OptionsCheckButtonTemplate")
--	GoGo_Panel_DisableUpdateNotice:SetPoint("TOPLEFT", "GoGo_Panel_PaliUseCrusader", "BOTTOMLEFT", 0, -12)
	GoGo_Panel_DisableUpdateNotice:SetPoint("TOPLEFT", "GoGo_Panel_GlobalPrefMount", "BOTTOMLEFT", 0, -12)
	GoGo_Panel_DisableUpdateNoticeText:SetText(GOGO_STRING_DISABLEUPDATENOTICES)

	GoGo_Panel_DisableMountNotice = CreateFrame("CheckButton", "GoGo_Panel_DisableMountNotice", GoGo_Panel, "OptionsCheckButtonTemplate")
	GoGo_Panel_DisableMountNotice:SetPoint("TOPLEFT", "GoGo_Panel_DisableUpdateNotice", "BOTTOMLEFT", 0, -4)
	GoGo_Panel_DisableMountNoticeText:SetText(GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES)

-- Global favorite scroll frame and buttons
--[[
	GoGo_Panel_GlobalFavorites_Scroll = CreateFrame("ScrollFrame", "GoGo_Panel_GlobalFavorites_Scroll", GoGo_Panel_GlobalFavorites, "FauxScrollFrameTemplate")
	GoGo_Panel_GlobalFavorites_Scroll:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites", "TOPLEFT")
	GoGo_Panel_GlobalFavorites_Scroll:SetScript("OnVerticalScroll",function() FauxScrollFrame_OnVerticalScroll(this, offset, 16, GoGo_Panel_GlobalFavorites_Scroll_Update); end);
	GoGo_Panel_GlobalFavorites_Scroll:SetScript("OnShow",function() GoGo_Panel_GlobalFavorites_Scroll_Update(); end);
	
	GoGo_Panel_GlobalFavorites_Line1 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line1", GoGo_Panel_GlobalFavorites_Scroll, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line1:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Scroll", "TOPLEFT", 8, 0)
	GoGo_Panel_GlobalFavorites_Line2 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line2",GoGo_Panel_GlobalFavorites_Scroll, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line2:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line1", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line3 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line3", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line3:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line2", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line4 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line4", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line4:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line3", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line5 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line5", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line5:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line4", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line6 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line6", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line6:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line5", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line7 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line7", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line7:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line6", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line8 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line8", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line8:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line7", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line9 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line9", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line9:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line8", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line10 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line10", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line10:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line9", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line11 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line11", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line11:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line10", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line12 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line12", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line12:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line11", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line13 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line13", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line13:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line12", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line14 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line14", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line14:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line13", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line15 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line15", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line15:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line14", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line16 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line16", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line16:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line15", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line17 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line17", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line17:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line16", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line18 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line18", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line18:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line17", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line19 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line19", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line19:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line18", "BOTTOMLEFT")
	GoGo_Panel_GlobalFavorites_Line20 = CreateFrame("Button", "GoGo_Panel_GlobalFavorites_Line20", GoGo_Panel_GlobalFavorites, "GoGo_Favorite_Button")
	GoGo_Panel_GlobalFavorites_Line20:SetPoint("TOPLEFT", "GoGo_Panel_GlobalFavorites_Line19", "BOTTOMLEFT")

]]
end --function

---------
function GoGo_Panel_GlobalFavorites_Scroll_Update()
---------
	local line; -- 1 through 5 of our window to scroll
	local lineplusoffset; -- an index into our data calculated from the scroll offset
	FauxScrollFrame_Update(GoGo_Panel_GlobalFavorites_Scroll,50,20,16);
	for line=1,20 do
		lineplusoffset = line + FauxScrollFrame_GetOffset(GoGo_Panel_GlobalFavorites_Scroll);
		if lineplusoffset <= 50 then
			getglobal("GoGo_Panel_GlobalFavorites_Line"..line):SetText(GoGo_GetIDName(GoGo_Variables.MountSpellList[lineplusoffset]));
			--GoGo_DebugAddLine(GoGo_GetIDName(GoGo_Variables.MountSpellList[lineplusoffset]))
			getglobal("GoGo_Panel_GlobalFavorites_Line"..line):Show();
		else
			getglobal("GoGo_Panel_GlobalFavorites_Line"..line):Hide();
		end --if
	end  --for
end --function

---------
function GoGo_Panel_UpdateViews()
---------
	GoGo_Panel_AutoDismount:SetChecked(GoGo_Prefs.autodismount)
	GoGo_Panel_GenericFastFlyer:SetChecked(GoGo_Prefs.genericfastflyer)

	GoGo_Panel_DisableUpdateNotice:SetChecked(GoGo_Prefs.DisableUpdateNotice)
	GoGo_Panel_DisableMountNotice:SetChecked(GoGo_Prefs.DisableMountNotice)
	GoGo_Panel_DruidClickForm:SetChecked(GoGo_Prefs.DruidClickForm)
	GoGo_Panel_DruidFlightForm:SetChecked(GoGo_Prefs.DruidFlightForm)
	GoGo_Panel_GlobalPrefMount:SetChecked(GoGo_Prefs.GlobalPrefMount)
--	GoGo_Panel_PaliUseCrusader:SetChecked(GoGo_Prefs.PaliUseCrusader)
	
	if GoGo_Prefs.autodismount then
		GoGoFrame:RegisterEvent("UI_ERROR_MESSAGE")
	else
		GoGoFrame:UnregisterEvent("UI_ERROR_MESSAGE")
	end --if
end -- function

---------
function GoGo_Panel_Okay()
---------
	GoGo_Prefs.autodismount = GoGo_Panel_AutoDismount:GetChecked()
	GoGo_Prefs.genericfastflyer = GoGo_Panel_GenericFastFlyer:GetChecked()
	GoGo_Prefs.DisableUpdateNotice = GoGo_Panel_DisableUpdateNotice:GetChecked()
	GoGo_Prefs.DisableMountNotice = GoGo_Panel_DisableMountNotice:GetChecked()
	GoGo_Prefs.DruidClickForm = GoGo_Panel_DruidClickForm:GetChecked()
	GoGo_Prefs.DruidFlightForm = GoGo_Panel_DruidFlightForm:GetChecked()
	GoGo_Prefs.GlobalPrefMount = GoGo_Panel_GlobalPrefMount:GetChecked()
	--	GoGo_Prefs.PaliUseCrusader = GoGo_Panel_PaliUseCrusader:GetChecked()
end --function

---------
function GoGo_Settings_Default()
---------
	GoGo_Prefs.version = GetAddOnMetadata("GoGoMount", "Version")
	GoGo_Prefs.autodismount = true
	GoGo_Prefs.DisableUpdateNotice = false
	GoGo_Prefs.DisableMountNotice = false
	GoGo_Prefs.genericfastflyer = false
	GoGo_Prefs.DruidClickForm = true
	GoGo_Prefs.DruidFlightForm = false
	GoGo_Prefs.UnknownMounts = {}
	GoGo_Prefs.GlobalPrefMounts = {}
	GoGo_Prefs.GlobalPrefMount = false
--	GoGo_Prefs.PaliUseCrusader = false
end --function

---------
function GoGo_Settings_SetUpdates()
---------
	GoGo_Prefs.version = GetAddOnMetadata("GoGoMount", "Version")
	if not GoGo_Prefs.autodismount then GoGo_Prefs.autodismount = false end
	if not GoGo_Prefs.DisableUpdateNotice then GoGo_Prefs.DisableUpdateNotice = false end
	if not GoGo_Prefs.DisableMountNotice then GoGo_Prefs.DisableMountNotice = false end
	if not GoGo_Prefs.genericfastflyer then GoGo_Prefs.genericfastflyer = false end
	if not GoGo_Prefs.DruidClickForm then GoGo_Prefs.DruidClickForm = false end
	if not GoGo_Prefs.DruidFlightForm then GoGo_Prefs.DruidFlightForm = false end
	if not GoGo_Prefs.GlobalPrefMount then GoGo_Prefs.GlobalPrefMount = false end
--	if not GoGo_Prefs.PaliUseCrusader then GoGo_Prefs.PaliUseCrusader = false end
	GoGo_Prefs.UnknownMounts = {}
end --function

