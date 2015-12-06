class role::nodejs_app ($domain = '', $backend_port = 8080,) {
  notify { "ROLE::NODEJS_APP - $::environment": }

  #  class { "profile::app::user": }
  #
  #  class { "profile::app::nodejs": }
}
