FROM tutum/mysql:latest

# Install packages
RUN apt-get update
RUN apt-get install -y supervisor

# Create required directories
RUN mkdir -p /var/log/supervisor

# Add configuration files
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose volumes
VOLUME ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306

CMD ["/run.sh"]
