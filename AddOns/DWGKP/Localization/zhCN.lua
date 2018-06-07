local L = LibStub("AceLocale-3.0"):NewLocale("DWGKP", "zhCN");
if (L) then
	L["LeftGroup"] = "([^%s]+)离开了团队。";
	L["TimeFormat"] = "%d小时%02d分";
	L["YOU"] = "你";
	L["All"] = "全部";
	L["Cloth"] = "布甲";
	L["Leather"] = "皮甲";
	L["Mail"] = "锁甲";
	L["Plate"] = "板甲";
	L["Mage"] = "法师";
	L["Warlock"] = "术士";
	L["Priest"] = "牧师";
	L["Druid"] = "德鲁伊";
	L["Paladin"] = "圣骑士";
	L["Rogue1"] = "盗贼";
	L["Rogue"] = "潜行者";
	L["Shaman1"] = "萨满";
	L["Shaman"] = "萨满祭司";
	L["Hunter"] = "猎人";
	L["Warrior"] = "战士";
	L["DeathKnight"] = "死亡骑士";

	L["Eye of Eternity"] = "永恒之眼";
	L["Naxxramas"] = "纳克萨玛斯";
	L["The Obsidian Sanctum"] = "黑曜石圣殿";
	L["Archavons Kammer"] = "阿尔卡冯的宝库";
	L["Onyxia's Lair"] = "奥妮克希亚的巢穴";
	L["Ulduar"] = "奥杜尔";
	L["Crusader's Coliseum"] = "十字军的试炼";
	L["Icecrown Citadel"] = "冰冠堡垒";
	L["The Ruby Sanctum"] = "红玉圣殿";
	
	L["GoldString"] = "|cffffd700%d金币|r";
	L["SimpleGoldString"] = "%d金币";
	L["MemberIn"] = "惩罚%s收入%s";
	L["MemberOut"] = "奖励%s支出%s";
	L["ItemIn"] = "拍卖物品%s收入%s";
	L["ItemOut"] = "购买物品%s支出%s";
	L["ItemInMuti"] = "拍卖物品%sx%s收入%s";
	L["ItemOutMuti"] = "购买物品%sx%s支出%s";
	L["CustomIn"] = "%s, 收入%s";
	L["CustomOut"] = "%s, 支出%s";

	L["NoRaid"] = "|cffe6be05未进行G团活动|r";
	L["Uncommon"] = "优秀";
	L["Rare"] = "精良";
	L["Epic"] = "史诗";
	L["Five"] = "前5组";
	L["AllGroup"] = "全团";
	L["Say"] = "说话";
	L["Raid"] = "团队";
	L["Party"] = "小队";
	L["DWGKP"] = "魔盒金团助手";
	L["Base Option Info"] = "一般设置";
	L["Low item quality"] = "记录物品的最低品质";
	L["Default dirstibute group"] = "缺省分配金币的成员";
	L["Announce Channel"] = "发送信息的频道";
	L["Ignor Item List"] = "忽略物品列表";
	L["Add Ignor Item"] = "添加忽略物品";
	L["Unknown Item"] = "未知物品";
	L["GreenQuality"] = "|cff1eff00绿色品质|r";
	L["BlueQuality"] = "|cff0070dd蓝色品质|r";
	L["PurpleQuality"] = "|cffa335ee紫色品质|r";

	L["ReportLogSimple"] = "魔盒金团助手报表(简明)";
	L["ReportLogDetail"] = "魔盒金团助手报表(详细)";
	L["Seperate line"] = "--------------------";
	L["Income and Expenses Detail"]	 = "收支明细:";
	L["Total Income"] = "总收入: %s";
	L["Total Outcome"] = "总支出: %s";
	L["Forfeit"] = "罚款收入: %s";
	L["BidIncome"] = "装备拍卖: %s";
	L["OtherIncome"] = "其他收入: %s";
	L["Bonus"] = "奖励支出: %s";
	L["BuyItem"] = "购买物品: %s";
	L["OtherOutcome"] = "其他支出: %s";
	L["FinalIncome"] = "最终分配: %s";
	L["Distribute num"] = "分配人数: %d人";
	L["Average"] = "人均分配: %s";
	L["PartyAve"] = "小队分配: %s";

	L["Report mod tips"] = "勾选发送简明报表";
	L["Check to distibute gold"] = "勾选玩家将参与金币分配";
	L["IncomeInfo"] = "|cff19ff19收入:|r|cffffd800%dG|r  |cffff0000支出:|r|cffffd800%dG|r  |cff00c0ff分配人数:|r|cff00ff24%d人|r";
	L["EidtFlow"] = "编辑流程";
	L["EidtFlowInfo"] = "创建活动→开始活动→编辑收支→分配金币→结束活动";
	L["TwoStatus"] = "两种状态";
	L["ActiveStatus"] = "|cff19ff19激活状态|r: 当前活动以绿色显示,人员、物品、收支均可编辑。开始活动和激活活动都会将该活动置为激活状态。";
	L["VrowseStatus"] = "|cffff7300浏览状态|r: 当前活动以橙色显示，只能查看，不能编辑。当活动结束后，点击活动历史记录将进入浏览状态，再次点击该历史记录取消。";

	L["Click to toggle gkp frame."] = "点击显示金团助手";	
	
	-- 帮助
	L["DWGKPHELP"] = "金团助手帮助";
	L["Introduce"] = "|cffffffff功能介绍|r";
	L["IntroduceText1"] = "      |cffffff00魔盒金团助手支持多RAID记录、自动和手动记录物品、实时发布收支明细报表、自动计算分配金币、操作简单方便。|r";
	L["IntroduceText2"] = "      |cffffff00适合|r|cffff7300G团团长|r、|cff00ffff会计|r|cffffff00使用，也适合|r|cffffffffRAID成员|r|cffffff00监督收支。|r";
	L["IntroduceText3"] = "      |cffffff00魔盒金团助手分为3种状态：|r|cffffffff普通|r、|cffff7300浏览|r、|cff19ff19激活|r。|cff19ff19激活状态|r：|cffffff00当前活动显示为|r|cff19ff19绿色|r，|cff19ff19新建活动|r|cffffff00或者|r|cff19ff19激活活动|r|cffffff00都会进入激活状态，该状态下你可以编辑当前活动；|r|cffff7300浏览状态|r：|cffffff00当前活动显示为|r|cffff7300橙色|r，|cffff7300点击历史活动|r|cffffff00将进入浏览状态，该状态下你只能查看历史活动记录，再次点击该历史活动退出浏览状态；|r|cffffffff普通状态|r：|cffffff00非激活和浏览状态就是普通状态，成员页面中心将显示创建活动按钮。|r\n";
	
	L["Useflow"] = "|cffffffff使用流程|r";
	L["UseflowText1"] = "|cffffff001. 组团后，创建活动，开始RAID时点击“开始活动”；|r";
	L["UseflowText2"] = "|cffffff002. 在成员页面设置金币分配对象；|r";
	L["UseflowText3"] = "|cffffff003. RAID过程中掉落物品会自动记录，拍卖成功后，请手工填写拍卖价格；|r";
	L["UseflowText4"] = "|cffffff004. RAID过程中或RAID结束后发布收支概要或者收支明细；|r";
	L["UseflowText5"] = "|cffffff005. 分配金币，发一个勾选一个人。|r";
	L["UseflowText6"] = "|cffffff006. 点“结束”，结束本次G团活动。|r\n";

	L["Q&A"] = "|cffffffff常见问题|r";
	L["Q&AText1"] = "|cff00ffffQ:  我建立了多个RAID，为什么不可以切换看不同RAID记录？|r\n|cffffff00A: 你必须先结束当前RAID，才能在已有的多个RAID之间切换浏览数据。|r\n ";
	L["Q&AText2"] = "|cff00ffffQ: 我在RAID进行中误点了结束该怎么办?|r\n|cffffff00A: 点击该RAID活动的激活按钮重新激活该活动即可。|r\n ";
	L["Q&AText3"] = "|cff00ffffQ: 赊账和补扣怎么理解?|r\n|cffffff00A: 特殊职业（例如MT、主治疗、主DPS）的补贴金额，或者对违反纪律的成员进行惩罚，即为补扣。赊账是指那些想卖装备，但钱又不够的成员，允许他们先欠款拿装备，在最后的收入中扣除所欠部分的做法（分配中会自动扣除）。|r\n ";
