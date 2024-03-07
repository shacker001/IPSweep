#!/bin/bash

# Function to handle interruption
interrupt_handler() {
    echo "Script interrupted. Exiting..."
    exit 1
}

# Register the interrupt handler
trap interrupt_handler SIGINT

# Function to validate IP address
validate_ip() {
    if [[ $1 =~ ^([0-9]{1,3}\.){2}[0-9]{1,3}$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to sweep IP addresses
sweep_ips() {
    base_ip="$1"
    for ip in $(seq 1 254); do
        ping -c 1 -W 1 "$base_ip.$ip" >/dev/null 2>&1 &
    done
    wait
}

# Main script
if [ "$1" == "" ]; then
    echo "Invalid Input!"
    echo "Syntax: ./ipsweep.sh 192.168.1"
    exit 1
fi

if ! validate_ip "$1"; then
    echo "Invalid IP address!"
    exit 1
fi

echo "Sweeping IP addresses in subnet $1.0/24..."
sweep_ips "$1"

echo "Results:"
for ip in $(seq 1 254); do
    if ping -c 1 -W 1 "$1.$ip" >/dev/null 2>&1; then
        echo "$1.$ip is reachable"
    else
        echo "$1.$ip is unreachable"
    fi
done

