# Class: lnpp::xhprof::install
#
#
class lnpp::xhprof::install
{
  package { ["build-essential", "php5-common"]:
    ensure => installed
  }

  if ! defined(Package["php-pear"]) {
    package { "php-pear":
      ensure => installed
    }
  }

  exec { "xhprof_install":
    command => "/usr/bin/pecl install pecl.php.net/xhprof-0.9.4",
    creates => "/usr/share/php/xhprof_html",
    require => [Package["build-essential"], Package["php-pear"]],
  }

  file { "xhprof_ini":
    ensure  => file,
    path    => "/etc/php5/conf.d/xhprof.ini",
    content => template("lnpp/xhprof/xhprof.ini.erb"),
    require => Exec["xhprof_install"],
    notify  => $lnpp::php::modules::notify_services
  }

  package { "graphviz":
    ensure => installed
  }

  vcsrepo { "/usr/share/xhprof.io":
    ensure   => present,
    provider => git,
    source   => "git://github.com/gajus/xhprof.io.git"
  }

  file { "xhprof_io_config":
    ensure  => file,
    path    => "/usr/share/xhprof.io/xhprof/includes/config.inc.php",
    content => template("lnpp/xhprof/config.inc.php.erb")
  }
}
