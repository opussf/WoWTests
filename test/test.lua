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
function test.testStub_ClearCursor()
	PickupItem( 7073 )
	ClearCursor()
	assertEquals( {}, onCursor )
end
function test.testStub_ClearSendMail()
	fail("Not written")
end
function test.testStub_ClickSendMailItemButton()
	fail("Not written")
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
function test.testStub_GetCoinTextureString_0()
	assertEquals( "0G 0S 0C", GetCoinTextureString( 0 ) )
end
function test.testStub_GetCoinTextureString_C()
	assertEquals( "0G 0S 45C", GetCoinTextureString( 45 ) )
end
function test.testStub_GetCoinTextureString_G()
	assertEquals( "1G 0S 0C", GetCoinTextureString( 10000 ) )
end
function test.testStub_GetCoinTextureString_GC()
	assertEquals( "1G 0S 45C", GetCoinTextureString( 10045 ) )
end
function test.testStub_GetCoinTextureString_GS()
	assertEquals( "1G 23S 0C", GetCoinTextureString( 12300 ) )
end
function test.testStub_GetCoinTextureString_GSC()
	assertEquals( "1G 23S 45C", GetCoinTextureString( 12345 ) )
end
function test.testStub_GetCoinTextureString_S()
	assertEquals( "0G 23S 0C", GetCoinTextureString( 2300 ) )
end
function test.testStub_GetCoinTextureString_SC()
	assertEquals( "0G 23S 45C", GetCoinTextureString( 2345 ) )
end
function test.testStub_GetContainerNumFreeSlots_0()
	assertEquals( 16, GetContainerNumFreeSlots( 0 ) )
end
function test.testStub_GetContainerNumFreeSlots_1()
	assertEquals( 0, GetContainerNumFreeSlots( 1 ) )
end
function test.testStub_GetCurrencyInfo_Amount_0()
	myCurrencies = {["703"] = nil, }
	assertEquals( 0, select(2, GetCurrencyInfo( "703" ) ) )
end
function test.testStub_GetCurrencyInfo_Amount_1()
	myCurrencies = {["703"] = 1, }
	assertEquals( 1, select(2, GetCurrencyInfo( "703" ) ) )
end
function test.testStub_GetCurrencyInfo_EarnedThisWeek()
	-- Currently hardcoded to return 0
	assertEquals( 0, select(4, GetCurrencyInfo( "703" ) ) )
end
function test.testStub_GetCurrencyInfo_IsDiscovered()
	assertTrue( select( 7, GetCurrencyInfo( "703" ) ) )
end
function test.testStub_GetCurrencyInfo_Name()
	assertEquals( "Fictional Currency", GetCurrencyInfo( "703" ) )
end
function test.testStub_GetCurrencyInfo_TotalMax()
	assertEquals( 4000, select( 6, GetCurrencyInfo( "703" ) ) )
end
function test.testStub_GetCurrencyInfo_WeeklyMax()
	assertEquals( 1000, select( 5, GetCurrencyInfo( "703" ) ) )
	-- returns name, amount, texturePath, earnedThisWeek, weeklyMax, totalMax, isDiscovered
end
function test.testStub_GetCurrencyLink()
	assertEquals( "|cffffffff|Hcurrency:703|h[Fictional Currency]|h|r", GetCurrencyLink( "703" ) )
end
function test.testStub_GetCurrencyLink()
	assertIsNil( GetCurrencyLink( "704" ) )
end
function test.testStub_GetItemCount_0()
	-- Does not support the Bank now
	myInventory = {["74661"] = nil, }
	assertEquals( 0, GetItemCount( "74661" ) )
end
function test.testStub_GetItemCount_1()
	-- Does not support the Bank now
	myInventory = {["74661"] = 1, }
	assertEquals( 1, GetItemCount( "74661" ) )
end
function test.testStub_GetItemInfo_Link_Nil()
	assertIsNil( select( 2, GetItemInfo("7072") ) )
end
function test.testStub_GetItemInfo_Name_Nil()
	assertIsNil( GetItemInfo("7072") )
end
function test.testStub_GetItemInfo_Link_Valid()
	assertEquals( "|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0:0|h[Broken Fang]|h|r", select(2, GetItemInfo("7073") ) )
end
function test.testStub_GetItemInfo_Name_Valid()
	assertEquals( "Broken Fang", GetItemInfo("7073") )
end
function test.testStub_GetMerchantItemCostInfo_0()
	assertEquals( 0, GetMerchantItemCostInfo( 1 ) ) -- Broken Fang
