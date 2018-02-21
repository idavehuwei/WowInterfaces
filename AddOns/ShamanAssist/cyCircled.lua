------------------------------------------------------------------------------------------
-- cyCircled.lua
-- 日期: 2008年5月21日
-- 作者: 独孤傲雪
-- 描述: 让SMAssist的技能键接受cyCircled的风格效果, 使使用ACE插件的玩家能得到效果
-- 统一的界面.
-- 版权所有: 艾泽拉斯国家地理
------------------------------------------------------------------------------------------
local M = SMA;
local L = BLocal("ShamanAssist");

function M:RegisterCCSytle()
    self:UnregisterEvent("ADDON_LOADED");
    if (self.registeredStyle) then return end
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
                    elements = { "SMAButton1", "SMAButton2", "SMAButton3", "SMAButton4", "SMACALLBACK" },
                },
            };
        end

        function S:GetElements()
            return { ["ElementButton"] = true, };
        end

        self.registeredStyle = true;
    end
end