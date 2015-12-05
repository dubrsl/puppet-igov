#
# == Class: redis
#
class profile::redis {
    Package['redis'] -> File['redis_conf'] -> Service['redis']

    package { redis :
	name   => 'redis',
	ensure => installed,
    }

   file { 'redis_conf' :
	path    => $operatingsystem ? {
	    debian  => '/etc/redis/redis.conf',
	    default => '/etc/redis.conf',
	},
	ensure   => file,
	checksum => md5,
	owner    => 'redis',
	group    => 'root',
	mode     => 644,
	require  => Package['redis'],
	content  => template('profile/redis/redis.conf.erb'),
   }

    service { redis :
	name    => 'redis',
	require => Package['redis'],
	ensure  => running,
	enable  => true,
    }
}
