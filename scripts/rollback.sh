#!/bin/bash

echo "===== APPLICATION ROLLBACK ====="

backup_file=$(ls -t ../backups/app_*.tar.gz | head -1)

if [ -z "$backup_file" ]
then
    echo "Rollback : NO BACKUP FOUND"
    exit 1
fi

tar -xOzf "$backup_file" app/app.py > ../deployment/app.py

if [ $? -eq 0 ]
then
    echo "Application rollback : SUCCESS"
else
    echo "Application rollback : FAILED"
    exit 1
fi

if python3 "../deployment/app.py" > /dev/null 2>&1
then
    echo "Rollback health : HEALTHY"
else
    echo "Rollback health : FAILED"
    exit 1
fi

echo "Rollback Status : SUCCESS"
