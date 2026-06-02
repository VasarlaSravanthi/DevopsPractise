#!/bin/bash
#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
 echo " Please run the script with root access"
 exit 1
fi

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo " Already My SQL is intsalled... Skipping Installation!!"
else
    echo "Intsalling MYSQL!!!"
    dnf install my sql -y

    if [ $? -ne 0 ]; then
        echo " Installing MySQL Failed..."
        exit 1
    else
        echo " Installing MySQL is Success!!!!"
    fi
fi  

   
