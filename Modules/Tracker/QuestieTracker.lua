---@class QuestieTracker
local QuestieTracker = QuestieLoader:CreateModule("QuestieTracker")
-------------------------
--Import QuestieTracker modules.
-------------------------
---@type TrackerBaseFrame
local TrackerBaseFrame = QuestieLoader:ImportModule("TrackerBaseFrame")
---@type TrackerHeaderFrame
local TrackerHeaderFrame = QuestieLoader:ImportModule("TrackerHeaderFrame")
---@type TrackerQuestFrame
local TrackerQuestFrame = QuestieLoader:ImportModule("TrackerQuestFrame")
---@type TrackerLinePool
local TrackerLinePool = QuestieLoader:ImportModule("TrackerLinePool")
---@type TrackerFadeTicker
local TrackerFadeTicker = QuestieLoader:ImportModule("TrackerFadeTicker")
---@type TrackerQuestTimers
local TrackerQuestTimers = QuestieLoader:ImportModule("TrackerQuestTimers")
---@type TrackerUtils
local TrackerUtils = QuestieLoader:ImportModule("TrackerUtils")
-------------------------
--Import Questie modules.
-------------------------
---@type QuestieQuest
local QuestieQuest = QuestieLoader:ImportModule("QuestieQuest")
---@type QuestLogCache
local QuestLogCache = QuestieLoader:ImportModule("QuestLogCache")
---@type QuestieMap
local QuestieMap = QuestieLoader:ImportModule("QuestieMap")
---@type QuestieTooltips
local QuestieTooltips = QuestieLoader:ImportModule("QuestieTooltips")
---@type QuestieLib
local QuestieLib = QuestieLoader:ImportModule("QuestieLib")
---@type QuestiePlayer
local QuestiePlayer = QuestieLoader:ImportModule("QuestiePlayer")
---@type QuestieCombatQueue
local QuestieCombatQueue = QuestieLoader:ImportModule("QuestieCombatQueue")
---@type QuestEventHandler
local QuestEventHandler = QuestieLoader:ImportModule("QuestEventHandler")
local _QuestEventHandler = QuestEventHandler.private
---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")
---@type QuestieDebugOffer
local QuestieDebugOffer = QuestieLoader:ImportModule("QuestieDebugOffer")
---@type TomTomAuto
local TomTomAuto = QuestieLoader:ImportModule("TomTomAuto")

--- COMPATIBILITY ---
local C_Timer = QuestieCompat.C_Timer
local GetQuestLogTitle = QuestieCompat.GetQuestLogTitle
local GetQuestLogIndexByID = QuestieCompat.GetQuestLogIndexByID
local GetItemInfo = QuestieCompat.GetItemInfo

local LSM30 = LibStub("LibSharedMedia-3.0")

-- Local Vars
local trackerLineWidth = 0
local trackerMinLineWidth = 260
local trackerMarginRight = 30
local trackerMarginLeft = 14
local lastAQW = GetTime()
local lastTrackerUpdate = GetTime()
local lastAchieveId = GetTime()
local durabilityInitialPosition = { DurabilityFrame:GetPoint() }

local voiceOverInitialPosition
if VoiceOverFrame then
    voiceOverInitialPosition = { VoiceOverFrame:GetPoint() }
end

local questsWatched = GetNumQuestWatches()

local trackedAchievements
local trackedAchievementIds

if Questie.IsWotlk or QuestieCompat.Is335 then
    trackedAchievements = { GetTrackedAchievements() }
    trackedAchievementIds = {}
end

local isFirstRun = true
local allowFormattingUpdate = false
local trackerBaseFrame, trackerHeaderFrame, trackerQuestFrame
local QuestLogFrame = QuestLogExFrame or ClassicQuestLog or QuestLogFrame

function QuestieTracker.Initialize()
    if QuestieTracker.started then
        -- The Tracker was already initialized, so we don't need to do it again.
        Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieTracker] Already initialized, skipping")
        -- Questie:Print("[QuestieTracker] Already initialized") -- Removed to reduce login spam
        return
    end
    
    -- Ensure database is available
    if not Questie.db or not Questie.db.char or not Questie.db.profile then
        Questie:Error("[QuestieTracker] Database not initialized yet, cannot start tracker")
        Questie:Print("|cFFFF0000[QuestieTracker] ERROR: Database not initialized! Please /reload or restart WoW.|r")
        return
    end
    
    -- Questie:Print("[QuestieTracker] Starting initialization...") -- Removed to reduce login spam
    Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieTracker] Starting initialization")

    -- These values might also be accessed by other modules, so we need to make sure they exist. Even when the Tracker is disabled
    -- Also handle corrupted data by resetting to empty tables if the type is wrong
    if (not Questie.db.char.TrackerHiddenQuests) or (type(Questie.db.char.TrackerHiddenQuests) ~= "table") then
        Questie.db.char.TrackerHiddenQuests = {}
    end
    if (not Questie.db.char.TrackerHiddenObjectives) or (type(Questie.db.char.TrackerHiddenObjectives) ~= "table") then
        Questie.db.char.TrackerHiddenObjectives = {}
    end
    if (not Questie.db.char.TrackedQuests) or (type(Questie.db.char.TrackedQuests) ~= "table") then
        Questie.db.char.TrackedQuests = {}
    end
    if (not Questie.db.char.AutoUntrackedQuests) or (type(Questie.db.char.AutoUntrackedQuests) ~= "table") then
        Questie.db.char.AutoUntrackedQuests = {}
    end
    if (not Questie.db.char.collapsedZones) or (type(Questie.db.char.collapsedZones) ~= "table") then
        Questie.db.char.collapsedZones = {}
    end
    if (not Questie.db.char.minAllQuestsInZone) or (type(Questie.db.char.minAllQuestsInZone) ~= "table") then
        Questie.db.char.minAllQuestsInZone = {}
    end
    if (not Questie.db.char.collapsedQuests) or (type(Questie.db.char.collapsedQuests) ~= "table") then
        Questie.db.char.collapsedQuests = {}
    end
    if (not Questie.db.char.trackedAchievementIds) or (type(Questie.db.char.trackedAchievementIds) ~= "table") then
        Questie.db.char.trackedAchievementIds = {}
    end
    if (not Questie.db.profile.TrackerWidth) then
        Questie.db.profile.TrackerWidth = 0
    end
    if (not Questie.db.profile.TrackerHeight) then
        Questie.db.profile.TrackerHeight = 0
    end
    if (not Questie.db.profile.trackerSetpoint) then
        Questie.db.profile.trackerSetpoint = "TOPLEFT"
    end

    if (not Questie.db.profile.trackerEnabled) then
        -- The Tracker is disabled, no need to continue
        Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieTracker] Tracker disabled in profile, not initializing")
        Questie:Print("[QuestieTracker] Tracker is disabled in settings")
        return
    end
    
    -- Questie:Print("[QuestieTracker] Tracker enabled, initializing frames...") -- Removed to reduce login spam
    Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieTracker] Tracker enabled, continuing initialization")

    -- Initialize tracker frames with error handling
    local success, err
    
    success, err = pcall(function()
        trackerBaseFrame = TrackerBaseFrame.Initialize()
    end)
    if not success then
        Questie:Print("|cFFFF0000[QuestieTracker] ERROR: Failed to initialize base frame: " .. tostring(err) .. "|r")
        return
    end
    -- Questie:Print("[QuestieTracker] Base frame initialized") -- Removed to reduce login spam
    
    success, err = pcall(function()
        trackerHeaderFrame = TrackerHeaderFrame.Initialize(trackerBaseFrame)
    end)
    if not success then
        Questie:Print("|cFFFF0000[QuestieTracker] ERROR: Failed to initialize header frame: " .. tostring(err) .. "|r")
        return
    end
    -- Questie:Print("[QuestieTracker] Header frame initialized") -- Removed to reduce login spam
    
    success, err = pcall(function()
        trackerQuestFrame = TrackerQuestFrame.Initialize(trackerBaseFrame, trackerHeaderFrame)
    end)
    if not success then
        Questie:Print("|cFFFF0000[QuestieTracker] ERROR: Failed to initialize quest frame: " .. tostring(err) .. "|r")
        return
    end
    -- Questie:Print("[QuestieTracker] Quest frame initialized") -- Removed to reduce login spam

    if TomTom and Questie.db.profile.tomtomAutoTargetMode then
        success, err = pcall(function()
            TomTomAuto:StartTomTomAutoTracking()
        end)
        if not success then
            Questie:Print("|cFFFF0000[TomTom] ERROR: Failed to start TomTom Auto tracking: " .. tostring(err) .. "|r")
            return
        end
        Questie:Print("[TomTom] TomTom Auto tracking started")
    end

    -- Initialize tracker functions
    TrackerLinePool.Initialize(trackerQuestFrame)
    TrackerFadeTicker.Initialize(trackerBaseFrame, trackerHeaderFrame)
    QuestieTracker.started = true
    
    -- Questie:Print("|cFF00FF00[QuestieTracker] Initialization complete! Tracker started successfully.|r") -- Removed to reduce login spam
    Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieTracker] Initialization complete, tracker started")

    -- Initialize hooks
    QuestieTracker:HookBaseTracker()
    
    -- Force initial update to show tracker if there are quests
    C_Timer.After(0.5, function()
        QuestieTracker:Update()
    end)

    -- Insures all other data we're getting from other addons and WoW is loaded. There are edge
    -- cases where Questie loads too fast before everything else is available.
    -- IMPORTANT: This must run AFTER QuestieQuest:GetAllQuestIds() populates currentQuestlog
    
    -- Delay sync until quest log is populated
    -- Try multiple times to catch the quest log when it's ready
    C_Timer.After(0.5, function()
        QuestieTracker:SyncWatchedQuests()
    end)
    
    C_Timer.After(1.0, function()
        QuestieTracker:SyncWatchedQuests()
    end)

    C_Timer.After(1.5, function()
        -- Hide frames during startup
        if QuestieTracker.alreadyHooked then
            if Questie.db.profile.stickyDurabilityFrame then DurabilityFrame:Hide() end
            if TrackerUtils:IsVoiceOverLoaded() then VoiceOverFrame:Hide() end
        end

        -- Flip some Dugi Guides options to prevent weird behavior
        if IsAddOnLoaded("DugisGuideViewerZ") then
            -- Turns off "Show Quest Objectives - Display quest objectives in small/anchored frame instead of the watch frame"
            DugisGuideViewer:SetDB(false, 39) -- DGV_OBJECTIVECOUNTER

            -- Turns off "Auto Quest Tracking - Automatically add quest to the Objective Tracker on accept or objective update"
            DugisGuideViewer:SetDB(false, 78) -- DGV_AUTO_QUEST_TRACK

            -- Turns on "Clear Final Waypoint - Always clear the last waypoint on reach"
            DugisGuideViewer:SetDB(true, 1006) -- DGV_CLEAR_FINAL_WAYPOINT
        end

        -- Quest Focus Feature
        if Questie.db.char.TrackerFocus then
            local focusType = type(Questie.db.char.TrackerFocus)
            if focusType == "number" then
                TrackerUtils:FocusQuest(Questie.db.char.TrackerFocus)
                QuestieQuest:ToggleNotes(false)
            elseif focusType == "string" then
                local questId, objectiveIndex = string.match(Questie.db.char.TrackerFocus, "(%d+) (%d+)")
                TrackerUtils:FocusObjective(questId, objectiveIndex)
                QuestieQuest:ToggleNotes(false)
            end
        end

        QuestieCombatQueue:Queue(function()
            -- Hides tracker during a login or reloadUI
            if Questie.db.profile.hideTrackerInDungeons and IsInInstance() then
                QuestieTracker:Collapse()
            end

            -- Sync and populate the QuestieTracker - this should only run when a player has loaded
            -- Questie for the first time or when Re-enabling the QuestieTracker after it's disabled.

            -- Final sync attempt after everything is loaded
            QuestieTracker:SyncWatchedQuests()
            
            -- One more attempt a bit later
            C_Timer.After(1.0, function()
                QuestieTracker:SyncWatchedQuests()
            end)

            -- Look for any QuestID's that don't belong in the Questie.db.char.TrackedQuests or
            -- the Questie.db.char.AutoUntrackedQuests tables. They can get out of sync.
            -- Also ensure runtime stub quests aren't incorrectly untracked.
            -- IMPORTANT: Only clean up if quest log is populated, otherwise we'll wrongly remove valid entries
            local questLogCount = 0
            if QuestiePlayer and QuestiePlayer.currentQuestlog then
                for _ in pairs(QuestiePlayer.currentQuestlog) do
                    questLogCount = questLogCount + 1
                end
            end
            -- Quest log populated
            
            -- If AutoUntrackedQuests is empty but we have quests in the log, we need to populate it
            -- based on what was actually watched in Blizzard UI
            if Questie.db.profile.autoTrackQuests and questLogCount > 0 then
                if not Questie.db.char.AutoUntrackedQuests then
                    Questie.db.char.AutoUntrackedQuests = {}
                end
                
                -- Removed broken code that referenced undefined tempQuestIDs variable
                
                -- Now clean up AutoUntrackedQuests
                -- Clean up AutoUntrackedQuests
                local toRemove = {}
                local keepCount = 0
                for untrackedQuestId in pairs(Questie.db.char.AutoUntrackedQuests) do
                    if not QuestiePlayer.currentQuestlog[untrackedQuestId] then
                        -- Quest no longer in log, remove from untracked list
                        toRemove[untrackedQuestId] = true
                    else
                        -- Check if this is a runtime stub quest that shouldn't be untracked
                        local quest = QuestiePlayer.currentQuestlog[untrackedQuestId]
                        if quest and quest.__isRuntimeStub then
                            -- Runtime stub quests should be tracked by default when autoTrackQuests is on
                            -- BUT: Only re-track if this is the first time we're seeing this stub
                            -- Users should still be able to manually untrack stub quests
                            -- This is commented out to respect user choice
                            -- toRemove[untrackedQuestId] = true
                            Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker] Keeping runtime stub quest untracked per user choice:", untrackedQuestId)
                        end
                        -- Removed automatic re-tracking of Epoch quests (>= 26000)
                        -- Users should be able to untrack any quest they want
                    end
                end
                for questId in pairs(toRemove) do
                    Questie.db.char.AutoUntrackedQuests[questId] = nil
                    -- Removed from AutoUntrackedQuests
                end
                
                -- Count what's left
                local remaining = 0
                for k in pairs(Questie.db.char.AutoUntrackedQuests) do
                    remaining = remaining + 1
                end
                -- Cleanup complete
            end
            
            -- Clean up manual mode TrackedQuests  
            if not Questie.db.profile.autoTrackQuests and Questie.db.char.TrackedQuests and questLogCount > 0 then
                for trackedQuestId in pairs(Questie.db.char.TrackedQuests) do
                    if not QuestiePlayer.currentQuestlog[trackedQuestId] then
                        Questie.db.char.TrackedQuests[trackedQuestId] = nil
                    end
                end
            end

            -- The trackedAchievements variable is populated by GetTrackedAchievements(). If Questie
            -- is enabled, this will always return nil so we need to save it before we enable Questie.
            if Questie.IsWotlk or QuestieCompat.Is335 then
                if #trackedAchievements > 0 then
                    local tempAchieves = trackedAchievements

                    -- Remove achievement from the Blizzard Quest Watch and populate the tracker.
                    for _, achieveId in pairs(tempAchieves) do
                        if achieveId then
                            RemoveTrackedAchievement(achieveId)
                            Questie.db.char.trackedAchievementIds[achieveId] = true

                            if (not AchievementFrame) then
                                AchievementFrame_LoadUI()
                            end

                            AchievementFrameAchievements_ForceUpdate()
                        end
                    end
                end

                trackedAchievements = { GetTrackedAchievements() }
                WatchFrame_Update()

                -- Sync and populate QuestieTrackers achievement cache
                if Questie.db.char.trackedAchievementIds ~= trackedAchievementIds then
                    for achieveId in pairs(Questie.db.char.trackedAchievementIds) do
                        if Questie.db.char.trackedAchievementIds[achieveId] == true then
                            trackedAchievementIds[achieveId] = true
                        end
                    end
                end
            else
                QuestWatch_Update()
            end

            if QuestLogFrame:IsShown() then QuestLog_Update() end
            QuestieTracker:Update()
            -- Don't hide the tracker after initialization!
        end)
    end)
