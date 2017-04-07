package 'unzip' do
  action :install
end

remote_file node[:jboss][:app_zip] do
  source node[:jboss][:app_download_url]
  owner node[:jboss][:user]
  group node[:jboss][:group]
  mode '0755'
  action :create_if_missing
end

bash 'deploy app' do
  code <<-EOF
     unzip #{node[:jboss][:app_zip]} -d #{node[:jboss][:home]}/standalone/deployments/
     chown -R #{node[:jboss][:user]}:#{node[:jboss][:group]} #{node[:jboss][:home]}/standalone/deployments/testweb/
  EOF
  not_if { ::File.directory? ("#{node[:jboss][:home]}/standalone/deployments/testweb")}
  notifies :restart, 'service[jboss]', :immediately
end 
