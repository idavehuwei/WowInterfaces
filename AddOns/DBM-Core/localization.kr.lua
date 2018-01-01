if (GetLocale() == "koKR") then

DBM_CORE_LOAD_MOD_ERROR				= "%s 보스 모드 로딩중 에러 발생: %s"
DBM_CORE_LOAD_MOD_SUCCESS			= "'%s' 보스 모드가 로드되었습니다.!"
DBM_CORE_LOAD_GUI_ERROR				= "GUI를 로드할 수 없습니다: %s"

DBM_CORE_COMBAT_STARTED				= "%s 작동됨. 행운을 빕니다! :)";
DBM_CORE_BOSS_DOWN					= "%s (을)를 쓰러트렸습니다. (%s 소요 되었습니다!)"
DBM_CORE_BOSS_DOWN_LONG				= "%s (을)를 쓰러트렸습니다. (%s 소요 되었습니다!) 당신의 최종 킬 타임은, %s 입니다. 그리고 당신의 제일 빠른 킬 타임은 %s 입니다.."
DBM_CORE_BOSS_DOWN_NEW_RECORD		= "%s (을)를 쓰러뜨렸습니다. (%s 소요 되었습니다!) 이 기록은 새로운 기록이군요! (과거의 기록: %s)"
DBM_CORE_COMBAT_ENDED				= "%s 전투가 종료되었습니다. (%s 소요 되었습니다.)"

DBM_CORE_TIMER_FORMAT_SECS			= "%d |4초:초;"
DBM_CORE_TIMER_FORMAT_MINS			= "%d |4분:분;"
DBM_CORE_TIMER_FORMAT				= "%d |4분:분; and %d |4초:초;"

DBM_CORE_MIN						= "분"
DBM_CORE_SEC						= "초"
DBM_CORE_DEAD						= "죽음"
DBM_CORE_OK							= "수락"

DBM_CORE_GENERIC_WARNING_ENRAGE		= "%s %s 후에 광폭화"
DBM_CORE_GENERIC_TIMER_ENRAGE		= "광폭화"
DBM_CORE_OPTION_TIMER_ENRAGE		= "광폭화 타이머 보기"
DBM_CORE_OPTION_HEALTH_FRAME		= "보스 HP 프레임 보기"

DBM_CORE_OPTION_CATEGORY_TIMERS		= "바"
DBM_CORE_OPTION_CATEGORY_WARNINGS	= "알림"
DBM_CORE_OPTION_CATEGORY_MISC		= "기타 추가 기능"

DBM_CORE_AUTO_RESPONDED				= "자동-부활."
DBM_CORE_STATUS_WHISPER				= "%s: %s, %d/%d 공대원이 생존해 있습니다."
DBM_CORE_AUTO_RESPOND_WHISPER		= "%s 님은 현재 바쁩니다. %s 와 사투를 벌이고 있습니다. (%s, %d/%d 공대원 생존중) 전투가 끝난 후 통보를 받게 될 것입니다."

DBM_CORE_VERSIONCHECK_HEADER		= "죽이는 보스 모드 - 버젼"
DBM_CORE_VERSIONCHECK_ENTRY			= "%s: %s (r%d)"
DBM_CORE_VERSIONCHECK_ENTRY_NO_DBM	= "%s: 죽이는 보스 모드가 설치 되어있지 않습니다."
DBM_CORE_VERSIONCHECK_FOOTER		= "%d 명의 플레이어가 설치되어 있는 것을 찾았습니다."

DBM_CORE_UPDATEREMINDER_HEADER		= "당신의 죽이는 보스 모드 버전이 옛날 버전입니다.\n Version %s (r%d) 가 새로운 버전이며, 최신 버전 위치:"
DBM_CORE_UPDATEREMINDER_FOOTER		= "Ctrl-C 를 누르면 클립보드에 복사가 됩니다."

DBM_CORE_MOVABLE_BAR				= "나를 움직이세요~_~"