end

-- Track all quests in the quest log (used when autoTrackOnLogin is enabled)
function QuestieTracker:SyncAllQuests()
    if not Questie.db.profile.autoTrackQuests then
        return -- Only works in auto-track mode
    end
    
    -- Clear the untracked list to track everything
    Questie.db.char.AutoUntrackedQuests = {}
    
    -- Track all quests
    for questId, quest in pairs(QuestiePlayer.currentQuestlog or {}) do
        local questIndex = GetQuestLogIndexByID(questId)
        if questIndex and questIndex > 0 then
            if not IsQuestWatched(questIndex) then
                AddQuestWatch(questIndex)
            end
        end
    end
    
    -- Update tracker
    QuestieTracker:Update()
end

-- New function to sync watched quests - can be called multiple times
function QuestieTracker:SyncWatchedQuests()
    if not Questie.db.profile.autoTrackQuests then
        return -- Only needed in auto-track mode
    end
    
    -- Don't sync more than once per session
    if QuestieTracker._alreadySynced then
        return
    end
    
    -- Starting sync
    
    -- Force populate the quest log cache first
    if QuestLogCache and QuestLogCache.CheckForChanges then
        -- Force cache update
        QuestLogCache.CheckForChanges()
    end
    
    -- Then populate QuestiePlayer.currentQuestlog
    if QuestieQuest and QuestieQuest.GetAllQuestIds then
        -- Force quest log population
        QuestieQuest:GetAllQuestIds()
    end
    
    if not QuestiePlayer.currentQuestlog then
        -- Quest log not ready
        return -- Quest log not ready yet
    end
    
    -- Count quests in log
    local questCount = 0
    for _ in pairs(QuestiePlayer.currentQuestlog) do
        questCount = questCount + 1
    end
    
    -- Also check actual quest log entries
    local actualQuestCount = select(2, GetNumQuestLogEntries()) or 0
    
    -- Check quest counts
    
    -- If QuestiePlayer has significantly fewer quests than Blizzard, it's not ready
    if actualQuestCount > 10 and questCount < (actualQuestCount * 0.5) then
        -- Quest log not fully populated
        return
    end
    
    if questCount == 0 then
        return -- No quests to process
    end
    
    -- Processing quests
    
    -- Initialize AutoUntrackedQuests if needed
    if not Questie.db.char.AutoUntrackedQuests then
        Questie.db.char.AutoUntrackedQuests = {}
    end
    
    -- Remove quests no longer in log
    local toRemove = {}
    for questId in pairs(Questie.db.char.AutoUntrackedQuests) do
        if not QuestiePlayer.currentQuestlog[questId] then
            toRemove[questId] = true
        end
    end
    for questId in pairs(toRemove) do
        Questie.db.char.AutoUntrackedQuests[questId] = nil
        -- Removed from AutoUntrackedQuests
    end
    
    -- Track which quests Blizzard thinks are watched
    local blizzardWatched = {}
    local watchedCount = 0
    for i = 1, GetNumQuestLogEntries() do
        local _, _, _, isHeader, _, _, _, questId = GetQuestLogTitle(i)
        if not isHeader and questId and questId > 0 then
            if IsQuestWatched(i) then
                blizzardWatched[questId] = true
                watchedCount = watchedCount + 1
            end
        end
    end
    -- Blizzard watched count
    
    -- Check what's in AutoUntrackedQuests
    local untrackedCount = 0
    local untrackedList = {}
    for questId in pairs(Questie.db.char.AutoUntrackedQuests or {}) do
        if QuestiePlayer.currentQuestlog[questId] then
            untrackedCount = untrackedCount + 1
            table.insert(untrackedList, tostring(questId))
        end
    end
    -- Check AutoUntrackedQuests
    
    -- Check if we should auto-track all quests on login
    -- Only track all if: autoTrackOnLogin is enabled AND this is the first sync
    local shouldTrackAll = Questie.db.profile.autoTrackOnLogin and not QuestieTracker._hasEverSynced
    if shouldTrackAll then
        -- First sync with auto-track on login enabled - track all
    end
    
    -- Try to track all quests that should be tracked
    local successCount = 0
    local failCount = 0
    local failedQuests = {}
    local skippedCount = 0
    
    for questId, quest in pairs(QuestiePlayer.currentQuestlog) do
        -- On first sync, try to track everything
        -- On subsequent syncs, respect AutoUntrackedQuests
        local shouldSkip = (not shouldTrackAll) and Questie.db.char.AutoUntrackedQuests[questId]
        
        if shouldSkip then
            skippedCount = skippedCount + 1
            -- Skipping untracked quest
        else
            -- This quest should be tracked
            local questIndex = GetQuestLogIndexByID(questId)
            if questIndex and questIndex > 0 then
                if not IsQuestWatched(questIndex) then
                    -- Try to track it
                    -- Attempting to track quest
                    AddQuestWatch(questIndex)
                    
                    -- Check if it worked
                    if IsQuestWatched(questIndex) then
                        successCount = successCount + 1
                        -- Successfully tracked
                    else
                        failCount = failCount + 1
                        failedQuests[questId] = true
                        
                        -- Get quest details to understand why it failed
                        local title, level, tag, isHeader, isCollapsed, isComplete = GetQuestLogTitle(questIndex)
                        -- Failed to track quest
                        
                        -- Check objectives to see if they're malformed
                        local numObjectives = GetNumQuestLeaderBoards(questIndex)
                        -- Check objectives
                        for objIndex = 1, numObjectives do
                            local text, objectiveType, finished = GetQuestLogLeaderBoard(objIndex, questIndex)
                            if not text or text == "" then
                                -- Invalid objective
                            else
                                -- Valid objective
                            end
                        end
                        
                        -- Check if it's a runtime stub or Epoch quest
                        if quest and quest.__isRuntimeStub then
                            -- Runtime stub quest
                        end
                        if quest and quest.name and string.find(quest.name, "^%[Epoch%]") then
                            -- Epoch quest
                        end
                    end
                else
                    successCount = successCount + 1
                end
            else
                -- No valid index
            end
        end  -- end of shouldSkip check
    end
    
    -- Tracking complete
    if failCount > 0 then
        local failedList = {}
        for questId in pairs(failedQuests) do
            table.insert(failedList, tostring(questId))
        end
        -- Some quests failed to track
    end
    
    -- Mark sync as complete
    QuestieTracker._alreadySynced = true
    QuestieTracker._hasEverSynced = true  -- Persistent flag for this session
    -- Sync complete
    
    -- If AutoUntrackedQuests has very few entries compared to quest log, 
    -- it's likely corrupted or not properly initialized
    local untrackedCount = 0
    for _ in pairs(Questie.db.char.AutoUntrackedQuests) do
        untrackedCount = untrackedCount + 1
    end
    
    -- REMOVED: This logic was flawed - having all quests tracked is valid!
    -- Only reset if we just loaded and have NO data at all
    if false then  -- Disabled this broken reset logic
        -- Reset logic disabled
        
        -- Clear and rebuild AutoUntrackedQuests
        Questie.db.char.AutoUntrackedQuests = {}
        
        -- Mark MOST quests as untracked, but keep some tracked to show in tracker
        local trackedCount = 0
        local maxToTrack = math.min(5, questCount)  -- Track up to 5 quests
        
        for questId, quest in pairs(QuestiePlayer.currentQuestlog) do
            -- Check if quest is complete - always untrack complete quests
            local isComplete = false
            if quest and quest.IsComplete then
                isComplete = quest:IsComplete() == 1
            end
            
            -- Check if quest is untrackable
            local isUntrackable = QuestieTracker._untrackableQuests and QuestieTracker._untrackableQuests[questId]
            
            -- Track incomplete, trackable quests up to our limit
            if not isComplete and not isUntrackable and trackedCount < maxToTrack then
                -- This quest will be tracked (not in AutoUntrackedQuests)
                trackedCount = trackedCount + 1
                -- Keep tracked
            else
                -- Mark as untracked
                Questie.db.char.AutoUntrackedQuests[questId] = true
            end
        end
        
        -- Reset complete
    else
        -- AutoUntrackedQuests OK
    end
    
    QuestieTracker._alreadySynced = true
end

function QuestieTracker:CheckStatus()
    if not trackerBaseFrame then
        print("|cFFFF0000[Questie]|r Tracker not initialized!")
        return
    end
    
    local visible = trackerBaseFrame:IsShown()
    local point, relativeTo, relativePoint, xOfs, yOfs = trackerBaseFrame:GetPoint()
    local width = trackerBaseFrame:GetWidth()
    local height = trackerBaseFrame:GetHeight()
    
    print("|cFF00FF00[Questie]|r Tracker Status:")
    print("  Visible: " .. tostring(visible))
    print("  Position: " .. (point or "nil") .. " x:" .. (xOfs or 0) .. " y:" .. (yOfs or 0))
    print("  Size: " .. width .. "x" .. height)
    print("  Quest count: " .. tostring(GetNumQuestLogEntries()) .. " in log")
    
    local tracked = 0
    if QuestiePlayer.currentQuestlog then
        for questId, quest in pairs(QuestiePlayer.currentQuestlog) do
            if type(quest) == "table" then
                local isUntracked = Questie.db.char.AutoUntrackedQuests and Questie.db.char.AutoUntrackedQuests[questId]
                if not isUntracked then
                    tracked = tracked + 1
                end
            end
        end
    end
    print("  Tracked: " .. tracked .. " quests")
end

function QuestieTracker:ForceScanQuests()
    print("|cFF00FF00[Questie]|r Force scanning all quests...")
    
    -- Clear and rebuild the cache from scratch
    local cache = QuestLogCache.questLog_DO_NOT_MODIFY
    
    -- Clear existing cache
    for k in pairs(cache) do
        cache[k] = nil
    end
    
    local count = 0
    local questList = {}
    
    -- Scan all quests in the quest log
    for i = 1, GetNumQuestLogEntries() do
        local title, level, questTag, isHeader, isCollapsed, isComplete, frequency, questId = GetQuestLogTitle(i)
        if not isHeader and questId and questId > 0 then
            -- Get objectives for this quest
            local objectives = {}
            SelectQuestLogEntry(i)
            local numObjectives = GetNumQuestLeaderBoards(i)
            
            if numObjectives and numObjectives > 0 then
                for objIndex = 1, numObjectives do
                    local description, objectiveType, isCompleted = GetQuestLogLeaderBoard(objIndex, i)
                    if description then
                        objectives[objIndex] = {
                            description = description,
                            type = objectiveType,
                            finished = isCompleted,
                            numFulfilled = 0,
                            numRequired = 0,
                        }
                    end
                end
            end
            
            cache[questId] = {
                title = title,
                level = level,
                questTag = questTag,
                isComplete = isComplete,
                objectives = objectives,
            }
            count = count + 1
            table.insert(questList, questId .. ":" .. (title or "Unknown"))
        end
    end
    
    print("|cFF00FF00[Questie]|r Added " .. count .. " quests to cache:")
    for _, info in ipairs(questList) do
        print("  " .. info)
    end
    
    -- Now rebuild currentQuestlog
    QuestieQuest:GetAllQuestIds()
    
    -- Check what's in currentQuestlog
    local logCount = 0
    for _ in pairs(QuestiePlayer.currentQuestlog) do
        logCount = logCount + 1
    end
    print("|cFF00FF00[Questie]|r currentQuestlog now has " .. logCount .. " quests")
    
    -- Force update
    QuestieTracker:Update()
    
    print("|cFF00FF00[Questie]|r Force scan complete")
end

function QuestieTracker:ForceShow()
    if not trackerBaseFrame then
        print("|cFFFF0000[Questie]|r Tracker not initialized!")
        return
    end
    
    print("|cFF00FF00[Questie]|r Forcing tracker to show...")
    
    -- Debug: Check what quests we have
    local questCount = 0
    local trackedCount = 0
    if QuestiePlayer.currentQuestlog then
        for questId, quest in pairs(QuestiePlayer.currentQuestlog) do
            questCount = questCount + 1
            if type(quest) == "table" then
                local isUntracked = Questie.db.char.AutoUntrackedQuests and Questie.db.char.AutoUntrackedQuests[questId]
                if not isUntracked then
                    trackedCount = trackedCount + 1
                    print("  Tracking quest " .. questId .. ": " .. (quest.name or "Unknown"))
                end
            end
        end
    end
    print("|cFF00FF00[Questie]|r Found " .. questCount .. " quests, " .. trackedCount .. " tracked")
    
    -- Force show the frame
    trackerBaseFrame:Show()
    trackerBaseFrame:SetSize(200, 400)  -- Set a reasonable size
    
    -- Check if header frame exists
    if trackerHeaderFrame then
        trackerHeaderFrame:Show()
        print("|cFF00FF00[Questie]|r Header frame shown")
    else
        print("|cFFFF0000[Questie]|r No header frame!")
    end
    
    -- Force update
    print("|cFF00FF00[Questie]|r Calling Update()...")
    QuestieTracker:Update()
    
    -- Check status after update
    C_Timer.After(0.1, function()
        print("|cFF00FF00[Questie]|r After forcing:")
        print("  Visible: " .. tostring(trackerBaseFrame:IsShown()))
        print("  Size: " .. trackerBaseFrame:GetWidth() .. "x" .. trackerBaseFrame:GetHeight())
        
        -- Check line pool
        if TrackerLinePool then
            local lineCount = TrackerLinePool.GetCurrentLine and TrackerLinePool.GetCurrentLine() or 0
            print("  Line pool has " .. tostring(lineCount) .. " lines")
        end
    end)
end

function QuestieTracker:ResetLocation()
    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:ResetLocation]")
    trackerHeaderFrame.trackedQuests:SetMode(1) -- maximized
    Questie.db.char.isTrackerExpanded = true
    Questie.db.char.AutoUntrackedQuests = {}
    Questie.db.profile.TrackerLocation = nil
    Questie.db.char.collapsedQuests = {}
    Questie.db.char.collapsedZones = {}
    Questie.db.profile.TrackerWidth = 0
    Questie.db.profile.TrackerHeight = 0

    trackerBaseFrame:SetSize(25, 25)
    TrackerBaseFrame:SetSafePoint()

    QuestieTracker:Update()
end

function QuestieTracker:ResetDurabilityFrame()
    if durabilityInitialPosition then
        -- Only reset if it's been moved from it's default position set by Blizzard
        if durabilityInitialPosition ~= { DurabilityFrame:GetPoint() } then
            Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:ResetDurabilityFrame]")

            -- Resets Durability Frame back to it's default position
            DurabilityFrame:ClearAllPoints()
            DurabilityFrame:SetPoint(unpack(durabilityInitialPosition))

            local numAlerts = 0

            for i = 1, #INVENTORY_ALERT_STATUS_SLOTS do
                if GetInventoryAlertStatus(i) > 0 then
                    numAlerts = numAlerts + 1
                end
            end

            -- Check the alert status and reset visibility
            if numAlerts > 0 then
                DurabilityFrame:Show()
            else
                if DurabilityFrame:IsShown() then
                    DurabilityFrame:Hide()
                end
            end
        end
    end
end

