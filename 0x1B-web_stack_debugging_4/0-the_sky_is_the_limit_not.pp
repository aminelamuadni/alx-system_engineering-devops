# This Puppet manifest updates Nginx configuration to handle more concurrent connections
# by using sed to modify worker_processes and worker_connections.

# Update worker_processes
exec { 'increase-worker_processes':
  command => "sed -i 's/worker_processes  1;/worker_processes  auto;/' /etc/nginx/nginx.conf",
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
  unless  => "grep -q 'worker_processes  auto;' /etc/nginx/nginx.conf",
}

# Update worker_connections
exec { 'increase-worker_connections':
  command => "sed -i 's/worker_connections  1024;/worker_connections  2048;/' /etc/nginx/nginx.conf",
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
  unless  => "grep -q 'worker_connections  2048;' /etc/nginx/nginx.conf",
}

# Reload Nginx to apply changes
exec { 'reload-nginx':
  command     => 'nginx -s reload',
  path        => ['/bin', '/usr/bin', '/usr/sbin'],
  refreshonly => true,
  subscribe   => [Exec['increase-worker_processes'], Exec['increase-worker_connections']],
}
