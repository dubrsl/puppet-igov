class profile::base {
	include ::ntp
	include ::timezone
	include ::hosts

	# Base firewall policy
	include ::profile::linuxfw

	# SSH server and client
	include ::ssh::server
	include ::ssh::client
	
	# Add ssh_authorized_key
	$ssh_authorized_keys = hiera_hash('ssh_authorized_keys', undef)
	if ($ssh_authorized_keys != undef) {
		create_resources('ssh_authorized_key', $ssh_authorized_keys)
	}

	# Local user setup
	include '::sudo'
	::sudo::conf { 'wheel':
		priority => 10,
		content  => '%wheel     ALL=(ALL)       ALL',
	}

	$local_users = hiera('local_users', undef)
	if ($local_users != undef) {
		create_resources('local_user', $local_users)
	}
}
