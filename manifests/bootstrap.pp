# Class: bootstrap
#
#
class bootstrap
{
  include provision::params

  Exec {
    path        => "/bin/:/sbin/:/usr/bin/:/usr/sbin/:/usr/local/bin",
    environment => "HOME=/home/vagrant"
  }

  include bootstrap::update, bootstrap::packages, bootstrap::modules
}

include bootstrap
