
__BigFootReader_Books = {};

function __BigFootReader_OnTop(self)
	if (self.__book and __BigFootReader_Books[BigFootReaderFrame.__book]) then
		if (type(__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks) == "table") then
			if (__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnPageTop) then
				__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnPageTop();
			end
		end
	end
end

function __BigFootReader_OnBottom(self)
	if (self.__book and __BigFootReader_Books[BigFootReaderFrame.__book]) then
		if (type(__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks) == "table") then
			if (__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnPageBottom) then
				__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnPageBottom();
			end
		end
	end
end

function BigFootReader_OnScroll(self)
	local __scroll = getglobal(self:GetName().."ScrollBar");
	__scroll:SetValue(arg1);
	local __min;
	local __max;
	__min, __max = __scroll:GetMinMaxValues();
	if ( arg1 == 0 ) then
		getglobal(__scroll:GetName().."ScrollUpButton"):Disable();
		__BigFootReader_OnTop();
	else
		getglobal(__scroll:GetName().."ScrollUpButton"):Enable();
	end
	if (__scroll:GetValue() >= __max - 20) then
		getglobal(__scroll:GetName().."ScrollDownButton"):Disable();
		__BigFootReader_OnBottom();
	else
		getglobal(__scroll:GetName().."ScrollDownButton"):Enable();
	end
end

function BigFootReader_OnLinkEnter(self, __link)
	ShowInspectCursor();
	local __linkType, __linkContent = __BigFootReader_ParseLink(__link);
	if (BigFootReaderFrame.__book and __BigFootReader_Books[BigFootReaderFrame.__book]) then
		if (type(__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks) == "table") then
			if (__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnLinkEnter) then
				__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnLinkEnter(__linkType, __linkContent);
			end
		end
	end
end

function BigFootReader_OnLinkLeave(self, __link)
	ResetCursor();
	local __linkType, __linkContent = __BigFootReader_ParseLink(__link);
	if (BigFootReaderFrame.__book and __BigFootReader_Books[BigFootReaderFrame.__book]) then
		if (type(__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks) == "table") then
			if (__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnLinkLeave) then
				__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnLinkLeave(__linkType, __linkContent);
			end
		end
	end
end

function BigFootReader_OnLinkClick(self, __link)
	local __linkType, __linkContent = __BigFootReader_ParseLink(__link);
	if (BigFootReaderFrame.__book and __BigFootReader_Books[BigFootReaderFrame.__book]) then
		if (type(__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks) == "table") then
			if (__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnLinkClick) then
				__BigFootReader_Books[BigFootReaderFrame.__book].__callbacks.OnLinkClick(__linkType, __linkContent);
			end
		end
	end
end

function __BigFootReader_ParseLink(__link)
	if (string.lower(string.sub(__link, 1, 3)) == "url") then
		return "url", string.sub(__link, 5, string.len(__link) - 4);
	end
end

function BigFootReaderFrame_OnLoad(self)
end

function BigFootReaderButtonClose_OnClick(self, button)
	
end

function __BigFootReader_GetPageCount(__pageVariable)
	local __index = 1;
	while (getglobal(__pageVariable..__index)) do
		__index = __index + 1;
	end

	return __index - 1;
end

function __BigFootReader_SetFont(__font, __fs)
	if (not __fs) then
		return;
	end

	if (__fs.inherits) then
		__font:SetFontObject(__fs.inherits);
	end

	if (__fs.path and __fs.height) then
		__font:SetFont(__fs.path, __fs.height, __fs.flags);
	end

	if (__fs.color) then
		__font:SetTextColor(__fs.color.r, __fs.color.g, __fs.color.b, __fs.color.a);
	end

	if (__fs.spacing) then
		__font:SetSpacing(__fs.spacing);
	end

	if (__fs.justifyH) then
		__font:SetJustifyH(__fs.justifyH);
	end

	if (__fs.justifyV) then
		__font:SetJustifyV(__fs.justifyV);
	end

	if (__fs.shadowColor) then
		__font:SetShadowColor(__fs.shadowColor.r, __fs.shadowColor.g, __fs.shadowColor.b, __fs.shadowColor.a);
	end

	if (__fs.shadowOffset) then
		__font:SetShadowOffset(__fs.shadowOffset);
	end
end

function __BigFootReader_EnableScroll(__enabled)
	if (__enabled) then
		BigFootReaderScrollFrame:EnableDrawLayer("ARTWORK");

		BigFootReaderScrollFrameScrollBar:Show();

		BigFootReaderText:SetWidth(500);
		BigFootReaderText:SetHeight(800);
		BigFootReaderText:SetPoint("TOPLEFT", "BigFootReaderScrollFrame", "TOPLEFT", 25, 0);
	else
		BigFootReaderScrollFrame:DisableDrawLayer("ARTWORK");

		BigFootReaderScrollFrameScrollBar:Hide();

		BigFootReaderText:SetWidth(510);
		BigFootReaderText:SetHeight(800);
		BigFootReaderText:SetPoint("TOPLEFT", "BigFootReaderScrollFrame", "TOPLEFT", 30, 0);
	end
end

