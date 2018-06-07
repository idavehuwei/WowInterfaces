------------------------------------------------------------------------------------------
-- binding Localization 
-- 日期: 2010-4-7
-- 作者: dugu
-- 描述: 按键绑定的本地化文件
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------------------
if (GetLocale() == "zhCN") then
	for i = 1, 10 do
		_G["BINDING_HEADER_DUOWANBAR" .. i] = format("多玩%d号动作条", i);
		for b = 1, 12 do
			_G["BINDING_NAME_CLICK DuowanActionBar".. i .. "Button" .. b .. ":LeftButton"] =  format("动作键%d", b);
		end
	end
elseif (GetLocale() == "zhTW") then
	for i = 1, 10 do
		_G["BINDING_HEADER_DUOWANBAR" .. i] = format("多玩%d號動作條", i);
		for b = 1, 12 do
			_G["BINDING_NAME_CLICK DuowanActionBar".. i .. "Button" .. b .. ":LeftButton"] =  format("動作鍵%d", b);
		end
	end
else
	for i = 1, 10 do
		_G["BINDING_HEADER_DUOWANBAR" .. i] = format("Duowan ActionBar %d", i);
		for b = 1, 12 do
			_G["BINDING_NAME_CLICK DuowanActionBar".. i .. "Button" .. b .. ":LeftButton"] =  format("Action Button %d", b);
		end
	end
end