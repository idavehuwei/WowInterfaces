-------------------------------------------------------------------------------
-- Duowan Stat - ver 1.0
-- 日期: 2011-01-05
-- 作者: dugu@wowbox
-- 描述: 统计并发送玩家的属性, 便于组队
-- 版权所有(c)多玩游戏网
-------------------------------------------------------------------------------
local DWChat = LibStub('AceAddon-3.0'):GetAddon('DuowanChat');
local L = LibStub("AceLocale-3.0"):GetLocale("DuowanChat", true); 
local MODNAME = "DUOWANSTAT";
DuowanStat = DWChat:NewModule(MODNAME, "AceEvent-3.0");
local D = DuowanStat;
--品质折算系数
local qualitypara = {
	[0] = 0.0,			--0：灰色
	[1] = 0.1,			--1：白色
	[2] = 0.6,			--2：绿色
	[3] = 0.8,			--3：蓝色
	[4] = 1.0,			--4：紫色
	[5] = 1.05,		--5：橙色
	[6] = 1.15,		--6：红色
	[7] = 1.0,			--7：金色
};

--装备级别加权系数默认值：法系
local slotpara = {
	[1] = 3.5,			--1：头
	[2] = 2,			--2：颈
	[3] = 2.5,			--3：肩
	[4] = 0,			--4：衬衣
	[5] = 3.7,			--5：胸
	[6] = 2.3,			--6：腰带
	[7] = 3.5,			--7：腿
	[8] = 2.4,			--8：脚
	[9] = 1.6,			--9：手腕
	[10]	= 2.5,		--10：手套
	[11]	= 2.1,		--11：手指1
	[12]	= 2.1,		--12：手指2
	[13]	= 2,			--13：饰品1
	[14]	= 2,			--14：饰品2
	[15]	= 1.8,		--15：背
	[16]	= 6,			--16：主手
	[17]	= 2,			--17：副手
	[18]	= 1,			--18：远程武器
	[19]	= 0,			--19：战袍
};

function D:OnInitialize()
	self.data = {};
end

function D:OnEnable()
	
end

function D:OnDisable()
	
end

-- DOTO: 更新属性数据
function D:UpdateStat()
	self.data = {};

	self.data["CLASS"], self.data["CLASS_EN"] = UnitClass("player");
	self.data["LV"] = UnitLevel("player");
	self.data["HP"] = UnitHealthMax("player");
	self.data["MP"] = UnitManaMax("player");
	self.data["TALENT"] = self:GetTalent(); 
	self.data["ILV"] = self:GetINVLevel();
	self.data["GS"] = self:GetGS();
	
	--基础属性
	self.data["STR"] = UnitStat("player", 1);					--力量
	self.data["AGI"] = UnitStat("player", 2);					--敏捷
	self.data["STA"] = UnitStat("player", 3);					--耐力
	self.data["INT"] = UnitStat("player", 4);					--智力
	self.data["SPI"] = UnitStat("player", 5);					--精神
	--近战
	self.data["MAP"] = self:UnitAttackPower();					--强度
	self.data["MHIT"] = GetCombatRating(6);					--命中等级
	self.data["MCRIT"] = GetCritChance();					--爆击率%
	self.data["MEXPER"] = GetExpertise();					--精准
	--远程
	self.data["RAP"] = self:UnitRangedAttackPower();			--强度
	self.data["RHIT"] = GetCombatRating(7);					--命中等级
	self.data["RCRIT"] = GetRangedCritChance();				--爆击率%
	self.data["MRPEN"] = GetArmorPenetration();				--护甲穿透%
	--法术
	self.data["SSP"] = self:GetSpellBonusDamage();				--伤害加成
	self.data["SHP"] = GetSpellBonusHealing();					--治疗加成
	self.data["SHIT"] = GetCombatRating(8);					--命中等级
	self.data["SCRIT"] = self:GetSpellCritChance();				--爆击率
	self.data["SHASTE"] = GetCombatRating(20);				--急速等级
	self.data["SMR"] = floor(GetManaRegen()*5);				--法力回复（每5秒）
	self.data["SPEN"] = GetSpellPenetration();					--法术穿透

	--防御
	_,_,self.data["ARMOR"] = UnitArmor("player");				--护甲
	self.data["DEF"] = self:GetUnitDefense();					--防御
	self.data["DODGE"] = GetDodgeChance();					--躲闪%
	self.data["PARRY"] = GetParryChance();					--招架%
	self.data["BLOCK"] = GetBlockChance();					--格挡%
	self.data["CRDEF"] = GetCombatRating(15);				--韧性

	if self.data["CRDEF"] > (200*(self.data["LV"]/70)) then		--是否为PvP属性
		self.data["PvPSET"] = true;
	else
		self.data["PvPSET"] = false;
	end
