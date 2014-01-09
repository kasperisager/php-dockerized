# Class: provision::xhprof::vhost
#
#
class provision::xhprof::vhost
{
  nginx::vhost { "xhprof":
    root     => "/usr/share/xhprof.io",
    index    => "index.php",
    template => "${core::params::templates_dir}/nginx/default.conf.erb"
  }
}
