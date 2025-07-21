# 🚀 WARP Hiring Challenge

## 📋 Project Overview

This repository contains a programming challenge designed for candidates applying to Warp Terminal. The challenge involves analyzing complex space mission log data to extract specific insights using command-line tools and shell scripting.

> **Note**: Participation in this challenge is optional. You can still submit an application to Warp without completing it, but it's a great way to showcase your technical skills!

## 🏗️ Project Structure

```
WARP-hiring-challenge/
├── README.md                 # This file - project overview and documentation
├── mission_challenge.md      # Detailed challenge instructions and requirements
├── mars_mission_analyzer.sh  # Comprehensive analysis script with beautiful output
└── space_missions.log        # Mission data file (2030-2070 space missions)
```

## 🛠️ Tech Stack & Tools

- **Primary Language**: Shell scripting (Bash/Zsh)
- **Data Processing**: AWK (GNU AWK recommended)
- **Utilities**: Standard Unix command-line tools
  - `sort` - For data ordering
  - `grep` - For pattern matching
  - `head`/`tail` - For data sampling
- **Environment**: Unix-like system (macOS, Linux, WSL)

## 🎯 Challenge Description

### Mission Objective

You are a data analyst at the **Interplanetary Space Agency**. Your task is to analyze a complex log file containing data about thousands of space missions conducted between 2030 and 2070.

**Goal**: Find the security code of the **longest successful Mars mission** in the database.

### Data Format

The log file contains mission records with the following structure:

```
Date | Mission ID | Destination | Status | Crew Size | Duration (days) | Success Rate | Security Code
```

### Example Entry

```
2045-07-12 | KLM-1234 | Mars | Completed | 5 | 387 | 98.7 | TRX-842-YHG
```

### Important Constraints

- Only consider missions with **"Completed"** status
- Target destination must be **"Mars"**
- Duration is measured in **days**
- File contains commented lines (starting with #) that should be ignored
- Field separators may have inconsistent spacing

## 🔧 Setup Instructions

### Prerequisites

Ensure you have access to a Unix-based environment with the following tools:

- `awk` (GNU AWK preferred)
- `sort`
- `grep`
- Standard shell utilities

### Getting Started

1. **Clone or download** this repository
2. **Navigate** to the project directory:
   ```bash
   cd WARP-hiring-challenge
   ```
3. **Verify** the data file exists:
   ```bash
   ls -la space_missions.log
   ```
4. **Test** your environment:
   ```bash
   awk --version
   ```

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