end

function D:GenerateStatText(detail)
	self:UpdateStat();
	local text = L["HEAD"];
	-- 简约
	text = text .. self.data["CLASS"];
	text = text .. " GS=" .. self.data["GS"];
	if (self.data["TALENT"]) then
		text = text .. "，" .. self.data["TALENT"];
	end	
	text = text .. ("，%s:%d"):format(L["ILV"], self.data["ILV"]);
	if (detail) then
		local talentName = self:GetMainTalentName();
		if (UnitPowerType("player") == 0) then
			text = text..("，%d%s，%d%s"):format(self.data["HP"], L["HP"], self.data["MP"], L["MP"]);
		else
			text = text..("，%d%s"):format(self.data["HP"], L["HP"]);
		end
		if self.data["CLASS_EN"] == "MAGE" or self.data["CLASS_EN"] == "WARLOCK" then
			text = text..self:GetSpellText();
		end
		if self.data["CLASS_EN"] == "ROGUE" then
			text = text..self:GetMeleeText();
		end
		if self.data["CLASS_EN"] == "HUNTER" then
			text = text..self:GetRangedText();
		end
		if self.data["CLASS_EN"] == "DRUID" then
			if talentName == GetTalentTabInfo(1) then
				text = text..self:GetSpellText();
			elseif talentName == GetTalentTabInfo(2) then
				if self.data["DODGE"] > 30 then
					text = text..self:GetTankText();
				else
					text = text..self:GetMeleeText();
				end
			elseif talentName == GetTalentTabInfo(3) then
				text = text..self:GetHealText();
			else
				text = text..self:GetMeleeText();
			end
		end
		if self.data["CLASS_EN"] == "SHAMAN" then
			if talentName == GetTalentTabInfo(1) then
				text = text..self:GetSpellText();
			elseif talentName == GetTalentTabInfo(2) then
				text = text..self:GetMeleeText();
			elseif talentName == GetTalentTabInfo(3) then
				text = text..self:GetHealText();
			else
				text = text..self:GetMeleeText();
			end
		end
		if self.data["CLASS_EN"] == "PALADIN" then
			if talentName == GetTalentTabInfo(1) then
				text = text..self:GetHealText();
			elseif talentName == GetTalentTabInfo(2) then
				text = text..self:GetTankText();
			elseif talentName == GetTalentTabInfo(3) then
				text = text..self:GetMeleeText();
			else
				text = text..self:GetMeleeText();
			end
		end
		if self.data["CLASS_EN"] == "PRIEST" then
			if talentName == GetTalentTabInfo(1) then
				text = text..self:GetSpellAndHealText();
			elseif talentName == GetTalentTabInfo(2) then
				text = text..self:GetHealText();
			elseif talentName == GetTalentTabInfo(3) then
				text = text..self:GetSpellText();
			else
				text = text..self:GetSpellText();
			end
		end
		if self.data["CLASS_EN"] == "WARRIOR" then
			if talentName == GetTalentTabInfo(1) then
				text = text..self:GetMeleeText();
			elseif talentName == GetTalentTabInfo(2) then
				text = text..self:GetMeleeText();
			elseif talentName == GetTalentTabInfo(3) then
				text = text..self:GetTankText();
			else
				text = text..self:GetMeleeText();
			end
		end
		if self.data["CLASS_EN"] == "DEATHKNIGHT" then
			if (self.data["DODGE"] + self.data["PARRY"]) > 35 then
				text = text..self:GetTankText();
			else
				text = text..self:GetMeleeText();
			end
		end
	end

	return text;
end

function D:GetPvPSpecText()
	local text = "";
	
	if (self.data["PvPSET"]) then
		text = text..(", %d%s"):format(self.data["CRDEF"], L["CRDEF"]);
	end
	return text;
end

function D:GetSpellText()
	local text = "";
	text = text..self:GetPvPSpecText();
	text = text..("，%d%s"):format(self.data["SSP"], L["SSP"]);
	text = text..("，%d%s"):format(self.data["SHIT"], L["HIT"]);
	text = text..("，%.1f%%%s"):format(self.data["SCRIT"], L["CRIT"]);
	text = text..("，%d%s"):format(self.data["SHASTE"], L["HASTE"]);

	if self.data["PvPSET"] then
		text = text..("，%d%s"):format(self.data["SPEN"], L["SPEN"]);
	end
	return text;
