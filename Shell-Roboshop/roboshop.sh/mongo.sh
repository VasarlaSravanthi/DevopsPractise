#!/bin/bash

USERID=$(id -u)
sudo mkdir -p $LOGS_FOLDER
LOGS_DIR=/var/logs/shell-script
sudo chown -R ec2-user:ec2-user $LOGS_FOLDER
sudo chmod -R 755 $LOGS_FOLDER
LOG_FILE="$LOG_DIR/$0.log"

R="\e[31m"
P="\e[35m"
N="\e[0m"
Y="\e[33m"

TIMESTAMP=$(data "+%Y-%m-%d %H:%M:%S")



if [ $USERID -ne 0 ]; then
    echo "$TIMESTAMP [ERROR] $R Please run the script with Root Access $N " | tee -a $LOG_FILE
    exit 1
fi

Validate()
{
    if [ $1 -ne 0 ]; then
        echo " $TIMESTAMP [ERROR] $2 Failed...$R FAILURE $N" | tee -a LOG_FILE
        exit 1
    else
        echo "$TIMESTAMP [ERROR] $2 Sucess...$G SUCCESS $N" | tee -a LOG_FILE
    fi
}

cp mongo.repo /etc/yum.repo.d/mongo.repo
Validate $? "Adding Mongo repo"