end
function test.testStub_GetMerchantItemCostInfo_1()
	assertEquals( 1, GetMerchantItemCostInfo( 3 ) ) -- "Love Fool"
end
function test.testStub_GetMerchantItemCostItem_Link_Nil()
	-- Link is hardcoded to "" for now
	assertIsNil( select( 3, GetMerchantItemCostItem( 1, 1 ) ) ) -- this time has no alternative currency cost
end
function test.testStub_GetMerchantItemCostItem_Link_Valid()
	-- Link is hardcoded to "" for now
	assertEquals( "", select(3, GetMerchantItemCostItem( 3, 1 ) ) ) -- 3rd item, 1st currency -- 3rd return value
end
function test.testStub_GetMerchantItemCostItem_Texture_Nil()
	-- Texture is hardcoded to "" for now
	assertIsNil( GetMerchantItemCostItem( 1, 1 ) ) -- this time has no alternative currency cost
end
function test.testStub_GetMerchantItemCostItem_Texture_Valid()
	-- Texture is hardcoded to "" for now
	assertEquals( "", GetMerchantItemCostItem( 3, 1 ) ) -- 3rd item, 1st currency -- 1st return value
end
function test.testStub_GetMerchantItemCostItem_Value_Nil()
	assertIsNil( select( 2, GetMerchantItemCostItem( 1, 1 ) ) ) -- this time has no alternative currency cost
end
function test.testStub_GetMerchantItemCostItem_Value_Valid()
	assertEquals( 10, select( 2, GetMerchantItemCostItem( 3, 1 ) ) ) -- 3rd item, 1st currency -- 2nd return value
end
function test.testStub_GetMerchantItemLink_Nil()
	assertIsNil( GetMerchantItemLink( 0 ) )
end
function test.testStub_GetMerchantItemLink_Valid()
	assertEquals( "|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0:0|h[Broken Fang]|h|r", GetMerchantItemLink( 1 ) )
end
--local itemName, texture, price, quantity, numAvailable, isUsable = GetMerchantItemInfo( i )
function test.testStub_GetMerchantItemInfo_IsUsable()
	assertEquals( 1, select( 6, GetMerchantItemInfo( 1 ) ) )
end
function test.testStub_GetMerchantItemInfo_Name()
	assertEquals( "Broken Fang", GetMerchantItemInfo( 1 ) )
end
function test.testStub_GetMerchantItemInfo_NumAvailable()
	assertEquals( -1, select( 5, GetMerchantItemInfo( 1 ) ) )
end
function test.testStub_GetMerchantItemInfo_Price()
	assertEquals( 5000, select( 3, GetMerchantItemInfo( 1 ) ) )
end
function test.testStub_GetMerchantItemInfo_Quantity()
	assertEquals( 1, select( 4, GetMerchantItemInfo( 1 ) ) )
end
function test.testStub_GetMerchantItemInfo_Texture()
	assertEquals( "", select( 2, GetMerchantItemInfo( 1 ) ) )
end
function test.testStub_GetMerchantItemMaxStack()
	assertEquals( 20, GetMerchantItemMaxStack( 1 ) )
end
function test.testStub_GetMerchantNumItems()
	assertEquals( 6, GetMerchantNumItems() )
end
function test.testStub_GetNumGroupMembers_0()
	myParty = { ["group"] = nil, ["raid"] = nil, ["roster"] = {} }
	assertEquals( 0, GetNumGroupMembers() )
end
function test.testStub_GetNumGroupMembers_1()
	-- returns name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML
	myParty.group = 1  -- inGroup
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertEquals( 1, GetNumGroupMembers() )
end
function test.testStub_GetNumRoutes_0()
	assertEquals( 0, GetNumRoutes( 1 ) )
end
function test.testStub_GetNumRoutes_1()
	assertEquals( 1, GetNumRoutes( 2 ) )
end
function test.testStub_GetNumRoutes_2()
	assertEquals( 1, GetNumRoutes( 3 ) )
end
function test.testStub_GetNumTradeSkills()
	assertEquals( 1, GetNumTradeSkills() )