function QuestieTracker:UpdateDurabilityFrame()
    if QuestieTracker.started and Questie.db.profile.trackerEnabled and Questie.db.profile.stickyDurabilityFrame then
        if Questie.db.char.isTrackerExpanded and QuestieTracker:HasQuest() then
            local numAlerts = 0

            for i = 1, #INVENTORY_ALERT_STATUS_SLOTS do
                if GetInventoryAlertStatus(i) > 0 then
                    numAlerts = numAlerts + 1
                end
            end

            if numAlerts > 0 then
                -- screen width accounting for scale
                local screenWidth = GetScreenWidth() * UIParent:GetEffectiveScale()
                -- middle of the frame, first return is x value, second return is the y value
                local trackerFrameX = trackerBaseFrame:GetCenter()

                DurabilityFrame:ClearAllPoints()
                DurabilityFrame:SetClampedToScreen(true)
                DurabilityFrame:SetFrameStrata("MEDIUM")
                DurabilityFrame:SetFrameLevel(0)

                if trackerFrameX <= (screenWidth / 2) then
                    DurabilityFrame:SetPoint("LEFT", trackerBaseFrame, "TOPRIGHT", 0, -40)
                else
                    DurabilityFrame:SetPoint("RIGHT", trackerBaseFrame, "TOPLEFT", 0, -40)
                end

                DurabilityFrame:Show()
            else
                if DurabilityFrame:IsShown() then
                    DurabilityFrame:Hide()
                end
            end

            if TrackerBaseFrame.isSizing == true or TrackerBaseFrame.isMoving == true then
                Questie:Debug(Questie.DEBUG_SPAM, "[QuestieTracker:UpdateDurabilityFrame]")
            else
                Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:UpdateDurabilityFrame]")
            end
        else
            QuestieTracker:ResetDurabilityFrame()
        end
    end
end

function QuestieTracker:ResetVoiceOverFrame()
    if voiceOverInitialPosition then
        if voiceOverInitialPosition ~= { VoiceOverFrame:GetPoint() } then
            Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:ResetVoiceOverFrame]")

            VoiceOverFrame:ClearAllPoints()
            VoiceOverFrame:SetPoint(unpack(voiceOverInitialPosition))

            VoiceOverFrame:SetClampedToScreen(true)
            VoiceOverFrame:SetFrameStrata("MEDIUM")
            VoiceOverFrame:SetFrameLevel(0)
            VoiceOver.Addon.db.profile.SoundQueueUI.LockFrame = false
            VoiceOver.SoundQueueUI:RefreshConfig()

            if VoiceOverFrame:IsShown() then
                VoiceOver.SoundQueue:RemoveAllSoundsFromQueue()
                VoiceOverFrame:Hide()
            end
        end
    end
end

function QuestieTracker:UpdateVoiceOverFrame()
    if TrackerUtils:IsVoiceOverLoaded() then
        if QuestieTracker.started and Questie.db.profile.trackerEnabled and Questie.db.profile.stickyVoiceOverFrame then
            if Questie.db.char.isTrackerExpanded and QuestieTracker:HasQuest() then
                -- screen width accounting for scale
                local screenWidth = GetScreenWidth() * UIParent:GetEffectiveScale()
                -- middle of the frame, first return is x value, second return is the y value
                local trackerFrameX = trackerBaseFrame:GetCenter()

                VoiceOverFrame:SetClampedToScreen(true)
                VoiceOverFrame:SetFrameStrata("MEDIUM")
                VoiceOverFrame:SetFrameLevel(0)

                local verticalOffSet

                if Questie.db.profile.stickyDurabilityFrame then
                    if DurabilityFrame:IsVisible() then
                        verticalOffSet = -125
                    else
                        verticalOffSet = -7
                    end
                end

                if trackerFrameX <= (screenWidth / 2) then
                    VoiceOverFrame:ClearAllPoints()
                    VoiceOverFrame:SetPoint("TOPLEFT", trackerBaseFrame, "TOPRIGHT", 15, verticalOffSet)
                else
                    VoiceOverFrame:ClearAllPoints()
                    VoiceOverFrame:SetPoint("TOPRIGHT", trackerBaseFrame, "TOPLEFT", -15, verticalOffSet)
                end

                VoiceOverFrame:SetWidth(500)
                VoiceOverFrame:SetHeight(120)
                VoiceOver.Addon.db.profile.SoundQueueUI.LockFrame = true
                VoiceOver.SoundQueueUI:RefreshConfig()
                VoiceOver.SoundQueueUI:UpdateSoundQueueDisplay()

                if TrackerBaseFrame.isSizing == true or TrackerBaseFrame.isMoving == true then
                    Questie:Debug(Questie.DEBUG_SPAM, "[QuestieTracker:UpdateVoiceOverFrame]")
                else
                    Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:UpdateVoiceOverFrame]")
                end
            else
                QuestieTracker:ResetVoiceOverFrame()
            end
        end
    end
end

-- If the player loots a "Quest Item" then this triggers a Tracker Update so the
-- Quest Item Button can be switched on and appear in the tracker.
---@param text string
function QuestieTracker:QuestItemLooted(text)
    -- TEMPORARILY DISABLED: This function is causing tracker state issues
    -- When looting quest items (like bananas), it triggers UpdateAllQuests which
    -- somehow toggles quest tracking state. Needs investigation.
    return
    
    --[[
    local playerLoot = strmatch(text, "You receive ") or strmatch(text, "You create")
    local itemId = tonumber(string.match(text, "item:(%d+)"))

    if playerLoot and itemId then
        local itemName, _, _, _, _, itemType, _, _, _, _, _, classID = GetItemInfo(itemId)
        local usableItem = TrackerUtils:IsQuestItemUsable(itemId)

        if (itemType == "Quest" or classID == 12 or QuestieDB.QueryItemSingle(itemId, "class") == 12) and usableItem then
            Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker] - Quest Item Detected (itemId) - ", itemId)

            C_Timer.After(0.25, function()
                _QuestEventHandler:UpdateAllQuests()
                Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker] - Callback --> QuestEventHandler:UpdateAllQuests()")
            end)

            QuestieCombatQueue:Queue(function()
                C_Timer.After(0.5, function()
                    QuestieTracker:Update()
                end)
            end)
        end
    end
    --]]
end

function QuestieTracker:HasQuest()
    local hasQuest = false
    
    -- Check if we have any tracked quests in our actual tracking lists
    -- This is more reliable than GetNumQuestWatches which may not be updated yet
    if Questie.db.profile.autoTrackQuests then
        -- In auto-track mode, check if we have quests that aren't untracked
        for questId in pairs(QuestiePlayer.currentQuestlog or {}) do
            if not (Questie.db.char.AutoUntrackedQuests and Questie.db.char.AutoUntrackedQuests[questId]) then
                hasQuest = true
                break
            end
        end
    else
        -- In manual tracking mode, check if we have any tracked quests
        if Questie.db.char.TrackedQuests then
            for questId in pairs(Questie.db.char.TrackedQuests) do
                if QuestiePlayer.currentQuestlog[questId] then
                    hasQuest = true
                    break
                end
            end
        end
    end
    
    -- If we still haven't found a quest, fall back to the old method
    if not hasQuest then
        if (GetNumQuestWatches(true) > 0) then
            hasQuest = true
        elseif Questie.IsWotlk or QuestieCompat.Is335 then
            if (GetNumTrackedAchievements(true) > 0) then
                hasQuest = true
            end
        end
    end
    
    -- Handle completed quests visibility
    if hasQuest and not Questie.db.profile.trackerShowCompleteQuests then
        local hasIncompleteQuest = false
        if Questie.db.profile.autoTrackQuests then
            for questId, quest in pairs(QuestiePlayer.currentQuestlog or {}) do
                if not (Questie.db.char.AutoUntrackedQuests and Questie.db.char.AutoUntrackedQuests[questId]) then
                    if quest and quest.IsComplete and quest:IsComplete() ~= 1 then
                        hasIncompleteQuest = true
                        break
                    end
                end
            end
        else
            for questId in pairs(Questie.db.char.TrackedQuests or {}) do
                local quest = QuestiePlayer.currentQuestlog[questId]
                if quest and quest.IsComplete and quest:IsComplete() ~= 1 then
                    hasIncompleteQuest = true
                    break
                end
            end
        end
        hasQuest = hasIncompleteQuest
    end

    Questie:Debug(Questie.DEBUG_SPAM, "[QuestieTracker:HasQuest] - ", hasQuest)
    return hasQuest
end

function QuestieTracker:ForceShow()
    -- Force the tracker to show when we know we have quests
    if trackerBaseFrame and not trackerBaseFrame:IsShown() then
        if QuestieTracker:HasQuest() then
            trackerBaseFrame:Show()
            Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker] Force showing tracker")
        end
    end
end

function QuestieTracker:Enable()
    -- Update the questsWatched var before we re-enable
    if questsWatched == 0 then
        questsWatched = GetNumQuestWatches()
    end

    Questie.db.profile.trackerEnabled = true
    QuestieTracker.started = false
    QuestieTracker.Initialize()
    ReloadUI()
end

function QuestieTracker:Disable()
    Questie.db.profile.trackerEnabled = false
    QuestieTracker:ResetDurabilityFrame()
    QuestieTracker:ResetVoiceOverFrame()
    Questie.db.char.TrackedQuests = {}
    Questie.db.char.AutoUntrackedQuests = {}

    if Questie.IsWotlk or QuestieCompat.Is335 then
        Questie.db.char.trackedAchievementIds = {}
        trackedAchievementIds = {}
    end

    QuestieTracker:Unhook()
    QuestieTracker:Update()
    ReloadUI()
end

-- Function for the Slash handler
function QuestieTracker:Toggle()
    if Questie.db.profile.trackerEnabled then
        Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:Toggle] - Tracker Disabled.")
        Questie.db.profile.trackerEnabled = false
    else
        Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:Toggle] - Tracker Enabled.")
        Questie.db.profile.trackerEnabled = true
    end
    QuestieTracker:Update()
end

-- Minimizes the QuestieTracker
function QuestieTracker:Collapse()
    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:Collapse]")
    if trackerHeaderFrame and trackerHeaderFrame.trackedQuests and Questie.db.char.isTrackerExpanded then
        trackerHeaderFrame.trackedQuests:Click()
        QuestieTracker:Update()
    end
end

-- Maximizes the QuestieTracker
function QuestieTracker:Expand()
    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:Expand]")
    if trackerHeaderFrame and trackerHeaderFrame.trackedQuests and (not Questie.db.char.isTrackerExpanded) then
        trackerHeaderFrame.trackedQuests:Click()
        QuestieTracker:Update()
    end
end

