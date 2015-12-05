# == Class: role::frontend
#
# Frontend role
#
class role::frontend {
  include profile::base  # All roles should have the base profile
  include profile::nginx
}
