#!/bin/bash

fruit="apple"

case $fruit in
  apple)
    echo "You selected apple" 
    ;;
  banana)
    echo "You selected banana"
    ;;
  orange)
    echo "You selected orange"
    ;;
  *)
    echo "Unknown fruit"
    ;;
esac
