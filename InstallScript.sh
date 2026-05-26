#!/bin/bash

USERID=$(id -u)

if [ USERID ne 0 ]; then
 echo " Root User is not activated"
 echo " Please enter $N to proceed with Root User access"
 Read N
 if [ N eq 1 ] ; then 
  sudo su 
 else 
  exit 1
fi
 