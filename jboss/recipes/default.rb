#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


include_recipe 'java'

include_recipe "jboss::install"
include_recipe "jboss::config"
include_recipe "jboss::deploy"
