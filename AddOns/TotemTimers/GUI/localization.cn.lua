﻿local L = LibStub("AceLocale-3.0"):NewLocale("TotemTimers_GUI", "zhCN")
if not L then return end
L["TotemTimers"] = "图腾助手"
L["Automatic"] = "自动" -- Requires localization
L["Bottom"] = "底部" -- Requires localization
L["Down"] = "下拉" -- Requires localization
L["Enable"] = "启用"
L["Left"] = "左" -- Requires localization
L["Right"] = "右" -- Requires localization
L["Top"] = "顶部" -- Requires localization
L["Up"] = "上展" -- Requires localization
L["Version"] = "版本"
L["vertical"] = "垂直显示"
L["down"] = "下"
L["up"] = "上"

L["Blizz Style"] = "暴雪样式"
L["Displays timer bars underneath times"] = "在计时时间下方显示背景" -- Requires localization
L["General"] = "综合"
L["Hide Blizzard Timers"] = "隐藏系统计时器"
L["Hide Default Totem Bar"] = "隐藏默认的图腾条"
L["Hide Default Totem Bar Desc"] = "隐藏系统自带的图腾条" -- Requires localization
L["Hide In Vehicles"] = "载具中隐藏界面"
L["Hide In Vehicles Desc"] = "当使用载具时隐藏 TotemTimers。"
L["Lock"] = "锁定"
L["Locks the position of TotemTimers"] = "锁定 TotemTimers 的位置"
L["Red Flash Color"] = "闪光提示" -- Requires localization
L["RedFlash Desc"] = "启用后在图腾即将到期时闪烁红光。" -- Requires localization
L["Shows tooltips on timer and totem buttons"] = "显示提示信息" -- Requires localization
L["Show Timer Bars"] = "显示计时条" -- Requires localization
L["Show Tooltips"] = "按钮提示" -- Requires localization
L["Stop Pulse"] = "过期提示" -- Requires localization
L["Stop Pulse Desc"] = " 在技能持续时间过期时图标变大。" -- Requires localization
L["Time Font"] = "计时条字体样式"

L["Advanced Options"] = "选项" -- Requires localization
L["Arrangement"] = "排列样式"
L["box"] = "双排" -- Requires localization
L["Button Size"] = "按钮大小"
L["Enable Pulse Bar"] = "周期图腾生效提示"
L["horizontal"] = "水平"
L["loose"] = "自由排列"
L["Mini Icons Desc"] = "小图标显示当前方案预设的图腾" -- Requires localization
L["Open On Rightclick"] = "右键点击打开"
L["Player Range"] = "图腾效果范围提示"
L["Player Range Desc"] = "如果你超出图腾效果范围时在图腾计时器上显示一个红点"
L["Pulse desc"] = "显示周期图腾触发提示（战栗，清毒等）" -- Requires localization
L["Raid Member Range"] = "统计图腾未影响人数"
L["Raid Range Tooltip"] = "显示图腾未影响人名" -- Requires localization
L["Range Desc"] = "在图标左下角显示有多少个团队成员没有受到你图腾影响" -- Requires localization
L["Rightclick Desc"] = "右键开启图腾选择选项" -- Requires localization
L["RR Tooltip Desc"] = "鼠标移动在图腾图标上时显示具体的图腾未影响人名" -- Requires localization
L["Scales the timer buttons"] = "设置图标大小比例" -- Requires localization
L["Scaling"] = "缩放" -- Requires localization
L["Sets the font size of time strings"] = "设置计时条大小比例" -- Requires localization
L["Sets the format in which times are displayed"] = "Sets the format in which times are displayed" -- Requires localization
L["Sets the space between timer buttons"] = "设置间隔" -- Requires localization
L["Show Mini Icons"] = "显示方案图腾" -- Requires localization
L["Show Totem Cooldowns"] = "显示图腾冷却计时条" -- Requires localization
L["Spacing"] = "间距"
L["Timer Bar Position"] = "计时条位置"
L["Timer Bar Position Desc"] = "设置显示时间相对于图腾图标的位置" -- Requires localization
L["Timers"] = "图腾图标选项" -- Requires localization
L["Time Size"] = "计时条大小" -- Requires localization

L["Ankh Tracker"] = "重生"
L["Ankh Tracker Desc"] = "显示复生技能的剩余冷却时间以及你的背包内十字章的数量。"
L["EarthShieldDesc"] = "显示大地之盾的剩余时间和次数。"
L["Earth Shield Tracker"] = "大地之盾"
L["focus"] = "焦点目标"
L["target"] = "目标"
L["targettarget"] = "目标的目标"
L["player"] = "自己"
L["esrecast"] = "重新施放 (上次生效的目标)"
L["Leftclick"] = "左键点击"
L["Middle Button"] = "鼠标中键"
L["Rightclick"] = "右键点击"
L["Shield Tracker"] = "萨满护盾"
L["Shield Tracker Desc"] = "显示萨满护盾的剩余时间和次数"
L["Trackers"] = "监视器"
L["Weapon Buff Tracker"] = "武器祝福"
L["WeaponDesc"] = "显示武器祝福的剩余时间。" 

L["Menu Direction"] = "菜单方向"
L["Multicast Button"] = "图腾方案选项" -- Requires localization
L["Same as totem menus"] = "与图腾方向一致" -- Requires localization

L["Timers On Buttons"] = "在按钮上显示计时"
L["Duration"] = "持续时间"
L["ECD Button Size"] = "按钮大小"
L["ECD Font Size"] = "字体大小"
L["EnhanceCDs"] = "增强CD"
L["Hide OOC Desc"] = "设置改变将在下次战斗时生效"
L["Hide out of combat"] = "脱离战斗时隐藏"
L["Maelstrom Bar Height"] = "烈焰震击计时条高度"
L["OOC Alpha"] = "OOC透明度"
L["OOC Alpha Desc"] = "控制按钮是否在脱离战斗后透明, 0 = 透明, 1 = 不透明"
L["Show OmniCC counters"] = "显示OmniCC计时"

TT_GUI_ROLE_NAMES = {
	[0]="未知",
	[1]="近战",
	[2]="远程",
	[3]="施法者",
	[4]="治疗",
	[5]="增强"
}

