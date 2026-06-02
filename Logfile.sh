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
        echo " Installing $1 is Failed..." | tee -a LOG_FILE
        exit 1
    else
        echo "Installing $1 is Sucess!!!" | tee -a LOG_FILE
    fi
}

dnf list installed mysql &>> LOG_FILE 
if [ $? -eq 0 ]; then
    echo " Already My SQL is intsalled... Skipping Installation!!"   | tee -a LOG_FILE
else
    echo "Intsalling MYSQL!!!"
    dnf install my sql -y &>> LOG_FILE 
    Validate MySql $?
fi 

dnf list installed nginx &>> LOG_FILE 
if [ $? -eq 0 ]; then
    echo "Already nginx is installed Already.." | tee -a LOG_FILE
else
    echo " Installing nginx"
    dnf install nginx -y &>> LOG_FILE 
    Validate Nginx $?
fi

