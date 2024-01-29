-- saxParser.lua
-----------------------------------------
-- Author  :  Opussf
-- Date    :  $Date:$
-- Revision:  @VERSION@
-----------------------------------------

-- A SAX parser takes a content handler, which provides these methods:
--     startDocument()                 -- called at the start of the Document
--     endDocument()                   -- called at the end of the Document
--     startElement( tagName, attrs )  -- with each tag start.  attrs is a table of attributes and values
--     endElement( tagName )           -- when a tag ends
--     characters( char )              -- for each character not being in a tag
-- The parser calls each of these methods as these events happen.

-- A SAX parser defines a parser (created with makeParser)
-- a Parser has a ContentHandler assigned
-- a Parser also defines these methods:
--      setContentHandler( contentHandler )
--      setFeature()  -- prob not going to implement
--      parse( text )
--      parse( file )


contentHandler = {}
-- normally the contentHandler is an object, where data structures are created in the new object.
function contentHandler.startDocument( this )
end
function contentHandler.endDocument( this )
end
function contentHandler.startElement( this, tagName, attrs )
end
function contentHandler.endElement( this, tagName )
end
function contentHandler.characters( this, char )
end

saxParser = {}
-- SAX Parser
-- interface
function saxParser.makeParser()
	-- make a parser.  This is probably intended to be a
	return saxParser
end
function saxParser.setContentHandler( contentHandlerIn )
	-- takes a table
	saxParser.contentHandler = contentHandlerIn
end
function saxParser.setFeature()
	-- research this
