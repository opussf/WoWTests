-----------------------------------------
-- Author  :  Opussf
-- Date    :  $Date:$
-- Revision:  @VERSION@
-----------------------------------------
-- These are functions from wow that have been needed by addons so far
-- Not a complete list of the functions.
-- Most are only stubbed enough to pass the tests
-- This is not intended to replace WoWBench, but to provide a stub structure for
--     automated unit tests.

actionLog = {
}
-- append actions to the log to track actions that may not have an other sideeffects.
-- record the function calls
-- [1] = "DoEmote(....)""


local itemDB = {
}

-- simulate an internal inventory
-- myInventory = { ["9999"] = 52, }
		-- myInventory = { ["9999"] = {52, 0, 1}, }
		-- myInventory = { ["<itemID"] = {<count>, <bagID>, <slotID>}, }
myInventory = {}
-- bagInfo is the info about the containers themselves
-- bagInfo = {<size>, <type>}
bagInfo = {
	[0] = {16, 0},
}
myCurrencies = {}
myCopper = 0
-- myCopper is the amount of Copper that you own on this toon
-- set one of these to the number of people in the raid or party to reflect being in group or raid.
-- roster should be an array for GetRaidRosterInfo
myParty = { ["group"] = nil, ["raid"] = nil, ["roster"] = {} }
playerRange = {}  -- { ["party1"] = <yards> }
dungeonDifficultyLookup = { [34] = "Timewalking" }
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
-- registeredPrefixes - populated by the RegisterAddonMessagePrefix( prefix )

myStatistics = {
	[60] = 42  -- 60 = deaths
}

registeredPrefixes = {}

SlotListMap={ "HeadSlot","NeckSlot","ShoulderSlot","ShirtSlot","ChestSlot","WaistSlot","LegsSlot",
		"FeetSlot", "WristSlot", "HandsSlot", "Finger0Slot","Finger1Slot","Trinket0Slot","Trinket1Slot",
		"BackSlot","MainHandSlot","SecondaryHandSlot","RangedSlot","TabardSlot", "Bag0Slot", "Bag1Slot",
		"Bag2Slot", "Bag3Slot",
}
myGear = {} -- items that are equipped in the above slots, index matching
Items = {
	["7073"] = {["name"] = "Broken Fang", ["link"] = "|cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0:0|h[Broken Fang]|h|r", ["texture"] = ""},
	["6742"] = {["name"] = "UnBroken Fang", ["link"] = "|cff9d9d9d|Hitem:6742:0:0:0:0:0:0:0:80:0:0|h[UnBroken Fang]|h|r", ["texture"] = ""},
	["22261"] = {["name"] = "Love Fool", ["link"] = "|cff9d9d9d|Hitem:22261:0:0:0:0:0:0:0:80:0:0|h[Love Fool]|h|r", ["texture"] = ""},
	["23784"] = {["name"] = "Adamantite Frame", ["link"] = "|cff9d9d9d|Hitem:23784:0:0:0:0:0:0:0:80:0:0|h[Adanabtute Frame]|h|r", ["texture"] = ""},
	["23786"] = {["name"] = "Khorium Power Core", ["link"] = "|cffffff|Hitem:23786|h[Khorium Power Core]|h|r", ["texture"] = ""},
	["23787"] = {["name"] = "Felsteel Stabilizer", ["link"] = "|cffffff|Hitem:23787|h[Felsteel Stabilizer]|h|r", ["texture"] = ""},
	["34061"] = {["name"] = "Turbo-Charged Flying Machine", ["link"] = "|cff9d9d9d|Hitem:34061:0:0:0:0:0:0:0:80:0:0|h[Turbo-Charged Flying Machine]|h|r", ["texture"] = ""},
	["34249"] = {["name"] = "Hula Girl Doll", ["link"] = "|cffffff|Hitem:34249|h[Hula Girl Doll]|h|r", ["texture"] = ""},
	["45579"] = {["name"] = "Darnassus Tabard", ["link"] = "|cffffffff|Hitem:45579:0:0:0:0:0:0:0:14:258:0:0:0|h[Darnassus Tabard]|h|r", ["texture"] = ""},
	["45580"] = {["name"] = "Exodar Tabard", ["link"] = "|cffffffff|Hitem:45580:0:0:0:0:0:0:0:14:258:0:0:0|h[Exodar Tabard]|h|r", ["texture"] = ""},
	["49916"] = {["name"] = "Lovely Charm Bracelet", ["link"] = "|cff9d9d9d|Hitem:49916:0:0:0:0:0:0:0:80:0:0|h[Lovely Charm Bracelet]|h|r", ["texture"] = ""},
	["49927"] = {["name"] = "Love Token", ["link"] = "|cff9d9d9d|Hitem:49927:0:0:0:0:0:0:0:80:0:0|h[Love Token]|h|r", ["texture"] = ""},
	["74661"] = {["name"] = "Black Pepper", ["link"] = "|cffffffff|Hitem:74661:0:0:0:0:0:0:0:90:0:0|h[Black Pepper]|h|r", ["texture"] = ""},
	["85216"] = {["name"] = "Enigma Seed", ["link"]= "|cffffffff|Hitem:85216:0:0:0:0:0:0:0:90:0:0|h[Enigma Seed]|h|r", ["texture"] = ""},
	["113596"] = {["name"] = "Vilebreath Mask", ["link"] = "|cffffffff|Hitem:113596:0:0:0:0:0:0:0:90:0:0|h[Vilebreath Mask]|h|r", ["slotPrefix"] = "Head", ["texture"] = ""},
--[[
Vilebreath Mask
Item Level 655
Binds when picked up
Head	Cloth
85 Armor
+211 Intellect
+316 Stamina
+120 Mastery (1.09 @ L100)
+153 Multistrike (2.32% @ L100)
Durability 100 / 100
Requires Level 100
Sell Price: 32 81 73
Dropped by: Kargath Bladefist
Drop Chance: 11.48%
]]
    -- ^^ Need another head item for testing.
    ["999999"] = {["name"] = "Finger Thing", ["link"] = "|cffffffff|Hitem:999999:0:0:0:0:0:0:0:90:0:0|h[Finger Thing|h|r", ["slotPrefix"] = "Finger", ["texture"] = ""},
}

