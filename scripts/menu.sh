#!/bin/bash

while true
do

clear

echo "================================"
echo " Automated Log Deployment Tool"
echo "================================"
echo "Project Status: READY"
echo
echo "1. System Health Check"
echo "2. Analyze Logs"
echo "3. Create Backup"
echo "4. Validate Application"
echo "5. Deploy Application"
echo "6. Rollback Application"
echo "7. Exit"


echo 
read -p "Enter your choice: " choice

case $choice in
    1)
        ./health_check.sh
        ;;
    2)
        echo "===== LOG ANALYSIS ====="
	echo "Total Warnings: $(grep -c "WARNING" ../logs/tool.log)"
	echo "Latest Warning: $(grep "WARNING" ../logs/tool.log | tail -1)"
        ;;
    3)
        backup_timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
	backup_file="../backups/app_${backup_timestamp}.tar.gz"

    	tar -czf "$backup_file" ../app/

    	echo "Backup created : $backup_file"
        ;;
    4)
        ./validate.sh
        ;;
    5)
        ./deploy.sh
        ;;
    6)
        ./rollback.sh
        ;;
    7)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please enter a number between 1 and 7"
        ;;
esac

read -p "Press Enter to continue..."

done
