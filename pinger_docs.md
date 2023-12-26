# Pinger Script Documentation

## Overview
`pinger`, is designed to monitor connectivity to vms. It logs the results into an InfluxDB database.

## Requirements
- `fping`: A program used to send ICMP echo requests to network hosts.
- `curl`: A tool to transfer data from or to a server.
- A Unix-like environment with standard utilities like `awk`, `grep`, `cut`, and `tr`.

## Configuration
- The script requires a configuration file located at `/etc/pinger/pinger.conf`.
- This file should contain `database_url`, `database_name`, and `targets` parameters.

## Functionality
1. **Logging**: Uses a function `log` to log messages with a 'pinger' tag.
2. **Dependency Check**: Verifies if `fping` is installed.
3. **Configuration Loading**: Reads database URL, name, and target hosts from the configuration file.
4. **Configuration Validation**: Checks if the necessary configuration values are present and validates the `database_name` for security.
5. **Database Creation**: Attempts to create the specified database in InfluxDB if it doesn't exist.
6. **Continuous Monitoring**: In an infinite loop, it pings the specified targets, logs the round-trip time, and writes the data to InfluxDB.
7. **Data Transmission**: Uses `curl` to send data to the InfluxDB database.

## Usage
- Place the script in an appropriate directory (e.g., `/usr/local/bin`).
- Ensure it has executable permissions.
- Customize `/etc/pinger/pinger.conf` with the required values.
- Run the script. It will start monitoring and logging data.

## Security
- The script includes a basic security check to prevent SQL injection by validating the `database_name`.

## Note
- The script runs indefinitely until manually stopped.
- Ensure the InfluxDB instance is accessible and the provided URL is correct.
- The script depends on network connectivity for its operations.