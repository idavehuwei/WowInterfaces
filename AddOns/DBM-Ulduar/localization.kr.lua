if GetLocale() ~= "koKR" then return end
local L

----------------------
--  FlameLeviathan  --
----------------------
L = DBM:GetModLocalization("FlameLeviathan")

L:SetGeneralLocalization{
	name = "거대 화염전차"
}

L:SetTimerLocalization{
	timerPursued			= "추적: %s",
	timerFlameVents			= "화염 분출",
	timerSystemOverload	= "시스템 과부화"
}
	
L:SetMiscLocalization{
	YellPull		= "적대적인 존재 감지. 위협 수준 평가 체제 가동. 주 목표물과 교전. 위협 수준 재평가까지 30초.",
	Emote			= "%%s 추적중 (%S+)%."
}

L:SetWarningLocalization{
	--pursueTargetWarn		= "추적중! >%s<!",
	PursueWarn					= "추적 >%s<!",	
	warnNextPursueSoon		= "추적 전환 5 초전",
	SpecialPursueWarnYou		= "거대 화염전차가 당신을 추적합니다!",	
	SystemOverload				= "시스템 과부화"	
}

L:SetOptionLocalization{
	timerSystemOverload		= "시스템 과부화 타이머 보기",
	timerFlameVents			= "화염 분출 타이머 보기",
	timerPursued			= "추적 타이머 보기",
	SystemOverload			= "시스템 과부화 특수 경고 보기",
	SpecialPursueWarnYou	= "추적자 특수 경보 보기",
	PursueWarn				= "추적 플레이어 레이드 경보로 보기",
	warnNextPursueSoon		= "다음 추적 경고 보기"
}


-------------
--  Ignis  --
-------------
L = DBM:GetModLocalization("Ignis")

L:SetGeneralLocalization{
	name = "용광로 군주 이그니스"
}

L:SetTimerLocalization{
	TimerFlameJetsCast		= "화염 분출",
	TimerFlameJetsCooldown	= "다음 화염 분출",
	TimerScorch				= "다음 불태우기",
	TimerScorchCast			= "불태우기",
	TimerSlagPot			= "용암재 단지 : %s"
}

L:SetWarningLocalization{
	WarningSlagPot			= ">%s< 에게 용암재 단지",
	SpecWarnJetsCast		= "화염 분출 - 시전 중지"
}

L:SetOptionLocalization{
	SpecWarnJetsCast			= "화염 분출 시전의 특수 경보 보기(counterspell)",
	TimerFlameJetsCast			= "화염 분출 시전 타이머 보기",
	TimerFlameJetsCooldown		= "화염 분출 쿨다운 타이머 보기",
	TimerScorch					= "불태우기 쿨다운 타이머 보기",
	TimerScorchCast				= "불태우기 시전 타이머 보기",
	WarningSlagPot				= "용암재 단지 대상 알리기",
	TimerSlagPot				= "용암재 단지 타이머 보기",
	SlagPotIcon					= "용암재 단지 대상 아이콘(징표) 설정"	
}

------------------
--  Razorscale  --
------------------
L = DBM:GetModLocalization("Razorscale")

L:SetGeneralLocalization{
	name = "칼날비늘"
}

L:SetWarningLocalization{	
	SpecWarnDevouringFlame		= "파멸의 불길 - 이동! 이동! 이동!",
	SpecWarnDevouringFlameCast	= "당신에게 파멸의 불길!",
	WarnDevouringFlameCast		= ">%s< 에게 파멸의 불길", 	
	warnTurretsReadySoon		= "20초 후 4번째 포탑 준비",
	warnTurretsReady			= "4번째 포탑 준비"
	
}
L:SetTimerLocalization{
	timerAllTurretsReady	= "포탑",
	timerTurret1			= "1 번째 포탑",
	timerTurret2			= "2 번째 포탑",
	timerTurret3			= "3 번째 포탑",
	timerTurret4			= "4 번째 포탑",
	timerGroundedTemp		= "지상 착지",	
}
L:SetOptionLocalization{
	SpecWarnDevouringFlame		= "파멸의 불길 대상 특수 경보 보기",
	SpecWarnDevouringFlameCast	= "파멸의 불길 대상이 되었을 때 특수 경보 보기",	
	PlaySoundOnDevouringFlame	= "파멸의 불길 데미지를 받을 때 사운드 재생",
	timerAllTurretsReady		= "포탑 타이머 보기",
	warnTurretsReadySoon		= "포탑 사전 경보 보기",
	warnTurretsReady			= "포탑 경보 보기",
	WarnDevouringFlameCast      	= "파멸의 불길 시전 경보 보기",
	timerTurret1				= "첫번째 포탑 타이머 보기",
	timerTurret2				= "두번째 포탑 타이머 보기",
	timerTurret3				= "세번째 포탑 타이머 보기(25인)",
	timerTurret4				= "네번째 포탑 타이머 보기(25인)", 
	timerGroundedTemp			= "지상 착지 유지 시간 보기",
	OptionDevouringFlame		= "파멸의 불길 대상 알리기 (부정확함)"
}

