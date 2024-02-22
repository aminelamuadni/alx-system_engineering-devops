# Puppet manifest to optimize Nginx for handling high concurrent load
exec { 'fix--for-nginx':
  command => "sed -i 's/worker_processes auto;/worker_processes 8;/' /etc/nginx/nginx.conf && systemctl restart nginx",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  unless  => "grep -q 'worker_processes 8;' /etc/nginx/nginx.conf",
}