end

function D:GetHealText()
	local text = "";
	text = text..self:GetPvPSpecText();
	text = text..("，%d%s"):format(self.data["SHP"], L["SHP"]);	
	text = text..("，%.1f%%%s"):format(self.data["SCRIT"], L["CRIT"]);
	text = text..("，%d%s"):format(self.data["SHASTE"], L["HASTE"]);
	text = text..("，%d/%s"):format(self.data["SMR"], L["SMR"]);
	return text;
end

function D:GetSpellAndHealText()
	local text = "";
	text = text..self:GetPvPSpecText();
	text = text..("，%d%s"):format(self.data["SSP"], L["SSP"]);	
	text = text..("，%d%s"):format(self.data["SHP"], L["SHP"]);	
	text = text..("，%d%s"):format(self.data["SHIT"], L["HIT"]);	
	text = text..("，%.1f%%%s"):format(self.data["SCRIT"], L["CRIT"]);
	text = text..("，%d%s"):format(self.data["SHASTE"], L["HASTE"]);
	text = text..("，%d/%s"):format(self.data["SMR"], L["SMR"]);

	if self.data["PvPSET"] then
		text = text..("，%d%s"):format(self.data["SPEN"], L["SPEN"]);
	end
	return text;
end

function D:GetMeleeText()
	local text = "";
	text = text..self:GetPvPSpecText();
	text = text..("，%d%s"):format(self.data["MAP"], L["AP"]);	
	text = text..("，%d%s"):format(self.data["MHIT"], L["HIT"]);	
	text = text..("，%.1f%%%s"):format(self.data["MCRIT"], L["CRIT"]);
	text = text..("，%d%s"):format(self.data["MEXPER"], L["EXPER"]);	
	text = text..("，%.1f%%%s"):format(self.data["MRPEN"], L["MRPEN"]);

	return text;
end

function D:GetRangedText()
	local text = "";
	text = text..self:GetPvPSpecText();
	text = text..("，%d%s"):format(self.data["RAP"], L["AP"]);
	text = text..("，%d%s"):format(self.data["RHIT"], L["HIT"]);
	text = text..("，%.1f%%%s"):format(self.data["RCRIT"], L["CRIT"]);
	text = text..("，%.1f%%%s"):format(self.data["MRPEN"], L["MRPEN"]);

	return text;
end

function D:GetTankText()
	local text = "";
	text = text..self:GetPvPSpecText();
	text = text..("，%d%s"):format(self.data["DEF"], L["DEF"]);
	text = text..("，%.1f%%%s"):format(self.data["DODGE"], L["DODGE"]);
	text = text..("，%.1f%%%s"):format(self.data["PARRY"], L["PARRY"]);
	text = text..("，%.1f%%%s"):format(self.data["BLOCK"], L["BLOCK"]);
	text = text..("，%d%s"):format(self.data["ARMOR"], L["ARMOR"]);

	return text;
end

function D:UnitTalent(names, points)
	local index = 1;

	if (points[3] > points[1] and points[3] > points[2]) then
		index = 3;
	elseif (points[2] > points[1]) then
		index = 2;
	end

	local point = ("(%d/%d/%d)"):format(points[1], points[2], points[3]);

	return names[index]..point;
end

function D:GetTalent()	
	local text;
	if (UnitLevel("player") >= 10) then	
		local TalentNum = GetNumTalentGroups(false);
		local activeTalent = GetActiveTalentGroup(false);
		local inactiveTalent = 0;
		if TalentNum >= 2 then			
			if activeTalent == 1 then inactiveTalent = 2;end
			if activeTalent == 2 then inactiveTalent = 1;end
		end
			
		-- 主天赋
		local names, points = {}, {};
		for i = 1, 3 do
			names[i], _, points[i] = GetTalentTabInfo(i, false, nil, activeTalent);
		end

		text = L["MTALENT"] .. self:UnitTalent(names, points);

		-- 副天赋
		if (inactiveTalent ~= 0) then
			for i = 1, 3 do
				names[i], _, points[i] = GetTalentTabInfo(i, false, nil, inactiveTalent);
			end

			local tmp = self:UnitTalent(names, points);
			text = text .. " " .. L["STALENT"] .. tmp;		
		end				

	end
	
	return text;
end

function D:GetMainTalentName()
	local name;
	if (UnitLevel("player") >= 10) then		
		local activeTalent = GetActiveTalentGroup(false);
		local names, points = {}, {};
		for i=1, 3 do
			names[i], _, points[i] = GetTalentTabInfo(i, false, nil, activeTalent);
		end
		local index = 1;
		if (points[3] > points[1] and points[3] > points[2]) then
			index = 3;
		elseif (points[2] > points[1]) then
			index = 2;
		end

		name = names[index];
	end

	return name;
