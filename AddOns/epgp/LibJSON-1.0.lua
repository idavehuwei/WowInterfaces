--[[
Name: LibJSON-1.0
Author(s): ckknight (ckknight@gmail.com)
Website: http://www.wowace.com/projects/libjson-1-0/
Description: A library to convert between Lua objects and serialized JSON objects
License: MIT
]]

local LibJSON = LibStub:NewLibrary("LibJSON-1.0", 1)

if not LibJSON then
    return
end

LibJSON.NULL = LibJSON.NULL or newproxy()
local NULL = LibJSON.NULL

--- Return a proxy object that will serialize to null.
-- @usage LibJSON.Serialize(LibJSON.Null()) == "null"
-- @usage LibJSON.Serialize({1, LibJSON.Null(), 3}) == "[1,null,3]"
-- @return a proxy object
function LibJSON.Null()
    return NULL
end

local serialize

--- Serialize an object to LibJSON
-- This will error if a function, userdata, or thread is passed in.
-- This will also error if a non-UTF-8 string is passed in.
-- @param value a serialized JSON object
-- @usage LibJSON.Serialize(1234) == "1234"
-- @usage LibJSON.Serialize(1234e50) == "1.234e+53"
-- @usage LibJSON.Serialize("Hello, friend") == '"Hello, friend"'
-- @usage LibJSON.Serialize({ 1, 2, 3 }) == "[1,2,3]"
-- @usage LibJSON.Serialize({ one = 1, two = 2 }) == '{"one":1,"two":2}'
-- @usage LibJSON.Serialize("\195\156berfantastisch") == '"\u00DCberfantastisch"'
-- @usage LibJSON.Serialize(nil) == 'null'
-- @usage LibJSON.Serialize(true) == 'true'
-- @usage LibJSON.Serialize() == 'false'
-- @usage LibJSON.Serialize({[4] = "Hello"}) == '[null,null,null,"Hello"]'
-- @return a string with the serialized data in it
function LibJSON.Serialize(value)
    local buffer = {}
    
    serialize(value, buffer)
    
    return table.concat(buffer)
end

local deserialize, skipWhitespace

--- Deserialize a JSON object into a lua object
-- This will error if the JSON object is malformed.
-- @param value a string, number, boolean, or nil (or LibJSON.Null()), or a table consisting of those
-- @usage LibJSON.Deserialize("1234") == 1234
-- @usage LibJSON.Deserialize("1.234e+53") == 1234e50
-- @usage LibJSON.Deserialize('"Hello, friend"') == "Hello, friend"
-- @usage LibJSON.Deserialize('[1, 2, 3]') => { 1, 2, 3 }
-- @usage LibJSON.Deserialize('[1, null, 3]') => { [1] = 1, [3] = 3 }
-- @usage LibJSON.Deserialize('{"one":"two"}') => { one = "two" }
-- @usage LibJSON.Deserialize('"\u00DCberfantastisch"') => "\195\156berfantastisch"
-- @usage LibJSON.Deserialize('[1, /* a comment */ 2]') => { 1, 2 }
-- @usage LibJSON.Deserialize('true') => true
-- @usage LibJSON.Deserialize('false') => false
-- @usage LibJSON.Deserialize('null') => nil
-- @return a lua object, either a table, string, number, boolean, or nil
function LibJSON.Deserialize(value)
    if type(value) ~= "string" then
        error("Cannot deserialize a non-string")
    end
    local result, position = deserialize(value, 1)
    position = skipWhitespace(value, position)
    if position <= value:len() then
        error(("Unused trailing characters: %q"):format(value))
    end
    return result
end

