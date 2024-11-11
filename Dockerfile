# Use the official Mosquitto Docker image
FROM eclipse-mosquitto:latest

# Copy the Mosquitto configuration file
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Copy the entrypoint script to the root of the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose MQTT and WebSocket ports
EXPOSE 1883 9001

# Use the custom entrypoint script
CMD ["/usr/local/bin/entrypoint.sh"]
