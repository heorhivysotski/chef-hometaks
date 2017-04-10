# install unzip
package 'unzip' do
  action :install
end

# download application
remote_file node[:jboss7][:tmp_app] do
  source node[:jboss7][:app_url]
  owner node[:jboss7][:jboss_user]
  group node[:jboss7][:jboss_group]
  action :create
end

# unpack application
bash "unpack application" do
  code <<-EOF
    unzip #{node[:jboss7][:tmp_app]} -d #{node[:jboss7][:jboss_home]}/standalone/deployments/
    chown -R #{node[:jboss7][:jboss_user]}:#{node[:jboss7][:jboss_group]} #{node[:jboss7][:jboss_home]}/standalone/deployments/hudson/
  EOF
  not_if { ::File.directory? ("#{node[:jboss7][:jboss_home]}/standalone/deployments/hudson/") }
end

data = data_bag_item( 'hudson', 'engine' )

# change hudson.xml
template "#{node[:jboss7][:jboss_home]}/standalone/deployments/hudson/hudson.xml" do
  source "hudson.erb"
  variables( engine: data[node.chef_environment]['engine'] )
  action :create
  notifies :restart, 'service[jboss]', :immediately
end 
