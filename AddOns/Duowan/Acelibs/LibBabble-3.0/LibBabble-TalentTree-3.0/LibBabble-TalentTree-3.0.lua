--[[
Name: LibBabble-TalentTree-3.0
Revision: $Rev: 11 $
Author(s): Pneumatus
Documentation: http://www.wowace.com/wiki/LibBabble-TalentTree-3.0
SVN: http://svn.wowace.com/wowace/trunk/LibBabble-TalentTree-3.0
Dependencies: None
License: MIT
]]

local MAJOR_VERSION = "LibBabble-TalentTree-3.0"
local MINOR_VERSION = 90000 + tonumber(("$Revision: 11 $"):match("%d+"))

-- #AUTODOC_NAMESPACE prototype

local GAME_LOCALE = GetLocale()
do
	-- LibBabble-Core-3.0 is hereby placed in the Public Domain
	-- Credits: ckknight
	local LIBBABBLE_MAJOR, LIBBABBLE_MINOR = "LibBabble-3.0", 2

	local LibBabble = LibStub:NewLibrary(LIBBABBLE_MAJOR, LIBBABBLE_MINOR)
	if LibBabble then
		local data = LibBabble.data or {}
		for k,v in pairs(LibBabble) do
			LibBabble[k] = nil
		end
		LibBabble.data = data

		local tablesToDB = {}
		for namespace, db in pairs(data) do
			for k,v in pairs(db) do
				tablesToDB[v] = db
			end
		end
		
		local function warn(message)
			local _, ret = pcall(error, message, 3)
			geterrorhandler()(ret)
		end

		local lookup_mt = { __index = function(self, key)
			local db = tablesToDB[self]
			local current_key = db.current[key]
			if current_key then
				self[key] = current_key
				return current_key
			end
			local base_key = db.base[key]
			local real_MAJOR_VERSION
			for k,v in pairs(data) do
				if v == db then
					real_MAJOR_VERSION = k
					break
				end
			end
			if not real_MAJOR_VERSION then
				real_MAJOR_VERSION = LIBBABBLE_MAJOR
			end
			if base_key then
				warn(("%s: Translation %q not found for locale %q"):format(real_MAJOR_VERSION, key, GAME_LOCALE))
				rawset(self, key, base_key)
				return base_key
			end
			warn(("%s: Translation %q not found."):format(real_MAJOR_VERSION, key))
			rawset(self, key, key)
			return key
		end }

		local function initLookup(module, lookup)
			local db = tablesToDB[module]
			for k in pairs(lookup) do
				lookup[k] = nil
			end
			setmetatable(lookup, lookup_mt)
			tablesToDB[lookup] = db
			db.lookup = lookup
			return lookup
		end

		local function initReverse(module, reverse)
			local db = tablesToDB[module]
			for k in pairs(reverse) do
				reverse[k] = nil
			end
			for k,v in pairs(db.current) do
				reverse[v] = k
			end
			tablesToDB[reverse] = db
			db.reverse = reverse
			db.reverseIterators = nil
			return reverse
		end

		local prototype = {}
		local prototype_mt = {__index = prototype}

		--[[---------------------------------------------------------------------------
		Notes:
			* If you try to access a nonexistent key, it will warn but allow the code to pass through.
		Returns:
			A lookup table for english to localized words.
		Example:
			local B = LibStub("LibBabble-Module-3.0") -- where Module is what you want.
			local BL = B:GetLookupTable()
			assert(BL["Some english word"] == "Some localized word")
			DoSomething(BL["Some english word that doesn't exist"]) -- warning!
		-----------------------------------------------------------------------------]]
		function prototype:GetLookupTable()
			local db = tablesToDB[self]

			local lookup = db.lookup
			if lookup then
				return lookup
			end
			return initLookup(self, {})
		end
		--[[---------------------------------------------------------------------------
		Notes:
			* If you try to access a nonexistent key, it will return nil.
		Returns:
			A lookup table for english to localized words.
		Example:
			local B = LibStub("LibBabble-Module-3.0") -- where Module is what you want.
			local B_has = B:GetUnstrictLookupTable()
			assert(B_has["Some english word"] == "Some localized word")
			assert(B_has["Some english word that doesn't exist"] == nil)
		-----------------------------------------------------------------------------]]
		function prototype:GetUnstrictLookupTable()
			local db = tablesToDB[self]

			return db.current
		end
		--[[---------------------------------------------------------------------------
		Notes:
			* If you try to access a nonexistent key, it will return nil.
			* This is useful for checking if the base (English) table has a key, even if the localized one does not have it registered.
		Returns:
			A lookup table for english to localized words.
		Example:
			local B = LibStub("LibBabble-Module-3.0") -- where Module is what you want.
			local B_hasBase = B:GetBaseLookupTable()
			assert(B_hasBase["Some english word"] == "Some english word")
			assert(B_hasBase["Some english word that doesn't exist"] == nil)
		-----------------------------------------------------------------------------]]
		function prototype:GetBaseLookupTable()
			local db = tablesToDB[self]

			return db.base
		end
		--[[---------------------------------------------------------------------------
		Notes:
			* If you try to access a nonexistent key, it will return nil.
			* This will return only one English word that it maps to, if there are more than one to check, see :GetReverseIterator("word")
		Returns:
			A lookup table for localized to english words.
		Example:
			local B = LibStub("LibBabble-Module-3.0") -- where Module is what you want.
			local BR = B:GetReverseLookupTable()
			assert(BR["Some localized word"] == "Some english word")
			assert(BR["Some localized word that doesn't exist"] == nil)
		-----------------------------------------------------------------------------]]
		function prototype:GetReverseLookupTable()
			local db = tablesToDB[self]

			local reverse = db.reverse
			if reverse then
				return reverse
			end
			return initReverse(self, {})
		end
		local blank = {}
		local weakVal = {__mode='v'}
		--[[---------------------------------------------------------------------------
		Arguments:
			string - the localized word to chek for.
		Returns:
			An iterator to traverse all English words that map to the given key
		Example:
			local B = LibStub("LibBabble-Module-3.0") -- where Module is what you want.
			for word in B:GetReverseIterator("Some localized word") do
				DoSomething(word)
			end
		-----------------------------------------------------------------------------]]
		function prototype:GetReverseIterator(key)
			local db = tablesToDB[self]
			local reverseIterators = db.reverseIterators
			if not reverseIterators then
				reverseIterators = setmetatable({}, weakVal)
				db.reverseIterators = reverseIterators
			elseif reverseIterators[key] then
				return pairs(reverseIterators[key])
			end
			local t
			for k,v in pairs(db.current) do
				if v == key then
					if not t then
						t = {}
					end
					t[k] = true
				end
			end
			reverseIterators[key] = t or blank
			return pairs(reverseIterators[key])
		end
		--[[---------------------------------------------------------------------------
		Returns:
			An iterator to traverse all translations English to localized.
		Example:
			local B = LibStub("LibBabble-Module-3.0") -- where Module is what you want.
			for english, localized in B:Iterate() do
				DoSomething(english, localized)
			end
		-----------------------------------------------------------------------------]]
		function prototype:Iterate()
			local db = tablesToDB[self]

			return pairs(db.current)
		end

		-- #NODOC
		-- modules need to call this to set the base table
		function prototype:SetBaseTranslations(base)
			local db = tablesToDB[self]
			local oldBase = db.base
			if oldBase then
				for k in pairs(oldBase) do
					oldBase[k] = nil
				end
				for k, v in pairs(base) do
					oldBase[k] = v
				end
				base = oldBase
			else
				db.base = base
			end
			for k,v in pairs(base) do
				if v == true then
					base[k] = k
				end
			end
		end

		local function init(module)
			local db = tablesToDB[module]
			if db.lookup then
				initLookup(module, db.lookup)
			end
			if db.reverse then
				initReverse(module, db.reverse)
			end
			db.reverseIterators = nil
		end

		-- #NODOC
		-- modules need to call this to set the current table. if current is true, use the base table.
		function prototype:SetCurrentTranslations(current)
			local db = tablesToDB[self]
			if current == true then
				db.current = db.base
			else
				local oldCurrent = db.current
				if oldCurrent then
					for k in pairs(oldCurrent) do
						oldCurrent[k] = nil
					end
					for k, v in pairs(current) do
						oldCurrent[k] = v
					end
					current = oldCurrent
				else
					db.current = current
				end
			end
			init(self)
		end

		for namespace, db in pairs(data) do
			setmetatable(db.module, prototype_mt)
			init(db.module)
		end

		-- #NODOC
		-- modules need to call this to create a new namespace.
		function LibBabble:New(namespace, minor)
			local module, oldminor = LibStub:NewLibrary(namespace, minor)
			if not module then
				return
			end

			if not oldminor then
				local db = {
					module = module,
				}
				data[namespace] = db
				tablesToDB[module] = db
			else
				for k,v in pairs(module) do
					module[k] = nil
				end
			end

			setmetatable(module, prototype_mt)

			return module
		end
	end
