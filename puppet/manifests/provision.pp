include provision

import "./core/*", "./provision/**/*"

# Class: provision
#
#
class provision
{
  include core::params

  include apt

  # PHP and PHP-FPM
  include provision::php::install,
          provision::php::modules,
          provision::php::pools

  # Nginx
  include provision::nginx::install,
          provision::nginx::vhosts

  # Percona
  include provision::percona::config,
          provision::percona::install,
          provision::percona::databases,
          provision::percona::rights

  # HHVM and HHVM FastCGI
  include provision::hhvm::install,
          provision::hhvm::service

  # XHProf and XHProf.io
  include provision::xhprof::install,
          provision::xhprof::database,
          provision::xhprof::vhost

  # Webgrind
  include provision::webgrind::install,
          provision::webgrind::vhost

  package { "phpmyadmin":
    ensure  => installed,
    require => Package["php5-cgi"]
  }

  package { "curl":
    ensure  => installed
  }
}
