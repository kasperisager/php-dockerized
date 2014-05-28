# Class: lnpp::php::modules
#
#
class lnpp::php::modules
{
  $notify_services = [
    Service["nginx"],
    Service["hhvm"],
    Class["php::fpm::service"]
  ]

  php::module { [ "cgi", "curl" ]:
    notify => $notify_services
  }

  php::module { [ "gd", "mysql", "sqlite", "mcrypt", "memcache", "xdebug" ]:
    notify  => $notify_services,
    content => "lnpp/php/"
  }

  php::module { "apc":
    package_prefix => "php-",
    notify         => $notify_services,
    content        => "lnpp/php/"
  }
}
