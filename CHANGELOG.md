# Changelog

## [Unreleased]

### Fixed
- **Fixed overflow error for Epoch object IDs**
  - Changed object ID 40000057 to 4000057 in epochItemDB.lua to fit within 24-bit limit
  - Fixes issue #193 where QuestieStream.lua would crash with overflow error
  - Epoch object IDs starting with 4000000+ now work correctly
- **Fixed tracker only showing partial quests on login (all quests on reload)**
  - questsWatched was being captured at file load time instead of during initialization
  - Tracker sync was running before QuestiePlayer.currentQuestlog was populated
  - AutoUntrackedQuests cleanup was removing valid quests due to empty quest log
  - Removed erroneous trackerBaseFrame:Hide() that was hiding tracker after init
  - Now waits 1.5 seconds and checks if quest log is populated before cleanup
  - Fixes issue where quests couldn't be manually tracked after login
  - Fixes tracker disappearing completely after initialization
- **Removed debug output from database initialization**
  - Cleaned up temporary debug logging from QuestieInit.lua

## [1.0.64] - 2024-08-30

### Fixed - Major Database Architecture Overhaul
- **CRITICAL FIX: Eliminated WotLK database contamination**
  - Changed database architecture to use Classic as the base instead of WotLK
  - Prevents ~13,000 phantom WotLK quests from appearing in Classic zones
  - Fixes incorrect NPC coordinates (like Stormwind innkeeper being in wrong location)
  - Selectively imports only essential WotLK data (Northrend content and service NPCs)
  - Resolves issues #165 and #175 where non-existent quests were showing

### Added - 45+ New Epoch Quests
- **Processed 12 GitHub issues with quest data submissions**
  - Issue #177: Azshara's Legacy (27094)
  - Issue #176: Rumbles Of The Earth (27049)
  - Issue #174: Batch of 7 quests (Dustwallow, Tanaris, Dun Morogh)
  - Issues #170-173: Complete Azshara's Legacy quest chain
  - Issue #167: Seeking Redemption (26455)
  - Issue #169: Hillsbrad/Alterac quest batch
  - Issues #163, #164, #166: 20+ additional quests across multiple zones
  - All quest data verified for accuracy with corrected zone IDs
  - **NOTE**: Many submissions had incorrect data that required manual fixes

### Changed
- **Data submission policy**: Now only accepting quest data from v1.0.63+ due to collection bugs in older versions

### Fixed
- **Map pins not displaying** - Fixed critical coordinate conversion issue in HereBeDragons
  - Added missing classic zone ID mappings for major cities (Stormwind, Ironforge, Orgrimmar, Thunder Bluff, Darnassus, Undercity)
  - NPCs using classic zone IDs (1519, 1537, 1637, 1638, 1657, 1497) now properly show on maps
  - Fixes issue where innkeepers and other NPCs in major cities weren't showing map pins

### Added
- **Data Collection Enhancement** - Export now includes addon version and timestamp
  - Helps identify if data was collected with buggy or fixed version
  - Shows exact date/time when data was collected or exported
  - Critical for debugging data collection issues
  - Removed emojis from export text as they don't work in plain text submissions
