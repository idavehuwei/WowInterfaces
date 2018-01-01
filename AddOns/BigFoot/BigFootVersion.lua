
BIGFOOT_VERSION = "3.1.0.163";

function BigFootChangelog_ah()
	BIGFOOT_CHANGELOG1 = "<HTML><BODY>";
end

function BigFootChangelog_at(title)
	BIGFOOT_CHANGELOG1 = BIGFOOT_CHANGELOG1 .. "<BR/><H1>" .. title .. "</H1>";
end

function BigFootChangelog_ar(title, details)
	BIGFOOT_CHANGELOG1 = BIGFOOT_CHANGELOG1 .. "<P>|cff00e0e0" .. title .. "|r：" .. details .. "</P>";
end

function BigFootChangelog_af()
	BIGFOOT_CHANGELOG1 = BIGFOOT_CHANGELOG1 .. "</BODY></HTML>";
end


if (GetLocale() == "zhCN") then
	BigFootChangelog_ah();
	
	BigFootChangelog_at("09/28/2009 (3.1.0.163)");
	BigFootChangelog_ar("大脚客户端", "客户端版本升级至1.136。木马查杀模块增加了启动时5秒快速查杀功能。能够帮助用户在桌面建快捷方式。");
	BigFootChangelog_ar("MiDKP", "升级到2.06，优化了分数显示和排序，添加右键菜单，解决和聊天插件冲突的问题。");
	BigFootChangelog_ar("目标魔法", "增加了区分自己和他人释放的BUFF和DEBUFF显示功能和调整目标大小的功能。");
	BigFootChangelog_ar("伤害统计", "为recount添加了小地图按钮。");
	BigFootChangelog_ar("物品价格", "现在可以选择物品的单价和总价显示。");
	BigFootChangelog_ar("施法条增强", "增加了施法条插件，可以显示施法延迟。");

	
	BigFootChangelog_at("09/21/2009 (3.1.0.162)");
	BigFootChangelog_ar("MiDKP", "增加了平均分配物品分数以及点击粘贴物品的功能。");
	BigFootChangelog_ar("鼠标提示", "优化了双天赋显示。");
	BigFootChangelog_ar("团队警报", "增加了团队警报插件。");
	BigFootChangelog_ar("萨满助手", "修复了萨满助手只能按键使用的BUG。");
	BigFootChangelog_ar("副本地图", "副本地图现在能正确显示所有副本。");
	BigFootChangelog_ar("物品价格", "增加了物品总价以及更新了用途。");
	BigFootChangelog_ar("地图标记", "修正了地图标记显示的一个小问题。");
	BigFootChangelog_ar("装备比较", "提供了装备属性分析的菜单。");
	BigFootChangelog_ar("字体修改", "对物品数量与金币字体进行修改。");


	BigFootChangelog_at("09/02/2009 (3.1.0.161)");
	BigFootChangelog_ar("自动拾取", "修正自动拾取插件不能正确动作的问题。");
	BigFootChangelog_ar("装备统计", "修正装备统计有时候不能显示耐久度的问题。");
	BigFootChangelog_ar("MiDKP", "完善MiDKP插件，修正一些BUG以及添加了一些小功能。");
	BigFootChangelog_ar("邮件助手", "修正邮件助手打开多邮件的时候小地图上的邮件图标可能不正确的问题。");
	BigFootChangelog_ar("玩家链接", "增加密语频道的聊天骚扰警报功能。");
	BigFootChangelog_ar("猎人助手", "修正猎人助手有时候出现宠物条不显示的问题。");
	BigFootChangelog_ar("地图专家", "添加地图专家模块，该功能默认是开启的。");
	BigFootChangelog_ar("萨满助手", "修正萨满助手按键绑定的问题。");
	BigFootChangelog_ar("副本地图", "提供副本地图以及首领掉落功能。");

	BigFootChangelog_at("08/14/2009 (3.1.0.160)");
	BigFootChangelog_ar("大脚客户端", "大脚客户端版本升级至1.135。解决部分电信通玩家无法更新插件的问题。该版本校验码为：09CEBD3C33C51A9682BEDE41B2EE907F。");
	BigFootChangelog_ar("地图标记", "修正打开新地图，会自动建一个新标记的问题。");
	BigFootChangelog_ar("DBM", "修正DBM的计时器为英文的问题。");

	BigFootChangelog_at("08/10/2009 (3.1.0.159)");
	BigFootChangelog_ar("大脚客户端", "为解决部分杀毒软件出现误杀的情况，客户端版本升级至1.134。该版本校验码为：E4115E8F3C9FA342C9E35E7878EC1B69。");
	BigFootChangelog_ar("MiDKP", "修正MiDKP的几处小BUG。");

	BigFootChangelog_at("08/08/2009 (3.1.0.158)");
	BigFootChangelog_ar("大脚客户端", "客户端版本升级至1.133，修复部分玩家无法登录的问题。该版本校验码为：E42A4CF0A9600B9A2428E04619399E86。");

	BigFootChangelog_at("08/07/2009 (3.1.0.157)");
	BigFootChangelog_ar("大脚客户端", "客户端版本更新至1.132，修复部分玩家无法登陆的问题。调整界面。");
	BigFootChangelog_ar("MiDKP", "升级MiDKP版本至2.0.2，详情请查看http://dkp.178.com。");
	BigFootChangelog_ar("萨满助手", "修正萨满助手弹出脚本错误的问题。");
	BigFootChangelog_ar("地图标记", "修正地图标记不可用的问题。");
	BigFootChangelog_ar("猎人助手", "修复猎人助手可能出现脚本错误的问题。");

	BigFootChangelog_at("08/03/2009 (3.1.0.156)");
	BigFootChangelog_ar("装备统计", "修正查看玩家时显示的总是第一套天赋的问题。");
	BigFootChangelog_ar("首领报警", "升级首领报警模块至最新版本。");
	BigFootChangelog_ar("任务增强", "增加任务增强模块，该模块默认是开启的。");
	BigFootChangelog_ar("增益魔法", "修正增益魔法可能出现脚本错误的问题。");

	BigFootChangelog_at("07/31/2009 (3.1.0.155)");
	BigFootChangelog_ar("大脚客户端", "修正部分用户无法使用下载配置以及上传配置的问题。修正注册页面为空的问题。");
	BigFootChangelog_ar("装备统计", "修正装备统计不能显示的问题。");
	BigFootChangelog_ar("物品信息", "修正拍卖行不能记录物品拍卖价格的问题。");
	BigFootChangelog_ar("增益魔法", "修正增益魔法一处小问题。");

	BigFootChangelog_at("07/30/2009 (3.1.0.154)");
	BigFootChangelog_ar("物品信息", "修正在拍卖行拍卖东西时可能出现脚本错误的问题。");
	BigFootChangelog_ar("信息盒", "修正载入现代界面时出现脚本错误的问题。");
	BigFootChangelog_ar("大脚基本库", "修正进入战场可能弹出脚本错误的问题。");
	BigFootChangelog_ar("竞技助手", "升级了竞技助手Gladius插件。");
	BigFootChangelog_ar("天赋模拟器", "由于官方已经自带天赋模拟器，故移除天赋模拟器模块。");
	BigFootChangelog_ar("焦点头像", "修正焦点头像可能存在的错误。");

	BigFootChangelog_at("07/29/2009 (3.1.0.153)");
	BigFootChangelog_ar("大脚客户端", "客户端版本升级至1.130。");
	BigFootChangelog_ar("大脚客户端", "增加了快速木马查杀模块，感谢“贝壳”公司提供技术支持。该功能在顶部的右侧按钮。（必须先下载）");
	BigFootChangelog_ar("大脚客户端", "针对网易版魔兽世界客户端进行调整，使其能够正常指向服务器。");
	BigFootChangelog_ar("大脚客户端", "本版本的校验码为09527568053F3C0A2D0C942A08730F62，请注意查看。");

	BigFootChangelog_at("07/02/2009 (3.1.0.152)");
	BigFootChangelog_ar("任务查询", "完善了任务查询的数据。基本上可以查询到所有的任务。");

	BigFootChangelog_at("06/04/2009 (3.1.0.150)");
	BigFootChangelog_ar("大脚客户端", "客户端版本升级至1.128。");

	BigFootChangelog_at("05/26/2009 (3.1.0.149)");
	BigFootChangelog_ar("大脚客户端", "客户端版本升级至1.127。");
	BigFootChangelog_ar("DKP", "采用大脚自主研发的DKP插件MiDKP替代CT_RaidTracker，欢迎大家踊跃尝试。");

	BigFootChangelog_at("05/15/2009 (3.1.0.148)");
	BigFootChangelog_ar("任务查询", "修正任务查询不可用的问题。");

	BigFootChangelog_at("05/12/2009 (3.1.0.147)");
	BigFootChangelog_ar("大脚客户端", "大脚台服版插件更新至版本3.1。");
	BigFootChangelog_ar("团队首领", "升级团队首领模块(DBM)到版本4。");
	BigFootChangelog_ar("团队框架", "升级团队框架(Grid)。");
	BigFootChangelog_ar("仇恨统计", "升级仇恨统计(Omen)。");

	BigFootChangelog_at("3/13/2009 (3.0.0.146)");
	BigFootChangelog_ar("大脚客户端", "客户端版本升级至1.126。");
	BigFootChangelog_ar("背包整合", "修正银行背包整合可能出现脚本错误的问题。");
	BigFootChangelog_ar("物品信息", "修正物品信息可能出现脚本错误的问题。");
	BigFootChangelog_ar("信息盒", "修正信息盒可能出现脚本错误的问题。");

	BigFootChangelog_at("3/9/2009 (3.0.0.144)");
	BigFootChangelog_ar("法术计时", "优化法术计时器进度条的平滑度。");
	BigFootChangelog_ar("频道过滤", "不过滤玩家自身频繁发送的语句。");
	BigFootChangelog_ar("物品信息", "当拍卖行开启的时候，Shift点击背包里的物品可以快速查询；右键点击物品可以快速进行拍卖。");
	BigFootChangelog_ar("大脚基本库", "尝试修正退出时可能时间过长的问题。");
	BigFootChangelog_ar("头像增强", "修正头像增强的休息指示不刷新的问题。");
	BigFootChangelog_ar("频道过滤", "制造信息加入到过滤部分。");
	BigFootChangelog_ar("背包整合", "增加显示任务物品的边框颜色。");
	BigFootChangelog_ar("鼠标提示", "鼠标提示默认位置改为右下方，而不是跟随鼠标移动。");
	BigFootChangelog_ar("DKP工具", "增加DKP工具CT_RaidTracker和MerDKP，配合dkp.178.com，可以方便进行公会管理。");
	BigFootChangelog_ar("大脚客户端", "客户端版本更新至1.125。");

	BigFootChangelog_at("2/10/2008 (3.0.0.140)");
	BigFootChangelog_ar("竞技助手", "当玩家第一次使用Gladius的时候，不再弹出测试框架。");

	BigFootChangelog_at("2/9/2008 (3.0.0.139)");
	BigFootChangelog_ar("竞技助手", "由于原竞技助手插件Proximo更新过于缓慢，现改为Gladius，希望大家喜欢。");
	BigFootChangelog_ar("聊天过滤", "聊天过滤由过滤第一个聊天窗口改为过滤选择的聊天窗口，并增加临时屏蔽频道信息的功能。");

	BigFootChangelog_at("2/2/2008 (3.0.0.137)");
	BigFootChangelog_ar("法术计时器", "修正法术计时器可能出现脚本错误的问题；修正月蚀CD计时不准确的问题。");
	BigFootChangelog_ar("法术计时器", "修正法术计时器当出现多个同样buff时会相互冲突的问题。");
	BigFootChangelog_ar("大脚基本库", "增加“双采”小功能。右键点击小地图的按钮，勾选双采即可。");

	BigFootChangelog_at("1/23/2008 (3.0.0.135)");
	BigFootChangelog_ar("法术计时器", "增加若干法术的计时。");
	BigFootChangelog_ar("头像增强", "优化头像增强以增强兼容性。");

	BigFootChangelog_at("1/21/2008 (3.0.0.134)");
	BigFootChangelog_ar("竞技助手", "升级竞技助手Proximo至最新版本。");
	BigFootChangelog_ar("伤害统计", "升级伤害统计Recount至最新版本。");
	BigFootChangelog_ar("仇恨统计", "升级仇恨统计Omen3至最新版本。");
	BigFootChangelog_ar("团队框架", "升级团队框架Grid至最新版本。");
	BigFootChangelog_ar("团队助手", "升级团队助手oRA2至最新版本。");
	BigFootChangelog_ar("频道过滤", "修正频道过滤导致在主城边卡的问题。");

	BigFootChangelog_at("1/16/2009 (3.0.0.132)");
	BigFootChangelog_ar("战斗指示", "增加战斗指示(DCT)的伤害模块，默认关闭。");
	BigFootChangelog_ar("任务增强", "增加增强任务日志(bEQL)插件。");
	BigFootChangelog_ar("背包整合", "修正银行整合可能出现脚本错误的问题。");
	BigFootChangelog_ar("大脚基本库", "增强与插件SexyMap之间的兼容性。");
	BigFootChangelog_ar("聊天过滤", "增加新功能，过滤重复的语句。");
	BigFootChangelog_ar("团队框架", "修正距离检测的BUG，感谢warbaby提供的提示。");

	BigFootChangelog_at("1/4/2009 (3.0.0.125)");
	BigFootChangelog_ar("任务查询", "更新查询资料，使其更准确。");
	BigFootChangelog_ar("冷却计时", "优化冷却计时，使其兼容性更好。");
	BigFootChangelog_ar("背包整理", "恢复特殊工具分类, 特殊处理瑞士军刀。");
	BigFootChangelog_ar("猎人助手", "修正报错问题. 自动追踪将不再会打断假死和训捕野兽。");
	BigFootChangelog_ar("增益魔法", "尝试去除污染玩家头像的问题。");
	BigFootChangelog_ar("焦点头像", "修正关闭焦点头像导致的BUG。");
	BigFootChangelog_ar("头像增强", "调整法力值的颜色，使其更加醒目。");
	BigFootChangelog_ar("信息盒", "修正信息盒形变条和宠物动作条重叠的问题。");

	BigFootChangelog_at("12/26/2008 (3.0.0121)");
	BigFootChangelog_ar("头像增强", "修正玩家能力值颜色为黑色的问题。");
	BigFootChangelog_ar("怪物目标", "应玩家要求，重新加入“怪物目标”的功能。不过该功能缺省是关闭的，如需要开启，请在团队工具中勾上选项。");

	BigFootChangelog_at("12/25/2008 (3.0.0119)");
	BigFootChangelog_ar("增益魔法大师", "修正增益魔法可能导致界面的污染问题。");
	BigFootChangelog_ar("头像增强", "修正头像增强模块在载具模式下有残存界面的问题。");
	BigFootChangelog_ar("任务查询", "修正任务查询有时候查询的结果不是当前任务的问题。");
	BigFootChangelog_ar("战斗指示", "SCT模块改用DCT模块。");
	BigFootChangelog_ar("头像增强", "修正因为死亡骑士的能力类型颜色导致的脚本错误。");
	BigFootChangelog_ar("大脚基本库", "修正大脚小按钮不能保存位置的问题。");

	BigFootChangelog_at("12/17/2008 (2.4.0113)");
	BigFootChangelog_ar("任务查询", "优化任务查询，是查询时占用资源更少。");
	BigFootChangelog_ar("银行整合", "修正银行整合可能出现错误的问题。");
	BigFootChangelog_ar("售卖助手", "修正售卖助手有时候卖掉东西后会弹出鼠标提示的问题。");
	BigFootChangelog_ar("拍卖助手", "修复物品列表无法记录的问题。");
	BigFootChangelog_ar("法术计时器", "修正法术计时器潜行者的“割裂”、“肾击”以及“切割”不能正常计时的问题。");
	BigFootChangelog_ar("冷却计时", "目标类增益魔法只计时自己施放的。");

	BigFootChangelog_at("12/12/2008 (2.4.0112)");
	BigFootChangelog_ar("任务查询", "修正任务查询某些任务不能查到的问题。");
	BigFootChangelog_ar("仇恨统计", "增加仇恨统计模块(Omen3)。");
	BigFootChangelog_ar("鼠标提示", "修正不能查看玩家装备的问题。");
	BigFootChangelog_ar("天赋模拟器", "增加新版天赋模拟器，测试阶段，如果在数据上稍有不同还请谅解。");

	BigFootChangelog_at("12/9/2008 (2.4.0110)");
	BigFootChangelog_ar("大脚插件", "插件版本升级至3.0版本。");
	BigFootChangelog_ar("大脚头像", "修正法力条色彩报错的问题。");
	BigFootChangelog_ar("竞技助手", "尝试屏蔽盗贼报错的问题。");
	BigFootChangelog_ar("观察助手", "添加一些数据, 仅为避免报错, 不准确。");
	BigFootChangelog_ar("任务查询", "增加任务监视查询按键。");

	BigFootChangelog_at("11/17/2008 (2.4.0108)");
	BigFootChangelog_ar("鼠标提示", "修正鼠标提示在指示死亡骑士时出现脚本错误的问题。");
	BigFootChangelog_ar("头像增强", "增加对死亡骑士职业图标的支持。");
	BigFootChangelog_ar("背包整理", "修正英文版本整理出现空余的问题。");
	BigFootChangelog_ar("鼠标提示", "修正台服版本可能出现脚本错误的问题。");
	BigFootChangelog_ar("物品信息", "修改一处描述字段；调整金钱显示效果。");

	BigFootChangelog_at("11/14/2008 (2.4.0106)");
	BigFootChangelog_ar("大脚鼠标提示", "修正不能查看玩家装备及天赋信息的BUG；观察窗口的信息不再随鼠标划过目标而改变。");
	BigFootChangelog_ar("物品信息", "增加清除拍卖信息功能。");
	BigFootChangelog_ar("饰品助手", "增加饰品助手功能。");
	BigFootChangelog_ar("猎人助手", "修正猎人喂食窗口有时候不能动作的问题。");

	BigFootChangelog_at("11/6/2008 (2.4.0105)");
	BigFootChangelog_ar("大脚更新器", "版本更新至1.124，增加启动新选项，允许启动无声模式运行魔兽世界。");

	BigFootChangelog_at("11/3/2008 (2.4.0104)");
	BigFootChangelog_ar("自动换装", "修正自动换装无法使用快捷键的问题。");
	BigFootChangelog_ar("大脚基本库", "修正BigFoot可能导致动作被禁止的问题。");
	BigFootChangelog_ar("猎人助手", "修正猎人喂食宠物时的进度条不正确的问题。");
	BigFootChangelog_ar("插件更新", "修正部分插件可能导致脚本错误的问题。");
	BigFootChangelog_ar("萨满助手", "调整萨满助手代码以使玩家更加易于操作。");

	BigFootChangelog_at("10/31/2008 (2.4.0102)");
	BigFootChangelog_ar("插件更新", "修正美服以及台服版插件的若干错误。");

	BigFootChangelog_at("10/22/2008 (2.4.0100)");
	BigFootChangelog_ar("萨满助手", "修正萨满助手配置出现混乱的问题。");

	BigFootChangelog_at("10/20/2008 (2.4.0099)");
	BigFootChangelog_ar("大脚客户端", "客户端版本更新至1.123。");
	BigFootChangelog_ar("萨满助手", "修正萨满助手出现脚本错误的问题。");

	BigFootChangelog_at("10/17/2008 (2.4.0096)");
	BigFootChangelog_ar("大脚客户端", "客户端更新至版本1.122。");
	BigFootChangelog_ar("萨满助手", "增加[图腾召唤]技能。修正shift+左键排列菜单栏后的一个BUG。");
	BigFootChangelog_ar("物品信息", "修正无法记录物品出售价格的bug。");

	BigFootChangelog_at("9/27/2008 (2.4.0094)");
	BigFootChangelog_ar("鼠标提示", "鼠标提示的设置坐标的范围扩大到-300至300像素。");
	BigFootChangelog_ar("法术计时器", "增加潜行者的法术“药膏”的选项。如果你不希望显示“药膏”的计时，可以手动关闭该法术。");

	BigFootChangelog_at("9/22/2008 (2.4.0093)");
	BigFootChangelog_ar("萨满助手", "修正萨满助手可能出现脚本错误的问题。");
	BigFootChangelog_ar("物品信息", "修正物品信息可能导致脚本错误的问题。");
	BigFootChangelog_ar("萨满助手", "修正萨满助手有时候在关闭的情况下会自动加载的问题。");

	BigFootChangelog_at("9/16/2008 (2.4.0089)");
	BigFootChangelog_ar("大脚客户端", "大脚客户端版本升级至1.121，尝试修复一些用户出现运行错误的问题。");
	BigFootChangelog_ar("法术计时器", "修正法术计时器中对图腾计时的时候可能出现卡住的问题。修正计时器的切割问题。");
	BigFootChangelog_ar("萨满助手", "增加新的模块，萨满助手。该模块目前处于测试期，默认是关闭的。如果想要开启，可以通过点击职业助手模块开启，欢迎尝试。");
	BigFootChangelog_ar("鼠标提示", "修正鼠标提示有时候会遮住动作条按钮的问题。");
	BigFootChangelog_ar("信息收集", "修正代码以便更加精确数据。");

	BigFootChangelog_at("9/11/2008 (2.4.0084)");
	BigFootChangelog_ar("法术计时器", "修正法术计时器中潜行者的切割技能计时错误的问题。");

	BigFootChangelog_at("9/10/2008 (2.4.0083)");
	BigFootChangelog_ar("猎人助手", "修正猎人助手有时候在战斗状态外依然有快速射击计时条的问题。");
	BigFootChangelog_ar("信息收集", "修正部分NPC无法获得坐标信息的问题。");
	BigFootChangelog_ar("大脚任务查询", "修正任务查询可能出现脚本错误的问题。");
	BigFootChangelog_ar("一键驱散", "如果用户没有设定宏按键，将不会有未绑定的提示。");
	BigFootChangelog_ar("法术计时器", "针对法术计时器进行第三次改版，修正若干错误以及增加一些法术的计时。");
	BigFootChangelog_ar("法术计时器", "增加新功能，Shift点击法术图标可以在聊天输入框中插入法术的剩余时间文字说明。");
	BigFootChangelog_ar("首领模块", "首领模块(DBM)版本升级至3.22。");
	BigFootChangelog_ar("任务查询", "修正在宽屏模式下，任务查询的删除按钮位置不正确的问题。");
	BigFootChangelog_ar("信息盒", "修正现代版以及精简版切换到传统版的时候，会出现动作按键无法通过键盘施法的问题。");
	BigFootChangelog_ar("信息盒", "修正暗夜精灵盗贼夜遁时可能出现插件被禁止的提示的问题。");

	BigFootChangelog_at("8/28/2008 (2.4.0074)");
	BigFootChangelog_ar("大脚更新客户端", "为了保证兼容性，大脚开启URL将改用启动IE浏览器，而不是默认浏览器。");
	BigFootChangelog_ar("大脚基本库", "更新了ACE库文件。更新了一键驱散(Decursive)、团队框架(Grid)以及仇恨统计(Omen)插件。");
	BigFootChangelog_ar("怪物目标", "修正怪物目标清空监控者列表时按钮文字错误的问题。更改坦克列表为监控者列表。");
	BigFootChangelog_ar("任务查询", "完善某些任务数据不完整的问题，查询更加准确。");

	BigFootChangelog_at("8/20/2008 (2.4.0070)");
	BigFootChangelog_ar("任务查询", "修正任务查询繁体版出现区域混乱的问题。");
	BigFootChangelog_ar("鼠标提示", "修正鼠标提示可能出现脚本错误的问题。");
	BigFootChangelog_ar("小地图按键包", "修正小地图按键包可能出现堆栈溢出导致的脚本错误。");
	BigFootChangelog_ar("法术助手", "修正法术助手出现多个图标时拾取法术混乱的问题。");
	BigFootChangelog_ar("大脚更新器", "修正大字体模式下，界面出现残缺的问题。");
	BigFootChangelog_ar("任务查询", "增加[删除查询标记]以及[返回]按钮。");
	BigFootChangelog_ar("副本地图", "修正副本地图可能出现脚本错误的问题。");
	BigFootChangelog_ar("地图标记", "修正地图标记会显示在副本地图上的问题。");
	BigFootChangelog_ar("自动换装", "防止自动换装拖动时会拖出到屏幕外面的问题。");
	BigFootChangelog_ar("大脚基本库", "修正Ace3重复加载时可能出现脚本错误的问题。");

	BigFootChangelog_at("8/12/2008 (2.4.0065)");
	BigFootChangelog_ar("大脚更新器", "修正某些用户依旧出现重复更新widget.xml的问题。");
	BigFootChangelog_ar("大脚更新器", "修正某些用户出现程序非法的问题。");
	BigFootChangelog_ar("任务查询", "增加任务查询的繁体版。名称是从简体而来，可能会稍有出路，但不影响使用。");
	BigFootChangelog_ar("任务查询", "修正任务查询后可能导致ESC键无法使用的问题。");
	BigFootChangelog_ar("大脚头像", "修正焦点头像的普通模式可能出现无法显示的问题。");
	BigFootChangelog_ar("战斗指示", "修正战斗指示sct在某些情况下会出现脚本错误的问题。");

	BigFootChangelog_at("7/31/2008 (2.4.0062)");
	BigFootChangelog_ar("任务查询", "更换任务查询模块iWoWQuery为BigFootQuest，查询结果更加准确和完备。");
	BigFootChangelog_ar("大脚基本库", "修正大脚基本库出现有关LibRock的脚本错误的问题。");
	BigFootChangelog_ar("大脚更新", "修正重复更新widget.xml的问题。");

	BigFootChangelog_at("7/28/2008 (2.4.0060)");
	BigFootChangelog_ar("首领模块", "版本更新至2.31。");
	BigFootChangelog_ar("大脚基本库", "更新所有Ace模块至最新版本。");
	BigFootChangelog_ar("仇恨统计", "仇恨统计插件更新至最新版本。");
	BigFootChangelog_ar("伤害统计", "伤害统计插件更新至最新版本。");
	BigFootChangelog_ar("装备信息", "修正装备统计可能出现脚本错误的问题。");
	BigFootChangelog_ar("信息收集", "修正信息收集某些数据不准确的问题。");

	BigFootChangelog_at("7/22/2008 (2.4.0058)");
	BigFootChangelog_ar("大脚基本库", "修正来自暴雪标准界面的本地化BUG：当有多名玩家进入战场时会导致脚本错误。");
	BigFootChangelog_ar("伤害统计", "版本升级至78174。");
	BigFootChangelog_ar("大脚基本库", "修正WMP模块未完全移除导致的脚本错误。");
	BigFootChangelog_ar("大脚基本库", "移除针对who命令BUG所作的补丁。");

	BigFootChangelog_at("7/21/2008 (2.4.0056)");
	BigFootChangelog_ar("大脚基本库", "修正大脚基本库选项改变时可能出现的逻辑错误。");
	BigFootChangelog_ar("大脚小工具", "调整时钟功能，增加选项“隐藏小地图下方的时间框“。该选项默认是开启的。");
	BigFootChangelog_ar("大脚基本库", "移除WMP模块。");

	BigFootChangelog_at("7/17/2008 (2.4.0055)");
	BigFootChangelog_ar("大脚头像", "消除显示大脚头像的调试信息的错误。");
	BigFootChangelog_ar("信息收集", "修正信息收集可能出现脚本错误的问题。");
	BigFootChangelog_ar("玩家链接", "修正某些玩家无法显示查看英雄榜界面的问题。");

	BigFootChangelog_at("7/16/2008 (2.4.0053)");
	BigFootChangelog_ar("大脚客户端", "大脚客户端版本更新至1.117。优化了更新检查代码，使更新检查的速度更快。");
	BigFootChangelog_ar("信息收集", "修正信息收集过程中可能出现脚本错误的问题。");
	BigFootChangelog_ar("玩家链接", "增加新的功能“查看英雄榜信息”。该功能必须通过客户端启动游戏才有效。");
	BigFootChangelog_ar("大脚基本库", "修正大脚基本库选项变更而引起的逻辑错误。");
	BigFootChangelog_ar("大脚头像", "提供焦点头像的普通模式以及简单模式。默认启用的是普通模式。");

	BigFootChangelog_at("7/10/2008 (2.4.0047)");
	BigFootChangelog_ar("小地图按键包", "修正小地图按键包与插件WIM会出现冲突的问题。");
	BigFootChangelog_ar("装备统计", "修正装备统计在英文版出现脚本错误的问题。");
	BigFootChangelog_ar("信息收集", "修正信息收集模块可能导致英文版出现脚本错误的问题。");

	BigFootChangelog_at("7/3/2008 (2.4.0045)");
	BigFootChangelog_ar("信息收集", "优化信息收集模块，提高准确度以及效率。");
	BigFootChangelog_ar("法术计时器", "修正盗贼使用技能时切换目标导致脚本错误的问题。");
	BigFootChangelog_ar("大脚头像", "强化焦点头像功能。使其可显示焦点的目标的头像。");
	BigFootChangelog_ar("大脚基本库", "修正使用/who无法查询英文名玩家的问题。");

	BigFootChangelog_at("6/20/2008 (2.4.0039)");
	BigFootChangelog_ar("自动换装", "增加对套装添加备注信息的功能。");
	BigFootChangelog_ar("首领模块", "更新首领模块(DBM)至版本3.20。");
	BigFootChangelog_ar("大脚头像", "增加大脚头像的团队标记显示。");
	BigFootChangelog_ar("竞技助手", "修正竞技助手进行设置时弹出脚本错误的问题。");
	BigFootChangelog_ar("仇恨统计", "更新仇恨统计(Omen)版本。");
	BigFootChangelog_ar("大脚基本库", "现在使用/who命令也可以正确的查询玩家信息。");
	BigFootChangelog_ar("便捷助手", "修正便捷助手开启时导致鼠标移动到头像上不会显示目标的鼠标提示信息。");

	BigFootChangelog_at("6/18/2008 (2.4.0038)");
	BigFootChangelog_ar("副本地图", "增加新模块[副本地图]。该模块可以显示副本地图以及首领掉落。该模块默认是开启的。");
	BigFootChangelog_ar("仇恨统计", "更新仇恨统计版本。修正仇恨统计的小地图按钮消失的问题。");
	BigFootChangelog_ar("法术计时器", "修正繁体版盗贼使用切割技能时会出现脚本错误的问题。");
	BigFootChangelog_ar("大脚基本库", "修复2.4.2版本中查询玩家功能不正常的问题。");
	BigFootChangelog_ar("大脚小工具", "优化代码，使其消耗更少的处理时间。");

	BigFootChangelog_at("6/16/2008 (2.4.0037)");
	BigFootChangelog_ar("客户端", "客户段版本更新至1.114，修正游戏运行中无法进行插件更新的问题。");
	BigFootChangelog_ar("任务查询", "恢复到以前版本，该版本数据较新版本更全。");
	BigFootChangelog_ar("大脚基本库", "增加开启快速设置焦点的选项，该选项默认是开启的。你可以找到“便捷工具”模块下的“开启快速设置焦点”选项。");
	BigFootChangelog_ar("大脚动作条", "修正大脚动作条隐藏模式无法保存的问题。增加一个新的选项“隐藏未用的动作按钮”。该选项默认是关闭的。");
	BigFootChangelog_ar("自动换装", "修正使用自动换装的save命令会出现脚本错误的问题。增加“8套装增强模式”，支持多达8套的换装。该选项默认是关闭的。");
	BigFootChangelog_ar("大脚头像", "修正大脚头像关闭焦点头像后出现脚本错误的问题。");
	BigFootChangelog_ar("法术计时器", "调整法术计时器的框架透明度，并使其只能在屏幕中移动。同时，移动窗口改为必须按住Shift键才能拖动。修正法术计时器针对猎人陷阱无法正确计时的问题。");
	BigFootChangelog_ar("竞技助手", "竞技助手(Proximo)版本升级至2.3。");
	BigFootChangelog_ar("猎人助手", "喂食框体现在可以通过按住Shift键进行拖动。");
	BigFootChangelog_ar("小地图按键包", "修正小地图按键包可能弹出脚本错误的问题。");

	BigFootChangelog_at("6/9/2008 (2.4.0036)");
	BigFootChangelog_ar("背包整合", "调整背包的位置。缺省情况下，背包的位置将处于屏幕中央。");
	BigFootChangelog_ar("头像增强", "调整萨满图腾框架的位置，以避免被经验条遮住。");
	BigFootChangelog_ar("组队施法", "修正组队施法不能保存魔法的问题。");

	BigFootChangelog_at("6/6/2008 (2.4.0035)");
	BigFootChangelog_ar("大脚基本库", "现在你可以通过shift+左键点击目标头像将其设置为焦点, shift+右键取消现在的焦点。请配合大脚头像或别的焦点头像插件使用。");
	BigFootChangelog_ar("组队施法", "现在空着按键在平时将变得透明。");
	BigFootChangelog_ar("头像增强", "当开启头像增强时，标准世界状态窗体的位置会被调整以防止遮住目标头像。");
	BigFootChangelog_ar("团队框架", "修正团队框架第一次载入时会出现无法显示文字的问题。调整团队框架的缺省设置：反选颜色设置为默认是开启状态。增加若干团队框架的模块。");
	BigFootChangelog_ar("法术计时器", "修正法术计时器出现目标混乱的问题。重新校验所有法术的匹配模板。全方位支持本地化。");
	BigFootChangelog_ar("怪物血量", "修正开始显示百分比时队友及队友宠物生命值显示错误问题。");

	BigFootChangelog_at("5/30/2008 (2.4.0034)");
	BigFootChangelog_ar("怪物血量", "修复怪物血量的数值可能有残留的问题。");
	BigFootChangelog_ar("团队助手", "修复团队助手(oRA2)可能弹出“重新载入插件”的窗口。");
	BigFootChangelog_ar("一键驱散", "修复一键驱散的脚本错误。");

	BigFootChangelog_at("5/30/2008 (2.4.0033)");
	BigFootChangelog_ar("法术计时器", "尝试修复法术计时器出现重叠的问题。");
	BigFootChangelog_ar("大脚小工具", "强化坐标显示模块，支持拖动。");
	BigFootChangelog_ar("团队助手", "增加新的团队助手模块(oRA2)。以前的Grid更名为团队框架。");
	BigFootChangelog_ar("一键驱散", "修正血精灵牧师优先使用吞噬魔法进行驱散的问题。");
	BigFootChangelog_ar("一键驱散", "萨满祭司左键改为绑定消毒术（以前为净化术），右键绑定为祛病术。修改一键驱散的宏按键，缺省为响应左键，按住Alt键后该宏响应为右键。按住Shift键后改宏响应为Ctrl-左键。");
	BigFootChangelog_ar("怪物血量", "消除怪物血量数值重叠的问题。增加目标魔法值显示, 该项缺省为开启。");

	BigFootChangelog_at("5/26/2008 (2.4.0032)");
	BigFootChangelog_ar("基本库", "修正GOLD,SILVER,COPPER全局变量取消所产生的错误。");
	BigFootChangelog_ar("基本库", "更新Ace Library以及部分Ace插件。");

	BigFootChangelog_at("5/26/2008 (2.4.0031)");
	BigFootChangelog_ar("基本库", "修正GOLD全局变量取消所产生的错误。");
	BigFootChangelog_ar("任务查询", "暂时取消对接受任务等级的判断。");
	BigFootChangelog_ar("大脚动作条", "大脚动作条将不再自动隐藏空按键, 避免按键消失问题。");
	BigFootChangelog_ar("法术计时器", "修正萨满的法术即使出现混乱的问题。修正法术计时器重复Buff的时候无法正确计时的问题。修正法术计时器施法过程中切换目标导致目标混乱的问题。");
	BigFootChangelog_ar("鼠标提示", "修正鼠标提示移动到尸体上弹出对话框的问题。");

	BigFootChangelog_at("5/21/2008 (2.4.0030)");
	BigFootChangelog_ar("饰品管理", "修正饰品管理在2.4.2版本中会出现脚本错误的问题。");
	BigFootChangelog_ar("大脚客户端", "版本升级至1.113。优化更新时的速度。");


	BigFootChangelog_af();

	BIGFOOT_VERSION_FONT1 = "Fonts\\ZYHei.TTF";
	BIGFOOT_VERSION_FONT2 = "Fonts\\ZYHei.TTF";
	BIGFOOT_VERSION_FONT3 = "Fonts\\ZYHei.TTF";
	BIGFOOT_VERSION_FONT4 = "Fonts\ZYKai_T.TTF";

	BIGFOOT_VERSION_TITLE = "更新日志";
