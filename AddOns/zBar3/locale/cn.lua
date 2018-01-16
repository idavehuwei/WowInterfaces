if GetLocale() == "zhCN" then
    zBar3.loc = {}
    local loc = zBar3.loc

    loc.Labels = {
        zMultiR1 = "右1", zMultiR2 = "右2", zMultiBR = "右下", zMultiBL = "左下",
        zMainBar = "主1", zPetBar = "宠物", zStanceBar = "姿态", zBagBar = "背包",
        zMicroBar = "帮助", zXPBar = "经验", zCastBar = "施法", zPossessBar = "控制",
        zExBar1 = "扩展1", zShadow1 = "影射1", zExBar2 = "扩展2", zShadow2 = "影射2",
        zExBar3 = "扩展3", zShadow3 = "影射3", zExBar4 = "扩展4", zShadow4 = "影射4",
    }

    --[[ Bindings ]]--
    BINDING_HEADER_ZEXBUTTON = "炽火动作条绑定"
    for i = 1, 48 do
        setglobal("BINDING_NAME_CLICK zExButton"..i..":LeftButton", "扩展按钮"..i)
    end
end