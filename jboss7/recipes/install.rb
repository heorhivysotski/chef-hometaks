#create group
group node[:jboss7][:jboss_group] do
  action :create
end

# create user
user node[:jboss7][:jboss_user] do
  group node[:jboss7][:jboss_group]
  manage_home true
  home '/home/jboss'
  action :create 
end

# download jboss archive
remote_file node[:jboss7][:tmp_file] do
  source node[:jboss7][:download_url]
  owner node[:jboss7][:jboss_user]
  group node[:jboss7][:jboss_group]
  mode '0755'
  action :create_if_missing
end

# extract files
execute 'extract_jboss' do
  command "tar xzf #{node['jboss7']['tmp_file']} -C #{node['jboss7']['path']}"
  not_if { ::File.exist?("#{node['jboss7']['jboss_home']}") }
end
