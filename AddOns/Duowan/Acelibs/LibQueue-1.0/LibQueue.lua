-- LibQueue
-- by DrDoom (Shalune on Kargath)
--
-- This is an open-source delayed-processing and buffer queue library developed for World of Warcraft
--
-- There are three functional concepts this library works with:
-- Queue: Allow you to place information on it for later retrieval
--		Standard queues use a FIFO buffer with rotational positioning, meaning no constant
--		client-side cleanup, therefore faster access.  The queue is designed to handle any type
--		of data, even nil, so prior data-checking is recommended.
--
-- Timer: Timers execute a function every x seconds until stopped by the addon.  These can be
--		executed and controlled as groups, allowing you to do multiple things at once, and turn
--		on or off processing of these timers en masse.
--
-- Delay: Delays execute a given function after x seconds, and do not repeat.  Delays are cleared
--		automatically after they are processed.  Delay objects allow you to extend processing
--		until something is done, and you can extend the time before it is executed as well.  This
--		is great for events like BAG_UPDATE if you want to do an inventory scan.
--
-- Library functions are not embedded in created queue objects

-----------------
-- CreateQueue --
-----------------
--	Arguments:
--		table QueueName					Table object to store the queue
--		integer MaxSize					Maximum size of the queue in elements
--		boolean AllowRecentDuplicates	Allow duplicates of the most recent entry
--		boolean AllowAnyDuplicates		Allow duplicates anywhere in the table
--		boolean IsStack					Queue is processed like a stack (FILO)
--	Description:
--		Creates a queue, you must specify a maximum size.  If given queue does not exist,
--		table will be created in the global environment
--		Default behavior is to allow any duplicates, if AllowAnyDuplicates is true, then
--		AllowRecentDuplicates will be ignored.
--	Example:
--		local MyQueue = {};
--		success = LibQueue:CreateQueue(MyQueue,500,true,false,false);
--		success = LibQueue:CreateQueue(MyStack,50,,true,true);
--	Returns:
--		true = Queue created successfully
--		false = Queue not created (invalid argument)
--
---------
-- Put --
---------
--	Arguments:
--		table QueueName
--		any Value;
--	Description:
--		Adds a value to the end of the Queues internal positioning, buffer will be expanded
--		if needed, not to exceed the maximum size.  If the queue is full, the data is discarded.
--	Example:
--		success = LibQueue:Put(MyQueue,"Hello");
--		success = LibQueue:Put(MyStack,123);
--		success = LibQueue:Put(MyQueue, {1,"2",3} );
--	Returns:
--		true = Value added successfully
--		false = Value discarded
--
---------
-- Get --
---------
--	Arguments:
--		table QueueName
--	Description:
--		Extracts the next value from the table.
--	Example:
--		value = LibQueue:Get(MyQueue)
--	Returns:
--		nil = Queue is empty or value is nil
--		non-nil = Next value in line
--
----------
-- Peek --
----------
--	Arguments:
--		table QueueName
--		boolean LastValue
--	Description:
--		Extracts the next value in line from the table without removing it.
--		If LastValue is specified, it will extract the last value added (has no effect on a stack).
--	Example:
--		nextvalue = LibQueue:Peek(MyQueue)
--		lastvalue = LibQueue:Peek(MyQueue,true)
--		lastvalue = LibQueue:Peek(MyStack)
--		lastvalue = LibQueue:Peek(MyStack,true)
--	Returns:
--		nil = Queue is empty or Value is nil
--		non-nil = Value requested
--
----------
-- Size --
----------
--	Arguments:
--		table QueueName
--	Description:
--		Returns the size of the current Queue or Stack.
--	Example:
--		Size,BufferSize = LibQueue:Size(MyQueue)
--	Returns:
--		Size is the number of active elements in the buffer
--		BufferSize is the total number of elements in the buffer.
--
--		nil = Queue is not valid or has not been created
--		integer = Number of elements in the Queue, 0 = empty

