#!/bin/bash

for user in $(cat user.txt)
do
  echo "Creating user: $user"
done
