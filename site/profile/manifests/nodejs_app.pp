class profile::nodejs_app ($username = 'igov') {
  #  notify { "profile::nodejs_app": }

  class { "appuser":
  } ->
  class { "nginx::config": }
  class { "nodejs": } ->
  class { "npm::install": } ->
  #  npm::global { ["pm2", "grunt-cli", "grunt", "bower", "gem"]: } ->
  # TODO: fix grunt-cli
  npm::global { ["pm2", "grunt", "bower", "gem"]: } ->
  exec { 'create_pm2_init_service':
    command => "/usr/bin/pm2 startup centos -u $username",
    creates => '/etc/init.d/pm2-init.sh'
  }
}

# sudo npm install -g grunt-cli
# sudo npm install -g bower
# sudo npm install -g grunt
# sudo npm install -g gem
