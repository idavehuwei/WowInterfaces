if GetLocale() == "zhTW" then
	local loc = zBar3.loc

	loc.Option = {
		Title = "zBar 設置",
		SelectBar	= "選擇動作條",
		Attribute	= "屬性",
		Layout		= "排列",
		InCombat = "戰斗時",
		Commons = "公共屬性",
		Reset    = "還原動作條",

		FullMode = "完整模式",

		Hide = "隱藏",
		Label = "名字",
		Lock = "鎖定",
		HotKey = "隱藏綁定",

		AutoPop = "自動彈出",
		AutoHide = "自動隱藏",

		Suite1 = "組合1",
		Suite2 = "組合2",
		Circle = "圓環",
		Free = "隨意",
		Invert = "反向",

		HideTip = "隱藏滑鼠提示",
		LockButtons = "鎖定所有按鈕",
		HideGrid = "隱藏空按鈕",
		PageTrigger = "自動繙頁",
		CatStealth = "德魯伊貓形態潛行翻頁",

		Scale = "縮放",
		Inset = "按鈕間距",
		Num = "按鈕數",
		NumPerLine = "每行按鈕數",
		Alpha = "透明度",
	}

	loc.Tips = {
		FullMode= '完整模式替換全部動作條，精簡模式只有額外動作條',

		Hide		= "顯示 / 隱藏 動作條",
		Label	= "顯示 / 隱藏 動作條的名字",
		Lock		= "鎖定動作條，並隱藏標簽",
		HotKey			= "顯示 / 隱藏 按鈕的快捷鍵",

		AutoPop	= "選擇敵對目標或進入戰鬥狀態時彈出，平時隱藏",
		AutoHide	= "戰斗中自動隱藏，平時顯示",

		Suite1		= "保守一些的排列方式\n12個按鈕時請調整間距",
		Suite2		= "較爲新穎的排列方式\n12個按鈕時請調整間距",
		Circle		= "圓環。設置間距可調整半徑。",
		Free			= "Ctrl+Alt+Shift 移動按鈕，滑鼠滾輪進行縮放",
		Invert		= "水平翻轉，左右倒置",

		HideTip		= "顯示 / 隱藏 按鈕的滑鼠提示",
		LockButtons	= "鎖定所有動作條的按鈕",
		HideGrid		= "當按鈕中無技能或物品時隱藏按鈕",
		PageTrigger = "按下Alt時或切換到協助目標時，主1自動繙頁",

		Scale			= "移動滑塊縮放動作條到合適大小",
		Inset			= "調整按鈕的間距",
		Num				= "設置動作條顯示的按鈕數量\n如果是擴展條，設置此值會增減影射條的按鈕總數",
		NumPerLine	= "設置每行按鈕的數量\n從而組合出橫向、縱向、多行的排列方式",
		Alpha			= "設置動作條透明度\n滑鼠移入時透明度還原",
	}
end