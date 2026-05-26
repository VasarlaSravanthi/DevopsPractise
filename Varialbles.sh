#!/bin/bash
#Special Variables
echo "Enter variables : $@"
echo "Number of Variables Passed : $#"
echo "First Variable: $1"
echo "ScriptName : $0"
echo "Who is running : $USER"
echo "In Which directory, running : $PWD"
echo "Home Directory : $HOME"
echo "PID Of the current Script : $$"
sleep 2 &
echo "Background running PID right now : $!"
wait $!
echo "Line number : $LINENO"
echo "Script executed in $SECONDS seconds"
echo "Random Number : $RANDOM"