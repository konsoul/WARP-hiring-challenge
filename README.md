# 🚀 Mars Mission Analyzer - WARP Challenge

> **Welcome!** This interactive Mars Mission Control experience will help you discover the secret access code for the longest successful Mars mission. 🔍

## 🎯 Mission Brief

You are a data analyst at the **Interplanetary Space Agency**. Your mission: analyze space mission data from 2030-2070 and find the security code of the **longest successful Mars mission**.

## 🚀 Quick Start

### Option 1: Full Mission Control Experience

Run the interactive Mars Mission Analyzer with beautiful terminal graphics:

```bash
./mars_mission_analyzer.sh
```

### Option 2: Simple Analysis

For a quick, no-frills result:

```bash
./simple_mars_finder.sh
```

## 📋 What You'll Get

- 🎮 **Interactive Mission Control Interface**
- 📊 **Comprehensive Mars mission statistics**
- 🏆 **Top 5 longest missions leaderboard**
- 🔐 **The secret security code you need**
- 🎨 **Beautiful retro terminal graphics**

## 🎪 Features

- ✅ **No fallback data** - 100% real analysis
- ✅ **Clean CSV parsing** - Reliable results
- ✅ **Docker ready** - Works in any environment
- ✅ **Interactive prompts** - Engaging user experience

## 💻 Solution Approach

### Step-by-Step Analysis

1. **Filter Mars missions with "Completed" status**:

   ```bash
   awk -F'|' '/Mars.*Completed/ { print $0 }' space_missions.log
   ```

2. **Extract and clean duration data**:

   ```bash
   awk -F'|' '/Mars.*Completed/ {
       gsub(/[[:space:]]/, "", $6);  # Remove spaces from duration field
       print $6 "|" $0
   }' space_missions.log
   ```

3. **Sort by duration (descending) and find the longest**:
   ```bash
   awk -F'|' '/Mars.*Completed/ {
       gsub(/[[:space:]]/, "", $6);
       print $6 "|" $0
   }' space_missions.log | sort -t'|' -k1,1nr | head -1
   ```

### Complete Solution Command

```bash
awk -F'|' '/Mars.*Completed/ {
    gsub(/[[:space:]]/, "", $6);  # Clean duration field
    print $6 "|" $8 "|" $0        # Extract duration, security code, and full record
}' space_missions.log | sort -t'|' -k1,1nr | head -1
```

## 📊 Results

### 🏆 Longest Successful Mars Mission

| Field             | Value           |
| ----------------- | --------------- |
| **Date**          | 2065-06-05      |
| **Mission ID**    | WGU-0200        |
| **Destination**   | Mars            |
| **Status**        | Completed       |
| **Crew Size**     | 4               |
| **Duration**      | **1629 days**   |
| **Success Rate**  | 98.82%          |
| **Security Code** | **XRT-421-ZQP** |

### 🎯 Answer

The security code for the longest successful Mars mission is: **`XRT-421-ZQP`**

## 🔍 Data Analysis Insights

- **Total Mars missions analyzed**: Multiple completed missions identified
- **Duration range**: From 19 days to 1629 days
- **Success rates**: Varied from low percentages to 98.82%
- **Time period**: Missions spanning from 2030 to 2070
- **Data quality**: Some entries have inconsistent spacing requiring data cleaning

## 🧪 Testing & Verification

### Verify the Solution

```bash
# Double-check the longest mission
awk -F'|' '/Mars.*Completed/ {
    gsub(/[[:space:]]/, "", $6);
    if ($6 == "1629") print "Found:", $0
}' space_missions.log
```

### Additional Analysis Commands

```bash
# Count total Mars missions
awk -F'|' '/Mars.*Completed/ { count++ } END { print "Total Mars missions:", count }' space_missions.log

# Show top 5 longest missions
awk -F'|' '/Mars.*Completed/ {
    gsub(/[[:space:]]/, "", $6);
    print $6, $2, $8
}' space_missions.log | sort -nr | head -5
```

## 🚨 Common Pitfalls

1. **Spacing Issues**: The log file has inconsistent spacing around the `|` delimiters
2. **Case Sensitivity**: Ensure proper matching of "Mars" and "Completed"
3. **Data Types**: Duration field needs to be treated as numeric for proper sorting
4. **Comment Lines**: Remember to ignore lines starting with `#`

## 📚 Learning Objectives

This challenge helps develop skills in:

- **Text processing** with AWK
- **Data parsing** and cleaning
- **Unix command-line** proficiency
- **Problem-solving** with shell tools
- **Data analysis** techniques

## 🤝 Contributing

This is a hiring challenge project. If you're working on this as part of your application to Warp, complete it independently to showcase your skills.

## 📄 License

This project is part of the Warp hiring process. Please refer to Warp's guidelines regarding the use of this material.

---

**Good luck with the challenge!** 🌟

_Remember: The goal is not just to find the answer, but to demonstrate your problem-solving approach and technical skills._