-- simulate the data structure that is the flight map
-- Since most the data assumes Alliance, base it on being at Stormwind
TaxiNodes = {
	{["name"] = "Stormwind", ["type"] = "CURRENT", ["hops"] = 0, ["cost"] = 0},
	{["name"] = "Rebel Camp", ["type"] = "REACHABLE", ["hops"] = 1, ["cost"] = 40},
	{["name"] = "Ironforge", ["type"] = "NONE", ["hops"] = 1, ["cost"]=1000},
}
Currencies = {
	["1"] = { ["name"] = "Currency Token Test Token 4", ["texturePath"] = "", ["weeklyMax"] = 0, ["totalMax"] = 0, isDiscovered = false, ["link"] = "|cffffffff|Hcurrency:1|h[Currency Token Test Token 4]|h|r"},
	["384"] = { ["name"] = "Dwarf Archaeology Fragment", ["texturePath"] = "", ["weeklyMax"] = 0, ["totalMax"] = 200, isDiscovered = true, ["link"] = "|cff9d9d9d|Hcurrency:384:0:0:0:0:0:0:0:80:0:0|h[Dwarf Archaeology Fragment]|h|r"},
	["390"] = { ["name"] = "Conquest", ["texturePath"] = "", ["weeklyMax"] = 0, ["totalMax"] = 0, isDiscovered = true, ["link"] = ""},
	["392"] = { ["name"] = "Honor",    ["texturePath"] = "", ["weeklyMax"] = 0, ["totalMax"] = 0, isDiscovered = true, ["link"] = ""},
	["395"] = { ["name"] = "Justice",  ["texturePath"] = "", ["weeklyMax"] = 0, ["totalMax"] = 0, isDiscovered = true, ["link"] = ""},
	["396"] = { ["name"] = "Valor",    ["texturePath"] = "", ["weeklyMax"] = 0, ["totalMax"] = 0, isDiscovered = true, ["link"] = ""},
	["402"] = { ["name"] = "Ironpaw Token", ["texturePath"] = "", ["weeklyMax"] = 0, ["totalMax"] = 0, isDiscovered = true, ["link"] = "|cff9d9d9d|Hcurrency:402:0:0:0:0:0:0:0:80:0:0|h[Ironpaw Token]|h|r"},
	["703"] = { ["name"] = "Fictional Currency", ["texturePath"] = "", ["weeklyMax"] = 1000, ["totalMax"] = 4000, isDiscovered = true, ["link"] = "|cffffffff|Hcurrency:703|h[Fictional Currency]|h|r"},
}
ArchaeologyCurrencies = {"999",}
MerchantInventory = {
	{["id"] = "7073", ["cost"] = 5000, ["quantity"] = 1, ["isUsable"] = 1},
	{["id"] = "6742", ["cost"] = 10000, ["quantity"] = 1, ["isUsable"] = 1},
	{["id"] = "22261", ["cost"] = 0, ["quantity"] = 1, ["isUsable"] = 1,
		["currencies"] = {{["id"] = "49927", ["type"] = "item", ["quantity"] = 10},}},
	{["id"] = "49927", ["cost"] = 0, ["quantity"] = 1, ["isUsable"] = 1,
		["currencies"] = {{["id"] = "49916", ["type"] = "item", ["quantity"] = 1},}},  -- Lovely Charm Bracelet
	{["id"] = "74661", ["cost"] = 0, ["quantity"] = 1, ["isUsable"] = 1,
		["currencies"] = {{["id"] = "402", ["type"] = "currency", ["quantity"] = 1},}},
	{["id"] = "85216", ["cost"] = 2500, ["quantity"] = 1, ["isUsable"] = nil},
}
TradeSkillItems = {
	{["id"] = "44157", ["name"] = "Engineering: Turbo-Charged Flying Machine", ["cost"]= 0, ["numReagents"] = 4,
		["minMade"] = 1, ["maxMade"] = 1,
		["elink"] = "|cffffffff|Henchant:44157|h[Engineering: Turbo-Charged Flying Machine]|h|r",
		["ilink"] = "|cff9d9d9d|Hitem:34061:0:0:0:0:0:0:0:80:0:0|h[Turbo-Charged Flying Machine]|h|r",
		["reagents"] = {{["id"] = "23784", ["count"] = 4}, -- Adamantite Frame
				{["id"] = "23786", ["count"] = 8},  -- Khorium Power Core
				{["id"] = "23787", ["count"] = 8},  -- Felsteel Stabilizer
				{["id"] = "34249", ["count"] = 1},  -- Hula Girl Doll
		},
	},
}
Achievements = {
	["10722"] = {
		["link"] = "|cffffff00|Hachievement:10722:Player-3661-06DAB4ED:0:0:0:-1:524288:0:0:0|h[The Wish Remover]|h|r",
		["criteria"] = {
			{ 	["description"] = "Broken Fang thingy",
				["type"] = 36,
				["completed"] = false,
				["quantity"] = 0,
				["reqQuantity"] = 1,
				["charName"] = "",
				["flags"] = nil,
				["assetID"] = "7073",
				["quantityString"] = "string",
				["criteriaID"] = "id",
			},
			{	["description"] = "string",
				["type"] = 36,
				["completed"] = false,
				["quantity"] = 0,
				["reqQuantity"] = 1,
				["charName"] = "",
				["flags"] = nil,
				["assetID"] = "6742",
				["quantityString"] = "string",
				["criteriaID"] = "id",
			}
		},
		["name"] = "The Wish Remover",
		["points"] =10,
		["completed"] = false,
		["month"] = nil,
		["day"] = nil,
		["year"] = nil,
		["description"] = "Fishing in Dalaran fountain (again)",
		["flags"] = 0x00000000,
		["icon"] = "",
		["rewardText"] = "",
		["isGuildAch"] = false,
		["wasEarnedByMe"] = false,
		["earnedBy"] = ""
	},
	[5738] = {
		["name"] = "Deadmines",
		["points"] = 10,
		["value"] = "6",


	}

	--[[return id, achiveInfo['name'], achiveInfo['points'], achiveInfo['completed'], achiveInfo['month'], achiveInfo['day'], achiveInfo['year'],
		achiveInfo['description'], achiveInfo['flags'], achiveInfo['icon'], achiveInfo['rewardText'], achiveInfo['isGuildAch'],
		achiveInfo['wasEarnedByMe'], achiveInfo['earnedBy']
		]]
}
-- EquipmentSets is an array (1 based numeric key table)
EquipmentSets = {
	{["name"] = "testSet", ["icon"] = "icon", ["items"] = {[1] = "113596"},},
}
-- WowToken
TokenPrice = 123456 -- 12G 34S 45C
--- Factions
globals.FACTION_STANDING_LABEL1 = "Hated"
globals.FACTION_STANDING_LABEL2 = "Hostile"
globals.FACTION_STANDING_LABEL3 = "Unfriendly"
globals.FACTION_STANDING_LABEL4 = "Neutral"
globals.FACTION_STANDING_LABEL5 = "Friendly"
globals.FACTION_STANDING_LABEL6 = "Honored"
globals.FACTION_STANDING_LABEL7 = "Revered"
globals.FACTION_STANDING_LABEL8 = "Exalted"

