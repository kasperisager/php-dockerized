# Class: provision::percona::config
#
#
class provision::percona::config
{
  percona::adminpass{ $provision::params::dbuser:
    password  => $provision::params::dbpassword,
  }

  percona::mgmt_cnf { $provision::params::dbconfig:
    password => $provision::params::dbpassword,
    user     => $provision::params::dbuser,
  }

  class { "percona::params":
    mgmt_cnf => $provision::params::dbconfig,
  }
}
