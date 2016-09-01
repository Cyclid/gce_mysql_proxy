#
# Cookbook Name:: gce_mysql_proxy
# Recipe:: install
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

package_url = case node['kernel']['machine']
              when 'x86_64'
                "#{node['gce_mysql_proxy']['package_url']}.amd64"
              when 'i386', 'i686'
                "#{node['gce_mysql_proxy']['package_url']}.386"
              else
                raise 'Google Compute MySQL Proxy is not available on this platform'
              end

remote_file "#{node['gce_mysql_proxy']['bindir']}/cloud_sql_proxy" do
  source package_url
  owner 'root'
  group 'root'
  mode 0755
end

if node['gce_mysql_proxy']['fuse'] == true
  # Create the mountpoint for the FUSE service. Note the guard; although
  # normally the directory resource can do this check itself, it gets very
  # confused when the FUSE filesystem is mounted
  directory node['gce_mysql_proxy']['mountdir'] do
    owner 'root'
    group 'root'
    not_if "mount | grep #{node['gce_mysql_proxy']['mountdir']} >/dev/null"
  end
end
