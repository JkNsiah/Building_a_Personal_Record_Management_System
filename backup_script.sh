#!/bin/bash

# Function to create a backup of the personal record file
backup_records() {
  backup_folder="backups"
  backup_file="records_$(date +'%Y%m%d_%H%M%S').txt"
  
  if [ ! -d "$backup_folder" ]; then
    mkdir "$backup_folder"
  fi
  
  cp records.txt "$backup_folder/$backup_file"
  echo "Backup created: $backup_folder/$backup_file"
}

# Main script execution
backup_records 
