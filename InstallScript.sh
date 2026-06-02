#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
 echo " Root User is not activated"
 exit 1
fi
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

   
