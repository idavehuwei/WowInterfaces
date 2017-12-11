DuowanAddon_TBT_Enabled = false;

function TBT_Toggle(switch)
	if (switch) then
		TradeFrameRecipientNameText:Show();
		TradeFrameTargetWhisperButton:Show();
		TradeFrameTargetEmote1Button:Show();
		TradeFrameTargetEmote2Button:Show();
		TradeFrameTargetRecipientButton:Show();
		if(TradeFramePlayerSpell1Button) then TradeFramePlayerSpell1Button:Show(); end
		if(TradeFramePlayerSpell2Button) then TradeFramePlayerSpell2Button:Show(); end		
	else
		TradeFrameRecipientNameText:Hide();
		TradeFrameTargetWhisperButton:Hide();
		TradeFrameTargetEmote1Button:Hide();
		TradeFrameTargetEmote2Button:Hide();
		TradeFrameTargetRecipientButton:Hide();
		if(TradeFramePlayerSpell1Button) then TradeFramePlayerSpell1Button:Hide(); end
		if(TradeFramePlayerSpell2Button) then TradeFramePlayerSpell2Button:Hide(); end		
	end
end

function TBT_QUICKTRAD(switch)
	DuowanAddon_TBT_Enabled = switch;
end

if(Skinner and Skinner.initialized) then Skinner.initialized.TradeFrame = true; end;

local function SetOrHookScript(frame, scriptName, func)
	if( frame:GetScript(scriptName) ) then
		frame:HookScript(scriptName, func);
	else
		frame:SetScript(scriptName, func);
	end
end

function TBT_ContainerItemPreClick(self, button) 	
	if (not DuowanAddon_TBT_Enabled) then return end;
	if(button=="RightButton" and not IsModifierKeyDown()) then
		if(InboxFrame and InboxFrame:IsVisible()) then
			MailFrameTab_OnClick(nil, 2);
		end
		
		if(AuctionFrame and AuctionFrame:IsVisible()) then
			AuctionFrameTab_OnClick(nil, 3);
			if(AuctionsItemButton and AuctionsItemButton:IsVisible()) then
				PickupContainerItem(self:GetParent():GetID(), self:GetID());
				ClickAuctionSellItemButton();
				AuctionsFrameAuctions_ValidateAuction();
			end
		end
	end
end

