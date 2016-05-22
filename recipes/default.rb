#
# Cookbook Name:: gce_mysql_proxy
# Recipe:: default
#
# Copyright (c) 2016 Liqwyd Ltd., All Rights Reserved.

include_recipe 'gce_mysql_proxy::install'
include_recipe 'gce_mysql_proxy::service'
