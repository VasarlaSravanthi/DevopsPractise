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

for Package in $@
do
 echo " Installing $Package "
 dnf list installed $Package
    if [ $? -eq 0 ]; then
        echo " Already $Package is intsalled... Skipping Installation!!"   | tee -a LOG_FILE
    else
        echo "Intsalling $Package !!!"
        dnf install $Package -y &>> LOG_FILE 
        Validate $Package $?
    fi 
done
