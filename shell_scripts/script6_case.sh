#!/bin/bash

echo "1. Show date"
echo "2. Show calendar"
echo "3. Show current directory"
echo "Enter your choice:"
read choice

case $choice in
  1)
    date
    ;;
  2)
    cal
    ;;
  3)
    pwd
    ;;
  *)
    echo "Invalid option"
    ;;
esac


read -s -p "Enter password: " password
echo
echo "Password stored"
echo $password
