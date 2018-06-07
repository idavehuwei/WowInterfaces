------------------------------------
-- dugu 2009-12-22
if (GetLocale() == "zhCN") then
	TINYTIP_TITLE = "鼠标提示";
	TINYTIP_ANCHOR = "替换系统的鼠标提示定位";
	TINYTIP_ANCHOR_M = "跟随方式";
	TINYTIP_OFFSET_X = "X偏移(30)";
	TINYTIP_OFFSET_Y = "Y偏移(-30)";	
	TINYTIP_FADE = "渐隐鼠标提示";	
	TINYTIP_POWER = "显示法力、怒气、能量等状态条";	
	TINYTIP_STATUSBARTEXT = "显示状态条数值";	
	TINYTIP_ITEMINFO = "显示物品价格等信息";	
	TINYTIP_COMPARE = "直接对比装备";	
	TINYTIP_HOVERLINK = "直接显示聊天窗口链接提示";	
	TINYTIP_CLASSCOLORBORDER = "按职业颜色着色边框";	
	TINYTIP_COLORFRIENDS = "好友和工会成员背景颜色";	
	TINYTIP_CLASSCOLORNAME = "按职业颜色着色名字";	
	TINYTIP_PVPRANK = "显示军衔及各种称号";	
	TINYTIP_RACE = "显示玩家种族";	
	TINYTIP_FACTION = "显示NPC声望等级";	
	TINYTIP_TALENT = "显示天赋及副天赋";	
	TINYTIP_BUFF = "显示Buff和Debuff";
	TINYTIP_GUILD = "显示公会";
	TINYTIP_REALM = "显示服务器";
	TINYTIP_TARGET = "显示目标";
	TINYTIP_RANGE = "显示目标距离";

	TINYTIP_OPTION_ANCHORS = {"默认","跟随(1)",	"跟随(2)","跟随(3)", "上方(1)",	"上方(2)",	"上方(3)"};
	TINYTIP_ANCHOR_DEFAULT = "跟随(2)";	
elseif (GetLocale() == "zhTW") then
	TINYTIP_TITLE = "滑鼠提示";
	TINYTIP_ANCHOR = "替换系统的鼠标提示定位";
	TINYTIP_ANCHOR_M = "跟隨方式";
	TINYTIP_OFFSET_X = "X偏移(30)";
	TINYTIP_OFFSET_Y = "Y偏移(-30)";	
	TINYTIP_FADE = "漸隱滑鼠提示";	
	TINYTIP_POWER = "顯示法力、怒氣、能量等狀態條";	
	TINYTIP_STATUSBARTEXT = "顯示狀態條數值";	
	TINYTIP_ITEMINFO = "顯示物品價格等資訊";	
	TINYTIP_COMPARE = "直接對比裝備";	
	TINYTIP_HOVERLINK = "直接顯示聊天視窗鏈結提示";	
	TINYTIP_CLASSCOLORBORDER = "按職業顏色著色邊框";	
	TINYTIP_COLORFRIENDS = "好友和工會成員背景顏色";	
	TINYTIP_CLASSCOLORNAME = "按職業顏色著色名字";	
	TINYTIP_PVPRANK = "顯示軍銜及各種稱號";	
	TINYTIP_RACE = "顯示玩家種族";	
	TINYTIP_FACTION = "顯示NPC聲望等級";	
	TINYTIP_TALENT = "顯示天賦及副天賦";	
	TINYTIP_BUFF = "顯示Buff和Debuff";
	TINYTIP_GUILD = "顯示公會";
	TINYTIP_REALM = "顯示伺服器";
	TINYTIP_TARGET = "顯示目標";
	TINYTIP_RANGE = "顯示目標距離";

	TINYTIP_OPTION_ANCHORS = {"默認","跟隨(1)",	"跟隨(2)","跟隨(3)", "上方(1)",	"上方(2)",	"上方(3)"};
	TINYTIP_ANCHOR_DEFAULT = "跟隨(2)";
else
	TINYTIP_TITLE = "鼠标提示";
	TINYTIP_ANCHOR = "替换系统的鼠标提示定位";
	TINYTIP_ANCHOR_M = "跟随方式";
	TINYTIP_OFFSET_X = "X偏移(30)";
	TINYTIP_OFFSET_Y = "Y偏移(-30)";	
	TINYTIP_FADE = "渐隐鼠标提示";	
	TINYTIP_POWER = "显示法力、怒气、能量等状态条";	
	TINYTIP_STATUSBARTEXT = "显示状态条数值";	
	TINYTIP_ITEMINFO = "显示物品价格等信息";	
	TINYTIP_COMPARE = "直接对比装备";	
	TINYTIP_HOVERLINK = "直接显示聊天窗口链接提示";	
	TINYTIP_CLASSCOLORBORDER = "按职业颜色着色边框";	
	TINYTIP_COLORFRIENDS = "好友和工会成员背景颜色";	
	TINYTIP_CLASSCOLORNAME = "按职业颜色着色名字";	
	TINYTIP_PVPRANK = "显示军衔及各种称号";	
	TINYTIP_RACE = "显示玩家种族";	
	TINYTIP_FACTION = "显示NPC声望等级";	
	TINYTIP_TALENT = "显示天赋及副天赋";	
	TINYTIP_BUFF = "显示Buff和Debuff";
	TINYTIP_GUILD = "显示公会";
	TINYTIP_REALM = "显示服务器";
	TINYTIP_TARGET = "显示目标";
	TINYTIP_RANGE = "显示目标距离";

	TINYTIP_OPTION_ANCHORS = {"默认","跟随(1)",	"跟随(2)","跟随(3)", "上方(1)",	"上方(2)",	"上方(3)"};
	TINYTIP_ANCHOR_DEFAULT = "跟随(2)";	
