include provision

import "./core/*", "./provision/**/*"

# Class: provision
#
#
class provision
{
  include core::params

  include apt

  include php, php::fpm

  include provision::php::modules,
          provision::php::pools

  class { "nginx":
    ensure        => present,
    default_vhost => "default"
  }

  include provision::nginx::vhosts

  include provision::percona::config

  class { "percona":
    server          => true,
    manage_repo     => true,
    percona_version => "5.5",
    require         => Class["apt"]
  }

  include provision::percona::databases,
          provision::percona::rights

  package { "phpmyadmin":
    ensure  => installed,
    require => Package["php5-cgi"]
  }

  include provision::hhvm::install,
          provision::hhvm::service

  include provision::xhprof::install,
          provision::xhprof::database,
          provision::xhprof::vhost
}
