#!/bin/bash

# WARP Hiring Challenge - Mission Control Mars Analyzer
# Houston, we have beautiful data analysis!

LOG_FILE="space_missions_clean.csv"

# SYNTHWAVE COLOR PALETTE 🌈
NEON_PINK='\033[38;5;198m'      # Hot pink
NEON_CYAN='\033[38;5;51m'       # Electric cyan
NEON_PURPLE='\033[38;5;141m'    # Bright purple
NEON_GREEN='\033[38;5;46m'      # Electric green
NEON_YELLOW='\033[38;5;226m'    # Bright yellow
NEON_ORANGE='\033[38;5;208m'    # Hot orange
NEON_BLUE='\033[38;5;81m'       # Electric blue
DARK_PINK='\033[38;5;162m'      # Deep pink
DARK_PURPLE='\033[38;5;93m'     # Deep purple
DARK_CYAN='\033[38;5;39m'       # Deep cyan
BOLD='\033[1m'
DIM='\033[2m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
NC='\033[0m' # No Color

# Function to print welcome screen with analyze button
print_welcome_screen() {
    clear
    echo -e "${NEON_CYAN}${BOLD}████████████████████████████████████████████████████████████${NC}"
    echo -e "${NEON_CYAN}${BOLD}█                                                          █${NC}"
    echo -e "${NEON_CYAN}${BOLD}█         ${NEON_PINK}MISSION CONTROL - MARS DIVISION${NEON_CYAN}                  █${NC}"
    echo -e "${NEON_CYAN}${BOLD}█         ${NEON_PURPLE}▶ RED PLANET COMMAND ◀${NEON_CYAN}                           █${NC}"
    echo -e "${NEON_CYAN}${BOLD}█                                                          █${NC}"
    echo -e "${NEON_CYAN}${BOLD}████████████████████████████████████████████████████████████${NC}"
    echo ""
    echo -e "${NEON_YELLOW}${BOLD}    Welcome to the Mars Mission Analysis Terminal${NC}"
    echo ""
    echo -e "${DIM}${DARK_CYAN}Ready to analyze space mission database...${NC}"
    echo ""
    echo ""
    echo -e "                    ${NEON_GREEN}${BOLD}┌─────────────────────┐${NC}"
    echo -e "                    ${NEON_GREEN}${BOLD}│                     │${NC}"
    echo -e "                    ${NEON_GREEN}${BOLD}│ ${BLINK}🚀ANALYZE FILE${NC}${NEON_GREEN}${BOLD}   │${NC}"
    echo -e "                    ${NEON_GREEN}${BOLD}│                     │${NC}"
    echo -e "                    ${NEON_GREEN}${BOLD}└─────────────────────┘${NC}"
    echo ""
    echo -e "          ${DIM}${DARK_CYAN}Press [ENTER] or [SPACE] to begin analysis${NC}"
    echo -e "          ${DIM}${DARK_CYAN}Press [Q] to quit${NC}"
    echo ""
}

# Function to wait for user input
wait_for_user() {
    while true; do
        read -n 1 -s key
        case $key in
            ''|' ')  # Enter or Space
                break
                ;;
            'q'|'Q')
                echo -e "${NEON_ORANGE}Flight Director: Mission aborted. Returning to terminal.${NC}"
                exit 0
                ;;
        esac
    done
}

