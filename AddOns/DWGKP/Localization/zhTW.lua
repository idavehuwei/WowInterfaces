local L = LibStub("AceLocale-3.0"):NewLocale("DWGKP", "zhTW");
if (L) then
	L["YOU"] = "你";
	L["LeftGroup"] = "([^%s]+)離開了團隊。";
	L["TimeFormat"] = "%d小時%02d分";
	L["All"] = "全部";
	L["Cloth"] = "布甲";
	L["Leather"] = "皮甲";
	L["Mail"] = "鎖甲";
	L["Plate"] = "板甲";
	L["Mage"] = "法師";
	L["Warlock"] = "術士";
	L["Priest"] = "牧師";
	L["Druid"] = "德魯伊";
	L["Paladin"] = "聖騎士";
	L["Rogue1"] = "盜賊";
	L["Rogue"] = "盜賊";
	L["Shaman1"] = "薩滿";
	L["Shaman"] = "薩滿祭司";
	L["Hunter"] = "獵人";
	L["Warrior"] = "戰士";
	L["DeathKnight"] = "死亡騎士";

	L["Eye of Eternity"] = "永恆之眼";
	L["Naxxramas"] = "納克薩瑪斯";
	L["The Obsidian Sanctum"] = "黑曜聖所";
	L["Archavons Kammer"] = "亞夏梵穹殿";
	L["Onyxia's Lair"] = "奧妮克希亞的巢穴";
	L["Ulduar"] = "奧杜亞";
	L["Crusader's Coliseum"] = "十字軍試煉";
	L["Icecrown Citadel"] = "冰冠城塞";
	L["The Ruby Sanctum"] = "晶紅聖所";

	L["GoldString"] = "|cffffd700%d金幣|r";
	L["SimpleGoldString"] = "%d金幣";
	L["MemberIn"] = "懲罰%s收入%s";
	L["MemberOut"] = "獎勵%s支出%s";
	L["ItemIn"] = "拍賣物品%s收入%s";
	L["ItemOut"] = "購買物品%s支出%s";
	L["ItemInMuti"] = "拍賣物品%sx%s收入%s";
	L["ItemOutMuti"] = "購買物品%sx%s支出%s";
	L["CustomIn"] = "%s, 收入%s";
	L["CustomOut"] = "%s, 支出%s";

	L["NoRaid"] = "|cffe6be05未進行G團活動|r";
	L["Uncommon"] = "優秀";
	L["Rare"] = "精良";
	L["Epic"] = "史詩";
	L["Five"] = "前5組";
	L["AllGroup"] = "全團";
	L["Say"] = "說話";
	L["Raid"] = "團隊";
	L["Party"] = "小隊";
	L["DWGKP"] = "魔盒金團助手";
	L["Base Option Info"] = "一般設置";
	L["Low item quality"] = "記錄物品的最低品質";
	L["Default dirstibute group"] = "缺省分配金幣的成員";
	L["Announce Channel"] = "發送資訊的頻道";
	L["Ignor Item List"] = "忽略物品列表";
	L["Add Ignor Item"] = "添加忽略物品";
	L["Unknown Item"] = "未知物品";
	L["GreenQuality"] = "|cff1eff00綠色品質|r";
	L["BlueQuality"] = "|cff0070dd藍色品質|r";
	L["PurpleQuality"] = "|cffa335ee紫色品質|r";

	L["ReportLogSimple"] = "魔盒金團助手報表(簡明)";
	L["ReportLogDetail"] = "魔盒金團助手報表(詳細)";
	L["Seperate line"] = "--------------------";
	L["Income and Expenses Detail"]	 = "收支明細:";
	L["Total Income"] = "總收入: %s";
	L["Total Outcome"] = "總支出: %s";
	L["Forfeit"] = "罰款收入: %s";
	L["BidIncome"] = "裝備拍賣: %s";
	L["OtherIncome"] = "其他收入: %s";
	L["Bonus"] = "獎勵支出: %s";
	L["BuyItem"] = "購買物品: %s";
	L["OtherOutcome"] = "其他支出: %s";
	L["FinalIncome"] = "最終分配: %s";
	L["Distribute num"] = "分配人數: %d人";
	L["Average"] = "人均分配: %s";
	L["PartyAve"] = "小隊分配: %s";

	L["Report mod tips"] = "勾選發送簡明報表";
	L["Check to distibute gold"] = "勾選玩家將參與金幣分配";
	L["IncomeInfo"] = "|cff19ff19收入:|r|cffffd800%dG|r  |cffff0000支出:|r|cffffd800%dG|r  |cff00c0ff分配人數:|r|cff00ff24%d人|r";
	L["EidtFlow"] = "編輯流程";
	L["EidtFlowInfo"] = "創建活動→開始活動→編輯收支→分配金幣→結束活動";
	L["TwoStatus"] = "兩種狀態";
	L["ActiveStatus"] = "|cff19ff19啟動狀態|r: 當前活動以綠色顯示,人員、物品、收支均可編輯。開始活動和啟動活動都會將該活動置為啟動狀態。";
	L["VrowseStatus"] = "|cffff7300流覽狀態|r: 當前活動以橙色顯示，只能查看，不能編輯。當活動結束後，點擊活動歷史記錄將進入流覽狀態，再次點擊該歷史記錄取消。";

	L["Click to toggle gkp frame."] = "點擊顯示金團助手";	
