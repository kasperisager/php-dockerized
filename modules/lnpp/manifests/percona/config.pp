# Class: lnpp::percona::config
#
#
class lnpp::percona::config
{
  percona::adminpass{ $lnpp::params::dbuser:
    password => $lnpp::params::dbpassword,
  }

  percona::mgmt_cnf { $lnpp::params::dbconfig:
    password => $lnpp::params::dbpassword,
    user     => $lnpp::params::dbuser,
  }

  class { "percona::params":
    mgmt_cnf => $lnpp::params::dbconfig,
  }
}
