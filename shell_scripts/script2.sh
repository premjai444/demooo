#!/bin/bash

echo "==== VARIABLES ===="

# User-defined variables
name="Rahul"
age=25

echo "Name: $name"
echo "Age: $age"


echo
echo "==== ENVIRONMENT VARIABLES ===="

# Common environment variables
echo "User: $USER"
echo "Home directory: $HOME"
echo "Current shell: $SHELL"
echo "Current working directory: $PWD"


echo
echo "==== ARITHMETIC OPERATIONS ===="

a=10
b=5

sum=$((a + b))
diff=$((a - b))
mul=$((a * b))
div=$((a / b))
mod=$((a % b))

echo "a = $a, b = $b"
echo "Sum: $sum"
echo "Difference: $diff"
echo "Multiplication: $mul"
echo "Division: $div"
echo "Modulus: $mod"


echo
echo "==== LOGICAL / COMPARISON OPERATIONS ===="

x=20
y=15

if [ $x -gt $y ]; then
    echo "$x is greater than $y"
fi

if [ $x -ne $y ]; then
    echo "$x is not equal to $y"
fi

if [ $x -gt 10 ] && [ $y -gt 10 ]; then
    echo "Both numbers are greater than 10"
fi

if [ $x -lt 10 ] || [ $y -lt 10 ]; then
    echo "At least one number is less than 10"
else
    echo "None of the numbers is less than 10"
fi


echo
echo "Script execution completed."