DBM_PIZZA_SYNC_INFO					= "|Hplayer:%1$s|h[%1$s]|h sent you a pizza timer: '%2$s'\n|HDBM:cancel:%2$s:nil|h|cff3588ff[Cancel this timer]|r|h  |HDBM:ignore:%2$s:%1$s|h|cff3588ff[Ignore timers from %1$s]|r|h"
DBM_PIZZA_CONFIRM_IGNORE			= "Do you really want to ignore pizza timers from %s for this session?"
DBM_PIZZA_ERROR_USAGE				= "Usage: /dbm [broadcast] timer <time> <text>"

DBM_CORE_ERROR_DBMV3_LOADED			= "Deadly Boss Mods 가 실행중에 있습니다.\n당신께서 DBMv3 와 DBMv4를 동시에 설치하여 이런 상황이 발생한 것 같습니다.\n\"수락\"을 클릭하시면 DBMv3를 차단하고, UI가 다시시작 될 것입니다.\n또한, 애드온 폴더내에 존재하고 있는 DBMv3 폴더를 삭제하시길 권장합니다."

DBM_CORE_MINIMAP_TOOLTIP_HEADER		= "죽이는 보스 모드"
DBM_CORE_MINIMAP_TOOLTIP_FOOTER		= "Shift+click 또는 right-click 으로 움직이세요.\nAlt+shift+click 으로 움직이면 자유롭게 배치할 수 있습니다."

DBM_CORE_RANGECHECK_HEADER			= "거리 체크 (%d m)"
DBM_CORE_RANGECHECK_SETRANGE		= "거리 지정"
DBM_CORE_RANGECHECK_HIDE			= "숨기기"
DBM_CORE_RANGECHECK_SETRANGE_TO		= "%d m"

DBM_CORE_SLASHCMD_HELP				= {
	"사용 가능한 명령어:",
	"/dbm version: 공격대 전체 버전 체크 (줄임말: ver)",
	"/dbm unlock: 상태 바 타이머를 움직일 수 있도록 보여줍니다.(줄임말: move)",
	"/dbm timer <숫자> <글자>: <숫자> 초만큼 진행되는 <글자>바가 생성 됨.",
	"/dbm broadcast timer <숫자> <글자>: <숫자> 초만큼 진행되는 <글자>바를 공격대에 알립니다.(공격대 권한이 있을 경우만 작동)",
	"/dbm help: 현재 보고 있는 도움말.",
}

DBM_ERROR_NO_PERMISSION				= "해당 명령어를 실행하기 위한 권한을 가지고 있지 않습니다."

DBM_CORE_BOSSHEALTH_HIDE_FRAME		= "숨기기"

DBM_CORE_ALLIANCE					= "얼라이언스"
DBM_CORE_HORDE						= "호드"

DBM_CORE_UNKNOWN					= "알 수 없음"

DBM_CORE_TIMER_PULL					= "풀링 중 입니다."
DBM_CORE_ANNOUNCE_PULL				= "%d 초 뒤 풀링 합니다."
DBM_CORE_ANNOUNCE_PULL_NOW			= "풀링했습니다. 긴장하세요.!"

-- Generic Warnings
DBM_CORE_GENERIC_TARGET_WARN = ">%%s< 에게 %s!"
DBM_CORE_GENERIC_TARGET_OPTION = "%s 의 대상 알리기"

-- Auto-generated Timer Localizations
DBM_CORE_AUTO_TIMER_TEXTS = {
	target = "%s: %%s",
	cast = "%s",
	active = "%s",	
	cd = "%s 쿨다운",
	next = "다음 %s",
}

DBM_CORE_AUTO_TIMER_OPTIONS = {
	target = "|cff71d5ff|H주문:%d|h%s|h|r 디버프 타이머 보기",
	cast = "|cff71d5ff|H주문:%d|h%s|h|r 시전 타이머 보기",
	active = "|cff71d5ff|H주문:%d|h%s|h|r 유지 타이머 보기",
	cd = "|cff71d5ff|H주문:%d|h%s|h|r 쿨다운 타이머 보기",
	next = "다음 |cff71d5ff|H주문:%d|h%s|h|r 타이머 보기",
}
end
