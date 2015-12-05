# == Class: role::balancer
#
# Balancer role
#
class role::balancer {
  include profile::base  # All roles should have the base profile
  include profile::nginx
}
