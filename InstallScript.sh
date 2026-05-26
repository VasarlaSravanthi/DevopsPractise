#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
 echo " Root User is not activated"

fi