--[[
	Project.: BlizzFacade
	File....: Locales.lua
	Version.: 38
	Author..: StormFX
]]

-- This contents of this file are automatically generated.
-- Please use the localization application on WoWAce.com to submit translations.
-- http://www.wowace.com/projects/blizzfacade/localization/

-- [ Private Table ] --

local _, ns = ...

-- Hard-code enUS/enGB.
ns.L = {
	["Action Bars"] = "Action Bars",
	["Allows the default action bars to be skinned by ButtonFacade."] = "Allows the default action bars to be skinned by ButtonFacade.",
	["Allows the default buff frame to be skinned by ButtonFacade."] = "Allows the default buff frame to be skinned by ButtonFacade.",
	["Bar Options"] = "Bar Options",
	["BLF_Desc"] = "Adds ButtonFacade support to the default interface. If you experience any display issues, disable the affected module or element and reload your interface.",
	["Buff Frame"] = "Buff Frame",
	["Enable"] = "Enable",
	["Enable skinning of the action bars."] = "Enable skinning of the action bars.",
	["Enable skinning of the buff frame."] = "Enable skinning of the buff frame.",
	["Main Bar"] = "Main Bar",
	["Multi-Bars"] = "Multi-Bars",
	["Options"] = "Options",
	["Pet Bar"] = "Pet Bar",
	["Possess Bar"] = "Possess Bar",
	["Profiles"] = "Profiles",
	["Skin the buttons of the %s."] = "Skin the buttons of the %s.",
	["Stance Bar"] = "Stance Bar",
	["Vehicle Bar"] = "Vehicle Bar",
}

-- Automatically inject all other locales.
do
	local LOC = GetLocale()
	if LOC == "deDE" then
ns.L["Action Bars"] = "Aktionsleisten"
ns.L["Allows the default action bars to be skinned by ButtonFacade."] = "Erlaubt das Skinnen der Standard-Aktionsleisten mit ButtonFacade."
ns.L["Allows the default buff frame to be skinned by ButtonFacade."] = "Erlaubt das Skinnen der Standard-Buffleiste mit ButtonFacade."
ns.L["Bar Options"] = "Leisten-Optionen"
ns.L["BLF_Desc"] = "Fügt dem Standard-Interface ButtonFacade-Unterstützung hinzu. Wenn Du irgendwelche Anzeigeprobleme hast, deaktiviere das betroffene Modul oder Element und lade Dein Interface neu."
ns.L["Buff Frame"] = "Buffleiste"
ns.L["Enable"] = "Aktiv"
ns.L["Enable skinning of the action bars."] = "Aktiviert das Skinnen der Standard-Aktionsleisten."
ns.L["Enable skinning of the buff frame."] = "Aktiviert das Skinnen der Standard-Buffleiste."
ns.L["Main Bar"] = "Hauptleiste"
ns.L["Multi-Bars"] = "Multi-Bars"
ns.L["Options"] = "Einstellungen"
ns.L["Pet Bar"] = "Begleiterleiste"
ns.L["Possess Bar"] = "Besitzen Bar"
ns.L["Profiles"] = "Profil"
ns.L["Skin the buttons of the %s."] = "Ändert die Buttons der %s."
ns.L["Stance Bar"] = "Haltungsleiste"
ns.L["Vehicle Bar"] = "Fahrzeugleiste"
ns.L["ToC/Adds ButtonFacade support to the default interface."] = "Ermöglichkt ButtonFacade das ändern des Standardinterface."

	elseif LOC == "esES" then
ns.L["Action Bars"] = "Barras de acción"
ns.L["Allows the default action bars to be skinned by ButtonFacade."] = "Permite que las barras de acción predeterminada para ser desollado por ButtonFacade."
ns.L["Allows the default buff frame to be skinned by ButtonFacade."] = "Permite el marco buff defecto a ser desollado por ButtonFacade."
ns.L["Bar Options"] = "Opciones de la barra"
ns.L["BLF_Desc"] = "Agrega soporte ButtonFacade a la interfaz por defecto. Si experimenta cualquier problema de visualización, deshabilitar el módulo afectado o elemento y volver a cargar la interfaz."
ns.L["Buff Frame"] = "Buff Marco"
ns.L["Enable"] = "Posibilitar"
ns.L["Enable skinning of the action bars."] = "Habilitar el despellejamiento de las barras de acción."
ns.L["Enable skinning of the buff frame."] = "Habilitar el despellejamiento de la estructura buff."
ns.L["Main Bar"] = "Principales Bar"
ns.L["Multi-Bars"] = "Multi-Bares"
ns.L["Options"] = "Opciones"
ns.L["Pet Bar"] = "Pet Bar"
ns.L["Possess Bar"] = "Poseer Bar"
ns.L["Profiles"] = "Perfiles"
ns.L["Skin the buttons of the %s."] = "De la piel de los botones de la %s."
ns.L["Stance Bar"] = "Posición Bar"
ns.L["Vehicle Bar"] = "Vehículo Bar"
ns.L["ToC/Adds ButtonFacade support to the default interface."] = "Agrega soporte ButtonFacade a la interfaz por defecto."

	elseif LOC == "esMX" then
