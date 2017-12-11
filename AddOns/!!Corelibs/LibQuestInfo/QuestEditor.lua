-- Debug Frame Events
-- @debug@

local Updatetable
function LibQuestInfoScrollFrame_OnLoad(frame)
	HybridScrollFrame_CreateButtons(frame, "LibQuestInfoButtonTemplate");
	local width = frame:GetWidth()
	frame.update = function() LibQuestInfoScrollFrame_Update() end
	
	for i=1, #frame.buttons do
		local button = frame.buttons[i]
		button:Reset()
		button:SetText(button:GetName())
		button:SetWidth(width)
		button:SetScript("OnClick", function(button)
			if button.HeaderKey then
				if Updatetable.Zonestate[button.HeaderKey] == 1 then
					Updatetable.Zonestate[button.HeaderKey] = 0
				else
					Updatetable.Zonestate[button.HeaderKey] = 1
				end
				LibQuestInfoScrollFrame_Update(1)
				return
			end
			
			if button.qID then
				LibQuestInfoLoadQuest(button.qID)
				LibQuestInfoFrameHighlight:Show()
				LibQuestInfoFrameHighlight:SetPoint("TOPLEFT", button, "TOPLEFT",0,0)
				LibQuestInfoFrameHighlight:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT",0,0)
				LibQuestInfoFrameHighlight.qid = button.qID;
			end
			
		end)
	end
	
	local buttonheigth = frame.buttons[1]:GetHeight()
	HybridScrollFrame_Update(frame, #frame.buttons * buttonheigth, #frame.buttons * buttonheigth);
end

function LibQuestInfoLoadQuest(qID)
	local QuestFrame = LibQuestInfoFrameEditFrame
	
	-- prepare default state
	-- hide  objectives
	for i = 1, 10, 1 do
		QuestFrame["OLabel" .. i]:Hide()
		QuestFrame["OBtn" .. i]:Hide()
	end
	
	QuestFrame.EditMinLevel:Hide()
	QuestFrame.MinLevelLabel:SetFontObject(GameFontDisableSmallLeft)
	
	
	--print("you clicked on qid: " .. qID)
	if not QuestFrame.Questdata or QuestFrame.Questdata.Q ~= qID then
		local questdata = string.match(QuestDB[ceil(qID/100)], "|(Q"..qID..";.-|)")
		QuestFrame.Questdata = lib:UnpackQuestData(questdata)
		QuestFrame.Questdata.Q = qID
	end
	
	ShowUIPanel(ItemRefTooltip);
	ItemRefTooltip:SetOwner(LibQuestInfoFrame, "ANCHOR_BOTTOM");
	ItemRefTooltip:SetHyperlink("quest:" .. qID)
	--ItemRefTooltip:Show()
	
	if QuestFrame.Questdata.O and QuestFrame.Questdata.O > 0 then
		for i = 1, QuestFrame.Questdata.O, 1 do
			QuestFrame["OLabel" .. i]:Show()
			QuestFrame["OBtn" .. i]:Show()
			QuestFrame["OBtn" .. i]:SetText(ObjectiveTypes[QuestFrame.Questdata["o" .. i]] or "Unknown")
		end
	end
	
	if QuestFrame.Questdata.T then
		QuestFrame.BtnTag:SetText(TagTypes[QuestFrame.Questdata.T] or "Unknown")
	else
		QuestFrame.BtnTag:SetText("None")
	end
	QuestFrame:Show()
end

function LibQuestInfoScrollFrame_Update(force)
	-- refresh datatable
	if not Updatetable or Updatetable.NextUpdate < time() or force then
		if not Updatetable then
			-- first time, create defaults
			Updatetable = {
				NextUpdate = time() + 300,
				Zones = {},
				Zonestate = {},
			}
		else
			for k in pairs(Updatetable.Zones) do
				Updatetable.Zones[k] = nil
			end
		end
		
		Updatetable.NextUpdate = time() + 300
		
		for zonekey in pairs(QuestZones) do
			-- zone
			local zonename = lib:GetQuestCategoryName(zonekey)
			
			if not Updatetable.Zonestate[zonename] then
				Updatetable.Zonestate[zonename] = 1
			else
				if Updatetable.Zonestate[zonename] ~= 1 then
					if not ZoneCache[zonename] then
						-- unserialize zonedata to display it
						ZoneCache[zonekey] = {strsplit('|', QuestZones[zonekey])};
						for k in ipairs(ZoneCache[zonekey]) do
							ZoneCache[zonekey][k] = tonumber(ZoneCache[zonekey][k])
						end
					end
					table.sort(ZoneCache[zonekey], function(a,b)
							if (lib:GetQuestName(a,1) or "ZZZ " .. a) < (lib:GetQuestName(b,1) or "ZZZ " .. b) then
								return true
							end
							return false
						end
					)
				elseif ZoneCache[zonename] and Updatetable.Zonestate[zonename] ~= 1 then
					-- clean up old zonecache to save memory
					for k in pairs(ZoneCache[zonename]) do
						ZoneCache[zonename][k] = nil;
					end
					ZoneCache[zonename] = nil;
				end
			end
			
			local found
			for k, zname in pairs(Updatetable.Zones) do
				if zname == zonename then
					found = true
					break
				end
			end
			
			if not found then
				table.insert(Updatetable.Zones, zonename)
			end
		end
		
		table.sort(Updatetable.Zones)
	end
	
	
	LibQuestInfoFrameHighlight:Hide();
	
	local SrollFrame = LibQuestInfoFrameScrollFrame
	local buttonheigth = SrollFrame.buttons[1]:GetHeight()
	
	local i = -HybridScrollFrame_GetOffset(SrollFrame) + 1
	
	for k, zonename in pairs(Updatetable.Zones) do
		local zonekey = lib:GetQuestCategoryKey(zonename)
		if i > 0 and i <= #SrollFrame.buttons then
			local button = SrollFrame.buttons[i]
			button:Reset()
			button.HeaderKey = zonename;
			button:SetButton(button)
			button:SetText(zonename)
			button.tag:SetText("#".. (QuestZones[zonekey] and lib:CountChars(QuestZones[zonekey], "|") or 0))
			if Updatetable.Zonestate[zonename] == 1 then
				button:SetNormalTexture([[Interface\Buttons\UI-PlusButton-UP]])
			end
--			QuestLogTitleButton_Resize(button)
		end
		i = i + 1
		if Updatetable.Zonestate[zonename] ~= 1 then
			for k, qid in pairs(ZoneCache[zonekey]) do
				if i > 0 and i <= #SrollFrame.buttons then
					local button = SrollFrame.buttons[i]
					button:Reset()
					button.qID = qid
					button:SetText(lib:GetQuestName(qid) or "Quest not in Cache! (QuestID: " .. qid .. ")")
					button.tag:SetText("qID: " .. qid)
					if button.qID == LibQuestInfoFrameHighlight.qid then
						LibQuestInfoFrameHighlight:Show()
						LibQuestInfoFrameHighlight:SetPoint("TOPLEFT", button, "TOPLEFT",0,0)
						LibQuestInfoFrameHighlight:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT",0,0)
					end
				end
				i = i + 1
				if i > #SrollFrame.buttons then
					break;
				end
			end
			if i > #SrollFrame.buttons then
				break;
			end
		end
	end

	for j = i, #SrollFrame.buttons do
		if j > 0 then
			SrollFrame.buttons[j]:Reset(SrollFrame.buttons[j])
			SrollFrame.buttons[j]:Disable()
		end
	end
	
	-- calc # lines
	local totallines = 0
	for k, zonename in pairs(Updatetable.Zones) do
		local zonekey = lib:GetQuestCategoryKey(zonename)
		totallines = totallines + 1
		if Updatetable.Zonestate[zonename] ~= 1 then
			totallines = totallines + (QuestZones[zonekey] and lib:CountChars(QuestZones[zonekey], "|") or 0)
		end
	end
	HybridScrollFrame_Update(SrollFrame, (totallines)  * buttonheigth, #SrollFrame.buttons * buttonheigth);

	
end

function LibQuestInfoFrame_OnLoad(self)
	self:SetScript("OnUpdate", function(self, elapsed)
		if not self.updatetime or self.updatetime < 0 then 
			self.updatetime = 1
		end
		
		self.updatetime = self.updatetime - elapsed
		
		if self.updatetime > 0 then
			return
		end
		LibQuestInfoScrollFrame_Update()
	end)
end

function LibQuestInfoSelectFrame_OnShow(frame)
	
	if frame.mode == "Zone" then
		frame.Btn1:Hide()
		frame.Btn2:Hide()
		frame.Btn3:Hide()
		frame.Btn4:Hide()
		frame.Btn5:Hide()
		frame.Btn6:Hide()
		frame.Btn7:Hide()
		--frame.Zones:Show()
	else
		frame.Btn1:Show()
		frame.Btn1:SetText("None")
		frame.Btn2:Show()
		frame.Btn3:Show()
		frame.Btn4:Show()
		frame.Btn5:Show()
		frame.Btn6:Show()
		frame.Btn7:Show()
		frame:SetWidth(160)
		frame:SetHeight(135)
		--frame.Zones:Hide()
	end
	
	frame:ClearAllPoints()
	
	
	if frame.mode == "Tag" then
		frame:SetPoint("CENTER", frame:GetParent().BtnTag ,"CENTER",0,0)
		local i = 2
		for k, v in pairs(TagTypes) do
			frame["Btn" .. i]:SetText(v)
			frame["Btn" .. i].id = k
			i = i + 1
		end
	elseif frame.mode == "Zone" then
		frame:SetPoint("CENTER", frame:GetParent():GetParent() ,"CENTER",0,0)
		frame:SetHeight(frame:GetParent():GetParent():GetHeight())
		frame:SetWidth(frame:GetParent():GetParent():GetWidth())
	elseif frame.mode:sub(1,9) == "Objective" then
		local id = tonumber(frame.mode:sub(10))
		frame:SetID(id)
		frame:SetPoint("CENTER", frame:GetParent()["OBtn" .. id] ,"CENTER",0,0)
		local i = 2
		for k, v in pairs(ObjectiveTypes) do
			frame["Btn" .. i]:SetText(v)
			frame["Btn" .. i].id = k
			i = i + 1
		end
	end
--	print("show " .. frame:GetName())
end

function LibQuestInfoSelectFrameButton_OnClick(button)
	local SelectFrame = _G["LibQuestInfoFrameEditFrameSelectFrame"]
	local EditFrame = SelectFrame:GetParent()
	
	
	
	if SelectFrame.mode == "Tag" then
		EditFrame.Questdata.T = button.id
	elseif SelectFrame.mode == "Zone" then
		EditFrame.Questdata.Z = button.id
	elseif SelectFrame.mode:sub(1,9) == "Objective" then
		EditFrame.Questdata["o" .. button:GetID()] = button.id
	end
	
	--print("button clicked " .. EditFrame:GetName())
	SelectFrame:Hide()
	LibQuestInfoLoadQuest(EditFrame.Questdata.Q)
end

function LibQuestInfoTileButton_OnLoad(button)
	button:SetText(button:GetName())
	button.tag:Show()
	button.Reset = function(button)
		button:Enable()
		button:SetText("")
		button.tag:SetText("")
		button:SetNormalTexture("")
		button:SetHighlightTexture("")
		button:SetNormalFontObject(GameFontNormalLeft)
		button.HeaderKey = nil
		button.qID = nil
	end
	button.SetButton = function(button)
		button:SetNormalFontObject(GameFontHighlight)
		button:SetNormalTexture([[Interface\Buttons\UI-MinusButton-UP]])
		button:SetHighlightTexture([[Interface\Buttons\UI-PlusButton-Hilight]])
	end
end

function lib_cleanup()
	for k in pairs(beql.db.global.QuestData) do
		if beql.db.global.QuestData[k].O then
			for i = beql.db.global.QuestData[k].O + 1, 30 do
				beql.db.global.QuestData[k]["o" .. i] = nil
			end
		end
		
		if beql.db.global.QuestData[k].T then
			local flags = {strsplit(":", beql.db.global.QuestData[k].T)}
			if #flags > 1 then
				for m, v in pairs(flags) do
					if v == "Y" then
						beql.db.global.QuestData[k].Y = 1
					else
						beql.db.global.QuestData[k].T = v
					end
				end
			end
		end
		
		if beql.db.global.QuestData[k].zone then
			if not beql.db.global.QuestData[k].Z or beql.db.global.QuestData[k].Z == beql.db.global.QuestData[k].zone then
				beql.db.global.QuestData[k].Z = beql.db.global.QuestData[k].zone
				beql.db.global.QuestData[k].zone = nil
			end
		end
		
		if beql.db.global.QuestData[k].Z then
			lib.callbacks:Fire("ZoneUpdate", k, beql.db.global.QuestData[k].Z)
		else
			lib.callbacks:Fire("ZoneUpdate", k, "UNKNOWN")
		end
		
		if beql.db.global.QuestData[k].queststring then
			local q = lib:UnpackQuestData(beql.db.global.QuestData[k].queststring)
			for l in pairs(q) do
				if not beql.db.global.QuestData[k][l] or beql.db.global.QuestData[k][l] ~= q[l] then
					beql.db.global.QuestData[k][l] = q[l]
				end
			end
		end
		
		beql.db.global.QuestData[k].serial = lib:PackQuestData(beql.db.global.QuestData[k], k)
		lib.callbacks:Fire("QuestUpdate", k, beql.db.global.QuestData[k].serial)
	end
end

--@end-debug@
