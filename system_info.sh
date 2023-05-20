#!/bin/bash

function get_cpu_usage {
    cpu_usage=$(top -bn1 | awk '/Cpu/ {print $2}')
    echo "CPU Usage: $cpu_usage%"
}

function get_memory_usage {
    memory_usage=$(free -m | awk '/Mem:/ {printf "%.2f%%", $3/$2 * 100}')
    echo "Memory Usage: $memory_usage"
}

function get_disk_space {
    disk_space=$(df -h | awk '/\/$/ {print $4}')
    echo "Disk Space Available: $disk_space"
}

function get_network_stats {
    network_stats=$(ifconfig | awk '/RX packets/ {print "RX:", $2, "TX:", $6}')
    echo "Network Statistics: $network_stats"
}

echo "System Information"
echo "#     #"
echo " #   #"
echo "  # #"
echo "   #"
get_cpu_usage
get_memory_usage
get_disk_space
get_network_stats

