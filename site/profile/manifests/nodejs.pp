class profile::app::nodejs () {
  #  class { "nodejs": } ->
  #  class { "npm::install": } ->
  #  class { "npm::g::pm2": }
}
