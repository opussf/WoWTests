-----------------------------------------
-- Author  :  Opussf
-- Date    :  $Date:$
-- Revision:  $Revision:$
-----------------------------------------
-- These are functions from wow that have been needed by addons so far
-- Not a complete list of the functions.
-- Most are only stubbed enough to pass the tests
-- This is not intended to replace WoWBench, but to provide a stub structure for
--     automated unit tests.

local itemDB = {
}

-- simulate an internal inventory
--myInventory = { ["9999"] = 52, }
myInventory = {}
bagInfo = {
	[0] = {16, 0},
}
myCurrencies = {}
-- set one of these to the number of people in the raid or party to reflect being in group or raid.
-- roster should be an array for GetRaidRosterInfo
myParty = { ["group"] = nil, ["raid"] = nil, ["roster"] = {} }
myGuild = { ["name"] = "Test Guild", }
-- set myGuild = {} to simulate not in a guild
outMail = {}
inbox = {}
onCursor = {}
-- onCursor["item"] = itemId
-- onCursor["quantity"] = # of item
-- onCursor["from"] = picked up from -- Should have enough info to effect an item swap "myInventory | myGear"
globals = {}
accountExpansionLevel = 4   -- 0 to 5

SlotListMap={ "HeadSlot","NeckSlot","ShoulderSlot","ShirtSlot","ChestSlot","WaistSlot","LegsSlot",
		"FeetSlot", "WristSlot", "HandsSlot", "Finger0Slot","Finger1Slot","Trinket0Slot","Trinket1Slot",
		"BackSlot","MainHandSlot","SecondaryHandSlot","RangedSlot","TabardSlot", "Bag0Slot", "Bag1Slot",
		"Bag2Slot", "Bag3Slot",
}
myGear = {} -- items that are equipped in the above slots, index matching
Items = {
	["7073"] = {["name"] = "Broken Fang", ["link"] = "|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0:0|h[Broken Fang]|h|r"},
	["6742"] = {["name"] = "UnBroken Fang", ["link"] = "|cff9d9d9d|Hitem:6742:0:0:0:0:0:0:0:80:0:0|h[UnBroken Fang]|h|r"},
	["22261"]= {["name"] = "Love Fool", ["link"] = "|cff9d9d9d|Hitem:22261:0:0:0:0:0:0:0:80:0:0|h[Love Fool]|h|r"},
	["49927"]= {["name"] = "Love Token", ["link"] = ""},
	["74661"]= {["name"] = "Black Pepper", ["link"] = "|cffffffff|Hitem:74661:0:0:0:0:0:0:0:90:0:0|h[Black Pepper]|h|r"},
	["85216"]= {["name"] = "Enigma Seed", ["link"]= "|cffffffff|Hitem:85216:0:0:0:0:0:0:0:90:0:0|h[Enigma Seed]|h|r"},
	["113596"] = {["name"] = "Head Thing", ["link"] = "|cffffffff|Hitem:113596:0:0:0:0:0:0:0:90:0:0|h[Head Thing|h|r", ["slotPrefix"] = "Head"},
    -- ^^ Look up this item to build the correct link. (not super important)
    -- ^^ Also need another head item for testing.
    ["999999"] = {["name"] = "Finger Thing", ["link"] = "|cffffffff|Hitem:999999:0:0:0:0:0:0:0:90:0:0|h[Finger Thing|h|r", ["slotPrefix"] = "Finger"},
}

