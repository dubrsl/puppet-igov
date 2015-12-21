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

#Configuration files for tomcat
	file {"$name.AS.properties":
		ensure  => file,
		path    => "/var/lib/tomcat/$folder/conf/AS.properties",
		mode    => '0644',
		content => template("profile/tomcat/$name/AS.properties.erb"),
	}
	file {"$name.bankID.properties":
		ensure  => file,
		path    => "/var/lib/tomcat/$folder/conf/bankID.properties",
		mode    => '0644',
		content => template("profile/tomcat/$name/bankID.properties.erb"),
	}
	file {"$name.catalina.properties":
		ensure  => file,
		path    => "/var/lib/tomcat/$folder/conf/catalina.properties",
		mode    => '0644',
		content => template("profile/tomcat/$name/catalina.properties.erb"),
	}
	file {"$name.db.properties":
		ensure  => file,
		path    => "/var/lib/tomcat/$folder/conf/db.properties",
		mode    => '0644',
		content => template("profile/tomcat/$name/db.properties.erb"),
	}
	file {"$name.email.properties":
		ensure  => file,
		path    => "/var/lib/tomcat/$folder/conf/email.properties",
		mode    => '0644',
		content => template("profile/tomcat/$name/email.properties.erb"),
	}
	file {"$name.log4j.properties":
		ensure  => file,
		path    => "/var/lib/tomcat/$folder/conf/log4j.properties",
		mode    => '0644',
		content => template("profile/tomcat/$name/log4j.properties.erb"),
	}
	file {"$name.merch.properties":
		ensure  => file,
		path    => "/var/lib/tomcat/$folder/conf/merch.properties",
		mode    => '0644',
		content => template("profile/tomcat/$name/merch.properties.erb"),
	}
	file {"$name.redisProps.properties":
		ensure  => file,
		path    => "/var/lib/tomcat/$folder/conf/redisProps.properties",
		mode    => '0644',
		content => template("profile/tomcat/$name/redisProps.properties.erb"),
	}
	file {"$name.storage-mongodb.properties":
		ensure  => file,
		path    => "/var/lib/tomcat/$folder/conf/storage-mongodb.properties",
		mode    => '0644',
		content => template("profile/tomcat/$name/storage-mongodb.properties.erb"),
	}

#service for tomcat
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
