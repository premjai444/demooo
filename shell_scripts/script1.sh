#!/bin/bash

# -----------------------------
# File & Permission Operations
# -----------------------------

echo "Starting file operations..."

# 1. Create a directory
DIR_NAME="demo_dir"
mkdir -p $DIR_NAME
echo "Directory created: $DIR_NAME"

# 2. Create a file
FILE_NAME="$DIR_NAME/sample.txt"
touch $FILE_NAME
echo "File created: $FILE_NAME"

# 3. Write content to file
echo "Hello, this is the first line." > $FILE_NAME

# 4. Append content to file
echo "This line is appended." >> $FILE_NAME

# 5. Display file content
echo "File content:"
cat $FILE_NAME

# 6. Check current permissions
echo "Current permissions:"
ls -l $FILE_NAME

# 7. Change file permissions
chmod 644 $FILE_NAME
echo "Permissions changed to 644"

# 8. Verify permissions again
ls -l $FILE_NAME

# 9. (Optional) Change ownership - requires sudo
# sudo chown $USER:$USER $FILE_NAME

# 10. Create another file
touch $DIR_NAME/test.log

# 11. List files in directory
echo "Files in directory:"
ls -l $DIR_NAME

# 12. Delete a file
rm $DIR_NAME/test.log
echo "Deleted test.log"

# 13. Cleanup (optional)
# rm -rf $DIR_NAME

echo "File operations completed."

