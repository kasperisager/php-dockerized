# Class: provision
#
#
class provision
{
  include provision::params
  include apt, php, php::fpm

  include provision::php::modules
  include provision::php::pools

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

  include provision::percona::databases
  include provision::percona::rights

  package { "phpmyadmin":
    ensure  => installed,
    require => Package["php5-cgi"]
  }
}

include provision
