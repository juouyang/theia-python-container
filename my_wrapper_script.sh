#!/bin/bash

# Start the first process
if [ ! -z "$PASSWORD" ]; then
  htpasswd -bc /etc/nginx/.htpasswd $USERNAME $PASSWORD
fi
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