L:SetMiscLocalization{
	YellAir 						= "저희에게 잠깐 포탑을 설치할 시간을 주세요.",
	YellGroundTemp				= "움직이세요! 오래 붙잡아둘 순 없을 겁니다!",
	EmotePhase2					= "%%s이 완전히 땅에 내려앉았습니다!",	
	FlamecastUnknown			= "알 수 없음"
}


-------------
--  XT002  --
-------------
L = DBM:GetModLocalization("XT002")

L:SetGeneralLocalization{
	name = "XT-002 해체자"
}

L:SetWarningLocalization{
	SpecialWarningLightBomb	 	= "당신에게 빛의 폭탄",
	WarningLightBomb			= ">%s< 에게 빛의 폭탄",
	SpecialWarningGravityBomb	= "당신에게 중력 폭탄",
	WarningGravityBomb			= ">%s< 에게 중력 폭탄",
}

L:SetOptionLocalization{
	SpecialWarningLightBomb		= "당신이 빛의 폭탄에 영향을 받을 때 특수 경고 보기",
	WarningLightBomb			= "빛의 폭탄 알리기",
	SpecialWarningGravityBomb	= "당신이 중력 폭탄에 영향을 받을 때 특수 경고 보기",
	WarningGravityBomb			= "중력 폭탄 알리기",
	PlaySoundOnGravityBomb		= "당신에게 중력 폭탄일 때 특수 사운드 재생",
	PlaySoundOnTympanicTantrum	= "당신에게 빛의 폭탄일 때 특수 사운드 재생",	
	SetIconOnLightBombTarget	= "빛의 폭탄 대상에게 공격대 아이콘 표시",
	SetIconOnGravityBombTarget	= "중력 폭탄 대상에게 공격대 아이콘 표시",
}

-------------------
--  무쇠 평의회  --
-------------------
L = DBM:GetModLocalization("IronCouncil")

L:SetGeneralLocalization{
	name = "무쇠 평의회"
}

L:SetWarningLocalization{
	WarningSupercharge			= "전기 충전 시전",
	WarningChainlight			= "연쇄 번개",
	WarningFusionPunch			= "융해의 주먹",
	WarningOverwhelmingPower	= ">%s< 에게 압도적인 힘",
	WarningRuneofPower			= "마력의 룬",
	WarningRuneofDeath			= "죽음의 룬",
	WarningRuneofSummoning		= "소환의 룬",
	WarningStaticDisruption		= ">%s< 에게 전자기 붕괴!",
	RuneofDeath					= "죽음의 룬 - 이동! 이동! 이동!",
	LightningTendrils			= "번개 덩굴 - 느리면 푹!찍! 이동!",
	Overload					= "과부하 - 이동!"	
}

L:SetTimerLocalization{
	TimerSupercharge			= "전기 충전",  -- gives the other bosses more power
	TimerLightningWhirl			= "번개 소용돌이",
	TimerLightningTendrils		= "번개 덩굴",
	timerFusionPunchActive		= "융합 주먹 : %s",
	timerOverwhelmingPower		= "압도적인 힘 : %s",
	timerRunicBarrier			= "룬문자 방벽",
	timerRuneofDeath			= "죽음의 룬"
}

