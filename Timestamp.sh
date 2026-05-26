#!/bin/bash

echo "HellO"
T1=$(date)
echo " Script execution started - $T1"
StartTime=$(date)
sleep 10s
echo "Script execution completed!- $T1"
EndTime=$(date)
echo "TimeTaken=($(EndTime)-$(StartTime))"
