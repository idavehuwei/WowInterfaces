zBar3FullMode = {}
zBar3:AddPlugin(zBar3FullMode, zExBars)

function zBar3FullMode:Load()
	-- zBar3 defaults

	zBar3.defaults["zMainBar"] = {
		saves = {linenum = 12, hideTab=true,},
		pos = {"BOTTOM",-100,60-24},
	}
	zBar3.defaults["zMultiR2"] = {
		saves = {linenum = 1,},
		pos ={"BOTTOMRIGHT",-47,500},
	}
	zBar3.defaults["zMultiR1"] = {
		saves = {linenum = 1,},
		pos ={"BOTTOMRIGHT",-7,500},
	}
	zBar3.defaults["zMultiBR"] = {
		saves = {linenum = 12, hideTab=true,},
		pos ={"BOTTOM",-100,132-24},
	}
	zBar3.defaults["zMultiBL"] = {
		saves = {linenum = 12, hideTab=true,},
		pos ={"BOTTOM",-100,96-24},
	}
	zBar3.defaults["zPetBar"] = {
		saves = {num = 10, inset = 6, linenum = 10, max = 10, scale = 0.8,
			hideTab=true,hideHotkey=true,},
		pos = {"BOTTOM",-100,222-24/0.8},
	}
	zBar3.defaults["zStanceBar"] = {
		saves = {num=10, inset = 10, linenum = 10, max = 10, scale = 0.8,
			hideTab=true,hideHotkey=true,},
		pos = {"BOTTOM",-100,222-24/0.8},
	}
	zBar3.defaults["zPossessBar"] = {
		saves = {num=2, inset = 10, linenum = 2, max = 2, scale = 0.8,
			hideTab=true,hideHotkey=true,},
		pos = {"BOTTOM",330,222-24/0.8},
	}
	zBar3.defaults["zBagBar"] = {
		saves = {num=6, linenum=6, max=6, scale=0.9, hideTab=true, invert=true},
		pos = {"BOTTOMRIGHT",-3,90-24/0.9},
	}
	zBar3.defaults["zMicroBar"] = {
		saves = {num=10, linenum=10, max=10, scale=0.68, hideTab=true,},
		pos = {"BOTTOMRIGHT",-238,70-24/0.68},
	}
	zBar3.defaults["zXPBar"] = {
		saves = {num = 3, max = 3, scale=0.422,},
		pos = {"BOTTOM",98, 148-24},
	}

end
