# == Class: role::backend::wf-region
#
# Backend role for region
#
class role::backend::wf-region {
	include profile::base  # All roles should have the base profile
#	class { 'profile::tomcat':
#		folder => 'wf-region',
#	}
}