end
function test.testStub_GetRaidRosterInfo_Class_Nil()
	myParty.raid = nil
	myParty.roster = {}
	assertIsNil( select( 5, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Class_Valid()
	myParty.raid = 1
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertEquals( "class", select( 5, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_FileName_Nil()
	myParty.raid = nil
	myParty.roster = {}
	assertIsNil( select( 6, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_FileName_Valid()
	myParty.raid = 1
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertEquals( "fileName", select( 6, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_IsDead_Nil()
	myParty.raid = nil
	myParty.roster = {}
	assertIsNil( select( 9, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_IsDead_Valid()
	myParty.raid = 1
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertTrue( not select( 9, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_IsML_Nil()
	myParty.raid = nil
	myParty.roster = {}
	assertIsNil( select( 11, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_IsML_Valid()
	myParty.raid = 1
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertTrue( select( 11, GetRaidRosterInfo( 1 ) ) )
end
-- returns name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML
function test.testStub_GetRaidRosterInfo_Level_Nil()
	myParty.raid = nil
	myParty.roster = {}
	assertIsNil( select( 4, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Level_Valid()
	myParty.raid = 1
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertEquals( 100, select( 4, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Online_Nil()
	myParty.raid = nil
	myParty.roster = {}
	assertIsNil( select( 4, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Online_Valid()
	myParty.raid = 1
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertEquals( 100, select( 4, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Rank_Nil()
	myParty.raid = nil
	myParty.roster = {}
	assertIsNil( select( 2, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Rank_Valid()
	myParty.raid = 1
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertEquals( "rank", select( 2, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Subgroup_Nil()
	myParty.raid = nil
	myParty.roster = {}
	assertIsNil( select( 3, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Subgroup_Valid()
	myParty.raid = 1
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertEquals( 1, select( 3, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Zone_Nil()
	myParty.raid = nil
	myParty.roster = {}
	assertIsNil( select( 7, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRaidRosterInfo_Zone_Valid()
	myParty.raid = 1
	myParty.roster = { { "name", "rank", 1, 100, "class", "fileName", "zone", true, false, "role", true} }
	assertEquals( "zone", select( 7, GetRaidRosterInfo( 1 ) ) )
end
function test.testStub_GetRealmName()
	assertEquals( "testRealm", GetRealmName() )
end
function test.testStub_GetSendMailItemLink()
	assertEquals( "fail", GetSendMailItemLink() )
end
function test.testStub_GetTradeSkillItemLink()
	assertEquals( "|cff9d9d9d|Hitem:34061:0:0:0:0:0:0:0:80:0:0|h[Turbo-Charged Flying Machine]|h|r", GetTradeSkillItemLink(1) )
end
function test.testStub_GetTradeSkillReagentInfo_Name()
	local actual = select(1, GetTradeSkillReagentInfo( 1, 1 ) )
	assertEquals( "Adamantite Frame", actual )
end
function test.testStub_GetTradeSkillReagentInfo_Texture()
	local actual = select(2, GetTradeSkillReagentInfo( 1, 1 ) )
	assertEquals( "", actual ) -- always ""
end
function test.testStub_GetTradeSkillReagentInfo_ReagentCount()
	local actual = select(3, GetTradeSkillReagentInfo( 1, 1 ) )
	assertEquals( "", actual )
end
function test.testStub_GetTradeSkillReagentInfo_PlayerReagentCount()
	local actual = select(4, GetTradeSkillReagentInfo( 1, 1 ) )
	assertEquals( "", actual )
end
-------------
--===========
-------------



function test.testStub_GetTradeSkillReagentItemLink()
	assertEquals( "fail", GetTradeSkillReagentItemLink() )
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
function test.testStub_IsInRaid()
	IsInRaid()
end
function test.testStub_NumTaxiNodes()
	assertEquals( 3, NumTaxiNodes() )
end
function test.testStub_PlaySoundFile()
	assertIsNil( PlaySoundFile( "File" ) )
end


function test.testStub_SecondsToTime_Sec()
	assertEquals( "59 Sec", SecondsToTime( 59 ) )
end
function test.testStub_SecondsToTime_MinSec()
	assertEquals( "1 Min 40 Sec", SecondsToTime( 100 ) )
end
function test.testStub_SecondsToTime_MinSec_noSeconds()
	assertEquals( "1 Min", SecondsToTime( 100, true ) )
end
function test.testStub_SecondsToTime_HrMinSec()
	assertEquals( "2 Hr 46 Min", SecondsToTime( 10000 ) )
end
function test.testStub_SecondsToTime_HrMinSec_noAbbr()
	assertEquals( "2 Hours 46 Minutes", SecondsToTime( 10000, false, true ) )
end
function test.testStub_SecondsToTime_DayHrMinSec_MaxCount()
	assertEquals( "1 Day 3 Hr 46 Min 40 Sec", SecondsToTime( 100000, false, false, 5 ) )
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


--------
--======
--------
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
