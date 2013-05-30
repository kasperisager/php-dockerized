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
    cwd => $provision::params::puppet_dir
  }
}
