--[[
	slash.lua
		Slash command handler for Ludwig

	ludwig slash commands:
		/lw or /ludwig
			toggles the GUI
		/lw <name>
			prints a list of items matching <name>
		/lw --q <itemID>
			queries the game for and displays the link of <itemID>
		/lw --r
			forces a database refresh
--]]

--constants!
local L = _G['LUDWIG_LOCALS']
local MAX_RESULTS = 10

--[[
	Slash Command Actions
--]]

--display all items matching <name> in the chat window
local function listItemsMatching(name)
	local startTime = GetTime()
	LudwigDB:Refresh()

	local results = LudwigDB:GetItems(name)
	if #results > 0 then
		--print title
		print(format(L.NumMatching, #results, name))

		--list result
		for i = 1, math.min(#results, MAX_RESULTS) do
			print(' - ' .. LudwigDB:GetItemLink(results[i]))
		end

		--print the time it took to generate the set
		print(format(L.GenTime, GetTime() - startTime))
	else
		--print
		print(format(L.NoMatchingItems, name))
	end
end

--refresh the item database
local function refreshDB()
	LudwigDB:Refresh()
	print(L.DBRefreshed)
end

--query and display an item that matches <id>
local function queryItem(id)
	SetItemRef(format('item:%d', tonumber(id)))
end

--toggle the ludwig frame
local function toggleGUI()
	local frame = _G['LudwigFrame']
	if frame then
		if frame:IsShown() then
			HideUIPanel(frame)
		else
			ShowUIPanel(frame)
		end
	end
end


--[[
	Slash Command Setup
--]]

SlashCmdList['LudwigSlashCOMMAND'] = function(msg)
	if not msg or msg == '' then
		toggleGUI()
	else
		local cmd = msg:lower():match('%-%-([%w%s]+)')
		if cmd then
			if cmd == 'r' then
				refreshDB()
			elseif cmd:match('q %d+') then
				queryItem(cmd:match('q (%d+)'))
			else
				print(format(L.UnknownCommand, cmd))
			end
		else
			listItemsMatching(msg)
		end
	end
end
SLASH_LudwigSlashCOMMAND1 = '/lw'
SLASH_LudwigSlashCOMMAND2 = '/ludwig'