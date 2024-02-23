# Puppet manifest for optimizing Nginx to handle high concurrency
exec { 'optimize-nginx-config':
  command => "/bin/bash -c 'sed -i \"/^worker_processes /c\\worker_processes auto;\" /etc/nginx/nginx.conf && sed -i \"/^worker_connections /c\\worker_connections 2048;\" /etc/nginx/nginx.conf'",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  unless  => "grep -q 'worker_processes auto;' /etc/nginx/nginx.conf && grep -q 'worker_connections 2048;' /etc/nginx/nginx.conf",
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => Exec['optimize-nginx-config'],
}# Puppet manifest for optimizing Nginx to handle high concurrency
exec { 'optimize-nginx-config':
  command => "/bin/bash -c 'sed -i \"/^worker_processes /c\\worker_processes auto;\" /etc/nginx/nginx.conf && sed -i \"/^worker_connections /c\\worker_connections 2048;\" /etc/nginx/nginx.conf'",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  unless  => "grep -q 'worker_processes auto;' /etc/nginx/nginx.conf && grep -q 'worker_connections 2048;' /etc/nginx/nginx.conf",
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => Exec['optimize-nginx-config'],
}
