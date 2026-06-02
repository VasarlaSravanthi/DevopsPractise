#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/logs/shell-script
LOG_FILE="$LOG_DIR/$0.log"

if [ $USERID -ne 0 ]; then
    echo "Please run the script with Root Access"
    exit 1
fi

Validate()
{
    if [ $2 -ne 0 ]; then
        echo " Installing $1 is Failed..."
        exit 1
    else
        echo "Installing $1 is Sucess!!!"
    fi
}

dnf list installed mysql
if [ $? -eq 0 ]; then
    echo " Already My SQL is intsalled... Skipping Installation!!"    
else
    echo "Intsalling MYSQL!!!"
    dnf install my sql -y
    Validate MySql $?
fi 

dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "Already nginx is installed Already.."
else
    echo " Installing nginx"
    dnf install nginx -y
    Validate Nginx $?
fi

