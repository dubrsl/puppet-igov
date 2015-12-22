# == Class: role::backend
#
# Backend role
#
class role::backend {
	include ::profile::base  # All roles should have the base profile
	include ::profile::tomcat

}
