TexBrowser = LibStub("AceAddon-3.0"):NewAddon("TexBrowser", "AceConsole-3.0")
local mod = TexBrowser
local AceGUI = LibStub("AceGUI-3.0")
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

function TexBrowser:OnInitialize()
	local f = AceGUI:Create("Frame")
	_G["TexBrowserFrame"] = f.frame
	tinsert(UISpecialFrames, "TexBrowserFrame")
	f:SetTitle("Texture Browser")
	f:SetStatusText("")
	f:SetLayout("Flow")
	f:SetWidth(568)
	f:SetHeight(673)
	f.width = "fill"
	
	local edit = AceGUI:Create("EditBox")
	edit:SetText("")
	edit:SetWidth(400)	
	edit:SetLabel("Search for")
	edit:SetCallback("OnEnterPressed",function(widget,event,text)
		TexBrowser:Filter(self.treeData, text)
		self.frame.tree:SetTree(self.treeData, true)
	end )
	edit:SetCallback("OnTextChanged", function(widget,event,text)
		TexBrowser:Filter(self.treeData, text)
		self.frame.tree:SetTree(self.treeData, true)
	end )
	f.editBox = edit
	f:AddChild(edit)	
	
	local t = AceGUI:Create("TreeGroup")
	t:SetLayout("Fill")
	t.width = "fill"
	t.height = "fill"
	t:SetCallback("OnGroupSelected", mod.SelectTexture )
	t:SetCallback("OnClick", self.OnTreeClick)
	f:AddChild(t)
	f.tree = t
	
	local copy = AceGUI:Create("EditBox")
	edit:SetText("")
	edit:SetWidth(200)	
	f.copyBox = copy
	f:AddChild(copy)		
	
	self.frame = f	
	self:BuildTree()
end

function mod:OnEnable()
	self.frame:Show()
end

function mod:Filter(tree, text)
	text = text:lower()
	for k, v in ipairs(tree) do
		if v.children then
			self:Filter(v.children, text)
		else
			if text == nil or text == "" then
				v.visible = nil
			elseif v.value:lower():find(text, 1, true) then
				v.visible = true
			else
				v.visible = false
			end		
		end
	end
end

local function leaf(...)
	return select(select("#", ...), ...)
end

do
	local easyMenu = {{}}
	local path
	local menuFrame = CreateFrame("Frame", "MobSpellsMenu", UIParent, "UIDropDownMenuTemplate")
	StaticPopupDialogs["TEXBROWSER_COPY"] = {
		text = "Texture path",
		button2 = TEXT(ACCEPT),
		hasEditBox = 1,
		hasWideEditBox = 1,
		showAlert = 1, -- HACK : it"s the only way I found to make de StaticPopup have sufficient width to show WideEditBox :(

		OnShow = function()
			local editBox = getglobal(this:GetName().."WideEditBox")
			editBox:SetText(path)
			editBox:SetFocus()
			editBox:HighlightText(0)
			editBox:SetMaxLetters(500)

			local button = getglobal(this:GetName().."Button2")
			button:ClearAllPoints()
			button:SetWidth(200)
			button:SetPoint("CENTER", editBox, "CENTER", 0, -30)

			getglobal(this:GetName().."AlertIcon"):Hide()  -- HACK : we hide the false AlertIcon
		end,

		OnAccept = function() end,
		EditBoxOnEscapePressed = function() this:GetParent():Hide() end,
		timeout = 0,
		whileDead = 1,
		hideOnEscape = 1
	};
	local function copyPath(self, p)
		path = p
		StaticPopup_Show ("TEXBROWSER_COPY");
	end
	function mod.OnTreeClick(widget, evt, unique, selected)
		menuFrame:Hide()
		if arg1 == "RightButton" then			-- Nasty, nasty globals hack until AceGUI passes the button
			easyMenu[1].arg1 = leaf(("\001"):split(unique))
			easyMenu[1].func = copyPath
			easyMenu[1].text = "Copy texture path"
			EasyMenu(easyMenu, menuFrame, "cursor", nil, nil, "MENU")
		end
	end
end

