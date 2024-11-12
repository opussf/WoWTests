#!/usr/bin/env lua
-------------------------
-- Tests for the WoWTest project
-------------------------

package.path = "../src/?.lua;" .. package.path
require "wowTest"

test.outFileName = "testOut.xml"
test.coberturaFileName = "../coverage.xml"
test.coverageIgnoreFiles = { "test" }

function test.before()
	ch = nil
	bagInfo = {  -- reset bags (only have empty backpack)
		[0] = {16, 0},
	}
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
		error( "assertTrue thinks that 'Hello' == 'World'" )
	end
end
function test.testAssertAlmostEquals_negativeWithPlaces()
	local result, exception = pcall( assertAlmostEquals, 4.4555, 4.4566, "first and seconds are not almost equal.", 3 )
	if result then
		error( "assertAlmostEquals thinks that 4.4555 almost equals 4.4566 to 3 places." )
	end
end
function test.testAssertAlmostEquals_positiveWithPlaces()
	local result, exception = pcall( assertAlmostEquals, 4.4555, 4.4566, "first and seconds are not almost equal.", 2 )
	if not result then
		error( "assertAlmostEquals thinks that 4.4555 almost equals 4.4566 to 2 places." )
	end
end
function test.testAssertAlmostEquals_negativeWithDelta()
	local result, exception = pcall( assertAlmostEquals, 4.4555, 4.4566, "first and seconds are not almost equal.", nil, 0.0001 )
	if result then
		error( "assertAlmostEquals thinks that 4.4555 almost equals 4.4566 with 0.0001 delta." )
	end
end
function test.testAssertAlmostEquals_positiveWithDelta()
	local result, exception = pcall( assertAlmostEquals, 4.4555, 4.4566, "first and seconds are not almost equal.", nil, 0.002 )
	if not result then
		error( "assertAlmostEquals thinks that 4.4555 almost equals 4.4566 with 0.002 delta." )
	end
end
function test.testAssertAlmostEquals_deltaIsNotNumber()
	local result, exception = pcall( assertAlmostEquals, 4.4555, 4.4566, "first and seconds are not almost equal.", nil, "Hello" )
	if result then
		error( "assertAlmostEquals thinks that 4.4555 almost equals 4.4566 to 7 places." )
	end
end
function test.testAssertAlmostEquals_deltaIsStringNumber()
	local result, exception = pcall( assertAlmostEquals, 4.4555, 4.4566, "first and seconds are not almost equal.", nil, "0.002" )
	if not result then
		error( "assertAlmostEquals thinks that 4.4555 almost equals 4.4566 with 0.002 delta." )
	end
end
function test.testAssertAlmostEquals_positvePlaces()
	assertAlmostEquals( 4.4555, 4.4566, nil, 2 )
end
function test.testAssertAlmostEquals_positveDelta()
	assertAlmostEquals( 4.4555, 4.4566, nil, 2, 0.002 )
end
function test.testAssertFalse_withFalse()
	assertFalse( false )
end

----------------------------------
-- Support code tests
----------------------------------
function test.testBit_lshift_01()
	assertEquals( 20, bit.lshift( 10, 1 ) )
end
function test.testBit_rshift_01()
	assertEquals( 10, bit.rshift( 20, 1 ) )
	assertEquals( 2, bit.rshift( 20, 3 ) )  -- 10100 >> 3 = 10
end
function test.testBit_bor_01()
	-- 0101 | 0011 = 0111    5  | 3 = 7
	assertEquals( 7, bit.bor( 5, 3 ) )
end
function test.testBit_band_01()
	-- 0101 & 0011 = 0001    5 & 3 = 1
	assertEquals( 1, bit.band( 5, 3 ) )
end
function test.testBit_bnot_01()
	--assertEquals( 1, bit.bnot( 0 ) )  ----  this should probably actually be -1 (based on a signed bit)
	assertEquals( 0, bit.bnot( 1 ) )
end
function test.testBit_bnot_02()
	-- !1111 = 0
	assertEquals( 0, bit.bnot( 15 ) )
	-- !10000 = 1111
	assertEquals( 15, bit.bnot( 16 ) )
end
----------------------------------
-- These tests focus on the WoWStubs
----------------------------------
function test.testStub_BuyMerchantItem_01()
	--BuyMerchantItem( index, quantity )
	myInventory = {}
	BuyMerchantItem(1, 1)
	assertEquals( myInventory["7073"], 1 )
end
function test.testStub_getglobal()
	globals['value'] = "test value"
	assertEquals( "test value", getglobal('value') )
