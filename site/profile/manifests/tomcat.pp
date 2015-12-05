#
# == Class: tomcat
#
class profile::tomcat {

    file {'tomcat.service':
	ensure  => file,
	path    => '/etc/systemd/system/tomcat.service',
	mode    => '0644',
	content => template('profile/tomcat/tomcat.service.erb'),
    }

    exec {'systemctl-daemon-reload':
	command => '/usr/bin/systemctl daemon-reload',
	unless  => '/bin/ls /usr/bin/systemctl',
    }->

    class { '::tomcat':}
    include ::java
    tomcat::instance { 'test':
	source_url => 'http://apache.cp.if.ua/tomcat/tomcat-8/v8.0.26/bin/apache-tomcat-8.0.26.tar.gz'
    }->

    tomcat::service { 'default':
	use_jsvc     => false,
	use_init     => true,
	service_name => 'tomcat',
    }
}
