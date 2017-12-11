-- /////////////////////////////////////////////////////////////////////////////
-- =============================================================================
--  ClearFont v3.05b 兼容模式
--  （根据ClearFont v20000-2 版本汉化修改）
--  原作者：KIRKBURN
--  官方网页：http://www.clearfont.co.uk/
--  汉化修改：五区 元素之力 逆袭的蓝
--  发布页面：http://bbs.game.mop.com/viewthread.php?tid=1503056
--  发布日期：08.12.14
-- -----------------------------------------------------------------------------
--  CLEARFONT.LUA - 标准WOW用户界面字体
--	A. ClearFont框架、预先定义字体位置
--	B. WOW用户界面设计
--	C. 重新载入功能
--	D. 第一次启动时应用以上设定
-- =============================================================================
-- /////////////////////////////////////////////////////////////////////////////




-- =============================================================================
--  A. ClearFont框架、预先定义字体位置
--   你可以根据例子添加属于自己的字体位置
-- =============================================================================

	ClearFont = CreateFrame("Frame", "ClearFont");

-- 指出在哪里寻找字体
	local CLEAR_FONT_BASE = "Fonts\\";

-- 生命条、经验条上显示的英文和数字
	local CLEAR_FONT_NUMBER = CLEAR_FONT_BASE .. "ZYKai_T.TTF";
-- 任务说明和书信、石碑的正文字体
	local CLEAR_FONT_QUEST = CLEAR_FONT_BASE .. "ZYKai_T.TTF";
-- 战斗伤害数值提示
	local CLEAR_FONT_DAMAGE = CLEAR_FONT_BASE .. "ZYKai_T.TTF";
-- 游戏界面中的主要字体
	local CLEAR_FONT = CLEAR_FONT_BASE .. "ZYKai_T.TTF";
-- 物品、技能的说明字体
	local CLEAR_FONT_ITEM = CLEAR_FONT_BASE .. "ZYKai_T.TTF";
-- 聊天字体
	local CLEAR_FONT_CHAT = CLEAR_FONT_BASE .. "ZYKai_T.TTF";

-- 添加属于自己的字体 （范例）
--	local YOUR_FONT_STYLE = CLEAR_FONT_BASE .. "YourFontName.ttf";


-- -----------------------------------------------------------------------------
-- 全局字体比例调整（当你觉得所有字体都太大或太小时调整这个参数）
--  例如：你想把所有字体缩小到80%，那么可以将"1.0"改成"0.8"
-- -----------------------------------------------------------------------------

	local CF_SCALE = 1.0


-- -----------------------------------------------------------------------------
-- 检查存在的字体并改变它们
-- -----------------------------------------------------------------------------

	local function CanSetFont(object) 
	   return (type(object)=="table" 
		   and object.SetFont and object.IsObjectType 
		      and not object:IsObjectType("SimpleHTML")); 
	end




-- =============================================================================
--  B. WOW用户接口设计
-- =============================================================================
--   这是**修改字体大小/特效**最重要的部分
--   主要的字体被最先列出，其余部分字体按照字母表顺序排列
--   以下列出只包括 ClearFont 修改了的范例部分，并不是所有方面都会显示出来（范例：阴影）
-- -----------------------------------------------------------------------------
--  对于以下可用代码的解释
--   不带描边:		Font:SetFont(SOMETHING_TEXT_FONT, x * scale)
--   普通描边:		Font:SetFont(SOMETHING_TEXT_FONT, x * scale, "OUTLINE")
--   粗描边:			Font:SetFont(SOMETHING_TEXT_FONT, x * scale, "THICKOUTLINE")
--   字体颜色:		Font:SetTextColor(r, g, b)
--   阴影颜色:		Font:SetShadowColor(r, g, b) 
--   阴影位置:		Font:SetShadowOffset(x, y) 
--   透明度:			Font:SetAlpha(x)
--
--  范例：			SetFont(CLEAR_FONT, 13 * CF_SCALE)
--   在括号里的第一部分是(A.)中申明过的字体代号，第二部分是字体大小
-- =============================================================================


	function ClearFont:ApplySystemFonts()


