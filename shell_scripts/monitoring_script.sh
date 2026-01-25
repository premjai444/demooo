#!/bin/bash

# ==============================
# Configuration
# ==============================
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
SERVICE_NAME="ssh"
PING_HOST="8.8.8.8"
LOG_FILE="/var/log/system_monitor.log"

# ==============================
# Functions
# ==============================

log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" | tee -a "$LOG_FILE"
}

check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

    CPU_USAGE=${CPU_USAGE%.*}

    if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
        log_message "ALERT: High CPU usage: ${CPU_USAGE}%"
        return 1
    else
        log_message "OK: CPU usage is ${CPU_USAGE}%"
        return 0
    fi
}

check_memory() {
    MEM_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

    if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
        log_message "ALERT: High Memory usage: ${MEM_USAGE}%"
        return 1
    else
        log_message "OK: Memory usage is ${MEM_USAGE}%"
        return 0
    fi
}

check_disk() {
    DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

    if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
        log_message "ALERT: High Disk usage: ${DISK_USAGE}%"
        return 1
    else
        log_message "OK: Disk usage is ${DISK_USAGE}%"
        return 0
    fi
}

check_service() {
    systemctl is-active --quiet "$SERVICE_NAME"

    if [ $? -ne 0 ]; then
        log_message "ALERT: Service $SERVICE_NAME is DOWN"
        return 1
    else
        log_message "OK: Service $SERVICE_NAME is running"
        return 0
    fi
}

check_network() {
    ping -c 2 "$PING_HOST" > /dev/null 2>&1

    if [ $? -ne 0 ]; then
        log_message "ALERT: Network unreachable ($PING_HOST)"
        return 1
    else
        log_message "OK: Network reachable ($PING_HOST)"
        return 0
    fi
}

# ==============================
# Main Execution
# ==============================

log_message "===== Monitoring Started ====="

FAIL_COUNT=0

check_cpu || FAIL_COUNT=$((FAIL_COUNT+1))
check_memory || FAIL_COUNT=$((FAIL_COUNT+1))
check_disk || FAIL_COUNT=$((FAIL_COUNT+1))
check_service || FAIL_COUNT=$((FAIL_COUNT+1))
check_network || FAIL_COUNT=$((FAIL_COUNT+1))

log_message "===== Monitoring Finished ====="

if [ "$FAIL_COUNT" -gt 0 ]; then
    exit 1
else
    exit 0
fi