end
function test.testStub_ClearCursor()
	myInventory["7073"] = 1
	PickupItem( 7073 )
	ClearCursor()
	for _,v in pairs(onCursor) do
		fail("nothing should be 'onCursor'")
	end
end
--[[
function test.testStub_ClearSendMail()
	fail("Not written")
end
function test.testStub_ClickSendMailItemButton()
	fail("Not written")
end
function test.testStub_CloseMail()
	fail("Not written")
end
]]
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
function test.testStub_CursorHasItem_Nil()
	ClearCursor()
	assertIsNil( CursorHasItem() )
end
function test.testStub_CursorHasItem_True()
	myInventory["7073"] = 1
	PickupItem( "7073" )
	assertTrue( CursorHasItem() )
end
function test.testStub_EquipItemByName_itemID_noSlotID()
	myInventory = {["113596"] = 1, }
	myGear = {}
	EquipItemByName("113596")
	assertEquals( "113596", myGear[1], "Item should be equipped in the HeadSlot" )
end
function test.testStub_EquipItemByName_itemLink_noSlotID()
	myInventory = {["113596"] = 1, }
	myGear = {}
	EquipItemByName("|cffffffff|Hitem:113596:0:0:0:0:0:0:0:90:0:0|h[Vilebreath Mask]|h|r")
	assertEquals( "113596", myGear[1], "Item should be equipped in the HeadSlot" )
end
function test.testStub_EquipItemByName_itemName_noSlotID()
	myInventory = {["113596"] = 1, }
	myGear = {}
	EquipItemByName("Vilebreath Mask")
	assertEquals( "113596", myGear[1], "Item should be equipped in the HeadSlot" )
end
function test.testStub_EquipItemByName_itemID_wSlotID()
	myInventory = {["113596"] = 1, }
	myGear = {}
	EquipItemByName("113596", 1)
	assertEquals( "113596", myGear[1], "Item should be equipped in the HeadSlot" )
end
function test.testStub_EquipItemByName_itemLink_wSlotID()
	myInventory = {["113596"] = 1, }
	myGear = {}
	EquipItemByName("|cffffffff|Hitem:113596:0:0:0:0:0:0:0:90:0:0|h[Vilebreath Mask]|h|r", 1)
	assertEquals( "113596", myGear[1], "Item should be equipped in the HeadSlot" )
end
function test.testStub_EquipItemByName_itemName_wSlotID()
	myInventory = {["113596"] = 1, }
	myGear = {}
	EquipItemByName("Vilebreath Mask", 1)
	assertEquals( "113596", myGear[1], "Item should be equipped in the HeadSlot" )
end
function test.testStub_EquipItemByName_removesFromInv()
	myInventory = {["113596"] = 1, }
	myGear = {}
	EquipItemByName("113596")
	assertIsNil( myInventory["113596"], "Item should be out of inventory." )
end
function test.testStub_EquipItemByName_noEquipIfNotInInventory()
	myInventory = {["7073"] = 1, }
	myGear = {}
	EquipItemByName("113596")
	assertIsNil( myGear[1], "Item should not be equipped" )
end
function test.testStub_EquipItemByName_replacesEquippedItem_isEquipped()
	myInventory = {["113596"] = 1, }
	myGear = {[1] = "7073"}
	EquipItemByName("113596")
	assertEquals( "113596", myGear[1], "Item should be equipped in the HeadSlot" )
end
function test.testStub_EquipItemByName_replacesEquippedItem_itemIsReturnedToInventory()
	myInventory = {["113596"] = 1, }
	myGear = {[1] = "7073"}
	EquipItemByName("113596")
	assertTrue( myInventory["7073"], "Item should be in inventory now." )
end
function test.testStub_EquipItemByName_placesReplacedItemInInventory()
	myInventory = {["113596"] = 1, }
	myGear = {[1] = "7073"}
	EquipItemByName("113596")
	assertTrue( myInventory["7073"], "Replaced item should be in inventory" )
end
function test.testStub_EquipItemByName_doNotEquipItemToInvalidSlot()
	myInventory = {["999999"] = 1, } -- finger item
	myGear = {}
	EquipItemByName("999999", 1 ) -- try to equip finger thing to the head slot
	assertIsNil( myGear[1], "Nothing should be equipped to the head slot" )
	assertIsNil( myGear[11], "Should not be in the 1st finger slot" )
	assertIsNil( myGear[12], "Should not be in the 2nd finger slot" )
