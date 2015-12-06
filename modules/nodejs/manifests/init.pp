# Class: nodejs
#
# This module manages nodejs
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class nodejs {
	case $operatingsystem {
	  'Solaris':          { include nodejs::install::generic }
	  'RedHat', 'CentOS': { include nodejs::install::centos  }
	  /^(Debian|Ubuntu)$/:{ include nodejs::install::ubuntu  }
	  default:            { include nodejs::install::generic }
	}
}
