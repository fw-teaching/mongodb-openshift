# Use the official MongoDB base image
FROM mongo:latest

# Create the MongoDB data directory and ensure proper permissions
RUN mkdir -p /data/db /data/configdb && chown -R mongodb:mongodb /data/db /data/configdb

# Switch to the non-root 'mongodb' user
USER mongodb

# Set the MongoDB data directory environment variable
ENV MONGO_DATA_DIR=/data/db

# Create the MongoDB data directory
RUN mkdir -p $MONGO_DATA_DIR

# Expose the default MongoDB port
EXPOSE 27017

# Run MongoDB
CMD ["mongod" "--auth"]
