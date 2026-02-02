#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
    echo "Usage: log-analyzer.sh <log-file>"
    exit 1
fi

LOG_FILE="$1";

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File does not exist."
    exit 1
fi

# Top 5 IP addresses with the most requests
get_top_addresses() {
    echo -e "Top 5 IP addresses with the most requests"
    awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
    awk '{print $2 " - " $1 " requests"}'
}

# Top 5 most requested paths
get_requested_paths() {
    echo -e "\nTop 5 most requested paths"
    awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
    awk '{print $2 " - " $1 " requests"}'
}

# Top 5 response status codes
get_status_code() {
    echo -e "\nTop 5 response status codes"
    awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
    awk '{print $2 " - " $1 " requests"}'
}

# Top 5 user agents
get_user_agents() {
    echo -e "\nTop 5 user agents"
    awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | \
    awk '{print substr($0, index($0,$2)) " - " $1 " requests"}'
}

main() {
    get_top_addresses
    get_requested_paths
    get_status_code
    get_user_agents
}

main