L:SetOptionLocalization{
	TimerSupercharge			= "전기 충전 타이머 보기",
	WarningSupercharge			= "전기 충전 시전 경보 보기",
	WarningChainlight			= "연쇄 번개 알리기",
	PlaySoundOnOverload			= "과부화 일 때 소리 재생",	
	TimerLightningWhirl			= "번개 소용돌이 시전 타이머 보기",
	LightningTendrils			= "번개 덩굴 특수 경고 보기",
	TimerLightningTendrils		= "번개 덩굴 지속 타이머 보기",
	PlaySoundLightningTendrils	= "번개 덩굴일 때 소리 재생",
	WarningFusionPunch			= "융합 주먹 알리기",
	timerFusionPunchActive		= "융합 주먹 타이머 보기",
	WarningOverwhelmingPower	= "압도적인 힘 알리기",
	timerOverwhelmingPower		= "압도적인 힘 타이머 보기",
	SetIconOnOverwhelmingPower	= "압도적인 힘 대상 아이콘 설정",
	timerRunicBarrier			= "룬문자 방벽 타이머 보기",
	WarningRuneofPower			= "마력의 룬 알리기",
	WarningRuneofDeath			= "죽음의 룬 알리기",
	WarningRuneofSummoning		= "소환의 룬 알리기",	
	RuneofDeath					= "죽음의 룬 특수 경고 보기",
	PlaySoundDeathRune			= "죽음의 룬일 때 소리 재생",
	timerRuneofDeath			= "죽음의 룬 타이머 보기",
	WarningStaticDisruption		= "전자기 붕괴 알리기",	
	SetIconOnStaticDisruption	= "전자기 붕괴 대상 타겟 아이콘 설정하기(하드 모드)"	,
	Overload					= "과부하 일 때 특수 경보 보기",
	AllwaysWarnOnOverload		= "과부하 일 때 지속적인 경보 알리기(타겟일 경우만)"
}

L:SetMiscLocalization{
	Steelbreaker				= "강철파괴자",
	RunemasterMolgeim 			= "룬술사 몰가임",
	StormcallerBrundir 			= "폭풍소환사 브룬디르",
}


---------------
--  Algalon  --
---------------
L = DBM:GetModLocalization("Algalon")

L:SetGeneralLocalization{
	name = "관찰자 알갈론"
}

L:SetTimerLocalization{
	TimerBigBangCast	= "Big Bang cast",
}
L:SetWarningLocalization{
	WarningPhasePunch	= ">%s< 에게 위상의 주먹",
	WarningBlackHole	= "블랙 홀",
}

L:SetOptionLocalization{
	TimerBigBangCast	= "Show Castbar for Big Bang",
	SpecWarnPhasePunch	= "의상의 주먹 대상이 될 경우 특수 경보 보기",
	WarningPhasePunch	= "위상의 주먹 대상 알리기",
	WarningBlackHole	= "블랙 홀 알리기",
}


----------------
--  Kologarn  --
----------------
L = DBM:GetModLocalization("Kologarn")

L:SetGeneralLocalization{
	name = "콜로간"
}

L:SetWarningLocalization{
	SpecialWarningEyebeam	= "당신에게 안광 - 빠르게 이동!",
	WarningEyebeam			= ">%s< 에게 안광 집중",
	WarnGrip				= ">%s< 에게 바위 손아귀"
}

L:SetTimerLocalization{
	timerEyebeam			= "안광 : %s",
	timerPetrifyingBreath	= "석화 숨결",
	timerLeftArm			= "왼쪽 팔 재생성",
	timerRightArm			= "오른쪽 팔 재생성",
	achievementDisarmed		= "무장해제"	
}

L:SetOptionLocalization{
	SpecialWarningEyebeam	= "당신에게 안광 집중이 될 때 특수 경고 보기",
	WarningEyebeam			= "안광 집중 대상 알리기",
	timerEyebeam			= "안광 집중 타이머 보기",
	SetIconOnEyebeamTarget	= "안광 집중 대상 아이콘 설정",
	timerPetrifyingBreath	= "석화 숨결 타이머 보기",
	timerLeftArm			= "왼쪽 팔 재생성 타이머 보기",
	timerRightArm			= "오른쪽 팔 재생성 타이머 보기",	
	WarnGrip				= "바위 손아귀 대상 알리기",
	SetIconOnGripTarget		= "바위 손아귀 대상 아이콘 설정",
	achievementDisarmed		= "무장해제 타이머 보기"	
}

L:SetMiscLocalization{
	Yell_Trigger_arm_left	= "얕은 상처야!",
	Yell_Trigger_arm_right	= "꽉꽉 쥐어짜 주마!",
	Health_Body				= "콜로간 몸통",
	Health_Right_Arm		= "오른쪽 팔",
	Health_Left_Arm			= "왼쪽 팔"	
}

--------------
--  Auriya  --
--------------
L = DBM:GetModLocalization("Auriaya")