end
function test.testStub_EquipItemByName_equipsToFirstValidItem()
	myInventory = {["999999"] = 1, } -- finger item
	myGear = {}
	EquipItemByName("999999") -- try to equip finger thing
	assertTrue( myGear[11], "Should be in the 1st finger slot" )
end

--[[
function test.testStub_EquipCursorItem()
	fail("Write This")
end
]]
function test.testStub_GetAccountExpansionLevel()
	assertTrue( 4, GetAccountExpansionLevel() )
end
function test.testStub_GetAchievementInfo()
	--Itemfail("Write this")
end
function test.testStub_GetAddOnMetadata()
	addonData = {["version"] = "1.0", }
	assertTrue( "1.0", C_AddOns.GetAddOnMetadata("version") )
end
function test.testStub_GetCategoryList_returnsTable()
	local CatList = GetCategoryList()
	assertTrue( type(CatList) == "table" )
end
function test.testStub_GetCategoryNumAchievements_01()
	assertEquals( 5, GetCategoryNumAchievements(16) )
end
function test.testStub_GetCoinTextureString_0()
	assertEquals( "0G 0S 0C", C_CurrencyInfo.GetCoinTextureString( 0 ) )
end
function test.testStub_GetCoinTextureString_C()
	assertEquals( "0G 0S 45C", C_CurrencyInfo.GetCoinTextureString( 45 ) )
end
function test.testStub_GetCoinTextureString_G()
	assertEquals( "1G 0S 0C", C_CurrencyInfo.GetCoinTextureString( 10000 ) )
end
function test.testStub_GetCoinTextureString_GC()
	assertEquals( "1G 0S 45C", C_CurrencyInfo.GetCoinTextureString( 10045 ) )
end
function test.testStub_GetCoinTextureString_GS()
	assertEquals( "1G 23S 0C", C_CurrencyInfo.GetCoinTextureString( 12300 ) )
end
function test.testStub_GetCoinTextureString_GSC()
	assertEquals( "1G 23S 45C", C_CurrencyInfo.GetCoinTextureString( 12345 ) )
end
function test.testStub_GetCoinTextureString_S()
	assertEquals( "0G 23S 0C", C_CurrencyInfo.GetCoinTextureString( 2300 ) )
end
function test.testStub_GetCoinTextureString_SC()
	assertEquals( "0G 23S 45C", C_CurrencyInfo.GetCoinTextureString( 2345 ) )
end
function test.testStub_GetContainerNumFreeSlots_EmptyBackpack_FreeSlots()
	assertEquals( 16, C_Container.GetContainerNumFreeSlots( 0 ) )
end
function test.testStub_GetContainerNumFreeSlots_EmptyBackpack_BagType()
	assertEquals( 0, select( 2, C_Container.GetContainerNumFreeSlots( 1 ) ) )
end
function test_testStub_GetContainerNumFreeSlots_FullBackpack_FreeSlots()
	assertEquals( 0, GetContainerNumFreeSlots( 0 ) )
end
function test.testStub_GetCurrencyInfo_Amount_0()
	myCurrencies = { [703] = nil, }
	assertEquals( 0, C_CurrencyInfo.GetCurrencyInfo( 703 )["quantity"] )
end
function test.testStub_GetCurrencyInfo_Amount_1()
	myCurrencies = { [703] = 1, }
	assertEquals( 1, C_CurrencyInfo.GetCurrencyInfo( 703 )["quantity"] )
end
function test.testStub_GetCurrencyLink()
	assertEquals( "", C_CurrencyInfo.GetCurrencyLink( 390 ) )
end
function test.testStub_GetCurrencyInfo_EarnedThisWeek()
	-- Currently hardcoded to return 0
	assertEquals( 0, C_CurrencyInfo.GetCurrencyInfo( 703 )["quantityEarnedThisWeek"] )
end
function test.testStub_GetCurrencyInfo_IsDiscovered()
	assertTrue( C_CurrencyInfo.GetCurrencyInfo( 703 )["discovered"] )
end
function test.testStub_GetCurrencyInfo_Name()
	assertEquals( "Fictional Currency", C_CurrencyInfo.GetCurrencyInfo( 703 )["localName"] )
end
function test.testStub_GetCurrencyInfo_TotalMax()
	assertEquals( 4000, C_CurrencyInfo.GetCurrencyInfo( 703 )["maxQuantity"] )
end
function test.testStub_GetCurrencyInfo_WeeklyMax()
	assertEquals( 1000, C_CurrencyInfo.GetCurrencyInfo( 703 )["canEarnPerWeek"] )
	-- returns name, amount, texturePath, earnedThisWeek, weeklyMax, totalMax, isDiscovered
