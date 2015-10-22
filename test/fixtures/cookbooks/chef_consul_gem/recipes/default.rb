gem_version = run_context.cookbook_collection[cookbook_name].metadata.version

if Chef::Resource::ChefGem.instance_methods(false).include?(:compile_time)
  chef_gem 'chef-consul' do
    version gem_version
    compile_time true
    source '/vagrant/test/shared/data/chef-consul.gem'
  end
else
  chef_gem 'chef-consul' do
    version gem_version
    action :nothing
    source '/vagrant/test/shared/data/chef-consul.gem'
  end.run_action(:install)
end

require 'chef/consul'