-- -----------------------------------------------------------------------------
-- 特殊游戏世界的"3D"字体（Dark Imakuni）
--  ***注意*** ClearFont 不能定义这些字体的大小和特效（受限于Blizzard默认游戏框架）
-- -----------------------------------------------------------------------------
--  这些行语句会在用默认团队框架“设置MT/MA”时导致问题
--  如果你不用到“设置MT/MA”，可以保留这些行语句，不会有任何问题！
--  屏蔽这些语句的方法，在对应代码**行首**加上“--”
--   范例：--	STANDARD_TEXT_FONT = CLEAR_FONT_CHAT;
-- -----------------------------------------------------------------------------

-- 聊天泡泡
	STANDARD_TEXT_FONT = CLEAR_FONT_CHAT;

-- 头像上的名字，漂浮文本（远处即可看见）
	UNIT_NAME_FONT = CLEAR_FONT;

-- 头像上的名字，在姓名板上（NamePlate，按“V”后靠近目标，出现的血条）
	NAMEPLATE_FONT = CLEAR_FONT;

-- 被攻击目标上方弹出的伤害指示（与插件SCT/DCT无关）
	DAMAGE_TEXT_FONT = CLEAR_FONT_DAMAGE;


-- ----------------------------------------------------------------------------- 
-- 下拉菜单字体大小（Note by Kirkburn）
--  ***注意*** ClearFont 只能定义这个字体的大小（受限于Blizzard默认游戏框架）
-- ----------------------------------------------------------------------------- 
--  这些行语句会在用默认团队框架“设置MT/MA”时导致问题
--  如果你不用到“设置MT/MA”，可以保留这些行语句，不会有任何问题！
--  屏蔽这些语句的方法，在对应代码**行首**加上“--”
--   范例：--	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12 * CF_SCALE;
-- ----------------------------------------------------------------------------- 

	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12 * CF_SCALE;


-- -----------------------------------------------------------------------------
-- 职业色彩（以下均为默认值/默认屏蔽）
-- -----------------------------------------------------------------------------

