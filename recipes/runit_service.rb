#
# Cookbook Name:: gce_mysql_proxy
# Recipe:: runit_service
#
# Copyright (c) 2016 Liqwyd Ltd. <vanders@liqwyd.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
