# Class: provision::webgrind::vhost
#
#
class provision::webgrind::vhost
{
  nginx::vhost { "webgrind":
    root     => "/usr/share/webgrind",
    index    => "index.php",
    template => "${core::params::templates_dir}/nginx/hhvm.conf.erb"
  }
}
