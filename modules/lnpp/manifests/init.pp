class lnpp inherits lnpp::params {
  Exec {
    environment => "HOME=/home/vagrant"
  }

  include apt

  # PHP and PHP-FPM
  include lnpp::php::install,
          lnpp::php::modules,
          lnpp::php::pools

  # Nginx
  include lnpp::nginx::install

  # Percona
  include lnpp::percona::config,
          lnpp::percona::install

  # HHVM and HHVM FastCGI
  include lnpp::hhvm::install,
          lnpp::hhvm::service

  # XHProf and XHProf.io
  include lnpp::xhprof::install,
          lnpp::xhprof::database,
          lnpp::xhprof::vhost

  # Webgrind
  include lnpp::webgrind::install,
          lnpp::webgrind::vhost
}
