#!/bin/bash


USERID=$(id -u)
LOGS_DIR=/var/logs/shell-script
LOG_FILE="$LOGS_DIR/$0.log"
TIME_STAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
P="\e[35m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "Please run the script with Root Access"
    exit 1
fi

Validate()
{
    if [ $2 -ne 0 ]; then
        echo -e " $TIME_STAMP $R [ERROR] Installing $1 is Failed... $N" | tee -a LOG_FILE
        exit 1
    else
        echo "$TIME_STAMP [INFO] Installing $1 is Sucess!!!" | tee -a LOG_FILE
    fi
}

for Package in $@
do
 echo " Installing $Package "
 dnf list installed $Package
    if [ $? -eq 0 ]; then
        echo -e "  $P Already $Package is intsalled... Skipping Installation!! $N"   | tee -a LOG_FILE
    else
        echo "$TIME_STAMP [INFO] Intsalling $Package !!!"
        dnf install $Package -y &>> LOG_FILE 
        Validate $Package $?
    fi 
done