function QuestieTracker:Update()
    -- Prevents calling the tracker too often, especially when the QuestieCombatQueue empties after combat ends
    local now = GetTime()
    if (not QuestieTracker.started) or InCombatLockdown() or (now - lastTrackerUpdate) < 0.1 then
        return
    end

    lastTrackerUpdate = now

    -- Tracker has started but not enabled, hide the frames
    if (not Questie.db.profile.trackerEnabled or QuestieTracker.disableHooks == true) then
        if trackerBaseFrame and trackerBaseFrame:IsShown() then
            QuestieCombatQueue:Queue(function()
                if Questie.db.profile.stickyDurabilityFrame then
                    QuestieTracker:ResetDurabilityFrame()
                end

                if Questie.db.profile.stickyVoiceOverFrame then
                    QuestieTracker:ResetVoiceOverFrame()
                end

                trackerBaseFrame:Hide()
            end)
        end
        return
    end

    if TrackerBaseFrame.isSizing == true or TrackerBaseFrame.isMoving == true or TrackerUtils.FilterProximityTimer == true then
        Questie:Debug(Questie.DEBUG_SPAM, "[QuestieTracker:Update]")
    else
        Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:Update]")
    end

    TrackerHeaderFrame:Update()
    TrackerQuestFrame:Update()
    TrackerBaseFrame:Update()
    TrackerLinePool.ResetLinesForChange()
    TrackerLinePool.ResetButtonsForChange()

    -- This is needed so the Tracker can also decrease its width
    trackerLineWidth = 0

    -- Setup local QuestieTracker:Update vars
    local trackerFontSizeZone = Questie.db.profile.trackerFontSizeZone
    local trackerFontSizeQuest = Questie.db.profile.trackerFontSizeQuest
    local questMarginLeft = (trackerMarginLeft + trackerMarginRight) - (18 - trackerFontSizeQuest)
    local objectiveMarginLeft = questMarginLeft + trackerFontSizeQuest
    local questItemButtonSize = 12 + trackerFontSizeQuest
    local objectiveColor = Questie.db.profile.trackerColorObjectives

    local line

    local sortedQuestIds, questDetails = TrackerUtils:GetSortedQuestIds()

    local firstQuestInZone = false
    local zoneCheck

    local primaryButton = false
    local secondaryButton = false
    local secondaryButtonAlpha

    -- Begin populating the Tracker with Quests
    local _UpdateQuests = function()
        
        for _, questId in pairs(sortedQuestIds) do
            if not questId then break end

            local quest = questDetails[questId].quest
            -- Check if quest has IsComplete method (defensive check for malformed quests)
            if not quest or type(quest) ~= "table" or not quest.IsComplete then
                Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieTracker] Skipping malformed quest:", questId)
                break
            end
            local complete = quest:IsComplete()
            local zoneName = questDetails[questId].zoneName
            local remainingSeconds = TrackerQuestTimers:GetRemainingTime(quest, nil, true)
            local timedQuest = (quest.trackTimedQuest or quest.timedBlizzardQuest)
            
            if (complete ~= 1 or Questie.db.profile.trackerShowCompleteQuests or timedQuest)
                and ((Questie.db.profile.autoTrackQuests and not Questie.db.char.AutoUntrackedQuests[questId])
                or (not Questie.db.profile.autoTrackQuests and Questie.db.char.TrackedQuests[questId])) then
                -- Add Quest Zones
                if zoneCheck ~= zoneName then
                    firstQuestInZone = true
                end

                if firstQuestInZone then
                    -- Skip creating zone headers if user has disabled them
                    if Questie.db.profile.trackerHideZoneHeaders then
                        -- Don't create zone header, just mark that we've handled this zone
                        firstQuestInZone = false
                    else
                        -- Get first line in linePool
                        line = TrackerLinePool.GetNextLine()

                        -- Safety check - make sure we didn't run over our linePool limit.
                        if not line then break end

                        -- Set Line Mode, Types, Clickers
                        line:SetMode("zone")
                        line:SetZone(zoneName)
                        line.expandQuest:Hide()
                        line.criteriaMark:Hide()
                        line.playButton:Hide()

                        -- Setup Zone Label
                        line.label:ClearAllPoints()
                        line.label:SetPoint("TOPLEFT", line, "TOPLEFT", 0, 0)

                        -- Set Zone Title and default Min/Max states
                        if Questie.db.char.collapsedZones[zoneName] then
                            line.expandZone:SetMode(0)
                        line.label:SetText("|cFFC0C0C0" .. l10n(zoneName) .. " +|r")
                    else
                        line.expandZone:SetMode(1)
                        line.label:SetText("|cFFC0C0C0" .. l10n(zoneName) .. "|r")
                    end

                    -- Checks the minAllQuestsInZone[zone] table and if empty, zero out the table.
                    if Questie.db.char.minAllQuestsInZone[zoneName] ~= nil and not Questie.db.char.minAllQuestsInZone[zoneName].isTrue and not Questie.db.char.collapsedZones[zoneName] then
                        local minQuestIdCount = 0
                        for minQuestId, _ in pairs(Questie.db.char.minAllQuestsInZone[zoneName]) do
                            if type(minQuestId) == "number" then
                                minQuestIdCount = minQuestIdCount + 1
                            end
                        end

                        if minQuestIdCount == 0 then
                            Questie.db.char.minAllQuestsInZone[zoneName] = nil
                        end
                    end

                    -- Check and measure Zone Label text width and update tracker width
                    QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + trackerMarginLeft + trackerMarginRight)

                    -- Set Zone Label and Line widths
                    line.label:SetWidth(trackerBaseFrame:GetWidth() - trackerMarginLeft - trackerMarginRight)
                    line:SetWidth(line.label:GetWidth())

                    -- Compare largest text Label in the tracker with current Label, then save widest width
                    trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + trackerMarginLeft)

                    -- Setup Min/Max Button
                    line.expandZone:ClearAllPoints()
                    line.expandZone:SetPoint("TOPLEFT", line, "TOPLEFT", 0, 0)
                    line.expandZone:SetWidth(line.label:GetWidth())
                    line.expandZone:SetHeight(line.label:GetHeight())
                    line.expandZone:Show()

                    -- Adds 4 pixels between Zone and first Quest Title
                    line:SetHeight(line.label:GetHeight() + 4)

                    -- Set Zone states
                    line:Show()
                    line.label:Show()
                    line.Quest = nil
                    line.Objective = nil
                    firstQuestInZone = false
                    zoneCheck = zoneName
                    end -- Close the else block for zone header creation
                end

                -- Add quest
                if (not Questie.db.char.collapsedZones[zoneName]) then
                    -- Get next line in linePool
                    line = TrackerLinePool.GetNextLine()

                    -- Safety check - make sure we didn't run over our linePool limit.
                    if not line then break end

                    -- Set Line Mode, Types, Clickers
                    line:SetMode("quest")
                    line:SetOnClick("quest")
                    line:SetQuest(quest)
                    line:SetObjective(nil)
                    line.expandZone:Hide()
                    line.criteriaMark:Hide()

                    -- Set Min/Max Button and default states
                    line.expandQuest:SetPoint("TOPRIGHT", line, "TOPLEFT", questMarginLeft - 8, 1)
                    line.expandQuest.zoneId = zoneName


                    -- Set Completion Text
                    local completionText = TrackerUtils:GetCompletionText(quest)

                    -- Clear Blizzard Completion Text
                    if ((Questie.db.profile.hideBlizzardCompletionText or objectiveColor == "minimal") and not timedQuest) or complete == -1 then
                        completionText = nil
                    end

                    -- This removes any blank lines from Completion Text
                    if completionText ~= nil then
                        if strfind(completionText, "\r\n") then
                            completionText = completionText:gsub("\r\n", "")
                        else
                            completionText = completionText:gsub("(.\r?\n?)\r?\n?", "%1")
                        end

                        -- Completion Text should always be green
                        completionText = "|cFF4CFF4C" .. completionText
                    end

                    -- Set minimizable quest flag
                    local isMinimizable = (complete == 1 or (#quest.Objectives == 0 and quest.isComplete == true)) and completionText == nil

                    -- Handles the collapseCompletedQuests option from the Questie Config --> Tracker options.
                    if Questie.db.profile.collapseCompletedQuests and isMinimizable and not timedQuest then
                        if not Questie.db.char.collapsedQuests[quest.Id] then
                            Questie.db.char.collapsedQuests[quest.Id] = true
                        end
                    else
                        -- The minAllQuestsInZone table is always blank until a player Shift+Clicks the Zone header (MouseDown).
                        -- QuestieTracker:Update is triggered and the table is then filled with all Quest ID's in the same Zone.
                        if Questie.db.char.minAllQuestsInZone[zoneName] ~= nil and Questie.db.char.minAllQuestsInZone[zoneName].isTrue then
                            Questie.db.char.minAllQuestsInZone[zoneName][quest.Id] = true
                        end

                        -- Handles all the Min/Max behavior individually for each quest.
                        if Questie.db.char.collapsedQuests[quest.Id] then
                            line.expandQuest:SetMode(0)
                        else
                            line.expandQuest:SetMode(1)
                        end
                    end

                    -- Setup Quest Label
                    line.label:ClearAllPoints()
                    line.label:SetPoint("TOPLEFT", line, "TOPLEFT", questMarginLeft, 0)

                    -- Set Quest Title - This handles the "Auto Minimize Completed Quests" option but we don't auto-minimize timed quests.
                    local coloredQuestName

                    if timedQuest then
                        coloredQuestName = QuestieLib:GetColoredQuestName(quest.Id, Questie.db.profile.trackerShowQuestLevel, false, false)
                    else
                        coloredQuestName = QuestieLib:GetColoredQuestName(quest.Id, Questie.db.profile.trackerShowQuestLevel, (Questie.db.profile.collapseCompletedQuests and isMinimizable), false)
                    end

                    line.label:SetText(coloredQuestName)

                    -- Check and measure Quest Label text width and update tracker width
                    QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + questMarginLeft + trackerMarginRight)

                    -- Set Quest Label and Line widths
                    line.label:SetWidth(trackerBaseFrame:GetWidth() - questMarginLeft - trackerMarginRight)
                    line:SetWidth(line.label:GetWidth() + questMarginLeft)

                    -- Compare largest text Label in the tracker with current Label, then save widest width
                    trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + questMarginLeft)

                    -- Adds 4 pixels between Quest Title and first Objective
                    line:SetHeight(line.label:GetHeight() + 4)

                    -- Adds the AI_VoiceOver Play Buttons
                    line.playButton:SetPlayButton(questId)

                    local usableQIB = false
                    local sourceItemId = QuestieDB.QueryQuestSingle(quest.Id, "sourceItemId")
                    local sourceItem = sourceItemId and TrackerUtils:IsQuestItemUsable(sourceItemId)
                    local requiredItems = quest.requiredSourceItems
                    local requiredItem = requiredItems and TrackerUtils:IsQuestItemUsable(requiredItems[1])
                    local isComplete = (quest.isComplete ~= true and #quest.Objectives == 0) or quest.isComplete == true

                    -- Occasionally a quest will be in a complete state and still have a usable Quest Item. Sometimes these usable
                    -- items spawn an NPC that is needed to finish the quest. Or an item that teleports you to the quest finisher.
                    if complete == 1 and isComplete and (sourceItem or requiredItem) then
                        -- This shows QIB's for Quest Itmes that are needed after a quest is complete with objectives
                        if sourceItemId > 1 and requiredItem and sourceItemId ~= requiredItems[1] then
                            quest.sourceItemId = 0
                            usableQIB = true
                        end

                        -- This shows QIB's for Quest Items that are needed after a quest is complete without objectives
                        if sourceItemId > 1 and not requiredItem and quest.isComplete ~= true then
                            usableQIB = true
                        end
                    end

                    -- Adds the primary Quest Item button
                    if complete ~= 1 and (sourceItem or (requiredItems and #requiredItems == 1 and requiredItem)) or usableQIB then
                        -- Get button from buttonPool
                        local button = TrackerLinePool.GetNextItemButton()
                        if not button then break end -- stop populating the tracker

                        -- Get and save Quest Title linePool to buttonPool
                        button.line = line

                        -- Setup button and set attributes
                        if button:SetItem(quest, "primary", questItemButtonSize) then
                            local height = 0
                            local frame = button.line
                            while frame and frame ~= trackerQuestFrame do
                                local _, parent, _, _, yOff = frame:GetPoint()
                                height = height - (frame:GetHeight() - yOff)
                                frame = parent
                            end

                            -- If the Quest is minimized show the Expand Quest button
                            if Questie.db.char.collapsedQuests[quest.Id] then
                                if Questie.db.profile.collapseCompletedQuests and isMinimizable and not timedQuest then
                                    button.line.expandQuest:Hide()
                                else
                                    button.line.expandQuest:Show()
                                end
                            else
                                button.line.expandQuest:Hide()
                            end

                            -- Attach button to Quest Title linePool
                            button:SetPoint("TOPLEFT", button.line, "TOPLEFT", 0, 0)
                            button:SetParent(button.line)
                            button:Show()

                            -- Set flag to allow secondary Quest Item Buttons
                            primaryButton = true

                            -- If the Quest Zone or Quest is minimized then set UIParent and hide buttons since the buttons are normally attached to the Quest frame.
                            -- If buttons are left attached to the Quest frame and if the Tracker frame is hidden in combat, then it would also try and hide the
                            -- buttons which you can't do in combat. This helps avoid violating the Blizzard SecureActionButtonTemplate restrictions relating to combat.
                            if Questie.db.char.collapsedZones[zoneName] or Questie.db.char.collapsedQuests[quest.Id] then
                                button:SetParent(UIParent)
                                button:Hide()
                            end
                        else
                            -- Button failed to get setup for some reason or the quest item is now gone. Hide it and enable the Quest Min/Max button.
                            -- See previous comment for details on why we're setting this button to UIParent.
                            button:SetParent(UIParent)

                            if (Questie.db.profile.collapseCompletedQuests and isMinimizable and not timedQuest) then
                                line.expandQuest:Hide()
                            else
                                line.expandQuest:Show()
                            end

                            button:Hide()
                        end

                        -- Save button to linePool
                        line.button = button

                        -- Hide button if quest complete or failed
                    elseif (Questie.db.profile.collapseCompletedQuests and isMinimizable and not timedQuest) then
                        line.expandQuest:Hide()
                    else
                        line.expandQuest:Show()
                    end

                    -- Adds the Secondary Quest Item Button (only if Primary is present)
                    if (complete ~= 1 and primaryButton and requiredItems and #requiredItems > 1 and next(quest.Objectives)) then
                        if type(requiredItems) == "table" then
                            -- Make sure it's a "secondary" button and if a quest item is "usable".
                            for _, itemId in pairs(requiredItems) do
                                -- GetItemSpell(itemId) is a bit of a work around for not having a Blizzard API for checking an items IsUsable state.
                                if itemId and itemId ~= sourceItemId and QuestieDB.QueryItemSingle(itemId, "class") == 12 and TrackerUtils:IsQuestItemUsable(itemId) then
                                    -- Get button from buttonPool
                                    local altButton = TrackerLinePool.GetNextItemButton()
                                    if not altButton then break end -- stop populating the tracker

                                    -- Set itemID
                                    altButton.itemID = itemId

                                    -- Get and save Quest Title linePool to buttonPool
                                    altButton.line = line

                                    -- Setup button and set attributes
                                    if altButton:SetItem(quest, "secondary", questItemButtonSize) then
                                        local height = 0
                                        local frame = altButton.line

                                        while frame and frame ~= trackerQuestFrame do
                                            local _, parent, _, _, yOff = frame:GetPoint()
                                            height = height - (frame:GetHeight() - yOff)
                                            frame = parent
                                        end

                                        if not Questie.db.char.collapsedQuests[quest.Id] and altButton:GetAlpha() > 0 then
                                            -- Set and indent Quest Title linePool
                                            altButton.line.label:ClearAllPoints()
                                            altButton.line.label:SetPoint("TOPLEFT", altButton.line, "TOPLEFT", questMarginLeft + 2 + questItemButtonSize, 0)

                                            -- Recheck and Remeasure Quest Label text width and update tracker width
                                            QuestieTracker:UpdateWidth(altButton.line.label:GetUnboundedStringWidth() + questMarginLeft + trackerMarginRight + questItemButtonSize)

                                            -- Reset Quest Title Label and linePool widths
                                            altButton.line.label:SetWidth(trackerBaseFrame:GetWidth() - questMarginLeft - trackerMarginRight - questItemButtonSize)
                                            altButton.line:SetWidth(altButton.line.label:GetWidth() + questMarginLeft + questItemButtonSize)

                                            -- Re-compare largest text Label in the tracker with Secondary Button/Quest and current Label, then save widest width
                                            trackerLineWidth = math.max(trackerLineWidth, altButton.line.label:GetUnboundedStringWidth() + questMarginLeft + questItemButtonSize)
                                        elseif altButton:GetAlpha() == 0 then
                                            -- Set Quest Title linePool
                                            altButton.line.label:ClearAllPoints()
                                            altButton.line.label:SetPoint("TOPLEFT", altButton.line, "TOPLEFT", questMarginLeft, 0)

                                            -- Recheck and Remeasure Quest Label text width and update tracker width
                                            QuestieTracker:UpdateWidth(altButton.line.label:GetUnboundedStringWidth() + questMarginLeft + trackerMarginRight)

                                            -- Reset Quest Title Label and linePool widths
                                            altButton.line.label:SetWidth(trackerBaseFrame:GetWidth() - questMarginLeft - trackerMarginRight)
                                            altButton.line:SetWidth(altButton.line.label:GetWidth() + questMarginLeft)

                                            -- Re-compare largest text Label in the tracker with current Label, then save widest width
                                            trackerLineWidth = math.max(trackerLineWidth, altButton.line.label:GetUnboundedStringWidth() + questMarginLeft)
                                        end

                                        -- Attach button to Quest Title linePool
                                        altButton:SetPoint("TOPLEFT", altButton.line, "TOPLEFT", 2 + questItemButtonSize, 0)
                                        altButton:SetParent(altButton.line)
                                        altButton:Show()

                                        -- Set flag to shift objective lines
                                        secondaryButton = true
                                        secondaryButtonAlpha = altButton:GetAlpha()

                                        -- If the Quest Zone or Quest is minimized then set UIParent and hide buttons since the buttons are normally attached to the Quest frame.
                                        -- If buttons are left attached to the Quest frame and if the Tracker frame is hidden in combat, then it would also try and hide the
                                        -- buttons which you can't do in combat. This helps avoid violating the Blizzard SecureActionButtonTemplate restrictions relating to combat.
                                        if Questie.db.char.collapsedZones[zoneName] or Questie.db.char.collapsedQuests[quest.Id] then
                                            altButton:SetParent(UIParent)
                                            altButton:Hide()
                                        end
                                    else
                                        -- See previous comment for details on why we're setting this button to UIParent.
                                        altButton:SetParent(UIParent)
                                        altButton:Hide()
                                    end

                                    -- Save button to linePool
                                    line.altButton = altButton
                                end
                            end
                        end
                    end

                    -- Set Secondary Quest Item Button Margins (QBC - Quest Button Check)
                    local lineLabelWidthQBC, lineLabelBaseFrameQBC, lineWidthQBC
                    if secondaryButton and secondaryButtonAlpha ~= 0 then
                        lineLabelWidthQBC = objectiveMarginLeft + trackerMarginRight + questItemButtonSize
                        lineLabelBaseFrameQBC = objectiveMarginLeft + trackerMarginRight + questItemButtonSize
                        lineWidthQBC = objectiveMarginLeft + questItemButtonSize
                    else
                        lineLabelWidthQBC = objectiveMarginLeft + trackerMarginRight
                        lineLabelBaseFrameQBC = objectiveMarginLeft + trackerMarginRight
                        lineWidthQBC = objectiveMarginLeft
                    end

                    -- Set Quest Line states
                    line:Show()
                    line.label:Show()

                    -- Add quest Objectives (if applicable)
                    if (not Questie.db.char.collapsedQuests[quest.Id]) then
                        -- Add Quest Timers (if applicable)
                        if timedQuest then
                            -- Get next line in linePool
                            line = TrackerLinePool.GetNextLine()

                            -- Safety check - make sure we didn't run over our linePool limit.
                            if not line then break end

                            -- Set Line Mode, Types, Clickers
                            line:SetMode("objective")
                            line:SetOnClick("quest")
                            line:SetQuest(quest)
                            line.expandZone:Hide()
                            line.expandQuest:Hide()
                            line.criteriaMark:Hide()
                            line.playButton:Hide()

                            -- Setup Timer Label
                            line.label:ClearAllPoints()
                            line.label:SetPoint("TOPLEFT", line, "TOPLEFT", lineWidthQBC, 0)

                            -- Set Timer font
                            line.label:SetFont(LSM30:Fetch("font", Questie.db.profile.trackerFontObjective), Questie.db.profile.trackerFontSizeObjective, Questie.db.profile.trackerFontOutline)

                            -- Set Timer Title based on states
                            line.label.activeTimer = false
                            if quest.timedBlizzardQuest then
                                line.label:SetText(Questie:Colorize(l10n("Blizzard Timer Active") .. "!", "blue"))
                            else
                                local timeRemainingString, timeRemaining = TrackerQuestTimers:GetRemainingTime(quest, line, false)
                                if timeRemaining then
                                    if timeRemaining <= 1 then
                                        line.label:SetText(Questie:Colorize("0 Seconds", "blue"))
                                        line.label.activeTimer = false
                                    else
                                        line.label:SetText(Questie:Colorize(timeRemainingString, "blue"))
                                        line.label.activeTimer = true
                                    end
                                end
                            end

                            -- Check and measure Timer text width and update tracker width
                            QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + lineLabelWidthQBC)

                            -- Set Timer Label and Line widthsl
                            line.label:SetWidth(trackerBaseFrame:GetWidth() - lineLabelBaseFrameQBC)
                            line:SetWidth(line.label:GetWidth() + lineWidthQBC)

                            -- Compare largest text Label in the tracker with current Label, then save widest width
                            trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + lineWidthQBC)

                            -- Set Timer states
                            line:Show()
                            line.label:Show()
                        end

                        -- Add incomplete Quest Objectives
                        if complete == 0 and quest.isComplete ~= true then
                            for _, objective in pairs(quest.Objectives) do
                                -- For runtime stubs, ensure objective is updated before display
                                if quest.__isRuntimeStub and objective.Update then
                                    objective.isUpdated = false
                                    objective:Update()
                                end
                                
                                if (not Questie.db.profile.hideCompletedQuestObjectives or (Questie.db.profile.hideCompletedQuestObjectives and objective.Needed ~= objective.Collected)) then
                                    -- Get next line in linePool
                                    line = TrackerLinePool.GetNextLine()

                                    -- Safety check - make sure we didn't run over our linePool limit.
                                    if not line then break end

                                    -- Set Line Mode, Types, Clickers
                                    line:SetMode("objective")
                                    line:SetOnClick("quest")
                                    line:SetQuest(quest)
                                    line:SetObjective(objective)
                                    line.expandZone:Hide()
                                    line.expandQuest:Hide()
                                    line.criteriaMark:Hide()
                                    line.playButton:Hide()

                                    -- Setup Objective Label based on states.
                                    line.label:ClearAllPoints()
                                    line.label:SetPoint("TOPLEFT", line, "TOPLEFT", lineWidthQBC, 0)

                                    -- Set Objective based on states
                                    local objDesc = objective.Description:gsub("%.", "")

                                    if (objective.Completed ~= true or (objective.Completed == true and #quest.Objectives > 1)) then
                                        -- For runtime stub quests, use objective description as-is from the quest log API
                                        -- For database quests, add progress formatting if needed
                                        if quest.__isRuntimeStub then
                                            -- Stub quests already have properly formatted descriptions from the quest log API
                                            line.label:SetText(QuestieLib:GetRGBForObjective(objective) .. objDesc)
                                        else
                                            -- Database quests need progress formatting added by the tracker
                                            if objective.Needed and objective.Needed > 1 and objective.Collected ~= nil then
                                                local progressText = ": " .. (objective.Collected or 0) .. "/" .. objective.Needed
                                                line.label:SetText(QuestieLib:GetRGBForObjective(objective) .. objDesc .. progressText)
                                            else
                                                -- Use objective description for single-count objectives or when no progress data
                                                line.label:SetText(QuestieLib:GetRGBForObjective(objective) .. objDesc)
                                            end
                                        end

                                        -- Check and measure Objective text and update tracker width
                                        QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + lineLabelWidthQBC)

                                        -- Set Objective label and Line widths
                                        line.label:SetWidth(trackerBaseFrame:GetWidth() - lineLabelBaseFrameQBC)
                                        line:SetWidth(line.label:GetWidth() + lineWidthQBC)

                                        -- Compare current text label and the largest text label in the Tracker, then save the widest width
                                        trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + lineWidthQBC)

                                        -- Edge case where the quest is still flagged incomplete for single objectives and yet the objective itself is flagged complete
                                    elseif (objective.Completed == true and completionText ~= nil and #quest.Objectives == 1) and objectiveColor ~= "minimal" then
                                        -- Set Blizzard Completion text for single objectives
                                        line.label:SetText(completionText)

                                        -- If the line width is less than the minimum Tracker width then don't wrap text
                                        if line.label:GetUnboundedStringWidth() + objectiveMarginLeft < trackerMinLineWidth then
                                            -- Check and measure Blizzard Completion text and update tracker width
                                            QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + objectiveMarginLeft + trackerMarginRight)

                                            -- Set Blizzard Completion label and Line widths
                                            line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)
                                            line:SetWidth(line.label:GetWidth() + objectiveMarginLeft)

                                            -- Compare current text label and the largest text label in the Tracker, then save the widest width
                                            trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + objectiveMarginLeft)
                                        else
                                            -- Set Blizzard Completion Label and Line widths
                                            line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)
                                            line:SetWidth(line.label:GetWrappedWidth() + objectiveMarginLeft)

                                            -- Blizzard Completion Text tends to be rather verbose. Allow text wrapping.
                                            line.label:SetHeight(line.label:GetStringHeight() * line.label:GetNumLines())
                                            line:SetHeight(line.label:GetHeight())

                                            -- Compare trackerLineWidth, trackerMinLineWidth and the current label, then save the widest width
                                            trackerLineWidth = math.max(trackerLineWidth, trackerMinLineWidth, line.label:GetWrappedWidth() + objectiveMarginLeft)
                                        end

                                        -- Update Quest has a check for this edge case. Should reset the Quest Icons and show the Quest Finisher
                                        QuestieQuest:UpdateQuest(quest.Id)

                                        -- Hide the Secondary Quest Item Button
                                        if secondaryButton and secondaryButtonAlpha ~= 0 then
                                            line.altButton:SetParent(UIParent)
                                            line.altButton:Hide()
                                        end
                                    end

                                    -- Adds 1 pixel between multiple Objectives
                                    line:SetHeight(line.label:GetHeight() + 1)

                                    -- Set Objective state
                                    line:Show()
                                    line.label:Show()
                                end
                            end

                            -- Add complete/failed Quest Objectives and tag them as either complete or failed so as to always have at least one objective.
                            -- Some quests have "Blizzard Completion Text" that is displayed to show where to go next or where to turn in the quest.
                        elseif complete == 1 or complete == -1 or quest.isComplete == true then
                            -- Get next line in linePool
                            line = TrackerLinePool.GetNextLine()

                            -- Safety check - make sure we didn't run over our linePool limit.
                            if not line then break end

                            -- Set Line Mode, Types, Clickers
                            line:SetMode("objective")
                            line:SetOnClick("quest")
                            line:SetQuest(quest)
                            line.expandZone:Hide()
                            line.expandQuest:Hide()
                            line.criteriaMark:Hide()
                            line.playButton:Hide()

                            -- Setup Objective Label
                            line.label:ClearAllPoints()
                            line.label:SetPoint("TOPLEFT", line, "TOPLEFT", lineWidthQBC, 0)

                            -- Set Objective label based on states
                            if ((complete == 1 and completionText ~= nil and #quest.Objectives == 0) or (quest.isComplete == true and completionText ~= nil)) and objectiveColor ~= "minimal" then
                                -- Set Blizzard Completion text for single objectives
                                line.label:SetText(completionText)

                                -- If the line width is less than the minimum Tracker width then don't wrap text
                                if line.label:GetUnboundedStringWidth() + objectiveMarginLeft < trackerMinLineWidth then
                                    -- Check and measure Blizzard Completion text and update tracker width
                                    QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + objectiveMarginLeft + trackerMarginRight)

                                    -- Set Blizzard Completion label and Line widths
                                    line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)
                                    line:SetWidth(line.label:GetWidth() + objectiveMarginLeft)

                                    -- Compare current text label and the largest text label in the Tracker, then save the widest width
                                    trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + objectiveMarginLeft)
                                else
                                    -- Set Blizzard Completion Label and Line widths
                                    line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)
                                    line:SetWidth(line.label:GetWrappedWidth() + objectiveMarginLeft)

                                    -- Blizzard Completion Text tends to be rather verbose. Allow text wrapping.
                                    line.label:SetHeight(line.label:GetStringHeight() * line.label:GetNumLines())
                                    line:SetHeight(line.label:GetHeight())

                                    -- Compare trackerLineWidth, trackerMinLineWidth and the current label, then save the widest width
                                    trackerLineWidth = math.max(trackerLineWidth, trackerMinLineWidth, line.label:GetWrappedWidth() + objectiveMarginLeft)
                                end

                                -- Hide the Secondary Quest Item Button. There are some quests with usable items after a quest is completed I
                                -- have yet to encounter a completed quest where both a Primary and Secondary "usable" Quest Item was needed.
                                if secondaryButton and secondaryButtonAlpha ~= 0 then
                                    line.altButton:SetParent(UIParent)
                                    line.altButton:Hide()
                                end
                            else
                                if complete == 1 or (#quest.Objectives == 0 and quest.isComplete == true and completionText == nil and complete ~= -1) then
                                    line.label:SetText(Questie:Colorize(l10n("Quest Complete") .. "!", "green"))
                                elseif complete == -1 then
                                    line.label:SetText(Questie:Colorize(l10n("Quest Failed") .. "!", "red"))
                                end

                                -- Check and measure Objective text width and update tracker width
                                QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + lineLabelWidthQBC)

                                -- Set Objective Label and Line widths
                                line.label:SetWidth(trackerBaseFrame:GetWidth() - lineLabelBaseFrameQBC)
                                line:SetWidth(line.label:GetWidth() + lineWidthQBC)

                                -- Compare largest text Label in the tracker with current Label, then save widest width
                                trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + lineWidthQBC)
                            end

                            -- Set Objective state
                            line:Show()
                            line.label:Show()
                        end
                    end

                    -- Safety check in case we hit the linePool limit
                    if not line then
                        line = TrackerLinePool.GetLastLine()
                    end

                    -- Adds 2 pixels and "Padding Between Quests" setting in Tracker Options
                    line:SetHeight(line.label:GetHeight() + (Questie.db.profile.trackerQuestPadding + 2))
                end

                primaryButton = false
                secondaryButton = false
            end
        end
    end

    -- Begin populating the tracker with achievements
    local _UpdateAchievements = function()
        -- Begin populating the tracker with achievements
        if Questie.IsWotlk or QuestieCompat.Is335 then
            -- Begin populating the tracker with tracked achievements - Note: We're limited to tracking only 10 Achievements at a time.
            -- For all intents and purposes at a code level we're going to treat each tracked Achievement the same way we treat and add Quests. This loop is
            -- necessary to keep separate from the above tracked Quests loop so we can place all tracked Achievements into it's own "Zone" called Achievements.
            -- This will force Achievements to always appear at the bottom of the tracker. Obviously it'll show at the top if there are no quests being tracked.
            local firstAchieveInZone = false
            local achieveId, achieveName, achieveDescription, achieveComplete, numCriteria, zoneName, achieve

            for trackedId, _ in pairs(trackedAchievementIds) do
                achieveId, achieveName, _, _, _, _, _, achieveDescription, _, _, _, _, achieveComplete, _, _ = GetAchievementInfo(trackedId)
                numCriteria = GetAchievementNumCriteria(trackedId)
                zoneName = "Achievements"

                achieve = {
                    Id = achieveId,
                    Name = achieveName,
                    Description = achieveDescription
                }

                if achieveId and (not achieveComplete) and trackedAchievementIds[achieveId] == true then
                    -- Add Achievement Zone
                    if zoneCheck ~= zoneName then
                        firstAchieveInZone = true
                    end

                    if firstAchieveInZone then
                        -- Skip creating zone headers if user has disabled them
                        if Questie.db.profile.trackerHideZoneHeaders then
                            -- Don't create zone header, just mark that we've handled this zone
                            firstAchieveInZone = false
                        else
                            -- Get first line in linePool
                            line = TrackerLinePool.GetNextLine()

                            -- Safety check - make sure we didn't run over our linePool limit.
                            if not line then break end

                            -- Set Line Mode, Types, Clickers
                            line:SetMode("zone")
                            line:SetZone(zoneName)
                            line.expandQuest:Hide()
                            line.criteriaMark:Hide()
                            line.playButton:Hide()

                            -- Setup Zone Label
                            line.label:ClearAllPoints()
                            line.label:SetPoint("TOPLEFT", line, "TOPLEFT", 0, 0)

                            -- Set Zone Title and Min/Max states
                        if Questie.db.char.collapsedZones[zoneName] then
                            line.expandZone:SetMode(0)
                            local text = zoneName == "Achievements" and l10n("Achievements") or zoneName
                            line.label:SetText("|cFFC0C0C0" .. text .. " +|r")
                        else
                            line.expandZone:SetMode(1)
                            local text = zoneName == "Achievements" and l10n("Achievements") or zoneName
                            line.label:SetText("|cFFC0C0C0" .. text .. ": " .. GetNumTrackedAchievements(true) .. "/10|r")
                        end

                        -- Checks the minAllQuestsInZone[zone] table and if empty, zero out the table.
                        if Questie.db.char.minAllQuestsInZone[zoneName] ~= nil and not Questie.db.char.minAllQuestsInZone[zoneName].isTrue and not Questie.db.char.collapsedZones[zoneName] then
                            local minQuestIdCount = 0
                            for minQuestId, _ in pairs(Questie.db.char.minAllQuestsInZone[zoneName]) do
                                if type(minQuestId) == "number" then
                                    minQuestIdCount = minQuestIdCount + 1
                                end
                            end

                            if minQuestIdCount == 0 then
                                Questie.db.char.minAllQuestsInZone[zoneName] = nil
                            end
                        end

                        -- Check and measure Zone Label text width and update tracker width
                        QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + trackerMarginLeft + trackerMarginRight)

                        -- Set Zone Label and Line widths
                        line.label:SetWidth(trackerBaseFrame:GetWidth() - trackerMarginLeft - trackerMarginRight)
                        line:SetWidth(line.label:GetWidth())

                        -- Compare largest text Label in the tracker with current Label, then save widest width
                        trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + trackerMarginLeft)

                        -- Setup Min/Max Button
                        line.expandZone:ClearAllPoints()
                        line.expandZone:SetPoint("TOPLEFT", line.label, "TOPLEFT", 0, 0)
                        line.expandZone:SetWidth(line.label:GetWidth())
                        line.expandZone:SetHeight(line.label:GetHeight())
                        line.expandZone:Show()

                        -- Adds 4 pixels between Zone and first Achievement Title
                        line:SetHeight(line.label:GetHeight() + 4)

                        -- Set Zone states
                        line:Show()
                        line.label:Show()
                        line.Quest = nil
                        line.Objective = nil
                        firstAchieveInZone = false
                        zoneCheck = zoneName
                        end
                    end

                    -- Add Achievements
                    if (not Questie.db.char.collapsedZones[zoneName]) then
                        -- Get next line in linePool
                        line = TrackerLinePool.GetNextLine()

                        -- Safety check - make sure we didn't run over our linePool limit.
                        if not line then break end

                        -- Set Line Mode, Types, Clickers
                        line:SetMode("achieve")
                        line:SetOnClick("achieve")
                        line:SetQuest(achieve)
                        line:SetObjective(nil)
                        line.expandZone:Hide()
                        line.criteriaMark:Hide()
                        line.playButton:Hide()

                        -- Set Min/Max Button and default states
                        line.expandQuest:Show()
                        line.expandQuest:SetPoint("TOPRIGHT", line, "TOPLEFT", questMarginLeft - 8, 1)
                        line.expandQuest.zoneId = zoneName

                        -- The minAllQuestsInZone table is always blank until a player Shift+Clicks the Zone header (MouseDown).
                        -- QuestieTracker:Update is triggered and the table is then filled with all Achievement ID's in the same Zone.
                        if Questie.db.char.minAllQuestsInZone[zoneName] ~= nil and Questie.db.char.minAllQuestsInZone[zoneName].isTrue then
                            Questie.db.char.minAllQuestsInZone[zoneName][achieve.Id] = true
                        end

                        -- Handles all the Min/Max behavior individually for each Achievement.
                        if Questie.db.char.collapsedQuests[achieve.Id] then
                            line.expandQuest:SetMode(0)
                        else
                            line.expandQuest:SetMode(1)
                        end

                        -- Setup Achievement Label
                        line.label:ClearAllPoints()
                        line.label:SetPoint("TOPLEFT", line, "TOPLEFT", questMarginLeft, 0)

                        -- Set Achievement Title
                        if Questie.db.profile.enableTooltipsQuestID then
                            line.label:SetText("|cFFFFFF00" .. achieve.Name .. " (" .. achieve.Id .. ")|r")
                        else
                            line.label:SetText("|cFFFFFF00" .. achieve.Name .. "|r")
                        end

                        -- Check and measure Achievement Label text width and update tracker width
                        QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + questMarginLeft + trackerMarginRight)

                        -- Set Achievement Label and Line widths
                        line.label:SetWidth(trackerBaseFrame:GetWidth() - questMarginLeft - trackerMarginRight)
                        line:SetWidth(line.label:GetWidth() + questMarginLeft)

                        -- Compare largest text Label in the tracker with current Label, then save widest width
                        trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + questMarginLeft)

                        -- Adds 4 pixels between Achievement Title and first Objective
                        line:SetHeight(line.label:GetHeight() + 4)

                        -- Set Achievement states
                        line:Show()
                        line.label:Show()

                        -- Add achievement Objective (if applicable)
                        if (not Questie.db.char.collapsedQuests[achieve.Id]) then
                            -- Achievements with no number criteria
                            if numCriteria == 0 then
                                -- Get next line in linePool
                                line = TrackerLinePool.GetNextLine()

                                -- Safety check - make sure we didn't run over our linePool limit.
                                if not line then break end

                                -- Set Line Mode, Types, Clickers
                                line:SetMode("objective")
                                line:SetOnClick("achieve")
                                line:SetQuest(achieve)
                                line:SetObjective("objective")
                                line.expandZone:Hide()
                                line.expandQuest:Hide()
                                line.criteriaMark:Hide()
                                line.playButton:Hide()

                                -- Setup Objective Label
                                line.label:ClearAllPoints()
                                line.label:SetPoint("TOPLEFT", line, "TOPLEFT", objectiveMarginLeft, 0)

                                -- Set Objective text
                                local objDesc = achieve.Description:gsub("%.", "")
                                line.label:SetText(QuestieLib:GetRGBForObjective({ Collected = 0, Needed = 1 }) .. objDesc)

                                -- If the line width is less than the minimum Tracker width then don't wrap text
                                if line.label:GetUnboundedStringWidth() + objectiveMarginLeft < trackerMinLineWidth then
                                    -- Check and measure Objective text width and update tracker width
                                    QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + objectiveMarginLeft + trackerMarginRight)

                                    -- Set Objective Label and Line widths
                                    line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)
                                    line:SetWidth(line.label:GetWidth() + objectiveMarginLeft)

                                    -- Compare largest text Label in the tracker with current Label, then save widest width
                                    trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + objectiveMarginLeft)
                                else
                                    -- Set Label and Line widths
                                    line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)
                                    line:SetWidth(line.label:GetWrappedWidth() + objectiveMarginLeft)

                                    -- TextWrap Objective and set height
                                    line.label:SetHeight(line.label:GetStringHeight() * line.label:GetNumLines())
                                    line:SetHeight(line.label:GetHeight())

                                    -- Compare trackerLineWidth, trackerMinLineWidth and the current label, then save the widest width
                                    trackerLineWidth = math.max(trackerLineWidth, trackerMinLineWidth, line.label:GetWrappedWidth() + objectiveMarginLeft)
                                end

                                -- Set Objective state
                                line:Show()
                                line.label:Show()
                            end

                            -- Achievements with number criteria
                            for objCriteria = 1, numCriteria do
                                local criteriaString, _, completed, quantityProgress, quantityNeeded, _, _, refId, quantityString = GetAchievementCriteriaInfo(achieve.Id, objCriteria)
                                if ((Questie.db.profile.hideCompletedAchieveObjectives) and (not completed)) or (not Questie.db.profile.hideCompletedAchieveObjectives) then
                                    -- Get next line in linePool
                                    line = TrackerLinePool.GetNextLine()

                                    -- Safety check - make sure we didn't run over our linePool limit.
                                    if not line then break end

                                    -- Set Line Mode, Types, Clickers
                                    line:SetMode("objective")
                                    line:SetOnClick("achieve")

                                    -- Set correct Objective ID. Sometimes stand alone trackable Achievements are part of a group of Achievements under a parent Achievement.
                                    local objId

                                    if refId and select(2, GetAchievementInfo(refId)) == criteriaString and ((GetAchievementInfo(refId) and refId ~= 0) or (refId > 0 and (not QuestieDB.GetQuest(refId)))) then
                                        objId = refId
                                    else
                                        objId = achieve
                                    end

                                    line:SetQuest(objId)
                                    line:SetObjective("objective")
                                    line.expandZone:Hide()
                                    line.expandQuest:Hide()
                                    line.criteriaMark:Hide()
                                    line.playButton:Hide()

                                    -- Setup Objective Label
                                    line.label:ClearAllPoints()
                                    line.label:SetPoint("TOPLEFT", line, "TOPLEFT", objectiveMarginLeft, 0)

                                    -- Set Objective label based on state
                                    if (criteriaString == "") then
                                        criteriaString = achieve.Description
                                    end

                                    local objDesc = criteriaString:gsub("%.", "")

                                    -- Set Objectives with more than one Objective number criteria
                                    if not (completed or quantityNeeded == 1 or quantityProgress == quantityNeeded) then
                                        if string.find(quantityString, "|") then
                                            quantityString = quantityString:gsub("/%s?", "/")
                                        else
                                            quantityString = quantityProgress .. "/" .. quantityNeeded
                                        end

                                        local lineEnding = tostring(quantityString)

                                        -- Set Objective text
                                        line.label:SetText(QuestieLib:GetRGBForObjective({ Collected = quantityProgress, Needed = quantityNeeded }) .. objDesc .. ": " .. lineEnding)

                                        -- Check and measure Objective text width and update tracker width
                                        QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + objectiveMarginLeft + trackerMarginRight)

                                        -- Set Label width
                                        line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)

                                        -- Split Objective description and Progress/Needed into seperate lines
                                        if (trackerLineWidth < line.label:GetUnboundedStringWidth() + objectiveMarginLeft) and (line.label:GetWidth() < line.label:GetUnboundedStringWidth() + 5) then
                                            -- Set Objective text
                                            line.label:SetText(QuestieLib:GetRGBForObjective({ Collected = quantityProgress, Needed = quantityNeeded }) .. objDesc .. ": ")

                                            -- Check and measure Objective text width and update tracker width
                                            QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + objectiveMarginLeft + trackerMarginRight)

                                            -- Set Label and Line widths
                                            line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)
                                            line:SetWidth(line.label:GetWidth() + objectiveMarginLeft)

                                            -- Compare largest text Label in the tracker with current Label, then save widest width
                                            trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + objectiveMarginLeft)

                                            -- Adds 1 pixel between split Objectives
                                            line:SetHeight(line.label:GetHeight() + 1)

                                            -- Set Objective state
                                            line:Show()
                                            line.label:Show()

                                            -- Get next line in linePool
                                            line = TrackerLinePool.GetNextLine()

                                            -- Safety check - make sure we didn't run over our linePool limit.
                                            if not line then break end

                                            -- Set Line Mode, Types, Clickers
                                            line:SetMode("objective")
                                            line:SetOnClick("achieve")
                                            line:SetQuest(objId)
                                            line:SetObjective("objective")
                                            line.expandZone:Hide()
                                            line.expandQuest:Hide()
                                            line.criteriaMark:Hide()
                                            line.playButton:Hide()

                                            -- Set Objective Label
                                            line.label:ClearAllPoints()
                                            line.label:SetPoint("TOPLEFT", line, "TOPLEFT", objectiveMarginLeft, 0)

                                            -- Set Objective text
                                            line.label:SetText(QuestieLib:GetRGBForObjective({ Collected = quantityProgress, Needed = quantityNeeded }) .. "    > " .. lineEnding)

                                            -- Check and measure Objective text width and update tracker width
                                            QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + objectiveMarginLeft + trackerMarginRight)

                                            -- Set Label and Line widths
                                            line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)
                                            line:SetWidth(line.label:GetWidth() + objectiveMarginLeft)
                                        else
                                            -- Set Line widths
                                            line:SetWidth(line.label:GetWidth() + objectiveMarginLeft)

                                            -- Compare largest text Label in the tracker with current Label, then save widest width
                                            trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + objectiveMarginLeft)
                                        end

                                        -- Set Objectives with a single Objective number criteria
                                    else
                                        -- Set Objective text
                                        if completed then
                                            line.label:SetText(QuestieLib:GetRGBForObjective({ Collected = 1, Needed = 1 }) .. objDesc)
                                        else
                                            line.label:SetText(QuestieLib:GetRGBForObjective({ Collected = 0, Needed = 1 }) .. objDesc)
                                        end

                                        -- Set Objective criteria mark
                                        if not Questie.db.profile.hideCompletedAchieveObjectives and (not objectiveColor or objectiveColor == "white") then
                                            line.criteriaMark:SetCriteria(completed)

                                            if line.criteriaMark.mode == true then
                                                line.criteriaMark:Show()
                                            end
                                        end

                                        -- Check and measure Objective text width and update tracker width
                                        QuestieTracker:UpdateWidth(line.label:GetUnboundedStringWidth() + objectiveMarginLeft + trackerMarginRight)

                                        -- Set Objective Label and Line widths
                                        line.label:SetWidth(trackerBaseFrame:GetWidth() - objectiveMarginLeft - trackerMarginRight)
                                        line:SetWidth(line.label:GetWidth() + objectiveMarginLeft)

                                        -- Compare largest text Label in the tracker with current Label, then save widest width
                                        trackerLineWidth = math.max(trackerLineWidth, line.label:GetUnboundedStringWidth() + objectiveMarginLeft)
                                    end

                                    -- Adds 1 pixel between multiple Objectives
                                    line:SetHeight(line.label:GetHeight() + 1)

                                    -- Set Objective state
                                    line:Show()
                                    line.label:Show()
                                end
                            end
                        end

                        -- Safety check in case we hit the linePool limit
                        if not line then
                            line = TrackerLinePool.GetLastLine()
                        end

                        -- Adds 2 pixels and "Padding Between Quests" setting in Tracker Options
                        line:SetHeight(line.label:GetHeight() + (Questie.db.profile.trackerQuestPadding + 2))
                    end
                end
            end
        end
    end

    -- Populate Achievements first then Quests
    if Questie.db.profile.listAchievementsFirst and (Questie.IsWotlk or QuestieCompat.Is335) then
        _UpdateAchievements()
        _UpdateQuests()
    else
        _UpdateQuests()
        _UpdateAchievements()
    end

    -- Safety check in case we hit the linePool limit
    if not line then
        line = TrackerLinePool.GetLastLine()
    end

    -- Update tracker formatting
    if line then
        QuestieTracker:UpdateFormatting()
    end

    -- First run clean up
    if isFirstRun then
        -- Don't hide the tracker on first run - let it show immediately
        -- trackerBaseFrame:Hide() -- Removed to fix empty tracker on new characters
        for questId, quest in pairs(QuestiePlayer.currentQuestlog) do
            if quest then
                if Questie.db.char.TrackerHiddenQuests[questId] then
                    quest.HideIcons = true
                end

                if Questie.db.char.TrackerFocus and type(Questie.db.char.TrackerFocus) == "number" and Questie.db.char.TrackerFocus == quest.Id then -- quest focus
                    TrackerUtils:FocusQuest(quest.Id)
                end

                for _, objective in pairs(quest.Objectives) do
                    if Questie.db.char.TrackerHiddenObjectives[tostring(questId) .. " " .. tostring(objective.Index)] then
                        objective.HideIcons = true
                    end

                    if Questie.db.char.TrackerFocus and type(Questie.db.char.TrackerFocus) == "string" and Questie.db.char.TrackerFocus == tostring(quest.Id) .. " " .. tostring(objective.Index) then
                        TrackerUtils:FocusObjective(quest.Id, objective.Index)
                    end
                end

                for _, objective in pairs(quest.SpecialObjectives) do
                    if Questie.db.char.TrackerHiddenObjectives[tostring(questId) .. " " .. tostring(objective.Index)] then
                        objective.HideIcons = true
                    end

                    if Questie.db.char.TrackerFocus and type(Questie.db.char.TrackerFocus) == "string" and Questie.db.char.TrackerFocus == tostring(quest.Id) .. " " .. tostring(objective.Index) then
                        TrackerUtils:FocusObjective(quest.Id, objective.Index)
                    end
                end
            end
        end
        isFirstRun = false
        -- Allow immediate formatting for new characters
        allowFormattingUpdate = true
        -- Still queue a delayed update for safety, but tracker should work immediately
        C_Timer.After(1.0, function()
            QuestieCombatQueue:Queue(function()
                QuestieTracker:Update()
            end)
        end)
    end
