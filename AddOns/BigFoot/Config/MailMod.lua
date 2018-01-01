local ENABLE_MAIL_MOD;
local ENABLE_RIGHT_CLICK;
local CT_MAIL_MOD_TITLE;
if (GetLocale() == "zhCN") then
	ENABLE_MAIL_MOD = "启用邮件助手";
	ENABLE_RIGHT_CLICK = "允许邮件将物品放入邮箱";
	CT_MAIL_MOD_TITLE = {"邮件助手", "youjianzhushou"};
elseif (GetLocale() == "zhTW") then
	ENABLE_MAIL_MOD = "啟用郵件助手";
	ENABLE_RIGHT_CLICK = "允許右鍵將物品放入郵箱";
	CT_MAIL_MOD_TITLE = {"郵件助手", "youjianzhushou"};
else 
	ENABLE_MAIL_MOD = "Enable CT-Mail Mod";
	ENABLE_RIGHT_CLICK = "Enable right click to add mail item";
	CT_MAIL_MOD_TITLE = "CT-Mail Mod";
end

if (IsConfigurableAddOn("MailMod")) then
	ModManagement_RegisterMod(
		"MailMod",
		"Interface\\ICONS\\INV_Letter_06.blp",
		CT_MAIL_MOD_TITLE,
		"",
		nil
	);
	ModManagement_RegisterCheckBox(
		"MailMod",
		ENABLE_MAIL_MOD,
		nil,
		"EnableMailMod",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("MailMod")) then
					BigFoot_LoadAddOn("MailMod");
				end
				
				if (BigFoot_IsAddOnLoaded("MailMod")) then
					MailMod_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("MailMod")) then
					MailMod_Toggle(false);									
				end
			end
		end
	);
end