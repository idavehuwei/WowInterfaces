--H小强 P3 治疗专用插件
--提示刺骨之寒的编号

--by 喵花教练(6区12组-瓦拉斯塔兹-龙吟天下-尤菲米娅)

--感谢花花、念姐、鹌鹑帮忙测试- -

local VERSION = 5


--r5 获取GridRoster/GridStatus的方法修正
--r4 正确处理10个刺骨的情况，增加闪动提示，增加第一跳提示的开关选项 
--r3 第一跳提示
--r2 技能图标美化！ 可以自行选择 刺骨图标+数字/纯数字的提示方案
--r1 

local function log(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end
--修改自GridStatusRaidIcons

local GridRoster = Grid:GetModule("GridRoster");
local GridStatus = Grid:GetModule("GridStatus");
local GridFrame = Grid:GetModule("GridFrame");
if not GridRoster then
	print("GridStatusAnubarak requires GridRoster.")
	print("Please update Grid.")
	return
end

local TEST_DEBUFF_NAME = "虚弱灵魂"  --用盾做测试
local DEBUFF_NAME = "刺骨之寒"
local STATUS_NAME = "alert_anubarak_pc"

local HIGHLIGHT_DURATION = 15
local HIGHLIGHT_INTERVAL = 0.5

local MAX_PC_COUNT = 5 --最多5个刺骨

local debuff = DEBUFF_NAME

GridStatusAnubarak = GridStatus:NewModule("GridStatusAnubarak")
GridStatusAnubarak.menuName = "阿努巴拉克 刺骨之寒编号提示"

local TEXT_ICON_PREFIX = "Interface\\AddOns\\Grid\\GridStatusAnubarak\\icons\\text"
local TEXT_ICON_SUFFIX = ".tga"
local SPELL_ICON_PREFIX = "Interface\\AddOns\\Grid\\GridStatusAnubarak\\icons\\icon"
local SPELL_ICON_SUFFIX = ".tga"

local lastUpdatedTimestamp = 0
local lastUpdatedTime = 0

local lastRemovedTimestamp = 0

local lastUpdated = {}
local lastRemoved = {}

local highlighting = {}
local lastHighlighted = 0
local lastTimestamp = 0

local steps = 0
local needUpdate = false

local icon_prefix = SPELL_ICON_PREFIX
local icon_suffix = SPELL_ICON_SUFFIX

GridStatusAnubarak.defaultDB = {
	debug = false,
	alert_anubarak_pc = {
		text =  "阿努巴拉克 刺骨之寒编号提示",
		enable = true,
		test_mode = false,
		use_text_icon = false,
		highlighting = {
			[1] = true,
			[2] = false,
			[3] = true,
			[4] = false,
			[5] = false,
		},
		show_first_tick = false,
		show_cooldown = false,
		color = { r = 1, g = 1, b = 1, a = 1, ignore = true },
		priority = 99,
		range = false,
	}
}

GridStatusAnubarak.options = false

function GridStatusAnubarak:OnInitialize()
	self.super.OnInitialize(self)
	
	local menu = {}	
	menu["test_mode"] = {
		type = "toggle",
		name = "测试模式",
		desc = "用[真言术：盾]产生的[虚弱灵魂]作为DEBUFF测试 正式作战时请务必关闭此选项！",
		order = 9,
		get = function()
			return GridStatusAnubarak.db.profile.alert_anubarak_pc.test_mode
		end,
		set = function()
			GridStatusAnubarak.db.profile.alert_anubarak_pc.test_mode = not GridStatusAnubarak.db.profile.alert_anubarak_pc.test_mode
			debuff = self.db.profile.alert_anubarak_pc.test_mode and TEST_DEBUFF_NAME or DEBUFF_NAME
			self:UpdateAllUnits()
		end
	}
	menu["show_cooldown"] = {
		type = "toggle",
		name = "显示剩余时间",
		desc = "这个选项是为了方便那些装了在Cooldown上显示冷却数字的童鞋们使用的，如果冷却数字挡住图标导致看不到刺骨的编号，请果断取消选择这个选项",
		order = 10,
		get = function()
			return GridStatusAnubarak.db.profile.alert_anubarak_pc.show_cooldown
		end,
		set = function()
			GridStatusAnubarak.db.profile.alert_anubarak_pc.show_cooldown = not GridStatusAnubarak.db.profile.alert_anubarak_pc.show_cooldown
		end
	}
	
	menu["show_first_tick"] = {
		type = "toggle",
		name = "提示刺骨第一跳发作的剩余时间",
		desc = "选中的话，不会显示刺骨的剩余时间，而是显示一个3秒的倒计时，用来表示离刺骨之寒第一跳发作的剩余时间",
		order = 11,
		get = function()
			return GridStatusAnubarak.db.profile.alert_anubarak_pc.show_first_tick
		end,
		set = function()
			GridStatusAnubarak.db.profile.alert_anubarak_pc.show_first_tick = not GridStatusAnubarak.db.profile.alert_anubarak_pc.show_first_tick
		end
	}
	
	menu["spell_icon"] = {
		type = "toggle",
		name = "不显示技能图标",
		desc = "选中的话，GridStatus图标将只显示数字编号",
		order = 12,
		get = function()
			return GridStatusAnubarak.db.profile.alert_anubarak_pc.use_text_icon
		end,
		set = function()
			GridStatusAnubarak.db.profile.alert_anubarak_pc.use_text_icon = not GridStatusAnubarak.db.profile.alert_anubarak_pc.use_text_icon
			icon_suffix = self.db.profile.alert_anubarak_pc.use_text_icon and TEXT_ICON_SUFFIX or SPELL_ICON_SUFFIX
			icon_prefix = self.db.profile.alert_anubarak_pc.use_text_icon and TEXT_ICON_PREFIX or SPELL_ICON_PREFIX
			self:UpdateAllUnits()
		end
	}
	
	for i = 1, MAX_PC_COUNT do
		menu["toggle_highlight_" .. i] = {
			type = "toggle",
			name = "闪动提示" .. i .. "号刺骨",
			desc = "为" .. i .. "号刺骨闪烁" .. HIGHLIGHT_DURATION .."秒",
			order = 15 + i,
			get = function()
				return GridStatusAnubarak.db.profile.alert_anubarak_pc.highlighting[i]
			end,
			set = function()
				GridStatusAnubarak.db.profile.alert_anubarak_pc.highlighting[i] = not GridStatusAnubarak.db.profile.alert_anubarak_pc.highlighting[i]
			end
		}
	end
	
	self:RegisterStatus(STATUS_NAME, "阿努巴拉克 刺骨之寒编号提示", menu, true)
	
	self.TimerFrame = CreateFrame("Frame", "GridStatusAnubarakTimerFrame")
	self.TimerFrame.parent = self
	self.TimerFrame:SetScript("OnUpdate", TimerFrameOnUpdate)
	self.TimerFrame:Hide()
end

function GridStatusAnubarak:OnStatusEnable(status)
	if status == STATUS_NAME then
		debuff = self.db.profile.alert_anubarak_pc.test_mode and TEST_DEBUFF_NAME or DEBUFF_NAME
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "CombatLog")
		self:UpdateAllUnits()
		self.TimerFrame:Show()
	end
