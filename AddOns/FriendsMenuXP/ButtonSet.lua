--[[
	text,                                              --按钮名称
	textHeight,                                        --按钮字体大小
	icon,                                              --按钮图片路径
	tCoordLeft, tCoordRight, tCoordTop, tCoordBottom,  --按钮图片的相对部分
	textR, textG, textB,                               --按钮文字顔色
	tooltipText,                                       --提示信息
	show,                                              --判断是否显示该按钮的函数
	func,                                              --点击按钮所进行的操作
	notClickable,                                      --不可点击(灰色按钮)
	justifyH,                                          --文字对其方式, LEFT或CENTER
	isSecure,                                          --是否是安全按钮
	attributes,                                        --安全按钮的属性, 格式为"属性1:值1; 属性2:值2"
]]

--{ "WHISPER", "INVITE", "TARGET", "IGNORE", "REPORT_SPAM", "GUILD_PROMOTE", "GUILD_LEAVE", "CANCEL" };
function NoSelfShow(name) return UnitName("player")~=name; end

FriendsMenuXP_Buttons = {};

FriendsMenuXP_Buttons["WHISPER"] = {
	text = WHISPER,
	func = function(name) ChatFrame_SendTell(name); end,
	--show = NoSelfShow,
};

FriendsMenuXP_Buttons["INVITE"] = {
	text = PARTY_INVITE,
	func = function(name) InviteUnit(name); end,
	show = NoSelfShow,
};

FriendsMenuXP_Buttons["TARGET"] = {
	text = TARGET,
	isSecure = 1,
	attributes = "type: macro;    macrotext: /targetexact $name$",
	func = function(name)
		if(UnitName("target")~=name) then 
			DEFAULT_CHAT_FRAME:AddMessage(string.gsub(FRIENDS_MENU_XP_CANNOT_TARGET, "%$name%$", name), 1,1,0); 
		end
	end,
};

FriendsMenuXP_Buttons["IGNORE"] = {
	text = IGNORE,
	func = function(name) AddOrDelIgnore(name); end,
	--show = NoSelfShow,
};

FriendsMenuXP_Buttons["REPORT_SPAM"] = {
	text = REPORT_SPAM
	,
	func = function(name, flags) 
		local dialog = StaticPopup_Show("CONFIRM_REPORT_SPAM_CHAT", name);
		if ( dialog ) then
			dialog.data = flags.lineID;
		end
	end
	,
	show = function(name, flags) return flags.lineID and CanComplainChat(flags.lineID) end
	,
};

FriendsMenuXP_Buttons["SET_NOTE"] = {
	text = SET_NOTE
	,
	func = function(name, flags) 
		FriendsFrame.NotesID = name;
		StaticPopup_Show("SET_FRIENDNOTE", name);
		PlaySound("igCharacterInfoClose");
	end
	,
	show = function(name, flags) 
		return flags.friendsList and true or nil;
	end
	,
};

FriendsMenuXP_Buttons["POP_OUT_CHAT"] = {
	text = MOVE_TO_WHISPER_WINDOW
	,
	func = function(name, flags) 
		FCF_OpenTemporaryWindow(flags.chatType, name, flags.chatFrame, true);
	end
	,
	show = function(name, flags) 
		if ( (flags.chatType ~= "WHISPER" and flags.chatType ~= "BN_WHISPER") or name == UnitName("player") or
			FCFManager_GetNumDedicatedFrames(flags.chatType, name) > 0 ) then
			return nil;
		end
		return true;
	end
	,
};

FriendsMenuXP_Buttons["REMOVE_FRIEND"] = {
	text = REMOVE_FRIEND
	,
	func = function(name, flags) 
		RemoveFriend(name);
	end
	,
	show = function(name, flags) 
		return flags.friendsList;
	end
	,
};


FriendsMenuXP_Buttons["CANCEL"] = {
	text = CANCEL,
};

FriendsMenuXP_Buttons["ADD_FRIEND"] = {
	text = FMXP_BUTTON_ADD_FRIEND
	,
	func = function (name) AddFriend(name); end
	,
	show = function(name)
		if(name == UnitName("player")) then return end;
		for i = 1, GetNumFriends() do
			if(name == GetFriendInfo(i)) then
				return nil;
			end
		end
		return 1;
	end
	,
}

