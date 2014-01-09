# Class: provision::nginx::install
#
#
class provision::nginx::install
{
  class { "nginx":
    ensure        => present,
    default_vhost => "default"
  }
}