elseif (GetLocale() == "zhTW") then
	BigFootChangelog_ah();

	BigFootChangelog_at("11/14/2008 (2.4.0106)");
	BigFootChangelog_ar("大腳滑鼠提示", "修正不能查看玩家裝備及天賦資訊的BUG；觀察視窗的資訊不再隨滑鼠劃過目標而改變。");
	BigFootChangelog_ar("物品資訊", "增加清除拍賣資訊功能。");
	BigFootChangelog_ar("飾品助手", "增加飾品助手功能。");
	BigFootChangelog_ar("獵人助手", "修正獵人餵食視窗有時候不能動作的問題。");

	BigFootChangelog_at("11/6/2008 (2.4.0105)");
	BigFootChangelog_ar("大腳更新器", "版本更新至1.124，增加啟動新選項，允許啟動無聲模式運行魔獸世界。");

	BigFootChangelog_at("11/3/2008 (2.4.0104)");
	BigFootChangelog_ar("自動換裝", "修正自動換裝無法使用快速鍵的問題。");
	BigFootChangelog_ar("大腳基本庫", "修正BigFoot可能導致動作被禁止的問題。");
	BigFootChangelog_ar("獵人助手", "修正獵人餵食寵物時的進度條不正確的問題。");
	BigFootChangelog_ar("外掛程式更新", "修正部分外掛程式可能導致腳本錯誤的問題。");
	BigFootChangelog_ar("薩滿助手", "調整薩滿助手代碼以使玩家更加易於操作。");

	BigFootChangelog_at("10/31/2008 (2.4.0102)");
	BigFootChangelog_ar("外掛程式更新", "修正美服以及台服版外掛程式的若干錯誤。");

	BigFootChangelog_at("10/22/2008 (2.4.0100)");
	BigFootChangelog_ar("薩滿助手", "修正薩滿助手配置出現混亂的問題。");

	BigFootChangelog_at("10/20/2008 (2.4.0099)");
	BigFootChangelog_ar("大腳用戶端", "用戶端版本更新至1.123。");
	BigFootChangelog_ar("薩滿助手", "修正薩滿助手出現腳本錯誤的問題。");

	BigFootChangelog_at("10/17/2008 (2.4.0096)");
	BigFootChangelog_ar("大腳用戶端", "用戶端更新至版本1.122。");
	BigFootChangelog_ar("薩滿助手", "增加[圖騰召喚]技能。修正shift+左鍵排列功能表列後的一個BUG。");
	BigFootChangelog_ar("物品資訊", "修正無法記錄物品出售價格的bug。");

	BigFootChangelog_at("9/27/2008 (2.4.0094)");
	BigFootChangelog_ar("滑鼠提示", "滑鼠提示的設置座標的範圍擴大到-300至300圖元。");
	BigFootChangelog_ar("法術計時器", "增加潛行者的法術“藥膏”的選項。如果你不希望顯示“藥膏”的計時，可以手動關閉該法術。");

	BigFootChangelog_at("9/22/2008 (2.4.0093)");
	BigFootChangelog_ar("薩滿助手", "修正薩滿助手可能出現腳本錯誤的問題。");
	BigFootChangelog_ar("物品資訊", "修正物品資訊可能導致腳本錯誤的問題。");
	BigFootChangelog_ar("薩滿助手", "修正薩滿助手有時候在關閉的情況下會自動載入的問題。");

	BigFootChangelog_at("9/16/2008 (2.4.0089)");
	BigFootChangelog_ar("大腳用戶端", "大腳用戶端版本升級至1.121，嘗試修復一些使用者出現運行錯誤的問題。");
	BigFootChangelog_ar("法術計時器", "修正法術計時器中對圖騰計時的時候可能出現卡住的問題。修正計時器的切割問題。");
	BigFootChangelog_ar("薩滿助手", "增加新的模組，薩滿助手。該模組目前處於測試期，默認是關閉的。如果想要開啟，可以通過點擊職業助手模組開啟，歡迎嘗試。");
	BigFootChangelog_ar("滑鼠提示", "修正滑鼠提示有時候會遮住動作條按鈕的問題。");
	BigFootChangelog_ar("資訊收集", "修正代碼以便更加精確資料。");

	BigFootChangelog_at("9/11/2008 (2.4.0084)");
	BigFootChangelog_ar("法術計時器", "修正法術計時器中潛行者的切割技能計時錯誤的問題。");

	BigFootChangelog_at("9/10/2008 (2.4.0083)");
	BigFootChangelog_ar("獵人助手", "修正獵人助手有時候在戰鬥狀態外依然有快速射擊計時條的問題。");
	BigFootChangelog_ar("資訊收集", "修正部分NPC無法獲得座標資訊的問題。");
	BigFootChangelog_ar("大腳任務查詢", "修正任務查詢可能出現腳本錯誤的問題。");
	BigFootChangelog_ar("一鍵驅散", "如果使用者沒有設定巨集按鍵，將不會有未綁定的提示。");
	BigFootChangelog_ar("法術計時器", "針對法術計時器進行第三次改版，修正若干錯誤以及增加一些法術的計時。");
	BigFootChangelog_ar("法術計時器", "增加新功能，Shift點擊法術圖示可以在聊天輸入框中插入法術的剩餘時間文字說明。");
	BigFootChangelog_ar("首領模組", "首領模組(DBM)版本升級至3.22。");
	BigFootChangelog_ar("任務查詢", "修正在寬屏模式下，任務查詢的刪除按鈕位置不正確的問題。");
	BigFootChangelog_ar("資訊盒", "修正現代版以及精簡版切換到傳統版的時候，會出現動作按鍵無法通過鍵盤施法的問題。");
	BigFootChangelog_ar("資訊盒", "修正暗夜精靈盜賊夜遁時可能出現外掛程式被禁止的提示的問題。");

	BigFootChangelog_at("8/28/2008 (2.4.0074)");
	BigFootChangelog_ar("大腳更新用戶端", "為了保證相容性，大腳開啟URL將改用啟動IE流覽器，而不是默認流覽器。");
	BigFootChangelog_ar("大腳基本庫", "更新了ACE庫文件。更新了一鍵驅散(Decursive)、團隊框架(Grid)以及仇恨統計(Omen)外掛程式。");
	BigFootChangelog_ar("怪物目標", "修正怪物目標清空監控者清單時按鈕文字錯誤的問題。更改坦克列表為監控者列表。");
	BigFootChangelog_ar("任務查詢", "完善某些任務資料不完整的問題，查詢更加準確。");

	BigFootChangelog_at("8/20/2008 (2.4.0070)");
	BigFootChangelog_ar("任務查詢", "修正任務查詢繁體版出現區域混亂的問題。");
	BigFootChangelog_ar("滑鼠提示", "修正滑鼠提示可能出現腳本錯誤的問題。");
	BigFootChangelog_ar("小地圖按鍵包", "修正小地圖按鍵包可能出現堆疊溢位導致的腳本錯誤。");
	BigFootChangelog_ar("法術助手", "修正法術助手出現多個圖示時拾取法術混亂的問題。");
	BigFootChangelog_ar("大腳更新器", "修正大字體模式下，介面出現殘缺的問題。");
	BigFootChangelog_ar("任務查詢", "增加[刪除查詢標記]以及[返回]按鈕。");
	BigFootChangelog_ar("副本地圖", "修正副本地圖可能出現腳本錯誤的問題。");
	BigFootChangelog_ar("地圖標記", "修正地圖標記會顯示在副本地圖上的問題。");
	BigFootChangelog_ar("自動換裝", "防止自動換裝拖動時會拖出到螢幕外面的問題。");
	BigFootChangelog_ar("大腳基本庫", "修正Ace3重複載入時可能出現腳本錯誤的問題。");

	BigFootChangelog_at("8/12/2008 (2.4.0065)");
	BigFootChangelog_ar("大腳更新器", "修正某些用戶依舊出現重複更新widget.xml的問題。");
	BigFootChangelog_ar("大腳更新器", "修正某些使用者出現程式非法的問題。");
	BigFootChangelog_ar("任務查詢", "增加任務查詢的繁體版。名稱是從簡體而來，可能會稍有出路，但不影響使用。");
	BigFootChangelog_ar("任務查詢", "修正任務查詢後可能導致ESC鍵無法使用的問題。");
	BigFootChangelog_ar("大腳頭像", "修正焦點頭像的普通模式可能出現無法顯示的問題。");
	BigFootChangelog_ar("戰鬥指示", "修正戰鬥指示sct在某些情況下會出現腳本錯誤的問題。");

	BigFootChangelog_at("7/31/2008 (2.4.0062)");
	BigFootChangelog_ar("任務查詢", "更換任務查詢模組iWoWQuery為BigFootQuest，查詢結果更加準確和完備。");
	BigFootChangelog_ar("大腳基本庫", "修正大腳基本庫出現有關LibRock的腳本錯誤的問題。");
	BigFootChangelog_ar("大腳更新", "修正重複更新widget.xml的問題。");

	BigFootChangelog_at("7/28/2008 (2.4.0060)");
	BigFootChangelog_ar("首領模組", "版本更新至2.31。");
	BigFootChangelog_ar("大腳基本庫", "更新所有Ace模組至最新版本。");
	BigFootChangelog_ar("仇恨統計", "仇恨統計外掛程式更新至最新版本。");
	BigFootChangelog_ar("傷害統計", "傷害統計外掛程式更新至最新版本。");
	BigFootChangelog_ar("裝備資訊", "修正裝備統計可能出現腳本錯誤的問題。");
	BigFootChangelog_ar("資訊收集", "修正資訊收集某些資料不準確的問題。");

	BigFootChangelog_at("7/22/2008 (2.4.0058)");
	BigFootChangelog_ar("大腳基本庫", "修正來自暴雪標準介面的當地語系化BUG：當有多名玩家進入戰場時會導致腳本錯誤。");
	BigFootChangelog_ar("傷害統計", "版本升級至78174。");
	BigFootChangelog_ar("大腳基本庫", "修正WMP模組未完全移除導致的腳本錯誤。");
	BigFootChangelog_ar("大腳基本庫", "移除針對who命令BUG所作的補丁。");

	BigFootChangelog_at("7/21/2008 (2.4.0056)");
	BigFootChangelog_ar("大腳基本庫", "修正大腳基本庫選項改變時可能出現的邏輯錯誤。");
	BigFootChangelog_ar("大腳小工具", "調整時鐘功能，增加選項“隱藏小地圖下方的時間框“。該選項預設是開啟的。");
	BigFootChangelog_ar("大腳基本庫", "移除WMP模組。");

	BigFootChangelog_at("7/17/2008 (2.4.0055)");
	BigFootChangelog_ar("大腳頭像", "消除顯示大腳頭像的調試資訊的錯誤。");
	BigFootChangelog_ar("資訊收集", "修正資訊收集可能出現腳本錯誤的問題。");
	BigFootChangelog_ar("玩家連結", "修正某些玩家無法顯示查看英雄榜介面的問題。");

	BigFootChangelog_at("7/16/2008 (2.4.0053)");
	BigFootChangelog_ar("大腳用戶端", "大腳用戶端版本更新至1.117。優化了更新檢查代碼，使更新檢查的速度更快。");
	BigFootChangelog_ar("資訊收集", "修正資訊收集過程中可能出現腳本錯誤的問題。");
	BigFootChangelog_ar("玩家連結", "增加新的功能“查看英雄榜資訊”。該功能必須通過用戶端啟動遊戲才有效。");
	BigFootChangelog_ar("大腳基本庫", "修正大腳基本庫選項變更而引起的邏輯錯誤。");
	BigFootChangelog_ar("大腳頭像", "提供焦點頭像的普通模式以及簡單模式。預設啟用的是普通模式。");

	BigFootChangelog_at("7/10/2008 (2.4.0047)");
	BigFootChangelog_ar("小地圖按鍵包", "修正小地圖按鍵包與外掛程式WIM會出現衝突的問題。");
	BigFootChangelog_ar("裝備統計", "修正裝備統計在英文版出現腳本錯誤的問題。");
	BigFootChangelog_ar("資訊收集", "修正資訊收集模組可能導致英文版出現腳本錯誤的問題。");

	BigFootChangelog_at("7/3/2008 (2.4.0045)");
	BigFootChangelog_ar("資訊收集", "優化資訊收集模組，提高準確度以及效率。");
	BigFootChangelog_ar("法術計時器", "修正盜賊使用技能時切換目標導致腳本錯誤的問題。");
	BigFootChangelog_ar("大腳頭像", "強化焦點頭像功能。使其可顯示焦點的目標的頭像。");
	BigFootChangelog_ar("大腳基本庫", "修正使用/who無法查詢英文名玩家的問題。");

	BigFootChangelog_at("6/20/2008 (2.4.0039)");
	BigFootChangelog_ar("自動換裝", "增加對套裝添加備註資訊的功能。");
	BigFootChangelog_ar("首領模組", "更新首領模組(DBM)至版本3.20。");
	BigFootChangelog_ar("大腳頭像", "增加大腳頭像的團隊標記顯示。");
	BigFootChangelog_ar("競技助手", "修正競技助手進行設置時彈出腳本錯誤的問題。");
	BigFootChangelog_ar("仇恨統計", "更新仇恨統計(Omen)版本。");
	BigFootChangelog_ar("大腳基本庫", "現在使用/who命令也可以正確的查詢玩家信息。");
	BigFootChangelog_ar("便捷助手", "修正便捷助手開啟時導致滑鼠移動到頭像上不會顯示目標的滑鼠提示資訊。");

	BigFootChangelog_at("6/18/2008 (2.4.0038)");
	BigFootChangelog_ar("副本地圖", "增加新模組[副本地圖]。該模組可以顯示副本地圖以及首領掉落。該模組預設是開啟的。");
	BigFootChangelog_ar("仇恨統計", "更新仇恨統計版本。修正仇恨統計的小地圖按鈕消失的問題。");
	BigFootChangelog_ar("法術計時器", "修正繁體版盜賊使用切割技能時會出現腳本錯誤的問題。");
	BigFootChangelog_ar("大腳基本庫", "修復2.4.2版本中查詢玩家功能不正常的問題。");
	BigFootChangelog_ar("大腳小工具", "優化代碼，使其消耗更少的處理時間。");

	BigFootChangelog_at("6/16/2008 (2.4.0037)");
	BigFootChangelog_ar("用戶端", "客戶段版本更新至1.114，修正遊戲運行中無法進行外掛程式更新的問題。");
	BigFootChangelog_ar("任務查詢", "恢復到以前版本，該版本資料較新版本更全。");
	BigFootChangelog_ar("大腳基本庫", "增加開啟快速設置焦點的選項，該選項預設是開啟的。你可以找到“便捷工具”模組下的“開啟快速設置焦點”選項。");
	BigFootChangelog_ar("大腳動作條", "修正大腳動作條隱藏模式無法保存的問題。增加一個新的選項“隱藏未用的動作按鈕”。該選項預設是關閉的。");
	BigFootChangelog_ar("自動換裝", "修正使用自動換裝的save命令會出現腳本錯誤的問題。增加“8套裝增強模式”，支援多達8套的換裝。該選項預設是關閉的。");
	BigFootChangelog_ar("大腳頭像", "修正大腳頭像關閉焦點頭像後出現腳本錯誤的問題。");
	BigFootChangelog_ar("法術計時器", "調整法術計時器的框架透明度，並使其只能在螢幕中移動。同時，移動視窗改為必須按住Shift鍵才能拖動。修正法術計時器針對獵人陷阱無法正確計時的問題。");
	BigFootChangelog_ar("競技助手", "競技助手(Proximo)版本升級至2.3。");
	BigFootChangelog_ar("獵人助手", "餵食框體現在可以通過按住Shift鍵進行拖動。");
	BigFootChangelog_ar("小地圖按鍵包", "修正小地圖按鍵包可能彈出腳本錯誤的問題。");

	BigFootChangelog_at("6/9/2008 (2.4.0036)");
	BigFootChangelog_ar("背包整合", "調整背包的位置。缺省情況下，背包的位置將處於螢幕中央。");
	BigFootChangelog_ar("頭像增強", "調整薩滿圖騰框架的位置，以避免被經驗條遮住。");
	BigFootChangelog_ar("組隊施法", "修正組隊施法不能保存魔法的問題。");

	BigFootChangelog_at("6/6/2008 (2.4.0035)");
	BigFootChangelog_ar("大腳基本庫", "現在你可以通過shift+左鍵點擊目標頭像將其設置為焦點, shift+右鍵取消現在的焦點。請配合大腳頭像或別的焦點頭像外掛程式使用。");
	BigFootChangelog_ar("組隊施法", "現在空著按鍵在平時將變得透明。");
	BigFootChangelog_ar("頭像增強", "當開啟頭像增強時，標準世界狀態表單的位置會被調整以防止遮住目標頭像。");
	BigFootChangelog_ar("團隊框架", "修正團隊框架第一次載入時會出現無法顯示文字的問題。調整團隊框架的缺省設置：反選顏色設置為預設是開啟狀態。增加若干團隊框架的模組。");
	BigFootChangelog_ar("法術計時器", "修正法術計時器出現目標混亂的問題。重新校驗所有法術的匹配範本。全方位支持當地語系化。");
	BigFootChangelog_ar("怪物血量", "修正開始顯示百分比時隊友及隊友寵物生命值顯示錯誤問題。");

	BigFootChangelog_at("5/30/2008 (2.4.0034)");
	BigFootChangelog_ar("怪物血量", "修復怪物血量的數值可能有殘留的問題。");
	BigFootChangelog_ar("團隊助手", "修復團隊助手(oRA2)可能彈出“重新載入外掛程式”的窗口。");
	BigFootChangelog_ar("一鍵驅散", "修復一鍵驅散的腳本錯誤。");

	BigFootChangelog_at("5/30/2008 (2.4.0033)");
	BigFootChangelog_ar("法術計時器", "嘗試修復法術計時器出現重疊的問題。");
	BigFootChangelog_ar("大腳小工具", "強化座標顯示模組，支援拖動。");
	BigFootChangelog_ar("團隊助手", "增加新的團隊助手模組(oRA2)。以前的Grid更名為團隊框架。");
	BigFootChangelog_ar("一鍵驅散", "修正血精靈牧師優先使用吞噬魔法進行驅散的問題。");
	BigFootChangelog_ar("一鍵驅散", "薩滿祭司左鍵改為綁定消毒術（以前為淨化術），右鍵綁定為祛病術。修改一鍵驅散的巨集按鍵，缺省為回應左鍵，按住Alt鍵後該宏回應為右鍵。按住Shift鍵後改宏回應為Ctrl-左鍵。");
	BigFootChangelog_ar("怪物血量", "消除怪物血量數值重疊的問題。增加目標魔法值顯示, 該項缺省為開啟。");

	BigFootChangelog_at("5/26/2008 (2.4.0032)");
	BigFootChangelog_ar("基本庫", "修正GOLD,SILVER,COPPER全域變數取消所產生的錯誤。");
	BigFootChangelog_ar("基本庫", "更新Ace Library以及部分Ace外掛程式。");

	BigFootChangelog_at("5/26/2008 (2.4.0031)");
	BigFootChangelog_ar("基本庫", "修正GOLD全域變數取消所產生的錯誤。");
	BigFootChangelog_ar("任務查詢", "暫時取消對接受任務等級的判斷。");
	BigFootChangelog_ar("大腳動作條", "大腳動作條將不再自動隱藏空按鍵, 避免按鍵消失問題。");
	BigFootChangelog_ar("法術計時器", "修正薩滿的法術即使出現混亂的問題。修正法術計時器重複Buff的時候無法正確計時的問題。修正法術計時器施法過程中切換目標導致目標混亂的問題。");
	BigFootChangelog_ar("滑鼠提示", "修正滑鼠提示移動到屍體上彈出對話方塊的問題。");

	BigFootChangelog_at("5/21/2008 (2.4.0030)");
	BigFootChangelog_ar("飾品管理", "修正飾品管理在2.4.2版本中會出現腳本錯誤的問題。");
	BigFootChangelog_ar("大腳用戶端", "版本升級至1.113。優化更新時的速度。");


	BigFootChangelog_af();

	BIGFOOT_VERSION_FONT1 = "Fonts\\bHEI01B.TTF";
	BIGFOOT_VERSION_FONT2 = "Fonts\\bHEI01B.TTF";
	BIGFOOT_VERSION_FONT3 = "Fonts\\bHEI01B.TTF";
	BIGFOOT_VERSION_FONT4 = "Fonts\\bLEI00D.TTF";

	BIGFOOT_VERSION_TITLE = "更新日誌";
end

function BigFootChangelog_Register()
	local font1 = {};
	font1.inherits = MasterFont;
	font1.path = BIGFOOT_VERSION_FONT1;
	font1.height = 15;
	font1.color = {r = 0.8828125, g = 0.84765625, b = 0.6875};

	local font2 = {};
	font2.inherits = MasterFont;
	font2.path = BIGFOOT_VERSION_FONT2;
	font2.height = 18;
	font2.color = {r = 1.0, g = 0.82, b = 0.09765625};

	local font3 = {};
	font3.inherits = MasterFont;
	font3.path = BIGFOOT_VERSION_FONT3;
	font3.height = 18;
	font3.color = {r = 0.0, g = 1.0, b = 0.0};

	local font4 = {};
	font4.inherits = MasterFont;
	font4.path = BIGFOOT_VERSION_FONT4;
	font4.height = 15;
	font4.color = {r = 1.0, g = 0.82, b = 0.09765625};

	local callbacks = {};
	callbacks.OnLinkClick = function(linkType, linkContent)
	end

	BigFootReader_RegisterBook(BIGFOOT_VERSION_TITLE, "BIGFOOT_CHANGELOG", true, font1, font2, font3, font4, callbacks);
end

BigFootChangelog_Register();
