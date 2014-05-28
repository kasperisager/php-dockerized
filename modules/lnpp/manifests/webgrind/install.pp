# Class: lnpp::webgrind::install
#
#
class lnpp::webgrind::install
{
  vcsrepo { "/usr/share/webgrind":
    ensure   => present,
    provider => "git",
    source   => "git://github.com/jokkedk/webgrind.git"
  }
}
