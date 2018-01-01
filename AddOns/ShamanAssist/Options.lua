--==================================================
-- Options.lua 
-- 日期: 2008年5月21日
-- 作者: 独孤傲雪
-- 描述: 提供插件的配置部分, 主要是下拉菜单
-- 版权所有: 艾泽拉斯国家地理
--==================================================
local M = SMA;
local L = BLocal("ShamanAssist");
local S = BLibrary("BScale");

function M:InitOptionsData()
	self.options = {
	-- ***************
	{											-- [1]
		text = L["基本选项"],
		notCheckable = true,
		isTitle = true,
	},
	{											-- [2]
		text = L["锁定位置"],	
		disabled = function ()
			return InCombatLockdown();
		end,
		checked = function()
			return M:GetC("locked");			
		end,
		func = function()
			local value = not M:GetC("locked")
			M:ToggleLocked(value);			-- TODO: add!!!!
		end,
	},
	{											-- [3]
		text = L["调节透明度..."],	
		disabled = function ()
			return InCombatLockdown();
		end,
		arg1 = 0,	-- min value
		arg2 = 1,	-- max value						
		func = function(self, arg1, arg2)	
			BigFoot_ShowPopRange(				
				arg1, 
				arg2, 
				M:GetC("alpha"), 
				0.05, 
				true, 
				function(value)
					M:OnAlphaChange(value);
				end,
				nil,
				function(value)
					M:SetC("alpha", value);
				end,				
				L["设置图腾技能条的透明度"]
			);
		end,
	},
	{											-- [4]
		text = L["缩放比例..."],
		disabled = function ()
			return InCombatLockdown();
		end,
		arg1 = 0.5,	-- min value
		arg2 = 1.5,	-- max value
		func = function(self, arg1, arg2)				
			BigFoot_ShowPopRange(				
				arg1, 
				arg2, 
				M:GetC("scale"), 
				0.05, 
				true, 
				function(value)
					M:OnScaleChange(value);
				end,
				nil,
				function(value)
					M:SetC("scale", value);
				end,
				L["设置图腾技能条的缩放比例"]
			);
		end,
	},
	{											-- [5]
		text = L["按键绑定..."],		
		disabled = function ()
			return InCombatLockdown();
		end,
		checked = nil,
		func = function()
			BigFoot_ShowKeyBindingFrame("CLICK SMAButton1:LeftButton");
		end,
	},
	-- ******************* 
	{											-- [6]
		text = L["排列方式"],
		notCheckable = true,
		isTitle = true,
	},
	{											-- [7]
		text = L["横向排列"],	
		disabled = function ()
			return InCombatLockdown();
		end,
		checked = function()
			return M:GetC("arrangement") == "horizontal";
		end,
		func = function(arg1, arg2)				
			M:OnArrangement("horizontal");		-- TODO: add!!!
		end,
	},
	{											-- [8]
		text = L["竖向排列"],
		disabled = function ()
			return InCombatLockdown();
		end,
		checked = function()
			return M:GetC("arrangement") == "vertical";
		end,
		func = function(arg1, arg2)				
			M:OnArrangement("vertical");			-- TODO: add!!!
		end,
	},
	-- ******************
	{											-- [9]
		text = L["弹出方式"],
		notCheckable = true,
		isTitle = true,
	},
	{											-- [10]
		text = L["右键点击"],
		disabled = function ()
			return InCombatLockdown();
		end,
		checked = function()
			return M:GetC("popMethod") == 1;
		end,
		func = function(arg1, arg2)				
			M:OnPopMethod(1);			-- TODO: add!!!
		end,
	},
	{											-- [11]
		text = L["鼠标划过"],
		disabled = function ()
			return InCombatLockdown();
		end,
		checked = function()
			return M:GetC("popMethod") == 0;
		end,
		func = function(arg1, arg2)	
			M:OnPopMethod(0);			-- TODO: add!!!
		end,
	},
	{											-- [12]			
		text = L["弹出方向"],
		disabled = function ()
			return InCombatLockdown();
		end,
		hasArrow = true,
		value = "popDirect",
		subMenu = {
			{
				text = L["向上弹出"],
				level = 2,
				disabled = function()
					return M:GetC("arrangement") == "vertical";
				end,
				checked = function()
					return M:GetC("arrangement") == "horizontal" and M:GetC("popDirect") == 1;
				end,
				func = function()
					M:OnPopChange("horizontal", 1);		-- TODO: add!!!
				end,
			},
			{
				text = L["向下弹出"],
				level = 2,
				disabled = function()
					return M:GetC("arrangement") == "vertical";
				end,
				checked = function()
					return M:GetC("arrangement") == "horizontal" and M:GetC("popDirect") == 0;
				end,
				func = function()
					M:OnPopChange("horizontal", 0);		-- TODO: add!!!
				end,
			},
			{
				text = L["向左弹出"],
				level = 2,
				disabled = function ()
					return M:GetC("arrangement") == "horizontal";
				end,
				checked = function()
					return M:GetC("arrangement") == "vertical" and M:GetC("popDirect") == 1;
				end,
				func = function()
					M:OnPopChange("vertical", 1);		-- TODO: add!!!
				end,
			},
			{
				text = L["向右弹出"],
				level = 2,
				disabled = function ()
					return M:GetC("arrangement") == "horizontal";
				end,
				checked = function()
					return M:GetC("arrangement") == "vertical" and M:GetC("popDirect") == 0;
				end,
				func = function()
					M:OnPopChange("vertical", 0);		-- TODO: add!!!
				end,
			},
		},
	},
	-- ***********************
	{											-- [13]
		text = L["信息提示"],
		notCheckable = true,
		isTitle = true,
	},
	{											-- [14]
		text = L["图腾消失提示"],	
		keepShownOnClick = true,
		checked = function ()
			return M:GetC("notifyEnd");
		end,
		func = function(arg1, arg2, checked)
			M:SetC("notifyEnd", checked);
		end,
	},
	{											-- [15]
		text = L["法潮图腾提示"],	
		keepShownOnClick = true;
		checked = function()
			return M:GetC("notifyMana");
		end,
		func = function(arg1, arg2, checked)
			M:SetC("notifyMana", checked);
		end,
	},
	{											-- [16]
		text = "",
		notCheckable = true,
		isTitle = true,
	},
	{											
		text = CANCEL,			
		func = function()			
		end,
	},
};
end


