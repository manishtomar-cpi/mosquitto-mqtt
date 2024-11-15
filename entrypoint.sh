#!/bin/bash

# Check if PORT is provided by Render
if [ -z "$PORT" ]; then
  echo "ERROR: PORT environment variable not set!"
  exit 1
fi

# Update the Mosquitto configuration to use the Render-assigned PORT
sed -i "s/^listener.*/listener $PORT/" /mosquitto/config/mosquitto.conf

# Start the Mosquitto broker
exec /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf
