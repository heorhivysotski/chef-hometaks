package 'tomcat' do 
  action :install
end

service 'tomcat' do
  action :enable
end


service 'tomcat' do
  action :start
end
