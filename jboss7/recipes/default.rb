#
# Cookbook Name:: my_jboss
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'java'
include_recipe 'my_jboss::install'
include_recipe 'my_jboss::configure'
include_recipe 'my_jboss::deploy'
