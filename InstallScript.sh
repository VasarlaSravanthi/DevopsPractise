#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
 echo " Root User is not activated"
fi
sleep 3 &
Read N
echo "Enter 1 to continue : $N"


if [ $N -eq 1 ]; then
   sudo su
   echo " Root user is Activated"
else
   exit 1
fi
