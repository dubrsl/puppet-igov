class nodejs::install::ubuntu ($package = 'nodejs',$ensure  = 'installed'){
  include apt
  apt::ppa { 'ppa:chris-lea/node.js': } ->
  package { $package :
    ensure  => $ensure,
  }
}