-- 幫助
	L["DWGKPHELP"] = "金團助手幫助";
	L["Introduce"] = "|cffffffff功能介紹|r";
	L["IntroduceText1"] = "      |cffffff00魔盒金團助手支持多RAID記錄、自動和手動記錄物品、即時發佈收支明細報表、自動計算分配金幣、操作簡單方便。|r";
	L["IntroduceText2"] = "      |cffffff00適合|r|cffff7300G團團長|r、|cff00ffff會計|r|cffffff00使用，也適合|r|cffffffffRAID成員|r|cffffff00監督收支。|r";
	L["IntroduceText3"] = "      |cffffff00魔盒金團助手分為3種狀態：|r|cffffffff普通|r、|cffff7300流覽|r、|cff19ff19啟動|r。|cff19ff19啟動狀態|r：|cffffff00當前活動顯示為|r|cff19ff19綠色|r，|cff19ff19新建活動|r|cffffff00或者|r|cff19ff19啟動活動|r|cffffff00都會進入啟動狀態，該狀態下你可以編輯當前活動；|r|cffff7300流覽狀態|r：|cffffff00當前活動顯示為|r|cffff7300橙色|r，|cffff7300點擊歷史活動|r|cffffff00將進入流覽狀態，該狀態下你只能查看歷史活動記錄，再次點擊該歷史活動退出流覽狀態；|r|cffffffff普通狀態|r：|cffffff00非啟動和流覽狀態就是普通狀態，成員頁面中心將顯示創建活動按鈕。|r\n";
	
	L["Useflow"] = "|cffffffff使用流程|r";
	L["UseflowText1"] = "|cffffff001. 組團後，創建活動，開始RAID時點擊“開始活動”；|r";
	L["UseflowText2"] = "|cffffff002. 在成員頁面設置金幣分配對象；|r";
	L["UseflowText3"] = "|cffffff003. RAID過程中掉落物品會自動記錄，拍賣成功後，請手工填寫拍賣價格；|r";
	L["UseflowText4"] = "|cffffff004. RAID過程中或RAID結束後發布收支概要或者收支明細；|r";
	L["UseflowText5"] = "|cffffff005. 分配金幣，發一個勾選一個人。|r";
	L["UseflowText6"] = "|cffffff006. 點“結束”，結束本次G團活動。|r\n";

	L["Q&A"] = "|cffffffff常見問題|r";
	L["Q&AText1"] = "|cff00ffffQ:  我建立了多個RAID，為什麼不可以切換看不同RAID記錄？|r\n|cffffff00A: 你必須先結束當前RAID，才能在已有的多個RAID之間切換流覽數據。|r\n ";
	L["Q&AText2"] = "|cff00ffffQ: 我在RAID進行中誤點了結束該怎麼辦?|r\n|cffffff00A: 點擊該RAID活動的啟動按鈕重新啟動該活動即可。|r\n ";
	L["Q&AText3"] = "|cff00ffffQ: 賒賬和補扣怎麼理解?|r\n|cffffff00A: 特殊職業（例如MT、主治療、主DPS）的補貼金額，或者對違反紀律的成員進行懲罰，即為補扣。賒賬是指那些想賣裝備，但錢又不夠的成員，允許他們先欠款拿裝備，在最後的收入中扣除所欠部分的做法（分配中會自動扣除）。|r\n ";
end

