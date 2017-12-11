local lib = LibStub('LibDebugLog-1.0')
local frame = CreateFrame("Frame")
local addon = 'LibDebugLog-1.0-Persitence'
local db
local keys = {}

local function LoadStatus(event, logger, key)
	if key then
		keys[logger] = key
		logger:ToggleDebugLog(db[key])
	end
end

local function SaveStatus(event, logger, enabled)
	if keys[logger] then
		db[keys[logger]] = enabled or nil
	end
end

local function OnEvent(frame, event)
	if not _G.LibDebugLog10PersitenceDB then
		_G.LibDebugLog10PersitenceDB = {}
	end
	db = _G.LibDebugLog10PersitenceDB
	lib.RegisterCallback(addon, 'DebugLogEnabled', SaveStatus)
	lib.RegisterCallback(addon, 'DebugLogDisabled', SaveStatus)
	lib.RegisterCallback(addon, 'NewLogger', LoadStatus)
	for logger,name in lib:IterateLoggers(true) do
		LoadStatus(event, logger, name)
	end
end

frame:RegisterEvent('VARIABLES_LOADED')
frame:SetScript('OnEvent', OnEvent)
