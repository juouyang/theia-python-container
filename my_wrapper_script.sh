#!/bin/bash

# Start the first process
htpasswd -bc /etc/nginx/.htpasswd $USERNAME $PASSWORD
nginx -g 'daemon on;'
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start nginx: $status"
  exit $status
fi

# Start the second process
node /home/theia/src-gen/backend/main.js /home/project
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start theia: $status"
  exit $status
fi