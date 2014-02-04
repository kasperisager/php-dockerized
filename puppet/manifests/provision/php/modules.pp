# Class: provision::php::modules
#
#
class provision::php::modules
{
  $php_ini_dir     = "${core::params::templates_dir}/php/"
  $notify_services = [
    Service["nginx"],
    Service["hhvm-fastcgi"],
    Class["php::fpm::service"]
  ]

  php::module { [ "cgi", "curl" ]:
    notify => $notify_services
  }

  php::module { [ "gd", "mysql", "sqlite", "mcrypt", "memcache", "xdebug", "apcu" ]:
    notify  => $notify_services,
    content => $php_ini_dir
  }
}
