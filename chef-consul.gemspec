# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chef/consul/version'

Gem::Specification.new do |spec|
  spec.name          = 'chef-consul'
  spec.version       = Chef::Consul::VERSION
  spec.authors       = ['Sam Dunne']
  spec.email         = ['sam@sam-dunne.com']
  spec.description   = ''
  spec.summary       = ''
  spec.homepage      = 'https://github.com/samdunne/chef-consul'
  spec.license       = 'Apache 2.0'

  spec.required_ruby_version = '>= 1.9'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'diplomat', '~> 0.14'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'chefspec',        '~> 4.2'
  spec.add_development_dependency 'test-kitchen',    '~> 1.3'
  spec.add_development_dependency 'kitchen-vagrant', '~> 0.15'
end