if (GetLocale() == "zhTW") then
	------------
	-- GUI
	DWGKP_LOCAL_TITLE = "魔盒金團助手";
	DWGKP_LOCAL_HELP_TEXT = "幫助";
	DWGKP_LOCAL_COPYRIGHT = "版權所有(c)多玩遊戲網";
	DWGKP_LOCAL_VERSION = "ver:1.0.1";
	-- member
	DWGKP_LOCAL_ADDMEMBER = "添加成員";
	DWGKP_LOCAL_EDITMEMNOTE = "編輯添加的成員資訊";
	DWGKP_LOCAL_EDITMEMNAME = "姓名:";
	DWGKP_LOCAL_EDITMEMCLASS = "職業:";
	DWGKP_LOCAL_EDITMEMDISTR = "參與金幣分配";
	DWGKP_LOCAL_EDITOKAY = "確 定";
	DWGKP_LOCAL_EDITCANCEL = "取 消";
	-- item
	DWGKP_LOCAL_ADDITEM = "添加物品";
	DWGKP_LOCAL_EDITITEMNOTE = "Shift點擊鏈接或拖放物品";
	DWGKP_LOCAL_EDITITEMNAME = "物   品:";
	DWGKP_LOCAL_EDITITEMPLAYER = "拾取人:";
	DWGKP_LOCAL_EDITITEMCOUNT = "數   量:";
	-- raid
	DWGKP_LOCAL_ADDRAID = "活動名稱";
	DWGKP_LOCAL_EDITRAIDNOTE = "選擇或者填寫活動名稱";
	-- event
	DWGKP_LOCAL_ADDEVENT = "收入支出";
	DWGKP_LOCAL_EDITEVENTNOTE = "填寫收入支出資訊";
	DWGKP_LOCAL_EDITEVENTDISC = "描述:";
	DWGKP_LOCAL_EDITEVENTINCOME = "收入:";
	DWGKP_LOCAL_EDITEVENTOUTCOME = "支出:";
	DWGKP_LOCAL_EDITEVENTPLAYER = "成員:";
	
	-- Tabs
	DWGKP_LOCAL_TABMEMBER = "人員";
	DWGKP_LOCAL_TABITEM = "物品";
	DWGKP_LOCAL_TABINCOME = "收支";
	DWGKP_LOCAL_TABDISTRIBUTE = "分配";
	DWGKP_LOCAL_TABRAID = "活動";
	-- Member
	DWGKP_LOCAL_MEMBERNAME = "名字";
	DWGKP_LOCAL_MEMBERCLASS = "職業";
	DWGKP_LOCAL_MEMBERPERCENT = "百分比";
	DWGKP_LOCAL_MEMBERBRORROW = "賒賬";
	DWGKP_LOCAL_MEMBERJION = "加入";
	DWGKP_LOCAL_MEMBEOFFLINE = "累計離線";
	DWGKP_LOCAL_MEMBEREBONUS = "補/扣";
	DWGKP_LOCAL_MEMBERDISTRIBUTE = "分配";
	DWGKP_LOCAL_MEMBERBEGINRAID = "開始活動";
	DWGKP_LOCAL_MEMBERENDRAID = "結束活動";
	DWGKP_LOCAL_MEMBERADDPLAYER = "添加成員";
	DWGKP_LOCAL_MEMBERNEWRAID = "新建活動";
	-- Item
	DWGKP_LOCAL_ITEMNAME = "物品名稱";
	DWGKP_LOCAL_ITEMCLASS = "職業";
	DWGKP_LOCAL_ITEMGAIN = "時間";
	DWGKP_LOCAL_ITEMBIDPRICE = "起拍價";
	DWGKP_LOCAL_ITEMLOOTER = "拾取人";
	DWGKP_LOCAL_ITEMPRICE = "成交價";
	DWGKP_LOCAL_ITEMEIDT = "編輯";
	DWGKP_LOCAL_ITEMDELETE = "刪除";
	DWGKP_LOCAL_ITEMIGNORLIST = "忽略列表";
	DWGKP_LOCAL_ITEMADDITEM = "添加物品";
	-- event
	DWGKP_LOCAL_EVENTDISCRIPTION = "描述";
	DWGKP_LOCAL_EVENTINCME = "收入";
	DWGKP_LOCAL_EVENTOUTCOME = "支出";
	DWGKP_LOCAL_EVENTMEMBER = "成員";
	DWGKP_LOCAL_EVENTEDIT = "編輯";
	DWGKP_LOCAL_EVENTDELETE = "刪除";
	DWGKP_LOCAL_EVENTREPORT = "發佈報表";
	DWGKP_LOCAL_EVENTADD = "添加收支";
	-- distrbute
	DWGKP_LOCAL_DISTRIBUTENAME = "姓名";
	DWGKP_LOCAL_DISTRIBUTEGOLD = "金幣";
	--raid
	DWGKP_LOCAL_RAIDNAME = "名字";
	DWGKP_LOCAL_RAIDSTARTTIME = "開始時間";
	DWGKP_LOCAL_RAIDENDTIME = "結束時間";
	DWGKP_LOCAL_RAIDATTENDNUM = "人數";
	DWGKP_LOCAL_RAIDACTIVE = "啟動";
	DWGKP_LOCAL_RAIDEDIT = "編輯";
	DWGKP_LOCAL_RAIDDELETE = "刪除";
	DWGKP_LOCAL_RAIDNEW = "新建";
	DWGKP_LOCAL_RAIDSTART = "開始";
	DWGKP_LOCAL_RAIDEND = "結束";
	-- GKP
	DWGKP_LOCAL_CURRAID = "當前活動: ";
end