- **Massive Quest Data Import** - Added 100+ quests from user data submissions
  - Issue #162: "Parts From Afar" (26186) - The Hinterlands (final quest data submission!)
  - Issue #160: "Life In Death" (26712) - Duskwood
  - Issue #159: Updated Elwynn Forest quests with complete data (26768, 26771, 26774, 26775, 26794)
  - Issue #151: "Solarsal Report" (27053) - Wetlands
  - Issue #150/149: "Azshara's Legacy" (27091) - Azshara
  - Issue #148: Hillsbrad/Alterac quests (26499, 26540, 26541)
  - Issue #147: Elwynn Forest quests (26768, 26771, 26774, 26775, 26794)
  - Issue #146: "Commission for Verner Osgood" (28573) - Redridge Mountains
  - Issue #145: "Riders In The Night" (26707) - Duskwood
  - Issue #144: "How to Make Friends with a Furbolg" (27082) - Azshara
  - Issue #143: "Ardo's Dirtpaw" (26847) - Redridge Mountains
  - Issue #142: "A Salve for Samantha" (26883) - Stranglethorn Vale
  - Issue #141: "Parts From Afar" (26187) - Ironforge to Hinterlands
  - Issue #140: Silverpine Forest quests (26217, 26873, 26876)
  - Issue #139: "My Friend, The Skullsplitter" (26890) - Westfall/STV
  - Issue #138: Stranglethorn Vale batch (26282, 26291, 26292, 26880, 26885, 26903, 26906, 26907, 26908, 26912, 26915, 26922)
  - Issue #137: Elwynn Forest quests (26784, 26785)
  - Issue #136: "Brewing Brethren" (26782) - Elwynn Forest
  - Issue #135: "Linus Stone Tips" (26781) - Elwynn Forest
  - Issue #134: "How to Make Friends with a Furbolg" (27081) - Azshara variant
  - Issue #133: "My Friend, The Skullsplitter" (26887) - Stranglethorn Vale variant
  - Issue #131: "An End To Dread" (27237) - Swamp of Sorrows
  - Issue #130: "Crazed Carrion" (27243) - Swamp of Sorrows
  - Issue #129: "A Mage's Advice" (26780) - Elwynn Forest
  - Issue #128/120: "A Brother's Disgust" (26779) - Elwynn Forest
  - Issue #127: Multiple quests (26294, 27104, 27322, 27463) - Various zones
  - Issue #126: Teldrassil quests (26455, 26926, 26942, 27266, 27273, 27274, 27276, 27277, 28657)
  - Issue #124: "Demons In Fel Rock" (27483) - Teldrassil
  - Issue #123: "Dark Council" (26516) - Ashenvale
  - Issue #122: "Pilfering the Reef" (26891) - Stranglethorn Vale
  - Issue #121: Silverpine Forest quests (26218, 26872, 26874, 27167, 27195, 27198, 27200)
  - Issue #118: "Find the Brother" (26778) - Elwynn Forest
  - Issue #117: "Waterlogged Journal" (26570) - Duskwood
- **Second Wave Quest Data Import** - Added 75+ additional quests from issues #104-116, #132, #153, #155-156
  - Issue #104-105: Elwynn Forest quests including "Spider Elixir" (26774), "The Soaked Barrel" (26777), "Find the Brother" (26778)
  - Issue #106: "A Mage's Advice" (26780) and "Linus Stone Tips" (26781) - Elwynn Forest
  - Issue #107: "Barroom Blitz" (26689) and starter zone quests - Elwynn Forest
  - Issue #108: Feralas quests including "Bad News Has Horns" (27488) and "The Sacred Flame" chain (27500-27501)
  - Issue #109: "My Sister Isabetta" (27205) - Darkshore
  - Issue #111: Hillsbrad/Desolace quests (26544, 27238, 26542, 26802)
  - Issue #112: "A Temporary Victory" (27000) - Wetlands
  - Issue #113: "Trial of the Willing" (26310) and Barrens quests (27167, 27171)
  - Issue #114: "My Friend, The Skullsplitter" chain (26885, 26886) - Stranglethorn Vale
  - Issue #115: Felwood quests "Legion Paisa" (26148) and "Mementos of the Third War" (27309)
  - Issue #116: Multiple Barrens quests (27166, 27195-27197)
  - Issue #132: "Prismatic Scales" (26287) - Stranglethorn Vale
  - Issue #153: Call to Skirmish quests (26368, 26374, 26376) and "Fresh Water Delivery" (27492)
  - Issue #155: "Wreck of the Kestrel" (26218) and "Azshara's Legacy" (27092)
  - Issue #156: Multiple quests including "Materials of the Light" (26312) and Thousand Needles quests (27489, 27490)
  - Issue #157: "Life In Death" (26711) - Duskwood
  - Issue #158: Westfall quest chain "Homecoming" (26987), "A Stubborn Man" (26988), "Thumbs Up, Man Down" (26989)
  - Added 40+ NPCs with coordinates for quest givers and turn-ins

