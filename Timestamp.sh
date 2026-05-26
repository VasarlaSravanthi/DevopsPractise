#!/bin/bash

echo "HellO"
T1=$(date)
echo " Script execution started - $T1"
StartTime=$(date +%s)
sleep 10s
echo "Script execution completed!- $T1"
EndTime=$(date +%s)
Time_Taken=$(($EndTime-$StartTime))
