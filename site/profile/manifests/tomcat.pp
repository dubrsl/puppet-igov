#
# == Class: tomcat
#
class profile::tomcat {

    include yum::repo::igov

    class { '::tomcat':}
    include ::java
    tomcat::instance { 'default':
	install_from_source => false,
	package_name        => 'tomcat',
    }->

    tomcat::service { 'default':
	use_jsvc     => false,
	use_init     => true,
	service_name => 'tomcat',
    }
}
