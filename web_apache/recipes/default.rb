#
# Cookbook Name:: web_apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


web 'web_apache' do 
  action [:install, :setup, :start]
  provider 'web_apache'
end