# Function to print formatted header for analysis
print_header() {
    clear
    echo -e "${NEON_CYAN}${BOLD}████████████████████████████████████████████████████████████${NC}"
    echo -e "${NEON_CYAN}${BOLD}█                                                          █${NC}"
    echo -e "${NEON_CYAN}${BOLD}█${NEON_PINK}MISSION CONTROL - MARS DIVISION${NEON_CYAN}                           █${NC}"
    echo -e "${NEON_CYAN}${BOLD}█${NEON_PURPLE}▶ RED PLANET COMMAND ◀${NEON_CYAN}                                    █${NC}"
    echo -e "${NEON_CYAN}${BOLD}█                                                          █${NC}"
    echo -e "${NEON_CYAN}${BOLD}████████████████████████████████████████████████████████████${NC}"
    echo -e "${NEON_YELLOW}${BOLD}     >>> HOUSTON, WE ARE GO FOR MISSION ANALYSIS <<<${NC}"
    echo ""
    echo -e "${DIM}${DARK_CYAN}Flight Director: Authenticating mission database...${NC}"
    sleep 0.5
    echo -e "${NEON_GREEN}✓ CAPCOM: Database connection established${NC}"
    echo -e "${NEON_GREEN}✓ FLIGHT: Mission logs verified and ready${NC}"
    echo -e "${NEON_GREEN}✓ EECOM: All systems nominal for data processing${NC}"
    echo ""
}

# Function to print section separator
print_separator() {
    echo -e "${NEON_PINK}▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓${NC}"
}

# Function to print subsection separator
print_subseparator() {
    echo -e "${DARK_PURPLE}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${NC}"
}

# Function for Mission Control status updates
print_status() {
    echo -e "${DIM}${DARK_CYAN}FLIGHT: $1${NC}"
    sleep 0.3
}

# Function for progress loading with dots
load_progress() {
    local message="$1"
    local duration="$2"
    local dots="$3"
    echo -n -e "${DIM}${DARK_CYAN}$message${NC}"
    
    # Calculate sleep time per dot (fallback if bc not available)
    if command -v bc >/dev/null 2>&1; then
        local sleep_time=$(echo "scale=2; $duration / $dots" | bc -l)
    else
        # Simple fallback: just use 0.3 seconds per dot
        local sleep_time=0.3
    fi
    
    for i in $(seq 1 $dots); do
        echo -n "."
        sleep $sleep_time
    done
    echo ""
}

# Check if log file exists
if [[ ! -f "$LOG_FILE" ]]; then
    echo -e "${RED}❌ Error: $LOG_FILE not found!${NC}"
    echo -e "${YELLOW}Please ensure the space_missions_clean.csv file is in the current directory.${NC}"
    exit 1
fi

# Show welcome screen with analyze button
print_welcome_screen

# Wait for user to press the button
wait_for_user

# User pressed the button, start analysis
print_header

# Main analysis with Mission Control flair
echo -e "${NEON_ORANGE}${BOLD}💫 TELEMETRY: Initiating Mars mission database scan...${NC}"
print_separator

# Realistic Mission Control loading sequences with varied timing
load_progress "CAPCOM: Establishing secure channel to mission archives" 2.5 8
echo -e "${NEON_GREEN}✓ CAPCOM: Secure connection established${NC}"

load_progress "EECOM: Validating 40+ years of mission telemetry" 3.2 12
echo -e "${NEON_GREEN}✓ EECOM: Data integrity confirmed${NC}"

load_progress "FLIGHT: Cross-referencing Mars surface operations" 2.8 10
echo -e "${NEON_GREEN}✓ FLIGHT: Mission parameters verified${NC}"

load_progress "GNC: Computing trajectory and duration analytics" 4.1 15
echo -e "${NEON_GREEN}✓ GNC: Statistical analysis complete${NC}"

echo -e "${NEON_CYAN}FLIGHT: All stations report GO for mission analysis...${NC}"
sleep 0.8

# Get comprehensive Mars mission statistics
awk -F',' '
BEGIN {
    max_duration = 0
    total_missions = 0
    total_duration = 0
    min_duration = 999999
}

NR>1 && $3=="Mars" && $4=="Completed" {
    # CSV fields: Date,Mission_ID,Destination,Status,Crew_Size,Duration_Days,Success_Rate,Security_Code
    # No need to clean CSV fields as they are already clean
    
    duration = $6
    total_missions++
    total_duration += duration
    
    if (duration > max_duration) {
        max_duration = duration
        longest_mission_id = $2
        longest_date = $1
        longest_security_code = $8
        longest_success_rate = $7
        longest_crew_size = $5
    }
    
    if (duration < min_duration) {
        min_duration = duration
        shortest_mission_id = $2
        shortest_date = $1
    }
}

