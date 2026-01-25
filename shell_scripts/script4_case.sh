#!/bin/bash

echo "Enter a number (1–3):"
read num

case $num in
  1)
    echo "You chose One"
    ;;
  2)
    echo "You chose Two"
    ;;
  3)
    echo "You chose Three"
    ;;
  *)
    echo "Invalid choice"
    ;;
esac

echo "Case ended"
