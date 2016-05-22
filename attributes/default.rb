# Locations to download & install the cloud_sql_proxy binary
default['gce_mysql_proxy']['package_url'] = 'https://dl.google.com/cloudsql/cloud_sql_proxy.linux'
default['gce_mysql_proxy']['bindir'] = '/usr/local/bin'

# Create a Runit service definition for the cloud_sql_proxy process
default['gce_mysql_proxy']['service'] = 'runit'

# Default is to use the FUSE filesystem and no instances or instance_metadata
default['gce_mysql_proxy']['fuse'] = true
default['gce_mysql_proxy']['instances'] = nil
default['gce_mysql_proxy']['metadata_key'] = nil

# From the cloudsql-proxy documentation:
#
# By default, the proxy will authenticate under the default service account of
# the Compute Engine VM it is running on. Therefore, the VM must have at least
# the sqlservice.admin API scope ("https://www.googleapis.com/auth/sqlservice.admin")
# and the associated project must have the SQL Admin API enabled. The default
# service account must also have at least WRITER/EDITOR priviledges to any
# projects of target SQL instances.
#
# Specifying the -credential_file flag allows use of the proxy outside of
# Google's cloud. Simply create a new service account, download the associated
# JSON file, and set -credential_file to the path of the JSON file. You may
# also set the GOOGLE_APPLICATION_CREDENTIALS environment variable instead of
# passing this flag.
default['gce_mysql_proxy']['credentials_file'] = nil

# The location to mount the FUSE filesystem
default['gce_mysql_proxy']['mountdir'] = '/cloudsql'