-- simulate the data structure that is the flight map
-- Since most the data assumes Alliance, base it on being at Stormwind
TaxiNodes = {
	{["name"] = "Stormwind", ["type"] = "CURRENT", ["hops"] = 0, ["cost"] = 0},
	{["name"] = "Rebel Camp", ["type"] = "REACHABLE", ["hops"] = 1, ["cost"] = 40},
	{["name"] = "Ironforge", ["type"] = "NONE", ["hops"] = 1, ["cost"]=1000},
}
Currencies = {
	["402"] = { ["name"] = "Ironpaw Token", ["texturePath"] = "", ["weeklyMax"] = 0, ["totalMax"] = 0, isDiscovered = true, ["link"] = "|cff9d9d9d|Hcurrency:402:0:0:0:0:0:0:0:80:0:0|h[Ironpaw Token]|h|r"},
	["703"] = { ["name"] = "Fictional Currency", ["texturePath"] = "", ["weeklyMax"] = 1000, ["totalMax"] = 4000, isDiscovered = true, ["link"] = "|cffffffff|Hcurrency:703|h[Fictional Currency]|h|r"},
}
MerchantInventory = {
	{["id"] = 7073, ["name"] = "Broken Fang", ["cost"] = 5000, ["quantity"] = 1, ["isUsable"] = 1, ["link"] = "|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0:0|h[Broken Fang]|h|r"},
	{["id"] = 6742, ["name"] = "UnBroken Fang", ["cost"] = 10000, ["quantity"] = 1, ["isUsable"] = 1, ["link"] = "|cff9d9d9d|Hitem:6742:0:0:0:0:0:0:0:80:0:0|h[UnBroken Fang]|h|r"},
	{["id"] = 22261, ["name"] = "Love Fool", ["cost"] = 0, ["quantity"] = 1, ["isUsable"] = 1, ["link"] = "|cff9d9d9d|Hitem:22261:0:0:0:0:0:0:0:80:0:0|h[Love Fool]|h|r",
		["currencies"] = {{["id"] = 49927, ["quantity"] = 10},}},
	{["id"] = 49927, ["name"] = "Love Token", ["cost"] = 0, ["quantity"] = 1, ["isUsable"] = 1, ["link"] = "",
		["currencies"] = {{["id"] = 49916, ["quantity"] = 1},}},  -- Lovely Charm Bracelet
	{["id"] = 74661, ["name"] = "Black Pepper", ["cost"] = 0, ["quantity"] = 1, ["isUsable"] = 1, ["link"] = "﻿|cffffffff|Hitem:74661:0:0:0:0:0:0:0:90:0:0|h[Black Pepper]|h|r",
		["currencies"] = {{["id"] = 402, ["quantity"] = 1},}},
	{["id"] = 85216, ["name"] = "Enigma Seed", ["cost"] = 2500, ["quantity"] = 1, ["isUsable"] = nil, ["link"]= "|cffffffff|Hitem:85216:0:0:0:0:0:0:0:90:0:0|h[Enigma Seed]|h|r"},
}
TradeSkillItems = {
	{["id"] = 44157, ["name"] = "Engineering: Turbo-Charged Flying Machine", ["cost"]= 0, ["numReagents"] = 4,
		["minMade"] = 1, ["maxMade"] = 1,
		["elink"] = "|cffffffff|Henchant:44157|h[Engineering: Turbo-Charged Flying Machine]|h|r",
		["ilink"] = "|cff9d9d9d|Hitem:34061:0:0:0:0:0:0:0:80:0:0|h[Turbo-Charged Flying Machine]|h|r",
		["reagents"] = {{["name"]="Adamantite Frame", ["texture"]="", ["count"]=4, ["id"]=23784},
			{["name"]="Khorium Power Core", ["texture"]="", ["count"]=8, ["id"]=23786,
					["link"] = "|cffffff|Hitem:23786|h[Khorium Power Core]|h|r"},
			{["name"]="Felsteel Stabilizer", ["texture"]="", ["count"]=8, ["id"]=23787,
					["link"] = "|cffffff|Hitem:23787|h[Felsteel Stabilizer]|h|r"},
			{["name"]="Hula Girl Doll", ["texture"]="", ["count"]=1, ["id"]=34249,
					["link"] = "|cffffff|Hitem:34249|h[Hula Girl Doll]|h|r"},
		},
	},
}
-- EquipmentSets is an array (1 based numeric key table)
EquipmentSets = {
	{["name"] = "testSet", ["icon"] = "icon", ["items"] = {[1] = "113596"},},
}

