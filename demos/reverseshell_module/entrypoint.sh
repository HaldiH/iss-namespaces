#!/bin/sh

insmod /reverseshell_module.ko
cat << EOF

*******************************************
* Welcome to my awesome service!          *
* My awesome service is currently running *
*******************************************

EOF
sleep 1000