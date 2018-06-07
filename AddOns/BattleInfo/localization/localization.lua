BATTLEINFO_LOACALE={};
local L=BATTLEINFO_LOACALE;

if ( GetLocale() == "zhCN" ) then
	L["Battle Info"] = "战场助手";
	L.ALTERAC="奥特兰克山谷"
	L.ARATHI="阿拉希盆地"
	L.EYE="风暴之眼"
	L.WARSONG="战歌峡谷"
	L.SOACIENTS="远祖滩头"
	
	L.CLASSNAME={
		["WARRIOR"]="战士",
		["MAGE"]="法师",
		["PRIEST"]="牧师",
		["PALADIN"]="圣骑士",
		["DRUID"]="德鲁伊",
		["SHAMAN"]="萨满祭司",
		["HUNTER"]="猎人",
		["ROGUE"]="潜行者",
		["WARLOCK"]="术士",
		["DEATHKNIGHT"]="符娃",
	}
	
	L.CLASSNAME_COLOR={
		["WARRIOR"]="|CFFC79C6E"..L.CLASSNAME["WARRIOR"].."|r",
		["MAGE"]="|CFF69CCF0"..L.CLASSNAME["MAGE"].."|r",
		["PRIEST"]="|CFFFFFFFF"..L.CLASSNAME["PRIEST"].."|r",
		["PALADIN"]="|CFFF58CBA"..L.CLASSNAME["PALADIN"].."|r",
		["DRUID"]="|CFFFF7D0A"..L.CLASSNAME["DRUID"].."|r",
		["SHAMAN"]="|CFF2459FF"..L.CLASSNAME["SHAMAN"].."|r",
		["HUNTER"]="|CFFABD473"..L.CLASSNAME["HUNTER"].."|r",
		["ROGUE"]="|CFFFFF569"..L.CLASSNAME["ROGUE"].."|r",
		["WARLOCK"]="|CFF9482CA"..L.CLASSNAME["WARLOCK"].."|r",
		["DEATHKNIGHT"]="|CFFC41F3B"..L.CLASSNAME["DEATHKNIGHT"].."|r",
	}
	
	
	L.ALLIANCE="联盟"
	L.HORDE="部落"
	
	L.REPORT_1="%s共有%d人（来自%d个服务器）参与%s的战斗"
	L.REPORT_2="%s可能为%s国家队，".."共%d人来自%s服务器"
	L.REPORT_3="一看%s就是野队"
	L.REPORT_4="%s不足半数"
	L.REPORT_5="\n可能是\n|CFF00FF00%s|r\n国家队"
	L.REPORT_6="\n野队……阿"
	L.REPORT_7="\n\n%d 人 / %d 服"
	
	L.TOOLTIP="ALT+左键向战场(/bg)发送分析报告\nALT+右键向小队或团队发送分析报告\nCTRL+左键点击拖动\nCTRL+右键点击恢复默认"
	L.SEARCHBUTTON="|CFFFFD100报告新场|r"
	L.QUICKJOINBUTTON="|CFFFFD100快速加入|r"
	L.QUICKJOINTEXT="|CFFFFFFFFCTRL+NPC自动排队|r"
	L.QUICKJOINTIP="请输入场次：|CFF00FF00%s|r\n\n回车：自己加入\n加号：小队加入\nDEL：清空"
	L.RESETBUTTON="重置比分栏位置"
	
	L.SPIRITHEAL="灵魂医者复活倒计时：%d秒"
	L.SPIRITHEAL_ING="灵魂医者复活中..."
	
	L.ANDAFTER="及以后"
	
	L.LEAVEBUTTON="CTRL+隐藏=离开"
	
	L.NEW="|CFF00FF00(新)|r"
	L.OLD="|CFFFF0000(旧)|r"
	L.PERHAPS="|CFFFFD100(可能)|r"
	
	L.QUICKJOIN="快速加入：%s"
	L.QUICKJOIN_FIRST="首选可用"
	L.QUICKJOIN_CANTFIND="没找到场次：%s"
	
	L.HINT1="如果你不想看到这条信息请输入/bi进行设置"
	L.HINT2="你不在小队或团队中时以说代替报告频道"
	L.HINT3="%s可能的出现的新场号为"
	
	L.HINT4="如果你不想自动释放请输入/bi进行设置"
	L.HINT5="|CFF00FF00%d|r秒后离开战场"
	L.HINT6="如果你不想自动离开战场请输入/bi进行设置"
	
	L.SHOWHELP="显示帮助信息"
	L.SAYTO="报告新场到"
	L.AUTOREL="战场中自动释放灵魂"
	L.AUTOLEV="战斗结束%d秒后自动离开战场"
	L.AUTOSAYTO="加入队列时自动报告新场"
	L.GAINSPEED="计算上一场荣誉获得速度"
	L.IGLEFT="屏蔽战场结束时候的离队信息"
		
	L.SELF="自己"
	L.SAY="说"
	L.YELL="大喊"
	L.PARTY="团队/小队"
	L.RAID="团队/小队"
	L.CURRENT="当前聊天"
	L.CHATBOX="输入框中"
	
	L.FORGREATHONOR="无上的荣耀"
	L.CONCERTEDEFFORTS="共同的努力"

	L.MARKLEFT="还将自动交%d次牌子"
	L.MARKCOMP="自动交牌子任务完成"
	L.MARKLACK="但是你的牌子不够了 请输入/bi x=0取消"
	L.MARKHELP="BattleInfo:自动交牌子命令 /bi x=次数"
	L.MARKINIT="准备自动交%d次，请手动点NPC"
	L.MARKERR="x=[0,100]"
	
	L.OPTIONSAVE="设置已经保存"
	
	L.SPEED="本场共获得|CFFFFD100 %d |r参战时间:|CFFFFD100 %d |r分 速度:|CFFFFD100 %d |r/小时(不算击杀)"
	
	L.BINDING_NAME_BATTLEINFO_QUEUE="排队"
	L.BINDING_NAME_BATTLEINFO_ALWAYS_QUEUE="打开/关闭自动排队"
	L.BINDING_NAME_BATTLEINFO_JOIN="确认进入战场"
	L.BINDING_NAME_BATTLEINFO_LEAVE="离开确认中的战场"
	L.ALWAYS_QUEUE_ON="以后的点开NPC将自动排队"
	L.ALWAYS_QUEUE_OFF="自动排队已经取消"
