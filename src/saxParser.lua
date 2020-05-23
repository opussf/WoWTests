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
	-- for line in io.lines( f ) do
	--
	-- for each char in lua:

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
