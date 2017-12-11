function CogsFreeBagSpace(itemID)
	local returns = {}
	returns.freeSpace = 0
	returns.specialSpace = 0
	local itemSubType = GetItemFamily(itemID)
	local stackSize = select(8, GetItemInfo(itemID))
	
	for theBag = 0,4 do
		local which, doBag = "freeSpace", true
		
		if theBag > 0 then -- 0 is always the backpack
			local bagLink = GetInventoryItemLink("player", 19 + theBag) -- Bag #1 is in inventory slot 20
			if bagLink then
				local bagSubType = GetItemFamily(bagLink)
				if bagSubType == 1 and itemSubType == 1 or
				   bagSubType == 2 and itemSubType == 2 then
					which = "specialSpace"
				elseif bagSubType ~= 1 and itemSubType ~= 1 or
					   bagSubType ~= 2 and itemSubType ~= 2 then
							if bagSubType == itemSubType then
								doBag = true
							elseif bagSubType == 0 then
								doBag = true
							else doBag = false
							end
				end
			else
				doBag = false
			end
		end
			
		if doBag then
			local numSlot = GetContainerNumSlots(theBag)
			for theSlot = 1, numSlot do
				local itemLink = GetContainerItemLink(theBag, theSlot)
				if not itemLink then
					returns[which] = returns[which] + stackSize
				elseif strfind(itemLink, "item:"..itemID..":") then
					local _,itemCount = GetContainerItemInfo(theBag, theSlot)
					returns[which] =
						returns[which] + stackSize - itemCount
				end
			end
		end
	end
	
	return returns.freeSpace, returns.specialSpace, stackSize
end