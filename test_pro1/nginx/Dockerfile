# Set nginx base image
FROM  ubuntu:14.04

MAINTAINER pushpender singh;

RUN apt-get update -y && apt-get install -y  supervisor nginx

# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#Exposing Ports 
EXPOSE 80 443
CMD ["/usr/bin/supervisord"]