function TBTFrame_OnLoad(self)
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("LOOT_OPENED");
	self:RegisterEvent("VARIABLES_LOADED");

	--display the trade recepient info
	local targetInfoText = TradeFrame:CreateFontString("TradeFrameTargetInfoText", "ARTWORK", "GameFontNormal");
	targetInfoText:SetWidth(100);
	targetInfoText:SetHeight(12);
	targetInfoText:SetJustifyH("RIGHT");
	targetInfoText:SetPoint("TOPLEFT", "TradeFrameRecipientNameText", "BOTTOMLEFT", 0, -8);
	hooksecurefunc("TradeFrame_OnShow", function(self)if(UnitExists("NPC"))then TradeFrameTargetInfoText:SetText(UnitClass("NPC").." - "..UnitLevel("NPC"));end end);

	--button for whisper
	local button = CreateFrame("Button", "TradeFrameTargetWhisperButton", TradeFrame, "UIPanelButtonTemplate");
	button:SetWidth(30);
	button:SetHeight(21);
	button:SetPoint("TOPLEFT", "TradeFrameTargetInfoText", "BOTTOMLEFT", 0, -2);
	button:SetText(TBT_RIGHT_BUTTON.whisper);
	button:SetScript("OnClick", function(self) 
		ChatFrame_SendTell(TBT_UnitName("NPC"));
	end)

	--button for emote1
	button = CreateFrame("Button", "TradeFrameTargetEmote1Button", TradeFrame, "UIPanelButtonTemplate");
	button:SetWidth(30);
	button:SetHeight(21);
	button:SetPoint("LEFT", "TradeFrameTargetWhisperButton", "RIGHT", 5, 0);
	button:SetText(TBT_RIGHT_BUTTON.ask);
	button:SetScript("OnClick", function(self) DoEmote("hungry", "NPC") end);

	--button for emote2
	button = CreateFrame("Button", "TradeFrameTargetEmote2Button", TradeFrame, "UIPanelButtonTemplate");
	button:SetWidth(30);
	button:SetHeight(21);
	button:SetPoint("LEFT", "TradeFrameTargetEmote1Button", "RIGHT", 5, 0);
	button:SetText(TBT_RIGHT_BUTTON.thank);
	button:SetScript("OnClick", function(self) DoEmote("thank", "NPC") end);

	--button for click-targetting, positioned at portrait.
	button = CreateFrame("Button", "TradeFrameTargetRecipientButton", TradeFrame, "SecureActionButtonTemplate") 
	button:SetAttribute("type", "target");
	button:SetAttribute("unit", "NPC");
	button:SetWidth(60)
	button:SetHeight(70)
	button:SetPoint("CENTER", "TradeFrame", "TOPLEFT", 210, -35);

	--for rightclick quick trade
	for i=1, NUM_CONTAINER_FRAMES do
		for j=1, MAX_CONTAINER_ITEMS do
			local f = getglobal("ContainerFrame"..i.."Item"..j);
			if(f) then
				SetOrHookScript(f, "PreClick", TBT_ContainerItemPreClick);
			end
		end
	end

	--for alt+leftclick quick trade	
	hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", function(self, button)
		if (not DuowanAddon_TBT_Enabled) then return end;

		if(button == "LeftButton" and IsAltKeyDown() ) then
			if(InboxFrame and InboxFrame:IsVisible()) then
				MailFrameTab_OnClick(nil, 2);
			end
			if(SendMailAttachment1 and SendMailAttachment1:IsVisible()) then
				UseContainerItem(self:GetParent():GetID(), self:GetID());
			elseif(AuctionsItemButton and AuctionsItemButton:IsVisible()) then
				PickupContainerItem(self:GetParent():GetID(), self:GetID());
				ClickAuctionSellItemButton();
				AuctionsFrameAuctions_ValidateAuction();
				if(CursorHasItem()) then ClearCursor(); end;
			end
		end

		--for shift+leftclick start auction search directly.
		if(button == "LeftButton" and IsShiftKeyDown() and AuctionFrame and AuctionFrame:IsVisible()) then		
			ChatEdit_InsertLink(GetContainerItemLink(self:GetParent():GetID(), self:GetID()));
			AuctionFrameBrowse_Search();
		end

		-- ctrl + alt + right ÅÄÂô
		--[[
		if(button=="RightButton" and IsControlKeyDown() and IsAltKeyDown() and AuctionsItemButton and AuctionsItemButton:IsVisible()) then
			PickupContainerItem(self:GetParent():GetID(), self:GetID());
			ClickAuctionSellItemButton();
			local name, texture, count, quality, canUse, price = GetAuctionSellItemInfo();
			if ( name == LAST_ITEM_AUCTIONED and count == LAST_ITEM_COUNT) then
				MoneyInputFrame_SetCopper(StartPrice, LAST_ITEM_START_BID);
				MoneyInputFrame_SetCopper(BuyoutPrice, LAST_ITEM_BUYOUT);
			end
			AuctionsFrameAuctions_ValidateAuction();
			if(AuctionsCreateAuctionButton:IsEnabled()==1) then
				AuctionsCreateAuctionButton_OnClick();
			else
				DEFAULT_CHAT_FRAME:AddMessage(TBT_CANT_CREATE_AUCTION);
			end
		end
		]]
	end)

end

function TBTFrame_SetButtonSpell(button, spell)
	if not InCombatLockdown() then
		button:SetAttribute("type", "spell");
		button:SetAttribute("spell", spell);
	end
end

