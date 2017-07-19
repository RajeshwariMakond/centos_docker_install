package 'docker' do 
  action :install
  provider Chef::Provider::Package::Zypper
end

service 'docker' do
  supports :restart => true, :reload => true
  action [:enable, :start]
end

cookbook_file '/etc/sysconfig/docker' do
 source 'docker'
 user 'root'
 group 'root'
 mode '0755'
 action :create
 notifies :restart, 'service[docker]', :immediately
end 
