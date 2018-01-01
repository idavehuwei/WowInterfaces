
-------------------------------------------------------
-- BigFootPatch.lua
-- AndyXiao@BigFoot
-- 本文件是用来修正一些来自WoW本身Interface的问题
-------------------------------------------------------
-- patch 2.4.2 去掉的Global String
if (GetLocale() == "zhCN") then
	GOLD = "金币";
	SILVER = "银币";
	COPPER = "铜币";

	HANDY_TOOLKIT_TITLE = "便捷功能";
elseif (GetLocale() == "zhTW") then
	GOLD = "金幣";
	SILVER = "銀幣";
	COPPER = "銅幣";
else
	GOLD = "gold";
	SILVER = "silver";
	COPPER = "copper";
end

function BPatch_WatchRaidGroupButtons()
	local i;
	local button;
	for i = 1, 40 do 
		button = getglobal("RaidGroupButton"..i);
		button:SetAttribute("type", "target");
		button:SetAttribute("unit", button.unit);
	end
end

function BPatch_WatchPetActionBar()
	PetActionBarFrame:SetAttribute("unit", "pet");
	RegisterUnitWatch(PetActionBarFrame);
end

bf_watcher = CreateFrame("Frame");
bf_watcher:RegisterEvent("VARIABLES_LOADED");
bf_watcher:RegisterEvent("ADDON_LOADED");
bf_watcher:RegisterEvent("PLAYER_TARGET_CHANGED");
bf_watcher:SetScript("OnEvent", function()
	if (event == "ADDON_LOADED" and arg1 == "Blizzard_RaidUI") then
		if (InCombatLockdown()) then
			BigFoot_DelayCall(BPatch_WatchRaidGroupButtons, 1);
		else
			BPatch_WatchRaidGroupButtons();
		end
	elseif (event == "VARIABLES_LOADED") then
		if (InCombatLockdown()) then
			BigFoot_DelayCall(BPatch_WatchPetActionBar, 1);
		else
			BPatch_WatchPetActionBar();
		end
	end
end);

-------------------
-- 和谐难看的字体
-------------------
SetTextStatusBarTextPrefix(PlayerFrameHealthBar, "");
SetTextStatusBarTextPrefix(PlayerFrameManaBar, "");
SetTextStatusBarTextPrefix(MainMenuExpBar, "");
hooksecurefunc("UnitFrameManaBar_UpdateType", function(manaBar)	
	if (manaBar) then
		SetTextStatusBarTextPrefix(manaBar, "");
		TextStatusBar_UpdateTextString(manaBar);
	end
end);

TextStatusBarText:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE");

-- 屏蔽界面失效的提醒
UIParent:UnregisterEvent("ADDON_ACTION_BLOCKED");



if (not VoiceOptionsFrameAudioLabel) then
	CreateFrame("Frame", "VoiceOptionsFrameAudioLabel", UIParent);
end