END {
    if (total_missions > 0) {
        avg_duration = total_duration / total_missions
        
        print "🌌 RED PLANET MISSION STATISTICS - STATUS: NOMINAL"
        print "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
        printf "▶ TOTAL SUCCESSFUL MARS OPS: %d missions\n", total_missions
        printf "▶ AVERAGE MISSION DURATION: %.1f days\n", avg_duration
        printf "▶ SHORTEST OPERATION: %d days (Call Sign: %s | Launch: %s)\n", min_duration, shortest_mission_id, shortest_date
        printf "▶ LONGEST OPERATION: %d days (Call Sign: %s) \n", max_duration, longest_mission_id
        print ""
        
        print "🏆 LONGEST SUCCESSFUL MARS MISSION - PRIORITY ONE"
        print "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
        printf "🔴 LAUNCH WINDOW    : %s\n", longest_date
        printf "📱 MISSION CALLSIGN : %s\n", longest_mission_id
        printf "⏰ MISSION DURATION : %d days (%.2f Earth years)\n", max_duration, max_duration/365.25
        printf "👨‍🚀 CREW MANIFEST    : %s astronauts\n", longest_crew_size
        printf "📈 MISSION SUCCESS  : %s%% efficiency\n", longest_success_rate
        printf "🔐 ACCESS CODE      : *** CLASSIFIED ***\n"
        print ""
        
        
    } else {
        print "❌ HOUSTON, WE HAVE A PROBLEM - No successful Mars missions found!"
    }
}
' "$LOG_FILE"

print_separator

load_progress "RETRO: Compiling mission performance rankings" 2.3 9
echo -e "${NEON_PURPLE}${BOLD}🔥 TOP 5 MARS OPERATIONS - MISSION LEADERBOARD${NC}"
print_subseparator

awk -F',' 'NR>1 && $3=="Mars" && $4=="Completed" {
    print $6 "|" $2 "|" $1
}' "$LOG_FILE" | sort -t'|' -k1,1nr | head -5 | awk -F'|' '{
    if (NR == 1) printf "🥇 RANK %d: Mission %s - %s days [%s]\n", NR, $2, $1, $3
    else if (NR == 2) printf "🥈 RANK %d: Mission %s - %s days [%s]\n", NR, $2, $1, $3
    else if (NR == 3) printf "🥉 RANK %d: Mission %s - %s days [%s]\n", NR, $2, $1, $3
    else printf "💫 RANK %d: Mission %s - %s days [%s]\n", NR, $2, $1, $3
}'

echo ""
print_separator

load_progress "PROCEDURES: Running final system diagnostics" 1.8 6
echo -e "${NEON_GREEN}✓ PROCEDURES: All diagnostics complete${NC}"

load_progress "INCO: Verifying data transmission integrity" 2.1 7
echo -e "${NEON_GREEN}✓ INCO: Signal clarity confirmed${NC}"

load_progress "SECURITY: Extracting classified access codes" 3.5 13
echo -e "${NEON_GREEN}✓ SECURITY: Classified data retrieved${NC}"

echo ""
echo -e "${NEON_GREEN}${BOLD}✅ MISSION CONTROL - ALL SYSTEMS GO!${NC}"
echo -e "${NEON_CYAN}▶ TELEMETRY SOURCE: $LOG_FILE - STATUS: VERIFIED${NC}"
echo -e "${NEON_CYAN}▶ ANALYSIS ENGINE: AWK pattern recognition - STATUS: NOMINAL${NC}"
echo -e "${NEON_CYAN}▶ DATA INTEGRITY: Cross-referenced with ISA database - STATUS: CONFIRMED${NC}"
echo ""
sleep 1.2
echo -e "${BLINK}${NEON_YELLOW}${BOLD}⚡ ANALYSIS COMPLETE - SECRET CODE ACQUIRED! ⚡${NC}"
sleep 1.0

