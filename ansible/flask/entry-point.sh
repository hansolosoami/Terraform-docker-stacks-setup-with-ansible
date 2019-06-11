#!/bin/bash

#
# Allows to delete development-time specific configuration
#

#remove_other_environment_configs


exec /usr/local/bin/supervisord  -c /etc/supervisor/conf.d/supervisord.conf