function TBT_TradeItem(self, type)
	local item, quantity,spell,maxRank,spells,i;
	maxRank = TBT_MaxSpellRank[type];
	if(maxRank) then
		TBTFrame_SetButtonSpell(self, "");
		local spells, npcLevel;
		spells = TBT_SPELL_TABLE[type];
		npcLevel = UnitLevel("npc");

		for i=maxRank, 1,-1 do
			if(spells[i].level <= npcLevel) then
				item = spells[i].item;
				spell = TBT_GetSpellName(spells[i].name, spells[i].rank); --localization
				break;
			end
		end
		
		if(type=="water" or type=="food") then 
			quantity=15;
		else
			quantity=1;
		end

		local bag, slot = TBT_FindItem(item, quantity, type)
		if(slot) then
			local emptySlot = false;
			for i=1,6 do
				if(not GetTradePlayerItemInfo(i)) then
					emptySlot = true;
				end;
			end
			if(emptySlot) then
				PickupContainerItem(bag, slot);
				StackSplitFrame:Hide();
				TradeFrame_OnMouseUp();
				return;
			end			
		end
		TBTFrame_SetButtonSpell(self, spell);
	end
end

function TBTFrame_CreateLeftButton(class)
	if(getglobal("TradeFramePlayerSpell1Button")~=nil)then return end; --already created

	local button = nil;
	if(class=="MAGE") then
		--for make water button
		button = CreateFrame("Button", "TradeFramePlayerSpell1Button", TradeFrame, "UIPanelButtonTemplate, SecureActionButtonTemplate");
		button:SetWidth(45);
		button:SetHeight(21);
		button:SetText(TBT_LEFT_BUTTON.water);
		button:SetPoint("TOPLEFT", "TradeFrame", "TOPLEFT", 72, -50);
		button:SetScript("PreClick", function(self) TBT_TradeItem(self, "water") end);
		button:SetScript("PostClick", function(self) TBTFrame_SetButtonSpell(self,"") end);

		button = CreateFrame("Button", "TradeFramePlayerSpell2Button", TradeFrame, "UIPanelButtonTemplate, SecureActionButtonTemplate");
		button:SetWidth(45);
		button:SetHeight(21);
		button:SetText(TBT_LEFT_BUTTON.food);
		button:SetPoint("LEFT", "TradeFramePlayerSpell1Button", "RIGHT", 5, 0);
		button:SetScript("PreClick", function(self) TBT_TradeItem(self, "food") end);
		button:SetScript("PostClick", function(self) TBTFrame_SetButtonSpell(self,"") end);
	elseif (class=="WARLOCK") then
		button = CreateFrame("Button", "TradeFramePlayerSpell1Button", TradeFrame, "UIPanelButtonTemplate, SecureActionButtonTemplate");
		button:SetWidth(45);
		button:SetHeight(21);
		button:SetText(TBT_LEFT_BUTTON.stone);
		button:SetPoint("TOPLEFT", "TradeFrame", "TOPLEFT", 72, -50);
		button:SetScript("PreClick", function(self) TBT_TradeItem(self, "stone") end);
		button:SetScript("PostClick", function(self) TBTFrame_SetButtonSpell(self,"") end);
	elseif (class=="ROGUE") then
		button = CreateFrame("Button", "TradeFramePlayerSpell1Button", TradeFrame, "UIPanelButtonTemplate, SecureActionButtonTemplate");
		button:SetWidth(45);
		button:SetHeight(21);
		button:SetText(TBT_LEFT_BUTTON.unlock);
		button:SetPoint("TOPLEFT", "TradeFrame", "TOPLEFT", 72, -50);
		button:SetAttribute("type","spell");
		button:SetAttribute("spell", TBT_UNLOCK_SKILL_NAME);
		button:SetScript("PostClick", function(self) ClickTargetTradeButton(7); end);
	end
end

TBT_MaxSpellRank = nil;

