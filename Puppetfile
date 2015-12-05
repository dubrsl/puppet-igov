forge 'forge.puppetlabs.com'

# Forge Modules
mod 'puppetlabs/ntp'
mod 'puppetlabs/stdlib'
mod 'puppetlabs/concat'
mod 'puppetlabs/firewall'
mod 'puppetlabs/java'
mod 'puppetlabs/nginx'
mod 'maestrodev-wget'
mod 'maestrodev/maven'
mod 'nanliu-staging'
mod 'puppetlabs-tomcat'
mod 'saz/ssh'
mod 'saz/sudo'
mod 'rnelson0/local_user'

mod 'saz/rsyslog', '3.4.0'
mod 'elasticsearch/logstashforwarder', '0.1.1'
mod 'ispavailability/file_concat', '0.3.0'
mod 'ghoneycutt/hosts', '2.2.3'
# need to wait for https://github.com/elastic/puppet-elasticsearch/pull/355 to enable this
#mod 'elasticsearch/elasticsearch', '0.9.6'

# current version of this module (0.5.1) does not support template for configs
# take newest (18 May 2015) with template support
#
mod 'logstash',
  :git => 'https://github.com/elastic/puppet-logstash.git',
  :ref => '28a3a06093fcdfb29771f1036fc0f101dd2df39a'

# need this fix to be deployed
# https://github.com/alekseymykhailov/puppet-elasticsearch/commit/c15bd991ec86144ef03f17b57ad3cb0590b35c2f
mod 'puppet-elasticsearch',
  :git => 'https://github.com/alekseymykhailov/puppet-elasticsearch.git',
  :ref => 'master'

mod 'generic',
  :git => 'git@bitbucket.org:egovinfrastructure/egov-generic.git',
  :ref => 'prod'
