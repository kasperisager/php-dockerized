################################################################################
# Base image
################################################################################

FROM nginx

################################################################################
# Build instructions
################################################################################

# Remove default nginx configs.
RUN rm -f /etc/nginx/conf.d/*

# Install packages
RUN apt-get update && apt-get install -my \
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
  php-apcu \
  # Ensure that PHP7 FPM is run as root.
  && sed -i "s/user = www-data/user = root/" /etc/php/fpm/pool.d/www.conf \
  && sed -i "s/group = www-data/group = root/" /etc/php/fpm/pool.d/www.conf \
  # Pass all docker environment
  && sed -i '/^;clear_env = no/s/^;//' /etc/php/fpm/pool.d/www.conf \
  # Get access to FPM-ping page /ping
  && sed -i '/^;ping\.path/s/^;//' /etc/php/fpm/pool.d/www.conf \
  # Get access to FPM_Status page /status
  && sed -i '/^;pm\.status_path/s/^;//' /etc/php/fpm/pool.d/www.conf \
  # Prevent PHP Warning: 'xdebug' already loaded.
  # XDebug loaded with the core
  && sed -i '/.*xdebug.so$/s/^/;/' /etc/php/mods-available/xdebug.ini \
  # Install HHVM
  && apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 \
  && echo deb http://dl.hhvm.com/debian stretch main | tee /etc/apt/sources.list.d/hhvm.list \
  && apt-get update && apt-get install -y hhvm \
  && rm -r /var/lib/apt/lists/*

# Add configuration files
COPY conf/nginx.conf /etc/nginx/
COPY conf/supervisord.conf /etc/supervisor/conf.d/
COPY conf/php.ini /etc/php/fpm/conf.d/40-custom.ini

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