end

function QuestieTracker:UpdateFormatting()
    if not allowFormattingUpdate then
        return
    end

    if TrackerBaseFrame.isSizing == true or TrackerBaseFrame.isMoving == true or TrackerUtils.FilterProximityTimer == true then
        Questie:Debug(Questie.DEBUG_SPAM, "[QuestieTracker:UpdateFormatting]")
    else
        Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:UpdateFormatting]")
    end

    -- The Proximity Timer only pulses every 5 secs while running.
    -- Flip back to false so we're not hiding other valid updates.
    TrackerUtils.FilterProximityTimer = nil

    -- Hide unused lines
    TrackerLinePool.HideUnusedLines()

    -- Hide unused item buttons
    QuestieCombatQueue:Queue(function()
        TrackerLinePool.HideUnusedButtons()
    end)

    -- This is responsible for handling the visibility of the Tracker
    -- when nothing is tracked or when alwaysShowTracker is being used.
    if (not QuestieTracker:HasQuest()) then
        if Questie.db.profile.alwaysShowTracker then
            trackerBaseFrame:Show()
        else
            trackerBaseFrame:Hide()
        end
    else
        trackerBaseFrame:Show()
    end

    TrackerHeaderFrame:Update()

    if TrackerLinePool.GetCurrentLine() and trackerLineWidth > 1 then
        local trackerVarsCombined = trackerLineWidth + trackerMarginRight
        TrackerLinePool.UpdateWrappedLineWidths(trackerLineWidth)
        QuestieTracker:UpdateWidth(trackerVarsCombined)
        QuestieTracker:UpdateHeight()
        TrackerQuestFrame:Update()
    end

    TrackerBaseFrame:Update()

    if Questie.db.profile.trackerHeaderEnabled or (Questie.db.profile.alwaysShowTracker and not QuestieTracker:HasQuest()) then
        QuestieCompat.SetResizeBounds(trackerBaseFrame, trackerHeaderFrame:GetWidth() + Questie.db.profile.trackerFontSizeHeader + 10, trackerHeaderFrame:GetHeight() + Questie.db.profile.trackerFontSizeZone + 23)
    else
        QuestieCompat.SetResizeBounds(trackerBaseFrame, (TrackerLinePool.GetFirstLine().label:GetUnboundedStringWidth() + 40), Questie.db.profile.trackerFontSizeZone + 22)
    end

    TrackerUtils:ShowVoiceOverPlayButtons()
    TrackerUtils:UpdateVoiceOverPlayButtons()
