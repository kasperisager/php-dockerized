# Class: lnpp::xhprof::vhost
#
#
class lnpp::xhprof::vhost
{
  nginx::vhost { "xhprof":
    root     => "/usr/share/xhprof.io",
    index    => "index.php",
    template => "lnpp/nginx/default.conf.erb"
  }
}
