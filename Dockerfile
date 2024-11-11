# Use the official Mosquitto Docker image
FROM eclipse-mosquitto:latest

# Copy your configuration file into the container
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Expose the default Mosquitto ports
EXPOSE 1883 9001

# Start the Mosquitto broker
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