### Changed
- **Fixed GitHub repository link** (GitHub #161)
  - Updated link from esurm/Questie to trav346/Questie in Advanced settings
  - Fixed all localization strings to use correct repository
- **Reverted Wrath quest database change** 
  - Disabling wotlkQuestDB.lua caused map pins to disappear after database recompile
  - The file must be loaded for the compiler to work properly
  - Will investigate a better solution to reduce memory usage

### Fixed
- **CRITICAL FIX**: Fixed data collection bug causing all quest objectives to be mixed up (GitHub #151)
  - Fixed incorrect WoW 3.3.5 API usage where GetNumQuestLeaderBoards() and GetQuestLogLeaderBoard() were being passed parameters they don't accept
  - This was causing all tracked quests to receive the same objectives from whatever quest was last selected
  - Data collected before this fix may have incorrect objective assignments
- Fixed Lua errors when hovering over invalid quest rewards in the quest log (GitHub #154)
  - Added QuestRewardTooltipFix module to hook and validate SetQuestLogItem calls
  - Prevents crashes with invalid reward indices for Epoch quests with placeholder data
- Fixed incorrect coordinates for "Pillar of Diamond" object (GitHub #119)
  - Corrected coordinates from 83.7,32.9 to 83.9,39.4 for quest "Tremors of the Earth" (717)
- Fixed Fight Promoter NPCs incorrectly showing as innkeeper pins on world map (removed INNKEEPER flag)
- Added defensive checks for Epoch quests incorrectly showing as repeatable (GitHub #90)
  - Added validation to prevent non-repeatable Epoch quests from showing blue exclamation marks
  - Added debug logging to help identify quests with incorrect repeatable flags
  - This fixes an issue where abandoned and retaken quests could show incorrect repeatable icons
- Fixed missing Elwynn Forest starter quests (GitHub #103)
  - Restored "Swiftpaw" quest (26776) and "The Soaked Barrel" quest (26777)
  - These quests were accidentally overwritten by High Isle Fel Elf quests
  - Moved "Fel Elf Slayer" quest to ID 28768 to resolve the conflict
- Fixed overly restrictive level filtering preventing Epoch quests from showing on map (GitHub #103)
  - Increased level range for "Show only quests granting experience" from +4 to +6 levels
  - Made Epoch quests (26000+) use more lenient filtering (+10 levels) due to placeholder level data
  - This resolves issues where Epoch quests weren't visible even with low-level quest display enabled

## [1.0.62] - 2024-11-12

### Added
- **Wetlands and Duskwood Quests** (GitHub #93): Added 10 quests from user data submission
  - Quest 26570: "Waterlogged Journal" (Duskwood)
  - Quest 26723: "Wanted: Plagued Shambler" (Duskwood)
  - Quest 27006: "Eye of Zulumar" (Wetlands)
  - Quest 27009: "Evacuation Report" (Wetlands)
  - Quest 27016: "Drastic Measures" (Wetlands)
  - Quest 27020: "With Friends Like These..." (Wetlands)
  - Plus 3 placeholder quests (27408, 28475, 28476)
  - Added 4 NPCs: Sven Yorgen, Mayor Oakmaster, Scout Barleybrew, Corporal Mountainview

- **Troll Starting Zone Quests** (GitHub #96): Added proper quest names and data
  - Quest 28722: "The Darkspear Tribe" with NPC Joz'jarz (46834)
  - Quest 28723: "Thievin' Crabs" with Amethyst Crab spawns and coordinates
  - Fixed quest giver/turn-in NPCs with accurate coordinates from data collection
  - Added quest objectives for all troll quests

- **Blasted Lands Quests** (GitHub #97): Added 22 quests from user data submission
  - Added quests 26277, 26598-26602, 26614-26619, 26621, 26626, 26628-26632, 27076
  - Added Commission quests 27659 and 28647
  - Added 5 NPCs with coordinates: Nina Lightbrew, Quartermaster Lungertz, Watcher Mahar Ba, Eunna, Spirit of the Exorcist
  - Quest levels range from 50-54

- **Westfall Quests** (GitHub #94): Added 4 quests from user data submission
  - Three "The Killing Fields" quests (26994, 26995, 26996) - levels 10, 12, 14
  - "Commission for Protector Gariel" (28495) - level 5
  - Uses existing classic NPCs: Farmer Furlbrow, Farmer Saldean, Protector Gariel

- **Stranglethorn Vale & Barrens Quests** (GitHub #99): Added 15 quests from user data submission
  - Stranglethorn: Deeg's Lost Pipe (26285), Prismatic Scales (26287), Troll Relic (26290), The Janky Helmet (26904/26905), Commission for Captain Hecklebury Smotts (28073)
  - Barrens quest chain: Finding the Clues (27168) through Nadia's Task (27176) - 9 linked quests
  - Added 13 NPCs including Deeg, Venture Co. Tinkerer, Scooty, Captain Hecklebury Smotts, Mankrik, Shin'Zil, Nadia
  - Quest levels range from 14-43

- **Banana Bonanza Quest Complete Data**: Added full data from collection system
  - Quest 28757 now has quest giver Daz'tiro (46718) and turn-in NPC Azisary (47100)
  - Added Sun-Ripened Banana ground object (188800) with 5 spawn locations from data collection
  - Map pins will now show for quest givers, turn-in NPC, and banana spawn points

### Fixed
- **Quest 26723 Compilation Error**: Fixed incorrect table structure in epochQuestDB.lua
- **Quest 28764 Objectives Error**: Fixed "Second Tablet Read" tooltip error for event/script objectives
- **Export Window UI** (GitHub #89): Improved user experience with step-by-step process
  - Changed to 3-step process: Go to GitHub → Copy Data → Close & Purge
  - Made GitHub URL copyable with EditBox instead of FontString
  - Removed unnecessary "Select All" button as text is pre-selected
- **Troll Quest Names** (GitHub #96): Fixed incorrect quest names
  - Corrected mismatched quest names that were wrongly assigned
  - Removed made-up quest names, using real data from submissions
- **Tracker Nil Description Error**: Fixed tracker crash for quests without Description field
  - Added nil check before accessing quest.Description[1]
  - Provides fallback text for Epoch quests lacking descriptions
- **Data Collection for Epoch Quests**: Fixed Amethyst Crab and other mob data not being collected
  - Now ALL Epoch quests (26000+) are tracked for continuous data improvement
  - Previously only missing or incomplete quests were tracked
- **Quest Completion Notifications**: Simplified formatting
  - Removed double line separators for cleaner appearance
  - Changed hyperlink to simple "Click here to submit quest data"
  - Changed message to "Epoch quest completed!" for clarity
- **Cannot Untrack Epoch Quests** (GitHub #98): Removed all restrictions preventing quest untracking
  - Users can now untrack any quest including Epoch quests
  - Fixed UntrackQuestId, manual toggle, and Shift+Click untracking
  - Data collection happens independently of tracker visibility
- **GetQuestResetTime() Error**: Fixed error spam when API returns -1
  - Added graceful fallback to 24-hour reset when daily quest API unavailable
  - Common on Project Epoch where daily quests may not be implemented
  - No longer shows error message, uses default timing instead
- **Data Collection Debug Messages**: Removed chat spam during objective tracking
  - Disabled "Action: Item collection" and location coordinate messages
  - Progress tracking still works but now operates silently
- **QuestieDB.QueryQuest Nil Error**: Fixed crash when accepting quests before database initialization
  - Added safety checks for uninitialized database functions
  - Gracefully handles early quest acceptance during loading
- **Data Collection After Logout/Login**: Fixed tracking not resuming after relogging
  - Epoch quests now stay tracked even if database isn't ready
  - Events properly re-register after login
  - Objectives populate correctly for quests in progress
- **Developer Options Not Saving** (GitHub #102): Fixed developer options turning back on after restart
  - Tooltip IDs no longer forced on when data collection is disabled
  - Settings now properly persist between sessions

## [1.0.61] - 2025-08-30

### Added
- **Export Button in Minimap Menu**: Added quick access to data export window from Questie minimap dropdown (GitHub #89)
  - Left-click Questie minimap icon shows new "Export Quest Data" option
  - Only appears when data collection is enabled
  - Makes submitting quest data much easier for contributors

- **Missing Troll Starting Zone Quests**: Added 18 troll quests that were mentioned in previous changelog but never actually added
  - Quests 28750-28767 including "The Darkspear Tribe", "Banana Bonanza", etc.
  - All quests now have proper NPC and objective data
  - Fixed issue where quest 28759 wasn't showing on map despite being in quest log

- **Additional Epoch Quests**: Added quests from GitHub issue #91
  - Quest 26282: "The Emerald Dragon..." with NPC Deeg (2488)
  - Quest 26283: "Sasha's Hunt" with NPC Deeg (2488)
  - Quest 26284: "Justice for the Hyals" with NPC Crank Fizzlebub (2498)
  - Quest 26285: "Justice for the Hyals" (turn-in) with NPC Historian Karnik (2916)
  - Quest 26286: "Into the Scarlet Monastery" with NPC Historian Karnik (2916)

### Changed
- **Simplified Data Collection Messages**: Replaced verbose multi-line messages with single notification
  - Changed from 3-line spam with GitHub URL to simple: "Quest not in database. This quest is now being tracked by Data Collector!"
  - Makes data collection less intrusive while still informative
  - Debug messages now properly respect showDataCollectionMessages setting

### Fixed
- **IsComplete Nil Errors**: Fixed multiple crashes when accepting quests
  - Added defensive checks in QuestieMap before calling quest:IsComplete()
  - Runtime stub quests now handled gracefully without crashes
  - Fixed error occurring when accepting troll quest 28760

- **Debug Message Spam**: Fixed debug messages bypassing the showDataCollectionMessages setting
  - All [DEBUG] and [DataCollector Debug] messages now properly controlled by settings
  - Fixed 4 direct chat prints that were ignoring the toggle
  - Debug system now properly centralized through DebugMessage function

## [1.0.60-hotfix2] - 2025-08-30

### Fixed
- **Quest 26768 Data Error**: Fixed "bad argument to rshift" compilation error
  - Corrected object objectives structure from `{nil,{{{objects}}}}` to `{nil,{{objects}}}`
  - Removed extra nesting level that was causing compilation failure
  - Quest "Barrel Down" now loads properly

## [1.0.60-hotfix] - 2025-08-30

### Fixed
- **Load Order Error**: Fixed epochQuestDB.lua causing "attempt to index global QuestieDB (a nil value)" error
  - Added missing QuestieDB import at top of file
  - Other Epoch database files already had proper imports

### Added  
- **Data Collection Message Toggle**: Added setting to control [DATA] message visibility
  - New setting in Advanced tab: "Show Collection Messages" (off by default)
  - `/qdc messages` command to quickly toggle messages on/off
  - Allows silent data collection without chat spam
  - Collection still works even with messages disabled

## [1.0.60] - 2025-08-30

### Fixed

#### Critical Error Fixes
- **AvailableQuests Error**: Fixed "attempt to index local 'npc' (a nil value)" error when quest starters are single IDs instead of tables (Fixes #43, #46, #52)
  - Now properly handles quests with single NPC or GameObject starters
  - Converts single IDs to tables before processing
  - Quest markers now gracefully handle incomplete quest data
- **QuestieTracker Error**: Fixed "IsComplete() nil value" error when tracking malformed quests
  - Added defensive check for quest objects missing the IsComplete method
  - Prevents tracker crash when encountering incomplete quest data
  - Fixed tracker showing completed quests after accepting new ones
  - Fixed tracker not refreshing properly when completing and accepting quests
  - Completed quests are now properly cleaned from QuestiePlayer.currentQuestlog
- **QuestieShutUp Filter**: Fixed chat filter not blocking Questie messages from party members (Fixes #55)
  - Corrected pattern mismatch between filter and actual message format
  - Filter now properly matches locale-specific message formats
- **World Map Tooltips**: Fixed tooltips not showing on vanilla fullscreen world map (merged PR #25 from @virtiz)
  - Tooltips now properly check full parent chain to detect WorldMapFrame ancestry
  - Added SetClampedToScreen to keep tooltips visible at screen edges
- **Object Data Errors**: Fixed "Missing objective data" errors showing table references instead of meaningful descriptions
  - Now silently skips missing data or logs at debug level only
  - Prevents spam for missing object ID 6445625 and similar
- **Critical Map Pin Fix**: Imported WotLK database to fix all service NPC detection
  - Project Epoch was using Classic-era NPC flags (INNKEEPER=128) but needed WotLK flags (INNKEEPER=65536)
  - Fixed version detection to properly identify 3.3.5 client and use correct flag values
  - All service NPCs (innkeepers, bankers, auctioneers, trainers, etc.) now show correctly on maps
- **Stormwind Service NPCs**: Fixed bankers, auctioneers, and weapon master not showing on map
  - Updated 3 bankers (Olivia, Newton, John Burnside) with correct coordinates and flags from WotLK database
  - Updated 3 auctioneers (Chilton, Fitch, Jaxon) with correct coordinates and flags from WotLK database
  - Fixed Woo Ping (weapon master) location from wrong coordinates (57.13,57.71) to correct position (63.88,69.09)
  - All NPCs now use proper service flags (131073 for bankers, 2097152 for auctioneers, 81 for weapon master)
- **Stormwind NPCs**: Restored Innkeeper Allison and Dungar Longdrink (flight master) on map tracker
  - Removed placeholder entries in epochNpcDB.lua that were overriding Classic database
  - NPCs now show with proper names and service flags when tracked
- **Children's Week**: Permanently removed seasonal quest from showing year-round
  - Removed quest 1468 from event system overrides
  - Blacklisted NPCs 14305 (Human Orphan) and 14450 (Orphan Matron Nightingale)
  - Quest will no longer appear even during May 1-7 event dates
- **Quest Database**: Fixed duplicate and incorrect quest entries (Fixes #78, #79, #80, #81)
  - Consolidated duplicate quest entries for quests 26285, 26286, 26287, 26288, 26289, 26292, 26907
  - Removed conflicting epochQuestData stub entries that were overwriting complete quest data
  - Updated quest 26285 "Deeg's Lost Pipe" with proper quest giver and objective data
  - Added missing quest entries 26286-26292 to main database array with proper data structure
  - Added missing NPC 2488 (Deeg) to support "Deeg's Lost Pipe" quest
  - Removed duplicate entry for quest 26987 "Homecoming" with wrong quest giver (NPC 491)
  - Removed incorrect entry for quest 26987 with wrong title "Moving Up"
  - Fixed Innkeeper Allison coordinates in Stormwind (was 60.39,75.28, now 52.62,65.7)
  - Fixed quest 26993 "The Killing Fields" with proper objectives and mob targets (Riverpaw Gnolls and Scouts)
  - Cleaned up quest data integrity in epochQuestDB.lua
#### Data Collection Overhaul
- **Container Names Fixed**: Major fixes to ground object/container tracking (Fixes #32)
  - Fixed container names being lost when they match item names (e.g., "Sun-Ripened Banana") 
  - Fixed container names being overwritten with placeholders like "Unidentified Container"
  - Container names now properly captured from GameTooltip during mouseover
  - Container names preserved even when loot window doesn't show the name
  - Export now includes proper container data for ground object quests
  - Added automatic rescan 1 second after initialization (no more manual `/qdc rescan` needed)
- **Runtime Stub Detection**: Fixed missing quest detection for runtime stubbed quests (Fixes #21)
  - Now properly detects quests created as runtime stubs (e.g., new troll starting zone quests)
  - Removed upper limit on Epoch quest IDs (now tracks all quests 26000+)
  - Fixed detection of [Epoch] prefix in questData.name for placeholder quests
  - Now correctly identifies and tracks quest 28722 "The Darkspear Tribe" and similar new quests
- **Chat Spam Removed**: Fixed [DATA] messages being shown to all users (Fixes #27)
  - All [DATA] tracking messages now only show when debug mode is enabled
  - Removed all alert messages when accepting quests - silently tracks data
  - Important completion notices still show when needed
  - Added helper function to properly handle debug-only messages
- **Export Improvements**: All quest data can now be exported, even incomplete quests
  - Partial data is valuable - shows quest givers, objectives, NPCs even without turn-in
  - Export window now shows [COMPLETE] or [INCOMPLETE] status for each quest
  - Export format clearly indicates if quest data is incomplete
- **Quest Progress Detection**: Enhanced automatic tracking
  - Now detects quest progress from system messages (e.g., "Sun-Ripened Banana: 7/10")
  - Automatically captures container/object data when quest progress is detected
  - Links ground objects to quest objectives for proper map icon placement

#### Map and Tracking Improvements  
- **Map Error Handling**: Fixed error for unknown zones like custom Project Epoch areas
  - Changed hard error to warning for unmapped zones (e.g., areaId 178 "Deeg")
  - Allows addon to continue functioning with custom server zones
- **Map Scaling**: Simplified world map dimension calculations (Fixes #39)
  - Removed unnecessary conditional scaling logic that was never triggered
  - WorldMapButton width consistently returns 1002 in both fullscreen and windowed modes
  - Map icons should now position correctly regardless of map mode
- **Party Tooltips**: Fixed party member quest progress not showing in tooltips
  - Properly access remoteQuestLogs structure for fallback mechanism
  - Shows party progress even when no per-mob tooltip cache exists
- **TomTom Integration**: Fixed TomTom auto-waypoint permanently changing tracker sort
  - TomTom now finds closest quest independently without modifying tracker sort preference
  - User's chosen sort order (proximity, level, etc.) is no longer overridden
- **Quest Item Tracking**: Fixed tracker hiding quests when looting quest items
  - Preserves quest tracking state when items are looted from ground objects
  - Prevents quests from being inadvertently untracked during objective updates
- **Quest Level Filtering**: Fixed quest level filtering and improved usability (Fixes #41)
  - Quests with "[Epoch] Quest XXXXX" placeholder names are now hidden from the map
  - Epoch quests with missing/zero requiredLevel now properly respect level filters
  - Changed "Show only quests granting experience" to hide red quests (5+ levels above player)
  - Now shows green, yellow, and orange quests but hides red quests that clutter the map

### Added
- **Quest Items**: Added 10+ quest items with proper drop sources
  - Raw Springsocket Eel, Pinch of Bone Marrow, Vial of Vulture Blood, Kratok's Horn, Slaver's Records
  - Commission items for various quests
- **WotLK Database**: Imported complete WotLK database files for proper 3.3.5 support
  - Added wotlkQuestDB.lua, wotlkNpcDB.lua, wotlkObjectDB.lua, wotlkItemDB.lua
  - Fixes all service NPC flag detection issues
  - Provides correct NPC data for WotLK expansion content
- **Quest Data**: Added 90+ new Epoch quests from GitHub issues (#71-87)
  - The Hinterlands: 5 Alliance quests including "A Sticky Situation", "Can't Make An Omelette Without...", "Falling Up To Grace", "Parts From Afar", "Stalking the Stalkers"
  - Westfall: 5 Alliance quests including "Hand of Azora" chain, "Homecoming", "The Killing Fields"
  - Silverpine Forest: 2 Horde quests "Lost in the Lake", "Wreck of the Kestrel"
  - Ashenvale: Added quest 27880 "Fight for Warsong Gulch" (level 14 battleground introduction quest)
  - Westfall: Added quest 28495 "Commission for Protector Gariel" (level 5 collection quest)
  - Various zones: 8 Call to Skirmish quests for Thousand Needles, Alterac Mountains, Desolace, Arathi Highlands and other content
  - Hillsbrad Foothills: "Who Likes Apples?", "Fresh Water Delivery", "The Ghost of the Flats", "Threats from Abroad", "To The Hills"
  - Badlands: "Springsocket Eels", "An Old Debt", multiple commission quests
  - Tanaris: "Call to Skirmish" PvP quests
  - Winterspring/EPL: High-level Horde quests including "Nightmare Seeds", "Hero Worship"
  - Desolace: "The Argus Wake" 5-quest chain (42-44)
  - Searing Gorge: Thorium Brotherhood quests
  - Elwynn Forest: "Barroom Blitz" series, commission quests
  - Updated existing quests with complete data: "Arugal Ambush", "The Killing Fields"
- **NPCs**: Added 35+ new NPCs with proper locations
  - The Hinterlands: Truk Wildbeard, Kerr Ironsight, Tizzie Sparkcraft, Chief Engineer Urul, Gryphon Master Stonemace, Gryphon Master Talonaxe
  - Westfall: Karlain, Revil Kost, Quartermaster Lewis
  - Silverpine Forest: Ainslie Yance, Edwin Harly, Dalar Dawnweaver, Kor
  - Ashenvale: Added NPC 44806 "Warsong Gulch Battlemaster" for battleground quest access
  - Hillsbrad/Thousand Needles: Jason Lemieux, Pozzik, Deeg, Commander Strongborn
  - Badlands: Zeemo, Dirk Windrattle, Joakim Sparkroot
  - Searing Gorge: Merida Stoutforge, Bhurind Stoutforge, Grampy Stoutforge, Lookout Captain Lolo Longstriker
  - Desolace: Felicity Perenolde, Zala'thria, Kratok
  - Eastern Plaguelands: Engineer Flikswitch, Harbinger Balthazad
  - Elwynn Forest: Jason Mathers
- **Objects**: Added ground objects for quest item collection
  - Sack of Oats in Westfall (3 spawn points)
  - Fishing Bobber in Stormwind City

### Changed
- **epochStormwindFixes.lua**: Disabled due to causing issues with seasonal NPCs and incorrect positions
  - Was adding 546 NPC entries, many with wrong coordinates or inappropriate seasonal content
  - Service NPCs now properly handled by WotLK database

### Removed
- **POI Markers**: Fixed service NPCs not appearing on Stormwind map (Fixes #42)
  - Added proper npcFlags to flight master, innkeeper, auctioneers, bankers, trainers, and repair vendors
  - Updated epochStormwindFixes.lua with service flags for 30+ NPCs
- **Mailbox Locations**: Fixed misplaced mailboxes throughout Stormwind (Fixes #42)
  - Updated 10 mailbox coordinates based on actual WotLK positions
  - Added mailboxes in Trade District, Cathedral Square, Park District, Mage Quarter, Old Town, and Dwarven District

## [1.0.53] - 2025-08-28

Note: Versions 1.0.54-59 were internal development versions. All changes from those versions are included in v1.0.60 above.

## [1.0.4] - 2025-08-27

### Fixed
- **Party tracking tooltips**: Added fallback mechanism to show party member quest progress when no per-mob tooltip cache exists
- **DataCollector errors**: Fixed questID being passed as table instead of number in multiple locations
  - Added defensive checks in CheckExistingQuests, OnQuestAccepted, and GetQuestIdFromLogIndex
  - Fixed GetQuestsByZoneId iterating over QuestPointers with table keys
  - Added pcall wrapper to gracefully handle errors
  - Note: Requires complete WoW restart to load the fixes (not just /reload)

## [1.0.3] - 2025-08-27

### Fixed
- **Major tracker fix**: Fixed QuestLogCache not populating on initial load causing only 1 quest to show
- Fixed tracker not showing despite having tracked quests
- Fixed tracker UI element not being visible even when functioning correctly
- Fixed manual quest tracking toggle functionality
- Fixed QuestieDB.GetQuest being called with tables instead of quest IDs
- Fixed TrackerUtils handling of non-table quest entries
- Fixed QuestieDataCollector passing invalid questIDs to GetQuest
- Fixed data purge button not actually clearing saved quest data
- Fixed quest 26936 "Northshore Mine" incorrect turn-in NPC (now correctly shows Jasper Greene)

### Added
- Mouse wheel scrolling support for quest tracker
- Debug commands: `/run QuestieTracker:CheckStatus()` and `/run QuestieTracker:ForceScanQuests()`
- Force show tracker command: `/run QuestieTracker:ForceShow()`
- Added 6 Epoch quests with proper data (26926, 26932, 26934, 26936, 26940, 26942)
- Added NPCs: Fergus Kitsapell (45899), Gernal Burch (45902)
- Added items: Case of Ore (62803), Joseph's Journal (62811)

### Changed
- Improved runtime stub creation for Epoch quests
- Enhanced error handling in database queries
- Updated tracker initialization to force update after load

## [1.0.2] - 2025-08-27

### Fixed
- Fixed tracker nil reference bugs with AutoUntrackedQuests
- Added nil checks to prevent "0/0 quests" display issue
- Fixed manual quest tracking not working
- Added safety checks for frame creation failures

### Added
- Map zoom fix module (experimental)

## [1.0.1] - 2025-08-27

### Fixed
- Repository references updated to point to Questie-Epoch
- Version numbering corrected

## [1.0.0] - 2025-08-27

### Initial Release
- Fork of esurm/Questie optimized for Project Epoch
- 600+ Epoch quests in database (IDs 26000-26999)
- Developer mode for community quest data collection
- Real-time capture of NPCs, items, and objective locations
- Batch export functionality for all captured quest data
- Data purge feature after submission
- Read-only export window
- GitHub submission instructions

### Known Issues
- Map zoom causes marker displacement (3.3.5a limitation)
- Many Epoch quests still need validation through gameplay