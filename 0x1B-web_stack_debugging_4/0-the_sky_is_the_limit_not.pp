# Puppet manifest to adjust the open file limit for Nginx and restart the service

# Increase the file descriptor limit for Nginx
exec { 'increase-nginx-file-descriptor-limit':
  command => "/bin/sed -i 's/#*\\s*worker_rlimit_nofile.*/worker_rlimit_nofile 4096;/' /etc/nginx/nginx.conf",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  unless  => "grep -q 'worker_rlimit_nofile 4096;' /etc/nginx/nginx.conf",
}

# Restart Nginx to apply changes
exec { 'restart-nginx-service':
  command => '/etc/init.d/nginx restart',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  refreshonly => true,
  subscribe   => Exec['increase-nginx-file-descriptor-limit'],
}
