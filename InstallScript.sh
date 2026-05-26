#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
 echo " Root User is not activated"
fi
echo "Enter 1 to continue : $N"
read N

if [ $N -eq 1 ]; then
   sudo su
   echo " Root user is Activated"
   echo " Installation of MYSQL started....."
   dnf install mysql -y
   if [ $? -eq 0 ]; then
      echo " Installing MYSQL is Failed.."
      exit 1
    else
      echo "Intsalling MYSQL is Success!!!"
    fi
else
   echo " Root User not activated"
   exit 1
fi
