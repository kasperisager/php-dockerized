# Class: bootstrap::packages
#
#
class bootstrap::packages
{
  package { "git-core":
    ensure => installed
  }
}
