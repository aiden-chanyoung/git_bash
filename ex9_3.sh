#!/bin/bash
case $1 in
    start)
        echo [status] starting
        ;;
    stop)
        echo [status] stoping
        ;;
    restart)
        echo [status] restarting
        ;;
    *)
        echo [status] don\'t know
        ;;
esac
