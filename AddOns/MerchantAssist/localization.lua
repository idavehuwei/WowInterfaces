------------------------------
-- dugu@bigfoot 2009-12-19

if ( GetLocale() == "zhCN") then
	local L = LibStub("AceLocale-3.0"):NewLocale("MerchantAssist", "zhCN", true);	
	L["金"] = true;
	L["银"] = true;
	L["铜"] = true;
	L["自动修理了全身装备, 此次修理共花费: "] = true;
	L["自动修理了所有装备, 此次修理装备花费:"] = true;
	L["抱歉, 你的钱不够修复全身装备."] = true;
	L["贩卖垃圾"] = true;	
	L["售出"] = true;	
	L["毛茸茸的小爪子"] = true;
	L["破损的熊皮"] = true;
	L["柔软的尾巴"] = true;
	L["鲜艳的羽毛"] = true;
	L["邪恶的蝙蝠眼"] = true;
	L["暗血矿工锄"] = true;
	L["自动购买: "] = true;
	L["确定将 %s 设置为自动售卖物品"] = true;
	L["确定将 %s 设置为自动购买物品"] = true;
	L["确定从自动售卖列表中取消\n%s"] = true;
	L["确定取消对%s的自动购买"] = true;
	L["自动售卖物品"] = true;
	L["交易助手<<"] = true;
	L["交易助手>>"] = true;
	L["确定购买以下物品:\n %s"] = true;
	L["出售物品总价为: "] = true;
	MERCHANT_ASSIST_HELP_TEXT = "点击物品图标可以将物品设置为自动出售物品";
	MERCHANT_ASSIST_AUTOBUY_DELETE_TEXT = "取消自动购买";
	MERCHANT_ASSIST_AUTOBUY_ADD_TEXT = "添加为自动购买物品";
	MERCHANT_ASSIST_TITLE = "交易助手";
	MERCHANT_ASSIST_AUTOSELL_TEXT = "自动售卖";
	MERCHANT_ASSIST_AUTOBUY_TEXT = "自动购买";
	MERCHANT_ASSIST_QUALITY_NAME = {
		[0] = "粗糙物品", 
		[1] = "普通物品",
		[2] = "优秀物品",
		[3] = "稀有物品",
		[4] = "史诗物品",
		[5] = "质量4物品",
		[6] = "质量5物品",
		[7] = "质量6物品",
	};	
elseif ( GetLocale() == "zhTW") then
	local L = LibStub("AceLocale-3.0"):NewLocale("MerchantAssist", "zhTW", true);

	L["金"] = "金";
	L["银"] = "銀";
	L["铜"] = "銅";
	L["自动修理了全身装备, 此次修理共花费: "] = "自動修理了全身裝備, 此次修理共花費: ";
	L["自动修理了所有装备, 此次修理装备花费:"] = "自動修理了所有裝備, 此次修理裝備花費:";
	L["抱歉, 你的钱不够修复全身装备."] = "抱歉, 你的錢不夠修復全身裝備.";
	L["贩卖垃圾"] = "販賣垃圾";	
	L["售出"]= "售出";
	L["毛茸茸的小爪子"] = "毛茸茸的小爪子";
	L["破损的熊皮"] = "破損的熊皮";
	L["柔软的尾巴"] = "柔軟的尾巴";
	L["鲜艳的羽毛"] = "鮮豔的羽毛";
	L["邪恶的蝙蝠眼"] = "邪惡的蝙蝠眼";
	L["暗血矿工锄"] = "暗血礦工鋤";
	L["自动购买: "] = "自動購買: ";
	L["确定将 %s 设置为自动售卖物品"] = "確定將 %s 設置為自動售賣物品";
	L["确定将 %s 设置为自动购买物品"] = "確定將 %s 設置為自動購買物品";
	L["确定从自动售卖列表中取消\n%s"] = "確定從自動售賣列表中取消\n%s";
	L["确定取消对%s的自动购买"] = "確定取消對%s的自動購買";
	L["自动售卖物品"] = "自動售賣物品";
	L["交易助手<<"] = "交易助手<<";
	L["交易助手>>"] = "交易助手>>";
	L["确定购买以下物品:\n %s"] = "確定購買以下物品:\n %s";
	L["出售物品总价为: "] = "出售物品總價為: ";
	MERCHANT_ASSIST_HELP_TEXT = "點擊物品圖示可以將物品設置為自動出售物品";
	MERCHANT_ASSIST_AUTOBUY_DELETE_TEXT = "取消自動購買";
	MERCHANT_ASSIST_AUTOBUY_ADD_TEXT = "添加為自動購買物品";
	MERCHANT_ASSIST_TITLE = "交易助手";
	MERCHANT_ASSIST_AUTOSELL_TEXT = "自動售賣";
	MERCHANT_ASSIST_AUTOBUY_TEXT = "自動購買";
	MERCHANT_ASSIST_QUALITY_NAME = {
		[0] = "粗糙物品", 
		[1] = "普通物品",
		[2] = "優秀物品",
		[3] = "稀有物品",
		[4] = "史詩物品",
		[5] = "品質4物品",
		[6] = "品質5物品",
		[7] = "品質6物品",
	};