L:SetGeneralLocalization{
	name = "아우리아야"
}

L:SetMiscLocalization{
	Defender = "수호 야수 (%d)"
}

L:SetWarningLocalization{
	SpecWarnBlast 		= "수호 야수 폭발 - 차단!",
	SpecWarnVoid		= "공허의 지대 - 이동!",	
	WarnCatDied 			= "수호 야수 죽음 (%d 번 남음)",
	WarnCatDiedOne 		= "수호 야수 죽음 (1 번 남음)",	
	WarnFear 			= "공포!",
	WarnFearSoon 		= "곧 다음 공포",
	WarnSonic			= "날카로운 음파!",
	WarnSwarm			= ">%s< 에게 무리의 수호자"
}

L:SetOptionLocalization{
	SpecWarnBlast 		= "수호 야수 폭발 특수 경고 보기",
	SpecWarnVoid		= "공허의 지대에 서있을 경우 특수 경보 보기",	
	WarnFear 			= "공포 경보 보기",
	WarnFearSoon		= "공포 시전 전에 경보 보기",
	WarnCatDied 			= "수호 야수의 남은 부활 횟수 경보 보기",
	WarnCatDiedOne 		= "마지막 수호 야수 경보 보기(1 번 남음)",		
	WarnSwarm			= "무리의 수호자 대상 경보 보기",
	WarnSonic			= "날카로운 음파 경보 보기"
}


-------------
--  호디르  --
-------------
L = DBM:GetModLocalization("Hodir")

L:SetGeneralLocalization{
	name = "호디르"
}

L:SetWarningLocalization{
	WarningFlashFreeze		= "순간 빙결",
	WarningStormCloud		= "폭풍 구름 : >%s<"
}

L:SetOptionLocalization{
	TimerFlashFreeze			= "순간 빙결 시전 타이머 보기",
	WarningFlashFreeze		= "순간 빙결 경보 보기",
 	PlaySoundOnFlashFreeze	= "순간 빙결 경고 소리 듣기",	
	WarningStormCloud		= "폭풍 구름 경보 보기",
	YellOnStormCloud			= "폭풍 구름을 얻을 경우 외치기",
	SetIconOnStormCloud		= "폭풍 구름 대상 아이콘 설정 하기"
}

L:SetMiscLocalization{
	YellKill		= "드디어... 드디어 그의 손아귀를... 벗어나는구나.",
	YellCloud		= "폭풍 구름! 비벼요!!"
}


--------------
--  토림  --
--------------
L = DBM:GetModLocalization("Thorim")

L:SetGeneralLocalization{
	name = "토림"
}

L:SetWarningLocalization{
	WarningStormhammer		= "%s 에게 폭풍망치",
	UnbalancingStrike		= ">%s< 에게 혼란의 일격",
	WarningPhase2			= "2 페이즈",
	WarningBomb				= ">%s< 에게 룬 폭파",
	WarningLightningCharge	= "번개 충전",
	LightningOrb 			= "당신은 번개 충격 범위! 이동하세요!"
}

L:SetTimerLocalization{
	TimerHardmode			= "하드 모드"
}

L:SetOptionLocalization{
	TimerHardmode				= "하드 모드를 위한 타이머 보기",
	UnbalancingStrike			= "혼란의 일격 타겟 알리기",
	WarningStormhammer		= "폭풍망치 타겟 알리기",
	WarningPhase2				= "2 페이즈 알리기",
	WarningBomb				= "룬 폭파 알리기",
	WarningLightningCharge	= "번개 충전 알리기",
	RangeFrame					= "거리 창 보기",
	LightningOrb 				= "번개 충격 알리기",
	AnnounceFails				= "번개 충전 피하기 실패 했을 경우 공격대에 알리기 (번개 충전 알리기 및 공대장 권한이 있을 경우)" 
}

L:SetMiscLocalization{
	YellPhase1	= "침입자라니! 감히 내 취미 생활을 방해하는 놈들은 쓴맛을 단단히... 잠깐... 너는...",
	YellPhase2	= "건방진 젖먹이 같으니... 감히 여기까지 기어올라와 내게 도전해? 내 손으로 쓸어버리겠다!",
	YellKill			= "무기를 거둬라! 내가 졌다!",
	ChargeOn		= "번개 충전: %s",
	Charge			= "번개 충전 실패 (현재 트라이): %s"
}


