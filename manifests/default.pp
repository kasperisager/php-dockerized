node default {
  include lnpp

  # Add a default server block (192.168.33.10 -> default)
  nginx::vhost { "default":
    root     => "/var/www/default",
    index    => "index.php",
    # Use the default template from the LNPP module
    template => "lnpp/nginx/default.conf.erb"
  }

  # Add a database named "database"
  percona::database { "database":
    ensure => present
  }

  # Add a user named "root" with "vagrant" as password
  percona::rights { "root@localhost":
    database => "*",
    password => "vagrant",
    priv     => "all"
  }
}
