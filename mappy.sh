#!/bin/bash

mkdir nmap
nmap_ports=$(nmap --min-rate 10000 -p- $1 | grep open | cut -d "/" -f 1 | tr -s "[:space:]" "," | sed 's/.$//');
nmap -sV -sC -p ${nmap_ports} $1 -oN nmap/initial -v
nmap --script vuln -oN nmap/vuln -p ${nmap_ports} $1