-- WOW's function renames
strmatch = string.match
strfind = string.find
strsub = string.sub
strtolower = string.lower
time = os.time
date = os.date
max = math.max
random = math.random
tinsert = table.insert

-- WOW's functions
function getglobal( globalStr )
	-- set the globals table to return what is needed from the 'globals'
	return globals[ globalStr ]
end
function hooksecurefunc(externalFunc, internalFunc)
end

-- WOW's structures
SlashCmdList = {}
FACTION_BAR_COLORS = {
	[1] = {r = 1.0, g = 0, b = 0},                  -- 36000 Hated - Red
	[2] = {r = 1.0, g = 0.5019608, b = 0},          -- 3000 Hostile - Orange
	[3] = {r = 1.0, g = 0.8196079, b = 0},          -- 3000 Unfriendly - Yellow
	[4] = {r = 0.8, g = 0.9, b = 0.8},              -- 3000 Neutral - Grey
	[5] = {r = 1.0, g = 1.0, b = 1.0},              -- 6000 Friendly - White
	[6] = {r = 0, g = 0.6, b = 0.1},                -- 12000 Honored - Green
	[7] = {r = 0, g = 0, b = 1.0},                  -- 21000 Revered - Blue
	[8] = {r = 0.5803922, g = 0, b = 0.827451},     -- 1000 Exalted - Purple
}

-- WOW's constants
-- http://www.wowwiki.com/BagId
NUM_BAG_SLOTS=4
ATTACHMENTS_MAX_SEND=8

-- WOW's frames
Frame = {
		["Events"] = {},
		["Hide"] = function() end,
		["RegisterEvent"] = function(event) Frame.Events.event = true; end,
		["SetPoint"] = function() end,
		["UnregisterEvent"] = function(event) Frame.Events.event = nil; end,
		["GetName"] = function(self) return self.name end,
}
function CreateFrame( frameType, frameName, parentFrame, inheritFrame )
	--http://www.wowwiki.com/API_CreateFrame
	return Frame
end

function CreateFontString(name,...)
	--print("Creating new FontString: "..name)
	FontString = {}
	--	print("1")
	for k,v in pairs(Frame) do
		FontString[k] = v
	end
	FontString.text = ""
	FontString["SetText"] = function(self,text) self.text=text; end
	FontString["GetText"] = function(self) return(self.text); end
	FontString.name=name
	--print("FontString made?")
	return FontString
end

function CreateStatusBar(name,...)
	StatusBar = {}
	for k,v in pairs(Frame) do
		StatusBar[k] = v
	end
	StatusBar.name=name

	StatusBar["SetMinMaxValues"] = function() end;
	StatusBar["Show"] = function() end;

	return StatusBar
end

Slider = {
		["GetName"] = function() return ""; end,
		["SetText"] = function(text) end,
}
function CreateSlider( name, ... )
	Slider = {}
	for k,v in pairs(Frame) do
		Slider[k] = v
	end
	Slider.name=name
	Slider[name.."Text"] = CreateFontString(name.."Text")
	Slider["GetName"] = function(self) return self.name; end
	Slider["SetText"] = function(text) end
	return Slider
end

function ChatFrame_AddMessageEventFilter()
end

-- WOW's resources
DEFAULT_CHAT_FRAME={ ["AddMessage"] = print, }
UIErrorsFrame={ ["AddMessage"] = print, }

-- stub some external API functions (try to keep alphabetical)
function BuyMerchantItem( index, quantity )
	-- adds quantity of index to myInventory
	-- no return value
	local itemID = MerchantInventory[index].id
	if myInventory[itemID] then
		myInventory[itemID] = myInventory[itemID] + quantity
	else
		myInventory[itemID] = quantity
	end
	--INEED.UNIT_INVENTORY_CHANGED()
