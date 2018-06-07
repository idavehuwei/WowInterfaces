------------------------------------------------------------------------------------------
-- DCT_Duowan ver 1.0
-- 日期: 2010-4-8
-- 作者: dugu
-- 描述: 为DCT的特效提示增加缺省法术配置
-- 版权所有 (c) Dennie ^_^
------------------------------------------------------------------------------------------
----
--[[
local _, EN_CLASS = UnitClass("player");
local default_spells = {};
-- 死亡骑士
default_spells["DEATHKNIGHT"] = {};
default_spells["DEATHKNIGHT"][1] = 51124;	-- 杀戮机器
default_spells["DEATHKNIGHT"][2] = 59052;	-- 冰冻之雾
default_spells["DEATHKNIGHT"][3] = 53386;	-- 灰烬冰川

-- 德鲁伊
default_spells["DRUID"] = {};
default_spells["DRUID"][1] = 48517;		-- 月蚀
default_spells["DRUID"][2] = 16886;		-- 自然之赐
default_spells["DRUID"][3] = 16870;		-- 节能施法
default_spells["DRUID"][4] = 48391;		-- 枭兽狂乱
default_spells["DRUID"][5] = 46833;		-- 艾露恩之怒
default_spells["DRUID"][6] = 64823;		-- 艾露恩之怒

-- 猎人
default_spells["HUNTER"] = {};
default_spells["HUNTER"][1] = 53220;	-- 强化稳固射击
default_spells["HUNTER"][2] = 56453;	-- 荷枪实弹
default_spells["HUNTER"][3] = 35098;	-- 疾速杀戮

-- 法师
default_spells["MAGE"] = {};
default_spells["MAGE"][1] = 12536;		-- 节能施法
default_spells["MAGE"][2] = 57761;		-- 火球
default_spells["MAGE"][3] = 44544;		-- 寒冰指
default_spells["MAGE"][4] = 54741;		-- 一触即燃
default_spells["MAGE"][5] = 48108;		-- 法术连击
default_spells["MAGE"][6] = 44401;		-- 飞弹速射

-- 圣骑士
default_spells["PALADIN"] = {};
default_spells["PALADIN"][1] = 53489;	-- 战争艺术
default_spells["PALADIN"][2] = 53672;	-- 圣光灌注
default_spells["PALADIN"][3] = 58597;	-- 圣洁护盾

-- 牧师
default_spells["PRIEST"] = {};
default_spells["PRIEST"][1] = 59887;		-- 争分夺秒
default_spells["PRIEST"][2] = 34754;		-- 神圣专注
default_spells["PRIEST"][3] = 14743;		-- 专注施法
default_spells["PRIEST"][4] = 63731;		-- 好运
default_spells["PRIEST"][5] = 33151;		-- 圣光涌动

-- 盗贼
default_spells["ROGUE"] = {};
-- 萨满
default_spells["SHAMAN"] = {};
default_spells["SHAMAN"][1] = 16246;		-- 节能施法
default_spells["SHAMAN"][2] = 53817;		-- 漩涡武器
default_spells["SHAMAN"][3] = 53390;		-- 波涛汹涌

-- 术士
default_spells["WARLOCK"] = {};
default_spells["WARLOCK"][1] = 54274;		-- 爆燃
default_spells["WARLOCK"][2] = 34936;		-- 反冲
default_spells["WARLOCK"][3] = 63165;		-- 灭杀
default_spells["WARLOCK"][4] = 47283;		-- 小鬼增效
default_spells["WARLOCK"][5] = 64368;		-- 根除
default_spells["WARLOCK"][6] = 47383;		-- 熔火之心
default_spells["WARLOCK"][7] = 17941;		-- 暗影冥思
default_spells["WARLOCK"][8] = 63321;		-- 生命分流

-- 战士
default_spells["WARRIOR"] = {};
default_spells["WARRIOR"][1] = 46916;		-- 爆燃
default_spells["WARRIOR"][2] = 52437;		-- 反冲
default_spells["WARRIOR"][3] = 50227;		-- 灭杀
default_spells["WARRIOR"][4] = 60503;		-- 小鬼增效
default_spells["WARRIOR"][5] = 58363;		-- 根除
]]
function DCT_UpdateSpecSpells()
	--[[
	local name, spells = nil, {}; 
	if (#(default_spells[EN_CLASS]) > 0) then
		for i, spellID in ipairs(default_spells[EN_CLASS]) do
			name = GetSpellInfo(spellID);			
			spells[name] = 1;
		end
	end

	DCT_Merge(DCT_DEFAULT_CFG["DCT_SPECBUFF"], spells);
	]]
end
