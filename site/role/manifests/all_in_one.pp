# == Class: role::all_in_one
#
# All in one role
#
class role::all_in_one {
	include ::profile::base  # All roles should have the base profile
	include ::profile::tomcat
	include ::role::central_js

}
