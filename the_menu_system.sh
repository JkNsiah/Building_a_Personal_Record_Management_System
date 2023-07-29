#!/bin/bash

# Function to display the main menu

display_menu() {
  clear
  echo "=== Welcome To The Main Menu ==="
  echo "1. Add New Record"
  echo "2. Edit Existing Record"
  echo "3. Search for Specific Record"
  echo "4. Generate Reports"
  echo "0. Exit"
 
}

# Function to handle adding a new record
add_record() {
  read -p "Enter the new record: " new_record
  echo "$new_record" >> records.txt
  echo "Record added successfully!"
}

# Function to handle editing existing records
edit_record() {
  echo "=== Existing Records ==="
  cat records.txt
  echo "======================="
  
  read -p "Enter the record number to edit: " record_number
  if [ -z "$record_number" ]; then
    echo "Invalid input. Please try again."
  else
    # Use sed to replace the specific line in the file
    read -p "Enter the new content for the record: " new_content
    sed -i "${record_number}s/.*/$new_content/" records.txt
    echo "Record edited successfully!"
  fi
}

# Function to handle searching for specific records
search_record() {
  read -p "Enter the search term: " search_term
  grep -i "$search_term" records.txt
}

# Function to handle generating reports
generate_report() {
  echo "=== Records ==="
  cat records.txt
  echo "==============="
}

# Main script execution
while true; do
  display_menu
  read -p "Enter your choice (0-4): " choice

  case $choice in
    1)
      add_record
      ;;
    2)
      edit_record
      ;;
    3)
      search_record
      ;;
    4)
      generate_report
      ;;
    0)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac

  read -p "Press Enter to continue..."
done
