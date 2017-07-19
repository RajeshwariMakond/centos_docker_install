yum_package 'docker.x86_64' do
    provider Chef::Provider::Package::Yum
    action :install
end

service 'docker' do
action [:enable, :start]
end