end
function CheckInbox()
	-- http://www.wowwiki.com/API_CheckInbox
	-- Fires the MAIL_INBOX_UPDATE event when data is available
	-- @TODO - Write this
end
function ClearCursor()
	onCursor = {}
end
--[[
function ClearSendMail()
	-- http://www.wowwiki.com/API_ClearSendMail
	-- clears any text, items or money from the mail message to be sent
	-- @TODO - Write this
end
function ClickSendMailItemButton( slot, clearItem )
	-- http://www.wowwiki.com/API_ClickSendMailItemButton
	--
	-- @TODO - Write this
end
function CloseMail()
	-- http://www.wowwiki.com/API_CloseMail
	-- Fires the MAIL_CLOSED event
	-- returns: nil
	-- @TODO - Write this
end
]]
function CombatTextSetActiveUnit( who )
	-- http://www.wowwiki.com/API_CombatTextSetActiveUnit
	-- @TODO - Write this
end
function CursorHasItem()
	-- http://www.wowwiki.com/API_CursorHasItem
	-- Returns: 1-nil  if cursor has an item
	if onCursor["item"] then
		return true
	end
end
function DoEmote( emote )
	-- not tested as the only side effect is the character doing an emote
end
function EquipItemByName( itemIn, slotIDIn )
	-- http://www.wowwiki.com/API_EquipItemByName
	-- item: string (itemID, itemName, or itemLink)
	-- slot: number (optional: where to place it)
	local itemID
	local slotID
	if tonumber(itemIn) then -- got the itemID
		itemID = itemIn
	elseif strmatch( itemIn, "item:(%d*)" ) then -- got an ItemString or ItemLink
		itemID = string.format("%s", strmatch( itemIn, "item:(%d*)" ) )
	else -- Anything else, treat it as an ItemName.
		for ID, data in pairs(Items) do
			if itemIn == data.name then
				itemID = ID
				break  -- break the loop once the item is found.
			end
		end
	end
	--print(itemID,type(itemID),(slotIDIn or "nil"))
	-- look for the item in inventory
	if myInventory[itemID] then -- is in inventory
		if Items[itemID] then -- is a valid item
			if Items[itemID].slotPrefix then -- item has a slot prefix (it can be equipped - to that slot)
				-- find valid slot ID, set slotID if slotIDIn is valid, or not set
				for i, slotName in pairs(SlotListMap) do
					if strmatch( slotName, Items[itemID].slotPrefix ) then -- valid possible slot
						if (not slotIDIn) or (slotIDIn and slotIDIn == i) then
							slotID = slotID or i
						end
					end
				end
			end
		else
			error("item:"..itemID.." is unknown. This should not the thrown by the client, but this is for testing.")
		end
		if slotID then
			local swapItem = myGear[slotID]
			myGear[slotID] = itemID
			if swapItem then myInventory[swapItem] = 1 end
			myInventory[itemID] = nil
		end
	end
end
function GetAccountExpansionLevel()
	-- http://www.wowwiki.com/API_GetAccountExpansionLevel
	-- returns 0 to 4 (5)
	return accountExpansionLevel
end
function GetAddOnMetadata(addon, field)
	-- returns addonData[field] for 'addon'
	-- local addonData = { ["version"] = "1.0", }
	return addonData[field]
end
function GetCoinTextureString( copperIn, fontHeight )
-- simulates the Wow function:  http://www.wowwiki.com/API_GetCoinTextureString
-- fontHeight is ignored for now.
	if copperIn then
		-- cannot return exactly what WoW does, but can make a simular string
		local gold = math.floor(copperIn / 10000); copperIn = copperIn - (gold * 10000)
		local silver = math.floor(copperIn / 100); copperIn = copperIn - (silver * 100)
		local copper = copperIn
		return( (gold and gold.."G ")..
				(silver and silver.."S ")..
				(copper and copper.."C"))
	end
