#!/bin/bash

# Simple Space Mission Log Analysis
# Find the security code of the longest successful Mars mission

echo "Analyzing space missions data..."

# Use AWK to find the longest Mars mission with Completed status
# CSV fields: Date,Mission_ID,Destination,Status,Crew_Size,Duration_Days,Success_Rate,Security_Code
RESULT=$(awk -F',' '
BEGIN { 
    max_duration = 0
    security_code = ""
}
NR>1 && $3=="Mars" && $4=="Completed" {
    duration = $6
    if (duration > max_duration) {
        max_duration = duration
        security_code = $8
        mission_id = $2
        date = $1
    }
}
END { 
    if (security_code != "") {
        print "Longest Mars mission: " mission_id " (" date ") - " max_duration " days"
        print "Security Code: " security_code
    } else {
        print "No completed Mars missions found"
    }
}' space_missions_clean.csv)

echo "$RESULT"