end

function QuestieTracker:UpdateWidth(trackerVarsCombined)
    local trackerWidthByManual = Questie.db.profile.TrackerWidth
    local trackerHeaderFrameWidth = (trackerHeaderFrame:GetWidth() + Questie.db.profile.trackerFontSizeHeader + 10)
    local trackerHeaderlessWidth = (TrackerLinePool.GetFirstLine().label:GetUnboundedStringWidth() + 30)

    if Questie.db.char.isTrackerExpanded then
        if trackerWidthByManual > 0 then
            -- Tracker Sizer is in Manual Mode
            if (not TrackerBaseFrame.isSizing) then
                -- Tracker is not being Sized | Manual width based on the width set by the Tracker Sizer
                if trackerWidthByManual < trackerHeaderFrameWidth and (Questie.db.profile.trackerHeaderEnabled or (Questie.db.profile.alwaysShowTracker and not QuestieTracker:HasQuest())) then
                    trackerBaseFrame:SetWidth(trackerHeaderFrameWidth)
                elseif trackerWidthByManual < trackerHeaderlessWidth then
                    trackerBaseFrame:SetWidth(trackerHeaderlessWidth)
                else
                    trackerBaseFrame:SetWidth(trackerWidthByManual)
                end
            else
                -- Tracker is being Sized | This will update the Tracker width while the Sizer is being used
                trackerBaseFrame:SetWidth(trackerWidthByManual)
            end
        else
            -- Tracker Sizer is in Auto Mode
            if (trackerVarsCombined < trackerHeaderFrameWidth and (Questie.db.profile.trackerHeaderEnabled or (Questie.db.profile.alwaysShowTracker and not QuestieTracker:HasQuest()))) then
                -- Apply headerFrameWidth
                trackerBaseFrame:SetWidth(trackerHeaderFrameWidth)
            else
                -- Apply trackerVarsCombined width based on the maximum size of the largest line in the Tracker
                trackerBaseFrame:SetWidth(trackerVarsCombined)
            end
        end

        trackerQuestFrame:SetWidth(trackerBaseFrame:GetWidth())
        trackerQuestFrame.ScrollChildFrame:SetWidth(trackerBaseFrame:GetWidth())
    else
        if Questie.db.profile.trackerHeaderEnabled or (Questie.db.profile.alwaysShowTracker and not QuestieTracker:HasQuest()) then
            trackerBaseFrame:SetWidth(trackerHeaderFrameWidth)
            trackerQuestFrame:SetWidth(trackerHeaderFrameWidth)
            trackerQuestFrame.ScrollChildFrame:SetWidth(trackerHeaderFrameWidth)
        end
    end