end
function saxParser.parse( fileIn )
	f = io.open( fileIn, "r" )
	if f then fileIn = f:read( "*all" ) end   -- read the contents of the file

	-- call the startDocument method for the given contentHandler
	if saxParser.contentHandler and saxParser.contentHandler.startDocument then
		saxParser.contentHandler:startDocument()
	end

	-- loop through each char
	State = {
		Outside   = { 0 },  -- outside of a tag
		Tagname   = { 1 },
		InTag     = { 2 },  -- in a tag name
		InElement = { 3 },
	}
	stateValue = State.Outside

	tagHints = {
		["?"] = function( str ) 
					print("Prolog - prune")
					local endProlog = string.find( str, "?>" )
					if endProlog then
						return string.sub( str, endProlog+2 )
					end
					return str
		end,
		["!"] = function( str ) 
					local endComment = string.find( str, "-->" )
					if endComment then
						return string.sub( str, endComment+3 )
					end
					return str
		end,
		["/"] = function( str )
					-- print("Closing tag")
					local endTag = string.find( str, ">" )
					if endTag then
						tagName = table.remove( tagDepth )
						print( "Fire endElement( "..tagName.." )" )	
						saxParser.contentHandler:endElement( tagName )
						return string.sub( str, endTag+1 )
					end
					return str
		end,
	}

	tagName = ""
	attributes = {}  -- start with an empty attributes table
	tagDepth = {}     -- how many tags deep

	ccc = 0
	-- start by looking for a start tag
	while( #fileIn > 0 and ccc<2000 ) do
		print( #fileIn, "fileIn: "..string.sub( fileIn, 1, 60 ).."\t-->"..stateValue[1] )
		if stateValue == State.Outside then  -- outside of a tag
			local tagStart = string.find( fileIn, "<" )
			--print( "Start:"..tagStart )
			if tagStart then
				tagTypeHint = string.sub( fileIn, tagStart+1, tagStart+1 )
				--print( "Hint: "..tagTypeHint )
				if tagHints[tagTypeHint] then
					fileIn = tagHints[tagTypeHint]( fileIn )
				else  -- this is not a known special case (this is a tag)
					stateValue = State.Tagname
					fileIn = string.sub( fileIn, tagStart+1 )
				end
			end
		elseif stateValue == State.Tagname then
			tagStart, tagEnd, tagName = string.find( fileIn, "^([%a_][%a%d-_.]*)" )
			--print( "TagName: "..tagStart, tagEnd, ">"..tagName.."<" )
			if tagStart then
				--print( "Found a tag start: <"..tagName..">" )
				table.insert( tagDepth, tagName )
				stateValue = State.InTag
				attributes = {}
				fileIn = string.sub( fileIn, tagEnd+1 )
			end
		elseif stateValue == State.InTag then
			local attribStart, attribEnd, key, value = string.find( fileIn, "^%s*(%S+)%s*=%s*[\"\'](.-)[\"\']" )
			if attribStart then
				print( "Found an attribute: ["..key.."] =\""..value.."\"--" )
				attributes[key] = value
				fileIn = string.sub( fileIn, attribEnd+1 )
			else
				local tagEndStart, tagEndEnd, tagEnd = string.find( fileIn, "^%s*([/]*>)" )
				--print( "tagEnd: "..tagEndStart, tagEndEnd, tagName.." >"..tagEnd.."<" )
				if tagEndStart then
					print( "Fire startElement( "..tagName.." )" )
					print( "\twith attributes: ")
					for k,v in pairs( attributes ) do
						print( "\t\t"..k..":="..v )
					end
					table.insert( tagDepth, tagName )
					saxParser.contentHandler:startElement( tagName, attributes )
					if tagEnd == "/>" then -- this is also the end of the tag
						tagHints["/"]( fileIn )
					end
					stateValue = State.Outside
					fileIn = string.sub( fileIn, tagEndEnd+1 )
				end
			end
		elseif stateValue == State.Outside then
			local c = string.sub( fileIn, 1, 1 )
			if c then 
				print( "Char: "..c..":" )
				saxParser.contentHandler.characters( c )
				fileIn = string.sub( fileIn, 2 )
			end
		end
			-- local tagStart, tagEnd, tagName = string.find( fileIn, "^<(%S+)[^/>]" )  -- tags start with a <  %S is non-space chars
			-- local tagEndStart, tagEndEnd, tagEndName = string.find( fileIn, "^</(%S+)>" )
			-- print( "Start: "..tagStart, tagEnd, ">"..tagName.."<" )
			-- print( "End  : "..tagEndStart, tagEndEnd, tagEndName )
		-- 	if tagStart then
		-- 	elseif tagEndStart then
		-- 		print( "Found a closing tag: </"..tagEndName..">" )
		-- 		tagDepth = tagDepth - 1
		-- 		stateValue = 0
		-- 		fileIn = string.sub( fileIn, tagEndEnd+1 )
		-- 	else
		-- 		c = string.sub( fileIn, 1, 1 )
		-- 		if c ~= "<" then
		-- 			print( "Char :"..c..":" )
		-- 			saxParser.contentHandler:characters( c )
		-- 			fileIn = string.sub( fileIn, 2 )
		-- 		end
		-- 	end
		-- end
		ccc = ccc + 1
	end




--[[
	if msg then
		local i,c = strmatch(msg, "^(|c.*|r)%s*(%d*)$")
		if i then  -- i is an item, c is a count or nil
			return i, c
		else  -- Not a valid item link
			msg = string.lower(msg)
			local a,b,c = strfind(msg, "(%S+)")  --contiguous string of non-space characters
			if a then
				-- c is the matched string, strsub is everything after that, skipping the space
				return c, strsub(msg, b+2)
			else
				return ""
			end
		end
	end



	-- loop over the characters
	for i = 1, #fileIn do
		local c = fileIn:sub( i, i )
		if stateValue == 0 then  -- outside of a tag
			if c == "<" then     -- start of a tag
				tagName = ""     -- reset the tag name
				stateValue = 1   -- change stateValue
			end
		elseif stateValue == 1 then  -- is in a tagName
			if( c ~= "/" and c ~= " " and c ~= ">" ) then
				tagName = tagName .. c
			end
			if( c == " " ) then
				stateValue = 2
			end
		elseif statueValue == 2 then -- is in an attribute name
			if( c ~= "=" )

	end
	]]

	-- call the endDocument method for the given contentHandler
	if saxParser.contentHandler and saxParser.contentHandler.endDocument then
		saxParser.contentHandler:endDocument()
	end
end


--[[
loop over a string in lua:
for i = , #str do
	local c = str:sub( i, i )


for c in str:match( "." ) do

str:gsub( ".", function )


]]
