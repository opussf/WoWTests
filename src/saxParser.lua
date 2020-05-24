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
	stateValue = 0   -- current state of the parser
	                 -- 0 is outside of a tag
	                 -- 1 is in a tag name

	tagName = ""
	attributes = {}  -- start with an empty attributes table
	attribKey = ""   --
	attribValue = "" --
	tagDepth = 0     -- how many tags deep

	-- start by looking for a start tag
	while( #fileIn > 0 ) do
		print( fileIn )
		if stateValue == 0 then  -- outside of a tag
			local tagStart, tagEnd, tagName = string.find( fileIn, "^<(%S+)" )  -- tags start with a <
			if tagStart then
				print( "Found a tag start: <"..tagName )
				tagDepth = tagDepth + 1
				stateValue = 1
				attributes = {}
				fileIn = string.sub( fileIn, tagEnd+1 )
			end
			tagEndStart, tagEndEnd, tagName = string.find( fileIn, "^</(%S+)>" )
			if tagEndStart then
				print( "Found a closing tag: </"..tagName..">" )
				tagDepth = tagDepth - 1
				stateValue = 0
				fileIn = string.sub( fileIn, tagEndEnd+1 )
			end
		elseif stateValue == 1 then
			local attribStart, attribEnd, key, value = string.find( fileIn, "^%s*(%S+)%s*=%s*[\"\'](%S*)[\"\']" )
			if attribStart then
				print( "Found an attribute: "..key.."=\""..value.."\"" )
				attributes[key] = value
				--print( "set "..key.." to "..value )
				fileIn = string.sub( fileIn, attribEnd+1 )
			else
				tagEndStart, tagEndEnd, tagEnd = string.find( fileIn, "^%s*([/]*>)" )
				print( "tagEnd:"..tagName )
				if tagEndStart then
					saxParser.contentHandler:startElement( tagName, attributes )
					if tagEnd == "/>" then -- this is also the end of the tag
						saxParser.contentHandler:endElement( tagName )
						tagDepth = tagDepth - 1
					end
					stateValue = 0
					fileIn = string.sub( fileIn, tagEndEnd+1 )
				end
			end
		end
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
