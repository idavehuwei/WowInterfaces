--=====================================
-- 名称: ConfigFrame
-- 日期: 2009-12-16
-- 版本: 1.0.0
--	描述: 多玩配置面板
-- 作者: dugu
-- 版权所有 (C) duowan.com
--======================================
local L = DUOWAN_LOCALIZATION;
DuowanConfiguration = {};	-- 插件配置信息
DuowanMod = {};		-- 插件模块信息
DUOWAN_CONFIGBUTTONCOUNT = 12;
DUOWAN_SPINBOX_LIST = "list";
DUOWAN_SPINBOX_RANGE = "range";
local INIT_ADDON_CHECKS=3;
local dwCurentPage = 1;
local btnIndex, checkIndex, spinIndex = 1, 1, 1;
local buttonNum, checkNum;
local dwMaxPage = 1;	 -- TODO: 打开时计算
local dwCurentMod = nil;	-- 当前模块
local TabIndex = {};
local curCategory = "";	-- 类别分为 "NORMAL" 和 "RAID" 两类
local PageInfo = {};
local Duowan_Categroys = {};
--Duowan_Categroys["NORMAL"] = {};
--Duowan_Categroys["RAID"] = {};

-- 修正字体问题
local LoadOnDemandAddOns = {
	["Gladius"] ="ArenaMod",
	["HunterMod"] ="ClassModule",
	["TotemTimers"] ="ClassModule",
	["dct"] ="dct",
	["DoTimer"] ="DoTimer",
	["Postal"] ="MAILMOD",
	["SexyMap"] ="MiniMapMod",
	["QuestInfo"] ="QuestMod",
	["DBM-Core"] = "DBMMod",
	["AVRE"] = "DBMMod",
	["CastYeller"] ="CastYellerMod",
	["CCBreaker"] ="CCBreakerMod",
	["Clique"] ="CliqueMod",
	["Decursive"] ="DecursiveMod",
	["Grid"] ="GridMod",
	["Omen"] ="OmenMod",
	["OptiTaunt"] ="OptiTauntMod",
	["oRA3"] ="oRA3Mod",
	["Recount"] ="RecountMod",	
	["RaidAlerter"] ="RaidAlerterMod",	
	["RangeDisplay"] ="RangeDisplayHistry",
	["TheBurningTrade"] ="TheBurningTrade",
	["Titan"] ="Titan",
	["TradeskillInfo"] ="TradeSkillMod",
	["Cartographer"] ="WorldMapMod",
	["InstanceMaps"] ="WorldMapMod",
	["AtlasLoot"] = "AtlasLootMod",
	["GatherMate"] = "GatherMateModule",
	["TrinketMenu"] = "TRINKETHISTRY",
	["DWGKPMOD"] = "DWGKP",
};
--[[
DuowanMod = {
		[1] = {
			["module'] = module,
			["name"] = "addon name",
			["subname"] = "addon sub name",
			["tooltip"] = "tooltip text",
			["texture"] = "texture path",
			["custom"] = frame,					-- 自定义frame, 特别复杂时使用
		},
		...
};

DuowanConfiguration = {
	["mode"] = {
		-- no.1 控件
		[1] = {
			["type"] = "CHECKBUTON",						-- 注册控件类型
			["caption"] = "text",								-- 显示的文字			
			["callback"] = fun,									-- 回调函数
			["tooltip"] = "addon tooltip infomation",	-- 鼠标提示信息
			["variable"] = variable,							-- 变量
			["default"] = default variable value,			-- 变量缺省值
			["indent"] = indent or 0,							-- 层数
		},
	},
	...
};
]]

function Print(msg)
	ChatFrame1:AddMessage(msg);
end
--[-[==========================================
-- 注册模块和选项, 可以自行添加控件
--

local function isModRegistered(module)	
	for k, v in pairs(DuowanMod) do		
		if (type(v.module) == "string" and type(module) == "string" and string.lower(v.module) == string.lower(module)) then
			return k;
		end
	end
	return false;
end

local function GetModInfoByMod(module)
	for i, m in ipairs(DuowanMod) do
		if (m and m["module"] == module) then
			return m;
		end
	end
	return nil;
end

local function isButtonRegistered(variable)	
	for k, v in pairs(DuowanMod) do		
		if (type(v.mode) == "string" and type(mode) == "string" and string.lower(v.mode) == string.lower(mode)) then
			return k;
		end
	end
	return false;
end

-- 注册模块
function dwRegisterMod(module, name, subname, tooltip, texture, custom, category)
	local tmp = {};
	
	tmp.module = module;
	tmp.name = name;				-- 中文名字
	tmp.subname = subname;		-- 英文名字 或者 拼音
	tmp.tooltip = tooltip;				-- 鼠标提示(建议为nil)
	tmp.texture = texture;
	tmp.custom = custom or nil;	-- 自定义配置板面, 缺省为nil
	tmp.category = category or "NORMAL";	-- 增加种类信息
	if (not isModRegistered(module)) then
		table.insert(DuowanMod, tmp);		
	end
end

-- 注册勾选框
function dwRegisterCheckButton(module, caption, tooltip, variable, default, callback, indent)
	assert(isModRegistered(module));
	assert(variable and type(variable) == "string", format("variable got a %s value", type(variable)))

	local tmp = {};	
	tmp.type = "CHECKBUTTON";
	tmp.caption = caption;
	tmp.tooltip = tooltip;				-- 该项最好为nil
	tmp.callback = callback;
	tmp.variable = variable;
	tmp.default = default;
	tmp.indent = indent or 0;
	
	if (not DuowanConfiguration[module]) then
		DuowanConfiguration[module] = {};
	end

	table.insert(DuowanConfiguration[module], tmp);
end

-- 注册按键
function dwRegisterButton(module, caption, callback, indent)
	assert(isModRegistered(module));

	local tmp = {};	
	tmp.type = "BUTTON";
	tmp.caption = caption;	
	tmp.callback = callback;	
	tmp.indent = indent or 0;
	
	if (not DuowanConfiguration[module]) then
		DuowanConfiguration[module] = {};
	end

	table.insert(DuowanConfiguration[module], tmp);
end
-- 注册SpinBox
function dwRegisterSpinBox(module, caption, subType, variable, data, default, callback, indent)
	assert(isModRegistered(module));
	assert(variable and type(variable) == "string", format("variable got a %s value", type(variable)))

	local tmp = {};	
	tmp.type = "SPINBOX";
	tmp.subtype = subType or DUOWAN_SPINBOX_LIST;
	tmp.caption = caption;	
	tmp.variable = variable;
	tmp.data = data;
	tmp.default = default;
	tmp.callback = callback;	
	tmp.indent = indent or 0;
	
	if (not DuowanConfiguration[module]) then
		DuowanConfiguration[module] = {};
	end

	table.insert(DuowanConfiguration[module], tmp);
end

function dwCleanCustom()
	local index = isModRegistered(dwCurentMod);
	if (DuowanMod[index]) then
		local custom = DuowanMod[index].custom;
		if (custom and type(custom) == "table") then
			local frame = (type(custom.frame) == "string") and _G[custom.frame] or custom.frame;		
			frame:Hide();
		end
	end
end

-- 显示选定模块的配置界面
function dwShowMod(module)
	local index = isModRegistered(module);
	local custom = DuowanMod[index].custom;
	dwCleanCustom();	 -- 清理掉custom

	dwCurentMod = module;
	TabIndex[module] = {};
	btnIndex, checkIndex, spinIndex = 1, 1, 1;
	-- 检查是否是自定义界面	
	if (custom and type(custom) == "table") then
		local frame = (type(custom.frame) == "string") and _G[custom.frame] or custom.frame;		
		local xOff = custom.x or 5;
		local yOff = custom.y or 0;
		frame:SetParent(DuowanConfigFrameScrollFrameChild);
		frame:ClearAllPoints();		
		frame:SetPoint("TOPLEFT", DuowanConfigFrameScrollFrameChild, "TOPLEFT", xOff, yOff);
		frame:Show();

	end

	local c = DuowanConfiguration[module];
	local button;
	local editbox;
	local lastElement, parentElement = nil, {};

	if (c and type(c) == "table") then
		for i, v in ipairs(c) do			
			if (v.type == "BUTTON" or v.type == "CHECKBUTTON" or v.type == "SPINBOX") then	
				button = dwGetElement(v.type, v.subtype);
				button.text:SetFont(ConfigFont:GetFont(),12);
				button.text:SetText(v.caption);					
				button:Show();
					
				for key, value in pairs(v) do
					button[key] = value;
				end
					
				button.children = {};
					
				dwSetElementPos(button, lastElement);
				dwUpdateElement(button);
					

				if (v.indent >= 1) then
					table.insert(parentElement[v.indent - 1].children, button);

					if (parentElement[v.indent - 1] and dwIsCheckButtonEnabled(parentElement[v.indent - 1])) then
						dwSetElementEnable(button, true);
					else
						dwSetElementEnable(button, false);
					end
				else
					dwSetElementEnable(button, true);
				end				
					
				lastElement = button;
				parentElement[v.indent] = button;
			end		
		end
	end
	
	dwHideIdleElement();
end

-- 父项只能为 CheckButton
function dwIsCheckButtonEnabled(element)
	if (element and element.type == "CHECKBUTTON") then
		return element:GetChecked() and (element:IsEnabled() == 1);
	else
		return false;
	end
end

function dwSetElementEnable(element, bool)
	if (not element) then return end

	if (element.type == "CHECKBUTTON") then
		if (bool) then
			element:Enable();
			element.text:SetTextColor(1.0, 0.82, 0);
			dwGetglobal(element:GetName() .. "HitArea"):Enable();
		else
			element:Disable();
			element.text:SetTextColor(0.5, 0.5, 0.5);
			dwGetglobal(element:GetName() .. "HitArea"):Disable();
		end
	elseif (element.type == "SPINBOX") then
		local title = dwGetglobal(element:GetName().."Title");
		local prevButton = dwGetglobal(element:GetName().."Prev");
		local nextButton = dwGetglobal(element:GetName().."Next");
		local editbox = dwGetglobal(element:GetName() .. "EditBox");
		local text = dwGetglobal(element:GetName().."Text");
		if (bool) then			
			title:SetTextColor(1.0, 0.82, 0);
			prevButton:Enable();
			nextButton:Enable();
			--editbox:Enable();
			text:SetTextColor(1.0, 1.0, 1.0);
		else
			title:SetTextColor(0.5, 0.5, 0.5);
			prevButton:Disable();
			nextButton:Disable();
			--editbox:Disable();
			text:SetTextColor(0.5, 0.5, 0.5);
		end
	else
		if (bool) then
			element:Enable();
			element.text:SetTextColor(1.0, 0.82, 0);
		else
			element:Disable();
			element.text:SetTextColor(0.5, 0.5, 0.5);
		end
	end
end

-- 刷新状态
function dwUpdateElement(element)
	local variable;
	if (element.type == "BUTTON") then
		return;
	end
	-- 关联变量
	if (type(element.variable) == "function") then
		variable = element.variable();
	else		
		variable = dwGetCVar(dwCurentMod, element.variable);
	end	
	if (element.type == "CHECKBUTTON") then	
		element:SetChecked(variable);
	elseif (element.type == "SPINBOX") then
		local found;
		local editbox = dwGetglobal(element:GetName() .. "EditBox");
		if (element.subtype == DUOWAN_SPINBOX_LIST) then
			for i, v in ipairs(element.data) do
				if (v == variable) then
					found = true;
				end
			end
		elseif (element.subtype == DUOWAN_SPINBOX_RANGE) then
			if (type(variable) == "number" and variable >= element.data[1] and variable <= element.data[2]) then
				found = true;
			end
		end

		if (not found) then
			variable = element.default;
		end		
		
		if (element.subtype == DUOWAN_SPINBOX_RANGE) then					
			editbox:SetNumber(variable);	
			tinsert(TabIndex[dwCurentMod], editbox:GetName());
		else
			dwGetglobal(element:GetName() .. "Text"):SetText(variable);
		end	
	end
end

-- 定位控件
function dwSetElementPos(element, last)
	local offsetX = 0;
	element:ClearAllPoints();
	if (element.type == "BUTTON" and last and last.type ~= "BUTTON") then
		offsetX = 10;
	elseif (element.type ~= "BUTTON" and last and last.type == "BUTTON") then
		offsetX = -10;
	end

	if (not last) then
		element:SetPoint("TOPLEFT", DuowanConfigFrameScrollFrameChild, "TOPLEFT", 60+ offsetX, -10);
	else
		element:SetPoint("TOPLEFT", last, "BOTTOMLEFT", 20*(element.indent-last.indent)+ offsetX, -5);
	end	
end

function dwGetElement(elementTpye, subType)
	local element;		
	local name;
	
	if (elementTpye == "BUTTON") then		
		name = "DuowanConfigButton" ..btnIndex;
		element = dwGetglobal(name);
			
		if (not element) then
			element = CreateFrame("Button", name, DuowanConfigFrameScrollFrameChild, "UIPanelButtonTemplate");
			element.text = element:GetFontString();
			element.text:SetFont(ConfigFont:GetFont(),12);
			element:SetScript("OnClick", function(self)
				if (type(self.callback) == "function") then
					self.callback();
				end
			end);
			element:SetWidth(100);
			element:SetHeight(24);
			buttonNum = btnIndex;
		end
	
		btnIndex = btnIndex + 1;
	elseif (elementTpye == "CHECKBUTTON") then	
		name = "DuowanConfigCheckButton" ..checkIndex;
		element = dwGetglobal(name);		
		
		if (not element) then
			element = CreateFrame("CheckButton", name, DuowanConfigFrameScrollFrameChild, "dwCheckButtonTemplate");
			element.text = dwGetglobal(element:GetName() .. "Text");
			element.text:SetFont(ConfigFont:GetFont(),12);			

			element:SetScript("OnClick", function(self)	
				if (type(self.callback) == "function") then
					dwCheckButton_OnClick(self);				
				end					
			end);
			element:SetScript("OnEnter", function(self)			
				if (type(self.callback) == "function") then
					dwCheckButton_OnEnter(self);
				end
			end);
			element:SetScript("OnLeave", function(self)
				if (type(self.callback) == "function") then
					dwCheckButton_OnLeave(self);
				end
			end);
			checkNum = checkIndex;
		end
		element.tooltip = "";
		checkIndex = checkIndex + 1;
	else--if (elementTpye == "SPINBOX") then
		name = "DuowanConfigSpinBox" .. spinIndex;
		element = dwGetglobal(name);
		if (not element) then
			element = CreateFrame("Frame", name, DuowanConfigFrameScrollFrameChild, "dwSpinBoxTemplate");
			element.content:SetFont(ConfigFont:GetFont(),12);
			element.text:SetFont(ConfigFont:GetFont(),12);
			spinNum = spinIndex;
		end
		
		if (subType == DUOWAN_SPINBOX_RANGE) then
			dwGetglobal(name .. "EditBox"):Show();
			dwGetglobal(name .. "Text"):Hide();
		else
			dwGetglobal(name .. "EditBox"):Hide();
			dwGetglobal(name .. "Text"):Show();
		end
		spinIndex = spinIndex + 1;
	end		
	
	return element;
end

-- 隐藏多余的控件
function dwHideIdleElement()
	local button, checkBtn, spinBox;
	if (btnIndex and buttonNum) then
		for i = btnIndex, buttonNum do
			button = dwGetglobal("DuowanConfigButton" .. i);
			button:Hide();
		end
	end
	
	if (checkIndex and checkNum) then
		for i = checkIndex, checkNum do
			checkBtn = dwGetglobal("DuowanConfigCheckButton" .. i);
			checkBtn.tooltip = "";
			checkBtn:Hide();
		end
	end

	if (spinIndex and spinNum) then
		for i = spinIndex, spinNum do
			spinBox = dwGetglobal("DuowanConfigSpinBox" .. i);
			spinBox:Hide();
		end
	end
end

function dwClearRightPanel()
	btnIndex, checkIndex, spinIndex = 1, 1, 1;
	dwHideIdleElement();
end
-- 
function dwRefreshChildren(button)		
	if (button.children and #(button.children) > 0) then
		for k, element in ipairs(button.children) do			
			dwSetElementEnable(element, dwIsCheckButtonEnabled(button));	
			if (element.type == "CHECKBUTTON") then
				if (element.callback and type(element.callback) == "function") then
					if (dwIsCheckButtonEnabled(button) and element:GetChecked() ) then						
						element.callback(1);
					else
						element.callback(0);						
					end							
				end
				if (element.children and #(element.children) > 0) then
					dwRefreshChildren(element);		
				end					
			elseif (element.type == "SPINBOX" and element.callback) then					
				if (element.subtype == DUOWAN_SPINBOX_LIST) then
					if (dwIsCheckButtonEnabled(button)) then
						element.callback(dwGetCVar(dwCurentMod, element.variable));
					--else
						--element.callback(nil);
					end
				end					
			end			
		end
	end
end

function dwCheckButton_OnClick(button)
	local checked = button:GetChecked();
	
	if (not checked) then
		checked = 0;
	end

	if (type(button.variable) ~= "fucntion") then
		dwSetCVar(dwCurentMod, button.variable, checked);
	end		

	button.callback(checked);	

	dwRefreshChildren(button);
end
--]-]===========================================

--[-[=============================================
-- 模块分页显示
--

-- 按照mod来排序
function dwSortModInfo()
	table.sort(DuowanMod, function(a, b)
		return a.module < b.module;
	end);
end

-- 清除模块键
function dwClearModButtons()
	local btn, text, icon;

	for i=1,  DUOWAN_CONFIGBUTTONCOUNT do
		btn = dwGetglobal("DuowanConfigFrameModButton" .. i);
		text = dwGetglobal(btn:GetName() .. "Name");
		icon = dwGetglobal(btn:GetName() .. "Icon");
		--if (not btn.used) then
			text:SetText("");
			icon:SetTexture("");
			btn:Hide();

			btn.used = false;
			btn.module = nil;
		--end
	end
end

-- 辅助获得相应类型的MOD信息
local function GetMoudle(index, category)	
	local category = category or "NORMAL";
	local i, j;
	if (not Duowan_Categroys[category]) then
		Duowan_Categroys[category] = {};
		for i, m in ipairs(DuowanMod) do
			if (m.category == category) then
				tinsert(Duowan_Categroys[category], i);
			end
		end
	end
	
	j = Duowan_Categroys[category][index];
	if (j) then
		return DuowanMod[j];
	end
	return false;
end

local function GetMaxPage(category)
	local category = category or "NORMAL";
	local count = 0
	if (not PageInfo[category]) then
		for i, m in ipairs(DuowanMod) do
			if (m.category == category) then
				count = count + 1;
			end
		end
		PageInfo[category] = ceil(count / DUOWAN_CONFIGBUTTONCOUNT)
	end
	return PageInfo[category];
end
-- 显示指定页的模块
function dwShowPage(page, category)
	-- 错误的page不需要理会	
	local category = category or curCategory or "NORMAL";
	local maxPage = GetMaxPage(category);
	if (page and page > 0 and  page<= maxPage and page <= dwMaxPage) then
		dwClearModButtons();		
		dwCurentPage = page;
		DuowanConfigFramePrevButton:Enable();
		DuowanConfigFrameNextButton:Enable();
		if (page <= 1) then
			DuowanConfigFramePrevButton:Disable();
		elseif (page >= maxPage or page >= dwMaxPage) then
			DuowanConfigFrameNextButton:Disable();
		end
		if maxPage<=1 then
			DuowanConfigFramePrevButton:Disable();
			DuowanConfigFrameNextButton:Disable();
		end

		local start = (page - 1) * DUOWAN_CONFIGBUTTONCOUNT;
		local btn, text, icon, shine;
		local index, name, texture, module, tmp;
		for i = 1,  DUOWAN_CONFIGBUTTONCOUNT do
			index = i + start;
			tmp = GetMoudle(index, category);
			if (tmp) then
				module = tmp.module;
				name = tmp.name;
				tooltip = tmp.tooltip;
				texture = tmp.texture;

				btn = _G["DuowanConfigFrameModButton" .. i];
				text =  _G[btn:GetName() .. "Name"];
				icon = _G[btn:GetName() .. "Icon"];
				shine = _G[btn:GetName() .. "Shine"];

				text:SetFont(ConfigFont:GetFont(),12);
				text:SetText(name);
				if (type(texture) == "table") then
					icon:SetTexture(texture[1]);
					icon:SetTexCoord(texture[2][1], texture[2][2], texture[2][3], texture[2][4]);
				else
					icon:SetTexture(texture);
					icon:SetTexCoord(0, 1, 0, 1);
				end

				if (DW_NewModules[module]) then
					AutoCastShine_AutoCastStart(shine);
				else
					AutoCastShine_AutoCastStop(shine);
				end
				btn.tooltip=tooltip;
				btn:Show();

				btn.used = true;
				btn.module = module;
			else
				break;
			end
		end

		DuowanConfigFramePageText:SetText(string.format("%d / %d", page, maxPage));
		dwModeButtonUpdate();
	end
end

function dwPrePage_OnClick(self)
	PlaySound("igAbiliityPageTurn");
	dwShowPage(dwCurentPage - 1);
end

function dwNextPage_OnClick(self)
	PlaySound("igAbiliityPageTurn");
	dwShowPage(dwCurentPage + 1);
end
--]-]==========================================

---------------------------------------
-- 模板
function dwModButton_OnClick(self)
	if (self.module) then		
		dwHideChangeLog();		
		dwShowMod(self.module);
		dwModeButtonUpdate();
	end
end

function dwCheckButton_OnEnter(self)
	if (self.tooltip and type(self.tooltip) == "string" and self.tooltip ~= "") then
		local info = GetModInfoByMod(dwCurentMod);
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:SetText(info.name);
		GameTooltip:AddLine(self.tooltip, 1, 1, 1);
		GameTooltip:Show();
	end
end

function dwCheckButton_OnLeave(self)
	GameTooltip:Hide();
end

function dwModButton_OnEnter(self)
	if (self.tooltip and type(self.tooltip) == "string") then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:SetText(self.tooltip)
		GameTooltip:Show();
	end
end

function dwModButton_OnLeave(self)
	GameTooltip:Hide();
end

function dwModeButtonUpdate()
	local modButton;
	for i=1, DUOWAN_CONFIGBUTTONCOUNT do
		modButton = dwGetglobal("DuowanConfigFrameModButton" .. i);
		if (modButton.module and modButton.module == dwCurentMod) then
			_G["DuowanConfigFrameModButton" .. i.."UnChecked"]:Hide();
			_G["DuowanConfigFrameModButton" .. i.."Checked"]:Show();
			if (DW_NewModules[dwCurentMod]) then
				DW_NewModules[dwCurentMod] = nil;
				AutoCastShine_AutoCastStop(_G[modButton:GetName().."Shine"]);
			end			
			modButton:SetChecked(1);
		else
			_G["DuowanConfigFrameModButton" .. i.."UnChecked"]:Show();
			_G["DuowanConfigFrameModButton" .. i.."Checked"]:Hide();
			modButton:SetChecked(0);
		end
	end
end
-- SpinBox

function dwSpinBoxPrev_OnLoad(self)
	self:RegisterForClicks("LeftButtonUp" ,"RightButtonUp");
end

function dwSpinBoxPrev_OnClick(self)
	local element = self:GetParent();
	local text = dwGetglobal(element:GetName().."Text");
	local editbox = dwGetglobal(element:GetName() .. "EditBox");
	local value = text:GetText();

	if (element.subtype == DUOWAN_SPINBOX_LIST) then
		local count = #(element.data);
		for i = 1, count, 1 do
			if (value == element.data[i]) then
				if (i - 1 < 1) then
					text:SetText(element.data[count]);
					dwSetCVar(dwCurentMod, element.variable, element.data[count]);
					element.callback(element.data[count]);
					return;
				else
					text:SetText(element.data[i - 1]);
					dwSetCVar(dwCurentMod, element.variable, element.data[i - 1]);
					element.callback(element.data[i - 1]);
					return;
				end
			end
		end	

		text:SetText(element.data[1]);
		dwSetCVar(dwCurentMod, element.variable, element.data[1]);
		element.callback(element.data[1]);
	elseif (element.subtype == DUOWAN_SPINBOX_RANGE and element.data[1] and element.data[2]) then -- 范围就必须有边界值
		local variable = tonumber(dwGetCVar(dwCurentMod, element.variable) - (element.data[3] or 1));
		if (variable > element.data[2]) then		-- 我们的number类型不是UINT
			variable = element.data[2];
		elseif (variable < element.data[1]) then
			variable = element.data[1];
		end
		editbox:SetNumber(variable);
		element.callback(variable);
		dwSetCVar(dwCurentMod, element.variable, variable);
		return;
	else
		error("Duowan SpinBox subtype must be 'list' or 'range', got a " .. tostring(element.subtype));
	end
end

function dwSpinBoxNext_OnLoad(self)
	self:RegisterForClicks("LeftButtonUp" ,"RightButtonUp");
end

function dwSpinBoxNext_OnClick(self)
	local element = self:GetParent();
	local text = dwGetglobal(element:GetName().."Text");
	local editbox = dwGetglobal(element:GetName() .. "EditBox");
	local value = text:GetText();

	if (element.subtype == DUOWAN_SPINBOX_LIST) then
		local count = #(element.data);
		for i = 1, count, 1 do
			if (value == element.data[i]) then
				if (i + 1 > count) then
					text:SetText(element.data[1]);
					dwSetCVar(dwCurentMod, element.variable, element.data[1]);
					element.callback(element.data[1]);
					return;
				else
					text:SetText(element.data[i + 1]);
					dwSetCVar(dwCurentMod, element.variable, element.data[i + 1]);
					element.callback(element.data[i + 1]);
					return;
				end
			end
		end	

		text:SetText(element.data[1]);
		dwSetCVar(dwCurentMod, element.variable, element.data[1]);
		element.callback(element.data[1]);
	elseif (element.subtype == DUOWAN_SPINBOX_RANGE and element.data[1] and element.data[2]) then -- 范围就必须有边界值
		local variable = tonumber(dwGetCVar(dwCurentMod, element.variable) + (element.data[3] or 1));
		if (variable > element.data[2]) then		-- 我们的number类型不是UINT
			variable = element.data[2];
		elseif (variable < element.data[1]) then
			variable = element.data[1];
		end
		editbox:SetNumber(variable);
		element.callback(variable);
		dwSetCVar(dwCurentMod, element.variable, variable);
		return;
	else
		error("Duowan SpinBox subtype must be 'list' or 'range', got a " .. tostring(element.subtype));
	end
end

function dwSpinBoxEditBox_OnTextChanged(self)
	local element = self:GetParent();
	local editbox = dwGetglobal(element:GetName() .. "EditBox");
	if (element.subtype == DUOWAN_SPINBOX_RANGE and element.data[1] and element.data[2]) then		
		local variable = tonumber(dwGetCVar(dwCurentMod, element.variable));
		local value = editbox:GetNumber() or variable;
		if (type(value) == "number" and value ~= variable) then
			if (value < element.data[1]) then
				value = element.data[1];
			elseif(value > element.data[2]) then
				value = element.data[2];
			end
			if (string.find(value, "^[%+|%-]?%d+$")) then
				editbox:SetNumber(value);
				element.callback(value);
				dwSetCVar(dwCurentMod, element.variable, value);				
			end		
		end
	end
end

function dwSpinBoxEditBox_OnTabPressed(self)
	local box = self:GetParent();
	EditBox_HandleTabbing(TabIndex[box.module]);
end

-------------------
-- 更新日志 TODO: 字体改用变量
local function CreateChangeLog()
	local simpleHTML = _G["DuowanReader"]
	if (not simpleHTML) then
		simpleHTML = CreateFrame("SimpleHTML", "DuowanReader", DuowanConfigFrameScrollFrameChild);
		simpleHTML:SetPoint("TOPLEFT", DuowanConfigFrameScrollFrameChild, "TOPLEFT", 55, -10);
		simpleHTML:SetPoint("BOTTOMRIGHT", DuowanConfigFrameScrollFrameChild, "BOTTOMRIGHT", -20, 5);
		--simpleHTML:SetNonSpaceWrap(true);
		simpleHTML:SetFont(DUOWAN_CHANGELOG_FONT, 13);		
		simpleHTML:SetTextColor(0.88, 0.85, 0.69);
		simpleHTML:SetSpacing(6);
		simpleHTML:SetFont("h1", DUOWAN_CHANGELOG_FONT, 14);		
		simpleHTML:SetTextColor("h1", 0, 0.59, 0.8);
		simpleHTML:SetSpacing("h1", 8);
		simpleHTML:SetFont("h2", DUOWAN_CHANGELOG_FONT, 13);
		simpleHTML:SetTextColor("h2", 1.0, 0.82, 0.09765625);
		simpleHTML:SetSpacing('h2', 5);
		simpleHTML:SetFont("p", DUOWAN_CHANGELOG_FONT, 13);
		simpleHTML:SetTextColor("p", 0.88, 0.85, 0.69);
		simpleHTML:SetIndentedWordWrap("p", true);
	end	
	return simpleHTML;
end

function dwShowChangeLog(strlog)
	local strlog = strlog or DUOWAN_CHANGELOG;
	local LOG = CreateChangeLog();
	LOG:SetText(strlog);
	LOG:Show();
end

function dwHideChangeLog()
	local LOG = _G["DuowanReader"]
	if (LOG) then
		LOG:Hide();
	end
end
------
--------------------
-- 开启配置面板时播放宣传动画
--[[
local function dwOnMovieFinished(self)
	if ( self:IsShown() ) then
		self:Hide();
	end
end

local function dwOnMovieShowSubtitle(self, txt)
	self.text:SetText(txt);
	self.text:Show();
	self.fadingAlpha = 0.0;
	self.fadeDirection = 1.0;
	self.fadeSpeed = MOVIE_CAPTION_FADE_TIME;
	self.text:SetAlpha(self.fadingAlpha);
end

local function dwOnMovieHideSubtitle(self)
	self.fadingAlpha = 1.0;
	self.fadeDirection = -1.0;
	self.fadeSpeed = MOVIE_CAPTION_FADE_TIME / 2;
	self.text:SetAlpha(self.fadingAlpha);
end

local function dwOnUpdate(self, elapsed)
	if (self.text:IsShown() and self.fadingAlpha) then
		self.fadingAlpha = self.fadingAlpha + ((elapsed / self.fadeSpeed) * self.fadeDirection);
		if ( self.fadingAlpha > 1.0 ) then
			self.text:SetAlpha(1.0);
			self.fadingAlpha = nil;
		elseif ( self.fadingAlpha < 0.0 ) then
			self.text:Hide();
			self.fadingAlpha = nil;
		else
			self.text:SetAlpha(self.fadingAlpha);
		end
	end
end

local function dwStopMovie()
	local movieFrame = _G["DuowanFlash"]
	if (movieFrame and movieFrame:IsShown()) then
		GameMovieFinished();
		movieFrame:StopMovie();
		movieFrame:Hide();
	end
end

local function dwPlayMovie(name, volume)
	local movieFrame = dwCreatemovieFrame();
	volume = volume or 150;
	movieFrame:Show();
	if (not movieFrame:StartMovie(name, volume) ) then
		print(name)
		movieFrame:Hide();
		GameMovieFinished();
	end
end

function dwCreatemovieFrame()
	local movieFrame  = _G["DuowanFlash"]
	if (not movieFrame) then
		movieFrame = CreateFrame("MovieFrame", "DuowanFlash",  DuowanConfigFrame);
		movieFrame:SetPoint("TOPLEFT", DuowanConfigFrameScrollFrameChild, "TOPLEFT", 0, 0);
		--movieFrame:SetPoint("BOTTOMRIGHT", DuowanConfigFrameScrollFrameChild, "BOTTOMRIGHT", -20, 0);
		movieFrame:SetHeight(290);
		movieFrame:SetWidth(270);
		movieFrame.text = movieFrame:CreateFontString("DuowanFlashText", "OVERLAY", "MovieSubtitleFont");
		movieFrame.text:SetPoint("BOTTOM", movieFrame, "BOTTOM", 0, -20);
		movieFrame:EnableSubtitles(true);
		movieFrame:SetScript("OnMovieFinished", dwOnMovieFinished);
		movieFrame:SetScript("OnMovieShowSubtitle", dwOnMovieShowSubtitle);
		movieFrame:SetScript("OnMovieHideSubtitle", dwOnMovieHideSubtitle);
		movieFrame:SetScript("OnUpdate", dwOnUpdate);
	end

	return movieFrame;
end
]]
function dwConfigFrame_OnShow(self)
	dwSortModInfo();
	if (not self.showlast) then
		dwMaxPage = math.ceil(#(DuowanMod) / DUOWAN_CONFIGBUTTONCOUNT);	
		DuowanConfigFramePageText:SetText(string.format("%d / %d", 1, dwMaxPage));
		curCategory = "NORMAL";	-- 开启时缺省为常规插件
		dwShowPage(1);	
		dwClearRightPanel();	-- 配置也清空
	
		-- 显示更新日志	
		if (not DUOWAN_VERSION or DUOWAN_VERSION ~= dwGetVersion()) then
			DUOWAN_VERSION = dwGetVersion();
			dwShowChangeLog();
		else
			dwHideChangeLog();
			-- 播放动画	
			--dwPlayMovie("Interface\\Cinematics\\WOW_Intro_BC_1024.avi");
			--dwPlayMovie("Interface\\Cinematics\\WOW_Intro_BC_800", 255);
		end
	end
	local r = math.random(1, 1000);
	local texture = "Interface\\AddOns\\Duowan\\textures\\dwmh-bg7";
	--if (r <= 2) then
	--	texture = "Interface\\AddOns\\Duowan\\textures\\dwmh-bg6";
	--end
	DuowanConfigFrameBookRight:SetTexture(texture);
	if (curCategory == "NORMAL") then
		PanelTemplates_SelectTab(_G[self:GetName() .. "Tab1"]);
	else
		PanelTemplates_SelectTab(_G[self:GetName() .. "Tab2"]);
	end
end

function dwConfigFrame_OnHide(self)
	self.showlast = true;
end

function DuowanConfigFrame_VersionButton_OnLoad(self)	
	self:SetText(DUOWAN_VERSION);	
	self:GetFontString():SetTextColor(0.8, 0.8, 0.8, 0.8);
	_G[self:GetName() .. "Line"]:SetWidth(self:GetFontString():GetStringWidth() + 2);
end

function DuowanConfigFrame_VersionButton_OnClick(self)
	dwClearRightPanel();	-- 配置也清空
	dwShowChangeLog();
end

function DuowanConfigFrame_VersionButton_OnEnter(self)
	_G[self:GetName() .. "Line"]:Show();
	self:GetFontString():SetTextColor(1, 1, 1);	
end
	
function DuowanConfigFrame_VersionButton_OnLeave(self)
	_G[self:GetName() .. "Line"]:Hide();
	self:GetFontString():SetTextColor(0.8, 0.8, 0.8, 0.8);
end
	
function BtnClose_OnClick()	
	HideUIPanel(DuowanConfigFrame);
	PlaySound("igMainMenuOption");
end

function dwConfigFrame_OnLoad(self)
	self:SetAttribute("UIPanelLayout-defined", true);
	self:SetAttribute("UIPanelLayout-area", "center");
	self:SetAttribute("UIPanelLayout-pushable", 0);
	self:SetAttribute("UIPanelLayout-enabled", true);	
	self:RegisterEvent("VARIABLES_LOADED");
	self:UnregisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_LOGIN");
	self:SetClampedToScreen(true);
	self:RegisterForDrag("LeftButton","RightButton");	
	PanelTemplates_SetNumTabs(self, 2);
	local sb = dwGetglobal(self:GetName() .. "ScrollFrameScrollBar");
	sb:ClearAllPoints();
	sb:SetPoint("TOPLEFT", sb:GetParent(), "TOPRIGHT", 8, -14);
	sb:SetPoint("BOTTOMLEFT", sb:GetParent(), "BOTTOMRIGHT", 8, 11);
	
	GameMenuFrame:SetHeight(255); 
	GameMenuButtonOptions:SetPoint("TOP", "DuowanMenuButtonOptions", "BOTTOM", 0, -1); 

	SLASH_RL1 = "/rl";
	SlashCmdList["RL"] = function(msg)		
		ReloadUI();
	end
	-- 修改字体
	dwTextStatusBarText:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE");
	dwNumberFontNormal:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE");

	dwGatherNewModules();
end

function dwTriggerMod(addon)
	local parent= {};
	if (DuowanConfiguration[addon]) then
		for _, v in ipairs(DuowanConfiguration[addon]) do
			if (v.type ~= "BUTTON") then
				v.children = {};
				if (v.indent >= 1) then
					tinsert(parent[v.indent - 1], v);
				end				
				
				if (((type(v.variable) == "function" and v.variable() == 0) or dwGetCVar(addon, v.variable) == 0) or (parent[v.indent-1] and parent[v.indent-1].disabled)) then
					-- 父项禁用的时候只刷新勾选框
					if (v.type == "CHECKBUTTON") then
						v.disabled = true;
						pcall(v.callback, 0);
						--v.callback(0);
					end
				else
					if (type(v.variable) == "function") then						
						pcall(v.callback, v.variable());	
						--v.callback(v.variable())
					else
						pcall(v.callback, dwGetCVar(addon, v.variable));
						--v.callback(dwGetCVar(addon, v.variable))
					end
				end
				
				parent[v.indent] = v;
			end
		end	
	end
end

function dwGetTextOnDate(msg, y, m, d)
	local weekday, month, day, year = CalendarGetDate();	
	if (y == year and m == month and d == day) then
		return msg;
	end
	return false;
end

function dwPrintLoadMessage()
	--local text = dwRawGetCVar("DuowanConfig", "LoadString", "");		
	--if (text ~= DUOWAN_LOADED_STRING) then			
		--local dataText = dwGetTextOnDate(DUOWAN_ON_DATA_STRING, 2010, 11, 20);	-- 2010-10-26		
		--DEFAULT_CHAT_FRAME:AddMessage(DUOWAN_LOADED_STRING, 1.0, 1.0, 0.0);
		-- 在特定时间显示的信息
		if (dwInDate("2011-03-09", "2011-03-12")) then
			DEFAULT_CHAT_FRAME:AddMessage(" ", 1.0, 0.80, 0.0);
			--DEFAULT_CHAT_FRAME:AddMessage(DUOWAN_LOADED_TITLE, 1.0, 0.80, 0.0);
			--DEFAULT_CHAT_FRAME:AddMessage("--------------------------------", 0.88, 0.85, 0.69);
			DEFAULT_CHAT_FRAME:AddMessage(DUOWAN_ON_DATA_STRING, 1.0, 1.0, 0.0);
			DEFAULT_CHAT_FRAME:AddMessage("--------------------------------", 0.88, 0.85, 0.69);
		end		
		--dwSetCVar("DuowanConfig", "LoadString", DUOWAN_LOADED_STRING);
	--end
end

function dwConfigFrame_OnEvent(self, event, addon)
	if (event == "ADDON_LOADED") then			
		if (isDuowanAddOn(addon) and LoadOnDemandAddOns[addon]) then
			LoadOnDemandAddOns[addon] = false;	-- modified by dugu 2010-4-6
			dwTriggerMod(LoadOnDemandAddOns[addon]);
		end	
	elseif (event == "VARIABLES_LOADED") then			
		for addon, _ in pairs(DuowanConfiguration) do		
			dwTriggerMod(addon);
		end
	
		self:RegisterEvent("ADDON_LOADED");
	elseif (event == "PLAYER_LOGIN") then
		dwDelayCall("dwPrintLoadMessage", 5);
	end
end
-----------------------------------------------
-- 小地图按钮
function dwMinimapButton_OnLoad(self)
	
	self.IsDragging = false;
	self:RegisterForDrag("LeftButton");
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	self:SetFrameLevel(self:GetFrameLevel() + 1);
	local cx, cy = dwRawGetCVar("Duowan", "CX", -42.38), dwRawGetCVar("Duowan", "CY", -63);
	self:ClearAllPoints();
	self:SetPoint("CENTER", cx, cy);	
end

function dwMinimapButton_OnClick(self, button)
	if (button == "LeftButton") then
		if (DuowanConfigFrame:IsVisible()) then
			HideUIPanel(DuowanConfigFrame);
		else			
			ShowUIPanel(DuowanConfigFrame);
		end
	elseif (button == "RightButton") then
		MBB_OnClick("LeftButton");
	end
	
	dwGetglobal(self:GetName() .. "Icon"):SetTexCoord(.075,.925,.075,.925);
	PlaySound("igMainMenuOption");
end

local x, y, centerX, centerY
function dwMinimapButton_UpdateDragPosition(self)
	centerY, centerX = (Minimap:GetTop()-((Minimap:GetTop()-Minimap:GetBottom())/2)), 
	(Minimap:GetLeft()+((Minimap:GetRight()-Minimap:GetLeft())/2))
	x, y = GetCursorPosition();
	local s = self:GetEffectiveScale();
	x, y =x/s, y/s;
	x, y = -(centerX - x), -(centerY - y);
	centerX, centerY = math.abs(x), math.abs(y)
	centerX, centerY = (centerX / sqrt((centerX * centerX) + (centerY * centerY))) * 76, (centerY / sqrt((centerX * 
	centerX) + (centerY * centerY))) * 76;
	if (x < 0 ) then
		centerX = -centerX;
	end

	if (y < 0) then
		centerY = -centerY;
	end

	self:ClearAllPoints();
	self:SetPoint("CENTER", centerX, centerY);	
	--print(centerX, centerY)
	dwSetCVar("Duowan", "CX", centerX);
	dwSetCVar("Duowan", "CY", centerY);	
	self:SetUserPlaced(true);
end

function dwMinimapButton_DragStart(self)
	--if(IsShiftKeyDown()) then
		self.IsDragging = true;
	--end
end

function dwMinimapButton_OnMouseDown(self)
	dwGetglobal(self:GetName() .. "Icon"):SetTexCoord(0,1,0,1);
end

function dwMinimapButton_OnMouseUp(self)
	dwGetglobal(self:GetName() .. "Icon"):SetTexCoord(.075,.925,.075,.925);
end

function dwMinimapButton_DragEnd(self)
	self.IsDragging = false;
	dwGetglobal(self:GetName() .. "Icon"):SetTexCoord(.075,.925,.075,.925);
end

function dwMinimapButton_OnEnter(self)	
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
	GameTooltip:SetText(DUOWAN_ADDONS_NAME, 1, 1, 1);
	GameTooltip:AddLine(L["左键打开多玩配置界面\n右键弹出小地图按键包"]);
	GameTooltip:Show();
end

function dwMinimapButton_OnLeave(self)
	GameTooltip:Hide();
end

function DuowanConfigFrame_ACPButton_OnLoad(self)		
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
end

function DuowanConfigFrame_ACPButton_OnClick(self, button)
	PlaySound("igMainMenuOption");			
	ShowUIPanel(ACP_AddonList);
end

function DuowanConfigFrame_LevButton_OnClick(self)
	BtnClose_OnClick();
end

--------------------
-- 标签选项

function DuowanConfigFrame_NormalTab_OnClick(self)
	if (curCategory == "NORMAL") then
		return;
	end
	curCategory = "NORMAL";
	dwShowPage(1, "NORMAL");
	PlaySound("igCharacterInfoTab");
end

function DuowanConfigFrame_RaidTab_OnClick(self)
	if (curCategory == "RAID") then
		return;
	end
	curCategory = "RAID";
	dwShowPage(1, "RAID");
	PlaySound("igCharacterInfoTab");
end

------------------------
-- Added by dugu@wowbox 2010-12-11
-- 这里其实很少触发, 现在我还没找到一个触发的点
local function isNewModule(module)
	if (not isModRegistered(module)) then return false; end

	local configs = DuowanConfiguration[module];
	local _, isDef;
	for i, v in ipairs(configs) do
		if (v.variable) then
			_, isDef = dwGetCVar(module, v.variable);
			if (isDef) then
				return true;
			end
		end
	end	
end

function dwGatherNewModules()
	for i, m in ipairs(DuowanMod) do
		if (isNewModule(m.module)) then
			DW_NewModules[m.module] = true;
		end
	end
end
