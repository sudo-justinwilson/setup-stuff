#!/bin/bash

# This is a script to bring up openvswitch interfaces on login:

## flush the IP address:
/sbin/ifconfig eno1 0
## bring bridge up:
/sbin/ip link set vsbr0 up
## add IP to bridge:
/sbin/ip address add 192.168.0.48/24 dev vsbr0
## add default route:
/sbin/ip route add default via 192.168.0.1 dev vsbr0
