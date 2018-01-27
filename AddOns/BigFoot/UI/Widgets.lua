------------------------
--- 2011 -03 -15 Terry@bf
-- 迁移一些UI相关的功能到这里
-- UI的独立控件也会放到这里
------------------------

---鼠标提示功能
function BigFoot_Tooltip_Init()
	local __index = 1;
	while (true) do
		local __TextLeft = getglobal("BigFootTooltipTextLeft"..__index);
		local __TextRight = getglobal("BigFootTooltipTextRight"..__index);

		if (__TextLeft) then
			__TextLeft:SetText("");
		end

		if (__TextRight) then
			__TextRight:SetText("");
		end

		if (not __TextLeft and not __TextRight) then
			break;
		else
			__index = __index + 1;
		end
	end;

	BigFootTooltip:SetOwner(UIParent, "ANCHOR_NONE");
--	BigFootTooltip:SetPoint("TOPLEFT", "UIParent", "BOTTOMRIGHT", 5, -5);
	BigFootTooltip:SetText("BigFootTooltip");
	BigFootTooltip:Show();
end

function BigFoot_Tooltip_GetText(__tooltip, __newlinechar)
	if (not __tooltip) then
		__tooltip = BigFootTooltip;
	end

	if (not __newlinechar) then
		__newlinechar = "<n>";
	end

	local __strDesc = "";

	__tooltip:Show();

	local __index = 1;

	while (true) do
		local __TextLeft = getglobal(__tooltip:GetName().."TextLeft"..__index);
		local __TextRight = getglobal(__tooltip:GetName().."TextRight"..__index);

		local __strLeft;
		local __strRight;

		__strLeft = __TextLeft and __TextLeft:GetText();

		__strRight = __TextRight and __TextRight:GetText();

		local __strFull = "";
		
		if ( __index == 1 ) then
			if ( __strLeft == nil ) then
				return;
			end

			__strTitle = __strLeft;
		end
		
		if ( __strLeft == nil and __strRight == nil ) then
			__strFull = "";
		else
			if ( __strLeft == nil ) then
				__strLeft = "";
			end

			if ( __strRight == nil ) then
				__strRight = "";
			end

			if ( __strRight ~= "" ) then
				__strFull = __strLeft.."<t>"..__strRight;
			else
				__strFull = __strLeft;
			end
		end

		if ( __strFull ~= "" ) then
			__strDesc = __strDesc..__strFull..__newlinechar;
		end

		if (not __TextLeft and not __TextRight) then
			break;
		else
			__index = __index + 1;
		end
	end
	
	return __strDesc;
end

--URL框体功能
function BigFoot_LaunchURL(__title, __url)
	BigFootURLFrameTitle:SetText("|cffffd100"..__title.."|r");
	BigFootURLFrameText:SetText(BF_URL_TEXT);

	-- Revise url to url encoding
	local __new_url = "";
	local __code;
	for __i = 1, string.len(__url), 1 do
		__code = string.byte(__url, __i);
		if (__code >= 128) then
			__new_url = __new_url .. string.format("%%%02X", __code);
		else
			__new_url = __new_url .. string.sub(__url, __i, __i);
		end
	end
	
	BigFootURLFrameURL.url = "bfurl:"..__new_url;

	BigFootURLFrameURL:SetText(BigFootURLFrameURL.url);

	BigFootURLFrame:Show();
end

-- 新手提示功能
function BigFoot_ShowNewbieTooltip(__title, ...)
	GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
	GameTooltip:SetText(__title, 1.0, 1.0, 1.0);
	local args = {...};
	local i;
	for i = 1, table.maxn(args), 1 do
		GameTooltip:AddLine(args[i], NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1.0, 1);
	end
	GameTooltip:Show();
end

function BigFoot_HideNewbieTooltip()
	GameTooltip:Hide();
end

function BigFoot_LocateKeyBinding(bindingName)
	KeyBindingFrame_LoadUI();
	local numBindings = GetNumBindings();
	local offset  = 1
	for i = 1 , numBindings do
		if bindingName ==GetBinding(i ,1) then
			offset = i
			break
		end
	end
	FauxScrollFrame_SetOffset(KeyBindingFrameScrollFrame,offset-1)
	ShowUIPanel(KeyBindingFrame);
	KeyBindingFrameScrollFrameScrollBar:SetValue((offset-1)*KEY_BINDING_HEIGHT)
end