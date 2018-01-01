------------------------------------------------------------------------------------------
-- cyCircled.lua
-- ����: 2008��5��21��
-- ����: ���°�ѩ
-- ����: ��SMAssist�ļ��ܼ�����cyCircled�ķ��Ч��, ʹʹ��ACE���������ܵõ�Ч��
--			ͳһ�Ľ���.
-- ��Ȩ����: ������˹���ҵ���
------------------------------------------------------------------------------------------
local M = SMA;
local L = BLocal("ShamanAssist");

function M:RegisterCCSytle()
	self:UnregisterEvent("ADDON_LOADED");
	if (self.registeredStyle) then return	end
	if (cyCircled) then	
		local S = cyCircled:NewModule("ShamanAssist");

		function S:AddonLoaded()
			self.db = cyCircled:AcquireDBNamespace("ShamanAssist")
			cyCircled:RegisterDefaults("SMAssist", "profile", {
				["ElementButton"] = true,
			});
			self.elements = {
				["ElementButton"] = {
					args = {
						hotkey = true,
						ct = true,
					},
					elements = {"SMAButton1", "SMAButton2", "SMAButton3", "SMAButton4", "SMACALLBACK"}, 
				},
			};
		end

		function S:GetElements()
			return {	["ElementButton"] = true,};
		end		
		
		self.registeredStyle = true;
	end
end