ns.L["Action Bars"] = "Barras de acción"
ns.L["Allows the default action bars to be skinned by ButtonFacade."] = "Permite que las barras de acción predeterminada para ser desollado por ButtonFacade."
ns.L["Allows the default buff frame to be skinned by ButtonFacade."] = "Permite el marco buff defecto a ser desollado por ButtonFacade."
ns.L["Bar Options"] = "Opciones de la barra"
ns.L["BLF_Desc"] = "Agrega soporte ButtonFacade a la interfaz por defecto. Si experimenta cualquier problema de visualización, deshabilitar el módulo afectado o elemento y volver a cargar la interfaz."
ns.L["Buff Frame"] = "Buff Marco"
ns.L["Enable"] = "Posibilitar"
ns.L["Enable skinning of the action bars."] = "Habilitar el despellejamiento de las barras de acción."
ns.L["Enable skinning of the buff frame."] = "Habilitar el despellejamiento de la estructura buff."
ns.L["Main Bar"] = "Principales Bar"
ns.L["Multi-Bars"] = "Multi-Bares"
ns.L["Options"] = "Opciones"
ns.L["Pet Bar"] = "Pet Bar"
ns.L["Possess Bar"] = "Poseer Bar"
ns.L["Profiles"] = "Perfiles"
ns.L["Skin the buttons of the %s."] = "De la piel de los botones de la %s."
ns.L["Stance Bar"] = "Posición Bar"
ns.L["Vehicle Bar"] = "Vehículo Bar"
ns.L["ToC/Adds ButtonFacade support to the default interface."] = "Agrega soporte ButtonFacade a la interfaz por defecto."

	elseif LOC == "frFR" then
ns.L["Action Bars"] = "Barres d'actions"
ns.L["Allows the default action bars to be skinned by ButtonFacade."] = "Permet aux barres d'actions par défaut d'être skinnées par ButtonFacade."
ns.L["Allows the default buff frame to be skinned by ButtonFacade."] = "Permet au cadre des buffs par défaut d'être skinné par ButtonFacade."
ns.L["Bar Options"] = "Options des barres"
ns.L["BLF_Desc"] = "Ajoute le support de ButtonFacade à l'interface par défaut. Si vous expérimentez des problèmes d'affichage, désactivez le module ou l'élément affecté et rechargez votre interface"
ns.L["Buff Frame"] = "Cadre des buffs"
ns.L["Enable"] = "Activer"
ns.L["Enable skinning of the action bars."] = "Active le skinnage des barres  d'actions."
ns.L["Enable skinning of the buff frame."] = "Active le skinnage du cadre des buffs."
ns.L["Main Bar"] = "Barre principale"
ns.L["Multi-Bars"] = "Barres multiples"
ns.L["Options"] = "Options"
ns.L["Pet Bar"] = "Barre du familier"
ns.L["Possess Bar"] = "Barre de possession"
ns.L["Profiles"] = "Profils"
ns.L["Skin the buttons of the %s."] = "Skinne les boutons de la %s."
ns.L["Stance Bar"] = "Barre des postures"
ns.L["Vehicle Bar"] = "Barre du véhicule"
ns.L["ToC/Adds ButtonFacade support to the default interface."] = "Ajoute le support de ButtonFacade à l'interface par défaut."

	elseif LOC == "koKR" then
ns.L["Action Bars"] = "행동 단축바"
ns.L["Allows the default action bars to be skinned by ButtonFacade."] = "기본 행동 단축바가 ButtonFacade에 의해 스킨되도록 허락합니다."
ns.L["Allows the default buff frame to be skinned by ButtonFacade."] = "기본 버프 창에 ButtonFacade에 의해 스킨되도록 허락합니다."
ns.L["Bar Options"] = "바 옵션"
ns.L["BLF_Desc"] = "기본 인터페이스에 ButtonFacade 지원을 추가합니다. 만약 당신이 모든 화면에 문제를 경험한다면, 영향을 받은 모듈이나 요소를 비활성화하고 당신의 인터페이스를 다시 재시작합니다."
ns.L["Buff Frame"] = "버프 창"
ns.L["Enable"] = "사용함"
ns.L["Enable skinning of the action bars."] = "행동 단축바의 스킨을 사용합니다."
ns.L["Enable skinning of the buff frame."] = "버프 창의 스킨을 사용합니다."
ns.L["Main Bar"] = "메인 바"
ns.L["Multi-Bars"] = "멀티-바들"
ns.L["Options"] = "옵션"
ns.L["Pet Bar"] = "소환수 바"
ns.L["Possess Bar"] = "지배 바"
ns.L["Profiles"] = "프로필"
ns.L["Skin the buttons of the %s."] = "%s의 버튼 스킨"
ns.L["Stance Bar"] = "태세 바"
ns.L["Vehicle Bar"] = "차량 바"
ns.L["ToC/Adds ButtonFacade support to the default interface."] = "기본 인터페이스에 ButtonFacade 지원을 추가합니다."

	elseif LOC == "ruRU" then