end
function test.testStub_GetCurrencyLink_Link()
	assertEquals( "|cffffffff|Hcurrency:703|h[Fictional Currency]|h|r", C_CurrencyInfo.GetCurrencyLink( 703 ) )
end
function test.testStub_GetCurrencyLink_Nil()
	assertIsNil( C_CurrencyInfo.GetCurrencyLink( 704 ) )
end
function test.testStub_GetCurencyLink_Link_Integer()
	assertEquals( "|cffffffff|Hcurrency:703|h[Fictional Currency]|h|r", C_CurrencyInfo.GetCurrencyLink( 703 ) )
end
function test.testStub_GetEquipmentSetItemIDs_nil()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {[1] = "113596"},},}
	local equipmentSetItemIDs = GetEquipmentSetItemIDs("nilSet")
	assertIsNil( equipmentSetItemIDs )
end
function test.testStub_GetEquipmentSetItemIDs_testSet()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {[1] = "113596"},},}
	local equipmentSetItemIDs = GetEquipmentSetItemIDs("testSet")
	assertEquals( "113596", equipmentSetItemIDs[1] )
end
function test.testStub_GetEquipmentSetInfo_NoSets_NilName()
	EquipmentSets = {}
	assertIsNil( GetEquipmentSetInfo(1) )
end
function test.testStub_GetEquipmentSetInfo_OutOfRange()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {},}, }
	assertIsNil( GetEquipmentSetInfo(2) )
end
function test.testStub_GetEquipmentSetInfo_ValidName()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {},}, }
	assertEquals( "testSet", GetEquipmentSetInfo(1) )
end
function test.testStub_GetEquipmentSetInfo_ValidIcon()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {},}, }
	assertEquals( "icon", select( 2, GetEquipmentSetInfo(1) ) )
end
function test.testStub_GetEquipmentSetInfo_ValidLessIndex()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {},}, }
	assertEquals( 0, select( 3, GetEquipmentSetInfo(1) ) )
end
function test.testStub_GetEquipmentSetInfoByName_NoSets()
	EquipmentSets = {}
	assertIsNil( GetEquipmentSetInfoByName("testSet") )
end
function test.testStub_GetEquipmentSetInfoByName_InValidName()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {},}, }
	assertIsNil( GetEquipmentSetInfoByName("icon") )
end
function test.testStub_GetEquipmentSetInfoByName_ValidName_Name()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {},}, }
	assertEquals( "icon", GetEquipmentSetInfoByName("testSet") )
end
function test.testStub_GetEquipmentSetInfoByName_ValidName_LessIndex()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {},}, }
	assertEquals( 0, select( 2, GetEquipmentSetInfoByName("testSet") ) )
end
function test.testStub_GetHaste()
	assertEquals( 15.42345, GetHaste() )
end
function test.testStub_GetInventoryItemID_Player_isNil()
	myGear={}
	assertIsNil( GetInventoryItemID("player", 1) )
end
function test.testStub_GetInventoryItemID_Player_ItemId()
	myGear[1] = "3372"
	assertEquals( "3372", GetInventoryItemID( "player", 1 ) )
	myGear={}
end
function test.testStub_GetInventoryItemID_nonPlayerNotSupported()
	myGear[1] = "3372"
	assertIsNil( GetInventoryItemID( "party1", 1 ) )
	myGear={}
end
function test.testStub_GetInventoryItemLink_Player_isNil()
	myGear={}
	assertIsNil( GetInventoryItemLink("player", 1) )  -- HeadSlot
end
function test.testStub_GetInventoryItemLink_Player_ItemLink()
	myGear[1] = "7073"
	assertEquals( "|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0:0|h[Broken Fang]|h|r", GetInventoryItemLink( "player", 1 ) )
end
function test.testStub_GetInventorySlotInfo_Integer()
	-- test that the first value is a number (the actual number is unimportant)
	local result = GetInventorySlotInfo("HeadSlot")
	assertTrue( type(result) == "number" )
end
function test.testStub_GetInventorySlotInfo_String()
	local result = select( 2, GetInventorySlotInfo("HeadSlot") )
	assertTrue( type(result) == "string" )
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
function test.testStub_GetMastery()
	assertEquals( 21.3572, GetMastery() )
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
function test.testStub_GetMerchantItemCostItem_Link_ValidCurrency()
	-- Link is hardcoded to "" for now
	assertEquals( "|cff9d9d9d|Hcurrency:402:0:0:0:0:0:0:0:80:0:0|h[Ironpaw Token]|h|r",
			select(3, GetMerchantItemCostItem( 5, 1 ) ) ) -- 5th item, 1st currency -- 3rd return value