do
    local serializers = {}
    
    -- serialize a value, appending to the given buffer
    function serialize(value, buffer)
        if value == NULL then
            -- NULL is special, for embedding nils into lists
            value = nil
        end
        
        local serializer = serializers[type(value)]
        
        if not serializer then
            error(("Serializing of type %s is unsupported"):format(type(value)))
        end
        
        serializer(value, buffer)
    end
    
    local backslashed_bytes = {
        [('"'):byte()] = '\\"',
        [('\\'):byte()] = '\\\\',
        [('/'):byte()] = '\\/',
        [('\b'):byte()] = '\\b',
        [('\f'):byte()] = '\\f',
        [('\n'):byte()] = '\\n',
        [('\r'):byte()] = '\\r',
        [('\t'):byte()] = '\\t',
	}
	
    function serializers:string(buffer)
        buffer[#buffer+1] = '"'
        local i = 1
        local length = #self
        while i <= length do
            local byte = self:byte(i)
            i = i + 1
            
            if backslashed_bytes[byte] then
                -- one of the standard backslashed characters
                buffer[#buffer+1] = backslashed_bytes[byte]
            
            elseif byte < 32 then
                -- control character, not visible normally
                buffer[#buffer+1] = "\\u00"
                buffer[#buffer+1] = ("%02X"):format(byte)
            
            elseif byte < 128 then
                -- normal character
                buffer[#buffer+1] = string.char(byte)
                
            elseif byte < 194 or byte > 244 then
                error("String is not proper UTF-8: %q"):format(self)
                
            elseif byte < 224 then
                -- unicode fun, this handles U+0080 to U+07FF
                -- see http://en.wikipedia.org/wiki/UTF-8
                local byte1, byte2 = self:byte(i), byte
                i = i + 1
                
                local nibble1 = byte1 % 16
                local nibble2 = ((byte1 - nibble1) % 64) / 16 + (byte2 % 4) * 4
                local nibble3 = math.floor(byte2 / 4) % 8
                
                buffer[#buffer+1] = "\\u"
                buffer[#buffer+1] = ("%04X"):format(nibble1 + nibble2 * 16 + nibble3 * 256)
                
            elseif byte < 240 then
                -- even more unicode fun, handles U+0800 to U+FFFF
                local byte1, byte2, byte3 = self:byte(i+1), self:byte(i), byte
                i = i + 2
                
                local nibble1 = byte1 % 16
                local nibble2 = ((byte1 - nibble1) % 64) / 16 + (byte2 % 4) * 4
                local nibble3 = math.floor(byte2 / 4) % 16
                local nibble4 = byte3 % 16
                
                buffer[#buffer+1] = "\\u"
                buffer[#buffer+1] = ("%04X"):format(nibble1 + nibble2 * 16 + nibble3 * 256 + nibble4 * 4096)
            
            else
                error("Cannot serialize unicode greater than U+FFFF: %q"):format(self)
            end
        end
        buffer[#buffer+1] = '"'
    end

    function serializers:number(buffer)
        -- lua's and LibJSON's numbers are the same
        buffer[#buffer+1] = tostring(self)
    end
    
    function serializers:boolean(buffer)
        -- lua's and LibJSON's booleans are the same
        buffer[#buffer+1] = tostring(self)
    end
    
    -- see if the table provided is a list, if so, return the list's length
    -- This does handle lists with embedded nils, e.g. {1, nil, 3}
    -- This could theoretically be an issue if you pass in {[10000]="Hello"}
    local function isList(list)
        local length = 0
        for k, v in pairs(list) do
            if type(k) ~= "number" or k < 1 or math.floor(k) ~= k then
                return false
            end
            
            if length < k then
                length = k
            end
        end
        return length
    end
    
    function serializers:table(buffer)
        local listLength = isList(self)
        
        if listLength then
            buffer[#buffer+1] = "["
            
            for i = 1, listLength do
                if i > 1 then
                    buffer[#buffer+1] = ","
                end
                serialize(self[i], buffer)
            end
            
            buffer[#buffer+1] = "]"
        else
            buffer[#buffer+1] = "{"
            
            local first = true
            
            for k, v in pairs(self) do
                if first then
                    first = false
                else
                    buffer[#buffer+1] = ","
                end
                
                -- we're going to just coerce all keys to string
                serialize(tostring(k), buffer)
                buffer[#buffer+1] = ":"
                
                serialize(v, buffer)
            end
            
            buffer[#buffer+1] = "}"
        end
    end
    
    serializers['nil'] = function(self, buffer)
        buffer[#buffer+1] = "null"
    end
end

do
    local solidus = ("/"):byte()
    local reverseSolidus = ("\\"):byte()
    local asterix = ("*"):byte()
    local openBrace = ("{"):byte()
    local closeBrace = ("}"):byte()
    local openBracket = ("["):byte()
    local closeBracket = ("]"):byte()
    local comma = (","):byte()
    local colon = (":"):byte()
    local doubleQuote = ('"'):byte()
    local minus = ("-"):byte()
    local plus = ("+"):byte()
    local letterT = ("t"):byte()
    local letterF = ("f"):byte()
    local letterN = ("n"):byte()
    local letterU = ("u"):byte()
    local digit0 = ("0"):byte()
    local digit1 = ("1"):byte()
    local digit9 = ("9"):byte()
    local fullStop = ("."):byte()
    local letterE = ("e"):byte()
    local letterUpperE = ("E"):byte()
    local whitespace = {
        [(" "):byte()] = true,
        [("\t"):byte()] = true,
        [("\r"):byte()] = true,
        [("\n"):byte()] = true,
    }
    local newlines = {
        [("\r"):byte()] = true,
        [("\n"):byte()] = true,
    }
	local numbers = {}
	for i = 0, 9 do
	    numbers[i + ('0'):byte()] = i
	end
	local escapes = {
		[('"'):byte()] = ('"'):byte(),
		[('\\'):byte()] = ('\\'):byte(),
		[('/'):byte()] = ('/'):byte(),
		[('b'):byte()] = ('\b'):byte(),
		[('f'):byte()] = ('\f'):byte(),
		[('n'):byte()] = ('\n'):byte(),
		[('r'):byte()] = ('\r'):byte(),
		[('t'):byte()] = ('\t'):byte(),
	}
	
	-- this jumps the position ahead to past the first newline
    local function skipCommentSingleLine(value, position)
        local byte
        repeat
            byte = value:byte(position)
            position = position + 1
        until not byte or newlines[byte]
        
        return skipWhitespace(value, position)
    end
    
    -- this searches for */ and stops
    local function skipCommentBlock(value, position)
        local lastByte, byte
        repeat
            lastByte, byte = byte, value:byte(position)
            position = position + 1
            
            if lastByte == solidus and byte == asterix then
                -- /* blah /* */ is illegal
                error(("Invalid comment found: %q"):format(value))
            end
        until not byte or (lastByte == asterix and byte == solidus)
        
        if not byte then
            -- ran out of text before finishing the comment
            error(("Invalid comment found: %q"):format(value))
        end
        
        return skipWhitespace(value, position)
    end
    
    local function skipComment(value, position)
        assert(value:byte(position) == solidus)
        local byte = value:byte(position + 1)
        
        if byte == solidus then
            -- // text until newline
            return skipCommentSingleLine(value, position+2)
            
        elseif byte == asterix then
            -- /* text until */
            return skipCommentBlock(value, position+2)
            
        else
            -- can't have a random slash hanging around
            error(("Invalid comment found: %q"):format(value))
        end
	end
	
	-- skip all whitespace and comments
    function skipWhitespace(value, position)
        local byte = value:byte(position)
        
        if whitespace[byte] then
            return skipWhitespace(value, position+1)
        end
        
        if byte == solidus then
            return skipComment(value, position)
        end
        
        return position
    end
    
    local tmp = {}
    -- read in a string
    local function readString(value, position)
        assert(value:byte(position) == doubleQuote)
        position = position + 1
        
        for k in pairs(tmp) do
            -- this is in case there was an error while figuring the string last time
            tmp[k] = nil
        end
        
        while true do
            local byte = value:byte(position)
            position = position + 1
            
            if not byte then
                error(("String ended early: %q"):format(value))
            
            elseif byte == doubleQuote then
                -- end of the string
                break
                
            elseif byte == reverseSolidus then
                byte = value:byte(position)
                position = position + 1
                
                if not byte then
                    error(("String ended early: %q"):format(value))
                    
                elseif byte == letterU then
                    -- unicode fun
                    -- see http://en.wikipedia.org/wiki/UTF-8
                    local hexDigits = value:sub(position, position+3)
                    if hexDigits:len() ~= 4 then
                        error(("String ended early: %q"):format(value))
                    end
                    position = position + 4
                    
                    local codepoint = tonumber(hexDigits, 16)
                    if not codepoint then
                        error(("Invalid string found: %q"):format(value))
                    end
                    
                    if codepoint < 0x0080 then
                        tmp[#tmp+1] = string.char(codepoint)
                        
                    elseif codepoint < 0x0800 then
                        tmp[#tmp+1] = string.char(math.floor(codepoint / 0x0040) + 0xC0)
                        tmp[#tmp+1] = string.char((codepoint % 0x0040) + 0x80)
                        
                    else
                        tmp[#tmp+1] = string.char(math.floor(codepoint / 0x1000) + 0xE0)
                        tmp[#tmp+1] = string.char(math.floor((codepoint % 0x1000) / 0x0040) + 0x80)
                        tmp[#tmp+1] = string.char((codepoint % 0x0040) + 0x80)
                    end
                    
                else
                    tmp[#tmp+1] = string.char(escapes[byte] or byte)
                end
                
            else
                tmp[#tmp+1] = string.char(byte)
            end
        end
        
        local result = table.concat(tmp)
        
        for k in pairs(tmp) do
            tmp[k] = nil
        end
        
        return result, position
    end
    
    -- read in a number
    local function readNumber(value, position)
        local start = position
        local byte = value:byte(position)
        position = position + 1
        
        if byte == minus then
            byte = value:byte(position)
            position = position + 1
        end
        
        local number = numbers[byte]
        if not number then
            error(("Number ended early: %q"):format(value))
        end
        
        if number ~= 0 then
            while true do
                byte = value:byte(position)
                position = position + 1
                
                local digit = numbers[byte]
                if not digit then
                    break
                end
            end
        else
            byte = value:byte(position)
            position = position + 1
        end
        
        if byte == fullStop then
            local first = true
            local exponent = 0
            while true do
                byte = value:byte(position)
                position = position + 1
                
                if not numbers[byte] then
                    if first then
                        error(("Number ended early: %q"):format(value))
                    end
                    break
                end
                first = false
            end
        end
        
        if byte == letterE or byte == letterUpperE then
            byte = value:byte(position)
            position = position + 1
            
            if byte == plus then
                -- nothing to do
            elseif byte == minus then
                -- also nothing to do
            else
                position = position - 1
            end
            
            byte = value:byte(position)
            position = position + 1
            
            if not numbers[byte] then
                error(("Invalid number: %q"):format(value))
            end
            
            repeat
                byte = value:byte(position)
                position = position + 1
            until not numbers[byte]
        else
            position = position - 1
        end
        
        -- we're gonna use number because it's typically faster and more accurate than adding and multiplying ourselves
        local number = tonumber(value:sub(start, position-1))
        assert(number)
        
        return number, position
    end
    
    -- read in true
    local function readTrue(value, position)
        local string = value:sub(position, position+3)
        
        if string ~= "true" then
            error(("Error reading true: %q"):format(value))
        end
        
        return true, position+4
    end
    
    -- read in false
    local function readFalse(value, position)
        local string = value:sub(position, position+4)
        
        if string ~= "false" then
            error(("Error reading false: %q"):format(value))
        end
        
        return false, position+5
    end
    
    -- read in null (becomes nil)
    local function readNull(value, position)
        local string = value:sub(position, position+3)
        
        if string ~= "null" then
            error(("Error reading null: %q"):format(value))
        end
        
        return nil, position+4
    end
    
    -- read in a list
    local function readList(value, position)
        assert(value:byte(position) == openBracket)
        position = position + 1
        
        if value:byte(position) == closeBracket then
            return {}, position+1
        end
        
        local list = {}
        
        -- track list position rather than #list+1 because of embedded nulls
        local listPosition = 1
        
        while true do
            -- when the great division comes, there will be no pain, no 
            -- suffering, for we shall be the mother and father to a million
            -- civilizations
            local atom
            atom, position = deserialize(value, position)
            
            list[listPosition] = atom
            listPosition = listPosition + 1
            
            position = skipWhitespace(value, position)
            
            local byte = value:byte(position)
            position = position + 1
            
            if byte == closeBracket then
                return list, position
            elseif not byte then
                error(("Invalid list: %q, ended early"):format(value))
            elseif byte ~= comma then
                error(("Invalid list: %q, because of %q"):format(value, string.char(byte)))
            end
        end
    end
    
    -- read in a dictionary
    local function readDictionary(value, position)
        assert(value:byte(position) == openBrace)
        position = position + 1
        
        if value:byte(position) == closeBrace then
            return {}, position+1
        end
        
        local dictionary = {}
        
        while true do
            -- get the key first
            local key
            key, position = deserialize(value, position)
            
            if type(key) ~= "string" then
                error(("Found non-string dictionary key: %s"):format(tostring(key)))
            end
            
            position = skipWhitespace(value, position)
            
            local byte = value:byte(position)
            position = position+1
            
            if not byte then
                error(("Invalid dictionary: %q, ended early"):format(value))
            elseif byte ~= colon then
                error(("Invalid dictionary: %q, because of %q"):format(value, string.char(byte)))
            end
            
            position = skipWhitespace(value, position)
            
            -- now the value
            local val
            val, position = deserialize(value, position)
            
            dictionary[key] = val
            
            position = skipWhitespace(value, position)
            
            local byte = value:byte(position)
            position = position + 1
            
            if byte == closeBrace then
                return dictionary, position
            elseif not byte then
                error(("Invalid dictionary: %q, ended early"):format(value))
            elseif byte ~= comma then
                error(("Invalid dictionary: %q, because of %q"):format(value, string.char(byte)))
            end
        end
    end
    
    -- deserialize the object for the given value at the given position
    function deserialize(value, position)
        position = skipWhitespace(value, position)
        local nextByte = value:byte(position)
        
        if not nextByte then
            error(("Premature end: %q"):format(value))
        end
        
        if nextByte == openBrace then
            return readDictionary(value, position)
        elseif nextByte == openBracket then
            return readList(value, position)
        elseif nextByte == doubleQuote then
            return readString(value, position)
        elseif nextByte == solidus then
            position = skipComment(value, position)
            return deserialize(value, position)
        elseif nextByte == minus or numbers[nextByte] then
            return readNumber(value, position)
        elseif nextByte == letterT then
            return readTrue(value, position)
        elseif nextByte == letterF then
            return readFalse(value, position)
        elseif nextByte == letterN then
            return readNull(value, position)
        else
            error(("Invalid input: %q"):format(value))
        end
    end
end
