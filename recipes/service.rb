#
# Cookbook Name:: gce_mysql_proxy
# Recipe:: service
#
# Copyright (c) 2016 Liqwyd Ltd., All Rights Reserved.

case node['gce_mysql_proxy']['service']
when 'runit'
  include_recipe 'gce_mysql_proxy::runit_service'
else
  Chef::Application.fatal! "The gce_mysql_proxy cookbook doesn't support the " \
                           "service type #{node['gce_mysql_proxy']['service']}"
end