end
function GetContainerNumFreeSlots( bagId )
	-- http://www.wowwiki.com/API_GetContainerNumFreeSlots
	-- http://www.wowwiki.com/BagType
	-- returns numberOfFreeSlots, BagType
	-- BagType should be 0
	-- TODO: For API, what should it return if no bag is equipped?
	-- ^^ Note, the backpack(0) is ALWAYS equipped.
	if bagInfo[bagId] then
		return unpack(bagInfo[bagId])
	else
		return 0, 0
	end
end
function GetCurrencyInfo( id ) -- id is string
	-- http://wowprogramming.com/docs/api/GetCurrencyInfo
	-- returns name, amount, texturePath, earnedThisWeek, weeklyMax, totalMax, isDiscovered
	if Currencies[id] then
		local c = Currencies[id]
		return c["name"], (myCurrencies[id] or 0), "", 0, c["weeklyMax"], c["totalMax"], true
	end
end
function GetCurrencyLink( id )
	if Currencies[id] then
		return Currencies[id].link
	end
end
function GetEquipmentSetItemIDs( setName )
	-- http://wowprogramming.com/docs/api/GetEquipmentSetItemIDs
	-- Returns a table of item IDs keyed by slotID of items in the equipmentSet
	for _, set in pairs(EquipmentSets) do
		if setName == set.name then
			return set.items
		end
	end
end
function GetEquipmentSetInfo( index )
	-- http://www.wowwiki.com/API_GetEquipmentSetInfo
	-- Returns: name, icon, lessIndex = GetEquipmentSetInfo(index)
	-- Returns: nill if no equipmentSet at that index
	-- lessIndex is index-1 ( not used )
	if EquipmentSets[index] then
		return EquipmentSets[index].name, EquipmentSets[index].icon, index-1
	end
end
function GetEquipmentSetInfoByName( nameIn )
	-- http://www.wowwiki.com/API_GetEquipmentSetInfo
	-- Returns: icon, lessIndex = GetEquipmentSetInfoByName
	for i = 1, #EquipmentSets do
		if EquipmentSets[i].name == nameIn then  -- Since EquipementSet names are case sensitve...
			return EquipmentSets[i].icon, i-1
		end
	end
