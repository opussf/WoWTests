#!/usr/bin/env lua
-------------------------
-- Tests for the WoWTest project
-------------------------

package.path = "../src/?.lua;" .. package.path
require "wowTest"

function test.before()
end
function test.after()
end
function test.testFail_Fails()
	local result, excpetion = pcall( fail )
	if result then
		error( "Fail failed to fail" )
	end
end
function test.testFail_Fails_withMsg()
	local result, excpetion = pcall( fail, "Fail Message" )
	if result then
		error( "Fail failed to fail" )
	else
		if not string.find( excpetion, "Fail Message" ) then
			error( "Not the expected message returned" )
		end
	end
end
function test.testAssertEquals_Pass_Numeric()
	assertEquals( 5, 5 )
end
function test.testAssertEquals_Pass_Numeric_withMsg()
	assertEquals( 6, 6, "Message about 6" )
end
function test.testAssertEquals_Pass_String()
	assertEquals( "Hello", "Hello" )
end
function test.testAssertEquals_Pass_String_withMsg()
	assertEquals( "Hello", "Hello", "Message about Hello" )
end
function test.testAssertEquals_Fail_Numeric()
	local result, exception = pcall(assertEquals, 4, 5)
	if result then
		fail( "assertEquals thinks that 4 == 5 is true" )
	else
		--assertEquals("Failure: expected (4) actual (5)", exception)
	end
end
function test.testAssertEquals_Fail_Numeric_withMsg()
	local result, exception = pcall(assertEquals, 4, 5, "Is Fail")
	if result then
		fail( "assertEquals thinks that 4 == 5 is true" )
	else
		if not string.find( exception, "Is Fail" ) then
			fail( "Not the expected message returned")
		end
	end
end
function test.testAssertEquals_Fail_String()
	local result, exception = pcall(assertEquals, "Hello", "Goodbye")
	if result then
		fail( "assertEquals thinks that Hello is Goodbye" )
	else
		--assertEquals("Failure: expected (4) actual (5)", exception)
	end
end
function test.testAssertEquals_Fail_String_withMsg()
	local result, exception = pcall(assertEquals, "Hello", "Goodbye", "Is Fail")
	if result then
		fail( "assertEquals thinks that Hello is Goodbye" )
	else
		if not string.find( exception, "Is Fail" ) then
			fail( "Not the expected message returned")
		end
	end
end
function test.testAssertIsNil_Pass_noParameter()
	assertIsNil( )
end
function test.testAssertIsNil_Pass_withParameter()
	assertIsNil( nil )
end
function test.testAssertIsNil_Fail()
	local value = 5
	local result, exception = pcall(assertIsNil, value)
	-- 0 is success, error code is failure
	--print("Result: "..(result and "Fail" or "Pass"))
	--print("Exception: "..exception)
	if result then
		fail( "assertIsNil thinks that "..value.." is nil" )
	else
		--
	end
end
function test.testAssertTrue_Pass_Boolean()
	assertTrue( true )
end
function test.testAssertTrue_Pass_Test_Numeric()
	assertTrue( 5 == 5 )
end
function test.testAssertTrue_Pass_Test_String()
	assertTrue( "Hello" == "Hello" )
end
function test.testAssertTrue_Fail_Boolean()
	local result, exception = pcall( assertTrue, false )
	if result then
		error( "assertTrue thinks that false is true" )
	end
end
function test.testAssertTrue_Fail_Test_Numeric()
	local result, exception = pcall( assertTrue, 5 == 6 )
	if result then
		error( "assertTrue thinks that '5 == 6'" )
	end
end
function test.testAssertTrue_Fail_Test_String()
	local result, exception = pcall( assertTrue, "Hello" == "World" )
	if result then
		error( "assertTrue thinks that 'Hello' == 'World'")
	end
end



----------------------------------
-- These tests focus on the WoWStubs
----------------------------------
function test.testStub_BuyMerchantItem_01()
	--BuyMerchantItem( index, quantity )
	myInventory = {}
	BuyMerchantItem(1, 1)
	assertEquals( myInventory[7073], 1 )
