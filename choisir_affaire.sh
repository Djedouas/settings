#!/bin/bash

ls ~/Documents/oslandia/affaires/ | grep -E "[[:digit:]]{4}_[[:digit:]]{2}_" | fzf --print0 | kitten @ send-text --match recent:1 --stdin