-------------
--  Freya  --
-------------
L = DBM:GetModLocalization("Freya")

L:SetGeneralLocalization{
	name = "프레이야"
}

L:SetMiscLocalization{
	SpawnYell		= "얘들아, 날 도와라!",
	WaterSpirit		= "고대 물의 정령",
	Snaplasher 		= "악어덩굴손",
	StormLasher 		= "폭풍덩굴손",
	YellKill		= "내게서 그의 지배력이 걷혔다. 다시 온전한 정신을 찾았도다. 영웅들이여, 고맙다."	
}

L:SetWarningLocalization{
	WarnPhase2 			= "2 페이즈",
	WarnSimulKill		= "첫번째 소환 죽음 - 12초 후 부활",
	WarnFury 			= ">%s< 에게 자연의 격노",
	SpecWarnFury 		= "당신에게 자연의 격노!",
	WarningTremor   		= "지진! - 시전 중지!",
	WarnRoots 			= ">%s< 에게 무쇠 뿌리!"	,
	UnstableEnergy		= "불안정한 힘 - 움직이세요!"
}

L:SetTimerLocalization{
	TimerUnstableSunBeam 	= "태양 광선: %s",
	TimerSimulKill 			= "소환수 부활",
	TimerFuryYou			= "당신에게 자연의 격노"	
}

L:SetOptionLocalization{
	TimerSimulKill 			= "소환수 부활 타이머 보기",
	TimerFuryYou 			= "자연의 격노 유지 타이머 보기",	
	WarnPhase2 				= "2 페이즈 경고 보기",
	WarnSimulKill			= "첫번째 소환 제거 알리기",
	WarnFury 				= "자연의 격노 타겟 알리기",
	SpecWarnFury 			= "자연의 격노 특수 경고 보기",
	TimerAlliesOfNature 		= "자연의 동맹 타이머 보기",	
	PlaySoundOnFury			= "자연의 격노 특수 사운드 재생",
	WarnRoots 				= "무쇠뿌리 대상 알리기",
	WarningTremor  	 		= "지진 시전 특수 경보 보기 (하드 모드)",
	UnstableEnergy			= "불안정한 힘일 때 특수 경보 보기"	
}

-- Elders
L = DBM:GetModLocalization("Freya_Elders")

L:SetGeneralLocalization{
	name = "프레이야의 장로"
}
L:SetWarningLocalization{
	specWarnFistofStone 		= "돌덩이 주먹",
	specWarnGroundTremor   	= "지진 - 시전 중지!"
}

L:SetTimerLocalization{
	TimerTrashRespawn 		= "소환수 재생성"
}

L:SetOptionLocalization{
	specWarnFistofStone		= "돌덩이 주먹 특수 경보 보기",
	PlaySoundOnFistOfStone	= "돌덩이 주먹 특수 사운드 재생",
	WarnFistofStone			= "돌덩이 주먹 알리기",
	specWarnGroundTremor	= "지진 특수 경보 보기",
	TimerTrashRespawn		= "소환수 재생성 타이머 보기"
}

-------------------
--  Mimiron  --
-------------------
L = DBM:GetModLocalization("Mimiron")

L:SetGeneralLocalization{
	name = "미미론"
}

L:SetWarningLocalization{
	DarkGlare			= "레이저 탄막",
	WarningPlasmaBlast	= "%s 에게 플라즈마 폭발 - 폭힐! 폭힐!",
	Phase2Engaged		= "곧 2 페이즈 - 지금 자리 잡으세요.",
	Phase3Engaged		= "곧 3 페이즈 - 지금 자리 잡으세요.",	
	WarnShell			= ">%s< 에게 네이팜 탄!",
	WarnBlast			= ">%s< 에게 플라즈마 폭발!",
	MagneticCore		= "자기 증폭기 획득 : >%s<",
	WarningShockBlast	= "충격파 - 움직이세요!",
	WarnBombSpawn		= "폭탄 로봇 생성!"
}

L:SetTimerLocalization{
	TimeToPhase2			= "2 페이즈 시작",
	TimeToPhase3			= "3 페이즈 시작",
	ProximityMines			= "새로운 접근 폭파 지뢰",	
	TimerHardmode			= "하드 모드 - 자폭장치 가동"	
}


