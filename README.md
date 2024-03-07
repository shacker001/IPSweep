# IP Sweep Script

This bash script performs an IP sweep on a given subnet to check for reachable IP addresses.

## Usage

```bash
./ipsweep.sh <base_ip_address
```
Replace <base_ip_address> with the desired base IP address (e.g., 192.168.1).

## Features

    Sweep IP addresses in a subnet to check reachability.
    Basic input validation.
    Interrupt mechanism (Ctrl+C) to gracefully exit.

## Requirements

	Bash (Bourne Again Shell)

## Installation
clone this repository:
```bash
git clone https://github.com/yourusername/ipsweep.git
```
Navigate to the project directory:
```bash
cd ipsweep
```
Make the script executable:
```bash
chmod +x ipsweep.sh
```
## Usage Examples
Sweep IP addresses in subnet 192.168.1.0/24:
```bash
    ./ipsweep.sh 192.168.1
```

## Contributing

Contributions are welcome! If you have any suggestions, bug fixes, or feature implementations, feel free to open an issue or create a pull request.
