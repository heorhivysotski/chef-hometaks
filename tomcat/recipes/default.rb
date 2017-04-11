#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


include_recipe 'java'

include_recipe "tomcat::install"
include_recipe "tomcat::deploy"
