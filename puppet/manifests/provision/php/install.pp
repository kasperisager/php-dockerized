# Class: provision::php::install
#
#
class provision::php::install
{
  class { "php": }
  class { "php::fpm": }
}
