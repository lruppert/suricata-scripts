#!/bin/sh
#
PATH=/usr/sbin:$PATH
export PATH
if [ ! -d /proc/`cat /var/run/suricata.pid` ]; then
	service suricata start
fi
