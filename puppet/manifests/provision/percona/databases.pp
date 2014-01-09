# Class: provision::percona::databases
#
#
class provision::percona::databases
{
  percona::database { "database":
    ensure => present
  }
}
