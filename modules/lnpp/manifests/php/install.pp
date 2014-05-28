# Class: lnpp::php::install
#
#
class lnpp::php::install
{
  class { "php": }
  class { "php::fpm": }

  package { "curl":
    ensure => present
  }
}
