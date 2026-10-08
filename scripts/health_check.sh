#!/bin/bash

LOG_FILE="../logs/tool.log"

echo "SYSTEM HEALTH CHECK"
echo
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "Date/Time : $timestamp"

disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

threshold=80

echo "Disk Usage : ${disk_usage}%"

if [ "$disk_usage" -ge "$threshold" ]
then
	disk_status="WARNING"
	echo "Status	:WARNING"
else
	 disk_status="HEALTHY"
	echo "Status	:HEALTHY"
fi

memory_usage=$(free | awk '/Mem:/ {printf "%.0f", ($3/$2)*100}')

echo "Memory Usage : ${memory_usage}%"

if [ "$memory_usage" -ge "$threshold" ]
then
	memory_status="WARNING"
        echo "Status    :WARNING"
else
	memory_status="HEALTHY"
        echo "Status    :HEALTHY"
fi

cpu_usage=$(top -bn1 | awk '/%Cpu\(s\)/ {printf "%.0f", 100 - $8}')

echo "CPU Usage : ${cpu_usage}%"

if [ "$cpu_usage" -ge "$threshold" ]
then
	cpu_status="WARNING"
        echo "Status    :WARNING"
else
	cpu_status="HEALTHY"
        echo "Status    :HEALTHY"
fi


echo "$timestamp | Disk:${disk_usage}% $disk_status | Memory:${memory_usage}% $memory_status | CPU:${cpu_usage}% $cpu_status" >> "$LOG_FILE"


