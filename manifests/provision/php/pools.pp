# Class: provision::php::pools
#
#
class provision::php::pools
{
  php::fpm::pool { "www":
    listen => $provision::params::fpm_listen
  }
}
