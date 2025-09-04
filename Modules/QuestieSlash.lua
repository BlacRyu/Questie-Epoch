---@class QuestieSlash
local QuestieSlash = QuestieLoader:CreateModule("QuestieSlash")

---@type QuestieOptions
local QuestieOptions = QuestieLoader:ImportModule("QuestieOptions")
---@type QuestieJourney
local QuestieJourney = QuestieLoader:ImportModule("QuestieJourney")
---@type QuestieQuest
local QuestieQuest = QuestieLoader:ImportModule("QuestieQuest")
---@type QuestieTracker
local QuestieTracker = QuestieLoader:ImportModule("QuestieTracker")
---@type QuestieSearch
local QuestieSearch = QuestieLoader:ImportModule("QuestieSearch")
---@type QuestieMap
local QuestieMap = QuestieLoader:ImportModule("QuestieMap")
---@type QuestieLib
local QuestieLib = QuestieLoader:ImportModule("QuestieLib")
---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")
---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")
---@type QuestieCombatQueue
local QuestieCombatQueue = QuestieLoader:ImportModule("QuestieCombatQueue")


function QuestieSlash.RegisterSlashCommands()
    Questie:RegisterChatCommand("questieclassic", QuestieSlash.HandleCommands)
    Questie:RegisterChatCommand("questie", QuestieSlash.HandleCommands)
end