FriendsMenuXP_Buttons["GUILD_LEAVE"] = {
	text = FMXP_BUTTON_GUILD_LEAVE
	,
	func = function (name) StaticPopup_Show("CONFIRM_GUILD_LEAVE", GetGuildInfo("player")); end
	,
	show = function(name)
		if(name ~= UnitName("player") or not GuildFrame:IsShown()) then return end;
		return 1;
	end
	,
}

FriendsMenuXP_Buttons["GUILD_PROMOTE"] = {
	text = FMXP_BUTTON_GUILD_PROMOTE
	,
	func = function (name) local dialog = StaticPopup_Show("CONFIRM_GUILD_PROMOTE", name); dialog.data = name; end
	,
	show = function(name)
		if ( not IsGuildLeader() or not UnitIsInMyGuild(name) or name == UnitName("player") or not GuildFrame:IsShown() ) then return end;
		return 1;
	end
	,
}

FriendsMenuXP_Buttons["PVP_REPORT_AFK"] = {
	text = FMXP_BUTTON_PVP_REPORT_AFK
	,
	func = function (name) ReportPlayerIsPVPAFK(name); end
	,
	show = function(name)
		if ( UnitInBattleground("player") == 0 or GetCVar("enablePVPNotifyAFK") == "0" ) then
			return;
		else
			if ( name == UnitName("player") ) then
				return;
			elseif ( not UnitInBattleground(name) ) then
				return;
			end
		end
		return 1;
	end
	,
}

FriendsMenuXP_Buttons["SET_FOCUS"] = {
	text = FMXP_BUTTON_SET_FOCUS,
	isSecure = 1,
	attributes = "type1:macro;macrotext1:/focus $name$"	,
	
}
--[[
FriendsMenuXP_Buttons["CLEAR_FOCUS"] = {
	text = TMXP_BUTTON_CLEAR_FOCUS,
	isSecure = 1,
	attributes = "type1:macro;macrotext1:/clearfocus",
	show = function(name, flags) return (name == UnitName("focus")) end ,
}
]]
FriendsMenuXP_Buttons["PROMOTE"] = {
	text = FMXP_BUTTON_PROMOTE
	,
	func = function (name) PromoteToLeader(name, 1); end
	,
	show = function (name) 
		if ( ((GetNumPartyMembers() > 0 and UnitInParty(name)) or (GetNumRaidMembers() > 0 and UnitInRaid(name))) and IsPartyLeader()) then
			return 1
		end
	end
	,
}

FriendsMenuXP_Buttons["LOOT_PROMOTE"] = {
	text = FMXP_BUTTON_LOOT_PROMOTE
	,
	func = function (name) SetLootMethod("master", name, 1); end
	,
	show = function (name) 
		if ( ((GetNumPartyMembers() > 0 and UnitInParty(name)) or (GetNumRaidMembers() > 0 and UnitInRaid(name))) and IsPartyLeader()) then
			return 1
		end
	end
	,
}

FriendsMenuXP_Buttons["ACHIEVEMENTS"] = {
	text = FMXP_BUTTON_ACHIEVEMENTS
	,
	func = function (name) InspectAchievements(name); end
	,
}

FriendsMenuXP_Buttons["SEND_WHO"] = {
	text = FMXP_BUTTON_SEND_WHO,
	func = function (name) SendWho("n-"..name); end,
}

FriendsMenuXP_Buttons["ADD_GUILD"] = {
	text = FMXP_BUTTON_ADD_GUILD,
	func = function (name) GuildInvite(name); end,
	show = function (name) return name~=UnitName("player") and CanGuildInvite() end,
}

FriendsMenuXP_Buttons["GET_NAME"] = {
	text = FMXP_BUTTON_GET_NAME
	,
	func = function (name) 
		if ( SELECTED_CHAT_FRAME.editBox:IsVisible() ) then
			SELECTED_CHAT_FRAME.editBox:Insert(name);
		elseif( SendMailNameEditBox and SendMailNameEditBox:IsVisible() ) then
			SendMailNameEditBox:Insert(name);
		elseif( CT_MailNameEditBox and CT_MailNameEditBox:IsVisible() ) then
			CT_MailNameEditBox:Insert(name);
		else
			DEFAULT_CHAT_FRAME.editBox:Hide();
			DEFAULT_CHAT_FRAME.editBox.chatType = "SAY";
			ChatEdit_UpdateHeader(DEFAULT_CHAT_FRAME.editBox);
			if (not DEFAULT_CHAT_FRAME.editBox:IsVisible()) then
				ChatFrame_OpenChat(DEFAULT_CHAT_FRAME.editBox:GetText()..name, DEFAULT_CHAT_FRAME);
			end
		end
	end
	,
}

