if Fence:HasModule('Browse') then return end

local L = AceLibrary("AceLocale-2.2"):new("Fence_Browse")
local l = AceLibrary("AceLocale-2.2"):new("Fence")
local abc = AceLibrary("Abacus-2.0")

local mod = Fence:NewModule("Browse")
local BLACK_GOLD=110;
function Fence_SetBlackGold(val)
	BLACK_GOLD=val;
end
Fence:RegisterDefaults('Browse', 'profile', {
	ShowPrice = true,
    ShowBid = true,
    PriceStyle = "short",
    BidStyle = "text",--"fade"
    ShowPriceForSingle = false,
    BlackBook = {},
})

mod.db = Fence:AcquireDBNamespace("Browse")

local II_SEARCH_CHECKED;
local II_MAX_SAVE_R = 30;
local function SaveSearchName_ListSelect(self, name)	
	if(name and type(name) == "string") then		
		BrowseName:SetText(name);		
		BrowseName:HighlightText(0,-1);
	end
end

local function II_SearchReMoveName()
	if (II_SEARCH_CHECKED) then	
		print(format(L["|cff00ff00[%s]|r has been removed from query list."], mod.db.profile.BlackBook[II_SEARCH_CHECKED]));
		tremove(mod.db.profile.BlackBook, II_SEARCH_CHECKED);	
		BrowseName:SetText("");	
	end
end

local function II_SearchAddName(self, name)
	tinsert(mod.db.profile.BlackBook, name);	
	print(format(L["|cff00ff00[%s]|r has been added to query list."], name));
end

local function II_SearchGetName(name)
	if (not name) then
		return nil;
	end
	for key ,value in ipairs(mod.db.profile.BlackBook) do
		if (value == name) then
			return key;			
		end
	end
	return nil;
end

function SaveSearchName_DropDown_Initialize()
	local info = {value = 0, notCheckable = 1};
	local name = BrowseName:GetText();
	local full = nil;
	if (name and name ~= "") then
		II_SEARCH_CHECKED = II_SearchGetName(name);
		if (II_SEARCH_CHECKED) then		
			info.func = II_SearchReMoveName;
			info.text = format(L["|cffff0000Remove|r %s"], name);
		elseif (#(mod.db.profile.BlackBook) < II_MAX_SAVE_R ) then			
			info.func = II_SearchAddName;
			info.arg1 = name;
			info.text = format(L["|cff00ff00Add|r %s"], name);
		else
			full = 1;
		end

		if (not full) then			
			UIDropDownMenu_AddButton(info); 
		end
	end

	for key, name in ipairs(mod.db.profile.BlackBook) do
		info = {text=name, arg1 =name, value=key, func = SaveSearchName_ListSelect};	
		if (key == II_SEARCH_CHECKED) then
			info.checked = 1;
		end
		UIDropDownMenu_AddButton(info);
	end	
end

function Fence_CreateBlackBookButton()
	-- 创建保存名字的DropDown
	local dropdown = CreateFrame("Frame", "SaveSearchName_DropDown", BrowseName, "UIDropDownMenuTemplate"); 
	local ddbutton = dwGetglobal(dropdown:GetName() .. "Button");
	dropdown:SetID(1);
	dropdown:SetPoint("LEFT", BrowseName, "LEFT", 13, -3);	
	dropdown:SetScript("OnShow", function (self)
		UIDropDownMenu_Initialize(self, SaveSearchName_DropDown_Initialize, "MENU");
		dwGetglobal(dropdown:GetName().."ButtonNormalTexture"):SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up");		
		dwGetglobal(dropdown:GetName().."ButtonDisabledTexture"):SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled");			
		dwGetglobal(dropdown:GetName().."ButtonPushedTexture"):SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down");			
		dwGetglobal(dropdown:GetName().."ButtonHighlightTexture"):SetTexture("Interface\\Buttons\\UI-Common-MouseHilight");		
		UIDropDownMenu_SetSelectedValue(BrowseDropDown,-1);
	end);
	ddbutton:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(ddbutton, "ANCHOR_RIGHT");
		--GameTooltip:AddLine(L["Click to select item to query"]);
		GameTooltip:Show();
	end);
	ddbutton:SetScript("OnLeave", function(self)
		GameTooltip:Hide();
	end);
end

