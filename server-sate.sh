#!/bin/bash

# server-stats.sh
# A script to display basic server performance statistics.
# This script is designed to be run on any Linux server.

# --- Formatting Variables ---
SEPARATOR="============================================="
HEADER_COLOR='\033[1;34m' # Bold Blue
STAT_COLOR='\033[0;32m'   # Green
NC='\033[0m'              # No Color

# --- Function to print a formatted header ---
print_header() {
    echo -e "${HEADER_COLOR}$1${NC}"
}

echo "$SEPARATOR"
echo "        Server Performance Statistics"
echo "    Generated on: $(date)"
echo "$SEPARATOR"
echo ""

# --- 1. Total CPU Usage ---
print_header "--- CPU Usage ---"
# Get the idle CPU percentage from 'top', then subtract from 100.
# -b: batch mode, -n1: one iteration. This command is robust and widely available.
# awk calculates the usage percentage (100 - idle) and prints it.
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.2f%%", 100 - $8}')
echo -e "Total CPU Usage: ${STAT_COLOR}$CPU_USAGE${NC}"
echo ""

# --- 2. Total Memory Usage ---
print_header "--- Memory Usage ---"
# Use 'free -m' to get memory stats in Megabytes.
# 'grep Mem:' isolates the main memory line.
# 'awk' formats the output, calculating the used percentage.
free -m | grep Mem | awk -v stat_color="$STAT_COLOR" -v nc="$NC" '{
    total=$2;
    used=$3;
    free=$4;
    percent_used=($3/$2)*100;
    printf "Total Memory: %s%d MB%s\n", stat_color, total, nc;
    printf "Used Memory:  %s%d MB (%.0f%%)%s\n", stat_color, used, percent_used, nc;
    printf "Free Memory:  %s%d MB%s\n", stat_color, free, nc;
}'
echo ""

# --- 3. Total Disk Usage ---
print_header "--- Disk Usage (Root Filesystem) ---"
# Use 'df -h' for human-readable disk stats for the root filesystem '/'.
# 'tail -n 1' gets the last line of the output, avoiding the header.
# 'awk' formats the output nicely.
df -h / | tail -n 1 | awk -v stat_color="$STAT_COLOR" -v nc="$NC" '{
    total=$2;
    used=$3;
    free=$4;
    percent_used=$5;
    printf "Total Space: %s%s%s\n", stat_color, total, nc;
    printf "Used Space:  %s%s (%s)%s\n", stat_color, used, percent_used, nc;
    printf "Free Space:  %s%s%s\n", stat_color, free, nc;
}'
echo ""

# --- 4. Top 5 Processes by CPU Usage ---
print_header "--- Top 5 Processes by CPU Usage ---"
# Use 'ps' to list processes.
# 'aux': all users, user-oriented format, include processes without a TTY.
# '--sort=-%cpu': Sorts by CPU usage in descending order.
# 'head -n 6': Gets the top 5 processes plus the header line.
ps aux --sort=-%cpu | head -n 6
echo ""

# --- 5. Top 5 Processes by Memory Usage ---
print_header "--- Top 5 Processes by Memory Usage ---"
# Use 'ps' again, but sort by memory usage.
# '--sort=-%mem': Sorts by Memory usage in descending order.
ps aux --sort=-%mem | head -n 6
echo ""

echo "$SEPARATOR"