function M:ToggleLocked(checked)
	if (not InCombatLockdown()) then
		if (checked) then
			self.mainFrame:StopMovingOrSizing();
			self.mainFrame:EnableMouse(false);
			self.mainFrame:SetMovable(false);
		else
			self.mainFrame:EnableMouse(true);
			self.mainFrame:SetMovable(true);
		end
		self:SetC("locked", checked);
	else
		self:Print(L["设置未成功, 请在脱离战斗后再进行配置"]);
	end
end

function M:OnAlphaChange(value)
	if (not InCombatLockdown()) then
		for i=1, 4 do
			if (self["Buttons"][i]) then
				self["Buttons"][i]:SetAlpha(value);
			end			
		end
	else
		self:Print(L["设置未成功, 请在脱离战斗后再进行配置"]);
	end
end

function M:OnScaleChange(value)
	if (not InCombatLockdown()) then
		S:SetScale(self.mainFrame, value);
	else
		self:Print(L["设置未成功, 请在脱离战斗后再进行配置"]);
	end
end

function M:OnArrangement(arr)
	if (not InCombatLockdown()) then
		local button;
		local __last_button;
		local __padding_x = 4;

		for i = 1, 4 do
			if (not __last_button) then
				__last_button = self.titleButton;
				__padding_x = 2;
			end

			button = self["Buttons"][i];
			if (button) then
				if (getn(button.Pops) > 0) then
					button:ClearAllPoints();
					button:Show();
					if (arr == "horizontal") then
						button:SetPoint("LEFT", __last_button, "RIGHT", __padding_x, 0);
					else
						if (i == 1) then
							button:SetPoint("LEFT", __last_button, "RIGHT", __padding_x, 0);
						else
							button:SetPoint("TOP", __last_button, "BOTTOM", 0, -4);
						end
					end
					__last_button = button;
				else
					button:ClearAllPoints();
					button:Hide();
				end
			end
		end

		if (self.callButton) then
			__last_button = self.callButton;
			self.callButton:ClearAllPoints();
			if (arr == "horizontal") then
				self.callButton:SetPoint("LEFT", self.lastTotem, "RIGHT", __padding_x, 0)
			else
				self.callButton:SetPoint("TOP", self.lastTotem, "BOTTOM", 0, -4);
			end
		end
		
		if (__last_button) then
			local r, b = __last_button:GetRight(), __last_button:GetBottom();
			local l, t = self.mainFrame:GetLeft(), self.mainFrame:GetTop();
			self.mainFrame:SetWidth(r - l + 4);
			self.mainFrame:SetHeight(t - b);
		end
		
		self:OnPopChange(arr, M:GetC("popDirect"));
		self:SetC("arrangement", arr);
	else
		self:Print(L["设置未成功, 请在脱离战斗后再进行配置"]);
	end