function QuestieSlash.HandleCommands(input)
    input = string.trim(input, " ");

    local commands = {}
    for c in string.gmatch(input, "([^%s]+)") do
        table.insert(commands, c)
    end

    -- Parse primary/secondary command early for all handlers
    local mainCommand = commands[1]
    local subCommand = commands[2]


    -- /questie
    if mainCommand == "" or not mainCommand then
        QuestieCombatQueue:Queue(function()
            QuestieOptions:OpenConfigWindow();
        end)

        if QuestieJourney:IsShown() then
            QuestieJourney.ToggleJourneyWindow();
        end
        return ;
    end

    -- /questie help || /questie ?
    if mainCommand == "help" or mainCommand == "?" then
        print(Questie:Colorize(l10n("Questie Commands"), "yellow"));
        print(Questie:Colorize("/questie - " .. l10n("Toggles the Config window"), "yellow"));
        print(Questie:Colorize("/questie toggle - " .. l10n("Toggles showing questie on the map and minimap"), "yellow"));
        print(Questie:Colorize("/questie tomap [<npcId>/<npcName>/reset] - " .. l10n("Adds manual notes to the map for a given NPC ID or name. If the name is ambiguous multipe notes might be added. Without a second command the target will be added to the map. The 'reset' command removes all notes"), "yellow"));
        print(Questie:Colorize("/questie minimap - " .. l10n("Toggles the Minimap Button for Questie"), "yellow"));
        print(Questie:Colorize("/questie journey - " .. l10n("Toggles the My Journey window"), "yellow"));
        print(Questie:Colorize("/questie tracker [show/hide/reset/clear/debug] - " .. l10n("Toggles the Tracker. Add 'show', 'hide', 'reset', 'clear', 'debug' to explicit show/hide, reset, clear untracked list, or debug the Tracker"), "yellow"));
        print(Questie:Colorize("/questie id - Shows quest IDs for all quests in your quest log", "yellow"));
        print(Questie:Colorize("/questie quest <id> - Debug info for a specific quest ID", "yellow"));
        print(Questie:Colorize("/questie dumplog - " .. l10n("Export your quest log data for troubleshooting"), "yellow"));
        print(Questie:Colorize("/questie flex - " .. l10n("Flex the amount of quests you have completed so far"), "yellow"));
        print(Questie:Colorize("/questie doable [questID] - " .. l10n("Prints whether you are eligibile to do a quest"), "yellow"));
        return;
    end

    -- /questie toggle
    if mainCommand == "toggle" then
        Questie.db.profile.enabled = (not Questie.db.profile.enabled)
        QuestieQuest:ToggleNotes(Questie.db.profile.enabled);

        -- Close config window if it's open to avoid desyncing the Checkbox
        QuestieOptions:HideFrame();
        return;
    end

    if mainCommand == "reload" then
        QuestieQuest:SmoothReset()
        return
    end

    -- /questie minimap
    if mainCommand == "minimap" then
        Questie.db.profile.minimap.hide = not Questie.db.profile.minimap.hide;

        if Questie.db.profile.minimap.hide then
            Questie.minimapConfigIcon:Hide("Questie");
        else
            Questie.minimapConfigIcon:Show("Questie");
        end
        return;
    end

    -- /questie journey (or /questie journal, because of a typo)
    if mainCommand == "journey" or mainCommand == "journal" then
        QuestieJourney.ToggleJourneyWindow();
        QuestieOptions:HideFrame();
        return;
    end
    
    -- /questie refreshcomplete - Force refresh completed quests and clean up stuck map icons
    if mainCommand == "refreshcomplete" then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Refreshing quest icons...", 0, 1, 0)
        
        -- Try to query server for completed quests (may not work on all servers)
        local serverQueryAttempted = false
        if QueryQuestsCompleted then
            serverQueryAttempted = true
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Attempting server query for completed quests...", 0, 1, 0)
            QueryQuestsCompleted()
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[Questie]|r Server query not available, using local data only.", 1, 1, 0)
        end
        
        -- Set up refresh logic with timeout protection
        local refreshFrame = CreateFrame("Frame")
        local timeoutTimer
        local refreshExecuted = false
        
        local function executeRefresh()
            if refreshExecuted then return end
            refreshExecuted = true
            
            -- Cancel timeout if it exists
            if timeoutTimer then
                timeoutTimer:SetScript("OnUpdate", nil)
            end
            
            -- Update completed quest database if server query worked
            if Questie.db.char.complete and GetQuestsCompleted then
                GetQuestsCompleted(Questie.db.char.complete)
            end
            
            -- Force a complete refresh of all quest icons
            QuestieQuest:SmoothReset()
            
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Quest icons refreshed! Map has been redrawn.", 0, 1, 0)
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r If icons are still missing, try /reload", 0, 1, 0)
            
            -- Clean up
            refreshFrame:UnregisterAllEvents()
        end
        
        if serverQueryAttempted then
            -- Set up listener for server response
            refreshFrame:RegisterEvent("QUEST_QUERY_COMPLETE")
            refreshFrame:SetScript("OnEvent", function(self, event)
                DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Server query completed.", 0, 1, 0)
                executeRefresh()
            end)
            
            -- Set up timeout in case server never responds (3 seconds)
            timeoutTimer = CreateFrame("Frame")
            local elapsed = 0
            timeoutTimer:SetScript("OnUpdate", function(self, deltaTime)
                elapsed = elapsed + deltaTime
                if elapsed >= 3 then
                    DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[Questie]|r Server query timeout - refreshing with local data.", 1, 1, 0)
                    executeRefresh()
                end
            end)
        else
            -- No server query available, refresh immediately
            executeRefresh()
        end
        
        return;
    end

    -- /questie checkcomplete <questId> - Check if a specific quest is marked as complete
    if mainCommand == "checkcomplete" then
        local questIdOrName = subCommand
        if not questIdOrName then
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000[Questie]|r Usage: /questie checkcomplete <questId or partial name>", 1, 0, 0)
            return
        end
        
        local questId = tonumber(questIdOrName)
        
        if questId then
            -- Single quest ID check
            local isComplete = Questie.db.char.complete[questId]
            local isServerComplete = IsQuestFlaggedCompleted(questId)
            local questData = QuestieDB:GetQuest(questId)
            local questName = questData and questData.name or "Unknown Quest"
            
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Quest " .. questId .. " (" .. questName .. "):", 0, 1, 0)
            DEFAULT_CHAT_FRAME:AddMessage("  Local DB: " .. (isComplete and "|cFF00FF00Complete|r" or "|cFFFF0000Not Complete|r"), 1, 1, 1)
            DEFAULT_CHAT_FRAME:AddMessage("  Server Check: " .. (isServerComplete and "|cFF00FF00Complete|r" or "|cFFFF0000Not Complete|r"), 1, 1, 1)
            
            if isComplete and not isServerComplete then
                DEFAULT_CHAT_FRAME:AddMessage("  |cFFFFFF00Warning: Local DB says complete but server says not complete!|r", 1, 1, 0)
            elseif not isComplete and isServerComplete then
                DEFAULT_CHAT_FRAME:AddMessage("  |cFFFFFF00Warning: Server says complete but local DB says not complete!|r", 1, 1, 0)
            end
        else
            -- Search by partial name
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Searching for quests matching: " .. questIdOrName, 0, 1, 0)
            local found = false
            
            -- Search all quest IDs we know about
            for id = 1, 30000 do
                local questData = QuestieDB:GetQuest(id)
                if questData and questData.name and string.find(string.lower(questData.name), string.lower(questIdOrName)) then
                    found = true
                    local isComplete = Questie.db.char.complete[id]
                    local isServerComplete = IsQuestFlaggedCompleted(id)
                    
                    DEFAULT_CHAT_FRAME:AddMessage(string.format("  [%d] %s - Local: %s, Server: %s", 
                        id, 
                        questData.name,
                        isComplete and "|cFF00FF00Complete|r" or "|cFFFF0000Not Complete|r",
                        isServerComplete and "|cFF00FF00Complete|r" or "|cFFFF0000Not Complete|r"
                    ), 1, 1, 1)
                end
            end
            
            if not found then
                DEFAULT_CHAT_FRAME:AddMessage("  No quests found matching: " .. questIdOrName, 1, 0, 0)
            end
        end
        
        return
    end
    
    -- /questie fixduplicates - Fix duplicate quest issues like "The Killing Fields"
    if mainCommand == "fixduplicates" then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Checking for duplicate quest issues...", 0, 1, 0)
        
        -- Known duplicate quest sets (quests with same name but different IDs)
        local duplicateSets = {
            {name = "The Killing Fields", ids = {9, 26993, 26994, 26995}},
            {name = "Hand of Azora", ids = {26696, 26697, 26700}},
            {name = "My Sister Isabetta", ids = {27207, 27208, 27209}},
            {name = "The Barony Mordis", ids = {26538, 26539}},
        }
        
        local fixedCount = 0
        
        for _, set in pairs(duplicateSets) do
            local anyComplete = false
            local completeIds = {}
            local incompleteIds = {}
            
            -- Check if any version is complete
            for _, id in pairs(set.ids) do
                if Questie.db.char.complete[id] or IsQuestFlaggedCompleted(id) then
                    anyComplete = true
                    table.insert(completeIds, id)
                else
                    table.insert(incompleteIds, id)
                end
            end
            
            -- If any version is complete, mark all as complete and remove from map
            if anyComplete and #incompleteIds > 0 then
                DEFAULT_CHAT_FRAME:AddMessage("  Found completed '" .. set.name .. "', fixing duplicates...", 1, 1, 0)
                
                for _, id in pairs(incompleteIds) do
                    Questie.db.char.complete[id] = true
                    QuestieMap:UnloadQuestFrames(id)
                    fixedCount = fixedCount + 1
                    DEFAULT_CHAT_FRAME:AddMessage("    Marked quest " .. id .. " as complete", 0, 1, 0)
                end
            end
        end
        
        if fixedCount > 0 then
            -- Refresh the map
            QuestieQuest:UpdateQuests()
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Fixed " .. fixedCount .. " duplicate quest issues!", 0, 1, 0)
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r No duplicate quest issues found.", 0, 1, 0)
        end
        
        return
    end
    
    -- /questie findduplicates - Find all quests with duplicate names
    if mainCommand == "findduplicates" then
        DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie]|r Scanning for quests with duplicate names...", 0, 1, 0)
        
        local questsByName = {}
        local duplicatesFound = {}
        
        -- Scan all quests and group by name
        for id = 1, 30000 do
            local questData = QuestieDB:GetQuest(id)
            if questData and questData.name then
                local name = questData.name
                if not questsByName[name] then
                    questsByName[name] = {}
                end
                table.insert(questsByName[name], id)
            end
        end
        
        -- Find duplicates
        for name, ids in pairs(questsByName) do
            if #ids > 1 then
                table.insert(duplicatesFound, {name = name, ids = ids})
            end
        end
        
        -- Sort by name for easier reading
        table.sort(duplicatesFound, function(a, b) return a.name < b.name end)
        
        -- Display results
        if #duplicatesFound > 0 then
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00Found " .. #duplicatesFound .. " quests with duplicate names:|r", 1, 1, 0)
            
            for _, dup in pairs(duplicatesFound) do
                local idList = table.concat(dup.ids, ", ")
                DEFAULT_CHAT_FRAME:AddMessage("  " .. dup.name .. " - IDs: " .. idList, 1, 1, 1)
                
                -- Check completion status
                local completeCount = 0
                for _, id in pairs(dup.ids) do
                    if Questie.db.char.complete[id] then
                        completeCount = completeCount + 1
                    end
                end
                
                if completeCount > 0 and completeCount < #dup.ids then
                    DEFAULT_CHAT_FRAME:AddMessage("    |cFFFF0000⚠ Partially complete (" .. completeCount .. "/" .. #dup.ids .. ")|r", 1, 0, 0)
                end
            end
            
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Use /questie fixduplicates to mark all versions complete|r", 0, 1, 0)
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00No duplicate quest names found.|r", 0, 1, 0)
        end
        
        return
    end
    
    if mainCommand == "dumplog" then
        -- Capture complete quest log for troubleshooting
        local dumpData = {}
        table.insert(dumpData, "=== QUESTIE QUEST LOG DUMP ===")
        table.insert(dumpData, "Version: " .. GetAddOnMetadata("Questie", "Version"))
        table.insert(dumpData, "Character: " .. UnitName("player") .. " - " .. GetRealmName())
        table.insert(dumpData, "Level: " .. UnitLevel("player") .. " " .. UnitClass("player"))
        table.insert(dumpData, "")
        
        table.insert(dumpData, "QUEST LOG DATA:")
        table.insert(dumpData, "Total Entries: " .. GetNumQuestLogEntries())
        table.insert(dumpData, "")
        
        local questCount = 0
        local missingQuests = {}
        local questData = {}
        
        for i = 1, GetNumQuestLogEntries() do
            -- In WoW 3.3.5, GetQuestLogTitle returns different values
            local title, level, tag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questId = GetQuestLogTitle(i)
            
            -- Process all non-header entries
            if not isHeader and title then
                questCount = questCount + 1
                
                -- Quest ID might be nil in 3.3.5, try to extract it
                if not questId or questId == 0 then
                    -- Method 1: Try GetQuestLink which contains the quest ID
                    local questLink = GetQuestLink(i)
                    if questLink then
                        -- Extract quest ID from link format: |Hquest:questId:level|h[name]|h
                        local extractedId = questLink:match("quest:(%d+):")
                        if extractedId then
                            questId = tonumber(extractedId)
                        end
                    end
                    
                    -- If still no ID, mark as unknown
                    if not questId or questId == 0 then
                        questId = 0  -- We'll use 0 for unknown IDs
                    end
                end
                
                -- Capture all quest details
                local questInfo = string.format("[%d] = { -- %s (Level %d)", 
                    questId, 
                    title or "Unknown", 
                    level or 0)
                
                table.insert(questData, questInfo)
                table.insert(questData, string.format("  name = \"%s\",", title or "Unknown"))
                table.insert(questData, string.format("  level = %d,", level or 0))
                table.insert(questData, string.format("  tag = \"%s\",", tag or ""))
                table.insert(questData, string.format("  isComplete = %s,", tostring(isComplete)))
                table.insert(questData, string.format("  isDaily = %s,", tostring(isDaily)))
                table.insert(questData, string.format("  suggestedGroup = %d,", suggestedGroup or 0))
                
                -- Add quest link for debugging
                local questLink = GetQuestLink(i)
                if questLink then
                    table.insert(questData, string.format("  questLink = \"%s\",", questLink:gsub("|", "||")))
                end
                
                -- Check if quest exists in database
                if questId > 0 then
                    local dbQuest = QuestieDB.QueryQuestSingle(questId, "name")
                    if not dbQuest then
                        table.insert(missingQuests, questId)
                        table.insert(questData, "  STATUS = \"MISSING FROM DATABASE\",")
                    else
                        table.insert(questData, "  STATUS = \"EXISTS IN DATABASE\",")
                    end
                else
                    table.insert(questData, "  STATUS = \"UNKNOWN QUEST ID - NEEDS IDENTIFICATION\",")
                end
                
                -- Get objectives
                local originalSelection = GetQuestLogSelection()
                SelectQuestLogEntry(i)
                local numObjectives = GetNumQuestLeaderBoards(i)
                if numObjectives > 0 then
                    table.insert(questData, "  objectives = {")
                    for j = 1, numObjectives do
                        local text, objType, finished = GetQuestLogLeaderBoard(j, i)
                        if text then
                            table.insert(questData, string.format("    {text=\"%s\", type=\"%s\", done=%s},", 
                                text:gsub("\"", "\\\""), objType or "unknown", tostring(finished)))
                        end
                    end
                    table.insert(questData, "  },")
                end
                -- Restore original selection
                if originalSelection and originalSelection > 0 then
                    SelectQuestLogEntry(originalSelection)
                end
                
                table.insert(questData, "},")
                table.insert(questData, "")
            end
        end
        
        table.insert(dumpData, "Quest Count: " .. questCount)
        table.insert(dumpData, "Missing from DB: " .. #missingQuests)
        if #missingQuests > 0 then
            table.insert(dumpData, "Missing Quest IDs: " .. table.concat(missingQuests, ", "))
        end
        table.insert(dumpData, "")
        table.insert(dumpData, "DETAILED QUEST DATA:")
        table.insert(dumpData, "")
        
        -- Add the detailed quest data
        for _, line in ipairs(questData) do
            table.insert(dumpData, line)
        end
        
        table.insert(dumpData, "")
        table.insert(dumpData, "=== END OF DUMP ===")
        table.insert(dumpData, "")
        table.insert(dumpData, "INSTRUCTIONS:")
        table.insert(dumpData, "1. Click 'Select All' button below")
        table.insert(dumpData, "2. Press Ctrl+C to copy")
        table.insert(dumpData, "3. Post this data on GitHub issue #1")
        table.insert(dumpData, "4. We'll add your missing quests and release an update!")
        
        local outputText = table.concat(dumpData, "\n")
        
        -- Create or reuse the debug frame
        if not QuestieDebugFrame then
            local f = CreateFrame("Frame", "QuestieDebugFrame", UIParent)
            f:SetFrameStrata("DIALOG")
            f:SetWidth(700)
            f:SetHeight(500)
            f:SetPoint("CENTER")
            f:SetMovable(true)
            f:EnableMouse(true)
            f:RegisterForDrag("LeftButton")
            f:SetScript("OnDragStart", f.StartMoving)
            f:SetScript("OnDragStop", f.StopMovingOrSizing)
            
            f:SetBackdrop({
                bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true, tileSize = 32, edgeSize = 32,
                insets = { left = 11, right = 12, top = 12, bottom = 11 }
            })
            
            local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            title:SetPoint("TOP", 0, -20)
            title:SetText("|cFF00FF00Questie Quest Log Export|r")
            
            local instructions = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            instructions:SetPoint("TOP", title, "BOTTOM", 0, -8)
            instructions:SetText("|cFFFFFFFFYour quest log has been exported. Copy and share with developers.|r")
            
            local scrollFrame = CreateFrame("ScrollFrame", "QuestieDebugScrollFrame", f, "UIPanelScrollFrameTemplate")
            scrollFrame:SetPoint("TOPLEFT", 20, -60)
            scrollFrame:SetPoint("BOTTOMRIGHT", -40, 60)
            
            local editBox = CreateFrame("EditBox", "QuestieDebugEditBox", scrollFrame)
            editBox:SetMultiLine(true)
            editBox:SetMaxLetters(99999)
            editBox:SetSize(640, 2000)
            editBox:SetFont("Interface\\AddOns\\Questie\\Fonts\\VeraMono.ttf", 10)
            editBox:SetAutoFocus(false)
            editBox:SetScript("OnEscapePressed", function() f:Hide() end)
            
            scrollFrame:SetScrollChild(editBox)
            f.editBox = editBox
            
            local selectButton = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
            selectButton:SetPoint("BOTTOMLEFT", 40, 20)
            selectButton:SetWidth(120)
            selectButton:SetHeight(25)
            selectButton:SetText("Select All")
            selectButton:SetScript("OnClick", function()
                editBox:SetFocus()
                editBox:HighlightText()
                DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Text selected! Press Ctrl+C to copy.|r", 0, 1, 0)
            end)
            
            local closeButton = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
            closeButton:SetPoint("BOTTOMRIGHT", -40, 20)
            closeButton:SetWidth(100)
            closeButton:SetHeight(25)
            closeButton:SetText("Close")
            closeButton:SetScript("OnClick", function() f:Hide() end)
        end
        
        QuestieDebugFrame.editBox:SetText(outputText)
        QuestieDebugFrame.editBox:HighlightText(0, 0)
        QuestieDebugFrame:Show()
        
        Questie:Print("|cFF00FF00Quest log exported! Copy the data and share on GitHub.|r")
        return
    end
    
    -- /questie id - Shows quest IDs for all quests in log
    if mainCommand == "id" then
        local numEntries = GetNumQuestLogEntries()
        Questie:Print("|cFF00FF00Scanning quest log... Found " .. numEntries .. " entries|r")
        
        if numEntries == 0 then
            Questie:Print("|cFFFF0000No quests in your quest log.|r")
            return
        end
        
        Questie:Print("|cFF00FF00Quest IDs in your log:|r")
        local questCount = 0
        for i = 1, numEntries do
            -- Get the quest log title info (WoW 3.3.5a specific)
            local title, level, tag, arg4, arg5 = GetQuestLogTitle(i)
            
            -- In 3.3.5a: arg5 = 1 for headers, nil for quests
            -- Zone headers have level = 0 and arg5 = 1
            local isHeader = (arg5 == 1)
            
            -- Check if it's an actual quest (not a header)
            if title and not isHeader then
                questCount = questCount + 1
                
                -- In 3.3.5a, we need to select the quest to get its ID
                local oldSelection = GetQuestLogSelection()
                SelectQuestLogEntry(i)
                local link = GetQuestLink(i)
                local questID = nil
                
                if link then
                    -- Extract quest ID from the quest link
                    questID = tonumber(link:match("quest:(%d+)"))
                end
                
                -- Restore old selection
                if oldSelection then
                    SelectQuestLogEntry(oldSelection)
                end
                -- If still no ID, try getting from QuestiePlayer
                if (not questID or questID == 0) and QuestiePlayer and QuestiePlayer.currentQuestlog then
                    for qId, quest in pairs(QuestiePlayer.currentQuestlog) do
                        if quest.title == title then
                            questID = qId
                            break
                        end
                    end
                end
                
                if questID and questID > 0 then
                    Questie:Print(string.format("|cFFFFFF00[%d]|r %s (Level %d)", questID, title, level or 0))
                else
                    -- Fallback: try to find quest by name in database
                    local foundId = nil
                    
                    -- First check compiled quest database
                    if QuestieDB and QuestieDB.questData then
                        for id, questData in pairs(QuestieDB.questData) do
                            if questData and questData[1] == title then
                                foundId = id
                                break
                            end
                        end
                    end
                    
                    if foundId then
                        Questie:Print(string.format("|cFFFFFF00[%d]|r %s (Level %d) |cFF808080(from DB)|r", foundId, title, level or 0))
                    else
                        Questie:Print(string.format("|cFFFF0000[???]|r %s (Level %d) |cFF808080(ID not found)|r", title, level or 0))
                    end
                end
            end
        end
        
        if questCount == 0 then
            Questie:Print("|cFFFF0000No actual quests found (only headers/categories)|r")
        else
            Questie:Print(string.format("|cFF00FF00Total: %d quest(s) found|r", questCount))
        end
        return
    end
    
    -- /questie quest <id> - Debug a specific quest (simplified)
    if mainCommand == "quest" and subCommand then
        local questId = tonumber(subCommand)
        if not questId then
            Questie:Print("|cFFFF0000Invalid quest ID. Usage: /questie quest <questId>|r")
            return
        end
        
        Questie:Print("|cFF00FF00=== Quest Debug: " .. questId .. " ===|r")
        
        -- Check basic database
        Questie:Print("Checking database...")
        
        -- First try just getting the name
        local nameSuccess, nameResult = pcall(function()
            if QuestieDB and QuestieDB.QueryQuest then
                return QuestieDB.QueryQuest(questId, "name")
            end
        end)
        
        if not nameSuccess then
            Questie:Print("|cFFFF0000Error getting quest name: " .. tostring(nameResult) .. "|r")
            Questie:Print("Quest data may be corrupted in database")
            return
        end
        
        Questie:Print("Quest name from DB: " .. tostring(nameResult))
        
        -- Also check QuestieDB.GetQuest
        local questObj = QuestieDB.GetQuest(questId)
        if questObj then
            Questie:Print("Quest name from GetQuest: " .. tostring(questObj.name))
        else
            Questie:Print("QuestieDB.GetQuest returned nil")
        end
        
        -- Now try getting other fields
        local success, result = pcall(function()
            if QuestieDB and QuestieDB.QueryQuest then
                local startedBy = QuestieDB.QueryQuest(questId, "startedBy")
                local objectives = QuestieDB.QueryQuest(questId, "objectives")
                local objectivesText = QuestieDB.QueryQuest(questId, "objectivesText")
                return {nameResult, startedBy, objectives, objectivesText}
            end
            return nil
        end)
        
        if not success then
            Questie:Print("|cFFFF0000Error querying database: " .. tostring(result) .. "|r")
            return
        end
        
        if result and result[1] then
            Questie:Print("|cFF00FF00Quest found in database|r")
            if result[1] then Questie:Print("  Name: " .. tostring(result[1])) end
            if result[2] then Questie:Print("  Has quest giver data") end
            if result[4] then Questie:Print("  Has objectives text") end
            if result[3] then Questie:Print("  Has objectives data") end
        else
            Questie:Print("|cFFFF0000Quest not in database|r")
        end
        
        -- Check if in quest log
        Questie:Print("Checking quest log...")
        local inLog = false
        for i = 1, GetNumQuestLogEntries() do
            local title, level, tag, arg4, arg5 = GetQuestLogTitle(i)
            if arg5 ~= 1 then -- Not a header
                SelectQuestLogEntry(i)
                local link = GetQuestLink(i)
                if link then
                    local qId = tonumber(link:match("quest:(%d+)"))
                    if qId == questId then
                        inLog = true
                        Questie:Print("|cFF00FF00Quest IS in your log: " .. title .. "|r")
                        break
                    end
                end
            end
        end
        if not inLog then
            Questie:Print("|cFFFF0000Quest NOT in your log|r")
        end
        
        return
    end
    
    if mainCommand == "tracker" then
        if subCommand == "show" then
            QuestieTracker:Enable()
        elseif subCommand == "hide" then
            QuestieTracker:Disable()
        elseif subCommand == "reset" then
            QuestieTracker:ResetLocation()
        elseif subCommand == "clear" then
            -- Clear the AutoUntrackedQuests table to re-track all quests
            Questie.db.char.AutoUntrackedQuests = {}
            Questie:Print("|cFF00FF00[Questie] Cleared untracked quests list. All quests will now be tracked.|r")
            QuestieTracker:Update()
        elseif subCommand == "debug" then
            -- Debug command to diagnose tracker issues
            local debugOutput = {}
            table.insert(debugOutput, "=== QUESTIE TRACKER DEBUG INFO ===")
            table.insert(debugOutput, "Version: " .. GetAddOnMetadata("Questie", "Version"))
            table.insert(debugOutput, "Please copy ALL text below and share on GitHub")
            table.insert(debugOutput, "")
            
            -- Enable debug mode temporarily for this session
            Questie.db.profile.debugEnabled = true
            Questie.db.profile.debugEnabledPrint = true
            Questie.db.profile.debugLevel = 7
            table.insert(debugOutput, "Debug mode: ENABLED")
            table.insert(debugOutput, "")
            
            table.insert(debugOutput, "TRACKER STATUS:")
            table.insert(debugOutput, "  Started: " .. tostring(QuestieTracker.started or false))
            table.insert(debugOutput, "  Enabled: " .. tostring(Questie.db and Questie.db.profile and Questie.db.profile.trackerEnabled or false))
            
            if Questie.db and Questie.db.char then
                table.insert(debugOutput, "  TrackerHiddenQuests: " .. type(Questie.db.char.TrackerHiddenQuests))
                table.insert(debugOutput, "  TrackedQuests: " .. type(Questie.db.char.TrackedQuests))
                table.insert(debugOutput, "  AutoUntrackedQuests: " .. type(Questie.db.char.AutoUntrackedQuests))
            else
                table.insert(debugOutput, "  ERROR: Database char data not available!")
            end
            table.insert(debugOutput, "")
            
            -- Check frame visibility
            table.insert(debugOutput, "FRAME STATUS:")
            if Questie_BaseFrame then
                table.insert(debugOutput, "  Exists: Yes")
                table.insert(debugOutput, "  Visible: " .. tostring(Questie_BaseFrame:IsVisible()))
                table.insert(debugOutput, "  Shown: " .. tostring(Questie_BaseFrame:IsShown()))
                local point, relativeTo, relativePoint, x, y = Questie_BaseFrame:GetPoint()
                table.insert(debugOutput, string.format("  Position: %s (%.1f, %.1f)", tostring(point), x or 0, y or 0))
                table.insert(debugOutput, string.format("  Size: %.0fx%.0f", Questie_BaseFrame:GetWidth(), Questie_BaseFrame:GetHeight()))
                
                local screenWidth = GetScreenWidth()
                local screenHeight = GetScreenHeight()
                if x and y and (x > screenWidth or x < -screenWidth or y > screenHeight or y < -screenHeight) then
                    table.insert(debugOutput, "  WARNING: Frame appears OFF-SCREEN!")
                    table.insert(debugOutput, "  Try: /questie tracker reset")
                end
                
                -- Check alwaysShowTracker setting
                table.insert(debugOutput, "  AlwaysShowTracker: " .. tostring(Questie.db.profile.alwaysShowTracker or false))
            else
                table.insert(debugOutput, "  ERROR: Base frame does NOT exist!")
            end
            table.insert(debugOutput, "")
            
            -- Check for quest issues
            table.insert(debugOutput, "QUEST LOG CHECK:")
            local questCount = 0
            local failedQuests = {}
            local questLogQuests = {}
            local totalEntries = GetNumQuestLogEntries()
            table.insert(debugOutput, "  GetNumQuestLogEntries: " .. totalEntries)
            
            for i = 1, totalEntries do
                local title, level, _, isHeader, _, _, _, questId = GetQuestLogTitle(i)
                if not isHeader then
                    -- Some quests might not return a questId properly
                    if questId and questId > 0 then
                        questCount = questCount + 1
                        questLogQuests[questId] = title or ("Unknown Quest " .. questId)
                        local success, questData = pcall(function() return QuestieDB.GetQuest(questId) end)
                        if not success or not questData then
                            table.insert(failedQuests, string.format("  FAILED: Quest %d '%s' (Level %d)", questId, title or "Unknown", level or 0))
                        end
                    elseif title then
                        -- Quest has a title but no ID - this is the problem!
                        table.insert(debugOutput, string.format("  WARNING: Quest '%s' has no ID!", title))
                    end
                end
            end
            table.insert(debugOutput, "  Total quests in log: " .. questCount)
            
            -- Check QuestiePlayer.currentQuestlog
            local QuestiePlayer = QuestieLoader:ImportModule("QuestiePlayer")
            if QuestiePlayer and QuestiePlayer.currentQuestlog then
                local trackedCount = 0
                local missingFromTracker = {}
                
                for questId, quest in pairs(QuestiePlayer.currentQuestlog) do
                    if type(quest) == "table" then
                        trackedCount = trackedCount + 1
                    end
                end
                
                -- Find quests in log but not in tracker
                for questId, title in pairs(questLogQuests) do
                    if not QuestiePlayer.currentQuestlog[questId] then
                        table.insert(missingFromTracker, string.format("  NOT TRACKED: Quest %d '%s'", questId, title))
                    end
                end
                
                table.insert(debugOutput, "  Quests in tracker: " .. trackedCount)
                
                if #missingFromTracker > 0 then
                    table.insert(debugOutput, "  Missing from tracker:")
                    for _, msg in ipairs(missingFromTracker) do
                        table.insert(debugOutput, msg)
                    end
                end
            end
            
            if #failedQuests > 0 then
                table.insert(debugOutput, "  Failed to load:")
                for _, msg in ipairs(failedQuests) do
                    table.insert(debugOutput, msg)
                end
            else
                table.insert(debugOutput, "  All quests loaded successfully")
            end
            table.insert(debugOutput, "")
            
            -- Check if tracker is hidden due to no quests
            if questCount == 0 and not Questie.db.profile.alwaysShowTracker then
                table.insert(debugOutput, "ISSUE FOUND: Tracker hidden because quest log is empty!")
                table.insert(debugOutput, "  Solution 1: Accept a quest to see the tracker")
                table.insert(debugOutput, "  Solution 2: Enable 'Always Show Tracker' in options")
                table.insert(debugOutput, "")
                table.insert(debugOutput, "ACTION: Temporarily enabling 'Always Show Tracker'...")
                Questie.db.profile.alwaysShowTracker = true
                
                -- Force update the tracker
                if QuestieTracker.started then
                    QuestieTracker:Update()
                end
            end
            
            -- Try to reinitialize if needed
            if not QuestieTracker.started then
                table.insert(debugOutput, "ACTION: Attempting to reinitialize tracker...")
                QuestieTracker.Initialize()
            end
            
            -- Create copyable window (based on export window code)
            local outputText = table.concat(debugOutput, "\n")
            
            -- Create frame if it doesn't exist
            if not QuestieDebugFrame then
                local f = CreateFrame("Frame", "QuestieDebugFrame", UIParent)
                f:SetFrameStrata("DIALOG")
                f:SetWidth(600)
                f:SetHeight(400)
                f:SetPoint("CENTER")
                f:SetMovable(true)
                f:EnableMouse(true)
                f:RegisterForDrag("LeftButton")
                f:SetScript("OnDragStart", f.StartMoving)
                f:SetScript("OnDragStop", f.StopMovingOrSizing)
                
                -- Use Questie's frame style
                f:SetBackdrop({
                    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
                    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                    tile = true, tileSize = 32, edgeSize = 32,
                    insets = { left = 11, right = 12, top = 12, bottom = 11 }
                })
                
                -- Title
                local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
                title:SetPoint("TOP", 0, -20)
                title:SetText("|cFF00FF00Questie Debug Output|r")
                
                -- Instructions
                local step1 = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                step1:SetPoint("TOP", title, "BOTTOM", 0, -8)
                step1:SetText("|cFFFFFFFFStep 1:|r Click 'Select All' button below")
                
                local step2 = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                step2:SetPoint("TOP", step1, "BOTTOM", 0, -4)
                step2:SetText("|cFFFFFFFFStep 2:|r Copy (Ctrl+C) and paste into GitHub issue #1")
                
                -- Scroll frame with background
                local scrollBg = CreateFrame("Frame", nil, f)
                scrollBg:SetPoint("TOPLEFT", 18, -78)
                scrollBg:SetPoint("BOTTOMRIGHT", -38, 58)
                scrollBg:SetBackdrop({
                    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
                    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                    tile = true, tileSize = 32, edgeSize = 8,
                    insets = {left = 2, right = 2, top = 2, bottom = 2}
                })
                
                local scrollFrame = CreateFrame("ScrollFrame", "QuestieDebugScrollFrame", f, "UIPanelScrollFrameTemplate")
                scrollFrame:SetPoint("TOPLEFT", 20, -80)
                scrollFrame:SetPoint("BOTTOMRIGHT", -40, 60)
                
                -- Edit box with forced visibility
                local editBox = CreateFrame("EditBox", "QuestieDebugEditBox", scrollFrame)
                editBox:SetMultiLine(true)
                editBox:SetMaxLetters(99999)
                editBox:SetSize(540, 800)
                -- Try ChatFontNormal which should always be visible
                editBox:SetFontObject(ChatFontNormal)
                editBox:SetTextColor(1, 1, 1, 1)  -- White text
                editBox:SetTextInsets(2, 2, 2, 2)  -- Add some padding
                editBox:SetAutoFocus(false)
                editBox:EnableMouse(true)
                editBox:SetScript("OnEscapePressed", function() f:Hide() end)
                editBox:SetScript("OnTextChanged", function(self, userInput)
                    if userInput then
                        self:SetText(outputText)
                        self:HighlightText()
                    end
                end)
                
                -- Add OnShow handler to ensure text is visible
                editBox:SetScript("OnShow", function(self)
                    self:SetTextColor(1, 1, 1, 1)
                end)
                
                scrollFrame:SetScrollChild(editBox)
                f.editBox = editBox
                
                -- Select All button
                local copyButton = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
                copyButton:SetPoint("BOTTOMLEFT", 40, 20)
                copyButton:SetWidth(120)
                copyButton:SetHeight(25)
                copyButton:SetText("Select All")
                copyButton:SetScript("OnClick", function()
                    editBox:SetFocus()
                    editBox:HighlightText()
                    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00Text selected! Now press Ctrl+C to copy.|r", 0, 1, 0)
                end)
                
                -- Help text
                local helpText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
                helpText:SetPoint("BOTTOM", copyButton, "TOP", 60, 5)
                helpText:SetText("|cFFFFFF00Tip: If Ctrl+C doesn't work, unbind it in Key Bindings|r")
                
                -- Close button
                local closeButton = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
                closeButton:SetPoint("BOTTOMRIGHT", -40, 20)
                closeButton:SetWidth(100)
                closeButton:SetHeight(25)
                closeButton:SetText("Close")
                closeButton:SetScript("OnClick", function() f:Hide() end)
            end
            
            -- Set text and ensure it's visible
            QuestieDebugFrame.editBox:SetText(outputText)
            QuestieDebugFrame.editBox:SetTextColor(1, 1, 1, 1)  -- Ensure white text
            QuestieDebugFrame.editBox:SetCursorPosition(0)
            QuestieDebugFrame.editBox:HighlightText(0, 0)
            QuestieDebugFrame:Show()
            
            Questie:Print("|cFF00FF00Debug window opened - Click 'Select All' then press Ctrl+C to copy|r")
        else
            QuestieTracker:Toggle()
        end
        return
    end

    if mainCommand == "tomap" then
        if not subCommand then
            subCommand = UnitName("target")
        end

        if subCommand ~= nil then
            if subCommand == "reset" then
                QuestieMap:ResetManualFrames()
                return
            end

            local conversionTry = tonumber(subCommand)
            if conversionTry then -- We've got an ID
                subCommand = conversionTry
                local result = QuestieSearch:Search(subCommand, "npc", "int")
                if result then
                    for npcId, _ in pairs(result) do
                        QuestieMap:ShowNPC(npcId)
                    end
                end
                return
            elseif type(subCommand) == "string" then
                local result = QuestieSearch:Search(subCommand, "npc")
                if result then
                    for npcId, _ in pairs(result) do
                        QuestieMap:ShowNPC(npcId)
                    end
                end
                return
            end
        end
    end

    if mainCommand == "flex" then
        local questCount = 0
        for _, _ in pairs(Questie.db.char.complete) do
            questCount = questCount + 1
        end
        if GetDailyQuestsCompleted then
            questCount = questCount - GetDailyQuestsCompleted() -- We don't care about daily quests
        end
        SendChatMessage(l10n("has completed a total of %d quests", questCount) .. "!", "EMOTE")
        return
    end

    if mainCommand == "version" then
        -- Simple version display
        local gameType = ""
        if Questie.IsWotlk then
            gameType = "Wrath"
        elseif Questie.IsSoD then -- seasonal checks must be made before non-seasonal for that client, since IsEra resolves true in SoD
            gameType = "SoD"
        elseif Questie.IsEra then
            gameType = "Era"
        end

        Questie:Print("Questie " .. QuestieLib:GetAddonVersionString() .. ", Client " .. GetBuildInfo() .. " " .. gameType .. ", Locale " .. GetLocale())
        print("|cFFFFFF00[Questie-Epoch]|r Check for updates at Github: https://github.com/trav346/Questie-Epoch")
        return
    end

    if mainCommand == "doable" or mainCommand == "eligible" or mainCommand == "eligibility" then
        if not subCommand then
            print(Questie:Colorize("[Questie] ", "yellow") .. "Usage: /questie " .. mainCommand .. " <questID>")
            do return end
        elseif QuestieDB.QueryQuestSingle(tonumber(subCommand), "name") == nil then
            print(Questie:Colorize("[Questie] ", "yellow") .. "Invalid quest ID")
            return
        end

        Questie:Print("[Eligibility] " .. tostring(QuestieDB.IsDoableVerbose(tonumber(subCommand), false, true, false)))

        return
    end

    print(Questie:Colorize("[Questie] ", "yellow") .. l10n("Invalid command. For a list of options please type: ") .. Questie:Colorize("/questie help", "yellow"));
end