end

function D:GetINVLevel()
	local _, classEN = UnitClass("player");
	local unitLV = UnitLevel("player");
	
	local talentName = self:GetMainTalentName();
	if classEN == "HUNTER" then
		slotpara[16] = 3;
		slotpara[17] = 1;
		slotpara[18] = 5;
	elseif classEN == "WARRIOR" then
		if talentName == GetTalentTabInfo(3) then
			slotpara[16] = 3.5;
			slotpara[17] = 4.5;
			slotpara[18] = 1;
		else
			slotpara[16] = 5;
			slotpara[17] = 3;
			slotpara[18] = 1;
		end
	elseif classEN == "ROGUE" or classEN == "DEATHKNIGHT" then
		slotpara[16] = 5;
		slotpara[17] = 3;
		slotpara[18] = 1;
	elseif classEN == "SHAMAN" then
		if talentName == GetTalentTabInfo(2) then
			slotpara[16] = 5;
			slotpara[17] = 3;
			slotpara[18] = 1;
		end
	elseif classEN == "PALADIN" then
		if talentName == GetTalentTabInfo(2) then
			slotpara[16] = 3.5;
			slotpara[17] = 4.5;
			slotpara[18] = 1;
		end
	end
	local quality, iLevel;
	local itemcount = 0;
	local levelcount = 0;
	local paracount = 0;

	for i=1, 18 ,1 do
		if i~=4 then
			local link = GetInventoryItemLink("player", i);
			if (link) then
				_, _, quality, iLevel = GetItemInfo(link);
				if(quality >=1 and quality <=7) then
					if (quality == 7) and (iLevel < unitLV*2) then
						if unitLV < 60 then
							iLevel = unitLV;
						else
							iLevel = 60 + (((unitLV-60)*(unitLV-60))/3);
						end
					end
					itemcount = itemcount + 1;
					levelcount = levelcount + iLevel*qualitypara[quality]*slotpara[i];
					paracount = paracount + slotpara[i];
				end
			end
		end
	end

	if (paracount > 0) then
		return floor((levelcount/paracount) + 0.5);
	else
		return levelcount;
	end	
end

function D:GetGS()
	local score = 0;
	if (GearScore_GetScore) then
		score = GearScore_GetScore(UnitName("player"), "player") or 0;
	end
	
	return score;
end

function D:UnitAttackPower()
	local base, posBuff, negBuff = UnitAttackPower("player");
	return floor(base + posBuff + negBuff);
end

function D:UnitRangedAttackPower()
	local base, posBuff, negBuff = UnitRangedAttackPower("player");
	return floor(base + posBuff + negBuff);
end

function D:GetSpellBonusDamage()
	local SSP = GetSpellBonusDamage(2);
	for i=3, 7 do
		SSP = max(SSP, GetSpellBonusDamage(i));
	end
	return floor(SSP);
end

function D:GetSpellCritChance()
	local SCRIT = GetSpellCritChance(2);
	for i=3, 7 do
		SCRIT = max(SCRIT, GetSpellCritChance(i));
	end
	return SCRIT;
end

function D:GetUnitDefense()
	local baseDEF, posDEF = UnitDefense("player");
	return floor(baseDEF + posDEF);
end


function D:InsertStat(detail)
	local text = self:GenerateStatText(detail);
	local chatFrame = --[[SELECTED_DOCK_FRAME or ]]DEFAULT_CHAT_FRAME;

	if ( not chatFrame.editBox:IsShown() ) then
		ChatFrame_OpenChat(text, chatFrame);
	else
		chatFrame.editBox:Insert(text);
	end
end

function D:ReplyStat(name)
	local chatFrame = --[[SELECTED_DOCK_FRAME or ]]DEFAULT_CHAT_FRAME;
	
	if ( name ~= "" ) then
		chatFrame.editBox:SetAttribute("chatType", "WHISPER");
		chatFrame.editBox:SetAttribute("tellTarget", name);
		ChatEdit_UpdateHeader(chatFrame.editBox);
		
		self:InsertStat();
	end
end

function DuowanStat_Toggle(switch)
	if (switch) then
		DWCReportStatButton:Show();
		DWCRandomButton:Show();
		DWCLFGButton:Show();
	else
		DWCReportStatButton:Hide();
		DWCRandomButton:Hide();
		DWCLFGButton:Hide();
	end
end