----------
-- Wipe --
----------
--	Arguments:
--		table QueueName
--		boolean ClearBuffer
--	Description:
--		Empties the queue and discards all information, will also optionally clean up the unused
--		buffer space
--	Example:
--		LibQueue:Wipe(MyQueue,false)	-- Does not discard buffer data, no memory is freed up
--		LibQueue:Wipe(MyQueue,true)		-- Discards the buffer, memory is freed
--	Returns:
--		Nothing
--
-----------------
-- CreateTimer --
-----------------
--	Arguments:
--		string Name			Name of the delay object to make
--		number Time			Time interval to call Callback (seconds)
--		function Callback	Function to call when delay has completed
--		any Data			Data to pass to Callback function when called
--		AllowDuplicates		Allow multiple timers with this name?
--		InCombat			If set to false, timer will be paused in combat
--	Description:
--		Creates a timer, which calls Callback(Data); every Time seconds.
--		Default behavior is AllowDuplicates=true, AllowExtend=false,InCombat=true
--	Returns:
--		false = Delay not created
--		true = Delay created successfully or existing delay extended
--	Example:
--		function MyAddon_Func1(value)
--			print("Your lucky number is "..tostring(value));
--		end
--		success = LibQueue:CreateDelay("MyAddon_Delay1",5,MyAddon_Func1,10);
--		--After 5 seconds, outputs: Your lucky number is 10
--
----------------
-- StopTimer --
----------------
--	Arguments:
--		string Name		Name of the Timer object
--	Description:
--		Pauses the timers on all Timer objects named Name
--	Returns:
--		Nothing
--	Example:
--		LibQueue:StopTimer("MyAddon_Timer");
--
----------------
-- StartTimer --
----------------
--	Arguments:
--		string Name		Name of the Timer object
--	Description:
--		Unpauses the timers on all Timer objects named Name
--	Returns:
--		Nothing
--	Example:
--		LibQueue:StartTimer("MyAddon_Timer");
--
-----------------
-- ToggleTimer --
-----------------
--	Arguments:
--		string Name		Name of the Timer object
--	Description:
--		Toggles the paused state of the timers on all Timer objects named Name
--	Returns:
--		Nothing
--	Example:
--		LibQueue:ToggleTimer("MyAddon_Timer");
--
-----------------
-- ClearTimer --
-----------------
--	Arguments:
--		string Name		Name of the Timer object
--	Description:
--		Removes all instances of the named timer.
--	Returns:
--		Nothing
--	Example:
--		LibQueue:ClearTimer("MyAddon_Timer");
--
-----------------
-- CreateDelay --
-----------------
--	Arguments:
--		string Name			Name of the delay object to make
--		number Time			Time to delay processing (seconds)
--		function Callback	Function to call when delay has completed
--		any Data			Data to pass to Callback function when called
--		AllowDuplicates		Allow multiple delays with this name?
--		AllowExtend			Allow subsequent calls of this delay to extend the time?
--		InCombat			If set to false, timer will be paused in combat
--	Description:
--		Creates a delay event, waits for given time and calls Callback(Data);
--		AllowDuplicates and AllowExtend will be ignored if AllowDuplicates is set to true.
--		Default behavior is AllowDuplicates=true, AllowExtend=false,InCombat=true
--
--		Remember that if an existing Delay is extended, all the original parameters are kept,
--		except the Time, which is replaced by the value you specified in this call.
--	Returns:
--		false = Delay not created
--		true = Delay created successfully or existing delay extended
--	Example:
--		function MyAddon_Func1(value)
--			print("Your lucky number is "..tostring(value));
--		end
--		success = LibQueue:CreateDelay("MyAddon_Delay1",5,MyAddon_Func1,10);
--		--After 5 seconds, outputs: Your lucky number is 10
--
------------------------
-- Supplemental Notes --
------------------------
--
-- * WHY? *
--
-- Why use timers and delays?  Why not handle everything as it is given to me?
-- Several times, some events are called multiple times successively, and the data isn't available
-- immediately.  BAG_UPDATE is a good example.  In this case, you can use a delay with AllowExtend
-- to wait to process the inventory of a character until after all bags have been processed.  This
-- reduces interface lag as well.  Bag inventory is not available until the last call of BAG_UPDATE
-- has fired, and if you may end up scanning the entire inventory multiple times.
--
-- In general, handling large amounts of data or doing lots of things at once will create lots of
-- Interface lag.  Using a timer, and adding a processing queue to your mod will decrease lag by
-- a noticeable amount if used properly, even in increments of 0.1 seconds.  When WoW is parsing
-- scripts, it can't update the screen effectively.  You may also use timers to ensure that large
-- or time-consuming sections of code aren't run multiple times when they don't need to be.
--
-- The delay is also a great way to make sure the client loads fully before initializing,
-- this eliminates the loading lag that people with lots of addons inevitably experience.
--
-- * QUEUES vs STACKS *
--
-- Queues and Stacks are advanced data storage structures that let you process information in a
-- more organized manner, and are extremely helpful for sorting algorithms and other types of
-- advanced data-handling procedures.  Below are pictorials to help you understand.
--
-- IN   -> QUEUE -> OUT
-- 12345   54321    12345
--
-- STACK <- IN 12345
-- 12345
-- STACK -> OUT 54321
--
-- * HOW TO CREATE AN ACTION PROCESSING QUEUE *
--
-- Create a queue, and use a timer to process the queue, pulling each value out and acting on it.
-- Add data to the queue as tables, or string values corresponding to psuedo commands, which you
-- process later in the timer callback.  You can even pass the Queue itself as data in the timer
-- function.  Processing the queue at intervals such as 0.05 or 0.1 will help reduce lag.
--
-- This can also help eliminate redundant actions, especailly screen updates, which can
-- exponentially increase your lag.
--
-- * HOW TO PASS DATA EFFECTIVELY *
--
-- The data you put in a Timer, Delay, or Queue isn't fixed in stone unless you want it to be.  If
-- you pass an existing value that you reference elsewhere, you can change the values in between
-- calls or before the event fires (like say, to cancel it from having an effect).  A good idea to
-- pass multiple types of data at once is to pass a table as well.
--
-- Remember, as long as the WoW client has some global variable referencing a table or value, that
-- table or value will never be destroyed.  You can pass pointers to existing tables into the timers
-- and the tables will still exist after the timer processes it.
--
-- * HOW TO USE MULTIPLE TIMERS/DELAYS EFFECTIVELY *
--
-- Timers or Delays can have multiples with the same name going at once.  With this system, you
-- can Pause/Start/Toggle all same-named timers at once, or ensure the same function is called
-- multiple times concurrently with different values.  Remember that the function called does not
-- correlate to the name, however.
--
-- * NAMING IS IMPORTANT *
--
-- Remember also that Timers and Delays are stored internally, and that you should apply
-- mod-specific naming conventions to identify your timers or delays.
-- Naming is also CASE SENSITIVE!
--
-- Queues are stored in your own global variables, and should have mod-specific naming anyway so
-- you don't risk it getting overwritten by another mod.
--
-- Ex. Don't call it QueueB, call it MyAddonName_QueueB
--
-- * COMBAT *
--
-- Timers or Delays that have InCombat set to false will still tick during combat, but processing
-- will be delayed until combat ends.
--
-- * YOU'RE NOT THINKING 4TH DIMENSIONALLY! *
--
-- Don't be like Marty, plan your code execution.  If you create two delays at the same time, and
-- the first one is extended, don't count on it having run already when the 2nd one fires.
-- Remember to be a responsible denizen of the 4th dimension, as well, bogging down the Queue
-- library with dozens of timers and delays will impact every other mod using it, combine what you
-- can.