FriendsMenuXP_Buttons["TRADE"] = {
	text = FMXP_BUTTON_TRADE,
	isSecure = 1,
	attributes = "type:macro;macrotext:/targetexact $name$",
	func = function (name) InitiateTrade("target"); end,
}

--智力
FriendsMenuXP_Buttons["SPELL_MAGE_INTELLECT"] = {
	text = FMXP_SPELL_MAGE_INTELLECT,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_MAGE_INTELLECT.."\nRightClick: "..FMXP_SPELL_MAGE_INTELLECT_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Holy_MagicalSentry",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_MAGE_INTELLECT.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_MAGE_INTELLECT_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "MAGE") then return 1 end end ,
};

--耐力
FriendsMenuXP_Buttons["SPELL_PRIEST_FORTITUDE"] = {
	text = FMXP_SPELL_PRIEST_FORTITUDE,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_PRIEST_FORTITUDE.."\nRightClick: "..FMXP_SPELL_PRIEST_FORTITUDE_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Holy_WordFortitude",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_PRIEST_FORTITUDE.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_PRIEST_FORTITUDE_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "PRIEST") then return 1 end end ,
};

--精神
FriendsMenuXP_Buttons["SPELL_PRIEST_SPIRIT"] = {
	text = FMXP_SPELL_PRIEST_SPIRIT,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_PRIEST_SPIRIT.."\nRightClick: "..FMXP_SPELL_PRIEST_SPIRIT_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Holy_DivineSpirit",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_PRIEST_SPIRIT.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_PRIEST_SPIRIT_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "PRIEST") then return 1 end end ,
};

--防护暗影
FriendsMenuXP_Buttons["SPELL_PRIEST_SHADOW"] = {
	text = FMXP_SPELL_PRIEST_SHADOW,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_PRIEST_SHADOW.."\nRightClick: "..FMXP_SPELL_PRIEST_SHADOW_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Shadow_AntiShadow",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_PRIEST_SHADOW.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_PRIEST_SHADOW_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "PRIEST") then return 1 end end ,
};

--爪子
FriendsMenuXP_Buttons["SPELL_DRUID_MILD"] = {
	text = FMXP_SPELL_DRUID_MILD,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_DRUID_MILD.."\nRightClick: "..FMXP_SPELL_DRUID_MILD_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Nature_Regeneration",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_DRUID_MILD.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_DRUID_MILD_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "DRUID") then return 1 end end ,
};

--拉人
FriendsMenuXP_Buttons["SPELL_WL_SUMMON"] = {
	text = FMXP_SPELL_WL_SUMMON,
	textHeight = 12,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Shadow_Twilight",
	attributes = "type:macro;macrotext:/targetexact $name$\n/cast "..FMXP_SPELL_WL_SUMMON.."",
	show = function() local _, class = UnitClass("player"); if(class == "WARLOCK") then return 1 end end ,
};

--骑士祝福
FriendsMenuXP_Buttons["SPELL_PAL_WISDOM"] = {
	text = FMXP_SPELL_PAL_WISDOM,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_PAL_WISDOM.."\nRightClick: "..FMXP_SPELL_PAL_WISDOM_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofWisdom",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_WISDOM.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_WISDOM_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "PALADIN") then return 1 end end ,
};

FriendsMenuXP_Buttons["SPELL_PAL_MIGHT"] = {
	text = FMXP_SPELL_PAL_MIGHT,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_PAL_MIGHT.."\nRightClick: "..FMXP_SPELL_PAL_MIGHT_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofKings",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_MIGHT.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_MIGHT_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "PALADIN") then return 1 end end ,
};

FriendsMenuXP_Buttons["SPELL_PAL_SALV"] = {
	text = FMXP_SPELL_PAL_SALV,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_PAL_SALV.."\nRightClick: "..FMXP_SPELL_PAL_SALV_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSalvation",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_SALV.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_SALV_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "PALADIN") then return 1 end end ,
};

