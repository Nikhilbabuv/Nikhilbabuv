#!/bin/bash

GRN='\033[1;32m'
NC='\033[0m' # No Color
# Function to extract eth1 details
extract_eth1_details() {
  grep -E "bond0.1203\s+" "$1"
}

# Function to extract NFS share details
extract_nfs_share_details() {
  awk '/NFS SHARES/{flag=1; next} /----/{flag=0} flag' "$1"
}

# Loop through each file
for file in /home/nbabu/Decomm/output-wf-1461015/*; do
  echo "File: $file"

  # Extract eth1 details
  eth1_output=$(extract_eth1_details "$file")
  echo -e "${GRN} Storage IP Details:${NC}"
  echo "$eth1_output"

  # Extract NFS share details
  nfs_share_output=$(extract_nfs_share_details "$file")
  echo -e "${GRN} NFS Share Details:${NC}"
  echo "$nfs_share_output"

  echo "----------------------------------------"
done