end

if (GetLocale() == "zhCN") then
	------------
	-- GUI
	DWGKP_LOCAL_TITLE = "魔盒金团助手";
	DWGKP_LOCAL_HELP_TEXT = "帮助";
	DWGKP_LOCAL_COPYRIGHT = "版权所有(c)多玩游戏网";
	DWGKP_LOCAL_VERSION = "ver:1.0.2";
	-- member
	DWGKP_LOCAL_ADDMEMBER = "添加成员";
	DWGKP_LOCAL_EDITMEMNOTE = "编辑添加的成员信息";
	DWGKP_LOCAL_EDITMEMNAME = "姓名:";
	DWGKP_LOCAL_EDITMEMCLASS = "职业:";
	DWGKP_LOCAL_EDITMEMDISTR = "参与金币分配";
	DWGKP_LOCAL_EDITOKAY = "确 定";
	DWGKP_LOCAL_EDITCANCEL = "取 消";
	-- item
	DWGKP_LOCAL_ADDITEM = "添加物品";
	DWGKP_LOCAL_EDITITEMNOTE = "Shift点击链接或拖放物品";
	DWGKP_LOCAL_EDITITEMNAME = "物   品:";
	DWGKP_LOCAL_EDITITEMPLAYER = "拾取人:";
	DWGKP_LOCAL_EDITITEMCOUNT = "数   量:";
	-- raid
	DWGKP_LOCAL_ADDRAID = "活动名称";
	DWGKP_LOCAL_EDITRAIDNOTE = "选择或者填写活动名称";
	-- event
	DWGKP_LOCAL_ADDEVENT = "收入支出";
	DWGKP_LOCAL_EDITEVENTNOTE = "填写收入支出信息";
	DWGKP_LOCAL_EDITEVENTDISC = "描述:";
	DWGKP_LOCAL_EDITEVENTINCOME = "收入:";
	DWGKP_LOCAL_EDITEVENTOUTCOME = "支出:";
	DWGKP_LOCAL_EDITEVENTPLAYER = "成员:";
	
	-- Tabs
	DWGKP_LOCAL_TABMEMBER = "人员";
	DWGKP_LOCAL_TABITEM = "物品";
	DWGKP_LOCAL_TABINCOME = "收支";
	DWGKP_LOCAL_TABDISTRIBUTE = "分配";
	DWGKP_LOCAL_TABRAID = "活动";
	-- Member
	DWGKP_LOCAL_MEMBERNAME = "名字";
	DWGKP_LOCAL_MEMBERCLASS = "职业";
	DWGKP_LOCAL_MEMBERPERCENT = "百分比";
	DWGKP_LOCAL_MEMBERBRORROW = "赊账";
	DWGKP_LOCAL_MEMBERJION = "加入";
	DWGKP_LOCAL_MEMBEOFFLINE = "累计离线";
	DWGKP_LOCAL_MEMBEREBONUS = "补/扣";
	DWGKP_LOCAL_MEMBERDISTRIBUTE = "分配";
	DWGKP_LOCAL_MEMBERBEGINRAID = "开始活动";
	DWGKP_LOCAL_MEMBERENDRAID = "结束活动";
	DWGKP_LOCAL_MEMBERADDPLAYER = "添加成员";
	DWGKP_LOCAL_MEMBERNEWRAID = "新建活动";
	-- Item
	DWGKP_LOCAL_ITEMNAME = "物品名称";
	DWGKP_LOCAL_ITEMCLASS = "职业";
	DWGKP_LOCAL_ITEMGAIN = "时间";
	DWGKP_LOCAL_ITEMBIDPRICE = "起拍价";
	DWGKP_LOCAL_ITEMLOOTER = "拾取人";
	DWGKP_LOCAL_ITEMPRICE = "成交价";
	DWGKP_LOCAL_ITEMEIDT = "编辑";
	DWGKP_LOCAL_ITEMDELETE = "删除";
	DWGKP_LOCAL_ITEMIGNORLIST = "忽略列表";
	DWGKP_LOCAL_ITEMADDITEM = "添加物品";
	-- event
	DWGKP_LOCAL_EVENTDISCRIPTION = "描述";
	DWGKP_LOCAL_EVENTINCME = "收入";
	DWGKP_LOCAL_EVENTOUTCOME = "支出";
	DWGKP_LOCAL_EVENTMEMBER = "成员";
	DWGKP_LOCAL_EVENTEDIT = "编辑";
	DWGKP_LOCAL_EVENTDELETE = "删除";
	DWGKP_LOCAL_EVENTREPORT = "发布报表";
	DWGKP_LOCAL_EVENTADD = "添加收支";
	-- distrbute
	DWGKP_LOCAL_DISTRIBUTENAME = "姓名";
	DWGKP_LOCAL_DISTRIBUTEGOLD = "金币";
	--raid
	DWGKP_LOCAL_RAIDNAME = "名字";
	DWGKP_LOCAL_RAIDSTARTTIME = "开始时间";
	DWGKP_LOCAL_RAIDENDTIME = "结束时间";
	DWGKP_LOCAL_RAIDATTENDNUM = "人数";
	DWGKP_LOCAL_RAIDACTIVE = "激活";
	DWGKP_LOCAL_RAIDEDIT = "编辑";
	DWGKP_LOCAL_RAIDDELETE = "删除";
	DWGKP_LOCAL_RAIDNEW = "新建";
	DWGKP_LOCAL_RAIDSTART = "开始";
	DWGKP_LOCAL_RAIDEND = "结束";
	-- GKP
	DWGKP_LOCAL_CURRAID = "当前活动: ";
end
