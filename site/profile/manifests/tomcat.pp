#
# == Class: tomcat
#
class profile::tomcat {

    include yum::repo::igov

    class { '::tomcat':}
    include ::java
    tomcat::instance { 'wf-central':
	install_from_source => false,
	package_name        => 'tomcat',
	catalina_base => '/var/lib/tomcat/wf-central',
    }->

    tomcat::service { 'wf-central':
	use_jsvc     => false,
	use_init     => true,
	service_name => 'tomcat_wf-central',
	catalina_base => '/var/lib/tomcat/wf-central',
    }

    tomcat::service { 'wf-region':
	use_jsvc     => false,
	use_init     => true,
	service_name => 'tomcat_wf-region',
	catalina_base => '/var/lib/tomcat/wf-region',
    }

    firewall { '101 HTTP inbound':
	dport  => 8080,
	proto  => tcp,
	action => accept,
  }
}
