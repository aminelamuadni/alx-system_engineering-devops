# Puppet manifest to increase Nginx worker_processes and worker_connections for improved concurrency handling

# Ensure sed is available for executing commands
package { 'sed':
  ensure => present,
}

# Update worker_processes to 'auto' to allow Nginx to auto-scale based on available CPU cores
exec { 'update-worker_processes':
  command => "sed -i 's/worker_processes  1;/worker_processes  auto;/' /etc/nginx/nginx.conf",
  path    => ['/bin/', '/usr/bin/'],
  unless  => "grep -q 'worker_processes  auto;' /etc/nginx/nginx.conf",
  require => Package['sed'],
}

# Update worker_connections to a higher value to support more concurrent connections
exec { 'update-worker_connections':
  command => "sed -i 's/worker_connections  1024;/worker_connections  2048;/' /etc/nginx/nginx.conf",
  path    => ['/bin/', '/usr/bin/'],
  unless  => "grep -q 'worker_connections  2048;' /etc/nginx/nginx.conf",
  require => Package['sed'],
}

# Reload Nginx to apply configuration changes
exec { 'reload-nginx':
  command     => 'service nginx reload',
  path        => ['/bin/', '/usr/sbin/', '/usr/bin/'],
  refreshonly => true,
  subscribe   => [Exec['update-worker_processes'], Exec['update-worker_connections']],
}
