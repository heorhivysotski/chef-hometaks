execute 'jboss folder' do
  command "mkdir /etc/jboss-as/"
  not_if {File.exists?("/etc/jboss-as/")}
end

template "/etc/jboss-as/jboss-as.conf" do
  source "jboss_conf.erb"
  owner 'root'
  group 'root'
  mode  '0644'
  variables({
    :jboss_user => node[:jboss][:user],
  })
  not_if {File.exists?("/etc/jboss-as/jboss-as.conf")}
end


template "/etc/init.d/jboss" do 
  source "jboss.erb"
  owner 'root'
  group 'root'
  mode  '0755'
  variables({
    :jboss_home => node[:jboss][:home],
    :jboss_user => node[:jboss][:user],
    :jboss_listen_ip => node[:jboss][:listen_ip]
  })
  not_if {File.exists?("/etc/init.d/jboss")}
end

service "jboss" do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true
end
