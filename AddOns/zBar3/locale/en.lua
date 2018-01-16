if not zBar3.loc then
	zBar3.loc = {}
	local loc = zBar3.loc

	loc.language = 'en'

	loc.Labels = {
		zMultiR1 = "Right", zMultiR2 = "Left", zMultiBR = "BRight", zMultiBL = "BLeft",
		zMainBar = "Main", zPetBar = "Pet", zStanceBar = "Stance", zBagBar = "Bag",
		zMicroBar = "Micro", zXPBar = "XP", zCastBar = "Cast", zPossessBar = "Possess",
		zExBar1 = "Extra1", zShadow1 = "Shadow1", zExBar2 = "Extra2", zShadow2 = "Shadow2",
		zExBar3 = "Extra3", zShadow3 = "Shadow3", zExBar4 = "Extra4", zShadow4 = "Shadow4",
	}

	--[[ Bindings ]]--
	BINDING_HEADER_ZEXBUTTON = "zBar2 - Extra Buttons"
	for i = 1, 48 do
		setglobal("BINDING_NAME_CLICK zExButton"..i..":LeftButton", "zExButton"..i)
	end
end