--			TT.fName, TT.fDescription, TT.fStandingId, TT.fBottomValue, TT.fTopValue, TT.fEarnedValue, TT.fAtWarWith,
--					TT.fCanToggleAtWar, TT.fIsHeader, TT.fIsCollapsed, TT.fIsWatched, TT.isChild, TT.factionID,
--					TT.hasBonusRepGain, TT.canBeLFGBonus = GetFactionInfo(factionIndex);
FactionInfo = {
	{ ["name"] = "Classic", ["description"] = "", ["standingID"] = 4, ["bottomValue"] = 0, ["topValue"] = 3000, ["earnedValue"] = 0,
		["atWarWith"] = false, ["canToggleAtWar"] = true, ["isHeader"] = true, ["isCollapsed"] = false, ["hasRep"] = false,
		["isWatched"] = false, ["isChild"] = false, ["factionID"] = 1118, ["hasBonusRepGain"] = false, ["canBeLFGBonus"] = false,
	},
	{ ["name"] = "Darkmoon Faire", ["description"] = "description and stuff",
		["standingID"] = 5, ["bottomValue"] = 3000, ["topValue"] = 9000, ["earnedValue"] = 7575,
		["atWarWith"] = false, ["canToggleAtWar"] = false, ["isHeader"] = false, ["isCollapsed"] = false, ["hasRep"] = false,
		["isWatched"] = false, ["isChild"] = true, ["factionID"] = 909, ["hasBonusRepGain"] = false, ["canBeLFGBonus"] = false,
	},
	{ ["name"] = "Alliance", ["description"] = "", ["standingID"] = 6, ["bottomValue"] = 9000, ["topValue"] = 21000, ["earnedValue"] = 10390,
		["atWarWith"] = false, ["canToggleAtWar"] = false, ["isHeader"] = true, ["isCollapsed"] = false, ["hasRep"] = false,
		["isWatched"] = false, ["isChild"] = false, ["factionID"] = 469, ["hasBonusRepGain"] = false, ["canBeLFGBonus"] = false,
	},
	{ ["name"] = "Stormwind", ["description"] = "", ["standingID"] = 7, ["bottomValue"] = 21000, ["topValue"] = 42000, ["earnedValue"] = 33397,
		["atWarWith"] = false, ["canToggleAtWar"] = false, ["isHeader"] = false, ["isCollapsed"] = false, ["hasRep"] = false,
		["isWatched"] = true, ["isChild"] = true, ["factionID"] = 72, ["hasBonusRepGain"] = false, ["canBeLFGBonus"] = false,
	},
}
--Auras
-- IIRC (Look this up) Auras are index based, use an index based system
-- ["unit"] = { [1] = { ["Fishing"] = true }}
UnitAuras = {}
--UnitAuras = {["player"] = { { ["name"] = "Fishing" } } }
-- 'support' code for setting / clearing auras
function wowSetAura( unit, auraName )
	if (UnitAuras[unit]) then
		for i, auras in pairs( UnitAuras[unit] ) do
			if( auras.name == auraName ) then
				return
			end
		end
		table.insert( UnitAuras[unit], { { ["name"] = auraName } } )
	else  -- unknown unit
		UnitAuras[unit] = { { ["name"] = auraName } }
	end
