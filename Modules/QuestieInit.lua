-- luacheck: globals QuestieLoader Questie UnitClass
---@class QuestieInit
local QuestieInit = QuestieLoader:CreateModule("QuestieInit")
local _QuestieInit = QuestieInit.private

---@type ThreadLib
local ThreadLib = QuestieLoader:ImportModule("ThreadLib")

---@type QuestEventHandler
local QuestEventHandler = QuestieLoader:ImportModule("QuestEventHandler")
---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")
---@type ZoneDB
local ZoneDB = QuestieLoader:ImportModule("ZoneDB")
---@type Migration
local Migration = QuestieLoader:ImportModule("Migration")
---@type QuestieProfessions
local QuestieProfessions = QuestieLoader:ImportModule("QuestieProfessions")
---@type QuestieTracker
local QuestieTracker = QuestieLoader:ImportModule("QuestieTracker")
---@type QuestieDataCollector
local QuestieDataCollector = QuestieLoader:ImportModule("QuestieDataCollector")
---@type QuestieMap
local QuestieMap = QuestieLoader:ImportModule("QuestieMap")
---@type QuestieLib
local QuestieLib = QuestieLoader:ImportModule("QuestieLib")
---@type QuestiePlayer
local QuestiePlayer = QuestieLoader:ImportModule("QuestiePlayer")
---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
-- Use global Questie provided by core (do not import to avoid separate instance)
-- luacheck: globals Questie
-- WoW API locals for linters
---@type Cleanup
local QuestieCleanup = QuestieLoader:ImportModule("Cleanup")
---@type DBCompiler
local QuestieDBCompiler = QuestieLoader:ImportModule("DBCompiler")
---@type QuestieCorrections
local QuestieCorrections = QuestieLoader:ImportModule("QuestieCorrections")
---@type QuestieMenu
local QuestieMenu = QuestieLoader:ImportModule("QuestieMenu")
---@type Townsfolk
local Townsfolk = QuestieLoader:ImportModule("Townsfolk")
---@type QuestieQuest
local QuestieQuest = QuestieLoader:ImportModule("QuestieQuest")
---@type IsleOfQuelDanas
local IsleOfQuelDanas = QuestieLoader:ImportModule("IsleOfQuelDanas")
---@type QuestieEventHandler
local QuestieEventHandler = QuestieLoader:ImportModule("QuestieEventHandler")
---@type QuestieJourney
local QuestieJourney = QuestieLoader:ImportModule("QuestieJourney")
---@type HBDHooks
local HBDHooks = QuestieLoader:ImportModule("HBDHooks")
---@type ChatFilter
local ChatFilter = QuestieLoader:ImportModule("ChatFilter")
---@type QuestieShutUp
local QuestieShutUp = QuestieLoader:ImportModule("QuestieShutUp")
---@type Hooks
local Hooks = QuestieLoader:ImportModule("Hooks")
---@type QuestieValidateGameCache
local QuestieValidateGameCache = QuestieLoader:ImportModule("QuestieValidateGameCache")
---@type MinimapIcon
local MinimapIcon = QuestieLoader:ImportModule("MinimapIcon")
---@type QuestieComms
local QuestieComms = QuestieLoader:ImportModule("QuestieComms");
---@type QuestieOptions
local QuestieOptions = QuestieLoader:ImportModule("QuestieOptions");
---@type QuestieCoords
local QuestieCoords = QuestieLoader:ImportModule("QuestieCoords");
---@type QuestieTooltips
local QuestieTooltips = QuestieLoader:ImportModule("QuestieTooltips");
---@type QuestieDBMIntegration
local QuestieDBMIntegration = QuestieLoader:ImportModule("QuestieDBMIntegration");
---@type TrackerQuestTimers
local TrackerQuestTimers = QuestieLoader:ImportModule("TrackerQuestTimers")
---@type QuestieCombatQueue
local QuestieCombatQueue = QuestieLoader:ImportModule("QuestieCombatQueue")
---@type QuestieSlash
local QuestieSlash = QuestieLoader:ImportModule("QuestieSlash")
---@type QuestXP
local QuestXP = QuestieLoader:ImportModule("QuestXP")
---@type Tutorial
local Tutorial = QuestieLoader:ImportModule("Tutorial")
---@type WorldMapButton
local WorldMapButton = QuestieLoader:ImportModule("WorldMapButton")
---@type AvailableQuests
local AvailableQuests = QuestieLoader:ImportModule("AvailableQuests")
---@type SeasonOfDiscovery
local SeasonOfDiscovery = QuestieLoader:ImportModule("SeasonOfDiscovery")
---@type QuestRewardTooltipFix
local QuestRewardTooltipFix = QuestieLoader:ImportModule("QuestRewardTooltipFix")

