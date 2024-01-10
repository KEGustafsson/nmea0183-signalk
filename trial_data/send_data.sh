#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file> <destination_host> <destination_port>"
    exit 1
fi

input_file="$1"
destination_host="$2"
destination_port="$3"

pv --rate-limit 10k "$input_file" | nc -u "$destination_host" "$destination_port"

