# Class: lnpp::hhvm::service
#
#
class lnpp::hhvm::service
{
  service { "hhvm":
    ensure     => running,
    enable     => true,
    require    => Package["hhvm"],
    binary     => "/etc/init.d/hhvm",
    hasrestart => true,
    hasstatus  => true
  }

  file { "hhvm_config":
    ensure  => file,
    path    => "/etc/hhvm/server.hdf",
    content => template("lnpp/hhvm/server.hdf.erb"),
    require => Package["hhvm"],
    before  => Service["hhvm"],
    notify  => Service["hhvm"]
  }

  file { "hhvm_init":
    ensure  => file,
    path    => "/etc/default/hhvm",
    content => template("lnpp/hhvm/hhvm-fastcgi.erb"),
    require => Package["hhvm"],
    before  => Service["hhvm"],
    notify  => Service["hhvm"]
  }
}
