# Set global PATH and environment variables
#
# This is automatically included when glob-importing the core manifests
#
Exec {
  path        => "/bin/:/sbin/:/usr/bin/:/usr/sbin/:/usr/local/bin:/opt/vagrant_ruby/bin/",
  environment => "HOME=/home/vagrant"
}