end

function QuestieTracker:UpdateHeight()
    local trackerHeaderFrameHeight = trackerHeaderFrame:GetHeight() + Questie.db.profile.trackerFontSizeZone + 23
    local trackerHeightByRatio = GetScreenHeight() * Questie.db.profile.trackerHeightRatio
    local trackerHeightByManual = Questie.db.profile.TrackerHeight
    local trackerHeightCheck = trackerHeightByManual > 0 and trackerHeightByManual or trackerHeightByRatio
    local trackerHeaderlessHeight = Questie.db.profile.trackerFontSizeZone + 22

    if Questie.db.char.isTrackerExpanded then
        -- Removes any padding from the last line in the tracker
        TrackerLinePool.GetCurrentLine():SetHeight(TrackerLinePool.GetCurrentLine().label:GetStringHeight())

        if TrackerLinePool.GetCurrentLine().mode == "zone" then
            -- If a single zone is the only line in the tracker then don't add pixel padding
            trackerQuestFrame.ScrollChildFrame:SetHeight((TrackerLinePool.GetFirstLine():GetTop() - TrackerLinePool.GetCurrentLine():GetBottom()))
        else
            -- Add 3 pixels to bottom of tracker to account for text that traverses beyond the GetStringHeight() function such as lower case "g".
            trackerQuestFrame.ScrollChildFrame:SetHeight((TrackerLinePool.GetFirstLine():GetTop() - TrackerLinePool.GetCurrentLine():GetBottom() + 3))
        end

        -- Set the baseFrame to full height so we can measure it
        trackerQuestFrame:SetHeight(trackerQuestFrame.ScrollChildFrame:GetHeight())

        if Questie.db.profile.trackerHeaderEnabled or (Questie.db.profile.alwaysShowTracker and not QuestieTracker:HasQuest()) then
            trackerBaseFrame:SetHeight(trackerQuestFrame:GetHeight() + trackerHeaderFrame:GetHeight() + 20)
        else
            trackerBaseFrame:SetHeight(trackerQuestFrame:GetHeight() + 20)
        end

        -- Use trackerHeightCheck (Sizer Manual or Auto) and set the heights
        if (not TrackerBaseFrame.isSizing) then
            -- Tracker is not being re-sized
            if trackerBaseFrame:GetHeight() > trackerHeightCheck then
                if trackerHeightCheck < trackerHeaderFrameHeight + 10 and (Questie.db.profile.trackerHeaderEnabled or (Questie.db.profile.alwaysShowTracker and not QuestieTracker:HasQuest())) then
                    trackerBaseFrame:SetHeight(trackerHeaderFrameHeight)
                elseif trackerHeightCheck < trackerHeaderlessHeight then
                    trackerBaseFrame:SetHeight(trackerHeaderlessHeight)
                else
                    trackerBaseFrame:SetHeight(trackerHeightCheck)
                end
            end
        else
            trackerBaseFrame:SetHeight(trackerHeightCheck)
        end

        -- Resize the questFrame to match the baseFrame after the trackerHeightCheck is applied
        if Questie.db.profile.trackerHeaderEnabled or (Questie.db.profile.alwaysShowTracker and not QuestieTracker:HasQuest()) then
            -- With Header Frame
            trackerQuestFrame:SetHeight(trackerBaseFrame:GetHeight() - trackerHeaderFrame:GetHeight() - 20)
        else
            -- Without Header Frame
            trackerQuestFrame:SetHeight(trackerBaseFrame:GetHeight() - 20)
        end
    else
        trackerBaseFrame:SetHeight(trackerHeaderFrameHeight - 20)
        trackerQuestFrame:SetHeight(trackerHeaderFrameHeight - 20)
        trackerQuestFrame.ScrollChildFrame:SetHeight(trackerHeaderFrameHeight - 20)
    end
end

function QuestieTracker:Unhook()
    if (not QuestieTracker.alreadyHooked) then
        return
    end

    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:Unhook]")

    QuestieTracker.disableHooks = true

    TrackerQuestTimers:ShowBlizzardTimer()

    -- Quest Hooks
    if QuestieTracker.IsQuestWatched then
        IsQuestWatched = QuestieTracker.IsQuestWatched
        GetNumQuestWatches = QuestieTracker.GetNumQuestWatches
    end

    -- Achievement Hooks
    if Questie.IsWotlk or QuestieCompat.Is335 then
        if QuestieTracker.IsTrackedAchievement then
            IsTrackedAchievement = QuestieTracker.IsTrackedAchievement
            GetNumTrackedAchievements = QuestieTracker.GetNumTrackedAchievements
        end
    end

    QuestieTracker.alreadyHooked = nil
end

function QuestieTracker:HookBaseTracker()
    if QuestieTracker.alreadyHooked then
        return
    end

    QuestieTracker.disableHooks = nil

    if not QuestieTracker.alreadyHookedSecure then
        Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:HookBaseTracker] - Secure hooks")

        -- Durability Frame hook
        hooksecurefunc("UIParent_ManageFramePositions", QuestieTracker.UpdateDurabilityFrame)

        -- QuestWatch secure hook
        if AutoQuestWatch_Insert then
            hooksecurefunc("AutoQuestWatch_Insert", function(index, watchTimer) QuestieTracker:AQW_Insert(index, watchTimer) end)
        end

        hooksecurefunc("AddQuestWatch", function(index, watchTimer) 
            -- AddQuestWatch hook
            QuestieTracker:AQW_Insert(index, watchTimer) 
        end)
        hooksecurefunc("RemoveQuestWatch", function(index, isInternalCall)
            -- RemoveQuestWatch hook
            QuestieTracker.RemoveQuestWatch(index, isInternalCall)
        end)

        -- Achievement secure hooks
        if Questie.IsWotlk or QuestieCompat.Is335 then
            hooksecurefunc("AddTrackedAchievement", function(achieveId) QuestieTracker:TrackAchieve(achieveId) end)
            hooksecurefunc("RemoveTrackedAchievement", QuestieTracker.RemoveTrackedAchievement)
        end

        QuestieTracker.alreadyHookedSecure = true
    end

    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:HookBaseTracker] - Non-secure hooks")

    -- Quest Hooks
    if not QuestieTracker.IsQuestWatched then
        QuestieTracker.IsQuestWatched = IsQuestWatched
        QuestieTracker.GetNumQuestWatches = GetNumQuestWatches
    end

    -- Intercept and return a Questie boolean value
    IsQuestWatched = function(index)
        local questId = select(8, GetQuestLogTitle(index))
        if questId == 0 then
            -- When an objective progresses in TBC "index" is the questId, but when a quest is manually added to the quest watch
            -- (e.g. shift clicking it in the quest log) "index" is the questLogIndex.
            questId = index
        end

        if not Questie.db.profile.autoTrackQuests then
            return Questie.db.char.TrackedQuests[questId or -1]
        else
            local inQuestlog = questId and QuestiePlayer.currentQuestlog[questId]
            local isUntracked = Questie.db.char.AutoUntrackedQuests and Questie.db.char.AutoUntrackedQuests[questId]
            return inQuestlog and not isUntracked
        end
    end

    -- Intercept and return only what Questie is tracking
    GetNumQuestWatches = function(isQuestie)
        local activeQuests = 0
        if isQuestie and Questie.db.profile.autoTrackQuests and Questie.db.char.AutoUntrackedQuests then
            local autoUnTrackedQuests = 0
            for _ in pairs(Questie.db.char.AutoUntrackedQuests) do
                autoUnTrackedQuests = autoUnTrackedQuests + 1
            end
            return select(2, GetNumQuestLogEntries()) - autoUnTrackedQuests
        elseif isQuestie and Questie.db.char.TrackedQuests then
            local autoTrackedQuests = 0
            for _ in pairs(Questie.db.char.TrackedQuests) do
                autoTrackedQuests = autoTrackedQuests + 1
            end
            return autoTrackedQuests
        else
            return 0
        end
    end

    -- Achievement Hooks
    if Questie.IsWotlk or QuestieCompat.Is335 then
        if not QuestieTracker.IsTrackedAchievement then
            QuestieTracker.IsTrackedAchievement = IsTrackedAchievement
            QuestieTracker.GetNumTrackedAchievements = GetNumTrackedAchievements
        end

        -- Intercept and return a Questie boolean value
        IsTrackedAchievement = function(achieveId)
            if Questie.db.char.trackedAchievementIds[achieveId] then
                return achieveId and Questie.db.char.trackedAchievementIds[achieveId]
            else
                return false
            end
        end

        -- Intercept and return only what Questie is tracking
        GetNumTrackedAchievements = function(isQuestie)
            if isQuestie and Questie.db.char.trackedAchievementIds then
                local numTrackedAchievements = 0
                for _ in pairs(Questie.db.char.trackedAchievementIds) do
                    numTrackedAchievements = numTrackedAchievements + 1
                end
                return numTrackedAchievements
            else
                return 0
            end
        end
    end

    if Questie.db.profile.showBlizzardQuestTimer then
        TrackerQuestTimers:ShowBlizzardTimer()
    else
        TrackerQuestTimers:HideBlizzardTimer()
    end

    QuestieTracker.alreadyHooked = true
    QuestieCombatQueue:Queue(function()
        QuestieTracker:Update()
    end)
end

function QuestieTracker:RemoveQuest(questId)
    -- Guard against being called before database initialization
    if not Questie.db or not Questie.db.char then
        Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:RemoveQuest] Called before DB initialization, skipping:", questId)
        return
    end
    
    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:RemoveQuest] - ", questId)
    if Questie.db.char.collapsedQuests then
        Questie.db.char.collapsedQuests[questId] = nil
    end

    -- Let's remove the Quest from the Tracker tables just in case...
    if Questie.db.char.AutoUntrackedQuests and Questie.db.char.AutoUntrackedQuests[questId] then
        Questie.db.char.AutoUntrackedQuests[questId] = nil
    elseif Questie.db.char.TrackedQuests and Questie.db.char.TrackedQuests[questId] then
        Questie.db.char.TrackedQuests[questId] = nil
    end

    if Questie.db.char.TrackerFocus then
        if (type(Questie.db.char.TrackerFocus) == "number" and Questie.db.char.TrackerFocus == questId)
            or (type(Questie.db.char.TrackerFocus) == "string" and Questie.db.char.TrackerFocus:sub(1, #tostring(questId)) == tostring(questId)) then
            TrackerUtils:UnFocus()
            QuestieQuest:ToggleNotes(true)
        end
    end
end

function QuestieTracker.RemoveQuestWatch(index, isQuestie)
    -- RemoveQuestWatch called
    if QuestieTracker.disableHooks then
        -- Hooks disabled
        return
    end

    if not isQuestie then
        if index then
            local questId = select(8, GetQuestLogTitle(index))
            -- Got questId from title
            if questId == 0 then
                -- When an objective progresses in TBC "index" is the questId, but when a quest is manually removed from
                --  the quest watch (e.g. shift clicking it in the quest log) "index" is the questLogIndex.
                questId = index
                -- Using index as questId
            end

            if questId then
                -- Check if this was just added (within last 0.5 seconds)
                -- If so, Blizzard is rejecting the track - mark as untrackable
                local now = GetTime()
                if QuestieTracker._lastTrackedQuest and QuestieTracker._lastTrackedQuest.id == questId and 
                   (now - QuestieTracker._lastTrackedQuest.time) < 0.5 then
                    -- Try to understand why Blizzard rejected it
                    local questIndex = GetQuestLogIndexByID(questId)
                    local title, level, tag, isHeader, isCollapsed, isComplete = GetQuestLogTitle(questIndex or index)
                    -- Quest immediately untracked by Blizzard
                    if not QuestieTracker._untrackableQuests then
                        QuestieTracker._untrackableQuests = {}
                    end
                    QuestieTracker._untrackableQuests[questId] = true
                end
                
                -- Untracking quest
                QuestieTracker:UntrackQuestId(questId)
                Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker.RemoveQuestWatch] - by Blizzard")
            end
        end
    else
        Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker.RemoveQuestWatch] - by Questie")
    end
end

function QuestieTracker:UntrackQuestId(questId)
    -- Untrack quest
    if not Questie.db.profile.autoTrackQuests then
        -- Manual mode
        Questie.db.char.TrackedQuests[questId] = nil
    else
        if not Questie.db.char.AutoUntrackedQuests then
            Questie.db.char.AutoUntrackedQuests = {}
        end
        -- Allow users to untrack any quest, including Epoch quests
        -- Data collection happens separately and doesn't depend on tracker visibility
        -- Auto mode
        Questie.db.char.AutoUntrackedQuests[questId] = true
    end

    if Questie.db.profile.hideUntrackedQuestsMapIcons then
        -- Hides objective icons for untracked quests.
        QuestieQuest:ToggleNotes(false)

        -- Removes objective tooltips for untracked quests.
        QuestieTooltips:RemoveQuest(questId)
    end

    QuestieCombatQueue:Queue(function()
        QuestieTracker:Update()
    end)