function mod:OnInitialize()
	Fence.options.args.browse = {
		type = 'group',
		name = L["Browse"], aliases='br',
		desc = L["Displays price per item."],
			args = {
				toggle = {
					type = 'toggle',
					name = L["Browse"],
					desc = string.format(l["Toggles %s function."], L["Browse"]),
					get = function() return Fence:IsModuleActive("Browse") end,
					set = function(v) Fence:ToggleModuleActive("Browse", v) end
				},
				showprice = {
					order	= 200,
					type = 'toggle',
					name = L["Show price per item"], aliases='sp',
					desc = string.format(l["Toggles %s function."], L["Show price per item"]),
					get = function() return self.db.profile.ShowPrice end,
					set = function(v)
						self.db.profile.ShowPrice = v
						Fence.options.args.browse.args.showpriceforsingle.disabled = not v
					      end
				},
				showpriceforsingle = {
					order	= 220,
					disabled = not self.db.profile.ShowPrice,
					type	= 'toggle',
					name	= L['Show price for single items'],
					desc	= L['Toggles whether prices are shown for items in stacks of 1'],
					get	= function() return self.db.profile.ShowPriceForSingle end,
					set	= function(v) self.db.profile.ShowPriceForSingle = v end,
				},
				pricestyle= {
					type = 'text',
					name = L["Price per item style"], aliases='ps',
					desc = L["Changes price per item style."],
					get = function() return self.db.profile.PriceStyle end,
					set = function(v) self.db.profile.PriceStyle= v end,
					validate = {short = L["short"], full = L["full"], condensed = L["condensed"]}
				},
				showbid = {
					type = 'toggle',
					name = L["Show Bid"], aliases='sb',
					desc = string.format(l["Toggles %s function."], L["Show Bid"]),
					get = function() return self.db.profile.ShowBid end,
					set = function(v) self.db.profile.ShowBid = v end
				},
  				bidstyle = {
					type = 'text',
					name = L["Bid Style"], aliases='bs',
					desc = L["Changes bid style."],
					get = function() return self.db.profile.BidStyle end,
					set = function(v) self.db.profile.BidStyle = v end,
					validate = {text = L["text"], fade = L["fade"]}
				}
			}
		}

		dwAsynCall("Blizzard_AuctionUI", "Fence_CreateBlackBookButton");
end

function mod:OnEnable()
	self:RegisterEvent("AH_LOADED")
end

function mod:OnDisable()
	if self:IsHooked("AuctionFrameBrowse_Update") then self:Unhook("AuctionFrameBrowse_Update") end
end

function mod:AH_LOADED()
	self:Hook("AuctionFrameBrowse_Update", true)
	self:UnregisterEvent("AH_LOADED")
end

local function Fence_ResetFont(frameName,money)
	local frame;
	if(money<=0)then return; end
	if ( type(frameName) == "table" ) then
		frame = frameName;
		frameName = frame:GetName();
	else
		frame = dwGetglobal(frameName);
	end
	
	local info = frame.info;
	if ( not info ) then
		message("Error moneyType not set");
	end

	-- Breakdown the money into denominations
	local gold = _G.floor(money / (COPPER_PER_SILVER * SILVER_PER_GOLD));
	local silver = _G.floor((money - (gold * COPPER_PER_SILVER * SILVER_PER_GOLD)) / COPPER_PER_SILVER);
	local copper = _G.mod(money, COPPER_PER_SILVER);

	local goldButton = dwGetglobal(frameName.."GoldButton");
	local silverButton = dwGetglobal(frameName.."SilverButton");
	local copperButton = dwGetglobal(frameName.."CopperButton");

	local iconWidth = MONEY_ICON_WIDTH;
	local spacing = MONEY_BUTTON_SPACING;
	if ( frame.small ) then
		iconWidth = MONEY_ICON_WIDTH_SMALL;
		spacing = MONEY_BUTTON_SPACING_SMALL;
	end

	-- Set values for each denomination
	--if ( ENABLE_COLORBLIND_MODE == "1" ) then
		--print(frameName);
		--print(goldButton:GetName());
		if(goldButton)then
			goldButton:SetNormalFontObject(ChatFontSmall);
		end
		if(silverButton)then
			silverButton:SetNormalFontObject(ChatFontSmall);
		end
		if(copperButton)then
			copperButton:SetNormalFontObject(ChatFontSmall);
		end
	--end
end

function mod:AuctionFrameBrowse_Update()
	self.hooks["AuctionFrameBrowse_Update"]()
	if not self.db.profile.ShowPrice and not self.db.profile.ShowBid then return end

	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list")
	if numBatchAuctions == 0 then return end

	local offset = FauxScrollFrame_GetOffset(BrowseScrollFrame)
	local index, button, itemName, moneyFrame,texture,BuyoutFrame;

	for i=1, NUM_BROWSE_TO_DISPLAY do
		index = offset + i + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameBrowse.page)

		local name, _, count, _, _, _, minBid, minIncrement, buyoutPrice, bidAmount, _, _ =  GetAuctionItemInfo("list", offset + i)
		if not name then return end


		button = "BrowseButton"..i
		itemName = dwGetglobal(button.."Name")
		--moneyFrame = dwGetglobal(button.."MoneyFrame")
		--BuyoutFrame = dwGetglobal(button.."BuyoutFrame")
		moneyFrame = _G[button.."MoneyFrame"];
		BuyoutFrame = _G[button.."BuyoutFrame"];
		moneyFrame:SetAlpha(1)
		if(BuyoutFrame.texture)then
			
			BuyoutFrame.texture:Hide();
		end
		--if((buyoutPrice-minBid)>1) and (BuyoutFrame)then
		local hgold = (COPPER_PER_SILVER * SILVER_PER_GOLD)*BLACK_GOLD;
