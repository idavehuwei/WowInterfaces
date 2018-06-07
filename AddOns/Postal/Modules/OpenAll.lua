local Postal = LibStub("AceAddon-3.0"):GetAddon("Postal")
local Postal_OpenAll = Postal:NewModule("OpenAll", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Postal")
Postal_OpenAll.description = L["A button that collects all attachments and coins from mail."]
Postal_OpenAll.description2 = L[ [[|cFFFFCC00*|r Simple filters are available for various mail types.
|cFFFFCC00*|r Shift-Click the Open All button to override the filters and take ALL mail.
|cFFFFCC00*|r OpenAll will never delete any mail (mail without text is auto-deleted by the game when all attached items and gold are taken).
|cFFFFCC00*|r OpenAll will skip CoD mails and mails from Blizzard.
|cFFFFCC00*|r Disable the Verbose option to stop the chat spam while opening mail.]] ]

local mailIndex, attachIndex
local lastmailIndex, lastattachIndex, lastmailmoneyIndex
local lastItem
local button
local Postal_OpenAllMenuButton
local skipFlag = false
local invFull
local openAllOverride

local updateFrame = CreateFrame("Frame")
updateFrame:Hide()
updateFrame:SetScript("OnShow", function(self)
	self.time = Postal.db.profile.OpenSpeed
end)
updateFrame:SetScript("OnUpdate", function(self, elapsed)
	self.time = self.time - elapsed
	if self.time <= 0 then
		self:Hide()
		Postal_OpenAll:ProcessNext()
	end
end)

function Postal_OpenAll:OnEnable()
	if not button then
		button = CreateFrame("Button", "PostalOpenAllButton", InboxFrame, "UIPanelButtonTemplate")
		button:SetWidth(120)
		button:SetHeight(25)
		if GetLocale() == "frFR" then
			button:SetPoint("CENTER", InboxFrame, "TOP", -32, -410)
		else
			button:SetPoint("CENTER", InboxFrame, "TOP", -22, -410)
		end
		button:SetText(L["Open All"])
		button:SetScript("OnClick", function() Postal_OpenAll:OpenAll() end)
	end
	if not Postal_OpenAllMenuButton then
		-- Create the Menu Button
		Postal_OpenAllMenuButton = CreateFrame("Button", "Postal_OpenAllMenuButton", InboxFrame);
		Postal_OpenAllMenuButton:SetWidth(30);
		Postal_OpenAllMenuButton:SetHeight(30);
		Postal_OpenAllMenuButton:SetPoint("LEFT", button, "RIGHT", -2, 0);
		Postal_OpenAllMenuButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up");
		Postal_OpenAllMenuButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Round");
		Postal_OpenAllMenuButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled");
		Postal_OpenAllMenuButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down");
		Postal_OpenAllMenuButton:SetScript("OnClick", function(self, button, down)
			if Postal_DropDownMenu.initialize ~= Postal_OpenAll.ModuleMenu then
				CloseDropDownMenus()
				Postal_DropDownMenu.initialize = Postal_OpenAll.ModuleMenu
			end
			ToggleDropDownMenu(1, nil, Postal_DropDownMenu, self:GetName(), 0, 0)
		end)
	end

	self:RegisterEvent("MAIL_SHOW")
	-- For enabling after a disable
	button:Show()
	Postal_OpenAllMenuButton:SetScript("OnHide", Postal_DropDownMenu.HideMenu)
	Postal_OpenAllMenuButton:Show()
end

function Postal_OpenAll:OnDisable()
	self:Reset()
	button:Hide()
	Postal_OpenAllMenuButton:SetScript("OnHide", nil)
	Postal_OpenAllMenuButton:Hide()
end

function Postal_OpenAll:MAIL_SHOW()
	self:RegisterEvent("MAIL_CLOSED", "Reset")
	self:RegisterEvent("PLAYER_LEAVING_WORLD", "Reset")
end

function Postal_OpenAll:OpenAll()
	mailIndex = GetInboxNumItems() or 0
	attachIndex = ATTACHMENTS_MAX_RECEIVE
	invFull = nil
	skipFlag = false
	lastmailIndex = nil
	lastattachIndex = nil
	lastmailmoneyIndex = nil
	lastItem = nil
	openAllOverride = IsShiftKeyDown()
	if mailIndex == 0 then
		return
	end

	Postal:DisableInbox(1)
	button:SetText(L["In Progress"])

	self:RegisterEvent("UI_ERROR_MESSAGE")
	self:ProcessNext()
end

function Postal_OpenAll:ProcessNext()
	local _, sender, msgSubject, msgMoney, msgCOD, msgItem, msgText, isGM
	if mailIndex > 0 then
		sender, msgSubject, msgMoney, msgCOD, _, msgItem, _, _, msgText, _, isGM = select(3, GetInboxHeaderInfo(mailIndex))
		if (msgCOD and msgCOD > 0) or (isGM) then
			-- Skip mail if it contains a CoD or if its from a GM
			skipFlag = true
			mailIndex = mailIndex - 1
			attachIndex = ATTACHMENTS_MAX_RECEIVE
			lastItem = nil
			return self:ProcessNext() -- tail call
		end
		local mailType = Postal:GetMailType(msgSubject)
		if mailType == "NonAHMail" then
			-- Skip player sent mail with attachments according to user options
			if not (openAllOverride or Postal.db.profile.OpenAll.Attachments) and msgItem then
				mailIndex = mailIndex - 1
				attachIndex = ATTACHMENTS_MAX_RECEIVE
				lastItem = nil
				return self:ProcessNext() -- tail call
			end
		else
			-- AH mail, check if its from faction or neutral AH
			local factionEnglish, factionLocale = UnitFactionGroup("player")
			if not strfind(sender, factionLocale) then
				mailType = "Neutral"..mailType
			end
			-- Skip AH mail types according to user options
			if not (openAllOverride or Postal.db.profile.OpenAll[mailType]) then
				mailIndex = mailIndex - 1
				attachIndex = ATTACHMENTS_MAX_RECEIVE
				lastItem = nil
				return self:ProcessNext() -- tail call
			end
		end
		if Postal.db.profile.OpenAll.SpamChat and attachIndex == ATTACHMENTS_MAX_RECEIVE then
			-- Print message on next mail
			local moneyString = msgMoney > 0 and " ["..Postal:GetMoneyString(msgMoney).."]" or ""
			Postal:Print(format("%s %d: %s%s", L["Processing Message"], mailIndex, msgSubject, moneyString))
		end
		while not GetInboxItemLink(mailIndex, attachIndex) and attachIndex > 0 do
			-- Find first attachment index backwards
			attachIndex = attachIndex - 1
		end
		if attachIndex > 0 and not invFull then
			-- If there's attachments, take the item
			--Postal:Print("Getting Item from Message "..mailIndex..", "..attachIndex)
			if lastmailIndex ~= mailIndex or lastattachIndex ~= attachIndex then -- don't attempt to take more than once or it generates the "database error"
				--Postal:Print("Actually getting it")
				lastItem = GetInboxNumItems()
				TakeInboxItem(mailIndex, attachIndex)
				lastmailIndex = mailIndex
				lastattachIndex = attachIndex
			else
				if lastItem ~= GetInboxNumItems() then
					mailIndex = mailIndex - 1
					attachIndex = ATTACHMENTS_MAX_RECEIVE
					lastItem = nil
					return self:ProcessNext() -- tail call
				end
			end
			--attachIndex = attachIndex - 1
			updateFrame:Show()
		elseif msgMoney > 0 then
			-- No attachments, but there is money
			if lastItem and lastItem ~= GetInboxNumItems() then
				mailIndex = mailIndex - 1
				attachIndex = ATTACHMENTS_MAX_RECEIVE
				lastItem = nil
				return self:ProcessNext() -- tail call
			end
			--Postal:Print("Looting Message "..mailIndex)
			if lastmailmoneyIndex ~= mailIndex then -- don't attempt to take more than once or it generates the "database error"
				TakeInboxMoney(mailIndex)
				lastmailmoneyIndex = mailIndex
				lastItem = GetInboxNumItems()
			end
			updateFrame:Show()
		else
			if lastItem and lastItem ~= GetInboxNumItems() then
				-- the last attachment or gold taken auto deleted the mail so move on to the next mail
				mailIndex = mailIndex - 1
				attachIndex = ATTACHMENTS_MAX_RECEIVE
				lastItem = nil
				return self:ProcessNext() -- tail call
			end
			mailIndex = mailIndex - 1
			attachIndex = ATTACHMENTS_MAX_RECEIVE
			lastItem = nil
			return self:ProcessNext() -- tail call
		end
	else
		if IsAddOnLoaded("MrPlow") then MrPlow:ParseInventory() end
		if skipFlag then Postal:Print(L["Some Messages May Have Been Skipped."]) end
		self:Reset()
	end
end

function Postal_OpenAll:Reset(event)
	updateFrame:Hide()
	self:UnregisterEvent("MAIL_INBOX_UPDATE")
	self:UnregisterEvent("UI_ERROR_MESSAGE")
	button:SetText(L["Open All"])
	Postal:DisableInbox()
	InboxFrame_Update()
	if event == "MAIL_CLOSED" or event == "PLAYER_LEAVING_WORLD" then
		self:UnregisterEvent("MAIL_CLOSED")
		self:UnregisterEvent("PLAYER_LEAVING_WORLD")
	end
end

function Postal_OpenAll:MAIL_INBOX_UPDATE()
	--Postal:Print("update")
	self:UnregisterEvent("MAIL_INBOX_UPDATE")
	updateFrame:Show()
end

function Postal_OpenAll:UI_ERROR_MESSAGE(event, error_message)
	if error_message == ERR_INV_FULL then
		invFull = true
	elseif error_message == ERR_ITEM_MAX_COUNT then
		attachIndex = attachIndex - 1
	end
end

function Postal_OpenAll.ModuleMenu(self, level)
	if not level then return end
	local info = self.info
	wipe(info)
	if level == 1 + self.levelAdjust then
		info.hasArrow = 1
		info.keepShownOnClick = 1
		info.func = self.UncheckHack
		info.notCheckable = 1

		info.text = FACTION.." "..L["AH-related mail"]
		info.value = "AHMail"
		UIDropDownMenu_AddButton(info, level)

		info.text = FACTION_STANDING_LABEL4.." "..L["AH-related mail"]
		info.value = "NeutralAHMail"
		UIDropDownMenu_AddButton(info, level)

		info.text = L["Non-AH related mail"]
		info.value = "NonAHMail"
		UIDropDownMenu_AddButton(info, level)

		info.text = L["Other options"]
		info.value = "OtherOptions"
		UIDropDownMenu_AddButton(info, level)

	elseif level == 2 + self.levelAdjust then
		local db = Postal.db.profile.OpenAll

		info.keepShownOnClick = 1
		info.func = Postal.SaveOption
		info.arg1 = "OpenAll"

		if UIDROPDOWNMENU_MENU_VALUE == "AHMail" then
			info.text = L["Open all Auction cancelled mail"]
			info.arg2 = "AHCancelled"
			info.checked = db.AHCancelled
			UIDropDownMenu_AddButton(info, level)

			info.text = L["Open all Auction expired mail"]
			info.arg2 = "AHExpired"
			info.checked = db.AHExpired
			UIDropDownMenu_AddButton(info, level)

			info.text = L["Open all Outbid on mail"]
			info.arg2 = "AHOutbid"
			info.checked = db.AHOutbid
			UIDropDownMenu_AddButton(info, level)

			info.text = L["Open all Auction successful mail"]
			info.arg2 = "AHSuccess"
			info.checked = db.AHSuccess
			UIDropDownMenu_AddButton(info, level)

			info.text = L["Open all Auction won mail"]
			info.arg2 = "AHWon"
			info.checked = db.AHWon
			UIDropDownMenu_AddButton(info, level)

		elseif UIDROPDOWNMENU_MENU_VALUE == "NeutralAHMail" then
			info.text = L["Open all Auction cancelled mail"]
			info.arg2 = "NeutralAHCancelled"
			info.checked = db.NeutralAHCancelled
			UIDropDownMenu_AddButton(info, level)

			info.text = L["Open all Auction expired mail"]
			info.arg2 = "NeutralAHExpired"
			info.checked = db.NeutralAHExpired
			UIDropDownMenu_AddButton(info, level)

			info.text = L["Open all Outbid on mail"]
			info.arg2 = "NeutralAHOutbid"
			info.checked = db.NeutralAHOutbid
			UIDropDownMenu_AddButton(info, level)

			info.text = L["Open all Auction successful mail"]
			info.arg2 = "NeutralAHSuccess"
			info.checked = db.NeutralAHSuccess
			UIDropDownMenu_AddButton(info, level)

			info.text = L["Open all Auction won mail"]
			info.arg2 = "NeutralAHWon"
			info.checked = db.NeutralAHWon
			UIDropDownMenu_AddButton(info, level)

		elseif UIDROPDOWNMENU_MENU_VALUE == "NonAHMail" then
			info.text = L["Open all mail with attachments"]
			info.arg2 = "Attachments"
			info.checked = db.Attachments
			UIDropDownMenu_AddButton(info, level)

		elseif UIDROPDOWNMENU_MENU_VALUE == "OtherOptions" then
			info.text = L["Verbose mode"]
			info.arg2 = "SpamChat"
			info.checked = db.SpamChat
			UIDropDownMenu_AddButton(info, level)
		end

	end
end
