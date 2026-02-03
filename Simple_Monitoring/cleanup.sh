#!/bin/bash

echo "** Stopping Netdata **"
sudo systemctl stop netdata 2>/dev/null

echo "** Looking for Netdata uninstaller **"
UNINSTALLER=$(sudo find / -name netdata-uninstaller.sh 2>/dev/null | head -n 1)

if [ -n "$UNINSTALLER" ]; then
    echo "Running Netdata uninstaller..."
    sudo bash "$UNINSTALLER" --yes
else
    echo "Netdata uninstaller not found, trying apt cleanup..."
    sudo apt remove --purge netdata -y
    sudo rm -rf /etc/netdata /var/lib/netdata /var/cache/netdata
fi

echo "Cleanup completed."
