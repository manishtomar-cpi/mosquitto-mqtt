# Use the official Mosquitto Docker image
FROM eclipse-mosquitto:latest

# Copy the Mosquitto configuration file
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Expose MQTT and WebSocket ports
EXPOSE 1883 9001

# Replace the listener port dynamically with the PORT environment variable during container start
CMD sh -c "sed -i 's/^listener.*/listener ${PORT}/' /mosquitto/config/mosquitto.conf && /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf"