end
function test.testStub_GetMerchantItemCostItem_Link_ValidItem()
	-- Link is hardcoded to "" for now
	assertEquals( "|cff9d9d9d|Hitem:49927:0:0:0:0:0:0:0:80:0:0|h[Love Token]|h|r",
			select(3, GetMerchantItemCostItem( 3, 1 ) ) ) -- 5th item, 1st currency -- 3rd return value
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
function test.testStub_GetMoney()
	myCopper = 150000
	assertEquals( 150000, GetMoney() )
	myCopper = 0
end
function test.testStub_GetNumEquipmentSets_0()
	EquipmentSets = {}
	assertEquals( 0, GetNumEquipmentSets() )
end
function test.testStub_GetNumEquipmentSets_1()
	EquipmentSets = { {["name"] = "testSet", ["icon"] = "icon", ["items"] = {},}, }
	assertEquals( 1, GetNumEquipmentSets() )
end
function test.testStub_GetNumFactions()
	assertEquals( 7, GetNumFactions() )
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
-- @TODO  Fix this test
--function test.testStub_GetNumTradeSkills()
--	assertEquals( 1, GetNumTradeSkills() )
--end
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
	assertEquals( "Test Realm", GetRealmName() )
end
function test.testStub_GetNormalizedRealmName()
	assertEquals( "TestRealm", GetNormalizedRealmName() )
end
--[[
function test.testStub_GetSendMailItemLink()
	assertEquals( "fail", GetSendMailItemLink() )
end
]]
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
	assertEquals( 4, actual )
end
function test.notestStub_GetTradeSkillReagentInfo_PlayerReagentCount_Nil()
	local actual = select(4, GetTradeSkillReagentInfo( 1, 1 ) )
	assertIsNil( actual )
end
function test.testStub_GetTradeSkillReagentInfo_PlayerReagentCount_Value()
	myInventory={["23784"] = 1}
	local actual = select(4, GetTradeSkillReagentInfo( 1, 1 ) )
	assertEquals( 1, actual )
end
-------------
--===========
-------------
--[[
function test.testStub_GetTradeSkillReagentItemLink()
	assertEquals( "fail", GetTradeSkillReagentItemLink() )
end
]]
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
function test.testStub_IsInGuild_true()
	assertTrue( IsInGuild() )
end
function test.testStub_IsInGuild_false()
	myGuild = {}
	assertIsNil( IsInGuild() )
	myGuild = { ["name"] = "Test Guild", }
end
function test.testStub_IsInRaid_true()
	myParty.raid = true
	assertTrue( IsInRaid() )
	myParty.raid = nil
end
function test.testStub_IsInRaid_false()
	myParty.raid = nil
	assertIsNil( IsInRaid() )
end
function test.testStub_IsQuestFlaggedCompleted()
	-- TODO: Write This
end
function test.testStub_NumTaxiNodes()
	assertEquals( 3, NumTaxiNodes() )
end
function test.testStub_PickupItem_ItemID()
	myInventory["7073"] = 1
	PickupItem( "7073" )
	assertTrue( CursorHasItem() )
	assertEquals( "7073", onCursor['item'] )
	assertEquals( 1, onCursor['quantity'] )
end
function test.testStub_PickupItem_ItemString()
	myInventory["7073"] = 1
	PickupItem( "item:7073" )
	assertTrue( CursorHasItem() )
	assertEquals( "7073", onCursor['item'] )
	assertEquals( 1, onCursor['quantity'] )
end
function test.testStub_PickupItem_ItemName()
	-- TODO: Expand to test that the cursor actually has the right item.
	myInventory["7073"] = 1
	PickupItem( "Broken Fang" )
	assertTrue( CursorHasItem() )
end
function test.testStub_PickupItem_ItemName_Bad()
	myInventory["7073"] = 1
	PickupItem( "Invalid item" )
	assertIsNil( CursorHasItem() )
end
function test.testStub_Item_NotInInventory()
	myInventory = {} -- force clearing of inventory
	PickupItem( "7073" )
	assertIsNil( CursorHasItem() )
end
function test.testStub_PickupItem_ItemLink()
	-- TODO: Expand to test that the cursor actually has the right item.
	myInventory["7073"] = 1
	PickupItem( "|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0:0|h[Broken Fang]|h|r" )
	assertTrue( CursorHasItem() )
end
function test.testStub_PickupInventoryItem()
	myGear[1] = "7073"
	ClearCursor()
	PickupInventoryItem(1)  -- returns nothing
	assertEquals( "7073", onCursor['item'] )
	assertEquals( "myGear", onCursor['from'] )
	assertEquals( 1, onCursor['fromSlot'] )
