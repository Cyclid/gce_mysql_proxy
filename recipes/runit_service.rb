#
# Cookbook Name:: gce_mysql_proxy
# Recipe:: runit_service
#
# Copyright (c) 2016 Liqwyd Ltd., All Rights Reserved.

include_recipe 'runit'

options = { bindir: node['gce_mysql_proxy']['bindir'],
            mountdir: node['gce_mysql_proxy']['mountdir'],
            mode: '',
            metadata: '',
            credentials: '' }

options[:mode]        = '-fuse' \
                          if node['gce_mysql_proxy']['fuse'] == true
options[:mode]        = "-instances=#{node['gce_mysql_proxy']['instances']}" \
                          unless node['gce_mysql_proxy']['instances'].nil?
options[:metadata]    = "-instances_metadata=#{node['gce_mysql_proxy']['metadata_key']}" \
                          unless node['gce_mysql_proxy']['metadata_key'].nil?
options[:credentials] = "-credential_file=#{node['gce_mysql_proxy']['credentials_file']}" \
                          unless node['gce_mysql_proxy']['credentials_file'].nil?

runit_service 'cloud_sql_proxy' do
  default_logger true
  options(options.merge(params))
  sv_timeout 20
end
