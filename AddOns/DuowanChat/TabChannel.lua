-------------------------------------------------------------------------------
-- TabChannel ver.1.0
-- 日期: 2010-11-23
-- 作者: 独孤傲雪
-- 描述: 使用Tab键在说、队友、团队、战场、公会频道间便捷的切换
-- 版权所有 (c) duowan.com
-------------------------------------------------------------------------------

local function dw_ChatEdit_CustomTabPressed(self)
	if  (self:GetAttribute("chatType") == "SAY")  then
		if (GetNumPartyMembers()>0) then
			self:SetAttribute("chatType", "PARTY");
			ChatEdit_UpdateHeader(self);
		elseif (GetNumRaidMembers()>0) then
			self:SetAttribute("chatType", "RAID");
			ChatEdit_UpdateHeader(self);
		elseif (GetNumBattlefieldScores()>0) then
			self:SetAttribute("chatType", "BATTLEGROUND");
			ChatEdit_UpdateHeader(self);
		elseif (IsInGuild()) then
			self:SetAttribute("chatType", "GUILD");
			ChatEdit_UpdateHeader(self);
		else
			return;
		end
	elseif (self:GetAttribute("chatType") == "PARTY") then
		if (GetNumRaidMembers()>0) then
			self:SetAttribute("chatType", "RAID");
			ChatEdit_UpdateHeader(self);
		elseif (GetNumBattlefieldScores()>0) then
			self:SetAttribute("chatType", "BATTLEGROUND");
			ChatEdit_UpdateHeader(self);
		elseif (IsInGuild()) then
			self:SetAttribute("chatType", "GUILD");
			ChatEdit_UpdateHeader(self);
		else
			self:SetAttribute("chatType", "SAY");
			ChatEdit_UpdateHeader(self);
		end			
	elseif (self:GetAttribute("chatType") == "RAID") then
		if (GetNumBattlefieldScores()>0) then
			self:SetAttribute("chatType", "BATTLEGROUND");
			ChatEdit_UpdateHeader(self);
		elseif (IsInGuild()) then
			self:SetAttribute("chatType", "GUILD");
			ChatEdit_UpdateHeader(self);
		else
			self:SetAttribute("chatType", "SAY");
			ChatEdit_UpdateHeader(self);
		end
	elseif (self:GetAttribute("chatType") == "BATTLEGROUND") then
		if (IsInGuild) then
			self:SetAttribute("chatType", "GUILD");
			ChatEdit_UpdateHeader(self);
		else
			self:SetAttribute("chatType", "SAY");
			ChatEdit_UpdateHeader(self);
		end
	elseif (self:GetAttribute("chatType") == "GUILD") then
		self:SetAttribute("chatType", "SAY");
		ChatEdit_UpdateHeader(self);
	end
end

--hooksecurefunc("ChatEdit_CustomTabPressed", dw_ChatEdit_CustomTabPressed);
hooksecurefunc("ChatEdit_OnTabPressed", dw_ChatEdit_CustomTabPressed);
