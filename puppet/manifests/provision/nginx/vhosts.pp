# Class: provision::nginx::vhosts
#
#
class provision::nginx::vhosts
{
  $sites_dir = $core::params::sites_dir
  $nginx_dir = "${core::params::templates_dir}/nginx"

  nginx::vhost { "default":
    root     => "${sites_dir}/default",
    index    => "index.php",
    template => "${nginx_dir}/default.conf.erb"
  }

  nginx::vhost { "hhvm":
    root     => "${sites_dir}/default",
    index    => "index.php",
    template => "${nginx_dir}/hhvm.conf.erb"
  }

  # Pre-defined setups

  # nginx::vhost { "vanilla":
  #   root     => "${sites_dir}/vanilla",
  #   index    => "index.php",
  #   template => "${nginx_dir}/vanilla.conf.erb"
  # }

  # nginx::vhost { "kirby":
  #   root     => "${sites_dir}/kirby",
  #   index    => "index.php",
  #   template => "${nginx_dir}/kirby.conf.erb"
  # }

  # nginx::vhost { "statamic":
  #   root     => "${sites_dir}/statamic",
  #   index    => "index.php",
  #   template => "${nginx_dir}/statamic.conf.erb"
  # }
}
