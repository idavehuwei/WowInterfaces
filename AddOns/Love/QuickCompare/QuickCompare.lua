QuickCompare = LibStub("AceAddon-3.0"):NewAddon("QuickCompare", "AceHook-3.0");
-------------------
-- 比系统的更棒的装备比较
-------------------
local useAttribute = true;

function QuickCompare:GameTooltip_ShowCompareItem(tooltip, shift)	
	local tooltip = tooltip or GameTooltip;
	local item, link = tooltip:GetItem();
	if (IsControlKeyDown() or not link) then
		return;
	end
	
	-- 以下Frame时忽略
	local frame = GetMouseFocus() and GetMouseFocus():GetName() or "";	
	if strfind(frame,"^Character.*Slot$")		-- 装备栏忽略
		or strfind(frame,"^TempEnchant%d+$")	-- 临时魔法忽略
		or strfind(frame, "^TM_Button")			-- 饰品栏忽略
		or strfind(frame, "^TrinketMenu")		-- 饰品栏忽略
	then return end
	--correct anchor if tooltip is in right half of screen
	local anchor, align="TOPLEFT", "TOPRIGHT";
	local scale = tooltip:GetScale();
	local escale = tooltip:GetEffectiveScale();

	
	local item1 = nil;
	local item2 = nil;
	local shoptip1 = dwGetglobal("ShoppingTooltip"..1);
	local shoptip2 = dwGetglobal("ShoppingTooltip"..2);
	if (shoptip1:SetHyperlinkCompareItem(link, 1, shift, tooltip) ) then
		item1 = true;
	end
	if ( shoptip2:SetHyperlinkCompareItem(link, 2, shift, tooltip) ) then
		item2 = true;
	end

	-- find correct side
	local rightDist = 0;
	local leftPos = tooltip:GetLeft();
	local rightPos = tooltip:GetRight();
	if ( not rightPos ) then
		rightPos = 0;
	end
	if ( not leftPos ) then
		leftPos = 0;
	end

	rightDist = GetScreenWidth() - rightPos;
	leftDist = leftPos;

	if (leftPos and (rightDist < leftPos)) then		
		anchor, align = "TOPRIGHT", "TOPLEFT";
	end

	local totalWidth = 0;
	if ( item1  ) then
		totalWidth = totalWidth + shoptip1:GetWidth();
	end
	if ( item2  ) then
		totalWidth = totalWidth + shoptip2:GetWidth();
	end

	local offsetx, offsety = GetCursorPosition();
	local realRightPos = rightPos * escale;
	local realLeftPos = leftPos * escale;

	if (anchor == "TOPLEFT" and offsetx > realRightPos) then
		anchor, align = "TOPRIGHT", "TOPLEFT";
	elseif (anchor == "TOPRIGHT" and offsetx < realLeftPos) then
		anchor, align = "TOPLEFT", "TOPRIGHT";
	end

	if (anchor == "TOPRIGHT" and totalWidth > leftPos * escale) then
		anchor, align = "TOPLEFT", "TOPRIGHT";
	elseif (anchor == "TOPLEFT" and (rightPos * escale + totalWidth) >  GetScreenWidth() * escale) then
		anchor, align = "TOPRIGHT", "TOPLEFT";
	end

	-- see if we should slide the tooltip
	if ( tooltip:GetAnchorType() ) then
		if ( (anchor == "TOPRIGHT") and (totalWidth > leftPos) ) then
			tooltip:SetAnchorType(tooltip:GetAnchorType(), (totalWidth - leftPos), 0);
		elseif ( (anchor == "TOPLEFT") and (rightPos + totalWidth) >  GetScreenWidth() ) then
			tooltip:SetAnchorType(tooltip:GetAnchorType(), -((rightPos + totalWidth) - GetScreenWidth()), 0);
		end
	end
	
	local anchorframe = tooltip;
	local dy = 0;

	for i=1, 2 do			
		local shoptip = dwGetglobal("ShoppingTooltip"..i);
		
		if (shoptip:SetHyperlinkCompareItem(link, i, shift, tooltip)) then			
			shoptip:SetOwner(tooltip, "ANCHOR_NONE");	
			if (useAttribute) then
				shoptip:SetHyperlinkCompareItem(link, i, shift, tooltip);
			else
				shoptip:SetHyperlinkCompareItem(link, i, shift);
			end
			
			shoptip:ClearAllPoints();

			local shoptiptext = dwGetglobal(shoptip:GetName().."TextLeft1");			
			local newtext = "|cffE0E0E0["..CURRENTLY_EQUIPPED.. "]|r";
			shoptiptext:SetText("|cffE0E0E0["..CURRENTLY_EQUIPPED.. "]|r");			

			local bottom, top=shoptip:GetBottom(), shoptip:GetTop();
			local uibottom, uitop=UIParent:GetBottom(),UIParent:GetTop();
			if (bottom and bottom*scale-10<=uibottom) then				
				dy = uibottom-bottom+(10*scale);			
			end
	
			shoptip:SetPoint(anchor, anchorframe, align, 0, dy);
			shoptip:SetScale(scale);
			shoptip:Show(); 

			--last comparison tooltip becomes anchorframe for next comparison tooltip
			anchorframe = shoptip;
			dy = 0;
		end
	end
end

function QuickCompare:Toggle(switch)	
	if (switch) then
		self:SecureHook("GameTooltip_ShowCompareItem");	
		self:SecureHookScript(GameTooltip, "OnTooltipSetItem", "GameTooltip_ShowCompareItem");
	
		dwGetglobal("ShoppingTooltip1"):SetBackdropColor(0.3,0.3,0.0);
		dwGetglobal("ShoppingTooltip2"):SetBackdropColor(0.3,0.3,0.0);	
	else		
		self:Unhook(GameTooltip, "OnTooltipSetItem");
		self:Unhook("GameTooltip_ShowCompareItem");
	end	
end


function QuickCompare:ToggleAttri(switch)
	if (switch) then
		useAttribute = true;
	else
		useAttribute = false;
	end
end