-----------------------------------------
-- *********************************** --
-- ****  UPVOTER ADDON by DRKAZZA **** --
-- *********************************** --
-----------------------------------------

-- -----------
-- Declare the addons and libraries
-- -----------
local Upvoter = LibStub("AceAddon-3.0"):NewAddon("Upvoter", "AceHook-3.0", "AceEvent-3.0", "AceConsole-3.0", "AceComm-3.0")
-- i removed aceserializer - not sure why
local GUI = LibStub("AceGUI-3.0")
local icon = LibStub("LibDBIcon-1.0", true)
-- local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()
-- not sure if babblezone is needed
local L = LibStub("AceLocale-3.0"):GetLocale("Upvoter")

-- -----------
-- Lib Data Broker Stuff
-- -----------

-- -----------
-- Declare defaults
-- -----------

-- -----------
-- Options Menu Stuff
-- -----------

-- -----------
-- Variables for the main code
-- -----------

-- -----------
-- Variables for the GUI
-- -----------

-- -----------
-- Initialization code
-- -----------

function Upvoter:ADDON_LOADED(self,...)
	Upvoter:Print("Addon Loaded ok")
end

function Upvoter:OnInitialize()
-- slash command registry
	self.db = LibStub("AceDB-3.0"):New("UpvoterDB", defaults, true)
	self:RegisterChatCommand("upvoter", "SlashCommand")
-- check what this does?
--	icon:Register("Upvoter", UpvoterFrame.obj,Upvoter.db.profile.minimap)
	self:RegisterComm(self.commPrefix)
end

function Upvoter:ToggleMiniMap(value)
	Upvoter.db.profile.minimap.hide = not value
	if value then
		icon:Show("Upvoter")
	else
		icon:Hide("Upvoter")
	end	
end

function Upvoter:OnEnable()
	-- this is where i need to register events and hooks
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Upvoter", options)
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Upvoter", "Upvoter")	
end


