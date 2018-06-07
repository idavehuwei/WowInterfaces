------------------------------------------------------------------------------
-- ChatPopo ver 1.0
-- 日期: 2010-11-08
-- 作者: dugu
-- 描述: 队友聊天泡泡 (thanks to sharak)
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------

CHATPOPO_ANIM_INTERVAL = 0.01;
CHATPOPO_ANIM_FRAME_COUNT = 4;

CHATPOPO_KEEP_SOLID_TIME = 2;
CHATPOPO_FADING_TIME = 3;
CHATPOPO_HIDE_TIME = 2;

CHATPOPO_ENABLED = nil;
CHATPOPO_INRAID = nil;

if (GetLocale() == "zhCN") then
	CHAT_POPO_FONT = "Fonts\\ZYHei.TTF";
elseif (GetLocale() == "zhTW") then
	CHAT_POPO_FONT = "Fonts\\bHEI01B.TTF";
else
	CHAT_POPO_FONT = "Fonts\\ARIALN.TTF";
end

function ChatPopoFrame_OnLoad(self)
	_G[self:GetName().."Text"]:SetFont(CHAT_POPO_FONT, 11);
end

function ChatPopoFrame_OnUpdate(self, elapsed)
	-- 显示动画
	if ( self.showing ) then
		self.interval = self.interval + elapsed;
		if ( self.interval > CHATPOPO_ANIM_INTERVAL ) then
			self.interval = 0;
			self.showing = self.showing + 1;
			if ( self.showing > CHATPOPO_ANIM_FRAME_COUNT ) then
				local textOb = getglobal(self:GetName().."Text");
				local textureOb = getglobal(self:GetName().."Texture");
				textOb:SetText(self.text);
				textureOb:SetTexture("Interface\\Addons\\ChatPopo\\img\\bubble");
				self.showing = nil;
				self.solid = CHATPOPO_KEEP_SOLID_TIME;
				return;
			else
				local textOb = getglobal(self:GetName().."Text");
				local textureOb = getglobal(self:GetName().."Texture");
				textOb:SetText("");
				textureOb:SetTexture("Interface\\Addons\\ChatPopo\\img\\bubbleanim"..self.showing);
			end
		end
	-- 显示
	elseif ( self.solid ) then
		self.solid = self.solid - elapsed;
		if ( self.solid < 0 ) then
			self.solid = nil;
			self.fading = CHATPOPO_FADING_TIME;
			return;
		end
	-- 隐藏动画
	elseif ( self.fading and self.fading ~= 0 ) then
		self.fading = self.fading - elapsed;
		if ( self.fading < 0 ) then
			self.fading = 0;
			self.hide = CHATPOPO_HIDE_TIME;
		end
		self:SetAlpha((self.fading/CHATPOPO_FADING_TIME)*0.5+0.5);
	-- 隐藏
	elseif ( self.hide ) then
		self.hide = self.hide - elapsed;
		if ( self.hide < 0 ) then	
			self:Hide();
			self.hide = nil;
			self.fading = nil;
			self.solid = nil;
			self.showing = nil;
			self.text = "";
			return;
		end
	end
end

function ChatPopoFrame_Check(self, player, msg)
	local name = UnitName("party"..self:GetID());

	if ( player == name ) then
		local textureOb = getglobal(self:GetName().."Texture");
		textureOb:SetTexture("Interfce\\Addons\\ChatPopo\\img\\bubbleanim1");
		self:SetAlpha(1.0);
		self.interval = 0;
		self.showing = 0;
		self.fading = nil;
		self.text = msg;

		self:Show();
	end
end

function ChatPopoFrame_OnEvent(self, event, ...)	
	if ( event == "CHAT_MSG_PARTY" ) then
		-- 团队中隐藏
		if (CHATPOPO_INRAID and GetNumRaidMembers() > 0) then
			return;
		end

		local msg, player = ...;
		ChatPopoFrame_Check(self, player, msg);
	end
end

function ChatPopo_Toggle(switch)
	if (switch) then
		local i;
		for i = 1, 4, 1 do			
			local frame = _G["ChatPopoFrame"..i];
			
			frame:RegisterEvent("CHAT_MSG_PARTY");
		end
		dwUpdateChatPopoPosition();
	else
		local i;
		for i = 1, 4, 1 do
			local frame = _G["ChatPopoFrame"..i];			

			frame:UnregisterEvent("CHAT_MSG_PARTY");
		end
	end
end

function ChatPopoInRaid_Toggle(switch)
	if (switch) then
		CHATPOPO_INRAID = true;
	else
		CHATPOPO_INRAID = false;
	end
end