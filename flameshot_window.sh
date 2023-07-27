#!/bin/bash

a=$(xwininfo -id $(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}') | awk '{if (NR==4 || NR==5 || NR==8 || NR==9) print $NF}')
a=($a)
flameshot gui --region ${a[2]}x${a[3]}+${a[0]}+${a[1]}
