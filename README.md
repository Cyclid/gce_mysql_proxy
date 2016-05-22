# gce\_mysql\_proxy

Installs and configures the MySQL Proxy for use with Google Compute Engine (GCE) instances that require access a Google Compute MySQL instance.

See https://cloud.google.com/sql/docs/sql-proxy for more information on the GCE MySQL proxy.

## Dependencies

This cookbook requires `runit` for the Runit service configuration. It only supports Runit as a service provider at the moment.

The Google Cloud SQL Proxy binary is only available for i386/i686 (32bit) and x64-64 (64bit) systems. The cookbook will raise an exception if you attempt to run it on an unsupported architecture.

This cookbook only supports Linux and assumes that FUSE is available and supported.

## Attributes

* `default['gce_mysql_proxy']['package_url']` Base URL for the `cloud_sql_proxy` executable. Defaults to `https://dl.google.com/cloudsql/cloud_sql_proxy.linux`
* `default['gce_mysql_proxy']['bindir']` Path to a directory to download the `cloud_sql_proxy` binary to. Defaults to `/usr/local/bin`
* `default['gce_mysql_proxy']['service']` Service provider to use to run `cloud_sql_proxy`. Defaults to `runit`
* `default['gce_mysql_proxy']['fuse']` Whether to use the FUSE filesystem with the MySQL proxy. Default is `true`
* `default['gce_mysql_proxy']['instances']` A list of instances that can connect to the cloud SQL proxy. Defaults to `nil`
* `default['gce_mysql_proxy']['mountdir']` Path to a directory to mount the FUSE filesystem. Defaults to `/cloudsql`
* `default['gce_mysql_proxy']['metadata_key']` Metadata key to be used by the SQL proxy to poll for instances. Defaults to `nil`
* `default['gce_mysql_proxy']['credentials_file']` Path to a Google credentials JSON file to use as a service account. Defaults to `nil`

You should refer to the Google SQL Proxy documentation for more information on the `fuse`, `instances`, `metadata_key` and `credentials_file` settings. By default this cookbook will configure a SQL proxy using FUSE and the default service account credentials for the instance, which is the most simple configuration. In general you can use *either* the FUSE filesystem *or* a list of instances. You can combine both `instances` and `instances_metadata` if you wish.

## Recipes

### default

Runs both gce\_mysql\_proxy::install and gce\_mysql\_proxy::service

### install

Downloads & installs the `cloud_sql_proxy` binary. Also creates the mountpoint for FUSE if it is enabled.

### service

Creates and configures a service to run `cloud_sql_proxy` with the correct parameters.

Currently only Runit is supported as a service provider.

## Prerequisites

In order for the GCE MySQL Proxy to work correctly you must have enabled the Cloud SQL Admin API for your project, and the instance must have the Cloud SQL API scope defined.

See https://cloud.google.com/sql/docs/admin-api/#activating_the_api for more information on the Cloud SQL Admin API, and https://cloud.google.com/sql/faq
for more information on Google Cloud SQL in general.

## License and Authors

Authors: Kristian Van Der Vliet vanders@liqwyd.com

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0