function DCT_CastBar_Setup(barp,per,color)
	local p = getglobal(barp:GetName().."Status")
	p:SetMinMaxValues(0,1)
	p:SetValue(per)
	if color then
		p:SetStatusBarColor(color[1],color[2],color[3])
	end
end