function TBTFrame_OnEvent(self, event, ...)
	if(event == "PLAYER_ENTERING_WORLD") then
		local _,class = UnitClass("player")

		TBTFrame_CreateLeftButton(class);
		if(TBT_MaxSpellRank==nil) then
			TBT_MaxSpellRank = {};

			--look through player's spell book
			local i = 1
			while true do
				local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL);
				local spellRankNum;
				if(spellRank) then _,_,spellRankNum = string.find(spellRank, TBT_SPELL_RANK_PATTERN); end
				if(spellRankNum) then spellRankNum = spellRankNum + 0; end

				if not spellName then
					do break end
				end

				if(class=="MAGE")then
					UpdateMaxRank("water", spellName, spellRankNum);
					UpdateMaxRank("food", spellName, spellRankNum);
				elseif(class=="WARLOCK")then
					UpdateMaxRank("stone", spellName, spellRankNum);
				end
				i = i + 1
			end
		end
	--[[
	elseif(event == "LOOT_OPENED") then
		if (not DuowanAddon_TBT_Enabled) then return end;

		if(GetNumLootItems()==1) then
			local iconPath, _, _, _ = GetLootSlotInfo(1);
			if(string.find(iconPath, "Interface\\Icons\\INV_Enchant_") == 1) then
				LootSlot(1);
			end
		end	
	]]
	end
end

function UpdateMaxRank(type, spellName, spellRankNum)
	
	local spells = TBT_SPELL_TABLE[type];
	local j;
	for j = 1, table.getn(spells), 1 do
		if(spells[j].name==spellName and (not spells[j].rank or spells[j].rank==spellRankNum)) then
			TBT_debug(spellName, spellRankNum);
			if(not TBT_MaxSpellRank[type] or j > TBT_MaxSpellRank[type]) then
				TBT_MaxSpellRank[type] = j;
			end
		end
	end
end

function TBT_FindItem(item,quantity,type)
	local bag,slog,i;
	for bag=0,NUM_CONTAINER_FRAMES do
		for slot=1,GetContainerNumSlots(bag) do
			local _, count, locked, _ = GetContainerItemInfo(bag, slot)
			if (count and not locked and count >= quantity ) then
				local itemLink = GetContainerItemLink(bag, slot);
				local found, _, name = string.find(itemLink, "^|%x+|H.+|h%[(.+)%]")
				if item == name then
					TBT_debug("item==name",name);
					--to distinguish the healthstone made by other warlock
					if(type=="stone")then
						GameTooltip:SetOwner(UIParent,"ANCHOR_LEFT");
						GameTooltip:SetBagItem(bag,slot);
						for i=1,GameTooltip:NumLines(),1 do
							local text = getglobal("GameTooltipTextLeft"..i):GetText();
							if(text) then
								local _,_,name = string.find(text,TBT_GAMETOOLTIP_MADE_BY);
								if(name) then
									TBT_debug("name=",name);
									if(name==UnitName("player"))then
										GameTooltip:Hide();
										return bag,slot
									end
									break;
								end
							end
						end
						GameTooltip:Hide();
					else
						return bag, slot;
					end
				end
			end
		end
	end
	return nil,nil
end

function TBT_GetSpellName(name, rank)
	if(rank) then
		rank, _ = string.gsub(TBT_SPELL_RANK_PATTERN,"%(%%d%)", rank)
		return name.."("..rank..")";
	else
		return name;
	end
end

--for {name, server} return "name-server"
function TBT_UnitName(unit)
	local name,server = UnitName(unit);
	if(server) then
		return name.."-"..server;
	else
		return name;
	end
end

function TBT_debug(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
	if(1) then return; end
	local msg = "";
	if(arg1) then msg = msg..arg1.."," else msg = msg.." ," end 
	if(arg2) then msg = msg..arg2.."," else msg = msg.." ," end
	if(arg3) then msg = msg..arg3.."," else msg = msg.." ," end
	if(arg4) then msg = msg..arg4.."," else msg = msg.." ," end
	if(arg5) then msg = msg..arg5.."," else msg = msg.." ," end
	if(arg6) then msg = msg..arg6.."," else msg = msg.." ," end
	if(arg7) then msg = msg..arg7.."," else msg = msg.." ," end
	DEFAULT_CHAT_FRAME:AddMessage(msg);
end

