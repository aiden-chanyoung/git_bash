#!/bin/bash
if [ $1 -gt 100 ]          # if the first command line argument is greater than 100
then
    echo Hey that\'s a large number.
    if (( $1 % 2 == 0 ))
    then
        echo And is also an even number.
    else
        echo And is also an odd number.
    fi
elif [ $1 -lt 100 ]          # if the first command line argument is less than 100
then
    echo Hey that\'s a smaller number.
    if (( $1 % 2 == 0 ))
    then
        echo And is also an even number.
    else
        echo And is also an odd number.
    fi
else
    echo Hey that\'s a 100.
    echo And is also an even number.
fi                         # fi signals the end of the if statement
                           # All commands after this will be run as normal.
echo :: End of Script
