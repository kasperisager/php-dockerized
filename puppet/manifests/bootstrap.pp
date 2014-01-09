include bootstrap

import "./core/*", "./bootstrap/*"

# Class: bootstrap
#
#
class bootstrap
{
  include core::params

  include bootstrap::update,
          bootstrap::packages,
          bootstrap::modules
}
