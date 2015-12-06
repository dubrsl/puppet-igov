class npm::g::pm2 {
  exec { "pm2_g_install":
    command => "/usr/bin/npm install -g pm2",
    creates => "/usr/bin/pm2",
    require => Package["npm"],
  }
}
