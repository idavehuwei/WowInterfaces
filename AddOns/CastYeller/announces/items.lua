if not CastYeller then return end

--#WIKI == Items ==

-- check for leatherworking requirments
local IsDrumUsable
do
	local leatherworkingLevel, frame, updateLevel
	updateLevel = function()
		leatherworkingLevel = 0
		local leatherworkingName = GetSpellInfo(2108)
		if leatherworkingName then
			for i = 1,GetNumSkillLines() do
				local name,isHeader,_,_,level = GetSkillLineInfo(i)
				if name == leatherworkingName then
					leatherworkingLevel = level
					break
				end
			end
		end
		-- Update level on skill updates
		if not frame then
			frame = CreateFrame("Frame")
			frame:RegisterEvent('CHAT_MSG_SKILL')
			frame:SetScript('OnEvent', updateLevel)
		end
	end
	IsDrumUsable = function(announce)
		if announce.name and announce.drumLevel then
			if leatherworkingLevel == nil then
				updateLevel()
			end
			return leatherworkingLevel >= announce.drumLevel
		end
	end
end

-- Register the drums
CastYeller:RegisterAnnounces({
	--#WIKI * Drums of Battle
	['item-29529'] = { 
		events     = { success = true },
		channel    = { '_PARTY_BROADCAST' },
		conditions = { 'combat' },
		IsKnown    = IsDrumUsable,
		drumLevel  = 350,
	},
	--#WIKI * Drums of Panic
	['item-29532'] = { 
		events     = { success = true },
		channel    = { '_PARTY_BROADCAST' },
		conditions = { 'combat' },
		IsKnown    = IsDrumUsable,
		drumLevel  = 350,
	},
	--#WIKI * Drums of Restoration
	['item-29531'] = { 
		events     = { success = true },
		channel    = { '_PARTY_BROADCAST' },
		conditions = { 'combat' },
		IsKnown    = IsDrumUsable,
		drumLevel  = 350,
	},
	--#WIKI * Drums of Speed
	['item-29530'] = { 
		events     = { success = true },
		channel    = { '_PARTY_BROADCAST' },
		conditions = { 'combat' },
		IsKnown    = IsDrumUsable,
		drumLevel  = 340,
	},
	--#WIKI * Drums of War
	['item-29528'] = { 
		events     = { success = true },
		channel    = { '_PARTY_BROADCAST' },
		conditions = { 'combat' },
		IsKnown    = IsDrumUsable,
		drumLevel  = 325,
	},
})

