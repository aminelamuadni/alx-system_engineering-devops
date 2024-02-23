# Puppet manifest to comprehensively optimize Nginx for high concurrency handling
exec { 'adjust-nginx-config-for-concurrency':
  command => "/bin/bash -c 'sed -i \"/^worker_processes /c\\worker_processes auto;\" /etc/nginx/nginx.conf && sed -i \"/^worker_connections /c\\worker_connections 1024;\" /etc/nginx/nginx.conf && ulimit -n 2048 && systemctl restart nginx'",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  unless  => "grep -q 'worker_processes auto;' /etc/nginx/nginx.conf && grep -q 'worker_connections 1024;' /etc/nginx/nginx.conf",
}