end

function QuestieTracker:AQW_Insert(index, expire)
    -- AQW_Insert called
    if (not Questie.db.profile.trackerEnabled) or (index == 0) or (index == nil) then
        -- Early return
        return
    end

    -- This prevents double calling this function
    local now = GetTime()
    if index and index == QuestieTracker.last_aqw and (now - lastAQW) < 0.1 then
        -- Prevented double call
        return
    end

    lastAQW = now
    QuestieTracker.last_aqw = index

    -- This removes quests from the Blizzard QuestWatchFrame so when the option "Show Blizzard Timer" is enabled,
    -- that is all the player will see. This also prevents hitting the Blizzard Quest Watch Limit.
    RemoveQuestWatch(index, true)

    local questId = select(8, GetQuestLogTitle(index))
    -- Got questId
    if questId == 0 then
        -- When an objective progresses in TBC "index" is the questId, but when a quest is manually added to the quest watch
        -- (e.g. shift clicking it in the quest log) "index" is the questLogIndex.
        questId = index
        -- Using index as questId
    end

    if questId > 0 then
        -- FIRST: Ensure we have quest data (create runtime stub if needed)
        local quest = QuestiePlayer.currentQuestlog[questId] or QuestieDB.GetQuest(questId)
        
        -- If quest not found anywhere, try to create a runtime stub BEFORE making tracking decisions
        if not quest then
            local qli = GetQuestLogIndexByID and GetQuestLogIndexByID(questId)
            if not qli then
                -- Try using the index directly if GetQuestLogIndexByID doesn't exist
                qli = index
            end
            
            if qli then
                -- Create runtime stub for missing quest
                local title, _, _, isHeader = GetQuestLogTitle(qli)
                if not isHeader and title and title ~= "" then
                    -- Create a basic stub so tracking logic can work
                    Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker] Creating runtime stub for quest", questId, "before tracking")
                    -- This will be enhanced later, but we need something in currentQuestlog NOW
                    QuestiePlayer.currentQuestlog[questId] = {
                        Id = questId,
                        name = title,
                        __isRuntimeStub = true,
                        Objectives = {}
                    }
                end
            end
        end
        
        -- THEN: Handle tracking logic with quest data available
        -- These checks makes sure the only way to track a quest is through the Blizzard Quest Log
        -- or another Addon hooked into the Blizzard Quest Log that replaces the default Quest Log.
        if not Questie.db.profile.autoTrackQuests then
            if Questie.db.char.TrackedQuests[questId] then
                Questie.db.char.TrackedQuests[questId] = nil
            else
                -- Add quest to the tracker
                Questie.db.char.TrackedQuests[questId] = true
            end
        else
            -- Auto-track mode
            -- For newly accepted quests, ensure they're tracked
            -- This function is called both when accepting quests AND when manually clicking tracker checkbox
            
            -- Check if this is a manual tracking toggle (quest log is open and not shift-clicking)
            -- During initialization sync, treat as automatic tracking (not manual toggle)
            local isManualToggle = QuestLogFrame and QuestLogFrame:IsShown() and not IsShiftKeyDown() and not QuestieTracker._syncingWatchedQuests
            
            if not Questie.db.char.AutoUntrackedQuests then
                Questie.db.char.AutoUntrackedQuests = {}
            end
            
            -- Determine if quest is currently tracked
            -- IMPORTANT: If AutoUntrackedQuests is empty or nil, we should check the actual tracker state
            local isCurrentlyTracked = false
            if Questie.db.char.AutoUntrackedQuests and next(Questie.db.char.AutoUntrackedQuests) then
                -- AutoUntrackedQuests has data, use it
                isCurrentlyTracked = not Questie.db.char.AutoUntrackedQuests[questId]
            else
                -- AutoUntrackedQuests is empty - need to check actual state
                -- During initial login, assume quests are NOT tracked unless proven otherwise
                isCurrentlyTracked = false
                -- AutoUntrackedQuests empty
            end
            -- Check tracking status
            
            -- Don't handle shift-click here - it's already handled in Hooks.lua
            -- which properly toggles tracking. This was causing shift-click to only untrack.
            if isManualToggle then
                -- Manual toggle from quest log checkbox
                if isCurrentlyTracked then
                    -- Currently tracked, untrack it
                    -- Allow untracking any quest including Epoch quests
                    Questie.db.char.AutoUntrackedQuests[questId] = true
                    -- Manual untrack
                else
                    -- Currently untracked, track it
                    Questie.db.char.AutoUntrackedQuests[questId] = nil
                    -- Manual track
                end
                
                -- Remember this quest was just tracked (for detecting immediate untracks)
                QuestieTracker._lastTrackedQuest = {id = questId, time = GetTime()}
            else
                -- Quest acceptance, initialization sync, or other automatic tracking
                if QuestieTracker._syncingWatchedQuests then
                    -- During initialization, watched quests should stay tracked
                    -- Don't add them to the untracked list
                    if Questie.db.char.AutoUntrackedQuests[questId] then
                        -- Quest was manually untracked before, respect that choice
                        -- Keep untracked (user choice)
                    else
                        -- Quest is watched in Blizzard UI, ensure it's tracked in Questie
                        -- Should be tracked
                    end
                else
                    -- Normal quest acceptance or automatic tracking
                    -- In auto-track mode, new quests should be tracked by default
                    -- Remove from untracked list if it's there
                    if Questie.db.char.AutoUntrackedQuests[questId] then
                        Questie.db.char.AutoUntrackedQuests[questId] = nil
                        -- Auto-tracking new quest
                    end
                end
            end
        end

        -- Re-check for quest after potential stub creation
        quest = QuestiePlayer.currentQuestlog[questId] or QuestieDB.GetQuest(questId)
        
        -- If still not found (shouldn't happen now), create a more detailed stub
        if not quest then
            local qli = GetQuestLogIndexByID and GetQuestLogIndexByID(questId)
            if qli then
                local title, _, _, isHeader, _, apiIsComplete = GetQuestLogTitle(qli)
                Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:AQW_Insert] Quest", questId, "title from Blizzard API:", title, "isHeader:", isHeader)
                if not isHeader and title and title ~= "" then
                    -- Try to get objectives - use 3.3.5a API only since we're on 3.3.5a client
                    local objectives = {}
                    
                    -- 3.3.5a API: Use SelectQuestLogEntry + GetQuestLogLeaderBoard
                    if qli and SelectQuestLogEntry and GetNumQuestLeaderBoards and GetQuestLogLeaderBoard then
                        SelectQuestLogEntry(qli)
                        local numObjectives = GetNumQuestLeaderBoards()
                        Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:AQW_Insert] 3.3.5a: Found", numObjectives, "objectives for quest", questId)
                        if numObjectives and numObjectives > 0 then
                            for i = 1, numObjectives do
                                local description, type, finished, numFulfilled, numRequired = GetQuestLogLeaderBoard(i)
                                if description then
                                    objectives[i] = {
                                        Id = nil,
                                        Index = i,
                                        questId = questId,
                                        Description = description,
                                        Collected = tonumber(numFulfilled) or 0,
                                        Needed = tonumber(numRequired) or 0,
                                        Completed = finished or false,
                                        spawnList = {},
                                        AlreadySpawned = {},
                                        isUpdated = true,
                                        Coordinates = nil,
                                        RequiredRepValue = nil,
                                    }
                                    Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:AQW_Insert] 3.3.5a Objective", i, "desc:", description, "fulfilled:", numFulfilled, "required:", numRequired, "finished:", finished)
                                end
                            end
                        end
                    end
                    
                    -- Create a minimal runtime stub
                    quest = {
                        Id = questId,
                        name = "[Epoch] " .. tostring(title),
                        LocalizedName = "[Epoch] " .. tostring(title),
                        Level = QuestiePlayer.GetPlayerLevel(),
                        level = QuestiePlayer.GetPlayerLevel(),
                        zoneOrSort = 0,
                        Objectives = objectives,
                        SpecialObjectives = {},
                        ObjectiveData = {},
                        Color = QuestieLib:ColorWheel(),
                        IsRepeatable = false,
                        sourceItemId = 0,
                        requiredSourceItems = nil,
                        Description = { "" },
                        WasComplete = nil,
                        isComplete = (apiIsComplete == 1) or nil,
                        __isRuntimeStub = true,
                    }
                    
                    -- Add basic IsComplete method
                    function quest:IsComplete()
                        if self.isComplete ~= nil then
                            return self.isComplete and 1 or 0
                        end
                        return QuestieDB.IsComplete(self.Id)
                    end
                    
                    -- Store the stub
                    QuestiePlayer.currentQuestlog[questId] = quest
                    Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:AQW_Insert] Created runtime stub for quest", questId, "with name:", quest.name)
                else
                    Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:AQW_Insert] Cannot create stub - invalid title or is header for quest", questId)
                end
            else
                Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:AQW_Insert] Cannot find quest", questId, "in Blizzard quest log")
            end
        end
        
        -- Debug logging
        if quest and quest.__isRuntimeStub then
            Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:AQW_Insert] Using runtime stub for quest", questId)
        elseif not quest then
            Questie:Debug(Questie.DEBUG_INFO, "[QuestieTracker:AQW_Insert] Quest not found anywhere:", questId)
        end

        if quest then
            -- Make sure quests or zones (re)added to the tracker isn't in a minimized state
            local zoneId = quest.zoneOrSort
            if Questie.db.char.collapsedQuests[questId] == true then
                Questie.db.char.collapsedQuests[questId] = nil
            end

            if Questie.db.char.collapsedZones[zoneId] == true then
                Questie.db.char.collapsedZones[zoneId] = nil
            end

            -- Unhide quest icons when retracking quests.
            if Questie.db.profile.hideUntrackedQuestsMapIcons then
                -- Shows objective icons for tracked quests.
                QuestieQuest:ToggleNotes(true)

                -- Readd objective tooltips for tracked quests.
                QuestieQuest:PopulateObjectiveNotes(quest)
            end
        else
            if Questie.IsSoD then
                QuestieDebugOffer.QuestTracking(questId)
            else
                Questie:Error("Missing quest " .. tostring(questId) .. "," .. tostring(expire) .. " during tracker update")
            end
        end
    end
    -- Queue tracker update
    QuestieCombatQueue:Queue(function()
        QuestieTracker:Update()
    end)
end

QuestieTracker.RemoveTrackedAchievement = function(achieveId, isQuestie)
    if QuestieTracker.disableHooks then
        return
    end

    if not isQuestie then
        if achieveId then
            QuestieTracker:UntrackAchieveId(achieveId)
            Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker.RemoveTrackedAchievement] - by Blizzard")
        end
    else
        Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker.RemoveTrackedAchievement] - by Questie")
    end
end

function QuestieTracker:UpdateAchieveTrackerCache(achieveId)
    -- Since we're essentially adding & force removing an achievement from the QuestWatch frame while we add an achievement to the Questie Tracker, the event this
    -- function is called from, TRACKED_ACHIEVEMENT_LIST_CHANGED, fires twice. When we remove an achievement from the Questie Tracker the event still fires twice
    -- because the Blizzard function responsible for this is essentially a "toggle". It quickly re-adds the achievement to the QuestWatch frame and then removes it.
    -- So, again this event again fires twice. We only need to allow this to run once and it often fires before the Questie.db.char.trackedAchievementIds table is
    -- updated so we're going to throttle this 1/10th of a second.
    if Questie.db.profile.trackerEnabled then
        if achieveId then
            C_Timer.After(0.1, function()
                Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:UpdateAchieveTrackerCache] - ", achieveId)

                if (not Questie.db.profile.trackerEnabled) or (achieveId == 0) then
                    return
                end

                -- Look for changes in the Saved VAR and update the achievement cache
                if Questie.db.char.trackedAchievementIds[achieveId] ~= trackedAchievementIds[achieveId] then
                    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:UpdateAchieveTrackerCache] - Change Detected!")

                    trackedAchievementIds[achieveId] = Questie.db.char.trackedAchievementIds[achieveId]

                    QuestieCombatQueue:Queue(function()
                        C_Timer.After(0.1, function()
                            QuestieTracker:Update()
                        end)
                    end)
                else
                    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:UpdateAchieveTrackerCache] - No Change Detected!")
                end
            end)
        end
    end
end

function QuestieTracker:UntrackAchieveId(achieveId)
    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:UntrackAchieve] - ", achieveId)
    if Questie.db.char.trackedAchievementIds[achieveId] then
        Questie.db.char.trackedAchievementIds[achieveId] = nil
    end
end

function QuestieTracker:TrackAchieve(achieveId)
    Questie:Debug(Questie.DEBUG_DEVELOP, "[QuestieTracker:TrackAchieve] - ", achieveId)
    if (not Questie.db.profile.trackerEnabled) or (achieveId == 0) then
        return
    end

    -- If an achievement is already tracked in the Achievement UI then untrack it (Mimicks a Toggle effect).
    if Questie.db.char.trackedAchievementIds[achieveId] then
        QuestieTracker:UntrackAchieveId(achieveId)
        RemoveTrackedAchievement(achieveId, true)
        return
    end

    -- Prevents tracking more than 10 Achievements
    if (GetNumTrackedAchievements(true) == 10) then
        RemoveTrackedAchievement(achieveId, true)
        UIErrorsFrame:AddMessage(format(l10n("You may only track 10 achievements at a time."), 10), 1.0, 0.1, 0.1, 1.0)
        return
    end

    -- This prevents double calling this function
    local now = GetTime()
    if achieveId and achieveId == QuestieTracker.last_achieveId and (now - lastAchieveId) < 0.1 then
        return
    end

    lastAchieveId = now
    QuestieTracker.last_achieveId = achieveId

    -- This removes achievements from the Blizzard QuestWatchFrame so when the
    -- option "Show Blizzard Timer" is enabled, that is all the player will see.
    RemoveTrackedAchievement(achieveId, true)

    if achieveId > 0 then
        -- This handles the Track check box in the Achievement UI
        local mouseFocus
        local frameMatch

        -- Krowi isn't using this check box for their Achievement frame
        if not IsAddOnLoaded("Krowi_AchievementFilter") then
            mouseFocus = GetMouseFocus():GetName()
            frameMatch = strmatch(mouseFocus, "(AchievementFrameAchievementsContainerButton%dTracked.*)")
        end

        -- Upon first login or reloadui, this frame isn't loaded
        if (not AchievementFrame) then
            AchievementFrame_LoadUI()
        end

        -- This check makes sure the only way to track an achieve is through the Blizzard Achievement UI
        if Questie.db.char.trackedAchievementIds[achieveId] then
            Questie.db.char.trackedAchievementIds[achieveId] = nil
        elseif IsShiftKeyDown() and AchievementFrame:IsShown() then
            Questie.db.char.trackedAchievementIds[achieveId] = true
        elseif AchievementFrame:IsShown() and (mouseFocus == frameMatch) then
            Questie.db.char.trackedAchievementIds[achieveId] = true
        end

        -- Forces the achievement out of a minimized state
        if Questie.db.char.collapsedQuests[achieveId] == true then
            Questie.db.char.collapsedQuests[achieveId] = nil
        end

        -- Forces the 'Achievement Zone' out of a minimized state
        if Questie.db.char.collapsedZones["Achievements"] == true then
            Questie.db.char.collapsedZones["Achievements"] = nil
        end
    end
end