elseif (GetLocale() == "zhTW") then	
	--by Juna juha@cwowaddon.com
	--http://bbs.cwowaddon.com/space-uid-41.html
	L["Battle Info"] = "戰場助手";
	L.ALTERAC="奧特蘭克山谷"
	L.ARATHI="阿拉希盆地"
	L.EYE="暴風之眼"
	L.WARSONG="戰歌峽谷"
	L.SOACIENTS="遠祖灘頭"
 
	L.CLASSNAME={
          ["WARRIOR"]="戰士",
          ["MAGE"]="法師",
          ["PRIEST"]="牧師",
          ["PALADIN"]="聖騎士",
          ["DRUID"]="德魯伊",
          ["SHAMAN"]="薩滿",
          ["HUNTER"]="獵人",
          ["ROGUE"]="盜賊",
          ["WARLOCK"]="術士",
          ["DEATHKNIGHT"]="死亡騎士",
	}
 
	L.CLASSNAME_COLOR={
          ["WARRIOR"]="|CFFC79C6E"..L.CLASSNAME["WARRIOR"].."|r",
          ["MAGE"]="|CFF69CCF0"..L.CLASSNAME["MAGE"].."|r",
          ["PRIEST"]="|CFFFFFFFF"..L.CLASSNAME["PRIEST"].."|r",
          ["PALADIN"]="|CFFF58CBA"..L.CLASSNAME["PALADIN"].."|r",
          ["DRUID"]="|CFFFF7D0A"..L.CLASSNAME["DRUID"].."|r",
          ["SHAMAN"]="|CFF2459FF"..L.CLASSNAME["SHAMAN"].."|r",
          ["HUNTER"]="|CFFABD473"..L.CLASSNAME["HUNTER"].."|r",
          ["ROGUE"]="|CFFFFF569"..L.CLASSNAME["ROGUE"].."|r",
          ["WARLOCK"]="|CFF9482CA"..L.CLASSNAME["WARLOCK"].."|r",
          ["DEATHKNIGHT"]="|CFFC41F3B"..L.CLASSNAME["DEATHKNIGHT"].."|r",
	}
 
 
	L.ALLIANCE="聯盟"
	L.HORDE="部落"
 
	L.REPORT_1="%s 現在 %d 人參與 %s 的戰鬥"
	L.REPORT_2="%s 可能為 %s AT 團，共 %d 人來自%s伺服器"
	L.REPORT_3="一看 %s 就是野團"
	L.REPORT_4="%s 人數不足半數"
	L.REPORT_5="\n可能是\n|CFF00FF00%s|r\n AT 團"
	L.REPORT_6="\n野團……"
	L.REPORT_7="\n%d 人 / %d 服" -- 这个地方有点长 但是我不知道 tw 伺服器 缩写是什么 难道是 伺？请修正

	L.TOOLTIP="ALT+左鍵 - 向戰場(/bg)發送分析報告\nALT+右鍵 - 向小隊或團隊發送分析報告\nCTRL+左鍵 - 拖曳框架\nCTRL+右鍵 - 恢復預設值"
	L.SEARCHBUTTON="|CFFFFD100通報新場|r"
	L.QUICKJOINBUTTON="|CFFFFD100快速加入|r"
	L.QUICKJOINTEXT="|CFFFFFFFFCTRL+NPC自動排隊|r"
	L.QUICKJOINTIP="請輸入場次: |CFF00FF00%s|r\n\n提示: \nEnter: 加入戰鬥\n＋: 隊伍加入\nDEL: 清空"  
	L.RESETBUTTON="重置比數欄的位置"
	L.SPIRITHEAL="靈魂醫者復活計時：%d 秒"
	L.SPIRITHEAL_ING="靈魂醫者復活中..."
 
	L.ANDAFTER=" 及以後"
 
	L.LEAVEBUTTON="隱藏+CTRL=離開"
 
	L.NEW="|CFF00FF00(新)|r"
	L.OLD="|CFFFF0000(舊)|r"
	L.PERHAPS="|CFFFFD100(可能)|r"
 
	L.QUICKJOIN="快速加入：%s"
	L.QUICKJOIN_FIRST="優先進入"
	L.QUICKJOIN_CANTFIND="找不到場次：%s"
 
	L.HINT1="如不想看到此訊息，輸入 /bi 進行設定"
	L.HINT2="不在小隊/團隊中時以說替代通報頻道"
	L.HINT3="%s 可能出現的新場次為"
 
	L.HINT4="如不想自動釋放靈魂，輸入 /bi 進行設定"
	L.HINT5="|CFF00FF00%d|r 秒後離開戰場"
	L.HINT6="如不想自動離開戰場，輸入 /bi 進行設定"
 
	L.SHOWHELP="顯示說明訊息"
	L.SAYTO="通報新場至"
	L.AUTOREL="戰場中自動釋放靈魂"
	L.AUTOLEV="戰鬥結束自動離開戰場"
	L.AUTOSAYTO="加入佇列時自動報告新場"
	L.GAINSPEED="預估每場平均獲得榮譽值 (榮譽/小時)"
	L.IGLEFT="隱藏戰場結束時的離隊訊息"
 
	L.SELF="自己"
	L.SAY="說"
	L.YELL="大喊"
	L.PARTY="小隊"
	L.RAID="團隊"
	L.CURRENT="目前頻道"
	L.CHATBOX="輸入框中"
 
	L.FORGREATHONOR="無上的榮耀"
	L.CONCERTEDEFFORTS="共同的努力"

	L.MARKLEFT="還將自動交 %d 次獎章"
	L.MARKCOMP="自動交獎章任務完成"
	L.MARKLACK="但是你的獎章不夠了，請輸入/bi x (x=0 取消)"
	L.MARKHELP="自動交獎章任務，指令 /bi x (x=次數)"
	L.MARKINIT="準備自動交 %d 次，請手動點 NPC"
	L.MARKERR="x=[0,100]"
 
	L.OPTIONSAVE="設定已儲存"
 
	L.SPEED="本場共獲得|CFFFFD100 %d |r點榮譽，歷時:|CFFFFD100 %d |r分中，預估平均:|CFFFFD100 %d |r榮譽/小時(不算擊殺)"
  
	L.BINDING_NAME_BATTLEINFO_QUEUE="排隊"
	L.BINDING_NAME_BATTLEINFO_ALWAYS_QUEUE="打開/關閉自動排隊"
	L.BINDING_NAME_BATTLEINFO_JOIN="確認進入戰場"
	L.BINDING_NAME_BATTLEINFO_LEAVE="離開確認中的戰場"
	L.ALWAYS_QUEUE_ON="以後的點開NPC將自動排隊"
	L.ALWAYS_QUEUE_OFF="自動排隊已經關閉"
