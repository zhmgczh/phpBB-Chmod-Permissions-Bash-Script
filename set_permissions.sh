#!/bin/bash

# Define the root directory
root_dir="/var/www/html/"

# Define the config file name
config_file="config.php"

# Define the exception directories
exception_dirs=(
  "files"
  "cache"
  "store"
  "images/avatars/upload"
)

# --- Set permissions for config.php ---
# Assuming installation is complete, setting to 644.
# If you need to handle the "before installation" state (666),
# you would need a way to determine that state within the script.
echo "Setting permissions for ${root_dir}${config_file} to 644"
chmod 644 "${root_dir}${config_file}"

# --- Set permissions for all other files ---
echo "Setting permissions for all other files in ${root_dir} to 644"
find "${root_dir}" -type f ! -name "${config_file}" -exec chmod 644 {} +

# --- Set permissions for all directories ---
echo "Setting permissions for all directories in ${root_dir} to 755"
find "${root_dir}" -type d -exec chmod 755 {} +

# --- Set permissions for exception directories ---
echo "Setting permissions for exception directories to 777"
for dir in "${exception_dirs[@]}"; do
  echo "Setting permissions for ${root_dir}${dir} to 777"
  # Ensure the directory exists before trying to chmod it
  if [ -d "${root_dir}${dir}" ]; then
    chmod 777 "${root_dir}${dir}"
  else
    echo "Warning: Directory ${root_dir}${dir} not found."
  fi
done

echo "Permissions update complete for ${root_dir}"
