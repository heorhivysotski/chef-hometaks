group node[:jboss][:group] do
  action :create
end

user node[:jboss][:user] do
  group node[:jboss][:group]
  manage_home true
  home '/home/jboss'
  action :create
end


remote_file node[:jboss][:zip] do
  source node[:jboss][:package_url]
  owner node[:jboss][:user]
  group node[:jboss][:group]
  mode '0755'
  action :create_if_missing
end

execute 'install jboss' do
  command "tar xzf #{node[:jboss][:zip]} -c #{node[:jboss][:location]}"
  not_if { ::File.exist? ("#{node[:jboss][:home]}")}
end


