# create folder
directory '/etc/jboss-as' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


# add jboss_conf template 
template "/etc/jboss-as/jboss-as.conf" do
  source "jboss_conf.erb"
  mode '0644'
  owner 'root'
  group 'root'
  variables({
     :jboss_user => node[:jboss7][:jboss_user],
  })
#  not_if {File.exists?("/etc/jboss-as/jboss-as.conf")}
end

# add init script template
template "/etc/init.d/jboss" do
  source "jboss.erb"
  mode '0755'
  owner 'root'
  group 'root'
  variables({
     :jboss_home => node[:jboss7][:jboss_home],
  })
 # not_if {File.exists?("/etc/init.d/jboss")}
end

# start service 
service "jboss" do
  action  [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true
end

