TrinketMenu（以下简称TM）会用一个工具条来显示你装备了的饰品。把鼠标移动它上面去会显示你包包里最多达30个的饰品来切换。

__ New in 3.7 __
- 支持工程学包包。如果你有一个装备了的工程学包包，如果空间允许的话，工程学饰品会移至那里，而普通的饰品则只会用普通包包。
- 提供BUFF的饰品不再需要一个延时了。TM将侦测 提供BUFF的物品，只要BUFF还存在，这个物品就会装备在身上。你依然可以为那些不提供BUFF的饰品或者特效用途使用延时，像棱石护符。
- 移除了过时的关于延迟的帮助

__ 切换和使用饰品 __
左击一个待装备饰品可以把它装备到上面的饰品槽
右击一个待装备饰品可以把它装备到下面的饰品槽

__ 自动排队 __

3.0 介绍了TM的自动排队饰品。在选项里，你可以对你想装备饰品槽的饰品进行排序，打开某个饰品槽的自动排队（Alt+Click 一个在工具条里的饰品，或者检查选项里的表单），然后插件就会根据饰品是否用过了或者冷却好了来自动切换。

希望大家可以不用看介绍就可以靠直觉地使用TM，如果需要一些细节：

自动排队的规则是：
- 一个少于三十秒冷却的饰品被认为是已经冷却。
- 如果当前装备的饰品正在冷却中，会被切换成没有在冷却中的第一个可用饰品。
- 如果当前装备的饰品不需要冷却（被动饰品），会被切换成一个优先权更高的已经冷却好的饰品。
- 如果当前装备的饰品正准备使用，除非一个被标志为“优先”更高优先权的饰品正在等待被装备，则不会对此饰品做任何事。
- 如果一个饰品被定义为“延时”，则在它的延迟时间内不会被切换掉
- 如果一个饰品提供一个BUFF而且那个BUFF正在作用于你，则直到这个BUFF淡出，才会切换掉这个饰品

自动排队图标颜色：
- 金色齿轮代表那个饰品槽的自动排队被激活
- 灰色齿轮代表装备的饰品被定义了延迟并且正在等待被切换掉
- 红色齿轮代表装备的饰品被标志为“暂停排队”并且自动排队被中断

其它自动排队事项：
- 如果你用了一些可以自动切换被动饰品的插件（棍子上的胡萝卜或者银色黎明徽章），那些饰品会被标志为“暂停排队”，寻样当他们被装备时会中断排队。
- 在TM中手工切换一个被动饰品会停止那个饰品槽的自动排队。Alt+click这个饰品槽会重新打开它的自动排队。
- 单纯的被动饰品会被自动移动到队列的最底部。如果你想待会停止排队（例如：博学坠饰不管是不是在冷却中都被作为底部饰品），把"-- 停止排队线--"移到你想停止的队列地方。
- 自动排队独立工作于“饰品好了“的提示。
- 战斗中或死亡状下尝试切换饰品的动作将在你脱离战斗或者复活时实现。
- 如果你不想使用自动排队或者想完全地移除这个功能，你可以在没玩游戏的时候删掉TrinketMenuQueue.xml和TrinketMenuQueue.lua。剩余的模块将是TrinketMenu 2.7的大小但是比2.7好用

__ 自动排队共享的计时器 __

当你设置你的队列时，记住很多饰品的触发是共用一个冷却计时器的，例如：

饰品0便携火炮没在冷却中
饰品1钻石水瓶没在冷却中

当你点击钻石水瓶时，它会让便携炎炮处于60秒的冷却状态。TM会寻找其它有效的饰品给饰品0，30秒后便携火炮冷却好了然后被切换上去。

这是预期的反应。如果这样的事经常发生，你可能会想只让一个饰品槽处于自动排队状态，除非你弄到一个不会触发其它饰品冷却的饰品。

__ 自定义界面 __

主窗口和菜单窗口是可单独缩放和旋转的。当窗口没被锁定时：

- 拖动任一窗口的边缘可以移动它
- 右击任一窗口的边缘可以旋转它
- 拖动任一窗口的右下角可以任意地缩放它

如果你要移动/旋转/缩放菜单窗口，但你很难抓住它的边缘，当它打开时按住Shift，鼠标移开菜单边缘时它也不会消失。

如果你右击迷你地图周围的齿轮（或者输入/trinket options），一个小选项窗口会显示在小地图的下面。你可以在里面进一步自定义像显示冷却时间以及保持菜单一直开启的选项。

一旦你确定了你想要的设置，你可以用选项来锁定窗口。

要精确地个性缩放率（可选）：
/trinket scale main n : 把主窗口缩放率调为n
/trinket scale menu n : 把菜单窗口缩放率调为n
例如：/trinket scale menu 0.85

__ 粘附 __

当“保持列表粘附”被选中（默认），菜单将一直附在主窗口的一个角上。要改变这个粘附的角，拖动菜单窗口直到主窗口跟菜单窗口的某个角会合。这个粘附的角会出现白括弧。

