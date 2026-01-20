#!/bin/bash

echo "=============================="
echo "   SERVER PERFORMANCE STATS"
echo "=============================="
echo ""

# CPU Usage
echo "🧠 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " 100 - $8 "%"}'
echo ""

# Memory Usage
echo "🧠 Memory Usage:"
free -h | awk '/Mem:/ {
printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, ($3/$2)*100
}'
echo ""

# Disk Usage
echo "💾 Disk Usage:"
df -h / | awk 'NR==2 {
printf "Used: %s / Total: %s (%s used)\n", $3, $2, $5
}'
echo ""

# Top CPU Processes
echo "🔥 Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""

# Top Memory Processes
echo "🐘 Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo ""

# Load Average
echo "📈 Load Average:"
uptime | awk -F'load average:' '{print $2}'
echo ""

# Uptime
echo "⏱ System Uptime:"
uptime -p
echo ""

# Logged-in users
echo "👤 Logged in users:"
who | wc -l