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

  php::module { "cgi":
    notify => $notify_services
  }

  php::module { [ "mysql", "mcrypt", "memcache" ]:
    notify  => $notify_services,
    content => $php_ini_dir
  }

  php::module { "apc":
    package_prefix => "php-",
    notify         => $notify_services,
    content        => $php_ini_dir
  }
}
