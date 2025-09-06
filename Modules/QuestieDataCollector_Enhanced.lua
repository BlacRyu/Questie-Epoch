-- Enhanced Quest Data Collector with Phantom Quest Detection
-- Adds reporting capabilities for quests that don't exist on server

local QuestieDataCollector = QuestieLoader:CreateModule("QuestieDataCollector")
local _QuestieDataCollector = QuestieDataCollector.private

-- Store phantom quest reports
_QuestieDataCollector.phantomReports = {}
_QuestieDataCollector.npcVerifications = {}
_QuestieDataCollector.lastNPCInteraction = nil

-- Initialize enhanced features
function QuestieDataCollector:InitializeEnhanced()
    -- Register for NPC interaction events
    self:RegisterEvent("GOSSIP_SHOW")
    self:RegisterEvent("QUEST_GREETING") 
    self:RegisterEvent("QUEST_DETAIL")
    
    -- Create phantom detection frame
    if not _QuestieDataCollector.phantomFrame then
        _QuestieDataCollector.phantomFrame = CreateFrame("Frame")
        _QuestieDataCollector.phantomFrame:SetScript("OnEvent", function(self, event, ...)
            QuestieDataCollector:OnPhantomEvent(event, ...)
        end)
    end
    
    -- Register phantom detection events
    _QuestieDataCollector.phantomFrame:RegisterEvent("GOSSIP_SHOW")
    _QuestieDataCollector.phantomFrame:RegisterEvent("QUEST_GREETING")
end

-- Handle phantom detection events
function QuestieDataCollector:OnPhantomEvent(event, ...)
    if event == "GOSSIP_SHOW" then
        self:CaptureNPCOfferedQuests()
    elseif event == "QUEST_GREETING" then
        self:CaptureQuestGreeting()
    end
end

-- Capture what quests an NPC actually offers
function QuestieDataCollector:CaptureNPCOfferedQuests()
    local npcGUID = UnitGUID("target") or UnitGUID("npc")
    if not npcGUID then return end
    
    local npcId = self:ExtractNPCId(npcGUID)
    if not npcId then return end
    
    -- Get NPC info
    local npcName = UnitName("target") or UnitName("npc")
    
    -- Capture available quests
    local availableQuests = {}
    local numAvailable = GetNumGossipAvailableQuests()
    for i = 1, numAvailable do
        local title, level, isTrivial, frequency, isRepeatable, isLegendary = select(i * 7 - 6, GetGossipAvailableQuests())
        if title then
            table.insert(availableQuests, {
                title = title,
                level = level
            })
        end
    end
    
    -- Capture active quests
    local activeQuests = {}
    local numActive = GetNumGossipActiveQuests()
    for i = 1, numActive do
        local title, level, isTrivial, isComplete, isLegendary = select(i * 6 - 5, GetGossipActiveQuests())
        if title then
            table.insert(activeQuests, {
                title = title,
                level = level,
                isComplete = isComplete
            })
        end
    end
    
    -- Store verification data
    local x, y = QuestieCoords:GetPlayerMapPosition()
    
    _QuestieDataCollector.npcVerifications[npcId] = {
        npcId = npcId,
        npcName = npcName,
        availableQuests = availableQuests,
        activeQuests = activeQuests,
        location = {x = x, y = y},
        zone = GetZoneText(),
        subzone = GetSubZoneText(),
        timestamp = time(),
        playerLevel = UnitLevel("player"),
        playerClass = UnitClass("player"),
        playerRace = UnitRace("player")
    }
    
    -- Compare with Questie's expectations
    self:DetectPhantomQuests(npcId)
end

