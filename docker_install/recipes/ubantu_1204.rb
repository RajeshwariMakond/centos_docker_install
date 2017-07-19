apt_package 'linux-image-generic-lts-trusty' do
 action :install
end


execute 'update-all' do
 command 'sudo apt-get update'
 action :run
end

package 'wget' do
  action :install
end 

execute 'docker-script' do
 command 'wget -qO- https://get.docker.com/ | sh'
 action :run
end


ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/default/docker")
    file.insert_line_if_no_match("/export http_proxy=http://proxy.wdf.sap.corp:8080/", "export http_proxy=http://proxy.wdf.sap.corp:8080")
    file.insert_line_if_no_match("/export ftp_proxy=http://proxy.wdf.sap.corp:8080/", "export ftp_proxy=http://proxy.wdf.sap.corp:8080")
    file.insert_line_if_no_match("/export all_proxy=http://proxy.wdf.sap.corp:8080/", "export all_proxy=http://proxy.wdf.sap.corp:8080")
    file.insert_line_if_no_match("/export https_proxy=http://proxy.wdf.sap.corp:8080/", "export https_proxy=http://proxy.wdf.sap.corp:8080")
    file.write_file
  end
end

service "docker" do
   action :restart
end