end
function test.testStub_PutItemInBackpack_FromInventory()
	myInventory["7073"] = 1
	ClearCursor()
	PickupItem( "7073" )
	PutItemInBackpack()
	assertIsNil( CursorHasItem(), "Cursor should be empty" )
	assertEquals( 1, myInventory["7073"] )
	--fail("Find out what side effects this has.  IE, does it clear the cursor?")
end
function test.testStub_PutItemInBackpack_FromEquipped_PutInInventory()
	myInventory["113596"] = nil  -- not in inventory
	myGear[1] = "113596"  -- is equipped
	ClearCursor()
	PickupInventoryItem(1)
	PutItemInBackpack()
	assertEquals( 1, myInventory["113596"], "Item should be in the bags" )
end
function test.testStub_PutItemInBackpack_FromEquipped_RemovedFromCursor()
	myInventory["113596"] = nil  -- not in inventory
	myGear[1] = "113596"  -- is equipped
	ClearCursor()
	PickupInventoryItem(1)
	PutItemInBackpack()
	assertIsNil( CursorHasItem(), "Cursor should be empty" )
end
function test.testStub_PutItemInBackpack_FromEquipped_RemovedFromGear()
	myInventory["113596"] = nil  -- not in inventory
	myGear[1] = "113596"  -- is equipped
	ClearCursor()
	PickupInventoryItem(1)
	PutItemInBackpack()
	assertIsNil( myGear[1], "Item should not be in my equipped inventory" )
end
function test.testStub_PutItemInBag_FromInventory()
	bagInfo = {  -- reset bags (only have empty backpack)
		[0] = {0, 0},
		[1] = {8, 0},
	}
	myInventory["7073"] = 1
	ClearCursor()
	PickupItem( "7073" )
	PutItemInBag(1)
	assertIsNil( CursorHasItem(), "Cursor should be empty" )
	assertEquals( 1, myInventory["7073"] )
end
function test.testStub_PutItemInBag_FromEquipped_PutInInventory()
	bagInfo = {  -- reset bags (only have empty backpack)
		[0] = {0, 0},
		[1] = {8, 0},
	}
	myInventory["113596"] = nil  -- not in inventory
	myGear[1] = "113596"  -- is equipped
	ClearCursor()
	PickupInventoryItem(1)
	PutItemInBag(1)
	assertEquals( 1, myInventory["113596"], "Item should be in the bags" )
end
function test.testStub_PutItemInBag_FromEquipped_RemovedFromCursor()
	bagInfo = {  -- reset bags (only have empty backpack)
		[0] = {0, 0},
		[1] = {8, 0},
	}
	myInventory["113596"] = nil  -- not in inventory
	myGear[1] = "113596"  -- is equipped
	ClearCursor()
	PickupInventoryItem(1)
	PutItemInBag(1)
	assertIsNil( CursorHasItem(), "Cursor should be empty" )
end
function test.testStub_PutItemInBag_FromEquipped_RemovedFromGear()
	bagInfo = {  -- reset bags (only have empty backpack)
		[0] = {0, 0},
		[1] = {8, 0},
	}
	myInventory["113596"] = nil  -- not in inventory
	myGear[1] = "113596"  -- is equipped
	ClearCursor()
	PickupInventoryItem(1)
	PutItemInBag(1)
	assertIsNil( myGear[1], "Item should not be in my equipped inventory" )
end
function test.testStub_PlaySoundFile()
	assertIsNil( PlaySoundFile( "File" ) )
end
function test.testStub_SecondsToTime_Sec()
	assertEquals( "59 Sec", SecondsToTime( 59 ) )
end
function test.testStub_SecondsToTime_Sec_noAbbr()
	assertEquals( "59 Seconds", SecondsToTime( 59, false, true ) )
end
function test.testStub_SecondsToTime_MinSec_oneMin()
	-- @TODO - This test may be in error
	assertEquals( "1 Min", SecondsToTime( 60 ) )
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
	assertIsNil( SendChatMessage( "Hello", "channel" ) )
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
function test.testStub_UnitAura_01()
	UnitAuras = {}
	assertIsNil( C_UnitAuras.GetAuraDataByIndex( "player", 1 ) )
end
function test.testStub_UnitAura_02()
	UnitAuras = {}
	wowSetAura( "player", "Fishing" )
	assertEquals( "Fishing", C_UnitAuras.GetAuraDataByIndex( "player", 1 ).name )
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
function test.testStub_UnitPowerMax_01()

