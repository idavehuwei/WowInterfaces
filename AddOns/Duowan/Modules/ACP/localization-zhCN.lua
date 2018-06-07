-------------------------------------------------------------------------------
-- Localization
-- Simple Chinese Translated by Costa <CWDG>
-- CWDG site: http://Cwowaddon.com
-------------------------------------------------------------------------------
if not ACP then return end

if (GetLocale() == "zhCN") then
ACP:UpdateLocale( {
	["Reload your User Interface?"] = "确定重载您的用户界面么？",
	["Save the current addon list to [%s]?"] = "保存您当前使用的插件列表到[%s]?",
	["Enter the new name for [%s]:"] = "请输入[%s]的新名称：",
	["Addons [%s] Saved."] = "插件列表[%s]已保存。",
	["Addons [%s] Unloaded."] = "插件列表[%s]已卸载。",
	["Addons [%s] Loaded."] = "插件列表[%s]已加载。",
	["Addons [%s] renamed to [%s]."] = "将插件列表[%s]重命名为[%s].",
	["Loaded on demand."] = "按需载入",
	["AddOns"] = "插件管理",
	["Load"] = "载入",
	["Disable All"] = "禁用全部",
	["Enable All"] = "启用全部",
	["ReloadUI"] = "重载界面",
	["Sets"] = "配置",
	["No information available."] = "无可用信息",
	["Loaded"] = "已载入",
	["Addon Control Panel"] = "插件管理控制面板",
	["Recursive"] = "递归",--check
	["LoD Children"] = "按需加载子插件",
	["Loadable OnDemand"] = "可随需求加载",
	["Disabled on reloadUI"] = "重载界面后禁用",
	["Default"] = "默认";
	["Set "] = "设定：";
	["Save"] = "保存";
	["Load"] = "加载";
	["Add to current selection"] = "添加当前选择";
	["Remove from current selection"] = "移除当前选择";
	["Rename"] = "重命名";
	["Use SHIFT to override the current enabling of dependancies behaviour."] = "使用Shift键忽视当前的递归设定。",
	["Press CTRL to override the enabling of LoD children."] = "按Ctrl键忽视当前按需求载入子插件的设置。",
	["Click to enable protect mode. Protected addons will not be disabled"] = "点击启用保护模式。被保护的插件将不会被禁用。",
	["when performing a reloadui."]= "执行重载界面",
	 ["ACP: Some protected addons aren't loaded. Reload now?"]= "ACP：一些被保护插件不能正常加载。是否现在重载？",
	["Active Embeds"] = "动态嵌入",
	["Memory Usage"] = "内存使用",
	

	["Blizzard_AchievementUI"] = "暴雪: 成就系统",
	["Blizzard_AuctionUI"] = "暴雪: 拍卖行",
	["Blizzard_BarbershopUI"] = "暴雪: 理发店",
	["Blizzard_BattlefieldMinimap"] = "暴雪: 战场小地图",
	["Blizzard_BindingUI"] = "暴雪: 按键设置",
	["Blizzard_Calendar"] = "暴雪: 日历",
	["Blizzard_CombatLog"] = "暴雪: 战斗日志",
	["Blizzard_CombatText"] = "暴雪: 系统SCT",
	["Blizzard_FeedbackUI"] = "暴雪: Feedback",
	["Blizzard_GlyphUI"] = "暴雪: Glyph",
	["Blizzard_GMSurveyUI"] = "暴雪: GM请求面板",
	["Blizzard_GuildBankUI"] = "暴雪: 公会银行面板",
	["Blizzard_InspectUI"] = "暴雪: 观察人物界面",
	["Blizzard_ItemSocketingUI"] = "暴雪: 物品打孔",
	["Blizzard_MacroUI"] = "暴雪: 宏面板",
	["Blizzard_RaidUI"] = "暴雪: Raid团队面板",
	["Blizzard_TalentUI"] = "暴雪: 天赋面板",
	["Blizzard_TimeManager"] = "暴雪: 时间管理",
	["Blizzard_TokenUI"] = "暴雪: Token",
	["Blizzard_TradeSkillUI"] = "暴雪: 商业技能",
	["Blizzard_TrainerUI"] = "暴雪: 技能学习面板",
	["Blizzard_VehicleUI"] = "暴雪: Vehicle",

	["*** Enabling <%s> %s your UI ***"] = "*** 启用<%s>， %s你的用户界面 ***",
	["*** Unknown Addon <%s> Required ***"] = "*** 需要未知的插件<%s> ***",
	["LoD Child Enable is now %s"] = "按需载入子插件：%s",
	["Recursive Enable is now %s"] = "递归载入插件：%s",
	["Addon <%s> not valid"] = "无效插件：<%s>",
	["Reload"] = "重载",
	["Author"] = "作者",
	["Version"] = "版本",
	["Status"] = "状态",
	["Dependencies"] = "依赖",--需要
	["Embeds"] = "内置",--嵌入
	["Close"] = "关闭",
	["Undefined"] = "未分类",
	["Notes:"] =  "注意:",
	["Don't load AddOns of Duowan here."] = "不要这里加载多玩的插件.",
	["Blizzard"] = "暴雪",
	["Show Duowan AddOns"] = "显示多玩魔盒的插件",
} )
end