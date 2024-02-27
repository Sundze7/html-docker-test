# Use a lightweight web server as the base image
FROM nginx:alpine

# # Remove the default Nginx configuration
# RUN rm -rf /etc/nginx/conf.d/*

# Overwrite Nginx web root directory
COPY . /usr/share/nginx/html