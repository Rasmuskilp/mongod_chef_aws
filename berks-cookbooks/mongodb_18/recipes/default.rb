#
# Cookbook:: mongodb_18
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
include_recipe 'apt'
include_recipe 'sc-mongodb'
# mongodb_instance 'mongodb' do |node|
#describe 'sc-mongodb' do |node|
#node.override['mongodb']['package_version'] = '4.2.0'
#end
# gem install serverspec
# ipaddress 'ipaddress' do
#   ip '0.0.0.0'
# end
  # hostname 'mongod' do
  #  ipaddress '0.0.0.0'
  # end
  # apt_repository 'mongodb' do
  #   uri 'http://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/4.2/'
  #   components ['multiverse']
  #   distribution 'xenial/mongodb-org/4.2'
  #   key 'EA312927'
  #   keyserver 'hkp://keyserver.ubuntu.com:80'
  #   action :add
  #   deb_src true
  # end
  # package 'mongodb-org' do
  # options '--allow_unauthenticated'
  # action :install
  # end

   template '/etc/mongod.conf' do
     source 'mongod.conf.erb'
     variables bindIp: node['mongodb']['config']['mongod']['net']['bindIp'],
     port: node['mongodb']['config']['mongod']['net']['port']
     notifies :restart, 'service[mongod]'
   end
  #resource link
   template "/lib/systemd/system/mongod.service" do
    source "mongod.service.erb"
     notifies :restart, 'service[mongod]'
   end
# include_recipe 'apt'
# include_recipe 'nodejs'
#include_recipe 'poise-python'
# include_recipe  'yum'
#[mongodb]['package_version'] = 4.0.3
# mongodb_instance 'mongodb' do
#   package_version  node['mongodb']['package_version'] == '4.0.3'
# end
# apt_repo
# apt_repository 'mongodb' do
#   uri 'http://repo.mongodb.org/apt/ubuntu/dists/xenial/mongodb-org/4.2/'
#   components ['main']
#   distribution 'xenial'
#   key '24F3C978'
#   keyserver 'hkp://keyserver.ubuntu.com:80'
#   action :add
#   deb_src true
# end
# package 'mongodb-org' do
# options: '--allow_unauthenticated'
#  action: install
#end
service 'mongod' do
  action :enable
end
service 'mongod' do
  action :start
end

# service 'mongod' do
#   action :enable
# end
# service 'mongod' do
#   action :start
# end