end
function test.testStub_UnitRace_01()
	assertEquals( "Human", UnitRace( "player" ) )
end
function test.testStub_UnitSex_01()
	assertEquals( 3, UnitSex( "player" ) )
end

-----
----- Tests for C_WoWTokenPublic
function test.testStub_GetCommerceSystemStatus()
	local bool, seconds, zero = C_WowTokenPublic.GetCommerceSystemStatus()
	assertTrue( bool )
	assertEquals( 300, seconds )
	assertEquals( 0, zero )
end
function test.testStub_GetCurrentMarketPrice()
	local tokenPrice, five = C_WowTokenPublic.GetCurrentMarketPrice()
	assertEquals( 123456, tokenPrice )
	assertEquals( 5, five )
end
function test.testStub_UpdateMarketPrice()
	C_WowTokenPublic.UpdateMarketPrice()
end

-----
----- Tests for Frame Hide, Show, and IsShown
function test.testStub_Frame_DefaultsToShown()
	frame = CreateFrame("frame")
	assertTrue( frame:IsVisible() )
end
function test.testStub_Frame_HideFrame()
	frame = CreateFrame("frame")
	frame:Hide()
	assertFalse( frame:IsVisible() )
end
function test.testStub_Frame_ShowHiddenFrame()
	frame = CreateFrame("frame")
	frame:Hide()
	frame:Show()
	assertTrue( frame:IsVisible() )
end
function test.notestStub_Frame_rightFrameIsHidden()
	-- @TODO: Look into why this is not working.
	frame1 = CreateFrame("frame")
	frame2 = CreateFrame("frame")
	frame1:Hide()
	assertTrue( frame2:IsVisible() )
	assertFalse( frame1:IsVisible() )
end
function test.testStub_Frame_ClearAllPoints()
	-- https://wowwiki-archive.fandom.com/wiki/API_Region_SetPoint
	frame0 = CreateFrame("frame0")
	frame = CreateFrame("frame")
	frame.points = {{"TOP", frame0, "TOP", 0, 0}}
	frame:ClearAllPoints()
	assertEquals( 0, #frame.points )
end
function test.testStub_Frame_SetPoint_noOffset()
	frame0 = CreateFrame("frame0")
	frame = CreateFrame("frame")
	frame:ClearAllPoints()
	frame:SetPoint("BOTTOMLEFT", "frame0", "BOTTOMLEFT")
	assertEquals( "BOTTOMLEFT", frame.points[1][1] )
	--assertEquals( "$parent", frame.points[1][2]:GetName() )
	assertEquals( "BOTTOMLEFT", frame.points[1][3] )
end

-----
----- Connected realm relationship
function test.testStub_RealmRelationship_Same()
	assertEquals( 1, UnitRealmRelationship( "sameRealmUnit") )
end
function test.testStub_RealmRelationship_Same_Self()
	assertEquals( 1, UnitRealmRelationship( "player" ) )
end
function test.testStub_RealmRelationship_Coalesced()
	assertEquals( 2, UnitRealmRelationship( "coalescedRealmUnit" ) )
end
function test.testStub_RealmRelationship_Connected()
	assertEquals( 3, UnitRealmRelationship( "connectedRealmUnit" ) )
end

-----
----- TOC tests
function CreateFile( filename, contents )
	pathSeparator = string.sub( package.config, 1, 1 ) -- first character of this string (http://www.lua.org/manual/5.2/manual.html#pdf-package.config)
	filePathTable = {
		os.getenv( "PWD" ),
		"target",
		filename,
	}
	tocFile = table.concat( filePathTable, pathSeparator )
	file, err = io.open( tocFile, "w" )
	if err then
		print( err )
	else
		file:write( contents )
		io.close( file )
	end
	return tocFile
end
function test.testTOC_()
	CreateFile( "test.xml", "<Ui>\n<Frame name=\"topFrame\"></Frame></Ui>\n" )
	CreateFile( "test.lua", "print(\"hi\")\n")
	generatedFile = CreateFile( "test.toc", "test.lua\ntest.xml\n" )
	ParseTOC( generatedFile )
end


----- Sax tests
function test.before_testContentHandler()
	originalContentHandler = {}
	for k,v in pairs( contentHandler ) do
		originalContentHandler[k] = v
	end
end
function test.after_testContentHandler()
	contentHandler = {}
	for k,v in pairs( originalContentHandler ) do
		contentHandler[k] = v
	end
end
function test.testContentHandler_hasStartDocument()
	test.before_testContentHandler()
	assertTrue( contentHandler.startDocument )
	test.after_testContentHandler()
end
function test.testContentHandler_hasEndDocument()
	test.before_testContentHandler()
	assertTrue( contentHandler.endDocument )
	test.after_testContentHandler()
end
function test.testContentHandler_hasStartElement()
	test.before_testContentHandler()
	assertTrue( contentHandler.startElement )
	test.after_testContentHandler()
end
function test.testContentHandler_hasEndElement()
	test.before_testContentHandler()
	assertTrue( contentHandler.endElement )
	test.after_testContentHandler()
end
function test.testContentHandler_hasCharacters()
	test.before_testContentHandler()
	assertTrue( contentHandler.characters )
	test.after_testContentHandler()
end


function test.before_testSax()
	originalContentHandler = {}
	for k,v in pairs( contentHandler ) do
		originalContentHandler[k] = v
	end
end
function test.after_testSax()
	contentHandler = {}
	for k,v in pairs( originalContentHandler ) do
		contentHandler[k] = v
	end
end
function test.testSAX_MakeParser()
	test.before_testSax()
	assertTrue( saxParser.makeParser() )
	test.after_testSax()
end
function test.testSAX_setContentHandler()
	test.before_testSax()
	ch = contentHandler
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	assertTrue( parser.contentHandler )
	--ch = nil
	--parser = nil
	test.after_testSax()
end
function test.notestSAX_Parse_StartDocument_TextIn()
	test.before_testSax()
	ch = contentHandler
	ch.startDocument = function( this ) this.started = true; end
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "<xml/>" )
	assertTrue( ch.started )
end
function test.notestSAX_Parse_StartDocument_FileIn()
	test.before_testSax()
	ch = contentHandler
	ch.startDocument = function( this ) this.started = true; end
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "../build.xml" )
	assertTrue( ch.started )