--- COMPATIBILITY ---
local WOW_PROJECT_ID = QuestieCompat.WOW_PROJECT_ID
local C_Timer = QuestieCompat.C_Timer

local coYield = coroutine.yield

local function loadFullDatabase()
    print("\124cFF4DDBFF [1/9] " .. l10n("Loading database") .. "...")

    QuestieInit:LoadBaseDB()

    print("\124cFF4DDBFF [2/9] " .. l10n("Applying database corrections") .. "...")

    coYield()
    QuestieCorrections:Initialize()

    print("\124cFF4DDBFF [3/9] " .. l10n("Initializing townfolks") .. "...")
    coYield()
    Townsfolk.Initialize()

    print("\124cFF4DDBFF [4/9] " .. l10n("Initializing locale") .. "...")
    coYield()
    l10n:Initialize()

    coYield()
    QuestieDB.private:DeleteGatheringNodes()

    print("\124cFF4DDBFF [5/9] " .. l10n("Optimizing waypoints") .. "...")
    coYield()
    QuestieCorrections:PreCompile()
end

---Run the validator
local function runValidator()
    if type(QuestieDB.questData) == "string" or type(QuestieDB.npcData) == "string" or type(QuestieDB.objectData) == "string" or type(QuestieDB.itemData) == "string" then
        Questie:Error("Cannot run the validator on string data, load database first")
        return
    end
    -- Run validator
    if Questie.db.profile.debugEnabled then
        coYield()
        print("Validating NPCs...")
        QuestieDBCompiler:ValidateNPCs()
        coYield()
        print("Validating objects...")
        QuestieDBCompiler:ValidateObjects()
        coYield()
        print("Validating items...")
        QuestieDBCompiler:ValidateItems()
        coYield()
        print("Validating quests...")
        QuestieDBCompiler:ValidateQuests()
    end
end

-- ********************************************************************************
-- Start of QuestieInit.Stages ******************************************************

-- stage worker functions. Most are coroutines.
QuestieInit.Stages = {}

