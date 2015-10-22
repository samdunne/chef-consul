name 'chef-consul'
maintainer 'Sam Dunne'
maintainer_email 'sam@sam-dunne.com'
license 'Apache 2.0'
description 'Installs chef-consul.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

require File.expand_path('../lib/chef/consul/version', __FILE__)
version Chef::Consul::VERSION
