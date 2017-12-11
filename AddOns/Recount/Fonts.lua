local Recount = _G.Recount
local FontStrings={}
local FontFile
local SM = LibStub:GetLibrary("LibSharedMedia-3.0")

--First thing first need to add fonts
SM:Register("font", "ABF",		[[Interface\AddOns\Recount\Fonts\ABF.ttf]])

function Recount:AddFontString(string)
	local Font, Height, Flags

	FontStrings[#FontStrings+1]=string

	if not FontFile and Recount.db.profile.Font then
		FontFile=SM:Fetch("font",Recount.db.profile.Font)
	end

	if FontFile then
		Font, Height, Flags = string:GetFont()
		if Font~=FontFile then
			string:SetFont(FontFile, Height, Flags)
		end
	end
end

function Recount:SetFont(fontname)
	local Height, Flags

	Recount.db.profile.Font=fontname
	FontFile=SM:Fetch("font",fontname)

	for _, v in pairs(FontStrings) do
		_, Height, Flags = v:GetFont()
		v:SetFont(FontFile, Height, Flags)
	end
end