assert(LibStub, "LibQueue requires LibStub")
local lib, oldminor;
lib, oldminor = LibStub:NewLibrary("LibQueue-1.0", 1)

if not lib then return end

-- First time here, all version 0 stuff
if LibQueue == nil then
    LibQueue=lib;
    LibQueue.Queue = {
        -- Queues are processed manually by the library user
        --AllowRecentDuplicates
        --AllowAnyDuplicates
        --IsStack
        --nMaxSize
        --nSize
        --pStart
        --pEnd
        --Buffer
    };
    LibQueue.Timer = {
        -- Timers count UP and execute INFINITELY
        --Name
        --Time
        --Throttle
        --AllowDuplicates
        --InCombat
        --Callback
        --Data
    };
    LibQueue.Delay = {
        -- Delays count DOWN and execute ONCE
        --Name
        --Time
        --AllowDuplicates
        --AllowExtend   -- Allows successive calls to extend the time, only if no duplicates
        --InCombat
        --Callback
        --Data
    };

    function LibQueue.OnUpdate(self,elapsed)
        local i,v;

        for i,v in pairs(LibQueue.Timer) do
            if (not v.Paused) or ((not v.InCombat) and InCombatLockdown())then
                v.Time = v.Time + elapsed;
                if v.Time >= v.Throttle then
                    v.Time = 0;
                    if type(v.Callback)=="function" then
                        v.Callback(v.Data);
                    end
                end
            end
        end

        for i,v in pairs(LibQueue.Delay) do
            if v.Time > 0 then
                v.Time = v.Time - elapsed;
                if v.Time < 0 then
                    v.Time = 0;
                end
                if (v.Time == 0) and not ((not v.InCombat) and InCombatLockdown()) then
                    -- Process delayed commands
                    if type(v.Callback)=="function" then
                        v.Callback(v.Data);
                         -- Destroy this data after we're done with it.
                         LibQueue.Delay[i]=nil;
                    end
                end
                v=nil;
            end
        end
    end

    function LibQueue:CreateTimer(Name,Time,Callback,Data,AllowDuplicates,InCombat)
        local ad = AllowDuplicates;
        local ic = InCombat;
        local i,v;
        local added=false;

        if ad == nil then
            ad = true;
        end
        if ic == nil then
            ic = true;
        end

        if type(Time)=="number" and Time <=0 then
            return false;
        end

        if type(Callback) ~= "function" then
            return false;
        end

        if type(Name) ~= "string" or Name=="" then
            return false;
        end

        for i,v in pairs(LibQueue.Timer) do
            if v.Name == Name then
                -- This already exists
                if not v.AllowDuplicates then
                    return false;
                end
                break;
            end
        end

        -- Add it here at the end
        v={
            Name=Name;
            Throttle=Time;
            Time=0;
            Callback=Callback;
            Data=Data;
            AllowDuplicates=ad;
            InCombat=ic;
        };
        tinsert(LibQueue.Timer,v);
        return true;
    end

    function LibQueue:CreateDelay(Name,Time,Callback,Data,AllowDuplicates,AllowExtend,InCombat)
        local ad = AllowDuplicates;
        local ae = AllowExtend;
        local ic = InCombat;
        local i,v;
        local added=false;

        if ad == nil then
            ad = true;
        end
        if ae == nil then
            ae = false;
        end
        if ic == nil then
            ic = true;
        end

        if type(Time)=="number" and Time <=0 then
            return false;
        end

        if type(Callback) ~= "function" then
            return false;
        end

        if type(Name) ~= "string" or Name=="" then
            return false;
        end

        for i,v in pairs(LibQueue.Delay) do
            if v.Name == Name then
                -- This already exists
                if not v.AllowDuplicates then
                    if not v.AllowExtend then
                        return false;
                    else
                        added=true;
                        --Extend the time frame to the last value specified and refresh data
                        v.Time=Time;
                    end
                end
                break;
            end
        end

        if not added then
            added=true;
            -- Add it here at the end
            v={
                Name=Name;
                Time=Time;
                Callback=Callback;
                Data=Data;
                AllowDuplicates=ad;
                AllowExtend=ae;
                InCombat=ic;
            };
            tinsert(LibQueue.Delay,v);
        end
        return added;
    end

    function LibQueue:StopTimer(name)
        local i,v;

        for i,v in pairs(LibQueue.Timer) do
            if v.Name==name then
                v.Paused=true;
            end
        end
    end

    function LibQueue:StartTimer(name)
        local i,v;

        for i,v in pairs(LibQueue.Timer) do
            if v.Name==name then
                v.Paused=false;
            end
        end
    end

    function LibQueue:ToggleTimer(name)
        local i,v;

        for i,v in pairs(LibQueue.Timer) do
            if v.Name==name then
                v.Paused=not v.Paused;
            end
        end
    end

    function LibQueue:ClearTimer(name)
        local i,v;

        for i,v in pairs(LibQueue.Timer) do
            if v.Name==name then
                LibQueue.Timer[i] = nil;
            end
        end
    end

    function LibQueue:CreateQueue(handle,MaxSize,AllowRecentDuplicates,AllowAnyDuplicates,IsStack)
        local r = false;
        local i,v;

        if handle == nil then
            return false;
        end

        if type(handle) == "table" then
            wipe(handle); -- Initialize the table

            handle.AllowRecentDuplicates = AllowRecentDuplicates;
            if handle.AllowRecentDuplicates==nil then
                handle.AllowRecentDuplicates=true;
            end
            handle.AllowAnyDuplicates = AllowAnyDuplicates;
            if handle.AllowAnyDuplicates==nil then
                handle.AllowAnyDuplicates=true;
            end
            handle.IsStack = IsStack;
            handle.nMaxSize = MaxSize;
            handle.nSize = 0; -- Current size of the buffer
            handle.pStart = 0; -- Start position (next in line), 0 means queue is empty
            handle.pEnd = 0; -- End position (last in line), ignored if queue is empty
            handle.Buffer = { }; -- Buffer to hold the queue

            r=true;
        end

        return r;
    end

    -- It'd be nice to access this functionality directly from the Queue object, but its important
    -- not to have the overhead of dozens of copies of these functions floating around the env.
    -- I was thinking a metatable, but I gave up looking into it for now, maybe later.

    function LibQueue:Compare(v1,v2)
        -- Simple table checking.
        local i,v,same;
        if (type(v1)=="table" and type(v2)=="table") then
            if #(v1) == #(v2) then
                same=true;
                for i,v in pairs(v1) do
                    if (v ~= v2[i]) then
                        same=false;
                        break;
                    end
                end
                return same;
            else
                return false;
            end
        else
            return (v1==v2);
        end
    end

    function LibQueue:Put(handle,value)
        local p = 0;
        local r,i,v;

        if (type(handle) ~= "table") or (type(handle.Buffer) ~= "table") then
            -- Not a valid queue
            return false;
        end

        if LibQueue:Size(handle)==handle.nMaxSize then
            -- full
            return false;
        end

        r=true;
        -- Duplicate checking
        if not handle.AllowAnyDuplicates then
            if not handle.AllowRecentDuplicates then
                if handle.pEnd > 0 then
                    if LibQueue:Compare(handle.Buffer[handle.pEnd],value) then
                        r=false;
                    end
                end
            else
                for i,v in pairs(handle.Buffer) do
                    if v==value then
                        r=false;
                        break;
                    end
                end
            end
        end
        if not r then
            return false;
        end

        r=false;
        if handle.pStart == 0 then
            -- queue is empty
            if handle.nSize == 0 then
                -- Table is empty, adding will add 1st element, so increase size
                handle.nSize = 1;
            end
            handle.pStart = 1;
            handle.pEnd = 1;
            handle.Buffer[1] = value;
            r=true;
        elseif handle.pEnd == handle.nSize then
            -- Queue reaches end of buffer
            if (handle.nSize < handle.nMaxSize) then
                -- still room to add, expand the buffer
                p=handle.nSize + 1;
                handle.nSize = p;
                handle.Buffer[p] = value;
                handle.pEnd = p;
                r=true;
            elseif (handle.pStart > 1) then
                -- Buffer is full, need to wrap
                p=1;
                handle.Buffer[p] = value;
                handle.pEnd = p;
                r=true;
            else
                -- Buffer is full, cannot wrap, data is discarded
                r=false;
            end
        elseif ((handle.pEnd >= handle.pStart) and (handle.pEnd < handle.nSize)) or
               (handle.pEnd < (handle.pStart - 1)) then
            -- Queue end is somewhere in the middle, and there is more room to add before wrap or start
            p=handle.pEnd+1;
            handle.Buffer[p] = value;
            handle.pEnd = p;
            r=true;
        else
            -- Queue is full, data is discarded
            r=false;
        end

        return r;
    end

    function LibQueue:Get(handle)
        local r;

        if (type(handle) ~= "table") or (type(handle.Buffer) ~= "table") then
            -- Not a valid queue
            return false;
        end

        if handle.pStart == 0 then
            -- List is empty
            return nil;
        end

        -- Get the next value
        if handle.IsStack then
            r=handle.Buffer[handle.pEnd];
            handle.Buffer[handle.pEnd] = 0; -- Initialize to 0 to clean up, while retaining the space
        else
            r=handle.Buffer[handle.pStart];
            handle.Buffer[handle.pStart] = 0; -- Initialize to 0 to clean up, while retaining the space
        end

        if handle.pStart == handle.pEnd then
            -- Last in queue
            handle.pStart = 0;
            handle.pEnd = 0;
        else
            -- Increment pointer
            if handle.IsStack then
                handle.pEnd=handle.pEnd -1;
                -- If we went past the end, wrap around
                if handle.pEnd == 0 then
                    handle.pEnd = handle.nSize;
                end
            else
                handle.pStart=handle.pStart+1;
                -- If we went past the end, wrap around
                if handle.pStart > handle.nSize then
                    handle.pStart = 1;
                end
            end
        end

        -- Pass the obtained value
        return r;
    end

    function LibQueue:Peek(handle,last)
        local r;

        if (type(handle) ~= "table") or (type(handle.Buffer) ~= "table") then
            -- Not a valid queue
            return false;
        end

        if handle.pStart == 0 then
            -- List is empty
            return nil;
        end

        -- Get the value requested
        if last or handle.IsStack then
            r=handle.Buffer[handle.pEnd];
        else
            r=handle.Buffer[handle.pStart];
        end

        -- Pass the obtained value
        return r;
    end

    function LibQueue:Size(handle)
        if (type(handle) ~= "table") or (type(handle.Buffer) ~= "table") then
            -- Not a valid queue
            return nil;
        end

        if handle.pStart == 0 then
            return 0,handle.nSize;
        elseif handle.pStart > handle.pEnd then
            return (handle.nSize - handle.pStart + 1 + handle.pEnd),handle.nSize;
        else
            -- Start <= End
            return (handle.pEnd - handle.pStart + 1),handle.nSize;
        end
    end

    function LibQueue:Wipe(handle,clearbuffer)
        if (type(handle) ~= "table") or (type(handle.Buffer) ~= "table") then
            -- Not a valid queue
            return;
        end

        handle.pStart = 0;
        handle.pEnd = 0;
        if clearbuffer then
            wipe(handle.Buffer);
            handle.nSize=0;
        end
    end

    -- Get the timer part rolling, have to do it after the OnUpdate function definition.
    LibQueueFrame = CreateFrame("Frame","LibQueueFrame");
    LibQueueFrame:SetScript("OnUpdate",LibQueue.OnUpdate);
end

oldminor = oldminor or 0;

-- Previous version checking here.
--if oldminor < 1 then
-- No magic needs to be done from 0 to 1, function definitions take care of themselves
--end
