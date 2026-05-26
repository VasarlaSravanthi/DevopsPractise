#!/bin/bash
echo "Enter N Value: $N"
read N
echo "Enter N2 Value: $N"
read N2
SUM=$(($N+$N2))
echo "sum is $SUM"
Movies=("KGF" "RRR" "AMB")
echo "First Movie is ${Movies[0]}"
echo "All Movies = ${Movies[@]}"