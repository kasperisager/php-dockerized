# Class: provision::percona::install
#
#
class provision::percona::install
{
  class { "percona":
    server          => true,
    manage_repo     => true,
    percona_version => "5.5",
    require         => Class["apt"]
  }
}
