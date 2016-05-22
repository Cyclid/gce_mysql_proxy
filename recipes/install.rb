#
# Cookbook Name:: gce_mysql_proxy
# Recipe:: install
#
# Copyright (c) 2016 Liqwyd Ltd., All Rights Reserved.

package_url = case node['kernel']['processor']
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
