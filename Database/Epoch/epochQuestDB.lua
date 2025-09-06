---@type QuestieDB
local QuestieDB = QuestieLoader:ImportModule("QuestieDB")

epochQuestData = {
[783] = {"A Threat Within",{{823}},{{197}},nil,1,nil,nil,{"Speak with Marshal McBride."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,7,8,0,nil,nil,nil,nil,nil,nil},
[1288] = {"Vimes's Report",{{4944}},{{4967}},nil,38,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,15,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[11160] = {"Banner of the Stonemaul",{{23579}},{{23579}},35,39,0,nil,{"Retrieve the Stonemaul Banner and bring it to Brogg at Brogg's Hollow."},nil,{nil,nil,{{33086}}},nil,nil,{11158},nil,nil,nil,15,nil,nil,nil,nil,nil,8},
[11161] = {"The Essence of Enmity",{{23579}},{{23579}},35,39,0,nil,{"Bring 10 Black Dragonkin Essences to Brogg at Brogg's Hollow."},nil,{nil,nil,{{33087}}},33088,nil,{11158},nil,nil,nil,15},
[9469] = {"Featherbeard's Endorsement",{{45019}},{{45030}},nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[9475] = {"Reclaiming the Eggs",nil,{{45019}},nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26126] = {"Springsocket Eels",{{45549}},{{45549}},nil,36,nil,nil,{"Collect 10 Raw Springsocket Eels."},nil,{nil,nil,{{110001,10}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26138] = {"Dark Iron Stater",nil,nil,nil,60,nil,2,{"Take Dark Iron Stater to Altadena in Booty Bay"},nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26139] = {"Defias Ducat",nil,nil,nil,60,nil,2,{"Take the Defias Ducat to Altadena in Booty Bay."},nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26143] = {"Kaldorei Lune",nil,nil,nil,60,nil,2,{"Take the Kaldorei Lune to Altadena in Booty Bay."},nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26148] = {"Legion Paisa",nil,{{9996}},nil,60,nil,nil,{"Take Legion Paisa to Altadena in Booty Bay."},nil,nil,nil,nil,nil,nil,nil,nil,361,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26153] = {"Dalaran Shilling",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26161] = {"Meatloaf's Task",{{45716}},{{45716}},nil,15,nil,nil,{"Kill 10 Redridge Gnoll, Kill 7 Redridge Brute, Kill 3 Redridge Shaman"},nil,nil,nil,nil,nil,nil,nil,nil,44,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26166] = {"A Fatal Error",{{382}},{{382}},nil,25,nil,nil,{"Kill Champion Mot, Kill Champion Wyrmak"},nil,nil,nil,nil,nil,nil,nil,nil,44,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26167] = {"Infiltrating the Black Rock",{{382}},{{382}},nil,25,nil,nil,{"Kill 6 Blackrock Champion, Kill 4 Blackrock Sorcerer, Kill 5 Blackrock Warden"},nil,nil,nil,nil,nil,nil,nil,nil,44,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26168] = {"Can't Make An Omelette Without...",{{11813}},{{4782}},nil,45,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26169] = {"Can't Make An Omelette Without...",{{14736}},{{14736}},nil,45,nil,nil,{"Collect 12 Shadraspawn Eggs."},nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26170] = {"Clear The Shore",{{14740}},{{14740}},nil,49,nil,1,{"Slay 10 Salty Shore Swimmers."},nil,{{{60527,10,"Salty Shore Swimmer"}}},nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26171] = {"A Just Reward",{{45732}},{{45731}},nil,32,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26174] = {"Southshore Sympathizers",{{2711}},{{2711}},nil,26,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26175] = {"Falling Up To Grace",{{47175}},{{47175}},nil,48,nil,2,{"Test the parachute."},nil,{{{60525,"Parachute Tested"}}},nil,nil,nil,{26176},nil,nil,47,nil,nil,nil,nil,26176,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26177] = {"Razorbeak Friends",nil,nil,nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26178] = {"Razorbeak Friends",nil,{{46700}},nil,46,nil,2,{"Feed 7 Trained Razorbeaks."},nil,{{{2657,7,"Feed Trained Razorbeak"}}},nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26179] = {"Hinterlands Hermit",{{45746}},{{45748}},nil,45,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26180] = {"Snapjaw Snacks",nil,nil,nil,45,nil,1,{"Collect 12 Royal Bite Reed, Collect 8 Grouper Steak"},nil,{nil,nil,{{63085,12,"Royal Bite Reed"},{63086,8,"Grouper Steak"}}},nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26181] = {"Brother Joseph's Aid",{{382}},{{45775}},nil,25,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,44,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26182] = {"Peril at the Farseer's Den",{{45774}},{{45774}},nil,28,nil,nil,{"Kill 7 Blackrock Mystic, Kill 7 Blackrock Sentry"},nil,nil,nil,nil,nil,nil,nil,nil,44,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26183] = {"A Friend In Need",{{773}},{{2670}},nil,34,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26184] = {"Proof of Demise",{{1422}},{{1422}},nil,36,nil,nil,{"Kill Kurzen forces and collect ears"},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26185] = {"Lard's Lost Beads",{{14731}},{{14731}},nil,50,nil,nil,{"Find Lard's Lost Beads."},nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26186] = {"Parts From Afar",{{45019}},{{11145}},nil,46,nil,2,{"Bring the Basket of Treats to Myolor Sunderfury in Ironforge to exchange for Siege Engine Parts."},nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26187] = {"Parts From Afar",{{11145}},{{48251}},nil,46,nil,nil,{"Bring the Box of Siege Engine Parts back to Chief Engineer Urul in Aerie Peak."},nil,nil,nil,nil,{26186},nil,nil,nil,47,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26188] = {"Beneath The Scarlet Grounds",{{4223}},{{4223}},nil,40,nil,nil,{"Explore underground areas and defeat cultists"},nil,nil,nil,nil,nil,nil,nil,nil,139,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26190] = {"Gloomleaf Powder",{{45777}},{{45777}},nil,51,nil,nil,{"Collect 8 Gloomleaf Powder from Diseased Wolves"},nil,nil,nil,nil,nil,nil,nil,nil,50,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26195] = {"Delivery for Deke Grindel",{{45784}},{{45785}},nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26196] = {"Turtle Power",{{4782}},{{4782}},nil,48,nil,2,{"Collect 10 Lean Turtle Flanks."},nil,{nil,nil,{{60550,10,"Lean Turtle Flank"}}},nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26199] = {"Horde Courier",nil,nil,nil,48,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26200] = {"Balancing the Forest",nil,{{2930}},nil,12,nil,2,{"Slay 5 Young Moonkin and 10 Moonkin."},nil,{{{2163,5,"Young Moonkin"},{2042,10,"Moonkin"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26201] = {"Balancing the Forest",nil,{{3650}},nil,14,nil,2,{"Moonkin Oracle slain: 3/3, Raging Moonkin slain: 10/10"},nil,{{{2164,3,"Moonkin Oracle"},{2165,10,"Raging Moonkin"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26202] = {"The Twilight's Hammer",{{3702}},nil,nil,17,nil,nil,{"Kill 8 Twilight Thugs and 8 Twilight Disciples."},nil,{{{2523,8,"Twilight Thug"},{2525,8,"Twilight Disciple"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26203] = {"Welcome to Auberdine",{{45035}},{{45036}},nil,11,nil,nil,{"Report to Quartermaster Nyana in Auberdine."},nil,nil,nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26204] = {"The Greymist Menace",nil,nil,nil,15,nil,2,{"Slay 6 Greymist Seer and 6 Greymist Coastrunner."},nil,{{{2203,6,"Greymist Seer"},{2202,6,"Greymist Coastrunner"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26205] = {"The Greymist Menace",nil,nil,nil,18,nil,2,{"Slay 6 Greymist Hunters and 6 Greymist Oracles."},nil,{{{60525,6,"Greymist Hunter"},{60526,6,"Greymist Oracle"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26208] = {"Wanted: Grizzletooth",nil,nil,nil,18,nil,nil,{"Kill Grizzletooth and bring his teeth to the bounty board."},nil,{{{14270,nil}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26209] = {"Wildhammer Bones",{{5159}},{{5159}},nil,50,nil,2,{"Collect 10 Wildhammer Bones."},nil,{nil,nil,{{60555,10,"Wildhammer Bones"}}},nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26210] = {"Job Opening: Guard Captain of Aerie Peak",{{5159}},{{5159}},nil,51,nil,2,{"Slay 20 Vilebranch Warriors, 20 Vilebranch Shadowcasters, 20 Vilebranch Hideskinners, and 20 Vilebranch Trolls."},nil,{{{2462,20,"Vilebranch Warrior"},{2464,20,"Vilebranch Shadowcaster"},{2643,20,"Vilebranch Hideskinner"},{4465,20,"Vilebranch Troll"}}},nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26217] = {"Lost in the Lake",{{45044}},{{1938}},nil,16,nil,nil,nil,nil,{nil,nil,{{60137,1},{60138,1}}},nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26218] = {"Wreck of the Kestrel",{{2140}},{{2140}},nil,13,nil,nil,{"Investigate the wreck of the Kestrel."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26243] = {"Blazing Gemstone",nil,nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26245] = {"Demonfire",{{45069}},nil,nil,54,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26266] = {"Dark Literature",nil,{{45093}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26273] = {"Falling Stars",nil,nil,nil,56,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26277] = {"Shaman of the Flame",nil,nil,nil,54,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26279] = {"The Gooder Stuff",nil,{{9177}},nil,57,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26281] = {"An Eternal Flame",nil,{{1719}},nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26282] = {"An Old Debt",nil,{{45206}},nil,42,nil,2,{"Slay Supervisor Grimgash."},nil,{{{60328,"Supervisor Grimgash"}}},nil,nil,nil,nil,nil,nil,15,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26283] = {"Azothan Relic",{{674}},{{46261}},nil,43,nil,2,{"Locate a knowledgeable Historian within Ironforge."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26284] = {"Azothan Relics",{{2916}},{{2916}},nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1537,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26285] = {"Deeg's Lost Pipe",{{2488}},{{2500}},nil,40,nil,2,{"Obtain Deeg's Lost Pipe."},nil,{{{45187,1,"Murklurk"}},nil,{{61920,1,"Deeg's Lost Pipe"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26286] = {"Kill the Foreman",{{2498}},{{2498}},nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26287] = {"Prismatic Scales",{{2488}},{{2488}},nil,40,nil,nil,{"Fish for Prismatic Scales in the waters around Grom'gol Base Camp."},nil,{nil,nil,{{62115,"Prismatic Scales"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26288] = {"Reclaiming Tools",nil,{{45787}},nil,43,nil,2,{"Collect 20 Recovered Tools."},nil,{nil,nil,{{13136,20,"Recovered Tools"}}},nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26289] = {"Renegade Naga",nil,{{674}},nil,42,nil,3,{"Slay 8 Tidewater Oracles.","Slay 8 Tidewater Warriors.","Slay Gnash."},nil,{{{4711,8,"Tidewater Oracle"},{4712,8,"Tidewater Warrior"},{4713,1,"Gnash"}}},nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
[26290] = {"Troll Relic",{{2488}},nil,nil,43,nil,nil,{"Locate a knowledgeable Lorespeaker within Orgrimmar."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26291] = {"Troll Relics",nil,{{45207}},nil,43,nil,nil,{"Collect 8 Troll Idols from around Stranglethorn Vale."},nil,{nil,nil,{{4426,8,"Troll Idol"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26292] = {"Tunnel Monster",nil,nil,nil,40,nil,nil,{"Slay the monster in the tunnel."},nil,{{{60461,"Monster slain"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26293] = {"Fit For A King",{{46704}},{{46704}},nil,45,nil,2,{"Collect 16 Walker Branches."},nil,{{{7584,16,"Walker Branch"}},nil,{{61936,16,"Walker Branch"}}},nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26294] = {"Fit For A King",nil,{{45211}},nil,45,nil,nil,{"Collect 8 Wetland Hemp."},nil,{[61937]={8,nil,{[357]={{50.6,46.2},{51.1,45},{78.6,48.2},{79.2,48.9},{73.7,48.5},{77.4,48.8},{77.5,43.8},{74.9,40.4}}}}},nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26295] = {"Fit For A King",{{45211}},{{45211}},nil,45,nil,1,{"Collect 20 Vial of Beast Blood"},nil,{nil,nil,{{63087,20,"Vial of Beast Blood"}}},nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26296] = {"Fit For A King",{{45211}},{{45211}},nil,45,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26297] = {"Fit For A King",nil,{{45211}},nil,47,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26298] = {"Fit For A King",{{45211}},{{45211}},nil,47,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26299] = {"Fit For A King",nil,{{45211}},nil,47,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26300] = {"Fit For A King",{{45211}},{{45211}},nil,47,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26302] = {"The Source Of Corruption",nil,{{45221}},nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26303] = {"Attunement to the Core",{{14387}},{{13278}},nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,25,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26304] = {"Attunement to the Core",{{13278}},nil,nil,60,nil,nil,{"Collect Firebloom, Elemental Fire, Elemental Water, and Wintersbite."},nil,{nil,nil,{{4625,1,"Firebloom"},{7068,1,"Elemental Fire"},{7070,1,"Elemental Water"},{3819,1,"Wintersbite"}}},nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26305] = {"Attunement to the Core",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,25,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26308] = {"Trial of the Willing",nil,{{11864}},nil,20,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,406,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26310] = {"Trial of the Willing",nil,nil,nil,25,nil,1,{"Slay Deor Levo, Reagle the Blessed, and Justicar Masule."},nil,{{{60562,1,"Deor Levo"},{60563,1,"Reagle the Blessed"},{60564,1,"Justicar Masule"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26311] = {"Materials of the Light",nil,{{7792}},nil,21,nil,1,{"Deliver the letter and payment to Aturk the Anvil in Orgrimmar."},nil,nil,nil,nil,nil,nil,nil,nil,1637,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26312] = {"Materials of the Light",nil,nil,nil,22,nil,nil,{"Collect Corrupted Kor Gem, Springvale's Blessed Ingots, Zelemar's Hammer, and Silver Hand Medallion."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26317] = {"Atal'ai Tablets",nil,{{45285}},nil,48,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26318] = {"Invocation of The Blood God",nil,nil,nil,45,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26321] = {"An Unfinished Task",nil,{{7572}},nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26323] = {"An Unfinished Task",nil,{{9298}},nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,618,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26332] = {"[Epoch] Quest 26332",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26341] = {"The Possible Fall of Baradin Hold",nil,{{11936}},nil,60,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,28,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26362] = {"Call to Skirmish: Stonetalon Mountains",nil,nil,nil,36,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,81,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26364] = {"Call to Skirmish: Ashenvale",nil,nil,nil,24,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26366] = {"Call to Skirmish: Hillsbrad Foothills",nil,nil,nil,22,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26368] = {"Call to Skirmish: Thousand Needles",nil,nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26370] = {"Call to Skirmish: Alterac Mountains",nil,nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26372] = {"Call to Skirmish: Desolace",nil,nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26374] = {"Call to Skirmish: Arathi Highlands",{{12920}},{{12920}},nil,37,nil,nil,{"Kill 5 Alliance."},nil,nil,nil,nil,nil,nil,nil,nil,45,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26376] = {"Call to Skirmish: Swamp of Sorrows",{{9019}},{{9019}},nil,38,nil,nil,{"Kill 5 Alliance."},nil,nil,nil,nil,nil,nil,nil,nil,8,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26377] = {"Call to Skirmish: Badlands",nil,nil,nil,43,nil,nil,{"Kill 5 Horde."},nil,nil,nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26378] = {"Call to Skirmish: Badlands",nil,nil,nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26381] = {"Call to Skirmish: Stranglethorn Vale",nil,nil,nil,43,nil,nil,{"Kill 5 Horde."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26382] = {"Call to Skirmish: Stranglethorn Vale",nil,nil,nil,40,nil,3,{"Report to the battleground for Stranglethorn Vale skirmish."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
[26383] = {"Call to Skirmish: Tanaris",{{7823}},{{7823}},nil,42,nil,nil,{"Kill 5 Horde."},nil,nil,nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26384] = {"Call to Skirmish: Tanaris",{{46226}},{{46226}},nil,45,nil,1,{"Kill 5 Alliance."},nil,nil,nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26410] = {"Taming the Beast",{{45475}},nil,nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26414] = {"Tattered Letter",{{197}},{{45479}},nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26453] = {"Our Bodies Forsaken",{{45242}},nil,nil,12,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26455] = {"Seeking Redemption",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26457] = {"Our Bodies Forsaken",nil,{{45885}},nil,13,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26458] = {"Our Bodies Forsaken",nil,{{45242}},nil,13,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26461] = {"Our Bodies Forsaken",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26472] = {"In Favor of the Sun",{{45512}},{{45513}},nil,4,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26478] = {"Deep Earth Rune",{{658}},{{658}},nil,1,nil,nil,{"Obtain a Deep Earth Rune."},nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26484] = {"Call of Fire",{{45519}},nil,nil,10,nil,2,{"Bring the Torch of the Dormant Flame to Juldugs Firetale in Loch Modan."},nil,nil,nil,nil,nil,{26485},nil,nil,1,nil,nil,nil,nil,26485,2,0,nil,nil,nil,nil,nil,nil},
[26485] = {"Call of Fire",{{45520}},{{45520}},nil,11,nil,2,{"Obtain Fire Tar from Stonesplinter Scout and Reagent Pouch from Dark Iron Spy."},nil,{{{1162,"Stonesplinter Scout"},{1169,"Dark Iron Spy"}},nil,{{5026,"Fire Tar"},{6652,"Reagent Pouch"}}},nil,nil,{26484},{26486},nil,nil,38,nil,nil,nil,nil,26486,2,0,26484,nil,nil,nil,nil,nil},
[26499] = {"Magical Materiel",{{2543}},nil,nil,35,nil,nil,{"Collect 30 Magic Materiel."},nil,{nil,nil,{{62503,30,"Magic Materiel"}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26502] = {"Rare Books",{{2277}},{{2277}},nil,42,nil,2,{"Collect Tales from Tel'Abim, Collect Night Stars By Longitude"},nil,{nil,nil,{{63090,1,"Tales from Tel'Abim"},{63091,1,"Night Stars By Longitude"}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26504] = {"Syndicate Documents",{{2276}},{{2228}},nil,33,nil,2,{"Collect Syndicate documents and deliver them to Lieutenant Farren Orinelle."},nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26505] = {"Letter to Ravenholdt",{{2276}},{{2439}},nil,36,nil,2,{"Take the letter from Magistrate Henry Maleb to Lord Jorach Ravenholdt at Ravenholdt Manor in the Alterac Mountains."},nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26506] = {"The Strahnbrad Courier",nil,{{6768}},nil,36,nil,2,{"Collect the Coded Syndicate Documents."},nil,{nil,nil,{{62300,1,"Coded Syndicate Documents"}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26509] = {"Suspicious Activity in the Uplands",nil,{{6768}},nil,38,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26511] = {"The Perenolde Legacy",{{2317}},{{6768}},nil,38,nil,nil,{"Report the news of Aliden Perenolde's death and Elysa's request to search for General Hath to Lord Ravenholdt."},nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26512] = {"The Perenolde Legacy",nil,{{2378}},nil,38,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26513] = {"The Perenolde Legacy",nil,{{10782}},nil,38,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26516] = {"Dark Council",{{2276}},nil,nil,40,nil,nil,{"Take the Argus Spellbook to Lord Jorach Ravenholdt at Ravenholdt Manor in Alterac Mountains."},nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26517] = {"Dark Council",nil,{{6768}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26518] = {"The Ensorcelled Parchment",nil,nil,nil,40,nil,nil,{"Find the Ensorcelled Parchment."},nil,{nil,nil,{{62310,1,"Ensorcelled Parchment"}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26519] = {"Felicity's Deciphering",{{6768}},{{45526}},nil,40,nil,nil,{"Take the Ensorcelled Parchment to Felicity for deciphering."},nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26520] = {"[Epoch] Quest 26520",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26521] = {"The Argus Wake",nil,{{2317}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26522] = {"The Argus Wake",{{2391}},{{2391}},nil,40,nil,nil,{"Recover 6 Argus Moonstones from Dun Garok."},nil,{nil,nil,{{45825,6}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26523] = {"The Ensorcelled Parchment",nil,nil,nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26524] = {"To Ravenholdt Manor",nil,{{3544}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26526] = {"The Bloodstone Devices",{{2934}},{{2934}},nil,40,nil,nil,{"Use the Dalaran Status Report to summon the Dalaran Archmage at the Dalaran Crater. Slay the Archmage and recover the Bloodstone Device. Return to Keeper Bel'varil."},nil,{nil,nil,{{45827,1}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26527] = {"The Bloodstone Devices",{{45526}},{{45526}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26528] = {"All Signs Point to Desolace",nil,{{45527}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26529] = {"The Argus Wake",{{45527}},{{45527}},nil,42,nil,nil,{"Felicity Perenolde wants you to acquire 10 Pinches of Bone Marrow from the skeletons in the Kodo Graveyard."},nil,{nil,nil,{{62691,nil}}},nil,nil,nil,{26530},nil,nil,405,nil,nil,nil,nil,26530,8,0,nil,nil,nil,nil,nil,nil},
[26530] = {"The Argus Wake in Desolace",nil,{{45527}},nil,42,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26531] = {"The Argus Wake in Desolace",{{45527}},{{45527}},nil,42,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26532] = {"The Argus Wake",{{45528}},{{45528}},nil,44,nil,nil,{"Felicity Perenolde wants you to interrogate Zala'thria."},nil,{{{45530,"Zala'thria interrogated"}}},nil,nil,{26531},{26533},nil,nil,405,nil,nil,nil,nil,26533,8,0,26531,nil,nil,nil,nil,nil},
[26533] = {"The End of the Argus Wake",{{45528}},{{45539}},nil,44,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26537] = {"The Mordis Key",nil,{{2278}},nil,40,nil,nil,{"Deliver the Mordis Key to Melisara."},nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26538] = {"The Barony Mordis",{{2378}},nil,nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26539] = {"The Barony Mordis",nil,nil,nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26540] = {"Threats from Abroad",{{45546}},{{6579}},nil,32,nil,2,{"Slay 10 Murloc Lake Hunters and 8 Murloc Lake Oracles."},nil,{{{45544,10,"Murloc Lake Hunter slain"},{45545,8,"Murloc Lake Oracle slain"}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26541] = {"Threats from Abroad",nil,nil,nil,32,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26542] = {"A Rare Variety",{{2364}},{{2364}},nil,35,nil,nil,{"Collect 6 rare specimens."},nil,{nil,nil,{{11630}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26543] = {"Watermelon Punch",{{2364}},nil,nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26544] = {"Who Likes Apples?",{{3544}},{{3544}},nil,35,nil,1,{"Collect 6 Wintercrisp Apple Seeds."},nil,{nil,nil,{{62329,6,"Wintercrisp Apple Seeds"}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26545] = {"Who Likes Watermelons?",{{2388}},{{2388}},nil,40,nil,nil,{"Find and capture the infamous Goobis McChow using the watermelon lure provided by Derak Nightfall. Found alive or dead. Bring him to the Magistrate's chair."},nil,{nil,{{45859,1}},nil},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26547] = {"To The Hills",nil,nil,nil,37,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26548] = {"Cooling Waters",{{45548}},{{45548}},nil,37,nil,2,{"Collect 8 Cooled Aqual Essence."},nil,{nil,nil,{{62330,8,"Cooled Aqual Essence"}}},nil,nil,nil,nil,nil,nil,45,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26549] = {"A Painful Dousing",{{45548}},{{45548}},nil,37,nil,2,{"Collect 8 Raging Bindings."},nil,{{{45552,"Raging Cinders"}},nil,{{62332,8,"Raging Bindings"}}},nil,nil,nil,nil,nil,nil,45,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26550] = {"An Audience With Water",{{45548}},{{45547}},nil,37,nil,2,{"Seek an audience with Aquamentus."},nil,nil,nil,nil,nil,nil,nil,nil,45,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26551] = {"Close The Vents",{{45547}},{{45547}},nil,37,nil,2,{"Close 8 Steam Vents."},nil,{nil,{{4001061,8,"Steam Vents closed"}}},nil,nil,nil,nil,nil,nil,45,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26554] = {"Assistance Of Air",{{45555}},{{45547}},nil,37,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26555] = {"Cooling The Fury",nil,{{45547}},nil,37,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26558] = {"The Rumbling Fields",nil,{{45564}},nil,38,nil,2,{"Slay 7 Frantic Earth and 7 Rambling Earth."},nil,{{{45565,7,"Frantic Earth"},{45566,7,"Rambling Earth"}}},nil,nil,nil,nil,nil,nil,45,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26560] = {"When Life Gives You... Berries?",nil,{{45564}},nil,38,nil,2,{"Collect 8 Bushel of Shadowberry."},nil,{nil,nil,{{62338,8,"Bushel of Shadowberry"}}},nil,nil,nil,nil,nil,nil,45,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26569] = {"Unusual Rations",nil,{{2818}},nil,37,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26570] = {"Waterlogged Journal",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26575] = {"The Dark Shamans",nil,nil,nil,39,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26576] = {"The Dark Shamans",nil,{{45548}},nil,39,nil,2,{"Collect Drezco's Head and Enwi's Head."},nil,{nil,nil,{{62354,1,"Drezco's Head"},{62355,1,"Enwi's Head"}}},nil,nil,nil,nil,nil,nil,45,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26577] = {"[Epoch] Quest 26577",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26579] = {"A Fine Potion",{{45592}},{{2920}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26580] = {"A Lost Treasure",nil,{{2888}},nil,37,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26582] = {"Amulet Shakedown",{{45206}},{{2860}},nil,43,nil,2,{"Collect 10 Dustbelcher Amulets."},nil,{nil,nil,{{62365,10,"Dustbelcher Amulet"}}},nil,nil,nil,nil,nil,nil,15,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26585] = {"Ore for Gapple",nil,{{45598}},nil,41,nil,1,{"Collect 8 Case of Mithril."},nil,{nil,nil,{{62369,8,"Case of Mithril"}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26586] = {"Primitive Relic",nil,{{45598}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26587] = {"Primitive Relic",nil,{{9078}},nil,40,nil,1,{"Take the Primitive Relic to the dwarves near Hammertoe's Digsite."},nil,nil,nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26588] = {"Trapped Miners",{{45601}},{{45601}},nil,40,nil,nil,{"Free the trapped miners."},nil,nil,nil,nil,nil,{26589},nil,nil,3,nil,nil,nil,nil,26589,2,0,nil,nil,nil,nil,nil,nil},
[26591] = {"The Strange Ore",{{45601}},{{45601}},nil,42,nil,nil,{"Investigate the Strange Ore."},nil,nil,nil,nil,{26590},{26592},nil,nil,3,nil,nil,nil,nil,26592,2,0,26590,nil,nil,nil,nil,nil},
[26592] = {"The Strange Ore",{{46326}},{{46327}},nil,42,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26593] = {"The Indurium Matrix",{{45600}},{{7172}},nil,45,nil,1,{"Obtain the Indurium Matrix."},nil,{nil,nil,{{62373,"Indurium Matrix"}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26594] = {"[Epoch] Quest 26594",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26597] = {"An Old Man's Request",{{7740}},{{7740}},nil,26,nil,nil,{"Bring the head of Klaven Mortwake to Old Man Thistle in Darnassus."},nil,{{{7053,nil}},nil,{{30832,nil,"Klaven Mortwake's Head"}}},nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26598] = {"Collecting on Debt",{{8178}},nil,nil,52,nil,nil,{"Collect Twisted Staff, Elaborate Timepiece, and Magic Drum."},nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26599] = {"Feeding the Troops",{{5393}},nil,nil,50,nil,nil,{"Collect 10 Sulfurous Meat."},nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26600] = {"Alchemy is the Answer",{{5393}},nil,nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26601] = {"The Clay Cleanse",nil,nil,nil,50,nil,nil,{"Collect 7 Red Clay."},nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26602] = {"Ready for Distribution",nil,nil,nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26603] = {"Scout Morgria",{{46344}},{{46345}},nil,50,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26611] = {"Rest for the Wicked",nil,nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26614] = {"Gathering Intelligence",{{5385}},nil,nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26615] = {"The Bigger Picture",{{5385}},nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26616] = {"Eyes of Our Own",{{5385}},nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26617] = {"Felstone Mines",nil,nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26618] = {"Parched and Parcel",{{45613}},nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26619] = {"It Ain't the Worst",nil,nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26621] = {"Resurgent Evil",nil,nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26622] = {"Sunken Treasure",nil,nil,nil,52,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26626] = {"An Unlikely Ally",{{8022}},nil,nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26628] = {"The Foundation Crumbles",nil,nil,nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26629] = {"True Believers",nil,nil,nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26630] = {"The Sting of Betrayal",nil,nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26631] = {"The Thorn in My Side",nil,nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26632] = {"Glyph of the Warlord",nil,nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26633] = {"Arming Ashfall",nil,nil,nil,53,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26636] = {"Hitting Where it Hurts",nil,nil,nil,57,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26639] = {"Assistance Required",{{46100}},nil,nil,53,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26641] = {"Called Forth",{{45647}},nil,nil,55,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26645] = {"Meeran's Escape",{{45645}},{{45644}},nil,52,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26662] = {"The Ironforge Airfield",{{1572}},{{45670}},nil,17,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26663] = {"The Ironforge Airfield",{{1573}},{{45670}},nil,17,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26664] = {"Assisting Nonere",{{45673}},{{45676}},nil,17,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26665] = {"Assisting Nonere",nil,{{45676}},nil,17,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26666] = {"Assisting Topsy",{{45676}},{{45676}},nil,17,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26670] = {"The Ironforge Airfield",nil,nil,nil,17,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26676] = {"A Lost Brother...",{{1273}},{{1376}},nil,9,nil,2,{"Find Beldin Steelgrill and report about the lost brother."},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26679] = {"Keeping Us Warm",nil,{{1247}},nil,7,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26680] = {"Lost Rams",{{1261}},{{1261}},nil,9,nil,nil,{"Return 3 lost rams to Amberstill Ranch."},nil,{{{60001,3,"Rams returned to Amberstill Ranch"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26684] = {"Ram Riding",{{4772}},nil,nil,40,nil,nil,{"Learn Apprentice Riding from Ultham Ironhorn."},nil,{{{60002,"Apprentice Riding Learned"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26687] = {"Ore for Grumnal",{{1360}},{{1360}},nil,10,nil,nil,{"Collect 10 Kinetic Ore."},nil,{nil,nil,{{62201,10,"Kinetic Ore"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26689] = {"Barroom Blitz",{{240}},{{261}},nil,12,nil,2,{"Deal with the barroom troublemakers."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26691] = {"Barroom Blitz",{{253}},{{45704}},nil,12,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26692] = {"Barroom Blitz",nil,{{45713}},nil,12,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26693] = {"Barroom Blitz",{{45713}},{{45715}},nil,12,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26694] = {"Barroom Blitz",nil,{{240}},nil,12,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26696] = {"Hand of Azora",nil,{{45700}},nil,13,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26697] = {"Hand of Azora",{{45700}},nil,nil,13,nil,2,{"Collect Defias Notes I, III, and IV."},nil,{nil,nil,{{62957,"Defias Notes - I"},{62958,"Defias Notes - III"},{62959,"Defias Notes - IV"}}},nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26698] = {"Hand of Azora",{{45700}},{{45702}},nil,13,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26700] = {"Hand of Azora",{{46800}},{{6171}},nil,14,nil,2,{"Using the Defias Clues, locate Tannos in Westfall."},nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26701] = {"Hand of Azora",nil,nil,nil,15,nil,2,{"Clear the Gold Coast Quarry."},nil,nil,nil,nil,nil,{26702},nil,nil,40,nil,nil,nil,nil,26702,2,0,nil,nil,nil,nil,nil,nil},
[26702] = {"Hand of Azora",nil,{{313}},nil,15,nil,2,{"Return to Theocritus at Tower of Azora."},nil,nil,nil,nil,{26701},{26703},nil,nil,40,nil,nil,nil,nil,26703,2,0,26701,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26705] = {"Riders In The Night",nil,nil,nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26706] = {"Riders In The Night",nil,{{45301}},nil,28,nil,2,{"Investigate Manor Mistmantle."},nil,nil,nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26707] = {"Riders In The Night",nil,{{264}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26710] = {"Riders In The Night",nil,{{264}},nil,31,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26711] = {"Life In Death",{{45731}},{{273}},nil,25,nil,nil,{"Collect 8 Brightwood Bloom."},nil,{nil,nil,{{62530,nil}}},nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26712] = {"Life In Death",nil,{{45731}},nil,25,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26713] = {"Life In Death",{{45731}},{{45731}},nil,25,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26714] = {"The Handmaiden's Fall",nil,{{2112}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,{26715},nil,nil,10,nil,nil,nil,nil,26715,8,0,nil,nil,nil,nil,nil,nil},
[26715] = {"The Handmaiden's Fall",{{2112}},{{2112}},nil,28,nil,nil,{"Collect Stolen Fresh Bread and a Cask of Brightwood White."},nil,{nil,{{187600,nil,"Leftover Bread"},{187601,nil,"Cask of Brightwood White"}},{{62535,nil,"Stolen Fresh Bread"},{62536,nil,"Cask of Brightwood White"}}},nil,nil,{26714},nil,nil,nil,10,nil,nil,nil,nil,nil,8,0,26714,nil,nil,nil,nil,nil},
[26716] = {"The Handmaiden's Fall",nil,{{2112}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26717] = {"The Handmaiden's Fall",nil,{{2112}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26718] = {"Until Death Do Us Part",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26719] = {"Until Death Do Us Part",{{45734}},nil,nil,21,nil,nil,{"Obtain a Red Rose."},nil,{nil,nil,{{3419,"Red Rose"}}},nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26723] = {"Wanted: Plagued Shambler",nil,nil,nil,30,nil,nil,{"Slay the Plagued Shambler."},nil,{{{45751,"Plagued Shambler"}}},nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26738] = {"Memories of Eastweald",{{45749}},{{45749}},nil,57,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26744] = {"Open for Business",{{12384}},{{11063}},nil,55,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26764] = {"We Have the Technology",{{45769}},nil,nil,55,nil,nil,{"Use Engineer Flikswitch's technology."},nil,nil,nil,nil,nil,nil,nil,nil,139,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil},
[26766] = {"The Warging Way",{{46292}},{{46292}},nil,58,nil,nil,{"Kill 15 Worgen Infiltrators."},nil,{{{46374,nil}}},nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26767] = {"Like Fish In A Barrel",{{46292}},{{46292}},nil,58,nil,nil,{"Kill Howling Keena, Gnash, and Rogan Thunderhorn."},nil,{{{46375,nil},{46376,nil},{46377,nil}}},nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26768] = {"Barrel Down",{{46292}},{{46292}},nil,58,nil,nil,{"Destroy the Worgen explosives."},nil,{nil,{{187980,nil},{187981,nil},{187982,nil}}},nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26769] = {"Gnarlier Than Thou",{{46292}},{{46292}},nil,59,nil,nil,{"Slay the Old Gnarled Root."},nil,{{{46379,nil}}},nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26770] = {"Just Desserts",{{45773}},{{313}},nil,8,nil,nil,{"Present Sarah's cake to Theocritus."},nil,nil,nil,nil,{28904},nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,28904,nil,nil,nil,nil,nil},
[26771] = {"The High Isle of Fel High Elves",{{46293}},{{46293}},nil,60,nil,nil,{"Kill 15 Fel High Elves and collect 5 books: Book of Lost Souls, Book of Dark Magic, Book of Forbidden Knowledge, Book of Elven Torture, and Book of Deadly Poisons."},nil,{{{46381,nil},{46382,nil},{46383,nil},{46384,nil},{46385,nil},{46386,nil}},nil,{{62836,nil},{62837,nil},{62838,nil},{62839,nil},{62840,nil}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26772] = {"Necromancy and You",{{46294}},{{46294}},nil,60,nil,nil,{"Kill 15 Undead and the Necromancer Overlord in the cave on High Isle."},nil,{{{46387,nil},{46388,nil},{46389,nil},{46390,nil}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26773] = {"[Epoch] Quest 26773",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26774] = {"Spider Elixir",{{45775}},{{45775}},nil,9,nil,nil,{"Free 4 Webbed Miners and collect 4 Mine Spider Mandibles."},nil,{{{60801,4,"Webbed Miners freed"}},nil,{{62825,"Mine Spider Mandible",4}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26775] = {"Tend to the Wounded",{{45775}},{{45775}},nil,10,nil,nil,{"Cure 5 Poisoned Miners."},nil,{{{60800,5,"Poisoned Miners cured"}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26776] = {"Swiftpaw",{{11940}},{{11940}},4,6,77,nil,{"Bring Swiftpaw's Snout to Merissa Stilwell outside Northshire Abbey."},nil,{nil,nil,{{60388,nil}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26777] = {"The Soaked Barrel",nil,{{9296}},1,1,77,nil,{"Find the source of the barrel via 12 Red Burlap Bandana discoveries."},nil,nil,nil,nil,nil,{26778},nil,nil,12,nil,nil,nil,nil,26778,8,0,nil,nil,nil,nil,nil,nil},
[26778] = {"Find the Brother",{{9296}},{{9296}},nil,1,nil,nil,{"Find Brother Wilhelm."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26779] = {"A Brother's Disgust",{{952}},{{952}},nil,5,nil,nil,{"Report Brother Paxton's disgust."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26780] = {"A Mage's Advice",{{6778}},{{295}},nil,5,nil,2,{"Seek the mage's advice in Goldshire."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26781] = {"Linus Stone Tips",{{45779}},{{253}},nil,6,nil,nil,{"Deliver the Stone Tips to William Pestle."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26782] = {"Brewing Brethren",{{328}},{{45783}},nil,6,nil,2,{"Reach the top of Northshire Falls."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26784] = {"Mountainstout Ale",{{45780}},{{45780}},nil,6,nil,nil,{"Collect 6 Glistening Falls Water and 6 Northshire Reed."},nil,{nil,nil,{{62607,6,"Glistening Falls Water"},{62608,6,"Northshire Reed"}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26785] = {"A Friend Indeed",{{45782}},{{45782}},nil,6,nil,nil,{"Help Dromul's friend with their task."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26794] = {"Wanted: Big Blue",{nil,{45797}},nil,nil,8,nil,2,{"Obtain Big Blue's Wing."},nil,{nil,nil,{{62619,1,"Big Blue's Wing"}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26795] = {"A Lost Warrior",nil,{{6446}},nil,24,nil,1,{"Find the lost warrior."},nil,nil,nil,nil,nil,nil,nil,nil,1637,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26797] = {"A Lost Warrior",{{45799}},{{2229}},nil,24,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26798] = {"A Scout in Need",nil,{{2382}},nil,24,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26799] = {"A Scout in Need",{{45800}},{{2263}},nil,24,nil,2,{"Report to Marshal Redpath in Southshore."},nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26801] = {"A Scout in Need",{{45449}},{{2380}},nil,24,nil,2,{"Rescue Scout Vernado."},nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26802] = {"Venom Medicine",{{2363}},{{2363}},nil,23,nil,nil,{"Collect 8 Venom Sacs."},nil,{nil,nil,{{11630}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26806] = {"Defense of Southshore",{{45800}},{{45800}},nil,22,nil,2,{"Collect Emily's Report, Paxton's Report, and Tristan's Report."},nil,{nil,nil,{{62596,1,"Emily's Report"},{62597,1,"Paxton's Report"},{62598,1,"Tristan's Report"}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26817] = {"Justice Left Undone",nil,{{2378}},nil,34,nil,nil,{"Kill Grandpa Vishas in Alterac Mountains."},nil,{{{3985,"Grandpa Vishas"}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26822] = {"Hillsbrad Assault",nil,nil,nil,29,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26823] = {"Hillsbrad Defense",nil,nil,nil,29,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26831] = {"Syndicate Plans",nil,nil,nil,26,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26838] = {"A Proper Sendoff",nil,{{1682}},nil,14,nil,2,{"Bury Bhondur's bones."},nil,nil,nil,nil,nil,nil,nil,nil,38,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26839] = {"Horde Report",nil,{{1340}},nil,18,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26841] = {"Lost Artifacts",{{1214}},{{1214}},nil,18,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26844] = {"The Strange Idol",nil,{{1356}},nil,18,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26847] = {"Ardo's Dirtpaw",{{45825}},{{903}},nil,24,nil,nil,{"Retrieve Ardo's Dirtpaw and bring it to Guard Howe."},nil,{nil,nil,{{62679,"Ardo's Dirtpaw"}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26849] = {"Gnoll Patrol",{{2697}},{{2697}},nil,24,nil,nil,{"Slay 7 Shadowhide Brutes and 7 Shadowhide Warriors."},nil,{{{568,7,"Shadowhide Warrior"},{46153,7,"Shadowhide Brute"}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26851] = {"Intel on Morganth",nil,{{344}},nil,19,nil,2,{"Deliver note to Magistrate Solomon."},nil,nil,nil,nil,nil,nil,nil,nil,49,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26852] = {"Scouring the Desert",{{45964}},{{45964}},nil,45,nil,nil,{"Clear the Ogre areas and retrieve the Crown of Kradel"},nil,nil,nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26854] = {"Twilight Tactics",{{46559}},{{46559}},nil,45,nil,nil,{"Kill Twilight forces and gather plans"},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26855] = {"The Brothers Blighthammer",{{46560}},{{46560}},nil,44,nil,nil,{"Rescue brother from Dark Iron captors"},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26856] = {"Twilight Tactics",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26857] = {"Thorium Point Politics",{{46562}},{{14625}},nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26858] = {"The Thorium Brotherhood",{{45827}},{{14634}},nil,44,nil,nil,{"Collect 10 Firebloom from Searing Gorge and bring them to Lookout Captain Lolo Longstriker."},nil,{nil,nil,{{4625,10}}},nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26859] = {"Return to Thorium Point",{{14625}},{{46562}},nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26860] = {"The Grimesilt Digsite",{{46563}},{{46563}},nil,44,nil,nil,{"Complex excavation with multiple containers"},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26861] = {"The Fate of the Earthfurrow Clan",{{46564}},{{46564}},nil,44,nil,nil,{"Investigate the clan's disappearance"},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26862] = {"Lost for Ages",{{46565}},{{46565}},nil,44,nil,nil,{"Recover stolen relics from Dark Iron dwarves"},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26863] = {"Our Only Option",{{46561}},{{46561}},nil,44,nil,nil,{"Destroy Dark Iron supplies"},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26864] = {"Do Slavers Keep Records?",nil,{{45833}},nil,46,nil,nil,{"Collect Slaver's Records from Dark Iron Taskmasters and bring them to Bhurind Stoutforge."},nil,{nil,nil,{{63195,1}}},nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26867] = {"A Suspicious Delivery",{{46570}},{{46570}},nil,44,nil,nil,{"Investigate suspicious shipments"},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26868] = {"Grampy Stoutforge",{{14624}},{{45834}},nil,46,nil,nil,{"Speak with Grampy Stoutforge in Searing Gorge."},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26872] = {"Urgent Delivery",nil,nil,nil,15,nil,nil,{"Deliver the urgent package."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26873] = {"The Missing Initiate",nil,{{2121}},nil,18,nil,nil,{"Find the missing initiate and report back to Shadow Priest Allister."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26874] = {"Supply Run",nil,nil,nil,16,nil,nil,{"Complete the supply run."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26875] = {"The Missing Initiate",{{45840}},{{45841}},nil,18,nil,nil,{"Find Sage Greenhorn in Silverpine Forest."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26876] = {"Tomes of Interest",nil,nil,nil,18,nil,nil,{"Collect 5 Old Tomes from the area."},nil,{nil,nil,{{62718,5,"Old Tome"}}},nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26877] = {"Tomes of Interest",{{45841}},{{45841}},nil,18,nil,nil,{"Slay 4 Sickly Refugees and collect 5 Gilnean Tomes."},nil,{nil,nil,{{62727,"Gilnean Tome",5}}},nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26879] = {"Swifthoof's Message",{{11748}},{{2519}},nil,34,nil,nil,{"Take Samantha Swifthoof's Message to Kin'weelay at Grom'gol in Stranglethorn Vale."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26880] = {"A Salve for Samantha",nil,nil,nil,34,nil,nil,{"Create a salve for Samantha's wounds."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26883] = {"A Salve for Samantha",nil,{{11748}},nil,34,nil,nil,{"Take the Finished Salve to Samantha Swifthoof, who wanders the main road through Stranglethorn Vale."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26884] = {"Looting the Looters",{{45844}},nil,nil,36,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26885] = {"My Friend, The Skullsplitter",{{45846}},nil,nil,36,nil,nil,{"Speak with Thu'tek and return his Spirit Charm to Nimboya."},nil,nil,nil,nil,nil,{26886},nil,nil,33,nil,nil,nil,nil,26886,8,0,nil,nil,nil,nil,nil,nil},
[26886] = {"My Friend, The Skullsplitter",{{45845}},{{45845}},36,36,nil,nil,{"Return to Lorespeaker Itzli at Grom'gol with Thu'tek's Spirit Charm."},nil,nil,nil,nil,{26885},nil,nil,nil,33,nil,nil,nil,nil,nil,8,0,26885,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26887] = {"My Friend, The Skullsplitter",nil,nil,nil,36,nil,nil,{"Complete the Skullsplitter ritual."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26888] = {"My Friend, The Skullsplitter",{{48195}},nil,nil,36,nil,1,{"Collect Blood Brazier from the ritual site."},nil,{nil,nil,{{62744,1,"Blood Brazier"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26889] = {"My Friend, The Skullsplitter",{{45846}},{{46738}},nil,36,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26890] = {"My Friend, The Skullsplitter",nil,nil,nil,36,nil,nil,{"Complete the ritual with Mezzphog."},nil,{{{60459,"Ritual Completed"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26891] = {"Pilfering the Reef",nil,nil,nil,39,nil,nil,{"Pilfer treasures from the reef."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26892] = {"Beastial Allies",nil,{{7853}},nil,41,nil,1,{"Slay 8 Mistvale Poachers","Loot Requisition Orders"},nil,{{{45851,8}},nil,{{62749,1,"Requisition Orders"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26893] = {"Revantusk Voodoo",nil,nil,nil,50,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26895] = {"The Ring of Strength: Brokenhorn",nil,nil,nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26896] = {"The Ring of Strength: The Twins",nil,nil,nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26897] = {"The Ring of Strength: Stonegaze",{{45857}},nil,nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26898] = {"The Ring of Strength: Winston",nil,nil,nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26899] = {"The Ring of Strength: Dekked",{{45857}},nil,nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26900] = {"The Ring of Strength: Warlord Rhurg",nil,nil,nil,43,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26901] = {"Shark Fin Stew",nil,{{2464}},nil,36,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26902] = {"Stop The Shrinking",nil,{{2700}},nil,35,nil,nil,{"Adventurers Freed: 0/8"},nil,{nil,nil,nil,nil,nil,{{1,"Adventurers Freed",8}}},nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26903] = {"Ironband's Excavation",{{1356}},{{1345}},nil,8,nil,nil,{"Report to Magmar Fellhew."},nil,nil,nil,nil,nil,nil,nil,nil,38,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26904] = {"The Janky Helmet",{{48086}},{{9317}},nil,42,nil,nil,{"Experiment on 10 Elder Mistvale Gorillas and bring the Janky Helmet to Scooty in Booty Bay."},nil,{{{1557,10,"Elder Mistvale Gorilla experimented on"}},nil,{{63212,"The Janky Helmet"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26905] = {"The Janky Helmet",{{9317}},{{48086}},nil,42,nil,nil,{"Bring the Janky Helmet to the Venture Co. Tinkerer."},nil,{nil,nil,{{63212,"The Janky Helmet"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26906] = {"The Tablet of Zuul'daia",nil,nil,nil,36,nil,nil,{"Find the Tablet of Zuul'daia."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26907] = {"Wild Tulip",nil,{{45869}},nil,41,nil,nil,{"Find the Chest of Memories for Chel Moonwood."},nil,{nil,nil,{{62765,"Chest of Memories"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26908] = {"Wild Tulip",{{45869}},nil,nil,41,nil,nil,{"Find Daniels Spice Box and Tulip's Music Box."},nil,{nil,nil,{{62766,"Daniels Spice Box"},{62767,"Tulip's Music Box"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26910] = {"Wild Tulip",nil,nil,nil,41,nil,2,{"Collect Daniels Pendant and Tulip's Pendant."},nil,{nil,nil,{{62771,1,"Daniels Pendant"},{62769,1,"Tulip's Pendant"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26911] = {"Wild Tulip",nil,nil,nil,41,nil,2,{"Witness Chel Moonwood's Ritual."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26912] = {"Deathstrike Remedy",{{983}},nil,nil,40,nil,nil,{"Collect 10 Vials of Deathstrike Venom."},nil,{nil,nil,{{62768,10,"Vial of Deathstrike Venom"}}},nil,nil,nil,nil,nil,nil,38,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26914] = {"Ocniir's Beloved Rods",{{45875}},{{45875}},nil,37,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26915] = {"Zul'jin's Experiment",{{45873}},{{45873}},nil,42,nil,nil,{"Collect the Troll Ritual Oil and return to Zul'jin."},nil,{nil,nil,{{62769,"Troll Ritual Oil"}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26918] = {"Plainstrider Menace",{{3615}},{{3615}},nil,10,nil,nil,{"Bring 10 Greater Plainstrider Beaks to Kodo Wrangler Grish."},nil,{nil,nil,{{21510,10,"Greater Plainstrider Beak"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26919] = {"Karabor Fire Stew",{{45877}},{{45877}},nil,41,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26921] = {"Splintered Leadership",{{46613}},{{46613}},nil,18,nil,nil,{"Kill gnoll leaders"},nil,nil,nil,nil,nil,nil,nil,nil,44,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26922] = {"Demons In Stranglethorn",nil,nil,nil,43,nil,nil,{"Investigate demon activity in Stranglethorn Vale."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26924] = {"WANTED: Tamura",nil,{{1775}},nil,40,nil,1,{"Collect Head of Tamura."},nil,{nil,nil,{{62794,1,"Head of Tamura"}}},nil,nil,nil,nil,nil,nil,8,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26925] = {"Message for the Historian",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26926] = {"A Box of Relics",{{45887}},{{45887}},nil,9,nil,nil,{"Collect Box of Collected Relics from Northshore Mine."},nil,{nil,nil,{{60445,1,"Box of Collected Relics"}}},nil,nil,nil,nil,nil,nil,159,nil,nil,nil,nil,nil,0,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26927] = {"A Box of Relics",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26928] = {"Arugal Ambush",{{45888}},{{45888}},nil,11,nil,1,{"Collect Deathguard Orders."},nil,{nil,nil,{{62798,"Deathguard Orders"}}},nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26929] = {"Arugal Ambush",{{45888}},{{45888}},nil,11,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26930] = {"The Corpulent Watcher",{{5688}},{{5688}},nil,10,nil,nil,{"Kill the level 13 Corpulent Watcher"},nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26931] = {"Return to Coleman",{{5688}},{{1500}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26932] = {"Encroaching Worgs",{{1738}},{{1738}},nil,8,nil,nil,{"Slay 5 Starving Worgs."},nil,{{{45893,5,"Starving Worg"}}},nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26933] = {"Etched Scroll",{{1569}},{{45894}},nil,1,nil,nil,{"Read the Etched Scroll and speak to your class trainer, Apolos Deathshot."},nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26934] = {"Filling the Armory",nil,nil,nil,9,nil,1,{"Collect 6 Case of Ore."},nil,{nil,nil,{{60446,6,"Case of Ore"}}},nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26936] = {"Northshore Mine",nil,{{45885},nil},9,9,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,159,nil,nil,nil,nil,nil,0,0,nil,nil,nil,nil,nil,nil},
[26937] = {"Missing Courier",{{1500}},{{38895}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26938] = {"[Epoch] Quest 26938",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26939] = {"Peace in Death",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26940] = {"[Epoch] Quest 26940",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26941] = {"[Epoch] Quest 26941",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26942] = {"Ancient Artifact",nil,nil,nil,11,nil,nil,{"Recover the ancient artifact."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26951] = {"A Matter of Timeways",{{10667}},nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26953] = {"A Tattered Acceptance Letter",nil,{{9078}},nil,47,nil,1,{"Obtain A Tattered Acceptance Letter."},nil,{nil,nil,{{62823,1,"A Tattered Acceptance Letter"}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26958] = {"Hero Worship",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil},
[26959] = {"Hero Worship",{{11878}},nil,nil,60,nil,nil,{"Collect 20 Fletching Feathers."},nil,nil,nil,nil,nil,nil,nil,nil,139,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil},
[26963] = {"First Day of School",{{46322}},{{46322}},nil,53,nil,2,{"Speak to different NPCs at the school"},nil,{{{46323,nil},{46329,nil},{46326,nil},{46327,nil}}},nil,nil,nil,{26964},nil,nil,28,nil,nil,nil,nil,26964,2,0,nil,nil,nil,nil,nil,nil},
[26964] = {"Observing the Dress Code",{{46322}},{{46326}},nil,53,nil,nil,{"Bring 8 Putrid Spider Silk to Isabelle Pickman at Caer Darrow."},nil,{nil,nil,{{62759,nil}}},nil,nil,{26963},{26965},nil,nil,28,nil,nil,nil,nil,26965,8,0,26963,nil,nil,nil,nil,nil},
[26965] = {"Observing the Dress Code",{{46326}},{{46326}},nil,53,nil,nil,{"Kill Sharlot and bring her Spinneret to Isabelle Pickman."},nil,{nil,nil,{{62760,nil}}},nil,nil,{26964},{26966},nil,nil,28,nil,nil,nil,nil,26966,8,0,26964,nil,nil,nil,nil,nil},
[26966] = {"Second Day of School",{{46322}},{{46322}},nil,53,nil,nil,{"Equip the Scholomance Academy Tabard."},nil,nil,nil,nil,{26965},nil,nil,nil,28,nil,nil,nil,nil,nil,nil,0,26965,nil,nil,nil,nil,nil},
[26967] = {"Scourge Botany",{{46323}},{{46323}},nil,54,nil,nil,{"Obtain 6 Fungus Samples from the Weeping Cave and bring them to Doctor Atwood."},nil,{nil,nil,{{62762,nil}}},nil,nil,{26966},{26968},nil,nil,28,nil,nil,nil,nil,26968,8,0,nil,nil,nil,nil,nil,nil},
[26970] = {"Cooking with Carrion",{{46326}},{{46326}},nil,53,nil,nil,{"Gather 4 Exceptionally Large Eggs from Carrion Vultures and bring them to Isabelle Pickman."},nil,{nil,nil,{{62768,nil}}},nil,nil,{26966},{26971},nil,nil,28,nil,nil,nil,nil,26971,8,0,nil,nil,nil,nil,nil,nil},
[26972] = {"Extra Credit",{{46322}},{{46322}},nil,54,nil,nil,{"Collect 4 Shadow-Resistant Notebooks from Scarlet Lumberjacks and bring them to Dean Blackwood."},nil,{nil,nil,{{62771,nil}}},nil,nil,{26966},nil,nil,nil,28,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[26973] = {"Advanced Alchemy",{{46323}},{{46323}},nil,54,nil,nil,{"Use the Collection Syringe to get three samples of ooze from the Weeping Cave."},nil,nil,nil,nil,{26966},{26974},nil,nil,28,nil,nil,nil,{62756},26974,nil,1,nil,nil,nil,nil,nil,nil},
[26975] = {"Advanced Alchemy",{{46327}},{{46323}},nil,54,nil,nil,{"Protect Proctor Phillips as he completes the experiment."},nil,nil,nil,nil,{26974},nil,nil,nil,28,nil,nil,nil,nil,nil,nil,0,26974,nil,nil,nil,nil,nil},
[26976] = {"History 101",{{46329}},{nil,{4001056}},nil,53,nil,nil,{"Copy the text of the plaque in the basement of the Barov Sepulcher."},nil,nil,nil,nil,{26966},{26977},nil,nil,28,nil,nil,nil,nil,26977,nil,0,nil,nil,nil,nil,nil,nil},
[26977] = {"History 101",{nil,{4001056}},nil,53,53,nil,nil,{"Speak to the Ghost of Alexei Barov."},nil,{{{46324,nil}}},nil,nil,{26976},{26978},nil,nil,28,nil,nil,nil,nil,26978,8,0,26976,nil,nil,nil,nil,nil},
[26978] = {"History 101",{{46324}},{{46329}},nil,53,nil,nil,{"Return to Professor Hanlon at Caer Darrow with this information."},nil,nil,nil,nil,{26977},nil,nil,nil,28,nil,nil,nil,nil,nil,nil,0,26977,nil,nil,nil,nil,nil},
[26979] = {"Senior Prank",{{46331}},{{46331}},nil,54,nil,nil,{"Get some dung from the Scarlet Outhouse along the road leading north to Hearthglen."},nil,{nil,nil,{{62779,nil}}},nil,nil,{26966},{26980},nil,nil,28,nil,nil,nil,nil,26980,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26982] = {"[Epoch] Quest 26982",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26983] = {"[Epoch] Quest 26983",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26984] = {"[Epoch] Quest 26984",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26985] = {"[Epoch] Quest 26985",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26986] = {"[Epoch] Quest 26986",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26987] = {"Homecoming",{{45939}},{{45939}},nil,13,nil,nil,nil,nil,{nil,nil,{{62859,1}}},nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26988] = {"A Stubborn Man",{{45939}},{{45940}},nil,13,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26989] = {"Thumbs Up, Man Down",{{45940}},{{45940}},nil,15,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[26990] = {"Riverpaw Rampage",nil,{{233}},nil,12,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26991] = {"[Epoch] Quest 26991",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26992] = {"[Epoch] Quest 26992",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [26993] = {"The Killing Fields",nil,nil,nil,10,nil,2,{"Rusty Harvest Golem slain: 10/10"},nil,{{{60963,10,"Rusty Harvest Golem"}}},nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[26994] = {"The Killing Fields",{{237}},{{233}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[26995] = {"The Killing Fields",{{233}},{{233}},nil,12,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27000] = {"A Temporary Victory",{{45942}},{{2104}},nil,31,nil,nil,{"Deliver news of the Burndural Victory to Captain Stoutfist."},nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27001] = {"Guldar Gamble",nil,nil,nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27002] = {"Report to the Front Lines",nil,{{45946}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27006] = {"Eye of Zulumar",nil,{{45943}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27009] = {"Evacuation Report",nil,{{45942}},nil,27,nil,nil,{"Deliver the final evacuation report to Mayor Oakmaster."},nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27011] = {"Golem Gyroscope",nil,{{264}},nil,27,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27015] = {"Drastic Measures",{{45963}},{{45957}},nil,27,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27016] = {"Drastic Measures",nil,nil,nil,27,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27020] = {"With Friends Like These...",nil,nil,nil,22,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27021] = {"Message to Menethil",nil,{{2086}},nil,21,nil,nil,{"Deliver the Burndural Notice to Valstag Ironjaw."},nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27024] = {"Annals of Hajiri",{{45976}},{{3691}},nil,22,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27030] = {"CHOP!",{{45981}},{{45981}},nil,25,nil,nil,{"Protect Romgul as he lures Ashenvale Outrunners to attack him."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27031] = {"Destroy the Legion",{{45982}},nil,nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27032] = {"Destroy the Legion",{{45983}},{{45983}},nil,30,nil,nil,{"Kill demon forces"},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27034] = {"Never Again!",nil,{{45982}},nil,30,nil,nil,{"Slay Gorgannon and Diathorus the Seeker in Ashenvale."},nil,{{{17300,"Gorgannon"},{6072,"Diathorus the Seeker"}}},nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27036] = {"Never Again!",{{45983}},{{45983}},nil,30,nil,nil,{"Kill Gorgannon and Diathorus the Seeker"},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27037] = {"Direct Reprisal",nil,{{45976}},nil,27,nil,nil,{"Slay Lady Sarevess."},nil,{{{4831,"Lady Sarevess"}}},nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27038] = {"Forsaken Looters",nil,{{3663}},nil,20,nil,nil,{"Kill 5 Forsaken Scouts, 5 Forsaken Herbalists and 10 Forsaken Assassins."},nil,{{{3893,5,"Forsaken Scout"},{3733,5,"Forsaken Herbalist"},{3879,10,"Forsaken Assassin"}}},nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27039] = {"Practical Science",{{45981}},{{12696}},nil,25,nil,1,{"Complete the practical science task."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27040] = {"Practical Science",{{45984}},{{45984}},nil,25,nil,1,{"Test the Vile Concoction on 5 targets."},nil,{nil,nil,nil,nil,nil,{{1,"Vile Concoction Tested",5}}},nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27041] = {"Practical Science",{{45984}},{{45984}},nil,26,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27042] = {"Improved Swiftness Potion",{{45986}},{{45986}},nil,26,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27043] = {"Ethical Quandary",{{45985}},{{45984}},nil,26,nil,1,{"Complete the ethical task."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27044] = {"The Experiment's Conclusion",nil,{{45981}},nil,27,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27045] = {"Rumbles Of The Earth",{{45990}},{{45990}},nil,23,nil,nil,{"Question 6 Peons about the rumbling earth."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27047] = {"Rumbles of the Earth",nil,nil,nil,23,nil,1,{"Collect Sturdy Reed and Glass Shards."},nil,{nil,nil,{{63078,6,"Sturdy Reed"},{63079,4,"Glass Shards"}}},nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27048] = {"Rumbles Of The Earth",nil,nil,nil,23,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27049] = {"Rumbles Of The Earth",{{45990}},{{45981}},nil,23,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27050] = {"Rumbles Of The Earth",nil,{{45990}},nil,23,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27051] = {"Rumbles Of The Earth",{{45990}},{{45990}},nil,23,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27052] = {"Rumbles Of The Earth",nil,{{45995}},nil,25,nil,1,{"Investigate the source of earth tremors in Stonetalon Mountains."},nil,{{{14192,1,"Source of tremors investigated"}}},nil,nil,nil,nil,nil,nil,406,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27053] = {"Solarsal Report",nil,{{45734}},nil,27,nil,nil,{"Bring the report to someone in Astranaar."},nil,nil,nil,nil,nil,nil,nil,nil,11,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27055] = {"Heart of the Ancient",nil,{{12696}},nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27056] = {"Return to Thrall",{{3338}},{{4949}},nil,15,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,1637,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27057] = {"Waves in the Ether",{{4949}},{{5910}},nil,15,nil,1,{"Report to Zankaja in Orgrimmar."},nil,nil,nil,nil,nil,nil,nil,nil,1637,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27058] = {"Waves in the Ether",{{45982}},nil,nil,15,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,1637,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27061] = {"Waves in the Ether",nil,{{45982}},nil,17,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27063] = {"The New Demon Seed",{{4949}},{{45982}},nil,29,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27064] = {"The New Demon Seed",{{45982}},{{45982}},nil,29,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27065] = {"The New Demon Seed",{{45982}},{{45982}},nil,29,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27067] = {"Trip to Shadowprey",nil,nil,nil,31,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27074] = {"Demonic Intruders",{{46009}},nil,nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27075] = {"[Epoch] Quest 27075",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27076] = {"Descendants of Exiles",nil,nil,nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27077] = {"Distilling Slime",{{46008}},{{8586}},nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27080] = {"[Epoch] Quest 27080",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27081] = {"How to Make Friends with a Furbolg",{{46012}},{{8420}},nil,52,nil,nil,{"Learn how to befriend the furbolg."},nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27082] = {"How to Make Friends with a Furbolg",nil,{{46012}},nil,52,nil,nil,{"Complete the first four steps with the furbolg."},nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27083] = {"[Epoch] Quest 27083",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27084] = {"[Epoch] Quest 27084",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27091] = {"Azshara's Legacy",nil,{{46008}},nil,54,nil,nil,{"Discover Azshara's Legacy."},nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27092] = {"Azshara's Legacy",{{46006}},{{46008}},nil,54,nil,nil,{"Collect 12 Makrinni Lobstrok Eyes."},nil,{nil,nil,{{62959,"Makrinni Lobstrok Eye",12}}},nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27093] = {"Azshara's Legacy",{{8395}},{{8379}},nil,54,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27094] = {"Azshara's Legacy",nil,{{46019}},nil,54,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27097] = {"Message for Wobble Hollow",{{46011}},{{7406}},nil,48,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27103] = {"For the Warchief's Honor!",{{47191}},{{47191}},nil,47,nil,nil,{"Kill 15 Alliance forces"},nil,nil,nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27104] = {"Report to Scout Dura",nil,{{8479}},nil,48,nil,1,{"Report to Scout Dura at the forward camp in Searing Gorge."},nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27106] = {"The Gnoll Stronghold",{{240}},{{240}},nil,15,nil,nil,{"Clear gnoll stronghold"},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27107] = {"Noble Relations",{{46085}},{{928}},nil,25,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27114] = {"[Epoch] Quest 27114",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27115] = {"[Epoch] Quest 27115",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27116] = {"[Epoch] Quest 27116",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27126] = {"[Epoch] Quest 27126",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27127] = {"[Epoch] Quest 27127",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27128] = {"Venomous Conclusions",{{1265}},{{1265}},nil,14,nil,nil,{"Collect 10 Winter Wolf Pelts"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27129] = {"[Epoch] Quest 27129",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27130] = {"The Furbolg - Goblin Trade Network",{{3945}},{{45206}},nil,52,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27131] = {"[Epoch] Quest 27131",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27132] = {"The Furbolg - Goblin Trade Network",nil,{{46025}},nil,52,nil,nil,{"Talk to Trader Mallu at Blackmaw Village."},nil,nil,nil,nil,nil,nil,nil,nil,618,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27133] = {"King Magni's Secret",{{2784}},{{1274}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1537,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27136] = {"[Epoch] Quest 27136",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27137] = {"The Horizon Scout",nil,{{8478}},nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27141] = {"[Epoch] Quest 27141",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27143] = {"The Timbermaw Alliance",nil,nil,nil,52,nil,nil,{"Form an alliance with the Timbermaw."},nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27151] = {"[Epoch] Quest 27151",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27152] = {"[Epoch] Quest 27152",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27153] = {"[Epoch] Quest 27153",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27155] = {"Threats to Valormok",{{48179}},{{48180}},nil,50,nil,nil,{"Kill Spitelash enemies"},nil,nil,nil,nil,nil,nil,nil,nil,16,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27160] = {"Valormok Mine Reports",{{8576}},{{8576}},nil,48,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27161] = {"Whistle While You Work",{{8576}},{{8576}},nil,48,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27162] = {"Valormok Report to Orgrimmar",nil,{{4949}},nil,48,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27163] = {"[Epoch] Quest 27163",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27164] = {"[Epoch] Quest 27164",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27165] = {"Burning Blade Signets",{{3429}},{{3429}},nil,11,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27166] = {"Consumed by Hatred",{{3432}},{{3432}},nil,14,nil,nil,{"Collect 10 Kolkar Heads."},nil,{nil,nil,{{63039,"Kolkar Head",10}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27167] = {"Foreign Technology",nil,{{3478}},nil,19,nil,1,{"Obtain the Cognation Reconstructor."},nil,{nil,nil,{{63043,"Cognation Reconstructor"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27168] = {"Finding the Clues",{{3432}},{{3432}},nil,14,nil,nil,{"Search for clues about Mankrik's wife in the Barrens."},nil,{nil,{{188623,"First Clue"},{188624,"Second Clue"},{188625,"Third Clue"}}},nil,nil,nil,{27169},nil,nil,17,nil,nil,nil,nil,27169,1,0,nil,nil,nil,nil,nil,nil},
[27169] = {"Searching the Wreckage",{{3432}},{{3432}},nil,15,nil,1,{"Find Mankrik's Village."},nil,{{{60577,"Find Mankrik's Village"}}},nil,nil,{27168},{27170},nil,nil,17,nil,nil,nil,nil,27170,1,0,27168,nil,nil,nil,nil,nil},
[27170] = {"Out of My Hands",nil,{{46057}},nil,15,nil,1,{"Report to Shin'Zil."},nil,nil,nil,nil,{27169},{27171},nil,nil,17,nil,nil,nil,nil,27171,1,0,27169,nil,nil,nil,nil,nil},
[27171] = {"Retrieving the Orb",{{46057}},{{46057}},nil,18,nil,1,{"Obtain Korgar's Orb."},nil,{nil,nil,{{63047,1,"Korgar's Orb"}}},nil,nil,{27170},{27172},nil,nil,17,nil,nil,nil,nil,27172,1,0,27170,nil,nil,nil,nil,nil},
[27172] = {"Infusing the Orb",{{48110}},{{46057}},nil,18,nil,1,{"Siphon 5 Essence of Lightning."},nil,{nil,nil,{{62345,5,"Essence of Lightning"}}},nil,nil,{27171},{27173},nil,nil,17,nil,nil,nil,nil,27173,1,0,27171,nil,nil,nil,nil,nil},
[27173] = {"Report to Mankrik",{{46057}},{{3432}},nil,18,nil,1,nil,nil,nil,nil,nil,{27172},nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,27172,nil,nil,nil,nil,nil},
[27174] = {"Finding Nadia",{{3432}},{{5770}},nil,20,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27175] = {"Opening the Cage",{{3432}},{{45205}},nil,20,nil,1,{"Rescue Nadia."},nil,{{{60578,"Rescue Nadia"}}},nil,nil,{27174},{27176},nil,nil,17,nil,nil,nil,nil,27176,1,0,27174,nil,nil,nil,nil,nil},
[27176] = {"The Good News",{{45205}},{{3432}},nil,21,nil,1,{"Return to Mankrik."},nil,nil,nil,nil,{27175},nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,27175,nil,nil,nil,nil,nil},
[27177] = {"Operation: Northwatch Hold",{{46061}},{{3391}},nil,20,nil,1,{"Collect Crate of Assorted Armor."},nil,{nil,nil,{{63050,1,"Crate of Assorted Armor"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27195] = {"Straight to the Teeth",{{46065}},{{46065}},nil,18,nil,nil,{"Collect 10 Hecklefang Teeth."},nil,nil,nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27196] = {"The Kolkar Report",nil,nil,nil,15,nil,nil,{"Bring Kolkar Report to Thork at The Crossroads."},nil,nil,nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27197] = {"The Merchant's Daughter",{{7161}},{{7161}},nil,17,nil,nil,{"Obtain Box of Treasure."},nil,{nil,nil,{{63070,"Box of Treasure"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27198] = {"The Missing Lorespeakers",nil,nil,nil,22,nil,1,{"Collect 8 Tauren Lore Scrolls"},nil,{nil,nil,{{63092,8,"Tauren Lore Scrolls"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27200] = {"Shadow Priest's Task",nil,nil,nil,20,nil,nil,{"Complete the Shadow Priest's task."},nil,nil,nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27201] = {"The Triad Scrolls",{{46066}},{{46066}},nil,30,nil,1,{"Collect The Triad: Founding of Thunder Bluff, Founding of Camp Mojache, and Founding of Sun Rock Retreat."},nil,{nil,nil,{{63082,1,"Founding of Thunder Bluff"},{63083,1,"Founding of Camp Mojache"},{63084,1,"Founding of Sun Rock Retreat"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27203] = {"The Obsidian Relic",nil,{{4201}},nil,22,nil,1,{"Return the Obsidian Relic to Ziz Fizziks."},nil,nil,nil,nil,nil,nil,nil,nil,406,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27204] = {"WANTED: Deepskin",nil,nil,nil,14,nil,1,{"Kill Deepskin."},nil,{{{60874,"Deepskin"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27205] = {"My Sister Isabetta",nil,{{3616}},nil,14,nil,nil,{"Find information about Isabetta."},nil,nil,nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27206] = {"My Sister Isabetta",{{46067}},{{3666}},nil,14,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27207] = {"My Sister Isabetta",nil,nil,nil,14,nil,2,{"Travel to Westfall and tell Evangeline Wheeland about the fire and Isabetta Wheeland's death."},nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27208] = {"My Sister Isabetta",nil,nil,nil,15,nil,2,{"Kill Omar Dorn and get the Defias Key."},nil,{{{46069,"Omar Dorn"}},nil,{{63084,"Defias Key"}}},nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27209] = {"My Sister Isabetta",{{46068}},nil,nil,16,nil,2,{"Find the Birth Certificate."},nil,{nil,nil,{{63085,"Birth Certificate"}}},nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27210] = {"A Hidden Record",{{46068}},{{1646}},nil,16,nil,2,{"Bring Evangeline's Note to Baros Alexton at Cathedral Square in Stormwind."},nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27211] = {"A Hidden Record",{{1646}},{{10782}},nil,16,nil,2,{"Bring the Birth Certificate to Royal Factor Bathrilor in Stormwind."},nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27212] = {"A Hidden Record",nil,nil,nil,16,nil,2,{"Report to Captain Morgan."},nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27217] = {"Auntie VanCleef",nil,{{311}},nil,20,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27219] = {"Auntie VanCleef",nil,{{777}},nil,25,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27220] = {"Auntie VanCleef",nil,{{46071}},nil,25,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27222] = {"Lost But Not Forgotten",nil,{{1646}},nil,25,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27223] = {"Personal Possessions",{{46076}},{{46076}},nil,18,nil,2,{"Collect Everit's Canteen, Everit's Notebook, Everit's Lantern, and Everit's Laundry."},nil,{nil,nil,{{63093,1,"Everit's Canteen"},{63094,1,"Everit's Notebook"},{63095,1,"Everit's Lantern"},{63096,1,"Everit's Laundry"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27224] = {"Rampaging Golems",{{46076}},{{46076}},nil,18,nil,2,{"Slay 6 Golems."},nil,{{{60570,6,"Golem"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27225] = {"The Ersotta Stone",{{6250}},{{3979}},nil,16,nil,2,{"Take the strange stone to the Hall of Explorers in Ironforge."},nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27226] = {"The Ersotta Stone",nil,{{1073}},nil,16,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27227] = {"The Storeta Stone",{{2913}},{{2913}},nil,20,nil,2,{"Collect 10 Storeta Fragments."},nil,{nil,nil,{{63100,10,"Storeta Fragment"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27230] = {"A Gnome in Need",{{45613}},{{45613}},nil,31,nil,nil,{"Collect an Undelivered Letter from a Burning Blade Courier."},nil,{nil,nil,{{63106,1,"Undelivered Letter"}}},nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27237] = {"An End To Dread",{{46083}},{{11438}},nil,37,nil,nil,{"End the dread threat in the swamp."},nil,nil,nil,nil,nil,nil,nil,nil,38,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27238] = {"An Imp's Bidding",{{46000}},{{46000}},nil,31,nil,nil,{"Slay 1 monster and collect Demonic Sextant."},nil,{nil,nil,{{63113,"Demonic Sextant"}}},nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27243] = {"Crazed Carrion",{{46086}},{{46086}},nil,36,nil,nil,{"Deal with the crazed carrion birds."},nil,nil,nil,nil,nil,nil,nil,nil,38,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27244] = {"Drysnap Delicacy",nil,{{8152}},nil,35,nil,1,{"Collect 10 Oversized Drysnap Claws."},nil,{nil,nil,{{63116,10,"Oversized Drysnap Claw"}}},nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27247] = {"Gloombreak Mesa",{{4046}},{{4489}},nil,30,nil,1,{"Take the Tablet of the Earth to Kai'li Grimtotem at Gloombreak Mesa in Desolace."},nil,nil,nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27248] = {"A Message for Ghostwalker Post",nil,{{10428}},nil,30,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27253] = {"Massive Profits",nil,nil,nil,39,nil,nil,{"Collect 3 Fossilised Gallbladders."},nil,{nil,nil,{{63117,3,"Fossilised Gallbladder"}}},nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27254] = {"Reagents For The Undercity",{{46090}},{{46090}},nil,33,nil,nil,{"Collect 10 Hatefury Claws and 10 Hatefury Horns for Annie Grim."},nil,{nil,nil,{{6246,10,"Hatefury Claw"},{6247,10,"Hatefury Horn"}}},nil,nil,nil,{27255},nil,nil,405,nil,nil,nil,nil,27255,8,0,nil,nil,nil,nil,nil,nil},
[27255] = {"Reagents For The Undercity",{{46090}},{{5641}},nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27256] = {"Reagents For The Undercity",{{46090}},{{46000}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27261] = {"Pleading To Return",{{46093}},nil,nil,38,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27262] = {"The Freshest Oil",{{46094}},nil,nil,36,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27266] = {"A Touch of Lightning",{{46099}},nil,nil,10,nil,nil,{"Siphon 5 Essence of Lightning."},nil,{nil,nil,{{60558,5,"Essence of Lightning"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27267] = {"A Village In Need",nil,nil,nil,4,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27268] = {"Delivery to Vornal",nil,{{3304}},nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27273] = {"Sha'gri",nil,nil,nil,9,nil,nil,{"Slay the Spirit of Sha'gri."},nil,{{{60561,"Spirit of Sha'gri"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27274] = {"The Cursed Fleet",{{3139}},{{3188}},nil,8,nil,1,{"Slay 8 Kul Tiras Deckhands and 3 Kul Tiras Admirals."},nil,{{{46104,8,"Kul Tiras Deckhand"},{46103,3,"Kul Tiras Admiral"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27275] = {"WANTED: Dustpaw",nil,{{11378}},nil,6,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27276] = {"Supervisor Hink",nil,{{3230}},nil,9,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27277] = {"Scythemaw Standstill",nil,nil,nil,9,nil,nil,{"Slay 10 Bloodtalon Scythemaw."},nil,{{{3123,10,"Bloodtalon Scythemaw"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27282] = {"Wanted: Dragon Killers",nil,{{2502}},nil,39,nil,2,{"Eliminate the dragon killers."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27291] = {"Wanted: King Krool",{{4500}},nil,nil,41,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27293] = {"The Downed Zeppelin",nil,{{46121}},nil,40,nil,1,{"Interact with the Gizmorium Shipping Crate."},nil,nil,nil,nil,nil,nil,nil,nil,8,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27298] = {"Sniffotron MK IV",nil,{{7564}},nil,41,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27299] = {"Sniff Him Out",{{46121}},nil,nil,41,nil,nil,{"Follow the Sniffotron MK IV to find Beezil."},nil,{{{60003,"Follow the Sniffotron MK IV"}}},nil,nil,nil,nil,nil,nil,15,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27300] = {"Beezil And The Burning Blade",{{46120}},{{46121}},nil,41,nil,nil,{"Report to Cys Craftcharge after speaking with Beezil Linkspanner."},nil,nil,nil,nil,nil,nil,nil,nil,15,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27302] = {"Burning Blade Dossier",{{46121}},{{46123}},nil,41,nil,nil,{"Bring Cys Craftcharge's Report to Watcher Wallace in Theramore."},nil,nil,nil,nil,nil,nil,nil,nil,15,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27303] = {"Containing the Contamination",{{10924}},nil,nil,51,nil,nil,{"Obtain Damaged Water Purifier."},nil,nil,nil,nil,nil,nil,nil,nil,361,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27304] = {"Containing the Contamination",{{10924}},nil,nil,53,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27306] = {"The Garden of Jadefire Glen",{{10920}},nil,nil,50,nil,nil,{"Collect Kelek's Weeder","Collect Kelek's Trowel","Collect Kelek's Bucket"},nil,nil,nil,nil,nil,nil,nil,nil,361,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27307] = {"The Shrine of the Deceiver",nil,nil,nil,52,nil,nil,{"Investigate the Shrine of the Deceiver."},nil,nil,nil,nil,nil,nil,nil,nil,361,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27309] = {"Mementos of the Third War",{{46127}},{{46127}},nil,52,nil,nil,{"Take Box of Grisly Mementos to Thrall in Orgrimmar."},nil,nil,nil,nil,nil,nil,nil,nil,361,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27312] = {"Gordunni Thieves",{{8145}},{{7875}},nil,44,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27313] = {"Meat!",{{46129}},nil,nil,43,nil,2,{"Collect 6 Ironfur Meat and 6 Ape Meat."},nil,{nil,nil,{{63182,6,"Ironfur Meat"},{63183,6,"Ape Meat"}}},nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27314] = {"Freedom for All Creatures",{{46130}},{{46130}},nil,47,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27315] = {"Doling Justice",{{46131}},{{46131}},nil,47,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27316] = {"Doling Justice",{{46131}},{{7807}},nil,47,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27322] = {"Convincing the Denied",nil,{{46135}},nil,49,nil,nil,{"Convince those in denial."},nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27323] = {"A Reflection of Death",nil,{{46135}},nil,49,nil,nil,{"Face your mortality."},nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27324] = {"Dead and Gone",nil,{{46135}},nil,49,nil,nil,{"Lay the dead to rest."},nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27325] = {"Dental Records",nil,{{46135}},nil,49,nil,nil,{"Collect dental records."},nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27326] = {"Dental Records",{{46135}},{{46135}},nil,49,nil,nil,{"Collect dental records."},nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27327] = {"Dental Records",{{46135}},{{46135}},nil,49,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27328] = {"Dental Records",nil,{{46135}},nil,49,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27329] = {"Dental Records",nil,{{46135}},nil,49,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27330] = {"Dental Records",nil,{{46135}},nil,49,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27331] = {"Curious Groddoc",nil,{{46135}},nil,49,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27332] = {"Curious Groddoc",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27333] = {"Facing Oneself",nil,{{46135}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27334] = {"Facing Oneself",nil,{{46135}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27335] = {"Wanted: Lost Ancient",{{46129}},{{45211}},nil,48,nil,nil,{"Hunt the Lost Ancient."},nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27339] = {"Grimtotem Encroachment",{{2980}},{{2980}},nil,4,nil,nil,{"Slay 4 Grimtotem Skirmishers and 4 Grimtotem Hectors."},nil,{{{46152,4,"Grimtotem Skirmisher"},{46151,4,"Grimtotem Hector"}}},nil,nil,nil,nil,nil,nil,215,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27351] = {"The Lost Calf",{{6776}},{{3233}},nil,9,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27354] = {"Wanted: Jasone",nil,{{2987}},nil,10,nil,1,{"Kill Jasone and bring his head to Eyahn Eagletalon."},nil,{{{46161,"Jasone"}},nil,{{63218,1,"Head of Jasone"}}},nil,nil,nil,nil,nil,nil,88,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27365] = {"Champion of Thunderaan",{{11805}},{{11805}},nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27370] = {"Avenging What, Exactly?",{{46165}},{{46165}},nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27392] = {"Gratitude Of The Expedition",{{46165}},{{46165}},nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27397] = {"A Trip to the Vale",{{12043}},{{4198}},nil,27,nil,nil,{"Collect Charred Wood and Basilisk Tail."},nil,{nil,nil,{{63244,nil,"Charred Wood"},{63245,nil,"Basilisk Tail"}}},nil,nil,nil,nil,nil,nil,406,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27398] = {"Attack on the Mine",{{4082}},{{4082}},nil,22,nil,nil,{"Slay 5 Windshear Geomancers","Slay 5 Windshear Overlords","Slay 10 Windshear Diggers"},nil,{{{4003,5,"Windshear Geomancer"},{4004,5,"Windshear Overlord"},{3999,10,"Windshear Digger"}}},nil,nil,nil,nil,nil,nil,406,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27400] = {"Mirkfallon Bracers",nil,{{11864}},nil,23,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27403] = {"Rumbles Of The Earth",nil,{{45995}},nil,26,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27404] = {"Rumbles Of The Earth",nil,{{45995}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27406] = {"Rumbles Of The Earth",nil,{{45995}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27407] = {"Rumbles Of The Earth",nil,{{4949}},nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27408] = {"[Epoch] Quest 27408",nil,nil,nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,0,nil,nil,nil,nil,nil,nil},
[27409] = {"Twilight Fangs",{{5870}},{{5870}},nil,24,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27417] = {"Vengeance for the Light",nil,nil,nil,44,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27418] = {"Another Blow to the Horde",nil,nil,nil,45,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27419] = {"In Pursuit of the Foolish",nil,nil,nil,46,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27420] = {"Two-Legged Vultures",{{7771}},{{7771}},nil,45,nil,nil,{"Collect Marvon's Pocket Watch, Marvon's Brimmed Hat, and Marvon's Ham Radio."},nil,{nil,nil,{{63284,1,"Marvon's Pocket Watch"},{63285,1,"Marvon's Brimmed Hat"},{63286,1,"Marvon's Ham Radio"}}},nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27421] = {"Honor Among Thieves",nil,nil,nil,48,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27422] = {"No One Drinks For Free",{{7882}},{{7882}},nil,41,nil,nil,{"Threaten 4 tardy bar patrons: Miki Smallsprocket, Inabit Wedgefeet, Stelx, and Gikkix."},nil,{{{45532,"Miki Smallsprocket threatened"},{45526,"Inabit Wedgefeet threatened"},{45536,"Stelx threatened"},{8137,"Gikkix threatened"}}},nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27423] = {"The Zandalari Threat",nil,nil,nil,50,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27426] = {"Shadra the Venom Queen",nil,nil,nil,50,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
[27427] = {"Silithid Scramble",{{46198}},nil,nil,48,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27428] = {"The Lost Tablets",nil,nil,nil,48,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27429] = {"Ancient Power",nil,nil,nil,49,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27430] = {"The Spider God's Blessing",nil,nil,nil,50,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27431] = {"Summoning Shadra",nil,nil,nil,50,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27439] = {"The Warchief's Command",nil,nil,nil,50,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27441] = {"Mind Blown",nil,{{46221}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27442] = {"A Hive Cleared",nil,{{46221}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27443] = {"Azeroth Space Society",{{46228}},{{46120}},nil,41,nil,nil,{"Deliver Kranz's message to Beezil Linkspanner in Dustwallow Marsh."},nil,nil,nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27444] = {"Aerie Peak's Last Stand",nil,nil,nil,47,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27451] = {"Lorespeaker Vanza",nil,{{1443}},nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27452] = {"Dead Message",{{46233}},{{46234}},nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27453] = {"Dead Message",{{46234}},{{46233}},nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27458] = {"The Search for the Tomb",nil,{{46233}},nil,46,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27460] = {"Quel'Danil Assistance",nil,nil,nil,44,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[27462] = {"Waste Removal",nil,{{46237}},nil,42,nil,2,{"Oil Spills Removed: 6/6"},nil,{nil,nil,nil,nil,nil,{{1,"Oil Spills Removed",6}}},nil,nil,nil,nil,nil,nil,440,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27463] = {"Warden's Summons",nil,nil,nil,52,nil,nil,{"Answer the Warden's summons."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27470] = {"Razorbeak Friends",nil,nil,nil,45,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27477] = {"Attack on the Gnarlpine",nil,nil,nil,8,nil,nil,{"Slay 4 Gnarlpine Ambushers","Slay 4 Gnarlpine Warriors","Slay 4 Gnarlpine Defenders","Slay 4 Gnarlpine Shamans"},nil,{{{2151,4,"Gnarlpine Ambusher"},{2013,4,"Gnarlpine Warrior"},{2010,4,"Gnarlpine Defender"},{2009,4,"Gnarlpine Shaman"}}},nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27478] = {"Attack on the Gnarlpine",{{6781}},{{6781}},nil,9,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27479] = {"Bloodfeather Eggs",{{3606}},{{3606}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27480] = {"Corruption in Shadowglen",{{46257}},{{46257}},nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27483] = {"Demons In Fel Rock",nil,{{3610}},nil,6,nil,nil,{"Investigate demon activity in Fel Rock."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27484] = {"Purifying the Essence",nil,{{3610},nil},6,6,nil,nil,{"Collect 1 Purified Essence"},nil,{nil,nil,{{63354,1}},nil,nil,nil},nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,0,0,nil,nil,nil,nil,nil,nil},
[27485] = {"Herbal Medicine",{{3604}},{{3604}},nil,8,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27486] = {"Amber Memento",{{46260}},{{46261}},nil,35,nil,1,{"Solve the mystery of the amber memento."},nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27487] = {"Gathering Of Spirits",{{46261}},nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27488] = {"Bad News Has Horns",{{4048}},{{4048}},nil,28,nil,nil,{"Collect 3 Secret Notes from Thousand Needles."},nil,{nil,nil,{{12765,"Secret Note #1"},{12766,"Secret Note #2"},{12768,"Secret Note #3"}}},nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27489] = {"Canyon Patrol",{{10428}},{{10428}},nil,27,nil,nil,{"Kill 8 Pesterhide Hyenas."},nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27490] = {"Crag Stalking",nil,nil,nil,27,nil,nil,{"Complete crag stalking objectives."},nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27491] = {"Driving License Approval",{{46265}},nil,nil,35,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27492] = {"Fresh Water Delivery",nil,{{4630}},nil,31,nil,nil,{"Dispense 10 water."},nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27494] = {"Earthen Delight",{{46268}},nil,nil,32,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27495] = {"Serpent's Bite",nil,nil,nil,26,nil,1,{"Collect 8 Deadly Venom Glands"},nil,{nil,nil,{{63080,8,"Deadly Venom Glands"}}},nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27496] = {"Feed the Fire",{{46270}},nil,nil,34,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27497] = {"Striking Back At The Galak",{{10638}},{{10638}},nil,28,nil,1,{"Collect Blizh's Head"},nil,{nil,nil,{{63081,1,"Blizh's Head"}}},nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27498] = {"Khan Ablinh",{{10537}},{{10428}},nil,29,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27499] = {"Help The Help Help Others",{{46273}},nil,nil,32,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,400,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[27500] = {"The Sacred Flame",{{4048}},{{4048}},nil,27,nil,nil,{"Scout the centaur artifact location at the Cloven Hoof."},nil,nil,nil,nil,nil,{27501},nil,nil,400,nil,nil,nil,nil,27501,8,0,nil,nil,nil,nil,nil,nil},
[27503] = {"Why Oh Wyvern",{{11826}},nil,nil,28,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27504] = {"Kristy's Delivery Service",nil,nil,nil,30,nil,nil,{"Complete Kristy's delivery service."},nil,nil,nil,nil,nil,nil,nil,nil,405,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27508] = {"Research Salvation",nil,{{9270}},nil,51,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27509] = {"The Un'Goro Hunt",{{46278}},{{46278}},nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27510] = {"The Un'Goro Hunt",nil,{{46278}},nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27517] = {"Storm, Earth, Wind, and Fire",{{45143}},{{10302}},nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27518] = {"Storm, Earth, Wind, and Fire",{{45143}},{{45143}},nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27521] = {"Storm, Earth, Wind, and Fire",nil,nil,nil,54,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27533] = {"One of These Things is Not Like the Others",nil,{{46287}},nil,52,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27544] = {"A Gift for the Spiritseer",nil,nil,nil,56,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27545] = {"A Door to the Past",nil,nil,nil,56,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27575] = {"Nightmare Seeds",nil,nil,nil,58,nil,nil,{"Discover the Odor's Source and collect 8 Nightmare Seeds."},nil,nil,nil,nil,nil,nil,nil,nil,618,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27580] = {"Shadow of the Vilehorn",nil,nil,nil,58,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27623] = {"Commission for Locke Okarr",{{45982}},nil,nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27630] = {"Commission for Thunderheart",nil,{{5411}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27659] = {"Commission for High Chief Ungarl",nil,{{5385}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,19,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27665] = {"Commission for Deathguard Simmer",nil,{{1495}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27682] = {"Commission for Rok Orhan",{{7777}},{{7777}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27882] = {"Battle of Warsong Gulch",nil,nil,nil,21,nil,nil,{"Win the Battle of Warsong Gulch."},nil,nil,nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27883] = {"Battle of Warsong Gulch",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil},
[27890] = {"A Matter of Life and Death",{{10880}},nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27891] = {"A Matter of Life and Death",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27898] = {"A Sign in the Stars",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27899] = {"A Sign in the Stars",{{4721}},nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27921] = {"Aponi's Request",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27922] = {"Troubling Rumors",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27927] = {"Memories of Honor and Blood",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[27941] = {"Crafted from Crawlers",nil,{{7867}},nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[27961] = {"The Shatterspear Festival",{{10879}},nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1497,nil,nil,nil,nil,nil,nil,2,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [27962] = {"The Shatterspear Festival",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28049] = {"The Rite of the Wilds",nil,nil,nil,56,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28063] = {"Commission for Tomas",nil,nil,nil,5,nil,2,{"Collect 10 Brilliant Smallfish."},nil,{nil,nil,{{6291,10,"Brilliant Smallfish"}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28064] = {"Commission for Gubber Blump",{{10216}},{{10216}},nil,10,nil,2,{"Collect 10 Boiled Clams for Gubber Blump."},nil,{nil,nil,{{5525,10,"Boiled Clam"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28072] = {"Commission for Captain Steelgut",nil,{{2769}},nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28073] = {"Commission for Captain Hecklebury Smotts",{{48167}},{{48167}},nil,30,nil,nil,{"Complete Captain Hecklebury Smotts' commission."},nil,nil,nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
[28075] = {"Commission for Simone Cantrell",nil,{{45527}},nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28077] = {"Commission for Dirk Windrattle",{{45604}},{{45604}},nil,40,nil,nil,{"Bring 10 Dragonbreath Chili to Dirk Windrattle at Springsocket."},nil,{nil,nil,{{12217,10}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28080] = {"Commission for Larhka",nil,{{5871}},nil,10,nil,nil,{"Collect 10 Boiled Clams."},nil,{nil,nil,{{5525,10,"Boiled Clams"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28082] = {"Commission for Karang Amakkar",{{12757}},{{12757}},nil,10,nil,1,{"Collect 10 Crab Cake."},nil,{nil,nil,{{2683,10,"Crab Cake"}}},nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28083] = {"Commission for Kirge Sternhorn",{{3418}},{{3418}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28086] = {"Commission for Deathstalker Lesh",nil,{{12837}},nil,20,nil,1,{"Collect 10 Goblin Deviled Clams."},nil,{nil,nil,{{5527,10,"Goblin Deviled Clam"}}},nil,nil,nil,nil,nil,nil,331,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28350] = {"Commission for Marshal Haggard",{{5484}},{{14033}},nil,25,nil,nil,{"Deliver the commission to Marshal Haggard at Eastvale Logging Camp."},nil,nil,nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28366] = {"The Rite of the Medicant",nil,nil,nil,60,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28401] = {"Commission for Lorekeeper Raintotem",{{11071}},{{2121}},nil,10,nil,nil,{"Collect Enchanted Guardian's Bracers and deliver to Shadow Priest Allister."},nil,{nil,nil,{{65368,nil,"Enchanted Guardian's Bracers"}}},nil,nil,nil,nil,nil,nil,1638,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28402] = {"Commission for Magatha Grimtotem",{{11071}},{{4046}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28403] = {"Commission for Constance Brisboise",nil,nil,nil,1,nil,nil,{"[Needs data collection]"},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28404] = {"Commission for Merril Wendyl",nil,{{45505}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28409] = {"Commission for Sage Elkhoof",{{3418}},{{3447}},nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28410] = {"Commission for Gann Stonespire",nil,{{46056}},nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28413] = {"Commission for Hagar Lightninghoof",nil,{{2216}},nil,30,nil,1,{"Obtain Staff of Affinity."},nil,{nil,nil,{{2880,1,"Staff of Affinity"}}},nil,nil,nil,nil,nil,nil,267,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28460] = {"Commission for Blusht",{{3433}},{{46330}},nil,20,nil,nil,{"Collect 5 Practice Lock."},nil,{nil,nil,{{6712,5,"Practice Lock"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28462] = {"Commission for Tok'Kar",{{8176}},nil,nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28475] = {"[Epoch] Quest 28475",nil,nil,nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28476] = {"Commission for Watcher Dodds",nil,nil,nil,20,nil,nil,{"Commission quest for Watcher Dodds."},nil,nil,nil,nil,nil,nil,nil,nil,10,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28482] = {"Commission for Gavik Grimesail",{{45336}},nil,nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28483] = {"[Epoch] Quest 28483",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28487] = {"Commission for Rane Yorick",{{1500}},{{1518}},nil,10,nil,nil,{"Collect 3 Linen Bandage, Collect 1 Wool Bandage"},nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28489] = {"Commission for Kaliyah Stormshew",{{46065}},{{5767}},nil,20,nil,1,{"Collect 20 Wool Bandages."},nil,{nil,nil,{{3530,20,"Wool Bandage"}}},nil,nil,nil,nil,nil,nil,17,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28495] = {"Commission for Protector Gariel",{{490}},nil,nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,40,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28497] = {"Commission for Warg Deepwater",{{1683}},{{1683}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28500] = {"Commission for Old Man Heming",{{2626}},{{2626}},nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28501] = {"[Epoch] Quest 28501",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28513] = {"Commission for Killian Sanatha",nil,{{5748}},nil,5,nil,1,{"Collect 20 Raw Slitherskin Mackerel."},nil,{nil,nil,{{6303,20,"Raw Slitherskin Mackerel"}}},nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28516] = {"Commission for Wik'Tar",{{12962}},nil,nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28519] = {"Commission for Alanna Raveneye",nil,{{2078}},nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28520] = {"The Tortured Spirit",{{46644}},{{46644}},nil,8,nil,nil,{"Collect 5 Lesser Mana Potion from murlocs"},nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28521] = {"Commission for Lornan Goldleaf",{{6887}},nil,nil,20,nil,nil,{"Collect 20 Briarthorn for Lornan Goldleaf."},nil,{nil,nil,{{2450,20,"Briarthorn"}}},nil,nil,nil,nil,nil,nil,148,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28526] = {"Commission for Lorna Stonebrand",nil,{{47042}},nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28530] = {"Commission for Indon Cliffreach",{{45549}},nil,nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28531] = {"Commission for Logannas",{{8157}},{{8157}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28535] = {"Commission for Joakim Sparkroot",{{45575}},{{45575}},nil,50,nil,nil,{"Bring 20 Purple Lotus to Joakim Sparkroot."},nil,{nil,nil,{{8831,20}}},nil,nil,nil,nil,nil,nil,3,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28539] = {"Commission for Taskmaster Scrange",{{14626}},{{14626}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28548] = {"Commission for Je'neu Sancrea",nil,nil,nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28561] = {"Commission for Grif Wildheart",{{1466}},{{1231}},nil,10,nil,nil,{"Collect 2 Small Leather Ammo Pouch."},nil,{[7279]={2,nil,{[1]={{44.9,46.7}}}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28562] = {"Commission for Jeena Featherbow",{{3605}},{{3610}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28563] = {"Commission for Chief Archaeologist Greywhisker",{{3605}},{{2912}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28564] = {"Commission for Scout Galiaan",nil,nil,nil,20,nil,2,{"Collect 2 Dark Leather Boots."},nil,{nil,nil,{{2317,2,"Dark Leather Boots"}}},nil,nil,nil,nil,nil,nil,12,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28565] = {"Commission for Protector Evangeline",nil,{{45712}},nil,20,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28570] = {"Commission for Kaela Shadowspear",{{46181}},{{11756}},nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28573] = {"Commission for Verner Osgood",{{2697}},{{2697}},nil,30,nil,nil,{"Complete Verner Osgood's commission."},nil,nil,nil,nil,nil,nil,nil,nil,36,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
[28574] = {"Commission for Einar Stonegrip",nil,{{482}},nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28576] = {"Commission for Bibbly F'utzbuckle",{{8150}},{{11438}},nil,40,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28584] = {"Commission for Rokar Bladeshadow",{{5811}},{{6446}},nil,10,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28591] = {"[Epoch] Quest 28591",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28592] = {"[Epoch] Quest 28592",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28593] = {"[Epoch] Quest 28593",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28609] = {"Commission for Radnaal Maneweaver",{{6287}},{{6287}},nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28614] = {"Commission for Skuerto",nil,{{2789}},nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28617] = {"Commission for Bibbly F'utzbuckle",{{11438}},{{11438}},nil,30,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28619] = {"Lair of the Abyssal",nil,nil,nil,48,nil,2,{"Enter the Lair of the Abyssal."},nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28620] = {"The Hermit's Wisdom",nil,nil,nil,48,nil,2,{"Seek the hermit's wisdom."},nil,nil,nil,nil,nil,nil,nil,nil,357,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28623] = {"Commission for Master Smith Burninate",{{14624}},nil,nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28626] = {"Commission for Deathguard Linnea",{{1495}},{{1495}},nil,5,nil,1,{"Collect 20 Light Leather."},nil,{nil,nil,{{2318,20,"Light Leather"}}},nil,nil,nil,nil,nil,nil,85,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28634] = {"Commission for Yarr Hammerstone",{{1256}},nil,nil,5,nil,nil,{"Collect 20 Rough Stone."},nil,{nil,nil,{{2835,20,"Rough Stone"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28647] = {"Commission for Strumner Flintheel",nil,{{14634}},nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,51,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28648] = {"[Epoch] Quest 28648",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28654] = {"Commission for Kelek Skykeeper",{{10920}},nil,nil,50,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1519,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28657] = {"Nature's Balance",nil,nil,nil,15,nil,nil,{"Restore nature's balance."},nil,nil,nil,nil,nil,nil,nil,nil,141,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28660] = {"Commission for Sebastian Meloche",{{3555}},nil,nil,5,nil,1,{"Collect 5 Silver Bars."},nil,{nil,nil,{{2842,5,"Silver Bar"}}},nil,nil,nil,nil,nil,nil,130,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28675] = {"Commission for Veron Amberstill",nil,nil,nil,10,nil,3,{"Collect 2 Linen Bags."},nil,{nil,nil,{{4238,2,"Linen Bag"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
[28676] = {"Commission for Marleth Barleybrew",{{1703}},nil,nil,10,nil,3,{"Collect 1 Heavy Linen Gloves."},nil,{nil,nil,{{5633,1,"Heavy Linen Gloves"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,3,0,nil,nil,nil,nil,nil,nil},
[28722] = {"The Darkspear Tribe",{{46834}},{{46834}},nil,1,nil,nil,{"Report to the Darkspear tribe."},nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28723] = {"Thievin' Crabs",{{46834}},{{46718}},nil,2,nil,nil,{"Slay 10 Amethyst Crabs."},nil,{{{46835,10,"Amethyst Crab"}}},nil,nil,{28722},nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28725] = {"Shift into G.E.A.R.",{{46836}},{{46836}},nil,1,nil,nil,{"Kill 10 Underfed Troggs."},nil,{{{46837,10,"Underfed Trogg"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28726] = {"A Refugee's Quandary",{{47084}},{{47084}},nil,3,nil,nil,{"Help the refugee with their problem."},nil,{{{46900,5,"Frostmane Troll Scout"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28727] = {"Aid to the Refugees",{{47085}},{{47086}},nil,4,nil,nil,{"Provide aid to the displaced refugees."},nil,{nil,nil,{{60300,8,"Medical Supplies"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28728] = {"Glyphic Tablet",{{46718}},{{5884}},nil,1,nil,128,{"Deliver the Glyphic Tablet."},nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28729] = {"Guard Duty",{{47087}},{{47087}},nil,5,nil,nil,{"Assist the Guard Captain with patrol duties."},nil,{{{46901,6,"Trogg Invader"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28730] = {"Securing the Perimeter",{{47087}},{{47087}},nil,5,nil,nil,{"Help secure the area perimeter."},nil,{{{190001,"Inspect North Watchtower"},{190002,"Inspect East Watchtower"},{190003,"Inspect South Watchtower"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28731] = {"Orders from Command",{{47090}},{{47090}},nil,5,nil,nil,{"Deliver orders from the command center."},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28732] = {"Strategic Reconnaissance",{{47091}},{{47091}},nil,5,nil,nil,{"Conduct reconnaissance of the area."},nil,{{{190004,"Scout the Frozen Lake"},{190005,"Scout the Eastern Approach"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28733] = {"Supply Run",{{47091}},{{47091}},nil,5,nil,nil,{"Gather necessary supplies for the operation."},nil,{nil,nil,{{60301,10,"Emergency Rations"},{60302,6,"Warm Blanket"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28734] = {"Engineering Solutions",{{47092}},{{47093}},nil,5,nil,nil,{"Deliver engineering plans to Hands Springsprocket."},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28739] = {"Azsharan Idols",{{46934}},nil,3,4,nil,nil,{"Collect 3 idols."},nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28740] = {"Tainted Tablet",nil,{{46934}},nil,1,nil,nil,{"Read Tainted Tablet and speak to Uwa."},nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28743] = {"A Tradesman's Tools",{{1104}},{{1104}},nil,3,nil,nil,{"Retrieve the tradesman's tools."},nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,1,0,nil,nil,nil,nil,nil,nil},
[28747] = {"Emergency Supplies",{{47084}},{{47085}},nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28748] = {"Emergency Supplies",{{47085}},{{47086}},nil,4,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28749] = {"Frostmane Grotto",{{47087}},nil,nil,4,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28750] = {"Return of the King",nil,nil,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28751] = {"Recovery Work",nil,nil,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28752] = {"Your Seat Awaits",nil,nil,nil,1,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28753] = {"Island Troll-kin",nil,nil,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28754] = {"Troll Skull Poker",nil,nil,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28755] = {"Smoked Boar Meat",nil,nil,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28756] = {"Missing Quest 28756",nil,nil,nil,2,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28757] = {"Banana Bonanza",{{46718}},{{47100}},nil,3,nil,nil,{"Gather bananas."},nil,{nil,nil,{{60200,10,"Sun-Ripened Banana"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28758] = {"Shell Collection",{{47100}},{{47100}},3,4,nil,nil,{"Collect shells."},nil,{nil,nil,{{60201,8,"Conch Shell"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28759] = {"Claws of the Cat",{{47101}},{{47101}},nil,3,nil,nil,{"Obtain cat claws."},nil,{nil,nil,{{5635,10,"Sharp Claw"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28760] = {"Jinxed Trolls",{{47103}},{{47103}},3,4,nil,nil,{"Remove the jinx from trolls."},nil,{{{47104,5,"Jinxed Troll Cleansed"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28761] = {"Source of the Jinx",nil,nil,nil,3,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28762] = {"Report to Master Gadrin",nil,nil,nil,4,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28763] = {"Report to Razor Hill",nil,nil,nil,4,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28764] = {"The Loa of Death",{{47106}},{{47106}},4,5,nil,nil,{"Commune with the Loa of Death."},nil,{{{4001003,"Commune with Shrine of Sha'gri"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28765] = {"Tidal Menace",{{47101}},{{47101}},3,4,nil,nil,{"Stop the tidal menace."},nil,{{{47105,"Tidal Lurker"}}},nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28766] = {"Pouch of Strange Shells",nil,nil,nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
-- DISABLED FOR DATA COLLECTION - Missing starter AND finisher NPCs
-- [28767] = {"The Naga Menace",nil,nil,nil,5,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,14,nil,nil,nil,nil,nil,nil,0,nil,nil,nil,nil,nil,nil},
[28768] = {"Fel Elf Slayer",{{46295}},{{46295}},nil,60,nil,nil,{"Kill the Fel Elf Slayer."},nil,{{{46390,nil}}},nil,nil,nil,nil,nil,nil,33,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28902] = {"No Room for Sympathy",{{46836}},{{46836}},nil,2,nil,nil,{"Kill 8 Irradiated Oozes and 4 Infected Gnomes."},nil,{{{46839,8,"Irradiated Ooze"},{46838,4,"Infected Gnome"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28903] = {"Encrypted Memorandum",{{46836}},{{46882}},nil,1,nil,nil,{"Read the Encrypted Memorandum then speak to Windle Fusespring at G.E.A.R. in Dun Morogh."},nil,nil,nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28905] = {"Into the Scarlet Enclave",{{28945}},{{28945}},nil,58,nil,nil,{"Travel to the Scarlet Enclave in Eastern Plaguelands and kill 12 Scarlet mobs."},nil,{{{25584,12,"Scarlet mobs"}}},nil,nil,nil,nil,nil,nil,139,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
[28906] = {"A Sticky Situation",{{4782}},{{4782}},nil,48,nil,2,{"Collect 10 Hinterlands Honey Ripple for Truk Wildbeard."},nil,{nil,nil,{{8684,10,"Hinterlands Honey Ripple"}}},nil,nil,nil,nil,nil,nil,47,nil,nil,nil,nil,nil,2,0,nil,nil,nil,nil,nil,nil},
[28940] = {"Guard the Refugees",{{47087}},{{47087}},nil,5,nil,nil,{"Protect the refugee camp from threats."},nil,{{{46902,4,"Frostmane Raider"}}},nil,nil,nil,nil,nil,nil,1,nil,nil,nil,nil,nil,8,0,nil,nil,nil,nil,nil,nil},
}

-- Stage the Epoch questData for later merge during compilation
QuestieDB._epochQuestData = epochQuestData
