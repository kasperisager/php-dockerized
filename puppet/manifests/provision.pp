include provision

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

# Class: provision::params
#
#
class provision::params
{
  # Puppet variables
  $puppet_dir     = "/vagrant/puppet"
  $templates_dir  = "$puppet_dir/templates"

  # Webserver variables
  $sites_dir      = "/var/www"
  $fpm_listen     = "/var/run/php5-fpm.sock"
  $nginx_template = "nginx/vhost.php.conf.erb"

  # Database variables
  $dbuser         = "root"
  $dbpassword     = "vagrant"
  $dbconfig       = "/etc/.puppet.cnf"
}

# Class: provision::php::modules
#
#
class provision::php::modules
{
  $php_ini_dir     = "${provision::params::templates_dir}/php/"
  $notify_services = [
    Service["nginx"],
    Class["php::fpm::service"]
  ]

  php::module { [ "cgi", "curl" ]:
    notify => $notify_services
  }

  php::module { [ "mysql", "sqlite", "mcrypt", "memcache" ]:
    notify  => $notify_services,
    content => $php_ini_dir
  }

  php::module { "apc":
    package_prefix => "php-",
    notify         => $notify_services,
    content        => $php_ini_dir
  }
}

# Class: provision::php::pools
#
#
class provision::php::pools
{
  php::fpm::pool { "www":
    listen => $provision::params::fpm_listen
  }
}

# Class: provision::percona::config
#
#
class provision::percona::config
{
  percona::adminpass{ $provision::params::dbuser:
    password  => $provision::params::dbpassword,
  }

  percona::mgmt_cnf { $provision::params::dbconfig:
    password => $provision::params::dbpassword,
    user     => $provision::params::dbuser,
  }

  class { "percona::params":
    mgmt_cnf => $provision::params::dbconfig,
  }
}

# Class: provision::percona::databases
#
#
class provision::percona::databases
{
  percona::database { "database":
    ensure => present
  }
}

# Class: provision::percona::rights
#
#
class provision::percona::rights
{
  percona::rights { "root@localhost":
    database => "*",
    password => "vagrant",
    priv     => "all"
  }
}

# Class: provision::nginx::vhosts
#
#
class provision::nginx::vhosts
{
  $sites_dir = $provision::params::sites_dir
  $nginx_dir = "${provision::params::templates_dir}/nginx"

  nginx::vhost { "default":
    root     => "${sites_dir}/default",
    index    => "index.php",
    template => "${nginx_dir}/default.conf.erb"
  }

  # Pre-defined setups

  nginx::vhost { "vanilla":
    root     => "${sites_dir}/vanilla",
    index    => "index.php",
    template => "${nginx_dir}/vanilla.conf.erb"
  }

  nginx::vhost { "kirby":
    root     => "${sites_dir}/kirby",
    index    => "index.php",
    template => "${nginx_dir}/kirby.conf.erb"
  }

  nginx::vhost { "statamic":
    root     => "${sites_dir}/statamic",
    index    => "index.php",
    template => "${nginx_dir}/statamic.conf.erb"
  }
}