ns.L["Action Bars"] = "Действие бары"
ns.L["Allows the default action bars to be skinned by ButtonFacade."] = "Позволяет действия по умолчанию для баров кожу от ButtonFacade."
ns.L["Allows the default buff frame to be skinned by ButtonFacade."] = "Позволяет кадр по умолчанию будет Buff кожу от ButtonFacade."
ns.L["Bar Options"] = "Бар Функции"
ns.L["BLF_Desc"] = "Добавляет ButtonFacade поддержка интерфейса по умолчанию. Если у вас возникнут вопросы, отображения, отключение модуля или элемента и перезагрузить ваш интерфейс."
ns.L["Buff Frame"] = "Buff Frame"
ns.L["Enable"] = "Разрешать"
ns.L["Enable skinning of the action bars."] = "Включите Skinning действия баров."
ns.L["Enable skinning of the buff frame."] = "Включите шкуру из Buff кадр."
ns.L["Main Bar"] = "Главный бар"
ns.L["Multi-Bars"] = "Multi-бары"
ns.L["Options"] = "Настройки"
ns.L["Pet Bar"] = "Pet Бар"
ns.L["Possess Bar"] = "Обладание Бар"
ns.L["Profiles"] = "Профили"
ns.L["Skin the buttons of the %s."] = "Кожа кнопку %s."
ns.L["Stance Bar"] = "Стойка бара"
ns.L["Vehicle Bar"] = "Автомобиль Бар"
ns.L["ToC/Adds ButtonFacade support to the default interface."] = "Добавляет ButtonFacade поддержка интерфейса по умолчанию."

	elseif LOC == "zhCN" then
ns.L["Action Bars"] = "动作条"
ns.L["Allows the default action bars to be skinned by ButtonFacade."] = "允许默认动作条可以被 ButtonFacade 美化"
ns.L["Allows the default buff frame to be skinned by ButtonFacade."] = "允许默认的 Buff 框体可以被 ButtonFacade 美化。"
ns.L["Bar Options"] = "动作条选项"
ns.L["BLF_Desc"] = "增加 ButtonFacade 支持默认界面的美化。如果你碰到任何问题，禁用受影响的模块或元素并重载你的插件。"
ns.L["Buff Frame"] = "Buff 框体"
ns.L["Enable"] = "启用"
ns.L["Enable skinning of the action bars."] = "启用动作条美化。"
ns.L["Enable skinning of the buff frame."] = "启用 Buff 框体美化。"
ns.L["Main Bar"] = "主动作条"
ns.L["Multi-Bars"] = "额外动作条"
ns.L["Options"] = "选项"
ns.L["Pet Bar"] = "宠物条"
ns.L["Possess Bar"] = "控制条"
ns.L["Profiles"] = "配置文件"
ns.L["Skin the buttons of the %s."] = "美化 %s 的按钮。"
ns.L["Stance Bar"] = "姿态条"
ns.L["Vehicle Bar"] = "载具条"
ns.L["ToC/Adds ButtonFacade support to the default interface."] = "增加 ButtonFacade 支持到默认界面。"

	elseif LOC == "zhTW" then
ns.L["Action Bars"] = "動作條"
ns.L["Allows the default action bars to be skinned by ButtonFacade."] = "允許默認動作條可以被 ButtonFacade 美化"
ns.L["Allows the default buff frame to be skinned by ButtonFacade."] = "允許默認的 Buff 框體可以被 ButtonFacade 美化。"
ns.L["Bar Options"] = "動作條選項"
ns.L["BLF_Desc"] = "增加 ButtonFacade 支持默認界面的美化。如果妳碰到任何問題，禁用受影響的模塊或元素並重載妳的插件。"
ns.L["Buff Frame"] = "Buff 框體"
ns.L["Enable"] = "啟用"
ns.L["Enable skinning of the action bars."] = "啟用動作條美化。"
ns.L["Enable skinning of the buff frame."] = "啟用 Buff 框體美化。"
ns.L["Main Bar"] = "主動作條"
ns.L["Multi-Bars"] = "額外動作條"
ns.L["Options"] = "選項"
ns.L["Pet Bar"] = "寵物條"
ns.L["Possess Bar"] = "控制條"
ns.L["Profiles"] = "設定檔"
ns.L["Skin the buttons of the %s."] = "美化 %s 的按鈕。"
ns.L["Stance Bar"] = "姿態條"
ns.L["Vehicle Bar"] = "載具條"
ns.L["ToC/Adds ButtonFacade support to the default interface."] = "增加 ButtonFacade 支持到默認界面。"

	end
end
