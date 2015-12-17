# == Class: role::backend
#
# Backend role
#
class role::backend {
	include ::profile::base  # All roles should have the base profile
	include ::profile::tomcat
	
#	include role::backend::wf-central
#	include role::backend::wf-region

#	class { 'profile::tomcat':
#		folder => 'wf-central',
#	}

#	include profile::redis

}
