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

-- https://www.w3schools.com/xml/xml_elements.asp
-- https://www.w3schools.com/xml/xml_syntax.asp


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
		Outside       = { 0 },  -- outside of a tag
		ElementName   = { 1 },
		InElement     = { 2 },  -- 
		-- InAttrName    = { 2 },
		-- InTag     = { 2 },  -- in a tag name
		-- InElement = { 3 },
	}
	currentState = State.Outside
	elementDepth = {}   -- table of current element depth
	elementName = ""
	chars = ""

	while( #fileIn > 0 ) do
		print( currentState[1].."\t"..#fileIn, "fileIn: "..string.sub( fileIn, 1, 60 ) )
		c = string.sub( fileIn, 1, 1 )
		n = string.sub( fileIn, 2, 2 )
		handled = false
		if currentState == State.Outside then
			if c == "<" then
				if n == "?" then
					local endProlog = string.find( fileIn, "?>" )
					if endProlog then
						fileIn = string.sub( fileIn, endProlog+2 )
					end
				elseif n == "!" then
					local endComment = string.find( fileIn, "-->" )
					if endComment then
						fileIn = string.sub( fileIn, endComment+3 )
					end
				else
					currentState = State.ElementName
					elementName = ""
					fileIn = string.sub( fileIn, 2 )
				end
			else
				saxParser.contentHandler:characters( c )
				fileIn = string.sub( fileIn, 2 )
			end
		elseif currentState == State.ElementName then
			tagStart, tagEnd, tagName = string.find( fileIn, "^([%a_][%a%d-_.]*)" )
			if tagStart then
				elementName = tagName
				attributes = {}
				currentState = State.InElement
				fileIn = string.sub( fileIn, tagEnd + 1 )
			end
			tagStart, tagEnd, tagName = string.find( fileIn, "^/([%a_][%a%d-_.]*)" )
			if tagStart then
				elementName = tagName
				-- print( "Fire endElement( "..tagName.." )" )
				table.remove( elementDepth )
				saxParser.contentHandler:endElement( tagName )
				currentState = State.Outside
				fileIn = string.sub( fileIn, tagEnd + 2 )
			end
		elseif currentState == State.InElement then
			attribStart, attribEnd, key, value = string.find( fileIn, "^%s*(%S+)%s*=%s*[\"\'](.-)[\"\']" )
			if attribStart then
				attributes[key] = value
				fileIn = string.sub( fileIn, attribEnd+1 )
			elseif c == " " then
				fileIn = string.sub( fileIn, 2 )
			elseif c == ">" or n == ">" then
				-- print( "Fire startElement( "..elementName.." )" )
				-- print( "\twith attributes: ")
				-- for k,v in pairs( attributes ) do
					-- print( "\t\t"..k..":="..v )
				-- end
				table.insert( elementDepth, elementName )
				saxParser.contentHandler:startElement( elementName, attributes )
				currentState = State.Outside
				if c == "/" and n == ">" then
					-- print( "Fire endElement( "..elementName.." )" )
					depthElement = table.remove( elementDepth )
					saxParser.contentHandler:endElement( elementName )
					if depthElement ~= elementName then
						print( "WARNING: "..elementName.." is not the expected element: "..depthElement )
					end
					currentState = State.Outside
				end
				fileIn = string.sub( fileIn, (n==">" and 3 or 2) )
			end
		end
		-- print( "elementDepth: " )
		-- for _, v in pairs( elementDepth ) do
		-- 	print( "\t"..v )
		-- end
	end

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
