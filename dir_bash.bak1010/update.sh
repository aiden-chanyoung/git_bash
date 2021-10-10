#!/bin/bash

ip_names='adc ip1 ip2 ip3 quit'
PS3='IP you want to update: '

select name in $ip_names
do
    if [ $name == 'quit' ]
    then
        break
    else
        case $name in
            adc)
                echo [IP] $name is selected!
                update_IP.sh adc
                ;;
            ip1)
                echo [IP] $name is selected!
                ;;
            ip2)
                echo [IP] $name is selected!
                ;;
            *)
                echo [Error] $name is not in Library!
                ;;
        esac
    fi
    echo [Completed] $name is updated!
done
