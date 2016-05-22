#
# Cookbook Name:: gce_mysql_proxy
# Recipe:: service
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

case node['gce_mysql_proxy']['service']
when 'runit'
  include_recipe 'gce_mysql_proxy::runit_service'
else
  Chef::Application.fatal! "The gce_mysql_proxy cookbook doesn't support the " \
                           "service type #{node['gce_mysql_proxy']['service']}"
end
