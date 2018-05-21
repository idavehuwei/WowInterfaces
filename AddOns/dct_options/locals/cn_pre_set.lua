﻿--if GetLocale() ~= "zhCN" then return;end

DCT_PRESET_TEXT = {
    [1] = {
        ["DCT_PRETEXTNAME"] = "默认(无图标)-预设",
        ["DCT_SHOWHIT"] = { show = { "-#am", "-#am (#bt)" } },
        ["DCT_SHOWSPELL"] = { show = { "-#am #c1#sn#ce (#ss)", "-#am #c1#sn#ce (#bt)" } },
        ["DCT_SHOWHITCRIT"] = { show = { "-#am", "-#am (#bt)" } },
        ["DCT_SHOWSPELLCRIT"] = { show = { "-#am #c1#sn#ce (#ss)", "-#am #c1#sn#ce (#bt)" } },
        ["DCT_SHOWPERIODIC"] = { show = { "-#am #sn", "-#am #sn (#bt)" } },
        ["DCT_SHOWHEAL"] = { show = { "+#am #sn", "+#am {#oh} #sn" } },
        ["DCT_SHOWPERIODICHEAL"] = { show = { "+#am #sn", "+#am {#oh} #sn" } },
        ["DCT_SHOWSHIELD"] = { show = { "-#am #sn" } },
        ["DCT_SHOWDRAIN"] = { show = { "-#am #pt" } },
        ["DCT_SHOWACTIVE"] = { show = { "→#sn" } },
        ["DCT_SHOWFACTION"] = { show = { "+#am #sn 声望", "#c2-#am #sn 声望#ce" } },
        ["DCT_SHOWHONOR"] = { show = { "+#am 荣誉" } },
        ["DCT_SHOWCOMBAT"] = { show = { "**进入战斗**" } },
        ["DCT_SHOWCOMBATLEAVE"] = { show = { "**离开战斗**" } },
        ["DCT_SHOWCP"] = { show = { "#am 星", "#c1**#ce满星#c1**#ce" } },
        ["DCT_SHOWBUFF"] = { show = { "获得: #sn" } },
        ["DCT_SHOWDEBUFF"] = { show = { "不良效果: #sn" } },
        ["DCT_SHOWBUFFFADE"] = { show = { "消失: #sn", "#sn" } },
        ["DCT_SHOWDEBUFFFADE"] = { show = { "消失:#c1#sn#ce" } },
        ["DCT_SHOWBUFFDOSE"] = { show = { "叠加: #sn<#am>", "减少: #sn<#am>" } },
        ["DCT_SHOWDEBUFFDOSE"] = { show = { "不良叠加: #sn<#am>", "不良减少: #sn<#am>" } },
        ["DCT_SHOWPOWER"] = { show = { "+#am #pt" } },
        ["DCT_SHOWENVIRONMENTAL"] = { show = { "#am #et" } },
        ["DCT_SHOWDISPELLED"] = { show = { "被驱散: #sn", "被偷取: #sn" } },
        ["DCT_SHOWEXTRAATTACKS"] = { show = { "#sn x#am" } },
        ["DCT_SHOWSPECBUFF"] = { show = { "获得: #sn", "#c1获得: #sn#ce" } },
        ["DCT_SHOWSPELLSUCCESS"] = { show = { "#sn! 命中!" } },
        ["DCT_SHOWSPELLFAILED"] = { show = { "#sn 未命中!" } },
        ["DCT_SHOWDODGE"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWABSORB"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWRESIST"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWPARRY"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWMISS"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWBLOCK"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWREFLECT"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWDEFLECT"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWIMMUNE"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
    },
    [2] = {
        ["DCT_PRETEXTNAME"] = "含图标(在左)-预设",
        ["DCT_SHOWSPELL"] = { show = { "#ic-#am #c1#sn#ce (#ss)", "#ic-#am #c1#sn#ce (#bt)" } },
        ["DCT_SHOWPERIODIC"] = { show = { "#ic-#am #sn", "#ic-#am #sn (#bt)" } },
        ["DCT_SHOWSPELLCRIT"] = { show = { "#ic-#am #c1#sn#ce (#ss)", "#ic-#am #c1#sn#ce (#bt)" } },
        ["DCT_SHOWHEAL"] = { show = { "#ic+#am #sn", "#ic+#am {#oh} #sn" } },
        ["DCT_SHOWPERIODICHEAL"] = { show = { "#ic+#am #sn", "#ic+#am {#oh} #sn" } },
        ["DCT_SHOWSHIELD"] = { show = { "#ic -#am #sn" } },
        ["DCT_SHOWACTIVE"] = { show = { "→#ic#sn" } },
        ["DCT_SHOWBUFF"] = { show = { "#ic获得: #sn" } },
        ["DCT_SHOWDEBUFF"] = { show = { "#ic不良效果: #sn" } },
        ["DCT_SHOWBUFFFADE"] = { show = { "#ic消失: #sn", "#ic#sn" } },
        ["DCT_SHOWDEBUFFFADE"] = { show = { "#ic消失:#c1#sn#ce" } },
        ["DCT_SHOWBUFFDOSE"] = { show = { "#ic叠加: #sn<#am>", "#ic减少: #sn<#am>" } },
        ["DCT_SHOWDEBUFFDOSE"] = { show = { "#ic不良叠加: #sn<#am>", "#ic不良减少: #sn<#am>" } },
        ["DCT_SHOWDISPELLED"] = { show = { "#ic被驱散: #sn", "#ic被偷取: #sn" } },
        ["DCT_SHOWSPECBUFF"] = { show = { "#ic获得: #sn", "#ic#c1获得: #sn#ce" } },
        ["DCT_SHOWSPELLSUCCESS"] = { show = { "#ic#sn! 命中!" } },
        ["DCT_SHOWSPELLFAILED"] = { show = { "#ic#sn 未命中!" } },
        ["DCT_SHOWDODGE"] = { show = { "#ms", "#ic#ms #c1(#sn)#ce" } },
        ["DCT_SHOWABSORB"] = { show = { "#ms", "#ic#ms #c1(#sn)#ce" } },
        ["DCT_SHOWRESIST"] = { show = { "#ms", "#ic#ms #c1(#sn)#ce" } },
        ["DCT_SHOWPARRY"] = { show = { "#ms", "#ic#ms #c1(#sn)#ce" } },
        ["DCT_SHOWMISS"] = { show = { "#ms", "#ic#ms #c1(#sn)#ce" } },
        ["DCT_SHOWBLOCK"] = { show = { "#ms", "#ic#ms #c1(#sn)#ce" } },
        ["DCT_SHOWREFLECT"] = { show = { "#ms", "#ic#ms #c1(#sn)#ce" } },
        ["DCT_SHOWDEFLECT"] = { show = { "#ms", "#ic#ms #c1(#sn)#ce" } },
        ["DCT_SHOWIMMUNE"] = { show = { "#ms", "#ic#ms #c1(#sn)#ce" } },
    },
    [3] = {
        ["DCT_PRETEXTNAME"] = "含图标(在中)-预设",
        ["DCT_SHOWSPELL"] = { show = { "-#am #ic#c1#sn#ce (#ss)", "-#am #ic#c1#sn#ce (#bt)" } },
        ["DCT_SHOWSPELLCRIT"] = { show = { "-#am #ic#c1#sn#ce (#ss)", "-#am #ic#c1#sn#ce (#bt)" } },
        ["DCT_SHOWPERIODIC"] = { show = { "-#am #ic#sn", "-#am #ic#sn(#bt)" } },
        ["DCT_SHOWHEAL"] = { show = { "+#am #ic#sn", "+#am {#oh} #ic#sn" } },
        ["DCT_SHOWPERIODICHEAL"] = { show = { "+#am #ic#sn", "+#am {#oh} #ic#sn" } },
        ["DCT_SHOWSHIELD"] = { show = { "-#am #sn#ic" } },
        ["DCT_SHOWACTIVE"] = { show = { "→#ic#sn" } },
        ["DCT_SHOWBUFF"] = { show = { "获得: #ic#sn" } },
        ["DCT_SHOWDEBUFF"] = { show = { "不良效果: #ic#sn" } },
        ["DCT_SHOWBUFFFADE"] = { show = { "消失: #ic#sn", "#ic#sn" } },
        ["DCT_SHOWDEBUFFFADE"] = { show = { "消失:#ic#c1#sn#ce" } },
        ["DCT_SHOWBUFFDOSE"] = { show = { "叠加: #ic#sn<#am>", "减少: #ic#sn<#am>" } },
        ["DCT_SHOWDEBUFFDOSE"] = { show = { "不良叠加: #ic#sn<#am>", "不良减少: #ic#sn<#am>" } },
        ["DCT_SHOWDISPELLED"] = { show = { "被驱散: #ic#sn", "被偷取: #ic#sn" } },
        ["DCT_SHOWSPECBUFF"] = { show = { "获得: #ic#sn", "#c1获得: #ic#sn#ce" } },
        ["DCT_SHOWSPELLSUCCESS"] = { show = { "#ic#sn! 命中!" } },
        ["DCT_SHOWSPELLFAILED"] = { show = { "#ic#sn 未命中!" } },
        ["DCT_SHOWDODGE"] = { show = { "#ms", "#ms #ic#c1(#sn)#ce" } },
        ["DCT_SHOWABSORB"] = { show = { "#ms", "#ms #ic#c1(#sn)#ce" } },
        ["DCT_SHOWRESIST"] = { show = { "#ms", "#ms #ic#c1(#sn)#ce" } },
        ["DCT_SHOWPARRY"] = { show = { "#ms", "#ms #ic#c1(#sn)#ce" } },
        ["DCT_SHOWMISS"] = { show = { "#ms", "#ms #ic#c1(#sn)#ce" } },
        ["DCT_SHOWBLOCK"] = { show = { "#ms", "#ms #ic#c1(#sn)#ce" } },
        ["DCT_SHOWREFLECT"] = { show = { "#ms", "#ms #ic#c1(#sn)#ce" } },
        ["DCT_SHOWDEFLECT"] = { show = { "#ms", "#ms #ic#c1(#sn)#ce" } },
        ["DCT_SHOWIMMUNE"] = { show = { "#ms", "#ms #ic#c1(#sn)#ce" } },
    },
    [4] = {
        ["DCT_PRETEXTNAME"] = "含图标(在右)-预设",
        ["DCT_SHOWSPELL"] = { show = { "-#am #c1#sn#ce (#ss)#ic", "-#am #c1#sn#ce (#bt)#ic" } },
        ["DCT_SHOWSPELLCRIT"] = { show = { "-#am #c1#sn#ce (#ss)#ic", "-#am #c1#sn#ce (#bt)#ic" } },
        ["DCT_SHOWPERIODIC"] = { show = { "-#am #sn#ic", "-#am (#bt)#ic" } },
        ["DCT_SHOWHEAL"] = { show = { "+#am #sn#ic", "+#am {#oh} #sn#ic" } },
        ["DCT_SHOWPERIODICHEAL"] = { show = { "+#am #sn#ic", "+#am {#oh} #sn#ic" } },
        ["DCT_SHOWSHIELD"] = { show = { "-#am #ic#sn" } },
        ["DCT_SHOWACTIVE"] = { show = { "→#sn#ic" } },
        ["DCT_SHOWBUFF"] = { show = { "获得: #sn#ic" } },
        ["DCT_SHOWDEBUFF"] = { show = { "不良效果: #sn#ic" } },
        ["DCT_SHOWBUFFFADE"] = { show = { "消失: #sn#ic", "#sn#ic" } },
        ["DCT_SHOWDEBUFFFADE"] = { show = { "消失:#c1#sn#ce#ic" } },
        ["DCT_SHOWBUFFDOSE"] = { show = { "叠加: #sn<#am>#ic", "减少: #sn<#am>#ic" } },
        ["DCT_SHOWDEBUFFDOSE"] = { show = { "不良叠加: #sn<#am>#ic", "不良减少: #sn<#am>#ic" } },
        ["DCT_SHOWDISPELLED"] = { show = { "被驱散: #sn#ic", "被偷取: #sn#ic" } },
        ["DCT_SHOWSPECBUFF"] = { show = { "获得: #sn#ic", "#c1获得: #sn#ic#ce" } },
        ["DCT_SHOWSPELLSUCCESS"] = { show = { "#sn! 命中!#ic" } },
        ["DCT_SHOWSPELLFAILED"] = { show = { "#sn 未命中!#ic" } },
        ["DCT_SHOWDODGE"] = { show = { "#ms", "#ms #c1(#sn)#ce#ic" } },
        ["DCT_SHOWABSORB"] = { show = { "#ms", "#ms #c1(#sn)#ce#ic" } },
        ["DCT_SHOWRESIST"] = { show = { "#ms", "#ms #c1(#sn)#ce#ic" } },
        ["DCT_SHOWPARRY"] = { show = { "#ms", "#ms #c1(#sn)#ce#ic" } },
        ["DCT_SHOWMISS"] = { show = { "#ms", "#ms #c1(#sn)#ce#ic" } },
        ["DCT_SHOWBLOCK"] = { show = { "#ms", "#ms #c1(#sn)#ce#ic" } },
        ["DCT_SHOWREFLECT"] = { show = { "#ms", "#ms #c1(#sn)#ce#ic" } },
        ["DCT_SHOWDEFLECT"] = { show = { "#ms", "#ms #c1(#sn)#ce#ic" } },
        ["DCT_SHOWIMMUNE"] = { show = { "#ms", "#ms #c1(#sn)#ce#ic" } },
    },
    [5] = {
        ["DCT_PRETEXTNAME"] = "简洁(无图标)-预设",
        ["DCT_SHOWHIT"] = { show = { "-#am", "-#am" } },
        ["DCT_SHOWSPELL"] = { show = { "-#am #ss", "-#am #ss" } },
        ["DCT_SHOWSPELLCRIT"] = { show = { "-#am #ss", "-#am #ss" } },
        ["DCT_SHOWPERIODIC"] = { show = { "-#am #ss", "-#am #ss" } },
        ["DCT_SHOWHEAL"] = { show = { "+#am", "+#am {#oh}" } },
        ["DCT_SHOWPERIODICHEAL"] = { show = { "+#am", "+#am {#oh}" } },
        ["DCT_SHOWSHIELD"] = { show = { "-#am" } },
        ["DCT_SHOWACTIVE"] = { show = { "→#sn" } },
        ["DCT_SHOWBUFF"] = { show = { "获得: #sn" } },
        ["DCT_SHOWDEBUFF"] = { show = { "不良效果: #sn" } },
        ["DCT_SHOWBUFFFADE"] = { show = { "消失: #sn", "#sn" } },
        ["DCT_SHOWDEBUFFFADE"] = { show = { "消失:#c1#sn#ce" } },
        ["DCT_SHOWBUFFDOSE"] = { show = { "+#sn<#am>", "-#sn<#am>" } },
        ["DCT_SHOWDEBUFFDOSE"] = { show = { "+#sn<#am>", "-#sn<#am>" } },
        ["DCT_SHOWDISPELLED"] = { show = { "被驱散: #sn", "被偷取: #sn" } },
        ["DCT_SHOWSPECBUFF"] = { show = { "#sn!", "#c1#sn!#ce" } },
        ["DCT_SHOWSPELLSUCCESS"] = { show = { "#sn! 命中" } },
        ["DCT_SHOWSPELLFAILED"] = { show = { "#sn 未命中!" } },
        ["DCT_SHOWDODGE"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWABSORB"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWRESIST"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWPARRY"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWMISS"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWBLOCK"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWREFLECT"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWDEFLECT"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
        ["DCT_SHOWIMMUNE"] = { show = { "#ms", "#ms #c1(#sn)#ce" } },
    },
    [6] = {
        ["DCT_PRETEXTNAME"] = "简洁(含图标)-预设",
        ["DCT_SHOWHIT"] = { show = { "-#am", "-#am" } },
        ["DCT_SHOWSPELL"] = { show = { "-#am#ic", "-#am#ic" } },
        ["DCT_SHOWSPELLCRIT"] = { show = { "-#am#ic", "-#am#ic" } },
        ["DCT_SHOWPERIODIC"] = { show = { "-#am#ic", "-#am#ic" } },
        ["DCT_SHOWHEAL"] = { show = { "+#am#ic", "+#am {#oh}#ic" } },
        ["DCT_SHOWPERIODICHEAL"] = { show = { "+#am#ic", "+#am {#oh}#ic" } },
        ["DCT_SHOWSHIELD"] = { show = { "-#am#ic" } },
        ["DCT_SHOWACTIVE"] = { show = { "→#sn#ic" } },
        ["DCT_SHOWBUFF"] = { show = { "获得: #ic" } },
        ["DCT_SHOWDEBUFF"] = { show = { "不良效果: #ic" } },
        ["DCT_SHOWBUFFFADE"] = { show = { "消失: #ic", "#ic" } },
        ["DCT_SHOWDEBUFFFADE"] = { show = { "消失:#ic" } },
        ["DCT_SHOWBUFFDOSE"] = { show = { "#ic+#am", "#ic-#am" } },
        ["DCT_SHOWDEBUFFDOSE"] = { show = { "#ic+#am", "#ic-#am" } },
        ["DCT_SHOWMISS"] = { show = { "#ms", "#ms #ic" } },
        ["DCT_SHOWDISPELLED"] = { show = { "被驱散: #ic", "被偷取: #ic" } },
        ["DCT_SHOWSPECBUFF"] = { show = { "#ic#sn", "#ic#sn" } },
        ["DCT_SHOWSPELLSUCCESS"] = { show = { "#ic#sn! 命中!" } },
        ["DCT_SHOWSPELLFAILED"] = { show = { "#ic#sn 未命中!" } },
        ["DCT_SHOWDODGE"] = { show = { "#ms", "#ms #ic" } },
        ["DCT_SHOWABSORB"] = { show = { "#ms", "#ms #ic" } },
        ["DCT_SHOWRESIST"] = { show = { "#ms", "#ms #ic" } },
        ["DCT_SHOWPARRY"] = { show = { "#ms", "#ms #ic" } },
        ["DCT_SHOWMISS"] = { show = { "#ms", "#ms #ic" } },
        ["DCT_SHOWBLOCK"] = { show = { "#ms", "#ms #ic" } },
        ["DCT_SHOWREFLECT"] = { show = { "#ms", "#ms #ic" } },
        ["DCT_SHOWDEFLECT"] = { show = { "#ms", "#ms #ic" } },
        ["DCT_SHOWIMMUNE"] = { show = { "#ms", "#ms #ic" } },
    },
}



DCT_PRESET_ANI[1]["DCT_PREANINAME"] = "弹出-预设"
DCT_PRESET_ANI[2]["DCT_PREANINAME"] = "抛物线-预设"
DCT_PRESET_ANI[3]["DCT_PREANINAME"] = "心型-预设"
DCT_PRESET_ANI[4]["DCT_PREANINAME"] = "水平-预设"
DCT_PRESET_ANI[5]["DCT_PREANINAME"] = "垂直-预设"
DCT_PRESET_ANI[6]["DCT_PREANINAME"] = "Hud-预设"
