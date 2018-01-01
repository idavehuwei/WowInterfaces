local L = AceLibrary("AceLocale-2.2"):new("Grid")

local strings_koKR = {
	--{{{ GridCore
	["Debugging"] = "디버깅",
	["Module debugging menu."] = "모듈 디버깅 메뉴를 설정합니다.",
	["Debug"] = "디버그",
	["Toggle debugging for %s."] = "%s|1을;를; 위해 디버깅을 사용합니다.",
	["Configure"] = "설정",
	["Configure Grid"] = "Grid 옵션을 설정합니다.",
	["Hide minimap icon"] = "미니맵 아이콘 숨김",
	["Grid is disabled: use '/grid standby' to enable."] = "Grid가 비활성화 되었을시: '/grid standby'를 입력하면 활성화 됩니다.",

	--}}}
	--{{{ GridFrame
	["Frame"] = "창",
	["Options for GridFrame."] = "각 유닛 창의 표시를 위한 옵션을 설정합니다.",

	["Show Tooltip"] = "툴팁 표시",
	["Show unit tooltip.  Choose 'Always', 'Never', or 'OOC'."] = "유닛 툴팁을 표시합니다. '항상', '안함' 또는 '비전투'을 선택합니다.",
	["Always"] = "항상",
	["Never"] = "안함",
	["OOC"] = "비전투",
	["Center Text Length"] = "중앙 문자 길이",
	["Number of characters to show on Center Text indicator."] = "중앙 문자 지시기 위에 표시할 캐릭터의 숫자를 설정합니다.",
	["Invert Bar Color"] = "바 색상 반전",
	["Swap foreground/background colors on bars."] = "바 위의 전경/배경 색상을 변경합니다.",
	["Healing Bar Opacity"] = "치유 바 투명도",
	["Sets the opacity of the healing bar."] = "치유 바의 투명도를 설정합니다.",

	["Indicators"] = "지시기",
	["Border"] = "테두리",
	["Health Bar"] = "생명력 바",
	["Health Bar Color"] = "생명력 바 색상",
	["Healing Bar"] = "치유 바",
	["Center Text"] = "중앙 문자",
	["Center Text 2"] = "중앙 문자 2",
	["Center Icon"] = "중앙 아이콘",
	["Top Left Corner"] = "좌측 상단 모서리",
	["Top Right Corner"] = "우측 상단 모서리",
	["Bottom Left Corner"] = "좌측 하단 모서리",
	["Bottom Right Corner"] = "우측 하단 모서리",
	["Frame Alpha"] = "창 투명도",

	["Options for %s indicator."] = "%s 지시기를 위한 옵션 설정합니다.",
	["Statuses"] = "상태",
	["Toggle status display."] = "상태 표시 사용",

	-- Advanced options
	["Advanced"] = "고급",
	["Advanced options."] = "고급 옵션을 설정합니다.",
	["Enable %s indicator"] = "%s 지시기 사용",
	["Toggle the %s indicator."] = "%s 지시기를 사용합니다.",
	["Frame Width"] = "창 너비",
	["Adjust the width of each unit's frame."] = "각 유닛의 창 너비를 조정합니다.",
	["Frame Height"] = "창 높이",
	["Adjust the height of each unit's frame."] = "각 유닛의 창 높이를 조정합니다.",
	["Frame Texture"] = "창 무늬",
	["Adjust the texture of each unit's frame."] = "각 유닛의 창 무늬를 조정합니다.",
	["Corner Size"] = "모서리 크기",
	["Adjust the size of the corner indicators."] = "모서리 지시기의 크기를 조정합니다.",
	["Enable Mouseover Highlight"] = "마우스오버 강조 사용",
	["Toggle mouseover highlight."] = "마우스오버 강조를 전환합니다.",
	["Font"] = "글꼴",
	["Adjust the font settings"] = "글꼴 설정을 조정합니다.",
	["Font Size"] = "글꼴 크기",
	["Adjust the font size."] = "글꼴 크기를 조정합니다.",
	["Orientation of Frame"] = "프레임의 방향",
	["Set frame orientation."] = "프레임의 방향을 설정합니다.",
	["Orientation of Text"] = "문자의 방향",
	["Set frame text orientation."] = "프레임 문자의 방향을 설정합니다.",
	["VERTICAL"] = "세로",
	["HORIZONTAL"] = "가로",
	["Icon Size"] = "아이콘 크기",
	["Adjust the size of the center icon."] = "중앙 아이콘의 크기를 조정합니다.",
	["Icon Border Size"] = "아이콘 테두리 크기",
	["Adjust the size of the center icon's border."] = "중앙 아이콘의 테두리 크기를 조정합니다.",
	["Icon Stack Text"] = "아이콘 중첩 문자",
	["Toggle center icon's stack count text."] = "중앙 아이콘에 중첩 갯수 문자를 표시합니다.",
	["Icon Cooldown Frame"] = "아이콘 재사용 창",
	["Toggle center icon's cooldown frame."] = "중앙 아이콘에 재사용 창을 표시합니다.",

	--}}}
	--{{{ GridLayout
	["Layout"] = "배치",
	["Options for GridLayout."] = "배치 창과 그룹 배치를 위한 옵션을 설정합니다.",

	["Drag this tab to move Grid."] = "Grid를 이동시키려면 이 탭을 드래그합니다.",
	["Lock Grid to hide this tab."] = "이 탭을 숨기려면 Grid를 잠급니다.",
	["Alt-Click to permanantly hide this tab."] = "영구적으로 Alt-클릭으로 이 탭을 숨깁니다.",

	-- Layout options
	["Show Frame"] = "창 표시",

	["Solo Layout"] = "솔로잉 배치",
	["Select which layout to use when not in a party."] = "솔로잉시 사용할 배치를 선택합니다.",
	["Party Layout"] = "파티 배치",
	["Select which layout to use when in a party."] = "파티시 사용할 배치를 선택합니다.",
	["Heroic Raid Layout"] = "영웅 공격대 배치",
	["Select which layout to use when in a heroic raid."] = "영웅 공격대시 사용할 배치를 선택합니다.",
	["Raid Layout"] = "공격대 배치",
	["Select which layout to use when in a raid."] = "공격대시 사용할 배치를 선택합니다.",
	["Battleground Layout"] = "전장 배치",
	["Select which layout to use when in a battleground."] = "전장에서 사용할 배치를 선택합니다.",
	["Arena Layout"] = "투기장 배치",
	["Select which layout to use when in an arena."] = "투기장에서 사용할 배치를 선택합니다.",
	["Horizontal groups"] = "그룹 정렬",
	["Switch between horzontal/vertical groups."] = "그룹 표시 방법을 가로/세로로 변경합니다.",
	["Clamped to screen"] = "화면에 고정",
	["Toggle whether to permit movement out of screen."] = "화면 밖으로 창이 나가지 않도록 사용합니다.",
	["Frame lock"] = "창 잠금",
	["Locks/unlocks the grid for movement."] = "배치 창을 잠그거나 이동시킵니다.",
	["Click through the Grid Frame"] = "창을 통해 클릭",
	["Allows mouse click through the Grid Frame."] = "배치 창 위의 마우스 클릭을 허락합니다.",

	["CENTER"] = "중앙",
	["TOP"] = "상단",
	["BOTTOM"] = "하단",
	["LEFT"] = "좌측",
	["RIGHT"] = "우측",
	["TOPLEFT"] = "좌측 상단",
	["TOPRIGHT"] = "우측 상단",
	["BOTTOMLEFT"] = "좌측 하단",
	["BOTTOMRIGHT"] = "우측 하단",

	-- Display options
	["Padding"] = "패팅",
	["Adjust frame padding."] = "창 패팅을 조정합니다.",
	["Spacing"] = "간격",
	["Adjust frame spacing."] = "창 간격을 조정합니다.",
	["Scale"] = "크기",
	["Adjust Grid scale."] = "Grid 크기를 조정합니다.",
	["Border"] = "테두리",
	["Adjust border color and alpha."] = "테두리의 색상과 투명도를 조정합니다.",
	["Border Texture"] = "테두리 무늬",
	["Choose the layout border texture."] = "배치 테두리의 무늬를 선택합니다.",
	["Background"] = "배경",
	["Adjust background color and alpha."] = "배경의 색상과 투명도를 조정합니다.",
	["Pet color"] = "소환수 색상",
	["Set the color of pet units."] = "소환수 유닛의 색상을 설정합니다.",
	["Pet coloring"] = "소환수 채색",
	["Set the coloring strategy of pet units."] = "소환수의 유닛 채색 방법을 설정합니다." ,
	["By Owner Class"] = "소환자의 직업에 의해",
	["By Creature Type"] = "창조물의 타입에 의해",
	["Using Fallback color"] = "사용자의 색상에 의해",
	["Beast"] = "야수형",
	["Demon"] = "악마형",
	["Humanoid"] = "인간형",
	["Undead"] = "언데드",
	["Dragonkin"] = "용족",
	["Elemental"] = "정령",
	["Not specified"] = "알 수 없음",
	["Colors"] = "색상",
	["Color options for class and pets."] = "직업과 소환수의 색상 옵션을 설정합니다.",
	["Fallback colors"] = "대체 색상",
	["Color of unknown units or pets."] = "알수없는 유닛이나 소환수의 색상을 설정합니다.",
	["Unknown Unit"] = "알수없는 유닛",
	["The color of unknown units."] = "알수없는 유닛의 색상을 설정합니다.",
	["Unknown Pet"] = "알수없는 소환수",
	["The color of unknown pets."] = "알수없는 소환수의 색상을 설정합니다.",
	["Class colors"] = "직업 색상",
	["Color of player unit classes."] = "플레이어들의 유닛 색상을 설정합니다.",
	["Creature type colors"] = "소환수 타입 색상",
	["Color of pet unit creature types."] = "소환수 유닛 타입 색상을 설정합니다.",
	["Color for %s."] = "%s 색상",

	-- Advanced options
	["Advanced"] = "고급",
	["Advanced options."] = "고급 옵션을 설정합니다.",
	["Layout Anchor"] = "배치 위치",
	["Sets where Grid is anchored relative to the screen."] = "Grid의 화면 위치를 설정합니다.",
	["Group Anchor"] = "그룹 위치",
	["Sets where groups are anchored relative to the layout frame."] = "그룹 배치 창의 위치를 설정합니다.",
	["Reset Position"] = "위치 초기화",
	["Resets the layout frame's position and anchor."] = "배경 창의 위치와 앵커를 초기화 합니다.",
	["Hide tab"] = "탭 숨김",
	["Do not show the tab when Grid is unlocked."] = "Grid가 잠금 해제될 때 탭을 표시하지 않습니다.",

	--}}}
	--{{{ GridLayoutLayouts
	["None"] = "없음",
	["By Group 40"] = "40인 공격대",
	["By Group 25"] = "25인 공격대",
	["By Group 25 w/Pets"] = "25인 공격대, 소환수",
	["By Group 20"] = "20인 공격대",
	["By Group 15"] = "15인 공격대",
	["By Group 15 w/Pets"] = "15인 공격대, 소환수",
	["By Group 10"] = "10인 공격대",
	["By Group 10 w/Pets"] = "10인 공격대, 소환수",
	["By Group 5"] = "5인 공격대",
	["By Group 5 w/Pets"] = "5인 공격대, 소환수",
	["By Class"] = "직업별",
	["By Class w/Pets"] = "직업별, 소환수",
	["Onyxia"] = "오닉시아",
	["By Group 25 w/tanks"] = "25인 공격대, 방어전담",

	--}}}
	--{{{ GridRange
	-- used for getting spell range from tooltip
	["(%d+) yd range"] = "(%d+)미터",

	--}}}
	--{{{ GridStatus
	["Status"] = "상태",
	["Options for %s."] = "%s|1을;를; 위한 옵션을 설정합니다.",

	-- module prototype
	["Status: %s"] = "상태: %s",
	["Color"] = "색상",
	["Color for %s"] = "%s 색상",
	["Priority"] = "우선 순위",
	["Priority for %s"] = "%s|1을;를; 위한 우선 순위",
	["Range filter"] = "범위 필터",
	["Range filter for %s"] = "%s|1을;를; 위한 거리 필터",
	["Enable"] = "사용",
	["Enable %s"] = "%s|1을;를; 사용",

	--}}}
	--{{{ GridStatusAggro
	["Aggro"] = "어그로",
	["Aggro alert"] = "어그로 경고",
	["High Threat color"] = "위협 수준 높음 색상",
	["Color for High Threat."] = "위협 수준 높을 때 색상",
	["Aggro color"] = "어그로 색상",
	["Color for Aggro."] = "어그로일 때 색상",
	["Tanking color"] = "방어전담 색상",
	["Color for Tanking."] = "방어전담일 때 색상",
	["Threat"] = "위협 수준",
	["Show more detailed threat levels."] = "상세한 위협 수준을 표시합니다.",
	["High"] = "높음",
	["Tank"] = "방전",

	--}}}
	--{{{ GridStatusAuras
	["Auras"] = "효과",
	["Debuff type: %s"] = "디버프 타입: %s",
	["Poison"] = "독",
	["Disease"] = "질병",
	["Magic"] = "마법",
	["Curse"] = "저주",
	["Ghost"] = "유령",
	["Buffs"] = "버프",
	["Debuff Types"] = "디버프 타입",
	["Debuffs"] = "디버프",
	["Add new Buff"] = "새로운 버프 추가",
	["Adds a new buff to the status module"] = "상태 모듈에 새로운 버프를 추가합니다.",
	["<buff name>"] = "<버프 이름>",
	["Add new Debuff"] = "새로운 디버프 추가",
	["Adds a new debuff to the status module"] = "상태 모듈에 새로운 디버프를 추가합니다.",
	["<debuff name>"] = "<디버프 이름>",
	["Delete (De)buff"] = "(디)버프 삭제",
	["Deletes an existing debuff from the status module"] = "기존의 디버프를 상태 모듈에서 삭제합니다.",
	["Remove %s from the menu"] = "메뉴에서 %s|1을;를; 제거합니다.",
	["Debuff: %s"] = "디버프: %s",
	["Buff: %s"] = "버프: %s",
	["Class Filter"] = "직업 필터",
	["Show status for the selected classes."] = "선택된 직업을 위해 상태에 표시합니다.",
	["Show on %s."] = "%s 표시",
	["Show if mine"] = "내것 표시",
	["Display status only if the buff was cast by you."] = "당신이 버프를 시전했을 경우에만 상태에 표시합니다.",
	["Show if missing"] = "사라짐 표시",
	["Display status only if the buff is not active."] = "버프가 사라졌을 경우에만 상태에 표시합니다.",
	["Filter Abolished units"] = "해제 유닛 필터",
	["Skip units that have an active Abolish buff."] = "버프를 해제할 수 있는 유닛을 무시합니다.",
	["Show duration"] = "지속시간 표시",
	["Show the time remaining, for use with the center icon cooldown."] = "중앙 아이콘에 남은 시간의 재사용 대기시간을 표시합니다.",

	--}}}
	--{{{ GridStatusName
	["Unit Name"] = "유닛 이름",
	["Color by class"] = "직업별 색상",

	--}}}
	--{{{ GridStatusMana
	["Mana"] = "마나",
	["Low Mana"] = "마나 낮음",
	["Mana threshold"] = "마나 수치",
	["Set the percentage for the low mana warning."] = "마나 낮음 경고를 위한 백분율을 설정합니다.",
	["Low Mana warning"] = "마나 낮음 경고",

	--}}}
	--{{{ GridStatusHeals
	["Heals"] = "치유",
	["Incoming heals"] = "치유 받음",
	["Ignore Self"] = "자신 무시",
	["Ignore heals cast by you."] = "자신의 치유 시전은 무시합니다.",
	["Show HealComm Users"] = "HealComm 사용자 표시",
	["Displays HealComm users and versions."] = "HealComm 사용자와 버전을 표시합니다.",
	["HealComm Users"] = "HealComm 사용자",

	--}}}
	--{{{ GridStatusHealth
	["Low HP"] = "생명력 낮음",
	["DEAD"] = "죽음",
	["FD"] = "죽척",
	["Offline"] = "오프라인",
	["Unit health"] = "유닛 생명력",
	["Health deficit"] = "결손 생명력",
	["Low HP warning"] = "생명력 낮음 경고",
	["Feign Death warning"] = "죽은척하기 경고",
	["Death warning"] = "죽음 경고",
	["Offline warning"] = "오프라인 경고",
	["Health"] = "생명력",
	["Show dead as full health"] = "죽은후 모든 생명력 표시",
	["Treat dead units as being full health."] = "죽은 플레이어들의 전체 생명력을 표시합니다.",
	["Use class color"] = "직업 색상 사용",
	["Color health based on class."] = "직업에 기준을 둔 생명력 색상을 사용합니다.",
	["Health threshold"] = "생명력 수치",
	["Only show deficit above % damage."] = "결손량을 표시할 백분율을 설정합니다.",
	["Color deficit based on class."] = "직업에 기준을 둔 결손 색상을 사용합니다.",
	["Low HP threshold"] = "생명력 낮음 수치",
	["Set the HP % for the low HP warning."] = "생명력 낮음 경고를 위한 백분율을 설정합니다.",

	--}}}
	--{{{ GridStatusRange
	["Range"] = "거리",
	["Range check frequency"] = "거리 체크 빈도",
	["Seconds between range checks"] = "거리 체크의 시간(초)를 설정합니다.",
	["More than %d yards away"] = "%d 미터 이상",
	["%d yards"] = "%d 미터",
	["Text"] = "문자",
	["Text to display on text indicators"] = "문자 지시기 위에 표시할 문자",
	["<range>"] = "<범위>",

	--}}}
	--{{{ GridStatusTarget
	["Target"] = "대상",
	["Your Target"] = "당신의 대상",

	--}}}
	--{{{ GridStatusVoiceComm
	["Voice Chat"] = "음성 대화",
	["Talking"] = "대화중",

	--}}}
	--{{{ GridStatusVehicle
	["In Vehicle"] = "탈것",
	["Driving"] = "운전",

	--}}}
	--{{{ GridStatusReadyCheck
	["Ready Check"] = "전투 준비",
	["Set the delay until ready check results are cleared."] = "전투 준비 체크 결과를 표시합니다.",
	["Delay"] = "지연",
	["?"] = "?",
	["R"] = "R",
	["X"] = "X",
	["AFK"] = "자리비움",
	["Waiting color"] = "대기 색상",
	["Color for Waiting."] = "대기 상태일 때 색상",
	["Ready color"] = "준비됨 색상",
	["Color for Ready."] = "전투 준비가 되었을 때 색상",
	["Not Ready color"] = "준비되지 않음 색상",
	["Color for Not Ready."] = "전투 준비가 되지 않았을 때 색상",
	["AFK color"] = "자리비움 색상",
	["Color for AFK."] = "자리비움 상태일 때 색상",

	--}}}
	--{{{ Unused translations: translators, please remove these
	["Show Pets for Party"] = "파티시 소환수 표시",
	["Grouped"] = "파티",
	["Show party/self as an extra group."] = "공격대시 자신과 파티원을 추가로 표시합니다.",
	["Select which raid layout to use."] = "사용할 공격대 배치를 선택합니다.",
	["Sets when the Grid is visible: Choose 'Always', 'Grouped', or 'Raid'."] = "Grid 표시 설정: '항상', '파티' 또는 '공격대'를 선택합니다.",
	["Raid"] = "공격대",
	["Show the pets for the party below the party itself."] = "파티시 파티원의 소환수를 표시합니다.",
	["Show Party in Raid"] = "공격대시 파티원 표시",

	--}}}
}

L:RegisterTranslations("koKR", function() return strings_koKR end)
