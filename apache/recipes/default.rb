#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


package 'httpd'

include_recipe 'apache::vhosts'
include_recipe 'apache::restart'

