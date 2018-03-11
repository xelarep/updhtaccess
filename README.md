# updhtaccess
Shell (bash) script for Synology DiskStation DSM task scheduler usage to dynamically generate a .htaccess file.

This script determines the global IPv6 address of the Diskstation provided by the ISP/DNS and extracts the prefix (/64) to the list of granted useres who do not need to enter a password for a restriced area.

The script expects a valid .htaccess.tmpl file (also the .htpasswd as used in the sample....).

If a template is available it will be copied to .htaccess and amended by the local IPv6 Network (the local LAN...) and a requirement for a valid user.

Put this script in your admin home of your DSM and add a task with the rights of the user admin. Call it once a day, after your router typically gets a new prefix.

In my case I update once a day as my ISP prefix changes once a day.

grep search pattern: change 2a02 to the first part of the address of your provider.