QuestieInit.Stages[1] = function() -- run as a coroutine
    Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieInit:Stage1] Starting the real init.")

    --? This was moved here because the lag that it creates is much less noticable here, while still initalizing correctly.
    Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieInit:Stage1] Starting QuestieOptions.Initialize Thread.")
    ThreadLib.ThreadSimple(QuestieOptions.Initialize, 0)

    MinimapIcon:Init()

    HBDHooks:Init()

    -- Migration: Fix users who have deprecated themes selected (causes invisible pins or unavailable options)
    -- Migrates 'custom', 'blizzard' (disabled for Epoch), or any invalid/unknown theme names to 'questie'
    if Questie.db.profile.iconTheme == 'custom' or 
       Questie.db.profile.iconTheme == 'blizzard' or
       (Questie.db.profile.iconTheme ~= 'questie' and 
        Questie.db.profile.iconTheme ~= 'pfquest') then
        local oldTheme = Questie.db.profile.iconTheme
        Questie:Debug(Questie.DEBUG_INFO, "[Init] Migrating from '" .. tostring(oldTheme) .. "' icon theme to 'questie' to fix invisible/invalid pins")
        Questie.db.profile.iconTheme = 'questie'
    end

    Questie:SetIcons()

    if QUESTIE_LOCALES_OVERRIDE ~= nil then
        l10n:InitializeLocaleOverride()
    end

    -- Set proper locale. Either default to client Locale or override based on user.
    if Questie.db.global.questieLocaleDiff then
        l10n:SetUILocale(Questie.db.global.questieLocale);
    else
        if QUESTIE_LOCALES_OVERRIDE ~= nil then
            l10n:SetUILocale(QUESTIE_LOCALES_OVERRIDE.locale);
        else
            l10n:SetUILocale(GetLocale());
        end
    end

    QuestieShutUp:ToggleFilters(Questie.db.profile.questieShutUp)

    coYield()
    ZoneDB:Initialize()

    coYield()
    Migration:Migrate()

    IsleOfQuelDanas.Initialize() -- This has to happen before option init

    QuestieProfessions:Init()
    QuestXP.Init()
    coYield()

    local dbCompiled = false

    local dbIsCompiled, dbCompiledOnVersion, dbCompiledLang
    if Questie.IsSoD then
        dbIsCompiled = Questie.db.global.sod.dbIsCompiled or false
        dbCompiledOnVersion = Questie.db.global.sod.dbCompiledOnVersion
        dbCompiledLang = Questie.db.global.sod.dbCompiledLang
    else
        dbIsCompiled = Questie.db.global.dbIsCompiled or false
        dbCompiledOnVersion = Questie.db.global.dbCompiledOnVersion
        dbCompiledLang = Questie.db.global.dbCompiledLang
    end

    if Questie.IsSoD then
        coYield()
        SeasonOfDiscovery.Initialize()
    end

    -- Standard recompile condition
    if (not dbIsCompiled)
        or (QuestieLib:GetAddonVersionString() ~= dbCompiledOnVersion)
        or (l10n:GetUILocale() ~= dbCompiledLang)
        or (Questie.db.global.dbCompiledExpansion ~= WOW_PROJECT_ID) then
        print("\124cFFAAEEFF" .. l10n("Questie DB has updated!") ..
            "\124r\124cFFFF6F22 " .. l10n("Data is being processed, this may take a few moments and cause some lag..."))
        loadFullDatabase()
        QuestieDBCompiler:Compile()
        dbCompiled = true
    else
        l10n:Initialize()
        coYield()
        QuestieCorrections:MinimalInit()
    end

    local dbCompiledCount = Questie.IsSoD and Questie.db.global.sod.dbCompiledCount
        or Questie.db.global.dbCompiledCount

    if (not Questie.db.char.townsfolk)
        or (dbCompiledCount ~= Questie.db.char.townsfolkVersion)
        or (Questie.db.char.townsfolkClass ~= UnitClass("player")) then
        Questie.db.char.townsfolkVersion = dbCompiledCount
        coYield()
        Townsfolk:BuildCharacterTownsfolk()
    end

    coYield()
    QuestieDB:Initialize()

    coYield()
    Tutorial.Initialize()

    --? Only run the validator on recompile if debug is enabled, otherwise it's a waste of time.
    if Questie.db.profile.debugEnabled and dbCompiled then
        if Questie.db.profile.skipValidation ~= true then
            runValidator()
            print("\124cFF4DDBFF Load and Validation complete.")
        else
            print("\124cFF4DDBFF Validation skipped, load complete.")
        end
    end

    QuestieCleanup:Run()
end

QuestieInit.Stages[2] = function()
    Questie:Debug(Questie.DEBUG_INFO, "[QuestieInit:Stage2] Stage 2 start.")
    -- We do this while we wait for the Quest Cache anyway.
    l10n:PostBoot()
    QuestiePlayer:Initialize()
    coYield()
    QuestieJourney:Initialize()

    local keepWaiting = true
    -- We had users reporting that a quest did not reach a valid state in the game cache.
    -- In this case we still need to continue the initialization process, even though a specific quest might be bugged
    C_Timer.After(3, function()
        if keepWaiting then
            Questie:Debug(Questie.DEBUG_CRITICAL, "QuestieInit: Timeout waiting for Game Cache validation. Continuing.")
            keepWaiting = false
        end
    end)

    -- Continue to the next Init Stage once Game Cache's Questlog is good
    while (not QuestieValidateGameCache:IsCacheGood()) and keepWaiting do
        coYield()
    end
    keepWaiting = false
end

