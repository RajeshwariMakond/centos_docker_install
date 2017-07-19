#
# Cookbook Name:: docker_install
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node['platform'] == 'ubuntu' && node['platform_version'] == '12.04'

  include_recipe "#{cookbook_name}::ubantu_1204"

elsif node['platform'] == 'ubuntu' && node['platform_version'] == '14.04'

  include_recipe "#{cookbook_name}::ubantu_1404"

elsif node['platform'] == 'suse' 

  include_recipe "#{cookbook_name}::suse_docker"

elsif node['platform'] == 'redhat' 

  include_recipe "#{cookbook_name}::redhat_docker"

end
