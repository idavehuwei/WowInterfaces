--[[

************************************************************************

ARL-Reputation.lua

Reputation data for all of Ackis Recipe List

************************************************************************

File date: 2009-06-23T18:55:32Z 
File revision: 2151 
Project revision: 2271
Project version: r2271

************************************************************************

Format:

	self:addLookupList(RepDB,Rep ID, Rep Name)

************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

]]--

local MODNAME		= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()

function addon:InitReputation(RepDB)

	self:addLookupList(RepDB,59,BFAC["Thorium Brotherhood"],"N/A") -- Acquire Flag: 98
	self:addLookupList(RepDB,270,BFAC["Zandalar Tribe"],"N/A") -- Acquire Flag: 100
	self:addLookupList(RepDB,529,BFAC["Argent Dawn"],"N/A") -- Acquire Flag: 96
	self:addLookupList(RepDB,576,BFAC["Timbermaw Hold"],"N/A") -- Acquire Flag: 99
	self:addLookupList(RepDB,609,BFAC["Cenarion Circle"],"N/A") -- Acquire Flag: 97
	self:addLookupList(RepDB,932,BFAC["The Aldor"],"N/A") -- Acquire Flag: 101
	self:addLookupList(RepDB,933,BFAC["The Consortium"],"N/A") -- Acquire Flag: 105
	self:addLookupList(RepDB,934,BFAC["The Scryers"],"N/A") -- Acquire Flag: 110
	self:addLookupList(RepDB,935,BFAC["The Sha'tar"],"N/A") -- Acquire Flag: 111
	self:addLookupList(RepDB,941,BFAC["The Mag'har"],"N/A") -- Acquire Flag: 108
	self:addLookupList(RepDB,942,BFAC["Cenarion Expedition"],"N/A") -- Acquire Flag: 103
	self:addLookupList(RepDB,946,BFAC["Honor Hold"],"N/A") -- Acquire Flag: 104
	self:addLookupList(RepDB,947,BFAC["Thrallmar"],"N/A") -- Acquire Flag: 104
	self:addLookupList(RepDB,967,BFAC["The Violet Eye"],"N/A") -- Acquire Flag: 114
	self:addLookupList(RepDB,970,BFAC["Sporeggar"],"N/A") -- Acquire Flag: 113
	self:addLookupList(RepDB,978,BFAC["Kurenai"],"N/A") -- Acquire Flag: 108
	self:addLookupList(RepDB,989,BFAC["Keepers of Time"],"N/A") -- Acquire Flag: 106
	self:addLookupList(RepDB,990,BFAC["The Scale of the Sands"],"N/A") -- Acquire Flag: 109
	self:addLookupList(RepDB,1011,BFAC["Lower City"],"N/A") -- Acquire Flag: 107
	self:addLookupList(RepDB,1012,BFAC["Ashtongue Deathsworn"],"N/A") -- Acquire Flag: 102
	self:addLookupList(RepDB,1037,BFAC["Alliance Vanguard"],"N/A") -- Acquire Flag: 131
	self:addLookupList(RepDB,1050,BFAC["Valiance Expedition"],"N/A") -- Acquire Flag: 126
	self:addLookupList(RepDB,1052,BFAC["Horde Expedition"],"N/A") -- Acquire Flag: 130
	self:addLookupList(RepDB,1064,BFAC["The Taunka"],"N/A") -- Acquire Flag: 128
	self:addLookupList(RepDB,1067,BFAC["The Hand of Vengeance"],"N/A") -- Acquire Flag: 127
	self:addLookupList(RepDB,1068,BFAC["Explorers' League"],"N/A") -- Acquire Flag: 125
	self:addLookupList(RepDB,1073,BFAC["The Kalu'ak"],"N/A") -- Acquire Flag: 120
	self:addLookupList(RepDB,1077,BFAC["Shattered Sun Offensive"],"N/A") -- Acquire Flag: 112
	self:addLookupList(RepDB,1085,BFAC["Warsong Offensive"],"N/A") -- Acquire Flag: 129
	self:addLookupList(RepDB,1090,BFAC["Kirin Tor"],"N/A") -- Acquire Flag: 118
	self:addLookupList(RepDB,1091,BFAC["The Wyrmrest Accord"],"N/A") -- Acquire Flag: 122
	self:addLookupList(RepDB,1098,BFAC["Knights of the Ebon Blade"],"N/A") -- Acquire Flag: 117
	self:addLookupList(RepDB,1104,BFAC["Frenzyheart Tribe"],"N/A") -- Acquire Flag: 116
	self:addLookupList(RepDB,1105,BFAC["The Oracles"],"N/A") -- Acquire Flag: 121
	self:addLookupList(RepDB,1106,BFAC["Argent Crusade"],"N/A") -- Acquire Flag: 115
	self:addLookupList(RepDB,1119,BFAC["The Sons of Hodir"],"N/A") -- Acquire Flag: 119

end
