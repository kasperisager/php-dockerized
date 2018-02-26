################################################################################
# Base image
################################################################################

FROM nginx

################################################################################
# Build instructions
################################################################################

# Remove default nginx configs.
# Install packages
RUN rm -f /etc/nginx/conf.d/* \
  && mkdir -p /run/php /run/hhvm \
  && apt-get update && apt-get upgrade -y && apt-get install -my \
    supervisor \
    curl \
    wget \
    php-curl \
    php-fpm \
    php-gd \
    php-memcached \
    php-mysql \
    php-mcrypt \
    php-sqlite3 \
    php-xdebug \
    php-apcu

# Install HHVM
RUN echo "deb http://deb.debian.org/debian sid main" >> /etc/apt/sources.list \
    && apt-get update && apt-get install -y hhvm

# Ensure that PHP5 FPM is run as root.
# Pass all docker environment
# Get access to FPM-ping page /ping
# Get access to FPM_Status page /status
# Prevent PHP Warning: 'xdebug' already loaded.
# XDebug loaded with the core
RUN sed -i "s/user = www-data/user = root/" /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i "s/group = www-data/group = root/" /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i '/^;clear_env = no/s/^;//' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i '/^;ping\.path/s/^;//' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i '/^;pm\.status_path/s/^;//' /etc/php/7.0/fpm/pool.d/www.conf \
    && sed -i '/.*xdebug.so$/s/^/;/' /etc/php/7.0/mods-available/xdebug.ini

# Add configuration files
COPY conf/nginx.conf /etc/nginx/
COPY conf/supervisord.conf /etc/supervisor/conf.d/
COPY conf/php.ini /etc/php/7.0/fpm/conf.d/40-custom.ini

################################################################################
# Volumes
################################################################################

VOLUME ["/var/www", "/etc/nginx/conf.d"]

################################################################################
# Ports
################################################################################

EXPOSE 80 443 9000

################################################################################
# Entrypoint
################################################################################

ENTRYPOINT ["/usr/bin/supervisord"]
