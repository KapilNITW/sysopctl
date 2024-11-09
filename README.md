
# sysopctl
sysopctl is a custom command-line tool for managing system services, processes, disk usage,
system logs, and backups on Linux-based systems. It provides a simplified interface for system
administrators to monitor and control system resources effectively.
## Features
- Service Management: Start, stop, and list running services.
- System Monitoring: View system load and process monitoring.
- Disk Usage: Check disk space usage by partition.
- Log Analysis: Analyze system logs for critical entries.
- Backup: Backup system files to a designated location.
## Prerequisites
- A Linux-based operating system (e.g., Ubuntu, CentOS, Debian)
- systemctl (for managing services)
- rsync (for backing up files)
- journalctl (for analyzing logs)
- Root (sudo) permissions may be required for some operations (e.g., starting/stopping services).
## Installation
1. Clone this repository to your local machine:
git clone https://github.com/<your-username>/sysopctl.git
cd sysopctl
2. Make the script executable:
chmod +x sysopctl.sh
## Usage
To use the sysopctl command, simply run it with the desired option from the terminal. Below are the
available commands and their usage.
### Show Help
To view the help information:
./sysopctl.sh --help
### Show Version
To view the current version of sysopctl:
./sysopctl.sh --version
### List Running Services
To list all active services:
./sysopctl.sh service list
### Start a Service
To start a service (replace <service-name> with the actual service name):
./sysopctl.sh service start <service-name>
Example:
./sysopctl.sh service start apache2
### Stop a Service
To stop a service (replace <service-name> with the actual service name):
./sysopctl.sh service stop <service-name>
Example:
./sysopctl.sh service stop apache2
### View System Load
To view the current system load averages:
./sysopctl.sh system load
### Check Disk Usage
To check the disk usage on all partitions:
./sysopctl.sh disk usage
### Monitor System Processes
To monitor system processes using top:
./sysopctl.sh process monitor
### Analyze System Logs
To analyze recent critical log entries:
./sysopctl.sh logs analyze
### Backup System Files
To back up files from a specific directory (replace <path> with the directory path):
./sysopctl.sh backup <path>
Example:
./sysopctl.sh backup /home/user/data





