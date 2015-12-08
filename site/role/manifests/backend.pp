# == Class: role::backend
#
# Backend role
#
class role::backend {
  include profile::base  # All roles should have the base profile
#  include profile::java
#  include profile::maven
  include profile::tomcat
#  include profile::redis
}
