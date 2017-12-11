if ( GetLocale() == "zhCN" ) then
	TITAN_MAIL_MENU_TEXT = "邮件";
	TITAN_MAIL_TOOLTIP = "邮件资讯";
	TITAN_MAIL_TOOLTIP_HINT1 = "你有未读信件来自:";
	TITAN_MAIL_TOOLTIP_HINT2 = "你没有未读信件";
	--TITAN_MAIL_TOOLTIP_HINT3 = "最新邮件来自:"
	--TITAN_MAIL_BUTTON_LABEL = "未读邮件数:";
	TITAN_MAIL_BUTTON_LABEL_NOMAIL = "没有新邮件 ";
	TITAN_MAIL_BUTTON_LABEL_MAIL = "有新邮件";
	--TITAN_MAIL_NEW_TOOLTIP = "未读信件数:";
	--TITAN_MAIL_TOTAL_TOOLTIP = "总信件数:";

	TITAN_MAIL_MENU_HIDEMM = "隐藏小地图邮件图标";
	TITAN_MAIL_MENU_STEXT = "显示内容";

elseif ( GetLocale() == "zhTW" ) then
	TITAN_MAIL_MENU_TEXT = "郵件";
	TITAN_MAIL_TOOLTIP = "郵件資訊";
	TITAN_MAIL_TOOLTIP_HINT1 = "你有未讀信件來自:";
	TITAN_MAIL_TOOLTIP_HINT2 = "你沒有未讀信件";
	--TITAN_MAIL_TOOLTIP_HINT3 = "最新郵件來自:"
	--TITAN_MAIL_BUTTON_LABEL = "未讀郵件數:";
	TITAN_MAIL_BUTTON_LABEL_NOMAIL = "沒有新郵件 ";
	TITAN_MAIL_BUTTON_LABEL_MAIL = "有新郵件";
	--TITAN_MAIL_NEW_TOOLTIP = "未讀信件數:";
	--TITAN_MAIL_TOTAL_TOOLTIP = "總信件數:";

	TITAN_MAIL_MENU_HIDEMM = "隱藏小地圖郵件圖示";
	TITAN_MAIL_MENU_STEXT = "顯示內容";
else
	TITAN_MAIL_MENU_TEXT = "Mail";
	TITAN_MAIL_TOOLTIP = "Mail info";
	TITAN_MAIL_TOOLTIP_HINT1 = "You have unread mail from:";
	TITAN_MAIL_TOOLTIP_HINT2 = "You don't have unread mail";
	--TITAN_MAIL_TOOLTIP_HINT3 = "最新邮件来自:"
	--TITAN_MAIL_BUTTON_LABEL = "未读邮件数:";
	TITAN_MAIL_BUTTON_LABEL_NOMAIL = "No mail ";
	TITAN_MAIL_BUTTON_LABEL_MAIL = "New mail";
	--TITAN_MAIL_NEW_TOOLTIP = "未读信件数:";
	--TITAN_MAIL_TOTAL_TOOLTIP = "总信件数:";

	TITAN_MAIL_MENU_HIDEMM = "Hide icon of mail on minimap";
	TITAN_MAIL_MENU_STEXT = "Show content";

end
