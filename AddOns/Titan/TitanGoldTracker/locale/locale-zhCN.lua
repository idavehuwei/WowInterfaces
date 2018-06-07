﻿local L = LibStub("AceLocale-3.0"):NewLocale("Titan_GoldTracker","zhCN")
if not L then return end

  L["TITAN_GOLDTRACKER_TOOLTIPTEXT"] = "统计所持有金币信息";
  L["TITAN_GOLDTRACKER_ITEMNAME"] = "金币助手";
  L["TITAN_GOLDTRACKER_CLEAR_DATA_TEXT"] = "清除已存数据";
  L["TITAN_GOLDTRACKER_RESET_SESS_TEXT"] = "重置现有周期";
  L["TITAN_GOLDTRACKER_DB_CLEARED"] = "Titan金币查看助手 - 数据已清除.";
  L["TITAN_GOLDTRACKER_SESSION_RESET"] = "Titan金币查看助手 - 周期已重置.";
  L["TITAN_GOLDTRACKER_MENU_TEXT"] = "金币助手";
  L["TITAN_GOLDTRACKER_TOOLTIP"] = "金币信息";
  L["TITAN_GOLDTRACKER_TOGGLE_PLAYER_TEXT"] = "显示玩家金币";
  L["TITAN_GOLDTRACKER_TOGGLE_ALL_TEXT"] = "显示所有角色金币";
  L["TITAN_GOLDTRACKER_SESS_EARNED"] = "这个周期所赚金币";
  L["TITAN_GOLDTRACKER_PERHOUR_EARNED"] = "每小时所赚金币";
  L["TITAN_GOLDTRACKER_SESS_LOST"] = "这个周期所花费金币";
  L["TITAN_GOLDTRACKER_PERHOUR_LOST"] = "每小时花费金币";
  L["TITAN_GOLDTRACKER_STATS_TITLE"] = "周期统计";
  L["TITAN_GOLDTRACKER_TTL_GOLD"] = "总金币";
  L["TITAN_GOLDTRACKER_START_GOLD"] = "起始金币数";
  L["TITAN_GOLDTRACKER_TOGGLE_SORT_GOLD"] = "按金币数排列";
  L["TITAN_GOLDTRACKER_TOGGLE_SORT_NAME"] = "按角色名排列";
  L["TITAN_GOLDTRACKER_TOGGLE_GPH_SHOW"] = "显示每小时金币进出";
  L["TITAN_GOLDTRACKER_TOGGLE_GPH_HIDE"] = "隐藏每小时金币进出";

  L["TITAN_GOLDTRACKER_TOGGLE_PLAYER_SHOW"] = "显示这个角色";
  L["TITAN_GOLDTRACKER_TOGGLE_PLAYER_HIDE"] = "隐藏这个角色";
  L["TITAN_GOLDTRACKER_STATUS_PLAYER_SHOW"] = "显示";
  L["TITAN_GOLDTRACKER_STATUS_PLAYER_HIDE"] = "隐藏";
  L["TITAN_GOLDTRACKER_DELETE_PLAYER"] = "删除这个角色";
  L["TITAN_GOLDTRACKER_FACTION_PLAYER_ALLY"] = "联盟";
  L["TITAN_GOLDTRACKER_FACTION_PLAYER_HORDE"] = "部落";
  L["TITAN_GOLDTRACKER_CLEAR_DATA_WARNING"] = GREEN_FONT_COLOR_CODE.."Warning: "..FONT_COLOR_CODE_CLOSE.."This setting will wipe your Gold Tracker database. If you wish to continue with this operation, push 'Accept', otherwise push 'Cancel' or the 'Escape' key.";