end

if (dwIsConfigurableAddOn("TinyTip")) then	
	dwRegisterMod(
		"TinyTip",
		TINYTIP_TITLE,
		"TinyTip",
		"",
		"Interface\\ICONS\\Achievement_BG_3flagcap_nodeaths",
		nil
	);

	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_ANCHOR,
		nil,
		"OverideDefault",
		1,
		function (arg)
			if(arg==1)then
				if (dwGetCVar("TinyTip", "AnchorMethod")) then
					TinytipUpdateAnchor(dwGetCVar("TinyTip", "AnchorMethod"));
				else
					TTVar.Anchor = 3;
				end
			else
				TTVar.Anchor = 0;
			end
		end
	);

	dwRegisterSpinBox(
		"TinyTip",
		TINYTIP_ANCHOR_M, 
		nil, 
		"AnchorMethod", 
		TINYTIP_OPTION_ANCHORS, 
		TINYTIP_ANCHOR_DEFAULT, 
		function(arg)			
			TinytipUpdateAnchor(arg);
		end,
		1
	);

	dwRegisterSpinBox(
		"TinyTip",
		TINYTIP_OFFSET_X, 
		DUOWAN_SPINBOX_RANGE, 
		"OffsetX", 
		{-200, 200, 5}, 
		30, 
		function(arg)	
			TTVar.OffsetX = arg;
		end, 
		1
	);

	dwRegisterSpinBox(
		"TinyTip",
		TINYTIP_OFFSET_Y, 
		DUOWAN_SPINBOX_RANGE, 
		"OffsetY", 
		{-200, 200, 5}, 
		-30, 
		function(arg)
			TTVar.OffsetY = arg;
		end, 
		1
	);

	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_FADE,
		nil,
		"Fade",
		0,
		function (arg)
			if(arg==1)then				
				TTVar.Fade = true;
			else
				TTVar.Fade = false;
			end
		end
	);

	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_STATUSBARTEXT,
		nil,
		"StatusBarText",
		1,
		function (arg)
			if(arg==1)then				
				TTVar.StatusBarText = 3;
			else
				TTVar.StatusBarText = 0;
			end
		end
	);

	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_HOVERLINK,
		nil,
		"HoverLink",
		1,
		function (arg)
			if(arg==1)then				
				TTVar.HoverLink = true;
			else
				TTVar.HoverLink = false;
			end
		end
	);
	
	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_COLORFRIENDS,
		nil,
		"ColorFriends",
		1,
		function (arg)
			if(arg==1)then				
				TTVar.ColorFriends = true;
				TTVar.ClassColorBorder = true;
			else
				TTVar.ColorFriends = false;
				TTVar.ClassColorBorder = false;
			end
		end
	);

	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_PVPRANK,
		nil,
		"PvPRank",
		0,
		function (arg)
			if(arg==1)then				
				TTVar.PVPRank = true;
			else
				TTVar.PVPRank = false;
			end
		end
	);
	--[[
	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_FACTION,
		nil,
		"Faction",
		1,
		function (arg)
			if(arg==1)then				
				TTVar.Faction = true;
			else
				TTVar.Faction = false;
			end
		end
	);
	]]
	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_TALENT,
		nil,
		"Talent",
		1,
		function (arg)
			if(arg==1)then				
				TTVar.Talent = true;
			else
				TTVar.Talent = false;
			end
		end
	);

	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_GUILD,
		nil,
		"Guild",
		1,
		function (arg)
			if(arg==1)then				
				TTVar.Guild = true;
				TTVar.Realm = true;
				TTVar.GuildRank = true;
			else
				TTVar.Guild = false;
				TTVar.Realm = false;
				TTVar.GuildRank = false;
			end
		end
	);

	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_TARGET,
		nil,
		"ShowTarget",
		1,
		function (arg)
			if(arg==1)then				
				TTVar.Target = 13;
			else
				TTVar.Target = 0;
			end
		end
	);
	
	dwRegisterCheckButton(
		"TinyTip",
		TINYTIP_RANGE,
		nil,
		"ShowRange",
		1,
		function (arg)
			if(arg==1)then				
				TTVar.Range = true;
			else
				TTVar.Range = false;
			end
		end
	);
end