sed '/TZID=/s/,/\\,/g' $1 | sed 's/(UTC+01:00)/(UTC+01\\:00)/g' > /tmp/my.ics
