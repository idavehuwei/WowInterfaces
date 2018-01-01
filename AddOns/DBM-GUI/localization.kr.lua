if GetLocale() ~= "koKR" then return end

if not DBM_GUI_Translations then DBM_GUI_Translations = {} end
local L = DBM_GUI_Translations

L.MainFrame = "죽이는 보스 모드"

L.TabCategory_Options 	= "일반 옵션"
L.TabCategory_WOTLK 		= "리치왕의 분노"
L.TabCategory_BC 		= "불타는 성전"
L.TabCategory_CLASSIC 	= "오리지널"
L.TabCategory_OTHER     = "기타 보스 모드"

L.BossModLoaded 	= "%s 공략 상황"
L.BossModLoad_now 	= [[현재 보스의 모드가 로드되지 않았습니다. 
애드온 불러오기 버튼을 클릭하여 강제적으로 보스 모드를 실행시킬 수 있습니다.
]]

L.PosX = '위치 X'
L.PosY = '위치 Y'

L.MoveMe 		= '위치 이동'
L.Button_OK 		= '확인'
L.Button_Cancel 	= '취소'
L.Button_LoadMod 	= '애드온 불러오기'
L.Mod_Enabled		= "보스 모드 허용"
L.Mod_EnableAnnounce	= "공격대 경보로 알리기"
L.Reset 		= "리셋"

L.Enable  		= "켜기"
L.Disable		= "끄기"

L.NoSound		= "사운드 끄기"

-- Tab: Boss Statistics
L.BossStatistics	= "보스 공략 상황"
L.Statistic_Kills	= "킬수:"
L.Statistic_Wipes	= "전멸:"
L.Statistic_BestKill	= "최고 기록:"
L.Statistic_Heroic	= "영웅"

-- Tab: General Options
L.General 			= "일반 DBM 옵션"
L.EnableDBM 		= "DBM 사용"
L.EnableStatus 		= "귓속말 대상자에게 'status' 답변 보내기 사용"
L.AutoRespond 		= "자동 부활 사용 - 무덤 이동"
L.EnableMiniMapIcon	= "Minimap 버튼 사용"

L.Button_RangeFrame	= "보기/숨기기 거리-프레임"
L.Button_TestBars	= "테스트 바 시작"

L.PizzaTimer_Headline 	= '"Pizza Timer" 만들기'
L.PizzaTimer_Title	= '이름 (예 : "Pizza!")'
L.PizzaTimer_Hours 	= "시"
L.PizzaTimer_Mins 	= "분"
L.PizzaTimer_Secs 	= "초"
L.PizzaTimer_ButtonStart = "타이머 시작"
L.PizzaTimer_BroadCast	= "공격대에 알리기"

-- Tab: Raidwarning
L.Tab_RaidWarning 	= "공격대 경보"
L.RaidWarnColors 	= "공격대 경보 컬러"
L.RaidWarnColor_1 	= "컬러 1"
L.RaidWarnColor_2 	= "컬러 2"
L.RaidWarnColor_3 	= "컬러 3"
L.RaidWarnColor_4 	= "컬러 4"
L.InfoRaidWarning	= [[레이드 경고 프레임의 위치와 컬러를 수정할 수 있습니다. 
이것은 메세지를 위한 컬러 수정 프레임이며 "Y 가 X에게 주문을 걸었습니다." 같은 메세지를 뜻합니다.]]
L.ColorResetted 	= "현재 필드의 컬러 셋팅을 초기화 합니다."
L.ShowWarningsInChat 	= "위험 알림을 채팅 창에 보여줍니다."
L.ShowFakedRaidWarnings = "위험 알림을 공격대 경보 메세지처럼 보여줍니다."
L.WarningIconLeft 	= "아이콘을 왼쪽에 보여주기"
L.WarningIconRight 	= "아이콘을 오른쪽에 보여주기"
L.RaidWarnMessage 	= "죽이는 보스 모드를 사용해 주셔셔 감사합니다."
L.BarWhileMove 		= "레이드 경보 위치 수정"
L.RaidWarnSound		= "레이드-경보 사운드"
L.SpecialWarnSound	= "특별한 경보 사운드"

-- Tab: Barsetup
L.BarSetup   = "바 스타일"
L.BarTexture = "바 텍스쳐"
L.BarStartColor = "시작 컬러"
L.BarEndColor = "마지막 컬러"
L.ExpandUpwards		= "바를 위로 쌓기"

L.Slider_BarOffSetX 	= "자세한 가로 위치: %d"
L.Slider_BarOffSetY 	= "자세한 세로 위치: %d"
L.Slider_BarWidth 	= "바 길이: %d"
L.Slider_BarScale 	= "바 스케일(크기): %0.2f"
L.AreaTitle_BarSetup 	= "일반 바 옵션"
L.AreaTitle_BarSetupSmall = "작은 바 옵션"
L.AreaTitle_BarSetupHuge = "커다란 바 옵션"
L.BarIconLeft 		= "왼쪽 아이콘"
L.BarIconRight 		= "오른쪽 아이콘"
L.EnableHugeBar 	= "커다란 바 사용(바 2)"
L.FillUpBars		= "바를 채워나가기"

-- Tab: Spam Filter
L.Panel_SpamFilter		= "스팸 필터"
L.Area_SpamFilter		= "일반 스팸 필터 옵션"
L.HideBossEmoteFrame	= "레이드 보스가 사용하는 감정표현 숨기기"
L.SpamBlockRaidWarning	= "다른 보스 모드가 알리는 경보 감추기" 
L.SpamBlockBossWhispers	= "전투 중 사용되는 <DBM> 경보 귓속말 감추기"

