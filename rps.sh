#!/bin/bash
lose=0
win=0
touch user.txt
score=$(cat user.txt)
touch cpscore.txt
cpscore=$(cat cpscore.txt)
while true ; do
    echo "rock(1) papper(2) or scissors(3)"
    read choice
    pc_choice=$((1 + RANDOM %3))
    echo "$pc_choice"
    if [ $choice = $pc_choice ] ; then
        echo "tie"
    elif [ $choice -eq 1 -a $pc_choice -eq 3 ] ; then 
        echo "their scissors got crushed by your rock"
        win=$(($win + 1))
    elif [ $choice -eq 2 -a $pc_choice -eq 3 ] ; then
        echo "your paper got shreadded by thier scissors" 
        lose=$(($lose + 1))
    elif [ $choice -eq 1 -a $pc_choice -eq 2 ]  ; then
        echo "their paper covers your rock and when it lifts you find your rock has vanished"
        lose=$(($lose + 1))
    elif [ $choice -eq 3 -a $pc_choice -eq 2 ] ; then
        echo "their paper got shreadded by your scissors"
        win=$(($win + 1))
    elif [ $choice -eq 2 -a $pc_choice -eq 1 ] ; then
        echo "your paper covers their rock and when it lifts they find their rock has vanished"
        win=$(($win + 1))
    elif [ $choice -eq 3 -a $pc_choice -eq 1 ]  ; then 
        echo "your scissors got crushed by their rock"
        lose=$(($lose + 1))
    else echo "error: pls try agian"
    fi
    if [[ $win = ["3"] ]]; then
        echo "you win"
        score=$(($score +1))
        echo "$score">user.txt
        echo "your score is $score"
        echo "cpu score is $cpscore"
        break
    fi
    if [[ $lose = ["3"] ]]; then
        echo "you lose"
        cpscore=$(("$cpscore +1"))
        echo "$cpscore">cpscore.txt
        echo "your score is $score"
        echo "cpu score is $cpscore"
        break
    fi
done