--		print(tostring(hgold).." "..tostring(buyoutPrice-minBid).." "..tostring(hgold - (buyoutPrice-minBid)));
		Fence_ResetFont(moneyFrame,minBid);
		Fence_ResetFont(BuyoutFrame:GetName().."Money",buyoutPrice);
		if((hgold - (buyoutPrice-minBid)<1) and (BuyoutFrame))then
			
			if(BuyoutFrame.texture)then
				BuyoutFrame.texture:Show();
			else
				BuyoutFrame.texture = BuyoutFrame:CreateTexture(nil, "OVERLAY");
				
				--BuyoutFrame.texture:SetAllPoints(BuyoutFrame);
				BuyoutFrame.texture:SetWidth(175);
				BuyoutFrame.texture:SetHeight(BuyoutFrame:GetHeight());
				BuyoutFrame.texture:SetPoint("TOPLEFT",BuyoutFrame,"TOPLEFT",0,0);
				BuyoutFrame.texture:SetTexture(1,0,0,0.3);
				--BuyoutFrame.texture:SetVertexColor(1,0,0);
				BuyoutFrame.texture:Show();
			end
			--BuyoutFrame:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
			--BuyoutFrame:GetNormalTexture():SetVertexColor(1, 0, 0);
--			print(tostring(minBid).." "..tostring(buyoutPrice));
		end
		
		local sM, spMoney, bidText, bT
		
		
		if self.db.profile.ShowPrice then
			local bidPrice = bidAmount > 0 and bidAmount or minBid
			if (buyoutPrice > 0 or bidPrice > 0) and (self.db.profile.ShowPriceForSingle or count > 1) then
				local epbp = floor(bidPrice/count)
				local epbo = buyoutPrice > 0 and floor(buyoutPrice/count) or 0
				local ps = self.db.profile.PriceStyle
				if ps == "short" then
					spMoney = abc:FormatMoneyShort(epbp, true)
					sM = strlen(abc:FormatMoneyShort(epbp)) + 4

					if epbo > 0 then
						spMoney = spMoney.."/"..abc:FormatMoneyShort(epbo, true)
						sM = sM + strlen(abc:FormatMoneyShort(epbo)) + 1
					end
				elseif ps == "full" then
					spMoney = abc:FormatMoneyFull(epbp, true)
					sM = strlen(abc:FormatMoneyFull(epbp)) + 4

					if epbo > 0 then
						spMoney = spMoney.."/"..abc:FormatMoneyFull(epbo, true)
						sM = sM + strlen(abc:FormatMoneyFull(epbo)) + 1
					end
				elseif ps == "condensed" then
					spMoney = abc:FormatMoneyCondensed(epbp, true)
					sM = strlen(abc:FormatMoneyCondensed(epbp)) + 4

					if epbo > 0 then
						spMoney = spMoney.."/"..abc:FormatMoneyCondensed(epbo, true)
						sM = sM + strlen(abc:FormatMoneyCondensed(epbo)) + 1
					end
				end
				if spMoney then 
					spMoney = "\n("..spMoney..") "
					
				end
			end
		end

		if self.db.profile.ShowBid then
			if bidAmount > 0 then
				
				--if self.db.profile.BidStyle == "text" then
					
					bidText = " - |cffffff00" .. L["Bid"] .. "|r"
					bT = strlen(L["Bid"]) + 3
					moneyFrame:SetAlpha(.4)
					
					--[[
				elseif self.db.profile.BidStyle == "fade" then
				
					a = dwGetglobal(moneyFrame:GetName().."Text")
					print(a);
					--moneyFrame:SetText("abcd");
					moneyFrame:SetAlpha(.4)
				end
				--]]
			end
		end

		if not sM then
			sM = 0
			spMoney = ""
		--else
			--spMoney = spMoney
		end

		if not bT then
			bT = 0
			bidText = ""
		end
		--print(tostring(minBid).." "..tostring(buyoutPrice));
		--if((buyoutPrice-minBid)>10000000)then


		if strlen(name)+(sM+bT) > 40 then
			--print(strlen(name)..name.." "..sM.." "..bT);
			--name = strsub(name,0,(strlen(name) - (sM+bT))).."..."
			name = strsub(name,0,(strlen(name) - strlen(name)/3)).."..."
		end
		
		itemName:SetText(name..spMoney..bidText)

	end
end
