# Class: provision::php::install
#
#
class provision::php::install
{
  apt::ppa { "ppa:ondrej/php5": }

  package { "python-software-properties":
    ensure => installed,
  }

  class { "php":
    require => [
      Apt::Ppa["ppa:ondrej/php5"],
      Package["python-software-properties"]
    ]
  }

  class { "php::fpm": }
}
