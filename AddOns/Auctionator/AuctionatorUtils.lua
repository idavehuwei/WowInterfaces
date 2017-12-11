
-----------------------------------------

function ZC_EnableDisable (elem, b)

	if (b) then
		elem:Enable();
	else
		elem:Disable();
	end
end

-----------------------------------------

function ZC_PrintKeysSorted (t)

	local ta = {};
	
	for a,v in pairs (t) do
		table.insert (ta, a);
	end

	table.sort (ta, function (a,b) return (a:lower() < b:lower()); end);

	for x = 1, #ta do
		ZC_pinkmsg (x.."   "..ta[x]);
	end

end

-----------------------------------------

function ZC_UTF8_Truncate (s, newlen)

	if (s:len() <= newlen) then
		return s;
	end
	
	local x, c;
	
	for x = newlen, 1, -1 do
		
		c = s:byte(x+1);
		
		if (bit.band (c, 0xC0) == 0x80) then
			return s:sub (1, x-1);
		end
		
	end

end

-----------------------------------------

function ZC_GetArrayElemOrFirst (a, x)

	if (a and #a > 0) then
		if (x == nil or x < 1 or x > #a) then
			x = 1;
		end
		
		return a[x];
	end

	return nil;
end

-----------------------------------------

function ZC_GetArrayElemOrNil (a, x)

	if (a and #a > 0) then
		if (x == nil or x < 1 or x > #a) then
			return nil;
		end
		
		return a[x];
	end

	return nil;
end

-----------------------------------------

function ZC_padstring (s, n, c)
	while (string.len (s) < n) do
		s = c..s;
	end
	
	return s;
end


-----------------------------------------

local encTable = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z", 
				  "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
				  "0","1","2","3","4","5","6","7","8","9",
				  "-", "_" };
				  

local decTable;

-----------------------------------------

function ZC_enc64 (n)

	if (n == 0) then
		return encTable[1];
	end

	local k = n;
	local x;
	local result = "";
	
	while k ~= 0 do
		x = bit.band (k, 63);
		result = encTable[x+1]..result;
		k = bit.rshift (k, 6);
	end

	return result;
end

-----------------------------------------

function ZC_dec64 (s)

	if (s == nil or s == "") then
		return 0;
	end

	if (decTable == nil) then
		decTable = {};
		local i;
		for i = 1,64 do
			decTable[encTable[i]] = i-1;
		end
	end

	local result = 0;
	local len = string.len (s);
	local x;
	
	for x = 1, len do
		result = result * 64;
		result = result + decTable[string.sub(s,x,x)];
	end
	
	return result;
end

-----------------------------------------

function ZC_words(str)
	local t = {}
	local function helper(word) table.insert(t, word) return "" end
	if (not str:gsub("%w+", helper):find"%S") then
		if (#t == 1) then return t[1]; end;	
		if (#t == 2) then return t[1],t[2]; end;	
		if (#t == 3) then return t[1],t[2],t[3]; end;	
		if (#t == 4) then return t[1],t[2],t[3],t[4]; end;
		return t;
	end
end

-----------------------------------------

local gDeferredCalls = {};

-----------------------------------------

function ZC_AddDeferredCall (seconds, funcname, param1, param2, tag)	-- tag is optional.  if present used to overwrite prior call with same tag

	local now = time();

	local cfdEntry = {};

	cfdEntry.funcname	= funcname;
	cfdEntry.param1		= param1;
	cfdEntry.param2		= param2;
	cfdEntry.when		= now + seconds;
	cfdEntry.tag		= "";
	
	if (tag) then
		cfdEntry.tag = tag;

		for i = 1, #gDeferredCalls do
			if (gDeferredCalls[i].tag == tag) then
				gDeferredCalls[i] = cfdEntry;		-- overwrite
				return;
			end
		end
	end

	table.insert (gDeferredCalls, cfdEntry);
end


-----------------------------------------

function ZC_CheckDeferredCall ()

	local now = time();
	local i;
	
	for i = 1, #gDeferredCalls do
		if (gDeferredCalls[i].when < now) then
			local fcn = getglobal(gDeferredCalls[i].funcname);
			local p1 = gDeferredCalls[i].param1;
			local p2 = gDeferredCalls[i].param2;
			table.remove (gDeferredCalls, i);
			if (type(fcn) == 'function') then
				fcn(p1, p2);
			end
			
			return;		-- only do one
		end
	end

end

-----------------------------------------

function ZC_periodic (elem, name, period, elapsed)
	
	local t = elem[name] or 0;
	
	t = t + elapsed;
	
	if (t > period) then
		elem[name] = 0;
		return true;
	end
	
	elem[name] = t;
	return false;
end
	

-----------------------------------------

function ZC_PrintTable (t, indent)

	if (not indent) then
		indent = 0;
	end
	
	local x
	local padding = "";
	for x = 1,indent do
		padding = padding.."  ";
	end

	ZC_chatmsg ("-------");
	
	for n, v in pairs (t) do
		if (type(v) == "table") then
			ZC_chatmsg2 (padding..n, "TABLE");
			ZC_PrintTable(v, indent+1);
		elseif (type(v) == "userdata") then
			ZC_chatmsg2 (padding..n, "userdata");
		else
			ZC_chatmsg2 (padding..n, v);
		end
	end

end

-----------------------------------------

function ZC_ItemIDfromLink (itemLink)

	if (itemLink == nil) then
		return 0,0,0;
	end
	
	local found, _, itemString = string.find(itemLink, "^|c%x+|H(.+)|h%[.*%]")
	local _, itemId, _, _, _, _, _, suffixId, uniqueId = strsplit(":", itemString)

	return itemId, suffixId, uniqueId;

end

-----------------------------------------

function ZC_BoolToString (b)
	if (b) then
		return "true";
	end

	return "false";
end

-----------------------------------------

function ZC_BoolToNum (b)
	if (b) then
		return 1;
	end

	return 0;
end

-----------------------------------------

function ZC_NumToBool (n)
	if (n == 0) then
		return false;
	end

	return true;
end

-----------------------------------------

function ZC_pluralizeIf (word, count)

	if (count and count == 1) then
		return word;
	else
		return ZC_pluralize(word);
	end
end

-----------------------------------------

function ZC_pluralize (word)

	return word.."s";

end

-----------------------------------------

function ZC_round (v)
	return math.floor (v + 0.5);
end

-----------------------------------------

function ZC_redmsg (msg)
	ZC_chatmsg (msg, 1, 0, 0);
end

-----------------------------------------

function ZC_pinkmsg (msg)
	ZC_chatmsg (msg, 1, .6, .6);
end

-----------------------------------------

function ZC_yellowmsg (msg)
	ZC_chatmsg (msg, 1, 1, 0);
end

-----------------------------------------

function ZC_chatmsg (msg, red, green, blue)
	if (DEFAULT_CHAT_FRAME) then
		if (msg == nil) then
			DEFAULT_CHAT_FRAME:AddMessage ("<nil>", red, green, blue);
		else
			DEFAULT_CHAT_FRAME:AddMessage (msg, red, green, blue);
		end
	end
end

-----------------------------------------

function ZC_chatmsg2 (msg1, msg2)
	if (DEFAULT_CHAT_FRAME) then
		local msg = "";

		if (type(msg1) == "boolean") then	msg1 = ZC_BoolToString(msg1);	end;
		if (type(msg2) == "boolean") then	msg2 = ZC_BoolToString(msg2);	end;

		if (msg1 == nil) then msg = "nil";
		else				  msg = msg1;
		end

		if (msg2 == nil) then msg = msg.." nil";
		else				  msg = msg.." "..msg2;
		end

		DEFAULT_CHAT_FRAME:AddMessage (msg);
	end
end



-----------------------------------------

function ZC_val2gsc (v)
	local rv = ZC_round(v)

	local g = math.floor (rv/10000);

	rv = rv - g*10000;

	local s = math.floor (rv/100);

	rv = rv - s*100;

	local c = rv;

	return g, s, c
end

-----------------------------------------

function ZC_priceToString (val)

	local gold, silver, copper  = ZC_val2gsc(val);

	local st = "";


	if (gold ~= 0) then
		st = gold.."g ";
	end


	if (st ~= "") then
		st = st..format("%02is ", silver);
	elseif (silver ~= 0) then
		st = st..silver.."s ";
	end


	if (st ~= "") then
		st = st..format("%02ic", copper);
	elseif (copper ~= 0) then
		st = st..copper.."c";
	end

	return st;
end

-----------------------------------------

local goldicon		= "|TInterface\\MoneyFrame\\UI-GoldIcon:12:12:4:0|t"
local silvericon	= "|TInterface\\MoneyFrame\\UI-SilverIcon:12:12:4:0|t"
local coppericon	= "|TInterface\\MoneyFrame\\UI-CopperIcon:12:12:4:0|t"

-----------------------------------------

function ZC_priceToMoneyString (val)

	local gold, silver, copper  = ZC_val2gsc(val);

	local st = "";

	if (gold ~= 0) then
		st = gold..goldicon.."  ";
	end


	if (st ~= "") then
		st = st..format("%02i%s  ", silver, silvericon);
	elseif (silver ~= 0) then
		st = st..silver..silvericon.."  ";
	end


	if (st ~= "") then
		st = st..format("%02i%s", copper, coppericon);
	elseif (copper ~= 0) then
		st = st..copper..coppericon;
	end

	return st;

end

-----------------------------------------

function ZC_StringSame (s1, s2)
	if (s1 == nil and s2 == nil) then
		return true;
	end
	
	if (s1 == nil or s2 == nil) then
		return false;
	end

	if (s1 == s2) then		-- maybe will fix german umlaut problem?
		return true;
	end

	return (string.lower (s1) == string.lower (s2));
end

-----------------------------------------

function ZC_StringContains (s, sub)
	if (sub == nil or sub == "") then
		return false;
	end

	local start, stop = string.find (string.lower(s), string.lower(sub), 1, true);

	return (start ~= nil);
end

-----------------------------------------

function ZC_StringEndsWith (s, sub)

	if (sub == nil or sub == "") then
		return false;
	end

	local i = string.len(s) - string.len(sub);

	if (i < 0) then
		return false;
	end

	local sEnd = string.sub (s, i+1);

	return (string.lower (sEnd) == string.lower (sub));

end

-----------------------------------------

function ZC_StringStartsWith (s, sub)

	if (s == nil or sub == nil or sub == "") then
		return false;
	end

	local sublen = string.len (sub);

	if (string.len (s) < sublen) then
		return false;
	end

	return (string.lower (string.sub(s, 1, sublen)) == string.lower(sub));

end

-----------------------------------------

function ZC_CopyDeep (src)

	local result = {};

	for n, v in pairs (src) do
		if (type(v) == "table") then
			result[n] = ZC_CopyDeep(v);
		else
			result[n] = v;
		end
	end

	return result;

end

-----------------------------------------

function ZC_printableLink (link)

	if (link == nil) then
		return "nil";
	end
	
	local printable = gsub(link, "\124", "\124\124");

	return printable;
end

-----------------------------------------

function ZC_printmem ()

	local cmem = math.floor(collectgarbage ("count"))
	
	UpdateAddOnMemoryUsage();
	local mem = GetAddOnMemoryUsage("Auctionator");
	ZC_redmsg ("Auctionator:  "..math.floor(mem).." KB  (total LUA: "..cmem.." KB)");
end

-----------------------------------------

function ZC_printstack (prefix, verbose)

	local cstr = "";

	if (prefix) then
		cstr = prefix;
	end

	local s = debugstack (2);

	local lines = { strsplit("\n", s) };

	local x = 1;

	local v;
	for a,v in pairs(lines) do

		local filename = nil;
		local funcname = nil;

		local a,b = string.find (v, "\\[^\\]*:");

		if (a) then
			filename = string.sub (v,a+1,b-1);
			filename = string.gsub (filename, "\.lua", "");
		end

		local a,b = string.find (v, "in function `.*\'");
		if (a) then
			funcname = string.sub (v,a+13,b-1);
		end

		if (not verbose) then
			if (funcname) then
				if (x == 2) then
					cstr = cstr.." > |cFFFFaa88"..funcname;
				else
					cstr = cstr.." > "..funcname;
				end
				x = x + 1;
			end
		else
			if (filename ~= nil and funcname ~= nil) then
				local colwid = math.floor((100 - string.len(funcname)) / 2);
				local fs = "%-"..colwid.."s (%s)";
				ZC_chatmsg (string.format (fs, funcname, filename), .5, 1, .5);
			else
				ZC_chatmsg (v);
			end
		end
	end

	if (not verbose) then
		ZC_chatmsg (cstr, 1, 0, 0);
	end

end