end

function GridStatusAnubarak:OnStatusDisable(status)
	if not self.db.profile.alert_anubarak_pc.enable then
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self.TimerFrame:Hide()
	end
	if status == STATUS_NAME then
		self.core:SendStatusLostAllUnits(STATUS_NAME)
	end
end

function pairsByKeys(t, f)
	local a = {}
	for n in pairs(t) do 
		table.insert(a, n) 
	end
		
	table.sort(a, f)
	local i = 0                   -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then 
			return nil
		else 
			return a[i], t[a[i]]
		end
	end
	return iter
end

function hasDebuff(unitid)
  local i
  for i = 1, 40 do
		local name, _, icon, _, debuffType, duration, expirationTime = UnitDebuff(unitid, i)
		if not name then break end
		if name == debuff then
			--log(name .. duration .. " " .. expirationTime)
			return duration, expirationTime
		end
  end
  return nil
end

function GridStatusAnubarak:CombatLog(timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)
	steps = steps + 1
	if not GridRoster:IsGUIDInRaid(destGUID) then 
		--not in raid, do nothing
	elseif (eventType == "SPELL_AURA_APPLIED") or (eventType == "SPELL_AURA_REFRESH") or (eventType == "SPELL_AURA_REMOVED") then
		local spellID, spellName, _, auraType = ...
		if (auraType == "DEBUFF" and spellName == debuff) then 
			if (eventType ~= "SPELL_AURA_REMOVED") then       
				lastUpdated[destGUID] = timestamp
				lastUpdatedTimestamp = timestamp 
				needUpdate = true
			else
				lastRemoved[destGUID] = timestamp
				lastRemovedTimestamp = timestamp 
				needUpdate = true
			end
		end
	end
   
	steps = steps - 1
end

