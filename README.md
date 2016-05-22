# gce_mysql_proxy

Installs and configures the MySQL Proxy for use with Google Compute Engine
(GCE) instances that require access a Google Compute MySQL instance.

See https://cloud.google.com/sql/docs/sql-proxy for more information on the
GCE MySQL proxy.

## Pre-requisites

In order for the GCE MySQL Proxy to work correctly you must have enabled the
Cloud SQL Admin API for your project, and the instance must have the Cloud SQL
API scope defined.

See https://cloud.google.com/sql/docs/admin-api/#activating_the_api for more
information on the Cloud SQL Admin API, and https://cloud.google.com/sql/faq
for more information on Google Cloud SQL in general.
