# Class: provision::xhprof::database
#
#
class provision::xhprof::database
{
  $seed  = "/usr/share/xhprof.io/setup/database.sql"
  $mysql = "mysql --user='root' --password='vagrant'"

  percona::database { "xhprof":
    ensure  => present
  }

  percona::rights { "xhprof@localhost":
    database => "xhprof",
    password => "xhprof",
    priv     => "all"
  }

  exec { "xhprof_import":
    command     => "${mysql} xhprof < '${seed}'",
    timeout     => 0,
    refreshonly => true,
    subscribe   => Percona::Database["xhprof"],
    require     => Vcsrepo["/usr/share/xhprof.io"]
  }
}