--	RAID_CLASS_COLORS = {
--		["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45 },			-- 猎人
--		["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79 },			-- 术士
--		["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0 },				-- 牧师
--		["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73 },			-- 圣骑士
--		["MAGE"] = { r = 0.41, g = 0.8, b = 0.94 },				-- 法师
--		["ROGUE"] = { r = 1.0, g = 0.96, b = 0.41 },			-- 潜行者
--		["DRUID"] = { r = 1.0, g = 0.49, b = 0.04 },			-- 德鲁伊
--		["SHAMAN"] = { r = 0.14, g = 0.35, b = 1.0 },			-- 萨满
--		["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43 }			-- 战士
--		["DEATHKNIGHT"] = { r = 0.77, g = 0.12 , b = 0.23 },	-- 死亡骑士
--	};


-- -----------------------------------------------------------------------------
-- 系统字体（以下均为默认值/默认屏蔽）
-- 这类字体是系统字体模版，主要用来被其它字体继承（New in WotLK/3.x）
-- -----------------------------------------------------------------------------

--	SystemFont_Tiny:SetFont(CLEAR_FONT, 9 * CF_SCALE)
	
--	SystemFont_Small:SetFont(CLEAR_FONT, 10 * CF_SCALE)
	
--	SystemFont_Outline_Small:SetFont(CLEAR_FONT_CHAT, 12 * CF_SCALE, "OUTLINE")
	
--	SystemFont_Shadow_Small:SetFont(CLEAR_FONT, 15 * CF_SCALE)
--	SystemFont_Shadow_Small:SetShadowColor(0, 0, 0) 
--	SystemFont_Shadow_Small:SetShadowOffset(1, -1) 

--	SystemFont_InverseShadow_Small:SetFont(CLEAR_FONT, 10 * CF_SCALE)
--	SystemFont_InverseShadow_Small:SetShadowColor(0.4, 0.4, 0.4) 
--	SystemFont_InverseShadow_Small:SetShadowOffset(1, -1) 
--	SystemFont_InverseShadow_Small:SetAlpha(0.75)
	
--	SystemFont_Med1:SetFont(CLEAR_FONT, 13 * CF_SCALE)

--	SystemFont_Shadow_Med1:SetFont(CLEAR_FONT, 15 * CF_SCALE)
--	SystemFont_Shadow_Med1:SetTextColor(0, 0, 0)
--	SystemFont_Shadow_Med1:SetShadowOffset(1, -1) 
	
--	SystemFont_Med2:SetFont(CLEAR_FONT_DAMAGE, 14 * CF_SCALE)
	
--	SystemFont_Med3:SetFont(CLEAR_FONT_DAMAGE, 13 * CF_SCALE)
	
--	SystemFont_Shadow_Med3:SetFont(CLEAR_FONT_DAMAGE, 15 * CF_SCALE)
--	SystemFont_Shadow_Med3:SetTextColor(0, 0, 0)
--	SystemFont_Shadow_Med3:SetShadowOffset(1, -1) 
	
--	SystemFont_Large:SetFont(CLEAR_FONT, 13 * CF_SCALE)
	
--	SystemFont_Shadow_Large:SetFont(CLEAR_FONT, 17 * CF_SCALE)
--	SystemFont_Shadow_Large:SetTextColor(0, 0, 0)
--	SystemFont_Shadow_Large:SetShadowOffset(1, -1) 
	
--	SystemFont_Shadow_Huge1:SetFont(CLEAR_FONT, 20 * CF_SCALE)
--	SystemFont_Shadow_Huge1:SetTextColor(0, 0, 0)
--	SystemFont_Shadow_Huge1:SetShadowOffset(1, -1) 
	
--	SystemFont_OutlineThick_Huge2:SetFont(CLEAR_FONT, 22 * CF_SCALE, "THICKOUTLINE")
	
--	SystemFont_Shadow_Outline_Huge2:SetFont(CLEAR_FONT, 25 * CF_SCALE, "OUTLINE")
--	SystemFont_Shadow_Outline_Huge2:SetTextColor(0, 0, 0)
--	SystemFont_Shadow_Outline_Huge2:SetShadowOffset(2, -2)
	
--	SystemFont_Shadow_Huge3:SetFont(CLEAR_FONT, 25 * CF_SCALE)
--	SystemFont_Shadow_Huge3:SetTextColor(0, 0, 0)
--	SystemFont_Shadow_Huge3:SetShadowOffset(1, -1) 
	
--	SystemFont_OutlineThick_Huge4:SetFont(CLEAR_FONT, 26 * CF_SCALE, "THICKOUTLINE")
	
--	SystemFont_OutlineThick_WTF:SetFont(CLEAR_FONT_CHAT, 112 * CF_SCALE, "THICKOUTLINE")
	
--	ReputationDetailFont:SetFont(CLEAR_FONT, 13 * CF_SCALE)
--	ReputationDetailFont:SetTextColor(0, 0, 0)
--	ReputationDetailFont:SetShadowColor(1, 1, 1) 
--	ReputationDetailFont:SetShadowOffset(1, -1) 


-- -----------------------------------------------------------------------------
-- 主游戏字体: 随处可见的主要的字体
-- -----------------------------------------------------------------------------

-- 主标题，按钮，技能标题（技能书面板），任务名（任务日志面板），好友角色名字（社交面板），荣誉点数、竞技场点数（PvP面板），系统菜单项目
	if (CanSetFont(GameFontNormal)) then 				GameFontNormal:SetFont(CLEAR_FONT, 14 * CF_SCALE); end	-- 默认值：15
   
-- 副标题，系统菜单按钮，成就点数、成就条目（成就面板），货币面板条目，高亮任务名（任务日志面板），日历日期
	if (CanSetFont(GameFontHighlight)) then 			GameFontHighlight:SetFont(CLEAR_FONT, 14 * CF_SCALE); end	-- 默认值：15

-- 按钮（不可选状态）
	if (CanSetFont(GameFontDisable)) then 				GameFontDisable:SetFont(CLEAR_FONT, 14 * CF_SCALE); end
	if (CanSetFont(GameFontDisable)) then 				GameFontDisable:SetTextColor(0.6, 0.6, 0.6); end	-- 默认值：(0.5, 0.5, 0.5)

-- 各种色彩文字
	if (CanSetFont(GameFontGreen)) then 				GameFontGreen:SetFont(CLEAR_FONT, 14 * CF_SCALE); end	-- 默认值：15
	if (CanSetFont(GameFontRed)) then 					GameFontRed:SetFont(CLEAR_FONT, 14 * CF_SCALE); end
	if (CanSetFont(GameFontBlack)) then 				GameFontBlack:SetFont(CLEAR_FONT, 14 * CF_SCALE); end
	if (CanSetFont(GameFontWhite)) then 				GameFontWhite:SetFont(CLEAR_FONT, 14 * CF_SCALE); end


-- -----------------------------------------------------------------------------
-- 小字体：经常用小字体的地方，如角色属性面板，BUFF时间，宏标题
-- -----------------------------------------------------------------------------

-- 头像框架名字，BUFF时间，未选择的面板标签，面板中大部分描述字体，天赋点的数字，头衔奖励（成就面板），查询、公会成员角色名字（社交面板），
-- 竞技场站队详细、站队等级（PvP面板），日历活动条目
	if (CanSetFont(GameFontNormalSmall)) then 			GameFontNormalSmall:SetFont(CLEAR_FONT, 12 * CF_SCALE); end		-- 默认值：15

-- 高亮字体，下拉菜单选项，已选择的面板标签，角色属性、技能的数字、声望条目（角色信息面板），天赋点数（天赋面板），角色等级、职业等信息、公会信息（社交面板），
-- 详细荣誉点、竞技场比分（PvP面板），时间信息，系统菜单子项目
	if (CanSetFont(GameFontHighlightSmall)) then 		GameFontHighlightSmall:SetFont(CLEAR_FONT, 12 * CF_SCALE); end	-- 默认值：15
	if (CanSetFont(GameFontHighlightSmallOutline)) then	GameFontHighlightSmallOutline:SetFont(CLEAR_FONT, 12 * CF_SCALE, "OUTLINE"); end

-- PvP面板描述，团队面板按钮等
	if (CanSetFont(GameFontDisableSmall)) then			GameFontDisableSmall:SetFont(CLEAR_FONT, 12 * CF_SCALE); end	-- 默认值：15
	if (CanSetFont(GameFontDisableSmall)) then			GameFontDisableSmall:SetTextColor(0.6, 0.6, 0.6); end	-- 默认值：(0.5, 0.5, 0.5)

-- （未确认）
	if (CanSetFont(GameFontDarkGraySmall)) then 		GameFontDarkGraySmall:SetFont(CLEAR_FONT, 12 * CF_SCALE); end	-- 默认值：15
	if (CanSetFont(GameFontDarkGraySmall)) then 		GameFontDarkGraySmall:SetTextColor(0.4, 0.4, 0.4); end	-- 默认值：(0.35, 0.35, 0.35)

-- （未确认）
	if (CanSetFont(GameFontGreenSmall)) then 			GameFontGreenSmall:SetFont(CLEAR_FONT, 12 * CF_SCALE); end	-- 默认值：15
	if (CanSetFont(GameFontRedSmall)) then				GameFontRedSmall:SetFont(CLEAR_FONT, 12 * CF_SCALE); end
	
-- 超小字体
	if (CanSetFont(GameFontHighlightExtraSmall)) then 		GameFontHighlightExtraSmall:SetFont(CLEAR_FONT, 11 * CF_SCALE); end		-- 默认值：15


-- -----------------------------------------------------------------------------
-- 大字体：标题
-- -----------------------------------------------------------------------------

-- 时钟，秒表
	if (CanSetFont(GameFontNormalLarge)) then 			GameFontNormalLarge:SetFont(CLEAR_FONT, 13 * CF_SCALE); end		-- 默认值：17
	if (CanSetFont(GameFontHighlightLarge)) then 		GameFontHighlightLarge:SetFont(CLEAR_FONT, 13 * CF_SCALE); end

-- 竞技场面板（未确认）
	if (CanSetFont(GameFontDisableLarge)) then			GameFontDisableLarge:SetFont(CLEAR_FONT, 14 * CF_SCALE); end	-- 默认值：17
	if (CanSetFont(GameFontDisableLarge)) then			GameFontDisableLarge:SetTextColor(0.6, 0.6, 0.6); end	-- 默认值：(0.5, 0.5, 0.5)

-- （未确认）
	if (CanSetFont(GameFontGreenLarge)) then 			GameFontGreenLarge:SetFont(CLEAR_FONT, 14 * CF_SCALE); end	-- 默认值：17
	if (CanSetFont(GameFontRedLarge)) then 			GameFontRedLarge:SetFont(CLEAR_FONT, 14 * CF_SCALE); end


-- -----------------------------------------------------------------------------
-- 巨大字体：Raid警报
-- -----------------------------------------------------------------------------

	if (CanSetFont(GameFontNormalHuge)) then			GameFontNormalHuge:SetFont(CLEAR_FONT, 20 * CF_SCALE); end	-- 默认值：20


-- -----------------------------------------------------------------------------
-- 数字字体: 拍卖行，金币，按键绑定，物品堆栈数量
-- -----------------------------------------------------------------------------

-- 金币，物品、Buff堆栈数量
	if (CanSetFont(NumberFontNormal)) then				NumberFontNormal:SetFont(CLEAR_FONT_NUMBER, 12 * CF_SCALE, "OUTLINE"); end		-- 默认值：12
	if (CanSetFont(NumberFontNormalYellow)) then 		NumberFontNormalYellow:SetFont(CLEAR_FONT_NUMBER, 12 * CF_SCALE); end

-- 按键绑定
	if (CanSetFont(NumberFontNormalSmall)) then 		NumberFontNormalSmall:SetFont(CLEAR_FONT_NUMBER, 11 * CF_SCALE, "OUTLINE"); end		-- 默认值：11
	if (CanSetFont(NumberFontNormalSmallGray)) then 	NumberFontNormalSmallGray:SetFont(CLEAR_FONT_NUMBER, 11 * CF_SCALE, "THICKOUTLINE"); end

-- （未确认）
	if (CanSetFont(NumberFontNormalLarge)) then 		NumberFontNormalLarge:SetFont(CLEAR_FONT_NUMBER, 14 * CF_SCALE, "OUTLINE"); end		-- 默认值：14

-- （未确认）
	if (CanSetFont(NumberFontNormalHuge)) then			NumberFontNormalHuge:SetFont(CLEAR_FONT_NUMBER, 20 * CF_SCALE, "THICKOUTLINE"); end	-- 默认值：20
--	if (CanSetFont(NumberFontNormalHuge)) then			NumberFontNormalHuge:SetAlpha(30); end


-- -----------------------------------------------------------------------------
-- 聊天窗口字体和聊天输入框字体
-- -----------------------------------------------------------------------------

-- 聊天输入框字体
	if (CanSetFont(ChatFontNormal)) then 				ChatFontNormal:SetFont(CLEAR_FONT_CHAT, 14 * CF_SCALE); end	-- 默认值：14

-- 可选聊天框字体
	CHAT_FONT_HEIGHTS = {
		[1] = 7,
		[2] = 8,
		[3] = 9,
		[4] = 10,
		[5] = 11,
		[6] = 12,
		[7] = 13,
		[8] = 14,
		[9] = 15,
		[10] = 16,
		[11] = 17,
		[12] = 18,
		[13] = 19,
		[14] = 20,
		[15] = 21,
		[16] = 22,
		[17] = 23,
		[18] = 24
	};

-- 聊天窗口默认字体
	if (CanSetFont(ChatFontSmall)) then 				ChatFontSmall:SetFont(CLEAR_FONT_CHAT, 13 * CF_SCALE); end	-- 默认值：12


-- -----------------------------------------------------------------------------
-- 战斗文字: 暴雪内置战斗指示器
-- -----------------------------------------------------------------------------

	if (CanSetFont(CombatTextFont)) then				CombatTextFont:SetFont(CLEAR_FONT_DAMAGE, 25 * CF_SCALE); end		-- 默认值：25


-- -----------------------------------------------------------------------------
-- 任务日志: 任务日志、书籍等
-- -----------------------------------------------------------------------------

-- 任务标题
	if (CanSetFont(QuestTitleFont)) then 				QuestTitleFont:SetFont(CLEAR_FONT_QUEST, 15 * CF_SCALE); end	-- 默认值：17
	if (CanSetFont(QuestTitleFont)) then 				QuestTitleFont:SetShadowColor(0.54, 0.4, 0.1); end		-- 默认值：(0, 0, 0)

-- 任务描述
	if (CanSetFont(QuestFont)) then 		   			QuestFont:SetFont(CLEAR_FONT_QUEST, 14 * CF_SCALE); end		-- 默认值：14
	if (CanSetFont(QuestFont)) then 		   			QuestFont:SetTextColor(0.15, 0.09, 0.04); end			-- 默认值：(0, 0, 0)

-- 任务目标
	if (CanSetFont(QuestFontNormalSmall)) then			QuestFontNormalSmall:SetFont(CLEAR_FONT, 12 * CF_SCALE); end	-- 默认值：14
	if (CanSetFont(QuestFontNormalSmall)) then			QuestFontNormalSmall:SetShadowColor(0.54, 0.4, 0.1); end	-- 默认值：(0.3, 0.18, 0)

-- 任务高亮
	if (CanSetFont(QuestFontHighlight)) then 			QuestFontHighlight:SetFont(CLEAR_FONT_QUEST, 13 * CF_SCALE); end	-- 默认值：13


-- -----------------------------------------------------------------------------
-- 对话框按钮："同意"等字样
-- -----------------------------------------------------------------------------

	if (CanSetFont(DialogButtonNormalText)) then 		DialogButtonNormalText:SetFont(CLEAR_FONT, 13 * CF_SCALE); end	-- 默认值：13
	if (CanSetFont(DialogButtonHighlightText)) then 	DialogButtonHighlightText:SetFont(CLEAR_FONT, 13 * CF_SCALE); end


-- -----------------------------------------------------------------------------
-- 错误字体："另一个动作正在进行中"等字样
-- -----------------------------------------------------------------------------

	if (CanSetFont(ErrorFont)) then					ErrorFont:SetFont(CLEAR_FONT, 14 * CF_SCALE); end	-- 默认值：17
	if (CanSetFont(ErrorFont)) then					ErrorFont:SetShadowOffset(1, -1); end	-- 默认值：(1, -1)


-- -----------------------------------------------------------------------------
-- 物品信息: 那些"按右键阅读"的物品（任务物品的内容字体，比如可以携带的书籍、信件的副本等）
-- -----------------------------------------------------------------------------

	if (CanSetFont(ItemTextFontNormal)) then 	 	  	ItemTextFontNormal:SetFont(CLEAR_FONT_ITEM, 15 * CF_SCALE); end		-- 默认值：15


-- -----------------------------------------------------------------------------
-- 邮件
-- -----------------------------------------------------------------------------

	if (CanSetFont(MailTextFontNormal)) then 	 	  	MailTextFontNormal:SetFont(CLEAR_FONT_QUEST, 15 * CF_SCALE); end	-- 默认值：15
	if (CanSetFont(MailTextFontNormal)) then 		   	MailTextFontNormal:SetTextColor(0.15, 0.09, 0.04); end		-- 默认值：(0.18, 0.12, 0.06)
--	if (CanSetFont(MailTextFontNormal)) then 	 	  	MailTextFontNormal:SetShadowColor(0.54, 0.4, 0.1); end
--	if (CanSetFont(MailTextFontNormal)) then 	 	  	MailTextFontNormal:SetShadowOffset(1, -1); end
   
   
-- -----------------------------------------------------------------------------
-- 发货单：拍卖行邮寄来的发货单
-- -----------------------------------------------------------------------------

	if (CanSetFont(InvoiceTextFontNormal)) then 	   	InvoiceTextFontNormal:SetFont(CLEAR_FONT_QUEST, 13 * CF_SCALE); end	-- 默认值：12
	if (CanSetFont(InvoiceTextFontNormal)) then 	   	InvoiceTextFontNormal:SetTextColor(0.15, 0.09, 0.04); end	-- 默认值：(0.18, 0.12, 0.06)

	if (CanSetFont(InvoiceTextFontSmall)) then			InvoiceTextFontSmall:SetFont(CLEAR_FONT_QUEST, 11 * CF_SCALE); end	-- 默认值：10
	if (CanSetFont(InvoiceTextFontSmall)) then			InvoiceTextFontSmall:SetTextColor(0.15, 0.09, 0.04); end	-- 默认值：(0.18, 0.12, 0.06)


-- -----------------------------------------------------------------------------
-- 技能：技能类型（被动、种族特长等）、技能等级
-- -----------------------------------------------------------------------------

	if (CanSetFont(SubSpellFont)) then					SubSpellFont:SetFont(CLEAR_FONT_QUEST, 12 * CF_SCALE); end	-- 默认值：12


-- -----------------------------------------------------------------------------
-- 状态区：头像框架中的数字（生命值、法力值/怒气值/能量值等），经验条（经验、声望等）
-- -----------------------------------------------------------------------------

	if (CanSetFont(TextStatusBarText)) then			TextStatusBarText:SetFont(CLEAR_FONT_NUMBER, 12 * CF_SCALE, "OUTLINE"); end	-- 默认值：12
	

-- -----------------------------------------------------------------------------
-- 提示框（ToolTip）
-- -----------------------------------------------------------------------------

-- 提示框正文
	if (CanSetFont(GameTooltipText)) then				GameTooltipText:SetFont(CLEAR_FONT, 13 * CF_SCALE); end		-- 默认值：13
   
-- 装备比较的小字部分
	if (CanSetFont(GameTooltipTextSmall)) then			GameTooltipTextSmall:SetFont(CLEAR_FONT, 12 * CF_SCALE); end	-- 默认值：12
   
-- 提示框标题
	if (CanSetFont(GameTooltipHeaderText)) then		GameTooltipHeaderText:SetFont(CLEAR_FONT, 14 * CF_SCALE, "OUTLINE"); end	-- 默认值：16


-- -----------------------------------------------------------------------------
-- 世界地图：位置标题
-- -----------------------------------------------------------------------------

	if (CanSetFont(WorldMapTextFont)) then				WorldMapTextFont:SetFont(CLEAR_FONT, 102 * CF_SCALE, "THICKOUTLINE"); end	-- 默认值：102
	if (CanSetFont(WorldMapTextFont)) then				WorldMapTextFont:SetShadowColor(0, 0, 0); end	-- 默认值：(1.0, 0.9294, 0.7607)
	if (CanSetFont(WorldMapTextFont)) then				WorldMapTextFont:SetShadowOffset(1, -1); end
--	if (CanSetFont(WorldMapTextFont)) then				WorldMapTextFont:SetAlpha(0.4); end


-- -----------------------------------------------------------------------------
-- 区域切换显示：在屏幕中央通知
-- -----------------------------------------------------------------------------

-- 大区域名
	if (CanSetFont(ZoneTextFont)) then 	   			ZoneTextFont:SetFont(CLEAR_FONT, 32 * CF_SCALE, "THICKOUTLINE"); end		-- 默认值：112
	if (CanSetFont(ZoneTextFont)) then 	   			ZoneTextFont:SetShadowColor(0, 0, 0); end	-- 默认值：(1.0, 0.9294, 0.7607)
	if (CanSetFont(ZoneTextFont)) then 	   			ZoneTextFont:SetShadowOffset(1, -1); end

-- 次区域名
	if (CanSetFont(SubZoneTextFont)) then				SubZoneTextFont:SetFont(CLEAR_FONT, 26 * CF_SCALE, "THICKOUTLINE"); end		-- 默认值：26


-- -----------------------------------------------------------------------------
-- 战斗纪录文字
-- -----------------------------------------------------------------------------

	if (CanSetFont(CombatLogFont)) then				CombatLogFont:SetFont(CLEAR_FONT, 14 * CF_SCALE); end	-- 默认值：16


-- -----------------------------------------------------------------------------
-- PvP信息：如“争夺中的领土”、“联盟领地”等
-- -----------------------------------------------------------------------------

	if (CanSetFont(PVPInfoTextFont)) then				PVPInfoTextFont:SetFont(CLEAR_FONT, 20 * CF_SCALE, "THICKOUTLINE"); end		-- 默认值：22


-- -----------------------------------------------------------------------------
-- Boss表情文字
-- -----------------------------------------------------------------------------

	if (CanSetFont(BossEmoteNormalHuge)) then			BossEmoteNormalHuge:SetFont(CLEAR_FONT, 25 * CF_SCALE); end		-- 默认值：25


-- -----------------------------------------------------------------------------
-- 影片字幕文字（New in WotLK/3.x）
-- -----------------------------------------------------------------------------

	if (CanSetFont(MovieSubtitleFont)) then			MovieSubtitleFont:SetFont(CLEAR_FONT, 25 * CF_SCALE); end		-- 默认值：25
	if (CanSetFont(MovieSubtitleFont)) then			MovieSubtitleFont:SetTextColor(1.0, 0.78, 0); end	-- 默认值：(1.0, 0.78, 0)


-- -----------------------------------------------------------------------------
-- 成就系统（New in WotLK/3.x）
-- -----------------------------------------------------------------------------

-- 成就系统其它面板上的成就分数
	if (CanSetFont(AchievementPointsFont)) then		AchievementPointsFont:SetFont(CLEAR_FONT, 13 * CF_SCALE); end		-- 默认值：13

-- 成就系统总汇面板的成就分数
	if (CanSetFont(AchievementPointsFontSmall)) then	AchievementPointsFontSmall:SetFont(CLEAR_FONT, 13 * CF_SCALE); end		-- 默认值：13

-- 成就系统描述的内容
	if (CanSetFont(AchievementDescriptionFont)) then	AchievementDescriptionFont:SetFont(CLEAR_FONT, 13 * CF_SCALE); end		-- 默认值：13

-- 成就系统描述的副标题
	if (CanSetFont(AchievementCriteriaFont)) then		AchievementCriteriaFont:SetFont(CLEAR_FONT, 13 * CF_SCALE); end		-- 默认值：13
   
-- 成就系统记录的日期
	if (CanSetFont(AchievementDateFont)) then			AchievementDateFont:SetFont(CLEAR_FONT, 11 * CF_SCALE); end		-- 默认值：13


	end




-- =============================================================================
--  C. 每当一个插件载入时都重新载入的功能
--  他们真喜欢搞乱我的插件！
-- =============================================================================

	ClearFont:SetScript("OnEvent",
		    function() 
		       if (event == "ADDON_LOADED") then
			  ClearFont:ApplySystemFonts()
		       end
		    end);

	ClearFont:RegisterEvent("ADDON_LOADED");




-- =============================================================================
--  D. 第一次启动时应用以上设定
--  让球能够滚起来
-- =============================================================================

	ClearFont:ApplySystemFonts()
