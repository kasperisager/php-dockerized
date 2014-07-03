FROM tutum/memcached:latest

# Install packages
RUN apt-get update
RUN apt-get install -y supervisor

# Create required directories
RUN mkdir -p /var/log/supervisor

# Add configuration files
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 11211

CMD ["/run.sh"]
