 local BUtils_dbdf11f5b07258936fb1c5a31eaa969c = 1; local BUtils_1b5523f0adb45c4b8ee51f89ebf6f2b2 = 0; local function BUtils_6c928cfe25fd7d61ea6c6a5a74d3dbab(self, BUtils_6c5560108ad7aaf47e811081394a00b4) local BUtils_6c5560108ad7aaf47e811081394a00b4 = BUtils_6c5560108ad7aaf47e811081394a00b4 or self; for BUtils_63a9ce6f1eeac72ef41293b7d0303335, BUtils_8d0644c92128c1ff68223fd74ba63b56 in pairs(BUtils_6c5560108ad7aaf47e811081394a00b4) do if (type(BUtils_8d0644c92128c1ff68223fd74ba63b56) == "table" and BUtils_8d0644c92128c1ff68223fd74ba63b56 ~= {}) then BUtils_6c928cfe25fd7d61ea6c6a5a74d3dbab(self, BUtils_8d0644c92128c1ff68223fd74ba63b56); else BUtils_6c5560108ad7aaf47e811081394a00b4[BUtils_63a9ce6f1eeac72ef41293b7d0303335] = nil; end end end local function BUtils_af50f8226fc9f10691ea4a55c721279b(self,BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_536473f22dedf9f29b94b1004a62b8a0) local BUtils_b4d3314490a868cf61f5fbd057900b0b = BUtils_b4d3314490a868cf61f5fbd057900b0b or self; for BUtils_63a9ce6f1eeac72ef41293b7d0303335,BUtils_8d0644c92128c1ff68223fd74ba63b56 in pairs(BUtils_b4d3314490a868cf61f5fbd057900b0b) do if(BUtils_8d0644c92128c1ff68223fd74ba63b56==BUtils_536473f22dedf9f29b94b1004a62b8a0) then table.remove(BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_63a9ce6f1eeac72ef41293b7d0303335); return true; end end return false; end local function BUtils_4910621608469538298406410c4cf5db(self,BUtils_6c5560108ad7aaf47e811081394a00b4) local BUtils_6c5560108ad7aaf47e811081394a00b4 = BUtils_6c5560108ad7aaf47e811081394a00b4 or self; local new = {}; local BUtils_e914904fab9d05d3f54d52bfc31a0f3f, BUtils_8d0644c92128c1ff68223fd74ba63b56 = next(BUtils_6c5560108ad7aaf47e811081394a00b4, nil); while BUtils_e914904fab9d05d3f54d52bfc31a0f3f do if type(BUtils_8d0644c92128c1ff68223fd74ba63b56)=="table" then BUtils_8d0644c92128c1ff68223fd74ba63b56=BUtils_4910621608469538298406410c4cf5db(self,BUtils_8d0644c92128c1ff68223fd74ba63b56); end new[BUtils_e914904fab9d05d3f54d52bfc31a0f3f] = BUtils_8d0644c92128c1ff68223fd74ba63b56; BUtils_e914904fab9d05d3f54d52bfc31a0f3f, BUtils_8d0644c92128c1ff68223fd74ba63b56 = next(BUtils_6c5560108ad7aaf47e811081394a00b4, BUtils_e914904fab9d05d3f54d52bfc31a0f3f); end return new; end local function BUtils_04728128b0db839923d4f8e4c1e5b59c(self,BUtils_6c5560108ad7aaf47e811081394a00b4) local BUtils_6c5560108ad7aaf47e811081394a00b4 = BUtils_6c5560108ad7aaf47e811081394a00b4 or self; local n=0; for _ in pairs(BUtils_6c5560108ad7aaf47e811081394a00b4) do n=n+1; end return n; end local function BUtils_c4f83e9657cea77bf7cdeabfcb3c8735(self, BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_a779d9b7ab476e54171df57a19a144dc, BUtils_536473f22dedf9f29b94b1004a62b8a0) local BUtils_b4d3314490a868cf61f5fbd057900b0b = BUtils_b4d3314490a868cf61f5fbd057900b0b or self; for BUtils_63a9ce6f1eeac72ef41293b7d0303335,BUtils_8d0644c92128c1ff68223fd74ba63b56 in ipairs(BUtils_b4d3314490a868cf61f5fbd057900b0b) do if(BUtils_8d0644c92128c1ff68223fd74ba63b56==BUtils_a779d9b7ab476e54171df57a19a144dc) then table.insert(BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_63a9ce6f1eeac72ef41293b7d0303335, BUtils_536473f22dedf9f29b94b1004a62b8a0); return; end end table.insert(BUtils_b4d3314490a868cf61f5fbd057900b0b, BUtils_536473f22dedf9f29b94b1004a62b8a0); end local function BUtils_00fc101d4f1d62af16cc8ba937b2fd74(self,BUtils_3db6a6eba04325a148d9bb6efff2f6a1) local rhex, ghex, bhex = string.sub(BUtils_3db6a6eba04325a148d9bb6efff2f6a1, 1, 2), string.sub(BUtils_3db6a6eba04325a148d9bb6efff2f6a1, 3, 4), string.sub(BUtils_3db6a6eba04325a148d9bb6efff2f6a1, 5, 6) return tonumber(rhex, 16)/255, tonumber(ghex, 16)/255, tonumber(bhex, 16)/255 end local function BUtils_1239bf62c5c85eec9019dd060adf5501(BUtils_3ae1f2c4b38d5f7c356b4cdb7c6e4027, BUtils_0f402d7ba502a47a51c410aee99b1ff1, BUtils_a0a053cacf1c8c43346fdc3adb684cb7) return string.format("%02x%02x%02x", BUtils_3ae1f2c4b38d5f7c356b4cdb7c6e4027*255, BUtils_0f402d7ba502a47a51c410aee99b1ff1*255, BUtils_a0a053cacf1c8c43346fdc3adb684cb7*255) end if (GetLocale() == "zhCN") then BIGFOOT_BAG_PATTERN_MATCH = "(%d+)格(.+)"; BIGFOOT_SWITCH_MESSAGE_ON = "|cff00ff00开启调试开关<|cffffff00%s|r>。|r"; BIGFOOT_SWITCH_MESSAGE_OFF = "|cffff0000关闭调试开关<|cffffff00%s|r>。|r"; elseif (GetLocale() == "zhTW") then BIGFOOT_BAG_PATTERN_MATCH = "(%d+)格(.+)"; BIGFOOT_SWITCH_MESSAGE_ON = "|cff00ff00開啓調試開關<|cffffff00%s|r>。|r"; BIGFOOT_SWITCH_MESSAGE_OFF = "|cffff0000關閉調試開關<|cffffff00%s|r>。|r"; else BIGFOOT_BAG_PATTERN_MATCH = "(%d+) Slot (.+)"; BIGFOOT_SWITCH_MESSAGE_ON = "|cff00ff00Debug Switch <|cffffff00%s|r> is on.|r"; BIGFOOT_SWITCH_MESSAGE_OFF = "|cffff0000Debug Switch <|cffffff00%s|r> is off.|r"; end BigFoot_Debug_Filters = {}; local function BUtils_5099b6e56a68ab43a57fce5eb5c92e74(bag) BigFoot_Tooltip_Init(); BigFootTooltip:SetInventoryItem("player", bag); local text1 = BigFootTooltipTextLeft1:GetText(); local text2 = BigFootTooltipTextLeft2:GetText(); local text3 = BigFootTooltipTextLeft3:GetText(); local text4 = BigFootTooltipTextLeft4:GetText(); BigFootTooltip:Hide(); local st, ed, slots, type; local pattern_string; if (text2) then st, ed, slots, type = text2:find(BIGFOOT_BAG_PATTERN_MATCH); if (st and ed) then return slots, type; end end if (text3) then st, ed, slots, type = string.find(text3, BIGFOOT_BAG_PATTERN_MATCH); if (st and ed) then return slots, type; end end if (text4) then st, ed, slots, type = string.find(text4, BIGFOOT_BAG_PATTERN_MATCH); if (st and ed) then return slots, type; end end end local function BUtils_fbdc276aab70785831ced75c81d87eff(arg) if (type(arg) == "table" or type(arg) == "function" or type(arg) == "userdata") then return nil; else return true; end end local function BUtils_4f9bfbc72b3131a66003195e78e59a9a(v) if (not v) then v = "(nil)"; elseif (not BUtils_fbdc276aab70785831ced75c81d87eff(v)) then v = "("..type(v)..")"; end return v; end local function BUtils_6fc5e6a3f6bb547e6580a85e6b6087de(v) if (type(v) == "table") then local string = "{ "; local seperator = ""; local key, value; for key, value in pairs(v) do if (type(value) == "table") then string = string .. seperator .. key .. " => " .. BUtils_6fc5e6a3f6bb547e6580a85e6b6087de(value); else string = string .. seperator .. key .. " => " .. BUtils_6fc5e6a3f6bb547e6580a85e6b6087de(value); end seperator = ", "; end string = string .. " }"; return string; else return BUtils_4f9bfbc72b3131a66003195e78e59a9a(v); end end function BigFoot_Print(msg, header, callback) local actual_message; if (header) then actual_message = header .. " " .. BUtils_6fc5e6a3f6bb547e6580a85e6b6087de(msg); else actual_message = BUtils_6fc5e6a3f6bb547e6580a85e6b6087de(msg); end if (callback and type(callback) == "function") then callback(actual_message); else DEFAULT_CHAT_FRAME:AddMessage(actual_message); end end local function BUtils_85105c5d8eef23666c1c27b47a8c3af4(self,BUtils_0e2babf2e3097eec96cf9280d1412ab5) for _, func in pairs(self.funcList) do func(self,BUtils_0e2babf2e3097eec96cf9280d1412ab5) end end local updateFrame = CreateFrame("Frame"); updateFrame.funcList = {} updateFrame:SetScript("OnUpdate",BUtils_85105c5d8eef23666c1c27b47a8c3af4) BUtils = { Erase = BUtils_6c928cfe25fd7d61ea6c6a5a74d3dbab, Remove = BUtils_af50f8226fc9f10691ea4a55c721279b, Clone = BUtils_4910621608469538298406410c4cf5db, GetSize = BUtils_04728128b0db839923d4f8e4c1e5b59c, tInsert = BUtils_86ab14a84e987e6e268dbd6519808757, HexToRGBPerc = BUtils_00fc101d4f1d62af16cc8ba937b2fd74, RGBPercToHex = BUtils_1239bf62c5c85eec9019dd060adf5501, GetBagInfo = BUtils_5099b6e56a68ab43a57fce5eb5c92e74, DebugPrint = BigFoot_Print, }; function BUtils:AddUpdateCallback(callback) if not callback or type(callback)~='function' then return end tinsert(updateFrame.funcList,callback) end function BUtils:constructor() end BLibrary:Register(BUtils, "BUtils", BUtils_dbdf11f5b07258936fb1c5a31eaa969c, BUtils_1b5523f0adb45c4b8ee51f89ebf6f2b2); function TestTaint(...) local BUtils_6c391f92e72d1c9b7434bca8947c5e2c, BUtils_f897f2e099a64c92cc66909fc41d8477 = issecurevariable(...); if (not BUtils_6c391f92e72d1c9b7434bca8947c5e2c) then BigFoot_Print("The variable is taintied. From: "..BUtils_f897f2e099a64c92cc66909fc41d8477); else BigFoot_Print("The variable is secure."); end end local stack = {}; local secureFrame = CreateFrame("Frame"); local index = 0; local sequence = {}; secureFrame:RegisterEvent("PLAYER_REGEN_ENABLED"); local function BUtils_a7afce9fbbc025cffe91d09ff0a0f8a8(func, ...) assert(type(func) == "function", "First argument must be a function value."); index = index + 1; stack[func] = {...}; sequence[func] = index; end local function BUtils_3abed17d635b55a3b55cef81ef841e97() local tmp = {}; local tmp2= {}; for k, v in pairs(sequence) do tmp[v] = k; end for k, v in pairs(tmp) do tinsert(tmp2, k); end table.sort(tmp2); local func; for i=1, #(tmp2) do func = tmp[tmp2[i]]; if (func and type(func) == "function" and stack[func]) then pcall(unpack(stack[func])); end end table.wipe(stack); table.wipe(sequence); index = 0; end secureFrame:SetScript("OnEvent", function(self) BUtils_3abed17d635b55a3b55cef81ef841e97(); end); function BFSecureCall( ...) local func = select(1, ...); if (type(func) == "function") then if (InCombatLockdown()) then BUtils_a7afce9fbbc025cffe91d09ff0a0f8a8(func, ...); return; end pcall(...); end end function BUtils_a447ac5a84d481f3c2e1a61ddb491893(self,BUtils_0e2babf2e3097eec96cf9280d1412ab5) for __index, BUtils_2361bab8b48b1041ad740bb561b21aee in pairs(self.callroutine) do BUtils_2361bab8b48b1041ad740bb561b21aee["lastUpdate"] = BUtils_2361bab8b48b1041ad740bb561b21aee["lastUpdate"] + BUtils_0e2babf2e3097eec96cf9280d1412ab5; if ( BUtils_2361bab8b48b1041ad740bb561b21aee["lastUpdate"] > BUtils_2361bab8b48b1041ad740bb561b21aee["delay"] ) then if (type(BUtils_2361bab8b48b1041ad740bb561b21aee["func"]) == "string") then local BUtils_c31af5fd9021206e921af3d99e5a90af = getglobal(BUtils_2361bab8b48b1041ad740bb561b21aee["func"]); if (BUtils_2361bab8b48b1041ad740bb561b21aee.arg and table.maxn(BUtils_2361bab8b48b1041ad740bb561b21aee.arg) > 0) then pcall(BUtils_c31af5fd9021206e921af3d99e5a90af,unpack(BUtils_2361bab8b48b1041ad740bb561b21aee.arg)); else pcall(BUtils_c31af5fd9021206e921af3d99e5a90af); end else if (BUtils_2361bab8b48b1041ad740bb561b21aee.arg and table.maxn(BUtils_2361bab8b48b1041ad740bb561b21aee.arg) > 0) then pcall(BUtils_2361bab8b48b1041ad740bb561b21aee["func"],unpack(BUtils_2361bab8b48b1041ad740bb561b21aee.arg)); else pcall(BUtils_2361bab8b48b1041ad740bb561b21aee["func"]); end end table.remove(self.callroutine, __index); end end end BLibrary("BUtils"):AddUpdateCallback(BUtils_a447ac5a84d481f3c2e1a61ddb491893) function BigFoot_DelayCall(BUtils_c31af5fd9021206e921af3d99e5a90af, BUtils_fa0e20b884d24b5fee3e57d9608679e2, ...) if ( not updateFrame.callroutine ) then updateFrame.callroutine = {}; end local BUtils_2e00ffac12aadb3a1fd865993ec505b9 = {}; local BUtils_7739b813d90aed43ab9d0eb84ec1c1ae = {...}; BUtils_2e00ffac12aadb3a1fd865993ec505b9["func"] = BUtils_c31af5fd9021206e921af3d99e5a90af; BUtils_2e00ffac12aadb3a1fd865993ec505b9["delay"] = BUtils_fa0e20b884d24b5fee3e57d9608679e2; BUtils_2e00ffac12aadb3a1fd865993ec505b9["lastUpdate"] = 0; BUtils_2e00ffac12aadb3a1fd865993ec505b9.arg = BUtils_7739b813d90aed43ab9d0eb84ec1c1ae; table.insert(updateFrame.callroutine, BUtils_2e00ffac12aadb3a1fd865993ec505b9); end function BigFoot_DebugPrint(message, switch) if (BigFoot_Debug_Filters[switch] or BigFoot_Debug_Filters["all"]) then BigFoot_Print(message, switch); end end function BigFoot_Report(BUtils_6d5e7d83d8358745ae4dcf61d16bd1f3, BUtils_c9bd86bc8bc59457d49315cf5b8c5b88) local BUtils_411b8aa6d5954c6020f0b9c9e80e847a = DEFAULT_CHAT_FRAME; if ( BUtils_411b8aa6d5954c6020f0b9c9e80e847a ) then if ( BUtils_6d5e7d83d8358745ae4dcf61d16bd1f3 == "info" ) then BUtils_411b8aa6d5954c6020f0b9c9e80e847a:AddMessage(BUtils_c9bd86bc8bc59457d49315cf5b8c5b88, 1.0, 1.0, 0.0); elseif ( BUtils_6d5e7d83d8358745ae4dcf61d16bd1f3 == "error" ) then BUtils_411b8aa6d5954c6020f0b9c9e80e847a:AddMessage(BUtils_c9bd86bc8bc59457d49315cf5b8c5b88, 1.0, 0.0, 0.0); end end end function BigFoot_ToggleSwitch(switch) if (BigFoot_Debug_Filters[switch]) then BigFoot_Debug_Filters[switch] = nil; BigFoot_Print(BIGFOOT_SWITCH_MESSAGE_OFF); else BigFoot_Debug_Filters[switch] = 1; BigFoot_Print(BIGFOOT_SWITCH_MESSAGE_ON); end end SLASH_DBGSWITCH1 = "/dbgswitch"; SlashCmdList["SLASH_DBGSWITCH"] = function(switch) BigFoot_ToggleSwitch(switch); end local serverToRegion ={ ["奥达曼"] = {region=1,bg=1}, ["阿尔萨斯"] = {region=1,bg=7}, ["阿格拉玛"] = {region=1,bg=1}, ["埃雷达尔"] = {region=1,bg=7}, ["奥蕾莉亚"] = {region=1,bg=1}, ["阿拉索"] = {region=1,bg=7}, ["艾欧纳尔"] = {region=1,bg=7}, ["艾苏恩"] = {region=1,bg=1}, ["奥特兰克"] = {region=1,bg=7}, ["安威玛尔"] = {region=1,bg=1}, ["暗影议会"] = {region=1,bg=7}, ["巴尔古恩"] = {region=1,bg=7}, ["冰风岗"] = {region=1,bg=7}, ["暴风祭坛"] = {region=1,bg=1}, ["白银之手"] = {region=1,bg=1}, ["藏宝海湾"] = {region=1,bg=1}, ["尘风峡谷"] = {region=1,bg=1}, ["达隆米尔"] = {region=1,bg=7}, ["达纳斯"] = {region=1,bg=1}, ["迪托马斯"] = {region=1,bg=1}, ["耳语海岸"] = {region=1,bg=7}, ["古尔丹"] = {region=1,bg=7}, ["国王之谷"] = {region=1,bg=1}, ["寒冰皇冠"] = {region=1,bg=7}, ["黑龙军团"] = {region=1,bg=1}, ["红龙军团"] = {region=1,bg=1}, ["黑石尖塔"] = {region=1,bg=1}, ["回音山"] = {region=1,bg=1}, ["基尔加丹"] = {region=1,bg=7}, ["基尔罗格"] = {region=1,bg=1}, ["激流堡"] = {region=1,bg=7}, ["巨龙之吼"] = {region=1,bg=7}, ["库德兰"] = {region=1,bg=1}, ["卡德罗斯"] = {region=1,bg=1}, ["克尔苏加德"] = {region=1,bg=8}, ["凯尔萨斯"] = {region=1,bg=8}, ["卡兹格罗斯"] = {region=1,bg=7}, ["卡扎克"] = {region=1,bg=1}, ["拉格纳洛斯"] = {region=1,bg=7}, ["蓝龙军团"] = {region=1,bg=2}, ["罗宁"] = {region=1,bg=2}, ["利刃之拳"] = {region=1,bg=7}, ["洛萨"] = {region=1,bg=2}, ["流沙之槌"] = {region=1,bg=8}, ["雷霆之王"] = {region=1,bg=2}, ["烈焰峰"] = {region=1,bg=2}, ["玛多兰"] = {region=1,bg=2}, ["麦迪文"] = {region=1,bg=8}, ["玛诺洛斯"] = {region=1,bg=8}, ["玛瑟里顿"] = {region=1,bg=2}, ["耐奥祖"] = {region=1,bg=8}, ["诺莫瑞根"] = {region=1,bg=2}, ["耐萨里奥"] = {region=1,bg=2}, ["普瑞斯托"] = {region=1,bg=2}, ["燃烧平原"] = {region=1,bg=2}, ["瑞文戴尔"] = {region=1,bg=8}, ["萨格拉斯"] = {region=1,bg=2}, ["霜狼"] = {region=1,bg=8}, ["索拉丁"] = {region=1,bg=2}, ["山丘之王"] = {region=1,bg=2}, ["索瑞森"] = {region=1,bg=2}, ["斯坦索姆"] = {region=1,bg=8}, ["死亡之翼"] = {region=1,bg=2}, ["霜之哀伤"] = {region=1,bg=8}, ["铜龙军团"] = {region=1,bg=2}, ["塔伦米尔"] = {region=1,bg=8}, ["通灵学院"] = {region=1,bg=8}, ["图拉扬"] = {region=1,bg=2}, ["提瑞斯法"] = {region=1,bg=8}, ["希尔瓦娜斯"] = {region=1,bg=8}, ["血色十字军"] = {region=1,bg=8}, ["鹰巢山"] = {region=1,bg=8}, ["伊瑟拉"] = {region=1,bg=2}, ["银松森林"] = {region=1,bg=8}, ["遗忘海岸"] = {region=1,bg=8}, ["银月"] = {region=1,bg=8}, ["影牙要塞"] = {region=1,bg=8}, ["安东尼达斯"] = {region=1,bg=7}, ["阿古斯"] = {region=2,bg=17}, ["埃加洛尔"] = {region=2,bg=3}, ["阿迦玛甘"] = {region=2,bg=3}, ["阿克蒙德"] = {region=2,bg=3}, ["奥拉基尔"] = {region=2,bg=3}, ["阿拉希"] = {region=2,bg=11}, ["阿努巴拉克"] = {region=2,bg=11}, ["阿纳克洛斯"] = {region=2,bg=11}, ["安纳塞隆"] = {region=2,bg=11}, ["安其拉"] = {region=2,bg=11}, ["艾萨拉"] = {region=2,bg=3}, ["埃苏雷格"] = {region=2,bg=3}, ["艾森娜"] = {region=2,bg=3}, ["爱斯特纳"] = {region=2,bg=3}, ["暗影之月"] = {region=2,bg=3}, ["巴纳扎尔"] = {region=2,bg=11}, ["冰霜之刃"] = {region=2,bg=3}, ["德拉诺"] = {region=2,bg=11}, ["迪门修斯"] = {region=2,bg=17}, ["达斯雷玛"] = {region=2,bg=3}, ["戴索姆"] = {region=2,bg=17}, ["刀塔"] = {region=2,bg=17}, ["地狱咆哮"] = {region=2,bg=3}, ["地狱之石"] = {region=2,bg=3}, ["风暴要塞"] = {region=2,bg=18}, ["风暴之怒"] = {region=2,bg=3}, ["翡翠梦境"] = {region=2,bg=18}, ["范达尔鹿盔"] = {region=2,bg=12}, ["凤凰之神"] = {region=2,bg=17}, ["范克里夫"] = {region=2,bg=18}, ["弗塞雷迦"] = {region=2,bg=3}, ["风行者"] = {region=2,bg=3}, ["戈古纳斯"] = {region=2,bg=3}, ["古拉巴什"] = {region=2,bg=12}, ["格鲁尔"] = {region=2,bg=17}, ["格瑞姆巴托"] = {region=2,bg=12}, ["黑暗之门"] = {region=2,bg=17}, ["海达希亚"] = {region=2,bg=12}, ["海加尔"] = {region=2,bg=4}, ["哈卡"] = {region=2,bg=12}, ["海克泰尔"] = {region=2,bg=12}, ["毁灭之锤"] = {region=2,bg=3}, ["黑手军团"] = {region=2,bg=11}, ["黑翼之巢"] = {region=2,bg=11}, ["火焰之地"] = {region=2,bg=17}, ["火焰之树"] = {region=2,bg=3}, ["军团要塞"] = {region=2,bg=17}, ["卡德加"] = {region=2,bg=3}, ["奎尔萨拉斯"] = {region=2,bg=12}, ["库尔提拉斯"] = {region=2,bg=12}, ["克洛玛古斯"] = {region=2,bg=11}, ["卡拉赞"] = {region=2,bg=11}, ["克苏恩"] = {region=2,bg=11}, ["雷德"] = {region=2,bg=18}, ["洛丹伦"] = {region=2,bg=12}, ["龙骨平原"] = {region=2,bg=11}, ["拉贾克斯"] = {region=2,bg=12}, ["莱索恩"] = {region=2,bg=12}, ["雷霆之怒"] = {region=2,bg=11}, ["拉文霍德"] = {region=2,bg=12}, ["拉文凯斯"] = {region=2,bg=4}, ["梅尔加尼"] = {region=2,bg=4}, ["玛法里奥"] = {region=2,bg=4}, ["穆戈尔"] = {region=2,bg=18}, ["梦境之树"] = {region=2,bg=4}, ["玛克扎尔"] = {region=2,bg=17}, ["麦姆"] = {region=2,bg=17}, ["摩摩尔"] = {region=2,bg=18}, ["麦维影歌"] = {region=2,bg=4}, ["奈法利安"] = {region=2,bg=12}, ["纳克萨玛斯"] = {region=2,bg=12}, ["耐普图隆"] = {region=2,bg=4}, ["破碎大厅"] = {region=2,bg=18}, ["破碎岭"] = {region=2,bg=11}, ["盘牙"] = {region=2,bg=17}, ["轻风之语"] = {region=2,bg=4}, ["熔火之心"] = {region=2,bg=11}, ["燃烧军团"] = {region=2,bg=11}, ["桑德兰"] = {region=2,bg=11}, ["闪电之刃"] = {region=2,bg=4}, ["萨菲隆"] = {region=2,bg=12}, ["森金"] = {region=2,bg=12}, ["试炼之环"] = {region=2,bg=18}, ["塞纳里奥"] = {region=2,bg=4}, ["塞泰克"] = {region=2,bg=18}, ["死亡熔炉"] = {region=2,bg=17}, ["深渊之喉"] = {region=2,bg=17}, ["石爪峰"] = {region=2,bg=4}, ["提克迪奥斯"] = {region=2,bg=18}, ["泰兰德"] = {region=2,bg=4}, ["泰拉尔"] = {region=2,bg=12}, ["屠魔山谷"] = {region=2,bg=4}, ["太阳之井"] = {region=2,bg=18}, ["无尽之海"] = {region=2,bg=12}, ["瓦里玛萨斯"] = {region=2,bg=11}, ["瓦拉斯塔兹"] = {region=2,bg=12}, ["血槌"] = {region=2,bg=17}, ["希雷诺斯"] = {region=2,bg=18}, ["希奈丝特拉"] = {region=2,bg=18}, ["夏维安"] = {region=2,bg=4}, ["鲜血熔炉"] = {region=2,bg=17}, ["血羽"] = {region=2,bg=11}, ["月光林地"] = {region=2,bg=4}, ["永恒之井"] = {region=2,bg=12}, ["伊利丹"] = {region=2,bg=4}, ["月神殿"] = {region=2,bg=4}, ["祖阿曼"] = {region=2,bg=18}, ["战歌"] = {region=2,bg=4}, ["蒸汽地窟"] = {region=2,bg=18}, ["主宰之剑"] = {region=2,bg=4}, ["哈兰"] = {region=2,bg=17}, ["艾露恩"] = {region=2,bg=17}, ["瓦丝琪"] = {region=2,bg=18}, ["埃德萨拉"] = {region=3,bg=5}, ["安戈洛"] = {region=3,bg=14}, ["阿卡玛"] = {region=3,bg=13}, ["埃克索图斯"] = {region=3,bg=13}, ["艾莫莉丝"] = {region=3,bg=13}, ["奥妮克希亚"] = {region=3,bg=14}, ["奥斯里安"] = {region=3,bg=14}, ["艾维娜"] = {region=3,bg=13}, ["阿扎达斯"] = {region=3,bg=13}, ["布莱恩"] = {region=3,bg=13}, ["布莱克摩"] = {region=3,bg=5}, ["巴瑟拉斯"] = {region=3,bg=13}, ["达卡尼"] = {region=3,bg=14}, ["杜隆坦"] = {region=3,bg=5}, ["丹莫德"] = {region=3,bg=13}, ["迪瑟洛克"] = {region=3,bg=13}, ["达文格尔"] = {region=3,bg=13}, ["大漩涡"] = {region=3,bg=14}, ["恶魔之魂"] = {region=3,bg=13}, ["风暴之鳞"] = {region=3,bg=14}, ["菲拉斯"] = {region=3,bg=13}, ["符文图腾"] = {region=3,bg=5}, ["古加尔"] = {region=3,bg=13}, ["格雷迈恩"] = {region=3,bg=13}, ["鬼雾峰"] = {region=3,bg=5}, ["黑暗虚空"] = {region=3,bg=14}, ["黑暗之矛"] = {region=3,bg=5}, ["灰谷"] = {region=3,bg=13}, ["灰烬使者"] = {region=3,bg=6}, ["黄金之路"] = {region=3,bg=5}, ["红龙女王"] = {region=3,bg=5}, ["黑铁"] = {region=3,bg=13}, ["火羽山"] = {region=3,bg=5}, ["红云台地"] = {region=3,bg=5}, ["荆棘谷"] = {region=3,bg=14}, ["加基森"] = {region=3,bg=13}, ["迦罗娜"] = {region=3,bg=5}, ["加里索斯"] = {region=3,bg=13}, ["禁魔监狱"] = {region=3,bg=6}, ["恐怖图腾"] = {region=3,bg=13}, ["凯恩血蹄"] = {region=3,bg=5}, ["狂风峭壁"] = {region=3,bg=5}, ["雷斧堡垒"] = {region=3,bg=5}, ["雷克萨"] = {region=3,bg=6}, ["雷霆号角"] = {region=3,bg=5}, ["玛里苟斯"] = {region=3,bg=6}, ["诺森德"] = {region=3,bg=14}, ["纳沙塔尔"] = {region=3,bg=6}, ["诺兹多姆"] = {region=3,bg=6}, ["普罗德摩"] = {region=3,bg=6}, ["千针石林"] = {region=3,bg=6}, ["燃烧之刃"] = {region=3,bg=6}, ["萨尔"] = {region=3,bg=6}, ["圣火神殿"] = {region=3,bg=6}, ["瑟莱德丝"] = {region=3,bg=14}, ["塞拉赞恩"] = {region=3,bg=14}, ["死亡之门"] = {region=3,bg=6}, ["天空之墙"] = {region=3,bg=14}, ["塔纳利斯"] = {region=3,bg=14}, ["托塞德林"] = {region=3,bg=14}, ["甜水绿洲"] = {region=3,bg=6}, ["维克尼拉斯"] = {region=3,bg=14}, ["外域"] = {region=3,bg=14}, ["血顶"] = {region=3,bg=13}, ["血环"] = {region=3,bg=5}, ["熊猫酒仙"] = {region=3,bg=6}, ["血牙魔王"] = {region=3,bg=6}, ["伊莫塔尔"] = {region=3,bg=14}, ["勇士岛"] = {region=3,bg=6}, ["羽月"] = {region=3,bg=6}, ["祖尔金"] = {region=3,bg=14}, ["祖鲁希德"] = {region=3,bg=14}, ["逐日者"] = {region=3,bg=14}, ["自由之风"] = {region=3,bg=6}, ["蜘蛛王国"] = {region=3,bg=6}, ["安多哈尔"] = {region=5,bg=10}, ["艾隆纳亚"] = {region=5,bg=0}, ["冰川之拳"] = {region=5,bg=15}, ["布兰卡德"] = {region=5,bg=9}, ["刺骨利刃"] = {region=5,bg=15}, ["雏龙之翼"] = {region=5,bg=9}, ["朵丹尼尔"] = {region=5,bg=10}, ["大地之怒"] = {region=5,bg=10}, ["夺灵者"] = {region=5,bg=16}, ["冬泉谷"] = {region=5,bg=16}, ["恶魔之翼"] = {region=5,bg=9}, ["风暴裂隙"] = {region=5,bg=16}, ["风暴之眼"] = {region=5,bg=10}, ["芬里斯"] = {region=5,bg=10}, ["法拉希姆"] = {region=5,bg=10}, ["戈杜尼"] = {region=5,bg=15}, ["黑暗魅影"] = {region=5,bg=9}, ["火喉"] = {region=5,bg=15}, ["怀特迈恩"] = {region=5,bg=16}, ["火烟之谷"] = {region=5,bg=15}, ["金度"] = {region=5,bg=15}, ["加德纳尔"] = {region=5,bg=10}, ["浸毒之骨"] = {region=5,bg=9}, ["激流之傲"] = {region=5,bg=9}, ["迦玛兰"] = {region=5,bg=15}, ["金色平原"] = {region=5,bg=10}, ["加兹鲁维"] = {region=5,bg=9}, ["狂热之刃"] = {region=5,bg=9}, ["卡珊德拉"] = {region=5,bg=9}, ["烈焰荆棘"] = {region=5,bg=16}, ["莫格莱尼"] = {region=5,bg=15}, ["玛格索尔"] = {region=5,bg=9}, ["玛加萨"] = {region=5,bg=15}, ["密林游侠"] = {region=5,bg=10}, ["米奈希尔"] = {region=5,bg=15}, ["莫什奥格"] = {region=5,bg=15}, ["暮色森林"] = {region=5,bg=10}, ["耐克鲁斯"] = {region=5,bg=16}, ["日落沼泽"] = {region=5,bg=10}, ["石锤"] = {region=5,bg=16}, ["守护之剑"] = {region=5,bg=9}, ["水晶之刺"] = {region=5,bg=9}, ["世界之树"] = {region=5,bg=9}, ["塞拉摩"] = {region=5,bg=16}, ["噬灵沼泽"] = {region=5,bg=15}, ["瑟玛普拉格"] = {region=5,bg=16}, ["神圣之歌"] = {region=5,bg=10}, ["苏塔恩"] = {region=5,bg=9}, ["深渊之巢"] = {region=5,bg=15}, ["提尔之手"] = {region=5,bg=10}, ["踏梦者"] = {region=5,bg=10}, ["万色星辰"] = {region=5,bg=9}, ["午夜之镰"] = {region=5,bg=10}, ["巫妖之王"] = {region=5,bg=15}, ["邪恶颅壳"] = {region=5,bg=15}, ["迅捷微风"] = {region=5,bg=9}, ["幽暗沼泽"] = {region=5,bg=15}, ["亚雷戈斯"] = {region=5,bg=16}, ["伊兰尼库斯"] = {region=5,bg=15}, ["伊森德雷"] = {region=5,bg=16}, ["岩石巨塔"] = {region=5,bg=16}, ["伊萨里奥斯"] = {region=5,bg=10}, ["伊森利恩"] = {region=5,bg=10}, ["元素之力"] = {region=5,bg=10}, ["永夜港"] = {region=5,bg=10}, ["扎拉赞恩"] = {region=5,bg=16}, ["斩魔者"] = {region=5,bg=9}, ["阿比迪斯"] = {region=10,bg=19}, ["安格博达"] = {region=10,bg=21}, ["安加萨"] = {region=10,bg=21}, ["阿曼尼"] = {region=10,bg=19}, ["安苏"] = {region=10,bg=19}, ["阿斯塔洛"] = {region=10,bg=19}, ["白骨荒野"] = {region=10,bg=19}, ["壁炉谷"] = {region=10,bg=19}, ["布鲁塔卢斯"] = {region=10,bg=19}, ["达尔坎"] = {region=10,bg=19}, ["达基萨斯"] = {region=10,bg=19}, ["风暴峭壁"] = {region=10,bg=21}, ["菲米丝"] = {region=10,bg=19}, ["盖斯"] = {region=10,bg=19}, ["戈提克"] = {region=10,bg=19}, ["黑锋哨站"] = {region=10,bg=21}, ["霍格"] = {region=10,bg=20}, ["迦顿"] = {region=10,bg=19}, ["加尔"] = {region=10,bg=19}, ["迦拉克隆"] = {region=10,bg=21}, ["奎尔丹纳斯"] = {region=10,bg=20}, ["莉亚德琳"] = {region=10,bg=20}, ["莫德雷萨"] = {region=10,bg=21}, ["玛格曼达"] = {region=10,bg=20}, ["莫加尔"] = {region=10,bg=20}, ["末日行者"] = {region=10,bg=19}, ["能源舰"] = {region=10,bg=19}, ["贫瘠之地"] = {region=10,bg=19}, ["萨贝里安"] = {region=10,bg=20}, ["熵魔"] = {region=10,bg=19}, ["生态船"] = {region=10,bg=19}, ["血吼"] = {region=10,bg=19}, ["织亡者"] = {region=10,bg=21}, ["嚎风峡湾"] = {region=10,bg=20}, ["斯克提斯"] = {region=10,bg=20}, ["沙怒"] = {region=10,bg=20}, ["洛肯"] = {region=10,bg=21}, ["纳斯雷兹姆"] = {region=10,bg=20}, ["阿达尔"] = {region=10,bg=20}, ["冬拥湖"] = {region=10,bg=21}, ["古达克"] = {region=10,bg=21}, ["萨塔里奥"] = {region=10,bg=21}, ["达克萨隆"] = {region=10,bg=21}, } local genderTable = { [1] = "Unknown", [2] = "Male", [3] = "Female" } --[[ return server name of the unit args: unit:string , unitID returns: string, serverName ]] function BFU_GetServerName(unit) local playerServer = GetCVar("realmName") if not unit or unit =="player" then return playerServer else local _,server =UnitName(unit) if server then return server else return playerServer end end end --[[ returns region name args: server: string, name of the server returns: number: region number ]] function BFU_GetRegion(server) if GetLocale() ~= 'zhCN' then return end local serverName if not server then serverName = BFU_GetServerName() else serverName = server end if serverToRegion and serverToRegion[serverName] then return serverToRegion[serverName].region end end --[[ returns battle ground number args: server: string, name of the server returns: number: number of the battle ground ]] function BFU_GetBGGroup(server) if GetLocale() ~= 'zhCN' then return end local serverName if not server then serverName = BFU_GetServerName() else serverName = server end if serverToRegion and serverToRegion[serverName] then local bg = serverToRegion[serverName].bg if bg ~= 0 then return bg end end end --[[ return unit class args: unit: string, unitID returns: string: localized, unit class string: non-localized ,unit class, upper case ]] function BFU_GetClass(unit) if not unit then unit = 'player' end return UnitClass(unit) end --[[ return unit name args: unit: string, unitID returns: string: unit name ]] function BFU_GetName(unit) if not unit then unit = 'player' end return UnitName(unit) end --[[ return level args: unit: string, unitID returns: number: unit level ]] function BFU_GetLvl(unit) if not unit then unit = 'player' end return UnitLevel(unit) end --[[ return race args: unit: string, unitID returns: string: race, localized string: race, unlocalized ]] function BFU_GetRace(unit) if not unit then unit = 'player' end return UnitRace(unit) end --[[ return gender args: unit: string, unitID returns: number: gender, 0 for unknown, 1 for male, 2 for female ]] function BFU_GetGender(unit) if not unit then unit = 'player' end return UnitSex(unit) end --[[ return faction args: unit: string, unitID returns: string: "Horde" or "Alliance" ]] function BFU_GetFaction(unit) if not unit then unit='player' end return UnitFactionGroup(unit) end 
