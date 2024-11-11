# Use the official Mosquitto Docker image
FROM eclipse-mosquitto:latest

# Set environment variable for Render's dynamic port
ENV RENDER_PORT=${PORT}

# Copy the Mosquitto configuration file
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose default MQTT ports (1883) and WebSocket port (9001)
EXPOSE 1883 9001

# Start Mosquitto using the entrypoint script
CMD ["/entrypoint.sh"]
