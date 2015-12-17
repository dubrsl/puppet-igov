#
# == Class: tomcat
#

class profile::tomcat {

    include ::tomcat
    include ::java

    file { "/var/lib/tomcat":
	ensure  => 'directory',
    }

    define create_instance($name, $folder, $port) {

	if ($folder == undef) {
		$folder = $name
	}

	notify { "Create instance=$name folder=$folder": }

	
	tomcat::instance { "$name":
		source_url => 'http://apache.cp.if.ua/tomcat/tomcat-8/v8.0.28/bin/apache-tomcat-8.0.28.tar.gz',
		catalina_base => "/var/lib/tomcat/$folder",
	}

	tomcat::config::server { "$name":
		catalina_base => "/var/lib/tomcat/$folder",
		port => "$port",
	}

	file {"tomcat-$name.service":
		ensure  => file,
		path    => "/etc/systemd/system/tomcat-$name.service",
		mode    => '0644',
		content => template('profile/tomcat/tomcat.service.erb'),
	}

	exec {"systemctl-daemon-reload-$name":
		command => '/usr/bin/systemctl daemon-reload',
		unless  => '/bin/ls /usr/bin/systemctl',
	}

	tomcat::service { "tomcat-$name":
		use_jsvc     => false,
		use_init     => true,
		service_name => "tomcat-$name",
	}
    }

    $instance = hiera('profile::backend::instance', undef)
    create_resources( create_instance, $instance )
}
