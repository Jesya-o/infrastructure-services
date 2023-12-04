#!/bin/bash

# Fetch the HTML content
html_content=$(curl -s http://193.40.156.67/students/Jesya-o.html)

# Extract and store the ports in an array
ports=($(echo "$html_content" | grep -oP 'port \K\d+' | awk '{print $1}'))

# Iterate over the array and print the ports
for port in "${ports[@]}"; do
    echo "Port: $port"
done

# Create a temporary file
tmp_file="/home/jesya-o/Projects/infra/hosts.tmp"

# Track if the first two occurrences have been updated
updated_1=0
updated_2=0

# Update the Ansible inventory file
while IFS= read -r line; do
  if [[ $line == *Jesya-o-1* && $updated_1 -eq 0 ]]; then
    echo "Jesya-o-1 ansible_host=193.40.156.67 ansible_port=${ports[0]} ansible_user=ubuntu" >> "$tmp_file"
    updated_1=1
  elif [[ $line == *Jesya-o-2* && $updated_2 -eq 0 ]]; then
    echo "Jesya-o-2 ansible_host=193.40.156.67 ansible_port=${ports[1]} ansible_user=ubuntu" >> "$tmp_file"
    updated_2=1
  else
    echo "$line" >> "$tmp_file"
  fi
done < /home/jesya-o/Projects/infra/ica0002/hosts

# Replace the original file with the updated one
mv "$tmp_file" /home/jesya-o/Projects/infra/ica0002/hosts