--------------------------------------------------------------
-- BigFootReader_RegisterBook
-- 注册一本书到游戏中去
-- __bookName - 书名字符串，用来标定一本书，可以取诸如"BOOK_TWIN_PASSWORD"之类
-- __pageVariable - 页码变量，该变量以1开始递增，当递增到最后结束
-- __fontNormal - 缺省字体
-- __fontHeader1 - 标题1的字体
-- __fontHeader2 - 标题2的字体
-- __fontHeader3 - 标题3的字体
-- linkCallback - 链接的回调函数
--------------------------------------------------------------
function BigFootReader_RegisterBook(__bookName, __pageVariable, __enableScroll, __fontNormal, __fontHeader1, __fontHeader2, __fontHeader3, __callbacks)
	__BigFootReader_Books[__bookName] = {};
	__BigFootReader_Books[__bookName].__title = __bookName;
	__BigFootReader_Books[__bookName].__variable = __pageVariable;
	__BigFootReader_Books[__bookName].__scroll = __enableScroll;
	__BigFootReader_Books[__bookName].__pages = __BigFootReader_GetPageCount(__pageVariable);
	__BigFootReader_Books[__bookName].__fontNormal = __fontNormal;
	__BigFootReader_Books[__bookName].__fontHeader1 = __fontHeader1;
	__BigFootReader_Books[__bookName].__fontHeader2 = __fontHeader2;
	__BigFootReader_Books[__bookName].__fontHeader3 = __fontHeader3;
	__BigFootReader_Books[__bookName].__callbacks = __callbacks;
end

function BigFootReader_JumpToPage(__page)
	if (__page > BigFootReaderFrame.__totalPage) then
		__page = BigFootReaderFrame.__totalPage;
	end

	if (__page < 1) then
		__page = 1;
	end

	BigFootReaderText:SetText(getglobal(__BigFootReader_Books[BigFootReaderFrame.__book].__variable..__page));

	BigFootReaderFrame.__currentPage = __page;

	if (BigFootReaderFrame.__totalPage > 1) then
		if (__page == BigFootReaderFrame.__totalPage) then
			BigFootReaderNextPage:Disable();
		else
			BigFootReaderNextPage:Enable();
		end

		if (__page == 1) then
			BigFootReaderPrevPage:Disable();
		else
			BigFootReaderPrevPage:Enable();
		end
	end

	if (BigFootReaderPageSlider:IsVisible()) then
		BigFootReaderPageText:SetText(__page.."/"..BigFootReaderFrame.__totalPage.." 页");
	end
end

function BigFootReader_ShowBook(__bookName, __page)
	if (__BigFootReader_Books[__bookName]) then
		if (not BigFootReaderFrame:IsVisible()) then
			BigFootReaderFrame:Show();
		end

		-- 标记当前书名
		BigFootReaderFrame.__book = __bookName;
		BigFootReaderFrame.__totalPage = __BigFootReader_Books[__bookName].__pages;

		if (__BigFootReader_Books[__bookName].__scroll) then
			__BigFootReader_EnableScroll(true);
		else
			__BigFootReader_EnableScroll(false);
		end

		-- 首先，我们将设置这本书所需要的字体
		__BigFootReader_SetFont(BigFootReaderFontNormal, __BigFootReader_Books[__bookName].__fontNormal);
		__BigFootReader_SetFont(BigFootReaderFontHeader1, __BigFootReader_Books[__bookName].__fontHeader1);
		__BigFootReader_SetFont(BigFootReaderFontHeader2, __BigFootReader_Books[__bookName].__fontHeader3);
		__BigFootReader_SetFont(BigFootReaderFontHeader2, __BigFootReader_Books[__bookName].__fontHeader3);
		
		BigFootReaderFrameTitle:SetText(__BigFootReader_Books[__bookName].__title);

		if (not __page) then
			__page = 1;
		end

		if (BigFootReaderFrame.__totalPage > 1) then
			BigFootReaderPrevPage:Show();
			BigFootReaderNextPage:Show();

			BigFootReaderPageSlider:Show();
			BigFootReaderPageSlider:SetMinMaxValues(1, BigFootReaderFrame.__totalPage);
			BigFootReaderPageSlider:SetValueStep(1);

			BigFootReaderPageSlider:SetValue(__page);
		else
			BigFootReaderPrevPage:Hide();
			BigFootReaderNextPage:Hide();

			BigFootReaderPageSlider:Hide();

			BigFootReader_JumpToPage(__page);
		end
	end
end

function BigFootReader_OnPrevPage(self)
	if (BigFootReaderFrame.__currentPage > 1) then
		BigFootReaderPageSlider:SetValue(BigFootReaderFrame.__currentPage - 1);
	end
end

function BigFootReader_OnNextPage(self)
	if (BigFootReaderFrame.__currentPage < BigFootReaderFrame.__totalPage) then
		BigFootReaderPageSlider:SetValue(BigFootReaderFrame.__currentPage + 1);
	end
end

function BigFootReaderPageSlider_OnChange(self)
	local __page = self:GetValue();
	BigFootReader_JumpToPage(__page);
end

function BigFootReader_Show(denySound)
	if (denySound) then
		BigFootReaderFrame.denySound = 1;
		BigFootReaderFrame:Show();
	else
		BigFootReaderFrame:Show();
	end
end

function BigFootReader_Hide(denySound)
	if (denySound) then
		BigFootReaderFrame.denySound = 1;
		BigFootReaderFrame:Hide();
	else
		BigFootReaderFrame:Hide();
	end
end