QuestieInit.Stages[3] = function() -- run as a coroutine
    Questie:Debug(Questie.DEBUG_INFO, "[QuestieInit:Stage3] Stage 3 start.")

    -- register events that rely on questie being initialized
    QuestieEventHandler:RegisterLateEvents()

    -- ** OLD ** Questie:ContinueInit() ** START **
    QuestieTooltips:Initialize()
    QuestieCoords:Initialize()
    TrackerQuestTimers:Initialize()
    QuestieComms:Initialize()
    QuestRewardTooltipFix:Initialize()

    QuestieSlash.RegisterSlashCommands()

    coYield()

    if Questie.db.profile.dbmHUDEnable then
        QuestieDBMIntegration:EnableHUD()
    end
    -- ** OLD ** Questie:ContinueInit() ** END **

    -- Initialize the tracker BEFORE registering quest events
    coYield()
    QuestieTracker.Initialize()
    
    coYield()
    QuestEventHandler:RegisterEvents()
    coYield()
    ChatFilter:RegisterEvents()
    QuestieMap:InitializeQueue()

    coYield()
    -- Initialize QuestieQuestUtils before QuestieQuest
    QuestieQuestUtils = QuestieLoader:ImportModule("QuestieQuestUtils")
    QuestieQuestUtils:Initialize()
    coYield()
    QuestieQuest:Initialize()
    coYield()
    WorldMapButton.Initialize()
    coYield()
    QuestieQuest:GetAllQuestIdsNoObjectives()
    coYield()
    Townsfolk.PostBoot()
    coYield()
    QuestieQuest:GetAllQuestIds()
    Hooks:HookQuestLogTitle()
    QuestieCombatQueue.Initialize()
    
    -- Initialize Data Collector if enabled or prompt user
    coYield()
    if QuestieDataCollector then
        Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieInit] QuestieDataCollector module found")
        Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieInit] dataCollectionPrompted = " .. tostring(Questie.db.profile.dataCollectionPrompted))
        Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieInit] enableDataCollection = " .. tostring(Questie.db.profile.enableDataCollection))
        
        -- Check if this is first run for community contribution
        -- TODO: Add contribution popup later if needed
        -- For now, just check if data collection is enabled
        if Questie.db.profile.enableDataCollection then
            Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieInit] Calling QuestieDataCollector:Initialize()")
            QuestieDataCollector:Initialize()
        else
            Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieInit] Data collection not enabled, skipping initialization")
        end
    else
        Questie:Debug(Questie.DEBUG_CRITICAL, "[QuestieInit] QuestieDataCollector module not found!")
    end

    local dateToday = date("%y-%m-%d")

    if Questie.db.profile.showAQWarEffortQuests and ((not Questie.db.profile.aqWarningPrintDate) or (Questie.db.profile.aqWarningPrintDate < dateToday)) then
        Questie.db.profile.aqWarningPrintDate = dateToday
        C_Timer.After(2, function()
            print("|cffff0000-----------------------------|r")
            Questie:Print("|cffff0000The AQ War Effort quests are shown for you. If your server is done you can hide those quests in the General settings of Questie!|r");
            print("|cffff0000-----------------------------|r")
        end)
    end

    if Questie.IsTBC and (not Questie.db.global.isIsleOfQuelDanasPhaseReminderDisabled) then
        C_Timer.After(2, function()
            Questie:Print(l10n("Current active phase of Isle of Quel'Danas is '%s'. Check the General settings to change the phase or disable this message.", IsleOfQuelDanas.localizedPhaseNames[Questie.db.global.isleOfQuelDanasPhase]))
        end)
    end

    coYield()
    QuestieMenu:OnLogin()

    coYield()
    if Questie.db.profile.debugEnabled then
        QuestieLoader:PopulateGlobals()
    end

    Questie.started = true

    if (Questie.IsWotlk or Questie.IsTBC) and QuestiePlayer.IsMaxLevel() then
        local lastRequestWasYesterday = Questie.db.global.lastDailyRequestDate ~= date("%d-%m-%y"); -- Yesterday or some day before
        local isPastDailyReset = Questie.db.global.lastDailyRequestResetTime < GetQuestResetTime();

        if lastRequestWasYesterday or isPastDailyReset then
            Questie.db.global.lastDailyRequestDate = date("%d-%m-%y");
            Questie.db.global.lastDailyRequestResetTime = GetQuestResetTime();
        end
    end

    -- We do this last because it will run for a while and we don't want to block the rest of the init
    coYield()
    AvailableQuests.CalculateAndDrawAll()

    Questie:Debug(Questie.DEBUG_INFO, "[QuestieInit:Stage3] Questie init done.")
