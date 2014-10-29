#!/bin/bash

set -e -x
#/usr/bin/supervisord -c /etc/supervisor/supervisord.conf -n
source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND
