#!/bin/bash

set -e -x
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf -n
