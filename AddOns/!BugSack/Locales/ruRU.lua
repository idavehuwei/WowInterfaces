﻿-- Translated by Argonavt-Arkona

local L = LibStub("AceLocale-3.0"):NewLocale("BugSack", "ruRU")
if not L then return end

-- Command descriptions
L["Show sack"] = "Показать в мешке"
L["Show errors in the sack."] = "Показать ошибку в мешке"
L["Current error"] = "Текущая ошибка"
L["Show the current error."] = "Показать текущуюю ошибку"
L["Current session"] = "Текущая Сессия"
L["Show errors from the current session."] = "Показать Ошибку Сессии"
L["Previous session"] = "Предыдущая Сессия"
L["Show errors from the previous session."] = "Показать Ошибку Предыдущей Сессии"
L["By session number"] = "По номеру сессии"
L["Show errors by session number."] = "Показывает ошибки по номеру сессии"
L["All errors"] = "Все ошибки"
L["Show all errors."] = "Показать все ошибки."
L["Received errors"] = "Полученные ошибки"
L["Show errors received from another player."] = "Показывает ошибки полученные от другого игрока."
L["Send bugs"] = "Послать ошибки"
L["Sends your current session bugs to another BugSack user."] = "Послать текующию сессию ошибок другому BugSack пользователю."
L["<player name>"] = "<Имя игрока>"
L["Menu"] = "Меню"
L["Menu options."] = "Опции меню"

L["List errors"] = "Лист Ошибок"
L["List errors to the chat frame."] = "Список ошибок в структуре чата"
L["List the current error."] = "Список Текущих Ошибок"
L["List errors from the current session."] = "Список  Ошибок от текущей сессии"
L["List errors from the previous session."] = "Список  Ошибок от предыдущей сессии"
L["List errors by session number."] = "Список  Ошибок от предыдущей сессии"
L["List all errors."] = "Список Всех Ошибок"
L["List errors received from another player."] = "Список Ошибок полученных от другого игрока"

L["Auto popup"] = "Авто всплывать"
L["Toggle auto BugSack frame popup."] = "Показывает BugSack всплывающей областью."
L["Chatframe output"] = "Печатать в область"
L["Print a warning to the chat frame when an error occurs."] = "Печатает Предупреждение в струтуре чата,когда происходит ошибка."
L["Errors to chatframe"] = "Ошибки в область чата"
L["Print the full error message to the chat frame instead of just a warning."] = "Печатает полное сообщение об ошибке вместо Предупреждения."
L["Mute"] = "Заглушить"
L["Toggle an audible warning everytime an error occurs."] = "Каждый раз при ошибке выдает звуковое предупреждение."
L["Sound"] = "Звук"
L["What sound to play when an error occurs (Ctrl-Click to preview.)"] = "Звук проигрывается при каждой ошибке (Ctrl-Click для просмотра.)"
L["Save errors"] = "Сохранить ошибку"
L["Toggle whether to save errors to your SavedVariables\\!BugGrabber.lua file."] = "Показывают сохраненные ошибки в файле SavedVariables\\!BugGrabber.lua file."
L["Limit"] = "Лимит"
L["Set the limit on the nr of errors saved."] = "Установите предел лимита для Сохраненых ошибок."
L["Filter addon mistakes"] ="Смешивающий Фильтр Аддонов"
L["Filters common mistakes that trigger the blocked/forbidden event."] = "Частые ошибки фильтра которые вызывают блокирование/запрещение случаев."
L["Throttle at excessive amount"] = "Дроссель чрезмерных ошибок"
L["Whether to throttle for a default of 60 seconds when BugGrabber catches more than 20 errors per second."] = "Закрывается по умолчанию на 60 секунд когда BugGrabber ловит более 20 ошибок в секунду."

L["Generate bug"] = "Сгенерировать ошибку"
L["Generate a fake bug for testing."] = "Генерировать ошибку для теста"
L["Script bug"] = "Ошибка  скрипта"
L["Generate a script bug."] = "Сгенерировать ошибку скрипта"
L["Addon bug"] = " Ошибка аддона"
L["Generate an addon bug."] = "Сгенерировать ошибку аддона"

L["Clear errors"] = "Очистить ошибки"
L["Clear out the errors database."] = "очистить ошибки из базы данных"

L["%d sec."] = "%d сек."
L["|cffeda55fBugGrabber|r is paused due to an excessive amount of errors being generated. It will resume normal operations in |cffff0000%d|r seconds. |cffeda55fDouble-Click|r to resume now."] = "|cffeda55fBugGrabber|r сделал паузу из за чрезмерно количества ошибок. Нормальные операции можно будет совершать через |cffff0000%d|r секунд. |cffeda55fDouble-Click|r чтобы возобновить сейчас."

-- Chat messages
L["You have no errors, yay!"] = "У вас нет никаких ошибок, да!"
L["List of errors:"] = "Лист ошибок:"
L["An error has been generated."] = "Ошибка была Сгенерировна."
L["BugSack generated this fake error."] = "BugSack сгенерировал поддельную ошибку."
L["All errors were wiped."] = "Все ошибки были стерты."
L["An error has been recorded."] = "Ошибка была зарегистрирована."
L["%d errors have been recorded."] = "%d ошибки были зарегистрированы."
L["You've received %d errors from %s, you can show them with /bugsack show received."] = "Вы получили %d ошибоку от %s, для того чтобы посмотреть напечатайте /bugsack."
L["%d errors has been sent to %s. He must have BugSack to be able to read them."] = "%d ошибки послали в %s. Но он должен иметь BugSack чтобы прочесть их."

-- Frame messages,
L[" (... more ...)"] = " (... более ...)"
L["No errors found"] = "Ошибок не найдено"
L["Error %d of %d"] = "Ошибка %d из %d"
L[" (viewing last error)"] = " (смотреть лист ошибок)"
L[" (viewing session errors)"] = " (смотреть ошибки Сессии)"
L[" (viewing previous session errors)"] = " (предварительно просмотреть ошибки сессии)"
L[" (viewing all errors)"] = " (просмотреть все ошибки)"
L[" (viewing errors for session %d)"] = " (просмотреть ошибки для сессии %d)"
L[" (viewing errors from %s)"] = " (просмотреть ошибки для %s)"

-- FuBar plugin
L["|cffeda55fClick|r to open BugSack with the last error. |cffeda55fShift-Click|r to reload the user interface. |cffeda55fAlt-Click|r to clear the sack."] = "|cffeda55fКлик|r чтобы открыть BugSack текущие ошибки. |cffeda55fShift-Клик|r перезагрузить интерфейс пользователя. |cffeda55fAlt-Клик|r очистить ошибки."

