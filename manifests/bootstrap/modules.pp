# Class: bootstrap::modules
#
#
class bootstrap::modules
{
  package { "librarian-puppet":
    ensure   => installed,
    provider => "gem"
  }

  exec { "librarian-puppet install":
    cwd     => $provision::params::puppet_dir,
    require => Package['librarian-puppet']
  }
}
