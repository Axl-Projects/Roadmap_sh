#!/bin/bash

# CPU Usage info: mpstat command provides CPU usage statistics

get_cpu_usage_info() {
    echo -e "\n** CPU Usage **"
    mpstat | awk '$12 ~ /[0-9.]+/ { print 100 -$12"% used" }'
}


# Memory Usage: free command provides a snapshot of memory usage
# -m flag shows memory in MB

get_memory_usage_info() {
    echo -e "\n** Memory Usage **"
    free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3, $2, $3*100/$2}'
}

# Check disk usage: df -h command provides human-readable disk usage stats
# --total flag check disk usage across all mounted filesystems
check_disk_usage() {
    echo -e "\n** Disk Usage **"
    df -h --total | awk 'END{print "Used: "$3", Free: "$4", Usage: "$5}'
}

# Top 5 processes by CPU Usage
# ps command to show info about currently running process

get_top_processes_by_cpu() {
    echo -e "\n** Top 5 Processes by CPU Usage **"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
}


# Top 5 memory consuming processes 
get_top_memory_processes_by_mem() {
    echo -e "\n** Top 5 Processes by Memory Usage **"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
}


extrat_stats() {
    echo -e "\n*** EXTRA STATS ***"
    
    echo -e "\nOS Version:"
    lsb_release -a 2>/dev/null || cat /etc/os-release

    echo -e "\nUptime:"
    uptime

    echo -e "\nLoad Average:"
    cat /proc/loadavg

    echo -e "\nLogged in users:"
    who
}

main() {
    echo -e "Server Performance Stats"
    echo "-------------------------------"
    get_cpu_usage_info
    get_memory_usage_info
    check_disk_usage
    get_top_processes_by_cpu
    get_top_memory_processes_by_mem
    extract_stats
}

# Run the main function
main