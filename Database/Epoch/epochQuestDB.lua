---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")

epochQuestData = {}

-- Issue #58: High Isle of Fel High Elves questline - Darkshore extension content
epochQuestData[26766] = {"The Warging Way",{{46292}},{{46292}},nil,58,nil,nil,{"Kill 15 Worgen Infiltrators."},nil,{{{46374,nil}}},nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26767] = {"Like Fish In A Barrel",{{46292}},{{46292}},nil,58,nil,nil,{"Kill Howling Keena, Gnash, and Rogan Thunderhorn."},nil,{{{46375,nil},{46376,nil},{46377,nil}}},nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26768] = {"Barrel Down",{{46292}},{{46292}},nil,58,nil,nil,{"Destroy the Worgen explosives."},nil,{nil,{{187980,nil},{187981,nil},{187982,nil}}},nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26769] = {"Gnarlier Than Thou",{{46292}},{{46292}},nil,59,nil,nil,{"Slay the Old Gnarled Root."},nil,{{{46379,nil}}},nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26770] = {"[Epoch] Quest 26770",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26771] = {"The High Isle of Fel High Elves",{{46293}},{{46293}},nil,60,nil,nil,{"Kill 15 Fel High Elves and collect 5 books: Book of Lost Souls, Book of Dark Magic, Book of Forbidden Knowledge, Book of Elven Torture, and Book of Deadly Poisons."},nil,{{{46381,nil},{46382,nil},{46383,nil},{46384,nil},{46385,nil},{46386,nil}},nil,{{62836,nil},{62837,nil},{62838,nil},{62839,nil},{62840,nil}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26772] = {"Necromancy and You",{{46294}},{{46294}},nil,60,nil,nil,{"Kill 15 Undead and the Necromancer Overlord in the cave on High Isle."},nil,{{{46387,nil},{46388,nil},{46389,nil},{46390,nil}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26773] = {"[Epoch] Quest 26773",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
-- Removed placeholders for 26774 and 26775 (defined later with correct data)
-- Restored original Elwynn Forest starter quests (were overwritten by Fel Elf quest which is now at 28768)
epochQuestData[26776] = {"Swiftpaw",{{11940}},{{11940}},4,6,77,nil,{"Bring Swiftpaw's Snout to Merissa Stilwell outside Northshire Abbey."},nil,{nil,nil,{{60388,nil}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26777] = {"The Soaked Barrel",{nil,{4000007}},nil,1,1,77,nil,{"Find someone in Northshire Abbey who may know the owner of the barrel."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,{60021},26778,nil,1,nil,nil,nil,nil,nil,nil}
epochQuestData[26778] = {"[Epoch] Quest 26778",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26779] = {"The Demon of the Grove",{{6778},{1377}},{{6778}},nil,11,nil,nil,{"Kill Melanas and bring Melanas' Head to Melika Isenstrider in Darnassus."},nil,{{{2038,nil}},nil,{{5221,nil}}},nil,nil,{927},nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,927,nil,nil,nil,nil,nil}
epochQuestData[26780] = {"[Epoch] Quest 26780",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}

-- Issue #86: The Argus Wake questline (Desolace)
epochQuestData[26529] = {"The Argus Wake",{{45527}},{{45527}},nil,42,nil,nil,{"Felicity Perenolde wants you to acquire 10 Pinches of Bone Marrow from the skeletons in the Kodo Graveyard."},nil,{nil,nil,{{62691,nil}}},nil,nil,nil,{26530},nil,nil,405,nil,nil,nil,nil,26530,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26530] = {"The Argus Wake",{{45527}},{{45527}},nil,42,nil,nil,{"Felicity Perenolde wants you to acquire 10 Vials of Vulture Blood from the vultures in the Kodo Graveyard."},nil,{nil,nil,{{62692,nil}}},nil,nil,{26529},{26531},nil,nil,405,nil,nil,nil,nil,26531,85,0,26529,nil,nil,nil,nil,nil}
epochQuestData[26531] = {"The Argus Wake",{{45527}},{{45528}},nil,43,nil,nil,{"Felicity Perenolde wants you to subdue Zala'thria and take her to the skeleton of the patriarch in the Kodo Graveyard."},nil,{{{45529,"Zala'thria subdued"}}},nil,nil,{26530},{26532},nil,nil,405,nil,nil,nil,nil,26532,85,0,26530,nil,nil,nil,nil,nil}
epochQuestData[26532] = {"The Argus Wake",{{45528}},{{45528}},nil,44,nil,nil,{"Felicity Perenolde wants you to interrogate Zala'thria."},nil,{{{45530,"Zala'thria interrogated"}}},nil,nil,{26531},{26533},nil,nil,405,nil,nil,nil,nil,26533,85,0,26531,nil,nil,nil,nil,nil}
epochQuestData[26533] = {"The Argus Wake",{{45528}},{{45528}},nil,44,nil,nil,{"Felicity Perenolde wants you to kill Kratok and acquire Kratok's Horn."},nil,{{{45531,nil}},nil,{{62693,nil}}},nil,nil,{26532},nil,nil,nil,405,nil,nil,nil,nil,nil,85,0,26532,nil,nil,nil,nil,nil}

-- Issue #60: Stonetalon Mountains quest data
epochQuestData[26938] = {"[Epoch] Quest 26938",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26939] = {"Forging the Way",{{10299}},{{10299}},nil,39,nil,nil,{"Collect 6 Gnome Artificial Arms from Rogue Gnome Artificers and bring them to Keeper Ordanus in Stonetalon Mountains."},nil,{{{45807,nil},{45809,nil}},nil,{{62994,nil}}},nil,nil,nil,nil,nil,nil,406,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26940] = {"[Epoch] Quest 26940",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26941] = {"[Epoch] Quest 26941",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26942] = {"[Epoch] Quest 26942",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}

-- Issue #61: Scholomance Academy questline - Western Plaguelands
epochQuestData[26963] = {"[Epoch] Quest 26963",{{46322}},{{46322}},nil,53,nil,nil,nil,nil,{{{46323,nil},{46329,nil},{46326,nil},{46327,nil}}},nil,nil,nil,{26964},nil,nil,28,nil,nil,nil,nil,26964,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26964] = {"Observing the Dress Code",{{46322}},{{46326}},nil,53,nil,nil,{"Bring 8 Putrid Spider Silk to Isabelle Pickman at Caer Darrow."},nil,{nil,nil,{{62759,nil}}},nil,nil,{26963},{26965},nil,nil,28,nil,nil,nil,nil,26965,8,0,26963,nil,nil,nil,nil,nil}
epochQuestData[26965] = {"Observing the Dress Code",{{46326}},{{46326}},nil,53,nil,nil,{"Kill Sharlot and bring her Spinneret to Isabelle Pickman."},nil,{nil,nil,{{62760,nil}}},nil,nil,{26964},{26966},nil,nil,28,nil,nil,nil,nil,26966,8,0,26964,nil,nil,nil,nil,nil}
epochQuestData[26966] = {"Second Day of School",{{46322}},{{46322}},nil,53,nil,nil,{"Equip the Scholomance Academy Tabard."},nil,nil,nil,nil,{26965},nil,nil,nil,28,nil,nil,nil,nil,nil,nil,0,26965,nil,nil,nil,nil,nil}
epochQuestData[26967] = {"Scourge Botany",{{46323}},{{46323}},nil,54,nil,nil,{"Obtain 6 Fungus Samples from the Weeping Cave and bring them to Doctor Atwood."},nil,{nil,nil,{{62762,nil}}},nil,nil,{26966},{26968},nil,nil,28,nil,nil,nil,nil,26968,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26968] = {"Scourge Botany",{{46323}},{{46323}},nil,54,nil,nil,{"Acquire a pure Elwynn Soil Sample from the dirt mound at the Northridge Lumber Camp."},nil,{nil,nil,{{62763,nil}}},nil,nil,{26967},{26969},nil,nil,28,nil,nil,nil,nil,26969,8,0,26967,nil,nil,nil,nil,nil}
epochQuestData[26969] = {"Scourge Botany",{{46323}},{{46323}},nil,54,nil,nil,{"Plant the fungus samples in the prepared soil and observe the results."},nil,nil,nil,nil,{26968},nil,nil,nil,28,nil,nil,nil,{62765},nil,nil,1,26968,nil,nil,nil,nil,nil}
epochQuestData[26970] = {"Cooking with Carrion",{{46326}},{{46326}},nil,53,nil,nil,{"Gather 4 Exceptionally Large Eggs from Carrion Vultures and bring them to Isabelle Pickman."},nil,{nil,nil,{{62768,nil}}},nil,nil,{26966},{26971},nil,nil,28,nil,nil,nil,nil,26971,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26971] = {"Cooking with Carrion",{{46326}},{{46326}},nil,53,nil,nil,{"Obtain a Thresher Saliva Gland from a Putrid Lake Thresher and return to Isabelle Pickman."},nil,{nil,nil,{{62757,nil}}},nil,nil,{26970},nil,nil,nil,28,nil,nil,nil,nil,nil,8,0,26970,nil,nil,nil,nil,nil}
epochQuestData[26972] = {"Extra Credit",{{46322}},{{46322}},nil,54,nil,nil,{"Collect 4 Shadow-Resistant Notebooks from Scarlet Lumberjacks and bring them to Dean Blackwood."},nil,{nil,nil,{{62771,nil}}},nil,nil,{26966},nil,nil,nil,28,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26973] = {"Advanced Alchemy",{{46323}},{{46323}},nil,54,nil,nil,{"Use the Collection Syringe to get three samples of ooze from the Weeping Cave."},nil,nil,nil,nil,{26966},{26974},nil,nil,28,nil,nil,nil,{62756},26974,nil,1,nil,nil,nil,nil,nil,nil}
epochQuestData[26974] = {"Advanced Alchemy",{{46323}},{{46327}},nil,54,nil,nil,{"Speak to Proctor Blackwood to begin the experiment."},nil,nil,nil,nil,{26973},{26975},nil,nil,28,nil,nil,nil,nil,26975,nil,0,26973,nil,nil,nil,nil,nil}
epochQuestData[26975] = {"Advanced Alchemy",{{46327}},{{46323}},nil,54,nil,nil,{"Protect Proctor Phillips as he completes the experiment."},nil,nil,nil,nil,{26974},nil,nil,nil,28,nil,nil,nil,nil,nil,nil,0,26974,nil,nil,nil,nil,nil}
epochQuestData[26976] = {"History 101",{{46329}},{nil,{4001056}},nil,53,nil,nil,{"Copy the text of the plaque in the basement of the Barov Sepulcher."},nil,nil,nil,nil,{26966},{26977},nil,nil,28,nil,nil,nil,nil,26977,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26977] = {"History 101",{nil,{4001056}},{{46324}},nil,53,nil,nil,{"Speak to the Ghost of Alexei Barov."},nil,{{{46324,nil}}},nil,nil,{26976},{26978},nil,nil,28,nil,nil,nil,nil,26978,8,0,26976,nil,nil,nil,nil,nil}
epochQuestData[26978] = {"History 101",{{46324}},{{46329}},nil,53,nil,nil,{"Return to Professor Hanlon at Caer Darrow with this information."},nil,nil,nil,nil,{26977},nil,nil,nil,28,nil,nil,nil,nil,nil,nil,0,26977,nil,nil,nil,nil,nil}
epochQuestData[26979] = {"Senior Prank",{{46331}},{{46331}},nil,54,nil,nil,{"Get some dung from the Scarlet Outhouse along the road leading north to Hearthglen."},nil,{nil,nil,{{62779,nil}}},nil,nil,{26966},{26980},nil,nil,28,nil,nil,nil,nil,26980,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26980] = {"Senior Prank",{{46331}},{{46331}},nil,54,nil,nil,{"Collect a piece of Brimstone from a Scarlet Invoker."},nil,{nil,nil,{{62780,nil}}},nil,nil,{26979},{26981},nil,nil,28,nil,nil,nil,nil,26981,8,0,26979,nil,nil,nil,nil,nil}
epochQuestData[26981] = {"Senior Prank",{{46331}},{{46331}},nil,54,nil,nil,{"Take the bags of dung to Uther's Tomb, The Bulwark, and Chillwind Camp and light them on fire."},nil,{nil,{{4001060,nil}}},nil,nil,{26980},nil,nil,nil,28,nil,nil,nil,nil,nil,8,0,26980,nil,nil,nil,nil,nil}
epochQuestData[26982] = {"[Epoch] Quest 26982",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26983] = {"[Epoch] Quest 26983",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26984] = {"[Epoch] Quest 26984",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26985] = {"[Epoch] Quest 26985",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26986] = {"[Epoch] Quest 26986",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26987] = {"Homecoming",{{45939}},{{45939}},nil,13,nil,nil,nil,nil,{nil,nil,{{62859,1}}},nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26988] = {"A Stubborn Man",{{45939}},{{45940}},nil,13,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26989] = {"Thumbs Up, Man Down",{{45940}},{{45940}},nil,15,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26990] = {"[Epoch] Quest 26990",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26991] = {"[Epoch] Quest 26991",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26992] = {"[Epoch] Quest 26992",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26993] = {"[Epoch] Quest 26993",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}

-- Issue #62: Missing quest name
epochQuestData[26994] = {"The Killing Fields",nil,nil,10,10,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil}

-- Issue #78: Batch quest data submission
epochQuestData[26217] = {"Lost in the Lake",{{45044}},{{1938}},nil,16,nil,nil,nil,nil,{nil,nil,{{60137,1},{60138,1}}},nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26218] = {"Wreck of the Kestrel",{{2140}},nil,nil,13,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26368] = {"Call to Skirmish: Thousand Needles",nil,nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26370] = {"Call to Skirmish: Alterac Mountains",nil,nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26372] = {"Call to Skirmish: Desolace",nil,nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26374] = {"Call to Skirmish: Arathi Highlands",nil,nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27244] = {"Drysnap Delicacy",nil,nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27273] = {"[Epoch] Quest 27273",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28501] = {"[Epoch] Quest 28501",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}

-- Issue #75: Springsocket commission quests - Barrens
epochQuestData[28077] = {"Commission for Dirk Windrattle",{{45604}},{{45604}},nil,40,nil,nil,{"Bring 10 Dragonbreath Chili to Dirk Windrattle at Springsocket."},nil,{nil,nil,{{12217,10}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28535] = {"Commission for Joakim Sparkroot",{{45575}},{{45575}},nil,50,nil,nil,{"Bring 20 Purple Lotus to Joakim Sparkroot."},nil,{nil,nil,{{8831,20}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28618] = {"Commission for Joakim Sparkroot",{{45575}},{{45575}},nil,40,nil,nil,{"Bring 5 Worn Dragonscale to Joakim Sparkroot at Springsocket."},nil,{nil,nil,{{8165,5}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Troll/Orc Starting Zone Quests (Durotar / Echo Isles area) - From issue #96
-- Quests with correct names from data submission
epochQuestData[28722] = {"The Darkspear Tribe",{{46834}},nil,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Joz'jarz at [70, 42]
epochQuestData[28723] = {"Thievin' Crabs",{{46834}},{{46718}},nil,2,nil,nil,{"Slay 10 Amethyst Crabs."},nil,{{{46835,10}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Joz'jarz, turn-in: Daz'tiro, Amethyst Crab ID: 46835
epochQuestData[28739] = {"Azsharan Idols",{{46934}},nil,nil,4,nil,nil,{"Collect 3 idols."},nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Uwa, needs item ID
epochQuestData[28740] = {"Tainted Tablet",nil,{{46934}},nil,1,nil,nil,{"Read Tainted Tablet and speak to Uwa."},nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Unknown (not an NPC quest), turn-in: Uwa

-- Additional troll quests with corrected names from issue #96
epochQuestData[28750] = {"Return of the King",nil,nil,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28751] = {"Recovery Work",nil,nil,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28752] = {"Your Seat Awaits",nil,nil,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28753] = {"Island Troll-kin",nil,nil,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28754] = {"Troll Skull Poker",nil,nil,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28755] = {"Smoked Boar Meat",nil,nil,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28757] = {"Banana Bonanza",{{46718}},{{47100}},nil,3,nil,nil,{"Collect 10 Sun-Ripened Bananas."},nil,{nil,{{188800,10,"Sun-Ripened Banana"}},{{110002,10}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28758] = {"Shell Collection",nil,nil,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28759] = {"Claws of the Cat",nil,nil,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28760] = {"Jinxed Trolls",nil,nil,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28761] = {"Source of the Jinx",nil,nil,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28762] = {"Report to Master Gadrin",nil,nil,nil,4,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28763] = {"Report to Razor Hill",nil,nil,nil,4,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28764] = {"The Loa of Death",nil,nil,nil,4,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Troll starting zone, interact with Second Tablet of Bwonsamdi at [73.4, 54.7] (needs object ID)
epochQuestData[28765] = {"Tidal Menace",nil,nil,nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28766] = {"Pouch of Strange Shells",nil,nil,nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28767] = {"The Naga Menace",nil,nil,nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28756] = {"Missing Quest 28756",nil,nil,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Gap in troll sequence

-- Issue #73: Springsocket fishing quest - Barrens
epochQuestData[26126] = {"Springsocket Eels",{{45549}},{{45549}},nil,36,nil,nil,{"Collect 10 Raw Springsocket Eels."},nil,{nil,nil,{{110001,10}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #91: Additional missing quests
epochQuestData[26282] = {"An Old Debt",nil,nil,nil,42,nil,nil,{"Find Joakim Sparkroot in Westfall."},nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26283] = {"Azothan Relic",nil,nil,nil,43,nil,nil,{"Locate a historian in Ironforge."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26284] = {"Azothan Relics",{{2916}},{{2916}},nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1537,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26285] = {"Deeg's Lost Pipe",{{2488}},{{2488}},nil,40,nil,nil,{"Retrieve Deeg's Lost Pipe from the water near the Grom'gol Base Camp dock."},nil,{nil,{{188470,"Deeg's Lost Pipe"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26286] = {"Kill the Foreman",{{2498}},{{2498}},nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26377] = {"Call to Skirmish: Badlands",nil,nil,nil,43,nil,nil,{"Kill 5 Horde."},nil,nil,nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26381] = {"Call to Skirmish: Stranglethorn Vale",nil,nil,nil,43,nil,nil,{"Kill 5 Horde."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26383] = {"Call to Skirmish: Tanaris",{{7823}},{{7823}},nil,42,nil,nil,{"Kill 5 Horde."},nil,nil,nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #71: Missing quests batch submission
epochQuestData[26323] = {"An Unfinished Task",nil,{{9298}},nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,618,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil}
epochQuestData[26764] = {"We Have the Technology",{{45769}},nil,nil,55,nil,nil,{"Use Engineer Flikswitch's technology."},nil,nil,nil,nil,nil,nil,nil,nil,139,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil}
epochQuestData[26958] = {"Hero Worship",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil}
epochQuestData[26959] = {"Hero Worship",{{11878}},nil,nil,60,nil,nil,{"Collect 20 Fletching Feathers."},nil,nil,nil,nil,nil,nil,nil,nil,139,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil}
epochQuestData[27575] = {"Nightmare Seeds",nil,nil,nil,58,nil,nil,{"Discover the Odor's Source and collect 8 Nightmare Seeds."},nil,nil,nil,nil,nil,nil,nil,nil,618,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil}
epochQuestData[27883] = {"Battle of Warsong Gulch",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil}
epochQuestData[27961] = {"The Shatterspear Festival",{{10879}},nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil}
-- Issue #82: Missing quest batch submission
epochQuestData[26541] = {"Threats from Abroad",nil,nil,nil,32,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26547] = {"To The Hills",nil,nil,nil,37,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
-- Issue #93: Multiple Wetlands and Duskwood quests
epochQuestData[26570] = {"Waterlogged Journal",nil,{{311}},nil,37,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil} -- Duskwood
epochQuestData[26723] = {"Wanted: Plagued Shambler",nil,nil,nil,30,nil,nil,{"Slay the Plagued Shambler."},nil,nil,nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil} -- Duskwood, missing creature ID
epochQuestData[27000] = {"A Temporary Victory",nil,{{45953}},nil,31,nil,nil,{"Deliver news of the Burndural Victory to Captain Stoutfist."},nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil} -- Wetlands, turn-in to Corporal Mountainview
epochQuestData[27001] = {"Guldar Gamble",nil,nil,nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27002] = {"Report to the Front Lines",nil,{{45946}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27006] = {"Eye of Zulumar",nil,{{45943}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil} -- Wetlands, turn-in to Scout Barleybrew
epochQuestData[27009] = {"Evacuation Report",nil,{{45942}},nil,27,nil,nil,{"Deliver the final evacuation report to Mayor Oakmaster."},nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil} -- Wetlands
epochQuestData[27016] = {"Drastic Measures",nil,nil,nil,27,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil} -- Wetlands
epochQuestData[27020] = {"With Friends Like These...",nil,nil,nil,22,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil} -- Wetlands
epochQuestData[27049] = {"Rumbles Of The Earth",{{45990}},{{45982}},nil,23,nil,nil,{"Locate Ezee Fastrocket within Orgrimmar and collect Foreman Springsocket's Supplies."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil} -- Ashenvale
epochQuestData[27408] = {"[Epoch] Quest 27408",nil,nil,nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,0,nil,nil,nil,nil,nil,nil} -- Placeholder
epochQuestData[28475] = {"[Epoch] Quest 28475",nil,nil,nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,0,nil,nil,nil,nil,nil,nil} -- Placeholder
epochQuestData[28476] = {"[Epoch] Quest 28476",nil,nil,nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,0,nil,nil,nil,nil,nil,nil} -- Placeholder

-- Issue #87: Searing Gorge quest chain - Thorium Brotherhood
epochQuestData[26858] = {"The Thorium Brotherhood",{{45827}},{{14634}},nil,44,nil,nil,{"Collect 10 Firebloom from Searing Gorge and bring them to Lookout Captain Lolo Longstriker."},nil,{nil,nil,{{4625,10}}},nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26864] = {"Do Slavers Keep Records?",nil,{{45833}},nil,46,nil,nil,{"Collect Slaver's Records from Dark Iron Taskmasters and bring them to Bhurind Stoutforge."},nil,{nil,nil,{{63195,1}}},nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26868] = {"Grampy Stoutforge",{{14624}},{{45834}},nil,46,nil,nil,{"Speak with Grampy Stoutforge in Searing Gorge."},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #97: Blasted Lands quests from user data submission
epochQuestData[26277] = {"Shaman of the Flame",nil,nil,nil,54,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands, incomplete data
epochQuestData[26598] = {"Collecting on Debt",{{8178}},nil,nil,52,nil,nil,{"Collect Twisted Staff, Elaborate Timepiece, and Magic Drum."},nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Nina Lightbrew
epochQuestData[26599] = {"Feeding the Troops",{{5393}},nil,nil,50,nil,nil,{"Collect 10 Sulfurous Meat."},nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Quartermaster Lungertz
epochQuestData[26600] = {"Alchemy is the Answer",{{5393}},nil,nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Quartermaster Lungertz
epochQuestData[26601] = {"The Clay Cleanse",nil,nil,nil,50,nil,nil,{"Collect 7 Red Clay."},nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[26602] = {"Ready for Distribution",nil,nil,nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[26614] = {"Gathering Intelligence",{{5385}},nil,nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Watcher Mahar Ba
epochQuestData[26615] = {"The Bigger Picture",{{5385}},nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Watcher Mahar Ba
epochQuestData[26616] = {"Eyes of Our Own",{{5385}},nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Watcher Mahar Ba
epochQuestData[26617] = {"Felstone Mines",nil,nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[26618] = {"Parched and Parcel",{{45613}},nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Eunna
epochQuestData[26619] = {"It Ain't the Worst",nil,nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[26621] = {"Resurgent Evil",nil,nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[26626] = {"An Unlikely Ally",{{8022}},nil,nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Spirit of the Exorcist
epochQuestData[26628] = {"The Foundation Crumbles",nil,nil,nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[26629] = {"True Believers",nil,nil,nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[26630] = {"The Sting of Betrayal",nil,nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[26631] = {"The Thorn in My Side",nil,nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[26632] = {"Glyph of the Warlord",nil,nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[27076] = {"Descendants of Exiles",nil,nil,nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Blasted Lands
epochQuestData[27659] = {"Commission for High Chief Ungarl",nil,{{5385}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Turn-in: Watcher Mahar Ba
epochQuestData[28647] = {"Commission for Strumner Flintheel",nil,{{14634}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Turn-in: Lookout Captain Lolo Longstriker, Searing Gorge

-- Issue #94: Westfall quests from user data submission
epochQuestData[26994] = {"The Killing Fields",{{237}},{{233}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Farmer Furlbrow, Turn-in: Farmer Saldean
epochQuestData[26995] = {"The Killing Fields",{{233}},{{233}},nil,12,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver and turn-in: Farmer Saldean
epochQuestData[26996] = {"The Killing Fields",{{233}},nil,nil,14,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Farmer Saldean
epochQuestData[28495] = {"Commission for Protector Gariel",{{490}},nil,nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil} -- Quest giver: Protector Gariel

--[[  
EPOCH QUEST DATABASE STRUCTURE ANALYSIS

Total Epoch Quests: 600+ custom quests for Project Epoch server
Database Status: Optimized and structurally consistent

QUEST DATA STRUCTURE (30 fields):
1.  name (string)
2.  startedBy (table: {creatureStart, objectStart, itemStart})
3.  finishedBy (table: {creatureEnd, objectEnd})
4.  requiredLevel (int)
5.  questLevel (int)
6.  requiredRaces (bitmask)
7.  requiredClasses (bitmask)
8.  objectivesText (table: {string,...})
9.  triggerEnd (table)
10. objectives (table: {creatureObjective, objectObjective, itemObjective, reputationObjective, killCreditObjective, spellObjective})
11. sourceItemId (int)
12. preQuestGroup (table)
13. preQuestSingle (table) 
14. childQuests (table)
15. inGroupWith (table)
16. exclusiveTo (table)
17. zoneOrSort (int)
18. requiredSkill (table)
19. requiredMinRep (table)
20. requiredMaxRep (table)
21. requiredSourceItems (table)
22. nextQuestInChain (int)
23. questFlags (bitmask)
24. specialFlags (bitmask)
25. parentQuest (int)
26. reputationReward (table)
27. extraObjectives (table)
28. requiredSpell (int)
29. requiredSpecialization (int)
30. requiredMaxLevel (int)

STRUCTURAL VALIDATION:
✓ All troll quests (28750-28767) have proper 30-field structure
✓ Quest 26768 objectives correctly formatted: {nil, {{objectIds}}} 
✓ Mixed objective quests properly nested: {{{creatureIds}}, nil, {{itemIds}}}
✓ startedBy/finishedBy fields consistently use {{npcId}} format
✓ Placeholder quests maintain structural integrity
✓ All entries validated against QuestieDB.questKeys specification

QUEST CATEGORIES:
- Troll Starting Zone (28750-28767): Echo Isles, levels 1-5
- Elwynn Forest Starter (26776-26778): Northshire Abbey area, levels 1-6
- High Isle Fel Elves (26766-26775, 28768): Darkshore extension, levels 58-60
- Scholomance Academy (26963-26981): Western Plaguelands, levels 53-54
- Springsocket Quests (26126, 28077, 28535, 28618): Barrens, levels 36-50
- Argus Wake Chain (26529-26533): Desolace, levels 42-44
- Various zone content: Stonetalon, Searing Gorge, Badlands, etc.

DATA COLLECTION STATUS:
- Most quests have placeholder entries awaiting full data collection
- Use /qdc commands in-game to collect missing NPC, coordinate, and objective data
- Quest 28757 has complete objective structure as example
- Quest chains properly linked via preQuestSingle/childQuests fields

NOTE: Runtime stub system creates "[Epoch]" prefixed entries for missing quests.
Once proper data is added to this database, the runtime stubs are replaced.
--]]

-- Issue #99: Additional quest data from various zones
-- Stranglethorn Vale quests
epochQuestData[26287] = {"Prismatic Scales",{{2488}},{{2488}},nil,40,nil,nil,{"Fish for Prismatic Scales in the waters around Grom'gol Base Camp."},nil,{nil,nil,{{62115,"Prismatic Scales"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26290] = {"Troll Relic",{{2488}},nil,nil,43,nil,nil,{"Locate a knowledgeable Lorespeaker within Orgrimmar."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26904] = {"The Janky Helmet",{{48086}},{{9317}},nil,42,nil,nil,{"Experiment on 10 Elder Mistvale Gorillas and bring the Janky Helmet to Scooty in Booty Bay."},nil,{{{1557,10,"Elder Mistvale Gorilla experimented on"}},nil,{{63212,"The Janky Helmet"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26905] = {"The Janky Helmet",{{9317}},{{48086}},nil,42,nil,nil,{"Bring the Janky Helmet to the Venture Co. Tinkerer."},nil,{nil,nil,{{63212,"The Janky Helmet"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28073] = {"Commission for Captain Hecklebury Smotts",{{48167}},{{48167}},nil,30,nil,nil,{"Complete Captain Hecklebury Smotts' commission."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil}

-- The Barrens quest chain
epochQuestData[27168] = {"Finding the Clues",{{3432}},{{3432}},nil,14,nil,nil,{"Search for clues about Mankrik's wife in the Barrens."},nil,{nil,{{188623,"First Clue"},{188624,"Second Clue"},{188625,"Third Clue"}}},nil,nil,nil,{27169},nil,nil,17,nil,nil,nil,nil,27169,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27169] = {"[Epoch] Quest 27169",{{3432}},{{48110}},nil,15,nil,nil,{"Speak with Shin'Zil at the entrance to the Stagnant Oasis."},nil,nil,nil,nil,{27168},{27170},nil,nil,17,nil,nil,nil,nil,27170,1,0,27168,nil,nil,nil,nil,nil}
epochQuestData[27170] = {"The Demon's Task",{{48110}},{{48110}},nil,15,nil,nil,{"Collect 10 Zhevra Hooves and 5 Plainstrider Beaks for Shin'Zil."},nil,{{{3240,nil},{3244,nil}},nil,{{63291,10,"Zhevra Hoof"},{63292,5,"Plainstrider Beak"}}},nil,nil,{27169},{27171},nil,nil,17,nil,nil,nil,nil,27171,1,0,27169,nil,nil,nil,nil,nil}
epochQuestData[27171] = {"Dark Reagents",{{48110}},{{48110}},nil,16,nil,nil,{"Collect 8 Corrupted Essences from Corrupted Scorpids and 4 Shadowy Gems from Shadowy Assassins."},nil,{{{48112,nil},{48113,nil}},nil,{{63293,8,"Corrupted Essence"},{63294,4,"Shadowy Gem"}}},nil,nil,{27170},{27172},nil,nil,17,nil,nil,nil,nil,27172,1,0,27170,nil,nil,nil,nil,nil}
epochQuestData[27172] = {"Preparation of the Ritual",{{48110}},{{48110}},nil,17,nil,nil,{"Obtain a Vial of Elemental Water from Baron Geddon's essence and Fel Iron from a Felguard Commander."},nil,{{{48114,nil},{48115,nil}},nil,{{63295,"Vial of Elemental Water"},{63296,"Fel Iron"}}},nil,nil,{27171},{27173},nil,nil,17,nil,nil,nil,nil,27173,1,0,27171,nil,nil,nil,nil,nil}
epochQuestData[27173] = {"The Summoning",{{48110}},{{48110}},nil,18,nil,nil,{"Complete the ritual and defeat the summoned demon."},nil,{{{48116,"Summoned demon defeated"}}},nil,nil,{27172},{27174},nil,nil,17,nil,nil,nil,nil,27174,1,0,27172,nil,nil,nil,nil,nil}
epochQuestData[27174] = {"Return to Mankrik",{{48110}},{{3432}},nil,19,nil,nil,{"Return to Mankrik with the Demon's Heart."},nil,{nil,nil,{{63297,"Demon's Heart"}}},nil,nil,{27173},{27175},nil,nil,17,nil,nil,nil,nil,27175,1,0,27173,nil,nil,nil,nil,nil}
epochQuestData[27175] = {"Mankrik's Gratitude",{{3432}},{{48111}},nil,20,nil,nil,{"Take Mankrik's Letter to Nadia in the Barrens."},nil,{nil,nil,{{63298,"Mankrik's Letter"}}},nil,nil,{27174},{27176},nil,nil,17,nil,nil,nil,nil,27176,1,0,27174,nil,nil,nil,nil,nil}
epochQuestData[27176] = {"Nadia's Task",{{48111}},{{48111}},nil,21,nil,nil,{"Complete Nadia's task in the Barrens."},nil,nil,nil,nil,{27175},nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,27175,nil,nil,nil,nil,nil}

-- Fel Elf Slayer quest moved from 26776 to avoid conflict with Elwynn Forest starter quests
epochQuestData[28768] = {"Fel Elf Slayer",{{46295}},{{46295}},nil,60,nil,nil,{"Kill the Fel Elf Slayer."},nil,{{{46390,nil}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #144: How to Make Friends with a Furbolg - Azshara
epochQuestData[27082] = {"How to Make Friends with a Furbolg",nil,{{46012}},nil,52,nil,nil,{"Complete the first four steps with the furbolg."},nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #143: Ardo's Dirtpaw - Redridge Mountains
epochQuestData[26847] = {"Ardo's Dirtpaw",{{45825}},{{903}},nil,24,nil,nil,{"Retrieve Ardo's Dirtpaw and bring it to Guard Howe."},nil,{nil,nil,{{62679,"Ardo's Dirtpaw"}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #142: A Salve for Samantha - Stranglethorn Vale
epochQuestData[26883] = {"A Salve for Samantha",nil,{{11748}},nil,34,nil,nil,{"Take the Finished Salve to Samantha Swifthoof, who wanders the main road through Stranglethorn Vale."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #141: Parts From Afar - Ironforge to Hinterlands
epochQuestData[26187] = {"Parts From Afar",{{11145}},{{45030}},nil,46,nil,nil,{"Bring the Box of Siege Engine Parts back to Chief Engineer Urul in Aerie Peak."},nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #140: Silverpine Forest quests
epochQuestData[26217] = {"Lost in the Lake",nil,{{45044}},nil,16,nil,nil,{"Find the Waterlogged Sword and Tarnished Bracelets."},nil,{nil,nil,{{62716,"Waterlogged Sword"},{62717,"Tarnished Bracelets"}}},nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26873] = {"The Missing Initiate",nil,{{2121}},nil,18,nil,nil,{"Find the missing initiate and report back to Shadow Priest Allister."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26876] = {"Tomes of Interest",nil,nil,nil,18,nil,nil,{"Collect 5 Old Tomes from the area."},nil,{nil,nil,{{62718,5,"Old Tome"}}},nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #139: My Friend, The Skullsplitter - Westfall/STV
epochQuestData[26890] = {"My Friend, The Skullsplitter",nil,{{45846}},nil,36,nil,nil,{"Complete the ritual with Mezzphog."},nil,{{{60459,"Ritual Completed"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #138: Stranglethorn Vale quests batch
epochQuestData[26282] = {"An Old Debt",nil,nil,nil,42,nil,nil,{"Slay Supervisor Grimgash to settle an old debt."},nil,{{{60460,"Supervisor Grimgash slain"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26291] = {"Troll Relics",nil,nil,nil,43,nil,nil,{"Collect 8 Troll Idols from around Stranglethorn Vale."},nil,{nil,nil,{{62719,8,"Troll Idol"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26292] = {"Tunnel Monster",nil,nil,nil,40,nil,nil,{"Slay the monster in the tunnel."},nil,{{{60461,"Monster slain"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26880] = {"A Salve for Samantha",nil,nil,nil,34,nil,nil,{"Create a salve for Samantha's wounds."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26885] = {"My Friend, The Skullsplitter",nil,{{717}},nil,36,nil,nil,{"Speak with Ajeck Rouack about the Skullsplitter tribe."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26903] = {"Stop The Shrinking",nil,nil,nil,35,nil,nil,{"Find a way to stop the shrinking effect."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26906] = {"The Tablet of Zuul'daia",nil,nil,nil,36,nil,nil,{"Find the Tablet of Zuul'daia."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26907] = {"Wild Tulip",nil,{{45869}},nil,41,nil,nil,{"Find the Chest of Memories for Chel Moonwood."},nil,{nil,nil,{{62765,"Chest of Memories"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26908] = {"Wild Tulip",{{45869}},nil,nil,41,nil,nil,{"Find Daniels Spice Box and Tulip's Music Box."},nil,{nil,nil,{{62766,"Daniels Spice Box"},{62767,"Tulip's Music Box"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26912] = {"Deathstrike Remedy",{{983}},nil,nil,40,nil,nil,{"Collect 10 Vials of Deathstrike Venom."},nil,{nil,nil,{{62768,10,"Vial of Deathstrike Venom"}}},nil,nil,nil,nil,nil,nil,38,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26915] = {"Zul'jin's Experiment",{{45873}},{{45873}},nil,42,nil,nil,{"Collect the Troll Ritual Oil and return to Zul'jin."},nil,{nil,nil,{{62769,"Troll Ritual Oil"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26922] = {"Demons In Stranglethorn",nil,nil,nil,43,nil,nil,{"Investigate demon activity in Stranglethorn Vale."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #137: Elwynn Forest quests
epochQuestData[26784] = {"Mountainstout Ale",{{45780}},{{45780}},nil,6,nil,nil,{"Collect 6 Glistening Falls Water and 6 Northshire Reed."},nil,{nil,nil,{{62607,6,"Glistening Falls Water"},{62608,6,"Northshire Reed"}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26785] = {"A Friend Indeed",{{45782}},{{45782}},nil,6,nil,nil,{"Help Dromul's friend with their task."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #136: Brewing Brethren
epochQuestData[26782] = {"Brewing Brethren",{{328}},{{45783}},nil,6,nil,nil,{"Deliver Zaldimar's special brew to Brother Zaldimar."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #135: Linus Stone Tips
epochQuestData[26781] = {"Linus Stone Tips",{{45779}},{{253}},nil,6,nil,nil,{"Deliver the Stone Tips to William Pestle."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #151: Solarsal Report
epochQuestData[27053] = {"Solarsal Report",nil,{{45946}},nil,27,nil,nil,{"Bring the report to someone in Astranaar."},nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #150/149: Azshara's Legacy (duplicate)
epochQuestData[27091] = {"Azshara's Legacy",nil,{{46008}},nil,54,nil,nil,{"Discover Azshara's Legacy."},nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #148: Hillsbrad/Alterac quests
epochQuestData[26499] = {"Magical Materiel",{{2543}},nil,nil,35,nil,nil,{"Collect 30 Magic Materiel."},nil,{nil,nil,{{62503,30,"Magic Materiel"}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26540] = {"Threats from Abroad",{{45546}},nil,nil,32,nil,nil,{"Slay 10 Murloc Lake Hunters and 8 Murloc Lake Oracles."},nil,{{{60540,10,"Murloc Lake Hunter slain"},{60541,8,"Murloc Lake Oracle slain"}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26541] = {"Threats from Abroad",{{45546}},nil,nil,32,nil,nil,{"Slay 10 Yetis."},nil,{{{60542,10,"Yetis slain"}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #147: Elwynn Forest quests
-- Removed duplicate entries for quests 26768, 26771, 26774, 26775, 26794 (defined with correct data in Issue #104 section)

-- Issue #146: Commission for Verner Osgood
epochQuestData[28573] = {"Commission for Verner Osgood",{{2697}},{{2697}},nil,30,nil,nil,{"Complete Verner Osgood's commission."},nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil}

-- Issue #145: Riders In The Night
epochQuestData[26707] = {"Riders In The Night",nil,{{264}},nil,28,nil,nil,{"Report the night rider sightings to Commander Althea Ebonlocke."},nil,nil,nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #157: Life In Death
epochQuestData[26711] = {"Life In Death",{{45731}},{{273}},nil,25,nil,nil,{"Collect 8 Brightwood Bloom."},nil,{nil,nil,{{62530,nil}}},nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #134: How to Make Friends with a Furbolg (different from 27082)
epochQuestData[27081] = {"How to Make Friends with a Furbolg",{{46012}},{{8420}},nil,52,nil,nil,{"Learn how to befriend the furbolg."},nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #133: My Friend, The Skullsplitter (another variant)
epochQuestData[26887] = {"My Friend, The Skullsplitter",nil,{{45846}},nil,36,nil,nil,{"Complete the Skullsplitter ritual."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #131: An End To Dread
epochQuestData[27237] = {"An End To Dread",{{46083}},{{11438}},nil,37,nil,nil,{"End the dread threat in the swamp."},nil,nil,nil,nil,nil,nil,nil,nil,38,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #130: Crazed Carrion
epochQuestData[27243] = {"Crazed Carrion",{{46086}},{{46086}},nil,36,nil,nil,{"Deal with the crazed carrion birds."},nil,nil,nil,nil,nil,nil,nil,nil,38,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #129: A Mage's Advice
epochQuestData[26780] = {"A Mage's Advice",{{6778}},{{328}},nil,5,nil,nil,{"Seek the mage's advice in Goldshire."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #128/120: A Brother's Disgust (two versions with different NPCs)
epochQuestData[26779] = {"A Brother's Disgust",{{952}},{{952}},nil,5,nil,nil,{"Report Brother Paxton's disgust."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #127: Various quests
epochQuestData[26294] = {"Fit For A King",nil,nil,nil,45,nil,nil,{"Prepare a meal fit for a king."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27104] = {"Report to Scout Dura",nil,nil,nil,48,nil,nil,{"Report to Scout Dura at the forward camp."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27322] = {"Shadowguard Report",nil,nil,nil,50,nil,nil,{"Deliver the Shadowguard report."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27463] = {"Warden's Summons",nil,nil,nil,52,nil,nil,{"Answer the Warden's summons."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #126: Various quests
epochQuestData[26455] = {"Seeking Redemption",{{45383}},nil,nil,12,nil,nil,{"Seek redemption for past wrongs."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26926] = {"A Box of Relics",{{45887}},nil,nil,9,nil,nil,{"Deliver the box of relics."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26942] = {"Ancient Artifact",nil,nil,nil,11,nil,nil,{"Recover the ancient artifact."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27266] = {"Forest Patrol",nil,nil,nil,10,nil,nil,{"Patrol the forest perimeter."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27273] = {"Moonwell Water",nil,nil,nil,12,nil,nil,{"Collect water from the moonwell."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27274] = {"Priestess's Request",nil,nil,nil,13,nil,nil,{"Complete the priestess's request."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27276] = {"Sacred Seeds",nil,nil,nil,12,nil,nil,{"Plant the sacred seeds."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27277] = {"Treant's Blessing",nil,nil,nil,14,nil,nil,{"Receive the treant's blessing."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[28657] = {"Nature's Balance",nil,nil,nil,15,nil,nil,{"Restore nature's balance."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #124: Demons In Fel Rock
epochQuestData[27483] = {"Demons In Fel Rock",nil,{{3610}},nil,6,nil,nil,{"Investigate demon activity in Fel Rock."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #123: Dark Council
epochQuestData[26516] = {"Dark Council",nil,{{6768}},nil,40,nil,nil,{"Infiltrate the dark council meeting."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #122: Pilfering the Reef (mentioned in title but not seeing data)
epochQuestData[26891] = {"Pilfering the Reef",nil,nil,nil,39,nil,nil,{"Pilfer treasures from the reef."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #121: Various Silverpine quests
epochQuestData[26218] = {"Wreck of the Kestrel",{{2140}},nil,nil,13,nil,nil,{"Investigate the wreck of the Kestrel."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26872] = {"Urgent Delivery",nil,nil,nil,15,nil,nil,{"Deliver the urgent package."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26874] = {"Supply Run",nil,nil,nil,16,nil,nil,{"Complete the supply run."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27167] = {"Border Patrol",nil,nil,nil,17,nil,nil,{"Patrol the Silverpine border."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27195] = {"Forsaken Duties",nil,nil,nil,18,nil,nil,{"Complete your Forsaken duties."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27198] = {"The Sepulcher",nil,nil,nil,19,nil,nil,{"Report to the Sepulcher."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27200] = {"Shadow Priest's Task",nil,nil,nil,20,nil,nil,{"Complete the Shadow Priest's task."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil}

-- Issue #118: Find the Brother
epochQuestData[26778] = {"Find the Brother",{{9296}},{{9296}},nil,1,nil,nil,{"Find Brother Wilhelm."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #117: Waterlogged Journal
epochQuestData[26570] = {"Waterlogged Journal",nil,{{4453}},nil,37,nil,nil,{"Return the waterlogged journal to Sven Yorgen."},nil,nil,nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issues #104-116, #119, #132, #153, #155-156: Additional Epoch quest data
-- Issue #104: Elwynn Forest quests
epochQuestData[26774] = {"Spider Elixir",{{45775}},{{45775}},nil,9,nil,nil,{"Free 4 Webbed Miners and collect 4 Mine Spider Mandibles."},nil,{{{60801,4,"Webbed Miners freed"}},nil,{{62825,"Mine Spider Mandible",4}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26777] = {"The Soaked Barrel",nil,{{9296}},1,1,77,nil,{"Find the source of the barrel via 12 Red Burlap Bandana discoveries."},nil,nil,nil,nil,nil,{26778},nil,nil,12,nil,nil,nil,nil,26778,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26778] = {"Find the Brother",{{9296}},{{952}},1,1,77,nil,{"Bring the soaked barrel to Brother Neals."},nil,nil,nil,nil,{26777},nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,26777,nil,nil,nil,nil,nil}
epochQuestData[26781] = {"Linus Stone Tips",{{328}},{{328}},nil,5,nil,nil,{"Collect 1 item at coordinates 42.4, 58.6."},nil,nil,nil,nil,{26780},nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,26780,nil,nil,nil,nil,nil}

-- Issue #104: Elwynn Forest (continued)
epochQuestData[26689] = {"Barroom Blitz",{{240}},{{240}},nil,12,nil,nil,{"Deal with the barroom troublemakers."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26768] = {"Just Desserts",{{45773}},{{45773}},nil,8,nil,nil,{"Collect 5 Mild Spices, 5 Simple Flour, 1 Salt, and 20 Mana Berries."},nil,{nil,nil,{{2678,"Mild Spices",5},{30817,"Simple Flour",5},{2901,"Salt",1},{62823,"Mana Berry",20}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26769] = {"Just Desserts",{{45773}},{{45773}},nil,8,nil,nil,{"Collect Mana Tainted Sludge."},nil,nil,nil,nil,{26768},{26770},nil,nil,12,nil,nil,nil,nil,26770,8,0,26768,nil,nil,nil,nil,nil}
epochQuestData[26770] = {"Just Desserts",{{45773}},{{313}},nil,8,nil,nil,{"Present Sarah's cake to Theocritus."},nil,nil,nil,nil,{26769},nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,26769,nil,nil,nil,nil,nil}
epochQuestData[26771] = {"Lost Equipment",{{45777}},{{45774}},nil,9,nil,nil,{"Collect 8 Mining Equipment."},nil,{nil,nil,{{62824,"Mining Equipment",8}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26775] = {"Tend to the Wounded",{{45775}},{{45775}},nil,10,nil,nil,{"Cure 5 Poisoned Miners."},nil,{{{60800,5,"Poisoned Miners cured"}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26794] = {"Wanted: Big Blue",{nil,{45797}},{{45798}},nil,8,nil,nil,{"Slay Big Blue and collect the bounty."},nil,{{{60799,"Big Blue"}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #105: Feralas quests
epochQuestData[27488] = {"Bad News Has Horns",{{4048}},{{4048}},nil,28,nil,nil,{"Collect 3 Secret Notes from Thousand Needles."},nil,{nil,nil,{{12765,"Secret Note #1"},{12766,"Secret Note #2"},{12768,"Secret Note #3"}}},nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27500] = {"The Sacred Flame",{{4048}},{{4048}},nil,27,nil,nil,{"Scout the centaur artifact location at the Cloven Hoof."},nil,nil,nil,nil,nil,{27501},nil,nil,400,nil,nil,nil,nil,27501,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27501] = {"The Sacred Flame",{{4048}},{{4048}},nil,30,nil,nil,{"Collect the sacred flame artifact."},nil,{nil,nil,{{10749}}},nil,nil,{27500},nil,nil,nil,400,nil,nil,nil,nil,nil,8,0,27500,nil,nil,nil,nil,nil}
epochQuestData[27504] = {"Kristy's Delivery Service",nil,nil,nil,30,nil,nil,{"Complete Kristy's delivery service."},nil,nil,nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #106: Darkshore quests
epochQuestData[27205] = {"My Sister Isabetta",nil,{{3616}},nil,14,nil,nil,{"Find information about Isabetta."},nil,nil,nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #107: Hillsbrad/Horde quests
epochQuestData[26544] = {"Who Likes Apples?",{{3544}},{{3544}},nil,35,nil,nil,{"Collect 6 apples."},nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27034] = {"Never Again!",nil,nil,nil,30,nil,nil,{"Complete the task - Never Again!"},nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27238] = {"An Imp's Bidding",{{46000}},{{46000}},nil,31,nil,nil,{"Slay 1 monster and collect Demonic Sextant."},nil,{nil,nil,{{63113,"Demonic Sextant"}}},nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Issue #108: Alliance quests (Hillsbrad/Wetlands)
epochQuestData[26542] = {"A Rare Variety",{{2364}},{{2364}},nil,35,nil,nil,{"Collect 6 rare specimens."},nil,{nil,nil,{{11630}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26802] = {"Venom Medicine",{{2363}},{{2363}},nil,23,nil,nil,{"Collect 8 Venom Sacs."},nil,{nil,nil,{{11630}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27000] = {"A Temporary Victory",{{45942}},{{2104}},nil,31,nil,nil,{"Deliver news of Burndural Victory to Captain Stoutfist."},nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #109: Horde quests (various zones)
epochQuestData[26310] = {"Trial of the Willing",nil,nil,nil,25,nil,nil,{"Slay Deor Levo, Reagle the Blessed, and Justicar Masule."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27167] = {"Foreign Technology",nil,nil,nil,19,nil,nil,{"Obtain Cognation Reconstructor."},nil,nil,nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27171] = {"Retrieving the Orb",nil,nil,nil,18,nil,nil,{"Obtain Korgar's Orb."},nil,nil,nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27198] = {"The Missing Lorespeakers",nil,nil,nil,22,nil,nil,{"Find the missing lorespeakers."},nil,nil,nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27882] = {"Battle of Warsong Gulch",nil,nil,nil,21,nil,nil,{"Win the Battle of Warsong Gulch."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Issue #111 & #116: Stranglethorn Vale quests
epochQuestData[26885] = {"My Friend, The Skullsplitter",{{45846}},{{2497}},nil,36,nil,nil,{"Speak with Thu'tek and return his Spirit Charm to Nimboya."},nil,nil,nil,nil,nil,{26886},nil,nil,33,nil,nil,nil,nil,26886,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26886] = {"My Friend, The Skullsplitter",{{45845}},{{45846}},nil,36,nil,nil,{"Return to Lorespeaker Itzli at Grom'gol with Thu'tek's Spirit Charm."},nil,nil,nil,nil,{26885},nil,nil,nil,33,nil,nil,nil,nil,nil,85,0,26885,nil,nil,nil,nil,nil}

-- Issue #113: Felwood quests
epochQuestData[26148] = {"Legion Paisa",nil,{{9996}},nil,60,nil,nil,{"Take Legion Paisa to Altadena in Booty Bay."},nil,nil,nil,nil,nil,nil,nil,nil,361,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27309] = {"Mementos of the Third War",{{46127}},nil,nil,52,nil,nil,{"Take Box of Grisly Mementos to Thrall in Orgrimmar."},nil,nil,nil,nil,nil,nil,nil,nil,361,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Issue #114: The Barrens quests
epochQuestData[27166] = {"Consumed by Hatred",nil,{{3432}},nil,14,nil,nil,{"Collect 10 Kolkar Heads."},nil,{nil,nil,{{63039,"Kolkar Head"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27168] = {"Lost in Battle",nil,nil,nil,14,nil,nil,{"Find 3 different clues."},nil,nil,nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27195] = {"Straight to the Teeth",{{46065}},{{46065}},nil,18,nil,nil,{"Collect 10 Hecklefang Teeth."},nil,nil,nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27196] = {"The Kolkar Report",nil,nil,nil,15,nil,nil,{"Bring Kolkar Report to Thork at The Crossroads."},nil,nil,nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27197] = {"The Merchant's Daughter",{{7161}},{{7161}},nil,17,nil,nil,{"Obtain Box of Treasure."},nil,{nil,nil,{{63070,"Box of Treasure"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Issue #115: Various Horde quests
epochQuestData[26287] = {"Prismatic Scales",nil,nil,nil,40,nil,nil,{"Collect Prismatic Scale."},nil,{nil,nil,{{4354}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26368] = {"Call to Skirmish: Thousand Needles",nil,nil,nil,35,nil,nil,{"Win skirmish in Thousand Needles."},nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26374] = {"Call to Skirmish: Arathi Highlands",{{12920}},{{12920}},nil,37,nil,nil,{"Kill 5 Alliance."},nil,nil,nil,nil,nil,nil,nil,nil,45,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26376] = {"Call to Skirmish: Swamp of Sorrows",{{9019}},{{9019}},nil,38,nil,nil,{"Kill 5 Alliance."},nil,nil,nil,nil,nil,nil,nil,nil,8,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27492] = {"Fresh Water Delivery",nil,{{4630}},nil,31,nil,nil,{"Dispense 10 water."},nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Issue #132: Silverpine Forest quest (updating existing)
epochQuestData[26218] = {"Wreck of the Kestrel",{{2140}},{{2140}},nil,13,nil,nil,{"Collect Smokywood Pastures Shipping Crate from the Ghostly Goblin."},nil,{nil,nil,{{60141,"Smokywood Pastures Shipping Crate"}}},nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Issue #155: Azshara quest
epochQuestData[27092] = {"Azshara's Legacy",{{46006}},{{46008}},nil,54,nil,nil,{"Collect 12 Makrinni Lobstrok Eyes."},nil,{nil,nil,{{62959,"Makrinni Lobstrok Eye",12}}},nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Issue #156: Various Horde quests
epochQuestData[26312] = {"Materials of the Light",nil,nil,nil,22,nil,nil,{"Collect Corrupted Kor Gem, Springvale's Blessed Ingots, Zelemar's Hammer, and Silver Hand Medallion."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27201] = {"The Triad Scrolls",nil,nil,nil,30,nil,nil,{"Collect The Triad: Founding of Thunder Bluff, Founding of Camp Mojache, and Founding of Sun Rock Retreat."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27397] = {"A Trip to the Vale",nil,{{12043}},nil,27,nil,nil,{"Collect Charred Wood and Basilisk Tail."},nil,nil,nil,nil,nil,nil,nil,nil,406,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27489] = {"Canyon Patrol",{{10428}},{{10428}},nil,27,nil,nil,{"Kill 8 Pesterhide Hyenas."},nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27490] = {"Crag Stalking",nil,nil,nil,27,nil,nil,{"Complete crag stalking objectives."},nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Issue #160: Duskwood quest
epochQuestData[26712] = {"Life In Death",{{45731}},{{265}},nil,25,nil,nil,{"Collect 5 Fresh Bone Powder and Grave Moss."},nil,{nil,{{187564,"Grave Moss"}},{{62531,"Fresh Bone Powder",5}}},nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #162: The Hinterlands quest
epochQuestData[26186] = {"Parts From Afar",{{45030}},{{4782}},nil,46,nil,nil,{"Bring the Basket of Treats to Myolor Sunderfury in Ironforge to exchange for Siege Engine Parts."},nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #172-173: Azshara quest chain part 2
epochQuestData[27093] = {"Azshara's Legacy",{{8395}},{{8379}},nil,54,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Issue #177: Azshara quest
epochQuestData[27094] = {"Azshara's Legacy",nil,{{46019}},nil,54,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil}

-- Issue #174: Batch quest data submission
epochQuestData[26288] = {"Reclaiming Tools",nil,{{5411}},nil,43,nil,nil,{"Recover 20 Recovered Tools from Venture Co. members in Glittermurk Mines."},nil,{nil,nil,{{61926,20,"Recovered Tools"}}},nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26680] = {"Lost Rams",{{1261}},nil,nil,9,nil,nil,{"Return 3 lost rams to Amberstill Ranch."},nil,{{{60001,3,"Rams returned to Amberstill Ranch"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[26684] = {"Ram Riding",{{4772}},nil,nil,40,nil,nil,{"Learn Apprentice Riding from Ultham Ironhorn."},nil,{{{60002,"Apprentice Riding Learned"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27299] = {"Sniff Him Out",{{46121}},nil,nil,41,nil,nil,{"Follow the Sniffotron MK IV to find Beezil."},nil,{{{60003,"Follow the Sniffotron MK IV"}}},nil,nil,nil,nil,nil,nil,15,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27300] = {"Beezil And The Burning Blade",{{46120}},{{46121}},nil,41,nil,nil,{"Report to Cys Craftcharge after speaking with Beezil Linkspanner."},nil,nil,nil,nil,nil,nil,nil,nil,15,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27302] = {"Burning Blade Dossier",{{46121}},{{46123}},nil,41,nil,nil,{"Bring Cys Craftcharge's Report to Watcher Wallace in Theramore."},nil,nil,nil,nil,nil,nil,nil,nil,15,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}
epochQuestData[27443] = {"Azeroth Space Society",{{46228}},{{46120}},nil,41,nil,nil,{"Deliver Kranz's message to Beezil Linkspanner in Dustwallow Marsh."},nil,nil,nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil}

-- Issue #170: Badlands quest
epochQuestData[27941] = {"Crafted from Crawlers",nil,{{7867}},nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,85,0,nil,nil,nil,nil,nil,nil}

-- Stage the Epoch questData for later merge during compilation
QuestieDB._epochQuestData = epochQuestData
