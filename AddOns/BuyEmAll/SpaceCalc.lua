-- Replacement to Cog's bag space calculation, hand written by Shinisuryu. ( Yes, I'm sure it looks horrible to some of you coders. xD )

function SepSpaceCalc(BagID,ItemID)
	local ItemGroup = GetItemFamily(ItemID)
	local BagName = GetBagName(BagID)
	if ItemGroup == GetItemFamily(BagName) or GetItemFamily(BagName) == 0 then
		local ItemSlotCanFit = ( select(1,GetContainerNumFreeSlots(BagID)) * select(8,GetItemInfo(ItemID)) )
		return ItemSlotCanFit
	end
end

function GetBagNum()
	local NumBag = 0
	local Bag1ID = GetInventorySlotInfo("Bag0Slot")
	local Bag2ID = GetInventorySlotInfo("Bag1Slot")
	local Bag3ID = GetInventorySlotInfo("Bag2Slot")
	local Bag4ID = GetInventorySlotInfo("Bag3Slot")
	if GetInventoryItemCount("player", Bag1ID) ~= 1 then NumBag = ( NumBag + 1 )
	if GetInventoryItemCount("player", Bag2ID) ~= 1 then NumBag = ( NumBag + 1 )
	if GetInventoryItemCount("player", Bag3ID) ~= 1 then NumBag = ( NumBag + 1 )
	if GetInventoryItemCount("player", Bag4ID) ~= 1 then NumBag = ( NumBag + 1 )
	end
	end
	end
	end
	return NumBag
end

function ItemSpaceCalc(ItemID)
	local ItemGroup = GetItemFamily(ItemID)
	local StackSize = select(8,GetItemInfo(ItemID))
	local TotalItemSpace = 0
	local TotalAmmoSpace = 0
	local BackpackItemSpace = 0
	local NumBags = GetBagNum()
	if ItemGroup ~= 1 or ItemGroup ~= 2 then
		BackpackItemSpace = ( GetContainerNumFreeSlots(0) * select(8,GetItemInfo(ItemID)) )
	end
	for BagID = 1, NumBags do
		local BagName = GetBagName(BagID)
		if GetItemFamily(BagName) == 1 and ItemGroup == 1 or GetItemFamily(BagName) == 2 and ItemGroup == 2 then
			TotalAmmoSpace = ( TotalAmmoSpace + SepSpaceCalc(BagID,ItemID) )
			-- DEFAULT_CHAT_FRAME:AddMessage("TotalAmmoSpace: " .. TotalAmmoSpace .. ".");
		elseif ItemGroup == GetItemFamily(BagName) and ItemGroup ~= 1 and ItemGroup ~= 2 or GetItemFamily(BagName) == 0 and ItemGroup ~= 1 and ItemGroup ~= 2 then
			TotalItemSpace = ( TotalItemSpace + SepSpaceCalc(BagID,ItemID) )
			-- DEFAULT_CHAT_FRAME:AddMessage("TotalItemSpace: " .. TotalItemSpace .. ".");
		end
	end
	TotalItemSpace = ( TotalItemSpace + BackpackItemSpace )
	return TotalItemSpace, TotalAmmoSpace, StackSize
end