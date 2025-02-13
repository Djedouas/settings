#!/bin/bash

khard list --fields Name,Email | grep -v book | grep -v Name | fzf | awk '{printf "%s", $4}' | kitten @ send-text --match recent:1 --stdin
