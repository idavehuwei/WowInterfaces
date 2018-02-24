--[[
	database.lua
		The database portion Of Ludwig
--]]

local ItemDB = {}
LudwigDB = ItemDB


--[[ Constants! ]]--

ItemDB.MAX_ID = 60000 --the maximum number of itemIDs to look through


--[[ Utility Functions ]]--

--returns the difference between two strings, where one is known to be within the other.
local function getDistance(str1, str2)
	--a few optimizations for when we already know distance
	if str1 == str2 then
		return 0
	end

	if not str1 then
		return #str2
	end

	if not str2 then
		return #str1
	end

	return abs(#str1 - #str2)
end

--formats a string for use as a search pattern
local function toSearchStr(name)
	return name:gsub('%p', '%%%1')
end


--[[ Sorting Methods ]]--

--sorts a list by rarity, either closeness to the searchString if there's been a search, then level, then name
local function sortByEverything(id1, id2)
	local item1 = ItemDB:GetItemInfo(id1)
	local item2 = ItemDB:GetItemInfo(id2)
	local name1 = item1.search
	local name2 = item2.search
	local rarity1 = item1[3]
	local rarity2 = item2[3]
	local level1 = item1[4]
	local level2 = item2[4]

	if rarity1 ~= rarity2 then
		return rarity1 > rarity2
	end

	local lastSearch = ItemDB.lastSearchString
	if lastSearch then
		local dist1 = getDistance(lastSearch, name1)
		local dist2 = getDistance(lastSearch, name2)
		if dist1 ~= dist2 then
			return dist1 < dist2
		end
	end

	if level1 ~= level2 then
		return level1 > level2
	end

	return name1 < name2
end

--sort by distance to the searchTerm
local function sortByDistance(id1, id2)
	local lastSearch = ItemDB.lastSearchString
	local item1 = ItemDB:GetItemInfo(id1)
	local item2 = ItemDB:GetItemInfo(id2)

	return getDistance(lastSearch, item1.search) < getDistance(lastSearch, item2.search)
end

--[[
	DB Setup/cleanup
--]]

do
	local itemInfo
	local GetItemInfo = _G['GetItemInfo']

	--get item information
	--if we have a result, save in t[id] and return t[id]
	local function getAndSaveItemInfo(t, id)
		local result
		local name, link, rarity, iLevel, reqLevel, type, subType, stackCount, equipLoc, texture = GetItemInfo(id)
		if name then
			result = {
				name,
				link,
				rarity,
				iLevel,
				reqLevel,
				type,
				subType,
				stackCount,
				equipLoc,
				texture,
				['search'] = name:lower()
			}
		end

		t[id] = result
		return result
	end

	local function getItemInfoTable()
		return setmetatable({}, {__index = getAndSaveItemInfo})
	end

	--refresh the database
	--this is done via looking up each itemID in itemInfo to force a query
	function ItemDB:Refresh()
		if itemInfo then
			for id = 1, self.MAX_ID do
				local k = itemInfo[id]
			end
		end
	end

	--returns an iterator over all data in itemInfo
	--creates and loads itemInfo if it does not exist yet
	function ItemDB:GetAllItems()
		if not itemInfo then
			itemInfo = getItemInfoTable()
			self:Refresh()
		end

		return pairs(itemInfo)
	end

	--returns a table filled with the returns of GetItemInfo(id) if we have information about an item
	--returns nil if we do not
	--creates and loads itemInfo if it does not exist yet
	function ItemDB:GetItemInfo(id)
		if not itemInfo then
			itemInfo = getItemInfoTable()
			self:Refresh()
		end
		return itemInfo[id]
	end
end


--[[
	Query Methods
--]]

--get all items matching the given filter pattern
do
	local results = {}
	function ItemDB:GetItems(name, quality, type, subType, equipLoc, minLevel, maxLevel)
		for k, v in pairs(results) do results[k] = nil end

		--get search string based on name
		local search
		if name and #name > 2 then
			name = name:lower()
			search = toSearchStr(name)
		else
			search = nil
		end
		self.lastSearchStr = name

		for id, item in self:GetAllItems() do
			if self:ItemInSet(item, search, name, quality, type, subType, equipLoc, minLevel, maxLevel) then
				table.insert(results, id)
			end
		end
		table.sort(results, sortByEverything)
		return results
	end

	--returns true if the given item matches all defined filter rules, and false otherwise
	function ItemDB:ItemInSet(item, search, name, quality, type, subType, equipLoc, minLevel, maxLevel)
		if quality and item[3] ~= quality then
			return false
		end

		if minLevel and item[5] < minLevel then
			return false
		end

		if maxLevel and item[5] > maxLevel then
			return false
		end

		if type and item[6] ~= type then
			return false
		end

		if subType and item[7] ~= subType then
			return false
		end

		if equipLoc and item[9] ~= equipLoc then
			return false
		end

		if search and not(item.search == name or item.search:match(search))then
			return false
		end

		return true
	end
end

--returns all items that have names that start with <name>
--used for linkerator support
do
	local results = {}
	function ItemDB:GetItemsNamedLike(name, maxResults)
		for k, v in pairs(results) do results[k] = nil end

		--no matches in the case of no name being passed/an empty string
		if not(name) or name == '' then
			self.lastSearch = nil
			return results
		end

		local name = name:lower()
		self.lastSearchStr = name

		local search = '^' .. toSearchStr(name) --we're looking for items that have names that start with the search pattern
		for id, item in self:GetAllItems() do
			if item.search:match(search) then
				table.insert(results, id)
			end
		end

		table.sort(results, sortByDistance)
		return results
	end
end


--[[
	Utility Accessors
--]]

function ItemDB:GetItemName(id, inColor)
	local info = self:GetItemInfo(id)
	local name = info and info[1]

	if name and inColor then
		local rarity = info[3]
		local hex = (select(4, GetItemQualityColor(rarity)))
		return format('%s%s|r', hex, name)
	end
	return name
end

function ItemDB:GetItemLink(id)
	local info = self:GetItemInfo(id)
	return info and info[2]
end

function ItemDB:GetItemTexture(id)
	local info = self:GetItemInfo(id)
	return info and info[10]
end