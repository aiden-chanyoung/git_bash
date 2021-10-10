#!/bin/bash
# check IP final link

date=$( date )
echo Version check @ $(date) -> version_report
echo ========================================= >> version_report
echo - Hard Macro ---------------------------- >> version_report
for value in lib/*
do
    if [[ -d $value/final ]]
    then
        max=0
        for x in $value/*
        do
            n=${x##*/}
            [ "$((n))" -gt "$max" ] && max=$n
        done
        version=$( cat $value/final/version )
        echo $value - latest : $max, version : $version >> version_report
    else
        echo $value - [ERROR] check IP version agian! >> version_report
    fi
done
echo - Soft Macro ---------------------------- >> version_report
for value in link/*
do
    max=0
    for x in $value/*
    do
        n=${x##*/}
        [ "$((n))" -gt "$max" ] && max=$n
    done
    version=$( cat $value/$max/version )
    echo $value - latest : $max, version : $version >> version_report
done
echo ========================================= >> version_report
