------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	MAIL_TITLE = "邮箱增强";
	MAIL_MOD_ENABLE = "开启邮箱增强";
	MAIL_MOD_BLACKBOOK = "记录并快速添加联系人";
	MAIL_MOD_EXPRESS = "快速收发邮件";
	MAIL_MOD_OPENALL = "允许一次打开所有邮件";
	MAIL_MOD_SELECT = "允许打开所选择的邮件";
	MAIL_MOD_RAKE = "显示收取的金币数量";
	MAIL_MOD_WIRE = "自动填充主题为金币数量";	
	MAIL_MOD_DESCRIPT = "允许 Alt-点击 发送邮件"
elseif (GetLocale() == "zhTW") then
	MAIL_TITLE = "郵箱增強";
	MAIL_MOD_ENABLE = "開啟郵箱增強";
	MAIL_MOD_BLACKBOOK = "記錄並快速添加聯繫人";
	MAIL_MOD_EXPRESS = "快速收發郵件";
	MAIL_MOD_OPENALL = "允許一次打開所有郵件";
	MAIL_MOD_SELECT = "允許打開所選擇的郵件";
	MAIL_MOD_RAKE = "顯示收取的金幣數量";
	MAIL_MOD_WIRE = "自動填充主題為金幣數量";
	MAIL_MOD_DESCRIPT = "允許 Alt-點擊 發送郵件"
else
	MAIL_TITLE = "邮箱增强";
	MAIL_MOD_ENABLE = "开启邮箱增强";
	MAIL_MOD_BLACKBOOK = "记录并快速添加联系人";
	MAIL_MOD_EXPRESS = "快速收发邮件";
	MAIL_MOD_OPENALL = "允许一次打开所有邮件";
	MAIL_MOD_SELECT = "允许打开所选择的邮件";
	MAIL_MOD_RAKE = "显示收取的金币数量";
	MAIL_MOD_WIRE = "自动填充主题为金币数量";
	MAIL_MOD_DESCRIPT = "允许 Alt-点击 发送邮件"
end

if dwIsConfigurableAddOn("Postal") then	
	dwRegisterMod(
		"MAILMOD",
		MAIL_TITLE,
		"MAIL",
		"",
		"Interface\\ICONS\\INV_Letter_17",
		nil
	);

	dwRegisterCheckButton(
		"MAILMOD",
		MAIL_MOD_ENABLE,
		nil,
		"EnableMailMod",
		1,
		function (arg)
			if (arg == 1) then
				if (not dwIsAddOnLoaded("Postal")) then
					dwLoadAddOn("Postal");
				end
			else

			end
		end
	);

	dwRegisterCheckButton(
		"MAILMOD",
		MAIL_MOD_BLACKBOOK ,
		nil,
		"BlackBook",
		1,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("BlackBook", true)
				end
			else
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("BlackBook", false)
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"MAILMOD",
		MAIL_MOD_EXPRESS,
		MAIL_MOD_DESCRIPT,
		"Express",
		1,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("Express", true)
				end
			else
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("Express", false)
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"MAILMOD",
		MAIL_MOD_OPENALL,
		nil,
		"OpenAll",
		1,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("OpenAll", true)
				end
			else
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("OpenAll", false)
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"MAILMOD",
		MAIL_MOD_SELECT,
		nil,
		"Select",
		1,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("Select", true)
				end
			else
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("Select", false)
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"MAILMOD",
		MAIL_MOD_RAKE,
		nil,
		"Rake",
		1,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("Rake", true)
				end
			else
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("Rake", false)
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"MAILMOD",
		MAIL_MOD_WIRE,
		nil,
		"Wire",
		1,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("Wire", true)
				end
			else
				if (dwIsAddOnLoaded("Postal")) then
					Postal.ToggleModule2("Wire", false)
				end
			end
		end,
		1
	);
end