else
	L["Battle Info"] = "Battle Info";
	L.ALTERAC="Alterac Valley"
	L.ARATHI="Arathi Basin"
	L.EYE="Eye of the Storm"
	L.WARSONG="Warsong Gulch"
	L.SOACIENTS="Strand of the Ancients"
	
	L.CLASSNAME={
		["WARRIOR"]="Warrior",
		["MAGE"]="Mage",
		["PRIEST"]="Priest",
		["PALADIN"]="Paladin",
		["DRUID"]="Druid",
		["SHAMAN"]="Shaman",
		["HUNTER"]="Hunter",
		["ROGUE"]="Rogue",
		["WARLOCK"]="Warlock",
		["DEATHKNIGHT"]="Death Knight",
	}
	
	L.CLASSNAME_COLOR={
		["WARRIOR"]="|CFFC79C6E"..L.CLASSNAME["WARRIOR"].."|r",
		["MAGE"]="|CFF69CCF0"..L.CLASSNAME["MAGE"].."|r",
		["PRIEST"]="|CFFFFFFFF"..L.CLASSNAME["PRIEST"].."|r",
		["PALADIN"]="|CFFF58CBA"..L.CLASSNAME["PALADIN"].."|r",
		["DRUID"]="|CFFFF7D0A"..L.CLASSNAME["DRUID"].."|r",
		["SHAMAN"]="|CFF2459FF"..L.CLASSNAME["SHAMAN"].."|r",
		["HUNTER"]="|CFFABD473"..L.CLASSNAME["HUNTER"].."|r",
		["ROGUE"]="|CFFFFF569"..L.CLASSNAME["ROGUE"].."|r",
		["WARLOCK"]="|CFF9482CA"..L.CLASSNAME["WARLOCK"].."|r",
		["DEATHKNIGHT"]="|CFFC41F3B"..L.CLASSNAME["DEATHKNIGHT"].."|r",
	}
	
	
	L.ALLIANCE="Alliance"
	L.HORDE="Horde"
	
	L.REPORT_1="%s has %d players fighting for %s now"
	L.REPORT_2="%s might be %s Realm Team ,%d players come from server %s"
	L.REPORT_3="Ha ! %s is Loner Team"
	L.REPORT_4="%s less than half"
	L.REPORT_5="\nMay be\n|CFF00FF00%s|r\nRealm Team"
	L.REPORT_6="\nLoner Team"
	L.REPORT_7="\n\n%d players \nFROM %d realms"
	
	L.TOOLTIP="ALT+Left click to send report to (/bg)\nALT+right click to send report to raid\nCTRL+Left click to drag\nCTRL+Right click to reset bar position"
	L.SEARCHBUTTON="|CFFFFD100Report New|r"
	L.QUICKJOINBUTTON="|CFFFFD100Quick Join|r"
	L.QUICKJOINTEXT="|CFFFFFFFFCTRL+NPC Auto to join a queue|r"
	L.QUICKJOINTIP="Type battleground index\nNum: |CFF00FF00%s|r\n\nENTER: Self Join\nPLUS: Group join\nDEL: Clear"
	L.RESETBUTTON="Reset the world stats bar"
	
	L.SPIRITHEAL="Spirit heal AE in:%d seconds"
	L.SPIRITHEAL_ING="Spirit healing..."
	
	L.ANDAFTER=" and etc..."
	
	L.LEAVEBUTTON="CTRL+Hide=Leave"
	
	L.NEW="|CFF00FF00(New)|r"
	L.OLD="|CFFFF0000(Old)|r"
	L.PERHAPS="|CFFFFD100(Perhaps)|r"
	
	L.QUICKJOIN="Quick join:%s"
	L.QUICKJOIN_FIRST="First available"
	L.QUICKJOIN_CANTFIND="No such battle: %s"
	
	L.HINT1="Type /bi to disable this message if you want"
	L.HINT2="Use SAY instead if you are not in party or raid"
	L.HINT3="New battles for %s "
	
	L.HINT4="Type /bi to disable auto releave spirit if you want"
	L.HINT5="leaving battleground in |CFF00FF00%d|r seconds"
	L.HINT6="Type /bi to disable auto leave battle if you want"
	
	L.SHOWHELP="Show help"
	L.SAYTO="Report new battle to "
	L.AUTOREL="Auto release spirit in battleground"
	L.AUTOLEV="Auto leave battleground in %d seconds after battle ends"
	L.AUTOSAYTO="Report new battle when joins a battle"
	L.GAINSPEED="Report honor gaining speed after battle"
	L.IGLEFT="Suppress member left raid group message on battle ends"
	
	L.SELF="Self"
	L.SAY="Say"
	L.YELL="Yell"
	L.PARTY="Raid / Party"
	L.RAID="Raid / Party"
	L.CURRENT="Current chat"
	L.CHATBOX="Chat Box"
	
	L.FORGREATHONOR="For Great Honor"
	L.CONCERTEDEFFORTS="Concerted Efforts"

	L.MARKLEFT="%d marks left to submit"
	L.MARKCOMP="Auto submit completed"
	L.MARKLACK="but you do NOT have enough marks type /bi x=0 to cancel"
	L.MARKHELP="Auto submit command /bi x=<times>"
	L.MARKINIT="prepared for %d times, click NPC by yourself"
	L.MARKERR="x=[0,100]"
	
	L.OPTIONSAVE="Option Saved"
	
	L.SPEED="Total|CFFFFD100 %d |rhonor gained last battle cost you|CFFFFD100 %d |rminutes at speed of|CFFFFD100 %d |rper hour(without kill)"
	
	L.BINDING_NAME_BATTLEINFO_QUEUE="Join the queue"
	L.BINDING_NAME_BATTLEINFO_ALWAYS_QUEUE="Turn on/off Auto join the queue"
	L.BINDING_NAME_BATTLEINFO_JOIN="Enter the confirming battle"
	L.BINDING_NAME_BATTLEINFO_LEAVE="Leave the confirming battle"
	L.ALWAYS_QUEUE_ON="Auto queue is now ON"
	L.ALWAYS_QUEUE_OFF="Auto queue is now OFF"
end
