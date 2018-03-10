# updhtaccess
bash script for Synology DiskStation task-planner.

This script determines the IPv6 address of the Diskstation and puts the prefix (/64) to the list of granted useres who do not need to enter a password for a restriced area.

The script expects a valid .htaccess.tmpl file (also the .htpasswd as used in the sample....).

If a template is available it will be copied to .htaccess and amended by the local IPv6 Network (the local LAN...) and a requirement for a valid user.

Put this script in your admin home of you DSM and add a task with the rights of the user admin.

In my case I update once a day as my IPv6 Provider prefix changes once a day.
