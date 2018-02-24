--[[
	linkerator.lua
		Linkerator functionality for adapted for Ludwig
		Thanks to N00bZXI for the autocomplete changes
--]]

local function onFullMatch(match)
	local list = LudwigDB:GetItemsNamedLike(match)
	if list and list[1] then
		return LudwigDB:GetItemLink(list[1])
	end
	return match
end

local function onPartialMatch(match)
	local list = LudwigDB:GetItemsNamedLike(match)
	if list and list[1] then
		return '[[' .. LudwigDB:GetItemName(list[1])
	end
	return '[[' .. match
end

local function chatFrame_OnChar(self, ...)
	local text = self:GetText()
	if text ~= '' then
		if text:match('%[%[(.+)%]$') then
			self:SetText(text:gsub('%[%[(.+)%]$', onFullMatch))
		else
			self:SetText(text:gsub('%[%[(.+)$', onPartialMatch))
			self:HighlightText(#text, -1)
		end
	end
end

local hookedFrames = {}
hooksecurefunc('ChatEdit_OnTextChanged', function(self, isUserInput)
	if not hookedFrames[self] then
		self:HookScript('OnChar', chatFrame_OnChar)
		hookedFrames[self] = true
	end
end)