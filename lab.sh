#!/bin/bash

#Introduce
echo "Welcome! This is PROGRAMM FOR CHECKING CHANGES IN THE INDEX DESCRIPTOR"
echo -en '\n'
echo "This program may help you to check if there were changes in the index descriptor of the file after any date." 
echo -en '\n'
echo "Developer: Skosareva Ksenia (group 710-1, FB, TUSUR)"
echo -en '\n'

while true; do

    #Shows name of current directory 
    echo "Current directory is $(pwd)"
    echo "Files in current directory are"
    ls

    #Asking for filename
    read -p "Enter the file name: " file_name

    #Checking the existence of the file, if not exist - asks for name again 
    while [[ ! -f "$file_name" ]]; do
        echo "File \"$file_name\" not exist"
        read -p "Enter the file name: " file_name
    done

    #Asking for a date
    read -p "Enter the date in the format YYYY-MM-DD: " date

# Checking the date
    while [[ ! $date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; do
        echo "Error: Invalid date format. Use YYYY-MM-DD."
        read -p "Enter the date in the format YYYY-MM-DD: " date
    done

    #Checking changes of index descriptor
    if [[ $(stat -c %Y $file_name) -gt $(date -d $date +%s) ]]; then
        echo "The index descriptor of the file \"$file_name\" was changed" 
        echo "Stopping the program..."
        exit 120
    else
        echo "The index descriptor of the file \"$file_name\" was not changed"
    fi

    #Continue?
    read -p "Continue? (y/n): " temp
    echo -en '\n'
    if [[ ! $temp =~ y ]]; then
        echo "Stopping the program..." 
        break
    fi
done