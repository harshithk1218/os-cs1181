#!/bin/bash
# Shell Script for Monitoring Memory Usage with Logging
# Usage: ./memory_monitor.sh

# Function to display memory usage
display_memory_usage() {
    clear
    echo "Current Memory Usage:"
    free -h
    echo ""
}

# Function to log memory usage to a file with a timestamp
log_memory_usage() {
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")  # Get the current timestamp
    memory_usage=$(free -h)                   # Get the memory usage
    echo "$timestamp - $memory_usage" >> memory_log.txt  # Append to the log file
    echo "Logged memory usage at $timestamp"
}

# Function to display memory usage in real-time
monitor_memory_usage() {
    clear
    echo "Monitoring memory usage in real-time. Press [CTRL+C] to stop."
    top -o %MEM -d 2
}

# Function to log memory usage every 10 seconds
log_memory_every_10_seconds() {
    clear
    echo "Logging memory usage every 10 seconds. Press [CTRL+C] to stop."
    while true; do
        log_memory_usage
        sleep 10  # Wait for 10 seconds before logging again
    done
}

# Displaying options to the user
while true; do
    clear
    echo "Dynamic Memory Monitor with Logging"
    echo "1. Display current memory usage"
    echo "2. Monitor memory usage in real-time"
    echo "3. Log memory usage every 10 seconds"
    echo "4. Exit"

    read -p "Select an option (1-4): " option

    case $option in
        1) # Display current memory usage
            display_memory_usage
            ;;
        2) # Monitor memory usage in real-time
            monitor_memory_usage
            ;;
        3) # Log memory usage every 10 seconds
            log_memory_every_10_seconds
            ;;
        4) # Exit the script
            echo "Exiting the memory monitor. Goodbye!"
            exit 0
            ;;
        *) # Invalid option
            echo "Invalid option. Please select 1-4."
            ;;
    esac

    # Adding a pause to keep options visible before clearing
    read -p "Press [Enter] to continue..."
done