L:SetOptionLocalization{
	DarkGlare 				= "레이저 탄막 특수 경고 알리기",
	WarningPlasmaBlast		= "플라즈마 폭발 알리기",	
	WarningShockBlast		= "충격파 특수 경고 알리기",
	PlaySoundOnShockBlast 	= "충격파 특수 사운드 경보 재생",
	PlaySoundOnDarkGlare 	= "레이저 탄막 대상 특수 사운드 경보 재생",	
	NextDarkGlare 			= "다음 레이저 탄막",
	TimeToPhase2			= "페이즈 2 시작",
	TimeToPhase3			= "페이즈 3 시작",
	MagneticCore			= "자기 증폭기 획득자 알리기",
	SpinUp	 				= "회전 가속 알리기",	
	WarnShell				= "네이팜 탄 대상 알리기",
	WarnBlast				= "플라즈마 폭발 대상 알리기",	
	HealthFramePhase4		= "페이즈 4 의 체력 프레임 보기",
	AutoChangeLootToFFA		= "3 페이즈에서 루팅 옵션 자동 변경하기",
	WarnBombSpawn			= "폭탄 로봇 생성 알리기",
	TimerHardmode			= "하드 모드를 위한 타이머 보기"	
}

L:SetMiscLocalization{
	YellPull		= "시간이 없어, 친구들! 내가 최근에 만든 기막힌 발명품을 시험하게 도와 주겠지? 자, 마음 바꿀 생각은 말라고. XT-002를 그 꼬락서니로 만들었으니, 너흰 나한테 빚진 셈이란 걸 잊지 마!",	
	YellHardPull	= "아니 대체 왜 그런짓을 한게지? '누르지 마시오'라고 쓰여진 경고문구 못봤나? 자폭장치를 활성화 해 놓으면 도대체 어떻게 발명품을 시험하지?",	
	YellPhase2		= "멋지군! 참으로 경이적인 결과야! 차체 내구도 98.9 퍼센트라! 손상이라고 보기도 어렵지! 계속하자고.",
	YellPhase3		= "고맙다, 친구들! 너희 덕분에 멋진 자료를 좀 얻었어! 자, 그걸 어디 뒀더라... 아, 여기 있군.",
	YellPhase4		= "예비 시험은 이걸로 끝이다. 자 이제부터가 진짜라고!",	
	LootMsg			= "([^%s]+).*Hitem:(%d+)",
	MobPhase1 		= "거대 전차 Mk II",
	MobPhase2 		= "VX-001",
	MobPhase3 		= "공중지휘기"
}


--------------------
--  GeneralVezax  --
--------------------
L = DBM:GetModLocalization("GeneralVezax")

L:SetGeneralLocalization{
	name = "장군 베작스"
}

L:SetTimerLocalization{
	hardmodeSpawn = "사로나이트 원혼 생성"
}

L:SetWarningLocalization{
	SpecialWarningShadowCrash		= "당신에게 어둠 붕괴",
	SpecialWarningSurgeDarkness		= "어둠 쇄도",
	WarningShadowCrash				= ">%s< 에게 어둠 붕괴!",
	SpecialWarningShadowCrashNear	= "당신 주변에 어둠 붕괴!",	
	WarningLeechLife				= ">%s< 에게 생명력 흡수 시전!",
	SpecialWarningLLYou				= "당신에게 얼굴 없는 자의 징표!",
	SpecialWarningLLNear			= "%s 에게 가까운 당신에게 생명력 흡수 시전!"	
}

L:SetOptionLocalization{
	WarningShadowCrash				= "어둠 붕괴의 특수 경보 보기",
	SetIconOnShadowCrash			= "어둠 붕괴 대상 표시하기(해골 징표)",
	SetIconOnLifeLeach				= "얼굴 없는 자의 징표 대상 아이콘 설정 (엑스 징표)",
	SpecialWarningSurgeDarkness		= "어둠 쇄도 특수 경고 보기",
	SpecialWarningShadowCrash		= "어둠 붕괴 특수 경고 보기",
	WarningLeechLife				= "생명력 흡수 시전 경고 보기",	
	SpecialWarningLLYou				= "얼굴 없는 자의 징표 특수 경보 보기",
	SpecialWarningLLNear			= "생명력 흡수 주변 특수 경보 보기",
	CrashWhisper					= "어둠 붕괴 대상에게 귓속말 보내기"	,
	YellOnLifeLeech					= "생명력 흡수를 당할 때 외치기",
	YellOnShadowCrash				= "어둠 붕괴일 때 외치기",
	specWarnShadowCrashNear			= "주변에 어둠 붕괴일 때 특수 경보 보기"
}

