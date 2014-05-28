# Class: lnpp::php::pools
#
#
class lnpp::php::pools
{
  php::fpm::pool { "www":
    listen => $lnpp::params::fpm_listen
  }
}
