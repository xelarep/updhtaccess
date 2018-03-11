#!/bin/bash
# Dynamic IPv6 .htaccess file generator
#
# Usage: ./updhtaccess.sh <directory>
# <directory> without trailing slash!
# example: ./updhtaccess.sh /volume1/web/private

hta_folder="$1"
hta_file="$1/.htaccess"
hta_tmpl="$hta_file.tmpl"

#check if template available
if [ -f "$hta_tmpl" ]
then
	echo "$hta_tmpl found."
else
	echo "$hta_tmpl not found. updhtaccess.sh terminated!"
	exit
fi

# DSM implementation
hta_ipv6=$(ifconfig eth0 | grep 2a02 | awk '/inet6/{print $3}' | sed 's/\/64/\/56/g')
# macOS for testing
#hta_ipv6=$(ifconfig en0 | grep 'autoconf secured' | awk '/inet6/{print $2}')

hta_prefix="Require ip $hta_ipv6"

# create new .htaccess file based on template
cp $hta_tmpl $hta_file
echo "$hta_prefix" >> $hta_file 2>&1
echo "Require valid-user" >> $hta_file 2>&1
echo "$hta_file written."
