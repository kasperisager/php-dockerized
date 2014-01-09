# Class: provision::percona::config
#
#
class provision::percona::config
{
  percona::adminpass{ $core::params::dbuser:
    password => $core::params::dbpassword,
  }

  percona::mgmt_cnf { $core::params::dbconfig:
    password => $core::params::dbpassword,
    user     => $core::params::dbuser,
  }

  class { "percona::params":
    mgmt_cnf => $core::params::dbconfig,
  }
}