end

local lib = LibStub("LibBabble-3.0"):New(MAJOR_VERSION, MINOR_VERSION)
if not lib then
	return
end

lib:SetBaseTranslations {
	-- All classes
	["Hybrid"] = true,
	-- Death Knight
	["Blood"] = true,
	["Frost"] = true,
	["Unholy"] = true,
	-- Druid
	["Balance"] = true,
	["Feral Combat"] = true,
	["Restoration"] = true,
	-- Hunter
	["Beast Mastery"] = true,
	["Marksmanship"] = true,
	["Survival"] = true,
	-- Mage
	["Arcane"] = true,
	["Fire"] = true,
	["Frost"] = true,
	-- Paladin
	["Holy"] = true,
	["Protection"] = true,
	["Retribution"] = true,
	-- Priest
	["Discipline"] = true,
	-- ["Holy"] = true, -- same as Paladin
	["Shadow"] = true,
	-- Rogue
	["Assassination"] = true,
	["Combat"] = true,
	["Subtlety"] = true,
	-- Shaman
	["Elemental"] = true,
	["Enhancement"] = true,
	-- ["Restoration"] = true, -- same as Druid
	-- Warrior
	["Arms"] = true,
	["Fury"] = true,
	-- ["Protection"] = true, -- same as Paladin
	-- Warlock
	["Affliction"] = true,
	["Demonology"] = true,
	["Destruction"] = true
}