end

-- End of QuestieInit.Stages ******************************************************
-- ********************************************************************************



function QuestieInit:LoadDatabase(key)
    if QuestieDB[key] then
        coYield()
        QuestieDB[key] = loadstring(QuestieDB[key]) -- load the table from string (returns a function)
        coYield()
        QuestieDB[key] = QuestieDB[key]()           -- execute the function (returns the table)
    else
        Questie:Debug(Questie.DEBUG_DEVELOP, "Database is missing, this is likely do to era vs tbc: ", key)
    end
end

function QuestieInit:LoadBaseDB()
    -- Load Classic databases as the base (they will be in QuestieDB.xxxData)
    QuestieInit:LoadDatabase("npcData")
    QuestieInit:LoadDatabase("objectData")
    QuestieInit:LoadDatabase("questData")
    QuestieInit:LoadDatabase("itemData")
    
    -- Load WotLK databases (they are stored separately in QuestieDB._wotlkXxxData)
    QuestieInit:LoadDatabase("_wotlkNpcData")
    QuestieInit:LoadDatabase("_wotlkObjectData")
    QuestieInit:LoadDatabase("_wotlkQuestData")
    QuestieInit:LoadDatabase("_wotlkItemData")
    
    -- Validate Epoch data before merging (if validator is available)
    local EpochDatabaseValidator = QuestieLoader:ImportModule("EpochDatabaseValidator")
    if EpochDatabaseValidator and Questie.db.global.epochValidationEnabled ~= false then
        local validationPassed = EpochDatabaseValidator:ValidateEpochData()
        if not validationPassed then
            Questie:Print("|cFFFF0000[Epoch] Database validation failed! Check /epochvalidate for details.|r")
        end
    end
    
    
    -- After Classic base DB tables are loaded, merge WotLK data selectively
    -- For Project Epoch (WotLK 3.3.5 server), we need:
    -- 1. All Northrend content (zones >= 65)
    -- 2. Service NPCs from WotLK (vendors, trainers, etc.)
    -- 3. WotLK-specific objects (mailboxes, portals, etc.)
    
    -- Initialize questData as empty table if it failed to load or doesn't exist
    if type(QuestieDB.questData) ~= "table" then
        QuestieDB.questData = {}
    end
    
    -- Merge WotLK quest data (only Northrend and WotLK-specific quests)
    if QuestieDB._wotlkQuestData then
        local added, overwritten = 0, 0
        for id, data in pairs(QuestieDB._wotlkQuestData) do
            -- Add WotLK quests that don't exist in Classic
            -- Skip overwriting Classic quests to prevent contamination
            if QuestieDB.questData[id] == nil then
                -- Only add if it's a Northrend quest or WotLK-specific content
                -- Quest IDs > 11000 are generally WotLK content
                if id > 11000 then
                    QuestieDB.questData[id] = data
                    added = added + 1
                end
            end
        end
        Questie:Print("Merged "..added.." WotLK quests (Northrend content)")
        QuestieDB._wotlkQuestData = nil
    end
    
    -- Initialize npcData as empty table if it failed to load or doesn't exist
    if type(QuestieDB.npcData) ~= "table" then
        QuestieDB.npcData = {}
    end
    
    -- Merge WotLK NPC data (service NPCs and Northrend NPCs)
    if QuestieDB._wotlkNpcData then
        local added, overwritten = 0, 0
        for id, data in pairs(QuestieDB._wotlkNpcData) do
            local shouldMerge = false
            
            -- Check if it's a service NPC (vendor, trainer, innkeeper, etc.)
            local npcFlags = data[15] -- npcFlags field
            if npcFlags and npcFlags > 0 then
                -- ALWAYS use WotLK data for service NPCs to get correct flag values
                -- Classic has different flag values that are wrong for WotLK
                shouldMerge = true
            elseif id > 23000 then -- Northrend NPCs generally have higher IDs
                shouldMerge = true
            end
            
            if shouldMerge then
                if QuestieDB.npcData[id] == nil then
                    QuestieDB.npcData[id] = data
                    added = added + 1
                else
                    -- Overwrite Classic data with WotLK data for service NPCs
                    -- This is critical for correct flag values
                    QuestieDB.npcData[id] = data
                    overwritten = overwritten + 1
                end
            end
        end
        Questie:Print("Merged "..added.." WotLK NPCs ("..overwritten.." Northrend overwrites)")
        QuestieDB._wotlkNpcData = nil
    end
    
    -- Initialize objectData as empty table if it failed to load or doesn't exist
    if type(QuestieDB.objectData) ~= "table" then
        QuestieDB.objectData = {}
    end
    
    -- Merge WotLK object data (keep all WotLK objects as they're usually important)
    if QuestieDB._wotlkObjectData then
        local added = 0
        for id, data in pairs(QuestieDB._wotlkObjectData) do
            if QuestieDB.objectData[id] == nil then
                QuestieDB.objectData[id] = data
                added = added + 1
            end
        end
        Questie:Print("Merged "..added.." WotLK objects")
        QuestieDB._wotlkObjectData = nil
    end
    
    -- Initialize itemData as empty table if it failed to load or doesn't exist
    if type(QuestieDB.itemData) ~= "table" then
        QuestieDB.itemData = {}
    end
    
    -- Merge WotLK item data
    if QuestieDB._wotlkItemData then
        local added = 0
        for id, data in pairs(QuestieDB._wotlkItemData) do
            if QuestieDB.itemData[id] == nil then
                QuestieDB.itemData[id] = data
                added = added + 1
            end
        end
        Questie:Print("Merged "..added.." WotLK items")
        QuestieDB._wotlkItemData = nil
    end
    
    -- Finally, merge Epoch supplemental data (this has the highest priority)
    if QuestieDB._epochQuestData then
        local added, overwritten = 0, 0
        for id, data in pairs(QuestieDB._epochQuestData) do
            if QuestieDB.questData[id] == nil then
                QuestieDB.questData[id] = data
                added = added + 1
            else
                -- For Project Epoch, prefer Epoch data over Classic data
                QuestieDB.questData[id] = data
                overwritten = overwritten + 1
            end
        end
        print("Questie Epoch: merged "..added.." quests ("..overwritten.." overwritten)")
        QuestieDB._epochQuestData = nil
    end
    if QuestieDB._epochNpcData then
        local added, overwritten = 0, 0
        for id, data in pairs(QuestieDB._epochNpcData) do
            if QuestieDB.npcData[id] == nil then
                QuestieDB.npcData[id] = data
                added = added + 1
            else
                -- For Project Epoch, prefer Epoch data over Classic data
                QuestieDB.npcData[id] = data
                overwritten = overwritten + 1
            end
        end
        print("Questie Epoch: merged "..added.." NPCs ("..overwritten.." overwritten)")
        QuestieDB._epochNpcData = nil
    end
    if QuestieDB._epochObjectData then
        local added, overwritten = 0, 0
        for id, data in pairs(QuestieDB._epochObjectData) do
            if QuestieDB.objectData[id] == nil then
                QuestieDB.objectData[id] = data
                added = added + 1
            else
                -- For Project Epoch, prefer Epoch data over Classic data
                QuestieDB.objectData[id] = data
                overwritten = overwritten + 1
            end
        end
        print("Questie Epoch: merged "..added.." objects ("..overwritten.." overwritten)")
        QuestieDB._epochObjectData = nil
    end
    if QuestieDB._epochItemData then
        local added, overwritten = 0, 0
        for id, data in pairs(QuestieDB._epochItemData) do
            if QuestieDB.itemData[id] == nil then
                QuestieDB.itemData[id] = data
                added = added + 1
            else
                -- For Project Epoch, prefer Epoch data over Classic data
                QuestieDB.itemData[id] = data
                overwritten = overwritten + 1
            end
        end
        print("Questie Epoch: merged "..added.." items ("..overwritten.." overwritten)")
        QuestieDB._epochItemData = nil
    end
end

function _QuestieInit.StartStageCoroutine()
    for i = 1, #QuestieInit.Stages do
        QuestieInit.Stages[i]()
        Questie:Debug(Questie.DEBUG_INFO, "[QuestieInit:StartStageCoroutine] Stage " .. i .. " done.")
    end
    -- Show ready message after all initialization stages complete
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Ready!", 0, 1, 0)
end

-- called by the PLAYER_LOGIN event handler
function QuestieInit:Init()
    -- Safety: if core Questie or its DB not yet ready, retry shortly instead of erroring
    if not Questie or not Questie.db then
        if C_Timer and C_Timer.After then
            print("Questie Epoch: Core not ready, deferring init 1s")
            C_Timer.After(1, function() QuestieInit:Init() end)
            return
        end
        -- Fallback: abort gracefully
        print("Questie Epoch: Core not initialized; aborting init this tick")
        return
    end
    -- EpogQuestie: Clean startup message
    local currentVersion = GetAddOnMetadata("Questie", "Version") or
                          GetAddOnMetadata("EpogQuestie", "Version") or "Unknown"
    
    local versionMessage = "|cFF00FF00[Questie-Epoch]|r Version " .. currentVersion
    
    -- Check if user dismissed an update prompt, but clear it if they've updated
    if Questie.db and Questie.db.profile and Questie.db.profile.updateDismissedVersion then
        -- Parse versions to see if user has updated
        local QuestieVersionCheck = QuestieLoader:ImportModule("QuestieVersionCheck")
        if QuestieVersionCheck then
            local currentParsed = QuestieVersionCheck:ParseVersion(currentVersion)
            local dismissedParsed = QuestieVersionCheck:ParseVersion(Questie.db.profile.updateDismissedVersion)
            
            if QuestieVersionCheck:CompareVersions(currentParsed, dismissedParsed) >= 0 then
                -- User has updated to or past the dismissed version, clear the flag
                Questie.db.profile.updateDismissedVersion = nil
            else
                -- User is still on older version
                versionMessage = versionMessage .. " |cFFFF6F22- out of date|r"
            end
        else
            versionMessage = versionMessage .. " |cFFFF6F22- out of date|r"
        end
    end
    
    versionMessage = versionMessage .. " | Check for updates at Github: https://github.com/trav346/Questie-Epoch"
    
    print(versionMessage)
    
    -- Initialize version checker
    local QuestieVersionCheck = QuestieLoader:ImportModule("QuestieVersionCheck")
    if QuestieVersionCheck then
        QuestieVersionCheck:Initialize()
    end
    
    ThreadLib.ThreadError(_QuestieInit.StartStageCoroutine,
                          Questie.db.profile.initDelay or 0,
                          l10n("Error during initialization!"))

    if Questie.db.profile.trackerEnabled then
        -- This needs to be called ASAP otherwise tracked Achievements in the Blizzard WatchFrame shows upon login
        local WatchFrame = QuestTimerFrame or WatchFrame

        if Questie.IsWotlk or QuestieCompat.Is335 then
            -- Classic WotLK
            WatchFrame:Hide()
        else
            -- Classic WoW: This moves the QuestTimerFrame off screen. A faux Hide().
            -- Otherwise, if the frame is hidden then the OnUpdate doesn't work.
            WatchFrame:ClearAllPoints()
            WatchFrame:SetPoint("TOP", "UIParent", -10000, -10000)
        end
        if not (Questie.IsWotlk or QuestieCompat.Is335) then
            -- Need to hook this ASAP otherwise the scroll bars show up
            hooksecurefunc("ScrollFrame_OnScrollRangeChanged", function()
                if TrackedQuestsScrollFrame then
                    TrackedQuestsScrollFrame.ScrollBar:Hide()
                end

                if QuestieProfilerScrollFrame then
                    QuestieProfilerScrollFrame.ScrollBar:Hide()
                end
            end)
        end
    end
end
