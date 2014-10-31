-----------------------------------------
-- Author  :  $Author:$
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
myCurrencies = {}
-- set one of these to the number of people in the raid or party to reflect being in group or raid.
-- roster should be an array for GetRaidRosterInfo
myParty = { ["group"] = nil, ["raid"] = nil, ["roster"] = {} }
outMail = {}
globals = {}
accountExpansionLevel = 4   -- 0 to 5

Items = {
	["7073"] = {["name"] = "Broken Fang", ["link"] = "|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0:0|h[Broken Fang]|h|r"},
	["6742"] = {["name"] = "UnBroken Fang", ["link"] = "|cff9d9d9d|Hitem:6742:0:0:0:0:0:0:0:80:0:0|h[UnBroken Fang]|h|r"},
	["22261"]= {["name"] = "Love Fool", ["link"] = "|cff9d9d9d|Hitem:22261:0:0:0:0:0:0:0:80:0:0|h[Love Fool]|h|r"},
	["49927"]= {["name"] = "Love Token", ["link"] = ""},
	["74661"]= {["name"] = "Black Pepper", ["link"] = "|cffffffff|Hitem:74661:0:0:0:0:0:0:0:90:0:0|h[Black Pepper]|h|r"},
	["85216"]= {["name"] = "Enigma Seed", ["link"]= "|cffffffff|Hitem:85216:0:0:0:0:0:0:0:90:0:0|h[Enigma Seed]|h|r"},
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
		["currencies"] = {["id"] = 49927, ["quantity"] = 10},},
	{["id"] = 49927, ["name"] = "Love Token", ["cost"] = 0, ["quantity"] = 1, ["isUsable"] = 1, ["link"] = "",
		["currencies"] = {["id"] = 49916, ["quantity"] = 1},},  -- Lovely Charm Bracelet
	{["id"] = 74661, ["name"] = "Black Pepper", ["cost"] = 0, ["quantity"] = 1, ["isUsable"] = 1, ["link"] = "﻿|cffffffff|Hitem:74661:0:0:0:0:0:0:0:90:0:0|h[Black Pepper]|h|r",
		["currencies"] = {["id"] = 402, ["quantity"] = 1},},
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
function CombatTextSetActiveUnit( who ) end
function BuyMerchantItem( index, quantity )
	-- adds quantity of index to myInventory
	-- no return value
	local itemID = INEED.getItemIdFromLink( GetMerchantItemLink( index ) )
	if myInventory[itemID] then
		myInventory[itemID] = myInventory[itemID] + quantity
	else
		myInventory[itemID] = quantity
	end
	INEED.UNIT_INVENTORY_CHANGED()

	-- meh
end
function DoEmote( emote ) end
function GetAccountExpansionLevel()
	-- http://www.wowwiki.com/API_GetAccountExpansionLevel
	-- returns 0 to 4 (5)
	return accountExpansionLevel
end
function GetAddOnMetadata(addon, field)
--	local addonData = { ["version"] = "1.0",
--	}
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
		return( (gold and gold.."G")..
				(silver and ((gold and " " or "")..silver.."S"))..
				(copper and ((silver and " " or "")..copper.."C")) )
	end
end
function GetContainerNumFreeSlots( bagId )
	-- http://www.wowwiki.com/API_GetContainerNumFreeSlots
	-- http://www.wowwiki.com/BagType
	-- returns numberOfFreeSlots, BagType
	-- BagType should be 0
	bagInfo = {
		[0] = {16, 0},
	}
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
function GetItemCount( itemID, includeBank )
	-- print( itemID, myInventory[itemID] )
	return myInventory[itemID] or 0
end
function GetItemInfo( itemID )
	-- returns name, itemLink
	local itemData = {
			["7073"] = { "Broken Fang", "|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0:0|h[Broken Fang]|h|r" },
			["6742"] = { "UnBroken Fang", "|cff9d9d9d|Hitem:6742:0:0:0:0:0:0:0:80:0:0|h[UnBroken Fang]|h|r" },
	}
	if itemData[itemID] then return unpack( itemData[itemID] ) end
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
	--[[
	local merchantItemInfo = { { "Broken Fang", "", 5000, 1 },  -- 50 silver
			{ "UnBroken Fang", "", 10000, 1 },            -- 1 gold
	}
	return unpack( merchantItemInfo[index] )
	]]
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
function GetSendMailItemLink( slot )
	-- todo:  Write this
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
function InterfaceOptionsFrame_OpenToCategory()
end
function IsInGuild()
	-- http://www.wowwiki.com/API_IsInGuild
	-- 1, nil boolean return of being in guild
	return 1
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
function PlaySoundFile( file ) end
function SecondsToTime( seconds )
	-- formats seconds to a readable time
	return ""
end
function SendChatMessage( msg, chatType, language, channel )
	-- http://www.wowwiki.com/API_SendChatMessage
	-- returns nil
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
