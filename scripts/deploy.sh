#!/bin/bash

echo "===== APPLICATION DEPLOYMENT ====="

cp "../app/app.py" "../deployment/app.py"

if [ $? -eq 0 ]
then
    echo "Application deployment : SUCCESS"
else
    echo "Application deployment : FAILED"
    exit 1
fi

if cmp -s "../app/app.py" "../deployment/app.py"
then
    echo "Deployment integrity : VERIFIED"
else
    echo "Deployment integrity : FAILED"
    exit 1
fi

if python3 "../deployment/app.py" > /dev/null 2>&1
then
    echo "Deployment health : HEALTHY"
else
    echo "Deployment health : FAILED"
    exit 1
fi

echo "Deployment Status : SUCCESS"
