#
# == Class: role::base
#
class role::base {
  include ::profile::base  # All roles should have the base profile
}
