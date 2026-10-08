#!/bin/bash

validation_failed=0

if [ -f "../app/app.py" ]
then
    echo "Application file : EXISTS"
else
    echo "Application file : MISSING"
    validation_failed=1
fi

if [ -r "../app/app.py" ]
then
    echo "Application file : READABLE"
else
    echo "Application file : NOT READABLE"
    validation_failed=1
fi

if [ -s "../app/app.py" ]
then
    echo "Application file : NOT EMPTY"
else
    echo "Application file : EMPTY"
    validation_failed=1
fi

if python3 -m py_compile "../app/app.py"
then
    echo "Python syntax : VALID"
else
    echo "Python syntax : INVALID"
    validation_failed=1
fi

if sha256sum -c "../app/app.py.sha256" > /dev/null 2>&1
then
    echo "Checksum : VALID"
else
    echo "Checksum : INVALID"
    validation_failed=1
fi

if timeout 2 python3 "../app/app.py" > /dev/null 2>&1
then
    echo "Application startup : SUCCESS"
else
    echo "Application startup : FAILED"
    validation_failed=1
fi


if [ "$validation_failed" -eq 0 ]
then
    echo "Validation Status : PASSED"
else
    echo "Validation Status : FAILED"
fi
