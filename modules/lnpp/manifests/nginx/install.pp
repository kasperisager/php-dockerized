# Class: lnpp::nginx::install
#
#
class lnpp::nginx::install
{
  class { "nginx":
    ensure        => present,
    default_vhost => "default"
  }
}
