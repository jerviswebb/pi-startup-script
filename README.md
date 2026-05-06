# Pi Startup Script

Setup:

1. Place `first_install.service` in `/etc/systemd/system/`
2. Place `.first_install.sh` in `/opt/`
3. Enable the service with `sudo systemctl enable first_install.service`
4. Reboot the system.
5. Ensure it ran properly by checking for a file named `/etc/.do_not_remove`
6. If it didn't run properly, correct as necessary. Otherwise, be sure to remove the `.do_not_remove` file if you want the startup script to run again (eg. if you are creating a new RPiOS image).