L:SetMiscLocalization{
	EmoteSaroniteVapors		= "가까운 사로나이트 증기 구름이 합쳐집니다!",
	CrashWhisper			= "당신에게 어둠 붕괴! 뛰세요!",
	YellLeech				= "저에게 생명력 흡수 시전!",
	YellCrash				= "저에게 어둠 붕괴! 피하세요!"
}


-----------------
--  YoggSaron  --
-----------------
L = DBM:GetModLocalization("YoggSaron")

L:SetGeneralLocalization{
	name = "요그사론"
}

L:SetMiscLocalization{
	YellPull 			= "짐승의 대장을 칠 때가 곧 다가올 거예요! 놈의 졸개들에게 노여움과 미움을 쏟아부으세요!",
	YellPhase2 			= "나는, 살아 있는 꿈이다.",
	Sara 				= "사라",
	WhisperBrainLink 	= "당신에게 두뇌의 고리! %s 에게 뛰세요!",
	WarningYellSqueeze	= "압착의 촉수에 붙잡혔어요! 살려주세요!"	
}

L:SetWarningLocalization{
	WarningGuardianSpawned 			= "요그사론의 수호자 소환!",
	WarningCrusherTentacleSpawned	= "분쇄의 촉수가 생성되었습니다!",	
	WarningP2 						= "2 페이즈",
	WarningP3 						= "3 페이즈",	
	WarningBrainLink 				= ">%s< 그리고 >%s< 두뇌의 고리",
	SpecWarnBrainLink				= "당신 그리고 %s 에게 두뇌의 고리!",
	WarningSanity 					= "> %d < 이성이 낮습니다.",
	SpecWarnSanity 					= ">> %d << 이성이 매우 낮습니다. 채우세요!",
	SpecWarnGuardianLow 				= "수호자 딜 주의하세요! - 공격 주의!",
	WarnMadness 						= "광기 유발을 시전합니다.",
	SpecWarnMadnessOutNow			= "광기 유발이 끝났습니다. - 밖으로 이동!",
	WarnBrainPortalSoon				= "3 초 후 내부 포탈",
	specWarnBrainPortalSoon			= "3 초 후 차원문이 열립니다!",	
	WarnSqueeze 						= "압착의 촉수: >%s<",
	WarnFavor						= ">%s< 에게 사라의 열정!",
	SpecWarnFavor					= "당신에게 사라의 열정"
}

L:SetTimerLocalization{
	NextPortal			= "다음 차원문"
}

L:SetOptionLocalization{
	WarningGuardianSpawned			= "요그사론의 수호자 소환 알리기",
	WarningCrusherTentacleSpawned	= "분쇄의 촉수 생성 알리기",	
	WarningP2						= "2 페이즈 알리기",
	WarningP3						= "3 페이즈 알리기",	
	WarningBrainLink				= "두뇌의 고리 알리기",
	SpecWarnBrainLink				= "두뇌의 고리 특수 경고 보기",
	WhisperBrainLink 				= "두뇌의 고리 특수 경고 알리기(귓속말)",	
	WarningSanity					= "이성(Sanity)이 낮은 경우 경고 보기",
	SpecWarnSanity					= "이성(Sanity)이 매우 낮은 경우 특수 경고 보기",
	SpecWarnGuardianLow				= "수호자의 생명력이 낮을 때 특수 경고 알리기(딜러)",
	NextPortal						= "다음 차원문 알리기",	
	WarnBrainPortalSoon				= "내부 차원문 알리기",
	specWarnBrainPortalSoon			= "내부 차원문 특수 경보 알리기",	
	WarnMadness						= "광기 유발 알리기",
	SpecWarnMadnessOutNow			= "광기가 끝나기 전에 특수 경고 알리기",
	WarnSqueeze						= "압착의 촉수 대상 알리기",
	WarningSqueeze					= "압착의 촉수 경고 보기",
	SetIconOnFearTarget				= "병든 정신 타겟 아이콘 설정하기",
	SetIconOnFavorTarget			= "사라의 열정 타겟 아이콘 설정하기",
	SetIconOnMCTarget				= "정신 지배에 걸린 플레이어 타겟 아이콘 설정하기",	
	ShowSaraHealth					= "사라 체력 보기",
	WarnFavor						= "사라의 열정 대상 알리기",
	SpecWarnFavor					= "사라의 열정 특수 경보 보기",
}