if GAME_LOCALE == "enUS" then
	lib:SetCurrentTranslations(true)
elseif GAME_LOCALE == "zhTW" then
	lib:SetCurrentTranslations {
	-- All classes
	["Hybrid"] = "混合",
	-- Death Knight
	["Blood"] = "血魄", -- Needs translation
	["Frost"] = "冰霜", -- Needs translation
	["Unholy"] = "秽邪", -- Needs translation
	-- Druid
	["Balance"] = "平衡",
	["Feral Combat"] = "野性戰鬥",
	["Restoration"] = "恢復",
	-- Hunter
	["Beast Mastery"] = "野獸控制",
	["Marksmanship"] = "射擊",
	["Survival"] = "生存",
	-- Mage
	["Arcane"] = "秘法",
	["Fire"] = "火焰",
	["Frost"] = "冰霜",
	-- Paladin
	["Holy"] = "神聖",
	["Protection"] = "防護",
	["Retribution"] = "懲戒",
	-- Priest
	["Discipline"] = "戒律",
	-- ["Holy"] = "神聖", -- same as Paladin
	["Shadow"] = "暗影",
	-- Rogue
	["Assassination"] = "刺殺",
	["Combat"] = "戰鬥",
	["Subtlety"] = "敏銳",
	-- Shaman
	["Elemental"] = "元素",
	["Enhancement"] = "增強",
	-- ["Restoration"] = "恢復", -- same as Druid
	-- Warrior
	["Arms"] = "武器",
	["Fury"] = "狂怒",
	-- ["Protection"] = "防護", -- same as Paladin
	-- Warlock
	["Affliction"] = "痛苦",
	["Demonology"] = "惡魔學識",
	["Destruction"] = "毀滅"
}
elseif GAME_LOCALE == "zhCN" then
	lib:SetCurrentTranslations {
	-- All classes
	["Hybrid"] = "混合",
	-- Death Knight
	["Blood"] = "鲜血", -- Needs translation
	["Frost"] = "冰霜", -- Needs translation
	["Unholy"] = "邪恶", -- Needs translation
	-- Druid
	["Balance"] = "平衡",
	["Feral Combat"] = "野性战斗",
	["Restoration"] = "恢复",
	-- Hunter
	["Beast Mastery"] = "野兽控制",
	["Marksmanship"] = "射击",
	["Survival"] = "生存技能",
	-- Mage
	["Arcane"] = "奥术",
	["Fire"] = "火焰",
	["Frost"] = "冰霜",
	-- Paladin
	["Holy"] = "神圣",
	["Protection"] = "防护",
	["Retribution"] = "惩戒",
	-- Priest
	["Discipline"] = "戒律",
	-- ["Holy"] = "神圣", -- same as Paladin
	["Shadow"] = "暗影魔法",
	-- Rogue
	["Assassination"] = "刺杀",
	["Combat"] = "战斗",
	["Subtlety"] = "敏锐",
	-- Shaman
	["Elemental"] = "元素战斗",
	["Enhancement"] = "增强",
	-- ["Restoration"] = "恢复", -- same as Druid
	-- Warrior
	["Arms"] = "武器",
	["Fury"] = "狂怒",
	-- ["Protection"] = "防护", -- same as Paladin
	-- Warlock
	["Affliction"] = "痛苦",
	["Demonology"] = "恶魔学识",
	["Destruction"] = "毁灭"
}
else
	error(("%s: Locale %q not supported"):format(MAJOR_VERSION, GAME_LOCALE))
end
