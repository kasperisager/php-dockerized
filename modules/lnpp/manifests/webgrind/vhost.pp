# Class: lnpp::webgrind::vhost
#
#
class lnpp::webgrind::vhost
{
  nginx::vhost { "webgrind":
    root     => "/usr/share/webgrind",
    index    => "index.php",
    template => "lnpp/nginx/hhvm.conf.erb"
  }
}
