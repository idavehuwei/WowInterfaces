-----------------------------------------

AtrL = {};

-----------------------------------------

function Atr_PickLocalizationTable (locale)

	--DEFAULT_CHAT_FRAME:AddMessage (locale);

	local f = getglobal ("AtrBuildLTable_"..locale);
	if (type (f) == "function") then
		f();
		--DEFAULT_CHAT_FRAME:AddMessage ("found");
	else
		AtrBuildLTable_enUS();
		--DEFAULT_CHAT_FRAME:AddMessage ("not found");
	end

end

-----------------------------------------

Atr_PickLocalizationTable (GetLocale());

-----------------------------------------

function ZT (s)

	if (s == nil or s == "") then
		return s;
	end
	
	if (AtrL) then
		local s1 = AtrL[s];
		if (s1 and s1 ~= "" and not ZC_StringStartsWith ("XXXXX")) then		
			return s1;
		end
	end
		
	return s;
end




-----------------------------------------

function ZC_IsEnglishLocale()

	return (GetLocale() == "enUS" or GetLocale() == "enGB");

end

-----------------------------------------

local testt = {};
local Atr_excludes = { Cancel=1, Okay=1, Done=1, Close=1 }

-----------------------------------------

local function Atr_LocalizeChildText (frame)

	local child;
	local subregions = { frame:GetRegions() };
	for _, child in ipairs(subregions) do

		if  (type (child.GetText) == "function") then
			local ftext = child:GetText();
			local fname = tostring(child:GetName());
			
			if (ftext and ftext ~= "" and not Atr_excludes[ftext] and not ZC_StringStartsWith (fname, "AuctionatorEntry")) then
				testt[ftext] = 1;
				child:SetText (ZT(ftext));
			end
		end
	end
	
	local kids = { frame:GetChildren() };
	for _, child in ipairs(kids) do
		
		if  (type (child.GetText) == "function") then
			local ftext = child:GetText();
			local fname = tostring(child:GetName());
			
			if (ftext and ftext ~= "" and not Atr_excludes[ftext] and not ZC_StringStartsWith (fname, "AuctionatorEntry")) then
				testt[ftext] = 1;
				
				child:SetText (ZT(ftext));
			end
		end
			
		if (child:GetFrameType() ~= "Button") then
			Atr_LocalizeChildText (child);
		end
	end			

end

-----------------------------------------

function Atr_LocalizeFrames ()

	local frame = EnumerateFrames()
	while frame do
		local fname		= frame:GetName();
		local pname		= (frame:GetParent() and frame:GetParent():GetName() or nil);
		
		local isAuctionatorFrame = (ZC_StringStartsWith (fname, "Atr") or ZC_StringStartsWith (fname, "Auctionator")) and ZC_StringSame (pname, "UIParent");
		if (fname == "Atr_Sell_Panel") then
			isAuctionatorFrame = true;
		end
		
		if ( isAuctionatorFrame ) then
			Atr_LocalizeChildText (frame);
		end
		
		frame = EnumerateFrames(frame)
	end

--	ZC_PrintKeysSorted (testt);

end

-----------------------------------------

local gItemClasses;
local gItemSubClasses;

-----------------------------------------

function Atr_IsWeapon (itemType)

	return (Atr_ItemType2AuctionClass (itemType) == 1);
end

-----------------------------------------

function Atr_IsArmor (itemType)

	return (Atr_ItemType2AuctionClass (itemType) == 2);
end


-----------------------------------------

function Atr_ItemType2AuctionClass(itemType)

	if (gItemClasses == nil) then
		gItemClasses = { GetAuctionItemClasses() };
	end
	
	if #gItemClasses > 0 then
	local itemClass;
		for x, itemClass in pairs(gItemClasses) do
			if (ZC_StringSame (itemClass, itemType)) then
				return x;
			end
		end
	end
end


-----------------------------------------

function Atr_SubType2AuctionSubclass(auctionClass, itemSubtype)

	if (gItemSubClasses == nil) then
		gItemSubClasses = { GetAuctionItemSubClasses(auctionClass) };
	end
	
	if #gItemSubClasses > 0 then
	local itemSubClass;
		for x, itemSubClass in pairs(gItemSubClasses) do
			if (ZC_StringSame (itemSubClass, itemSubtype)) then
				return x;
			end
		end
	end
end


