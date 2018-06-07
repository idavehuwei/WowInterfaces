--------------------------------------------------------------------
-- PopFrame ver 1.0
-- 作者: dugu
-- 日期: 2010-11-5
-- 描述: 提供一个弹出的对话框, 提示用户一些必要的信息
-- 版权所有 (c) duowan.com
--------------------------------------------------------------------
local L = DUOWAN_LOCALIZATION;
local DWPOPUPFRAMECONTENTTEXT = "";
local PopFrameText = "";
local _DEBUG = false;
local VERSION = "1.0.1";
local DATALOW = "2010-11-10";
local DATAHIGH = "2010-11-20";
--------------------------------------------------
-- 显示的内容
local ContentTable = {
	{"领取YY靓号激活码", "　　多玩国服巫妖王冲级赛圆满结束, 排行榜前1000名的参赛玩家请尽快到多玩魔兽专区领取YY靓号激活码。选择属于自己的YY靓号。对于给您造成的打扰我们非常抱歉！", false},
	{false, "◆专区地址: wow.duowan.com◆", false},	
	{"奖项设置:", "　　排行榜前50名的参赛玩家获得6位YY靓号、50-1000名的参赛玩家获得7位YY靓号选择机会。", false},	
	{"注意事项:", "　　本次发放的激活码有效期至2010年12月9日，请获奖玩家尽快领取。", false},	
	{false, "", true},
};

--------------------------------------------------
function dwPopupFrameLevelButton_OnClick(self)
	self:GetParent():Hide();
	PlaySound("igMainMenuOption");
end

-- 日期、版本等条件
function dwIsShowPopFrame(dateL, dateH)
	local version = dwRawGetCVar("DuowanConfig", "Ver", "1.0.0");
	
	if (dwInDate(dateL, dataH) and (version ~= VERSION)) then		
		dwSetCVar("DuowanConfig", "Ver", VERSION);
		return true;
	end

	return false;
end

function dwPopupFrame_OnLoad(self)
	dwPopupFrameLevelButton:SetText(L["Close"]);
	dwPopupFrameLable:SetFont(DUOWAN_CHANGELOG_FONT, 13, "OUTLINE");
	dwPopupFrameLable:SetText(L["FootText"]);

	local sb = dwGetglobal("dwPopupFrameScrollFrameScrollBar");
	sb:ClearAllPoints();
	sb:SetPoint("TOPLEFT", dwPopupFrameScrollFrame, "TOPRIGHT", 6, -14);
	sb:SetPoint("BOTTOMLEFT", dwPopupFrameScrollFrame, "BOTTOMRIGHT", 6, 11);

	dwCreateBookHTML();
	
	PopFrameText = dwPopFrameFormatText(ContentTable);
	self:RegisterEvent("VARIABLES_LOADED");
end

function dwPopupFrame_OnEvent(self, event, ...)
	if (event == "VARIABLES_LOADED") then
		if (_DEBUG or dwIsShowPopFrame(DATALOW, DATAHIGH)) then
			dwShowPopFrame(PopFrameText);
		end
	end
end

function dwPopupFrame_OnMouseDown(self)	
	self:StartMoving();
	self.isMoving = true;
end

function dwPopupFrame_OnMouseUp(self)
	if ( self.isMoving ) then
		self:StopMovingOrSizing();
		self.isMoving = false;
	end
end

function dwCreateBookHTML()
	local simpleHTML = _G["dwPopupFrameContent"]
	if (not simpleHTML) then
		simpleHTML = CreateFrame("SimpleHTML", "dwPopupFrameContent", dwPopupFrameScrollFrameChild);
		simpleHTML:SetPoint("TOPLEFT", dwPopupFrameScrollFrameChild, "TOPLEFT", 5, -10);
		simpleHTML:SetPoint("BOTTOMRIGHT", dwPopupFrameScrollFrameChild, "BOTTOMRIGHT", -5, 5);
		simpleHTML:SetWidth(285);
		simpleHTML:SetFont(STANDARD_TEXT_FONT, 14);		
		simpleHTML:SetTextColor(0.88, 0.85, 0.69);
		simpleHTML:SetSpacing(6);
		simpleHTML:SetFont("h1", STANDARD_TEXT_FONT, 16);		
		simpleHTML:SetTextColor("h1", 1.0, 0.84, 0.0);
		simpleHTML:SetSpacing("h1", 10);
		simpleHTML:SetFont("h2", STANDARD_TEXT_FONT, 14);
		simpleHTML:SetTextColor("h2", 1.0, 0.82, 0.09765625);
		simpleHTML:SetSpacing('h2', 5);
		simpleHTML:SetFont("p", DUOWAN_CHANGELOG_FONT, 14);
		simpleHTML:SetTextColor("p", 1, 1, 1);
		--simpleHTML:SetIndentedWordWrap("p", false);
	end	
	return simpleHTML;
end

----------------------------------------
-- 格式化輸出
function POP_HTML_BEGIN()
	DWPOPUPFRAMECONTENTTEXT = "";
	DWPOPUPFRAMECONTENTTEXT = DWPOPUPFRAMECONTENTTEXT ..  "<HTML><BODY>";
end

function POP_HTML_TITLE(txt)
	DWPOPUPFRAMECONTENTTEXT = DWPOPUPFRAMECONTENTTEXT ..  "<H1>" .. txt .. "</H1>";
end

function POP_HTML_SPACE(value)
	if (value) then
		DWPOPUPFRAMECONTENTTEXT = DWPOPUPFRAMECONTENTTEXT .. "<BR/>";
	end	
end

function POP_HTML_LOG(desc)
	DWPOPUPFRAMECONTENTTEXT = DWPOPUPFRAMECONTENTTEXT ..  "<P>　　" .. desc .. "</P>";
end

function POP_HTML_END()
	DWPOPUPFRAMECONTENTTEXT = DWPOPUPFRAMECONTENTTEXT ..  "</BODY></HTML>";
end

-----------------------------------------
function dwPopFrameFormatText(strTable)
	local tmpStr = "";
	for i, v in ipairs(strTable) do
		if (v[1]) then
			tmpStr = tmpStr .. "<H1>" .. v[1] .. "</H1>";
		end		
		tmpStr = tmpStr .. "<P>" .. v[2] .. "</P>";
		if (v[3]) then
			tmpStr = tmpStr .. "<BR/>";
		end		
	end

	return tmpStr;
end

function dwShowPopFrame(text)	
	POP_HTML_BEGIN();
	if (type(text) == "string") then
		DWPOPUPFRAMECONTENTTEXT = DWPOPUPFRAMECONTENTTEXT .. text;
	elseif (type(text) == "table") then
		for i, v in ipairs(text) do
			POP_HTML_TITLE(v[1]);
			POP_HTML_LOG(v[2]);
			POP_HTML_SPACE(v[3]);
		end
	end
	POP_HTML_END();

	dwPopupFrameContent:SetText(DWPOPUPFRAMECONTENTTEXT);
	dwPopupFrame:Show();
	PlaySound("igMainMenuOption");
end

function POP_TEST()
	print(dwIsShowPopFrame(DATALOW, DATAHIGH))
end