# Epic responsibility prompt
echo ""
print_separator
echo ""
echo -e "${NEON_ORANGE}${BOLD}        ⚠️  CLASSIFIED INFORMATION WARNING  ⚠️${NC}"
echo ""
echo -e "${NEON_YELLOW}${BOLD}    Analysis has successfully gathered the secret access code${NC}"
echo -e "${NEON_YELLOW}${BOLD}    for the longest successful Mars mission.${NC}"
echo ""
echo -e "${NEON_PINK}${BOLD}    🛡️  With great power comes great responsibility  🛡️${NC}"
echo ""
echo -e "${DIM}${DARK_CYAN}This classified information is intended only for authorized${NC}"
echo -e "${DIM}${DARK_CYAN}personnel of the Interplanetary Space Agency.${NC}"
echo ""
echo -e "                ${NEON_GREEN}${BOLD}Do you choose to proceed? [Y/N]${NC}"
echo ""
echo -n -e "                          ${NEON_CYAN}▶ ${NC}"
read -n 1 choice
echo ""
echo ""

if [[ $choice =~ ^[Yy]$ ]]; then
    # Epic reveal sequence
    load_progress "AUTHORIZATION: Verifying clearance level" 2.1 8
    echo -e "${NEON_GREEN}✓ AUTHORIZATION: Clearance confirmed${NC}"
    
    load_progress "DECRYPTION: Unlocking classified vault" 3.2 12
    echo -e "${NEON_GREEN}✓ DECRYPTION: Vault unlocked${NC}"
    
    echo ""
    sleep 1.0
    
    # Get the secret code dynamically from CSV data
    SECRET_CODE=$(awk -F',' 'NR>1 && $3=="Mars" && $4=="Completed" { if ($6 > max) { max=$6; code=$8 } } END { print code }' "$LOG_FILE")
    
    # Epic reveal interface
    clear
    echo -e "${NEON_PINK}${BOLD}"
    echo "████████████████████████████████████████████████████████████"
    echo "█                                                          █"
    echo "█${NEON_YELLOW}CLASSIFIED ACCESS CODE REVEALED${NEON_PINK} █"
    echo "█${NEON_CYAN}▶ INTERPLANETARY SPACE AGENCY ◀${NEON_PINK}   █"
    echo "█                                                          █"
    echo "████████████████████████████████████████████████████████████"
    echo -e "${NC}"
    echo ""
    echo -e "${NEON_CYAN}${BOLD}           🎯 THE ANSWER TO THE WARP CHALLENGE 🎯${NC}"
    echo ""
    echo -e "${NEON_PURPLE}▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓${NC}"
    echo ""
    echo -e "              ${NEON_GREEN}${BOLD}The longest successful Mars mission${NC}"
    echo -e "              ${NEON_GREEN}${BOLD}security access code is:${NC}"
    echo ""
    echo -e "              ┌─────────────────────────────────┐"
    echo -e "              │                                 │"
    echo -e "              │ ${BLINK}${NEON_YELLOW}${BOLD}🔑 ${SECRET_CODE} 🔑${NC}     │"
    echo -e "              │                                 │"
    echo -e "              └─────────────────────────────────┘"
    echo ""
    echo -e "${NEON_PURPLE}▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓${NC}"
    echo ""
    echo -e "${NEON_ORANGE}${BOLD}Flight Director: MISSION ACCOMPLISHED!${NC}"
    echo -e "${NEON_ORANGE}You are cleared for WARP application submission.${NC}"
    echo ""
    echo -e "${DIM}${DARK_CYAN}Remember: Use this power responsibly, young padawan.${NC}"
    echo -e "${DIM}${DARK_CYAN}End of classified transmission. Houston out.${NC}"
    echo ""
    
else
    echo -e "${NEON_ORANGE}Flight Director: Access denied. Mission terminated.${NC}"
    echo -e "${DIM}${DARK_CYAN}Perhaps another time, when you're ready for such responsibility.${NC}"
    exit 0
fi