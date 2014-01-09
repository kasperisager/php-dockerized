# Class: provision::webgrind::install
#
#
class provision::webgrind::install
{
  vcsrepo { "/usr/share/webgrind":
    ensure   => present,
    provider => git,
    source   => "git://github.com/jokkedk/webgrind.git"
  }
}
