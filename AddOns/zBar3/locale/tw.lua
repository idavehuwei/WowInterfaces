if GetLocale() == "zhTW" then
	zBar3.loc = {}
	local loc = zBar3.loc

	loc.Labels = {
		zMultiR1 = "右1", zMultiR2 = "右2", zMultiBR = "右下", zMultiBL = "左下",
		zMainBar = "主1", zPetBar = "寵物", zStanceBar = "姿態", zBagBar = "背包",
		zMicroBar = "幫助", zXPBar = "經驗", zCastBar = "施法", zPossessBar = "控制",
		zExBar1 = "擴展1", zShadow1 = "影射1", zExBar2 = "擴展2", zShadow2 = "影射2",
		zExBar3 = "擴展3", zShadow3 = "影射3", zExBar4 = "擴展4", zShadow4 = "影射4",
	}

	--[[ Bindings ]]--
	BINDING_HEADER_ZEXBUTTON = "熾火動作條綁定"
	for i = 1, 48 do
		setglobal("BINDING_NAME_CLICK zExButton"..i..":LeftButton", "擴展按鈕"..i)
	end
end