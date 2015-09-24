################################################################################
# Base image
################################################################################

FROM tutum/nginx:latest

################################################################################
# Build instructions
################################################################################

# Only use stable sources
RUN rm -rf /etc/apt/sources.list.d/proposed.list

# Install packages
RUN apt-get update && apt-get install -my \
  supervisor \
  curl \
  wget \
  php5-curl \
  php5-fpm \
  php5-gd \
  php5-memcached \
  php5-mysql \
  php5-mcrypt \
  php5-sqlite \
  php5-xdebug

  # Ensure that PHP5 FPM is run as root.
  RUN sed -i "s/user = www-data/user = root/" /etc/php5/fpm/pool.d/www.conf
  RUN sed -i "s/group = www-data/group = root/" /etc/php5/fpm/pool.d/www.conf

# Install HHVM
RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo deb http://dl.hhvm.com/ubuntu trusty main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update && apt-get install -y hhvm

# Create required directories
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /etc/nginx
RUN mkdir -p /var/run/php5-fpm
RUN mkdir -p /var/run/hhvm

# Add configuration files
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY conf/php.ini /etc/php5/fpm/conf.d/40-custom.ini

################################################################################
# Volumes
################################################################################

VOLUME ["/var/www", "/etc/nginx/sites-enabled"]

################################################################################
# Ports
################################################################################

EXPOSE 80 9000

################################################################################
# Entrypoint
################################################################################

ENTRYPOINT ["/usr/bin/supervisord"]
