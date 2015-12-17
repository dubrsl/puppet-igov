# == Class: role::backend::wf-central
#
# Backend role for central
#
class role::backend::wf-central {
	include profile::base  # All roles should have the base profile
	include profile::tomcat
	include stdlib::
	
	define profile::tomcat {'wf-central':
		folder => 'wf-central',
	}

}

