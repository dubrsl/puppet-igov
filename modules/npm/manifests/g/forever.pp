class npm::g::forever {
  exec { "forever_g_install" :
    command => "/usr/bin/npm install -g forever",
    creates => "/usr/bin/forever",
    require => Package["npm"],
  }
}
