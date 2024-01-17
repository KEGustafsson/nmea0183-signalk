#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <data_rate> <input_file> <destination_host> <destination_port>"
    exit 1
fi

data_rate="$1"
input_file="$2"
destination_host="$3"
destination_port="$4"

pv --rate-limit "$data_rate" "$input_file" | nc -u "$destination_host" "$destination_port"
