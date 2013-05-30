# Class: provision::percona::rights
#
#
class provision::percona::rights
{
  percona::rights { "root@localhost":
    database => "*",
    password => "vagrant",
    priv     => "all"
  }
}
