
local DuowanSpells = {};
local DuowanSpell_Events = {};
local DuowanSpell_Enabled = nil;

if (GetLocale() == "zhCN") then
	DUOWAN_SPELL_RANK_MATCH_PATTERN = "等级 (%d+)";
	DUOWAN_SPELL_INSTANT_PATTERN = "<n>瞬发";
elseif (GetLocale() == "zhTW") then
	DUOWAN_SPELL_RANK_MATCH_PATTERN = "等級 (%d+)";
	DUOWAN_SPELL_INSTANT_PATTERN = "<n>立即施法";
else
	DUOWAN_SPELL_RANK_MATCH_PATTERN = "Rank (%d+)";
	DUOWAN_SPELL_INSTANT_PATTERN = "<n>Instant cast";
end

------------------------------------------------------------------
-- 获得法术的唯一ID
------------------------------------------------------------------
function DuowanSpells_GetSpellID(spell, rank)
	if (rank and rank ~= "") then
		return spell .. "(" ..rank .. ")";
	else
		return spell;
	end
end

local Tooltip = CreateFrame("GameTooltip", "DuowanTooltip", UIParent, "GameTooltipTemplate");
Tooltip:SetOwner(UIParent, "ANCHOR_NONE");
Tooltip:SetClampedToScreen(false);
Tooltip:SetPoint("TOPLEFT", "UIParent", "BOTTOMRIGHT", 5, -5);

function Duowan_GetTooltipText(tooltip, newlinechar)	
	local tooltip = tooltip or Tooltip;
	local newlinechar = newlinechar or "<n>";
	
	local strDesc = "";
	local index = 1;
	while (true) do
		local TextLeft = dwGetglobal(tooltip:GetName() .. "TextLeft" .. index);
		local TextRight = dwGetglobal(tooltip:GetName() .. "TextRight" .. index);
		local strLeft, strRight, strful;
		strLeft = TextLeft and TextLeft:GetText();
		strRight = TextRight and TextRight:GetText();
		
		strLeft = strLeft and strLeft or "";
		strRight = strRight and strRight or "";
		strful = strLeft .. strRight;

		if (strful ~= "") then
			strDesc = strDesc .. strLeft;
			if (strRight ~= "") then
				strDesc = strDesc .. "<t>" .. strRight;
			end
			strDesc = strDesc .. newlinechar;
		end
		if (not TextLeft) then
			break;
		else
			index = index + 1;
		end
	end

	return strDesc;
end

function DuowanSpells_TakeSnapshot()
	DuowanSpell_Enabled = nil;
	local numSkillLineTabs = GetNumSpellTabs();
	local name, texture, offset, numSpells;
	local skillLineTab;

	table.wipe(DuowanSpells);

	for i = 1, MAX_SKILLLINE_TABS do
		if (i <= numSkillLineTabs) then
			tab, texture, offset, numSpells = GetSpellTabInfo(i);

			for j = 1, numSpells do
				local texture = GetSpellTexture(offset + j, BOOKTYPE_SPELL);
				local spellName, rank = GetSpellName(offset + j, BOOKTYPE_SPELL);
				local isPassive = IsPassiveSpell(offset + j, BOOKTYPE_SPELL);
				local start, duration, enable = GetSpellCooldown(offset + j, BOOKTYPE_SPELL);
				rank = rank and strmatch(rank, "(%d+)");
				
				DuowanTooltip:SetSpell(offset + j, BOOKTYPE_SPELL);
				local text = Duowan_GetTooltipText(DuowanTooltip);
				local id = DuowanSpells_GetSpellID(spellName, rank);

				DuowanSpells[id] = {};
				DuowanSpells[id]["name"] = spellName;
				DuowanSpells[id]["rank"] = rank;
				DuowanSpells[id]["category"] = tab;
				DuowanSpells[id]["texture"] = texture;
				DuowanSpells[id]["passive"] = isPassive;
				DuowanSpells[id]["id"] = offset + j;
				DuowanSpells[id]["type"] = BOOKTYPE_SPELL;					

				if (string.find(text, DUOWAN_SPELL_INSTANT_PATTERN)) then
					DuowanSpells[id]["instant"] = 1;
				end

				DuowanSpells[id]["description"] = text;				
			end
		end
	end
	DuowanSpell_Enabled = true;
end

function DuowanSpells_RefreshSpells()
	if (not DuowanSpell_Enabled) then
		return;
	end

	DuowanSpells_TakeSnapshot();
end

function DuowanSpells_IsReady()
	return DuowanSpell_Enabled;
end
------------------------------------------------------------------
-- 获得魔法的描述
-- 参数: name [输入] 魔法名称
--       rank [输入] 魔法等级 如果该值为空或者未知，那么返回最高等级魔法
-- 返回: 返回 ID，法术名称，法术级别，法术类别，贴图文件，描述，是否是被动技能，是否是瞬发法术
------------------------------------------------------------------
function DuowanSpell_GetSpellInfo(name, rank)
	if (not DuowanSpell_Enabled) then
		return;
	end

	if (not rank) then
		rank = DuowanSpell_GetSpellMaxRank(name);
	end

	if (not rank) then
		return;
	end

	local id = DuowanSpells_GetSpellID(name, rank);
	
	if (DuowanSpells[id]) then
		return DuowanSpells[id]["id"], DuowanSpells[id]["name"], DuowanSpells[id]["rank"], DuowanSpells[id]["category"], DuowanSpells[id]["type"], DuowanSpells[id]["texture"], DuowanSpells[id]["description"], DuowanSpells[id]["passive"], DuowanSpells[id]["instant"];
	end
end

------------------------------------------------------------------
-- 获得魔法的最高等级
------------------------------------------------------------------
function DuowanSpell_GetSpellMaxRank(name)
	local spellName, spellRank = GetSpellInfo(name);
	return spellRank or 1;
end