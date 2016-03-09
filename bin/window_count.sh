#!/bin/bash
# wmctrl required

pids=$(pidof $1)
IFS=' ' read -a pid_arr <<< "$pids"
matches=0
for pid in "${pid_arr[@]}"
do
    matching_lines=$(wmctrl -l -p | egrep -c "^.+\b.+\b$pid\b")
    matches=$((matches + $matching_lines))
done
echo $matches
