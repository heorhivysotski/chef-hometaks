package 'unzip' do 
  action :install
end

remote_file node[:tomcat][:app_zip] do
  source node[:tomcat][:app_download_url]
  action :create_if_missing
end

bash 'deploy app' do
  code <<-EOF
     unzip #{node[:tomcat][:app_zip]} -d #{node[:tomcat][:location]}
     cp -r #{node[:tomcat][:location]}/testweb/testweb.war} #{node[:tomcat][:deploy]}
  EOF
  not_if { ::File.directory? ("#{node[:tomcat][:location]}/testweb/")}
end

 
