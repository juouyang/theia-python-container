#!/bin/bash

# Start the first process
nginx -g 'daemon on;'
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start nginx: $status"
  exit $status
fi

# Start the second process
node /home/theia/src-gen/backend/main.js /home/project \
  --ssl --cert /etc/nginx/certificates/cert.pem --certkey /etc/nginx/certificates/key.pem \
  --hostname 127.0.0.1
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start theia: $status"
  exit $status
fi