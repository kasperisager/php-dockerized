include bootstrap

# Class: bootstrap
#
#
class bootstrap
{
  Exec {
    path        => "/bin/:/sbin/:/usr/bin/:/usr/sbin/:/usr/local/bin",
    environment => "HOME=/home/vagrant"
  }

  include bootstrap::update, bootstrap::packages, bootstrap::modules
}

# Class: bootstrap::modules
#
#
class bootstrap::modules
{
  package { "puppet":
    ensure   => installed,
    provider => "gem"
  } ->

  package { "facter":
    ensure   => "1.6.13",
    provider => "gem"
  } ->

  package { "librarian-puppet":
    ensure   => installed,
    provider => "gem"
  } ->

  exec { "librarian-puppet install":
    cwd => "/vagrant/puppet"
  }
}

# Class: bootstrap::packages
#
#
class bootstrap::packages
{
  package { "git-core":
    ensure => installed
  }
}

# Class: bootstrap::update
#
#
class bootstrap::update
{
  exec { "apt-get update":
    command => "/usr/bin/apt-get update && touch /tmp/apt.update",
    onlyif  => "/bin/sh -c '[ ! -f /tmp/apt.update ] \
               || /usr/bin/find /etc/apt -cnewer /tmp/apt.update \
               | /bin/grep . > /dev/null'",
  }
}
