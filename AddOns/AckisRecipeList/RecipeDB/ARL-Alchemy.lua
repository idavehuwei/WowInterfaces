--[[

************************************************************************

ARL-Alchemy.lua

Alchemy data for all of Ackis Recipe List

************************************************************************

File date: 2009-08-04T04:45:37Z 
File revision: 2271 
Project revision: 2271
Project version: r2271

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

local initialized	= false

function addon:InitAlchemy(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Elixir of Lion's Strength -- 2329
	self:addTradeSkill(RecipeDB,2329,1,2454,1,51304,nil,0,1,55,75,95)
	self:addTradeFlags(RecipeDB,2329,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,51,52)
	self:addTradeAcquire(RecipeDB,2329,8,8)

	-- Minor Healing Potion -- 2330
	self:addTradeSkill(RecipeDB,2330,1,118,1,51304,nil,0,1,55,75,95)
	self:addTradeFlags(RecipeDB,2330,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2330,8,8)

	-- Minor Mana Potion -- 2331
	self:addTradeSkill(RecipeDB,2331,25,2455,1,51304,nil,0,25,65,85,105)
	self:addTradeFlags(RecipeDB,2331,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2331,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,
	1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052,1,27029,1,3964,1,33608)

	-- Minor Rejuvenation Potion -- 2332
	self:addTradeSkill(RecipeDB,2332,40,2456,1,51304,nil,0,40,70,90,110)
	self:addTradeFlags(RecipeDB,2332,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2332,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,
	1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052,1,27029,1,3964,1,33608)

	-- Elixir of Lesser Agility -- 2333
	self:addTradeSkill(RecipeDB,2333,140,3390,2,51304,nil,0,140,165,185,205)
	self:addTradeFlags(RecipeDB,2333,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,51,52)
	self:addTradeAcquire(RecipeDB,2333,7,2)

	-- Elixir of Minor Fortitude -- 2334
	self:addTradeSkill(RecipeDB,2334,50,2458,1,51304,nil,0,50,80,100,120)
	self:addTradeFlags(RecipeDB,2334,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2334,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,
	1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052,1,27029,1,3964,1,33608)

	-- Swiftness Potion -- 2335
	self:addTradeSkill(RecipeDB,2335,60,2459,2,51304,nil,0,60,90,110,130)
	self:addTradeFlags(RecipeDB,2335,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2335,7,2)

	-- Lesser Healing Potion -- 2337
	self:addTradeSkill(RecipeDB,2337,55,858,1,51304,nil,0,55,85,105,125)
	self:addTradeFlags(RecipeDB,2337,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2337,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,
	1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052,1,27029,1,3964,1,33608)

	-- Weak Troll's Blood Elixir -- 3170
	self:addTradeSkill(RecipeDB,3170,15,3382,1,51304,nil,0,15,60,80,100)
	self:addTradeFlags(RecipeDB,3170,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3170,1,1215,1,1246,1,1386,1,1470,1,2132,1,2391,1,2837,1,3009,1,3184,1,3347,1,3603,1,4160,1,4609,1,4611,1,5177,1,5499,1,5500,1,7948,
	1,11041,1,11042,1,11044,1,11046,1,11047,1,16161,1,16588,1,16642,1,16643,1,16723,1,16741,1,17215,1,18802,1,19052,1,27029,1,3964,1,33608)

	-- Elixir of Wisdom -- 3171
	self:addTradeSkill(RecipeDB,3171,90,3383,1,51304,nil,0,90,120,140,160)
	self:addTradeFlags(RecipeDB,3171,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3171,1,1386,1,2391,1,2837,1,3009,1,3347,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,1,19052,
	1,27029,1,3603,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Minor Magic Resistance Potion -- 3172
	self:addTradeSkill(RecipeDB,3172,110,3384,1,51304,nil,0,110,135,155,175)
	self:addTradeFlags(RecipeDB,3172,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3172,7,1)

	-- Lesser Mana Potion -- 3173
	self:addTradeSkill(RecipeDB,3173,120,3385,1,51304,nil,0,120,145,165,185)
	self:addTradeFlags(RecipeDB,3173,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3173,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,
	1,19052,1,27029,1,3603,1,1470,1,2132,1,3184,1,33608)

	-- Potion of Curing -- 3174
	self:addTradeSkill(RecipeDB,3174,120,3386,1,51304,nil,0,120,145,165,185)
	self:addTradeFlags(RecipeDB,3174,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3174,7,1)

	-- Limited Invulnerability Potion -- 3175
	self:addTradeSkill(RecipeDB,3175,250,3387,2,51304,nil,0,250,275,295,315)
	self:addTradeFlags(RecipeDB,3175,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3175,7,2)

	-- Strong Troll's Blood Elixir -- 3176
	self:addTradeSkill(RecipeDB,3176,125,3388,1,51304,nil,0,125,150,170,190)
	self:addTradeFlags(RecipeDB,3176,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3176,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,
	1,19052,1,27029,1,3603,1,1470,1,2132,1,3184,1,33608)

	-- Elixir of Defense -- 3177
	self:addTradeSkill(RecipeDB,3177,130,3389,1,51304,nil,0,130,155,175,195)
	self:addTradeFlags(RecipeDB,3177,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3177,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,
	1,19052,1,27029,1,3603,1,1470,1,2132,1,3184,1,33608)

	-- Elixir of Ogre's Strength -- 3188
	self:addTradeSkill(RecipeDB,3188,150,3391,1,51304,nil,0,150,175,195,215)
	self:addTradeFlags(RecipeDB,3188,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3188,7,1,1,3391)

	-- Elixir of Minor Agility -- 3230
	self:addTradeSkill(RecipeDB,3230,50,2457,2,51304,nil,0,50,80,100,120)
	self:addTradeFlags(RecipeDB,3230,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3230,7,2)

	-- Healing Potion -- 3447
	self:addTradeSkill(RecipeDB,3447,110,929,1,51304,nil,0,110,135,155,175)
	self:addTradeFlags(RecipeDB,3447,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3447,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,
	1,19052,1,27029,1,3603,1,1470,1,2132,1,3184,1,33608)

	-- Lesser Invisibility Potion -- 3448
	self:addTradeSkill(RecipeDB,3448,165,3823,1,51304,nil,0,165,185,205,225)
	self:addTradeFlags(RecipeDB,3448,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3448,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Elixir of Fortitude -- 3450
	self:addTradeSkill(RecipeDB,3450,175,3825,1,51304,nil,0,175,195,215,235)
	self:addTradeFlags(RecipeDB,3450,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3450,7,1,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Mighty Troll's Blood Elixir -- 3451
	self:addTradeSkill(RecipeDB,3451,180,3826,1,51304,nil,0,180,200,220,240)
	self:addTradeFlags(RecipeDB,3451,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3451,7,1)

	-- Mana Potion -- 3452
	self:addTradeSkill(RecipeDB,3452,160,3827,1,51304,nil,0,160,180,200,220)
	self:addTradeFlags(RecipeDB,3452,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3452,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Elixir of Detect Lesser Invisibility -- 3453
	self:addTradeSkill(RecipeDB,3453,195,3828,2,51304,nil,0,195,215,235,255)
	self:addTradeFlags(RecipeDB,3453,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3453,7,2)

	-- Frost Oil -- 3454
	self:addTradeSkill(RecipeDB,3454,200,3829,2,51304,nil,0,200,220,240,260)
	self:addTradeFlags(RecipeDB,3454,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3454,2,2480)

	-- Discolored Healing Potion -- 4508
	self:addTradeSkill(RecipeDB,4508,50,4596,2,51304,nil,0,50,80,100,120)
	self:addTradeFlags(RecipeDB,4508,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,4508,4,429)

	-- Lesser Stoneshield Potion -- 4942
	self:addTradeSkill(RecipeDB,4942,215,4623,1,51304,nil,0,215,230,250,270)
	self:addTradeFlags(RecipeDB,4942,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,4942,4,715)

	-- Rage Potion -- 6617
	self:addTradeSkill(RecipeDB,6617,60,5631,1,51304,nil,0,60,90,110,130)
	self:addTradeFlags(RecipeDB,6617,1,2,4,30,36,40)
	self:addTradeAcquire(RecipeDB,6617,2,1669,2,1685,2,3335,2,3499)

	-- Great Rage Potion -- 6618
	self:addTradeSkill(RecipeDB,6618,175,5633,1,51304,nil,0,175,195,215,235)
	self:addTradeFlags(RecipeDB,6618,1,2,4,30,36,40)
	self:addTradeAcquire(RecipeDB,6618,2,3335,2,4226)

	-- Elixir of Water Breathing -- 7179
	self:addTradeSkill(RecipeDB,7179,90,5996,1,51304,nil,0,90,120,140,160)
	self:addTradeFlags(RecipeDB,7179,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7179,1,1386,1,2391,1,2837,1,3009,1,3347,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,
	1,19052,1,27029,1,3603,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Greater Healing Potion -- 7181
	self:addTradeSkill(RecipeDB,7181,155,1710,1,51304,nil,0,155,175,195,215)
	self:addTradeFlags(RecipeDB,7181,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7181,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Elixir of Minor Defense -- 7183
	self:addTradeSkill(RecipeDB,7183,1,5997,1,51304,nil,0,1,55,75,95)
	self:addTradeFlags(RecipeDB,7183,1,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7183,8,8)

	-- Holy Protection Potion -- 7255
	self:addTradeSkill(RecipeDB,7255,100,6051,1,51304,nil,0,100,130,150,170)
	self:addTradeFlags(RecipeDB,7255,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7255,2,1685,2,3134,2,3490)

	-- Shadow Protection Potion -- 7256
	self:addTradeSkill(RecipeDB,7256,135,6048,1,51304,nil,0,135,160,180,200)
	self:addTradeFlags(RecipeDB,7256,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7256,2,2393,2,3956)

	-- Fire Protection Potion -- 7257
	self:addTradeSkill(RecipeDB,7257,165,6049,1,51304,nil,0,165,210,230,250)
	self:addTradeFlags(RecipeDB,7257,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7257,2,4083,2,2380)

	-- Frost Protection Potion -- 7258
	self:addTradeSkill(RecipeDB,7258,190,6050,1,51304,nil,0,190,205,225,245)
	self:addTradeFlags(RecipeDB,7258,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7258,2,2812,2,2848)

	-- Nature Protection Potion -- 7259
	self:addTradeSkill(RecipeDB,7259,190,6052,1,51304,nil,0,190,210,230,250)
	self:addTradeFlags(RecipeDB,7259,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7259,2,2848,2,8157,2,8158)

	-- Blackmouth Oil -- 7836
	self:addTradeSkill(RecipeDB,7836,80,6370,1,51304,nil,0,80,80,90,100)
	self:addTradeFlags(RecipeDB,7836,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7836,1,1386,1,2391,1,2837,1,3009,1,3347,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,
	1,19052,1,27029,1,3603,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Fire Oil -- 7837
	self:addTradeSkill(RecipeDB,7837,130,6371,1,51304,nil,0,130,150,160,170)
	self:addTradeFlags(RecipeDB,7837,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7837,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,
	1,19052,1,27029,1,3603,1,1470,1,2132,1,3184,1,33608)

	-- Swim Speed Potion -- 7841
	self:addTradeSkill(RecipeDB,7841,100,6372,1,51304,nil,0,100,130,150,170)
	self:addTradeFlags(RecipeDB,7841,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7841,1,1386,1,2391,1,2837,1,3009,1,3347,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,
	1,19052,1,27029,1,3603,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Elixir of Firepower -- 7845
	self:addTradeSkill(RecipeDB,7845,140,6373,1,51304,nil,0,140,165,185,205)
	self:addTradeFlags(RecipeDB,7845,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7845,1,1386,1,2391,1,2837,1,3009,1,3347,1,3964,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,1,16642,1,16723,1,18802,
	1,19052,1,27029,1,3603,1,1470,1,2132,1,3184,1,33608)

	-- Elixir of Giant Growth -- 8240
	self:addTradeSkill(RecipeDB,8240,90,6662,2,51304,nil,0,90,120,140,160)
	self:addTradeFlags(RecipeDB,8240,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,8240,7,2)

	-- Greater Mana Potion -- 11448
	self:addTradeSkill(RecipeDB,11448,205,6149,1,51304,nil,0,205,220,240,260)
	self:addTradeFlags(RecipeDB,11448,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11448,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Elixir of Agility -- 11449
	self:addTradeSkill(RecipeDB,11449,185,8949,1,51304,nil,0,185,205,225,245)
	self:addTradeFlags(RecipeDB,11449,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11449,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Elixir of Greater Defense -- 11450
	self:addTradeSkill(RecipeDB,11450,195,8951,1,51304,nil,0,195,215,235,255)
	self:addTradeFlags(RecipeDB,11450,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11450,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Oil of Immolation -- 11451
	self:addTradeSkill(RecipeDB,11451,205,8956,1,51304,nil,0,205,220,240,260)
	self:addTradeFlags(RecipeDB,11451,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11451,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Restorative Potion -- 11452
	self:addTradeSkill(RecipeDB,11452,210,9030,1,51304,nil,0,210,225,245,265)
	self:addTradeFlags(RecipeDB,11452,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11452,4,2203,4,2501)

	-- Magic Resistance Potion -- 11453
	self:addTradeSkill(RecipeDB,11453,210,9036,2,51304,nil,0,210,225,245,265)
	self:addTradeFlags(RecipeDB,11453,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11453,7,2)

	-- Goblin Rocket Fuel -- 11456
	self:addTradeSkill(RecipeDB,11456,210,9061,1,51304,nil,0,210,225,245,265)
	self:addTradeFlags(RecipeDB,11456,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11456,8,9)

	-- Superior Healing Potion -- 11457
	self:addTradeSkill(RecipeDB,11457,215,3928,1,51304,nil,0,215,230,250,270)
	self:addTradeFlags(RecipeDB,11457,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11457,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Wildvine Potion -- 11458
	self:addTradeSkill(RecipeDB,11458,225,9144,2,51304,nil,0,225,240,260,280)
	self:addTradeFlags(RecipeDB,11458,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11458,7,2)

	-- Philosopher's Stone -- 11459
	self:addTradeSkill(RecipeDB,11459,225,9149,1,51304,nil,0,225,240,260,280)
	self:addTradeFlags(RecipeDB,11459,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,11459,2,5594)

	-- Elixir of Detect Undead -- 11460
	self:addTradeSkill(RecipeDB,11460,230,9154,1,51304,nil,0,230,245,265,285)
	self:addTradeFlags(RecipeDB,11460,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11460,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Arcane Elixir -- 11461
	self:addTradeSkill(RecipeDB,11461,235,9155,1,51304,nil,0,235,250,270,290)
	self:addTradeFlags(RecipeDB,11461,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11461,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Invisibility Potion -- 11464
	self:addTradeSkill(RecipeDB,11464,235,9172,2,51304,nil,0,235,250,270,290)
	self:addTradeFlags(RecipeDB,11464,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11464,7,2)

	-- Elixir of Greater Intellect -- 11465
	self:addTradeSkill(RecipeDB,11465,235,9179,1,51304,nil,0,235,250,270,290)
	self:addTradeFlags(RecipeDB,11465,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11465,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Gift of Arthas -- 11466
	self:addTradeSkill(RecipeDB,11466,240,9088,2,51304,nil,0,240,255,275,295)
	self:addTradeFlags(RecipeDB,11466,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11466,3,1783,3,1791)

	-- Elixir of Greater Agility -- 11467
	self:addTradeSkill(RecipeDB,11467,240,9187,1,51304,nil,0,240,255,275,295)
	self:addTradeFlags(RecipeDB,11467,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11467,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Elixir of Dream Vision -- 11468
	self:addTradeSkill(RecipeDB,11468,240,9197,2,51304,nil,0,240,255,275,295)
	self:addTradeFlags(RecipeDB,11468,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11468,7,2)

	-- Elixir of Giants -- 11472
	self:addTradeSkill(RecipeDB,11472,245,9206,2,51304,nil,0,245,260,280,300)
	self:addTradeFlags(RecipeDB,11472,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11472,7,2)

	-- Ghost Dye -- 11473
	self:addTradeSkill(RecipeDB,11473,245,9210,1,51304,nil,0,245,260,280,300)
	self:addTradeFlags(RecipeDB,11473,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11473,2,8157,2,8158)

	-- Elixir of Shadow Power -- 11476
	self:addTradeSkill(RecipeDB,11476,250,9264,2,51304,nil,0,250,265,285,305)
	self:addTradeFlags(RecipeDB,11476,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11476,2,1313,2,4610)

	-- Elixir of Demonslaying -- 11477
	self:addTradeSkill(RecipeDB,11477,250,9224,1,51304,nil,0,250,265,285,305)
	self:addTradeFlags(RecipeDB,11477,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11477,2,8177,2,8178)

	-- Elixir of Detect Demon -- 11478
	self:addTradeSkill(RecipeDB,11478,250,9233,1,51304,nil,0,250,265,285,305)
	self:addTradeFlags(RecipeDB,11478,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,11478,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Transmute: Iron to Gold -- 11479
	self:addTradeSkill(RecipeDB,11479,225,3577,1,51304,nil,0,225,240,260,280)
	self:addTradeFlags(RecipeDB,11479,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11479,2,5594)

	-- Transmute: Mithril to Truesilver -- 11480
	self:addTradeSkill(RecipeDB,11480,225,6037,1,51304,nil,0,225,240,260,280)
	self:addTradeFlags(RecipeDB,11480,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11480,2,5594)

	-- Catseye Elixir -- 12609
	self:addTradeSkill(RecipeDB,12609,200,10592,1,51304,nil,0,200,220,240,260)
	self:addTradeFlags(RecipeDB,12609,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12609,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Dreamless Sleep Potion -- 15833
	self:addTradeSkill(RecipeDB,15833,230,12190,1,51304,nil,0,230,245,265,285)
	self:addTradeFlags(RecipeDB,15833,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,15833,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Transmute: Arcanite -- 17187
	self:addTradeSkill(RecipeDB,17187,275,12360,1,51304,nil,0,275,275,282,290)
	self:addTradeFlags(RecipeDB,17187,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17187,2,5594)

	-- Stonescale Oil -- 17551
	self:addTradeSkill(RecipeDB,17551,250,13423,1,51304,nil,0,250,250,255,260)
	self:addTradeFlags(RecipeDB,17551,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17551,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Mighty Rage Potion -- 17552
	self:addTradeSkill(RecipeDB,17552,255,13442,2,51304,nil,0,255,270,290,310)
	self:addTradeFlags(RecipeDB,17552,1,2,3,30,36,40)
	self:addTradeAcquire(RecipeDB,17552,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Superior Mana Potion -- 17553
	self:addTradeSkill(RecipeDB,17553,260,13443,1,51304,nil,0,260,275,295,315)
	self:addTradeFlags(RecipeDB,17553,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17553,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Elixir of Superior Defense -- 17554
	self:addTradeSkill(RecipeDB,17554,265,13445,1,51304,nil,0,265,280,300,320)
	self:addTradeFlags(RecipeDB,17554,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17554,1,13445,2,5178)

	-- Elixir of the Sages -- 17555
	self:addTradeSkill(RecipeDB,17555,270,13447,2,51304,nil,0,270,285,305,325)
	self:addTradeFlags(RecipeDB,17555,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17555,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Major Healing Potion -- 17556
	self:addTradeSkill(RecipeDB,17556,275,13446,1,51304,nil,0,275,290,310,330)
	self:addTradeFlags(RecipeDB,17556,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17556,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Elixir of Brute Force -- 17557
	self:addTradeSkill(RecipeDB,17557,275,13453,2,51304,nil,0,275,290,310,330)
	self:addTradeFlags(RecipeDB,17557,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17557,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Transmute: Air to Fire -- 17559
	self:addTradeSkill(RecipeDB,17559,275,7078,2,51304,nil,0,275,275,282,290)
	self:addTradeFlags(RecipeDB,17559,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,96)
	self:addTradeAcquire(RecipeDB,17559,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Transmute: Fire to Earth -- 17560
	self:addTradeSkill(RecipeDB,17560,275,7076,2,51304,nil,0,275,275,282,290)
	self:addTradeFlags(RecipeDB,17560,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17560,2,9499)

	-- Transmute: Earth to Water -- 17561
	self:addTradeSkill(RecipeDB,17561,275,7080,2,51304,nil,0,275,275,282,290)
	self:addTradeFlags(RecipeDB,17561,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,99)
	self:addTradeAcquire(RecipeDB,17561,6,576,1,11557)

	-- Transmute: Water to Air -- 17562
	self:addTradeSkill(RecipeDB,17562,275,7082,2,51304,nil,0,275,275,282,290)
	self:addTradeFlags(RecipeDB,17562,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17562,2,11278)

	-- Transmute: Undeath to Water -- 17563
	self:addTradeSkill(RecipeDB,17563,275,7080,2,51304,nil,0,275,275,282,290)
	self:addTradeFlags(RecipeDB,17563,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17563,7,2)

	-- Transmute: Water to Undeath -- 17564
	self:addTradeSkill(RecipeDB,17564,275,12808,2,51304,nil,0,275,275,282,290)
	self:addTradeFlags(RecipeDB,17564,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17564,7,2)

	-- Transmute: Life to Earth -- 17565
	self:addTradeSkill(RecipeDB,17565,275,7076,2,51304,nil,0,275,275,282,290)
	self:addTradeFlags(RecipeDB,17565,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17565,7,2)

	-- Transmute: Earth to Life -- 17566
	self:addTradeSkill(RecipeDB,17566,275,12803,2,51304,nil,0,275,275,282,290)
	self:addTradeFlags(RecipeDB,17566,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17566,7,2)

	-- Greater Stoneshield Potion -- 17570
	self:addTradeSkill(RecipeDB,17570,280,13455,2,51304,nil,0,280,295,315,335)
	self:addTradeFlags(RecipeDB,17570,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17570,7,2)

	-- Elixir of the Mongoose -- 17571
	self:addTradeSkill(RecipeDB,17571,280,13452,2,51304,nil,0,280,295,315,335)
	self:addTradeFlags(RecipeDB,17571,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17571,3,6201,3,7106)

	-- Purification Potion -- 17572
	self:addTradeSkill(RecipeDB,17572,285,13462,2,51304,nil,0,285,300,320,340)
	self:addTradeFlags(RecipeDB,17572,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17572,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Greater Arcane Elixir -- 17573
	self:addTradeSkill(RecipeDB,17573,285,13454,2,51304,nil,0,285,300,320,340)
	self:addTradeFlags(RecipeDB,17573,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17573,1,1386,1,7948,1,16588,1,18802,1,19052,1,4611,1,4160,1,3603,1,16723,1,3347,1,3009,1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Greater Fire Protection Potion -- 17574
	self:addTradeSkill(RecipeDB,17574,290,13457,2,51304,nil,0,290,305,325,345)
	self:addTradeFlags(RecipeDB,17574,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17574,3,9262,3,9264)

	-- Greater Frost Protection Potion -- 17575
	self:addTradeSkill(RecipeDB,17575,290,13456,2,51304,nil,0,290,305,325,345)
	self:addTradeFlags(RecipeDB,17575,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17575,3,7428)

	-- Greater Nature Protection Potion -- 17576
	self:addTradeSkill(RecipeDB,17576,290,13458,2,51304,nil,0,290,305,325,345)
	self:addTradeFlags(RecipeDB,17576,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17576,3,1812,3,1813)

	-- Greater Arcane Protection Potion -- 17577
	self:addTradeSkill(RecipeDB,17577,290,13461,2,51304,nil,0,290,305,325,345)
	self:addTradeFlags(RecipeDB,17577,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17577,3,7437)

	-- Greater Shadow Protection Potion -- 17578
	self:addTradeSkill(RecipeDB,17578,290,13459,2,51304,nil,0,290,305,325,345)
	self:addTradeFlags(RecipeDB,17578,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17578,3,8546,3,8550)

	-- Major Mana Potion -- 17580
	self:addTradeSkill(RecipeDB,17580,295,13444,2,51304,nil,0,295,310,330,350)
	self:addTradeFlags(RecipeDB,17580,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,17580,3,1853,2,11278)

	-- Alchemist's Stone -- 17632
	self:addTradeSkill(RecipeDB,17632,350,13503,1,51304,nil,0,350,365,372,380)
	self:addTradeFlags(RecipeDB,17632,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,63,111)
	self:addTradeAcquire(RecipeDB,17632,6,935,3,21432)

	-- Flask of Petrification -- 17634
	self:addTradeSkill(RecipeDB,17634,300,13506,2,51304,nil,0,300,315,322,330)
	self:addTradeFlags(RecipeDB,17634,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,17634,7,2)

	-- Flask of the Titans -- 17635
	self:addTradeSkill(RecipeDB,17635,300,13510,2,51304,nil,1,300,315,322,330)
	self:addTradeFlags(RecipeDB,17635,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB,17635,3,10363,6,935,4,21432)

	-- Flask of Distilled Wisdom -- 17636
	self:addTradeSkill(RecipeDB,17636,300,13511,2,51304,nil,1,300,315,322,330)
	self:addTradeFlags(RecipeDB,17636,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,17636,6,942,4,17904)

	-- Flask of Supreme Power -- 17637
	self:addTradeSkill(RecipeDB,17637,300,13512,2,51304,nil,1,300,315,322,330)
	self:addTradeFlags(RecipeDB,17637,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,106)
	self:addTradeAcquire(RecipeDB,17637,3,10508,6,989,4,21643)

	-- Flask of Chromatic Resistance -- 17638
	self:addTradeSkill(RecipeDB,17638,300,13513,2,51304,nil,1,300,315,322,330)
	self:addTradeFlags(RecipeDB,17638,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,107)
	self:addTradeAcquire(RecipeDB,17638,3,10339,6,1011,4,21655)

	-- Elixir of Frost Power -- 21923
	self:addTradeSkill(RecipeDB,21923,190,17708,1,51304,nil,0,190,210,230,250)
	self:addTradeFlags(RecipeDB,21923,1,2,7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,21923,5,1)

	-- Major Rejuvenation Potion -- 22732
	self:addTradeSkill(RecipeDB,22732,300,18253,3,51304,nil,0,300,310,320,330)
	self:addTradeFlags(RecipeDB,22732,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22732,8,26)

	-- Elixir of Greater Water Breathing -- 22808
	self:addTradeSkill(RecipeDB,22808,215,18294,1,51304,nil,0,215,230,250,270)
	self:addTradeFlags(RecipeDB,22808,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22808,1,1386,1,4160,1,4611,1,7948,1,16588,1,18802,1,19052,1,16642,1,27029,1,3603,1,16723,1,3347,1,3009,
	1,2837,1,5177,1,1470,1,3964,1,2132,1,3184,1,33608)

	-- Gurubashi Mojo Madness -- 24266
	self:addTradeSkill(RecipeDB,24266,300,19931,3,51304,nil,0,300,315,322,330)
	self:addTradeFlags(RecipeDB,24266,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,24266,8,11)

	-- Mageblood Elixir -- 24365
	self:addTradeSkill(RecipeDB,24365,275,20007,1,51304,nil,0,275,290,310,330)
	self:addTradeFlags(RecipeDB,24365,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,24365,6,270,3,14921)

	-- Greater Dreamless Sleep Potion -- 24366
	self:addTradeSkill(RecipeDB,24366,275,20002,1,51304,nil,0,275,290,310,330)
	self:addTradeFlags(RecipeDB,24366,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,24366,6,270,1,14921)

	-- Living Action Potion -- 24367
	self:addTradeSkill(RecipeDB,24367,285,20008,1,51304,nil,0,285,300,320,340)
	self:addTradeFlags(RecipeDB,24367,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,24367,6,270,4,14921)

	-- Major Troll's Blood Elixir -- 24368
	self:addTradeSkill(RecipeDB,24368,290,20004,1,51304,nil,0,290,305,325,345)
	self:addTradeFlags(RecipeDB,24368,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,100)
	self:addTradeAcquire(RecipeDB,24368,6,270,2,14921)

	-- Transmute: Elemental Fire -- 25146
	self:addTradeSkill(RecipeDB,25146,300,7068,1,51304,nil,0,300,301,305,310)
	self:addTradeFlags(RecipeDB,25146,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,98)
	self:addTradeAcquire(RecipeDB,25146,6,59,1,12944)

	-- Elixir of Greater Firepower -- 26277
	self:addTradeSkill(RecipeDB,26277,250,21546,2,51304,nil,0,250,265,285,305)
	self:addTradeFlags(RecipeDB,26277,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26277,3,5844,3,5846,3,8637)

	-- Elixir of Camouflage -- 28543
	self:addTradeSkill(RecipeDB,28543,305,22823,1,51304,nil,1,305,320,327,335)
	self:addTradeFlags(RecipeDB,28543,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28543,1,22823,2,16588,2,16641,2,16705,2,18802)

	-- Elixir of Major Strength -- 28544
	self:addTradeSkill(RecipeDB,28544,305,22824,1,51304,nil,1,305,320,327,335)
	self:addTradeFlags(RecipeDB,28544,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28544,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Elixir of Healing Power -- 28545
	self:addTradeSkill(RecipeDB,28545,310,22825,1,51304,nil,1,310,325,332,340)
	self:addTradeFlags(RecipeDB,28545,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28545,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Sneaking Potion -- 28546
	self:addTradeSkill(RecipeDB,28546,315,22826,1,51304,nil,1,315,330,337,345)
	self:addTradeFlags(RecipeDB,28546,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28546,2,18017,2,19042)

	-- Elixir of Major Frost Power -- 28549
	self:addTradeSkill(RecipeDB,28549,320,22827,1,51304,nil,1,320,335,342,350)
	self:addTradeFlags(RecipeDB,28549,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28549,1,22827,2,18005,2,18017)

	-- Insane Strength Potion -- 28550
	self:addTradeSkill(RecipeDB,28550,320,22828,2,51304,nil,1,320,335,342,350)
	self:addTradeFlags(RecipeDB,28550,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28550,7,2)

	-- Super Healing Potion -- 28551
	self:addTradeSkill(RecipeDB,28551,325,22829,1,51304,nil,1,325,340,347,355)
	self:addTradeFlags(RecipeDB,28551,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28551,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Elixir of the Searching Eye -- 28552
	self:addTradeSkill(RecipeDB,28552,325,22830,2,51304,nil,1,325,340,347,355)
	self:addTradeFlags(RecipeDB,28552,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28552,7,2)

	-- Elixir of Major Agility -- 28553
	self:addTradeSkill(RecipeDB,28553,330,22831,1,51304,nil,1,330,345,352,360)
	self:addTradeFlags(RecipeDB,28553,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,28553,6,946,2,17657,6,947,2,17585)

	-- Shrouding Potion -- 28554
	self:addTradeSkill(RecipeDB,28554,335,22871,2,51304,nil,1,335,350,357,365)
	self:addTradeFlags(RecipeDB,28554,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,113)
	self:addTradeAcquire(RecipeDB,28554,6,970,4,18382)

	-- Super Mana Potion -- 28555
	self:addTradeSkill(RecipeDB,28555,340,22832,1,51304,nil,1,340,355,362,370)
	self:addTradeFlags(RecipeDB,28555,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28555,2,18005,2,19837)

	-- Elixir of Major Firepower -- 28556
	self:addTradeSkill(RecipeDB,28556,345,22833,2,51304,nil,1,345,360,367,375)
	self:addTradeFlags(RecipeDB,28556,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,41,110)
	self:addTradeAcquire(RecipeDB,28556,6,934,3,19331)

	-- Elixir of Major Defense -- 28557
	self:addTradeSkill(RecipeDB,28557,345,22834,1,51304,nil,1,345,360,367,375)
	self:addTradeFlags(RecipeDB,28557,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28557,1,22834,2,18005,2,19837)

	-- Elixir of Major Shadow Power -- 28558
	self:addTradeSkill(RecipeDB,28558,350,22835,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28558,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,107)
	self:addTradeAcquire(RecipeDB,28558,6,1011,3,21655)

	-- Major Dreamless Sleep Potion -- 28562
	self:addTradeSkill(RecipeDB,28562,350,22836,1,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28562,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28562,2,19042,2,19837)

	-- Heroic Potion -- 28563
	self:addTradeSkill(RecipeDB,28563,350,22837,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28563,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28563,7,2)

	-- Haste Potion -- 28564 -- THERE'S 2 VERSIONS?
	self:addTradeSkill(RecipeDB,28564,350,22838,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28564,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28564,3,24664)

	-- Destruction Potion -- 28565
	self:addTradeSkill(RecipeDB,28565,350,22839,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28565,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28565,7,2)

	-- Transmute: Primal Air to Fire -- 28566
	self:addTradeSkill(RecipeDB,28566,350,21884,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28566,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB,28566,6,935,3,21432)

	-- Transmute: Primal Earth to Water -- 28567
	self:addTradeSkill(RecipeDB,28567,350,21885,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28567,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,113)
	self:addTradeAcquire(RecipeDB,28567,6,970,3,18382)

	-- Transmute: Primal Fire to Earth -- 28568
	self:addTradeSkill(RecipeDB,28568,350,22452,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28568,1,4,21,22,23,24,25,26,27,28,29,30,36,41,108)
	self:addTradeAcquire(RecipeDB,28568,6,978,3,20240)

	-- Transmute: Primal Water to Air -- 28569
	self:addTradeSkill(RecipeDB,28569,350,22451,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28569,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,28569,6,942,3,17904)

	-- Elixir of Major Mageblood -- 28570
	self:addTradeSkill(RecipeDB,28570,355,22840,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28570,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28570,7,2)

	-- Major Fire Protection Potion -- 28571
	self:addTradeSkill(RecipeDB,28571,360,22841,2,51304,nil,1,360,375,377,380)
	self:addTradeFlags(RecipeDB,28571,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28571,3,19168,3,19221)

	-- Major Frost Protection Potion -- 28572
	self:addTradeSkill(RecipeDB,28572,360,22842,2,51304,nil,1,360,375,377,380)
	self:addTradeFlags(RecipeDB,28572,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28572,3,18344)

	-- Major Nature Protection Potion -- 28573
	self:addTradeSkill(RecipeDB,28573,360,22844,1,51304,nil,1,360,375,377,380)
	self:addTradeFlags(RecipeDB,28573,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,28573,6,942,4,17904)

	-- Major Arcane Protection Potion -- 28575
	self:addTradeSkill(RecipeDB,28575,360,22845,2,51304,nil,1,360,375,377,380)
	self:addTradeFlags(RecipeDB,28575,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28575,3,17150)

	-- Major Shadow Protection Potion -- 28576
	self:addTradeSkill(RecipeDB,28576,360,22846,2,51304,nil,1,360,375,377,380)
	self:addTradeFlags(RecipeDB,28576,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28576,3,21302)

	-- Major Holy Protection Potion -- 28577
	self:addTradeSkill(RecipeDB,28577,360,22847,2,51304,nil,1,360,375,377,380)
	self:addTradeFlags(RecipeDB,28577,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28577,3,19973)

	-- Elixir of Empowerment -- 28578   -- THERE'S 2 VERSIONS?
	self:addTradeSkill(RecipeDB,28578,365,22848,2,51304,nil,1,365,375,377,380)
	self:addTradeFlags(RecipeDB,28578,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28578,3,24664)

	-- Ironshield Potion -- 28579
	self:addTradeSkill(RecipeDB,28579,365,22849,2,51304,nil,1,365,375,377,380)
	self:addTradeFlags(RecipeDB,28579,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28579,3,17862)

	-- Transmute: Primal Shadow to Water -- 28580
	self:addTradeSkill(RecipeDB,28580,370,21885,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28580,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28580,8,3)

	-- Transmute: Primal Water to Shadow -- 28581
	self:addTradeSkill(RecipeDB,28581,370,22456,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28581,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28581,8,3)

	-- Transmute: Primal Mana to Fire -- 28582
	self:addTradeSkill(RecipeDB,28582,370,21884,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28582,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28582,8,3)

	-- Transmute: Primal Fire to Mana -- 28583
	self:addTradeSkill(RecipeDB,28583,370,22457,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28583,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28583,8,3)

	-- Transmute: Primal Life to Earth -- 28584
	self:addTradeSkill(RecipeDB,28584,370,22452,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28584,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28584,8,3)

	-- Transmute: Primal Earth to Life -- 28585
	self:addTradeSkill(RecipeDB,28585,370,21886,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,28585,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28585,8,3)

	-- Super Rejuvenation Potion -- 28586
	self:addTradeSkill(RecipeDB,28586,370,22850,1,51304,nil,1,375,375,377,380)
	self:addTradeFlags(RecipeDB,28586,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28586,8,2)

	-- Flask of Fortification -- 28587
	self:addTradeSkill(RecipeDB,28587,370,22851,1,51304,nil,1,375,375,377,380)
	self:addTradeFlags(RecipeDB,28587,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28587,8,1)

	-- Flask of Mighty Restoration -- 28588
	self:addTradeSkill(RecipeDB,28588,370,22853,1,51304,nil,1,375,375,377,380)
	self:addTradeFlags(RecipeDB,28588,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28588,1,22853,8,1)

	-- Flask of Relentless Assault -- 28589
	self:addTradeSkill(RecipeDB,28589,370,22854,1,51304,nil,1,375,375,377,380)
	self:addTradeFlags(RecipeDB,28589,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28589,8,1)

	-- Flask of Blinding Light -- 28590
	self:addTradeSkill(RecipeDB,28590,370,22861,1,51304,nil,1,375,375,377,380)
	self:addTradeFlags(RecipeDB,28590,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28590,8,1)

	-- Flask of Pure Death -- 28591
	self:addTradeSkill(RecipeDB,28591,370,22866,1,51304,nil,1,375,375,377,380)
	self:addTradeFlags(RecipeDB,28591,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28591,8,1)

	-- Transmute: Primal Might -- 29688
	self:addTradeSkill(RecipeDB,29688,350,23571,2,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,29688,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,29688,2,16641,2,16705,2,19074)

	-- Transmute: Earthstorm Diamond -- 32765
	self:addTradeSkill(RecipeDB,32765,350,25867,1,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,32765,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,32765,6,942,2,17904)

	-- Transmute: Skyfire Diamond -- 32766
	self:addTradeSkill(RecipeDB,32766,350,25868,1,51304,nil,1,350,365,372,380)
	self:addTradeFlags(RecipeDB,32766,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,32766,6,946,2,17657,6,947,2,17585)

	-- Volatile Healing Potion -- 33732
	self:addTradeSkill(RecipeDB,33732,300,28100,1,51304,nil,1,300,315,322,330)
	self:addTradeFlags(RecipeDB,33732,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33732,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Unstable Mana Potion -- 33733
	self:addTradeSkill(RecipeDB,33733,310,28101,1,51304,nil,1,310,325,332,340)
	self:addTradeFlags(RecipeDB,33733,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33733,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Onslaught Elixir -- 33738
	self:addTradeSkill(RecipeDB,33738,300,28102,1,51304,nil,1,300,315,322,330)
	self:addTradeFlags(RecipeDB,33738,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33738,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Adept's Elixir -- 33740
	self:addTradeSkill(RecipeDB,33740,300,28103,1,51304,nil,0,300,315,322,330)
	self:addTradeFlags(RecipeDB,33740,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33740,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Elixir of Mastery -- 33741
	self:addTradeSkill(RecipeDB,33741,315,28104,1,51304,nil,1,315,330,337,345)
	self:addTradeFlags(RecipeDB,33741,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,33741,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Mercurial Stone -- 38070
	self:addTradeSkill(RecipeDB,38070,325,31080,1,51304,nil,1,325,340,347,355)
	self:addTradeFlags(RecipeDB,38070,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38070,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Fel Strength Elixir -- 38960
	self:addTradeSkill(RecipeDB,38960,335,31679,3,51304,nil,1,335,350,357,365)
	self:addTradeFlags(RecipeDB,38960,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38960,3,19740,3,19755,3,21302,3,21314)

	-- Fel Mana Potion -- 38961
	self:addTradeSkill(RecipeDB,38961,360,31677,3,51304,nil,1,360,375,377,380)
	self:addTradeFlags(RecipeDB,38961,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38961,3,19792,3,19795,3,19796,3,19806,3,22016,3,22017,3,22018,3,22076,3,22093)

	-- Fel Regeneration Potion -- 38962
	self:addTradeSkill(RecipeDB,38962,345,31676,3,51304,nil,1,345,360,367,375)
	self:addTradeFlags(RecipeDB,38962,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38962,3,19754,3,19756,3,20878,3,20887)

	-- Elixir of Major Fortitude -- 39636
	self:addTradeSkill(RecipeDB,39636,310,32062,1,51304,nil,1,310,325,332,340)
	self:addTradeFlags(RecipeDB,39636,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39636,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Earthen Elixir -- 39637
	self:addTradeSkill(RecipeDB,39637,320,32063,1,51304,nil,1,320,335,342,350)
	self:addTradeFlags(RecipeDB,39637,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,39637,6,942,2,17904)

	-- Elixir of Draenic Wisdom -- 39638
	self:addTradeSkill(RecipeDB,39638,320,32067,1,51304,nil,1,320,335,342,350)
	self:addTradeFlags(RecipeDB,39638,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39638,1,16588,1,18802,1,19052,1,16642,1,27029,1,33608)

	-- Elixir of Ironskin -- 39639
	self:addTradeSkill(RecipeDB,39639,330,32068,1,51304,nil,1,330,345,352,360)
	self:addTradeFlags(RecipeDB,39639,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39639,2,18821,2,18822)

	-- Cauldron of Major Arcane Protection -- 41458
	self:addTradeSkill(RecipeDB,41458,340,32839,1,51304,nil,1,360,360,370,380)
	self:addTradeFlags(RecipeDB,41458,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41458,8,4)

	-- Cauldron of Major Fire Protection -- 41500
	self:addTradeSkill(RecipeDB,41500,340,32849,1,51304,nil,1,360,360,370,380)
	self:addTradeFlags(RecipeDB,41500,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41500,8,4)

	-- Cauldron of Major Frost Protection -- 41501
	self:addTradeSkill(RecipeDB,41501,340,32850,1,51304,nil,1,360,360,370,380)
	self:addTradeFlags(RecipeDB,41501,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41501,8,4)

	-- Cauldron of Major Nature Protection -- 41502
	self:addTradeSkill(RecipeDB,41502,340,32851,1,51304,nil,1,360,360,370,380)
	self:addTradeFlags(RecipeDB,41502,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41502,8,4)

	-- Cauldron of Major Shadow Protection -- 41503
	self:addTradeSkill(RecipeDB,41503,340,32852,1,51304,nil,1,360,360,370,380)
	self:addTradeFlags(RecipeDB,41503,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41503,8,4)

	-- Flask of Chromatic Wonder -- 42736
	self:addTradeSkill(RecipeDB,42736,375,33208,2,51304,nil,1,375,390,397,405)
	self:addTradeFlags(RecipeDB,42736,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,114)
	self:addTradeAcquire(RecipeDB,42736,6,967,2,18255)

	-- Mad Alchemist's Potion -- 45061
	self:addTradeSkill(RecipeDB,45061,325,34440,1,51304,nil,1,325,335,342,350)
	self:addTradeFlags(RecipeDB,45061,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45061,1,16588,1,18802,1,19052,1,27023,1,27029,1,33608)

	-- Guardian's Alchemist Stone -- 47046
	self:addTradeSkill(RecipeDB,47046,375,35748,1,51304,nil,1,375,380,385,390)
	self:addTradeFlags(RecipeDB,47046,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,52,63,112)
	self:addTradeAcquire(RecipeDB,47046,6,1077,4,25032)

	-- Sorcerer's Alchemist Stone -- 47048
	self:addTradeSkill(RecipeDB,47048,375,35749,1,51304,nil,1,375,380,385,390)
	self:addTradeFlags(RecipeDB,47048,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,63,112)
	self:addTradeAcquire(RecipeDB,47048,6,1077,4,25032)

	-- Redeemer's Alchemist Stone -- 47049
	self:addTradeSkill(RecipeDB,47049,375,35750,1,51304,nil,1,375,380,385,390)
	self:addTradeFlags(RecipeDB,47049,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,63,112)
	self:addTradeAcquire(RecipeDB,47049,6,1077,4,25032)

	-- Assassin's Alchemist Stone -- 47050
	self:addTradeSkill(RecipeDB,47050,375,35751,1,51304,nil,1,375,380,385,390)
	self:addTradeFlags(RecipeDB,47050,1,2,4,21,22,23,24,25,26,27,28,29,30,37,41,51,63,112)
	self:addTradeAcquire(RecipeDB,47050,6,1077,4,25032)

	-- Transmute: Eternal Life to Shadow -- 53771
	self:addTradeSkill(RecipeDB,53771,385,35627,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53771,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53771,8,19)

	-- Transmute: Eternal Life to Fire -- 53773
	self:addTradeSkill(RecipeDB,53773,385,36860,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53773,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53773,8,19)

	-- Transmute: Eternal Fire to Water -- 53774
	self:addTradeSkill(RecipeDB,53774,385,35622,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53774,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53774,8,19)

	-- Transmute: Eternal Fire to Life -- 53775
	self:addTradeSkill(RecipeDB,53775,385,35625,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53775,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53775,8,19)

	-- Transmute: Eternal Air to Water -- 53776
	self:addTradeSkill(RecipeDB,53776,385,35622,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53776,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53776,8,19)

	-- Transmute: Eternal Air to Earth -- 53777
	self:addTradeSkill(RecipeDB,53777,385,35624,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53777,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53777,8,19)

	-- Transmute: Eternal Shadow to Earth -- 53779
	self:addTradeSkill(RecipeDB,53779,385,35624,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53779,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53779,8,19)

	-- Transmute: Eternal Shadow to Life -- 53780
	self:addTradeSkill(RecipeDB,53780,385,35625,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53780,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53780,8,19)

	-- Transmute: Eternal Earth to Air -- 53781
	self:addTradeSkill(RecipeDB,53781,385,35623,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53781,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53781,8,19)

	-- Transmute: Eternal Earth to Shadow -- 53782
	self:addTradeSkill(RecipeDB,53782,385,35627,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53782,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53782,8,19)

	-- Transmute: Eternal Water to Air -- 53783
	self:addTradeSkill(RecipeDB,53783,385,35623,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53783,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53783,8,19)

	-- Transmute: Eternal Water to Fire -- 53784
	self:addTradeSkill(RecipeDB,53784,385,36860,2,51304,nil,2,405,405,415,425)
	self:addTradeFlags(RecipeDB,53784,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53784,8,19)

	-- Pygmy Oil -- 53812
	self:addTradeSkill(RecipeDB,53812,375,40195,1,51304,nil,2,375,380,385,390)
	self:addTradeFlags(RecipeDB,53812,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53812,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Runic Healing Potion -- 53836
	self:addTradeSkill(RecipeDB,53836,405,33447,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53836,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53836,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Runic Mana Potion -- 53837
	self:addTradeSkill(RecipeDB,53837,410,33448,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53837,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53837,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Resurgent Healing Potion -- 53838
	self:addTradeSkill(RecipeDB,53838,350,39671,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53838,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53838,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Icy Mana Potion -- 53839
	self:addTradeSkill(RecipeDB,53839,360,40067,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53839,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53839,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Elixir of Mighty Agility -- 53840
	self:addTradeSkill(RecipeDB,53840,395,39666,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53840,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53840,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Wrath Elixir -- 53841
	self:addTradeSkill(RecipeDB,53841,355,40068,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53841,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53841,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Spellpower Elixir -- 53842
	self:addTradeSkill(RecipeDB,53842,365,40070,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53842,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53842,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Elixir of Spirit -- 53847
	self:addTradeSkill(RecipeDB,53847,385,40072,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53847,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53847,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Guru's Elixir -- 53848
	self:addTradeSkill(RecipeDB,53848,375,40076,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,53848,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53848,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Crazy Alchemist's Potion -- 53895
	self:addTradeSkill(RecipeDB,53895,400,40077,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53895,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53895,8,18)

	-- Elixir of Mighty Fortitude -- 53898
	self:addTradeSkill(RecipeDB,53898,390,40078,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,53898,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53898,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Lesser Flask of Toughness -- 53899
	self:addTradeSkill(RecipeDB,53899,375,40079,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53899,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53899,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Potion of Nightmares -- 53900
	self:addTradeSkill(RecipeDB,53900,380,40081,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,53900,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53900,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Flask of the Frost Wyrm -- 53901
	self:addTradeSkill(RecipeDB,53901,435,40082,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53901,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53901,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Flask of Stoneblood -- 53902
	self:addTradeSkill(RecipeDB,53902,435,40083,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53902,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53902,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Flask of Endless Rage -- 53903
	self:addTradeSkill(RecipeDB,53903,435,40084,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53903,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53903,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Powerful Rejuvenation Potion -- 53904
	self:addTradeSkill(RecipeDB,53904,400,40087,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,53904,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53904,8,18)

	-- Indestructible Potion -- 53905
	self:addTradeSkill(RecipeDB,53905,395,40093,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,53905,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53905,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Mighty Arcane Protection Potion -- 53936
	self:addTradeSkill(RecipeDB,53936,400,40213,2,51304,nil,2)
	self:addTradeFlags(RecipeDB,53936,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53936,3,32297,3,31702)

	-- Mighty Frost Protection Potion -- 53937
	self:addTradeSkill(RecipeDB,53937,400,40215,2,51304,nil,2)
	self:addTradeFlags(RecipeDB,53937,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53937,3,32289)

	-- Mighty Shadow Protection Potion -- 53938
	self:addTradeSkill(RecipeDB,53938,400,40217,2,51304,nil,2)
	self:addTradeFlags(RecipeDB,53938,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53938,3,32349)

	-- Mighty Fire Protection Potion -- 53939
	self:addTradeSkill(RecipeDB,53939,400,40214,2,51304,nil,2)
	self:addTradeFlags(RecipeDB,53939,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53939,3,30921)

	-- Mighty Nature Protection Potion -- 53942
	self:addTradeSkill(RecipeDB,53942,400,40216,2,51304,nil,2)
	self:addTradeFlags(RecipeDB,53942,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53942,3,32290)

	-- Flask of Pure Mojo -- 54213
	self:addTradeSkill(RecipeDB,54213,435,40404,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,54213,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,54213,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Elixir of Mighty Strength -- 54218
	self:addTradeSkill(RecipeDB,54218,385,40073,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,54218,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,54218,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Elixir of Protection -- 54220
	self:addTradeSkill(RecipeDB,54220,400,40097,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,54220,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,54220,8,18)

	-- Potion of Speed -- 54221
	self:addTradeSkill(RecipeDB,54221,400,40211,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,54221,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,54221,8,18)

	-- Potion of Wild Magic -- 54222
	self:addTradeSkill(RecipeDB,54222,400,40212,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,54222,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,54222,8,18)

	-- Elixir of Mighty Mageblood -- 56519
	self:addTradeSkill(RecipeDB,56519,400,40109,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,56519,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56519,8,18)

	-- Transmute: Skyflare Diamond -- 57425
	self:addTradeSkill(RecipeDB,57425,430,41266,3,51304,nil,2)
	self:addTradeFlags(RecipeDB,57425,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57425,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Transmute: Earthsiege Diamond -- 57427
	self:addTradeSkill(RecipeDB,57427,425,41334,3,51304,nil,2)
	self:addTradeFlags(RecipeDB,57427,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57427,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Endless Mana Potion -- 58868
	self:addTradeSkill(RecipeDB,58868,410,43570,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,58868,1,2,3,21,22,23,24,25,26,27,28,29,30,41)
	self:addTradeAcquire(RecipeDB,58868,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Endless Healing Potion -- 58871
	self:addTradeSkill(RecipeDB,58871,410,43569,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,58871,1,2,3,21,22,23,24,25,26,27,28,29,30,41)
	self:addTradeAcquire(RecipeDB,58871,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Transmute: Titanium -- 60350
	self:addTradeSkill(RecipeDB,60350,395,41163,2,51304,nil,2)
	self:addTradeFlags(RecipeDB,60350,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60350,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Elixir of Accuracy -- 60354
	self:addTradeSkill(RecipeDB,60354,400,44325,1,51304,nil,2,400,415,422,430)
	self:addTradeFlags(RecipeDB,60354,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60354,8,18)

	-- Elixir of Deadly Strikes -- 60355
	self:addTradeSkill(RecipeDB,60355,400,44327,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,60355,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60355,8,18)

	-- Elixir of Mighty Defense -- 60356
	self:addTradeSkill(RecipeDB,60356,400,44328,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,60356,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60356,8,18)

	-- Elixir of Expertise -- 60357
	self:addTradeSkill(RecipeDB,60357,400,44329,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,60357,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60357,8,18)

	-- Elixir of Armor Piercing -- 60365
	self:addTradeSkill(RecipeDB,60365,400,44330,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,60365,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,60365,8,18)

	-- Elixir of Lightning Speed -- 60366
	self:addTradeSkill(RecipeDB,60366,400,44331,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,60366,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60366,8,18)

	-- Elixir of Mighty Thoughts -- 60367
	self:addTradeSkill(RecipeDB,60367,395,44332,1, 51304,nil,2)
	self:addTradeFlags(RecipeDB,60367,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60367,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Mercurial Alchemist Stone -- 60396
	self:addTradeSkill(RecipeDB,60396,400,44322,3,51304,nil,2)
	self:addTradeFlags(RecipeDB,60396,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,60396,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Indestructible Alchemist Stone -- 60403
	self:addTradeSkill(RecipeDB,60403,400,44323,3,51304,nil,2)
	self:addTradeFlags(RecipeDB,60403,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,52,63)
	self:addTradeAcquire(RecipeDB,60403,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Mighty Alchemist Stone -- 60405
	self:addTradeSkill(RecipeDB,60405,400,44324,3,51304,nil,2)
	self:addTradeFlags(RecipeDB,60405,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,60405,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Northrend Alchemy Research -- 60893
	self:addTradeSkill(RecipeDB,60893,400,nil,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,60893,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60893,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Shadow Oil -- 3449
	self:addTradeSkill(RecipeDB,3449,165,3824,1,51304,nil,2,165,190,210,230)
	self:addTradeFlags(RecipeDB,3449,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3449,2,2481,2,4878)

	-- Free Action Potion -- 6624
	self:addTradeSkill(RecipeDB,6624,150,5634,1,51304,nil,2,150,175,195,215)
	self:addTradeFlags(RecipeDB,6624,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,6624,2,3348,2,5178,2,4226)

	-- Elixir of Water Walking -- 62410
	self:addTradeSkill(RecipeDB,62410,400,8827,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,62410,1,2,12,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,62410,8,18)

	-- Ethereal Oil -- 62409
	self:addTradeSkill(RecipeDB,62409,375,44958,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,62409,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,62409,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Lesser Flask of Resistance -- 62213
	self:addTradeSkill(RecipeDB,62213,385,44939,1,51304,nil,2)
	self:addTradeFlags(RecipeDB,62213,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,62213,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

	-- Elixir of Minor Accuracy -- 63732
	self:addTradeSkill(RecipeDB,63732,135,45621,1,51304,nil,2,135,160,180,200)
	self:addTradeFlags(RecipeDB,63732,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,63732,1,1386,1,2391,1,2837,1,3009,1,3347,1,4160,1,4609,1,4611,1,5177,1,5499,1,7948,1,11042,1,16588,
	1,16642,1,16723,1,18802,1,19052,1,27029,1,3603,1,1470,1,3964,1,2132,1,3184,1,33608)

	local _,_,_,toc = GetBuildInfo()

	if (toc == 30200) then

		-- Transmute: Ametrine -- 66658
		self:addTradeSkill(RecipeDB,66658,440,36931,1,51304,nil,2,440,440,452,465)
		self:addTradeFlags(RecipeDB,66658,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,66658,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

		-- Transmute: Cardinal Ruby -- 66659
		self:addTradeSkill(RecipeDB,66659,450,36919,1,51304,nil,2,440,440,452,465)
		self:addTradeFlags(RecipeDB,66659,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,66659,4,14151)

		-- Transmute: King's Amber -- 66660
		self:addTradeSkill(RecipeDB,66660,440,36922,1,51304,nil,2,440,440,452,465)
		self:addTradeFlags(RecipeDB,66660,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,66660,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

		-- Transmute: Dreadstone -- 66662
		self:addTradeSkill(RecipeDB,66662,440,36928,1,51304,nil,2,440,440,452,465)
		self:addTradeFlags(RecipeDB,66662,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,66662,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

		-- Transmute: Majestic Zircon -- 66663
		self:addTradeSkill(RecipeDB,66663,440,36925,1,51304,nil,2,440,440,452,465)
		self:addTradeFlags(RecipeDB,66663,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,66663,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

		-- Transmute: Eye of Zul -- 66664
		self:addTradeSkill(RecipeDB,66664,440,36934,1,51304,nil,2,440,440,452,465)
		self:addTradeFlags(RecipeDB,66664,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,66664,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

		-- Flask of the North -- 67025
		self:addTradeSkill(RecipeDB,67025,440,47499,1,51304,nil,2,440,440,445,450)
		self:addTradeFlags(RecipeDB,67025,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
		self:addTradeAcquire(RecipeDB,67025,1,26903,1,26951,1,26975,1,26987,1,28703,1,33588)

		return 251

	else

		return 244

	end

end
