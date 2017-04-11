file "/etc/httpd/conf.d/vhosts.conf" do
  owner 'root'
  group 'root'
  mode 0755
  content ::File.open("/vagrant/vhosts.conf").read
  action :create
end
