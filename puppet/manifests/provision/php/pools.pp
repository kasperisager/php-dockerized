# Class: provision::php::pools
#
#
class provision::php::pools
{
  php::fpm::pool { "www":
    listen => $core::params::fpm_listen
  }
}
