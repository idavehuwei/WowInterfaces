------------------------------------
-- dugu 2009-12-19
local BURNING_TRADE_TITLE, BURNING_TRADE_DESC, BURNING_TRADE_QUICK_TRADE, BURNING_TRADE_SET_CHANNEL;
local BURNING_TRADE_LIST, BURNING_TRADE_LIST_OPTION;
local ANNOUNCECHANNELS;
if (GetLocale() == "zhCN") then
	BURNING_TRADE_TITLE = "交易增強";
	BURNING_TRADE_DESC = "开启交易增强";
	BURNING_TRADE_QUICK_TRADE = "允许Alt+左键快速交易";
	BURNING_TRADE_ANNOUNCE = "允许向他人通报交易情况";
	BURNING_TRADE_SET_CHANNEL = "通报频道: ";
	BURNING_TRADE_LIST = "允许浏览交易记录";	
	BURNING_TRADE_LIST_OPTION = "查看记录";	
	ANNOUNCECHANNELS = {"密聊", "团队",  "小队", "说", "大喊"};
	
elseif (GetLocale() == "zhTW") then
	BURNING_TRADE_TITLE = "交易增強";
	BURNING_TRADE_DESC = "開啟交易增強";
	BURNING_TRADE_ANNOUNCE = "允許向他人通報交易情況";
	BURNING_TRADE_SET_CHANNEL = "通報頻道: "
	BURNING_TRADE_QUICK_TRADE = "允許Alt+左鍵快速交易";
	BURNING_TRADE_LIST = "允許流覽交易記錄";	
	BURNING_TRADE_LIST_OPTION = "查看記錄";	
	ANNOUNCECHANNELS = {"密聊", "團隊",  "小隊", "說", "大喊"};
else
	BURNING_TRADE_TITLE = "Buring Trade";
	BURNING_TRADE_DESC = "Enable burning trade";
	BURNING_TRADE_ANNOUNCE = "允许向他人通报交易情况";
	BURNING_TRADE_SET_CHANNEL = "Channel: "
	BURNING_TRADE_QUICK_TRADE = "Enale Alt+left click to trade";
	BURNING_TRADE_LIST = "Enable to see trade list";	
	BURNING_TRADE_LIST_OPTION = "View";	
	ANNOUNCECHANNELS = {"Whisper", "Raid",  "Party", "Say", "Yell"};
end

if (dwIsConfigurableAddOn("TheBurningTrade")) then
	dwRegisterMod(
		"TheBurningTrade",
		BURNING_TRADE_TITLE ,
		"Burning Trade",
		"",
		"Interface\\ICONS\\Achievement_BG_overcome500disadvantage",		
		nil
	);

	dwRegisterCheckButton(
		"TheBurningTrade",
		BURNING_TRADE_DESC,
		nil,
		"EnableBuringTrade",
		1,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("TheBurningTrade")) then
					dwLoadAddOn("TheBurningTrade");
				end
				TBT_Toggle(true);
			else
				if (dwIsAddOnLoaded("TheBurningTrade")) then
					TBT_Toggle(false);
				end
			end
		end
	);
	dwRegisterCheckButton(
		"TheBurningTrade",
		BURNING_TRADE_QUICK_TRADE,
		nil,
		"QuickTrade",
		1,
		function (arg)			
			if (arg == 1) then		
				if (dwIsAddOnLoaded("TheBurningTrade")) then
					TBT_QUICKTRAD(true);
				end
			else		
				if (dwIsAddOnLoaded("TheBurningTrade")) then
					TBT_QUICKTRAD(false);
				end
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"TheBurningTrade",
		BURNING_TRADE_ANNOUNCE,
		nil,
		"AnnounceTrade",
		1,
		function (arg)			
			if (arg == 1) then		
				if (dwIsAddOnLoaded("TheBurningTrade")) then
					TBT_EnableAnnounceToggle(true);
				end
			else		
				if (dwIsAddOnLoaded("TheBurningTrade")) then
					TBT_EnableAnnounceToggle(false);
				end
			end
		end
	);
	dwRegisterSpinBox(
		"TheBurningTrade",
		BURNING_TRADE_SET_CHANNEL,
		nil, 
		"AnnounceChannel", 
		ANNOUNCECHANNELS, 
		ANNOUNCECHANNELS[1], 
		function(arg)			
			TBT_SetAnnounceChannel(arg);
		end,
		1
	);
	dwRegisterCheckButton(
		"TheBurningTrade",
		BURNING_TRADE_LIST,
		nil,
		"TradeList",
		1,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("TheBurningTrade")) then
					dwLoadAddOn("TheBurningTrade");
				end
				TradeLog_Toggle(true);
			else
				if (dwIsAddOnLoaded("TheBurningTrade")) then
					TradeLog_Toggle(false);
				end
			end
		end
	);

	dwRegisterButton(
		"TheBurningTrade",
		BURNING_TRADE_LIST_OPTION, 
		function()
			if (dwIsAddOnLoaded("TheBurningTrade")) then
				HideUIPanel(DuowanConfigFrame);
				if( TradeListFrame:IsVisible() ) then
					TradeListFrame:Hide();
				else
					TradeListFrame:Show();
				end
			end
		end, 
		1
	);	
end