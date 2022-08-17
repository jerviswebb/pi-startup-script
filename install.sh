#!/bin/bash

while true; do
    if [ $(systemctl is-active zerotier-one) = "active" ]; then
        break
    fi
    sleep 1
done

sleep 10

# Reset ZeroTier node id
service zerotier-one stop
rm /var/lib/zerotier-one/identity.*
service zerotier-one start