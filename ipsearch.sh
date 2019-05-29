#!/bin/bash

LENROLLS=$(ifconfig | grep -v "127.0.0.1" | grep -oP "(?<=inet ).*(?= netmask)" -c)
INTERFACE=$(ifconfig | grep -v "mtu 65536" | grep -oP ".*(?=: flags)")
IP=$(ifconfig | grep -v "127.0.0.1" | grep -oP "(?<=inet ).*(?= netmask)")

vetorip=($IP)
vetorinet=($INTERFACE)
LENROLLS=$((LENROLLS-1))

for i in `seq 0 $LENROLLS`
do
	echo ${vetorinet[$i]}": " ${vetorip[$i]}
done
