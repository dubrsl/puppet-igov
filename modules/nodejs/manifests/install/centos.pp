class nodejs::install::centos ($package = 'nodejs',$ensure  = 'latest'){
	# notify { $package: }
	class { "epel": } ->
  package { $package :
    ensure  => $ensure,
  }
}

