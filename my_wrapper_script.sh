#!/bin/bash

# Start the first process
if [ ! -z "$PASSWORD" ]; then
  htpasswd -bc /etc/nginx/.htpasswd $USERNAME $PASSWORD
  sed -i '/TEXT_TO_BE_REPLACED/c\auth_basic on;auth_basic_user_file /etc/nginx/.htpasswd;' /etc/nginx/common.conf
else
  sed -i '/TEXT_TO_BE_REPLACED/c\' /etc/nginx/common.conf
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