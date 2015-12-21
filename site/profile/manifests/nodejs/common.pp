class profile::nodejs::common ($appuser = 'igov') {
  class { "nginx::config": }
  class { "nodejs": } ->
  class { "npm::install": } ->
  #  npm::global { ["pm2", "grunt-cli", "grunt", "bower", "gem"]: } ->
  # TODO: fix grunt-cli
  npm::global { ["pm2", "grunt", "bower", "gem"]: } ->
  class { "appuser": } ->
  exec { 'create_pm2_init_service':
    command => "/usr/bin/pm2 startup centos -u $username",
    creates => '/etc/init.d/pm2-init.sh'
  }
}