-- Detect phantom quests by comparing actual vs expected
function QuestieDataCollector:DetectPhantomQuests(npcId)
    local verification = _QuestieDataCollector.npcVerifications[npcId]
    if not verification then return end
    
    -- Get what Questie thinks this NPC should offer
    local questieNPC = QuestieDB:GetNPC(npcId)
    if not questieNPC or not questieNPC.questStarts then return end
    
    -- Build list of actually offered quest titles
    local actualQuests = {}
    for _, quest in ipairs(verification.availableQuests) do
        actualQuests[quest.title] = true
    end
    
    -- Check each expected quest
    local phantoms = {}
    for _, questId in ipairs(questieNPC.questStarts) do
        local questData = QuestieDB:GetQuest(questId)
        if questData and questData.name then
            -- If Questie expects it but NPC doesn't offer it
            if not actualQuests[questData.name] then
                table.insert(phantoms, {
                    questId = questId,
                    questName = questData.name,
                    npcId = npcId,
                    npcName = verification.npcName
                })
            end
        end
    end
    
    -- Report phantoms if found
    if #phantoms > 0 then
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000[DATA] Phantom quests detected!|r")
        for _, phantom in ipairs(phantoms) do
            DEFAULT_CHAT_FRAME:AddMessage(string.format(
                "|cFFFF0000  Quest %d: %s (not offered by %s)|r",
                phantom.questId, phantom.questName, phantom.npcName
            ))
            
            -- Store phantom report
            self:ReportPhantomQuest(phantom.questId, "auto_detected", {
                npcId = npcId,
                npcName = verification.npcName,
                location = verification.location,
                zone = verification.zone
            })
        end
    end
end

-- Report a phantom/missing quest
function QuestieDataCollector:ReportPhantomQuest(questId, reportType, details)
    if not _QuestieDataCollector.phantomReports[questId] then
        _QuestieDataCollector.phantomReports[questId] = {
            questId = questId,
            reports = {},
            firstReported = time()
        }
    end
    
    -- Add this report
    table.insert(_QuestieDataCollector.phantomReports[questId].reports, {
        type = reportType,
        timestamp = time(),
        playerLevel = UnitLevel("player"),
        playerClass = UnitClass("player"),
        playerRace = UnitRace("player"),
        details = details or {}
    })
    
    -- Save to saved variables
    if not QuestieDataCollection.phantomQuests then
        QuestieDataCollection.phantomQuests = {}
    end
    QuestieDataCollection.phantomQuests[questId] = _QuestieDataCollector.phantomReports[questId]
end