else
	local L = LibStub("AceLocale-3.0"):NewLocale("MerchantAssist", "enUS", true);

	L["金"] = "g";
	L["银"] = "s";
	L["铜"] = "c";
	L["自动修理了全身装备, 此次修理共花费: "] = "AutoRepair repair all Inventory equip, cost: ";
	L["自动修理了所有装备, 此次修理装备花费:"] = "AutoRepair repair all equip, cost :";
	L["抱歉, 你的钱不够修复全身装备."] = "Sorry, You have not enough money to repair all equip";
	L["贩卖垃圾"] = "Sell Junk";
	L["售出"]= "Sell";
	L["毛茸茸的小爪子"] = "Small Furry Paw";
	L["破损的熊皮"] = "Torn Bear Pelt";
	L["柔软的尾巴"] = "Long Soft Tail";
	L["鲜艳的羽毛"] = "Vibrant Plume";
	L["邪恶的蝙蝠眼"] = "Evil Bat Eye";
	L["暗血矿工锄"] = "Murkblood Miner's Pick";
	L["自动购买: "] = "Auto buy: ";
	L["确定将 %s 设置为自动售卖物品"] = "确定将%s设置为自动售卖物品";
	L["确定将 %s 设置为自动购买物品"] = "确定将 %s 设置为自动购买物品";
	L["确定从自动售卖列表中取消\n%s"] = "确定从自动售卖列表中取消\n%s";
	L["确定取消对%s的自动购买"] = "确定取消对%s的自动购买";
	L["自动售卖物品"] = "自动售卖物品";
	L["交易助手<<"] = "交易助手<<";
	L["交易助手>>"] = "交易助手>>";
	L["确定购买以下物品:\n %s"] = "确定购买以下物品:\n %s";
	L["出售物品总价为: "] = "出售物品总价为: ";
	MERCHANT_ASSIST_HELP_TEXT = "點擊物品圖示可以將物品設置為自動出售物品";
	MERCHANT_ASSIST_AUTOBUY_DELETE_TEXT = "取消自动购买";
	MERCHANT_ASSIST_AUTOBUY_ADD_TEXT = "添加为自动购买物品";
	MERCHANT_ASSIST_TITLE = "交易助手";
	MERCHANT_ASSIST_AUTOSELL_TEXT = "自动售卖";
	MERCHANT_ASSIST_AUTOBUY_TEXT = "自动购买";
	MERCHANT_ASSIST_QUALITY_NAME = {
		[0] = "粗糙物品", 
		[1] = "普通物品",
		[2] = "优秀物品",
		[3] = "稀有物品",
		[4] = "史诗物品",
		[5] = "质量4物品",
		[6] = "质量5物品",
		[7] = "质量6物品",
	};
end