end
function GetInventoryItemID( unitID, invSlot )
	-- http://www.wowwiki.com/API_GetInventoryItemID
	-- unitID: string   (http://www.wowwiki.com/API_TYPE_UnitId)  (bossN 1-4, player, partyN 1-4, raidN 1-40)
	-- invSlot: number  (http://www.wowwiki.com/InventorySlotId)
	-- Returns: itemID of the item in that slot, or nil
	if unitID == "player" then
		return myGear[invSlot]
	end
end
function GetInventoryItemLink( unitID, slotID )
	-- http://www.wowwiki.com/API_GetInventoryItemLink
	-- unitID: string
	-- slotID: number
	-- Returns: itemLink or nil
	if unitID == "player" then
		if myGear[slotID] then -- has an item in the slot
			if Items[myGear[slotID]] then -- knows about the item ID
				return Items[myGear[slotID]].link
			end
		end
	end
end
function GetInventorySlotInfo( slotName )
	-- http://www.wowwiki.com/API_GetInventorySlotInfo
	-- Returns: slotID, textureName
	-- Return empty string for textureName for now.
	for k,v in pairs(SlotListMap) do
		if v == slotName then
			return k,""
		end
	end
end
function GetItemCount( itemID, includeBank )
	-- print( itemID, myInventory[itemID] )
	return myInventory[itemID] or 0
end
function GetItemInfo( itemID )
	-- returns name, itemLink
	if Items[itemID] then
		return Items[itemID].name, Items[itemID].link
	end
end
function GetMerchantItemCostInfo( index )
	-- returns count of alterate items needed to purchase an item
	if MerchantInventory[ index ] then  -- valid index
		if MerchantInventory[ index ].currencies then  -- has alternate currencies
			local count = 0
			for _ in pairs (MerchantInventory[ index ].currencies ) do count = count + 1 end
			return count
		end
	end
	return 0  -- returns 0 not nil on 0 currencies
end
function GetMerchantItemCostItem( index, currencyIndex )
	-- returns texture, value, and link for 1..GetMerchantItemCostInfo() for index item
	if MerchantInventory[ index ] then  -- valid index
		if MerchantInventory[ index ].currencies then  -- has alternate currencies
			if MerchantInventory[ index ].currencies[ currencyIndex ] then
				return "", MerchantInventory[ index ].currencies[ currencyIndex ].quantity, ""
			end
		end
	end
	return nil, nil, nil  -- probably don't need to do this.
end
function GetMerchantItemLink( index )
	-- returns a link for item at index
	if MerchantInventory[ index ] then
		return MerchantInventory[ index ].link
	else
		return nil
	end
end
function GetMerchantItemInfo( index )
	--local itemName, texture, price, quantity, numAvailable, isUsable = GetMerchantItemInfo( i )
	if MerchantInventory[ index ] then
		local item = MerchantInventory[ index ]
		return item.name, "", item.cost, item.quantity, -1, item.isUsable
	end
end
function GetMerchantItemMaxStack( index )
	-- Max allowable amount per purchase.  Hard code to 20 for now
	return 20
end
function GetMerchantNumItems()
	local count = 0
	for _ in pairs(MerchantInventory) do count = count + 1 	end
	return count
end
function GetNumEquipmentSets()
	-- http://www.wowwiki.com/API_GetNumEquipmentSets
	-- Returns 0,MAX_NUM_EQUIPMENT_SETS
	return #EquipmentSets
end
function GetNumGroupMembers()
	-- http://www.wowwiki.com/API_GetNumGroupMembers
	-- Returns number of people (include self) in raid or party, 0 if not in raid / party
	if myParty.raid then
		return #myParty.roster
	else
		return #myParty.roster
	end
	return 0
end
function GetNumRoutes( nodeId )
	-- http://wowprogramming.com/docs/api/GetNumRoutes
	-- returns numHops
	return TaxiNodes[nodeId].hops
end
function GetNumTradeSkills( )
	-- returns number of lines in the tradeskill window to show
	local count = 0
	for _ in pairs( TradeSkillItems ) do count = count + 1 end
	return count
end
function GetRaidRosterInfo( raidIndex )
	-- http://www.wowwiki.com/API_GetRaidRosterInfo
	-- returns name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML
	if (myParty.raid or myParty.party) and myParty.roster then
		return unpack(myParty.roster[raidIndex]) -- unpack returns the array as seperate values
	end
end
function GetRealmName()
	return "testRealm"
end
function GetSendMailItem( slot )
	-- 1 <= slot <= ATTACHMENTS_MAX_SEND
	-- returns: itemName, itemTexture, stackCount, quality
end
function GetSendMailItemLink( slot )
	-- 1 <= slot <= ATTACHMENTS_MAX_SEND
	-- returns: itemlink
end
function GetSendMailMoney()
	-- returns: amount (in copper)
end
function GetSendMailPrice()
	-- returns: amount (in copper) to send the mail
end
function GetTradeSkillItemLink( index )
	if TradeSkillItems[index] then
		return TradeSkillItems[index].ilink
	end
end
function GetTradeSkillReagentInfo( skillIndex, reagentIndex )
	-- reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(tradeSkillRecipeId, reagentId)
	if TradeSkillItems[skillIndex] then
		if TradeSkillItems[skillIndex].reagents[reagentIndex] then
			return TradeSkillItems[skillIndex].reagents[reagentIndex].name, -- reagentName
					"",  --reagentTexture
					TradeSkillItems[skillIndex].reagents[reagentIndex].count, -- reagentCount
					myInventory[TradeSkillItems[skillIndex].reagents[reagentIndex].id] or nil -- playerReagentCount
		end
	end
end
function GetTradeSkillReagentItemLink( skillIndex, reagentIndex )
	-- link = GetTradeSkillReagentItemLink(skillId, reagentId)
	-- skillId = TradeSkillIndex
	-- reagentId = ReagentIndex
	-- returns LINK or NIL (?)
	if TradeSkillItems[skillIndex] then
		if TradeSkillItems[skillIndex].reagents[reagentIndex] then
			return TradeSkillItems[skillIndex].reagents[reagentIndex].link
		end
	end
end
function GetTradeSkillNumMade( index )
	-- returns minMade, maxMade of the target item
	return TradeSkillItems[index].minMade, TradeSkillItems[index].maxMade
end
function GetTradeSkillNumReagents( index )
	return TradeSkillItems[index].numReagents
end
function GetTradeSkillRecipeLink( index )
	return TradeSkillItems[index].elink
end
--[[
function HasNewMail()
	return true
end
function InterfaceOptionsFrame_OpenToCategory()
end
]]
function IsInGuild()
	-- http://www.wowwiki.com/API_IsInGuild
	-- 1, nil boolean return of being in guild
	return (myGuild and myGuild.name) and 1 or nil
end
function IsInRaid()
	-- http://www.wowwiki.com/API_IsInRaid
	-- 1, nill boolean return of being in raid
	-- myParty = { ["group"] = nil, ["raid"] = nil } -- set one of these to true to reflect being in group or raid.
	return ( myParty["raid"] and 1 or nil )
end
function NumTaxiNodes()
	-- http://www.wowwiki.com/API_NumTaxiNodes
	local count = 0
	for _ in pairs(TaxiNodes) do
		count = count + 1
	end
	return count
end
function PickupItem( itemIn )
	-- http://www.wowwiki.com/API_PickupItem
	-- itemString is:
	--   ItemID (Numeric value)
	--   ItemString (item:#######)
	--   ItemName ("Hearthstone")
	--   ItemLink (Full link text as if Shift-Clicking Item)
	-- Should only pick up an item that you know about. (in bags for now (myInventory) )
	-- -- Note: Does not pick up an item from equipped inventory
	-- Not sure what this should do if there is already something on the cursor
	local itemID
	if tonumber(itemIn) then -- got the itemID
		itemID = itemIn
	elseif strmatch( itemIn, "item:(%d*)" ) then -- got an ItemString or ItemLink
		itemID = string.format("%s", strmatch( itemIn, "item:(%d*)" ) )
	else -- Anything else, treat it as an ItemName.
		for ID, data in pairs(Items) do
			if itemIn == data.name then
				itemID = ID
				break  -- break the loop once the item is found.
			end
		end
	end
	onCursor={}
	if myInventory[itemID] then
		onCursor['item'] = itemID
		onCursor['quantity'] = myInventory[itemID]	-- pickup the quantity of the item in the inventory
		onCursor['from'] = "myInventory"
	end
end
function PickupInventoryItem( slotID )
	-- http://www.wowwiki.com/API_PickupInventoryItem
	-- If the cursor is empty, then it will attempt to pick up the item in the slotId.
    -- If the cursor has an item, then it will attempt to equip the item to the slotId and place the previous slotId item (if any) where the item on cursor orginated.
    -- If the cursor is in repair or spell-casting mode, it will attempt the action on the slotId.
	if myGear[slotID] then -- There is an item in this slot.
		onCursor['item'] = myGear[slotID]
		onCursor['quantity'] = 1
		onCursor['from'] = 'myGear'
		onCursor['fromSlot'] = slotID
	end
end
function PlaySoundFile( file )
	-- does nothing except play a sound.  Do not test.
end
function PutItemInBackpack()
	-- http://www.wowwiki.com/API_PutItemInBackpack
	-- no argument, no return
	-- This puts the item in the Backpack and clears the cursor
	-- Really, it does not really put it in any bag, just clears the cursor, or removes it from inventory
	-- Removes item from source
	if onCursor["item"] then -- Cursor has an item
		myInventory[onCursor['item']] = onCursor['quantity']
		if (onCursor["from"] == "myGear" and onCursor['fromSlot']) then  -- Came from equipped items
			myGear[onCursor['fromSlot']] = nil  -- Remove it from Gear
		end
	end
	onCursor = {}
end
function PutItemInBag( bagNum )
	-- http://www.wowwiki.com/API_PutItemInBag
	-- bagNum, numberic (20 right most - 23 left most)
	-- Really, it does not really put it in any bag, just clears the cursor, or removes it from inventory
	if onCursor["item"] then
		myInventory[onCursor['item']] = onCursor['quantity']
		if (onCursor["from"] == "myGear" and onCursor['fromSlot']) then
			myGear[onCursor['fromSlot']] = nil -- Remove it from Gear
		end
	end
	onCursor = {}
end
function SecondsToTime( secondsIn, noSeconds, notAbbreviated, maxCount )
	-- http://www.wowwiki.com/API_SecondsToTime
	-- formats seconds to a readable time
	-- secondsIn: number of seconds to work with
	-- noSeconds: True to ommit seconds display (optional - default: false)
	-- notAbbreviated: True to use full unit text, short text otherwise (optional - default: false)
	-- maxCount: Maximum number of terms to return (optional - default: 2)
	maxCount = maxCount or 2
	local days, hours, minutes, seconds = 0
	local outArray = {}
	days = math.floor( secondsIn / 86400 )
	secondsIn = secondsIn - (days * 86400)

	hours = math.floor( secondsIn / 3600 )
	secondsIn = secondsIn - (hours * 3600)

	minutes = math.floor( secondsIn / 60 )
	seconds = secondsIn - (minutes * 60)

	-- format output
	local includeZero = false
	formats = { { "%i Day", "%i Day", days},
			{ "%i Hr", "%i Hours", hours},
			{ "%i Min", "%i Minutes", minutes},
			{ "%i Sec", "%i Seconds", seconds},
		}
	if noSeconds then  -- remove the seconds format if no seconds
		table.remove(formats, 4)
	end

	for i = 1,#formats do
		if (#outArray < maxCount) and (((formats[i][3] > 0) or includeZero)) then
			table.insert( outArray,
					string.format( formats[i][(notAbbreviated and 2 or 1)], formats[i][3] )
			)
			includeZero = true  -- include subsequent 0 values
		end
	end
	return( table.concat( outArray, " " ) )
end
function SendChatMessage( msg, chatType, language, channel )
	-- http://www.wowwiki.com/API_SendChatMessage
	-- This could simulate sending text to the channel, in the language, and raise the correct event.
	-- returns nil
	-- @TODO: Expand this
end
function TaxiNodeCost( nodeId )
	-- http://www.wowwiki.com/API_TaxiNodeCost
	return TaxiNodes[nodeId].cost
end
function TaxiNodeName( nodeId )
	-- http://www.wowwiki.com/API_TaxiNodeName
	return TaxiNodes[nodeId].name
end
function TaxiNodeGetType( nodeId )
	-- http://www.wowwiki.com/API_TaxiNodeGetType
	return TaxiNodes[nodeId].type
end
function UnitClass( who )
	local unitClasses = {
		["player"] = "Warlock",
	}
	return unitClasses[who]
end
function UnitFactionGroup( who )
	-- http://www.wowwiki.com/API_UnitFactionGroup
	local unitFactions = {
		["player"] = {"Alliance", "Alliance"}
	}
	return unpack( unitFactions[who] )
end
function UnitName( who )
	local unitNames = {
		["player"] = "testPlayer",
	}
	return unitNames[who]
end
function UnitRace( who )
	local unitRaces = {
		["player"] = "Human",
	}
	return unitRaces[who]
end
function UnitSex( who )
	-- 1 = unknown, 2 = Male, 3 = Female
	local unitSex = {
		["player"] = 3,
	}
	return unitSex[who]
end
