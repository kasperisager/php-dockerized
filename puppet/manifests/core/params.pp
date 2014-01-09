# Class: core::params
#
#
class core::params
{
  # Puppet variables
  $puppet_dir    = "/vagrant/puppet"
  $templates_dir = "$puppet_dir/templates"
  $files_dir     = "$puppet_dir/files"

  # Webserver variables
  $sites_dir      = "/var/www"
  $fpm_listen     = "/var/run/php5-fpm.sock"
  $nginx_template = "nginx/vhost.php.conf.erb"

  # Database variables
  $dbuser     = "root"
  $dbpassword = "vagrant"
  $dbconfig   = "/etc/.puppet.cnf"
}