如果你没有选中“保持列表粘附”，记住当你的鼠标离开饰品时，菜单会消失。放手去改成你喜欢的样子。记住/trinket reset命令会重置位置跟粘附，或者你可以按住Shift让菜单一直显示。或者你可以打开“保持列表粘附“这个选项。

__ 战斗中/死亡状态排队的饰品 __

在战斗中/死亡状态你不可以切换饰品。如果你想在战斗中/死亡状态切换，当你离开战斗时TM将自动切换上饰品：

- 排队中的饰品将在饰品槽的头上显示一个小图标。
- 如果你想让一个饰品退出排队，重新点击一次（左击或者右击）。
- 如果你想让一个饰品排队到另外一个槽，重新点击一次（左击或者右击）。
- “战斗队列”现在只有一个饰品deep right，意思是，一旦一个队列中的饰品被装备，那个队列就空了。
- 为一个饰品槽选择一系列的饰品，将只会改变队列中的饰品，而不会给它们排序。去选项里改变队列顺序吧。

__ 杂项 __

- 如果在你上下移动排序列表里的饰品时按住shift，这个列表会停在原处。
- 你可以拖动迷你地图的图标，它会围着迷你地图转。
- 你可以像你在包包或者清单里一样Shift+click一个饰品，把它的链接复制到聊天栏
- 如果你登入到一个包包里没有饰品的角色里，饰品窗口不会显示。
- 你可以在切换或者操作窗口时按住Shift防止菜单消失。
- 你可以设置热键绑定来使用上面和下面的饰品。
- 如果你装有Scrolling Combat Text（SCT）插件，并且它的“Notify When Ready（准备好时提示）”被选中时，当某个饰品准备好时，TM会通过SCT发送一条消息。

__ 可选的命令 __

/trinket或者/trinketmenu : 开关窗口
/trinket reset : 重置窗口
/trinket opt : 传出选项窗口
/trinket lock|unlock : 锁/解锁窗口
/triknet scale main|menu n : 精确缩放窗口
/trinket help : 列出上面的命令

__ TrinketMenu.SetQueue (高级用户（既然是高级用户，就能看懂下面的了）) __

This function is intended to be used by those that want to script different sort orders or script the auto queue behavior to work with other gear-swapping mods.

TrinketMenu.SetQueue(0 or 1,"ON" or "OFF" or "PAUSE" or "RESUME" or list)

"ON" : Turn queue on irregardless of previous state
"OFF" : Turn queue off irregardless of previous state
"PAUSE" : Suspend queue if it was on
"RESUME" : Return queue to normal operation if it was paused

some examples:
/script TrinketMenu.SetQueue(1,"PAUSE") -- if queue is going, pause it
/script TrinketMenu.SetQueue(1,"RESUME") -- if queue is paused, resume it
/script TrinketMenu.SetQueue(1,"SORT","Earthstrike","Insignia of the Alliance","Diamond Flask") -- set sort
/script TrinketMenu.SetQueue(0,"SORT","Lifestone","Darkmoon Card: Heroism") -- set sort
/script TrinketMenu.SetQueue(1,"SORT","PVP Profile") -- set sort to "PVP Profile"
(a "stop the queue" is assumed at the end of the list)

So in ItemRack if you want a different queue when in a raid or not:

name: In Raid
trigger: RAID_ROSTER_UPDATE
delay: 0.5
script:
if GetNumRaidMembers()>0 and not IR_INRAID then
  IR_INRAID = 1
  TrinketMenu.SetQueue(1,"SORT","Zandalarian Hero Badge","Force of Will")
elseif IR_INRAID and GetNumRaidMembers()==0 then
  IR_INRAID = nil
  TrinketMenu.SetQueue(1,"SORT","Earthstrike","Diamond Flask","Defender of the Timbermaw")
end
--[[ Changes trinket sort orders depending on whether in a raid or not ]]

or for some situation when you don't want trinkets swapping at all:

name: In IF
trigger: ZONE_CHANGED_NEW_AREA
delay: 2
script:
if GetRealZoneText()=="Ironforge" and not IR_INIF then
  IR_INIF = 1
  TrinketMenu.SetQueue(0,"PAUSE")
elseif IR_INIF and GetRealZoneText()~="Ironforge" then
  IR_INIF = nil
  TrinketMenu.SetQueue(0,"RESUME")
end
--[[ Pauses trinket slot 0 auto queue while in IF ]]

下面就是作者很详细的FAQS了，像使用宏，ITEMRACK跟TM的关系，移动图标/窗口之类的。详见readme.txt
FAQS：
想把TM的设置变为一个帐号通用
把TrinketMenu.toc里的
## SavedVariables: TrinketMenuOptions
## SavedVariablesPerCharacter: TrinketMenuPerOptions

改为：
## SavedVariables: TrinketMenuOptions, TrinketMenuPerOptions
如果想把全局设置变为单独人物设置，则
## SavedVariablesPerCharacter: TrinketMenuOptions, TrinketMenuPerOptions