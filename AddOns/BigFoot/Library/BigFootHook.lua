 local BLHook_dbdf11f5b07258936fb1c5a31eaa969c = 1; local BLHook_1b5523f0adb45c4b8ee51f89ebf6f2b2 = 0; local BLHook_156d0b5c59d108c253fc06132f35f169 = { CameraOrSelectOrMoveStart = true, CameraOrSelectOrMoveStop = true, TurnOrActionStart = true, TurnOrActionStop = true, PitchUpStart = true, PitchUpStop = true, PitchDownStart = true, PitchDownStop = true, MoveBackwardStart = true, MoveBackwardStop = true, MoveForwardStart = true, MoveForwardStop = true, Jump = true, StrafeLeftStart = true, StrafeLeftStop = true, StrafeRightStart = true, StrafeRightStop = true, ToggleMouseMove = true, ToggleRun = true, TurnLeftStart = true, TurnLeftStop = true, TurnRightStart = true, TurnRightStop = true, }; local BLHook_691f389cf6bf1220f5cac72f2bb8f0de = { "SetHyperlink", "SetBagItem", "SetInventoryItem", "SetAuctionItem", "SetAuctionSellItem", "SetLootItem", "SetLootRollItem", "SetTradeSkillItem", "SetTrainerService", "SetInboxItem", "SetSendMailItem", "SetQuestItem", "SetQuestLogItem", "SetTradePlayerItem", "SetTradeTargetItem", "SetMerchantItem", "SetBuybackItem", "SetSocketGem", "SetExistingSocketGem", "SetHyperlinkCompareItem", }; BHook = {}; local BLHook_bfaaabe937ee64ae701cfcf9fd092319 = getfenv(0); local function BLHook_c7ce51c934f9020f0684c67935ccd80b(BLHook_c31af5fd9021206e921af3d99e5a90af) if (BLHook_156d0b5c59d108c253fc06132f35f169[BLHook_c31af5fd9021206e921af3d99e5a90af]) then return true; else return false; end end local function BLHook_7c65b06eaa2d4976aac9fa9f378c1eab(BLHook_c933410cf37b41b19e2f71899bab1b9b, BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af) return function(...) if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006]) then if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_98a5dc0296fddcc9b5b804f038f1994c) then local arg = {...}; if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_8fb7e8aa09c39a951584e6d5671ca8f0) then return BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_57ad665d0e8800ab56a0e07f8ae9c063(BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_8fb7e8aa09c39a951584e6d5671ca8f0, unpack(arg)); else return BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_57ad665d0e8800ab56a0e07f8ae9c063(function() end, unpack(arg)); end else if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_8fb7e8aa09c39a951584e6d5671ca8f0) then local arg = {...}; return BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_8fb7e8aa09c39a951584e6d5671ca8f0(unpack(arg)); end end end end end local function BLHook_f8dfa5efe2834873e4d255c8b895f36a(BLHook_c933410cf37b41b19e2f71899bab1b9b, BLHook_c31af5fd9021206e921af3d99e5a90af) return function(...) if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_98a5dc0296fddcc9b5b804f038f1994c) then local arg = {...}; if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_8fb7e8aa09c39a951584e6d5671ca8f0) then return BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_57ad665d0e8800ab56a0e07f8ae9c063(BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_8fb7e8aa09c39a951584e6d5671ca8f0, unpack(arg)); else return BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_57ad665d0e8800ab56a0e07f8ae9c063( function() end, unpack(arg)); end else local arg = {...}; return BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_8fb7e8aa09c39a951584e6d5671ca8f0(unpack(arg)); end end end local function BLHook_582fa3139ba129bd237cd5ebeea3b669(BLHook_c933410cf37b41b19e2f71899bab1b9b, BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af, BLHook_57ad665d0e8800ab56a0e07f8ae9c063, BLHook_3e3deb38dc835c5e5effd7e270f2e782) assert(BLHook_c31af5fd9021206e921af3d99e5a90af and BLHook_89d99bb0d06dd535e6d6f6d9b3f04006 and type(BLHook_c31af5fd9021206e921af3d99e5a90af) == "string", "Invalid parameters."); assert(not BLHook_3e3deb38dc835c5e5effd7e270f2e782 or (BLHook_3e3deb38dc835c5e5effd7e270f2e782 and BLHook_89d99bb0d06dd535e6d6f6d9b3f04006.SetScript and BLHook_89d99bb0d06dd535e6d6f6d9b3f04006.GetScript), "SetScript must be supported."); assert(BLHook_57ad665d0e8800ab56a0e07f8ae9c063, "Invalid handler."); local BLHook_4beaed21c43eb2b518924929137b0bcb; if (BLHook_3e3deb38dc835c5e5effd7e270f2e782) then BLHook_4beaed21c43eb2b518924929137b0bcb = BLHook_89d99bb0d06dd535e6d6f6d9b3f04006.GetScript(BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af); else BLHook_4beaed21c43eb2b518924929137b0bcb = BLHook_89d99bb0d06dd535e6d6f6d9b3f04006[BLHook_c31af5fd9021206e921af3d99e5a90af]; end if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006] and BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af]) then if (type(BLHook_57ad665d0e8800ab56a0e07f8ae9c063) == "string" and type(BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_57ad665d0e8800ab56a0e07f8ae9c063]) == "function") then if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_57ad665d0e8800ab56a0e07f8ae9c063 == BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_57ad665d0e8800ab56a0e07f8ae9c063]) then BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_98a5dc0296fddcc9b5b804f038f1994c = true; return true; else return false; end elseif (type(BLHook_57ad665d0e8800ab56a0e07f8ae9c063) == "function") then if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_57ad665d0e8800ab56a0e07f8ae9c063 == BLHook_57ad665d0e8800ab56a0e07f8ae9c063) then BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_98a5dc0296fddcc9b5b804f038f1994c = true; return true; else return false; end else return false; end end if (type(BLHook_57ad665d0e8800ab56a0e07f8ae9c063) == "string" and type(BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_57ad665d0e8800ab56a0e07f8ae9c063]) == "function") then local BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a = setmetatable({}, {__mode = "k"}); BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_8fb7e8aa09c39a951584e6d5671ca8f0 = BLHook_4beaed21c43eb2b518924929137b0bcb; BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_57ad665d0e8800ab56a0e07f8ae9c063 = BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_57ad665d0e8800ab56a0e07f8ae9c063]; BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_98a5dc0296fddcc9b5b804f038f1994c = true; if (not BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006]) then BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006] = {}; end BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af] = BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a; elseif (type(BLHook_57ad665d0e8800ab56a0e07f8ae9c063) == "function") then local BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a = setmetatable({}, {__mode = "k"}); BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_8fb7e8aa09c39a951584e6d5671ca8f0 = BLHook_4beaed21c43eb2b518924929137b0bcb; BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_57ad665d0e8800ab56a0e07f8ae9c063 = BLHook_57ad665d0e8800ab56a0e07f8ae9c063; BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_98a5dc0296fddcc9b5b804f038f1994c = true; if (not BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006]) then BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006] = {}; end BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af] = BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a; else assert(false); end local BLHook_b0b9e61e6d53127a631139a353c7249e = BLHook_7c65b06eaa2d4976aac9fa9f378c1eab(BLHook_c933410cf37b41b19e2f71899bab1b9b, BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af); if (BLHook_3e3deb38dc835c5e5effd7e270f2e782) then BLHook_89d99bb0d06dd535e6d6f6d9b3f04006.SetScript(BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af, BLHook_b0b9e61e6d53127a631139a353c7249e); else BLHook_89d99bb0d06dd535e6d6f6d9b3f04006[BLHook_c31af5fd9021206e921af3d99e5a90af] = BLHook_b0b9e61e6d53127a631139a353c7249e; end return true; end local function BLHook_dd083eb6169a0813b5f3f213d4b68ea4(BLHook_c933410cf37b41b19e2f71899bab1b9b, BLHook_c31af5fd9021206e921af3d99e5a90af, BLHook_57ad665d0e8800ab56a0e07f8ae9c063) assert(BLHook_c31af5fd9021206e921af3d99e5a90af and type(BLHook_c31af5fd9021206e921af3d99e5a90af) == "string" and type(BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_c31af5fd9021206e921af3d99e5a90af]) == "function", "Invalid parameters."); assert(not BLHook_c7ce51c934f9020f0684c67935ccd80b(BLHook_c31af5fd9021206e921af3d99e5a90af), "The function is reserved function."); assert(BLHook_57ad665d0e8800ab56a0e07f8ae9c063, "Invalid handler."); if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af]) then if (type(BLHook_57ad665d0e8800ab56a0e07f8ae9c063) == "string" and type(BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_57ad665d0e8800ab56a0e07f8ae9c063]) == "function") then if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_57ad665d0e8800ab56a0e07f8ae9c063 == BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_57ad665d0e8800ab56a0e07f8ae9c063]) then BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_98a5dc0296fddcc9b5b804f038f1994c = true; return true; else return false; end elseif (type(BLHook_57ad665d0e8800ab56a0e07f8ae9c063) == "function") then if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_57ad665d0e8800ab56a0e07f8ae9c063 == BLHook_57ad665d0e8800ab56a0e07f8ae9c063) then BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_98a5dc0296fddcc9b5b804f038f1994c = true; return true; else return false; end else return false; end end if (type(BLHook_57ad665d0e8800ab56a0e07f8ae9c063) == "string" and type(BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_57ad665d0e8800ab56a0e07f8ae9c063]) == "function") then local BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a = setmetatable({}, {__mode = "k"}); BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_8fb7e8aa09c39a951584e6d5671ca8f0 = BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_c31af5fd9021206e921af3d99e5a90af]; BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_57ad665d0e8800ab56a0e07f8ae9c063 = BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_57ad665d0e8800ab56a0e07f8ae9c063]; BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_98a5dc0296fddcc9b5b804f038f1994c = true; BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af] = BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a; elseif (type(BLHook_57ad665d0e8800ab56a0e07f8ae9c063) == "function") then local BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a = setmetatable({}, {__mode = "k"}); BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_8fb7e8aa09c39a951584e6d5671ca8f0 = BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_c31af5fd9021206e921af3d99e5a90af]; BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_57ad665d0e8800ab56a0e07f8ae9c063 = BLHook_57ad665d0e8800ab56a0e07f8ae9c063; BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a.BLHook_98a5dc0296fddcc9b5b804f038f1994c = true; BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af] = BLHook_75acc2d3d4d56cfaf0ddf3ba6d8c317a; else assert(false); end local BLHook_b0b9e61e6d53127a631139a353c7249e = BLHook_f8dfa5efe2834873e4d255c8b895f36a(BLHook_c933410cf37b41b19e2f71899bab1b9b, BLHook_c31af5fd9021206e921af3d99e5a90af); BLHook_bfaaabe937ee64ae701cfcf9fd092319[BLHook_c31af5fd9021206e921af3d99e5a90af] = BLHook_b0b9e61e6d53127a631139a353c7249e; return true; end local function BLHook_c7c820a43eeaf2e68f0926f153af2574(BLHook_c933410cf37b41b19e2f71899bab1b9b, BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af) assert(BLHook_c31af5fd9021206e921af3d99e5a90af and BLHook_89d99bb0d06dd535e6d6f6d9b3f04006 and type(BLHook_c31af5fd9021206e921af3d99e5a90af) == "string"); if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006]) then if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af]) then BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_89d99bb0d06dd535e6d6f6d9b3f04006][BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_98a5dc0296fddcc9b5b804f038f1994c = false; end end end local function BLHook_cc0959e6705d235dfb65099d024cd2cd(BLHook_c933410cf37b41b19e2f71899bab1b9b, BLHook_c31af5fd9021206e921af3d99e5a90af) assert(BLHook_c31af5fd9021206e921af3d99e5a90af and type(BLHook_c31af5fd9021206e921af3d99e5a90af) == "string"); assert(not BLHook_c7ce51c934f9020f0684c67935ccd80b(BLHook_c31af5fd9021206e921af3d99e5a90af)); if (BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af]) then BLHook_c933410cf37b41b19e2f71899bab1b9b.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68[BLHook_c31af5fd9021206e921af3d99e5a90af].BLHook_98a5dc0296fddcc9b5b804f038f1994c = false; end end function BHook:constructor() self.BLHook_bdd0b4e051ab76bbe48355f0ab0f6a68 = {}; end function BHook:Hook(BLHook_0e2babf2e3097eec96cf9280d1412ab5, BLHook_00ae4bc475ffbcf97f789256a2e707de, BLHook_6599f8c6a1b53d0212dfbab04e14e329) local BLHook_89d99bb0d06dd535e6d6f6d9b3f04006; local BLHook_c31af5fd9021206e921af3d99e5a90af; local BLHook_57ad665d0e8800ab56a0e07f8ae9c063; if (BLHook_6599f8c6a1b53d0212dfbab04e14e329) then BLHook_89d99bb0d06dd535e6d6f6d9b3f04006 = BLHook_0e2babf2e3097eec96cf9280d1412ab5; BLHook_c31af5fd9021206e921af3d99e5a90af = BLHook_00ae4bc475ffbcf97f789256a2e707de; BLHook_57ad665d0e8800ab56a0e07f8ae9c063 = BLHook_6599f8c6a1b53d0212dfbab04e14e329; return BLHook_582fa3139ba129bd237cd5ebeea3b669(self, BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af, BLHook_57ad665d0e8800ab56a0e07f8ae9c063); else BLHook_c31af5fd9021206e921af3d99e5a90af = BLHook_0e2babf2e3097eec96cf9280d1412ab5; BLHook_57ad665d0e8800ab56a0e07f8ae9c063 = BLHook_00ae4bc475ffbcf97f789256a2e707de; return BLHook_dd083eb6169a0813b5f3f213d4b68ea4(self, BLHook_c31af5fd9021206e921af3d99e5a90af, BLHook_57ad665d0e8800ab56a0e07f8ae9c063); end end function BHook:HookScript(BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af, BLHook_57ad665d0e8800ab56a0e07f8ae9c063) return BLHook_582fa3139ba129bd237cd5ebeea3b669(self, BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af, BLHook_57ad665d0e8800ab56a0e07f8ae9c063, true); end function BHook:Unhook(BLHook_0e2babf2e3097eec96cf9280d1412ab5, BLHook_00ae4bc475ffbcf97f789256a2e707de) local BLHook_89d99bb0d06dd535e6d6f6d9b3f04006; local BLHook_c31af5fd9021206e921af3d99e5a90af; if (BLHook_00ae4bc475ffbcf97f789256a2e707de) then BLHook_89d99bb0d06dd535e6d6f6d9b3f04006 = BLHook_0e2babf2e3097eec96cf9280d1412ab5; BLHook_c31af5fd9021206e921af3d99e5a90af = BLHook_00ae4bc475ffbcf97f789256a2e707de; return BLHook_c7c820a43eeaf2e68f0926f153af2574(self, BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af); else BLHook_c31af5fd9021206e921af3d99e5a90af = BLHook_0e2babf2e3097eec96cf9280d1412ab5; return BLHook_cc0959e6705d235dfb65099d024cd2cd(self, BLHook_c31af5fd9021206e921af3d99e5a90af); end end function BHook:UnhookScript(BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af) return BLHook_c7c820a43eeaf2e68f0926f153af2574(self, BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af); end function BHook:HookItemTip(BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af) assert(type(BLHook_c31af5fd9021206e921af3d99e5a90af) == "function" or type(BLHook_c31af5fd9021206e921af3d99e5a90af) == "string", format("BHook: The hooked method need a function value got a %s", type(BLHook_c31af5fd9021206e921af3d99e5a90af))); assert(BLHook_89d99bb0d06dd535e6d6f6d9b3f04006:GetFrameType() == "GameTooltip", "HookItemTip: The object need a \"GameTooltip\" UiObject."); for _, BLHook_a00724ebfb071ad7332b17a872f4f736 in pairs(BLHook_691f389cf6bf1220f5cac72f2bb8f0de) do hooksecurefunc(BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_a00724ebfb071ad7332b17a872f4f736, BLHook_c31af5fd9021206e921af3d99e5a90af); end end BLibrary:Register(BHook, "BHook", BLHook_dbdf11f5b07258936fb1c5a31eaa969c, BLHook_1b5523f0adb45c4b8ee51f89ebf6f2b2); BigFoot_HookItemTip = function(BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af) BHook:HookItemTip(BLHook_89d99bb0d06dd535e6d6f6d9b3f04006, BLHook_c31af5fd9021206e921af3d99e5a90af); end