-- Export phantom quest report
function QuestieDataCollector:ExportPhantomReport(questId)
    local report = _QuestieDataCollector.phantomReports[questId]
    if not report then
        DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000No phantom report for quest " .. questId .. "|r")
        return
    end
    
    local questData = QuestieDB:GetQuest(questId)
    local questName = questData and questData.name or "Unknown"
    
    local output = {}
    table.insert(output, "=== PHANTOM QUEST REPORT ===")
    table.insert(output, "Quest ID: " .. questId)
    table.insert(output, "Quest Name: " .. questName)
    table.insert(output, "Total Reports: " .. #report.reports)
    table.insert(output, "")
    
    -- Aggregate report details
    local npcReports = {}
    for _, r in ipairs(report.reports) do
        if r.details and r.details.npcId then
            local npcId = r.details.npcId
            if not npcReports[npcId] then
                npcReports[npcId] = {
                    npcName = r.details.npcName,
                    count = 0,
                    locations = {}
                }
            end
            npcReports[npcId].count = npcReports[npcId].count + 1
            if r.details.location then
                table.insert(npcReports[npcId].locations, r.details.location)
            end
        end
    end
    
    table.insert(output, "AFFECTED NPCs:")
    for npcId, data in pairs(npcReports) do
        table.insert(output, string.format("  NPC %d: %s (%d reports)",
            npcId, data.npcName or "Unknown", data.count))
        if #data.locations > 0 then
            local loc = data.locations[1]
            table.insert(output, string.format("    Location: [%.1f, %.1f]", 
                loc.x * 100, loc.y * 100))
        end
    end
    
    table.insert(output, "")
    table.insert(output, "EVIDENCE:")
    table.insert(output, "- Quest shown in Questie but not offered by NPC")
    table.insert(output, "- Verified by " .. #report.reports .. " interaction(s)")
    table.insert(output, "")
    table.insert(output, "RECOMMENDATION:")
    table.insert(output, "Comment out quest " .. questId .. " in WotLK database")
    
    -- Show in chat
    for _, line in ipairs(output) do
        DEFAULT_CHAT_FRAME:AddMessage(line)
    end
    
    return table.concat(output, "\n")
end

-- Enhanced slash commands
function QuestieDataCollector:HandleSlashCommand(msg)
    local args = {}
    for arg in msg:gmatch("%S+") do
        table.insert(args, arg)
    end
    
    local cmd = args[1]
    
    if cmd == "report" then
        local subCmd = args[2]
        local questId = tonumber(args[3])
        
        if subCmd == "missing" or subCmd == "phantom" then
            if not questId then
                DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000Usage: /qdc report missing <questId>|r")
                return
            end
            
            -- Get current target NPC if any
            local npcDetails = nil
            local npcGUID = UnitGUID("target")
            if npcGUID and UnitIsNPC("target") then
                local npcId = self:ExtractNPCId(npcGUID)
                local x, y = QuestieCoords:GetPlayerMapPosition()
                npcDetails = {
                    npcId = npcId,
                    npcName = UnitName("target"),
                    location = {x = x, y = y},
                    zone = GetZoneText(),
                    subzone = GetSubZoneText()
                }
            end
            
            self:ReportPhantomQuest(questId, "manual_report", npcDetails)
            
            local questData = QuestieDB:GetQuest(questId)
            local questName = questData and questData.name or "Unknown"
            DEFAULT_CHAT_FRAME:AddMessage(string.format(
                "|cFFFFFF00[DATA] Reported phantom quest %d: %s|r",
                questId, questName
            ))
            
        elseif subCmd == "broken" then
            -- Similar handling for broken quests
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[DATA] Broken quest reporting not yet implemented|r")
        end
        
    elseif cmd == "verify" then
        local subCmd = args[2]
        
        if subCmd == "npc" then
            if not UnitExists("target") or not UnitIsNPC("target") then
                DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000Target an NPC first|r")
                return
            end
            
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[DATA] Talk to the NPC to verify their quests|r")
            -- The GOSSIP_SHOW event will handle the actual verification
            
        elseif subCmd == "zone" then
            self:StartZoneVerification()
        end
        
    elseif cmd == "phantoms" then
        -- Show all phantom reports
        local count = 0
        for questId, report in pairs(_QuestieDataCollector.phantomReports) do
            count = count + 1
            local questData = QuestieDB:GetQuest(questId)
            local questName = questData and questData.name or "Unknown"
            DEFAULT_CHAT_FRAME:AddMessage(string.format(
                "%d: %s (%d reports)",
                questId, questName, #report.reports
            ))
        end
        DEFAULT_CHAT_FRAME:AddMessage(string.format(
            "|cFFFFFF00Total phantom quests reported: %d|r", count
        ))
        
    elseif cmd == "export" then
        local questId = tonumber(args[2])
        if questId then
            -- Check if it's a phantom quest
            if _QuestieDataCollector.phantomReports[questId] then
                self:ExportPhantomReport(questId)
            else
                -- Regular quest export (existing functionality)
                self:ExportQuestData(questId)
            end
        else
            DEFAULT_CHAT_FRAME:AddMessage("|cFFFF0000Usage: /qdc export <questId>|r")
        end
    end
end

-- Start zone-wide NPC verification
function QuestieDataCollector:StartZoneVerification()
    local zone = GetZoneText()
    DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[DATA] Starting zone verification for: " .. zone .. "|r")
    
    -- Get all NPCs in zone that should have quests
    local npcsToVerify = {}
    -- This would need to query Questie's database for NPCs in current zone
    
    DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF00[DATA] Visit quest givers and talk to them to verify|r")
end

-- Export all phantom reports for GitHub
function QuestieDataCollector:ExportAllPhantoms()
    local output = {}
    table.insert(output, "=== BULK PHANTOM QUEST REPORT ===")
    table.insert(output, "Total Phantom Quests: " .. self:CountTable(_QuestieDataCollector.phantomReports))
    table.insert(output, "Generated: " .. date("%Y-%m-%d %H:%M:%S"))
    table.insert(output, "")
    
    for questId, report in pairs(_QuestieDataCollector.phantomReports) do
        local questData = QuestieDB:GetQuest(questId)
        local questName = questData and questData.name or "Unknown"
        table.insert(output, string.format("Quest %d: %s (%d reports)",
            questId, questName, #report.reports))
    end
    
    return table.concat(output, "\n")
end

-- Initialize on load
function QuestieDataCollector:OnInitialize()
    -- Call existing initialization if it exists
    if self.OriginalOnInitialize then
        self:OriginalOnInitialize()
    end
    
    -- Initialize enhanced features
    self:InitializeEnhanced()
    
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00[Questie] Enhanced Data Collector loaded|r")
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00  /qdc report missing <id> - Report phantom quest|r")
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00  /qdc verify npc - Verify targeted NPC's quests|r")
    DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00  /qdc phantoms - Show all phantom reports|r")
end