function TimerFrameOnUpdate(self)
	local now = GetTime()
	if now - lastHighlighted > HIGHLIGHT_INTERVAL then
		--log("HIGH " .. now)
		local settings = self.parent.db.profile.alert_anubarak_pc
		lastHighlighted = now
		for guid, params in pairs(highlighting) do
			--log("INCOMING .. " .. guid .. " start=" .. params.start)
			local cd_start = nil
			local cd_duration = nil
    
			if settings.show_cooldown then
				cd_start = params.start
				if settings.show_first_tick then
					cd_duration = 3
				else
					cd_duration = params.duration
				end
			end

			if now > params.start + HIGHLIGHT_DURATION then
				--log("outdated")
				highlighting[guid] = nil
				self.parent.core:SendStatusGained(guid, STATUS_NAME,
				  settings.priority,
				  (settings.range and 40),
				  { r = 0, g = 0.71, b = 1, a = settings.color.a, ignore = true },
				  "" .. params.counter .. "号刺骨",
				  nil,
				  nil,
				  icon_prefix .. params.counter .. icon_suffix,
				  cd_start,
				  cd_duration)
			else
				local suffix = ""
  	  
				highlighting[guid].reverse_color = not highlighting[guid].reverse_color
				if highlighting[guid].reverse_color then
					suffix = "r"
				end	
        
				--log("suffix=" .. suffix)
				self.parent.core:SendStatusLost(guid, STATUS_NAME)
				self.parent.core:SendStatusGained(guid, STATUS_NAME,
					settings.priority,
				  (settings.range and 40),
				  { r = 0, g = 0.71, b = 1, a = settings.color.a, ignore = true },
				  "" .. params.counter .. "号刺骨",
				  nil,
				  nil,
				  icon_prefix .. params.counter .. suffix .. icon_suffix,
				  cd_start,
				  cd_duration)
			end
		end
	end

	if needUpdate then
		self.parent:UpdateAllUnits()
	end
  
	if now - lastUpdatedTime > 30 then
		self.parent:UpdateAllUnits()
	end
end

--add by lahuhu start
function sortByUnitIdAsc(a,b)
  if a.ui == b.ui then
    return a.g < b.g
  else
    return a.ui < b.ui
  end
end
--add by lahuhu end

function GridStatusAnubarak:UpdateAllUnits()
	needUpdate = false
	lastUpdatedTime = GetTime()
  
	local settings = self.db.profile.alert_anubarak_pc
	local counter = 0
	local indicators = {}
  
	for frameName, frame in pairsByKeys(GridFrame.registeredFrames) do
		if frame.frame:IsVisible() and frame.unit == frame.frame:GetAttribute("unit") then
			local unitid = frame.unit
			local guid = frame.unitGUID
			local duration, expiration
			local gain_time = lastUpdated[guid]
      
			if gain_time and gain_time >= lastUpdatedTimestamp - 10 then
				if counter >= MAX_PC_COUNT then
					--将indicators中最小timestamp的guid删除，其他-1
					--counter = counter - 1
					--再插入
					local min_ts = math.huge
					local min_guid = nil
					local min_counter = 0
          
					for g in pairs(indicators) do
						local ts = lastUpdated[g] or 0
						if min_ts > ts then
							min_ts = ts
							min_guid = g
							min_counter = indicators[g]
						end
					end
          
					-- min_guid 最小timestamp的guid
					indicators[min_guid] = nil
					for g in pairs(indicators) do
						if indicators[g] > min_counter then
							indicators[g] = indicators[g] - 1
						end
					end
					counter = counter - 1
				end
      
				counter = counter + 1
				indicators[guid] = counter
			end  
		end
	end		
	
	local count = 0

  --modify by lahuhu start
  --for guid, unitid in GridRoster:IterateRoster() do
	local countS = 0
	local k = 0
	local tbl = {}
	
	for guid, unitid in GridRoster:IterateRoster() do
		table.insert(tbl, {ui = unitid, g = guid})
		countS = countS + 1
	end
	table.sort(tbl, sortByUnitIdAsc)
  	for k = 1, countS do
		guid = tbl[k].g
		unitid = tbl[k].ui
		--modify by lahuhu end
		local rank = indicators[guid]
		local duration, expiration = hasDebuff(unitid)
	  
		if rank and duration then
			count = count + 1
			local startTime = expiration - duration
  	  
			local cd_start = nil
			local cd_duration = nil
	    
			if settings.show_cooldown then
				cd_start = startTime
				if settings.show_first_tick then
					cd_duration = 3
				else
					cd_duration = duration
				end
			end
	    
			self.core:SendStatusGained(guid, STATUS_NAME,
				settings.priority,
				(settings.range and 40),
				{ r = 0, g = 0.71, b = 1, a = settings.color.a, ignore = true },
				"" .. rank .. "号刺骨",
				nil,
				nil,
				icon_prefix .. rank .. icon_suffix,
				cd_start,
				cd_duration)
				
			if settings.highlighting[rank] then
				highlighting[guid] = { reverse_color = false, start = startTime, duration = duration, counter = rank,  }
			else
				highlighting[guid] = nil
			end
		else
			highlighting[guid] = nil
			self.core:SendStatusLost(guid, STATUS_NAME)
		end
	end  
end