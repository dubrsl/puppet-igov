define profile::nodejs::app_dirs (
  $username      = 'igov',
  $config_path   = '/opt/.configs',
  $upload_path   = '/opt/.upload',
  $app_base_path = '/opt',) {
  file { "$config_path/$name":
    ensure => 'directory',
    owner  => $username,
    group  => $username,
    mode   => '0755',
  } ->
  file { "$upload_path/$name":
    ensure => 'directory',
    owner  => $username,
    group  => $username,
    mode   => '0755',
  }

  file { "$app_base_path/$name":
    ensure => 'directory',
    owner  => $username,
    group  => $username,
    mode   => '0755',
  }
}