local backdrop = {
	bgFile = "Interface\\BUTTONS\\WHITE8X8.BLP",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	inset = 4,
	edgeSize = 8,
	tile = true,
	insets = {left = 2, right = 2, top = 2, bottom = 2}
}

local function ChangeTextureColor(self, event, ...)
	mod.previewTexture:SetVertexColor(...)
	self:SetLabel(("r=%2.2f, g=%2.2f, b=%2.2f, a=%2.2f"):format(...))
end

local function ChangeRectLabel(self, event, ...)
	mod.rectLabel:SetText(("Rect: %2.3f, %2.3f, %2.3f, %2.3f"):format(...))
	mod.clipTexture:SetTexCoord(...)
end

function mod.SelectTexture(widget, event, value)
	widget:ReleaseChildren()
	widget:SetLayout("flow")

	local last = leaf(("\001"):split(value))
	if last:match("\\") then
		mod.frame:SetStatusText(last)
		mod.frame.copyBox:SetText(last)
	else
		mod.frame:SetStatusText(value:gsub("\001", "\\"))
	end
	
	local g = AceGUI:Create("InlineGroup")
	g.width = "fill"
	g:SetLayout("flow")
	g:SetTitle("Color")
	widget:AddChild(g)
	
	local t = AceGUI:Create("ColorPicker")
	t:SetLabel("Pick color")
	t.width = "fill"
	t.height = 30
	t:SetColor(1,1,1,1)
	t:SetHasAlpha(true)
	t:SetCallback("OnValueChanged", ChangeTextureColor)
	t:SetCallback("OnValueConfirmed", ChangeTextureColor)
	g:AddChild(t)
	
	local t = AceGUI:Create("Label")
	t:SetText(("Rect: %2.3f, %2.3f, %2.3f, %2.3f"):format(0, 1, 0, 1))
	mod.rectLabel = t
	g:AddChild(t)
	
	local t = AceGUI:Create("Texture")
	t.width = "fill"
	t.height = 128
	t.frame:SetWidth(128)
	t.frame:SetHeight(128)
	mod.clipTexture = t
	if last:lower():find(".blp") then
		t:SetTexture(last)
	end
	g:AddChild(t)
	
	local t = AceGUI:Create("Texture")
	t.width = "fill"
	t.height = "fill"
	t:SetCallback("OnRectChanged", ChangeRectLabel)
	t:EnableSelect(true)
	mod.previewTexture = t

	if last:lower():find(".blp") then
		t:SetTexture(last)
	end
	widget:AddChild(t)
end

do
	local function buildNestedTree(data)
		local t = {}
		local ot = t
		for k, v in ipairs(data) do
			t = ot
			for piece in v:gmatch("([^\\]+)") do
				piece = piece:lower():trim()
				if piece:sub(#piece-3) == ".blp" then
					tinsert(t, v)
				else
					t[piece] = t[piece] or {}
					t = t[piece]
				end
			end
		end
		return ot
	end

	local _tables = {}
	local function new()
		return tremove(_tables) or {}
	end
	
	local function delete(t)
		for k, v in pairs(t) do
			t[k] = nil
		end
		for i = 1, #t do
			tremove(t)
		end
		tinsert(_tables, t)
		return nil
	end
	
	local function buildDataTree(t, data)
		local keys = new()
		for k, v in pairs(data) do
			if type(k) ~= "number" then
				tinsert(keys, tostring(k))
			end
		end
		
		table.sort(keys)
		for _, k in ipairs(keys) do
			local v = data[k]
			local entry = {text = k, value = k, children = {}}
			entry.children = {}
			buildDataTree(entry.children, v)
			tinsert(t, entry)
		end
		keys = delete(keys)
		
		table.sort(data)
		for i = 1, #data do
			local name = leaf(("\\"):split(data[i]))
			tinsert(t, {text = name, value = data[i]})
		end
		return t
	end

	function mod:BuildTree()
		local data = buildNestedTree(TexBrowserData)
		local tree = buildDataTree({}, data)
		self.treeData = tree
		self.frame.tree:SetTree(tree)
	end
end
