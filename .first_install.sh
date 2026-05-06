#!/bin/bash

if [ -f "/opt/.do_not_remove" ]; then
        exit 0
fi

# Expand the filesystem
raspi-config --expand-rootfs

# Regenerate SSH keys
echo "Regenerating SSH keys..."
rm /etc/ssh/ssh_host*
ssh-keygen -A

# Reset ZeroTier node id
echo "Regenerating ZT ID..."
service zerotier-one stop
rm /var/lib/zerotier-one/identity.*
service zerotier-one start

# Join Jerviswebb network
echo -n "Joining ZT network"
while ! [[ $(zerotier-cli info) == *"ONLINE"* ]]; do
        echo -n "."
        sleep 1
done
zerotier-cli join b15644912ecb5544
echo ""
echo "ZT network joined."

# Adds file to prevent script run
echo "Creating do_not_remove file..."
touch /opt/.do_not_remove

echo "Finished."
