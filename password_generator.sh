#!/bin/bash

# Function to generate a strong and random password
generate_password() {
  password_length=12
  password=$(openssl rand -base64 32 | tr -dc 'a-zA-Z0-9' | fold -w "$password_length" | head -n 1)
  echo "Generated Password: $password"
}

# Main script execution
generate_password