end
function test.testStub_getglobal()
	globals['value'] = "test value"
	assertEquals( "test value", getglobal('value') )
end
function test.testStub_GetCoinTextureString()
	assertEquals( "1G 23S 45C", GetCoinTextureString( 12345 ) )
end
function test.testStub_CreateFrame()
	frame = CreateFrame("frame")
	assertTrue( frame )
end
function test.testStub_CreateFontString()
	fs = CreateFontString("fontString")
	assertTrue( fs )
end
function test.testStub_CreateSlider()
	s = CreateSlider("slider")
	assertTrue( s )
end
function test.testStub_CreateStatusBar()
	sb = CreateStatusBar("statusBar")
	assertTrue( sb )
end
function test.testStub_GetAccountExpansionLevel()
	assertTrue( 4, GetAccountExpansionLevel() )
end
function test.testStub_GetAddOnMetadata()
	addonData = {["version"] = "1.0", }
	assertTrue( "1.0", GetAddOnMetadata("version") )
end
function test.testStub_GetTradeSkillNumMade_maxMade()
	local _, maxMade = GetTradeSkillNumMade( 1 )
	assertEquals( 1, maxMade )
end
function test.testStub_GetTradeSkillNumMade_minMade()
	local minMade = GetTradeSkillNumMade( 1 )
	assertEquals( 1, minMade )
end
function test.testStub_GetTradeSkillNumReagents_01()
	assertEquals( 4, GetTradeSkillNumReagents( 1 ) )
end
function test.testStub_GetTradeSkillRecipeLink_01()
	assertEquals( "|cffffffff|Henchant:44157|h[Engineering: Turbo-Charged Flying Machine]|h|r",
			GetTradeSkillRecipeLink( 1 ) )
end
function test.testStub_InterfaceOptionsFrame_OpenToCategory()
	-- continue 1 to many API - Test relationship
end
function test.testStub_IsInGuild()
	assertTrue( IsInGuild() )
end
function test.testStub_NumTaxiNodes()
	assertEquals( 3, NumTaxiNodes() )
end
function test.testStub_PlaySoundFile()
	assertIsNil( PlaySoundFile( "File" ) )
end
function test.testStub_SecondsToTime()
	assertEquals( "", SecondsToTime( 5000 ) )
end
function test.testStub_SendChatMessage()
    -- This is fairly no-op function.  How do you test it?
	assertIsNil( SendChatMessage( "Hello" ) )
end
function test.testStub_TaxiNodeCost_01()
	assertEquals( 0, TaxiNodeCost( 1 ) )
end
function test.testStub_TaxiNodeCost_02()
	assertEquals( 40, TaxiNodeCost( 2 ) )
end
function test.testStub_TaxiNodeGetType_01()
	assertEquals( "CURRENT", TaxiNodeGetType( 1 ) )
end
function test.testStub_TaxiNodeGetType_02()
	assertEquals( "REACHABLE", TaxiNodeGetType( 2 ) )
end
function test.testStub_TaxiNodeName()
	assertEquals( "Stormwind", TaxiNodeName( 1 ) )
end
function test.testStub_UnitClass_01()
	assertEquals( "Warlock", UnitClass( "player" ) )
end
function test.testStub_UnitFactionGroup_01()
	assertEquals( "Alliance", UnitFactionGroup( "player" ) )
end
function test.testStub_UnitFactionGroup_02()
	assertEquals( "Alliance", select(2, UnitFactionGroup( "player" ) ) )
end
function test.testStub_UnitName_01()
	assertEquals( "testPlayer", UnitName( "player" ) )
end
function test.testStub_UnitRace_01()
	assertEquals( "Human", UnitRace( "player" ) )
end
function test.testStub_UnitSex_01()
	assertEquals( 3, UnitSex( "player" ) )
end

----------------------------------
-- Run the tests
----------------------------------
test.run()
