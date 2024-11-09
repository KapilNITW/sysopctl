#!/bin/bash

VERSION="v0.1.0"

# Display Help
function show_help() { 
  echo "Usage: sysopctl [command] [options]"
  echo "Commands:"
  echo "  --help                Show help"
  echo "  --version             Show version"
  echo "  service list          List running services"
  echo "  service start <name>  Start a service"
  echo "  service stop <name>   Stop a service"
  echo "  system load           Show system load"
  echo "  disk usage            Show disk usage"
  echo "  process monitor       Monitor system processes"
  echo "  logs analyze          Analyze system logs"
  echo "  backup <path>         Backup system files"
}

# Display Version
function show_version() { 
  echo "sysopctl version $VERSION"
}

# List Running Services
function list_services() { 
  echo "Listing running services..."
  systemctl list-units --type=service
}

# View System Load
function view_system_load() { 
  echo "Current system load averages:"
  uptime
}

# Start a Service
function start_service() { 
  if systemctl start "$1"; then
    echo "Service '$1' started successfully."
  else
    echo "Failed to start service '$1'."
  fi
}

# Stop a Service
function stop_service() { 
  if systemctl stop "$1"; then
    echo "Service '$1' stopped successfully."
  else
    echo "Failed to stop service '$1'."
  fi
}

# Check Disk Usage
function check_disk_usage() { 
  echo "Disk usage by partition:"
  df -h
}

# Monitor System Processes
function monitor_processes() { 
  echo "Monitoring system processes (press q to quit)..."
  top
}

# Analyze System Logs
function analyze_logs() { 
  echo "Analyzing recent critical system logs..."
  journalctl -p crit
}

# Backup System Files
function backup_files() { 
  if [ -z "$1" ]; then
    echo "Please provide a path to back up."
    return 1
  fi
  echo "Starting backup of '$1'..."
  if rsync -av "$1" /backup/location/; then
    echo "Backup of '$1' completed successfully."
  else
    echo "Backup of '$1' failed."
  fi
}

# Parse command-line arguments and call appropriate function
case "$1" in
  --help) show_help ;;
  --version) show_version ;;
  
  service)
    case "$2" in
      list) list_services ;;
      start) start_service "$3" ;;
      stop) stop_service "$3" ;;
      *) echo "Unknown service command" ;;
    esac
    ;;

  system)
    case "$2" in
      load) view_system_load ;;
      *) echo "Unknown system command" ;;
    esac
    ;;

  disk)
    case "$2" in
      usage) check_disk_usage ;;
      *) echo "Unknown disk command" ;;
    esac
    ;;

  process)
    case "$2" in
      monitor) monitor_processes ;;
      *) echo "Unknown process command" ;;
    esac
    ;;

  logs)
    case "$2" in
      analyze) analyze_logs ;;
      *) echo "Unknown logs command" ;;
    esac
    ;;

  backup)
    backup_files "$2"
    ;;

  *)
    echo "Unknown command. Use --help for usage information."
    ;;
esac