end
function test.notestSAX_Parse_StartDocument_NotGiven_TextIn()
	test.before_testSax()
	ch = contentHandler
	ch.startDocument = nil
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "<xml/>" )
	assertIsNil( ch.started )
end
function test.testSAX_Parse_EndDocument_TextIn()
	test.before_testSax()
	ch = contentHandler
	ch.endDocument = function( this ) this.ended = true; end
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "<xml/>" )
	assertTrue( ch.ended )
end
function test.testSAX_Parse_StartElement_TextIn()
	-- affirm that the startElement method is called
	test.before_testSax()
	ch = contentHandler
	ch.startElement = function( this, tagIn, attribs ) this.tagIn = tagIn; end
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "<xml/>" )
	assertEquals( "xml", ch.tagIn )
end
function test.testSAX_Parse_StartElementAttribs_TextIn()
	-- affirm that the startElement method is called
	test.before_testSax()
	ch = contentHandler
	ch.startElement = function( this, tagIn, attribs ) this.version = attribs["version"]; end
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "<xml version=\"1\" />" )
	assertEquals( "1", ch.version )
end
function test.testSAX_Parse_StartElementAttribs_TextIn2()
	-- affirm that the startElement method is called
	test.before_testSax()
	ch = contentHandler
	ch.startElement = function( this, tagIn, attribs ) this.version = attribs["version"]; end
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "<xml version=\"2\"></xml>" )
	assertEquals( "2", ch.version )
end
function test.testSax_Parse_StartElement_Prolog()
	test.before_testSax()
	ch = contentHandler
	ch.startElement = function( this, tagIn, attribs ) this.version = attribs["version"]; end
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "<?xml version=\"1.0\" encoding=\"UTF-8\"?><xml version=\"3\"></xml>" )
	assertEquals( "3", ch.version )
end
function test.testSax_Parse_StartElement_Comment()
	test.before_testSax()
	ch = contentHandler
	ch.startElement = function( this, tagIn, attribs ) this.bob = attribs["bob"]; end
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "<?xml version=\"1.0\" encoding=\"UTF-8\"?><!-- <xml bob=\"4\"></xml>-->" )
	assertIsNil( ch.bob )
end
function test.testSax_Parse_NestedElements()
	test.before_testSax()
	ch = contentHandler
	ch.startElement = function( this, tagIn, attribs ) this.broken = attribs["broken"]; end
	parser = saxParser.makeParser()
	parser.setContentHandler( ch )
	parser.parse( "<?xml version=\"1.0\" encoding=\"UTF-8\"?><xml version=\"4\"><bleh broken=\"5\"></bleh></xml>" )
	assertEquals( "5", ch.broken )
end
----------------------------------
-- Run the tests
----------------------------------
test.run()
