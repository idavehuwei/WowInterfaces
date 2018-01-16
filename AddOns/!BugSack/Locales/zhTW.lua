local L = LibStub("AceLocale-3.0"):NewLocale("BugSack", "zhTW")
if not L then return end

-- Command descriptions
L["Show sack"] = "顯示 BugSack"
L["Show errors in the sack."] = "在 BugSack 視窗中顯示錯誤資訊。"
L["Current error"] = "目前的錯誤"
L["Show the current error."] = "顯示目前的錯誤。"
L["Current session"] = "本次遊戲期間"
L["Show errors from the current session."] = "顯示本次遊戲期間的錯誤。"
L["Previous session"] = "上次遊戲期間"
L["Show errors from the previous session."] = "顯示上次遊戲期間的錯誤。"
L["By session number"] = "根據遊戲期間編號"
L["Show errors by session number."] = "顯示指定遊戲期間編號的錯誤。"
L["All errors"] = "所有錯誤"
L["Show all errors."] = "顯示所有錯誤。"
L["Received errors"] = "收到的錯誤"
L["Show errors received from another player."] = "顯示接收自其他玩家的錯誤。"
L["Send bugs"] = "發送錯誤"
L["Sends your current session bugs to another BugSack user."] = "發送本次遊戲期間的錯誤給其他玩家。只對使用 AceComm-2.0 和 BugSack 的玩家有效。"
L["<player name>"] = "<玩家名字>"
L["Menu"] = "選單"
L["Menu options."] = "選項。"

L["List errors"] = "列出錯誤"
L["List errors to the chat frame."] = "在聊天視窗中列出錯誤。"
L["List the current error."] = "列出目前的錯誤。"
L["List errors from the current session."] = "列出本次遊戲期間的錯誤。"
L["List errors from the previous session."] = "列出上次遊戲期間的錯誤。"
L["List errors by session number."] = "列出指定遊戲期間編號的錯誤。"
L["List all errors."] = "列出所有錯誤。"
L["List errors received from another player."] = "列出接收自其他玩家的錯誤。"

L["Auto popup"] = "自動彈出"
L["Toggle auto BugSack frame popup."] = "遇到錯誤自動彈出 BugSack 視窗。"
L["Chatframe output"] = "聊天視窗警報"
L["Print a warning to the chat frame when an error occurs."] = "遇到錯誤時自動在聊天視窗顯示一條警報。"
L["Errors to chatframe"] = "聊天視窗詳細顯示"
L["Print the full error message to the chat frame instead of just a warning."] = "遇到錯誤時自動在聊天視窗輸出錯誤資訊。"
L["Mute"] = "靜音"
L["Toggle an audible warning everytime an error occurs."] = "遇到錯誤時不發出音效。"
L["Sound"] = "音效"
L["What sound to play when an error occurs (Ctrl-Click to preview.)"] = "遇到錯誤時發出什麼音效 (Ctrl-點擊試聽)。"
L["Save errors"] = "保存錯誤"
L["Toggle whether to save errors to your SavedVariables\\!BugGrabber.lua file."] = "切換是否在 SavedVariables\\!BugGrabber.lua 檔中保存錯誤資訊。"
L["Limit"] = "錯誤條數限制"
L["Set the limit on the nr of errors saved."] = "設置保存錯誤的最大條數。"
L["Filter addon mistakes"] = "過濾插件錯誤"
L["Filters common mistakes that trigger the blocked/forbidden event."] = "過濾插件常見的錯誤。"
L["Throttle at excessive amount"] = "過多錯誤時節流"
L["Whether to throttle for a default of 60 seconds when BugGrabber catches more than 20 errors per second."] = "當每秒多過20個錯誤時節流。"

L["Generate bug"] = "模擬錯誤"
L["Generate a fake bug for testing."] = "產生一個假的錯誤來對 BugSack 進行測試。"
L["Script bug"] = "腳本錯誤"
L["Generate a script bug."] = "產生一個腳本錯誤。"
L["Addon bug"] = "插件錯誤"
L["Generate an addon bug."] = "產生一個插件錯誤。"

L["Clear errors"] = "清除錯誤"
L["Clear out the errors database."] = "清除所有保存的錯誤。"

L["%d sec."] = "%d秒。"
L["|cffeda55fBugGrabber|r is paused due to an excessive amount of errors being generated. It will resume normal operations in |cffff0000%d|r seconds. |cffeda55fDouble-Click|r to resume now."] = "因為過多錯誤 |cffeda55fBugGrabber|r 現正暫停。它會在|cffff0000%d|r秒後重新開始。|cffeda55f雙擊|r立刻繼續。"

-- Chat messages
L["You have no errors, yay!"] = "沒有任何錯誤!"
L["List of errors:"] = "錯誤列表:"
L["An error has been generated."] = "發生錯誤!"
L["BugSack generated this fake error."] = "BugSack 產生了這條假錯誤。"
L["All errors were wiped."] = "所有錯誤資訊已被清除。"
L["An error has been recorded."] = "錯誤已被紀錄。"
L["%d errors have been recorded."] = "%d個錯誤已經被紀錄。"
L["You've received %d errors from %s, you can show them with /bugsack show received."] = "你已接收%d個錯誤。錯誤由%s發出。你可用 /bugsack show received 查看。"
L["%d errors has been sent to %s. He must have BugSack to be able to read them."] = "%d個錯誤已發送給%s。只對使用 AceComm-2.0 和 BugSack 的玩家有效。"

-- Frame messages,
L[" (... more ...)"] = "(... 更多 ...)"
L["No errors found"] = "未發現錯誤"
L["Error %d of %d"] = "錯誤 %d/%d"
L[" (viewing last error)"] = " (查看最後一條錯誤)"
L[" (viewing session errors)"] = " (查看本次本次遊戲期間的錯誤)"
L[" (viewing previous session errors)"] = " (查看上次遊戲期間的錯誤)"
L[" (viewing all errors)"] = " (查看所有錯誤)"
L[" (viewing errors for session %d)"] = " (查看遊戲期間編號%d的錯誤)"
L[" (viewing errors from %s)"] = " (查看接收自%s的錯誤)"

-- FuBar plugin
L["|cffeda55fClick|r to open BugSack with the last error. |cffeda55fShift-Click|r to reload the user interface. |cffeda55fAlt-Click|r to clear the sack."] = "\n|cffeda55f左擊: |r打開 BugSack 視窗查看最近的錯誤。\n|cffeda55fShift-左擊: |r重載使用者介面。\n|cffeda55fAlt-左擊: |r清除錯誤。"

if GetLocale() == "zhTW" then
	BugSackNextButton:SetText("下一個")
	BugSackLastButton:SetText("最後")
	BugSackPrevButton:SetText("上一個")
	BugSackFirstButton:SetText("最初")
end