end

function M:OnPopChange(arr, direct)
	if (not InCombatLockdown()) then
		local button;
		for i=1, 4 do
			local button = self["Buttons"][i];
			if (button) then			
				for index, val in ipairs(button.Pops) do
					val:ClearAllPoints();
					if (arr == "horizontal") then
						if (direct == 1) then
							if (index == 1) then
								val:SetPoint("BOTTOM", button, "TOP", 0, 2);
							else
								val:SetPoint("BOTTOM", button.Pops[index-1], "TOP", 0, 0);
							end
						else
							if (index == 1) then
								val:SetPoint("TOP", button, "BOTTOM", 0, -2);
							else
								val:SetPoint("TOP", button.Pops[index-1], "BOTTOM", 0, 0);
							end
						end
					else
						if (direct == 1) then
							if (index == 1) then
								val:SetPoint("RIGHT", button, "LEFT", -2, 0);
							else
								val:SetPoint("RIGHT", button.Pops[index-1], "LEFT", 0, 0);
							end
						else
							if (index == 1) then
								val:SetPoint("LEFT", button, "RIGHT", 2, 0);
							else
								val:SetPoint("LEFT", button.Pops[index-1], "RIGHT", 0, 0);
							end
						end
					end
				end
			end
		end
		self:SetC("popDirect", direct);
	else
		self:Print(L["设置未成功, 请在脱离战斗后再进行配置"]);
	end
end

function M:OnPopMethod(m)
	if (not InCombatLockdown()) then
		local m = m or 1;		
		for i=1, 4 do
			if (self.Buttons[i]) then
				if (m == 0) then
					self.Buttons[i]:SetAttribute("OpenMenu", "mouseover");
				else
					self.Buttons[i]:SetAttribute("OpenMenu", "rightbutton");
				end		
			end
		end		
		m = (m == 1) and 1 or 0;
		self:SetC("popMethod", m);
	else
		self:Print(L["设置未成功, 请在脱离战斗后再进行配置"]);
	end
end

function M:UpdateLayout()
	self:ToggleLocked(self:GetC("locked"));
	self:OnAlphaChange(self:GetC("alpha"));
	self:OnScaleChange(self:GetC("scale"));
	self:OnArrangement(self:GetC("arrangement"));
	self:OnPopMethod(self:GetC("popMethod"));
end

function M:InitMenu()
	self:InitOptionsData();
	BEasyMenu_Register(self.titleButton, self.options);
end