end
function wowClearAura( unit, auraName )
	if UnitAuras[unit] then
		for i, aura in pairs( UnitAuras[unit] ) do
			if( aura.name == auraName ) then
				UnitAuras[unit][i] = nil
			end
		end
		if (#UnitAuras[unit] == 0) then
			UnitAuras[unit] = nil
		end
	end
end

-- WOW's function renames
strmatch = string.match
strfind = string.find
strsub = string.sub
strtolower = string.lower
strlen = string.len
time = os.time
date = os.date
max = math.max
min = math.min
abs = math.abs
random = math.random
tinsert = table.insert

bit = {}
function bit.lshift( x, by )
	return x * 2 ^ by
end
function bit.rshift( x, by )
	return math.floor( x / 2 ^ by )
end
function bit.bor( a, b )  -- bitwise or
	local p,c=1,0
	while a+b>0 do
		local ra,rb=a%2,b%2
		if ra+rb>0 then c=c+p end
		a,b,p=(a-ra)/2,(b-rb)/2,p*2
	end
	return c
end
function bit.band( a, b ) -- bitwise and
	local p,c=1,0
	while a>0 and b>0 do
		local ra,rb=a%2,b%2
		if ra+rb>1 then c=c+p end
		a,b,p=(a-ra)/2,(b-rb)/2,p*2
	end
	return c
end
function bit.bnot( n )  -- bitwise not
	local p,c=1,0
	while n>0 do
		local r=n%2
		if r<1 then c=c+p end
		n,p=(n-r)/2,p*2
	end
	return c
end
-- Sound Kit
SOUNDKIT = {
	ALARM_CLOCK_WARNING_1 = 18871,
}

-- WOW's functions
function getglobal( globalStr )
	-- set the globals table to return what is needed from the 'globals'
	return globals[ globalStr ]
end
function hooksecurefunc( externalFunc, internalFunc )
end
function strsplit( delim, subject, pieces )
	-- delim is a string that defines all the bytes that may split the string
	-- subject is the string to work with
	-- pieces (optional) is the maximum number of pieces to return
	splitTable = {}
	--print("strsplit( "..delim..", "..subject..", "..(pieces or "nil").." )")
	pos, count = 1, 1
	pieces = pieces or string.len(subject)
	while true do
		s, e = strfind(subject, delim, pos)
		if (s and count<pieces) then -- found delim in subject
			tinsert( splitTable, strsub( subject, pos, s-1 ) )
			pos = s + 1
			count = count + 1
		else
			tinsert( splitTable, strsub( subject, pos ) )
			break
		end
	end
	return unpack(splitTable)
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
ITEM_SOULBOUND="Soulbound"
ITEM_BIND_ON_PICKUP="Binds when picked up"

-- WOW's frames
Frame = {
		["__isShown"] = true,
		["Events"] = {},
		["Hide"] = function( self ) self.__isShown = false; end,
		["Show"] = function( self ) self.__isShown = true; end,
		["IsVisible"] = function( self ) return( self.__isShown ) end,
		["RegisterEvent"] = function(self, event) self.Events[event] = true; end,
		["SetPoint"] = function() end,
		["UnregisterEvent"] = function(self, event) self.Events[event] = nil; end,
		["GetName"] = function(self) return self.framename end,
		["SetFrameStrata"] = function() end,
		["SetWidth"] = function(self, value) self.width = value; end,
		["SetHeight"] = function(self, value) self.height = value; end,
		["CreateFontString"] = function(self, ...) return(CreateFontString(...)) end,

		["SetMinMaxValues"] = function() end,
		["SetValue"] = function() end,
		["SetStatusBarColor"] = function() end,
		["SetScript"] = function() end,
		["SetAttribute"] = function() end,
}
FrameGameTooltip = {
		["HookScript"] = function( self, callback ) end,
		["GetName"] = function(self) return self.name end,
		["SetOwner"] = function(self, newOwner) end, -- this is only for tooltip frames...
		["ClearLines"] = function(self) end, -- this is only for tooltip frames...
		["SetHyperlink"] = function(self, hyperLink) end, -- this is only for tooltip frames...
		["init"] = function(frameName)
			_G[frameName.."TextLeft2"] = CreateFontString(frameName.."TextLeft2")
			_G[frameName.."TextLeft3"] = CreateFontString(frameName.."TextLeft3")
			_G[frameName.."TextLeft4"] = CreateFontString(frameName.."TextLeft4")
		end,
}
Units = {
	["player"] = {
		["class"] = "Warlock",
		["faction"] = {"Alliance", "Alliance"},
		["name"] = "testPlayer",
		["race"] = "Human",
		["realm"] = "testRealm",
		["realmRelationship"] = 1,  -- same realm
		["sex"] = 3,
		["currentHealth"] = 100000,
		["maxHealth"] = 123456,
	},
	["sameRealmUnit"] = {
		["class"] = "Warrior",
		["faction"] = {"Alliance", "Alliance"},
		["name"] = "sameRealmPlayer",
		["race"] = "Gnome",
		["realm"] = "testPlayer",
		["realmRelationship"] = 1,
		["sex"] = 2,
	},
	["coalescedRealmUnit"] = {
		["class"] = "Monk",
		["faction"] = {"Alliance", "Alliance"},
		["name"] = "coalescedUnit",
		["race"] = "Pandarian",
		["realm"] = "coalescedRealm",
		["realmRelationship"] = 2,
	},
	["connectedRealmUnit"] = {
		["class"] = "Mage",
		["faction"] = {"Alliance", "Alliance"},
		["name"] = "connectedUnit",
		["realm"] = "connectedRealm",
		["realmRelationship"] = 3,
	},

}
function CreateFrame( frameType, frameName, parentFrame, inheritFrame )
--	print("CreateFrame: needing a new frame of type: "..(frameType or "nil"))
	newFrame = {}
	for k,v in pairs( Frame ) do
		newFrame[k] = v
	end
	if frameType and _G["Frame"..frameType] then  -- construct the name of the table to pull from, use _G to reference it.
		for k, f in pairs(_G["Frame"..frameType]) do  -- add the methods in the sub frame to the returned frame
			if k == "init" then  -- check to see if the key is 'init', which is a function to run when creating the Frame
				f(frameName)  -- run the ["init"] function
			else
				newFrame[k] = f  -- add the method to the frame
			end
		end
	end
	frameName = newFrame
	--http://www.wowwiki.com/API_CreateFrame
	return newFrame
end
function CreateFontString( name, ... )
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
function CreateStatusBar( name, ... )
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
CheckButton = {
		["SetChecked"] = function(self,value) self.isChecked=value; end,
}
function CreateCheckButton( name, ... )
	me = {}
	for k,v in pairs(CheckButton) do
		me[k] = v
	end
	me.name = name
	me[name.."Text"] = CreateFontString(name.."Text")
	return me
end
EditBox = {
		["SetText"] = function(self,text) self.text=text; end,
		["SetCursorPosition"] = function(self,pos) self.cursorPosition=pos; end,

}
function CreateEditBox( name, ... )
	me = {}
	for k,v in pairs(EditBox) do
		me[k] = v
	end
	me.name = name
	return me
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
end
function CheckInbox()
	-- http://www.wowwiki.com/API_CheckInbox
	-- Fires the MAIL_INBOX_UPDATE event when data is available
	-- @TODO - Write this
end
function CheckInteractDistance( unit, distIndex )
	-- https://wowwiki.fandom.com/wiki/API_CheckInteractDistance
	-- unit - string: unit lookupstr
	-- distIndex - int: 1= inspect (28 yards), 2= Trade (11.11 yards), 3= Duel (9.9 yards), 4= Follow (28 yards)
	-- returns: bool (1nil)
	-- uses:  playerRange = {}  -- { ["party1"] = <yards> }
	-- leaving blank is the same as being out of range
	rangeIndex = { 28, 11.11, 9.9, 28 }
	distIndex = tonumber( distIndex )
	if( playerRange[unit] and rangeIndex[distIndex] ) then
		if( playerRange[unit] <= rangeIndex[distIndex] ) then
			return true
		end
	end
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
function CombatLogGetCurrentEventInfo()
	-- return much the same info as used to be passed to the LOG_UNFILTERD event
	-- set CombatLogCurrentEventInfo = {} to return specific data.
	-- timestamp,event,hideCaster,srcGUID,srcName,srcFlags,srcFlags2,
	--		targetGUID,targetName,targetFlags,targetFlags2,spellId = CombatLogGetCurrentEventInfo()

	return unpack( CombatLogCurrentEventInfo )

end
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
function DoEmote( emote, target )
	table.insert( actionLog,
			"DoEmote( "..(emote or "nil")..", "..(target or "nil").." )"
	)
	-- not tested as the only side effect is the character doing an emote
end
function EquipItemByName( itemIn, slotIDIn )
	-- http://www.wowwiki.com/API_EquipItemByName
	-- item: string (itemID, itemName, or itemLink)
	-- slot: number (optional: where to place it)
	local itemID = __getItemID( itemIn )
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
function ExpandFactionHeader( index )
	-- http://wowprogramming.com/docs/api/ExpandFactionHeader
	if FactionInfo[index] then
		if FactionInfo[index].isHeader then
			FactionInfo[index].isCollapsed = false
		end
	end
end
function GetAccountExpansionLevel()
	-- http://www.wowwiki.com/API_GetAccountExpansionLevel
	-- returns 0 to 4 (5)
	return accountExpansionLevel
end
function GetAchievementCriteriaInfo( ID, criteriaNum )
	-- criteriaString, criteriaType, completed, quantity, reqQuantity,
	-- charName, flags, assetID, quantityString, criteriaID =
	-- GetAchievementCriteriaInfo(criteriaID or achievementID, criteriaNum);
	if criteriaNum then
		achievementID = ID
		if Achievements[achievementID] then
			achievementInfo = Achievements[achievementID]
			info = achievementInfo["criteria"][criteriaNum]
			return info.description, info.type, info.completed, info.quantity, info.reqQuantity, info.charName,
					info.flags, info.assetID, info.quantityString, info.criteriaID
		end
	end
end
--[[
function GetAchievementCriteriaInfoByID( criteriaID )
	-- criteriaString, criteriaType, completed, quantity, reqQuantity,
	-- charName, flags, assetID, quantityString, criteriaID, eligible =
	-- GetAchievementCriteriaInfoByID(achievementID, criteriaID)
	return "string","36",3,4,5,6,7
end
--]]
function GetAchievementInfo( id, index )
	-- http://wowprogramming.com/docs/api/GetAchievementInfo
	-- Arguments:
	-- id: achievement category ID or achievement ID
	-- index: index of achievement in given category ID
	-- Returns:
	-- id: The numeric ID of the achievement or statistic (number)
	-- name: Name of the achievement or statistic (string)
    -- points: Amount of achievement points awarded for completing the achievement (number)
	-- completed: True if any toon on the account has completed the achievement; otherwise false (boolean)
	-- month: Month in which the player completed the achievement (number)
	-- day: Day of the month on which the player completed the achievement (number)
	-- year: Year in which the player completed the achievement. (Two digit year, assumed to be 21st century.) (number)
	-- description: Description of the achievement (string)
	-- flags: Test against the following masks with bit.band() to reveal additional information: (bitfield)
	--		0x00000001 - Info is for a statistic, not an achievement
	--		0x00000002 - Achievement should be hidden in normal displays
	--		0x00000080 - Achievement should display its criteria as a progress bar regardless of per-criterion flags
	-- icon: Path to an icon texture for the achievement (string)
	-- rewardText: Text describing a reward for the achievement, or the empty string if no reward is offered (string)
	-- isGuildAch: True if the achievement is a Guild achievement; otherwise false (boolean)
	-- wasEarnedByMe: True if the achievement was earned by the player; otherwise false (boolean)
	-- earnedBy: Who earned the achivement, if not the player; otherwise nil (string)
	if index then
		category = id
		-- Find the id to actually work with
	end
	achiveInfo = Achievements[id]

	return id, achiveInfo['name'], achiveInfo['points'], achiveInfo['completed'], achiveInfo['month'], achiveInfo['day'], achiveInfo['year'],
		achiveInfo['description'], achiveInfo['flags'], achiveInfo['icon'], achiveInfo['rewardText'], achiveInfo['isGuildAch'],
		achiveInfo['wasEarnedByMe'], achiveInfo['earnedBy']
end
function GetAchievementNumCriteria( achievementID )
	-- numCriteria = GetAchievementNumCriteria(AchievementID)
	if Achievements[achievementID] then
		return #Achievements[achievementID]["criteria"]
	end
end
function GetStatistic( statID )
	-- https://wow.gamepedia.com/API_GetStatistic

	return Achievements[statID].value
end
function GetComparisonStatistic( achievementID )
	-- https://wowwiki.fandom.com/wiki/API_GetComparisonStatistic
	-- achievementID: integer - ID of the achievement
	-- returns: string - the value of the requested statistic
	return Achievements[achievementID].value
end
function GetAddOnMetadata( addon, field )
	-- returns addonData[field] for 'addon'
	-- local addonData = { ["version"] = "1.0", }
	return addonData[field]
end
function GetCategoryList()
	-- http://www.wowwiki.com/API_GetCategoryList
	-- Returns a table of achievement categories
	return {"10","47454"}
end
function GetCategoryNumAchievements( catID )
	-- http://wowprogramming.com/docs/api/GetCategoryNumAchievements
	-- http://wow.gamepedia.com/API_GetCategoryNumAchievements    <---  MUCH BETTER
	-- Arguments:
	-- catID: Category to return the number of displayable achievements
	-- includeAll: (optional) boolean include all achievements, or just visible (if false)
	-- Returns:
	-- numItems: Number of achievements or stats to display
	-- numCompleted: Number of completed achievements (or 0 for stats)
	-- numIncomplete: Number of incomplete achievements
	return 5,0,5
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
function GetContainerItemLink( bagId, slotId )
end
function GetContainerNumFreeSlots( bagId )
	-- http://www.wowwiki.com/API_GetContainerNumFreeSlots
	-- http://www.wowwiki.com/BagType
	-- returns numberOfFreeSlots, BagType
	-- BagType should be 0
	-- TODO: For API, what should it return if no bag is equipped?  (it should not be nil it seems)
	-- ^^ Note, the backpack(0) is ALWAYS equipped.
	if bagInfo[bagId] then
		return unpack(bagInfo[bagId])
	else
		return 0, 0
	end
end
function GetContainerNumSlots( bagId )
	-- http://wowwiki.wikia.com/wiki/API_GetContainerNumSlots
	-- returns the number of slots in the bag, or 0 if no bag
	if bagInfo[bagId] then
		return bagInfo[bagId][1]
	else
		return 0
	end
end
function GetBagSlotFlag( bagId, filterFlagCheck )
	-- returns true if the filterFlagCheck matches the bag's filterFlag
	return true
end
function GetCurrencyInfo( id ) -- id is integer, currencyLink, currencyString
	-- integer, link, "currency:###"
	-- http://wowprogramming.com/docs/api/GetCurrencyInfo
	-- returns name, amount, texturePath, earnedThisWeek, weeklyMax, totalMax, isDiscovered
	id = tostring(id)
	if Currencies[id] then
		local c = Currencies[id]
		return c["name"], (myCurrencies[id] or 0), "", 0, c["weeklyMax"], c["totalMax"], true
	end
end
function GetCurrencyLink( id )
	id = tostring(id)
	if Currencies[id] then
		return Currencies[id].link
	end
end
function GetCurrencyListSize()
	-- @TODO
	return #Currencies
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
function GetFactionInfo( index )
	-- http://wowprogramming.com/docs/api/GetFactionInfo
	local f = FactionInfo[ index ]
	return f.name, f.description, f.standingID, f.bottomValue, f.topValue, f.earnedValue, f.atWarWith, f.canToggleAtWar,
			f.isHeader, f.isCollapsed, f.hasRep, f.isWatched, f.isChild, f.factionID, f.hasBonusRepGain, f.canBeLFGBonus
end
function GetGuildInfo( unitID )
	-- http://wowprogramming.com/docs/api/GetGuildInfo
	-- Returns: guildName, guildRankName, guildRankIndex
	if myGuild and myGuild.name then
		return myGuild.name, "Rank Name", 2
	end
end
function GetHaste()
	return 15.42345
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
function GetItemInfo( itemIn )
	-- itemID is number, link or 'item:#####'
	-- returns name, itemLink
	local itemID = __getItemID( itemIn )
	if Items[itemID] then
		return Items[itemID].name, Items[itemID].link
	end
end
function GetMastery()
	return 21.3572
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
			if MerchantInventory[ index ].currencies[ currencyIndex ] then -- currencyIndex exists
				local currencyLink = ""
				if MerchantInventory[ index ].currencies[ currencyIndex ].type == "item" then
					currencyLink = Items[ MerchantInventory[ index ].currencies[ currencyIndex ].id ].link
				elseif MerchantInventory[ index ].currencies[ currencyIndex ].type == "currency" then
					currencyLink = Currencies[ MerchantInventory[ index ].currencies[ currencyIndex ].id ].link
				end
				return "", MerchantInventory[ index ].currencies[ currencyIndex ].quantity, currencyLink
			end
		end
	end
	return nil, nil, nil  -- probably don't need to do this.
end
function GetMerchantItemLink( index )
	-- returns a link for item at index
	if MerchantInventory[ index ] and Items[ MerchantInventory[ index ].id ] then
		return Items[ MerchantInventory[ index ].id ].link
	else
		return nil
	end
end
function GetMerchantItemInfo( index )
	--local itemName, texture, price, quantity, numAvailable, isUsable = GetMerchantItemInfo( i )
	if MerchantInventory[ index ] then
		local item = Items[ MerchantInventory[ index ].id ]
		return item.name, item.texture, MerchantInventory[ index ].cost, MerchantInventory[ index ].quantity, -1, MerchantInventory[ index ].isUsable
--		local item = MerchantInventory[ index ]
--		return item.name, "", item.cost, item.quantity, -1, item.isUsable
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
function GetMoney()
	return myCopper
end
function GetNumArchaeologyRaces()
	return 1
--[[
/run print("Total artifacts"); for x=1,12 do local c=GetNumArtifactsByRace(x); local a =0;
for y=1,c do local t = select(9, GetArtifactInfoByRace(x, y)); a=a+t;end
local rn = GetArchaeologyRaceInfo(x); if( c > 1 ) then print(rn .. ": " .. a); end end


numRaces = GetNumArchaeologyRaces()

Returns:

    numRaces - The number of Archaeology races in the game (number)
]]
end
function GetArchaeologyRaceInfo( index )
--[[

raceName, raceTexture, raceItemID, numFragmentsCollected, numFragmentsRequired, maxFragments = GetArchaeologyRaceInfo(raceIndex)

Arguments:

    raceIndex - nil (number, GetNumArchaeologyRaces())

Returns:

    raceName - Name of the race (string)
    raceTexture - Path to the texture (icon) used by this race in the Archaeology UI (string)
    raceItemID - The itemID for the Keystone this race uses (number)
    numFragmentsCollected - Number of collected fragments for this race (number)
    numFragmentsRequired - Number of fragments required to solve the current artifact (number)
    maxFragments - Maximum number of fragments that can be carried (number)
]]
	return "Dwarf", "", 384, 0, 100, 200
end
function GetProfessions()
	-- prof1, prof2, archaeology, fishing, cooking, firstAid = GetProfessions();
	return 5, 6, 7, 8, 9
end
ProfessionInfo = {
	[5] = { "prof1", "icon", 75, 300, 3, 3, 3, 3, 3, 3, "Catacylism prof1" },
	[6] = { "prof2", "icon", 75, 300, 3, 3, 3, 3, 3, 3, "Catacylism prof2" },
	[7] = { "Archaeology", "icon", 75, 300, 3, 3, 3, 3, 3, 3, "Catacylism Arch" },
	[8] = { "Fishing", "icon", 75, 300, 3, 3, 3, 3, 3, 3, "Catacylism Fishing" },
	[9] = { "Cooking", "icon", 75, 300, 3, 3, 3, 3, 3, 3, "Catacylism Cooking" },
}
function GetProfessionInfo( index )
	--[[
	name, icon, skillLevel, maxSkillLevel, numAbilities, spelloffset,
    skillLine, skillModifier, specializationIndex,
    specializationOffset = GetProfessionInfo(index)
	]]
	return unpack( ProfessionInfo[index] )
end
function GetNumEquipmentSets()
	-- http://www.wowwiki.com/API_GetNumEquipmentSets
	-- Returns 0,MAX_NUM_EQUIPMENT_SETS
	return #EquipmentSets
end
function GetNumFactions()
	-- returns number of factions
	-- I believe that this should return the correct number that are SHOWN.
	-- It should then process the info the describes if it is collapsed or not.
	local count = 0
	for _ in pairs(FactionInfo) do count = count + 1 end
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
-- GetNumTradeSkills is deprecated
--function GetNumTradeSkills( )
--	-- returns number of lines in the tradeskill window to show
--	local count = 0
--	for _ in pairs( TradeSkillItems ) do count = count + 1 end
--	return count
--end
function GetPlayerInfoByGUID( playerGUID )
	-- http://wowprogramming.com/docs/api/GetPlayerInfoByGUID
	-- localClass, englishClass, localRace, englishRace, gender, name, realm = GetPlayerInfoByGUID( playerGUID )
	return "Warlock", "Warlock", "Human", "Human", 3, "testPlayer", "testRealm"
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
function GetStatistic( index )
	return myStatistics[index]
end
function GetTradeSkillItemLink( index )
	if TradeSkillItems[index] then
		return TradeSkillItems[index].ilink
	end
end
function GetTradeSkillReagentInfo( skillIndex, reagentIndex )
	-- reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(tradeSkillRecipeId, reagentId)
	if TradeSkillItems[skillIndex] and TradeSkillItems[skillIndex].reagents[reagentIndex] then
		local item = Items[ TradeSkillItems[ skillIndex ].reagents[ reagentIndex ].id ]
		if item then
			return item.name, -- reagentName
					item.texture,  --reagentTexture
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
			return Items[ TradeSkillItems[skillIndex].reagents[reagentIndex].id ].link
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
function GetUnitName( lookupStr )
	lookupStr = string.lower( lookupStr )
	-- return the player's UnitName if asking for "player"
	if lookupStr == "player" then
		return UnitName( lookupStr )
	end
	_, _, partyType, partyIndex = string.find( lookupStr, "(%S+)(%d+)" )
	partyIndex = tonumber( partyIndex )
	-- only return the indexed playername if the party type matches, and the index exists
	if( myParty[partyType] and myParty.roster[partyIndex] ) then
		return myParty.roster[partyIndex]
	end
end
--[[
function HasNewMail()
	return true
end
]]
function GetXPExhaustion()
	-- TODO:
	return 3618
end
function InterfaceOptionsFrame_OpenToCategory()
end
function IsInGroup( groupType )
	-- http://wowprogramming.com/docs/api/IsInGroup
	-- LE_PARTY_CATEGORY_INSTANCE = 2  -- from /dump in client
	groupType = groupType or 1
	local groupTypes = { [1] = "party", [2] = "instance" }
	key = groupTypes[groupType]

	--print( "IsInGroup( "..(groupType or "NIL" ).." ) -->"..(key or "NIL") )
	return( myParty[key] and 1 or nil )
end
function IsInGuild()
	-- http://www.wowwiki.com/API_IsInGuild
	-- 1, nil boolean return of being in guild
	return (myGuild and myGuild.name) and 1 or nil
end
function IsInInstance()
	-- https://wowwiki.fandom.com/wiki/API_IsInInstance
	-- returns bool, string( arena | none | party | pvp | raid 		)
	-- set myParty.string = true.  Only one should be set.
	for partyType, _ in pairs( myParty ) do
		if partyType ~= "roster" then -- "roster" is special.  Should probably move this someplace else....
			return true, partyType
		end
	end
	-- returns nil if not in instance
end
function IsInRaid()
	-- http://www.wowwiki.com/API_IsInRaid
	-- 1, nill boolean return of being in raid
	-- myParty = { ["group"] = nil, ["raid"] = nil } -- set one of these to true to reflect being in group or raid.
	return ( myParty["raid"] and 1 or nil )
end
function GetInstanceInfo()
	-- https://wowwiki.fandom.com/wiki/API_GetInstanceInfo
	-- name, type, difficultyIndex, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceMapId, lfgID = GetInstanceInfo()
	-- name is localized!
	-- instanceMapId -- should probably be used for lookup.
	-- @TODO refine these....
	return "Deadmines", 1, 34, "", 5, 1, 0, 36, 0
end
function GetDifficultyInfo( diffInt )
	return dungeonDifficultyLookup[diffInt]
end
function IsResting()
	return true
end
function LoadAddOn()
end
function NumTaxiNodes()
	-- http://www.wowwiki.com/API_NumTaxiNodes
	local count = 0
	for _ in pairs(TaxiNodes) do
		count = count + 1
	end
	return count
end
function __getItemID( itemIn )
	local itemID
	if tonumber(itemIn) then -- got the itemID
		itemID = itemIn
	elseif strmatch( itemIn, "item:(%d*)" ) then -- got an ItemString or ItemLink
		itemID = string.format("%s", strmatch( itemIn, "item:(%d*)" ) )
	else -- Anything else, treat it as an ItemName.
		for ID, data in pairs(Items) do
			if itemIn == data.name then
				itemID = ID
				break -- break the loop once the item is found.
			end
		end
	end
	return itemID
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
	itemID = __getItemID( itemIn )
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
function PlaySound( sound, channel )
	-- http://wowwiki.wikia.com/wiki/API_PlaySound
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
function RegisterAddonMessagePrefix( prefix )
	-- http://wowprogramming.com/docs/api/RegisterAddonMessagePrefix
	-- returns success (512 limit)
	-- prefix can be up to 16 characters
	-- Cannot be empty.
	-- What does this do?  In a bigger system, it could allow random messages to be generated
end
function RequestTimePlayed()
end
function Screenshot( )
end
function SecondsToTime( secondsIn, noSeconds, notAbbreviated, maxCount )
	-- http://www.wowwiki.com/API_SecondsToTime
	-- formats seconds to a readable time  -- WoW omits seconds if 0 even if noSeconds is false
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
	if noSeconds or seconds == 0 then  -- remove the seconds format if no seconds
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
function SendAddonMessage( prefix, text, type, target )
	-- http://wowwiki.wikia.com/wiki/API_SendAddonMessage
	-- Fires CHAT_MSG_ADDON event
		-- Sends these args with the event:
		-- Arg1: prefix
		-- Arg2: message
		-- Arg3: distribution
		-- Arg4: sender
		-- Need to register the addon prefix with RegisterAddonMessagePrefix
	-- type is in "PARTY", "RAID", "GUILD", "OFFICER", "BATTLEGROUND", "WHISPER"
	-- length of prefix and text cannot exceed 254 characters.
	-- \t cannot be used in the prefix
	-- all characters 1-255 can be used (no NULL)
end
function SendChatMessage( msg, chatType, language, channel )
	-- http://www.wowwiki.com/API_SendChatMessage
	-- This could simulate sending text to the channel, in the language, and raise the correct event.
	-- returns nil
	-- @TODO: Expand this
	print( string.format( "%s: %s", chatType, msg ) )
end
function SetAchievementComparisonUnit( lookupStr )
	-- mostly does nothing...  Just allows INSPECT_ACHIEVEMENT_READY to happen,
	-- and data to be gathered with:
	-- GetComparisonStatistic( statisticID ) and GetAchievementInfo( statisticID )
end
function ClearAchievementComparisonUnit()
	-- mostly does nothing...
end
function BNSendWhisper( id, msg )
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
function UnitAffectingCombat( unit )
	return false
end
function UnitAura( unit, index, filter )
	-- @TODO: Look this up to get a better idea of what this function does.
	-- Returns the aura name
	-- unit, [index] [,filter]
	-- Returns True or nil
	if( UnitAuras[unit] and UnitAuras[unit][index] ) then
		return UnitAuras[unit][index].name
	end
end
function UnitClass( who )
	return Units[who].class
end
function UnitHealthMax( who )
	-- http://wowwiki.wikia.com/wiki/API_UnitHealth
	return Units[who].maxHealth
end
function UnitFactionGroup( who )
	-- http://www.wowwiki.com/API_UnitFactionGroup
	return unpack( Units[who].faction )
end
function UnitIsDeadOrGhost( who )

end
function UnitLevel( who )
	local unitLevels = {
		["player"] = 60,
	}
	return unitLevels[who]
end
function UnitName( who )
	return Units[who].name
end
function UnitPowerMax( who, powerType )
	-- http://wowwiki.wikia.com/wiki/API_UnitPowerMax
	-- VERY simplified version of this function for now.
	return 12345
end
function UnitRace( who )
	return Units[who].race
end
function UnitRealmRelationship( who )
	-- https://wow.gamepedia.com/API_UnitRealmRelationship
	-- returns
	-- 1 = same realm
	-- 2 = coalesced and unconnected realms
	-- 3 = connected realms
	return Units[who].realmRelationship
end
function UnitSex( who )
	-- 1 = unknown, 2 = Male, 3 = Female
	return Units[who].sex
end
function UnitXP( who )
	return 100
end
function UnitXPMax( who )
	return 1000
end
---------  C_WowTokenPublic
C_WowTokenPublic = {}
function C_WowTokenPublic.GetCommerceSystemStatus()
	-- returns
	-- [1] boolean - unsure
	-- [2] seconds - minseconds between scans
	-- [3] 0?
	return true, 300, 0
end
function C_WowTokenPublic.GetCurrentMarketPrice()
	-- returns the value, and a 2nd number (unknown)
	return TokenPrice, 5
end
function C_WowTokenPublic.UpdateMarketPrice()
	-- this has the system query the market price, and fire the TOKEN_MARKET_PRICE_UPDATED event
	-- has no other side effects
end
----------
C_TradeSkillUI = {}
function C_TradeSkillUI.GetAllRecipeIDs()
	-- returns an array of RecipeIDs
end
function C_TradeSkillUI.GetAllRecipeLink(recipeID)
end
function C_TradeSkillUI.GetRecipeInfo(recipeID)
	--disabled : boolean
	--type : string
	--hiddenUnlessLearned : boolean
	--icon : number
	--craftable : boolean
	--numSkillUps : number
	--recipeID : number
	--sourceType : number
	--numIndents : number
	--difficulty : string
	--name : string
	--numAvailable : string
	--learned : boolean
	--favorite : boolean
	--categoryID : number
end
function C_TradeSkillUI.GetRecipeTools( recipeID )
	--ordered
	--name : string
	--has : boolean
end
----------
C_EquipmentSet = {}
function C_EquipmentSet.GetNumEquipmentSets()
	-- http://www.wowwiki.com/API_GetNumEquipmentSets
	-- Returns 0,MAX_NUM_EQUIPMENT_SETS
	return #EquipmentSets
end
function C_EquipmentSet.GetEquipmentSetInfo( index )
	-- http://www.wowwiki.com/API_GetEquipmentSetInfo
	-- Returns: name, icon, lessIndex = GetEquipmentSetInfo(index)
	-- Returns: nill if no equipmentSet at that index
	-- lessIndex is index-1 ( not used )
	if EquipmentSets[index] then
		return EquipmentSets[index].name, EquipmentSets[index].icon, index-1
	end
end
function C_EquipmentSet.GetItemIDs( index )
	-- http://wowprogramming.com/docs/api/GetEquipmentSetItemIDs
	-- Returns a table of item IDs keyed by slotID of items in the equipmentSet
	if EquipmentSets[index] then
		return EquipmentSets[index].items
	end
end
function C_EquipmentSet.GetIgnoredSlots( setNum )
	-- Returns an array of true or false for each item slot (1-19)
	-- True is ignored, false is not
	return {}
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

--http://wow.gamepedia.com/Patch_7.0.3/API_changes

--/script for k,v in pairs(C_TradeSkillUI.GetAllRecipeIDs()) do print(k..":"..v) end
--/script for k,v in pairs(C_TradeSkillUI.GetAllRecipeIDs()) do print(k..":"..v) end

----------

function IsQuestFlaggedCompleted( questID )
	return nil
end
