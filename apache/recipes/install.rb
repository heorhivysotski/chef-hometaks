service "httpd" do
  supports :status => true, :restart => true
  action :start
end

service "httpd" do
  supports :status => true, :restart => true
  action :restart
end

service "httpd" do
  supports :status => true, :restart => true
  action :stop
end

service 'apache' do
  action :start
end
