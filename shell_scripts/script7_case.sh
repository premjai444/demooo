#!/bin/bash


case $1 in
  apple)
    echo "apple selected"
    ;;
  banana)
    echo "banana selected"
    ;;
  *)
    echo "default statement"
    ;;
esac






case $2 in
  start)
    echo "Starting service..."
    ;;
  stop)
    echo "Stopping service..."
    ;;
  restart)
    echo "Restarting service..."
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
    ;;
esac
