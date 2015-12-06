class npm::install ($package = 'npm',$ensure  = 'latest'){
  package { $package :
    ensure  => $ensure,
  }
}
