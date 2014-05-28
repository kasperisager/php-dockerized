# Class: lnpp::hhvm::install
#
#
class lnpp::hhvm::install
{
  apt::ppa { "ppa:mapnik/boost": }

  apt::source { "hhvm":
    location    => "http://dl.hhvm.com/ubuntu/",
    release     => "precise",
    repos       => "main",
    include_src => false,
    key        => "1BE7A449",
    key_source => "http://dl.hhvm.com/conf/hhvm.gpg.key",
    before      => Package["hhvm"]
  }

  package { "hhvm":
    ensure  => latest
  }
}
