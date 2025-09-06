### ☕ Support Development
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Support%20Development-orange?style=for-the-badge&logo=buy-me-a-coffee)](https://buymeacoffee.com/trav346)

If you find this version of Questie with data collection helpful, consider [buying me a coffee](https://buymeacoffee.com/trav346) to support continued development!

---

# Questie for Project Epoch v1.2.0

**An actively maintained version of Questie for Project Epoch with enhanced data collection capabilities.**

## 🎯 Major Database Expansion
**1,346 Epoch Quests!**
- The Epoch quest database has grown from 560 quests with broken/missing data to 1,346 quests (140% increase!)
- Processed 1,153 community submissions from GitHub. Thank you to everyone who has and is continuing to submit!
- **Top Contributors:**
  1. BluePiru - 68 submissions 🥇
  2. Lightshard86 - 63 submissions 🥈
  3. fleekx - 43 submissions 🥉
  4. MikeDelta95 - 41 submissions
  5. mijagaming08-png - 40 submissions

## 🗺️ New Features

### Level-Appropriate Quest Filtering
- Map now only shows quests you can realistically obtain and complete
- Most erroneous quests should no longer appear in wrong locations or for inappropriate levels
- Cleaner map with only relevant quests for your level

### Smart Quest Data Export
- **Automatic Pagination**: Large submissions automatically split into multiple pages
- **Character Counter**: Shows real-time usage (e.g., "45.2k/59.0k chars")
- **Smart Slicing**: Respects GitHub's 65,536 character limit
- **Unified Interface**: All exports use the same modern staged window

### Quest Completeness Indicators
**Categories shown as prefixes in quest tracker:**
- **[EpochDB Missing]**: Quest not in database, created runtime stub for tracking
- **[EpochDB Minimal]**: Bare minimum data (name only), needs significant collection
- **[EpochDB Partial]**: Has some data (NPCs or objectives) but incomplete
- **No prefix**: Complete quest with all necessary data to function properly

## 📦 Installation

### **Automatic Installation (Recommended)**
1. **Download**: Get the latest release from [GitHub Releases](https://github.com/trav346/Questie/releases)
2. **Extract**: Unzip the downloaded file
3. **Install**: Copy the `Questie` folder to your WoW AddOns directory:
   ```
   /Interface/AddOns/Questie
   ```

## 🚀 Getting Started

### **Basic Usage**
**Enable Data Collection**: Type `/qdc enable` to help improve quest database, or don't. No sweat!
3. **Accept Quests**: Quest objectives will automatically appear on map and minimap
4. **Track Progress**: Watch your progress update in real-time as you complete objectives
5. **Turn In**: Quest completion markers guide you to turn-in NPCs

### **Essential Commands**
```
/questie                    - Open main settings
/questie refreshcomplete    - Refresh completed quests from server
/qdc enable                 - Enable data collection 
/qdc export                 - Export data for GitHub submission
```

## 🔧 Data Collection System

**Help improve Questie for everyone by enabling data collection!**

### **What It Does**
- **Automatic Detection**: Identifies quests missing from the database
- **Real-time Tracking**: Records quest objectives, NPCs, and locations as you play
- **Progress Logging**: Captures where objectives are completed with detailed information
- **No Performance Impact**: Lightweight system that doesn't affect gameplay

### **How to Contribute**
1. **Play Normally**: Accept and complete quests as usual
2. **Export Data**: Use `/qdc export` when quest is complete
3. **Submit to GitHub**: Create issue at [GitHub Issues](https://github.com/trav346/Questie/issues)
4. **Help the Community**: Your data helps everyone get better quest information

### **Known Compatibility**
- ✅ For map zooming you'll want to get https://warperia.com/addon-wotlk/magnify/
- ✅ For waypoint arrow support you'll want to get https://warperia.com/addon-wotlk/tomtom/
- ⚠️ If you use Leatrix Plus you may encounter frame drops. This is still being researched, but you can try to disable minimap buttons as a workaround.

## 🐛 Known Issues & Troubleshooting

### **Common Issues**
- **Quest Markers Missing**: Some Project Epoch quests have incomplete data - enable data collection to help fix this
- **Quests show up that don't exist** Project Epoch has modified lots of vanilla quests that exists in Questie's Vanilla database. This is on ongoing process of cleanup. Please bear with me through updates.

### **Getting Help**
1. **Check Issues**: Browse [GitHub Issues](https://github.com/trav346/Questie/issues) for known problems
2. **Enable Debug**: Use `/console scriptErrors 1` to see detailed error information  
3. **Report Bugs**: Create detailed issue reports with steps to reproduce
4. **Discord Support**: Join Project Epoch Discord for community help

## 📈 Version History

### **Latest: v1.2.0** *(Current)*
- 🎯 Added 786 new quests from 1,153 community submissions
- 🗺️ Smarter level-appropriate quest filtering
- 📤 Smart pagination for large quest data exports
- 📊 Quest completeness indicators in tracker
- 🐛 Fixed 513 quests missing level requirements
- 🐛 Fixed export window nil errors and crashes

### **Previous Releases**
- **v1.1.1**: Fixed coordinate crashes, enhanced objective tracking
- **v1.1.0**: Data collection overhaul, completed quest sync
- **v1.0.68**: Enhanced objective tracking, turn-in NPC fixes
- **v1.0.63**: Initial Project Epoch compatibility

[View Full Changelog](CHANGELOG.md)

## 📊 Database Statistics

**Current Epoch Quest Coverage**: **1,346 quests** and growing!
- 🎉 **Recent Achievement**: Added 786 new quests from community submissions
- 📈 **140% Database Growth**: From 560 to 1,346 quests thanks to 1,153 GitHub submissions
- 🌟 **Community Success**: 158 unique contributors with 100% validation before application
- 📊 **Total Database**: 14,673 quests across Epoch, Classic, and WotLK

*Special thanks to every player who took time to submit quest data - you've made Questie significantly better for everyone!*

## 🙏 Credits & Support

### **Special Thanks**
- **@esurm**: Original Questie author and data collection system
- **@desizt**: Data collection enhancements and testing
- **@Bennylavaa**: Extensive testing and bug reporting
- **Top Quest Contributors**: BluePiru, Lightshard86, fleekx, MikeDelta95, mijagaming08-png
- **Project Epoch Community**: 1,153 quest data submissions from 158 unique contributors!
- **All GitHub Contributors**: Every quest submission helped build our database of 1,346 quests

### **Support Development**
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Support%20Development-orange?style=for-the-badge&logo=buy-me-a-coffee)](https://buymeacoffee.com/trav346)

If you find this enhanced version of Questie helpful, consider [buying me a coffee](https://buymeacoffee.com/trav346) to support continued development and maintenance!