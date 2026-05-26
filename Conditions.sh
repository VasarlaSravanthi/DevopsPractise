#!/bin/bash
echo "Enter Number N:"
read N
echo "Enter Number M:"
read M
SUM=$(($N+$M))
echo "sum is $SUM"
Movies=("KGF" "RRR" "AMB")
if [$SUM>100]; then
    echo "First Movie is ${Movies[0]}"
else
 echo "All Movies = ${Movies[@]}"
fi
