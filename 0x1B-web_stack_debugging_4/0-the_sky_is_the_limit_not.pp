# Puppet manifest to optimize Nginx for handling high concurrent load

exec { 'adjust-nginx-worker_processes':
  command => "sed -i '/worker_processes/c\\worker_processes auto;' /etc/nginx/nginx.conf",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  unless  => "grep -q 'worker_processes auto' /etc/nginx/nginx.conf",
}

exec { 'restart-nginx':
  command => 'nginx -s reload',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  require => Exec['adjust-nginx-worker_processes'],
}
