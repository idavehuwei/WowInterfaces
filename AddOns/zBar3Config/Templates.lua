zBarOptionTemplate = {}

function zBarOptionTemplate:Load(typeName)
	self.typeName = typeName
	self.text = getglobal(self:GetName().."Text")
	if (self.text) then
		self.SetText = function(self, text)
			self.text:SetText(text)
		end
		self.SetTextColor = function(self, ...)
			self.text:SetTextColor(...)
		end
		self.SaveTextColor = function(self)
			self.textColor = {self.text:GetTextColor()}
		end
		self.ResetTextColor = function(self)
			self:SetTextColor(unpack(self.textColor))
		end
	end
end

function zBarOptionTemplate:Enter()
	if (self.tooltipText ) then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:SetText(self.tooltipText, nil, nil, nil, nil, 1);
	end
	if (self.tooltipRequirement ) then
		GameTooltip:AddLine(self.tooltipRequirement, "", 1.0, 1.0, 1.0);
		GameTooltip:Show();
	end
	if (self:IsEnabled()) then
		self:SetTextColor(1.0,1.0,1.0)
	end
end

function zBarOptionTemplate:Leave()
	GameTooltip:Hide();
	self:ResetTextColor()
end