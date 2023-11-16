#!/bin/bash

while true; do
    if [ $(systemctl is-active zerotier-one) = "active" ]; then
        break
    fi
    sleep 1
done

sleep 10

# Regenerate SSH keys
rm /etc/ssh/ssh_host*
ssh-keygen -A

# Reset ZeroTier node id
service zerotier-one stop
rm /var/lib/zerotier-one/identity.*
service zerotier-one start

# Display ZeroTier id once
_ZT_ID=$(zerotier-cli info | cut -d ' ' -f3 | xargs)
printf "My ZeroTier ID is %s\n" "$_ZT_ID"
