#!/bin/bash

LOGS_FOLDER="/var/logs/shell-script"
sudo mkdir -p $LOGS_FOLDER

sudo chown -R ec2-user:ec2-user $LOGS_FOLDER
sudo chmod -R 755 $LOGS_FOLDER
LOG_FILE="$LOG_DIR/$0.log"

USERID=$(id -u)
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

cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "Adding Mongo repo"

dnf install mongodb-org -y &>> $LOGS_FILE
VALIDATE $? "Installing MongoDB"

systemctl enable --now mongod
VALIDATE $? "Starting and enabling MongoDB"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf
VALIDATE $? "Allowing remote connections to MongoDB"

systemctl restart mongod
VALIDATE $? "Restarting MongoDB"