FriendsMenuXP_Buttons["SPELL_PAL_LIGHT"] = {
	text = FMXP_SPELL_PAL_LIGHT,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_PAL_LIGHT.."\nRightClick: "..FMXP_SPELL_PAL_LIGHT_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofLight",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_LIGHT.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_LIGHT_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "PALADIN") then return 1 end end ,
};

FriendsMenuXP_Buttons["SPELL_PAL_KINGS"] = {
	text = FMXP_SPELL_PAL_KINGS,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_PAL_KINGS.."\nRightClick: "..FMXP_SPELL_PAL_KINGS_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Magic_GreaterBlessingofKings",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_KINGS.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_KINGS_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "PALADIN") then return 1 end end ,
};

FriendsMenuXP_Buttons["SPELL_PAL_SANCT"] = {
	text = FMXP_SPELL_PAL_SANCT,
	textHeight = 12,
	tooltipText = "LeftClick: "..FMXP_SPELL_PAL_SANCT.."\nRightClick: "..FMXP_SPELL_PAL_SANCT_X,
	justifyH = "CENTER",
	isSecure = 1,
	icon = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSanctuary",
	attributes = "type1:macro;macrotext1:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_SANCT.."\n/targetlasttarget;type2:macro;macrotext2:/targetexact $name$\n/cast "..FMXP_SPELL_PAL_SANCT_X.."\n/targetlasttarget",
	show = function() local _, class = UnitClass("player"); if(class == "PALADIN") then return 1 end end ,
};

FriendsMenuXP_Buttons["DKPTABLE"] = {
	text = "查询DKP",
	func = function(name) DKPT_AddFilter(name); end,
	show = function() if(DKPT_Main_Frame) then return 1 end end,
};

FriendsMenuXP_Buttons["OPENNOTE"] = {
	text = "注释",
	func = function(name) PlayerNotes:OpenNote(name); end,
	show = function() if(PlayerNotes) then return 1 end end,
};

FriendsMenuXP_ButtonSet = {};
FriendsMenuXP_ButtonSet["NORMAL"] = { 
	"WHISPER", 
	"POP_OUT_CHAT",
	"OPENNOTE",
	"INVITE", 
	"TARGET", 
	"IGNORE", 
	"PROMOTE",
	"LOOT_PROMOTE",
	"REPORT_SPAM", 
	"ADD_FRIEND", 
	"REMOVE_FRIEND",
	"SET_NOTE",
	"SEND_WHO", 
	"ADD_GUILD", 	
	"GUILD_LEAVE",
	"GUILD_PROMOTE",
	"PVP_REPORT_AFK",
	"SET_FOCUS",	
	"GET_NAME", 
	"TRADE", 
	"ACHIEVEMENTS",
	"SPELL_MAGE_INTELLECT", 
	"SPELL_PRIEST_FORTITUDE", 
	"SPELL_PRIEST_SPIRIT", 
	"SPELL_PRIEST_SHADOW", 
	"SPELL_DRUID_MILD", 
	"SPELL_WL_SUMMON", 
	"SPELL_PAL_WISDOM", 
	"SPELL_PAL_MIGHT", 
	--"SPELL_PAL_SALV", 
	--"SPELL_PAL_LIGHT", 
	"SPELL_PAL_KINGS", 
	"SPELL_PAL_SANCT", 
	"DKPTABLE", 
	"CANCEL", 
}

FriendsMenuXP_ButtonSet["RAID"] = { 
	"WHISPER", 
	"OPENNOTE",
	"TARGET", 
	"SEND_WHO", 
	"GET_NAME", 
	"TRADE", 
	"PROMOTE",
	"LOOT_PROMOTE",
	"ACHIEVEMENTS",
	"SPELL_MAGE_INTELLECT", 
	"SPELL_PRIEST_FORTITUDE", 
	"SPELL_PRIEST_SPIRIT", 
	"SPELL_PRIEST_SHADOW", 
	"SPELL_DRUID_MILD", 
	"SPELL_WL_SUMMON", 
	"SPELL_PAL_WISDOM", 
	"SPELL_PAL_MIGHT", 
	--"SPELL_PAL_SALV", 
	--"SPELL_PAL_LIGHT", 
	"SPELL_PAL_KINGS", 
	"SPELL_PAL_SANCT", 
	"DKPTABLE", 
	"CANCEL", 
}