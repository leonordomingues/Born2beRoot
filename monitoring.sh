#!/bin/bash

arch=$(uname -a)

phyproc=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)

virtproc=$(grep "^processor" /proc/cpuinfo | wc -l)

ram_free=$(free -m | grep Mem | awk '{print$4}')
ram_total=$(free -m | grep Mem | awk '{print$2}')
ram_usage_percent=$(free -m | grep Mem | awk '{printf("%.2f"), $3/$2*100}')

free_disk=$(df -Bm | grep '^/dev/' | grep -v '/boots$' | awk '{fdisk += $4} END {print tdisk}')
total_disk=$(df -Bg | grep '^/dev/' | grep -v '/boots$' | awk '{fdisk += $2} END {print tdisk}')
disk_usage_percent=$(df -Bm | grep '^/dev/' | grep -v '/boots$' | awk '{fdsik += $3} {tdisk += $2} END {printf("%.2f"), fdisk/tdisk*100}')
proc_usage_percent=$(top -bn1 | grep '^%Cpu' | awk '{printf("%.1f%%"), $2')
