package "docker.io" do 
  action :install
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