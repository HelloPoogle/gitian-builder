#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends -y install expect-dev parted
swapoff -a
{ cat <<\EOF; sleep 1; while pidof parted; do sleep 1; done; } | unbuffer -p parted /dev/vda
rm 2
resizepart 1
yes
100%
quit
EOF
resize2fs /dev/vda1
