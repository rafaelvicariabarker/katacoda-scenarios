#!/bin/sh
while [ ! -f /root/setup/setup.sh ] ; do sleep 1 ; done
source /root/setup/setup.sh
. ~/.bashrc
export NG_CLI_ANALYTICS=CI